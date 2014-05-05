Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7B47365F72;
	Mon,  5 May 2014 19:15:27 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id hl10so1790796igb.4
	for <multiple recipients>; Mon, 05 May 2014 12:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=hlqhmQZpmhBJwT1vFkOtNus4akbvhn241JI5KpjLxIY=;
	b=RRlZe/toHRgOZ5cYFCG9DpSbym+0OWQmhDLq8O7m3NnrvDwAg2RMRbpsI+67AUOcM9
	h4U6A4EhHSYceTploiylORkdhJ8Q3tKrItJeNvTTXE/rx7dCPZAQIaVug+6wJOEiGJBC
	1CZRXESXU3qpIv/OeeDGQTID+ow239Z7etYigDwIwNEKMsych1/rjA9yvGRx3rl8pudg
	Il+ufDkV4TLZ2Ui2b/Et2e0qH2fqIA0WCxXVCa/3Xes9HOl56ArpxIjrVx9d9J0D/JzU
	o1CLHS13S8+EIOS89s+VEzZ9FAaz9MpAuxfWGEyLER9/986FtWmI8BAAewdCE1s1CWSv
	IlxA==
X-Received: by 10.50.109.163 with SMTP id ht3mr26982805igb.4.1399317327786;
	Mon, 05 May 2014 12:15:27 -0700 (PDT)
Received: from happy.bec-systems.com (cable-pool6-cs-200.doycomm.com.
	[66.219.185.200]) by mx.google.com with ESMTPSA id
	on9sm30212452igb.11.2014.05.05.12.15.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 May 2014 12:15:26 -0700 (PDT)
X-Google-Original-Date: Mon, 05 May 2014 19:15:25 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 05 May 2014 12:15:26 -0700 (PDT)
Message-Id: <1399317325030.598b8fc1@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-04-27 until 2014-05-04
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
X-List-Received-Date: Mon, 05 May 2014 19:15:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-04-27 until 2014-05-04.  Projects included in this =
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

Christopher Larson (1):
=20=20codeparser: don't interact with the cache for subshells

Jacob Kroon (1):
=20=20fetch2: Cleanup file checksum generation, v2

Otavio Salvador (1):
=20=20bb.utils, bb.codeparser: Add bb.utils.contains_any

Richard Purdie (5):
=20=20Revert "fetch2: Cleanup file checksum generation"
=20=20bitbake: Bump version to 1.23.1
=20=20codeparser: Fix to better catch all getVar references
=20=20persist_data: Avoid fsync() calls
=20=20prserv/db: Avoid fsync() calls

Volker Vogelhuber (1):
=20=20HG Fetch with username and password in url

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Cristian Iorga (7):
=20=20telepathy-glib: upgrade to 0.24.0
=20=20gstreamer1.0: upgrade to 1.2.4
=20=20gstreamer1.0-libav: upgrade to 1.2.4
=20=20gstreamer1.0-plugins-base: upgrade to 1.2.4
=20=20gstreamer1.0-plugins-good: upgrade to 1.2.4
=20=20gstreamer1.0-plugins-bad: upgrade to 1.2.4
=20=20gstreamer1.0-plugins-ugly: upgrade to 1.2.4

Drew Moseley (1):
=20=20systemd: Check for HAVE_POSIX_FALLOCATE

Irina Patru (1):
=20=20distrodata.bbclass: Fix checkpkg functionality

Jacob Kroon (2):
=20=20sstate-cache-management: Minor cleanup of help text
=20=20feature-arm-thumb.inc: Suppress false warning

Laurentiu Palcu (12):
=20=20xf86-input-synaptics: upgrade to 1.7.4
=20=20libdrm: upgrade to 2.4.53
=20=20xserver-xorg: upgrade to 1.15.1
=20=20python-pygobject: upgrade to 2.28.3
=20=20gdb: upgrade to 7.7
=20=20xproto: upgrade to 7.0.26
=20=20xrandr: upgrade to 1.4.2
=20=20xtrans: upgrade to 1.3.4
=20=20kexec-tools: upgrade to 2.0.6
=20=20nasm: upgrade to 2.11.02
=20=20xauth: upgrade to 1.0.9
=20=20fontconfig: upgrade to 2.11.1

