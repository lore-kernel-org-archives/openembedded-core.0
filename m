Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 07A0F75C1B;
	Wed,  1 Jul 2015 14:42:53 +0000 (UTC)
Received: by iebmu5 with SMTP id mu5so35957110ieb.1;
	Wed, 01 Jul 2015 07:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=XVyC/kr5BGXy+9bjuULdH9QVZ7KNDg8QjLtlqOkEAGQ=;
	b=QUgpFKYanLXi5c4zSZpEBzP6Tbg9XWCZD9P1XBOp1q7nA770DU7k26BTcYPaJ+DgsL
	H3B+9fT3kdVRfe9b82bbYkLQIIqogFibXgl2PBKby1ghGQ/Q54JE1K+QS5dvlPreM/+J
	0VaLMZAq+JiuQLkhDeNFhHH4sE7sNfd0w3zqS1s9wyCzipfAmhs7Gb2GHwedcadbuN/a
	37miUjnHjhnAPBq1WCPoh3wKr+S3Xt/1M26pqmUUvNXnjdjKkVarUWd3v+BqQ1Z4cKnt
	/by0/KOCuEBeMgvkT2LqP2ztq2PSg/2Agno/YqoUUPMBB4A0IkBJtBdJETOvxzIPYICn
	hKig==
X-Received: by 10.107.15.153 with SMTP id 25mr40233963iop.44.1435761773466;
	Wed, 01 Jul 2015 07:42:53 -0700 (PDT)
Received: from [127.0.0.1] (cable-pool5-cs-161.doycomm.com. [66.219.182.161])
	by mx.google.com with ESMTPSA id
	qs10sm1775138igb.14.2015.07.01.07.42.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jul 2015 07:42:52 -0700 (PDT)
Date: Wed, 01 Jul 2015 07:42:52 -0700 (PDT)
X-Google-Original-Date: Wed, 01 Jul 2015 14:42:50 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1435761770880.08ba8f7c@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-06-21 until 2015-06-28
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
X-List-Received-Date: Wed, 01 Jul 2015 14:42:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-06-21 until 2015-06-28.  Projects included in this =
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
git://gitorious.org/schnitzeltony-oe-meta/meta-gumstix-community.git
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

Alexandru DAMIAN (16):
=20=20toastergui: fix angular error
=20=20toaster: improve the buildenvironment API
=20=20toastergui: enable strict variable checking
=20=20toaster: fixing undefined variables
=20=20toaster: remove MANAGED references
=20=20toaster: remove BuildRequest references
=20=20toaster: refactor the builds pages
=20=20toaster: fill in build data from buildrequest
=20=20toaster: fixes after replacing BuildRequest with Build
=20=20toaster: add django-aggregate-if
=20=20toaster: bring django-aggregate-if into the project
=20=20toaster: refactor build model
=20=20toastergui: select project types
=20=20toaster: delete multiple builds
=20=20toasterui: verify variable before usage
=20=20toasterui: fixes after html5 compliance testing

Michael Wood (7):
=20=20toaster: Enable toastertable cache
=20=20toaster: toastertable Pass up the kwargs for setup_filter
=20=20toaster: table.js fix filter visual indicator and interaction
=20=20toaster: Restore 'in project' filters to main tables
=20=20toaster: bldcontrol Ignore toasterconf files in own directories
=20=20toaster: split orm app into it's own module and app
=20=20toaster: Add url pattern for backward compatibility

Richard Purdie (5):
=20=20cooker: Fire BuildCompleted before finishing the command
=20=20event: Handle recursive events and the data store better
=20=20fetch/perforce: Fix single file checkouts
=20=20codeparser: Allow empty functions
=20=20codeparser: Add repr() methods

Robert Yang (1):
=20=20bitbake: fetch2/hg.py: fix unpack error and mirror tarball

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro Hernandez (2):
=20=20distutils: regenerate pyc files after being modified by sed
=20=20python3-ctypes: Fix cross compilation for arm targets

Andre McCurdy (5):
=20=20security_flags.inc: remove duplicated over-rides
=20=20pbzip2: add initial recipe, pbzip2 v1.1.12
=20=20image_types.bbclass: use pbzip2 for images requiring bz2 compression
=20=20populate_sdk_base.bbclass: use pbzip2 to compress SDK tarfiles
=20=20gstreamer1.0-plugins-bad.inc: remove duplicate bzip2 dependency

Andreas M=C3=BCller (1):
=20=20libsdl2: PACKAGECONFIGize

Andreas Oberritter (1):
=20=20gdb: Add missing runtime dependency for python option

