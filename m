Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0D3C3609B2;
	Thu, 21 May 2015 15:12:05 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so12707933igb.0;
	Thu, 21 May 2015 08:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=qZIUP1/PjYUIO2h0vWnj70lGMTGQMtK5Jyw+rdhQjlQ=;
	b=VXJZFFKfNbwrCCdmo0kSW46dYCMHTqgvNoVfvguGViGGVCOBrJmVLbiuWJiKTGia/j
	vkV5KBXsWljfwbQCU5nKqzcbQcBv7So0Pc6tNTlosnnDi1ce0yY/QSHh5ZnRn+ZoA8rM
	3e/DhWvpAj1Q3u93pK+dlMkXrdmxuzHa9rU7Fkdx0/vzHQeZHuXNICSqEjpKupz9Bsd+
	xCQqbHewYlduTULgaIorfo876ph7SJqbtD/C2qWi6e6wY2FTJRJLKTA0rbAcVysSJH5j
	V2/i4zimtNbDEcOrvaLIcTpXG0i4w7MkSD+chD+DaEqWIwjKOM/ehRPRNGwLH+jfPFNC
	aNug==
X-Received: by 10.50.138.70 with SMTP id qo6mr5441652igb.15.1432221126841;
	Thu, 21 May 2015 08:12:06 -0700 (PDT)
Received: from [127.0.0.1] ([66.219.186.215])
	by mx.google.com with ESMTPSA id j84sm5554301ioo.3.2015.05.21.08.12.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 May 2015 08:12:05 -0700 (PDT)
Date: Thu, 21 May 2015 08:12:05 -0700 (PDT)
X-Google-Original-Date: Thu, 21 May 2015 15:12:01 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1432221121233.f25c0add@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-05-10 until 2015-05-17
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
X-List-Received-Date: Thu, 21 May 2015 15:12:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-05-10 until 2015-05-17.  Projects included in this =
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

Alexander Kanevskiy (1):
=20=20toaster: clear up toaster shutdown for mac osx

Alexandru DAMIAN (7):
=20=20toasterui: URL refactoring
=20=20toaster: adding art missing from Bootstrap
=20=20toastergui: fix whitespace after URL
=20=20toastergui: removing unused views
=20=20toaster: fix html5 compliance
=20=20toaster/contrib: adding TTS squashed patch
=20=20toastergui: tables updates for HTML5 compliance

Belen Barros Pena (1):
=20=20toastergui: change the import layer action help text

Daniel McGregor (1):
=20=20fetch/hg: support submodules

Ed Bartosh (5):
=20=20toastergui: decrease load time for configuration page
=20=20toaster: Make toaster script working in zsh
=20=20toaster: Code cleanup: indent
=20=20toaster: fix typo in format string
=20=20toastergui: Consider task name when restarting a build

Jason Wessel (1):
=20=20fetch2: Allow git to use a different CA Bundle with private keys

Liam R. Howlett (2):
=20=20fetch2: Add BB_ALLOWED_NETWORKS support
=20=20fetch2: Allow GIT_SMART_HTTP to be passed through

Mariano Lopez (1):
=20=20bitbake: fetch2/git: Add URL when latest_revision generates an =
exception.

Michael Wood (4):
=20=20toaster: Remove old bldviewer application
=20=20toaster: managedcontextprocessor requires Project imported
=20=20toaster: Add toaster table widget
=20=20toaster: Port All recipes, layers and machines to ToasterTables

Mihail Stanciu (1):
=20=20toaster: <Add class id to a few columns>

Paul Eggleton (2):
=20=20fetch2/git: ensure the unpacked origin remote points upstream
=20=20tests/fetch: ensure fetch tests preserve current dir

Richard Purdie (6):
=20=20runqueue: Handle cases where siginfo is now a parameter to the =
hashvadlidate
=20=20BBHandler: Error for incomplete function definitions
=20=20tests/parse: Add very basic start of parse tests
=20=20fetch2: Improve mirror building function error handling
=20=20tests/fetch: Add mirror of mirror tests
=20=20tests/parse: Add file missing from previous commit

