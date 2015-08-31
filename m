Return-Path: <cliff.brake@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6948476D6C;
	Mon, 31 Aug 2015 15:01:49 +0000 (UTC)
Received: by iog7 with SMTP id 7so37431182iog.2;
	Mon, 31 Aug 2015 08:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=AzMr5GH46wjn0ZLOUePxJRHwL2LgteJwtPkek0N2a1w=;
	b=Rt2siM22uGghNTEwVxPWvQmqa5FelSKRUc6M9py2mqgfnZd5X99ARsqpkyPXdnLFbr
	03pkS5RMW00118PiT+8o9ihVUmw4d602UocJJzVvdGD0EnE7sBpxtHqD+X3tySGbBCPy
	2SA4XEm9HNsTL9f41i8RV5nuyw/AhFqZOe6bkATz2dDXsuEUMHYS/CIqemcBq20tARuF
	wxqsH0f53R4cJ9J1xKHiHbe1FZBoZfTnXNLbM6Qw9R9raKhQ89nmGHKxPc/daPnIcDxT
	RDcprzgvUPsWC52bLzF0EiY5e0ld0jN2gAEnTKUCsldvuwFeWRpCp6zcBtAdG35nuQOK
	AN/g==
X-Received: by 10.107.28.144 with SMTP id c138mr8295417ioc.93.1441033305552;
	Mon, 31 Aug 2015 08:01:45 -0700 (PDT)
Received: from [127.0.0.1] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134])
	by smtp.gmail.com with ESMTPSA id o5sm9658677igv.3.2015.08.31.08.01.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Aug 2015 08:01:44 -0700 (PDT)
Date: Mon, 31 Aug 2015 08:01:44 -0700 (PDT)
X-Google-Original-Date: Mon, 31 Aug 2015 15:01:42 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1441033302710.9a293739@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-08-23 until 2015-08-30
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
X-List-Received-Date: Mon, 31 Aug 2015 15:01:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-08-23 until 2015-08-30.  Projects included in this =
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

Belen Barros Pena (6):
=20=20toastergui: remove old screenshots
=20=20toastergui: change image in landing page
=20=20toaster: new Toaster image
=20=20toaster: fix show / hide columns in all builds table
=20=20toaster: adjust spacing in project pages
=20=20toaster: fix global navigation

Bian Naimeng (1):
=20=20toaster: Support environments which have proxies set

David Reyna (1):
=20=20toaster: update directory tree expansion

Michael Wood (1):
=20=20toastergui: Add frontend javascript unit tests

Paul Eggleton (2):
=20=20lib/bb/main: avoid importing all server/UI modules on every execution
=20=20lib/bb/cooker: add interrupted flag to BuildCompleted event

Sujith Haridasan (2):
=20=20toaster: Fix extra checkbox in most recently built recipes section
=20=20toaster: Remove Log column from All builds page

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Ajay M (1):
=20=20parted: set VERSION number same as recipe's version

Alex Franco (2):
=20=20Empty image: package list splitting and iteration
=20=20Empty image: filesystem allocation

Alexander Kanavin (7):
=20=20classes/gnomebase: change tarball compression to xz
=20=20harfbuzz: enable icu feature
=20=20classes/cmake: add arch conversion routine
=20=20glib: add a warning suppression patch to glib
=20=20iso-codes: add a recipe from meta-oe
=20=20libnotify: update to version 0.7.6
=20=20jpeg: update to version 9a

An=C3=ADbal Lim=C3=B3n (3):
=20=20systemd: Increase devices timeout in QEMU machines to avoid failures =
on seri
=20=20qemu-native: Enable temporary debug info as default.
=20=20runqemu-internal: Fixes unary operator expected in new =
TCPSERIAL_PORTNUM

Bruce Ashfield (9):
=20=20linux-yocto/4.1: fix qemuarm preempt-rt configuration
=20=20linux-yocto/3.19/4.1: add coretemp to intel-common-drivers
=20=20linux-yocto/4.1: quark configuration and thermal support
=20=20linux-yocto/3.14: cleanups and gcc5 ARM build fixes
=20=20linux-yocto/4.1: update to v4.1.6 and v4.1.6-rt5
=20=20linux-yocto/4.1: enable DRM_CIRRUS_QEMU and EXT4_USE_FOR_EXT23
=20=20linux-yocto/4.1: CIRRUS config and quark thermal support
=20=20linux-yocto-dev: update to 4.2-rc
=20=20linux-yocto/3.14/4.1: fix ARM boot with gcc 5.x

