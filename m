Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1R1dAK-0002bt-2S; Thu, 08 Sep 2011 13:53:08 +0200
Received: from localhost.localdomain ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1R1d5O-0004qC-Ep; Thu, 08 Sep 2011 07:48:02 -0400
Date: Thu, 08 Sep 2011 07:48:02 -0400
Message-Id: <E1R1d5O-0004qC-Ep@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-08-29 to 2011-09-5
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
X-List-Received-Date: Thu, 08 Sep 2011 11:53:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-08-29 to 2011-09-5.  Projects included in this report:

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

Dongxiao Xu (1):
=20=20data_smart.py: make use of expand cache in getVar()

Holger Hans Peter Freyther (1):
=20=20fetch2/git: Allow to specify the name of the checkout directory

Joshua Lock (6):
=20=20ui/crumbs/tasklistmodel: don't add same item to binb column more than =
once
=20=20ui/crumbs/tasklistmodel: prevent packages depending on each other
=20=20ui/crumbs/tasklistmodel: optimise find_path_for_item()
=20=20ui/crumbs/tasklistmodel: remove unnecessary check
=20=20ui/crumbs/tasklistmodel: loop optimisation in include_item()
=20=20ui/crumbs/tasklistmodel: don't add empty entries to COL_BINB

Richard Purdie (3):
=20=20bitbake: Correctly handle multiline comments including whitespace
=20=20bitbake/fetch2/git: Ensure .gitconfig file is ignored
=20=20bitbake/event: Allow event handlers to quietly raise SkipPackage =
events

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Chris Larson (3):
=20=20image_types: add ext4 types from OE
=20=20image_types_uboot: fix a number of issues
=20=20image.bbclass: use ${TARGET_PREFIX}depmod

Dongxiao Xu (5):
=20=20connman-gnome: Fix WiFi security display issue
=20=20hal: Remove build time dependency of virtual/kernel
=20=20rootfs_rpm: setting DEFAULTTUNE for multilib archs
=20=20multilib: Using different sysroot for multilib recipes
=20=20multilib: extend multilib prefix for libsdl

Jessica Zhang (2):
=20=20Revert "Fix adt-installer for consistent naming for powerpc and add =
all arch
=20=20Fix powerpc term and provide more template for different arches

Joshua Lock (1):
=20=20util-linux: fix packaging of readprofile

Koen Kooi (1):
=20=20dropbear: add missing files

Paul Eggleton (4):
=20=20binutils: update to 2.21.1a
=20=20tcmode-default: update binutils version
=20=20distro_tracking_fields: update binutils to 2.21.1a
=20=20sanity.bbclass: fix splitting on newlines of SANITY_TESTED_DISTROS

Phil Blundell (3):
=20=20libc-package: restore correct mangling behavior for locale names
=20=20libcap: only enable pam if DISTRO_FEATURES requests it
=20=20useradd.bbclass: remove hardcoded reference to /usr/bin

Richard Purdie (13):
=20=20gdb: Fix broken source directory
=20=20intltool: Fix perl paths
=20=20package.bbclass: Ensure task's variable dependencies are correctly =
caputred=20
=20=20sanity.bbclass: Fix broken indentation leading to code being skipped =
uninten
=20=20sanity.bbclass: Fix broken whitespace
=20=20sanity.bbclass: Clean up various MACHINE checks
=20=20xserver-nodm: Disable dbus-wait as it causes users too much confusion
=20=20gdb: Further S vs. PV fixups
=20=20scripts: Don't show errors from which ifconfig failing
=20=20scripts: Show sensible warning messages if expected binaries don't =
exist
=20=20multilib: Only build one kernel
=20=20gcc: Fix multilib baselib confusion
=20=20populate_sdk: We need to ensure that the SDK sysroot reflects =
PACKAGE_ARCH

Saul Wold (3):
=20=20o-hand recipes: convert from svn.o-hand.org to git.yoctoproject.org
=20=20sato recipes: Update PR because of libowl conversion to git
=20=20tzcode: Update to 2011i

Sebastian Krzyszkowiak (2):
=20=20libidn_1.22: add SRC_URI checksums
=20=20gdb: upgrade from 7.3 to 7.3a

Xiaofeng Yan (3):
=20=20eglibc-locale.inc: Add eglibc-binaries, eglibc-localedatas, =
eglibc-gconvs an
=20=20qt-demo-init: Fix bug 999
=20=20dropbear: Change the path to find configuration file and add a =
configuration

