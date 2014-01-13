Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3B78B6D8A0;
	Mon, 13 Jan 2014 18:46:10 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id x13so1810257ief.37
	for <multiple recipients>; Mon, 13 Jan 2014 10:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=fP/aBSOmX73lePY/t4LDkbooozRFWCuDy/I0s7Jyyeo=;
	b=0Yyug3IN5LAG6ue1ZGcVsLGOTunrijN55sdTJmlE63rO0KLCDdH8DBYMkUW491AwM3
	M1GKoyl+e+hSGYLqnzebwbuYSbXifrzwN95eKQmTqs6+hzutFxHWoulFzgmX61TpBPV4
	ilhEcVNWM2Na+Cn7q3BnFHrHh2B9ntdrsHi7C5ZGmwDIujyoe/a4zc3QswRveAjFddXk
	BUWr8uUI8V2QyMt2neMQUdSN1x2GziGKKvMekPVoS/nTOpNY1rHSunjqA4gMAEkCpeRZ
	qLkr6t/LHH8MEdf180d1DJUZzD+5XpTltuAMklNj6WxzQsKBRUaby6MM7rIDnlYMP+hk
	gW5g==
X-Received: by 10.50.176.201 with SMTP id ck9mr20316537igc.46.1389638771030;
	Mon, 13 Jan 2014 10:46:11 -0800 (PST)
Received: from happy.bec-systems.com (cable-pool6-cs-200.doycomm.com.
	[66.219.185.200])
	by mx.google.com with ESMTPSA id ft2sm19699230igb.5.2014.01.13.10.46.09
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 Jan 2014 10:46:09 -0800 (PST)
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 13 Jan 2014 10:46:09 -0800 (PST)
Message-Id: <1389638611195.32e0f4dd@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-01-05 until 2014-01-12
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
X-List-Received-Date: Mon, 13 Jan 2014 18:46:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-01-05 until 2014-01-12.  Projects included in this =
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

Alexandru DAMIAN (6):
=20=20toaster: add two-stage commit startup logic
=20=20toaster: clone Simple UI as base for Toaster GUI
=20=20toaster: update static media for Toaster GUI
=20=20toaster: Create the base page navigation structure
=20=20toaster: Build dashboard implementation
=20=20toaster: Toaster GUI, generic search, filter and order

Otavio Salvador (1):
=20=20bitbake: gitannex.py: Add Git Annex support

Richard Purdie (2):
=20=20gitannex: Add missing file from previous commit
=20=20fetch2/gitannex: Fix function arguments to match bitbake master

Robert Yang (2):
=20=20bitbake: usermanual.xml: fix a typo
=20=20bitbake/lib/bb/build.py: fix the task flags cleandirs

Zhenhua Luo (2):
=20=20bitbake: fetch2/git: add nobranch option for SRC_URI to skip SHA =
validating=20
=20=20bitbake: fetch2/git: add description for nobranch

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Anders Darander (1):
=20=20terminal.bbclass: do not export PS1

Andreas M=C3=BCller (1):
=20=20shadow: set correct entries for pseudo terminals in /etc/securetty

Chen Qi (6):
=20=20image.bbclass: add ability to set systemd default target
=20=20coreutils: upgrade to 8.22
=20=20initscripts: split the functions script into a separate package
=20=20Add missing RDEPENDS of initscripts-functions
=20=20grep: upgrade to 2.16
=20=20busybox: enable SEAMLESS_XZ by default

Chong Lu (4):
=20=20libpcre: upgrade to 8.34
=20=20quilt: enable ptest support
=20=20tcl: enable ptest support
=20=20beecrypt: add ptest support

Christopher Larson (1):
=20=20base.bbclass: pull in file-native for src.rpm

Corneliu Stoicescu (1):
=20=20oe-selftest: New tests for sstate related operations

Cristian Iorga (10):
=20=20gstreamer1.0-plugins-bad: upgrade to 1.2.2
=20=20gstreamer1.0-plugins-ugly: upgrade to 1.2.2
=20=20gstreamer1.0-libav: upgrade to 1.2.2
=20=20ofono: upgrade to 1.14
=20=20bluez5: upgrade to 5.13
=20=20gstreamer1.0: upgrade to 1.2.2
=20=20gstreamer1.0-plugins-base: upgrade to 1.2.2
=20=20gstreamer1.0-plugins-good: upgrade to 1.2.2
=20=20netbase: upgrade to 5.2
=20=20qemu: upgrade to 1.7.0

