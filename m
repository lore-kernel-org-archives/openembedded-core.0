Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 34FB96FEFA;
	Mon, 16 Jun 2014 15:53:21 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id y20so5215449ier.18
	for <multiple recipients>; Mon, 16 Jun 2014 08:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=rlX3p//XbsYyPcgARFj9sI+ss82qWFNh5xQa1DXA7ek=;
	b=G6DLFXzQVclKW077195gf+tatwOyJ1hrGWxt+tSqQqgZ4Ptry7T8djsXnUdz97SH+2
	WD7nV1D74GznHt+fA6+n+oTGy/FG9mWXqWhrgbLP2Rf7sToyq1/R+xESbL0nyPSp1pBG
	+dlq3LhSuqAWhS6vXS0K3H825hCXAcSQbvK0nzIRkXgJ3kj7zCTUQYP1CYBVP2sLMcMW
	vojefi4ToiDsbPwZyUnqgy1R/X6JtGX4ZkTJ12Bd8wDeUiJnD7AYd6EglYcxBI7vMoNT
	Ax1lZl7EnH5Qs0vuyt7GmIzzHjwqaPtHSL47bd7VHbcPD58JZSJrX3N0TRdMgWy+W5oN
	68HA==
X-Received: by 10.50.164.130 with SMTP id yq2mr26249857igb.10.1402934002409;
	Mon, 16 Jun 2014 08:53:22 -0700 (PDT)
Received: from [127.0.0.1] (cable-pool6-cs-200.doycomm.com. [66.219.185.200])
	by mx.google.com with ESMTPSA id
	t16sm21579815igr.14.2014.06.16.08.53.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jun 2014 08:53:21 -0700 (PDT)
Date: Mon, 16 Jun 2014 08:53:21 -0700 (PDT)
X-Google-Original-Date: Mon, 16 Jun 2014 15:53:20 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1402934000025.2c1e4cef@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-06-08 until 2014-06-15
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
X-List-Received-Date: Mon, 16 Jun 2014 15:53:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-06-08 until 2014-06-15.  Projects included in this =
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

Alexandru DAMIAN (8):
=20=20toaster: comment out bldcontrol migration command
=20=20toaster: add Project class models to orm
=20=20toaster: initial bldcontrol application
=20=20toaster: create models for bldcontrol and enable it
=20=20toaster: add function to get the database url
=20=20xmlrpc: add support for token reusing
=20=20toastergui: fix built ETA calculation
=20=20toaster: build control functionality

Robert Yang (1):
=20=20cache.py: print debug info when EXCLUDE_FROM_WORLD

Ross Burton (2):
=20=20bb/tests/data.py: add tests for contains() and contains_any()
=20=20bb/utils: fix contains_any()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andre McCurdy (1):
=20=20curl: control ipv6 support based on DISTRO feature

Armin Kuster (1):
=20=20v4 cups: Shouldn't link against libgcrypt without using gcrypt =
functions

Chen Qi (3):
=20=20gawk: fix libexec of the old 3.1.5 version
=20=20rootfs.py: change the logic in _uninstall_unneeded
=20=20busybox: handle syslog related files properly

Chong Lu (6):
=20=20oprofile: Add PTEST regression testing to oprofile
=20=20nfs-utils: unset CFLAGS for testlk build
=20=20sed: enable ptest support
=20=20nfs-utils: Do not pass CFLAGS to gcc while building
=20=20oprofile: Determine the root home directory dynamically
=20=20kexec-tools: Refine kdump device_tree sort

Christopher Larson (2):
=20=20git: revert to wrapper based relocation
=20=20git: don't hardcode the full path to perl

Corneliu Stoicescu (8):
=20=20oeqa/utils/commands.py: add support for postconfig option
=20=20targetcontrol.py: make possible dynamical determination of rootfs type
=20=20masterimage.py: enable dynamical determination of rootfs type
=20=20core-image-testmaster.bb: add bzip2 to image
=20=20targetcontrol.py: Add a classmethod to get extra files needed by the =
target=20
=20=20oeqa/controllers/testtargetloader.py: add 'import os'
=20=20controllers/masterimage.py: Make testimage kernel naming pattern =
universal
=20=20scripts/test-remote-image: Add script for running runtime tests on =
remotely=20

