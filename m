Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1QerSD-0001zS-E7; Thu, 07 Jul 2011 18:29:30 +0200
Received: from localhost ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1QerOS-0001v1-0B; Thu, 07 Jul 2011 12:25:36 -0400
Date: Thu, 07 Jul 2011 12:25:36 -0400
Message-Id: <E1QerOS-0001v1-0B@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-06-27 to 2011-07-4
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
X-List-Received-Date: Thu, 07 Jul 2011 16:29:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-06-27 to 2011-07-4.  Projects included in this report:

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

Joshua Lock (7):
=20=20command|cooker: allow generating targets tree for specified pkgs
=20=20cooker: add generic method to locate configuration files
=20=20command|cooker|event: add findConfigFilePath command
=20=20cooker|command|event: add new command findFilesMatchingInDir
=20=20cooker: remove code duplication in non trivial functions
=20=20cooker: switch to new universe target rather than world
=20=20bitbake: add -R option for loading configuration files after =
bitbake.conf

Lianhao Lu (1):
=20=20ui/hob: Fixed the "build again" hang.

Liping Ke (1):
=20=20bitbake: Make bitbake server type configurable.

Richard Purdie (6):
=20=20bitbake/data_smart: Optimise the data store iterator
=20=20bitbake/data_smart: Don't export deleted/empty entries in the list of =
keys
=20=20bitbake/data_smart: Don't track overrides in deleted variable names
=20=20bitbake/ast: Call expandkeys after the RecipePreFinalise event
=20=20bitbake/ast: Add optional argument for BBCLASSEXTEND
=20=20Update version to 1.13.2

Robert Yang (1):
=20=20bitbake: Add task specific stamp file support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Anders Darander (8):
=20=20Remove support for building 2.4 kernels
=20=20image|kernel.bblass|module-init-tools: do not use depmod-2.6
=20=20modules-init-tools(-cross): update to 3.16
=20=20modutils-initscripts: move recipe prior to modutils removal
=20=20kernel.bblass: remove get_kernelmajorversion
=20=20modutils: remove modutils
=20=20distro_tracking_fields: remove modutils.
=20=20resolvconf: update to version 1.58.

Chris Larson (1):
=20=20oe.classutils: add module

Darren Hart (2):
=20=20Add PARALLEL_MAKE to BB_ENV_EXTRAWHITE
=20=20kernel: move menuconfig task after configure

Dexuan Cui (5):
=20=20sanity.bbclass: only run check_pseudo_wrapper for bitbake
=20=20glib-2.0,intltool,rpm,sgmlspl-native: Bump PR to resolve perl-native =
issue
=20=20grub: add -fno-reorder-functions into STAGE2_COMPILE
=20=20lttng-ust: change the patch's Upstream-Status to Accepted.
=20=20distro_tracking_fields.inc: update RECIPE_MANUAL_CHECK_DATE for =
screen and t

Dongxiao Xu (9):
=20=20libc-locale: split locale handling from libc recipe.
=20=20Upstream-Status: update the status for some patches
=20=20distro_tracking: update some manual checking fields
=20=20connman: Upgrade to version 0.75
=20=20wpa-supplicant: remove the 0.6.10 version.
=20=20ofono: upgrade to version 0.50
=20=20connman-gnome: Add 3G configuration support
=20=20initscript: Change some order of init scripts
=20=20task-base: add 3G into DISTRO_FEATURE

Ilya Yanok (1):
=20=20u-boot-mkimage: bump version to 2011.03

Jessica Zhang (1):
=20=20Add OECORE_ACLOCAL_OPTS to env setup scripts for autotool project =
using corr

Joshua Lock (1):
=20=20sanity.bbclass: pass the data object to the less frequent test =
harnesses

