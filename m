Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 382D173CBD;
	Mon, 14 Sep 2015 16:04:10 +0000 (UTC)
Received: by igxx6 with SMTP id x6so85134738igx.1;
	Mon, 14 Sep 2015 09:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=e/3a09gpbKHJ8dxHis/I4JCxhcOpIUeo+R0ZO/WjKIU=;
	b=qjStSH5aoV+oXBSZ1QzhGh+hSpDQTX+r47qIFsS/3jEH30cFvpHz8X+m4kD1CjUeMN
	2AyRN0hM1S1jT8G78KFIinqodTzkf5ehIVD/9SadIuAB/pq+Qz0PiIjuHbPi7WdI2t3T
	GRS5xpyM+xpojb5r+Vu1eofw0PFU1jy+mBUSJRQEN7qRebihJjwV0pjMNX4esO2QQn3C
	WQiGNycbsHvMmCYXgtvTwJALoAjBC6xmMPxRt++elqfl4zzCXC2wgGjATpHtJHMt40is
	C4jUmgXou21Fy/TnG4aFBtQkheo6GDxexVKudkdwAO9xMycqHf4ItluYncPEnA0ClcMj
	27Ww==
X-Received: by 10.50.124.39 with SMTP id mf7mr18525966igb.36.1442246649972;
	Mon, 14 Sep 2015 09:04:09 -0700 (PDT)
Received: from [127.0.0.1] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134])
	by smtp.gmail.com with ESMTPSA id 98sm5068939ioi.22.2015.09.14.09.04.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Sep 2015 09:04:07 -0700 (PDT)
Date: Mon, 14 Sep 2015 09:04:07 -0700 (PDT)
X-Google-Original-Date: Mon, 14 Sep 2015 16:03:49 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1442246629316.ef023784@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-09-06 until 2015-09-13
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
X-List-Received-Date: Mon, 14 Sep 2015 16:04:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-09-06 until 2015-09-13.  Projects included in this =
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

Belen Barros Pena (4):
=20=20toaster: remove unnecessary white space
=20=20toaster: fix project names in latest builds
=20=20toaster: replace ETA with % of tasks done
=20=20toaster: Changes to navigation

Ed Bartosh (1):
=20=20toaster: increase waiting time

Richard Purdie (7):
=20=20toastergui: Add missing files from =
1c2f6b9b7b9e700146944b9d6d2114e0d014ee81
=20=20server/process: Handle SIGTERM more gracefully
=20=20utils: Add signal_on_parent_exit() function
=20=20prserv: SIGTERM and deamonization fixes
=20=20bitbake-worker: Simple code cleanup
=20=20bitbake-worker: Handle SIGKILL of parent gracefully
=20=20bitbake-worker: Ensure pipe closure doesn't crash before killpg()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro del Castillo (1):
=20=20adt-installer: upgrade to opkg 0.3.0

Alex Franco (1):
=20=20scripts: Move BUILDDIR chmod fix after checks in oe-setup-builddir

Alexander Kanavin (11):
=20=20libyaml: add a recipe from meta-oe
=20=20ruby: add a recipe from meta-ruby
=20=20libsecret: add a recipe from meta-gnome
=20=20libwebp: add a recipe from meta-oe
=20=20p11-kit: add a recipe from meta-oe
=20=20gcr: add a recipe from meta-gnome
=20=20libwnck3: add a recipe from meta-gnome
=20=20gnome-desktop3: add a recipe from meta-gnome
=20=20gsettings-desktop-schemas: add a recipe from meta-gnome
=20=20pcmanfm: add an icon theme dependency
=20=20gnome-icon-theme: remove the recipe

Armin Kuster (1):
=20=20bind: update to 9.10.2-p4

Brendan Le Foll (4):
=20=20toolchain-shar-extract.sh: ensure extensible SDK install path obeys =
restrict
=20=20toolchain-shar-extract.sh: better default install path for extensible =
SDK
=20=20toolchain-shar-extract.sh: explain why we cannot use sudo in =
extensible SDK
=20=20devtool: add package plugin that lets you create package via devtool

Bruce Ashfield (1):
=20=20linux-yocto/3.14: fix edgerouter (octeon) build

Chen Qi (1):
=20=20bind: fix compile failure when building path is long

Christopher Larson (1):
=20=20sanity.bbclass: remove abspath warning for SSTATE_MIRRORS

Cristian Iorga (1):
=20=20connman: upgrade to 1.30

Cristina Agurida (1):
=20=20oeqa/parselogs: Updated log error whitelist.

