Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1QN82Q-0006JN-Dh
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 20:33:34 +0200
Received: from localhost ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1QN7Sg-0003y1-3F; Thu, 19 May 2011 13:56:38 -0400
Date: Thu, 19 May 2011 13:56:38 -0400
Message-Id: <E1QN7Sg-0003y1-3F@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-4-8 to 2011-4-15
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 May 2011 18:33:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20angstrom-bleeding.conf: Prefer gcc 4.6 from meta-openembedded

Koen Kooi (2):
=20=20angstrom bleeding: prefer eglibc 2.13
=20=20angstrom: also pin libgcc-nativesdk

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Khem Raj (1):
=20=20gcc-4.6: Add recipes

Koen Kooi (1):
=20=20udev: update to 168

Martin Jansa (11):
=20=20e-base: bump SRCREV and update fix-ecore-fb-initialization.patch =
patch for e
=20=20embryo, epdf: fix LICENSE, from oe.dev
=20=20udev: drop udev-compat for zaurus devices
=20=20libxfixes, util-macros: drop from meta-oe, now they are in oe-core
=20=20gst-plugins-base: drop 0.10.30 from meta-oe, there is 0.10.32 in =
oe-core
=20=20xinput-calibrator: add new version 0.7.5 and include .inc to recipe =
directly
=20=20python-argparse: add new recipe to provide argparse module for python =
and py
=20=20gdbus-binding-tool: bump SRCREV
=20=20glib-2.0: add git version for 2.29.3+git, which has gdbus-codegen =
included
=20=20connman: drop older 0.72
=20=20dnsmasq(-dbus): import from oe.dev, needed for connman now

Otavio Salvador (16):
=20=20fuse: add version 2.8.5
=20=20ntfs-3g-ntfsprogs: add version 2011.4.12
=20=20freerdp: add recipe based on GIT from 2009-03-29
=20=20pixman.inc: use Xorg mirror
=20=20p910nd: add version 0.95
=20=20libiconv: drop hack since gettext was being inherited
=20=20libinih: add git recipe
=20=20qt4: drop 4.6 versions
=20=20postgresql: update to 8.4.7 since 8.4.4 was unfetchable
=20=20qt4: fix 4.7.2 checksum
=20=20qmake_base.bbclass: sync with oe-core class
=20=20setxkbmap: add version 1.2.0
=20=20p910nd: drop unused init script
=20=20qmake_base.bbclass: use using parallel staging dirs
=20=20glib-2.0: depends on python-argparse-native
=20=20libiconv: drop EXTRA_OECONF as it is handled by gettext class

Simon Busch (1):
=20=20connman: add recipe for the latest released version 0.73

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Paul Eggleton (2):
=20=20formfactor: add beagleboard formfactor file
=20=20netbase: automatically bring up usb0 on BeagleBoard xM

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Andreas M=C3=BCller (6):
=20=20u-boot: add 2011.03
=20=20overo: u-boot fix by moving to version 2011.03
=20=20elftosb: Add native helper to create boot stream files used by =
freescale iMX
=20=20u-boot: Add support for freescale iMX28 SoCs
=20=20linux-imx-git: add support for freescale mx28evk
=20=20mx28evk: Add new machine definition

Andrew Turley (1):
=20=20bug-app.inc: Allow to pass extra options to javac.

Anil kumar M (2):
=20=20u-boot_git: Ethernet MACID display fix for CraneBoard
=20=20linux-omap-psp-2.6.32: Makefile change to revert AM3517EVM support =
and add C

Denis 'GNUtoo' Carikli (3):
=20=20wordwarvi: add new recipe (arcade game)
=20=20wordwarvi: fix description
=20=20linux-nokia900-meego: remove oss and old alsa api

Denis Carikli (9):
=20=20pointercal-xinput: add support for bug20
=20=20xserver-common-1.34: sync with oe-core
=20=20udev 165: depends on mtd-utils to fix compilation
=20=20udev-rules-buglabs: sync with buglabs repository
=20=20xf86-video-omapfb: use newer srcrev(fix segmentation fault for bug20)
=20=20linux-bug20-linaro: use newer srcrev
=20=20task-bug: fix do_rootfs conflict
=20=20preferred-shr-versions.inc: remove xserver-common prefered version
=20=20bug20.conf: switch to the 2.6.35 linaro kernel

Denys Dmytriyenko (1):
=20=20libsndfile: add latest version 1.0.24, as older no longer available