Zhai Edwin (1):
=20=20shadow: Fix rpm failed dependencies when install

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Anders Darander (1):
=20=20connman: fix typo with -test package

Andreas M=C3=BCller (2):
=20=20thunar-volman: Add initial recipe with version 0.6.0
=20=20thunar-volman: Add udev to DEPENDS

Bernhard Guillon (1):
=20=20dbus-c++: use openembedded-core versions

Chris Larson (1):
=20=20binutils: use TARGET_PREFIX for the convenience links

Koen Kooi (4):
=20=20abiword: fix multiline comments
=20=20midori 0.2.9: delete
=20=20systemd: update to v35
=20=20task-xfce-base: add thunar-volman

Martin Jansa (5):
=20=20kbd: fix SRC_URI
=20=20klibc: move comment outside multiline variable
=20=20serial-forward, pty-forward-native: remove extra slash and '.git' =
from SRC_U
=20=20evas: add evas-loader-svg back to RRECOMMENDS
=20=20e-base: EFL_SRCREV bump

Noor Ahsan (5):
=20=20tiobench: Add version 0.3.3 (initial recipe)
=20=20iozone3: Add version 263 (initial recipe)
=20=20bonnie++: Add version 1.03c (initial recipe)
=20=20debianutils: Add version 2.30 (initial recipe)
=20=20lmbench: Add version 3.0-a9 (initial recipe)

Otavio Salvador (2):
=20=20json-glib: drop specific recipe to use OpenEmbedded-Core
=20=20gitpkgv: add support SRCREV_FORMAT

Sebastian Krzyszkowiak (2):
=20=20ltrace: upgrade Debian patchset from -2 to -2.1
=20=20xf86-video-omapfb: add patch for fixing segfault on starting X when =
using VR

lumag (4):
=20=20openssl: fix parallel builds
=20=20tcp-wrappers: fix parallel builds
=20=20gnome-disk-utility: disable scrollkeeper
=20=20gnome-disk-utility: fix path for dbus interface definitions

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (1):
=20=20angstrom tasks: fix multiline comments

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (1):
=20=20linux-yocto-rt: qemumips: fix boot panic

Chris Larson (3):
=20=20image_types: add ext4 types from OE
=20=20image_types_uboot: fix a number of issues
=20=20image.bbclass: use ${TARGET_PREFIX}depmod

Dmitry Eremin-Solenikov (1):
=20=20opkg-utils: ignore packages disapperaring filelist generation

Dongxiao Xu (12):
=20=20package.bbclass: Fix recrdeptask of image type recipes
=20=20base-passwd: Use BPN in FILES paths
=20=20bitbake.conf: Use BPN in FILES paths
=20=20multilib.bbclass: Fix renaming logic for "FILES_", "RDEPENDS_", etc
=20=20multilib.bbclass: add "pkg_postinst" and "pkg_postrm" as renaming =
elements
=20=20multilib.bbclass: add renaming for INITSCRIPT related variables
=20=20data_smart.py: make use of expand cache in getVar()
=20=20connman-gnome: Fix WiFi security display issue
=20=20hal: Remove build time dependency of virtual/kernel
=20=20rootfs_rpm: setting DEFAULTTUNE for multilib archs
=20=20multilib: Using different sysroot for multilib recipes
=20=20multilib: extend multilib prefix for libsdl

Holger Hans Peter Freyther (1):
=20=20fetch2/git: Allow to specify the name of the checkout directory

Jessica Zhang (3):
=20=20Fix adt-installer for consistent naming for powerpc and add all arch =
templat
=20=20Revert "Fix adt-installer for consistent naming for powerpc and add =
all arch
=20=20Fix powerpc term and provide more template for different arches

Joshua Lock (10):
=20=20ui/crumbs/tasklistmodel: don't add same item to binb column more than =
once
=20=20ui/crumbs/runningbuild: add a 'Copy' item to the messages right-click =
menu
=20=20ui/crumbs/tasklistmodel: don't add same item to binb column more than =
once
=20=20ui/crumbs/tasklistmodel: prevent packages depending on each other
=20=20ui/crumbs/tasklistmodel: optimise find_path_for_item()
=20=20ui/crumbs/tasklistmodel: remove unnecessary check
=20=20ui/crumbs/tasklistmodel: loop optimisation in include_item()
=20=20ui/crumbs/tasklistmodel: don't add empty entries to COL_BINB
=20=20poky.conf: perform network sanity check by default for poky distros
=20=20util-linux: fix packaging of readprofile