Carlos Rafael Giani (2):
=20=20gstreamer1.0-plugins: Ensure the native OE orcc is used
=20=20gstreamer1.0-plugins-*: Remove unused GSTREAMER_1_0_ORC variable

Christopher Larson (8):
=20=20bitbake.conf: unexport SHELL
=20=20bitbake.conf: set USE_NLS based on DISTRO_FEATURES
=20=20bitbake.conf: set PATCHRESOLVE to noop by default
=20=20image.bbclass: re-run do_rootfs when feature packages change
=20=20update-rc.d.bbclass: explicitly dep on initscripts
=20=20nativesdk.bbclass: set sbindir to bindir
=20=20libunwind: always depend on libatomics-ops
=20=20libatomic-ops: move to recipes-support, fix recipe name

Costin Constantin (2):
=20=20oeqa/oetest.py: add better package search for hasPackage()
=20=20runtime/syslog.py: fix syslog test crash

Cristian Iorga (1):
=20=20harfbuzz: upgrade to 1.0.2

Dmitry Eremin-Solenikov (2):
=20=20tune-octeon.inc: correct packaging suffix
=20=20tune-octeon.inc: add BASE_LIB settings

Ed Bartosh (7):
=20=20devtool: make add_md5 a public API
=20=20devtool: implement build-image plugin
=20=20wic: remove undescore from function name
=20=20wic: rename variable
=20=20wic: deferred call of hlp.get_wic_plugins_help()
=20=20image.py: set bitbake variable ROOTFS_SIZE
=20=20image.py: add script output to the rootfs log

Juro Bystricky (5):
=20=20tclibc-baremetal.inc: baremetal specific distro policy file
=20=20gcc-cross-canadian.inc: overrides for libc-baremetal
=20=20gcc-cross.inc: overrides for libc-baremetal
=20=20libgcc-common.inc: overrides for libc-baremetal
=20=20cross-canadian.bbclass: support for TCLIBC=3D"baremetal"

Jussi Kukkonen (4):
=20=20openssh: build regression test binaries
=20=20libinput: Upgrade 0.18.0 -> 0.21.0
=20=20lsof: Upgrade 4.88 -> 4.89
=20=20lsbinitscripts: Upgrade 9.63 -> 9.64

Khem Raj (14):
=20=20kernel-arch: Force BFD kernel when using gcc for linking
=20=20alsa-lib: Lift the limitation to use gcc only cross compiler
=20=20sysvinit: Fix makefile bug found with clang
=20=20json-c: Include math_compat.c for NAN/INF values
=20=20libvorbis: Update libvorbis_1.3.4.bb -> libvorbis_1.3.5.bb
=20=20psplash: Turn psplash_fb_plot_pixel() into static inline
=20=20mdadm: Upgrade mdadm_3.3.2.bb -> mdadm_3.3.4.bb
=20=20bitbake.conf: Define fallback DISTRO_NAME
=20=20systemd: Remove exporting special CPP
=20=20liburcu: Fix atomic function parameter types in calls
=20=20diffstat: Add TOOLCHAIN_OPTIONS to Linker calls
=20=20core-image-minimal: Add 4M extra space when using systemd
=20=20systemd: Cache/define tool paths for target
=20=20python-distribute, python-setuptools: Migrate to good old =
python-setuptools

Mariano Lopez (4):
=20=20testimage: Run commands in target and host when test fails
=20=20dump: Created new classes for dump host and target
=20=20dump: allow to have datastore vars on dump commands
=20=20oetest: Fix regresion when testing real hardware

Maxin B. John (1):
=20=20man-pages: update to 4.02

Mihaly Varga (3):
=20=20wic: Add plugin for hybrid iso image
=20=20wic: add mkhybridiso kickstart file
=20=20wic: Test creation of iso image

Paul Eggleton (15):
=20=20scripts/create-recipe: drop
=20=20classes/insane: fix QA check message referring to nativesdk
=20=20oe-selftest: replace assertTrue(False, ...) with fail(...)
=20=20hello-mod: drop PV and PR
=20=20service: tweak example recipe
=20=20packagegroup-qt*-toolchain-target: fix hard dependency on phonon =
library
=20=20lib/oe/patch: handle patches that delete files with older git
=20=20classes/buildhistory: ensure we push when "no changes" commits are =
made
=20=20classes/buildhistory: exclude . in file listings
=20=20classes/buildhistory: indent recently added function consistently
=20=20classes/buildhistory: tweak buildhistory_list_pkg_files
=20=20classes/buildhistory: fix permissions in package file listing
=20=20classes/buildhistory: handle additional files at recipe level
=20=20classes/buildhistory: include metadata revisions in commit message
=20=20classes/buildhistory: add build result to commit message

