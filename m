Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RBBXm-0004Yj-4S; Tue, 04 Oct 2011 22:24:50 +0200
Received: from localhost.localdomain ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RBBSM-0002CW-KH; Tue, 04 Oct 2011 16:19:14 -0400
Date: Tue, 04 Oct 2011 16:19:14 -0400
Message-Id: <E1RBBSM-0002CW-KH@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-09-26 to 2011-10-3
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
X-List-Received-Date: Tue, 04 Oct 2011 20:24:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-09-26 to 2011-10-3.  Projects included in this report:

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
meta-handheld: git://git.openembedded.org/meta-handheld
meta-opie: git://git.openembedded.org/meta-opie
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Matthew McClintock (1):
=20=20fetch2/git: Make git fetch run with -f so rebased branches don't fail

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andrew Gabbasov (4):
=20=20cmake.bbclass: adding extendable extra variable to root path
=20=20libpam: add flex-native to DEPENDS
=20=20apr: use ${HOST_SYS}-libtool
=20=20apmd: use ${HOST_SYS}-libtool

Bruce Ashfield (1):
=20=20linux-yocto/meta: eg20t and live boot config changes

Dmitry Eremin-Solenikov (3):
=20=20kernel.bbclass: blacklist 'perf-dbg' as well for the modules =
metapackage
=20=20kernel.bbclass: handle .cis firmware
=20=20kernel.bbclass: remove unshipped files in do_install

Dongxiao Xu (6):
=20=20multilib.bbclass: map RDEPENDS and LINGUAS_INSTALL for image recipes
=20=20multilib: remove the multilib handling to allarch
=20=20package_rpm: combine normal and multilib solution manifest together
=20=20libc-package.bbclass: add MLPREFIX when set values to PACKAGES
=20=20tune-i586: fix hardcoded TUNE_PKGARCH
=20=20multilib: add MLPREFIX to deploy folder

Henning Heinold (1):
=20=20tune-cortexa9.inc: add tunefile for cortexa9 socs

Jessica Zhang (1):
=20=20Fixed a typo for setting up OECORE_ACLOCAL_OPTS for adt-installer case

Joshua Lock (1):
=20=20ghostscript: disable check for time.h

Khem Raj (4):
=20=20conf,recipes: Add new variable LINKER_HASH_STYLE
=20=20gcc-4.6: Use --with-linker-hash-style configure option
=20=20eglibc: Add recipes for 2.14
=20=20gcc-4.6: Update to tip of FSF gcc-4_6-branch

Koen Kooi (1):
=20=20avahi: fix avahi-systemd dependencies

Martin Jansa (1):
=20=20atk: add patch to replace G_CONST_RETURN with const

Matthew McClintock (10):
=20=20Fixup kexec-tools compatible host for powerpc
=20=20Add autoconf cache for screen on powerpc64
=20=20Add support for generating ext2.bz2{, .u-boot} images
=20=20Add support for generating ext2.lzma{, .u-boot} images
=20=20Fix ghostscript on powerpc64
=20=20Fix HAL on newer kernels without header file
=20=20Add udev patch to compile against newer kernels
=20=20Fix sysklogd build on e500v2 cores
=20=20Add proper deps for nfs-utils, util-linux, and strace
=20=20Fix flac build on e500mc cores

Mei Lei (4):
=20=20curl: Upgrade from 7.21.7 to 7.22.0
=20=20diffutils: Upgrade from 3.0 to 3.2.
=20=20dropbear: Upgrade from 0.52 to 0.53.1
=20=20distro_tracking_fields.inc: Update upgrade information

Paul Eggleton (2):
=20=20scripts: use OE_TMPDIR instead of TMPDIR external variable
=20=20scripts/oe-setup-rpmrepo: use setup_tmpdir from runqemu

Richard Purdie (13):
=20=20gcc: Fix two QA issues
=20=20grub: Fix insane/QA architecture warning
=20=20sqlite3: Fix nativesdk packaging/QA warnings
=20=20pseudo: Fix QA warnings
=20=20bitbake.conf: Fix reversed linker hash style logic
=20=20openssl: Ensure perl scripts reference the correct perl
=20=20mc: Ensure perl scripts reference the correct perl
=20=20util-linux: Ensure perl scripts reference the correct perl
=20=20insane: Promote most warnings into QA errors by default
=20=20Remove help2man dependency
=20=20autotools: Disable dependency tracking
=20=20base.bbclass: Drop unneeded dependency
=20=20bitbake.conf: Start using parallel make for do_install