Drew Moseley (1):
=20=20bluez5: Force obex.service in /usr/lib

Enrico Scholz (3):
=20=20git: fixed typo in 'libexecdir' varname
=20=20dbus: disable usage of dbus-glib explicitly
=20=20dbus: fixed mode if systemd service file

Henning Heinold (2):
=20=20perf: fix broken shell comparsion in do_install
=20=20perf: split packging

Hongxu Jia (1):
=20=20libgcrypt: workaround ICE failure on mips with '-O -g'

Jacob Kroon (1):
=20=20default-distrovars.inc: Remove unused variable 'LIMIT_BUILT_LOCALES'

Kai Kang (1):
=20=20xorg-font-common.inc: remove shell debug option

Martin Jansa (2):
=20=20update-rc.d: Allow to use different initscripts provider
=20=20buildstats-summary.bbclass: Import useful bbclass from meta-mentor

Matthieu Crapet (1):
=20=20native.bbclass: Properly define directories

Max Eliaser (4):
=20=20texinfo: Use texinfo-replacement-native as an alias for =
texinfo-native.
=20=20texinfo-dummy-native: Create recipe w/ scripts to stand in for =
Texinfo utils
=20=20texinfo.bbclass: native/cross uses dummy texinfo; target uses host's =
Texinfo
=20=20texinfo-dummy-native: Fix dummy scripts failing when paths contain =
capital E

Paul Eggleton (2):
=20=20openssl: upgrade to 1.0.1h
=20=20openssl: fix ptests

Richard Purdie (6):
=20=20rpm: Fix cpio 32 bit overflow issues on 64 bit inode filesystems
=20=20elfutils: Fix debugedit failure in grub
=20=20bitbake.conf: Add QEMU_OPTION for ppc7400 as used by qemuppc
=20=20qemuwrapper-cross: Use QEMU_OPTIONS
=20=20bitbake.conf/qemu: Move QEMU_OPTIONS to qemu.bbclass
=20=20alsa-tools: Add missing pkgconfg dependency

Robert Yang (2):
=20=20libgcrypt: fix do_configure failed
=20=20gstreamer1.0-rtsp-server: depends on libcgroup and =
gstreamer1.0-plugins-base

Ross Burton (8):
=20=20gdk-pixbuf: fix paths to test binaries
=20=20glib-2.0: fix paths to test binaries
=20=20mesa: add build-dependency on libxml2-native
=20=20xorg-xserver: disable DRI3 by default
=20=20gawk: fix module paths
=20=20gawk: remove dgawk and pgawk packages, merge gawk-common into gawk
=20=20Revert "fontconfig: enable 64 bit file support"
=20=20neard: fix more parallel build issues

Saul Wold (2):
=20=20e2fsprogs: use update-alt for chattr
=20=20stat: use update-alt for stat

Shan Hai (1):
=20=20oe-core/init-install.sh: do not overwrite /etc/mtab if the link =
already exis

Valentin Popa (1):
=20=20mesa: upgrade to 10.1.3

yanjun.zhu (1):
=20=20python-gst: link python shared library to config directory

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Amy Fong (2):
=20=20ruby overwrites configuration files in ruby-native
=20=20nodejs: Inherit pythonnative

Armin Kuster (3):
=20=20tipcutils: B!=3DS fix
=20=20postgresql: B!=3DS fix
=20=20libol: compile issue files missing in B and packaging issue

Ash Charles (11):
=20=20xfce4-dev-tools: Allow out of tree builds
=20=20xfce-git: Run autogen.sh in source directory
=20=20xfce4-settings: Install cursors from srcdir
=20=20mbuffer: Update to version 20140310 from 20091227
=20=20ltrace: Run autogen.sh in source directory
=20=20lxdm: Use lxdm.conf from build directory
=20=20networkmanager: correct test libs install source
=20=20sqlite: Point to Makefile in source directory
=20=20network-manager-applet: fix S!=3DB error
=20=20xfce4-screenshooter: Ensure lib directory exists.
=20=20xfce4-notifyd: Ensure xfce4-notifyd subdirectory exists

