Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4DCD06E688;
	Mon,  8 Feb 2016 16:50:37 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id b35so120793759qge.0;
	Mon, 08 Feb 2016 08:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=RQhSW/OxHhABY7QLd3UDiRE99tWj5GRMZuBxbNRCSOM=;
	b=CgvZZphOs5Lrxsy/F6FTRa6y30YJfZGLNlPmkxLUDAfwWhgJ4sqvTYNCiD78JS8xym
	liEkQv4pc/3M9t4P8fjfp6oKQubbUoAa1WEopvBcV21yGeJUfwCPkGyuw7+2H5yD2dMl
	KWa1qYBztSqmYCHS30H/aYUmz2tIC/FYdBUzm67YTPVBFVUYUB3Nm2x3FEA0mU/jWo8P
	ouQLzazWyXl4VY2OlAv2Ft0r3IAXYRA4atUVQeSqa+goHjKrJ2rI0QQ1vuNXAFf8Xi+R
	aT9kbX2QZTmGyd5ngViuzfNegLOg9gsYEcARy8HmC2vJc/1JlNQes/MCbL3Q1+RsG55E
	6kjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:mime-version:message-id:from:to:subject
	:content-type:content-transfer-encoding;
	bh=RQhSW/OxHhABY7QLd3UDiRE99tWj5GRMZuBxbNRCSOM=;
	b=aPEan03pcYD14Refxs9c+uH1dDqd9M6s3zXwhSabB3sPycq1RlIADiJB4pZS6hORnt
	Re7AJ1EmHO/qwENJJKc0uKyT1OUfZ3TGMARoXV/pPQIfHiixIZJdNY1tn93cRCC4MqvM
	ZLne/LiHhKp4lJdNaOQRiPQRxQR9R6EHp4+TTZg4qVaaeuKWO8I6EE7BPF3LUYxd8eg0
	3JehGls6KrzfhUdvPA4AvJSBXmxHGQGY3GbnHh2KEIOPk2IRCZDT7bGea3JsqKP4pryu
	/3JIq7vxlAx7POz/bW6bXokzifmoCt5dlavVcqzKSnsmjgm9bbL56uyx61fJf6Dtfnpt
	Dd/g==
X-Gm-Message-State: AG10YORW8ABKVpn40c0t0iVYRr9W56EK5bOWaj36cgywHZRcReYrkeCweflUe+4CKogE6w==
X-Received: by 10.140.225.134 with SMTP id v128mr16535774qhb.18.1454950238375; 
	Mon, 08 Feb 2016 08:50:38 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134])
	by smtp.gmail.com with ESMTPSA id j7sm14207227qgd.2.2016.02.08.08.50.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Feb 2016 08:50:36 -0800 (PST)
Date: Mon, 08 Feb 2016 08:50:36 -0800 (PST)
X-Google-Original-Date: Mon, 08 Feb 2016 16:50:34 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1454950234991.0034e83a@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2016-01-31 until 2016-02-07
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
X-List-Received-Date: Mon, 08 Feb 2016 16:50:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2016-01-31 until 2016-02-07.  Projects included in this =
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

Diego Santa Cruz (3):
=20=20bitbake: prserv: -wal and -shm sqlite lost when daemonizing
=20=20bitbake: prserv: SIGTERM handling hung process
=20=20bitbake: prserv: do not clear umask when daemonizing

Ed Bartosh (1):
=20=20cooker: shutdown cooker parser on shutdown

Elliot Smith (1):
=20=20toaster: reinstate ID on edit columns button

Felipe F. Tonello (1):
=20=20fetch2/gitsm: Fix when repository change submodules

Phil Blundell (1):
=20=20cooker, bitbake-worker: Fix spelling of "received"

Richard Purdie (8):
=20=20knotty: Don't show errors for universe provider issues
=20=20cooker: Only start as many parse threads as we need
=20=20data_smart: Add missing expand parameter to getVar call
=20=20lib/bb: Add expansion parameter to getVarFlag
=20=20codeparser: Improve handling of data.expand() dependencies
=20=20parse/ast: Mark anonymous functions as python functions
=20=20fetch2/osc: Remove hardcoded url
=20=20fetch2/osc: Clean up old variable syntax

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andre McCurdy (9):
=20=20liboil: drop recipe from oe-core
=20=20machine/include: drop tune-cortexm*.inc and tune-cortexr4.inc
=20=20gcc-configure-common.inc: drop --enable-target-optspace from configure
=20=20libxsettings-client: drop obsolete disable_Os_option.patch
=20=20gnutls.inc: minor formatting improvements
=20=20gnutls.inc: add gmp to DEPENDS
=20=20gnutls.inc: allow libidn support to be controlled via PACKAGECONFIG
=20=20gnutls: update 3.4.8 -> 3.4.9
=20=20openssl.inc: drop obsolete mtx-1 and mtx-2 over-rides