Scott Rifenbark (2):
=20=20bitbake-user-manual-metadata.xml: Added two new varflag descriptions
=20=20bitbake-user-manual-metadata.xml: Alphabetized varflag list.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro Hernandez (1):
=20=20python3: Upgrade from 3.4.2 to 3.4.3

Alexandre Belloni (1):
=20=20wic: remove intermediate partitions

Andreas Oberritter (1):
=20=20base-files: Remove /proc/bus/usb from fstab.

Bruno Bottazzini (1):
=20=20systemd: removing workaround odering journal after remote-fs.target

Christophe Guillon (1):
=20=20ncurses: inherit pkgconfig

Dmitry Eremin-Solenikov (3):
=20=20qt4-x11-free: make virtual/libgl dependency conditional
=20=20systemd.bbclass: drop has_exactly_one_service setting
=20=20libevent: add ptest

Haris Okanovic (1):
=20=20glibc: CVE-2015-1781: resolv/nss_dns/dns-host.c buffer overflow

Joshua Lock (1):
=20=20cairo: make xlib and libxcb dependencies explicit

Jussi Kukkonen (1):
=20=20xf86-video-cirrus: Upgrade 1.5.2 -> 1.5.3

Leonardo Sandoval (1):
=20=20useradd.bbclass: Remove base-passwd dependency

Li xin (1):
=20=20coreutils_6.9.bb: Fix LSB NG Cases.

Lucian Musat (1):
=20=20oeqa/utils: Fixed a problem with get_bb_var not returning right =
variable.

Mariano Lopez (1):
=20=20sanity.bbclass: Increased verbosity for connectivity check

Mario Domenech Goulart (2):
=20=20native.bbclass: avoid unintended substring replacement when setting =
PROVIDES
=20=20README: add "Contributing" section

Markus Lehtonen (5):
=20=20devtool: extract: remove patches when S=3DWORKDIR
=20=20devtool: remove unused imports / re-imports
=20=20devtool: rename unused variables
=20=20devtool: add missing docstrings
=20=20devtool: deploy plugin: fix bad indentation

Martin Jansa (1):
=20=20boost: properly fix do_boostconfig re-execution

Otavio Salvador (1):
=20=20gstreamer1.0-plugins-bad: Move EGL requirement for Wayland

Paul Eggleton (4):
=20=20devtool: fix build env command execution error handling
=20=20lib/oe/recipeutils: add a parse_recipe_simple() function
=20=20devtool: deploy-target: use tinfoil instead of bitbake -e
=20=20devtool: if workspace layer exists, still ensure it's in bblayers.conf

Richard Purdie (9):
=20=20dbus: Fix do_install files outside ${D}
=20=20insserv: Remove
=20=20gcc5: Add PR65779 patch to fix powerpc compile issues
=20=20gcc5: Add back g++ sysroot patch
=20=20module/module-base/lttng-modules: Improve kernel module dependencies
=20=20glibc: Fix x32 make race
=20=20base: Avoid find race
=20=20kernel/rm_work: Improve interaction
=20=20sstate: Improve HASHCHECK function to make siginfo configurable

Robert Yang (24):
=20=20stat: fix SRC_URI
=20=20openssl/orc: virtclass-native -> class-native
=20=20gcc-5: fix installed-vs-shipped
=20=20kernelshark: fix for rebuild
=20=20libxml2: fix python path and add libxml2-python
=20=20mesa: fix do_install_append
=20=20mesa-demos: only enable glu when x11 in DISTRO_FEATURES
=20=20libglu: add x11 to REQUIRED_DISTRO_FEATURES
=20=20libsdl: depends on libglu when x11
=20=20libowl/settings-daemon/libnotify: add x11 to REQUIRED_DISTRO_FEATURES
=20=20recipes-extended: add x11 to REQUIRED_DISTRO_FEATURES
=20=20recipes-graphics: add x11 to REQUIRED_DISTRO_FEATURES
=20=20gst-plugins-gl: add x11 to REQUIRED_DISTRO_FEATURES
=20=20recipes-sato: add x11 to REQUIRED_DISTRO_FEATURES
=20=20at-spi2-atk: add x11 to REQUIRED_DISTRO_FEATURES
=20=20packagegroup-core-qt: add x11 to REQUIRED_DISTRO_FEATURES
=20=20bind: separate B and S
=20=20libpcre: 8.36 -> 8.37
=20=20apr: 1.5.1 -> 1.5.2
=20=20ghostscript: 9.15 -> 9.16
=20=20socat: fix for parallel build
=20=20strace: add PACKAGECONFIG for bluez
=20=20alsa-tools: set CLEANBROKEN
=20=20xserver-xorg: add PACKAGECONFIG for wayland and add =
xserver-xorg-xwayland