Eric BENARD (6):
=20=20busybox_git: update to today's master
=20=20qt4: introduce version 4.7.3
=20=20minimal: prefer qt 4.7.3
=20=20kaeilos-2009: prefer qt 4.7.3
=20=20shr: prefer qt 4.7.3
=20=20qt4: remove 4.7.2

Eric B=C3=A9nard (5):
=20=20qt4-native: also build lrelease
=20=20qt4.inc: give the right name to variable qmake will use
=20=20qt4-4.7.3: add translations'support
=20=20qt4-native: unbreak qt4 compilation by providing the necessary native =
tools
=20=20angstrom-2010: prefer qt 4.7.3

Jason Kridner (1):
=20=20avrgal: add recipe for avrgal-1.0

John E. Connolly (4):
=20=20task-bug-feed-extra: Add gdbserver
=20=20com.buglabs.bug.{module,jni}.motion.bb: Add recipes and add them to =
task-bug
=20=20alsa-state: New asound.state for bug20 reflecting .35 kernel
=20=20netbase: Cleanup bug20 interfaces file

Khem Raj (1):
=20=20eglibc-2.12: Bump srcrev to latest on 2.12 branch

Klaus Kurzmann (1):
=20=20fsogsmd: the lowlevel_nokia900 plugin is no more - don't try to =
package it

Koen Kooi (5):
=20=20linux-omap-psp 2.6.32: support accept4 call
=20=20udev: add 168
=20=20systemd v26: remove accept patch, we really want accept4
=20=20angstrom: prefer udev 168
=20=20udev: add recipe to build from git (currently 168 + handfull of =
commits)

Leon Woestenberg (2):
=20=20warpcomm.conf: Add new machine TK71 Warpcomm (Marvell Kirkwood based).
=20=20linux-2.6.36: Add checksums for TK71 Warpcomm kernel patch.

Marco Cavallini (1):
=20=20MAINTAINERS: removed xorg xinput-calibrator mantainers from my profile

Martin Jansa (29):
=20=20recipes: fix LICENSE fields
=20=20recipes: drop '+' from LICENSE fields
=20=20imlib2: sync LICENSE from meta-efl
=20=20gnome-desktop-2.32.1: disable desktop docs
=20=20foxtrotgps: upgrade to 1.0.1
=20=20linux(-kexecboot)_git: bump SRCREV for rc7
=20=20glib-2.0: add libffi to DEPENDS
=20=20Subject: [PATCH] glib-2.0: use PN instead of glib-2.0 in PACKAGES and =
FILES
=20=20linux-2.6.37: update om-gta02 defconfig
=20=20linux-2.6.37: simplify om-gta02 defconfig with savedefconfig
=20=20linux-2.6.37: upgrade stablepatch to 2.6.37.6 and refresh =
openmoko/shr patch
=20=20om-gta0*: use linux-2.6.37 and autoload snd-soc-wm8753 module
=20=20om-gta02: autoload also snd-soc-s3c24xx and bump task-base PR to use =
new MAC
=20=20xserver-xorg: upgrade to 1.10.1.901 and make it default for SHR
=20=20om-gta0*: drop xf86-input-tslib
=20=20pointercal-xinput: sync koen's changes from meta-oe
=20=20xinput-calibrator: add 0.7.5 from meta-oe
=20=20xinput-calibrator: drop older versions
=20=20xlsclients: upgrade from 1.1.1 to 1.1.2
=20=20xf86-video-intel: upgrade from 2.14.902 to 2.15.0
=20=20libxext: upgrade from 1.2.0 to 1.3.0 and remove applied patch
=20=20dri2proto: upgrade from 2.3 to 2.4
=20=20glproto: upgrade from 1.4.12 to 1.4.13
=20=20libdrm: import 2.4.25 from meta-oe
=20=20libdrm: drop older versions
=20=20glproto, dri2proto: revert to old API until we have newer mesa
=20=20htcdream: drop xf86-input-tslib from XSERVER, it's not used in =
xorg-xserver-
=20=20task-shr-feed: drop xf86-input-tslib
=20=20cornucopia,libgisi: bump SRCREV

Patrik Dahlstr=C3=B6m (1):
=20=20nodejs: Make configure script not use host libutil

Paul Menzel (5):
=20=20foxtrotgps: add `libglade` to `DEPENDS`
=20=20watchdog_5.2.6: remove recipe since task fetch fails
=20=20glib-2.0_git: convert tabulator to spaces
=20=20glib-2.0_git: do not compile test program `gdbus-serialization`
=20=20pkgconfig: move 0.23 related things to include file =
`pkgconfig-0.23.inc`

Peter Gsellmann (2):
=20=20ntp-4.2.6 configuration files
=20=20vsftpd-2.0.5 configuration files