Cristiana Voicu (2):
=20=20curl: upgrade to 7.34.0
=20=20kmod: Update to Rev 16 via git

Irina Patru (2):
=20=20libtasn1: upgrade to 3.4
=20=20libsoup-2.4: upgrade to 2.45.3

Jackie Huang (2):
=20=20kconfig-frontends: fix the incorrect depends on gperf
=20=20guile: fix the depends for target recipes

Kevin Baker (1):
=20=20screen: update debian patchset to version 4.0.3-14

Koen Kooi (2):
=20=20grub: add git version
=20=20xf86-video-modesetting: update to 0.8.1

Martin Jansa (1):
=20=20python: explicitly disable bluetooth.h check

Mike Crowe (1):
=20=20valgrind: rrecommend libc6-dbg on all architectures

Ming Liu (5):
=20=20libpthread-stubs: should set ALLOW_EMPTY
=20=20sstate: Add optimizing logic for crosssdk setscene dependencies
=20=20sstate: add do_package to the noexec list in setscene_depvalid
=20=20busybox: lineedit: initialize delptr
=20=20grub: add PACKAGECONFIG for device-mapper

Paul Barker (1):
=20=20libarchive: Upgrade to v3.1.2

Petter Mab=C3=A4cker (1):
=20=20cdrtools-native: remove unused FILESPATH

Phil Blundell (5):
=20=20qemu: Remove stray .git files after unpacking
=20=20libsoup: Remove libproxy from DEPENDS
=20=20kernel-module-split: Remove extraneous call to depmod from module =
postinst
=20=20binutils: Also add autoconf-native to DEPENDS
=20=20package: Keep global pkgfiles[] up to date when snapping library =
symlinks

Philip Balister (1):
=20=20db : Include C++ binding library in Berkeley DB recipe.

Richard Purdie (1):
=20=20Revert "gconf.bbclass: remove --disable-schemas-install"

Robert Yang (10):
=20=20enchant: fix unrecognised option
=20=20gconf.bbclass: remove --disable-schemas-install
=20=20mime.bbclass: remove the --disable-update-mimedb
=20=20e2fsprogs: upgrade to 1.42.9
=20=20logrotate: upgrade to 3.8.7
=20=20logrotate: two minor fixes
=20=20automake: upgrade to 1.14
=20=20autoconf: remove path_prog_fixes.patch
=20=20autogen-native: upgrade to 5.18.2
=20=20make: upgrade to 4.0

Saul Wold (4):
=20=20security_flags: add the rest of the grub-efi related packages
=20=20gdbm: upgrade to 1.11
=20=20texinfo: Update to 5.2
=20=20util-linux: remove non PN based -dev packages

Ting Wang (1):
=20=20lib/oeqa/runtime: add test for python

Trevor Woerner (1):
=20=20libxfont: upgrade to 1.4.7

Upgrade Helper (1):
=20=20base-passwd: upgrade to 3.5.29

Yasir-Khan (1):
=20=20lighttpd: add www/{logs,var} symlinks

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrei Gherzan (3):
=20=20mariadb: Add patch to fix urecognized options
=20=20samba: Fix unrecognised with-libdir options
=20=20libass: Remove unrecognised --enable-png options

Eric BENARD (1):
=20=20inetutils: fix compile error when PATH_PROCNET_DEV is undefined

Martin Jansa (1):
=20=20ofono: Rename .bbappend to match new version from oe-core

Otavio Salvador (1):
=20=20gdal: Avoid host headers use for SQlite3

Paul Eggleton (1):
=20=20ajenti: remove

