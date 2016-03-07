Return-Path: <cliff.brake@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id A9D7A731E5;
	Mon,  7 Mar 2016 17:04:18 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id s68so48906040qkh.3;
	Mon, 07 Mar 2016 09:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject
	:content-transfer-encoding;
	bh=Ma6gbmxTfLACqQDQOPwn727kAUJeL0hI4sgokTYGiw4=;
	b=Y+DhNOSqcofwQXX60m49YNE60WV9NsEVgvH3YtXx71F520lkv3JT+bH7fxRU1HgH23
	y0pUDHR8zwAvTQUXIAtV0OVoY/Dt9SHBOrPMeEkcZvOEhnStWkTFN9S3OVLLyHVw794Z
	j2vnKfzukhOPTCub7uDQZ5RBSXiuadm1SMUVeCkUBDv1AIKMO7qlpKz1ZIu+69qDsA52
	TQ0/9ggIVtCiaAycMcIf/pRD5pp2cnTt8Dqic+eAy85tA3n8NC/gYoL7zrrAFjhLRI+5
	Px6VouTvoCV013ws3Ot1jTxbyTnj44PA5Vb8/5Zpo/U1bvkbzZL6n8+fAWzLXRHF3z6s
	Rrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:mime-version:message-id:from:to:subject
	:content-transfer-encoding;
	bh=Ma6gbmxTfLACqQDQOPwn727kAUJeL0hI4sgokTYGiw4=;
	b=GU+yHk1r3TxKlvQRwLfcUw4OgD64fE4Uzo+431e8eqEt1X/xBXXkYjPvqW8PvumejW
	0x5z4ZglMvZkcGMsuOO4lPsFmLLjt9SZeGm81wi9JtGvFfCjhUdTGtArSIzxqo2Ojt60
	bJvzSjeYP6aBQrqFHA0FOSjAYNdxMhorlNIBZwsTW8Bic7jAaszyAxpmT4CWMwBqq/jt
	2iUlmpNJCUcpdcrMA8TEnNtLFi2hP8EXGYhYNZKv4weHxkNeWi9AEOKvGJ8AZz8e2Kww
	0IopRAgogxYY5sTA0lK+Dn2eqEa8OUdQBWm5XldqcCkbE25WpWr22g1OCNVVR3zmY8u1
	E8pw==
X-Gm-Message-State: AD7BkJIl//sLl8WRjDrfuwI5kVS/naf3ohmWqgg06yqR3naSQF8zEVCS4gnBO75CmVDlVg==
X-Received: by 10.55.80.135 with SMTP id e129mr30230876qkb.65.1457370258376;
	Mon, 07 Mar 2016 09:04:18 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134]) by smtp.gmail.com with ESMTPSA id
	q10sm8334498qha.25.2016.03.07.09.04.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Mar 2016 09:04:16 -0800 (PST)
Date: Mon, 07 Mar 2016 09:04:16 -0800 (PST)
X-Google-Original-Date: Mon, 07 Mar 2016 17:04:14 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1457370254826.a9a4b4c4@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2016-02-28 until 2016-03-06
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
X-List-Received-Date: Mon, 07 Mar 2016 17:04:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2016-02-28 until 2016-03-06.  Projects included in this =
report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
meta-arago: git://arago-project.org/git/meta-arago.git
meta-atmel: https://github.com/linux4sam/meta-atmel.git
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
https://github.com/schnitzeltony/meta-gumstix-community.git
meta-handheld: git://git.openembedded.org/meta-handheld
meta-igep: http://github.com/ebutera/meta-igep.git
meta-intel: git://git.yoctoproject.org/meta-intel
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-java: git://github.com/woglinde/meta-java
meta-jetson-tk1: https://github.com/cubicool/meta-jetson-tk1.git
meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
meta-micro: git://git.openembedded.org/meta-micro
meta-mono: git://git.yoctoproject.org/meta-mono.git
meta-netbookpro: git://github.com/tworaz/meta-netbookpro
meta-nodejs: https://github.com/imyller/meta-nodejs.git
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

Alexander Shashkevich (1):
=20=20fetch2: fixes copying of file://dir; subdir=3Dfoo, bug 6128 and bug =
6129

Brendan Le Foll (2):
=20=20npm: in cases where shrinkwrap resolved a git URL, ignore it and grab =
dist.t
=20=20fetch2/npm: Add missing ParameterError import

Richard Purdie (1):
=20=20fetch2: Fix unpack for absolute file urls

Scott Rifenbark (3):
=20=20bitbake-user-manual: Enhance environment variable discussion.
=20=20bitbake-user-manual: Added note for Python variable ref expansion.
=20=20bitbake-user-manual: Added expand() function to list.

