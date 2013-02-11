Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1U4y2t-0000Bh-NQ; Mon, 11 Feb 2013 19:24:39 +0100
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1U4xbv-0008G9-Dx; Mon, 11 Feb 2013 12:56:14 -0500
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 11 Feb 2013 18:07:55 GMT
Message-Id: <1360606075294.9f9b81a3@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-02-03 until 2013-02-10
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
X-List-Received-Date: Mon, 11 Feb 2013 18:24:42 -0000
X-List-Received-Date: Mon, 11 Feb 2013 18:24:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-02-03 until 2013-02-10.  Projects included in this =
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

Darren Hart (3):
=20=20bitbake: fetch2: Print the complete SRCREV variable name when INVALID
=20=20fetch2: Export upper and lower case environment variables
=20=20fetch2: Remove broken git variables from the environment

Richard Purdie (5):
=20=20compat/utils: Add copy of python multiprocessing pool for pre 2.7.3 =
issues
=20=20cooker/utils: Drop custom 'interactive' variables list and store =
environment
=20=20Update version to 1.17.0
=20=20bitbake: Always use separate process for PR Service
=20=20prserv/serv.py: Fix logging in daemon mode

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andrei Dinu (1):
=20=20pax-utils : upgrade to 0.6

Andy Dalton (1):
=20=20v86d: Update SRC_URI to point to new file location.

Bernhard Reutner-Fischer (5):
=20=20base.bbclass: Commentary typo fix
=20=20uclibc: add c6x arch
=20=20uclibc: turn on kernel module support
=20=20base.bbclass: remove redundant setting of MAKE
=20=20create-pull-request: Error message on missing -u

Bogdan Marinescu (2):
=20=20distcc: updated to version 3.1
=20=20intltool: updated to 0.50.2

Bruce Ashfield (8):
=20=20guilt: remove GIT_EXEC_BASE export
=20=20kernel-yocto: make configuration audit details debug only
=20=20kernel-yocto: fix .scc and .cfg matching
=20=20kernel-yocto: allow multiple / shared kernel feature directories
=20=20kernel-yocto/linux-yocto-custom: support low bandwidth options
=20=20linux-yocto/dev: linux-yocto development tree tracking recipe
=20=20linux-yocto/3.4: update to v3.4.28, 3.4.28-rt40
=20=20linux-yocto: KERNEL_FEATURES should reference full scc files

Chen Qi (3):
=20=20sysvinit: add ROOTFS_READ_ONLY variable to rcS-default
=20=20initscripts: let populate-volatile.sh create the /tmp link
=20=20initscripts: add read-only-rootfs-hook.sh script

Constantin Musca (12):
=20=20enchant: use BPN instead of PN
=20=20console-tools: fix linking when using the multilib compiler
=20=20sgml-common: use ${PN} instead of sgml-common
=20=20syslinux: use BPN instead of PN
=20=20foomatic-filters: fix CUPS directory config
=20=20taglib: use LIB_SUFFIX in order to determine the correct baselib
=20=20run-postinsts: use BPN instead of PN
=20=20consolekit: add arch independent unpackaged files
=20=20gcc: target: fix libiberty removal
=20=20blktool: fix SRC_URI typo
=20=20classextend.py: use explode_dep_versions2 in order to preserve =
versions too
=20=20netbase: split up in netbase and init-ifupdown

Cristian Iorga (1):
=20=20net-tools: upgrade to v1.60-24.2

David Nystr=C3=B6m (2):
=20=20scripts/create-recipe: Python improvements for create-recipe.
=20=20scripts/create-recipe: Bugfixes for create-recipe easy_install =
handling.

Denys Dmytriyenko (1):
=20=20nativesdk-qt4-tools: fix DEPENDS, as nativesdk is now prefixed

Eric B=C3=A9nard (1):
=20=20qt4: fix CVE-2013-0254

Holger Hans Peter Freyther (1):
=20=20systemd_197.bb: Point to the place where we keep the /etc/rcN.d files

Ian Reinhart Geiser (1):
=20=20initramds-framework: add shutdown hook for udev

Jackie Huang (1):
=20=20populate_sdk_base.bbclass: add execution permission for =
self-extracting arch

Jason Wessel (1):
=20=20eglibc-nativesdk: Fix buffer overrun with a relocated SDK

Jesse Zhang (6):
=20=20ghostscript: add pregenerated objarch for mipsel/mips64/mips64el
=20=20libart-lgpl: add art_config for mips64/mips64el
=20=20ghostscript: fix endianness detection
=20=20coreutils: remove dependency on coreutils-native
=20=20initscripts: Add status function to /etc/init.d/functions
=20=20udev: Add start/stop/status/restart support to init script

Jim Somerville (1):
=20=20rt-tests: fix cyclictest reported 1 sec latencies