Roy Li (1):
=20=20nis: inherit pkgconfig

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Andreas M=C3=BCller (44):
=20=20angstrom-feed-configs: update oe-core's LICENSE checksum
=20=20angstrom-gpe-packagegroup-apps: update oe-core's LICENSE checksum
=20=20angstrom-gpe-packagegroup-settings: update oe-core's LICENSE checksum
=20=20angstrom-gpe-task-base: update oe-core's LICENSE checksum
=20=20angstrom-gpe-task-game: update oe-core's LICENSE checksum
=20=20angstrom-gpe-task-pim: update oe-core's LICENSE checksum
=20=20angstrom-libc-fixup-hack: update oe-core's LICENSE checksum
=20=20angstrom-ohand-packagegroup-pim: update oe-core's LICENSE checksum
=20=20angstrom-packagegroup-office: update oe-core's LICENSE checksum
=20=20angstrom-packagegroup-printing: update oe-core's LICENSE checksum
=20=20angstrom-packagegroup-sectest: update oe-core's LICENSE checksum
=20=20angstrom-uboot-scripts: update oe-core's LICENSE checksum
=20=20angstrom-version: update oe-core's LICENSE checksum
=20=20angstrom-x11-base-depends: update oe-core's LICENSE checksum
=20=20angstrom-x11vnc-xinit: update oe-core's LICENSE checksum
=20=20cpufreq-tweaks: update oe-core's LICENSE checksum
=20=20e-wm-config-angstrom: update oe-core's LICENSE checksum
=20=20epiphany-firefox-replacement: update oe-core's LICENSE checksum
=20=20task-angstrom-e: update oe-core's LICENSE checksum
=20=20upload-packages: update oe-core's LICENSE checksum
=20=20angstrom-packagegroup-boot: update oe-core's LICENSE checksum
=20=20angstrom-packagegroup-gnome: update oe-core's LICENSE checksum
=20=20angstrom-packagegroup-gnome3: update oe-core's LICENSE checksum
=20=20angstrom-zeroconf-audio: update oe-core's LICENSE checksum
=20=20packagegroup-gnome-apps: update oe-core's LICENSE checksum
=20=20packagegroup-gnome-fonts: update oe-core's LICENSE checksum
=20=20packagegroup-gnome-gstreamer: update oe-core's LICENSE checksum
=20=20packagegroup-gnome-perl: update oe-core's LICENSE checksum
=20=20packagegroup-gnome-themes: update oe-core's LICENSE checksum
=20=20packagegroup-gnome-xserver-base: update oe-core's LICENSE checksum
=20=20packagegroup-gnome: update oe-core's LICENSE checksum
=20=20packagegroup-gnome3-apps: update oe-core's LICENSE checksum
=20=20packagegroup-gnome3: update oe-core's LICENSE checksum
=20=20packagegroup-target-sdk: update oe-core's LICENSE checksum
=20=20fixmac: update oe-core's LICENSE checksum
=20=20led-config: update oe-core's LICENSE checksum
=20=20psplash-zap: update oe-core's LICENSE checksum
=20=20timestamp-service: update oe-core's LICENSE checksum
=20=20console-base-image: update oe-core's LICENSE checksum
=20=20systemd-image: update oe-core's LICENSE checksum
=20=20angstrom-gdm-autologin-hack: update oe-core's LICENSE checksum
=20=20angstrom-gdm-xfce-hack: update oe-core's LICENSE checksum
=20=20angstrom-clearlooks-theme-enable: update oe-core's LICENSE checksum
=20=20angstrom-gnome-icon-theme-enable: update oe-core's LICENSE checksum

Koen Kooi (1):
=20=20angstrom-version: fix quoting in /etc/os-release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

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

Lauren Post (1):
=20=20qt4-x11-free: Enable multi-touch support for i.MX6

Otavio Salvador (5):
=20=20cogl-1.0: Add support for Vivante GPU
=20=20clutter-1.0: Add support for Vivante GPU
=20=20linux-fslc: Add branch information
=20=20imx-test: Use the license text from common-licenses
=20=20u-boot-imx: Add branch information

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Alexandre Belloni (4):
=20=20linux-cfa: bump to 3.10.25
=20=20linux-cfa: fine tune kernel configuration
=20=20linux-cfa: split recipe to create an include file
=20=20linux-cfa: Add a recipe for 3.12

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Chunrong Guo (1):
=20=20c293pcie: add machine configure file

