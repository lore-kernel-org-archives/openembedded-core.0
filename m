Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id D98B76FFA6;
	Tue, 19 Jan 2016 17:03:15 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id 6so505466108qgy.1;
	Tue, 19 Jan 2016 09:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=DeYDHvAZ9WFsQpqpPeA4gDBdRbJNq3+Wrtm7HYPbwpE=;
	b=xzMXzHmrcSL5MeHD8gYXOBLP1wnNrpSp1sUj5muJu8/Sh5u6o2EBR9qbB/TJ72KQ9Y
	b+Kzw/Zoba/ZikbvOKEAcM/wpB8ajq1X4SdPddjgWL5YaLA1nSfgBLTBR/zL5DN3WWg/
	ImHnkWoPAnuPV8wZbm3TnE9v3pZxysDvb3i1N6G/KX7JIC5VFy/jNHpso4Q3LmKK9Dnk
	ZIJn+9Y+VU3bN/3VnrmRrTGumZPl17xDeffqjkOGaDDEBqScERrQjt7+V93BujrDgfVV
	PvZwpoRCOg2ty8n6uPCyxJ2lwZevgOyOjxXwGNoMtsnq4t7u/z2mJt/V9Jc4JyB2llo3
	RwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:mime-version:message-id:from:to:subject
	:content-type:content-transfer-encoding;
	bh=DeYDHvAZ9WFsQpqpPeA4gDBdRbJNq3+Wrtm7HYPbwpE=;
	b=XzjxvREQr0z1Lp8T41HqfdgNO7s0VJK0RJ76IsVd0iUt0gF3+wvahaAVWmqDEPKhKF
	trVyF0spkKRoU26KLNqoVl18qUyjW7vyBXvxB6W7E1aKU+qy3e8tQu5UV9/RnzX143zr
	V1MV0XdPFiVMhqL/IXtZhDQKngQ0lqITj/u4FfxfX3KZRIcr/uJbwCG/j9DNWz9K7sTz
	Mcv/p8SBIPoevOb8VyH6trkQvne1iQsl9B16K/Izi6EE4oXpQnUZbQKkCV4eC+PAP1XS
	eINdL62FHIkZrnJYol50nXhaxlAm3TZ2VqXYPk+7DZvVpdonB0CgOm0ZNHsc3zsuoa1x
	4DNA==
X-Gm-Message-State: ALoCoQmesYYxH5D0XbqUZO99l2xUgbe6kSuQviiPtFODo4KXMM1282bkmJ035cyQ8SKXdS5AekwxTImm43iHOLJUaqgz/XKmEQ==
X-Received: by 10.140.101.130 with SMTP id u2mr40830349qge.71.1453222996304;
	Tue, 19 Jan 2016 09:03:16 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134]) by smtp.gmail.com with ESMTPSA id
	w140sm1295423qkw.24.2016.01.19.09.03.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jan 2016 09:03:13 -0800 (PST)
Date: Tue, 19 Jan 2016 09:03:13 -0800 (PST)
X-Google-Original-Date: Tue, 19 Jan 2016 17:03:12 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1453222992531.12b8f58d@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2016-01-10 until 2016-01-17
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
X-List-Received-Date: Tue, 19 Jan 2016 17:03:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2016-01-10 until 2016-01-17.  Projects included in this =
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

Chen Qi (1):
=20=20bitbake: clean up stamp-base related codes

Ed Bartosh (1):
=20=20toaster: increase timeout

Elliot Smith (23):
=20=20toastergui: use ToasterTable for projects page
=20=20toaster: move image file suffix list to model
=20=20toaster: check inferred file suffixes against list of known types
=20=20toastergui: switch projects/ view to ToasterTable
=20=20toastergui: use event delegates for hover help elements
=20=20toastergui: convert all builds page to ToasterTable
=20=20toastergui: refactor ToasterTable filtering
=20=20toastergui: switch off filter highlights when inactive
=20=20toastergui: show recent builds on all builds page
=20=20toastergui: implement date range filters for builds
=20=20toastergui: implement "today" and "yesterday" filters
=20=20toastergui: convert project builds page to ToasterTable
=20=20toastergui: don't hide all elements with .col class
=20=20toastergui: ensure filter_value updates
=20=20toastergui: streamline construction of filter objects
=20=20toastergui: serialise decimals correctly
=20=20toastergui: set default visible and hideable columns
=20=20toastergui: mute label for filter actions with no records
=20=20toastergui: make "Apply" button state depend on filter range
=20=20toastergui: fix error and warning counts for builds
=20=20toastergui: remove unused views and template code
=20=20toaster tests: fix Django tests for new ToasterTable pages
=20=20toastergui: code formatting and clean-up

