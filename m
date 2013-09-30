Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (u15414263.onlinehome-server.com
	[74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id E0AE760EAA;
	Mon, 30 Sep 2013 14:55:30 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1VQeli-0001sI-Bi; Mon, 30 Sep 2013 10:48:20 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 30 Sep 2013 14:55:17 GMT
Message-Id: <1380552917431.3d1273d7@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-09-22 until 2013-09-29
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
X-List-Received-Date: Mon, 30 Sep 2013 14:55:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-09-22 until 2013-09-29.  Projects included in this =
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

Richard Purdie (1):
=20=20bitbake: Update to version 1.20.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Amy Fong (1):
=20=20distutils: Replacing path to native path only to be done to =
non-native pytho

Belen Barros Pena (1):
=20=20documentation.conf: update contents

Bruce Ashfield (2):
=20=20kern-tools: fix multi patch application without headers
=20=20linux-yocto/3.10: common-pc* config updates

Chen Qi (1):
=20=20image.bbclass: uninstall package only if it's already installed

Cristian Iorga (2):
=20=20packagegroup-self-hosted: add leafpad text editor
=20=20builder: register text files with leafpad

Darren Hart (2):
=20=20init-install-efi.sh: Fix root=3D specification
=20=20init-install-efi.sh: Remove unnecessary udev rules file to avoid =
errors

David Nystr=C3=B6m (4):
=20=20makedevs: add nativesdk to BBCLASSEXTEND
=20=20libpam: Avoid host contamination issue w. libprelude
=20=20shadow: Add nativesdk to BBCLASSEXTEND
=20=20nativesdk-packagegroup-sdk-host: Add nativesdk-shadow

Eric B=C3=A9nard (1):
=20=20busybox: update mdev.conf

Joe Slater (1):
=20=20webkit-gtk: limit ld memory requirement

Laurentiu Palcu (4):
=20=20package_deb, apt.conf: fix apt failure in do_rootfs()
=20=20relocate_sdk.py: make it work also with python 3
=20=20adt-installer: check if sudo is needed when installing target sysroot
=20=20adt-installer: add warning if MACHINE is not set in adt-installer.conf

Lukas Bulwahn (1):
=20=20boost: set up PACKAGECONFIG for boost-python library

Muhammad Shakeel (1):
=20=20systemd: fix ptest support

Paul Eggleton (5):
=20=20libav: make X11 dependencies dependent on DISTRO_FEATURES
=20=20scripts/runqemu: write temp file into correct location
=20=20grub: don't patch generated configure to fix do_patch re-execution
=20=20qt4-x11-free: disable QGtkStyle
=20=20classes/package_rpm: fix bitbake package-index for RPM

Richard Purdie (8):
=20=20autoconf: Add fix for sh verses bash issues
=20=20shadow: Move common code to shadow.inc
=20=20shadow: Turn shadow-native into a BBCLASSEXTEND
=20=20build-appliance: Update SRCREV
=20=20package.bbclass: Clear umask when using os.mkdir
=20=20runqemu: Use correct kvm CPU options for qemux86* with kvm
=20=20gcc/libtool/perl: Fix various path to sed-native problems
=20=20testimage: Exclude BB_ORIGENV variable

Robert Yang (1):
=20=20telepathy-mission-control: do_compile failed (race issue)

Ross Burton (4):
=20=20qemu: don't claim support for IrDA and PCMCIA
=20=20pseudo: use bbnote/bbwarn instead of echo
=20=20pseudo: warn twice if the 32-bit toolchain appears broken
=20=20oe-init-build-env-memres: use shell instead of Python to show the =
port numbe

Roy Li (4):
=20=20sstate.bbclass: ignore the tar failure.
=20=20perl: do not use pushd
=20=20ptest-runner: compatibile with busybox
=20=20bind: port a patch to fix a build failure

Saul Wold (5):
=20=20elfutils: remove configure bits from patch
=20=20base-passwd: add shutdown group
=20=20sysvinit: don't use useradd
=20=20texi2html: remove po.m4 patch
=20=20wget: remove po.m4 patch

Stefan Stanacar (2):
=20=20classes/testimage: add informational messages about tests and do some =
cleanu
=20=20lib/oeqa/runtime: ping: wait for 5 echo replies

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Chen Qi (1):
=20=20quagga: fix babeld_option

Hongxu Jia (1):
=20=20apache2: fix error messages when restart apache service

Ming Liu (1):
=20=20vsftpd: change default secure_chroot_dir

Paul Eggleton (1):
=20=20lowpan-tools: add git version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (5):
=20=20sourceipk: do not dereference symlinks when packaging data to avoid =
breakage
=20=20packagegroup-arago-test: re-enable ltp-ddt for am437x now
=20=20gadget-init: replace RDEPENDS with RRECOMMENDS for recommended modules
=20=20tisdk-image.bbclass: adjust to handle zImage along with uImage kernels
=20=20external-linaro-toolchain: add a way to use specific =
linux-libc-headers prov

Yan Liu (1):
=20=20busybox: Enable dd ibs obs option which turns on the conv=3D options

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

Mario Domenech Goulart (7):
=20=20imx6dlsabreauto: set up UBOOT_CONFIG with config/fs-type for the =
supported b
=20=20imx6dlsabresd: set up UBOOT_CONFIG with config/fs-type for the =
supported boo
=20=20imx6qsabreauto: set up UBOOT_CONFIG with config/fs-type for the =
supported bo
=20=20imx6qsabresd: set up UBOOT_CONFIG with config/fs-type for the =
supported boot
=20=20imx6solosabreauto: set up UBOOT_CONFIG with config/fs-type for the =
supported
=20=20imx6solosabresd: set up UBOOT_CONFIG with config/fs-type for the =
supported b
=20=20imx28evk: set up UBOOT_CONFIG with config/fs-type for the supported =
boot dev

Otavio Salvador (25):
=20=20u-boot-fslc: Update revision to aa822f4
=20=20imx-bootlets: Pass sysroot for compiler and linker
=20=20imx-bootlets: Add deploy in sstate-cache
=20=20u-boot-fslc-mxsboot: Use sysroot contents for native builds
=20=20imx-base.inc: Drop gst-fsl-plugin for vf60 SoC family
=20=20fsl-dynamic-packagearch.bbclass: Dynamically set package architecture
=20=20xf86-input-evdev: Drop PACKAGE_ARCH override
=20=20imx-base.inc: Use 'fsl-dynamic-packagearch' class
=20=20mxs-base.inc: Use 'fsl-dynamic-packagearch' class
=20=20qt4: Remove redundant PACKAGE_ARCH setting
=20=20qt5: Remove redundant PACKAGE_ARCH setting
=20=20mesa-demos: Remove redundant PACKAGE_ARCH setting
=20=20mesa: Remove redundant PACKAGE_ARCH setting
=20=20amd-gpu-mx51.inc: Remove redundant PACKAGE_ARCH setting
=20=20gpu-viv-bin-mx6q.inc: Remove redundant PACKAGE_ARCH setting
=20=20gpu-viv-g2d.inc: Remove redundant PACKAGE_ARCH setting
=20=20imx-test: Remove redundant PACKAGE_ARCH setting
=20=20imx-lib: Remove redundant PACKAGE_ARCH setting
=20=20fsl-alsa-plugins: Remove redundant PACKAGE_ARCH setting
=20=20gst-fsl-plugin.inc: Remove redundant PACKAGE_ARCH setting
=20=20mxs-base.inc: Add MACHINE_GSTREAMER_PLUGIN default setting
=20=20imx28evk: Drop inherited MACHINE_GSTREAMER_PLUGIN setting
=20=20firmware-imx: Use MACHINE_SOCARCH for PACKAGE_ARCH
=20=20libdrm: Use MACHINE_SOCARCH for PACKAGE_ARCH
=20=20xf86-video-imxfb-vivante: Use MACHINE_SOCARCH for PACKAGE_ARCH

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Eric B=C3=A9nard (1):
=20=20init-ifupdown: migrate interfaces from netbase

Otavio Salvador (2):
=20=20cfa10036.inc: Ensure we don't include gst-fsl-plugin
=20=20cfa10036.inc: Fix machine override definition

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Zhenhua Luo (2):
=20=20u-boot: fix depend race issue of u-boot-NAND.bin build
=20=20Remove overriding linux-libc-headers

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Nitin A Kamble (10):
=20=20emenlow-noemgd: linux-yocto_3.10 recipe extension
=20=20emenlow-noemgd: move BSP to the v3.10 kernel
=20=20fri2-noemgd: linux-yocto_3.10 recipe extension
=20=20fri2-noemgd: move BSP to the v3.10 kernel
=20=20sys940x-noemgd: linux-yocto_3.10 recipe extension
=20=20sys940x-noemgd: move BSP to the v3.10 kernel
=20=20chiefriver: update linux-yocto_3.10 kernel to 3.10.11
=20=20jasperforest: update linux-yocto_3.10 kernel to 3.10.11
=20=20nuc: update linux-yocto_3.10 kernel to 3.10.11
=20=20sugarbay: update linux-yocto_3.10 kernel to 3.10.11

Ong Boon Leong (1):
=20=20common: Remove obsolete QAT-related recipes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Abhijit Potnis (1):
=20=20packagegroup-placeholder-component-p1: packagegroup-xserver-ivi is =
needed on

Florin Sarbu (1):
=20=20CommonApi: Update common-api-c++ and common-api-c++-dbus     to =
version 2.1.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (1):
=20=20icedtea: update download url for icedtea6-native

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (7):
=20=20linux-ti-staging: bump to 3.12-rc1 with platform-base and PMIC merged
=20=20linux*: don't force KERNEL_IMAGETYPE from recipes, let machine config =
set it
=20=20u-boot-ti-staging: update to the latest 2013.10-rc2 and make it the =
default
=20=20linux-ti-staging: make 3.12-rc the default for supported platforms, =
drop oma
=20=20ti43x, omap-a15: switch KERNEL_IMAGETYPE to zImage by default
=20=20linux-ti-staging: fix missing kernel image in /boot
=20=20Revert "linux: Inherit new machine_kernel_pr class"

Franklin S. Cooper Jr (1):
=20=20linux: Inherit new machine_kernel_pr class

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Ed Chejlava (2):
=20=20upstart: Modify initctl's set-env to process a list
=20=20upstart: Add udev dependency and drop unpackaged icons

Hongjeon Ha (1):
=20=20webos-image: pmlogdaemon=3D111 pmloglib=3D40

Iyad Qumei (1):
=20=20webos-image: Update for change in format of SetEnvInit.conf

Mark Bessey (1):
=20=20webos-image: mojoservicelauncher=3D78

Martin Jansa (2):
=20=20prepare-submission.sh: Add simple script for creating webos tags
=20=20upstart: Fix update-alternatives setup

Nikolay Orliuk (1):
=20=20qmake5.bbclass: Add WEBOS_INSTALL_PREFIX

Roger Stringer (7):
=20=20webos-image: luna-sysservice=3D14
=20=20webos-image: activitymanager=3D114
=20=20webos-image: configurator=3D54,v3.0.0
=20=20webos-image: db8=3D85
=20=20webos-image: db8=3D86
=20=20meta-webos: db8=3D87,v3.1.0
=20=20webos-image: activitymanager=3D115,v3.0.0

wonkyo.seo (1):
=20=20libnsbmp: Fix build

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (1):
=20=20README: Added details of Known Issues with MicroBlaze

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Richard Purdie (1):
=20=20poky: Update to 1.5 release version

Tom Zanussi (1):
=20=20yocto-bsp: add 3.10/remove 3.8 kernel from templates

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