Khem Raj (10):
=20=20libtirpc: Upgrade 0.2.1 -> 0.2.2
=20=20uclibc: Remove redundant machine/arch configs
=20=20uclibc-config.inc: Fix regexp to determine big-endian arm
=20=20uclibc.inc: Use ARCH_WANTS_{LITTLE|BIG}_ENDIAN to denote endian
=20=20uclibc_git.bb: Untether UCLIBC_HAS_FPU from UCLIBC_HAS_FLOATS
=20=20uclibc: Add UCLIBC_HAS_FLOATS=3Dy to uClibc.distro
=20=20uclibc: Fix bug exposed by udev 168+ for mips architecture
=20=20uclibc: Add default uClibc.machine files
=20=20consolekit: Add glib-2.0 to DEPENDS
=20=20uclibc: Fix compilation in thumb mode

Koen Kooi (8):
=20=20gcc-cross-kernel: update to match new toolchain sysroot layout
=20=20libc locale split: fix some remaining problems
=20=20linux-libc-headers: add 2.6.39
=20=20dbus: update to 1.4.12
=20=20webkit-gtk: fix packaging
=20=20consolekit 0.4.5: add pam support based on distro features
=20=20consolekit 0.4.5: remove patch that forcibly disables consolekit
=20=20ppp: sync packaging with OE .dev

Lianhao Lu (1):
=20=20libc-package.bbclass: Replace hard coded libdir.

Mark Hatle (9):
=20=20gcc: Fix file ownership
=20=20prelink: Uprev prelink to latest version
=20=20msmtp: Disable gnome keyring
=20=20rpm: Change config option
=20=20sstate.bbclass: Fix an issue if the config changes
=20=20prelink_git.bb: Only block the postinst script when no image-prelink
=20=20linux-firmware: Fix file permissions
=20=20Add umask task control
=20=20classes/package.bbclass: Add fixup_perms

Mei Lei (4):
=20=20distrodata.bbclass: Get the extend recipe's information from non =
bbextended=20
=20=20curl: Upgrade from 7.21.6 to 7.21.7
=20=20coreutils: Upgrade from 8.9 to 8.12
=20=20distro_tracking_fields.inc: update recipes upgrade information

Michael Lippautz (1):
=20=20linux-firmware: Add Realtex rt8192* firmwares

Nitin A Kamble (6):
=20=20btrfs-tools: new recipe for tools to operate on btrfs images
=20=20image-types.bbclass: get the image size in the whole number
=20=20image_types.bbclass: enable btrfs as one of the image type
=20=20base-files: add btrfs to /etc/filesystems
=20=20scripts/runqemu: enable btrfs
=20=20perl: Fix package qa rpath warnings.

Otavio Salvador (2):
=20=20libxml: extend nativesdk class
=20=20lib_package.bbclass: move static libraries to ${PN}-staticdev

Phil Blundell (3):
=20=20dhcp: don't try to move files from ${sbindir} to ${base_sbindir} if =
they are
=20=20fontconfig: specify font directory in EXTRA_OECONF
=20=20binutils: allow distro to select gold as default linker

