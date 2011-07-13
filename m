Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1Qh3UW-0003yi-PG; Wed, 13 Jul 2011 19:44:57 +0200
Received: from localhost ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1Qh3Qe-00083V-15; Wed, 13 Jul 2011 13:40:56 -0400
Date: Wed, 13 Jul 2011 13:40:56 -0400
Message-Id: <E1Qh3Qe-00083V-15@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-07-4 to 2011-07-11
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
X-List-Received-Date: Wed, 13 Jul 2011 17:44:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-07-4 to 2011-07-11.  Projects included in this report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://git.angstrom-distribution.org/meta-angstrom
meta-yocto: git://git.yoctoproject.org/poky
meta-texasinstruments: =
git://git.angstrom-distribution.org/meta-texasinstruments
meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
meta-micro: git://git.openembedded.org/meta-micro
meta-slugos: git://github.com/kraj/meta-slugos
meta-nslu2: git://github.com/kraj/meta-nslu2
meta-intel: git://git.yoctoproject.org/meta-intel
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Dexuan Cui (1):
=20=20bitbake/cooker, bitbake-layers: show the .bbappend files that matches =
no exi

Joshua Lock (4):
=20=20hob: re-designed interaction and implementation
=20=20ui/crumbs/tasklistmodel: fix reset method
=20=20lib/bb/hob: fix changing base image
=20=20lib/bb/ui/hob: don't error when dismissing save as dialog

Lianhao Lu (1):
=20=20bitbake cooker/ui: handle cmd line parsing result by individual UI.

Paul Eggleton (7):
=20=20bitbake: track 'overlayed' recipes
=20=20bitbake-layers: add show_overlayed action
=20=20bitbake/cooker: implement layer dependencies, make priority optional
=20=20bitbake-layers: add command to flatten layers into one
=20=20bitbake-layers: fix sorting of show_appends output
=20=20bitbake-layers: fix sorting by package name for cooker change
=20=20bitbake-layers: fix error on startup caused by recent cooker change

Richard Purdie (5):
=20=20bitbake/ast: Fix ??=3D vs. ?=3D handling
=20=20ui/depexp: If we're parsing zero files we need to ensure the cache =
progress=20
=20=20cache.py: Ensure additional .bbappend files are accounted for
=20=20bitbake/process.py: Ensure queued UI events are queued right before =
we add o
=20=20fetch2/git: Tweak git fetcher to handling repo updates correctly

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Adrian Alonso (3):
=20=20kernel-arch: microblaze little endian fix kernel arch
=20=20insane: add microblaze little endian target info
=20=20siteinfo: add microblaze little endian target info

Anders Darander (3):
=20=20task-base: remove modutils reference.
=20=20task-base: remove unconditional inclusion of kernel-module-rtc-sa1100
=20=20module-base: remove KERNEL-SOURCE

Dexuan Cui (2):
=20=20base.bbclass: show layer's branches/revisions in the banner info
=20=20powertop: inherit update-alternatives and use a higher priority than =
busybox

Joshua Lock (1):
=20=20sanity: implement network connectivity test

Khem Raj (6):
=20=20uclibc: Add recipes for 0.9.32 release
=20=20tcmode-default: Define UCLIBCVERSION and set it to 0.9.32
=20=20uclibc_git: Move SRCREV past 0.9.32 release
=20=20uclibc_git: Implement execvpe and refresh scheduler functions
=20=20uclibc-0.9.32: Implement execvpe and refresh scheduler functions
=20=20[bug 1195] site/mips-common: Cache cvs_cv_func_printf_ptr

Koen Kooi (4):
=20=20gettext: fix ERROR: QA Issue: gettext rdepends on gettext-dev
=20=20libxml-parser-perl: convert to BBCLASSEXTEND, merge in OE fixes
=20=20pulseaudio: disable HAL support and enable udev support
=20=20pulseaudio: add 0.9.23

Mei Lei (3):
=20=20gupnp: Upgrade from 0.16.0 to 0.16.1
=20=20gawk: Upgrade from 3.1.8 to 4.0.0
=20=20distro_tracking_fields.inc: Update recipes upgrade and manual check =
informat

Michael Lippautz (1):
=20=20libxslt: Inherit from binconfig