Khem Raj (2):
=20=20libgcc: Disable multilib install for nativesdk
=20=20package.bbclass: Replace undefined 'src' with valid variable

Laurentiu Palcu (15):
=20=20update-modules: remove recipe from oe-core
=20=20add fontcache.bbclass
=20=20add qemuwrapper-cross recipe
=20=20qemu.bbclass: return qemuwrapper instead of qemu-allarch
=20=20image.bbclass: add a proper error message if hook script fails
=20=20fontconfig: add sysroot option to fc-cache and fc-cat
=20=20liberation-fonts: use the new fontcache.bbclass
=20=20package_ipk, rootfs_ipk: remove the "set -x"
=20=20pulseaudio: do not postpone postinstall
=20=20base-files: remove /var/cache from volatiles
=20=20fs-perms: remove /var/cache from volatiles
=20=20initscripts: remove /var/cache from volatiles
=20=20rpm: remove /var/volatiles/cache/rpm from the FILEs list
=20=20systemd: remove /var/cache from volatiles
=20=20qemu.bbclass: fix segfaults when running through pseudo

Marko Lindqvist (3):
=20=20opkg: replace obsolete automake macros with working ones
=20=20matchbox-wm: update to git master head
=20=20rpcbind: replace obsolete automake macros with working ones

Martin Jansa (10):
=20=20sip.bbclass: improve RDEPENDS to add python-sip only for PN
=20=20openssh: fix RPROVIDES
=20=20dropbear: fix RPROVIDES
=20=20ipk: use OPKGLIBDIR in all places
=20=20send-pull-request: add extra CC argument
=20=20package.bbclass: return list of packages created in do_split_packages
=20=20libxscrnsaver: improve RREPLACES to add libxss only for PN
=20=20insane.bbclass: Add missing R* variables to pkgvarcheck
=20=20bitbake-prserv-tool: show error when export file does not exist
=20=20qemu: disable smartcard support

Matthew McClintock (4):
=20=20glib: disable selinux for native builds
=20=20quota_4.01.bb: add e2fsprogs in DEPENDS
=20=20libpfm4_4.3.0.bb: add libpfm4 recipe needed by oprofile for ppc
=20=20oprofile: fix cross compile on powerpc and add libpfm4 dep

Paul Eggleton (1):
=20=20qmmp: update to 0.6.6 and fix

Peter Seebach (2):
=20=20package.bbclass: Allow per-package SKIP_FILEDEPS
=20=20pseudo.inc: Fix sqlite libdir again, pseudo 1.4.3

Radu Moisan (1):
=20=20polkit: Enable systemd support

Randy MacLeod (1):
=20=20openssl: Add mips64 configure support.

Richard Purdie (42):
=20=20dpkg: Add missing pkgconfig dependency
=20=20qemu: Set RDEPENDS on the specific package that needs it
=20=20gdb-cross-canadian: Set RDEPENDS on the specific package that needs it
=20=20initramfs-live-boot: Set RDEPENDS on the specific package that needs =
it
=20=20libxml-sax-base-perl: Improve RDEPENDS to be package specific
=20=20hwlatdetect: Improve RDEPENDS to be package specific
=20=20dbus-ptest: Improve RDEPENDS to be package specific
=20=20initramfsframework: Improve RDEPENDS to be package specific
=20=20cpan-base.bbclass: Improve RDEPENDS to be package specific
=20=20sstate/path.py: Add copyhardlinktree() function and use for =
performance opti
=20=20sstate.bbclass: Ensure build directory is cleaned to start with
=20=20package.bbclass: Multithread per file dependency generation code
=20=20package: Don't export PATH
=20=20package: Process package stripping in parallel
=20=20package.bbclass: use the multiprocess pool from bitbake
=20=20insane.bbclass: Add pkgvarcheck to check for suboptimal usages of =
variables
=20=20insane.bbclass: Add documentation headers for logical code blocks
=20=20staging/insane.bbclass: Move legacy do_stage check iinto =
insane.bbclass
=20=20staging.bbclass: Drop unused/legacy function
=20=20update-rc.d: Drop OVERRIDES code
=20=20package.bbclass: Fix up bb.mkdirhier/bb.copyfile usage
=20=20package.bbclass: Rewrite split_and_strip_files
=20=20kernel.bbclass: Improve populate_packages_prepend
=20=20package.bbclass: Make use of cleandirs and dirs function flags
=20=20package.bbclass: Various minor performance tweaks
=20=20package.bbclass: Simplify empty directory removal
=20=20package.bbclass: Add PACKAGESPLITFUNCS variable
=20=20package.bbclass: Better document the different phases of operation
=20=20package.bbclass: Pre-expand some variables to save time
=20=20sanity.conf: Update minimum bitbake version
=20=20initiscripts: Fix populate-volatiles.sh whitespace
=20=20package.bbclass: Ensure package_get_auto_pr is run at the correct =
point
=20=20bitbake.conf: Update hashconfig after BB_ORIGENV changes
=20=20terminal.bbclass: Use BB_ORIGENV to restore user environmental =
variables
=20=20imagetest-qemu: Adapt to bitbake environment changes
=20=20directfb: Really disable mesa
=20=20sanity.bbclass: Check for DISPLAY for qemutests in BB_ORIGENV now
=20=20qemuwrapper: Don't use STAGING_BINDIR_CROSS directly
=20=20image.bbclass: Add MLPREFIX to DEPENDS
=20=20qemu.bbclass: Use the correct qemu binary in multilib cases
=20=20dbus: Drop old 1.5.12 version
=20=20dbus-native: Don't install dbus-launch