Saul Wold (7):
=20=20rpm: ensure that magic file is relocatable
=20=20zypper & sat-solver: needs RDEPENDS on rpm-lib
=20=20rpm: fix QA Warning on installed but not shipped staticdev filesw
=20=20distro_tracking: Update Manual Upgrade Checks
=20=20glew: update to 1.7.0
=20=20sysstat: update to 10.0.2
=20=20python: fix sqlite RPATH issue

Simon Busch (2):
=20=20meta: qt4: fix postprocessing of pkg-config files
=20=20qt4-embedded: move qte.sh profile script into own package

Tom Zanussi (2):
=20=20sysprof: update to version 1.1.8
=20=20blktrace: update to version 1.0.3

Zhai Edwin (4):
=20=20oprofileui: remove dependence on gnome-vfs
=20=20libgsf: remove dependence on gnome-vfs
=20=20tables: remove it as obsolete recipe
=20=20oprofileui: Update SRCREV to reflect recent accpeted patches by =
upstream

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (2):
=20=20midori: update to 0.4.0 / buildable by upstream patch & =
LDFLAGS_append / min
=20=20midori: added RRECOMMENDS glib-networking

Khem Raj (5):
=20=20fuse: Upgrade recipe to version 2.8.6
=20=20gnome-disk-utility: Fix build on gnomelss host systems
=20=20gdm: Fix build on gnome'less build systems
=20=20gnome-power-manager: Fix build on gnome'less build systems
=20=20tcp-wrappers: Use the recipe from oe-core

Koen Kooi (3):
=20=20systemd: replace analyze patch with upstream version
=20=20HACK: libcgroup: override ERROR_QA
=20=20systemd: update to latest git

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (3):
=20=20hardware-bringup-image: as the name says an image to aid in hw bringup
=20=20hardware-bringup-image: add more tools
=20=20base-files 3.0.14: make /var/run a directory, not a symlink

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Andrew Gabbasov (4):
=20=20cmake.bbclass: adding extendable extra variable to root path
=20=20libpam: add flex-native to DEPENDS
=20=20apr: use ${HOST_SYS}-libtool
=20=20apmd: use ${HOST_SYS}-libtool

Bruce Ashfield (1):
=20=20linux-yocto/meta: eg20t and live boot config changes

Dmitry Eremin-Solenikov (8):
=20=20bitbake.conf: change ccache path to use MULTIMACH_HOST_SYS
=20=20icecc-create-env-native: provide the script right in the tree
=20=20gcc: fix possible problems with nscd compilation during =
eglibc-nativesdk bui
=20=20gconf-dbus: packaging fixup
=20=20libffi: really populate -dev package
=20=20kernel.bbclass: blacklist 'perf-dbg' as well for the modules =
metapackage
=20=20kernel.bbclass: handle .cis firmware
=20=20kernel.bbclass: remove unshipped files in do_install

Dongxiao Xu (6):
=20=20multilib.bbclass: map RDEPENDS and LINGUAS_INSTALL for image recipes
=20=20multilib: remove the multilib handling to allarch
=20=20package_rpm: combine normal and multilib solution manifest together
=20=20libc-package.bbclass: add MLPREFIX when set values to PACKAGES
=20=20tune-i586: fix hardcoded TUNE_PKGARCH
=20=20multilib: add MLPREFIX to deploy folder

Henning Heinold (1):
=20=20tune-cortexa9.inc: add tunefile for cortexa9 socs

Jessica Zhang (1):
=20=20Fixed a typo for setting up OECORE_ACLOCAL_OPTS for adt-installer case

Joshua Lock (1):
=20=20ghostscript: disable check for time.h

Khem Raj (5):
=20=20gnome-doc-utils: Prepend PKG_CONFIG_SYSROOT_DIR to the path returned =
from PK
=20=20conf,recipes: Add new variable LINKER_HASH_STYLE
=20=20gcc-4.6: Use --with-linker-hash-style configure option
=20=20eglibc: Add recipes for 2.14
=20=20gcc-4.6: Update to tip of FSF gcc-4_6-branch

Koen Kooi (1):
=20=20avahi: fix avahi-systemd dependencies

Matthew McClintock (9):
=20=20Fixup kexec-tools compatible host for powerpc
=20=20Add autoconf cache for screen on powerpc64
=20=20Add support for generating ext2.bz2{, .u-boot} images
=20=20Add support for generating ext2.lzma{, .u-boot} images
=20=20Fix ghostscript on powerpc64
=20=20Fix HAL on newer kernels without header file
=20=20Add udev patch to compile against newer kernels
=20=20Fix sysklogd build on e500v2 cores
=20=20Add proper deps for nfs-utils, util-linux, and strace