Nitin A Kamble (5):
=20=20binutils: upgrade from 2.21 to 2.21.1
=20=20gmp: upgrade from 5.0.1 to 5.0.2
=20=20distro tracking: update devel.toolchain recipes's fields
=20=20gcc-runtime: fix installed but unpackaged files
=20=20elfutils: fix compilations issue with the gcc 4.7

Otavio Salvador (5):
=20=20cmake: refactor recipe
=20=20cmake.bbclass: use CPPFLAGS and CXXFLAGS
=20=20libarchive: add 2.8.4 version
=20=20cmake: add nativesdk and target versions
=20=20cmake: update to 2.8.5-rc3

Paul Eggleton (7):
=20=20qt4: ensure target packages don't include host binaries
=20=20default-distrovars.inc: add ipv4 to DISTRO_FEATURES
=20=20busybox: bump PR to ensure ipv4 is enabled
=20=20bitbake.conf: update OLDEST_KERNEL to 2.6.16
=20=20eglibc: bump PR for OLDEST_KERNEL change
=20=20insane.bbclass: allow dev-deps to be skipped via INSANE_SKIP
=20=20insane.bbclass: fix error/warning status being inverted

Phil Blundell (2):
=20=20tinylogin: use angstrom mirror for SRC_URI
=20=20eglibc: avoid copying ${libdir} twice if it's the same as =
${base_libdir}

Richard  Purdie (9):
=20=20gcc: Fix removal of libiberty.a
=20=20gettext: Disable both git and cvs for autopoint's archive format.
=20=20gcc: Remove unneeded module .la file and .so link
=20=20insane.bbclass: Allow INSANE_SKIP to work on a per test basis
=20=20lttng-viewer: Fixup various QA warnings and a false positive
=20=20u-boot: Drop INSANE_SKIP since it insane no longer trips up on this =
recipe
=20=20elfutils: Update INSANE_SKIP to new syntax
=20=20qemu: Clean up various QA warnings, add approproate INSANE_SKIP for =
firmware
=20=20db: Add INSANE_SKIP to avoid warning about .so file

Richard Purdie (28):
=20=20oprofile: Fix QA warnings
=20=20libgsmd: Fix QA warnings
=20=20gcc-package-cross: Switch to using pattern matching to detect when to =
stash=20
=20=20package.bbclass: Make unshipped packages message more readable
=20=20insane.bbclass: Add warnings for packages which are not -dev packages =
which=20
=20=20insane.bbclass: Fix indentation error
=20=20gcc: Fix unpackaged files warnings, broken symlink and superfluous =
files
=20=20connman: Package unpackaged .la file
=20=20tslib: Package unpackaged .la file
=20=20btrfs-tools: Fix manpage creation directory
=20=20xcb-proto: Package unshipped files, create python-xcbgen package for =
python=20
=20=20eds-dbus: Package unpackaged files
=20=20systemtap: Don't set prefix to a path including  so examples get =
placed in t
=20=20qt4: Package debug source files
=20=20telepathy-python: Remove unneeded and unpackaged files
=20=20librsvg: Clean up unpackaged files
=20=20gtk-engines: Package unpackaged files
=20=20x11perf: Packaged unpackaged files
=20=20apt: Package unpackaged files
=20=20git: Package up python and gitweb files into appropriate packages
=20=20kernelshark/trace-cmd: Clean up QA warnings including fising LDFLAGS =
issues
=20=20opensp: Add unpackaged files
=20=20chrpath: Ensure the package respects the docdir variable
=20=20kernel-yocto: Fix case where recipe is always reparsed
=20=20x-load: Drop PR from PV and fix version to 1.5.0
=20=20openssh/dropbear: No need for each to PROVIDE ssh/sshd
=20=20image.bbclass: Add LINGUAS_INSTALL to dependency list
=20=20libc-common.bbclass: Fix typo