Martin Jansa (4):
=20=20feature-arm-thumb.inc: Replace inner quotes with apostrophes
=20=20feature-arm-thumb.inc, arch-armv4.inc: Add "arm" to TUNE_FEATURES
=20=20tune-cortexr4.inc: Add thumb and arm to TUNE_FEATURES
=20=20feature-arm-thumb.inc: set ARMPKGSFX_THUMB only when thumb is in =
TUNE_FEATUR

Max Eliaser (1):
=20=20Add texinfo.bbclass; recipes that use texinfo utils at build-time =
inherit it

Maxin B. John (2):
=20=20openssl: enable ptest support
=20=20ltp: update version to 20140422

Otavio Salvador (2):
=20=20alsa-tools: Enable GTK support for X11, Wayland and DirectFB
=20=20sanity: Bump BitBake minimal version to 1.23.0

Paul Barker (1):
=20=20PR bumps to remove PRINC usage from meta-raspberrypi

Paul Eggleton (6):
=20=20sqlite3: restore upstream version numbering
=20=20oeqa/controllers/masterimage: more robust master image startup
=20=20classes/testimage: if start fails, don't try to stop
=20=20scripts/contrib/serdevtry: add script to handle transient serial =
terminals
=20=20scripts/contrib/dialog-power-control: add a trivial power prompt =
script
=20=20oeqa: add proper handling for command errors where needed

Richard Purdie (17):
=20=20cross: Drop virtclass-cross OVERRIDE
=20=20binutils/gcc/gdb: Add TARGET_ARCH to PN for all cross recipes
=20=20gcc-target: Limit compile to host targets, don't build runtimes.
=20=20gcc-common/gcc-configure-common: Move gnu-configize to its own shared =
task
=20=20gcc: Drop ARCH_FLAGS_FOR_TARGET usage
=20=20base.bbclass: Update INCOMPATIBLE_LICENSE changes for gcc updates
=20=20lib/oe/sdk: Ensure target directory exists before creating the link
=20=20tcmode-default: Update PREFERRED_PROVIDERS
=20=20tcmode-default.inc: Add default SDK PREFERRED_PROVIDERS
=20=20base.bbclass: Silence PREFERRED_PROVIDER warnings for sdk builds
=20=20layer.conf: Exclude gcc-cross dependencies from checksums
=20=20cross: Update PKG_CONFIG variables after recent changes
=20=20gcc-cross: Drop TARGET_CC_ARCH
=20=20gcc-common: Only apply fpu settings to target gcc
=20=20gcc-common: Ensure checksums don't change to match old behaviour
=20=20sstatetests: Update after binutils-cross name change with PN addition
=20=20sstatetests: Use TUNE_ARCH instead of TARGET_ARCH

Saul Wold (5):
=20=20mc: update to 4.8.12
=20=20man-pages: Update to 3.65
=20=20util-linux: Update to 2.24.2
=20=20lsbinitscripts: Update to 9.54
=20=20oprofileui*: Update to latest git

Stefan Stanacar (4):
=20=20oeqa/utils: sshcontrol: realtime logging of output
=20=20oeqa/controllers/masterimage: add a base class for hw targets
=20=20oeqa/targetcontrol: restart method shouldn't be abstract
=20=20oeqa/controllers/masterimage: add a serial control command

Tudor Florea (1):
=20=20curl: Backport a fix for a build issue

Valentin Popa (1):
=20=20lighttpd: upgrade to 1.4.35

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Anders Darander (2):
=20=20breakpad.bbclass: set includedir in CXXFLAGS
=20=20breakpad: update to latest svn

Andrea Adami (2):
=20=20kexecboot: fix build when S !=3D B
=20=20klcc_cross: move in target sysroot as crossscript

Andreas M=C3=BCller (2):
=20=20gnome-disk-utility: set correct nautilus configure options
=20=20devilspie2: update to 0.33

Ben Shelton (1):
=20=20xwd: add recipe

Changhyeok Bae (1):
=20=20lzip: Upgrade to 1.15

Chong Lu (1):
=20=20mariadb: add perl and perl modules to RDEPENDS

Chong.Lu@windriver.com (6):
=20=20ltrace: update to version 0.7.90
=20=20postgresql: add init script and DESCRIPTION
=20=20postgresql: split out some lib files into seperate packages
=20=20postgresql: split out contrib into seperate packages
=20=20postgresql: enable some bindings
=20=20rrdtool: enable perl and python bindings