Ed Bartosh (3):
=20=20wic: round variable before converting to int
=20=20wic-image-minimal: add wic image recipe and .wks
=20=20devtool: make plugin_init optional

Jagadeesh Krishnanjanappa (1):
=20=20binutils: Add thunderx support to gas

Kai Kang (1):
=20=20screen: backport to fix build error

Khem Raj (19):
=20=20busybox: Enable getopt applet
=20=20rootfs: Do not uninstall update-rc.d
=20=20rootfs: Conditionally uninstall update-rc.d
=20=20systemd: Upgrade 219 -> 225
=20=20systemd: Implement OE-Specific systemd-sysv-install
=20=20irda-utils: Weak Define the build TARGETS
=20=20slang: Fix namespace conflict vis-a-vis posix_close
=20=20sudo: Include sys/types.h for id_t definition
=20=20man: Use -DSYSV when builing for linux
=20=20minicom: Fix build with musl
=20=20bdwgc: Include signal.h instead of hard asm/sigcontext.h
=20=20ccache: Dont add LDFLAGS to compiler flags
=20=20latencytop: Fix build with clang
=20=20alsa-tools: Fix compiling with clang
=20=20kexec-tools: Pass -r directly to linker
=20=20puzzles: Fix build with clang
=20=20sudo: Disable rsize_t deliberately
=20=20mdadm: Fix bugs exposed by clang
=20=20directfb: Avoid using VLAs and printf formats

Leonardo Sandoval (5):
=20=20devtool: add upgrade feature
=20=20devtool: Create a single file for the build devtool feature
=20=20devtool: Allow disabling make parallelism on build command
=20=20buildstats: Outputs 'task recipe elapsed-time' from each buildstats' =
recipe
=20=20runqemu: Define OECORE_MACHINE_SYSROOT on setup_sysroot

Mariano Lopez (1):
=20=20testimage: handle SIGTERM to conclude runqemu

Markus Lehtonen (7):
=20=20extrernalsrc.bbclass: treat kernel meta like local source
=20=20kernel-yocto.bbclass: do_kernel_metadata depends on do_unpack
=20=20kernel.bbclass: do not mv/link sources when externalsrc enabled
=20=20devtool: modify: enable do_shared_workdir for kernel
=20=20devtool: update-recipe: better 'auto' mode
=20=20externalsrc.bbclass: better filtering of cleandirs
=20=20devtool: update-recipe: get srcuri parameters with decodeurl()

Martin Jansa (3):
=20=20rootfs.py: Allow to override postinst-intercepts location
=20=20postinst_intercept: allow to pass variables with spaces
=20=20rootfs.py: show intercept script output in log.do_rootfs

Nathan Rossi (2):
=20=20u-boot.inc: Add U-Boot ELF install and deploy
=20=20u-boot.inc: Add host compiler flags and openssl-native dependency

Patrick Ohly (6):
=20=20Revert "boot-directdisk.bbclass: use rootfs UUID by default"
=20=20initramfs-framework: support rootflags and rootfstype boot parameter
=20=20initramfs-framework: support ro boot parameter
=20=20initramfs-framework: support init boot parameter
=20=20initramfs-framework: support dropping into shell on failure
=20=20runqemu: avoid image file name mismatches

Paul Eggleton (7):
=20=20classes/populate_sdk_ext: avoid poky-specific buildtools naming
=20=20scriptutils: split out simple fetching function from recipetool
=20=20devtool: improve modified file preservation to handle directory =
structures
=20=20devtool: update-recipe: add a warning when recipe is inside the =
workspace
=20=20devtool: fix running from a different directory
=20=20classes/sstate: break out function to get sstate manifest filename
=20=20build-compare: add support for examining deb and ipk packages

Qi.Chen@windriver.com (7):
=20=20populate_sdk_ext: install the latest buildtools-tarball
=20=20copy_buildsystem: make sure bitbake directory is copied
=20=20populate_sdk_ext: consider custom configuration in local.conf
=20=20populate_sdk_ext: don't remove the native qemu dependencies
=20=20Extensible SDK: allow for installation without preparing build system
=20=20oe-publish-sdk: add script
=20=20devtool: add mechanism for updating extensible SDK