Saul Wold (15):
=20=20mpeg2dec: add SRC_URI Checksum
=20=20libmad: add SRC_URI Checksum
=20=20x-load: Update to 1.5.0
=20=20uboot: Add 2011.06 Version
=20=20module-init-tools-cross: add SRC_URI Checksums
=20=20gnome-doc-utils: Add RDEPENDS on bash
=20=20quilt: Add RDEPENDS on bash
=20=20console-tools: Add RDEPENDS on bash
=20=20usbutils: Add RDEPENDS on bash
=20=20rootfs_rpm: Add 50M to IMAGE_ROOTFS_EXTRA_SPACE for zypper /var space
=20=20eglibc: unbash ldd (from oe.dev)
=20=20eglibc: add RDEPENDS for bash on eglibc-utils
=20=20libx11: enable xcb support
=20=20tcmode-default: update binutils version
=20=20libx11: ensure nativesdk uses correct DEPENDS and XCB flags

Xiaofeng Yan (1):
=20=20libQtOpenGL:Add libQtOpenGL to an lsb image

Yu Ke (1):
=20=20combo-layer-tool: add tool to manipulate combo layers

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Koen Kooi (3):
=20=20systemd git: bump SRCREV to get a proper fix for the hugepages and =
mqueue is
=20=20pixman: update to 0.22.2
=20=20udev: update to 172

Michael Lippautz (4):
=20=20python-pyudev: Add version 0.11 (initial recipe)
=20=20python-sqlalchemy: Add version 0.7.1 (initial recipe)
=20=20audiofile: Update 0.2.6 to 0.2.7
=20=20start-stop-daemon: Add version 1.16.0.2 (initial recipe)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20angstrom-2010.x: Prefer uclibc 0.9.32 release

Koen Kooi (1):
=20=20globally set OLDEST_KERNEL to 2.6.16

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Adrian Alonso (3):
=20=20kernel-arch: microblaze little endian fix kernel arch
=20=20insane: add microblaze little endian target info
=20=20siteinfo: add microblaze little endian target info

Anders Darander (3):
=20=20task-base: remove modutils reference.
=20=20task-base: remove unconditional inclusion of kernel-module-rtc-sa1100
=20=20module-base: remove KERNEL-SOURCE

Dexuan Cui (3):
=20=20bitbake/cooker, bitbake-layers: show the .bbappend files that matches =
no exi
=20=20base.bbclass: show layer's branches/revisions in the banner info
=20=20powertop: inherit update-alternatives and use a higher priority than =
busybox

Joshua Lock (5):
=20=20hob: re-designed interaction and implementation
=20=20sanity: implement network connectivity test
=20=20ui/crumbs/tasklistmodel: fix reset method
=20=20lib/bb/hob: fix changing base image
=20=20lib/bb/ui/hob: don't error when dismissing save as dialog

Khem Raj (6):
=20=20uclibc: Add recipes for 0.9.32 release
=20=20tcmode-default: Define UCLIBCVERSION and set it to 0.9.32
=20=20uclibc_git: Move SRCREV past 0.9.32 release
=20=20uclibc_git: Implement execvpe and refresh scheduler functions
=20=20uclibc-0.9.32: Implement execvpe and refresh scheduler functions
=20=20site/mips-common: Cache cvs_cv_func_printf_ptr

Koen Kooi (4):
=20=20gettext: fix ERROR: QA Issue: gettext rdepends on gettext-dev
=20=20libxml-parser-perl: convert to BBCLASSEXTEND, merge in OE fixes
=20=20pulseaudio: disable HAL support and enable udev support
=20=20pulseaudio: add 0.9.23

Lianhao Lu (1):
=20=20bitbake cooker/ui: handle cmd line parsing result by individual UI.

Mei Lei (3):
=20=20gupnp: Upgrade from 0.16.0 to 0.16.1
=20=20gawk: Upgrade from 3.1.8 to 4.0.0
=20=20distro_tracking_fields.inc: Update recipes upgrade and manual check =
informat

Michael Lippautz (1):
=20=20libxslt: Inherit from binconfig

Nitin A Kamble (5):
=20=20binutils: upgrade from 2.21 to 2.21.1
=20=20gmp: upgrade from 5.0.1 to 5.0.2
=20=20distro tracking: update devel.toolchain recipes's fields
=20=20gcc-runtime: fix installed but unpackaged files
=20=20elfutils: fix compilations issue with the gcc 4.7

Otavio Salvador (5):
=20=20cmake: refactor recipe
=20=20cmake.bbclass: use CPPFLAGS and CXXFLAGS
=20=20libarchive: add 2.8.4 version
=20=20cmake: add nativesdk and target versions
=20=20cmake: update to 2.8.5-rc3

