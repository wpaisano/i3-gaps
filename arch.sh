#!/usr/bin/env bash
########################################
#  AUTOR: DIOGO ZIMMERMANN GABRIEL
#  diogozgabriel@gmail.com
#  FUNÇÃO: Arch, preparação
########################################

# Verifica se o usuário está executando o script como root
if [[ $(id -u) -ne 0 ]]; then
   echo "Este script deve ser executado como root" 
   exit 1
fi

#Variaveis
tempo='sleep 1s'

loadkeys br-abnt2

#Locale
echo "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen
$tempo
#acionar o locale
locale-gen
$tempo
#colocar o tempo sob controle do ntp
timedatectl set-ntp true
$tempo
#Gerando FSTAB
genfstab -U -p /mnt >> /mnt/etc/fstab
$tempo
#Entrando como chroot
echo "Entrando no sistema instalado..."
arch-chroot /mnt
$time
#Configurando o edioma
echo "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen
$time
#Configurando Linguagem 
echo "LANG=pt_BR.UTF-8" > /etc/locale.conf
$time
#Configurando o horário
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime --force
$time
#Sincronização do Relógio com Bios
hwclock --systohc
date
$time
#configuração de rede
echo "diogo" > /etc/hostname
$time
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.0.1 diogo.localdomain diogo" >> /etc/hosts
$time
echo "Fim das primeiras configurações"
$time
clear
echo "Próximos passos:"
$time
echo "
1) passwd
2) grub-install 
3) reboot
4) Criar usuário: useradd -m -g users -G wheel -s /bin/bash seu_nome_de_usuario
5) sudoers
6) xorg xorg-server
7) xf86-video-intel
"

