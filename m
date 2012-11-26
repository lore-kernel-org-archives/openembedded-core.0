Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1Td3b9-0006Kj-5c; Mon, 26 Nov 2012 19:40:05 +0100
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1Td3EJ-0004NA-1P; Mon, 26 Nov 2012 13:16:29 -0500
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 26 Nov 2012 18:25:41 GMT
Message-Id: <1353954341418.dbbe9a7a@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2012-11-18 until 2012-11-25
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2012 18:40:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2012-11-18 until 2012-11-25.  Projects included in this =
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

Cristiana Voicu (1):
=20=20hob: warnings during the build should be displayed in the Issues tab

Richard Purdie (3):
=20=20parse/cache/cooker: Preserve order in the file inclusion list
=20=20runqueue: Allow partial setscene task coverage
=20=20server/process.py: Change timeout error handling

Seth Bollinger (1):
=20=20knotty: Colorize knotty interactive console output

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Bruce Ashfield (14):
=20=20linux-yocto/3.4: nfsd, pci, fishriver and rangely config changes
=20=20linux-yocto/3.4: efi/mmc fixes and fri2 updates
=20=20linux-yocto/3.4: bump kver to v3.4.16
=20=20linux-yocto/3.4: v3.4.17, v3.4.18, -rt and config changes
=20=20linux-yocto/3.2: update to v3.2.32 and 3.2.32-rt48
=20=20kern-tools: kconf_check: fix find warning
=20=20kern-tools: flexibility and usability enhancements
=20=20guilt: change upstream tgz location
=20=20linux-yocto/3.0: fix virtio configuration typo
=20=20linux-yocto/3.4: uprobes: reinstate config options for 'uprobe' =
feature
=20=20kernel-yocto: clarify KMETA branch comments
=20=20kern-tools: report missing config fragments by name
=20=20linux-yocto-3.4: gcc optimization config feature
=20=20kern-tools: report missing config fragments by name

Colin Walters (1):
=20=20gcc: Add --enable-linker-build-id

Cristian Iorga (2):
=20=20builder: fix adduser breakage with password
=20=20build-appliance-image: Update to =
dee77eca39f406f90e60d9c5ef7a66fcc8f57dbf co

Eric B=C3=A9nard (1):
=20=20kmod: fix git repo URL

Jackie Huang (2):
=20=20python-pygtk: add gtk-types.defs into gdk.c dependence
=20=20eglibc: always compile with optimization.

Joe Slater (6):
=20=20procps: pass CFLAGS to make
=20=20iproute2: pass CFLAGS to Makefile\
=20=20mingetty: replace cflags hard-coded into Makefile
=20=20zip: pay some attention to our CFLAGS
=20=20unzip: pay some attention to our CFLAGS
=20=20curl: eliminate forced setting of -g0 when compiling

Kang Kai (3):
=20=20lsb: move links from lsbsetup to here
=20=20packagegroup-core-lsb: remove lsbsetup
=20=20lsbsetup: drop it

Koen Kooi (1):
=20=20image classes: use PN for depends, not IMAGE_BASE_NAME

Laurentiu Palcu (9):
=20=20xkeyboard-config: upgrade to 2.7
=20=20libdrm: upgrade to 2.4.40
=20=20xserver-xorg: upgrade to 1.13.0
=20=20xf86-video-vmware: Add compat API
=20=20xf86-input-synaptics: add mtdev dependency
=20=20xf86-video-omap: add new recipe to follow the maintained repo
=20=20binutils-crosssdk: do not set .interp size to 0x1000 for partial =
linked obje
=20=20perl: use the exported LDDLFLAGS in generate_config_sh script
=20=20meta-toolchain-qte: add --sysroot option to OE_QMAKE_(CC|CXX|LD)

Marcin Juszkiewicz (4):
=20=20ncurses: update gnu-config files in do_configure()
=20=20strace: backport AArch64 support
=20=20db: update gnu-config files in do_configure()
=20=20archiver.bbclass: DISTRO is not required variable so deal with it

Marko Lindqvist (1):
=20=20gtk+: update to upstream version 2.24.13

Martin Jansa (6):
=20=20opkg: drop PACKAGE_ARCH setting for update-alternatives-cworth
=20=20opkg: bump SRCREV and drop applied patches
=20=20xf86-video-omap: add xf86driproto dependency, drop --enable-neon and =
improve
=20=20xserver-xorg: disable dri2 too when building without glx PACKAGECONFIG
=20=20xf86-video-omapfb: revive driver which actually works and is tested =
on real=20
=20=20xf86-video-omap: drop RPROVIDES/RREPLACES/RCONFLICTS

Philip Balister (1):
=20=20insane.bbclass : Disable tests for unsafe references in binaries and =
scripts