Ross Burton (3):
=20=20autoconf: simplify perl location forcing logic
=20=20automake: simplify perl location forcing logic
=20=20Revert "libsdl: depends on libglu when x11"

Roy Li (2):
=20=20elfutils: Disable the unnecessary check in iconv.m4
=20=20unzip: Security Advisory -CVE-2014-9636 and CVE-2015-1315

Saul Wold (1):
=20=20lttng-modules: Update to stable version 2.6.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andre McCurdy (1):
=20=20ntp: control refclock driver support via PACKAGECONFIG

Andreas M=C3=BCller (8):
=20=20exo: update to 0.10.4
=20=20xfce4-power-manager: update to 1.4.4
=20=20xfce4-smartbookmark-plugin: initial add 0.4.6
=20=20packagegroup-xfce-extended: add xfce4-smartbookmark-plugin
=20=20thunar: update to 1.6.8
=20=20udisks2: add recipe for 2.1.5 version
=20=20xfce4-time-out-plugin: update to 1.0.2
=20=20xfce4-session: update to 4.12.1

Armin Kuster (30):
=20=20ruby: Update to 2.2.2
=20=20collectd: fix world build issue
=20=20libgxim: fix world build issues
=20=20protobuf: update update and build fix
=20=20serial-forward: fix fetch error
=20=20lirc: fix QA warnings
=20=20hplib: fix QA warnings
=20=20udisks: fix QA warnings
=20=20lio-utils: fix QA warnings
=20=20pm-qa: Fix QA warnings
=20=20gateone: Fix QA warnings
=20=20rarpd: Fix QA warnings
=20=20pscs-lite: Fix QA warnings
=20=20fbida: Fix QA warnings
=20=20qt-creator: Fix QA warnings
=20=20fio: Fix QA warnings
=20=20foxtrotgps: Fix QA warnings
=20=20usbpath: Fix QA warnings
=20=20wvstreams: Fix QA warnings
=20=20pksc11-helper: Fix QA warnings
=20=20libutempter: update SRC_URI
=20=20gammu: Fix QA warnings
=20=20mosh: Fix QA warnings
=20=20numactl: Fix QA warnings
=20=20xterm: fix issue with SRC_URI
=20=20ckermit: update SRC_URI
=20=20packagekit: Fix QA warnings
=20=20daq: move recipe to meta-networking
=20=20meta-xfce: add layer depends
=20=20libnet-ssleay-perl: fix QA warning

Christian Ege (1):
=20=20rng-tools: Fix path of default configuration file

Chunrong Guo (3):
=20=20mozjs: fix the compile error of powerpc64
=20=20fbset-modes: fix a warning about not existant S
=20=20polkit: do not hardcode the libdir

Cristian Iorga (1):
=20=20bluez collection: add (moved from oe-core)

Dmitry Eremin-Solenikov (1):
=20=20syslog-ng: add util-linux to DEPENDS list

Dominic Sacr=C3=A9 (1):
=20=20fio: add missing build dependency on zlib

Haris Okanovic (1):
=20=20start-stop-daemon: Fix RCONFLICTS typo

Igor Santos (2):
=20=20ctags: add
=20=20cscope: add

Khem Raj (10):
=20=20libgnomeprint: Fix build with newer bison >=3D 3
=20=20imagemagick: Update PATCHSET to 10
=20=20pangomm: Use http instead of ftp for SRC_URI
=20=20libsigc++: Use http instead of ftp in SRC_URI
=20=20gdm: Whitelist it
=20=20polkit-gnome: Upgrade 0.102 -> 0.105
=20=20gtkmathview: Use git for SRC_URI
=20=20obex, gnome-bluetooth: Make bluez{4, 5} dep conditional on =
DISTRO_FEATURE
=20=20site: add arm-64 and x86_64-linux files
=20=20libbonoboui: Fix build with gcc5