Hongxu Jia (1):
=20=20libcanberra: fix QA Warning Files/directories were installed but not =
shipped

Jack Mitchell (3):
=20=20xterm: upgrade to 303, set B=3DS, licence tweak
=20=20tcpdump: inherit brokensep
=20=20bridge-utils: apply brokensep

Jackie Huang (8):
=20=20iozone: update version to 414
=20=20rsyslog: use BPN to fix multilib and add all licenses
=20=20rsyslog: add PACKAGECONFIG for optional features
=20=20rsyslog: Add config files and use update-alternatives for rsyslog
=20=20rsyslog: add DEPENDS on bison-native and flex-native
=20=20gd: split the binaries to package gd-tools
=20=20eject: Fix wrong return value
=20=20collectd: add threshold.so, load.so and disk.so in PRIVATE_LIBS

Kang Kai (1):
=20=20apache: upgrade to 2.4.9

Khem Raj (24):
=20=20gnome-control-center: Unbreak gnome images
=20=20fftw: Build native version as well
=20=20imagemagick: Update to 6.8.8
=20=20htop: Update 1.0.2 -> 1.0.3
=20=20mozjs: Fix build when B !=3D S
=20=20esound: Fix build when B !=3D S
=20=20libbonobo: Update to latest versions and fix build when S !=3D B
=20=20debianutils: Upgrade to 4.4
=20=20libxklavier: Update to 5.3 and fix build S !=3D B
=20=20lcms: Update to lcms2 version 2.6
=20=20liboauth: New recipe
=20=20xfsprogs: Do not do out-of-tree build yet
=20=20obexd, gnome-panel: Do not do out-of-tree builds yet
=20=20bonnie++, lmbench, obex-data-server, samba, sg3-utils: Do not do =
out-of-tree
=20=20epiphany: Fix build when S !=3D B
=20=20gedit: Fix build when S !=3D B
=20=20gnome-bluetooth: Fix build when S !=3D B
=20=20gnome-control-center: Fix build when S !=3D B
=20=20t1lib: Fix build when S !=3D B
=20=20gimp: Fix build when S !=3D B
=20=20i2c-tools: Fix build when S !=3D B
=20=20abiword: Fix build when S !=3D B
=20=20libgdata: Fix build when S !=3D B
=20=20llvm3: Fix build when S !=3D B

Koen Kooi (8):
=20=20fbida: update to latest git and make motif a PACKAGECONFIG option
=20=20jack: move to git
=20=20espeak: install header in proper location
=20=20mariadb: handle seperate builddir
=20=20openldap: inherit autotools-brokensep
=20=20libmcrypt: inherit autotools-brokensep
=20=20netperf: fix S!=3DB issues
=20=20fwts: inherit autotools-brokensep

Marc Ferland (1):
=20=20lmsensors: update 3.3.3 -> 3.3.5

Martin Jansa (2):
=20=20gnome-backgrounds: add intltool-native dependency
=20=20lighttpd: rename .bbappend to match with any version

Matthieu CRAPET (1):
=20=20cloud9: fix compilation error with o3 module

Micha=C3=ABl Burtin (1):
=20=20ruby: remove obsolete extmk_run.patch

Paul Barker (1):
=20=20vim: Don't build out-of-tree

Paul Eggleton (2):
=20=20modphp: fix for S !=3D B
=20=20xdebug: fix for S !=3D B

dv@pseudoterminal.org (1):
=20=20fbset: inherit from autotools-brokensep instead of autotools to fix =
build

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (2):
=20=20external-toolchain-angstrom.bb: Delete largely nused and unmaintained =
recipe
=20=20Updates to match to OE-Core toolchain reorg

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Carlos Rafael Giani (4):
=20=20chromium: Add component-build PACKAGECONFIG option
=20=20chromium: Add variable to contain extra command-line arguments
=20=20chromium: Add use-egl PACKAGECONFIG option
=20=20chromium: Add ignore-lost-context PACKAGECONFIG option

Otavio Salvador (3):
=20=20scripts/firefox-gen-l10n-recipes: Stop using PRINC
=20=20firefox-l10n-*: Drop PRINC use
=20=20firefox-addon-webconverger: Stop using PRINC

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