Richard  Purdie (8):
=20=20libc-locale: Fixup various packaging warnings
=20=20glibc/eglibc: Clean up package warnings and potentially broken data =
in -dev=20
=20=20cairo: Clean up packaging and fix warnings
=20=20kernel.bbclass: Ensure kernel/* internal sysroot working directory =
don't get
=20=20libpcre: Fix QA warnings
=20=20python: Ensure libpython.so ends up in the .dev package
=20=20beecrypt: Fix up packaging QA warnings
=20=20insane.bbclass: Start to rework this so specific checks can be easily =
made w

Richard Purdie (14):
=20=20eglibc: Fix version 2.12 after locale changes
=20=20glibc/eglibc: Add missing PR bump
=20=20base.bbclass: Drop old style SRCDATE handling, we have pn- overrides =
now
=20=20base.bbclass: Since we require python 2.6 which always contains =
hashlib we c
=20=20classes/conf: Drop MULTIMACH_ARCH variable, it adds unused complexity =
and se
=20=20base/glib-2.0: Simplify USE_NLS handling for glib-2.0
=20=20base.bbclass: Back off the fatal error to a warning for now and try =
and reco
=20=20libc-locale: Drop PN-locale packages
=20=20scripts/oe-setup-builddir: Fix Yocto documentation links and add a =
couple of
=20=20eglibc-package.bbclass: Fix unintended code changes
=20=20eglibc-package.bbclass: Ensure localedef is only packaged in one =
location
=20=20glibc-2.12: Add missing PR bump
=20=20sanity.conf: Require bitbake version 1.13.2 at a minimum
=20=20Drop PRIORITY variable

Robert Yang (3):
=20=20Share gcc work directories
=20=20gcc-4.5.1: share work directories
=20=20gcc-4.6: share work directories

Saul Wold (3):
=20=20gconf-dbus: Fix SRC_URI to tarball
=20=20systemtap: add sqlite3 to DEPENDS
=20=20util-linux: Rebase remove-lscpu patch from non-gplv3

Scott Garman (11):
=20=20bitbake wrapper: exit if python v3 is detected
=20=20shadow-sysroot: new recipe for useradd.bbclass support
=20=20base-passwd: remove login.defs references
=20=20mtools: upgrade to v4.0.16
=20=20distro_tracking: update mtools tracking info
=20=20sudo: upgrade to v1.8.1p2
=20=20distro_tracking: update sudo tracking info
=20=20shadow-native: fix creation of home directories
=20=20bitbake.conf: update PSEUDO_PASSWD variable
=20=20useradd.bbclass: new class for managing user/group permissions
=20=20useradd-example: example recipe for using inherit useradd

Wenzong Fan (4):
=20=20ccache: Integrate ccache-native to poky
=20=20ccache: Set CCACHE on a per recipe basis
=20=20ccache: Add 'ccache' for SDK images
=20=20ccache: Remove duplicate 'ccache.inc' from 'meta/class/'

Yu Ke (6):
=20=20distro_tracking_field: update recipe maintainer
=20=20libidn: upgrade from 1.20 to 1.22
=20=20libdrm: upgrade to 2.4.26
=20=20distro_tracking_field: update the manually check field
=20=20sqlite: upgrade from 3.7.6.2 to 3.7.7.1
=20=20xauth: upgrade from 1.05 to 1.06

Zhai Edwin (3):
=20=20glib-networking: Add 2.28.7 as new recipe
=20=20distro-tracking: Update manual check date for puzzles, gpgme, x11vnc..
=20=20web-webkit: recommends glib-networking to access https web page

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Anders Darander (3):
=20=20tzcode: Update tzdata version.
=20=20Remove support for building 2.4 kernels
=20=20image|kernel.bblass|module-init-tools: do not use depmod-2.6

Khem Raj (6):
=20=20gcc-common-4.6.inc: Set ARM_INSTRUCTION_SET to arm
=20=20systemd_git.bb: Alias mkostemp() to mkstemp() for uclibc targets
=20=20systemd_git.bb: Add patch to disable --nonet option
=20=20htop: Link with libubacktrace when compiling for uclibc
=20=20cpufrequtils: Fix compilation on uclibc
=20=20gcc-4.5: Edit defaults.h in ${B} instead of ${S}, and t-oe in ${B}

Koen Kooi (10):
=20=20systemd: bump SRCREV to get the new daemons
=20=20systemd: bump SRCREV to fix capability dropping on older (<.39) =
kernels
=20=20libcap2: drop, it's in oe-core already
=20=20systemd: move machine specific package out to a new recipe
=20=20systemd: clean up serial port handling some more and fix the screen =
clearing
=20=20gcc 4.5: update to work with shared-work
=20=20iw: add 0.9.20
=20=20dietsplash: add git version
=20=20kernel.bbclass: sync with OE-core
=20=20kernel.bbclass: blacklist 'perf-dbg' as well for the modules meta =
package

Mark Hatle (1):
=20=20kernel.bbclass: Add support for perf-dbg package

Otavio Salvador (4):
=20=20xf86-video-geode: add 2.11.12 version
=20=20freerdp: bump SRCREV to gather fixes
=20=20freerdp-extension-xpunlimited: bump SRCREV to fix a build failure
=20=20inih: bump SRCREV to sync with upstream r12

Richard Purdie (1):
=20=20kernel.bbclass: Ensure kernel/* internal sysroot working directory =
don't get

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20systemd-image: Do not install conman on uclibc systems for now

Koen Kooi (5):
=20=20angstrom: prefer eglibc-locale 2.12
=20=20task-xserver: split XSERVER task into it's own recipe for sstate =
reasons
=20=20angstrom-task-gnome*: use new xserver task
=20=20systemd-gnome-image: fix task-xserver reference
=20=20angstrom-task-gnome*: fix typo spotted by sakoman

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Anders Darander (8):
=20=20Remove support for building 2.4 kernels
=20=20image|kernel.bblass|module-init-tools: do not use depmod-2.6
=20=20modules-init-tools(-cross): update to 3.16
=20=20modutils-initscripts: move recipe prior to modutils removal
=20=20kernel.bblass: remove get_kernelmajorversion
=20=20modutils: remove modutils
=20=20distro_tracking_fields: remove modutils.
=20=20resolvconf: update to version 1.58.

Chris Larson (1):
=20=20oe.classutils: add module

Darren Hart (2):
=20=20Add PARALLEL_MAKE to BB_ENV_EXTRAWHITE
=20=20kernel: move menuconfig task after configure

Dexuan Cui (6):
=20=20sanity.bbclass: only run check_pseudo_wrapper for bitbake
=20=20glib-2.0,intltool,rpm,sgmlspl-native: Bump PR to resolve perl-native =
issue
=20=20grub: add -fno-reorder-functions into STAGE2_COMPILE
=20=20lttng-ust: change the patch's Upstream-Status to Accepted.
=20=20distro_tracking_fields.inc: update RECIPE_MANUAL_CHECK_DATE for =
screen and t
=20=20poky.conf: add largefile support into DISTRO_FEATURES

Dongxiao Xu (9):
=20=20libc-locale: split locale handling from libc recipe.
=20=20Upstream-Status: update the status for some patches
=20=20distro_tracking: update some manual checking fields
=20=20connman: Upgrade to version 0.75
=20=20wpa-supplicant: remove the 0.6.10 version.
=20=20ofono: upgrade to version 0.50
=20=20connman-gnome: Add 3G configuration support
=20=20initscript: Change some order of init scripts
=20=20task-base: add 3G into DISTRO_FEATURE

Ilya Yanok (1):
=20=20u-boot-mkimage: bump version to 2011.03

Jessica Zhang (1):
=20=20Add OECORE_ACLOCAL_OPTS to env setup scripts for autotool project =
using corr

Joshua Lock (8):
=20=20sanity.bbclass: pass the data object to the less frequent test =
harnesses
=20=20command|cooker: allow generating targets tree for specified pkgs
=20=20cooker: add generic method to locate configuration files
=20=20command|cooker|event: add findConfigFilePath command
=20=20cooker|command|event: add new command findFilesMatchingInDir
=20=20cooker: remove code duplication in non trivial functions
=20=20cooker: switch to new universe target rather than world
=20=20bitbake: add -R option for loading configuration files after =
bitbake.conf

Khem Raj (10):
=20=20libtirpc: Upgrade 0.2.1 -> 0.2.2
=20=20uclibc: Remove redundant machine/arch configs
=20=20uclibc-config.inc: Fix regexp to determine big-endian arm
=20=20uclibc.inc: Use ARCH_WANTS_{LITTLE|BIG}_ENDIAN to denote endian
=20=20uclibc_git.bb: Untether UCLIBC_HAS_FPU from UCLIBC_HAS_FLOATS
=20=20uclibc: Add UCLIBC_HAS_FLOATS=3Dy to uClibc.distro
=20=20uclibc: Fix bug exposed by udev 168+ for mips architecture
=20=20uclibc: Add default uClibc.machine files
=20=20consolekit: Add glib-2.0 to DEPENDS
=20=20uclibc: Fix compilation in thumb mode

Koen Kooi (8):
=20=20gcc-cross-kernel: update to match new toolchain sysroot layout
=20=20libc locale split: fix some remaining problems
=20=20linux-libc-headers: add 2.6.39
=20=20dbus: update to 1.4.12
=20=20webkit-gtk: fix packaging
=20=20consolekit 0.4.5: add pam support based on distro features
=20=20consolekit 0.4.5: remove patch that forcibly disables consolekit
=20=20ppp: sync packaging with OE .dev

Lianhao Lu (2):
=20=20libc-package.bbclass: Replace hard coded libdir.
=20=20ui/hob: Fixed the "build again" hang.

Liping Ke (1):
=20=20bitbake: Make bitbake server type configurable.

Mark Hatle (9):
=20=20gcc: Fix file ownership
=20=20prelink: Uprev prelink to latest version
=20=20msmtp: Disable gnome keyring
=20=20rpm: Change config option
=20=20sstate.bbclass: Fix an issue if the config changes
=20=20prelink_git.bb: Only block the postinst script when no image-prelink
=20=20linux-firmware: Fix file permissions
=20=20Add umask task control
=20=20classes/package.bbclass: Add fixup_perms

Mei Lei (4):
=20=20distrodata.bbclass: Get the extend recipe's information from non =
bbextended=20
=20=20curl: Upgrade from 7.21.6 to 7.21.7
=20=20coreutils: Upgrade from 8.9 to 8.12
=20=20distro_tracking_fields.inc: update recipes upgrade information

Michael Lippautz (1):
=20=20linux-firmware: Add Realtex rt8192* firmwares

Nitin A Kamble (6):
=20=20btrfs-tools: new recipe for tools to operate on btrfs images
=20=20image-types.bbclass: get the image size in the whole number
=20=20image_types.bbclass: enable btrfs as one of the image type
=20=20base-files: add btrfs to /etc/filesystems
=20=20scripts/runqemu: enable btrfs
=20=20perl: Fix package qa rpath warnings.

Otavio Salvador (2):
=20=20libxml: extend nativesdk class
=20=20lib_package.bbclass: move static libraries to ${PN}-staticdev

Phil Blundell (3):
=20=20dhcp: don't try to move files from ${sbindir} to ${base_sbindir} if =
they are
=20=20fontconfig: specify font directory in EXTRA_OECONF
=20=20binutils: allow distro to select gold as default linker

Richard Purdie (29):
=20=20eglibc: Fix version 2.12 after locale changes
=20=20glibc/eglibc: Add missing PR bump
=20=20base.bbclass: Drop old style SRCDATE handling, we have pn- overrides =
now
=20=20base.bbclass: Since we require python 2.6 which always contains =
hashlib we c
=20=20classes/conf: Drop MULTIMACH_ARCH variable, it adds unused complexity =
and se
=20=20base/glib-2.0: Simplify USE_NLS handling for glib-2.0
=20=20base.bbclass: Back off the fatal error to a warning for now and try =
and reco
=20=20bitbake/data_smart: Optimise the data store iterator
=20=20bitbake/data_smart: Don't export deleted/empty entries in the list of =
keys
=20=20bitbake/data_smart: Don't track overrides in deleted variable names
=20=20bitbake/ast: Call expandkeys after the RecipePreFinalise event
=20=20bitbake/ast: Add optional argument for BBCLASSEXTEND
=20=20Update version to 1.13.2
=20=20libc-locale: Drop PN-locale packages
=20=20scripts/oe-setup-builddir: Fix Yocto documentation links and add a =
couple of
=20=20libc-locale: Fixup various packaging warnings
=20=20glibc/eglibc: Clean up package warnings and potentially broken data =
in -dev=20
=20=20eglibc-package.bbclass: Fix unintended code changes
=20=20eglibc-package.bbclass: Ensure localedef is only packaged in one =
location
=20=20glibc-2.12: Add missing PR bump
=20=20sanity.conf: Require bitbake version 1.13.2 at a minimum
=20=20bitbake: Add missing bracket, somehow lost by sync scripts
=20=20cairo: Clean up packaging and fix warnings
=20=20kernel.bbclass: Ensure kernel/* internal sysroot working directory =
don't get
=20=20libpcre: Fix QA warnings
=20=20python: Ensure libpython.so ends up in the .dev package
=20=20beecrypt: Fix up packaging QA warnings
=20=20insane.bbclass: Start to rework this so specific checks can be easily =
made w
=20=20Drop PRIORITY variable

Robert Yang (4):
=20=20bitbake: Add task specific stamp file support
=20=20Share gcc work directories
=20=20gcc-4.5.1: share work directories
=20=20gcc-4.6: share work directories

Saul Wold (3):
=20=20gconf-dbus: Fix SRC_URI to tarball
=20=20systemtap: add sqlite3 to DEPENDS
=20=20util-linux: Rebase remove-lscpu patch from non-gplv3

Scott Garman (11):
=20=20bitbake wrapper: exit if python v3 is detected
=20=20shadow-sysroot: new recipe for useradd.bbclass support
=20=20base-passwd: remove login.defs references
=20=20mtools: upgrade to v4.0.16
=20=20distro_tracking: update mtools tracking info
=20=20sudo: upgrade to v1.8.1p2
=20=20distro_tracking: update sudo tracking info
=20=20shadow-native: fix creation of home directories
=20=20bitbake.conf: update PSEUDO_PASSWD variable
=20=20useradd.bbclass: new class for managing user/group permissions
=20=20useradd-example: example recipe for using inherit useradd

Wenzong Fan (4):
=20=20ccache: Integrate ccache-native to poky
=20=20ccache: Set CCACHE on a per recipe basis
=20=20ccache: Add 'ccache' for SDK images
=20=20ccache: Remove duplicate 'ccache.inc' from 'meta/class/'

Yu Ke (6):
=20=20distro_tracking_field: update recipe maintainer
=20=20libidn: upgrade from 1.20 to 1.22
=20=20libdrm: upgrade to 2.4.26
=20=20distro_tracking_field: update the manually check field
=20=20sqlite: upgrade from 3.7.6.2 to 3.7.7.1
=20=20xauth: upgrade from 1.05 to 1.06

Zhai Edwin (3):
=20=20glib-networking: Add 2.28.7 as new recipe
=20=20distro-tracking: Update manual check date for puzzles, gpgme, x11vnc..
=20=20web-webkit: recommends glib-networking to access https web page

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Koen Kooi (6):
=20=20linux-omap 2.6.39: revert gptimer patch, it breaks on the boards that =
need g
=20=20u-boot: readd deploy task
=20=20x-load: readd deploy task
=20=20u-boot: update 2011.06rc to 2011.06 final
=20=20ti816x: fix uboot config name
=20=20linux-ti81xx-psp 2.6.37: update netra config

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

Khem Raj (5):
=20=20task-slugos-toolchain-host.bb: Use task-sdk-host-nativesdk.bb in =
place of ta
=20=20slugos.conf: Use 4.6.% regexp to select gcc preferred version
=20=20slugos.inc: Add DISTRO_FEATURES_LIBC to DISTRO_FEATURES
=20=20slugos.inc: Add thumb-interwork to distro features
=20=20initscripts: Adjust for the recipe changes from core layer

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Dexuan Cui (1):
=20=20emenlow: fix some .bbappend files' name: poky -> core, etc.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Chase Maupin (1):
=20=20softap-udhcpd-config: add recipe for udhcpd config files

Jeff Lance (1):
=20=20am-benchmarks: Remove platform dependencies

Klaus Kurzmann (1):
=20=20cornucopia.inc: bump SRCREV to get the fixed ppp plugin from fsogsmd

Mario Schuknecht (1):
=20=20udev: avoid udev stopping persistent pppd connections

Paul Menzel (1):
=20=20htop: Link with libubacktrace when compiling for uClibc

Steffen Sledz (2):
=20=20ppp-2.4.5: own package for PPPoL2TP plugin
=20=20ppp-2.4.5: remove `DP =3D "-1"`

Tom Rini (3):
=20=20cpan.bbclass: Make cpan_do_configure undo the perl.real unwrapping
=20=20file: Fix relocation patch
=20=20opkg-utils: Add LICENSE field