Li Zhou (1):
=20=20rsyslogd: Backport upstream commits to fix rsyslog segmentation fault =
when h

Martin Jansa (11):
=20=20vala-dbus-binding-tool: upgrade to different 0.4.0 release
=20=20gsoap-native: add missing dependency on flex-native
=20=20gsoap: fold .inc and -native into one recipe
=20=20nodejs: fix qemuarm build without thumb and drop unused patch
=20=20*obex*, navit, libsyncml, foxtrotgps, gypsy, bluez-hcidump, bluez4, =
gst-plug
=20=20ruby: explicitly disable dtrace support
=20=20vala-dbus-binding-tool: fix the version inside the package
=20=20Revert "libhugetlbfs: Add i586 to list of compatible host =
architectures"
=20=20efl, elementary, emotion-generic-players, evas-generic-loaders: =
upgrade to 1
=20=20e-wm: upgrade to 0.19.5
=20=20python-efl: upgrade to 1.14.0

Philip Balister (2):
=20=20gpsd: Update to 3.14.
=20=20python-thrift: Add recipe.

Ross Burton (1):
=20=20libart-lgpl: add (from oe-core)

Roy Li (10):
=20=20netkit-telnet: support the cross-compile
=20=20php: upgrade to 5.5.24
=20=20phpmyadmin: upgrade to 4.4.4
=20=20samba: upgrade to 3.6.25
=20=20dialog: upgrade to 1.2-20150225
=20=20mariadb: upgrade to 5.5.43
=20=20apache2: upgrade to 2.4.12
=20=20strongswan: upgrade to 5.3.0
=20=20tcpdump: upgrade to 4.7.4
=20=20krb5: upgrade to 1.13.2

Sven Ebenfeld (1):
=20=20libgee: Update to Version 0.16.1

Yevhen Kyriukha (1):
=20=20aufs-util: upgrade to v3.14.

Yi Zhao (20):
=20=20smstools: fix PN -> BPN for multilib
=20=20hexedit: fix PN -> BPN for multilib
=20=20fbgrab: fix PN -> BPN for multilib
=20=20takao-fonts: fix PN -> BPN for multilib
=20=20xbitmaps: fix PN -> BPN for multilib
=20=20navit: fix PN -> BPN for multilib
=20=20omgps: fix PN -> BPN for multilib
=20=20orrery: fix PN -> BPN for multilib
=20=20fltk: fix PN -> BPN for multilib
=20=20mime-support: fix PN -> BPN for multilib
=20=20openct: fix PN -> BPN for multilib
=20=20picocom: fix PN -> BPN for multilib
=20=20soci: fix PN -> BPN for multilib
=20=20mozjs: fix PN -> BPN for multilib
=20=20iperf: fix ${PN}-${PV} -> ${BP} for multilib
=20=20synergy: fix ${PN}-${PV} -> ${BP} for multilib
=20=20gpsd: fix PN -> BPN for multilib
=20=20p7zip: fix PN -> BPN for multilib
=20=20mpich: fix ${PN}-${PV} -> ${BP} for multilib
=20=20sylpheed: remove do_install_append

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (10):
=20=20arago-source-ipk: mark omap3-sgx-modules sources as machine-specific
=20=20recipes: inherit allarch instead of simply PACKAGE_ARCH =3D "all"
=20=20layer.conf: mark safe deps from allarch to arch/mach specific packages
=20=20php: fix typo introduced by previous change
=20=20layer.conf: add oprofile and example to siggen safe deps for =
matrix-gui-opro
=20=20layer.conf: add stable dep matrix-gui-usb-demos -> bonnie++
=20=20packagegroup-*-tisdk-matrix: check for wayland DISTRO_FEATURE =
introduced typ
=20=20ltp-ddt: add SRCPV suffix to PR to easily track git revision
=20=20matrix-gui-usb-demos: bump PR
=20=20layer.conf: add matrix-gui-armbenchmarks-demos safe deps

Jacob Stiffler (1):
=20=20php: Fix race condition during installation.