Jacob Kroon (1):
=20=20linux-imx-rt: Upgrade to 3.10.17-1.0.0 GA

Lauren Post (18):
=20=20firmware-imx: Update to 3.10.17-1.0.0 GA
=20=20imx-kobs: Update to 3.10.17-1.0.0 GA version
=20=20imx-uuc: Upgrade to 3.10.17-1.0.0 GA
=20=20imx-test: Update to 3.10.17-1.0.0 GA version
=20=20imx-vpu: Update to 3.10.17-1.0.0 GA version
=20=20imx-test-hdcp: Create 3.10.17-1.0.0 version
=20=20imx-lib: Update to 3.10.17-1.0.0 version
=20=20gst-fsl-plugin: Upgrade to 3.0.11 version
=20=20libfslvpuwrap: Update to 1.0.46 version
=20=20libfslparser: Update to 3.0.11 version
=20=20libfslcodec: Update to 3.0.11 version
=20=20linux-imx: Upgrade to 3.10.17-1.0.0 GA
=20=20uboot-imx: Upgrade to 3.10.17-1.0.0 GA for mx6
=20=20imx6slevk: Add spinor U-Boot support
=20=20gpu-viv-bin-mx6q: Update to 3.10.17-1.0.0 GA version
=20=20xf86-video-imxfb-vivante: Update to 3.10.17-1.0.0 GA
=20=20gpu-viv-g2d: Update to 3.10.17-1.0.0 GA version
=20=20linux-imx: Update defconfig for 3.10.17-1.0.0 GA

Mario Domenech Goulart (1):
=20=20scripts/get-maintainer: use printf instead of "echo -e"

Otavio Salvador (1):
=20=20libz160: Add 'mx5' to COMPATIBLE_MACHINE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Carlos Rafael Giani (1):
=20=20u-boot-cubox-i: update to ed888a1e88 SRCREV

Eric Nelson (1):
=20=20linux-boundary (3.10.17): Move to GA kernel (srcrev 731f96)

John Weber (1):
=20=20linux-wandboard (3.10.17): Move to GA kernel (srcrev 9d567e)

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

Darren Hart (1):
=20=20intel-common: Specify linux-yocto and cleanup order

Nitin A Kamble (4):
=20=20common linux-yocto_3.14: Update SRCREVs
=20=20crownbay linux-yocto_3.14: Update SRCREVs
=20=20emenlow linux-yocto_3.14: Update SRCREVs
=20=20fri2 linux-yocto_3.14: Update SRCREVs

Ong Boon Leong (1):
=20=20meta-haswell: fix email address for haswell-wc maintainer

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Erik Bot=C3=B6 (1):
=20=20persistence-client-library: disable parallel make

Florin Sarbu (6):
=20=20connman: Update .bbappend to 1.23 version
=20=20libitzam: Change do_install_prepend to copy packageconfig file     =
from buil
=20=20keyutils: Explicitly change directory to where the Makefile     =
resides befo
=20=20node-startup-controller: Explicitly create the m4 directory     in =
the sourc
=20=20node-state-manager: Use inherit autotools-brokensep instead     of =
autotools
=20=20node-health-monitor: Use inherit autotools-brokensep     instead of =
autotool

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

Alex J Lennon (1):
=20=20mono, mono-native:

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Andrii Motsok (1):
=20=20webos-image: openssl=3Dv1.0.1g

Simon Busch (2):
=20=20python-dbusmock: Add recipe for v0.10.1
=20=20webos-image: linux-yocto=3Dwebos5

dongsun.kim (1):
=20=20webos-image: librolegen=3D20-r4

pugalendhi ganesan (1):
=20=20webos-image: smartkey-hun=3D16

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (2):
=20=20machine/boards: Fix-up naming of common dtsi files
=20=20machine-xilinx-default.inc: Move base dts includes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Irina Patru (1):
=20=20package_regex.inc: Changed, removed and added regexes

Paul Eggleton (1):
=20=20meta-yocto-bsp: oeqa/controllers: add EdgeRouterTarget

Stefan Stanacar (1):
=20=20meta-yocto-bsp: oeqa/controllers: add BeagleBoneTarget

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



