Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (new.bec-systems.com [74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id 505C560304;
	Mon, 17 Jun 2013 20:19:01 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1UofpU-0007Qa-IN; Mon, 17 Jun 2013 16:15:18 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 17 Jun 2013 20:18:39 GMT
Message-Id: <1371500319364.487a1afe@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-06-09 until 2013-06-16
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
X-List-Received-Date: Mon, 17 Jun 2013 20:19:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-06-09 until 2013-06-16.  Projects included in this =
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

Alexandru DAMIAN (1):
=20=20xmlrpc: removes the event servers controller

Bogdan Marinescu (1):
=20=20bitbake: Add event mask flag support

Paul Eggleton (2):
=20=20tinfoil: fix for move of data attribute to cooker
=20=20bitbake-layers: fix for move of data object to cooker

Richard Purdie (11):
=20=20fetch2: Fix AUTOINC handling
=20=20runqueue: Split runqueue to use bitbake-worker
=20=20runqueue: Move the bitbake-worker execution to a higher level
=20=20runqueue: Abstract the start and teardown worker functions
=20=20runqueue: Spawn a separate worker for fakeroot tasks
=20=20prserv: Adapt autostart to bitbake-worker
=20=20bitbake: Bump minimum python version to 2.7.3
=20=20bitbake: Update version to 1.19.1
=20=20runqueue: Improve handling of failing setscene tasks with hard =
dependencies
=20=20compat/server/utils: Jettison pre python 2.7.3 workarounds
=20=20utils: Fix multiprocessing pool reference

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andrei Dinu (3):
=20=20openssh : upgrade to 6.2p2
=20=20sudo : upgrade to 1.8.6p8
=20=20gzip : upgrade to 1.6

Andy Voltz (1):
=20=20tune-cortexa*.inc: fix tunings for cortex a5, a7, a8, a9, a15 =
machines.

Carlos Rafael Giani (1):
=20=20gstreamer: added GStreamer 1.0 recipes

Christopher Larson (13):
=20=20connman: use PACKAGECONFIG for WISPr support
=20=20packagegroup-base-vfat: include dosfsprogs
=20=20insane.bbclass: quiet package errors not in *_QA
=20=20packagegroup-core-tools-profile: don't exclude mips
=20=20license.bbclass: include all licenses in the manifest
=20=20avahi: inherit python classes, use PACKAGECONFIG
=20=20gconf: inherit gettext
=20=20copyleft_compliance: handle localpaths ending with '/'
=20=20sstate.bbclass: kill MIRRORS and FILESPATH to speed up fetching
=20=20sstate.bbclass: fetch archive+siginfo in a single pstaging_fetch
=20=20copyleft_compliance: set 'dirs' flag on task
=20=20packagegroup-base: s/dosfsprogs/dosfstools/
=20=20libnewt: split python module into libnewt-python

Felipe F. Tonello (2):
=20=20libxml2: added python dependency to nativesdk
=20=20qt: update qmake2 class to export qconfig.pri mkspec

Hongxu Jia (2):
=20=20init-live.sh: fix media automount failed after booting from usb-drive
=20=20ddimage: fix incompatibility with dash

Jonathan Liu (15):
=20=20nativesdk-qt4-tools.inc: update HOMEPAGE
=20=20qt-mobility: update HOMEPAGE
=20=20qt4-embedded: update HOMEPAGE
=20=20qt4-native: update HOMEPAGE
=20=20qt4-x11-free: update HOMEPAGE
=20=20qt4-native: build lconvert and xmlpatterns
=20=20classes/qmake2: export OE_QMAKE_LCONVERT and OE_QMAKE_XMLPATTERNS
=20=20classes/qmake_base: update .pro hack
=20=20qt4-native: update configure paths to match target
=20=20qt4: fix QMAKE_QT_CONFIG being overwritten with empty value
=20=20mesa: remove unrecognized configure options
=20=20util-linux: update to 2.23.1
=20=20classes/qmake_base: allow parallel make
=20=20qt4: disable gdb_dwarf_index
=20=20qt4: set QMAKE_COMPILER to gcc in mkspec

Khem Raj (2):
=20=20gcc: Upgrade to 4.8.1
=20=20python: -Wformat is needed by gcc 4.8

Laurentiu Palcu (14):
=20=20rootfs_*.bbclass: add some helper functions
=20=20image.bbclass: remove unneeded files from the image
=20=20core-image-minimal: do not remove packaging files in the rootfs =
postprocess
=20=20run-postinsts: make it generic
=20=20rootfs_rpm.bbclass: switch to using run-postinsts
=20=20package_rpm.bbclass: handle pre/post remove scriptlets
=20=20rpm: replace rpm-postinsts dependency with run-postinsts
=20=20xf86-input-synaptics: upgrade to 1.7.1
=20=20xkeyboard-config: upgrade to 2.9
=20=20xdpyinfo: upgrade to 1.3.1
=20=20xf86-video-intel: upgrade to 2.21.9
=20=20xwininfo: upgrade to 1.1.3
=20=20libdrm: upgrade to 2.4.45
=20=20libxt: upgrade to 1.1.4

Marko Lindqvist (2):
=20=20gnomebase.bbclass: implement gnome_verdir() using trim_version()
=20=20gnomebase.bbclass: add support for archive name different from BPN

Martin Jansa (10):
=20=20mesa: merge mesa-common.inc to mesa.inc
=20=20mesa: introduce PACKAGECONFIG for dri
=20=20mesa: use PACKAGECONFIG instead of DISTRO_FEATURES to define =
EGL_PLATFORMS
=20=20mesa: move LIC_FILES_CHKSUM to .inc
=20=20mesa: merge mesa-git.inc to mesa_git.bb
=20=20mesa: remove more .la files
=20=20mesa: introduce gallium PACKAGECONFIG
=20=20mesa: introduce openvg PACKAGECONFIG
=20=20mesa: use PACKAGESPLITFUNCS
=20=20mesa: introduce gallium-llvmpipe PACKAGECONFIG

Muhammad Shakeel (1):
=20=20ofono: Add run time dependency for ofono test scripts

Paul Eggleton (1):
=20=20classes/buildhistory: split SDK data by IMAGE_NAME

Peter Seebach (1):
=20=20handle two-word commands with tmux

Randy MacLeod (1):
=20=20sanity.bbclass: non-zero status means that we need -march.

Richard Purdie (11):
=20=20buildtools-tarball: Add json, unittest and compression python module =
package
=20=20buildtools-tarball: Add nativesdk-ncurses-terminfo-base
=20=20bitbake.conf: Add extra fakeroot parameters
=20=20scripts/bitbake sanity.bbclass: Migrate tests for git and tar versions
=20=20scripts/oe-buildenv-internal bitbake: Migrate python version checks
=20=20sanity.conf: Update minimum bitbake version requirement to 1.19.1 for =
bitbak
=20=20scripts/bitbake: Drop horrible double execution mess
=20=20sanity: Drop pseudo test, now unneeded
=20=20scripts/buildenv-internal/sanity: Update to python 2.7.3 as a minimum
=20=20classes/conf: Add eventmasks for event handlers
=20=20documentation.conf: Drop variables for class that no longer exists in =
OE-Cor

Riku Voipio (1):
=20=20qemu: update to 1.5.0

Ross Burton (9):
=20=20glib-2.0: drop Makefile.in hunks from patch
=20=20systemd: don't install quotaon.service twice
=20=20runqemu: when tunctl can't be found, say what package builds it
=20=20site: add more alignment values for at-spi2-core
=20=20dpkg: drop the usage of create_wrapper
=20=20python-native: add nativepython symlink
=20=20createrepo: drop the usage of create_wrapper
=20=20gnome-doc-utils: drop the usage of create_wrapper
=20=20systemd: update install-quotaon-once.patch

Roy.Li (6):
=20=20socat: enable termios
=20=20PPP: add default configuration file and fix hard-coded CFLAGS
=20=20trace-cmd: backport three patches
=20=20wpa-supplicant: Enable EXTRA_CFLAGS
=20=20latencytop: Deprecate tracing_enabled for tracing_on
=20=20cogl: make cogl be able to build on ARM arch

Saul Wold (14):
=20=20tar: don't mv tar for nativesdk
=20=20librsvg: configure needs a native gdk-pixbuf binary
=20=20buildtools-tarball: add difflib and pprint python modules
=20=20socat: Update to 1.7.2.2
=20=20cmake: Update to 2.8.11.1
=20=20help2man: Update to 1.43.2
=20=20cracklib: Update to 2.9.0
=20=20cups: Update to 1.6.2
=20=20libidn: Update to 1.27
=20=20lsbinitscripts: Update to 9.47
=20=20sysstat: Update to 10.1.6
=20=20libxkbcommon: Update to 0.3.1
=20=20libusb: Update tp 0.1.5
=20=20nspr: Update to 4.10

Stefan Stanacar (2):
=20=20scripts/contrib/build-perf-test.sh: add branch name and sizes to =
results
=20=20scripts/contrib/build-perf-test.sh: fix passing arguments

Wenzong Fan (2):
=20=20chkconfig: fix QA warning about unsafe references in binaries
=20=20cracklib: fix QA warning about unsafe references in binaries

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Dan McGregor (1):
=20=20gateone: Add sysv init script

Jonathan Liu (3):
=20=20llvm2.9: allow parallel native make
=20=20llvm: disable build rpath
=20=20llvm3.2: new recipe

Khem Raj (1):
=20=20ipsec-tools: Upgrade to 0.8.1 and fix build with gcc 4.8

Martin Jansa (3):
=20=20emacs: zlib is now in base_libdir
=20=20openssh: Rename bbappend to match new version from oe-core
=20=20util-linux: rename bbappend to match new version from oe-core

Philip Balister (2):
=20=20gsl: Update from version 1.12 to version 1.15.
=20=20swig: Update to version 2.0.10 and and add nativesdk support.

Thomas Fitzsimmons (1):
=20=20net-snmp: Backport fix for NETSNMP_NO_SYSTEMD typos

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20angstrom-next: Define ANGSTROM_QEMU_VERSION and pin it

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (2):
=20=20eglibc-*.inc: remove -nativesdk package suffix rudiment from Denzil
=20=20toolchain-*.inc, arago.conf: restructure setup to support internal =
toolchain

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (4):
=20=20linux-mainline 3.8: implement whitelist/blacklist for HDMI resolutions
=20=20linux-mainline 3.8: LCD cape timing and pinmux fixes
=20=20linux-mainline 3.8: various fixes
=20=20linux-mainline 3.8: add support for RS232 cape

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

Andreas M=C3=BCller (1):
=20=20card-write: add time measurement for rootfs extraction

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Nitin A Kamble (26):
=20=20chiefriver: linux-yocto_3.8: update kernel SRCREVs
=20=20crownbay: linux-yocto_3.8: update kernel SRCREVs
=20=20emenlow: linux-yocto_3.8: update kernel SRCREVs
=20=20jasperforest: linux-yocto_3.8: update kernel SRCREVs
=20=20nuc: linux-yocto_3.8: update kernel SRCREVs
=20=20sugarbay: linux-yocto_3.8: update kernel SRCREVs
=20=20emgd-driver-bin: add xserver-xorg to RDEPENDS
=20=20mesa: sync up with oecore
=20=20crownbay: update preferred version of mesa recipe
=20=20emenlow: update preferred version of mesa recipe
=20=20fri2: update preferred version of mesa recipe
=20=20lms7: reorganize the lms recipe
=20=20lms8: new recipe to support AMT version 8
=20=20chiefriver: use package lms7 insted of lms for AMT
=20=20nuc: use package lms8 insted of lms for AMT
=20=20fri2: linux-yocto_3.8: update kernel SRCREVs
=20=20chiefriver: update kernel srcrev to v3.8.13
=20=20crownbay: update kernel srcrev to v3.8.13
=20=20emenlow: update kernel srcrev to v3.8.13
=20=20jasperforest: update kernel srcrev to v3.8.13
=20=20nuc: update kernel srcrev to v3.8.13
=20=20sugarbay: update kernel srcrev to v3.8.13
=20=20fri2: update kernel srcrev to v3.8.13
=20=20sys940x: update preferred version of mesa recipe
=20=20sys940x: linux-yocto_3.8: update kernel SRCREVs
=20=20sys940x: update kernel srcrev to v3.8.13

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (1):
=20=20connman: Sync bbappend version with upstream

Fahad Usman (1):
=20=20packagegroups: restructure the yocto-ivi PGs

Florin Sarbu (5):
=20=20layer-management: Add scene provider in the rootfs
=20=20nfs-utils: Removed obsolete package from meta-ivi
=20=20portmap: Removed obsolete dependency bbappend from meta-ivi
=20=20node-startup-controller: Package dummy helper node state     manager =
files i
=20=20default-providers-ivi.inc: Add PREFERRED_PROVIDER_node-state-manager  =
   as=20

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

Khem Raj (2):
=20=20linux-ixp4xx: Remove redundant defconfigs
=20=20ixp4xx-npe: Update the SRC_URI

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Florian Haenel (1):
=20=20qtdeclarative-5.0.2: Add 4 patches for runtime issues

Martin Jansa (2):
=20=20qtdeclarative: move 5.0.2 specific patches to own directory
=20=20qtdeclarative-git: Add 2 patches from 5.0.2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Paul Barker (3):
=20=20rpi-first-run-wizard: remove
=20=20bootfiles, vc-graphics: consolidate SRC_URI and S variables
=20=20psplash: only set image for MACHINE=3Draspberrypi

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Chase Maupin (1):
=20=20u-boot-dra7xx: update to latest sources

Denys Dmytriyenko (1):
=20=20linux-ti-staging: update to ti2013.04.02 release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Hongjeon Ha (1):
=20=20Meta-webos: pmloglib=3D29, pmlogctl=3D12,v3.0.0, pmlogdaemon=3D104

Keith Derrick (1):
=20=20webos-image: cmake-modules-webos-native=3D14

Martin Jansa (2):
=20=20gtkmm-utils: Add recipe for v0.4.1
=20=20libsoup: Add recipe for v2.40.3

Roger Stringer (1):
=20=20db8=3D71, Change db8.bb to use LevelDB

pankaj.jindal (1):
=20=20alsa-plugins: Add recipe for v1.0.26

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (2):
=20=20util-linux: Replace local patch with submitted patch
=20=20linux-xlnx: qemumicroblaze: Add "EPOLL" to defconfig

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Saul Wold (2):
=20=20upstream_tracking: Update Manual recipes
=20=20maintainers: Added missing recipes with maintainers

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



