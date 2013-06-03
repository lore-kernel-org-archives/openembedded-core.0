Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (new.bec-systems.com [74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id 96E8B61EBD;
	Mon,  3 Jun 2013 20:06:33 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1UjayF-0003Yt-1L; Mon, 03 Jun 2013 16:03:20 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 03 Jun 2013 20:06:15 GMT
Message-Id: <1370289975394.6852ffdd@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-05-26 until 2013-06-02
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
X-List-Received-Date: Mon, 03 Jun 2013 20:06:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-05-26 until 2013-06-02.  Projects included in this =
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

Alexandru DAMIAN (5):
=20=20bitbake: retrieve the entire ui module in launcher
=20=20bitbake: move extra cache collection out of cooker
=20=20bitbake: move start server code in a separate function
=20=20bitbake: xmlrpc transport has identification token
=20=20bitbake: xmlrpc remote server

Andrei Dinu (1):
=20=20Added distroy signal to information dialogs

Mark Hatle (1):
=20=20lib/bb/cache.py: Change debugging note to a debug message

Richard Purdie (5):
=20=20server: Remove none server
=20=20server/bitbake: Remove launchUI method
=20=20fetch2: Fix missing function call
=20=20cookerdata: Fix tinfoil by adding missinge extra_caches default
=20=20prserv: Unbreak after bb.server changes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Amy Fong (1):
=20=20portmap: /etc/init.d/portmap restart complains "command not found"

Andrei Dinu (1):
=20=20runqemu: Replaced "stty sane" with saved stty settings

Bogdan Marinescu (4):
=20=20git: upgraded to 1.8.3
=20=20python-dbus: upgraded to 1.2.0
=20=20autogen-native: upgraded to 5.17.4
=20=20guile: added runtime dependency on glibc-gconv-iso8859-1

Bruce Ashfield (4):
=20=20linux-yocto: v3.8.13 and v3.4.46
=20=20qemu*: restrict NFSD to linux-yocto only
=20=20kern-tools: expand kernel features that point to a directory name
=20=20linux-yocto: remove 3.2 kernel recipes

Christopher Larson (5):
=20=20rpcbind: obey 'tcp-wrappers' PACKAGECONFIG
=20=20quota: obey 'tcp-wrappers' PACKAGECONFIG
=20=20portmap: obey 'tcp-wrappers' PACKAGECONFIG
=20=20systemd: obey 'tcp-wrappers' PACKAGECONFIG
=20=20nfs-utils: obey 'tcp-wrappers' PACKAGECONFIG

Eric B=C3=A9nard (1):
=20=20hicolor-icon-theme: keep inherited dependencies and switch to =
gnomebase

Hongxu Jia (1):
=20=20python-scons-native: fix invoking scons failed on Fedora-17

Ionut Radu (3):
=20=20apt: Updated from 0.9.7.8 to 0.9.8.1
=20=20libtasn1: Updated from 2.14 to 3.3
=20=20settings-daemon: Update to git HEAD =
9a99528b02255450db81176abd9bbcc1dab9a4c1

Jackie Huang (1):
=20=20guile: don't search for libreadline in host libdir

Jason Wessel (2):
=20=20util-linux: Add ability to compile with nativesdk
=20=20ncurses: Fix problems expanding ncurses-libtinfo when in IMAGE_INSTALL

Jesse Zhang (3):
=20=20libxpm: inherit gettext
=20=20dbus-glib: use BPN instead of PN
=20=20initscripts: let status return 0 when proc is running well

Joe Slater (2):
=20=20cmake.bbclass: modify construction of compiler flags
=20=20acpid: modify CFLAGS

Jonathan Liu (16):
=20=20systemd: fix ordering for machineid and run-postinsts services
=20=20findutils: backport fixes for documentation build errors
=20=20base-files: add /run directory from FHS 3 draft specification
=20=20systemd: do not create /var/volatile/run and /var/volatile/lock
=20=20systemd: do not create symbolic link from /run to /var/run
=20=20systemd: remove old /var/run workarounds
=20=20udev: do not create /var/volatile/run in init script
=20=20udev: do not create symbolic link from /run to /var/run
=20=20bind: remove empty /var/run directory
=20=20cups: remove /var/run from package as cupsd will populate it on =
startup
=20=20resolvconf: remove /var/volatile/run/resolvconf/interface from package
=20=20consolekit: remove /var/run from package
=20=20qt4: fix path to demos documentation
=20=20openssl: fix documentation build errors with Perl 5.18 pod2man
=20=20file: remove obsolete version check patch
=20=20findutils: backport more fixes for documentation build errors

Laurentiu Palcu (1):
=20=20systemd: add udev-utils dependency for udev-hwdb

Li Wang (1):
=20=20bind: add ipv6 support

Marcin Juszkiewicz (1):
=20=20binutils: add two AArch64 related backports to 2.23.2

Mark Hatle (4):
=20=20cracklib: Allow byte order patch to work on older Linux hosts
=20=20siteinfo.bbclass: Add mips64 common siteinfo
=20=20libpam: Avoid wildcards in the SRC_URI
=20=20libarchive: Fix build dependencies

Marko Lindqvist (5):
=20=20harfbuzz: update to upstream version 0.9.17
=20=20gtk+: update to upstream version 2.24.18
=20=20curl: update to upstream version 7.30.0
=20=20freetype: update to upstream version 2.4.12
=20=20pkg-config: remove obsolete AM_PROG_CC_STDC

Martin Jansa (1):
=20=20libdrm: fix packaging after last upgrade

Ming Liu (2):
=20=20dpkg-native: Fix native perl path
=20=20grep: fix for CVE-2012-5667

Paul Eggleton (1):
=20=20python-smartpm: add gettext-native to DEPENDS

Peter Kjellerstedt (4):
=20=20makedevs: Create blocks of devices with the correct uid/gid
=20=20makedevs: Correct the device number calculation for blocks of devices
=20=20makedevs: Make the mode number readable in debug messages
=20=20makedevs: Avoid unnecessary timestamp calculation

Richard Purdie (1):
=20=20dpkg: Be deterministic about lzma dependency

Ross Burton (8):
=20=20utils: add trim_version() function
=20=20pixbufcache: add more documentation
=20=20librsvg: add sstate dependencies so that the SVG loader works at =
staging tim
=20=20clutter: remove documentation hacks
=20=20cogl: remove documentation hacks
=20=20atk: upgrade to 2.8
=20=20utils.bbclass: ensure $0 is correct in wrapper scripts
=20=20rpm: remove .real hacks in argument parsing

Samuli Piippo (1):
=20=20gdb-cross-canadian: use correct exec-prefix path for python

Saul Wold (1):
=20=20patch: use PACKAGECONFIG to ensure correct dependency for xattr

Song.Li (1):
=20=20libnl: fix two parentheses bugs in lib/cache_mngr.c file

Xin Ouyang (1):
=20=20qmake_base.bbclass: Add linux-gnun32-oe-g++ to QMAKESPEC

Zhenhua Luo (1):
=20=20powerpc64-linux: Update cached autoconf value for apr on powerpc64

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (2):
=20=20linux-yocto-tiny-kexecboot_3.2: remove orphan recipe
=20=20linux-yocto-tiny-kexecboot: move to version 3.8

Andreas M=C3=BCller (1):
=20=20icon-slicer: fix native build by depending on gdk-pixbuf only

Martin Jansa (5):
=20=20meta-efl: upgrade efl to 1.7.7, e-wm to 0.17.3
=20=20evas: Add patch to fix segfaults
=20=20util-linux: rename bbappend to match new version from oe-core
=20=20systemd: rename bbappend to match new version from oe-core
=20=20connman: rename bbappend to match new version from oe-core

Otavio Salvador (1):
=20=20bigbuckbunny: Add 480p, 720p and 1080p movies

Philip Balister (3):
=20=20gnuradio : Update recipe to build for all machines.
=20=20uhd-firmware : Update to 3.5.3.
=20=20uhd : Update to version 3.5.3.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Cliff Brake (1):
=20=20set default tune for Overo to cortexa8hf-neon

Khem Raj (1):
=20=20systemd-image: conman-systemd is deprecated

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (6):
=20=20recipes: cleanup use of SRCREV and SRCPV, covert literal tags to =
commit IDs
=20=20meta-toolchain-arago: fix find command listing executable files
=20=20gdb-cross-canadian: overlay locally to fix python path
=20=20meta-toolchain-arago: remove python binaries from devkit
=20=20meta-toolchain-arago-qte: fix the mkspecs symlink
=20=20meta-toolchain-arago: enhance toolchain setup in devkit

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (11):
=20=20linux-mainline 3.8: PRU, CAN and RS232 fixes
=20=20linux-mainline 3.8: add support for TSP65217 interupts
=20=20linux-mainline 3.8: add usb hotplug fix
=20=20contrib: bone-flash-tool: add emmc and mmc imaging scripts
=20=20contrib: bone-flash-tool: update emmc flasher script
=20=20contrib: bone-flash-tool: fix mmc-prepare script untar function
=20=20contrib: bone-flash-tool: delete stray flasher scripts if present
=20=20linux-mainline 3.8: add virtual capes for beaglebone
=20=20linux-mainline 3.8: add support for TT3201 CAN cape
=20=20linux.inc: install capebus dts files next to the dtbo files in =
/lib/firmware
=20=20xserver-xf86-config: add config for beaglebone

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Khem Raj (2):
=20=20chromium_24.0.1312.52.bb: Fix build with hardfp
=20=20chromium: Add recipes for 29.0.1518

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

Daiane Angolini (9):
=20=20firmware-imx: Update to version 3.0.35-4.0.0
=20=20imx-lib: Update to version 3.0.35-4.0.0
=20=20imx-lib: Move it to recipe-bsp dir
=20=20libfslvpuwrap: Update to version 1.0.35
=20=20libfslcodec: Update to version 3.0.7
=20=20libfslparser: Update to version 3.0.7
=20=20gst-fsl-plugin: Update to version 3.0.7
=20=20firmware-imx: Update to MX5 to version 3.0.35-4.0.0
=20=20fsl-mm-core: Remove old multimedia packages for MX5

Eric BENARD (1):
=20=20amd-gpu-x11-bin: depends on libxrender

Otavio Salvador (6):
=20=20imx-base.inc: Fix appending of firmware value
=20=20linux-fslc: Update to 3.9 kernel
=20=20gst-fsl-plugin: Set CROSS_ROOT so the 'ipu.h' can be found
=20=20gst-fsl-plugin: Add runtime depends on gst-plugins-good-id3demux
=20=20libfslcodec: Group ARM12, ARM11 and ARM9 packages
=20=20libfslcodec: Add libfslcodec-meta which includes all codecs

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

Andrea Adami (3):
=20=20linux-yocto-tiny-kexecboot_3.2: remove orphan .bbappend and configs
=20=20linux-yocto_3.2: remove orphan .bbappend and configs
=20=20linux-yocto_3.8: unlock linux-yocto kernels 3.8 for Zaurus

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Richard Purdie (1):
=20=20linux-yocto: Drop 3.2 bbappends

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Erik Bot=C3=B6 (2):
=20=20audiomanager: Build plugins as modules instead of shared libraries
=20=20audiomanager: start using -d to daemonize

Holger Behrens (1):
=20=20connman: realign with oe-core

Sujith H (1):
=20=20pulseaudio: Fixing the configure_append.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

Khem Raj (1):
=20=20xp4xx-npe-native_2.4.bb: Remove unused file from SRC_URI

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Eric BENARD (9):
=20=20qt: package examples
=20=20qtjsbackend: fix hardfloat detection in v8
=20=20qtbase: add 0004-Disable-mkv8snapshot.patch to 5.0.1
=20=20qtbase: remove non existing parts
=20=20qtbase-5.0.2: fix v8 and allow build of examples
=20=20qtdeclarative-5.0.2: fix examples compilation
=20=20qtbase: add option to enable tslib support
=20=20qtbase: install and split package fonts
=20=20qtjsbackend: hardfloat patch is only needed for 5.0.2

Martin Jansa (6):
=20=20qt5: drop 5.0.0 and 5.0.1 versions
=20=20qtbase: refresh patches
=20=20qt3d, qtjsondb, qtlocation, qtsensors, qtsystems: bump SRCREV to =
latest
=20=20qtbase: Refresh 0016-configure-add-tslib-support.patch from stable =
branch
=20=20qtjsbackend: refresh hardfloat patch from stable branch
=20=20qtbase-5.0.2: backport fix for build with gcc-4.8

Oleg Shparber (1):
=20=20Allow to control (disable) widgets build

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (4):
=20=20shr-version: drop DATE from PV
=20=20shr: include defaulttunes

Simon Busch (3):
=20=20meta-samsung: linux-samsung-tuna: rebased sources on top of cm/phablet
=20=20meta-asus: linux-asus-grouper: rebase sources/configuration on top of =
cm/pha
=20=20meta-android: android-initscripts: import android init system scripts

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Ameya Palande (1):
=20=20webos-image: pmloglib=3D28, pmloglib-private=3D28,v3.0.0, =
pmlogdaemon=3D103,v3.0.0

Ed Chejlava (1):
=20=20upstart: add recipes for Upstart 1.8 and libnih

Herb Kuta (1):
=20=20webos_oe_runmake_no_env_override.bbclass: Add another use case

Lokesh Kumar Goel (2):
=20=20recipes-upstreamable: Add recipes for sp-measure and sp-memusage
=20=20webos-image-devel: Add sp-memusage package

Martin Jansa (2):
=20=20packagegroup-webos-test: Don't include valgrind for armv[456]*
=20=20webos-image: leveldb=3Dv1.10

Sapna Todwal (1):
=20=20webos-image: webos-connman-adapter=3D10

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (7):
=20=20meta-kc705: kc705-trd: Update configuration to match exact hardware
=20=20linux-xlnx: Add support for MicroBlaze 'linux.bin.ub' make target
=20=20tune-microblaze: Fix default KERNEL_IMAGETYPE value for microblaze
=20=20meta-kc705: linux-xlnx: Add "EPOLL" to defconfig
=20=20README: Updated README files for meta-xilinx and BSPs
=20=20Move include of 'soc-family.inc' into Tune definitions
=20=20conf/machine: Remove obsolete machines

Sipke Vriend (1):
=20=20recipes-bsp: remove redundant comment line from u-boot 2013.01 recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bogdan Marinescu (1):
=20=20upstream_tracking.inc: added no upgrade reason for python-pygobject

Bruce Ashfield (2):
=20=20poky.conf: add qemumips64 preferred version
=20=20poky-lsb: make NFS kernel server support specific to linux-yocto

Ning Zhang (1):
=20=20yocto_kernel: check current items before add a new one

Paul Eggleton (2):
=20=20xserver-xf86-config: re-enable AutoAddDevices for beagleboard
=20=20yocto-bsp: re-enable AutoAddDevices in xorg.conf for generated BSPs

Richard Purdie (1):
=20=20linux-yocto: Drop 3.2 kernel bbappend for 3.2 kernel removal

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