bavery (1):
=20=20hob: removal of hob ui and associated ui files

brian avery (2):
=20=20ui: remove the puccho ui
=20=20toaster: cleanup of bin/toaster startup code

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro Hernandez (3):
=20=20eudev: Replaces udev with eudev for compatibility when using sysvinit =
on new
=20=20libgudev: Fix for new eudev implementation
=20=20usbutils: Fix for new eudev implementation

Andre McCurdy (6):
=20=20gstreamer1.0-plugins-bad.inc: limit ARM_INSTRUCTION_SET over-rides to =
armv4/
=20=20harfbuzz: update 1.2.1 -> 1.2.3
=20=20grub2.inc: dont export TARGET_CFLAGS etc to grub2 configure
=20=20grub2.inc: avoid passing -isystem to native builds
=20=20grub2.inc: drop bogus dependency on xz
=20=20eudev: recipe formatting improvements

Armin Kuster (1):
=20=20openssl: Security fix Drown via 1.0.2g update

Bruce Ashfield (8):
=20=20linux-yocto/4.1: Galileo updates
=20=20linux-yocto/4.1: clkdev updates
=20=20linux-yocto/4.1: update to 4.1.18
=20=20linux-yocto/4.4: yaffs2 build fixes
=20=20linux-yocto: braswell: Remove feature and move =
DRM_I915_PRELIMINARY_HW_SUPPO
=20=20linux-yocto/4.4: update to -stable 4.4.2
=20=20linux-yocto/4.1: iwlwifi: mvm: don't allow sched scans without =
matches to be
=20=20linux-yocto/4.4: update to 4.4.3

Chen Qi (1):
=20=20insane.bbclass: make the checking stricter for unsafe references in =
scripts

Christopher Larson (1):
=20=20populate_sdk_base: handle empty SDK_PACKAGING_FUNC

Dmitry Rozhkov (1):
=20=20libarchive: Set xattrs after setting times

Ed Bartosh (1):
=20=20bootimg: set default value for LABELS variable

Jagadeesh Krishnanjanappa (2):
=20=20cantarell-fonts: Add recipe
=20=20pango: make ${PN}-ptest RDEPENDS on cantarell-fonts

Jonathan Liu (1):
=20=20e2fsprogs: do not enable non-stable features by default

Joseph A. Lutz (1):
=20=20automake: don't delete .pyc files

Juro Bystricky (2):
=20=20sdk.py: Fix undefined variable
=20=20sdk_update.py: Enable local sdk-update tests

Mariano Lopez (1):
=20=20dhcp: CVE-2015-8605

Mark Hatle (1):
=20=20gcc: Add support for atomic opertions (libitm) where available

Patrick Ohly (1):
=20=20combo-layer: handle empty commits during "init --history"

Paul Eggleton (8):
=20=20classes/module: allow substitution of the modules_install target name
=20=20classes/populate_sdk_ext: prepend to PATH rather than appending
=20=20classes/externalsrc: fix symlinking if symlink exists pointing to =
another pa
=20=20recipetool: create: add support for out-of-tree kernel modules
=20=20recipetool: create: add basic support for generating linux kernel =
recipes
=20=20recipetool: create: add basic support for new npm fetcher/class
=20=20devtool: build-image: rename module
=20=20devtool: add build-sdk subcommand

Peter Kjellerstedt (1):
=20=20sanity: Do not mistake meta-yocto-bsp for meta-yocto

Randy Witt (2):
=20=20populate_sdk_ext: Delete the buildtools tar file after installation
=20=20populate_sdk_ext: Only write LCONF_VERSION to bblayers if it is set

Richard Purdie (5):
=20=20sanity: Fix int verses string reference
=20=20layer.conf: Whitelist cantarell-fonts fontconfig dependency
=20=20sato/images: Add ptest image
=20=20layer.conf: Update after replacement of udev with eudev
=20=20oeqa/buildoptions: Improve unsafe references tests

Robert Yang (2):
=20=20syslinux.bbclass: make vm and live can be built together
=20=20sanity.bbclass: remove conflict checking for image vm and live

Ross Burton (1):
=20=20cracklib: fix Python packaging

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (4):
=20=20linux-yocto-tiny-kexecboot: revert Yocto specific console check
=20=20kexecboot: sync fix for gcc5 with upstream
=20=20kexecboot: enable text UI in default EXTRA_OECONF.
=20=20linux-yocto-tiny-kexecboot: fix build error (cpio not found)

Andreas M=C3=BCller (6):
=20=20gtkmathview: fix and unblacklist
=20=20abiword: unblacklist - gtkmathview is back building
=20=20geany: update to 1.26
=20=20plymouth: fix empty plymouth-initrd after oe-core's libexec path =
transition
=20=20network-manager-applet: update to 1.0.10
=20=20cppunit: fix loads of host-user-contaminated warnings