Chong.Lu@windriver.com (1):
=20=20python-m2crypto: avoid swig problem

Chris Morgan (2):
=20=20dfu-util: Add 0.7 and remove old 0.1 recipe
=20=20dfu-util: Remove svn recipes

Eduardo Silva (1):
=20=20monkey: fix broken separate build with workaround

Jackie Huang (3):
=20=20vim: use BPN instead of PN to fix multilib build
=20=20postgresql: use BP instead of P to fix multilib build
=20=20fbset: use BP instead of P to fix multilib build

Joe MacDonald (1):
=20=20MAINTAINERS: update my email address for meta-networking

Lewis, Nick (1):
=20=20libxml++: fix build with B noteq S

Mario Domenech Goulart (4):
=20=20leptonica: add recipe for version 1.7.0
=20=20tesseract: add recipe for version 3.02.02
=20=20tesseract-lang: add recipes for all languages available
=20=20contrib/tesseract-langs.sh: add script to generate recipes for =
tesseract lan

Martin Jansa (4):
=20=20luajit: upgrade to 2.0.3, add native support
=20=20python-cython: upgrade to 0.20.1
=20=20xf86-video-geode: Upgrade to 2.11.15
=20=20radvd: fix install issue for S!=3DB

Maxim Uvarov (2):
=20=20daq: fix compilation
=20=20daq fix compilation

Otavio Salvador (1):
=20=20nbench-byte: Fix parallel building error

Paul Barker (1):
=20=20vim: Fix packaging of common data files

Paul Eggleton (1):
=20=20openobex: fix detection of IrDA during configure with B!=3DS

Philip Balister (1):
=20=20zeroc-ice : Add recipe.

Tim Orling (7):
=20=20fluidsynth: fix S!=3DB errors
=20=20schroedinger: fix S!=3DB error, rename "files"
=20=20libdc1394: fix S!=3DB failure
=20=20libmikmod: update to 3.3.6
=20=20lockdev: fix S!=3DB failure
=20=20libsdl-mixer: fix S!=3DB failure
=20=20enca: fix S!=3DB failure

chase maupin (1):
=20=20yavta: Update to latest sources

yaoxp (1):
=20=20lvm2: don't overrwrite EXTRA_OECONF

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (1):
=20=20external-linaro-toolchain: updates and fixes for Linaro gcc-4.8

Franklin S. Cooper Jr (11):
=20=20ti-tisdk-setup: Use latest commit for create-sdcard.sh
=20=20qt example apps: Use Makefile.build instead of Makefile for the SDK =
makefile
=20=20ti-tisdk-makefile: Update Qt Makefile stubs to reflect Makefile name =
change
=20=20ti-tisdk-makefile: Fix u-boot cleaning
=20=20matrix-gui: Add camera submenu
=20=20image-gallery: Add image gallery application
=20=20arago-source-ipk: Create source ipk for image-gallery app
=20=20packagegroup-arago-tisdk-multimedia-sdk-host: Add image-gallery app =
sources
=20=20packagegroup-arago-tisdk-matrix: Add image gallery demo to Matrix
=20=20ti-tisdk-makefile: Add image gallery to SDK makefile for AM4x
=20=20packagegroup-arago-tisdk-multimedia: Add image-gallery to AM4x demo =
list

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

Mario Domenech Goulart (3):
=20=20gen-egg-recipes: add stty
=20=20chicken-egg-stty: add recipe for version 0.2.4
=20=20chicken: update to version 4.9.0.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Otavio Salvador (1):
=20=20qtmultimedia: Drop i.MX6 support patch as Qt 5.3.0 is now in use

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Eric Nelson (5):
=20=20linux-boundary (3.10.17): defconfig changes for nitrogen6x =
nitrogen6x-lite
=20=20linux-boundary (3.0.35): defconfig changes for nitrogen6x, =
nitrogen6x-lite
=20=20linux-boundary (3.0.35): Bump SRCREV to d9bc8a4
=20=20linux-boundary (3.10.17): Bump SRCREV to cfb334d
=20=20nitrogen6x*, imx6qsabrelite: default to kernel 3.10.17

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

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