Richard Purdie (11):
=20=20qemu: Add fixes for smc91c11 qemu segfaults on arm
=20=20qemurunner: Drop error to a warning to improve user feedback
=20=20qemurunner: Ensure runqemu doesn't survive SIGKILL
=20=20qemurunner: Fix killpg pid usage
=20=20oeqa/sstatettests: Improve output of assert
=20=20Revert "rootfs: Do not uninstall update-rc.d"
=20=20oeqa: Test failure/cleanup improvements
=20=20testimage: Fix SDK extraction error handling
=20=20populate_sdk_base: Fix aarch64 OLDEST_KERNEL sdk issues
=20=20oeqa/targetbuild: Ensure we run gnu-configize so config files are up =
to date
=20=20testimage: Handle core-image-lsb-sdk qemumips test restriction

Robert Yang (2):
=20=20package_manager.py: search provides when not found by pkgname
=20=20gcc-5.2: remake 0040-nativesdk-gcc-support.patch

Ross Burton (6):
=20=20ptest: use fakeroot for do_install_ptest_base
=20=20oeqa/runtime/date: stop systemd-timesyncd during test
=20=20ptest: fix file ownerships in ${PTEST_PATH}
=20=20sstate: only fetch remote signatures if verification is enabled
=20=20Revert "ptest: use fakeroot for do_install_ptest_base"
=20=20meta: Fix Upstream-Status statements

Roy Li (3):
=20=20packagegroup-core-nfs: provide the nfs-client IMAGE_FEATURES
=20=20perf: fix the install-python_ext
=20=20gcc: reformat 0063-nativesdk-gcc-support.patch

Wenzong Fan (2):
=20=20gnu-efi: Make setjmp.S portable to ARM
=20=20bjam-native: build and install bjam.debug

Yuqing Zhu (2):
=20=20gstreamer1.0: Fix sticky events haven't been sent out when active =
track reac
=20=20gstreamer1.0: Fix QoS/lateness checking if subclass implements =
prepare/prepa

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Alejandro Joya (1):
=20=20toybox: upgrade to 0.6.0

Alexander Kanavin (3):
=20=20libnotify3: remove the recipe
=20=20nautilus3: update the checksums to match the .xz compressed tarball
=20=20libunique: add a recipe from oe-core

Andreas M=C3=BCller (5):
=20=20fontforge: update to 20150824
=20=20rodent-icon-theme: add RPROVIDES/RREPLACE/RCONFLICTS for =
xfce4-icon-theme
=20=20xfce4-notifyd: fix build for libnotify 0.7.x
=20=20gnome-disk-utility: fix build for libnotify 0.7.x
=20=20gnome-bluetooth: fix build with libnotify >=3D 0.7.0

Bian Naimeng (1):
=20=20libgxim: inherit gettext to fix build error in a non-gplv3 build.

Christopher Larson (1):
=20=20iw: remove, this is now in oe-core

Fabio Berton (1):
=20=20python-pyroute2: Add recipe

Jagadeesh Krishnanjanappa (2):
=20=20mime-construct: add new recipe
=20=20lftp: add new recipe

Kai Kang (2):
=20=20autofs: 5.1.0 -> 5.1.1
=20=20atftp: build with gcc 5.2

Khem Raj (2):
=20=20plymouth: Add recipe
=20=20QWTv1.0: Add qwt license version 1.0

Li xin (3):
=20=20postfix: 3.0.1 -> 3.0.2
=20=20drbd: upgrade 8.4.4 -> 8.9.3
=20=20net-snmp: upgrade 5.7.2.1 -> 5.7.3

Martin Jansa (1):
=20=20xfce4-icon-theme: remove

Mike Looijmans (1):
=20=20python-pyopenssl: Inherit setuptools to fix failing install

Roy Li (5):
=20=20collectd: fix a floating dependence on libvirt
=20=20lvm2: enable lvmetad
=20=20squid: upgrade to 3.5.7
=20=20libnetfilter-conntrack: upgrade to 1.0.4
=20=20conntrack-tools: upgrade to 1.4.2

Soren Brinkmann (1):
=20=20Add analyze-suspend

Stefan M=C3=BCller-Klieser (1):
=20=20vorbis-tools: remove unnecessary options

Tim Orling (1):
=20=20python-pyparted: update to 3.10.5

Zhu Yanjun (1):
=20=20ypbind-mt: add status command for initscript