Petr =C5=A0tetiar (1):
=20=20linux-2.6.38: update to the latest stable patchset 2.6.38.5

Philip Balister (1):
=20=20gnuradio : Update rev to latest master and add patch to really =
disable volk.

Robert Schuster (1):
=20=20cacao-native_hg: Fix cacao-shutdownguard.patch

Simon Busch (7):
=20=20qt4-native: introduce the native version of qt4 and remove old =
qt4-tools-nat
=20=20apiextractor-native: add initial recipe to build the native version
=20=20generatorrunner-native: add initial recipe to build the native version
=20=20shiboken-native: add initial version of recipe
=20=20libshiboken: add initial version of recipe
=20=20python-pyside-embedded: add initial version of this recipe
=20=20python-pyside-embedded: extend support for the QWS system

Stefan Schmidt (7):
=20=20llvm2.7_2.7: Add patch for build errors on newer gcc / glibc =
combinations
=20=20com.buglabs.app.bugdash2: Bump to newer version
=20=20bug-osgi.inc: Allow javac command to be specified by recipe.
=20=20linux-omap-hah_2.6.31: Bump for various fixes
=20=20matchbox-theme-bug/session: Remove battery applet
=20=20task-bug: Add connman-plugin-ethernet back into task-bug.
=20=20llvm2.7_2.7.bb: Update patch to use c++ include style.

Tom Rini (3):
=20=20openssh.inc: Don't use ${libdir}exec
=20=20lmbench: Rework for binaries in /usr/bin
=20=20libedit: Ship all files, update LICENSE

Ulf Samuelsson (2):
=20=20Clean up patch comments
=20=20Clean up whitespace

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Adrian Alonso (7):
=20=20insane: add micrblaze target info
=20=20kernel-arch: add microblaze to valid archs
=20=20siteinfo: add microblaze target info
=20=20linux-libc-headers: add microblaze ARCH definition
=20=20image-mklibs: add microblaze arch support
=20=20package_rpm: use target vendor information
=20=20readline: Upgrade 6.1 -> 6.2

Bruce Ashfield (3):
=20=20linux-yocto: remove non-core (qemu) machine compatibility
=20=20linux-yocto: error if meta data not present
=20=20kern-tools: error if features are not found

Dexuan Cui (2):
=20=20rsync (GPLv2):  fix security vulnerability CVE-2007-4091
=20=20recpies: add Upstream-Status for multiple recipes' patches

Dongxiao Xu (1):
=20=20recipes: add Upstream-Status for multiple recipes

Ilya Yanok (2):
=20=20toolchain-qte: include cross-compiler and fix env script
=20=20qt4-tools-nativesdk: -arch is required for nativesdk build

Jingdong Lu (1):
=20=20bash: enable update-alternative to use bash as default shell

Kang Kai (4):
=20=20libxml-sax-perl: added to create LSB olver test report
=20=20task-core-lsb: add packages into lsb image
=20=20lsbsetup: recreate locale fr_FR
=20=20foomatic-filters: add a link to pass LSB printing test

