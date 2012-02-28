Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2FhL-0008QA-KW
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 06:34:04 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 21:25:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130197426"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2012 21:25:35 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 21:24:58 -0800
Message-Id: <cover.1330406574.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 00/36] General Updates, Kernel, QT, misc
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
X-List-Received-Date: Tue, 28 Feb 2012 05:34:04 -0000

Richard,

This has built and being rebuilt currently on the AB, and booted
locally.

Nothing too outrageous in here.

This should mark the end of M3 Dev targeting a 1.2 M3 Delivery by
Thursday.

Sau!


The following changes since commit 8d4db8e6dcd2d25637cb77515fe776552f2fdd6d:

  bitbake.conf: Create a new filter variable BB_HASHCONFIG_WHITELIST (2012-02-27 20:10:29 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Oberritter (1):
  qt4.inc: depend on tiff

Bruce Ashfield (3):
  linux-yocto: update 3.0 kernel to v3.0.22
  linux-yocto: update 3.2 kernel to v3.2.7
  linux-yocto: allow non-branched repositories to check out

James Limbouris (1):
  mtd-utils: Don't use host 'ranlib' or 'ar'.

Khem Raj (4):
  classes: Add recipe class to overrides
  default-distrovars: Add empty weak definition for DISTRO variable
  gcc: Stash the gcc-cross builddir to reuse in libgcc and gcc-runtime
  bluez4: Fix build on x86/amd64 with gcc 4.7

Matthew McClintock (5):
  arch-powerpc{, 64}.inc: update/add PACKAGE_EXTRA_ARCHS for
    powerpc/powerpc64
  tune-ppce5500: consolidate ppce5500 and ppc64e5500 into one tune file
  multilib.bbclass: allow TARGET_VENDOR_virtclass-multilib to be
    overriden
  bitbake.conf: add default value for TUNE_PKGARCH
  tune-ppc*.inc: update to use new default value for TUNE_PKGARCH

Paul Eggleton (4):
  qt4: fix compile error in Qt 4.8.0 with gcc 4.6
  qt4: build qmake for the target
  qt4-tools-nativesdk: fix build of 4.7.4
  qt4-tools-nativesdk: improve and tidy up qmake build

Saul Wold (14):
  gnupg: Add missing patch for curl_typeof_fix
  qemu: Add glib-2.0 as depends
  util-linux: Update to 2.21
  file: Update to version 5.11
  psmisc: Update to version 22.16
  libdrm: Update to version 2.4.31
  mkfontdir: Update to version 1.0.7
  mkfontscale: Update to version 1.1.0
  boost: Update to version 1.49.0
  sqlite3: Update to version 3.7.10
  xf86-video-intel: Update to version 2.18.0
  tiff: Update to version 3.9.5
  bind: add DEPENDS for libcap
  distro_tracking: Account for updates and Manual Checking

Wenzong Fan (1):
  gettext: Get gettext use its own libunistring

Yi Zhao (3):
  lsbtest: Add recipe for LSB tests and automate test
  distro_tracking_fields: add information for lsbtest
  task-core-lsb: add lsbtest to RDEPENDS_task-core-misc list

 meta/classes/base.bbclass                          |    1 +
 meta/classes/cross-canadian.bbclass                |    2 +-
 meta/classes/cross.bbclass                         |    1 +
 meta/classes/crosssdk.bbclass                      |    1 +
 meta/classes/kernel-yocto.bbclass                  |    2 +-
 meta/classes/multilib.bbclass                      |    3 +-
 meta/classes/native.bbclass                        |    3 +-
 meta/classes/nativesdk.bbclass                     |    3 +-
 meta/conf/bitbake.conf                             |    4 +-
 meta/conf/distro/include/default-distrovars.inc    |    7 +
 .../conf/distro/include/distro_tracking_fields.inc |  110 +++--
 meta/conf/machine/include/powerpc/arch-powerpc.inc |    4 +-
 .../machine/include/powerpc/arch-powerpc64.inc     |    1 +
 meta/conf/machine/include/tune-ppc603e.inc         |    2 +-
 meta/conf/machine/include/tune-ppce300c2.inc       |    2 +-
 meta/conf/machine/include/tune-ppce500.inc         |    2 +-
 meta/conf/machine/include/tune-ppce500mc.inc       |    2 +-
 meta/conf/machine/include/tune-ppce500v2.inc       |    2 +-
 meta/conf/machine/include/tune-ppce5500-32b.inc    |   15 -
 meta/conf/machine/include/tune-ppce5500-64b.inc    |   15 -
 meta/conf/machine/include/tune-ppce5500.inc        |   20 +
 meta/recipes-connectivity/bind/bind_9.8.1.bb       |    4 +-
 .../bluez/bluez4-4.98/sbc_mmx.patch                |   24 +
 meta/recipes-connectivity/bluez/bluez4_4.98.bb     |    6 +-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    3 +-
 .../util-linux-ng-replace-siginterrupt.patch       |   25 -
 .../{util-linux-2.20.1 => util-linux-2.21}/MCONFIG |    0
 .../defines.h                                      |    0
 .../make_include                                   |    0
 .../remove-lscpu.patch                             |    0
 .../remove_sigsetmark.patch                        |    0
 .../swapargs.h                                     |    0
 .../uclibc-__progname-conflict.patch               |    0
 .../uclibc-compile.patch                           |    0
 .../util-linux-ng-2.16-mount_lock_path.patch       |    0
 .../util-linux-ng-replace-siginterrupt.patch       |   26 +
 meta/recipes-core/util-linux/util-linux.inc        |    8 +-
 .../{util-linux_2.20.1.bb => util-linux_2.21.bb}   |   12 +-
 .../file/{file_5.10.bb => file_5.11.bb}            |    6 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    3 -
 .../recipes-devtools/gcc/gcc-configure-runtime.inc |   24 +-
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |    2 +-
 meta/recipes-devtools/gcc/gcc-package-cross.inc    |   14 +-
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |   34 +-
 meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb       |    4 +-
 meta/recipes-devtools/qemu/qemu.inc                |    2 +-
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    2 +-
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh      |  510 ++++++++++++++++++++
 meta/recipes-extended/lsb/lsbtest/packages_list    |   50 ++
 meta/recipes-extended/lsb/lsbtest/session          |  194 ++++++++
 meta/recipes-extended/lsb/lsbtest_1.0.bb           |   37 ++
 .../psmisc/files/libintl-link.patch                |   32 --
 meta/recipes-extended/psmisc/psmisc.inc            |    4 +-
 .../psmisc/{psmisc_22.14.bb => psmisc_22.16.bb}    |    4 +-
 meta/recipes-extended/tasks/task-core-lsb.bb       |    3 +-
 .../drm/{libdrm_2.4.30.bb => libdrm_2.4.31.bb}     |    6 +-
 .../{mkfontdir_1.0.6.bb => mkfontdir_1.0.7.bb}     |    4 +-
 .../{mkfontscale_1.0.9.bb => mkfontscale_1.1.0.bb} |    4 +-
 ...-intel_2.17.0.bb => xf86-video-intel_2.18.0.bb} |    5 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    8 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |    9 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   18 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |   19 +-
 .../libtiff/{tiff_3.9.5.bb => tiff_4.0.1.bb}       |    8 +-
 meta/recipes-qt/qt4/files/qmake-exists-check.patch |   19 -
 meta/recipes-qt/qt4/files/target_qmake.patch       |   27 +
 meta/recipes-qt/qt4/qt-4.7.4.inc                   |   11 +-
 meta/recipes-qt/qt4/qt-4.8.0.inc                   |   13 +-
 .../qt4/qt-4.8.0/configure_oe_compiler.patch       |   31 ++
 meta/recipes-qt/qt4/qt-4.8.0/qmake_pri_fixes.patch |   51 ++
 meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |   29 +-
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb   |    2 +
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |    2 +-
 meta/recipes-qt/qt4/qt4.inc                        |   51 ++-
 .../boost/{boost_1.48.0.bb => boost_1.49.0.bb}     |    4 +-
 .../gnupg-1.4.7/curl_typeof_fix_backport.patch     |   27 +
 meta/recipes-support/sqlite/sqlite3_3.7.10.bb      |   11 +
 meta/recipes-support/sqlite/sqlite3_3.7.9.bb       |   11 -
 84 files changed, 1287 insertions(+), 334 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-ppce5500-32b.inc
 delete mode 100644 meta/conf/machine/include/tune-ppce5500-64b.inc
 create mode 100644 meta/conf/machine/include/tune-ppce5500.inc
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.98/sbc_mmx.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux-2.20.1/util-linux-ng-replace-siginterrupt.patch
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/MCONFIG (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/defines.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/make_include (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/remove-lscpu.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/remove_sigsetmark.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/swapargs.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/uclibc-__progname-conflict.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/uclibc-compile.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/util-linux-ng-2.16-mount_lock_path.patch (100%)
 create mode 100644 meta/recipes-core/util-linux/util-linux-2.21/util-linux-ng-replace-siginterrupt.patch
 rename meta/recipes-core/util-linux/{util-linux_2.20.1.bb => util-linux_2.21.bb} (84%)
 rename meta/recipes-devtools/file/{file_5.10.bb => file_5.11.bb} (85%)
 create mode 100644 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
 create mode 100644 meta/recipes-extended/lsb/lsbtest/packages_list
 create mode 100644 meta/recipes-extended/lsb/lsbtest/session
 create mode 100644 meta/recipes-extended/lsb/lsbtest_1.0.bb
 delete mode 100644 meta/recipes-extended/psmisc/files/libintl-link.patch
 rename meta/recipes-extended/psmisc/{psmisc_22.14.bb => psmisc_22.16.bb} (46%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.30.bb => libdrm_2.4.31.bb} (59%)
 rename meta/recipes-graphics/xorg-app/{mkfontdir_1.0.6.bb => mkfontdir_1.0.7.bb} (81%)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.0.9.bb => mkfontscale_1.1.0.bb} (80%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.17.0.bb => xf86-video-intel_2.18.0.bb} (84%)
 rename meta/recipes-multimedia/libtiff/{tiff_3.9.5.bb => tiff_4.0.1.bb} (79%)
 delete mode 100644 meta/recipes-qt/qt4/files/qmake-exists-check.patch
 create mode 100644 meta/recipes-qt/qt4/files/target_qmake.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/configure_oe_compiler.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/qmake_pri_fixes.patch
 rename meta/recipes-support/boost/{boost_1.48.0.bb => boost_1.49.0.bb} (53%)
 create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/curl_typeof_fix_backport.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.10.bb
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.9.bb

-- 
1.7.7.6