Andrew Shadura (2):
=20=20dbus: use ${systemd_system_unitdir}
=20=20dbus: add user sessions support

Chen Qi (1):
=20=20copy_buildsystem: add ability to exclude layers

Dominique Hunziker (1):
=20=20python-distutils: add missing dependency on python-email

Elliot Smith (2):
=20=20toaster.bbclass: attach image file scan postfunc to do_image_complete
=20=20toaster.bbclass: reinstate scan for artifacts in the sdk directory

Ioan-Adrian Ratiu (2):
=20=20Revert "kernel/kernel-arch: Explicitly mapping between i386/x86_64 =
and x86 f
=20=20package_manager.py: fix python indentation bug (opkg)

Jens Rehsack (1):
=20=20cross-localedef-native: add ABI breaking glibc patch

Kai Kang (1):
=20=20docbook-xsl-stylesheets: create a link for easy refer

Khem Raj (8):
=20=20pth: Remove dead code
=20=20libtool-cross: Unset pre|post dep objects
=20=20db: Use cross libtool
=20=20libnss-mdns: Check for nss.h before using
=20=20boost: Fix build on soft-float ABI arm systems
=20=20nss-myhostname: Fix build on musl
=20=20local.conf.sample: Remove trailing whitespaces
=20=20local.conf.sample.extended: Document HOW-TO enable systemd or busbox =
for ini

Maciej Borzecki (1):
=20=20wic: default to empty bootloader config

Markus Lehtonen (1):
=20=20ncurses: use closing curly brackets in FILES_${PN}-tools variable

Maxin B. John (4):
=20=20Revert "matchbox-keyboard: export GTK_IM_MODULE_FILE location"
=20=20gtk-immodules-cache.bbclass: fix immodules-cache path
=20=20formfactor: add machconfig for qemumips64
=20=20linux-firmware: update to latest revision 52442afee

Mihaly Varga (1):
=20=20wic: isoimage-isohybrid: check for syslinux-native

Mike Crowe (2):
=20=20openssl: Explicitly set EXTRA_OEMAKE as required
=20=20pciutils: Explicitly set EXTRA_OEMAKE as required

Pascal Bach (1):
=20=20documentation.conf: align the documentation for DEBUG_OPTIMIZATION =
and FULL_

Randy Witt (6):
=20=20populate_sdk_ext: Add SSTATE_MIRRORS to config blacklist
=20=20copy_buildsystem.py: Pass the nativelsb argument to =
gen-lockedsig-cache
=20=20toolchain-scripts.bbclass: Use PYTHONPATH instead of PYTHONHOME
=20=20populate_sdk_ext: Don't set sdk_update_targets in the config
=20=20populate_sdk_ext: Add support for a "minimal" type
=20=20populate_sdk_ext: Make populate_sdk_ext depend on sdk_extra_conf

Richard Purdie (15):
=20=20libical: Work around hardcoded paths in pkgconfig file
=20=20busybox/gtk/perl/base-passwd: Ensure data is correctly expanded
=20=20package.bbclass: Add data expansion to do_split_packages()
=20=20sstate: Fix SSTATE_SWSPEC only used by populate_lic tasks
=20=20classes/lib: Add expand parameter to getVarFlag
=20=20gtk+3: Tweak getVar to use True, not 1
=20=20util-linux: Change ALTERNATIVE_PRIORITY above busybox
=20=20lttng-tools: Fix ptest installed la files
=20=20insane: Fix populate_sysroot sanity test path
=20=20nativesdk: Set PKG_CONFIG_SYSTEM_ variables
=20=20e2fsprogs: Ensure we use the right mke2fs.conf when restoring from =
sstate
=20=20bitbake.conf/native/nativesdk: Set PKG_CONFIG_SYSTEM_ at top level
=20=20scripts/devtool: Add getVarFlag expand argument
=20=20patchelf: Add patch to handle large files
=20=20uninative: Improve error handling

Ross Burton (20):
=20=20directfb: use Yocto source mirrors for SRC_URI
=20=20remove-libtool: add new class
=20=20libnl: package the libnl-cli modules in libnl-cli
=20=20p11-kit: fix module packaging
=20=20python3: set INSANE_SKIP as libpython3.so is a trampoline library
=20=20insane: add test for -dev packaging containing real libraries
=20=20piglit: don't use /tmp to write generated sources to
=20=20p11-kit: fix packaging warnings
=20=20python-pycurl: remove unnecessary exports
=20=20meta: add ASSUME_PROVIDED dependency on wget-native for http fetches
=20=20i2c-tools: point SRC_URI at Yocto source mirrors
=20=20license.bbclass: add LICENSE_CREATE_PACKAGE to perform_packagecopy =
vardeps
=20=20syslinux: remove LDFLAGS manipulation
=20=20libffi: ensure sysroot paths are not in libffi.pc
=20=20libffi: move from recipes-gnome to recipes-support
=20=20socat: upgrade to 1.7.3.1
=20=20pango: merge bb and inc
=20=20pango: unset LDFLAGS when building gen_all_unicode
=20=20gtk-theme-torturer: remove from oe-core
=20=20gnome-mime-data: remove