An=C3=ADbal Lim=C3=B3n (4):
=20=20oe/utils.py: Fix thread leakage in ThreadPool
=20=20oe/utils.py: Add support for init/end helper functions in =
ThreadWorker.
=20=20oe/rootfs.py: DpkgRootfs/OpkgRootfs add support for dependency =
handling in p
=20=20run-postinsts: Fix ipk package management detection

Armin Kuster (1):
=20=20neon: fix compat issues with gnutls 4.3

Chen Qi (1):
=20=20kmod: upgrade to 21

Christopher Larson (3):
=20=20oe.recipeutils: fix line.split error in bbappend_recipe
=20=20recipetool.append: use argparse types for validation
=20=20recipetool: add appendsrcfile(s) sub-commands

Cristian Iorga (3):
=20=20openssl: fix building on x32 systems
=20=20linux-firmware: upgrade to commit =
3161bfa479d5e9ed4f46b57df9bcecbbc4f8eb3c
=20=20bluez5: upgrade to 5.31

Ed Bartosh (26):
=20=20image-live: Set syslinux timeout to 5s
=20=20initramfs-live-install: Add blkid to initramfs
=20=20busybox: Enable UUID-related options
=20=20init-install-efi: Implement UUID support
=20=20init-install: Use GPT table with GRUB 2
=20=20init-install: Implement UUID support
=20=20init-install: Specify filesystem type in parted command line
=20=20init-install: Specify partition name in parted command line
=20=20init-install: code cleanup: Replace tabs with spaces
=20=20init-install: code cleanup: replace /dev/$device -> $device
=20=20init-install: Properly delete partition table
=20=20oe-selftest: wic: Fix testcase
=20=20wic: Document creation of empty partition
=20=20wic: Code cleanup: bad-classmethod-argument
=20=20wic: Add missing docstrings to plugin classes
=20=20wic: Integrated plugin docstrings into 'wic help plugins' output
=20=20wic: Return error code when wic fails to invoke command
=20=20wic: oe-selftest: Add 3 tests of 'wic help' command
=20=20wic: code cleanup: superfluous-parens
=20=20wic: removed unused command line option
=20=20wic: Add --compress-with command line option
=20=20wic: Add new argument to wic_create function
=20=20wic: Add new argument to direct plugin
=20=20wic: Implement image compressing
=20=20wic: Make code more pythonic
=20=20wic: oe-selftest: Test image compressing

Henning Heinold (1):
=20=20python-2.7/3.4-manifest.inc: add missing dependencies for =
python-netserver

Jagadeesh Krishnanjanappa (4):
=20=20runqemu: fix MACHINE being detected as qemuarm for qemuarm64 kernel =
image
=20=20runqemu-internal: add support to boot arm64 qemu target via NFS
=20=20runqemu-script: define console for qemuarm NFS booting
=20=20runqemu-internal: set mutual exclusiveness for serial and nographic =
options

Joshua Lock (1):
=20=20distutils-common-base: add to, don't set, FILES_${PN}

Jussi Kukkonen (7):
=20=20gtk+: Upgrade 2.24.27 -> 2.24.28
=20=20dbus: Upgrade 1.8.16 -> 1.8.18
=20=20dbus-test: Upgrade 1.8.10 -> 1.8.18
=20=20freetype: Upgrade 2.5.5 -> 2.6
=20=20mesa: Upgrade 10.5.6 -> 10.5.8
=20=20xorg-xserver: Upgrade 1.17.1 -> 1.17.2
=20=20xf86-video-vesa: Upgrade 2.3.3 -> 2.3.4

Kai Kang (3):
=20=20cups: upgrade from 2.0.2 to 2.0.3
=20=20qt4-4.8.7: restore arm64 patches which are dropped by mistake
=20=20qemu: backport patches to fix CVE issues

Leonardo Sandoval (4):
=20=20rpm: Fix CVE-2014-8118
=20=20rpm: Fix CVE-2013-6435
=20=20terminal.py: Allow devshell/menuconfig on recent gnome-terminal
=20=20buildhistory.bbclass: Create a files-in-<pkg>.txt containg recipe's =
pkg file

Lucian Musat (1):
=20=20oeqa/parselogs: Fixed a problem in parselogs

Mariano Lopez (1):
=20=20copyleft_filter.bbclass: Allow to filter on name

Mark Hatle (2):
=20=20rpm: Fix lua 'print' statement capture
=20=20rpm: Rebrand rpm custom macro paths to be distro specific

Maxin B. John (1):
=20=20rt-tests: bump version to v0.92