Randy MacLeod (1):
=20=20gcc-source: exlude from world

Randy Witt (10):
=20=20qemurunner.py: Move some class variables that should only be local
=20=20qemurunner: Make create_socket() return data and use exceptions
=20=20qemurunner: Use two serial ports and log console with a thread
=20=20runqemu: Add a tcpserial option
=20=20qemurunner: Shut down logging thread successfully when test fails
=20=20qemurunner: In the logging thread retry on EAGAIN, EWOULDBLOCK
=20=20runqemu-internal: Make sure tcpserial is always last
=20=20qemurunner: Don't loop on EWOULDBLOCK in logging thread.
=20=20sysvinit-inittab: Run ttys on ttys that don't have tty in the name
=20=20qemuarm64.conf: Make the second serial console /dev/hvc0

Reinette Chatre (1):
=20=20xf86-video-intel: enable xvmc feature by default and fix dependency

Richard Purdie (5):
=20=20layer.conf: Increase layer version to 6
=20=20oeqa: Optimise sstate tests
=20=20package_*.bbclass: Ensure OVERRIDES doesn't change sstate signature
=20=20layer.conf: Add several allarch dependency exclusions
=20=20os-release: Exclude DATETIME from sstate signature

Robert Yang (5):
=20=20glibc: use cross-rpcgen to replace host's rpcgen
=20=20gnupg: 2.1.6 -> 2.1.7
=20=20gnu-efi: 3.0.2 -> 3.0.3
=20=20oprofile: 1.0.0 -> 1.1.0
=20=20btrfs-tools: 4.1.1 -> 4.1.2

Ross Burton (9):
=20=20multilib: let pkg-config find architecture-independent .pc files
=20=20json-glib: enable native builds
=20=20gnome: move introspection options to gnomebase
=20=20json-glib: inherit gnomebase instead of gnome
=20=20bind: remove dependency on bind in bind-dev
=20=20oeqa/runtime/multilib: fix and improve multilib test
=20=20xf86-video-intel: fix missing fstat() prototype
=20=20byacc: fix compilation on Ubuntu 14.04
=20=20oeqa/runtime/multilib: add test for libc

Roy Li (1):
=20=20autotools.bbclass: Allow dependency tracking option to be overridden

S=C3=A9bastien Mennetrier (1):
=20=20package_rpm.bbclass : escape "%" in files and directories name

Wenzong Fan (2):
=20=20swig: add package 3.0.6
=20=20libcap-ng: add package 0.7.7

Yen-Chin Lee (1):
=20=20perl: Undefine finitel for uclibc

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Alejandro del Castillo (1):
=20=20python-pyinotify: add recipe

Andreas Baak (1):
=20=20epeg: Move tool out of efl + update to latest version

Andreas M=C3=BCller (17):
=20=20xfce4-panel: build gtk3 libraries and ship them in an extra package
=20=20xfce4-pulseaudio-plugin: initial add 0.2.3
=20=20packagegroup-xfce-extended: add xfce4-pulseaudio-plugin
=20=20xfdesktop: update to 4.12.3
=20=20xfce4-cpufreq-plugin: update to 1.1.2
=20=20xfce4-weather-plugin: update to 0.8.6
=20=20xfce4-notes-plugin: update to 1.8.1
=20=20glibmm: update to 2.44.0
=20=20mm-common: update to 0.9.8
=20=20cairomm: update to 1.11.2
=20=20pangomm: update to 2.36.0
=20=20gparted: update to 0.23.0
=20=20rodent-icon-theme: initial add 5.0
=20=20networkmanager: update to 1.0.4
=20=20network-manager-applet: update to 1.0.4
=20=20pavucontrol: update to 3.0
=20=20xfce4-settings: get option to hide mousepointer for (touch) input =
devices ba

Armin Kuster (1):
=20=20ipmiutil: add new package

Bian Naimeng (8):
=20=20waf-samba: add new class
=20=20ctdb: add new recipe
=20=20libtdb: add new recipe
=20=20libtevent: add new recipe
=20=20talloc: upgrade to 2.1.1
=20=20libldb: add new recipe
=20=20samba: upgrade to 4.1.12
=20=20smbnetfs: using PKG_CHECK_MODULES to found headers and libraries for =
smbclie