Zhixiong Chi (1):
=20=20mktemp: lower the priority of standalone mktemp package

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andre McCurdy (2):
=20=20gst-plugins-base: drop obsolete dependency on liboil
=20=20liboil: import liboil_0.3.17 recipe from oe-core

Andreas M=C3=BCller (4):
=20=20gvfs: disable build of documentation to fix build in some =
envirionments
=20=20frame: initial add 2.5.0
=20=20grail: initial add 3.1.0
=20=20geis: initial add 2.2.17

Armin Kuster (1):
=20=20numactl: update to 2.0.11

Bob Ham (4):
=20=20illume-keyboards-shr: mark as having broken "make clean"
=20=20s3c24xx-gpio: mark as having broken "make clean"
=20=20s3c64xx-gpio: mark as having broken "make clean"
=20=20wmiconfig: mark as having broken "make clean"

Bruno Vernay (1):
=20=20openldap: improve packaging of OpenLDAP modules

Denys Dmytriyenko (1):
=20=20memtester: upgrade 4.1.3 -> 4.3.0

Derek Straka (3):
=20=20nginx: update to 1.9.9
=20=20php: check for existance of directory before 'rmdir' in =
do_install_append_cl
=20=20php: update to 5.6.17 and 5.5.31

Kai Kang (1):
=20=20atop: add recipe

Khem Raj (3):
=20=20lvm2: Portable fixes for fixing compile with musl
=20=20fbset: Fix out of tree builds ( S !=3D B )
=20=20polkit: Fix build with musl

Koen Kooi (1):
=20=20various: delete leftovers from qt4 recipes

Li xin (1):
=20=20networkmanager: add PACKAGECONFIG for qt4-x11-free

Liu Jian (1):
=20=20phpmyadmin: CVE-2015-8669

Martin Jansa (1):
=20=20webkit-efl: fix build with newer CMake 3.4 from oe-core

Robert Yang (1):
=20=20scsirastools: remove inherit autotools_stage

Roy Li (1):
=20=20libx86-1: port a patch to make it work

Sven Ebenfeld (21):
=20=20python(3)-lxml: 3.4.4 -> 3.5.0
=20=20python(3)-feedformatter: add recipes
=20=20add pypi3 bbclass to make python3 recipe creation easier as well
=20=20python-six: 1.9.0 -> 1.10.0 and add python3-recipe
=20=20python-dateutil: 1.5 -> 2.4.2 and add python3 recipe
=20=20python(3)-itsdangerous: add recipes
=20=20python(3)-markupsafe: add recipes
=20=20python(3)-passlib: add recipes
=20=20python-requests: 2.7.0 -> 2.9.1 and add python3 recipe
=20=20python(3)-redis: add recipes
=20=20python(3)-werkzeug: add recipe
=20=20python(3)-pymisp: add recipes
=20=20python-jinja2: 2.7.3 -> 2.8 and add python3 recipe
=20=20python(3)-pymongo: add recipes
=20=20python-certifi: 14.05.14 -> 2015.11.20.1 and add python3 recipe
=20=20python3-tornado: add recipe
=20=20python(3)-xlrd: add recipes
=20=20python(3)-whoosh: add recipes
=20=20python(3)-flask: add recipes
=20=20python(3)-flask-login: add recipes
=20=20python(3)-flask-pymongo: add recipes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (2):
=20=20angstrom-feed-configs: fix build from scratch
=20=20angstrom v2015.12: unblacklist ffmpeg

Stefan Agner (1):
=20=20angstrom-feed-configs: add non-thumb package arch

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (6):
=20=20arago-core-tisdk-image.inc: only pull graphics when "sgx" feature is =
enabled
=20=20branding-core.inc: disable "sgx" in preparation for DDK 1.14 merge
=20=20tisdk-image: add packaging of skern and k2-fw-initrd to =
prebuilt-images/
=20=20cryptodev-tests: don't use STAGING_KERNEL_DIR, fix re-packaging in =
multi-mac
=20=20layer.conf: gstreamer-plugins-bad is machine-specific, causing Qt5 =
modules r
=20=20cryptodev-tests: this time actually change the right file, duh