Khem Raj (9):
=20=20recipes: Replace gconf-dbus with gconf
=20=20libgalago_0.5.2.bb: Fix compile for uclibc
=20=20liburcu_0.5.4.bb: Let it build on uclibc targets
=20=20lttng-ust_0.12.bb: Fix compilation on uclibc
=20=20oe/patch.py: Remove series file during Clean()
=20=20metadata_scm.bbclass: Use COREBASE to grok for SCM operations
=20=20meta/conf/layer.conf: Remove packages/*bb from BBFILES
=20=20conf/bitbake.conf: Add MACHINEOVERRIDES variable
=20=20util-linux: inherit pkgconfig

Koen Kooi (1):
=20=20git: RDEPENDS are transitive, so remove tk so it builds with just =
OE-core

Leon Woestenberg (1):
=20=20siteinfo.bbclass: Add powerpc-linux-gnuspe.

Martin Jansa (4):
=20=20tcmode-default: lock also versions for eglibc
=20=20procps: use u-a for pmap, otherwise conflicts with pmap from busybox
=20=20lib/oe/process.py: import from OE
=20=20glib-2.0: use PN instead of glib-2.0 in PACKAGES and FILES

Michael Lippautz (1):
=20=20python-native: Add ctypes patch to native build (as in =
cross-compilation)

Nitin A Kamble (16):
=20=20tcmode-default: Fix defaults for libgcc recipes
=20=20libunique: Fix for compilation with gcc 4.6.0
=20=20matchbox-wm-2: fix typo in Makefile
=20=20web: fix typo in Makefile
=20=20zaurusd: fix a typo in Makefile
=20=20dtc: fix compilation with gcc 4.6.0
=20=20mdadm: compilation fix for gcc 4.6.0
=20=20pax: fix for compiling with gcc 4.6.0
=20=20systemtap: fix for compilation with gcc 4.6.0
=20=20kexec-tools: fix compiler errors with gcc 4.6.0
=20=20libzypp: fix compilatoin with gcc 4.6.0
=20=20recipes: Fix the Upstream-Status format
=20=20gcc: fix target gcc runtime issue
=20=20gcc 4.5.1 4.6.0: remove unused patches
=20=20recipes: Update upstream-status of patches
=20=20tcmode-default: fix a typo

Otavio Salvador (11):
=20=20scripts/oe-setup-builddir: fix typo
=20=20syslinux: improve packaging
=20=20meta/conf/local.conf.sample: fix mklibs comment line split and typo
=20=20busybox: add support to mdev
=20=20libxkbfile: disable xcb
=20=20insane.bbclass: skip license checksum if LICENSE is "CLOSED"
=20=20fuse: drop since it is not used by other recipes
=20=20conf/bitbake.conf: use --no-check-certificate to avoid errors when =
wgetting=20
=20=20cmake.bbclass: fix qmake and rpath issues
=20=20qmake_base.bbclass: add generate_qt_config_file task
=20=20cmake: add support for oe qt4 tools names

Paul Eggleton (3):
=20=20qt4: update from 4.7.2 to 4.7.3
=20=20distro_tracking_fields.inc: update for qt 4.7.3 upgrade
=20=20qt4: split out SQL driver config flags to QT_SQL_DRIVER_FLAGS

Qing He (1):
=20=20update patch upstream status

Richard Purdie (14):
=20=20bitbake.conf: Drop unused *GUI* and MACHINE_DISPLAY variables
=20=20linux-yocto: Allow bbappend files to add to COMPATIBLE_MACHINE to fix =
errors
=20=20Revert "linux-yocto: Allow bbappend files to add to =
COMPATIBLE_MACHINE to fi
=20=20Drop poky-floating-revisions.inc, poky-bleeding.conf and poky-lsb.conf
=20=20bitbake.conf: Include the new default-providers.inc and =
default-versions.inc
=20=20distro: Add defaultsetup.conf, a set of default configuration =
providing sane
=20=20machine/qemu: Add qemu-config as an essential machine speicfic =
dependency an
=20=20conf/distro/include/default-distrovars.inc: Create set of default =
'distro' v
=20=20preferred-xorg-versions.inc: Drop this, it makes no sense given we =
only have
=20=20distro/tclibc-uclibc: Append uclibc to key path names to allow =
parallel ucli
=20=20matchbox-theme-sato/pseudo: Add DEFAULT_PREFERENCE =3D -1 for SCM =
recipes
=20=20conf/distro/include: Remove old prebuilt OE toolchain support =
(replaced by s
=20=20conf/distro: Drop poky.conf, nothing in here should be needed for =
builds to=20
=20=20scripts/oe-setup-builddir: Add missing .sample extensions and default =
to met

Saul Wold (3):
=20=20web-sato: Update for svn -> git transtion
=20=20gtkhtml2: Update to 1161
=20=20distcc: Update SRC_URI

Scott Garman (1):
=20=20gnome-doc-utils: Add additional missing -nonet options to xsltproc

Xiaofeng Yan (4):
=20=20libxmu: Add native function
=20=20wq!lsb: Add init-functions to lsb-image
=20=20init-functions: Conforming applications may install one or more =
initializati
=20=20lsbsetup: Add link for sendmail

Yu Ke (6):
=20=20xf86-video-intel: upgrade from 2.14.0 to 2.15.0
=20=20sqlite: upgrade from 3.7.5 to 3.7.6.2
=20=20xserver-xf86-dri-lite: upgrade from 1.9.3 to 1.10.1
=20=20xserver-xf86-dri-lite_git: upgrade to 1.10.2 RC1 snapshot
=20=20xserver-xf86-lite: upgrade to from 1.7 RC2 to 1.10.1
=20=20recipes: Add Upstream-Status for multiple recipes

Zhai Edwin (4):
=20=20qemu-script: Fix qemu seg fault if install Nvidia proprietary driver.
=20=20clutter-cairo: remove remaining files from this obsolete recipe
=20=20qemu: Upgrade qemu git to the latest 0.14 branch
=20=20recipes: Add Upstream-Status to multiple recipes