Ting Liu (8):
=20=20u-boot: replace tab with 4 spaces
=20=20u-boot: simplify the compile steps
=20=20u-boot: use spl version for sd and spi image
=20=20update BOOTFORMAT_CONFIG for p1/p2 rdb boards
=20=20asf: update license to dual GPL/BSD
=20=20asf: add rdepend on ipsec-tools
=20=20conf/machine/*: make KERNEL_DEVICETREE overridable
=20=20conf/machine/*: make KERNEL_DEFCONFIG overridable

Zhenhua Luo (20):
=20=20asf: update the SHA for SDK 1.5
=20=20boot-format: update the SHA for SDK 1.5
=20=20flib: update SHA for SDK 1.5
=20=20fm-ucode: update SHA for SDK 1.5
=20=20fmc: update SHA for SDK 1.5
=20=20fmlib: remove unused patch
=20=20hv-cfg: update SHA for SDK 1.5
=20=20hypervisor: update SHA for SDK 1.5
=20=20linux: update SHA for SDK 1.5
=20=20qemu: update SHA for SDK 1.5
=20=20rcw: update SHA for SDK 1.5
=20=20skmm: remove obsolete recipe
=20=20skmm-ep: add recipe
=20=20u-boot: update SHA for SDK 1.5
=20=20usdpaa: update SHA for SDK 1.5
=20=20cst: update SHA for SDK 1.5
=20=20eth-config: update SHA for SDK 1.5
=20=20fmlib: update SHA for SDK 1.5
=20=20b4/t4: use e6500rev2_defconfig as default config
=20=20p1010rdb: update machine conf to support P1010RDB-PB

Zongchun Yu (1):
=20=20u-boot:add support for fsl external toolchain

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (2):
=20=20udev-udisks-rules-overo: update oe-core LICENSE checksum
=20=20overo-writeprom: update oe-core LICENSE checksum

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Apelete Seketeli (2):
=20=20linux-jlime-ben-nanonote: update recipe to kernel 3.12
=20=20linux-qi-ben-nanonote: rename previous linux-jlime-ben-nanonote recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Andrei Gherzan (1):
=20=20meta-fri2: Use the symlink to the actual image in README

Tom Zanussi (10):
=20=20meta-chiefriver: Use the symlink to the actual image in README
=20=20meta-crownbay: Use the symlink to the actual image in README
=20=20meta-crystalforest: Use the symlink to the actual image in README
=20=20meta-emenlow: Use the symlink to the actual image in README
=20=20meta-jasperforest: Use the symlink to the actual image in README
=20=20meta-n450: Use the symlink to the actual image in README
=20=20meta-nuc: Use the symlink to the actual image in README
=20=20meta-romley: Use the symlink to the actual image in README
=20=20meta-sugarbay: Use the symlink to the actual image in README
=20=20meta-sys940x: Use the symlink to the actual image in README

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (9):
=20=20cacao-initial: add cacao-initial recipe from oe-classic
=20=20README: update build informations for java-initial
=20=20README: update maintainer email-address
=20=20cacao: add recipe for additional java vm cacao version 1.6.1
=20=20openjdk7: use icedtea6-native instead of icedtea7-native
=20=20openjdk6: fix slpashscreen and jawt for host include and search path =
contami
=20=20openjdk6: fix QA-Issue adding ASSEMBLY_EXCEPTION, THIRD_PARTY_README =
and LIC
=20=20openjdk6: adjust debug package, fixing QA issue
=20=20README: add section about bblayers.conf

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Anatolii Sakhnik (2):
=20=20webos-image: luna-sysservice=3D31
=20=20webos-image: luna-service2=3D171

Eric Blade (1):
=20=20webos-image: luna-prefs=3D7

Maksym Sditanov (1):
=20=20webos-image: db8=3D118

Sangwoo Kang (1):
=20=20webos-image: filecache=3D62

Seongho Kim (1):
=20=20webos-image: alljoyn=3Dv3.4.6

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (5):
=20=20external-xilinx-toolchain: Fix namespace change
=20=20external-xilinx-toolchain: Update license checksums
=20=20README: Add note about known issue with XSDK 2013.3 toolchain
=20=20shadow: Add workaround for build issue
=20=20libaio: Add MicroBlaze Support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Robert Yang (1):
=20=20upstream_tracking.inc: remove outdated glib-2.0 entry

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