Paul Eggleton (14):
=20=20qt4: ensure target packages don't include host binaries
=20=20bitbake: track 'overlayed' recipes
=20=20bitbake-layers: add show_overlayed action
=20=20bitbake/cooker: implement layer dependencies, make priority optional
=20=20bitbake-layers: add command to flatten layers into one
=20=20bitbake-layers: fix sorting of show_appends output
=20=20bitbake-layers: fix sorting by package name for cooker change
=20=20bitbake-layers: fix error on startup caused by recent cooker change
=20=20default-distrovars.inc: add ipv4 to DISTRO_FEATURES
=20=20busybox: bump PR to ensure ipv4 is enabled
=20=20bitbake.conf: update OLDEST_KERNEL to 2.6.16
=20=20eglibc: bump PR for OLDEST_KERNEL change
=20=20insane.bbclass: allow dev-deps to be skipped via INSANE_SKIP
=20=20insane.bbclass: fix error/warning status being inverted

Phil Blundell (2):
=20=20tinylogin: use angstrom mirror for SRC_URI
=20=20eglibc: avoid copying ${libdir} twice if it's the same as =
${base_libdir}

Richard Purdie (43):
=20=20bitbake/ast: Fix ??=3D vs. ?=3D handling
=20=20oprofile: Fix QA warnings
=20=20libgsmd: Fix QA warnings
=20=20gcc: Fix removal of libiberty.a
=20=20gettext: Disable both git and cvs for autopoint's archive format.
=20=20gcc: Remove unneeded module .la file and .so link
=20=20insane.bbclass: Allow INSANE_SKIP to work on a per test basis
=20=20lttng-viewer: Fixup various QA warnings and a false positive
=20=20gcc-package-cross: Switch to using pattern matching to detect when to =
stash=20
=20=20u-boot: Drop INSANE_SKIP since it insane no longer trips up on this =
recipe
=20=20elfutils: Update INSANE_SKIP to new syntax
=20=20qemu: Clean up various QA warnings, add approproate INSANE_SKIP for =
firmware
=20=20db: Add INSANE_SKIP to avoid warning about .so file
=20=20bitbake: Switch to use process as the default server
=20=20package.bbclass: Make unshipped packages message more readable
=20=20insane.bbclass: Add warnings for packages which are not -dev packages =
which=20
=20=20insane.bbclass: Fix indentation error
=20=20ui/depexp: If we're parsing zero files we need to ensure the cache =
progress=20
=20=20cache.py: Ensure additional .bbappend files are accounted for
=20=20bitbake/process.py: Ensure queued UI events are queued right before =
we add o
=20=20gcc: Fix unpackaged files warnings, broken symlink and superfluous =
files
=20=20connman: Package unpackaged .la file
=20=20tslib: Package unpackaged .la file
=20=20btrfs-tools: Fix manpage creation directory
=20=20xcb-proto: Package unshipped files, create python-xcbgen package for =
python=20
=20=20eds-dbus: Package unpackaged files
=20=20systemtap: Don't set prefix to a path including so examples get =
placed in th
=20=20qt4: Package debug source files
=20=20telepathy-python: Remove unneeded and unpackaged files
=20=20librsvg: Clean up unpackaged files
=20=20gtk-engines: Package unpackaged files
=20=20x11perf: Packaged unpackaged files
=20=20apt: Package unpackaged files
=20=20git: Package up python and gitweb files into appropriate packages
=20=20kernelshark/trace-cmd: Clean up QA warnings including fising LDFLAGS =
issues
=20=20opensp: Add unpackaged files
=20=20chrpath: Ensure the package respects the docdir variable
=20=20kernel-yocto: Fix case where recipe is always reparsed
=20=20x-load: Drop PR from PV and fix version to 1.5.0
=20=20openssh/dropbear: No need for each to PROVIDE ssh/sshd
=20=20image.bbclass: Add LINGUAS_INSTALL to dependency list
=20=20fetch2/git: Tweak git fetcher to handling repo updates correctly
=20=20libc-common.bbclass: Fix typo

