Return-Path: <cliff.brake@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 53CEF65CBD;
	Mon, 20 Jul 2015 20:50:47 +0000 (UTC)
Received: by oige126 with SMTP id e126so116990255oig.0;
	Mon, 20 Jul 2015 13:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=8FBrBMaQqYYJ+6ZYOW+8IKqiGFxK8ZRvK9kVVf5qgEI=;
	b=I3etsUDo8aGYQQDn4+dmTAA7ax/6a1bZZWhIPnErzICgvBTtJlldeFAeztU2LUfXCF
	lbnmgbGG7C3nnVQ0r3Fw2IX4PvlCekVeBkS5A4PCDQGrUPQe1rIjXvszQcyJeGKcL32J
	M7HopGke3Brfgzr/+AJreG6/ef/HkRvpsFyk6LL+srpGjlEvKOeck/crA641YsWfdWM7
	NZaA9gL9tp5Yt3/t1WoQZdS39F78ZuHIuCq050/IEBQNOb5WZlYKt+Wncedl73K+VR6A
	9bYy3ORUebbOHE716ThEPHlD4PziCJUaW5guBzvcnEZisz869ULM4G/LtngURXofvz0i
	hwdw==
X-Received: by 10.107.35.144 with SMTP id j138mr44836341ioj.105.1437425447558; 
	Mon, 20 Jul 2015 13:50:47 -0700 (PDT)
Received: from [127.0.0.1] (cable-pool5-cs-161.doycomm.com. [66.219.182.161])
	by smtp.gmail.com with ESMTPSA id
	q187sm14405927ioe.37.2015.07.20.13.50.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jul 2015 13:50:46 -0700 (PDT)
Date: Mon, 20 Jul 2015 13:50:46 -0700 (PDT)
X-Google-Original-Date: Mon, 20 Jul 2015 20:50:45 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1437425445034.f96be681@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-07-12 until 2015-07-19
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
X-List-Received-Date: Mon, 20 Jul 2015 20:50:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-07-12 until 2015-07-19.  Projects included in this =
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

An=C3=ADbal Lim=C3=B3n (5):
=20=20fetch2/wget.py: Add support of connection cache in checkstatus.
=20=20tests/fetch.py: Add FetchCheckStatusTest tests.
=20=20fetch2/wget.py: checkstatus fix using proxy handler
=20=20tests/fetch.py: FetchCheckStatusTest add cases for ftp and https.
=20=20fetch2/wget.py: checkstatus disable SSL cert validation.

Olof Johansson (1):
=20=20fetch2/sftp: Set BatchMode=3Dyes as argument to sftp

Paul Eggleton (3):
=20=20lib/bb: set up infrastructure for shell message functions
=20=20lib/bb/process: check output of select() before reading extrafiles
=20=20lib/bb: provide mechanism to bypass UI log suppression

Richard Purdie (18):
=20=20prserv/db: Document history modes
=20=20cooker/taskdata: Make NoProvider errors non-fatal to -e/-g options
=20=20data_smart: Defer append/prepend handling
=20=20data_smart: Remove need for update_data calls
=20=20data_smart: Improve override handling
=20=20data_smart: Fix cache clearance problems
=20=20data_smart: Cache overrides and fix data store
=20=20data_smart: Move override handling to getVar
=20=20parse/ast/data_smart: Add parsing flag to getVar/setVar
=20=20data_smart: VariableHistory: Ignore override duplicates and overlap =
with CoW
=20=20data_smart: Seperate out the override cache
=20=20data_smart: Tweak OVERRIDES value cache for performance
=20=20data_smart: Improve override recursion handling
=20=20data_smart: Cache set(self.overrides)
=20=20data_smart: Fix keys() missing overrides
=20=20data_smart: Fix data expansion cache issues
=20=20data_smart: Fix appendVar/prependVar
=20=20tests/data: Add new data tests

Robert Yang (1):
=20=20git.py: create a branch when checkout

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro Hernandez (1):
=20=20opkg-build: Ignore tar error due to hardlinks issue when creating ipk =
files

Amarnath Valluri (1):
=20=20mc: Upgrade to release 4.8.14

Andre McCurdy (3):
=20=20grep: use internal regex library with musl-libc
=20=20gnupg: fix build of GPLv2 version of gnupg with gcc 5
=20=20sstate.bbclass: remove redundant cd and mkdir commands