Armin Kuster (3):
=20=20acpitool: Add package
=20=20php: update to 5.6.18 and 6.6.32
=20=20xerces-c: Package update, QA fix and CVE-2016-0729

Christopher Larson (1):
=20=20lowpan-tools: add missing flex/bison deps

George McCollister (1):
=20=20lldpd: use bash-completion.bbclass

Hongxu Jia (1):
=20=20postfix: fix clean broken issue

Jackie Huang (3):
=20=20ncftp: fix build failures with ccdv
=20=20iscsitarget: split the kernel module into separate package
=20=20waf-samba.bbclass: add cross-answers option and files

Joe MacDonald (1):
=20=20Revert "netmap-modules: Modules may not have the same arch as =
userspace"

Jonathan Liu (2):
=20=20nodejs: update to 4.3.1
=20=20nodejs: update to 4.3.2

Kai Kang (1):
=20=20samba: update systemd service files

Mark Asselstine (1):
=20=20ntp: remove empty libexecdir to prevent potential QA issues

Martin Jansa (5):
=20=20opencv: blacklist, not compatible with currently used ffmpeg 3
=20=20mplayer2: blacklist, not compatible with currently used ffmpeg 3
=20=20gst-ffmpeg: blacklist, not compatible with currently used ffmpeg 3
=20=20webkit-efl: blacklist, webkit-efl is old and unmaintained fork with =
security
=20=20recipes: Replace "cp -a" with "cp -R --no-dereference =
--preserve=3Dmode,links"

Maxin B. John (1):
=20=20gpsd: Fix build when static libs disabled

Randy MacLeod (1):
=20=20lldpd: fix PN -> BPN SRC_URI for multilib build

Richard Purdie (1):
=20=20inetutils: Fix build when static libs disabled

Robert Yang (4):
=20=20nbd: use BPN in Files
=20=20cim-schema-exper: fix host-user-contaminated
=20=20ctdb: add PACKAGECONFIG for libtdb
=20=20netkit-ftp: fixed invalid symlink

Roy Li (1):
=20=20ebtables: enable KERNEL_64_USERSPACE_32 for powerpc

Ruslan Bilovol (1):
=20=20wireshark: update SRC_URI link to sources

mike.looijmans@topic.nl (1):
=20=20samba: Fix typo in PACKAGECONFIG for "acl" and "aio"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Anand Balagopalakrishnan (2):
=20=20img-pvr-sdk: SGX demo binaries for Wayland and DRM for all platforms
=20=20img-pvr-sdk: bump PR for srcrev change

Denys Dmytriyenko (4):
=20=20timestamping: add timestamping tool to test PTP
=20=20packagegroup-arago-test: add timestamping
=20=20init-ifupdown: pass udhcpc_opts to eth0 for easy configuration
=20=20busybox: stop hardcoding default udhcpc parameters, now in interfaces =
file

Gou, Hongmei (1):
=20=20tisdk-server-extra-rootfs-image: add multimedia packagegroup

Jacob Stiffler (2):
=20=20ti-tisdk-setup: Add support for create_ubifs script
=20=20tisdk-install: Insert SDK path into ubifs script

Ross Burton (1):
=20=20doxygen: add API documentation generation tool

Sam Nelson (1):
=20=20doxygen: Update to new version 1.8.9.1

e-ruei1@ti.com (8):
=20=20conf: enable wayland/drm support for AM3
=20=20matrix: enable corresponding 3D demos including kmscube for AM3
=20=20dual-camera-demo: Re-enable on AM4 to run outside of Weston
=20=20gstreamer-plugins-bad: Enable waylandsink plus mouse movement support =
for AM
=20=20weston: Add Virtual keyboard patch
=20=20kmscube: Enhance and enable this demo for AM3
=20=20ti-tisdk-makefile: Replace PVR_NULLDRM and PLATFORM_OMAPDRM with =
TARGET_PROD
=20=20weston-conf: Update output name at weston.ini for ti43x per weston 1.9

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Andreas M=C3=BCller (1):
=20=20firefox: fix install for oe-core master and cleanup packaging

Martin Jansa (1):
=20=20Revert "Fix checksums missed in Firefox 38.6.1esr update."

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

Martin Jansa (1):
=20=20qtbase: Allow to build eglfs with x11 in DISTRO_FEATURES

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Ian Coolidge (2):
=20=20linux-boundary (3.14.28): Bump SRCREV to ae977d1
=20=20linux-boundary: Sync defconfig with latest boundary_defconfig

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Adrian Dudau (1):
=20=20linux-qoriq: check $WORKDIR for config fragments