Ross Burton (12):
=20=20avahi: fix relative path in do_configure
=20=20gtk+: add missing $S references in do_install
=20=20libpcap: fix relative path references
=20=20gdk-pixbuf: use correct build path when installing
=20=20cmake: reset B from autotools, as this class doesnt like it
=20=20packagegroup-core-x11-sato: remove matchbox-stroke
=20=20orinoco-conf: remove
=20=20packagegroup-core-tools-testapps: remove clutter-box2d
=20=20clutter-box2d: remove
=20=20matchbox-stroke: remove
=20=20scripts/wipe-sysroot: add script to safely wipe the sysroots
=20=20connman: be explicit when enabling ofono

Roy.Li (1):
=20=20tcp-wrappers: remove size_t.patch

Saul Wold (2):
=20=20v86d: Use BP instead of P
=20=20Revert: update-rc.d: disable update-rc.d.bbclass when systemd enabled

Tom Zanussi (1):
=20=20crosstap: handle hyphenated x86_64 target arch

Xin Ouyang (1):
=20=20libcgroup: fix failure for absolute path

yanjun.zhu (1):
=20=20pulseaudio_2.1: Remove the dependence of fftw.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (4):
=20=20xfce4-mount-plugin: initial add 0.6.4
=20=20packagegroup-xfce-extended: add xfce4-mount-plugin
=20=20packagegroup-xfce-extended: add xfce4-brightness-plugin
=20=20orage: initial add 4.8.4

Marcin Juszkiewicz (1):
=20=20python-numpy: add 1.7.0rc1

Martin Jansa (5):
=20=20gnome-panel: append pkg_postinst only on PN
=20=20enjoy: improve RDEPENDS to set it only on PN
=20=20patches: update Upstream-Status to use capital 'S'
=20=20nodejs: export DESTDIR to fix build with dash
=20=20ttf: introduce update-fonts bbclass and change all ttf recipes to use =
it

Paul Eggleton (3):
=20=20gnome-vfs: use RPROVIDES correctly
=20=20tiobench: use RDEPENDS correctly
=20=20qconnman: use RCONFLICTS correctly

Randy MacLeod (1):
=20=20multilib: Fix PN - BPN to make fetch work.

yanjun.zhu (1):
=20=20netcat: call out glib-2.0 dependency

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (11):
=20=20php: rename bbappend from version 5.3.6 to 5.3.19, to match meta-oe
=20=20gcc-crosssdk-intermediate.inc: fix the wrong placement of nativesdk =
prefix f
=20=20eglibc: overlay common include files from denzil
=20=20gcc: overlay common include files from denzil
=20=20gcc-cross-canadian: sync up with oe-core for nativesdk related fixes
=20=20packagegroup*.bb: update recipe to drop reduntant variables and =
LIC_FILES_CH
=20=20layer.conf: add a top-level ARAGOBASE variable
=20=20relocate_sdk.py: fixed SDK-setup script to properly update dynamic =
loader pa
=20=20chrpath.bbclass: fixed rpath substitutions for normalized paths
=20=20arago.conf: revert to default SDKPATH, bump the distro version
=20=20meta-toolchain-arago: update handling of cross-canadian binaries and =
SDK rel

Franklin S. Cooper Jr (1):
=20=20php_5.3.19: Do not build php-fpm

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (3):
=20=20common-bsp: add beaglebone machine config
=20=20linux-mainline-3.8: update to latest 3.8rc
=20=20README: document machine_kernel_pr class dependency

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Eric B=C3=A9nard (1):
=20=20README: add git send-email command line

Fahad Usman (3):
=20=20chromium: fix webkit build with newer bison
=20=20chromium: fix dependencies
=20=20nss: fix access to https websites

Martin Jansa (1):
=20=20firefox-l10n, firefox-addon: use RDEPENDS_${PN}

Venture Research (3):
=20=20nss: updating nss.pc.in to include /usr/include/mozilla/nss directory
=20=20ninja-native: adding initial ninja build support for chromium
=20=20chromium: adding updated version 24.0.1312.52; refactor build

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