An=C3=ADbal Lim=C3=B3n (2):
=20=20oe/recipeutils.py: get_recipe_upstream_version returns 1.0 when not =
SRC_URI
=20=20classes/sstate.bbclass: Improve checkstatus using connection cache.

Ash Charles (1):
=20=20python-io: Add runtime dependency on contextlib

Awais Belal (1):
=20=20initrdscripts: handle mmc device as installer medium

Ben Shelton (1):
=20=20create-pull-request: Fix error on 2.0 versions of git

Bian Naimeng (1):
=20=20do_unpack: move qa check of unpack into insane.bbclass

Chen Qi (1):
=20=20systemd: add PACKAGECONFIG for valgrind

Costin Constantin (4):
=20=20oeqa/bbtests: add useful failure messages for all test cases
=20=20oeqa/bblayers.py: add useful failure messages to all test cases
=20=20oeqa/buildoptions: add useful failure messages for all test cases
=20=20oeqa/devtool: add useful failure messages for some test cases

Cristian Iorga (5):
=20=20bluez5: upgrade to 5.32
=20=20harfbuzz: upgrade to 0.9.41
=20=20runqemu-internal: add temporary disk interface to qemuarm64
=20=20bitbake.conf: fix qemu user mode linux for qemuarm64
=20=20qemu: upgrade to 2.4.0-rc0

Jianchuan Wang (1):
=20=20lttng: Fix timer calculation error

Jussi Kukkonen (11):
=20=20xproto: Upgrade 7.0.27 -> 7.0.28
=20=20cogl-1.0: Upgrade 1.18.2 -> 1.20.0
=20=20clutter-1.0: Upgrade 1.20.0 -> 1.22.4
=20=20clutter-gtk-1.0: Upgrade 1.4.4 -> 1.6.2
=20=20intltool: Upgrade 0.50.2 -> 0.51.0
=20=20adwaita-icon-theme: Add new icon theme for GTK+
=20=20gtk+3: Upgrade to 3.16.4
=20=20matchbox-session-sato: set GTK_CSD env var
=20=20sato-icon-theme: Inherit Adwaita, not gnome-icon-theme
=20=20midori: Depend on Adwaita, not gnome-icon-theme
=20=20gtk-icon-utils: Rename, upgrade, add binary

Khem Raj (2):
=20=20gcc-4.9: Upgrade to 4.9.3
=20=20gcc-5: Backport patches for -Wno-narrowing behaviour fixes

Leonardo Sandoval (1):
=20=20buildhistory.bbclass: Check output folder is present before creating =
files-i

Li Wang (2):
=20=20netbase: add rpcbind as an alias to sunrpc
=20=20apr: Fix packet discards HTTP redirect

Li xin (2):
=20=20perf: Modify SPDX_S directory to avoid do_spdx error.
=20=20lighttpd: Fix mod_cgi to avoid it buffers data without bound.

Mariano Lopez (1):
=20=20sanity.bbclass: Check if /tmp is writable

Markus Lehtonen (2):
=20=20combo-layer: only allow fast-forward when pulling
=20=20combo-layer: implement --hard-reset option

Martin Jansa (2):
=20=20mesa: respect MESA_EGL_NO_X11_HEADERS even with x11 in PACKAGECONFIG
=20=20connman-conf: fix SRC_URI_append

Patrick Ohly (1):
=20=20archiver.bbclass: add do_deploy_all_archives

Paul Eggleton (6):
=20=20classes/logging: make shell message functions output to the console
=20=20classes/useradd: don't read bbnote/bbwarn/bbfatal values
=20=20classes/base: fix die() to print the full log
=20=20Use die() or bbfatal_log() where the log should definitely be printed
=20=20classes/logging: allow shell message functions to work in devshell
=20=20lib/oe/recipeutils: fix replace_dir_vars to return the correct =
variables

Petter Mab=C3=A4cker (1):
=20=20kernel-yocto: fix machine_srcrev check in do_patch

Randy MacLeod (1):
=20=20i2c-tools: uprev to 3.1.2

Randy Witt (1):
=20=20python-smartpm: Have native smart use nativepython

Richard Purdie (6):
=20=20lib/oe/recipeutils: Ensure order of data store doesn't influence the =
result
=20=20recipetool/append: Fix selftest failure with multilib
=20=20oeqa/sstatetests: Add NATIVELSB sstate signature equivalence test
=20=20buildtools-tarball: Add inherit toolchain-scripts
=20=20tar: Add symlink to tar from gtar
=20=20dpkg: Fix for Fedora22 and new versions of tar