Jagadeesh Krishnanjanappa (1):
=20=20scsirastools: add new recipe

Koen Kooi (1):
=20=20python-pyyaml 3.10: unbreak versioning

Li xin (8):
=20=20takao-fonts: upgrade 003.02.01 -> 003.03.01
=20=20gradm: upgrade 3.0 -> 3.1
=20=20luajit: upgrade 2.0.3 -> 2.0.4
=20=20pcsc-lite: upgrade 1.8.6 -> 1.8.13
=20=20python-pip: upgrade 1.5.6 -> 7.1.0
=20=20python-pyopenssl: upgrade 0.13 -> 0.15.1
=20=20python-lxml: upgrade 3.2.5 -> 3.4.4
=20=20libjs-jquery: upgrade 1.7.1 -> 1.7.2

Martin Jansa (1):
=20=20dhcp: fix parsing warning

Philip Balister (1):
=20=20python-pyro4: Add new recipe.

Ross Burton (1):
=20=20recipes: use class-native instead of deprecated virtclass-native.

Roy Li (10):
=20=20numactl: fix the ptest building
=20=20apache: upgrade to 2.4.16
=20=20python-paste: create recipe
=20=20collectd: upgrade to 5.5.0
=20=20sdparm: upgrade to 1.09
=20=20libestr: upgrade to 0.1.10
=20=20liblogging: add the recipe
=20=20rsyslog: upgrade to 7.6.1
=20=20gd: upgrade to 2.1.1
=20=20imagemagick: upgrade 6.9.1 -> 6.9.2

Stefan M=C3=BCller-Klieser (1):
=20=20vorbis-tools: add new recipe

Tim Orling (13):
=20=20libcapture-tiny-perl: update to 0.30
=20=20libclass-method-modifiers-perl: add 2.11 recipe
=20=20libsub-exporter-progressive-perl: add 0.001011 recipe
=20=20libdevel-globaldestruction-perl: add 0.13 recipe
=20=20libencode-perl: add 2.76 recipe
=20=20libencode-locale-perl: add 1.05 recipe
=20=20libextutils-parsexs-perl: add 3.24 recipe
=20=20libimport-into-perl: add 1.002004 recipe
=20=20libio-stringy-perl: add 2.111 recipe
=20=20libstrictures-perl: add 2.000001 recipe
=20=20librole-tiny-perl: add 2.000001 recipe
=20=20libmoo-perl: add 2.000002 recipe
=20=20librole-tiny-perl: add 2.000001 recipe

Yi Zhao (3):
=20=20sgpio: fix PN -> BPN for multilib
=20=20vboxguestdrivers: upgrade 4.3.22 -> 4.3.30
=20=20uim: use _remove operator to drop silent rules

leimaohui (1):
=20=20python-requests: upgrade 2.5.1->2.7.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20packagegroup-qt5: Separate out qtwebkit into a var

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (8):
=20=20omapdrmtest: fix use of deprecated libav/ffmpeg API
=20=20packagegroup-arago-test: re-enable omapdrmtest
=20=20qtbase: drop font workaround, add libqtfreetype workaround
=20=20packagegroup-*-qte: qt3d-tools no longer exists
=20=20packagegroup-*-graphics: re-enable omapdrm-pvr driver
=20=20nativesdk-qtbase: locally apply path length increase patch for now
=20=20weston: don't make fbdev compositor default when enabled
=20=20arago.conf: enable EGL support in Weston

Gou, Hongmei (5):
=20=20arago-prefs: use libgbm and omap5-sgx-ddk-um-linux (SGX user module) =
for AM3
=20=20img-pvr-sdk: update source of Imagination demo binaries for AM3 and =
AM4
=20=20packagegroup-arago-tisdk-graphics*: use libgbm, SGX kernel module and =
user m
=20=20qtbase: add dependency on libdrm for AM3 and AM4 which now use =
null_window D
=20=20matrix-gui-3d-demos: update demo dependency for AM3 and AM4

Karthik Ramanan (3):
=20=20gstreamer1.0-plugins-vpe: Bug fixes
=20=20glsdk-example-apps: Add support for mediabus formats
=20=20omapconf: update to version 1.72

Yaniv Mahani (1):
=20=20bt-firmware: update bts install path

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

Nicolas Ferre (3):
=20=20README: update to match master branch

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
=20=20mesa-demos: Add Wayland and OpenVG support

