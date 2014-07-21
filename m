Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id DCD4E701AC;
	Mon, 21 Jul 2014 20:32:55 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id lx4so7288972iec.17
	for <multiple recipients>; Mon, 21 Jul 2014 13:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=0lVM9Hz2fioVNQ9bd0Nk73kKdHI76gI818RL2kj9Zj0=;
	b=lbXr6gXSS5iY5EWvfQdm99910Ka4Hhkz8mZim/uWwG2oOI+zI23GzlmRa4pXSUzTVa
	THVL5SkpcN/sGVbpwmyXyYUsUm+4yt0bLpHGO3HZgIE3ThfHeEb3ZBTYYMpaOjSYEdgC
	bsc7mj07Tgk2OwCe4USwYcPKgRXhgyNARg3/zytv0pjHmC07Af3VgnSyVRlqXnmDuJsZ
	ACc9+0wpDwBcz/ZjLXBreRyHp61ChYJ7dSJbifCgOQ1zgcInVTbV1RVfDjqf3kV6v1zv
	yQlkzQ2An/Bmwv3gyy6FrFxyDrlnWd3i5qnLnMk0oRsZHjZxYUxzT3S5CLiYgTvcP/G2
	fP6Q==
X-Received: by 10.50.66.179 with SMTP id g19mr9192308igt.34.1405974776210;
	Mon, 21 Jul 2014 13:32:56 -0700 (PDT)
Received: from [127.0.0.1] (cable-pool6-cs-200.doycomm.com. [66.219.185.200])
	by mx.google.com with ESMTPSA id
	qa4sm41788606igb.10.2014.07.21.13.32.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jul 2014 13:32:55 -0700 (PDT)
Date: Mon, 21 Jul 2014 13:32:55 -0700 (PDT)
X-Google-Original-Date: Mon, 21 Jul 2014 20:32:53 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1405974773894.51f3feea@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-07-13 until 2014-07-20
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
X-List-Received-Date: Mon, 21 Jul 2014 20:32:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-07-13 until 2014-07-20.  Projects included in this =
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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Armin Kuster (1):
=20=20lz4: update to latest

Blair Elliott (1):
=20=20initscripts: save /etc/timestamp with seconds accuracy

Chen Qi (3):
=20=20eglibc: check for required distro features
=20=20shadow: upgrade from 4.1.4.3 to 4.2.1
=20=20oeqa: fix return status in pam.py to match shadow-4.2.1

Chong Lu (2):
=20=20classes/insane: Show QA check name
=20=20diffstat: update to version 1.59

Corneliu Stoicescu (3):
=20=20scripts/test-remote-image: add --skip-download option
=20=20scripts/oe-selftest: add command-line parsing and options
=20=20scripts/test-remote-image: use the scriptpath module

Daniel BORNAZ (1):
=20=20qemu: security patch for CVE-2014-3471

Darren Hart (9):
=20=20mkefidisk.sh: Use all caps for volume names
=20=20mkefidisk.sh: Add mount error checking
=20=20mkefidisk.sh: Add gummiboot support
=20=20mkefidisk.sh: Copy the EFI dir recursively
=20=20mkefidisk.sh: Improve logging
=20=20mkefidisk.sh: Add die() and cleanup() routines
=20=20mkefidisk.sh: Make the rootfs copy the last step
=20=20mkefidisk.sh: Reduce output and add verbose flag
=20=20kernelshark: Remove trace-cmd from the kernelshark package

Drew Moseley (1):
=20=20gstreamer1.0-omx: Use variables for CORE_NAME processing.

Hongxu Jia (11):
=20=20docbook-xml: add docbook-xsl-stylesheets 1.78.1
=20=20docbook-xml: add docbook-xml-dtd4
=20=20xmlto: add version 0.0.25
=20=20alsa-utils-native: add missing dep for xmlto
=20=20xorg-proto-common.inc: add missing dep for xmlto
=20=20xorg-lib-common.inc: add missing dep for xmlto
=20=20xserver-xorg.inc: add missing dep for xmlto
=20=20libxml2: enable catalog support
=20=20perl-rdepends: Add perl as perl-misc/${PN}-pod runtime dep
=20=20busybox: enable CONFIG_FEATURE_AWK_LIBM by default
=20=20eglibc: rewritten tzselect as posix sh and move it to tzcode package

Hu Yadi (1):
=20=20libpcap: Avoid libpcap build error when libnl1 is involved

Joe Slater (1):
=20=20rpm: compile rpmqv.c instead of rpmqv.cc

Jo=C3=A3o Henrique Ferreira de Freitas (2):
=20=20python-distribute: add nativesdk to BBCLASSEXTEND
=20=20populate_sdk_base: ensure that filenames with empty space character =
are hand

Ken Sharp (1):
=20=20initscripts: Use current date as an additional source of entropy

Lucian Musat (1):
=20=20oeqs/selftest: Added test case decorators for toaster

Ming Liu (3):
=20=20flac: explicitly disable checking for nasm
=20=20gmp: use PACKAGECONFIG to address readline dependency
=20=20insane.bbclass: avoid QA errors for n32 kernel