Kristian Amlie (1):
=20=20fetch2/git.py: Add missing "errno" module import.

Richard Purdie (3):
=20=20runqueue: Fix setscene task dependencies
=20=20Revert "fetch2/local.py: avoid using PREMIRROR"
=20=20Revert "fetch/git: Change to use clearer ssh url syntax for broken =
servers"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexander Kanavin (7):
=20=20valgrind: update to 3.11.0
=20=20libwebp: upgrade to 0.5.0
=20=20lighttpd: upgrade to 1.4.39
=20=20iso-codes: upgrade to 3.64
=20=20epiphany: upgrade to 3.18.3
=20=20ca-certificates: update to 20160104
=20=20openssh: update to 7.1p2

Andre McCurdy (8):
=20=20valgrind: don't restrict to armv7a
=20=20valgrind: include aarch64 in COMPATIBLE_HOST
=20=20gcc-configure-common.inc: duplicate armv7a over-ride for armv7ve
=20=20libav.inc: duplicate armv7a over-rides for armv7ve
=20=20libpostproc: duplicate armv7a over-rides for armv7ve
=20=20harfbuzz: update 1.1.2 -> 1.1.3
=20=20kernel-yocto.bbclass: remove do_kernel_link_vmlinux from =
SRCTREECOVEREDTASKS
=20=20kernel-yocto.bbclass: move do_kernel_link_vmlinux() into =
kernel.bbclass

An=C3=ADbal Lim=C3=B3n (1):
=20=20DpkgRootfs: Fix logcheck_error false-positive when use multilib

Armin Kuster (1):
=20=20openssh: CVE-2016-1907

Awais Belal (1):
=20=20dhcp: search libxml2 for bind

Bruce Ashfield (1):
=20=20linux-yocto: introduce v4.4 standard/preempt-rt/standard kernel

Chen Qi (8):
=20=20bitbake.conf: remove 'stamp-base'
=20=20pciutils: upgrade to 3.4.1
=20=20resolvconf: upgrade to 1.78
=20=20kmod: upgrade to 22
=20=20at: upgrade to 3.18
=20=20sysstat: upgrade to 11.2.0
=20=20xz: upgrade to 5.2.2
=20=20curl: upgrade to 7.46

Christopher Larson (4):
=20=20linux-dtb.inc: use absolute upd-alt paths
=20=20opkg-utils: add update-alternatives PACKAGECONFIG
=20=20systemd: add myhostname to nsswitch.conf
=20=20systemd: arrange for volatile /etc/resolv.conf

Dengke Du (1):
=20=20ncurses: 5.9 0 -> 6.0

Dmitry Rozhkov (1):
=20=20libarchive: Add bsdtar and bsdcpio packages

Ed Bartosh (11):
=20=20meta: rename perl-native-runtime
=20=20bitbake.conf: rename python-native-runtime
=20=20wic: add partition module
=20=20wic: add kickstart parser module
=20=20wic: use new kickstart parser
=20=20wic: remove pykickstart code
=20=20wic: adjust code for new data structure
=20=20wic: get rid of get_timeout getter
=20=20wic: get rid of get_rootfs and set_rootfs
=20=20wic: get rid of set_size and set_source_file setters
=20=20wic: get rid of 2 getters

Elliot Smith (1):
=20=20toaster.bbclass: Separate artifact dump from image file dump

Enrico Jorns (1):
=20=20autoconf: add missing perl-module-file-find to RDEPENDS

Haris Okanovic (1):
=20=20tzdata: Make /etc/timezone optional

Hongxu Jia (10):
=20=20dbus: support large-file for stat64
=20=20connman.inc: add missing RDEPENDS
=20=20dhcp: 4.3.2 -> 4.3.3
=20=20elfutils: 0.163 -> 0.164
=20=20xmlto: 0.0.26 -> 0.0.28
=20=20libgcrypt: 1.6.3 -> 1.6.4
=20=20man-pages: 4.02 -> 4.04
=20=20help2man-native: 1.47.1 -> 1.47.3
=20=20gnupg: 2.1.7 -> 2.1.10
=20=20pax-utils: 1.0.5 -> 1.1.4

Ioan-Adrian Ratiu (2):
=20=20util-linux: create util-linux-runuser package
=20=20util-linux: create util-linux-runuser iff pam in DISTRO_FEATURES

Jackie Huang (1):
=20=20license.bbclass: fix license manifest