Otavio Salvador (3):
=20=20gtk+3: Add CFLAGS overrides for Wayland use
=20=20glmark: Drop drm-gl support for all i.MX6 SoCs with GPU
=20=20kernel-module-mcc: move to kernel-modules subdir

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Ian Coolidge (3):
=20=20linux-boundary (3.10.53): Bump SRCREV to eee2a48
=20=20nitrogen6x.conf: add imx6q-nitrogen6x-hdmi-input.dtb to =
KERNEL_DEVICETREE
=20=20linux-boundary (3.10.53): sync defconfig

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

Anuj Mittal (3):
=20=20meta-isg: dpdk: move patch from inc to bb
=20=20meta-isg: dpdk: intel-corei7-64 as COMPATIBLE_MACHINE
=20=20meta-isg: enable dpdk v2.1.0 for grantley

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

Alex J Lennon (4):
=20=20mono: add support for 4.0.4.1
=20=20README: update testing of 4.0.4.1 on qemux86
=20=20mono: add support for 4.2.0.179
=20=20README: update testing of 4.2.0.179 on qemux86

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

Ilkka Myller (1):
=20=202015-08-25 io.js v3.2.0 Release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Andreas M=C3=BCller (1):
=20=20add libx11-locale to qtbase-plugins RRECOMMENDS

Belisko Marek (1):
=20=20qt5.inc: Fix packaging of qtquickcontrols

Denys Dmytriyenko (1):
=20=20qtbase_git: ensure fonts go into own subdir by creating it first

Jonathan Liu (3):
=20=20qtbase: add PACKAGECONFIG for libproxy
=20=20populate_sdk_qt5.bbclass: set paths correctly in qt.conf
=20=20qtbase: replace host paths with qmake built-in properties in =
qconfig.pri

Khem Raj (4):
=20=20README: Correct syntax for git send-email
=20=20qtbase: Fix build with clang
=20=20recipes, conf: Direct QT_GIT to use github mirrors
=20=20qtbase: Package the 3rd party libs if built

Martin Jansa (3):
=20=20qt5-plugin-generic-vboxtouch: add -Wno-narrowing to fix build with =
gcc-5.2
=20=20qtquick1: allow to disable qtwebkit support
=20=20qtbase: refresh patches

Otavio Salvador (1):
=20=20Merge pull request #48 from devcurmudgeon/devcurmudgeon-patch-1

Paul Sherwood (1):
=20=20gitorious no longer exists: mention gitlab instead

Samuli Piippo (1):
=20=20qtbase: PACKAGECONFIGs for libinput

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

Anand Balagopalakrishnan (2):
=20=20omapdrm-pvr: recipe update for SGX KM on 4.1 kernel
=20=20omap5-sgx-ddk-um-linux: update SGX user mode binaries to latest =
version

Denys Dmytriyenko (8):
=20=20linux-ti-staging: bump rev, add interim GFX patches for J6/AM5
=20=20u-boot-ti-staging: bump rev with dra7 fixes
=20=20omapdrm-pvr/omap5-sgx-ddk-um-linux: update due to branch shuffle
=20=20machines: bump max_leb_cnt to fit larger images
=20=20linux-ti-staging: bump rev, update J6/AM5 GFX patches to rev3
=20=20u-boot-ti-staging: bump rev
=20=20omapdrm-pvr: bump rev to match v3 of corresponding kernel patches
=20=20linux-ti-staging: bump rev, update GFX patches w/ AM3/AM4 support

Gou, Hongmei (5):
=20=20am437x-evm: bump max_leb_cnt to fit larger image
=20=20omapdrm-pvr: add AM3 and AM4 which use null_window DRM
=20=20omap5-sgx-ddk-um-linux: add AM3 and AM4, and pvr-init to =
initialization
=20=20libdrm: add ti33x and ti43x to COMPATIBLE_MACHINE
=20=20am335x-evm: bump max_leb_cnt to fit larger image

Jacob Stiffler (1):
=20=20cmem: Bump SRCREV to fix build with GCC 4.9 and Linux 4.1

Sam Nelson (3):
=20=20linux-keystone: update to new version 3.10.72_15.08
=20=20u-boot-keystone: Update to new version 2013_01_15.07_01
=20=20boot-monitor: Update to new version 15.07

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Paul Eggleton (2):
=20=20README.hardware: drop mention of binary-only drivers
=20=20yocto-bsp / yocto-layer: fix template recipes

Richard Purdie (1):
=20=20linux-yocto-3.14: Update to latest revisions

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



