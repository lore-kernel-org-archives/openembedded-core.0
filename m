Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (u15414263.onlinehome-server.com
	[74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id C724E6AFD4;
	Mon,  8 Jul 2013 15:42:34 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1UwDVr-0008J1-La; Mon, 08 Jul 2013 11:38:12 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 08 Jul 2013 15:42:17 GMT
Message-Id: <1373298137671.ff0ccee4@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-06-30 until 2013-07-07
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
X-List-Received-Date: Mon, 08 Jul 2013 15:42:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-06-30 until 2013-07-07.  Projects included in this =
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

Cristiana Voicu (1):
=20=20hob: save button from settings called a nonexisting method

Valentin Popa (1):
=20=20HOB:Proper handle of SIGINT

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Chen Qi (4):
=20=20udev-cache: take a read-only rootfs into consideration
=20=20base-files: remove the unnecessary /media/xxx directories
=20=20busybox: fix the on-target upgrade problem
=20=20busybox: upgrade to stable 1.21.1

Elizabeth Flanagan (1):
=20=20layer.conf: Bumping LAYERVERSION_core

Emilia Ciobanu (1):
=20=20mkelfimage: switch to git repository

Hongxu Jia (1):
=20=20qt-mobility: fix build in the absence of xvideo

Ionut Radu (12):
=20=20libxext: Update from 1.3.1 to 1.3.2
=20=20libxcursor: Update from 1.1.13 to 1.1.14
=20=20libxinerama: Updated from 1.1.2 to 1.1.3
=20=20libxau: Updated from 1.0.7 to 1.0.8
=20=20libxres: Updated from 1.0.6 to 1.0.7
=20=20libxv: Updated from 1.0.7 to 1.0.8
=20=20libxtst: Updated from 1.2.1 to 1.2.2
=20=20libxxf86vm: Updated from 1.1.2 to 1.1.3
=20=20libxfixes: Updated from 5.0 to 5.0.1
=20=20libxcb: Updated from 1.9 to 1.9.1
=20=20apt: Updated from 0.9.8.1 to 0.9.8.2
=20=20gpgme: Updated from 1.4.1 to 1.4.2

Jackie Huang (2):
=20=20init-ifupdown: set kernel parameters firstly
=20=20udev-extraconf: blacklist /dev/dm-*

Joe MacDonald (1):
=20=20sstate.bbclass: Add an extra check for sstate_mirrors

Jonathan Liu (3):
=20=20qt4e.bbclass: export OE_QMAKE_QT_CONFIG
=20=20xf86-video-modesetting: upgrade to 0.8.0
=20=20qt4: upgrade to 4.8.5

Jukka Rissanen (1):
=20=20connman: Set the VPN client program paths

Khem Raj (8):
=20=20uclibc: Update to latest git/master version
=20=20uclibc: Remove 0.9.33 recipes
=20=20bison: Delete unused patch
=20=20binutils: Backport emulation template fixes
=20=20eglibc: Add 2.18 recipes
=20=20eglibc: Drop libc-libm-big
=20=20distro/conf: Drop libc-libm-big
=20=20tcmode-default: Pin eglibc to 2.18

Marc Ferland (1):
=20=20openssh: fix initscript restart command

Martin Jansa (4):
=20=20mesa: Improve gallium PACKAGECONFIG options
=20=20mesa: fix pipe_loader_sw build without libx11
=20=20mesa: bump SRCREV in git recipe, refresh patches
=20=20mesa: remove drirc file

Mihai Prica (1):
=20=20insane.bbclass: Added QA warning for shipping /usr/share/info/dir

Otavio Salvador (4):
=20=20lttng-tools: Update to 2.2.0 based release
=20=20lttng-modules: Update to 2.2.0 based release
=20=20lttng-ust: Update to 2.2.0 based release
=20=20babeltrace: Update to 1.1.1 based release

Paul Eggleton (16):
=20=20python-async: add recipe
=20=20python-smmap: add recipe
=20=20python-gitdb: add recipe
=20=20python-git: add recipe
=20=20buildtools-tarball: add python-git
=20=20packagegroup-self-hosted: add python-git
=20=20lib/oe/lsb.py: fall back to /etc/os-release for host distro ID
=20=20linux-firmware: be consistent with license package naming
=20=20linux-firmware: fix ralink license file name
=20=20python-native: add python-codecs-native to RPROVIDES
=20=20lttng-modules: allow building without tracepoints enabled in kernel
=20=20rpm: add wrapper for debugedit executable
=20=20classes/package: print command output when commands fail
=20=20ghostscript: fix patch failure with some versions of patch
=20=20classes/insane: fix libdir check regexes
=20=20qt4: disable qmeegographicssystemhelper

Richard Purdie (1):
=20=20qt4: Take PV increase opportunity to drop PR

Riku Voipio (1):
=20=20webkit-gtk: add aarch64 support

Ross Burton (2):
=20=20clutter: fix out-of-tree builds
=20=20seperatebuilddir: cogl and clutter build out of tree

Roy.Li (1):
=20=20sysstat: backport a patch to fix a parallel building error

Saul Wold (14):
=20=20packagegroup-core-basic: remove hardcode udev
=20=20udev: Add RRECOMMENDS for udev-cache to enable the cache
=20=20local.conf.sample.extended: Add example line for enabling security =
flags
=20=20security_flags: Add the compiler and linker flags that enhance =
security
=20=20mc: Don't remove libdir and split helpers into packages
=20=20packagegroups: Update for split mc packages
=20=20packagegroup-core-basic: Only build libpam if it's enabled
=20=20util-linux: disable runuser by default since it depends on PAM
=20=20help2man: Update to 1.43.3
=20=20boost: Update to 1.54
=20=20dtc: Update to  1.4.0 Git Tag
=20=20swabber: Update to latest head
=20=20remake: Update to latest 3.82_dbg-0.9 Tag
=20=20resolvconf: Update to 1.72

Tyler Hall (2):
=20=20terminal: Run command using a wrapper script
=20=20TmuxRunning: handle multi-word commands

victor (1):
=20=20apr_cv_mutex_recursive=3Dyes added to apr_1.4.6.bb to make rosnodes =
work

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Martin Jansa (1):
=20=20vsftpd: add missing dependency on openssl

Otavio Salvador (1):
=20=20busybox: Follow OE-Core update to 1.12.1 version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (1):
=20=20arago-test: define system test packagegroup and image

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

Daiane Angolini (2):
=20=20linux-imx (2.6.35.3): Add SSI3 address and AUDMUX pin fixes
=20=20linux-imx (3.0.35): Add fix pll4 set_rate callback

Otavio Salvador (5):
=20=20imx-test.inc: Whitelist package QA warning/errors
=20=20libfslparser: Whitelist package QA warning/errors
=20=20imx28evk: Remove duplicated assignment of KERNEL_IMAGETYPE
=20=20perf: Disable FPU tune for i.MX5 SoCs to workaround GCC ICE
=20=20qt4: Follow OE-Core upgrade to 4.8.5 version

Philip Craig (1):
=20=20gpu-viv-bin-mx6q.inc: fix libEGL and libGLESv2 installation

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Marek Vasut (2):
=20=20linux-denx: Add linux-denx repository
=20=20m53evk: Add DENX M53EVK support

Otavio Salvador (2):
=20=20imx6qsabrelite: Remove specific setup and turn it as an alias to =
Nitrogen6X
=20=20linux-wandboard: Update to 3.0.35-4.0.0 based kernel

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Chunrong Guo (1):
=20=20Remove 85xx NPI/Boards, P102x combo board and P1023RDS board

Ting Liu (7):
=20=20p1020rdb: update machine conf to use new -pd revision
=20=20u-boot: not use =3D=3D to compatible with dash
=20=20usdpaa: set MACHINE_ARCH specific, same with dependency fmc
=20=20add custom-licenses dir for freescale EULA
=20=20fix Freescale EULA warning
=20=20testfloat: mark as fsl e500v2 machine only
=20=20busybox: drop bbappend (only set PRINC) as oe-core upgrade

Zhenhua Luo (12):
=20=20linux-qoriq-sdk(-headers): upgrade to the version of sdk-1.4
=20=20u-boot: upgrade to the version of sdk1.4
=20=20boot-format: update SHA for sdk-1.4
=20=20eth-config: upgrade to sha of sdk-1.4
=20=20hv-cfg: upgrade to the SHA of sdk-1.4
=20=20fmlib: upgrade to the SHA of sdk-1.4
=20=20fmc: upgrade to the SHA of sdk-1.4
=20=20fm-ucode: upgrade to the SHA of sdk-1.4
=20=20hypervisor: upgrade to the SHA of sdk-1.4 and add hypertrk submodule
=20=20rcw: upgrade to the version of sdk-1.4
=20=20usdpaa: upgrade to the version of sdk-1.4
=20=20libedit: pull in from meta-oe as it is needed by usdpaa

Zongchun Yu (1):
=20=20flib:Fix flib not found in the base feeds error

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

Thibault GUITTET (1):
=20=20lms7: handle different host setups

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Holger Behrens (2):
=20=20common-api-c++: added CommonAPI runtime
=20=20common-api-c++-dbus: added CommonAPI D-Bus binding

Noor (2):
=20=20poky-ivi-systemd.conf: Remove sysvinit from DISTRO_FEATURES.
=20=20dbus: Stop removing sysv specific things.

Sergey Matyukevich (1):
=20=20connman: do not delete init scripts in bbappend

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

Martin Jansa (2):
=20=20qtwayland: Add xproto dependency together with libxkbcommon
=20=20qmake5: Add trailing space in DEPENDS_prepend instead of =
QT5TOOLSDEPENDS

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

Franklin S. Cooper Jr (6):
=20=20linux-am335x-psp: Update to PSP release 04.06.00.11
=20=20linux-am335x-psp: Enable USB with DMA by default
=20=20linux-am335x-psp: Add patch to enable SR on PG 2.x boards.
=20=20am33x-cm3: Add support for PG 2.1 silicon.
=20=20linux-am335x-psp: Add Beaglebone Black support
=20=20linux-am335x-psp: Add 1 GHZ Support for BBB

Siddharth Heroor (3):
=20=20libdrm: Add GLSDK specific staging tree for omap-a15
=20=20linux-ti-glsdk: update to latest fixes
=20=20u-boot-glsdk: add GLSDK Staging tree

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Martin Jansa (2):
=20=20boost: Limit PARALLEL_MAKE to -j 64
=20=20gzip: Remove unneeded bbappend

Mikko Levonmaa (1):
=20=20packagegroup-webos-extended: Make keyboard-efigs configurable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Sipke Vriend (1):
=20=20Add linux-yocto 3.8 targets     Add linux-yocto-tiny and linux-yocto =
standar

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Chen Qi (1):
=20=20busybox.bbappend: upgrade to 1.21.1

Khem Raj (1):
=20=20distro/conf: Drop libc-libm-big

Paul Eggleton (1):
=20=20poky.conf: move libdir QA check to WARN_QA

Saul Wold (2):
=20=20local.conf.sample.extended: Add example line for enabling security =
flags
=20=20Upstream_tracking: mark package as not upgradable due to PRS issues

Tom Zanussi (2):
=20=20yocto-bsp: filter out 'layer' from arch list
=20=20yocto-kernel: enforce exact match for BBLAYERS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