Jianxun Zhang (1):
=20=20kernel/kernel-arch: Explicitly mapping between i386/x86_64 and x86 =
for kerne

Joshua Lock (1):
=20=20wic/help.py: document requirements for valid fstab generation

Jussi Kukkonen (9):
=20=20gpgme: upgrade to 1.6.0
=20=20gsettings-desktop-schemas: upgrade to 3.19.3
=20=20libcroco: upgrade to 0.6.11
=20=20libevdev: upgrade to 1.4.6
=20=20libgpg-error: upgrade to 1.21
=20=20librsvg: upgrade to 2.40.13
=20=20libxi: upgrade to 1.7.6
=20=20menu-cache: upgrade to 1.0.1
=20=20xf86-input-evdev: upgrade to 2.10.1

Kai Kang (1):
=20=20glib-2.0: add dependency glib-2.0-native back

Khem Raj (1):
=20=20uclibc: Upgrade to 1.0.10

Li Xin (1):
=20=20net-tools_1.60-26.bb: Fix do_patch dependency error

Lukas Bulwahn (1):
=20=20boost: update to 1.60.0

Marek Vasut (2):
=20=20gcc5: Fix build on NIOS2
=20=20u-boot: Update to 2016.01 release

Mariano Lopez (2):
=20=20rpmresolve.c: Fix unfreed pointers that keep DB opened
=20=20Add "CVE:" tag to current patches in OE-core

Mark Hatle (2):
=20=20tcmode-default.inc: Fix preferred provider =
nativesdk-sdk_prefix-libc-initial
=20=20image.bbclass: Unconditional includes of populate_sdk_ext fails

Martin Jansa (2):
=20=20libbsd: upgrade to 0.8.1
=20=20scripts/create-pull-request: fix git request-pull syntax

Matt Madison (3):
=20=20package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH mapping =
function
=20=20package_manager.py: fixes for multilib deb packaging builds
=20=20package_deb.bbclass: add 'Multi-Arch: foreign' tag to allarch packages

Maxin B. John (4):
=20=20bluez5: upgrade to 5.37
=20=20matchbox-keyboard: export GTK_IM_MODULE_FILE location
=20=20connman: upgrade to 1.31
=20=20sqlite3: upgrade to version 3.10.0

Otavio Salvador (1):
=20=20image.bbclass: Handle image base type dependency properly

Paul Eggleton (19):
=20=20scripts/oe-publish-sdk: add missing call to git update-server-info
=20=20classes/populate_sdk_ext: fix cascading from preparation failure
=20=20classes/populate_sdk_ext: disable signature warnings
=20=20devtool: sdk-update: fix not using updateserver config file option
=20=20devtool: sdk-update: fix metadata update step
=20=20devtool: sdk-update: fix error checking
=20=20devtool: sdk-update: add option to skip preparation step
=20=20recipetool: create: lower case name when determining from filename
=20=20recipetool: create: support creating standalone native/nativesdk =
recipes
=20=20devtool: reset: do clean for multiple recipes at once with -a
=20=20devtool: add: support adding a native variant
=20=20devtool: refactor code for getting local recipe file
=20=20devtool: reset: support recipes with BBCLASSEXTEND
=20=20devtool: build: support using BBCLASSEXTENDed names
=20=20classes/populate_sdk_ext.bbclass: handle if local.conf doesn't end =
with a ne
=20=20classes/populate_sdk_ext: support auto.conf
=20=20classes/buildhistory: save auto.conf and bblayers.conf for extensible =
SDK
=20=20classes/populate_sdk_ext: check that extensible SDK prepared correctly
=20=20classes/populate_sdk_ext: avoid unnecessary sstate being brought in

Peter Kjellerstedt (6):
=20=20useradd-staticids.bbclass: Treat mutually exclusive options as such
=20=20useradd-staticids.bbclass: Make --no-user-group have effect
=20=20useradd-staticids.bbclass: Simplify some logic
=20=20useradd-staticids.bbclass: Simplify the logic for when to add groups
=20=20useradd-staticids.bbclass: Read passwd/group files before parsing
=20=20useradd-staticids.bbclass: Remove unnecessary spaces

Randy Witt (1):
=20=20populate_sdk_ext: Pass excluded_targets as a list to prune_lockedsigs