Saul Wold (15):
=20=20mpeg2dec: add SRC_URI Checksum
=20=20libmad: add SRC_URI Checksum
=20=20x-load: Update to 1.5.0
=20=20uboot: Add 2011.06 Version
=20=20module-init-tools-cross: add SRC_URI Checksums
=20=20gnome-doc-utils: Add RDEPENDS on bash
=20=20quilt: Add RDEPENDS on bash
=20=20console-tools: Add RDEPENDS on bash
=20=20usbutils: Add RDEPENDS on bash
=20=20rootfs_rpm: Add 50M to IMAGE_ROOTFS_EXTRA_SPACE for zypper /var space
=20=20eglibc: unbash ldd (from oe.dev)
=20=20eglibc: add RDEPENDS for bash on eglibc-utils
=20=20libx11: enable xcb support
=20=20tcmode-default: update binutils version
=20=20libx11: ensure nativesdk uses correct DEPENDS and XCB flags

Xiaofeng Yan (2):
=20=20libQtOpenGL: Install libQtOpenGL to an lsb image
=20=20libQtOpenGL:Add libQtOpenGL to an lsb image

Yu Ke (1):
=20=20combo-layer-tool: add tool to manipulate combo layers

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Koen Kooi (12):
=20=20linux-ti81xx-psp 2.6.37: update netra defconfig and SRCREV
=20=20ti-xdctools: update to 3.22.01.21
=20=20ti-paths: add syslink bits and sort it alphabetically
=20=20add cgt470 4.6.6
=20=20add sysbios 6.31.04.27
=20=20add ipc 1.23.02.27
=20=20add syslink 02.00.00.78
=20=20add hdvpss 01.00.01.27
=20=20linux-ti81xx-psp 2.6.37: move SRCREV back to the point where it =
matches the=20
=20=20linux-ti81xx-psp 2.6.37: fix SRCREV after rebase
=20=20u-boot 2011.06: add tftpboot support for pandaboard
=20=20x-load: add patch to fix EHCI in panda u-boot

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

Khem Raj (1):
=20=20slugos-image: Inherit from nslu2-image

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

Khem Raj (1):
=20=20Remove farce bbappend to slugos-image it belongs to distro layer to =
move it=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Denis 'GNUtoo' Carikli (16):
=20=20bug-udev: add support for bug1
=20=20bug: unbreak udev 171 for bug.
=20=20udev-compat: switch the maximum kenrel version from 2.6.26 to 2.6.27
=20=20tor: quiet the init script(else it prints to the console)
=20=20tor: add 0.2.1.30 version
=20=20prboom-devconfig: add nokia900 config
=20=20prboom 2.5.0: rrecommands prboom-devconfig
=20=20linux-leviathan: switch to newer revision
=20=20linux-bug20: bump SRCREV
=20=20udev 171: partially revert commit =
d5840f76a5c4d145b1a81de48fdd7cb0dc9f2ee (=20
=20=20udev 168: add support for the bug machine (with compat udev)
=20=20xinput-calibrator's pointercal: add support for bug1
=20=20xserver-xorg-conf: switch bug to evdev
=20=20bug: remove the dependency on xf86-video-tslib
=20=20Add a new x11-sato2-image for matchbox2
=20=20udev 168: fix identation of do_unpack_append_bug

Eric BENARD (4):
=20=20busybox: add 1.18.5
=20=20angstrom-2010: prefer busybox 1.18.5
=20=20slugos: prefer busybox 1.18.5
=20=20busybox-1.18.4: remove old version

Joel A Fernandes (2):
=20=20beagleboard-test-scripts: Add a script flash-fs.sh for flashing NAND
=20=20linux-omap-psp: Fix the user button GPIO to the correct value for a =
BeagleBo

Koen Kooi (5):
=20=20linux-ti-81xx-psp: import from meta-ti
=20=20ti-ipc 1.23.02.27: import from meta-ti
=20=20ti-syslink 2.00.00.78: import from meta-ti
=20=20ti81xx: sync with meta-ti
=20=20firefox 3.6.8: bump PR to force rebuild against updated libs

Sylvain 'GarthPS' Par=C3=A9 (1):
=20=20live555 recipe: added -fPIC flag need by VLC to build with live555 =
support

Tom Rini (1):
=20=20bluez4: Fix a build race on generated headers

Yiping Wang (1):
=20=20ethtool: Add 2.6.26