Nicolas Dechesne (3):
=20=20git: update to v2.0.1
=20=20libdrm: upgrade to 2.4.54
=20=20libdrm: enable freedreno experimental support

Peter Seebach (2):
=20=20pseudo_1.6.0.bb: uprev to pseudo 1.6
=20=20pseudo: uprev to 1.6.1

Richard Purdie (25):
=20=20pkgconfig: Drop version from RPROVIDES
=20=20python-docutil: Upgrade 0.11 -> 0.12
=20=20python-scons: Upgrade 2.3.0 -> 2.3.2
=20=20gdb: Upgrade 7.7 -> 7.7.1
=20=20mdadm: Upgrade 3.3 -> 3.3.1
=20=20gccmakedep: Upgrade 1.0.2 -> 1.0.3
=20=20powertop: Upgrade 2.5 -> 2.6.1
=20=20nasm: Update 2.11.02 -> 2.11.05
=20=20cross-canadian: Fix shlibs directory after recent shlibs changes
=20=20subversion: Upgrade 1.7.7 -> 1.8.9
=20=20python-pycurl: Upgrade 7.19.3 -> 7.19.3.1
=20=20libconvert-asn1-perl: Upgrade 0.26 -> 0.27
=20=20btrfs-tools: Upgrade 3.12 -> 3.14.2
=20=20neard: Fix typo in patch leading to parallel make race
=20=20fontcache: Fix build dependency errors
=20=20libpcap: Fix floating dbus dependency
=20=20gnutls: Fix floating libidn dependency
=20=20xserver-xorg: Fix build determinism problem
=20=20python: Forcibly disable tk
=20=20bdwgc: Add PACKAGECONFIG for libatomic-ops
=20=20libatomic-ops: Add BBCLASSEXTEND for native (to support bdwgc-native)
=20=20serf: Add new recipe (needed by subversion for http support)
=20=20subversion: neon support was dropped, switch to serf
=20=20subversion: Disable make install parallelism
=20=20libatomics-ops: Extend to nativesdk

Richard Tollerton (6):
=20=20common-mingw: force ac_cv_func_mmap_fixed_mapped=3Dno
=20=20initscripts: bootmisc.sh: Make sysctl -p honor VERBOSE
=20=20initscripts: parametrize random seed file location
=20=20initscripts: make hostname.sh coreutils-compatible
=20=20initscripts: Add support for /etc/default/urandom
=20=20openssh: use pidfile in initscript

Robert P. J. Day (1):
=20=20Remove long-deprecated "task-core" backward compat for packagegroups.

Robert Yang (3):
=20=20groff: fix PERLPATH
=20=20file: fix perl reported as awk
=20=20file: remove dump and filesystems

Ross Burton (12):
=20=20xf86-video-intel: upgrade to 2.99.912
=20=20default-versions: remove xf86-video-intel
=20=20xorg-driver: use PACKAGEFUNCS instead of populate_packages_prepend
=20=20bzip2: use "foreign" automake strictness
=20=20libid3tag: use "foreign" automake strictness
=20=20which: use "foreign" automake strictness
=20=20libmad: use "foreign" automake strictness
=20=20oprofile: use "foreign" automake strictness
=20=20ltp: use "foreign" automake strictness
=20=20license.bbclass: canonicalise licenses when dealing with =
INCOMPATIBLE_LICENS
=20=20default-distrovars/multilib: update license whitelists to use =
canonical name
=20=20xf86-video-intel: disable non-deterministic tests for libX11

Roxana Ciobanu (1):
=20=20license.bbclass: fix indentation in python function

Roy.Li (1):
=20=20qemu: exclude some ARM EABI obsolete syscalls

Saul Wold (8):
=20=20kbd: Upgrade to 2.0.2
=20=20kmod: Upgrade to latest git
=20=20squashfs-tools: Upgrade to 4.3
=20=20lzo: Upgrade to 2.08
=20=20gnupg: Upgrade to 2.0.25
=20=20libpod-plainer-perl: Upgrade to 1.04
=20=20man-pages: Upgrade to 3.70
=20=20rootfs: Remove the extraneous install directory

Shan Hai (1):
=20=20grub-core: fix endianness problem

Tim Orling (1):
=20=20libgpg-error: fix pkgconfig.patch

Ting Liu (4):
=20=20gcc: update *LIBC_* linker relocation reglex
=20=20python-numpy: add support for powerpc64 architecture
=20=20strace: fix 64 bit process detection
=20=20oprofile: backport two patches to support e500mc/e6500

Tom Zanussi (5):
=20=20wic: Error on parted non-zero error code
=20=20wic: Add vfat support
=20=20wic: Add wic overview to help system
=20=20wic: Add kickstart reference to help system
=20=20wic: Error on zero-sized partitions

Trevor Woerner (1):
=20=20grub_git: bump version, remove patch

Yue Tao (1):
=20=20setserial: add missing depends on groff-native

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Chong.Lu@windriver.com (1):
=20=20samba: fix dependency issue about talloc

Drew Moseley (2):
=20=20debianutils: Remove postinstall for some apps.
=20=20debianutils: Use update-alternatives class