Paul Eggleton (3):
=20=20scripts: use OE_TMPDIR instead of TMPDIR external variable
=20=20scripts/oe-setup-rpmrepo: use setup_tmpdir from runqemu
=20=20beagleboard-audio: fix RDEPENDS on alsa-utils-amixer

Richard Purdie (9):
=20=20gcc: Fix two QA issues
=20=20grub: Fix insane/QA architecture warning
=20=20sqlite3: Fix nativesdk packaging/QA warnings
=20=20pseudo: Fix QA warnings
=20=20bitbake.conf: Fix reversed linker hash style logic
=20=20openssl: Ensure perl scripts reference the correct perl
=20=20mc: Ensure perl scripts reference the correct perl
=20=20util-linux: Ensure perl scripts reference the correct perl
=20=20insane: Promote most warnings into QA errors by default

Saul Wold (7):
=20=20rpm: ensure that magic file is relocatable
=20=20zypper & sat-solver: needs RDEPENDS on rpm-lib
=20=20rpm: fix QA Warning on installed but not shipped staticdev filesw
=20=20distro_tracking: Update Manual Upgrade Checks
=20=20glew: update to 1.7.0
=20=20sysstat: update to 10.0.2
=20=20python: fix sqlite RPATH issue

Simon Busch (2):
=20=20meta: qt4: fix postprocessing of pkg-config files
=20=20qt4-embedded: move qte.sh profile script into own package

Tom Zanussi (2):
=20=20sysprof: update to version 1.1.8
=20=20blktrace: update to version 1.0.3

Zhai Edwin (3):
=20=20oprofileui: remove dependence on gnome-vfs
=20=20libgsf: remove dependence on gnome-vfs
=20=20tables: remove it as obsolete recipe

lumag (1):
=20=20gcc: include libgcov.a into libgcc-dev package

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Denis 'GNUtoo' Carikli (10):
=20=20meta-fso: android-image-utils-native: fix LICENSE and LIC_FILES_CHKSUM
=20=20meta-shr: preferred-shr-versions.inc also set PREFERRED_QT_VERSION =
for qt4-n
=20=20meta-htc: change the htcdream config to armv6-novfp
=20=20meta-htc: add linux-leviathan
=20=20meta-htc: add a nexusone machine config file
=20=20meta-htc: add linux-nexusone recipe
=20=20Add new meta-osmocombb layer
=20=20meta-osmocombb: Add libosmocore recipe
=20=20meta-osmocombb: Add the osmocon recipe(osmocombb loader)
=20=20meta-htc: htcdream.conf: remove the dependency on the dummy wl1251 ti =
firmwa

Martin Jansa (11):
=20=20meta-fso: cornucopia: bump SRCREV
=20=20meta-fso: msmcomm: bump SRCREV
=20=20openssh: alter sshd config to allow empty password if someone really =
wants t
=20=20Revert "task-shr-minimal: drop libphone-ui and libphone-ui-shr as =
they shoul
=20=20meta-shr: prefer glib-2.30
=20=20meta-shr: prefer eglibc 2.14
=20=20libshr-glib: bump SRCREV to fix build with glib-2.30.0
=20=20recipes: use allarch instead of PACKAGE_ARCH =3D all or drop =
PACKAGE_ARCH sett
=20=20shr-settings: bump SRCREV
=20=20shr-settings: bump SRCREV for setuptools change
=20=20libphone-ui-shr: bump PR to rebuild against newer poppler

Simon Busch (8):
=20=20meta-samsung: linux-samsung-crespo: enable devtmpfs kernel feature
=20=20meta-samsung: initscripts: add additional initscripts for crespo =
machine
=20=20meta-samsung: add ext2 as preferred image format to machine =
configuration
=20=20meta-fso: images: add a modified fso2-console-image from oe-dev
=20=20meta-palm: remove machine specific profile script for qt4-embedded
=20=20meta-samsung: linux-samsung-crespo: bump SRCREV and update defconfig
=20=20meta-fso: serial-utils: import from oe-dev
=20=20meta-samsung: add recipe for libsamsung-ipc

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Tom Zanussi (8):
=20=20meta-intel: update SRCREVs
=20=20meta-intel: fix symlink typo and QA checks in emgd-driver-bin
=20=20meta-crownbay: remove emgd-1.6
=20=20xpsb-glx: Move the pkgconfig file(s) to the -dev package
=20=20meta-emenlow: update README
=20=20meta-fishriver: update README
=20=20meta-jasperforest: update README
=20=20meta-sugarbay: update README

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