Sam Nelson (2):
=20=20ipsecmgr: Add run time dependency on ipsecmgr-mod
=20=20packagegroup-arago-console: Add iproute2 tc package

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

Alexandre Belloni (2):
=20=20videoplayer: use gst-launch when no fb1 is present
=20=20applicationlauncher: add videoplayer for sama5d4

Josh Wu (1):
=20=20atmel-qt5-demo-image: gstreamer1.0: includes full plugins elements

Nicolas Ferre (7):
=20=20at91bootstrap: add revision 3.7.2
=20=20linux firmware: add Atmel wilc1000 firmwares
=20=20defconfig: add wifi and webcam for sama5 & at91sam9x5
=20=20demo images: add atmel-wireless-firmware for Atmel wifi wilc1000
=20=20videoplayer: handle the case if no alsa playback available
=20=20videoplayer: simplify and harden gst-launch video player
=20=20videoplayer: adapt gst-launch to the screen dimention

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Khem Raj (2):
=20=20Update README
=20=20cef,chromium: Separate out installs

Nikolay Dimitrov (1):
=20=20chromium: Use bitbake variable instead of shell variable

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

Otavio Salvador (2):
=20=20u-boot-fslc: Bump to b16ec2d revision
=20=20linux-fslc: Update to 19ebefd revision

Stefan Christ (1):
=20=20image_types_fsl.bbclass: use dd's option fsync instead of sync

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Nikolay Dimitrov (1):
=20=20imx6dl-riotboard: Fix broken image builds against linux-fslc

Otavio Salvador (6):
=20=20cubox-i: Use u-boot-fslc
=20=20u-boot-cubox-i: Remove as it is not unused
=20=20cubox-i: Remove UBOOT_ENTRYPOINT
=20=20cubox-i: Remove linux-firmware-ath6k from MACHINE_FIRMWARE
=20=20bcm4330-nvram-config: Add cubox-i support
=20=20cubox-i: Install bcm4330-nvram-config to enable WiFi support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Liu Ting-B28495 (3):
=20=20asf: use KBUILD_OUTPUT to point to build-artifacts
=20=20ceetm: use KBUILD_OUTPUT to point to build-artifacts
=20=20skmm-ep: use backquotes for command substitution

Zhenhua Luo (1):
=20=20skmm-host: packaging mini_calc file in binary package

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

Saul Wold (2):
=20=20linux-yocto_3.19: Update to the Intel i915 driver
=20=20lttng-modules: add bbappend to address 3.19.5 update

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (9):
=20=20audiomanager: Update to 6.2
=20=20common-api-c++-dbus: Update to 2.1.6-p6
=20=20common-api-c++: Update to 2.1.6-p1
=20=20node-health-monitor: Update to 1.3.5
=20=20persistence-administrator: Update to 1.0.5
=20=20persistence-client-library: Update to 1.0.0
=20=20dbus: Add patch for new version of common API
=20=20node-state-manager: Fix build
=20=20persistence-common-object: Update to 1.0.3

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

Alex J Lennon (1):
=20=20mono: Update to support release 4.0.1.34

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

Ilkka Myller (1):
=20=202015.05.13, Version 0.12.3 (Stable)     * V8: update to 3.28.71.19    =
 * uv:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Julien Brianceau \(jbriance\) (1):
=20=20qtbase-native: speed up configure task

Martin Jansa (1):
=20=20ninja-native: upgrade to 1.5.3

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (3):
=20=20podboy: fix blacklist
=20=20fsosystemd: drop recipes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (4):
=20=20linux-ti-staging: update to 3.14.41 with platform, connectivity fixes
=20=20u-boot-ti-staging: update with connectivity, x15 and other fixes
=20=20boot-monitor: pass custom LD var that includes sysroot option
=20=20linux-ti-staging: update to 3.14.42 with more fixes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (2):
=20=20gcc: Update patches for gcc 4.8.4
=20=20linux-xlnx: Add recipe for v3.19 Xilinx kernel

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Lucian Musat (1):
=20=20meta-yocto/distro: Added Ubuntu 15.04 to SANITY_TESTED_DISTROS

Mariano Lopez (1):
=20=20poky.conf: Fix git URL example

Robert Yang (1):
=20=20maintainers.inc: update MAINTAINERS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



