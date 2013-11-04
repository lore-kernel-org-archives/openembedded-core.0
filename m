Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (u15414263.onlinehome-server.com
	[74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id 63EA16D687;
	Mon,  4 Nov 2013 20:49:31 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1VdQxF-0000BA-Ij; Mon, 04 Nov 2013 15:41:06 -0500
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 04 Nov 2013 20:49:10 GMT
Message-Id: <1383598150443.d3bc50b7@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-10-27 until 2013-11-03
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Nov 2013 20:49:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-10-27 until 2013-11-03.  Projects included in this =
report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
meta-arago: git://arago-project.org/git/meta-arago.git
meta-beagleboard: git://github.com/beagleboard/meta-beagleboard.git
meta-browser: git://github.com/OSSystems/meta-browser.git
meta-bug: git://github.com/buglabs/meta-bug.git
meta-chicken: git://github.com/OSSystems/meta-chicken
meta-efikamx: git://github.com/kraj/meta-efikamx.git
meta-ettus: http://github.com/koenkooi/meta-ettus.git
meta-fsl-arm: git://git.yoctoproject.org/meta-fsl-arm
meta-fsl-arm-extra: git://github.com/Freescale/meta-fsl-arm-extra.git
meta-fsl-ppc: git://git.yoctoproject.org/meta-fsl-ppc
meta-guacamayo: git://github.com/Guacamayo/meta-guacamayo.git
meta-gumstix: git://github.com/gumstix/meta-gumstix.git
meta-gumstix-community: =
git://gitorious.org/schnitzeltony-oe-meta/meta-gumstix-community.git
meta-handheld: git://git.openembedded.org/meta-handheld
meta-igep: http://github.com/ebutera/meta-igep.git
meta-intel: git://git.yoctoproject.org/meta-intel
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-java: git://github.com/woglinde/meta-java
meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
meta-micro: git://git.openembedded.org/meta-micro
meta-mono: git://git.yoctoproject.org/meta-mono.git
meta-netbookpro: git://github.com/tworaz/meta-netbookpro
meta-nslu2: git://github.com/kraj/meta-nslu2
meta-opie: git://git.openembedded.org/meta-opie
meta-qt3: git://git.yoctoproject.org/meta-qt3
meta-qt5: git://github.com/meta-qt5/meta-qt5.git
meta-slugos: git://github.com/kraj/meta-slugos
meta-systemd: git://git.yoctoproject.org/meta-systemd
meta-raspberrypi: git://github.com/djwillis/meta-raspberrypi.git
meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
meta-ti: git://git.yoctoproject.org/meta-ti
meta-webos: git://github.com/openwebos/meta-webos.git
meta-xilinx: git://git.yoctoproject.org/meta-xilinx
meta-yocto: git://git.yoctoproject.org/meta-yocto
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Alexandru DAMIAN (7):
=20=20toaster: fixes for null values from events
=20=20cooker: add data to the dependency tree dump
=20=20build, toaster: record proper task type
=20=20cooker: do not recreate recipecache in buildfile mode
=20=20toaster: fix timezone settings
=20=20toaster: server shutdown on terminal exit
=20=20toaster: enable required classes in the toaster startup script

Cristiana Voicu (3):
=20=20hob: populate error_msg when hob receives a CommandFailed event
=20=20hob: do not display the "Package list may be incomplete!" dialog
=20=20toaster: add variable description for prefixed/suffixed variables

Nicolas Dechesne (1):
=20=20fetch2/svn.py: use log instead of info to retrieve revision

Volker Vogelhuber (1):
=20=20fetch/hg: Improve user/password handling

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andreas M=C3=BCller (1):
=20=20systemd-compat-units: run-postinsts fix script link

Andreas Oberritter (1):
=20=20cogl-1.0: depend on virtual/mesa

Chen Qi (3):
=20=20jpeg: enable postinst to run at rootfs time successfully
=20=20groff: fix pkg_postinst and remove unneeded do_install_prepend
=20=20sgml-common: make postinst run successfully at rootfs time

Cristian Iorga (7):
=20=20bluez5: upgrade to 5.10
=20=20glib-2.0: upgrade to 2.38.1
=20=20connman: upgrade to 1.19
=20=20libuser: upgrade to 0.60
=20=20iproute2: upgrade to 3.11.0
=20=20telepathy-mission-control: upgrade to 5.16.0
=20=20telepathy-glib: upgrade to 0.23.0

Cristiana Voicu (5):
=20=20grep: upgrade to 2.15
=20=20at: upgrade to 3.1.14
=20=20curl: upgrade to 7.33.0
=20=20sudo: upgrade to 1.8.8
=20=20rxvt-unicode: upgrade to 9.19

Darren Hart (1):
=20=20scripts: Add ksize.py and dirsize.py

Gary Thomas (1):
=20=20core-image-basic.bb: Allow user extensions

Hongxu Jia (2):
=20=20debugedit: fix segment fault while file's bss offset have a large =
number
=20=20coreutils: support command arch

Jackie Huang (1):
=20=20busybox: fix sed auto insert newline testcase

Jacob Kroon (2):
=20=20update-rc.d.bbclass: Fix host/target test in postinst
=20=20update-rc.d.bbclass: Cleanup package scripts

Jason Wessel (2):
=20=20syslinux.bbclass: Fix default serial port string
=20=20grub-efi.bbclass: Fix startup.nsh to work on more EFI revs

Joao Henrique Ferreira de Freitas (1):
=20=20grub-efi.bbclass: Fixes GRUB_IMAGE when using boot-directdisk class

Joe Slater (2):
=20=20tzcode & tzdata: update to 2013h
=20=20vala.bbclass: add dependency on vala

Jonathan Liu (1):
=20=20qt4: add upstream QTBUG-34218/QTBUG-34234 misaligned selection patch

Khem Raj (2):
=20=20pulseaudio: Fix build break on armeb
=20=20elfutils-native: Update the patch to include the missing pieces =
needed for t

Konrad Scherer (2):
=20=20pigz: Add pigz to buildtools tarball
=20=20pixbufcache.bbclass: gdk-pixbuf-query-loaders depends on libz

Laurentiu Palcu (2):
=20=20nativesdk-qt4-tools: create qt.conf file
=20=20meta-toolchain-qt: put QT_CONF_PATH in environment script

Lu Chong (1):
=20=20dbus: no messages of status command print

Ming Liu (1):
=20=20strace: remove +=3D assignment of a OVERRIDES variable

Paul Barrette (1):
=20=20lsb: add begin function to lsb_log_message

Paul Eggleton (12):
=20=20scripts/oe-pkgdata-util: remove remnants of former pkgdata structure
=20=20scripts/oe-pkgdata-util: improve help text and command line parsing
=20=20scripts/oe-pkgdata-util: check path arguments to ensure they exist
=20=20scripts/oe-pkgdata-util: add ability to search for a target path
=20=20scripts/oe-pkgdata-util: add ability to look up runtime package names
=20=20scripts/oe-pkgdata-util: add ability to find a recipe from a target =
package
=20=20cmake: upgrade to 2.8.12
=20=20ethtool: upgrade to 3.11
=20=20openssh: upgrade to 6.3p1
=20=20scripts/oe-pkgdata-util: fix global name 'debug' is not defined
=20=20classes/ptest: fix quoting
=20=20classes/ptest: do not set EXCLUDE_FROM_WORLD

Qiang Chen (3):
=20=20openssl: create package for openssl configuration file
=20=20nfs-utils: modify nfsserver init script indent
=20=20irda-utils: restart irda daemon correctly

Richard Purdie (4):
=20=20rpm: Fix FILES_${PN}
=20=20recipes: Remove PR =3D r0 from all recipes
=20=20cross-canadian: Handle powerpc linux verses linux-gnuspe
=20=20cross-canadian: Improve comment

Ross Burton (5):
=20=20xorg-lib-common: set UNKNOWN_CONFIGURE_WHITELIST
=20=20gnome-common: inhert gnomebase not gnome
=20=20libgcrypt: remove --without-pth
=20=20xorg-proto-common: set UNKNOWN_CONFIGURE_WHITELIST
=20=20gnome: set UNKNOWN_CONFIGURE_WHITELIST

Roy Li (3):
=20=20pseudo: fix library path in FILES_${PN}
=20=20opkg: putting the service files into PN
=20=20libcap: fix CAP_LAST_CAP

Roy.Li (1):
=20=20lttng-tools: make ptest able to work on target

Saul Wold (4):
=20=20cups: upgrade to 1.7.0
=20=20gnupg: upgrade to 2.0.22
=20=20attr: upgrade to 2.4.47
=20=20udev: fix typo in local.rules

Seth Bollinger (1):
=20=20ncurses-terminfo: Remove bashism from basic terminfo installation

S=C3=B8ren Holm (1):
=20=20e2fsprogs: Escape filenames in populate-extfs.sh

Tom Rini (1):
=20=20udev: Update touchscreen rule for ID_INPUT_TOUCHSCREEN

Tom Zanussi (1):
=20=20wic: Remove selinux_check()

Valentin Popa (6):
=20=20libxv: upgrade to 1.0.10
=20=20libsoup: upgrade to 2.44.1
=20=20pcmanfm: upgraded to 1.1.2
=20=20shared-mime-info: upgrade to 1.2
=20=20libx11: upgrade to 1.6.2
=20=20Mesa: upgrade to 9.2.2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Chen Qi (5):
=20=20cyrus-sasl: remove the unnecessary pkg_postinst
=20=20radvd: fix pkg_postinst
=20=20quagga: fix pkg_postinst
=20=20ndisc6: chmod in do_install and remove unnecessary pkg_postinst
=20=20bridge-utils: inherit update-alternatives to avoid duplicate code

Christoph Settgast (1):
=20=20maliit: Follow move to github

Joe MacDonald (1):
=20=20tftpd-hpa: update default tftpboot location

Mark Asselstine (1):
=20=20cyrus-sasl: ensure size_t is defined for use by sasl.h

Marko Lindqvist (1):
=20=20lua5.1: apply lua.org patches for lua-5.1.5

Martin Jansa (8):
=20=20dropbear: Rename bbappend to match new version from oe-core
=20=20llvm3.2: drop this version
=20=20bigbuckbunny: Don't use whole avi in LIC_FILES_CHKSUM and add version
=20=20openssh: Rename .bbappend to match new version from oe-core
=20=20at: Rename bbappend to match new version from oe-core
=20=20connman: Rename bbappend to match new version from oe-core
=20=20cifs-utils: Add PACKAGECONFIG for cifscreds, cifsupcall
=20=20recipes: Remove PR =3D r0 from all recipes

Nick Glynn (1):
=20=20sthttpd: add systemd service

Robert Yang (1):
=20=20cherokee: fix the installed but not shipped issue

Roy Li (2):
=20=20apache2: add config_var.mk and config.nice into SSTATE_SCAN_FILES
=20=20lowpan-tools: configure python files installation path

Wenzong Fan (1):
=20=20mariadb-native: depends on zlib-native

Xufeng Zhang (1):
=20=20quagga/ripd: Fix two bugs after received SIGHUP signal

Zhenhua Luo (1):
=20=20libedit: fix multilib build issue

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20connman: match bbappend with OE-Core

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (1):
=20=20qtwebkit: adjust one of the patches to apply clean on some hosts

Franklin S. Cooper Jr (1):
=20=20ti-tisdk-setup: Update create sd-card script for 3.12 kernel

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Andy Voltz (1):
=20=20gpu-viv-bin-mx6q: Cleanup wayland install, disable wayland & X11 for =
now

Christopher Larson (1):
=20=20fsl-eula-unpack: add FSL_EULA_FILE to vardepsexclude

Daiane Angolini (2):
=20=20alsa-state: Fix mx6 buffer time
=20=20gst-fsl-plugin: Add dependency on imx-vpu

Gary Thomas (2):
=20=20image_types_fsl.bbclass: Support i.MX25 platforms
=20=20machine/*: Allow kernel provider override

Lauren Post (6):
=20=20gpu-viv-bin-mx6q: Fix wayland-egl.pc version to 1.0
=20=20gpu-viv-bin-mx6q: Upgrade to 3.10.9-1.0.0_alpha
=20=20gpu-viv-g2d: Upgrade to 3.10.9-1.0.0_alpha
=20=20imx-lib: Upgrade to 3.10.9-1.0.0
=20=20imx-test: Upgrade to 3.10.9-1.0.0
=20=20imx-vpu: Add 3.10.9-1.0.0 recipe

Lucas Dutra Nunes (1):
=20=20linux-fslc: kernel build now needs GNU bc to work

Mahesh Mahadevan (2):
=20=20linux-imx (2.6.35.3): Update maintain branch to commit 903363ed
=20=20linux-imx (2.6.35.3): Sync i.MX5 defconfig with the one in the kernel

Otavio Salvador (5):
=20=20linux-fslc: Update to 3.12-rc7 based kernel
=20=20u-boot-fslc: Update to revision commit 38322587
=20=20linux-imx (3.0.35): epdc: Rename mxcfb_epdc_kernel.h to mxc_epdc.h
=20=20u-boot-fslc: Update to revision 079e2148
=20=20mesa: Follow OE-Core update to 9.2.2 release

Prabhu Sundararaj (1):
=20=20gpu-viv-bin-mx6q: Add pc file for openvg

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Alexandre Belloni (1):
=20=20linux-cfa: bump to 3.10.17

Gary Thomas (2):
=20=20nitrogen6x.conf: Allow kernel provider override
=20=20machine/*: Allow kernel provider override

Lucas Dutra Nunes (1):
=20=20imx233-olinuxino-nano: add machine definition

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (1):
=20=20linux.inc: remove unneeded unifdef.c seding

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (4):
=20=20meta-handheld: adjust EXTRA_IMAGECMD_jffs2 after oe-core changes
=20=20machine: add more JFFS2_ERASEBLOCK definitions
=20=20zaurus.inc: set default IMAGE_CMD_sum.jffs2 for devices with NAND
=20=20collie.conf: provide a custom EXTRA_IMAGECMD_sum.jffs2

Paul Eggleton (1):
=20=20udev: remove bbappend

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Ong Boon Leong (5):
=20=20meta-haswell-wc : new BSP layer for Intel Haswell Mobile Platform
=20=20meta-haswell-wc: provide machine configuration for haswell-wc
=20=20meta-haswell-wc: provide a formfactor for the haswell-wc BSP
=20=20meta-haswell-wc: add kernel recipe for haswell-wc BSP
=20=20meta-isg: Update MAINTAINERS file for haswell-wc

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Jonathan Liu (1):
=20=20qtbase: add upstream QTBUG-34218/QTBUG-34234 misaligned selection =
patch

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (4):
=20=20shr: use mesa as virtual/libgl provider
=20=20atd-over-fso: Reload dbus only when update-rc.d is used and dbus-1 =
exists
=20=20recipes: Remove PR =3D r0 from all recipes

Simon Busch (5):
=20=20meta-android: initramfs-android-image: remove workaround for circular =
depend
=20=20meta-android: initramfs-boot-android: remove unecessary copy action
=20=20meta-samsung: drop unneeded alsa-ucm-conf-tuna
=20=20meta-android: android-system: disable media service
=20=20meta-samsung: linux-samsung-tuna: enable support for fs notifications

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (3):
=20=20am33x-cm3: update PM firmware for AM335x to 05.00.00.00
=20=20linux-ti-staging: update to 3.12-rc7 and latest merges of feature =
trees
=20=20am33x-cm3: update to specify correct tag and branch

Mrinmayee Hingolikar (1):
=20=20linux-ti-glsdk: Update to latest fixes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Alekseyev Oleksandr (3):
=20=20webos-image: Invent WEBOS_DISABLE_LS2_SECURITY setting
=20=20webos-image: luna-service2=3D160
=20=20webos-image: Enable tracepoints for luna-service2

Alexandr Smoktal (2):
=20=20webos-image: luna-service2=3D158
=20=20webos-image: luna-sysservice=3D17

Ed Chejlava (1):
=20=20webos-image: upstart=3Dr5 (don't install unnecessary files)

Gayathri Srinivasan (1):
=20=20webos-image: configurator=3D55

Herb Kuta (1):
=20=20webos_version: Add a bbclass for parsing WEBOS_VERSION

Hongjeon Ha (1):
=20=20webos-image: pmloglib=3D42 db8=3D92

Mykola Kryvonos (1):
=20=20webos-image: libpbnjson=3D23

Susan Montooth (2):
=20=20Revert "webos-image: Enable tracepoints for luna-service2"
=20=20Revert "webos-image: luna-service2=3D160"

jaesung5.lee (1):
=20=20mtp: Add recipes for libmtp=3Dv1.1.6 mtpfs=3Dv1.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