Richard Purdie (15):
=20=20sstatesig: Handle special case of gcc-source shared-workdir for =
printdiff
=20=20populate_sdk_ext: Use new --setscene-only option to bitbake instead =
of worka
=20=20image.bbclass: Separate out image generation into a new task, do_image
=20=20image: Move pre/post process commands to bbclass
=20=20image: Create separate tasks for rootfs construction
=20=20classes: Fix do_rootfs references
=20=20populate_sdk: Switch from bzip2 to xz
=20=20populate_sdk_ext: Change to include siginfo and non sstate task sigs
=20=20gdb: upgrade to 7.10.1
=20=20lttng-modules: Upgrade to 2.7.1
=20=20lttng-tools: Upgrade to 2.7.1
=20=20lttng-ust: Upgrade to 2.7.1
=20=20subversion: Upgrade 1.9.2 -> 1.9.3
=20=20insane/package: Fix cases where QA errors aren't fatal
=20=20image/image-live: Add back IMAGE_TYPES_MASKED support

Robert Yang (12):
=20=20cogl-1.0: fix may be used uninitialized error
=20=20qt4: fix-for-mips-n32.patch: remove it
=20=20autogen-native: 5.18.5 -> 5.18.6
=20=20file: 5.24 -> 5.25
=20=20git: 2.5.0 -> 2.7.0
=20=20wget: 1.17 -> 1.17.1
=20=20iputils: s20121221 -> s20151218
=20=20less: 479 -> 481
=20=20rsync: 3.1.1 -> 3.1.2
=20=20glibc-initial.inc: use relative path to run configure
=20=20autotools.bbclass: use relative path to run configure script
=20=20e2fsprogs: 1.42.9 -> 1.43 (master)

Ross Burton (5):
=20=20bitbake.conf: add virtual/libiconv-native to ASSUME_PROVIDED
=20=20freetype: enable out-of-tree builds, and use host zlib
=20=20update_font_cache: only scan system font directories
=20=20tzdata: remove bashism
=20=20python3: add missing dependency on PN-misc to PN-modules

Tanu Kaskinen (1):
=20=20alsa-lib: 1.0.29 -> 1.1.0

Yi Zhao (3):
=20=20oeqa/runtime/smart: fix hardcoded root directory
=20=20oeqa/runtime/logrotate: fix hardcoded root directory
=20=20local.conf.sample: add qemumips64

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Dai Caiyun (2):
=20=20lvm2: 2.02.125 -> 2.02.138
=20=20libsmi: 0.4.8 -> 0.5.0

Koen Kooi (1):
=20=20mariadb: -native also needs gold workaround

Li xin (1):
=20=20xterm: 308 -> 320

Maciej Borzecki (1):
=20=20mozjs: fix linking issues on i586

Martin Jansa (7):
=20=20netmap-modules: fix build with kernel < 3.17
=20=20cifs-utils: add PACKAGECONFIG for pam
=20=20cifs-utils: add PACKAGECONFIG for cifsidmap
=20=20recipes: remove recipes using or depending on qt4 bbclasses or recipes
=20=20gspd: disable qt4 support by default
=20=20navit: disable qt4 support by default
=20=20gnome-desktop: don't try to copy omf.make

Pascal Bach (1):
=20=20poco: Add recipe for POCO C++ library

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (1):
=20=20branding-core: re-enable AUTOREV-ed recipes after release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

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

Carlos Rafael Giani (1):
=20=20gstreamer1.0-plugins-imx: Update to version 0.12.0

Otavio Salvador (2):
=20=20imx-gpu-viv: Use auto package splitting of .debug files
=20=20qt4: Move BSP related bbappend files to dynamic layer

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

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

Rahul Kumar Gupta (3):
=20=20meta-isg: dpdk: Upgrade DPDK v2.1.0 to DPDK v2.2.0
=20=20meta-isg: dpdk: retire older ver v2.0.0 and v1.8.0
=20=20meta-isg: dpdk v2.2.0: rename the patches used

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (2):
=20=20finally and much to late annouce the move of meta-java
=20=20correct new location

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-jetson-tk1:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Andreas M=C3=BCller (1):
=20=20qtscript/qtwebkit: disable thumb for armv4 and armv5 only to fix =
segfault on

Cleiton Bueno (1):
=20=20qtwebengine: Fix error jpeg_codec.cc, =
media_capture_devices_dispatcher.cpp a

Javier Viguera (1):
=20=20qtconnectivity, qtsystems: fix bluetooth support

Samuli Piippo (1):
=20=20qt5: add extra path to qmlplugins

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (1):

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Ross Burton (1):
=20=20conf/distro/poky-tiny: correctly disable python in opkg-utils

Saul Wold (1):
=20=20linux-yocto: Update Genericx86* BSPs to 4.1.15

Yi Zhao (1):
=20=20local.conf.sample: add qemumips64

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