leimaohui (2):
=20=20ptpd: 2.3.1-rc2->2.3.1
=20=20rp-pppoe:3.8->3.11

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (15):
=20=20external-linaro-toolchain: use relative symlink to libc.so
=20=20cryptodev-module: update for changed variable syntax
=20=20openssl: update local patches against 1.0.2d version
=20=20external-linaro-connect: change dependency on -cross recipe to avoid =
warning
=20=20qtwebkit: update bbappend to be version agnostic
=20=20arago-prefs: drop some old outdated preferences
=20=20external-linaro-toolchain: adjust -cross deps to avoid warning and =
race
=20=20packagegroup-arago-test: package vpe-tests again, issue resolved in =
meta-ti
=20=20switch-config: update to the latest version
=20=20packagegroup-arago-test: include kselftests kernel self-test suite
=20=20ltp-ddt: remove temporary patch to disable IPC tests
=20=20omapdrmtest: bump srcrev, update patch to init variable
=20=20arago.conf: bump version, update feed url, drop old workaround
=20=20Revert "HACK: disable CMEM and DSP tools until IPC gets merged to 4.1"
=20=20img-pvr-sdk: change compatibility filter from dra7xx to omap-a15

Gou, Hongmei (1):
=20=20img-pvr-sdk: Bump SRCREV

Jacob Stiffler (9):
=20=20matrix-gui: workaround for GUI apps with weston
=20=20clocl: Add opencl kernel compiler.
=20=20opencl-monitor: Add opencl monitor firmware
=20=20ocl-gl-headers: Add GL headers required for opencl.
=20=20opencl: Add the opencl library
=20=20opencl-examples: Add the opencl examples.
=20=20packagegroup-arago-tisdk-matrix: Add 3d demos for omap-a15.
=20=20packagegroup-arago-tisdk-graphics-sdk-host: Add omapdrm-pvr-src for =
omap-a15
=20=20ti-tisdk-makefile: Add omapdrm-pvr makefile fragment

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

Ilkka Myller (4):
=20=20Renamed nodejs.inc to nodejs0.inc
=20=20Updated README.md
=20=202015-09-08, Version 4.0.0 (Stable) Release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Jonathan Liu (3):
=20=20qttranslations: package translations for qtwebsockets
=20=20packagegroup-qt5-toolchain-target: add qttranslations-qtwebsockets
=20=20classes: qmake5: move QMAKE_MKSPEC_PATH variables to qmake5_paths

Julien Brianceau \(jbriance\) (1):
=20=20qt3d: Remove GFDL-1.3 & DIGIA-TPLA-2.4 from LICENSE list

Khem Raj (1):
=20=20qtbase: Fix prefix substitution from OE to QT variable

Martin Jansa (1):
=20=20qtwebengine: fix build with newer glibc-2.22

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

Denys Dmytriyenko (13):
=20=20keystone: with the switch to latest u-boot, update UBI volume name
=20=20amx3-cm3: update PM firmware, still version 191
=20=20linux-ti-staging: update with latest connectivity changes
=20=20boot-monitor: also package resulting skern file into /boot
=20=20libdrm: remove unused patch
=20=20linux-ti-staging: for keystone RDEPENDS on boot-monitor
=20=20linux-ti-staging: update with latest platform fixes
=20=20u-boot-ti-staging: update with latest fixes
=20=20boot-monitor: adjust resulting skern name to be SOC specific, not =
machine sp
=20=20vpe-tests: resolve conflict with vpdma-fw
=20=20kselftests: ipc tests are machine-specific, don't blindly put in main =
RDEPEN
=20=20u-boot-ti-staging: update with WAKEUP2 touchscreen fix
=20=20linux-ti-staging: update with latest fixes

Gou, Hongmei (4):
=20=20omap5-sgx-ddk-um-linux: Bump SRCREV for am4/k4.1 branch
=20=20omapdrm-pvr: Bump SRCREV for am4/k4.1 branch
=20=20ti-osal: add the latest version of 1.24.00.09
=20=20ti-codec-engine: update to version 3.24.00.08

Jacob Stiffler (3):
=20=20cmem-mod: update for changed module autoload syntax.
=20=20debugss-module-drv: Fix build issue with fido
=20=20gdbserverproxy-module-drv: Fix build issue with fido

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (5):
=20=20qemu: Add patch for ZynqMP
=20=20linux-zynqmp-mainline: Drop custom ZynqMP kernel recipe
=20=20machine-xilinx-default.inc: Add variable for default u-boot
=20=20ep108-zynqmp: Use mainline u-boot by default
=20=20u-boot-zynqmp-mainline: Drop this recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Alexander Kanavin (2):
=20=20maintainers: add maintainer info for new webkitgtk, epiphany and =
their depen
=20=20maintainers.inc: remove packages that are no longer in oe-core

Bruce Ashfield (1):
=20=20bsps: update 3.14 SRCREVs

Khem Raj (1):
=20=20poky-tiny.conf: Require utmpx, its needed for busybox

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