Nitin A Kamble (5):
=20=20common: Delete linux-yocto-rt_3.14.bb from meta-intel layer
=20=20common: Update linux-yocto v3.14 recipe SRCREVs to v3.14.5
=20=20common: Update linux-yocto v3.10 recipes SRCREVs to v3.10.41
=20=20BSP READMEs: correct the mailing list address
=20=20Provide a time limited kernel extension for the v3.14 kernel

Tom Zanussi (4):
=20=20meta-romley: Fix README mismatch mailing list name and address
=20=20meta-crystalforest: Fix README mismatch mailing list name and address
=20=20Revert "common: Update linux-yocto v3.14 recipe SRCREVs to v3.14.5"
=20=20Revert "common: Update linux-yocto v3.10 recipes SRCREVs to v3.10.41"

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

Jonathan Liu (4):
=20=20qt5: upgrade from 5.2.1 to 5.3.0
=20=20qtwebsockets: Add new module
=20=20qtenginio: Add new module
=20=20packagegroup-qt5-toolchain-target: Add qtenginio, qtwebsockets

Martin Jansa (8):
=20=20recipes-git: Upgrade from latest origin/release to latest =
origin/stable
=20=20recipes-git: Upgrade to latest origin/stable
=20=20recipes-git: Use LIC_FILES_CHKSUM from .inc files
=20=20qtbase: Refresh patches to match with b5.3.0* branches on =
github.com/meta-qt
=20=20qtbase: Refresh patches to match with stable* branches on =
github.com/meta-qt
=20=20maliit-framework-qt5: Add patch to fix build with qt-5.3, remove =
unused file
=20=20qtwayland: Don't use bashisms in do_install
=20=20qtwayland: respect OE_QMAKE_PATH_QT_HEADERS and use QT_VERSION =
variable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Alex J Lennon (5):
=20=20userland: Add '--no-as-needed' linker flag
=20=20userland: Add SRCBRANCH and SRCFORK for use by SRC_URI
=20=20linux-raspberrypi: Update kernel to 3.12.21
=20=20pi-blaster: Added recipe
=20=20gstreamer1.0-plugins-bad: Build eglglessink for Raspberry Pi

Andrei Gherzan (4):
=20=20Merge "pi-blaster: Added recipe"
=20=20Merge "linux-raspberrypi: Update kernel to 3.12.21"
=20=20README: Add patch guidelines info
=20=20Merge "gstreamer1.0-plugins-bad: Build eglglessink for Raspberry Pi"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (1):
=20=20Revert "dra7xx-evm: Add sgx to MACHINE_FEATURES"

Hao Zhang (2):
=20=20keystone: linux: add K2E and K2L DTB build support
=20=20keystone: linux: add K2L and K2E DTB for RT build

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Alexandr Smoktal (1):
=20=20webos-image: luna-service2=3D194,v3.9.3

Andrii Motsok (1):
=20=20webos-image: openssl=3Dv1.0.1h

Andrii Zora (1):
=20=20webos-image: libpbnjson=3D38,v2.9.0

Maksym Sditanov (1):
=20=20webos-image: db8=3D142

Nikolay Orliuk (1):
=20=20webos-image: luna-sysservice=3D38

Sapna Todwal (1):
=20=20webos-image: nyx-lib=3D70,v6.1.0 nyx-modules=3D94-starfish7,v6.1.0 =
nyx-utils=3D15,

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (1):
=20=20qemu: Fix axi-ethernet for newer kernels

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Jacob Kroon (1):
=20=20default-distrovars.inc: Remove unused variable 'LIMIT_BUILT_LOCALES'

Saul Wold (1):
=20=20maintainers: Update package ownership

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