Kang Kai (3):
=20=20bitbake.conf: set includedir_nativesdk
=20=20qt4-tools-nativesdk: remove gcc standard paths
=20=20cmake-nativesdk: remove gcc standard paths

Koen Kooi (1):
=20=20dropbear: add missing files

Kumar Gala (2):
=20=20gcc-4.6: Drop gcc-poison-parameters.patch as its not need
=20=20gcc-4.5.1: Drop gcc-poison-parameters.patch, replace with bug fix =
patch

Liming Wang (2):
=20=20script/runqemu: change boot command line for qemuppc
=20=20scripts/runqemu: disable unfs boot mode for qemuppc

Martin Jansa (1):
=20=20eglibc: fix gconv packaging after =
5486cac29db6e67051fff7637a0abc9aeab661e5

Mike Crowe (2):
=20=20kernel.bbclass: support kernel image type of vmlinux.gz
=20=20kernel.bbclass: Find the kernel consistently.

Paul Eggleton (4):
=20=20binutils: update to 2.21.1a
=20=20tcmode-default: update binutils version
=20=20distro_tracking_fields: update binutils to 2.21.1a
=20=20sanity.bbclass: fix splitting on newlines of SANITY_TESTED_DISTROS

Phil Blundell (4):
=20=20pango: make x11 support conditional on DISTRO_FEATURES
=20=20libc-package: restore correct mangling behavior for locale names
=20=20libcap: only enable pam if DISTRO_FEATURES requests it
=20=20useradd.bbclass: remove hardcoded reference to /usr/bin

Richard Purdie (16):
=20=20gdb: Fix broken source directory
=20=20intltool: Fix perl paths
=20=20bitbake: Correctly handle multiline comments including whitespace
=20=20bitbake/fetch2/git: Ensure .gitconfig file is ignored
=20=20package.bbclass: Ensure task's variable dependencies are correctly =
caputred=20
=20=20sanity.bbclass: Fix broken indentation leading to code being skipped =
uninten
=20=20sanity.bbclass: Fix broken whitespace
=20=20sanity.bbclass: Clean up various MACHINE checks
=20=20xserver-nodm: Disable dbus-wait as it causes users too much confusion
=20=20gdb: Further S vs. PV fixups
=20=20scripts: Don't show errors from which ifconfig failing
=20=20scripts: Show sensible warning messages if expected binaries don't =
exist
=20=20bitbake/event: Allow event handlers to quietly raise SkipPackage =
events
=20=20multilib: Only build one kernel
=20=20gcc: Fix multilib baselib confusion
=20=20populate_sdk: We need to ensure that the SDK sysroot reflects =
PACKAGE_ARCH

Saul Wold (3):
=20=20o-hand recipes: convert from svn.o-hand.org to git.yoctoproject.org
=20=20sato recipes: Update PR because of libowl conversion to git
=20=20tzcode: Update to 2011i

Scott Rifenbark (27):
=20=20documentation/poky-ref-manual/extendpoky.xml: Changed targe link =
title.
=20=20documentation/poky-ref-manual/faq.xml: Scrubbed for term Poky.
=20=20documentation/poky-ref-manual/resources.xml: re-write for today's =
world.
=20=20documentation/dev-manual/dev-manual-intro.xml: Added other =
information from=20
=20=20documentation/dev-manual/dev-manual-newbie.xml: added more to =
contributing
=20=20YOCTO #910 - documentation/poky-ref-manual/extendpoky.xml: point to =
dev manu
=20=20documentation/poky-ref-manual/usingpoky.xml: Updated logging mechanism
=20=20documentation/Makefile: Updated comments for usage per Robert P. J. =
Day
=20=20documentation/poky-ref-manual/ref-features.xml: typos fixed.
=20=20documentation/poky-ref-manual: Removed "spitz" machine example.
=20=20documentation/bsp-guide/bsp.xml: Scrubbed Crownbay items.
=20=20documentation/bsp-guide/bsp.xml: Removed directory class
=20=20YOCTO #1419: documentation/adt-manual/adt-eclipse.xml - re-word
=20=20YOCTO #1426: documentation/yocto-project-qs/yocto-project-qs.xml: =
added xter
=20=20documentation/dev-manual/dev-manual-model.xml: Edits to Modifying =
Kernel
=20=20documentation/dev-manual/figures: Three figures for kernel added.
=20=20documentation/Makefile: Updated the dev-manual to include three new =
pics.
=20=20documentation/dev-manual/dev-manual-model.xml: minor edits
=20=20documentation/dev-manual/dev-manual-kernel-appendix.xml: moved =
statement
=20=20documentation/poky-ref-manual/usingpoky.xml: Edits per Darren Hart
=20=20documentation/dev-manual/dev-manual-bsp-appendix.xml: Fixed =
BBFILES_COLLECTI
=20=20documentation/bsp-guide/bsp.xml: Edits for Crownbay example in kernel =
recipe
=20=20documentation/adt-manual: General edits.
=20=20YOCTO #1419: General edits and fix for oprofile-server rev =
requirements.
=20=20documentation/adt-manual/adt-prepare.xml: added reference to dev =
manual.
=20=20documentation/adt-manual/adt-prepare.xml: Updates to variable and =
other edit
=20=20YOCTO #1088: documentation - Added text to partially address package =
bug