Moritz Blume (1):
=20=20cmake: Upgrade 2.8.12.2 -> 3.2.2

Nathan Lynch (1):
=20=20lttng-modules: drop makefile patch

Otavio Salvador (1):
=20=20wpa-supplicant: Revert "Make SystemD D-Bus config conditional"

Patrick Ohly (2):
=20=20logging.bbclass: avoid bashism in bbdebug()
=20=20insane.bbclass: fix false negative in build-deps QA check

Philip Balister (2):
=20=20packagegroup-core-sdk.bb: Drop distcc from the core-sdk.
=20=20packagegroup-core-tools-profile.bb: Remove oprofile.

Ramax Lo (1):
=20=20uclibc: Cope with other mips32 variants

Randy MacLeod (1):
=20=20tiff: Update to 4.0.4

Richard Purdie (15):
=20=20meta: Add explict getVar param for (non) expansion
=20=20staging: Strip files in sysroot
=20=20toolchain-scrpts: Fix sitecache issues with multilib
=20=20meta-environment: Ensure we append to the default =
TOOLCHAIN_NEED_CONFIGSITE_
=20=20apt-native: Drop obsolete symlinks
=20=20lib/oe/patch: Fix git patch application for source in subdirectory
=20=20lib/devtool/standard: Fix patch cleanup
=20=20oeqa/selftest/recipetool: Fix appendfile_binary test on opensuse131
=20=20testimage: Handle ipk/deb packaging format tests correctly
=20=20pbzip2: Fix native dependency on bzip2-native
=20=20subversion: Fix subversion-native on Fedora22
=20=20oeqa/recipetool: Fix symlink resolution
=20=20oeqa/parselogs: Whitelist qemuarm64 runtime errors
=20=20testimage: Don't test xorg/vnc on qemuarm64
=20=20oeqa/parselogs: Whitelist qemumips64 runtime error

Robert Yang (5):
=20=20bluez5: remove alsa from PACKAGECONFIG
=20=20libpcap: add a dummy PACKAGECONFIG for bluez5
=20=20base.class: warn for invalid PACKAGECONFIG
=20=20toolchain-scripts: fix for multilib
=20=20sanity.bbclass: check /bin/sh is dash or bash

Ross Burton (5):
=20=20Revert "distrodata: Remove unnecessary include of package_regex.inc"
=20=20neard: remove unused service file
=20=20bluez5: fix lib/libexecdir confusion
=20=20weston: fix libdir/libexecdir confusion
=20=20oe-selftest: timestamp the test runs

Roy Li (4):
=20=20babeltrace: Fix invalid pointer free with trace collection
=20=20unzip: fix four CVE defects
=20=20piglit: fix floating dependence on freeglut
=20=20quota: fix quota do_install errors

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Adam YH Lee (1):
=20=20nm-applet: Install glib schema

Andre McCurdy (4):
=20=20libupnp: add initial recipe, libupnp v1.6.19
=20=20minini: add initial recipe, minIni v1.2.b
=20=20llvm3.3: fix error output from configure if CFLAGS is set
=20=20minini: fix build when SECURITY_CFLAGS includes -pie -fpie

Andrea Adami (1):
=20=20utash_1.9.7: move recipe to its respective directory

Armin Kuster (1):
=20=20redis: update to version 3.0.2

Bian Naimeng (2):
=20=20imsettings: add new recipe
=20=20multipath-tools: fix build warning

Jackie Huang (1):
=20=20libcanberra: upgrade and add packageconfig for gstreamer and gtk

Kang Kai (1):
=20=20php: upgrade from 5.5.24 to 5.5.26

Li xin (1):
=20=20lvm2: add systemd support

Martin Jansa (1):
=20=20efl, elementary: upgrade to 1.14.1

Roy Li (3):
=20=20postgresql: upgrade to 9.4.2
=20=20phpmyadmin: upgrade 4.4.9
=20=20php: fix native php when it is from sstate

Yi Zhao (1):
=20=20meta-oe: fix the install dir for udev rules and files

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

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

Cristian Iorga (1):
=20=20linux-yocto_3.19: include NFC hardware support for intel-core* machine

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

Ilkka Myller (2):
=20=202015.06.18, Version 0.10.39 (Maintenance)
=20=202015-06-23 io.js v2.3.1 Release

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

Martin Jansa (2):
=20=20linux-hp-tenderloin: don't copy System.map

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Jussi Kukkonen (2):
=20=20distro/package_regex.inc: Fix dbus version pattern
=20=20maintainers.inc: reassign GTK+ and X maintainership

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