Robert Yang (21):
=20=20populate_sdk_base.bbclass: don't inherit toolchain-scripts.bbclass
=20=20elfutils 0.163: remove do_configure_prepend
=20=20opkg: remove do_configure_prepend
=20=20glibc-initial: remove invalid sed command
=20=20qemu: remove invalid sed command
=20=20rpm: remove invalid sed command
=20=20mdadm: remove do_configure_prepend
=20=20perl: remove invalid sed command
=20=20python: remove invalid sed command
=20=20python-pygtk: remove invalid sed command
=20=20perf: remove invalid sed command
=20=20cups: remove invalid sed command
=20=20qt4: fixes for sed command
=20=20gcc: remove EXTRA_OECONF_INTERMEDIATE
=20=20git: remove invalid ac_cv_c_c99_format=3Dyes
=20=20glibc: remove invalid ac_cv_path_KSH
=20=20apt: remove invalid ac_cv_glibc_ver
=20=20xserver-xorg: remove invalid ac_cv_file__usr_share_sgml_X11_defs_ent
=20=20dbus-ptest: set INSANE_SKIP for build-deps
=20=20glibc: print PN when bbwarn
=20=20gnu-config: set noexec for do_compile

Ross Burton (16):
=20=20gnome-icon-theme: inherit allarch
=20=20slang: enable native builds
=20=20newt: enable native builds
=20=20systemd: recommend the vconsole setup units
=20=20ptest: add dirs flag to ptest tasks
=20=20boost: add dirs flag to boostconfig task
=20=20python: add explicit directories in py_package_preprocess
=20=20libc-package: don't abuse B to change directory
=20=20kernel: fix path assumptions in tasks
=20=20systemd-compat-units: set S correctly
=20=20opkg-arch-config: set S correctly
=20=20qemuwrapper-cross: set S correctly
=20=20depmodwrapper-cross: set S correctly
=20=20dmidecode: use absolute paths in fixup task
=20=20chkconfig: use explicit directories in obey_variables()
=20=20guile: Add explicit directories to guile_cross_config

Roy Li (1):
=20=20piglit: Fix floating dependency on freeglut

Steffen Pankratz (1):
=20=20libdrm: Upgrade to 2.4.62

Tanu Kaskinen (3):
=20=20speexdsp: initial recipe
=20=20speex: 1.2rc1 -> 1.2rc2
=20=20alsa-plugins, pulseaudio: depend on speexdsp, not speex

Umut Tezduyar Lindskog (1):
=20=20systemd: update the status of configurable root patch

Wenzong Fan (1):
=20=20gettext-minimal-native: use MKIDR_P in Makefile.in.in

Yue Tao (1):
=20=20expect: replace the STAGING_INCDIR with includedir

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Armin Kuster (1):
=20=20nbd: Add new package

Jian Liu (1):
=20=20net-snmp: don't return incompletely parsed varbinds

Li Wang (1):
=20=20inetutils: move daemon servers from bin to sbin directory

Li xin (2):
=20=20postfix: upgrade from 2.11.1 to 3.0.1
=20=20opensaf: Fix warning and add systemd service files.

Richard Purdie (1):
=20=20postfix: Add explict getVar expansion parameter

Roy Li (1):
=20=20inetutils: fix tcpd path in xinetd configuration file

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

Fabio Berton (7):
=20=20chicken: Add native support
=20=20chicken-cross-canadian: Use gcc host compiler
=20=20chicken-cross-canadian: Add chicken-native dependence
=20=20all-chicken-egg-recipes: Add nativesdk support
=20=20chicken-test-image-sdk: Add support to install nativesdk
=20=20chicken-test-image-sdk: Install cross-canadian on host sdk
=20=20core-image-chicken-sdk: Install cross-canadian on host sdk

Otavio Salvador (9):
=20=20chicken: Move common code to a chicken.inc file
=20=20chicken: Add crosssdk support
=20=20chicken: Add nativesdk support
=20=20chicken_install.bbclass: Add flags for crosssdk builds
=20=20chicken_install.bbclass: Add override for nativesdk builds
=20=20chicken_install.bbclass: Use ${prefix} for installation
=20=20scripts/gen-egg-recipes: Update recipes to support SDK development
=20=20chicken-egg-*: Update to support SDK development
=20=20chicken-cross-canadian: Add recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Ann Thornton (1):
=20=20imx-base.inc mxs-base.inc: Add imx MACHINEOVERRIDES

Dominic Sacr=C3=A9 (1):
=20=20linux-imx-rt: Upgrade to 3.14.28-1.0.0 GA