Zhenhua Luo (2):
=20=20apptrk: fix the QA issue of debug symbol check
=20=20rename udev to eudev to align with change in poky

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

California Sullivan (1):
=20=20linux-yocto/4.4: Update to linux 4.4.3

Saul Wold (1):
=20=20meta-intel.inc: Update INTRD to INITRD_LIVE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-jetson-tk1:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

Ioan-Adrian Ratiu (1):
=20=20recipes-mono: fix LIC_FILES_CHKSUM URI

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

Ilkka Myller (16):
=20=20gulp: 3.9.1
=20=20Update README.md
=20=20Removed io.js recipes and RCONFLICTS with nodejs
=20=20Removed references to io.js in README.md
=20=20Removed unmaintained semver-minor releases and updated documentation
=20=20Updated README.md with Node.js LTS schedule
=20=20RPROVIDES iojs with Node.js LTS release
=20=20Merge pull request #26 from imyller/semver-major-only
=20=20Merge pull request #25 from imyller/iojs-deprecation
=20=20Cleaned up recipe includes
=20=20Added nodejs-lts recipe alias
=20=20Merge pull request #27 from imyller/inc-cleanup
=20=202016-03-02, Version 4.3.2 'Argon' (LTS)
=20=202016-03-02, Version 5.7.1 (Stable)
=20=202016-03-04 Version 0.10.43 (Maintenance) Release
=20=202016-03-03 Version 0.12.11 (LTS) Release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Martin Jansa (1):
=20=20gdb: include readline in default PACKAGECONFIG

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Herrie (1):
=20=20android-system-image.inc: Fix license typo

Martin Jansa (7):
=20=20avahi*: remove unnecessary bbappends
=20=20atd-over-fso: add explicit EXTRA_OEMAKE
=20=20invensense: include both built libraries in ${PN} not ${PN}-dev
=20=20recipes: Replace "cp -a" with "cp -R --no-dereference =
--preserve=3Dmode,links"
=20=20bcm4330-firmware, samsung-tuna-firmware: Fix license typos

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Anand Balagopalakrishnan (4):
=20=20omap5-sgx-ddk-um-linux: register PVR service for autostart on boot
=20=20omap5-sgx-ddk-um-linux: bump SRCREV for bug fixes in Wayland EGL
=20=20omap5-sgx-ddk-um-linux: remove version 1.9.0.12 as replaced by =
1.14.3699939
=20=20omapdrm_pvr: remove version 1.9.2253347 as replaced by 1.14.3699939

Denys Dmytriyenko (3):
=20=20linux-ti-staging: update with platform, connectivity and rpmsg fixes
=20=20u-boot-ti-staging: update with latest HS, K2 and AM4 fixes
=20=20linux-ti-staging: update with latest A/D, connectivity and rpmsg fixes

Jacob Stiffler (4):
=20=20linux: cmem: k2g-evm: Add CMEM regions for k2g-evm
=20=20common-csl-ip-rtos: Add support for k2g-evm
=20=20openmp-rtos: Bump version to 2.2.1.0 and add k2g-evm
=20=20multiprocmgr: Add SRCREV

Sam Nelson (2):
=20=20ti-ipc: Update to GA version IPC 3.42
=20=20multiprocmgr: Update to new verison 3.0.1.0

e-ruei1@ti.com (2):
=20=20omap5-sgx-ddk-um-linux: Add plugins list
=20=20omap5-sgx-ddk-um-linux: Add INSANE_SKIP list for plugins

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Manjukumar Matha (1):
=20=20tune-zynq: Change ABI to hard-float with thumb

Nathan Rossi (13):
=20=20qemu_2.5%.bbappend: Create bbappend for arm64 patches
=20=20device-tree.bb: Add support to use kernel source tree includes
=20=20device-tree.bb: Move zynq7-base.dtsi into recipe source
=20=20qemuzynq: Rework device tree to use kernel source include
=20=20qemuzynq: Remove older device-trees
=20=20kc705-trd-microblazeel: Move device tree to device-tree recipe
=20=20microzed-zynq7: Rework device tree to use kernel source include
=20=20picozed-zynq7: Rework device tree to use kernel source include
=20=20zc702-zynq7: Switch over to in kernel device tree
=20=20zedboard-zynq7: Switch over to in kernel device tree
=20=20zc706-zynq7: Switch over to in kernel device tree
=20=20zybo-zynq7: Switch over to in kernel device tree
=20=20machine-xilinx-*.inc: Remove default append for 'device-tree'

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Alejandro Hernandez (1):
=20=20maintainers.inc: Add new eudev package and change maintainership for =
udev

Kevin Hao (1):
=20=20meta-yocto-bsp: bump to linux-yocto 4.4 for the non-x86 BSPs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



