Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PuVpT-0008Tc-9x
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Mar 2011 21:05:56 +0100
Received: by wwe15 with SMTP id 15so5751232wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2011 12:04:28 -0800 (PST)
Received: by 10.227.157.19 with SMTP id z19mr6590971wbw.189.1299009399934;
	Tue, 01 Mar 2011 11:56:39 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id x1sm4495438wbh.14.2011.03.01.11.56.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Mar 2011 11:56:39 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1298534465-21119-1-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 1 Mar 2011 20:56:38 +0100
Message-Id: <25E4086B-447B-4010-A1EE-17753B281EA8@dominion.thruhere.net>
References: <1298534465-21119-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: [PATCH] remove non-qemu machines
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Mar 2011 20:05:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

This needs some refreshing to apply, but do you agree with the idea?

Op 24 feb 2011, om 09:01 heeft Koen Kooi het volgende geschreven:

> As per TSC decision OE-core will only have qemu machines. This leaves =
the conf/machine/include file intact
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/conf/machine/atom-pc.conf          |   44 =
-------------------------------
> meta/conf/machine/beagleboard.conf      |   37 =
--------------------------
> meta/conf/machine/mpc8315e-rdb.conf     |   20 --------------
> meta/conf/machine/routerstationpro.conf |   24 -----------------
> 4 files changed, 0 insertions(+), 125 deletions(-)
> delete mode 100644 meta/conf/machine/atom-pc.conf
> delete mode 100644 meta/conf/machine/beagleboard.conf
> delete mode 100644 meta/conf/machine/mpc8315e-rdb.conf
> delete mode 100644 meta/conf/machine/routerstationpro.conf
>=20
> diff --git a/meta/conf/machine/atom-pc.conf =
b/meta/conf/machine/atom-pc.conf
> deleted file mode 100644
> index 58c9b0d..0000000
> --- a/meta/conf/machine/atom-pc.conf
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: Atom-PC
> -
> -#@DESCRIPTION: Machine configuration for Intel Atom based PCs. =
Currently supported machines are the Asus eee901, Acer Aspire One, =
Toshiba NB305, and Intel BlackSand development board.
> -
> -TARGET_ARCH =3D "i586"
> -
> -include conf/machine/include/tune-atom.inc
> -
> -MACHINE_FEATURES =3D "kernel26 screen keyboard pci usbhost ext2 ext3 =
x86 wifi \
> -                    acpi"
> -
> -KERNEL_IMAGETYPE =3D "bzImage"
> -
> -PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto-stable"
> -#PREFERRED_PROVIDER_linux-libc-headers ?=3D =
"linux-libc-headers-yocto"
> -PREFERRED_PROVIDER_virtual/libx11 ?=3D "libx11-trim"
> -PREFERRED_PROVIDER_virtual/libgl  ?=3D "mesa-dri"
> -PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xf86-dri-lite"
> -PREFERRED_PROVIDER_virtual/xserver-xf86 ?=3D "xserver-xf86-dri-lite"
> -XSERVER ?=3D "xserver-xf86-dri-lite \
> -           xf86-input-mouse \
> -           xf86-input-keyboard \
> -           xf86-input-evdev \
> -           xf86-input-synaptics \
> -           xf86-video-intel \
> -           mesa-dri-driver-i915"
> -
> -#MACHINE_EXTRA_RDEPENDS =3D "rt2860"
> -
> -MACHINE_EXTRA_RRECOMMENDS =3D "kernel-modules eee-acpi-scripts"
> -
> -GUI_MACHINE_CLASS =3D "bigscreen"
> -
> -IMAGE_ROOTFS_SIZE_ext3 =3D "500000"
> -
> -IMAGE_FSTYPES ?=3D "ext3 cpio.gz"
> -
> -APPEND +=3D "usbcore.autosuspend=3D1"
> -
> -GLIBC_ADDONS =3D "nptl"
> -GLIBC_EXTRA_OECONF =3D "--with-tls"
> -
> -EXTRA_OECONF_append_pn-matchbox-panel-2 =3D " --with-battery=3Dacpi"
> diff --git a/meta/conf/machine/beagleboard.conf =
b/meta/conf/machine/beagleboard.conf
> deleted file mode 100644
> index 41351e7..0000000
> --- a/meta/conf/machine/beagleboard.conf
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: Beagleboard machine
> -#@DESCRIPTION: Machine configuration for the http://beagleboard.org/ =
board=20
> -TARGET_ARCH =3D "arm"
> -
> -PREFERRED_PROVIDER_virtual/xserver =3D "xserver-kdrive"
> -XSERVER =3D "xserver-kdrive-fbdev"
> -
> -# Only has DVI connector for external screen
> -GUI_MACHINE_CLASS =3D "bigscreen"
> -
> -#Ship all kernel modules till the board support has matured enough
> -MACHINE_EXTRA_RRECOMMENDS =3D " kernel-modules"
> -
> -# Allow for MMC booting (required by the NAND-less Beagleboard XM)
> -EXTRA_IMAGEDEPENDS +=3D "u-boot x-load"
> -
> -#include conf/machine/include/tune-arm1136jf-s.inc
> -include conf/machine/include/tune-cortexa8.inc
> -
> -IMAGE_FSTYPES +=3D "tar.bz2 jffs2"
> -EXTRA_IMAGECMD_jffs2 =3D "-lnp "
> -
> -# Guesswork
> -SERIAL_CONSOLE =3D "115200 ttyO2"
> -
> -PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
> -PREFERRED_PROVIDER_linux-libc-headers ?=3D "linux-libc-headers-yocto"
> -
> -KERNEL_IMAGETYPE =3D "uImage"
> -
> -UBOOT_ENTRYPOINT =3D "0x80008000"
> -UBOOT_LOADADDRESS =3D "0x80008000"
> -
> -
> -# and sdio
> -MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat alsa"
> diff --git a/meta/conf/machine/mpc8315e-rdb.conf =
b/meta/conf/machine/mpc8315e-rdb.conf
> deleted file mode 100644
> index 578751c..0000000
> --- a/meta/conf/machine/mpc8315e-rdb.conf
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -#@TYPE: Machine
> -#@DESCRIPTION: Machine configuration for running=20
> -
> -TARGET_ARCH =3D "powerpc"
> -TARGET_FPU =3D "spe"
> -
> -require conf/machine/include/tune-ppc603e.inc
> -
> -KERNEL_IMAGETYPE =3D "uImage"
> -
> -SERIAL_CONSOLE =3D "115200 ttyS0"
> -
> -MACHINE_FEATURES =3D "kernel26 keyboard pci ext2 ext3 serial"
> -
> -PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto"
> -PREFERRED_PROVIDER_linux-libc-headers ?=3D "linux-libc-headers-yocto"
> -
> -UBOOT_ENTRYPOINT =3D "0x00000000"
> -
> -KERNEL_DEVICETREE =3D "${S}/arch/powerpc/boot/dts/mpc8315erdb.dts"
> diff --git a/meta/conf/machine/routerstationpro.conf =
b/meta/conf/machine/routerstationpro.conf
> deleted file mode 100644
> index 9e5036d..0000000
> --- a/meta/conf/machine/routerstationpro.conf
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: mti_malta32_be MIPS
> -#@DESCRIPTION: mti_malta32_be
> -
> -TARGET_ARCH =3D "mips"
> -
> -require conf/machine/include/tune-mips32.inc
> -
> -MACHINE_FEATURES =3D "kernel26 screen keyboard pci usbhost ext2 ext3 =
\
> -                    serial usbgadget"
> -
> -KERNEL_IMAGETYPE =3D "vmlinux"
> -KERNEL_ALT_IMAGETYPE =3D "vmlinux.bin"
> -
> -PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto"
> -PREFERRED_PROVIDER_linux-libc-headers ?=3D "linux-libc-headers-yocto"
> -
> -SERIAL_CONSOLE =3D "115200 ttyS0"
> -
> -MACHINE_EXTRA_RRECOMMENDS =3D " kernel-modules"
> -
> -IMAGE_ROOTFS_SIZE_ext3 =3D "2000000"
> -IMAGE_FSTYPES ?=3D "jffs2 tar.bz2"
> -
> --=20
> 1.6.6.1
>=20