Fabio Estevam (1):
=20=20README: Provide a direct URL link

Gary Thomas (1):
=20=20u-boot-ls1: Fix 'nand' builds

Lauren Post (2):
=20=20weston: Update i.MX6 Vivante GPU to support Wayland 1.8
=20=20weston: Add patch only for i.MX with Vivante GPU

Otavio Salvador (3):
=20=20Drop i.MX31 and i.MX35 support
=20=20linux-fslc (4.1): Bump revision to 95d9e15a
=20=20linux-fslc-mx6 (3.14-1.0.x): Bump revision to 96645772

Ting Liu (13):
=20=20linux-ls1: update to revision f488de6
=20=20u-boot-ls1: merge u-boot-ls1.inc into recipe
=20=20u-boot-ls1: update to revision v2015.01-630-g6ba8eed
=20=20ls1021aqds: remove as it is not supported
=20=20ls1021atwr: update lquart/secure-boot UBOOT_CONFIG
=20=20qemu-fsl: upgrade from v1.7 to v2.2.0
=20=20linux-ls1: package zImage into kernel-image
=20=20cst: update to revision 6f57c86
=20=20rcw: update to revision 426f7a6
=20=20asf: update to revision 62ba10a
=20=20asf: use KBUILD_OUTPUT to point to build-artifacts
=20=20rename ls-base.inc -> qoriq-arm.inc
=20=20layer.conf: include layer-specific bb files

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Dominic Sacr=C3=A9 (1):
=20=20linux-wandboard-rt: Add initial recipe

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

Alex J Lennon (16):
=20=20README: Add contributors section
=20=20mono-4.xx: Clean up build. Add base files for native/target config
=20=20mono-4.xx: Cleanup build. Add version specific includes
=20=20mono-4.xx: Cleanup build. Migrate common configuration vars
=20=20mono-4.xx: Cleanup build. Remove config/functions migrated to includes
=20=20mono: Add support for 4.0.2.5 release
=20=20mono: Remove recipes for mono < 3.12.1
=20=20README: Update to remove references to mono < 3.12.1
=20=20mono-basic: inherit autotools-brokensep
=20=20fsharp: remove old 3.1.1.1
=20=20monotools-server: Fix build failure against recent mono-xsp
=20=20dbus-sharp,taglib-sharp,mono-addins: inherit autotools-brokensep
=20=20mono-upnp: inherit autotools-brokensep
=20=20mono-4.xx: Reintroduce gmcs script
=20=20layer.conf: default to Mono 4.0.2.4
=20=20mono-xsp: Add git recipe

Richard Tollerton (25):
=20=20mono-4.xx.inc: use PARALLEL_MAKEINST=3D"" instead of =
PARALLEL_MAKE=3D""
=20=20libgdiplus-native: depend explicitly on giflib-native
=20=20gtk-sharp-dev: add perl dependency
=20=20libgdiplus: add jpeg, tiff, giflib, libexif dependencies
=20=20mono-basic-4.xx.inc: copy from mono-basic.inc
=20=20mono-basic: add version 4.0
=20=20fsharp_3.1.2.4.bb: add
=20=20fsharp: disable build separation
=20=20fsharp.inc: refactor FILES_*
=20=20mono-xsp-3.x.inc: copy from mono-xsp.inc
=20=20mono-xsp-3.x.inc: updating SRC_URI and LIC_FILES_CHKSUM
=20=20mono-xsp_3.0.11.bb: add
=20=20mono-xsp-3.x.inc: use autogen.sh
=20=20mono.bbclass: add
=20=20dbus-sharp-glib: use mono.bbclass
=20=20dbus-sharp: use mono.bbclass
=20=20fsharp.inc: use mono.bbclass
=20=20mono-addins: use mono.bbclass
=20=20mono-helloworld: use mono.bbclass
=20=20mono-xsp: use mono.bbclass
=20=20mono-basic-4.xx.inc: use mono.bbclass
=20=20gtk-sharp.inc: use mono.bbclass and make some FILES fixes
=20=20gtk-sharp-native: remove mono-native dependency
=20=20gtk-sharp: remove mono-native dependency
=20=20mono.bbclass: set MONO_CFG_DIR

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Jussi Kukkonen (1):
=20=20package_regex.inc: Add rules for clutter recipes

Ross Burton (1):
=20=20maintainers/distro-alias: rename gtk-update-icon-cache to =
gtk-icon-utils

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