Jackie Huang (1):
=20=20vim: work around rpm picking up perl as a dep

Lauren Post (1):
=20=20cpuburn-neon: Upgrade to version 20140626

Martin Jansa (9):
=20=20layer.conf: Exclude some theme dependencies from siggen
=20=20imlib2: upgrade to use pkg-config for freetype2 support
=20=20recipes: add missing pkgconfig inherit
=20=20recipes: add missing intltool-native dependency
=20=20clutter-box2d: blacklist because of B!=3DS
=20=20libgnomeprint: Blacklist because of missing freetype-config
=20=20glmark2: inherit distro_features_check
=20=20irssi: add --with-ncurses option
=20=20libgc: add PACKAGECONFIG for libatomic-ops

Ming Liu (1):
=20=20usleep: add 1.0 recipe

Otavio Salvador (2):
=20=20v4l-utils: Add virtual/libx11 dependency only if X11 is available
=20=20linuxptp: Use environment compiler settings

Philip Balister (2):
=20=20zero-mq : Add recipe.
=20=20cppzmq : Adds C++ API for zeromq.

Richard Purdie (6):
=20=20libbonoboui: Add missing intltool-native and gnome-common dependencies
=20=20fuse/libmtp/tcsh/enca: Add missing explict gettext-native dependency
=20=20phonet-utils: Fix build with B!=3DS
=20=20xpext: Drop uneeded custom do_configure to fix B!=3DS builds
=20=20recipes: Add missing intltool-native dependencies
=20=20recipes: Add missing pkgconfig dependencies

Robert Yang (11):
=20=20meta-filesystems: use BPN in SRC_URI
=20=20meta-gnome: use BPN in SRC_URI
=20=20meta-gpe: use BPN in SRC_URI
=20=20meta-multimedia: use BPN in SRC_URI
=20=20meta-oe: use BPN in SRC_URI
=20=20meta-webserver: use BPN in SRC_URI
=20=20meta-xfce: use BPN in SRC_URI
=20=20meta-networking: use BPN in SRC_URI
=20=20meta-oe: fix no newline at end of file
=20=20meta-initramfs: fix no newline at end of file
=20=20meta-networking: fix no newline at end of file

Ross Burton (3):
=20=20poppler: inherit gtk-doc
=20=20poppler: use PACKAGECONFIG to control graphics formats supported
=20=20poppler: remove spurious GTK+ build dependency

Roy Li (3):
=20=20aoetools: fix the SRC_URI
=20=20ruby: uprev it to 1.9.3-p547
=20=20hostapd: uprev to 2.2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Max Krummenacher (1):
=20=20update-alternatives: use package created by opkg-utils

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Balasubramanian, Aparna (1):
=20=20Including rng-tools in arago test package

Franklin S. Cooper Jr (1):
=20=20ptpd: Remove recipe from layer

Maupin, Chase (4):
=20=20sourceipk: allow packaging shallow git clone
=20=20arago-source-ipk: do a shallow clone of the kernel
=20=20arago: unset ASSUME_PROVIDED for git-native
=20=20linux-ti-staging: update bbappend for 3.14 version

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Otavio Salvador (1):
=20=20cubox-i: Add HummingBoard in NAME field

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Ting Liu (12):
=20=20move all inc files to folder include/
=20=20remove kernel26 machine feature usage
=20=20remove obsolete PREFERRED_VERSION for virtual/kernel
=20=20conf/machine/: move common bits to inc files
=20=20u-boot: rename to u-boot-qoriq
=20=20linux-qoriq-sdk: rename to linux-qoriq
=20=20remove fslmachine MACHINEOVERRIDES usage
=20=20add u-boot as EXTRA_IMAGEDEPENDS
=20=20set IMAGE_CLASSES =3D "image_types_uboot" as defaut
=20=20add default setting for MKUBIFS_ARGS and UBINIZE_ARGS
=20=20inherit qoriq_build_64bit_kernel for kernel/module recipes
=20=20ipc-modules: move to recipes-kernel/

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (3):
=20=20Revert "zaurus collie: remove hardcoded mem=3D64M"
=20=20linux-yocto_3.14: zaurus: modularize/remove tcp/ip to reduce kernel =
size
=20=20linux-yocto_3.14: zaurus: config serial 8250 as module

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Chan Wei Sern (2):
=20=20meta-mohonpeak: Fix README on building mohonpeak BSP layer
=20=20meta-intel/common: Initial Intel DPDK recipe under recipes-extended

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (2):
=20=20MAINTAINERS: Update maintainers list
=20=20node-state-manager_2.0.0: Fix Bug 245

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

Alex J Lennon (1):
=20=20mono: Modify dllmap patch for libgdi as existing patch breaks with =
Mono git

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

Denys Dmytriyenko (1):
=20=20linux-ti-staging: update to the latest source with new config =
fragments

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Armin Kuster (1):
=20=20lz4: Add self to maintainers list

Corneliu Stoicescu (1):
=20=20oeqa/controllers/beaglebonetarget.py: fix deploy when kernel file is =
a broke

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