Richard Purdie (31):
=20=20scripts/pybootchart: Fix missing entries bug
=20=20scripts/pybootchart: Allow minimum task length to be configured from =
the com
=20=20sstate: Implement a setscene dependency validation routine to allow =
skipping
=20=20image.bbclass: Add missing dependency on do_package data
=20=20bitbake.conf/sanity: Separate versions and PN stamp components into =
separate
=20=20license: We need to run this task before do_build, there is no =
dependency on
=20=20package.bbclass: Adapt debugsrc code to workdir layout changes
=20=20libcheck: Add missing rdepends on gawk and set path correctly
=20=20multilib.bbclass: Drop populate_sdk_base exclusion
=20=20build-appliance-image: Simplify fetch/unpack execution
=20=20gcc: Use FILESPATH instead of FILESDIR and cleanup/simplify
=20=20qemu_git: Drop unnecessary FILESDIR setting
=20=20opkg: Drop unnecessary FILESDIR setting
=20=20x-load: Replace FILESDIR with FILESPATH
=20=20bitbake.conf: Drop obsolete FILESDIR setting
=20=20matchbox-panel-2: Use a more standard layout for patch files
=20=20trace-cmd: Simplify SRC_URI patch entry
=20=20libffi: Use a more standard layout for patch files
=20=20utils: Optimise looping in base_set_filespath
=20=20classes: Drop do_package stamp-extra-info
=20=20ldconfig/cdrtools/icecc-create-env/linuxdoc-tools/python: Set =
FILESPATH to f
=20=20Revert "bitbake.conf: Drop obsolete FILESDIR setting"
=20=20xf86-video-omapfb: drop
=20=20python-smart-backend: Remove bogus runtime virtual/
=20=20Revert "kern-tools: report missing config fragments by name"
=20=20scripts/cleanup-workdir: Adpat to new workdir layout
=20=20scripts/sstate-cache-management.sh: Fix stamp handling after recent =
layout c
=20=20build-appliance-image: Add explict dependency on do_unpack
=20=20sstate: Add a rule for target sysroot requirements from cross =
dependencies
=20=20sstate: Explicitly define populate_sysroot task relationships
=20=20gcc-cross: Explicitly depend on linux-libc-headers

Ross Burton (8):
=20=20qt4: remove negative preference on 4.8.3
=20=20qt4: remove 4.8.1
=20=20flac: fix text relocations
=20=20mesa: add -mesa suffix to GL packages, RPROVIDE their generic names
=20=20mesa: default to enabling EGL and GLES
=20=20ia32-base: fix typo in XSERVER_IA32_EXT definition
=20=20mesa-dri: add correct RPROVIDES for the -dev packages
=20=20xf86-video-omap: don't use AC_CHECK_FILE

Roy Li (1):
=20=20bind: make "/etc/init.d/bind stop" work

Saul Wold (16):
=20=20sysstat: Update to 10.1.2
=20=20builder: Add password for user
=20=20sqlite3: Update to 3.7.14.1
=20=20libcheck: Update to 0.9.9
=20=20libtasn1: Update to 2.14
=20=20libproxy: set LIBEXEC_INSTALL_DIR
=20=20libdumpvalue-perl: Update to 1.17
=20=20rt-tests/hwlatdetect: Update to 0.85
=20=20tiff: Update to 4.0.3
=20=20man-pages: Update to 3.44
=20=20mc: Update to 4.8.6
=20=20resolvconf: Update to 1.68
=20=20libxml2: Update to 2.9.0
=20=20dhcp: Update to 4.2.4-P2
=20=20libksba: Update to 1.3.0
=20=20gnutls: Update to 2.12.21

Stefan Herbrechtsmeier (1):
=20=20distutils-common-base: Create staticdev pacakge for static libraries

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Jackie Huang (1):
=20=20ptpd-2.2.0: drop the patch adjust-daemon-name.patch

Koen Kooi (1):
=20=20Revert "ntp: Clean up recipes"

Marcin Juszkiewicz (1):
=20=20mysql: make it work after $libexec change - LP: #1068759

Mario Domenech Goulart (1):
=20=20orbit2: put .a files into ${PN}-staticdev package

Martin Jansa (2):
=20=20qt4-x11-free: drop bbappend for 4.8.1
=20=20qt4-embedded: drop bbappend for 4.8.1

Otavio Salvador (2):
=20=20meta-systemd: Move ntp recipes to 'meta-networking' sublayer
=20=20meta-systemd: meta-networking: ntp: Update bbappend to 4.2.6p5

dhall (1):
=20=20aoetools: add a recipe for version 34

xin.ouyang@windriver.com (1):
=20=20netperf: import from oe-classic and upgrade to 2.6.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (4):
=20=20task-arago-tisdk-matrix: remove dependencies on gui and qt for =
keystone
=20=20matrix_gui: remove dependencies on gui and qt for keystone
=20=20tcmode-external-arago: package gdbserver from the external toolchain
=20=20meta-toolchain-arago: use own task-arago-standalone-sdk-target task

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

Adrian Alonso (2):
=20=20xf86-dri-vivante: Add Vivante DRI driver for Xorg
=20=20xf86-video-imxfb-vivante: Add Vivante Xorg driver for iMX SoCs

Daiane Angolini (1):
=20=20linux-imx (3.0.35): Configure GPU module to be builtin