Mario Domenech Goulart (3):
=20=20chicken: update to version 4.8.0.1
=20=20chicken: add patch to avoid applying PROGRAM_PREFIX/SUFFIX to target =
include
=20=20chicken: fix C_COMPILER for the target chicken

Otavio Salvador (3):
=20=20Fix all chicken-egg packages to use package specific RDEPENDS
=20=20gen-egg-recipes: Use package specific RDEPENDS
=20=20core-image-chicken: Add example image

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Eric B=C3=A9nard (2):
=20=20xf86-video-imxfb: fix build error due to missing uint declaration
=20=20gst-fsl-plugin-2.0.3: fix build error due to missing uint declaration

Jeremy Stashluk (1):
=20=20gpu-viv-bin-mx6q: fix gc_vdk_types include path

Leonardo Sandoval (2):
=20=20qt4: Add a unreference instruction on qt4 phonon patch
=20=20imx-test: Condition the mxc_epdc_x11_fb_test installation

Otavio Salvador (2):
=20=20linux-fslc: Update to 3.7.5 based kernel
=20=20u-boot-fslc: Update GIT revision for 20130207 snapshot

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

Tomas Frydrych (9):
=20=20Support for Intel NUC
=20=20lirc-modules: add 3.4 kernel patch also for NUC
=20=20nuc.conf: mask out meta-nuc hdmi hack
=20=20pulseaudio: provide specific pa config for the nuc
=20=20mesa-dri-egl: fix up the recipe so things compile without gl/glx; =
added NUC
=20=20cogl-1.12: added base config for KMS+GLES2 set up
=20=20cogl-1.12: fix compilation failure in kms backend
=20=20clutter-gst-1.6: fix for when no GLES1 is present
=20=20task-guacamayo-mex-egl: added mesa-dri-driver-i965 to RDEPENDS for NUC

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (7):
=20=20u-boot: Add consoleblank=3D0 to default parameters to avoid =
screensaver
=20=20u-boot-variables: fix consoleblank entry
=20=20card-*.sh: force to bash / align copyright
=20=20linux-mainline_3.2: PV don't conflict with meta-ti
=20=20linux-common.inc: avoid cheanging meta-ti SRCREV
=20=20linux.inc: restore linux drivers/gpu/drm/*.c for X11 part of =
omap3-sgx-modul

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Tom Zanussi (1):
=20=20meta-intel: remove kernel AUTOREVs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (5):
=20=20systemd: Remove bbappend as xz is not GPLv3
=20=20qemux86.cfg: Activate ecryptfs
=20=20vexpress_a9.cfg: Activate ecryptfs
=20=20linux-yocto: Add PRINC
=20=20packagegroup-core-p1: Remove wpa-supplicant-systemd as systemd =
services are=20

Florin Sarbu (8):
=20=20linux-yocto: Remove =
0001-net-bus-add-the-AF_BUS-socket-address-family.patch=20
=20=20nfs-utils: Update .bbappend to version 1.2.7
=20=20eglibc: Update .bbappend to version 2.17
=20=20keyutils: Fix compiling for x86 64 bit target
=20=20poky-ivi-systemd: Add xf86-video-vmware for x86 64 bit target.
=20=20ecryptfs-utils: Add dependency on intltool-native
=20=20linux-yocto: Add kernel fragment file for qemux86-64, needed to     =
add AF_B
=20=20README.md: Add info about qemux86-64

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

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

Keith Derrick (2):
=20=20pmcertificatemgr: add dependency on ca-certificates
=20=20webosvbox: Suppress ssh errors

Martin Jansa (9):
=20=20webos: Add Ubuntu 12.04.2 LTS to SANITY_TESTED_DISTROS
=20=20connman: Fix bbappend
=20=20opkg: Change opkglibdir to libdir
=20=20webos-image: Pull opkg with package-management IMAGE_FEATURE
=20=20qt4-webos: Add icu to DEPENDS
=20=20cpushareholder-stub: Fix RPROVIDES
=20=20sqlite3: Drop superfluous patch=3D1 from SRC_URI, move patch to BPN
=20=20rdx-utils-stub: Fix RPROVIDES
=20=20webos.conf: Remove comments with trailing backslash

Sapna Todwal (2):
=20=20connman: Replace init.d script for connman
=20=20webos-image: webos-connman-adapter=3D4

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Laurentiu Palcu (1):
=20=20(distro_alias|maintainers|recipe_color).inc: remove update-modules

Paul Eggleton (1):
=20=20Remove zypper from distro tracking files

Richard Purdie (1):
=20=20poky: Enable pkgvarcheck warnings

Tom Zanussi (1):
=20=20yocto-bsp: prepend includes in machine.scc files with machine

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