Sebastian Krzyszkowiak (2):
=20=20libidn_1.22: add SRC_URI checksums
=20=20gdb: upgrade from 7.3 to 7.3a

Xiaofeng Yan (4):
=20=20qt4e-demo-image: Fix bug 999
=20=20eglibc-locale.inc: Add eglibc-binaries, eglibc-localedatas, =
eglibc-gconvs an
=20=20qt-demo-init: Fix bug 999
=20=20dropbear: Change the path to find configuration file and add a =
configuration

Zhai Edwin (1):
=20=20shadow: Fix rpm failed dependencies when install

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Koen Kooi (6):
=20=20linux-omap-psp 2.6.32: fix multiline comments
=20=20linux 3.1: update to 3.1rc4+
=20=20linux 3.0: update to 3.0.4
=20=20task-ti-test: import task-arago-test.bb from arago git
=20=20linux 3.0: remove flaky ABB patches
=20=20gstreamer-ti: add native system unit file

Tasslehoff Kjappfot (1):
=20=20linux-omap_2.6.39: remove patch that prevented board from resuming =
from susp

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (11):
=20=20linux-2.6.39: add snd modules to om-gta0[12] defconfigs
=20=20linux-openmoko: fix build with jack
=20=20linux-openmoko: upgrade to 2.6.39.4 and apply touchscreen patches =
from 2.6.3
=20=20meta-zaurus: linux(-kexecboot): upgrade to 2.6.39.4
=20=20task-shr-feed: remove empty line from multiline variable
=20=20u-boot: upgrade to 2011.06 and refresh patches from Ali
=20=20meta-nokia: keymaps: add keymap for nokia900
=20=20linux-openmoko-2.6.39: drop 2 ts patches which are probably causing =
kernel p
=20=20mcnavi: upgrade to 0.3.1
=20=20meta-samsung: fix e-mail subject prefix in README
=20=20meta-aurora: fix e-mail subject prefix in README

Simon Busch (9):
=20=20meta-palm: remove old and unneeded u-boot bbappend file
=20=20meta-palm: update machine description for palmpre machine class
=20=20meta-aurora: add first bits for the layer of the aurora distribution
=20=20meta-aurora: add configuration files for the aurora distribution
=20=20meta-aurora: aurora-version: import from oe-classic
=20=20meta-samsung: add initial bits for a new layer for samsung devices
=20=20meta-samsung: add machine description for crespo device (nexus s)
=20=20meta-samsung: linux-samsung-crespo: add recipe for crespo kernel
=20=20meta-aurora: aurora-image: add first version of the default image

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Darren Hart (1):
=20=20grub: remove the dependency on freetype, disable grub-mkfont

Tom Zanussi (1):
=20=20crownbay: change preferred display order

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Jesse Gilles (1):
=20=20classpath in 2011.03-maintenance

Martin Jansa (1):
=20=20mcnavi: add 0.3.1

Paul Menzel (1):
=20=20genext2fs: Remove unused `recipes/genext2fs/files/volume.patch`

Simon Busch (3):
=20=20initscripts: add a palmpre specific umountfs script
=20=20task-base: bump PR to pull in changes to initscripts
=20=20msmcomm: bump SRCREV

Stefan Herbrechtsmeier (1):
=20=20gcc: Remove package libstdc++-dev and libgcc-dev from gcc-cross

Sylvain Par=C3=A9 (2):
=20=20aurora.conf: set default locale for images
=20=20initscripts-shr: add a palmpre specific umountfs script

Tasslehoff Kjappfot (1):
=20=20linux-omap_2.6.39: remove patch that prevented board from resuming =
from susp