Otavio Salvador (12):
=20=20gsl-fsl-plugin.inc: Set package architecture as machine specific
=20=20gst-fsl-plugin (2.0.3): Set compatible machine for mx5
=20=20firmware-imx: Add 12.09.01 version
=20=20imx-base.inc: Add iMX6 firmware information
=20=20imx-lib: Add 12.09.01 version
=20=20imx-test: Add 12.09.01 version
=20=20README: Change supported branch of OE-Core and Meta-OE to danny
=20=20linux-imx (3.0.35): Move defconfig to mx6 directory
=20=20gpu-viv-bin-mx6q: Add Vivante GPU libraries
=20=20mesa-dri: Change provided set of libraries when building for iMX6
=20=20xserver-xf86-config: Use Vivante accelerated driver for iMX6
=20=20imx-base: Use xf86-video-imxfb-vivante for iMX6 targets

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

Saul Wold (3):
=20=20Add SRCREV to prevent bitbake from complaining
=20=20create meta-guacamayo-bsp
=20=20connman: Ensure plugins directory exists

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

Adam (2):
=20=20Added rfkill patch to work in non-git environment
=20=20Removed white spaces from the patch file

Ubuntu (4):
=20=20Updated master
=20=20Oops, gave it a wrong file name =3D(
=20=20Aaaah please work!
=20=20Added a/ b/ prefixes to the file name

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

Enrico Butera (1):
=20=20Merge pull request #10 from martinezjavier/master

Javier Martinez Canillas (4):
=20=20linux-3.2: remove commented lines
=20=20linux-3.2: use oe-core kernel class instead of custom linux.inc
=20=20linux: remove unused linux.inc
=20=20linux: add a mainline kernel recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Khem Raj (1):
=20=20mesa-dri_8.0.4.bbappend: Remove tabs from python code

Koen Kooi (1):
=20=20meta-fri2: update README to match current emgd driver version

Nitin A Kamble (1):
=20=20emgd-driver-bin: remove duplicate files & fix soft links

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (13):
=20=20sdcard_image: Add class to create sd image for vexpressa9
=20=20scripts: Remove script for vexpressa9 sdimg and related modifications
=20=20scripts: Remove useless scripts
=20=20vexpressa9.conf: Add ext3 and vexpressa9-sdimg to IMAGE_FSTYPES
=20=20vexpressa9.conf: Remove jffs2 from IMAGE_FSTYPES
=20=20procps: Add bbappend to add patch for cgroup support
=20=20packagegroup-core-boot-genivi: Add procps
=20=20busybox: Add defconfig to remove some utils provided by procs
=20=20busybox: Deactivate udhcpc - connmand is used
=20=20qt4: Remove DEFAULT_PREFERENCE as this is the version used in poky
=20=20bblayers.conf.sample: Remove file - not used anymore
=20=20ivi-image.inc: Don't inherit sd image class as we use IMAGE_CLASSES =
for that
=20=20packagegroups: Remove license file as packagegroups use layer license

Florin Sarbu (1):
=20=20README.md: update with info related to building for qemux86 too.

Holger Behrens (1):
=20=20excalibur-image: inc RV

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (6):
=20=20openjdk7: copy over the openjdk7 from openjdk7-branch
=20=20icedtea7-native: simple copy over from openjdk-7 branch
=20=20openjdk7: update to version 2.1.3
=20=20icedtea7-native: update to version 2.1.3
=20=20README: add entries for openjdk7
=20=20README: update version entry for openjdk6

Khem Raj (3):
=20=20llvm2.8: Fix build break discovred by unanchored regexp fix in bitbake
=20=20rhino: Correctly specify the LICENSE field
=20=20recipes: Fix license strings to match common licenses

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

Richard Purdie (1):
=20=20qt-x11-free-native: Set FILESPATH to find -native files

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (2):
=20=20shr-wizard: bump SRCREV and add psmisc to RDEPENDS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (1):
=20=20u-boot: add version 2012.07 for keystone machines

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Herb Kuta (7):
=20=20Set the layer priority to be a constant (10)
=20=20Drop the empty file external-fixed-revisions.inc
=20=20Remove the never-used webos-internal image and task/package group
=20=20Remove the never-used file tcmode-x86host.inc
=20=20Remove the never-used file task-bsp-webos.bb
=20=20mm-common: Remove unneeded build dependencies
=20=20webos.conf: Fix for no images created for non-QEMU MACHINE-s

Keith Derrick (1):
=20=20webos-image: luna-service2=3Dv3.1.0

Roger Stringer (1):
=20=20webos-image submission: keyboard-efigs=3D0.91,v3.0.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Adrian Alonso (1):
=20=20README: add maintainers contact information

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Constantin Musca (1):
=20=20maintainers.inc: Update ownership of recipes

Laurentiu Palcu (2):
=20=20yocto-bsp: update configs after xorg upgrade
=20=20yocto-bsp: upgdate configs after xf86-video-omapfb changed name

Richard Purdie (1):
=20=20qt4-x11-free: Switch to 4.8.3

Ross Burton (1):
=20=20qt4: remove qt4-x11-free bbappend

Saul Wold (1):
=20=20maintainers: Tweak ownership of recipes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