Gou, Hongmei (1):
=20=20arago.conf: enable gstreamer for qtmultimedia PACKAGECONFIG

Jacob Stiffler (28):
=20=20gstreamer1.0-plugins-hevc: Bump SRCREV for long clip decoding fix
=20=20matrix-gui-crypto-demos: Add ti-crypto-examples for keystone
=20=20matrix-gui-mc-demos: split each demo into individual packages
=20=20packagegroup-arago-tisdk-matrix: Fix for matrix-gui-mc-demos split
=20=20qt-opencv-opencl-opengl-multithreaded: Add version 1.3.3
=20=20arago-source-ipk: Enable qt-opencv-opencl-opengl-multithreaded-src
=20=20matrix-gui-apps-git: Bump SRCREV for multiple fixes
=20=20matrix-gui-video-analytics-demos: Add demo and submenu
=20=20packagegroup-arago-tisdk-multimedia*: Add =
qt-opencv-opencl-opengl-multithrea
=20=20packagegroup-arago-tisdk-matrix: Add video analytics demo
=20=20ti-tisdk-makefile: Add video analytics target
=20=20kmscube: ti43x: workaround HDMI disaply underrun issue
=20=20packagegroup-arago-tisdk-crypto: Add cryptodev and examples for =
keystone
=20=20ipsecmgr: Bump SRCREV to port to 4.1 kernel
=20=20packagegroup-arago-base-tisdk-server-extra: Re-enable keystone LLDs
=20=20packagegroup-arago-test-addons: Re-enable keystone LLDs and tests
=20=20tisdk-server-rootfs-image: Add test packagegroups
=20=20arago-source-ipk: Enable ipsecmgr-mod-src
=20=20packagegroup-arago-tisdk-addons-sdk-host: Add ipsecmgr-mod-src to SDK
=20=20ti-tisdk-makefile: Add ipsecmgr-mod target
=20=20weston-conf: Add recipe for weston configuration files
=20=20weston-conf: ti43x: Limit resolution to prevent HDMI display underrun
=20=20ti-tisdk-setup: Updates for k2g-evm
=20=20packagegroup-arago-tisdk-addons: Add debug tools such as gdb
=20=20packagegroup-arago-tisdk-addons: Add ti-ipc-rtos-fw
=20=20packagegroup-arago-tisdk-addons-sdk-target: k2hk-evm: Add =
aif2-lld-staticdev
=20=20ti-tisdk-makefile: Add extra device trees for ti43x and dra7xx
=20=20tisdk-server-rootfs-image, packagegroup-arago-test-addons: Remove gdb

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Jason Plum (2):
=20=20Firefox ESR update to 38.6
=20=20Firefox: remove unneeded freetype-2.6.patch

Otavio Salvador (1):
=20=20Merge pull request #4 from WarheadsSE/firefox-38.6.0esr

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

Jianxun Zhang (1):
=20=20efilinux: update 1.0 -> 1.1

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
=20=202015-12-04, Version 0.10.41 (Maintenance)
=20=202015-11-25 Version 0.12.8 (LTS) Release
=20=202015-12-04, Version 0.12.9 (Stable)
=20=20Mark Node.js v0.12 as LTS release

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

Bob Ham (6):
=20=20shr-image: Start graphical environment by default
=20=20formfactor: Add machconfig for i9300
=20=20linux-samsung-i9300: quieten excessive kernel output
=20=20linux-samsung-i9300: fix compilation with GCC 5
=20=20cornucopia: inherit from autotools-brokensep to fix Vala builds
=20=20i9300: don't use metadata checksums in ext4 image

Martin Jansa (2):
=20=20openmoocow: inherit pkgconfig

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (2):
=20=20linux-ti-staging: update to 4.1.17
=20=20netapi: disable debian naming for consistency

Jacob Stiffler (7):
=20=20linux: cmem: Update reserved CMEM regions
=20=20conf: machine: am57xx-evm, dra7xx-evm: Increase max_leb_cnt
=20=20netapi: Use INC_PR
=20=20netapi: Only build binaries relevent to the machine
=20=20dsptop: Bump SRCREV to the latest
=20=20temperature-module-drv: Smart Reflex Sub-System (SRSS) module driver
=20=20linux-ti-staging: Update to include uio device tree entries

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

An=C3=ADbal Lim=C3=B3n (1):
=20=20maintainers.inc: Set me as Maintainer of QEMU.

Khem Raj (3):
=20=20poky-tiny: Use musl for default system C library
=20=20local.conf.sample: Remove trailing whitespaces
=20=20local.conf.sample.extended: Document HOW-TO enable systemd or busbox =
for ini

Maxin B. John (1):
=20=20formfactor: add machconfig for Beaglebone

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



