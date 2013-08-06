Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4F3986AE32
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 07:13:57 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 06 Aug 2013 00:13:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,824,1367996400"; d="scan'208";a="278251409"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.23])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Aug 2013 00:13:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: ross.burton@intel.com, paul.eggleton@linux.intel.com,
	richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2013 00:13:40 -0700
Message-Id: <cover.1375772719.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Cc: dvhart@linux.intel.com, zhenhua.luo@freescale.com, otavio@ossystems.com.br
Subject: [CONSOLIDATED PULL 00/35] Review and ACK
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
X-List-Received-Date: Tue, 06 Aug 2013 07:13:58 -0000

Ross, Paul:

Here is a batch of AB tested and initially reviewed by me set of 
updates and other patches.  I did provide a setp patches for some 
overlooked issues in the last master

There is also a bashism fix for poky-tiny on the Poky list.

*** BSP Maintainers, this includes a Mesa Update, please be prepared to
*** Update your mesa bbappend.

Sau!

The following changes since commit bc6258f88705b0e7989089a8666ac5e5d2355823:

  grep: Add patch for texinfo 5.1 (2013-08-02 08:21:17 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Chen Qi (5):
  scripts/contrib/mkefidisk.sh: fix bashism
  qtdemo-init: fix bashism
  xtscal: fix bashism
  initramfs-framework: fix bashism
  buildtools-tarball: do not export OECORE_NATIVE_SYSROOT

Cristian Iorga (10):
  telepathy-mission-control: upgrade to v5.15.0
  telepathy-idle: upgrade to v0.1.16
  gstreamer1.0: upgrade to v1.0.9
  gstreamer1.0-plugins-base: upgrade to v1.0.9
  gstreamer1.0-plugins-good: upgrade to v1.0.9
  gstreamer1.0-libav: upgrade to v1.0.9
  gstreamer1.0-plugins-bad: upgrade to v1.0.9
  neon: upgrade to v0.30.0
  gstreamer1.0-plugins-ugly: upgrade to v1.0.9
  telepathy-glib: upgrade to v0.20.4

Cristiana Voicu (2):
  liburcu: upgrade to 0.7.7
  curl: upgrade to 7.31.0

Fathi Boudra (1):
  libc-package.bbclass: Add armeb architecture to locale_arch_options

Hongxu Jia (1):
  list-packageconfig-flags.py: add a script to list all PACKAGECONFIG
    flags

Ionut Radu (1):
  gdk-pixbuf: upgrade to 2.28.2

Javier Viguera (1):
  kernel.bbclass: fix typo

Jonathan Liu (2):
  mesa: update to 9.1.6
  qt4: add upstream QTBUG-32534 patch for QHttpMultiPart upload
    corruption

Otavio Salvador (1):
  base.bbclass: Fix PACKAGECONFIG usage comment

Ross Burton (1):
  buildhistory: add a note when committing to buildhistory

Saul Wold (8):
  apt-native: fix SRC_URI Checksum for update
  grub-efi-native: add flex patch to efi-native version also
  packagegroup-core-boot: correct runtime dependencies for non-sysvinit
    system
  texinfo: Fix path to perl for scripts
  libpng: package new tools into a libpng-tools package
  mc: upgrade to 4.8.10
  util-linux: upgrade to 2.23.2
  man-pages: upgrade to 3.53

Stefan Stanacar (1):
  oeqa/utils/qemurunner: fix wrong var in message

Yevhen Kyriukha (1):
  btrfs-tools: upgrade to upstream revision.

 meta/classes/base.bbclass                          |   2 +-
 meta/classes/buildhistory.bbclass                  |   1 +
 meta/classes/kernel.bbclass                        |   2 +-
 meta/classes/libc-package.bbclass                  |   1 +
 meta/lib/oeqa/utils/qemurunner.py                  |   2 +-
 .../fix-issue-with-flex-2.5.37.patch               |   0
 meta/recipes-bsp/grub/grub-efi-native_2.00.bb      |   1 +
 .../telepathy/telepathy-glib/pkgconfig.patch       |  41 -----
 ...thy-glib_0.20.1.bb => telepathy-glib_0.20.4.bb} |   8 +-
 .../fix-svc-gtk-doc.h-target.patch                 |   0
 ...thy-idle_0.1.14.bb => telepathy-idle_0.1.16.bb} |   5 +-
 ...14.0.bb => telepathy-mission-control_5.15.0.bb} |   5 +-
 .../initrdscripts/initramfs-framework/finish       |   5 +-
 .../initrdscripts/initramfs-framework/init         |  13 +-
 meta/recipes-core/meta/buildtools-tarball.bb       |   7 +-
 .../packagegroups/packagegroup-core-boot.bb        |   9 +-
 .../{util-linux_2.23.1.bb => util-linux_2.23.2.bb} |   4 +-
 meta/recipes-devtools/apt/apt-native_0.9.9.4.bb    |   4 +-
 ...ix_race_condition_with_multithreaded_make.patch |  36 ----
 .../btrfs-tools/btrfs-tools/fix_use_of_gcc.patch   |  31 ----
 .../btrfs-tools/btrfs-tools_git.bb                 |  13 +-
 .../{man-pages_3.52.bb => man-pages_3.53.bb}       |   4 +-
 .../mc/{mc_4.8.9.bb => mc_4.8.10.bb}               |   4 +-
 meta/recipes-extended/texinfo/texinfo_5.1.bb       |   2 +
 .../{gdk-pixbuf_2.28.1.bb => gdk-pixbuf_2.28.2.bb} |   4 +-
 ...ate-NativeDisplayType-depending-on-config.patch |   0
 ...move-the-power-of-two-sizeof-struct-cmd_b.patch |   0
 .../mesa/{mesa_9.1.5.bb => mesa_9.1.6.bb}          |   4 +-
 .../xtscal/xtscal/30xTs_Calibrate.sh               |   2 +-
 ...-libav_1.0.7.bb => gstreamer1.0-libav_1.0.9.bb} |   5 +-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |   2 -
 ..._1.0.7.bb => gstreamer1.0-plugins-bad_1.0.9.bb} |   4 +-
 .../gstreamer/gstreamer1.0-plugins-base.inc        |   2 -
 ...1.0.7.bb => gstreamer1.0-plugins-base_1.0.9.bb} |   5 +-
 .../gstreamer/gstreamer1.0-plugins-good.inc        |   2 -
 ...1.0.7.bb => gstreamer1.0-plugins-good_1.0.9.bb} |   4 +-
 .../gstreamer/gstreamer1.0-plugins-ugly.inc        |   2 -
 ...1.0.7.bb => gstreamer1.0-plugins-ugly_1.0.9.bb} |   4 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |   2 -
 ...gstreamer1.0_1.0.7.bb => gstreamer1.0_1.0.9.bb} |   4 +-
 meta/recipes-multimedia/libpng/libpng_1.6.3.bb     |   4 +
 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init   |   8 +-
 meta/recipes-qt/qt4/qt4-4.8.5.inc                  |   1 +
 ...art-fix-data-corruption-in-readData-metho.patch |  43 +++++
 .../curl/{curl_7.30.0.bb => curl_7.31.0.bb}        |   5 +-
 .../liburcu/{liburcu_0.7.6.bb => liburcu_0.7.7.bb} |   6 +-
 .../{neon-0.29.6 => neon-0.30.0}/pkgconfig.patch   |   0
 .../neon/{neon_0.29.6.bb => neon_0.30.0.bb}        |   7 +-
 scripts/contrib/list-packageconfig-flags.py        | 191 +++++++++++++++++++++
 scripts/contrib/mkefidisk.sh                       |   8 +-
 50 files changed, 317 insertions(+), 202 deletions(-)
 rename meta/recipes-bsp/grub/{grub-2.00 => files}/fix-issue-with-flex-2.5.37.patch (100%)
 delete mode 100644 meta/recipes-connectivity/telepathy/telepathy-glib/pkgconfig.patch
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.20.1.bb => telepathy-glib_0.20.4.bb} (73%)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle-0.1.14 => telepathy-idle-0.1.16}/fix-svc-gtk-doc.h-target.patch (100%)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle_0.1.14.bb => telepathy-idle_0.1.16.bb} (82%)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.14.0.bb => telepathy-mission-control_5.15.0.bb} (92%)
 rename meta/recipes-core/util-linux/{util-linux_2.23.1.bb => util-linux_2.23.2.bb} (83%)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
 rename meta/recipes-extended/man-pages/{man-pages_3.52.bb => man-pages_3.53.bb} (82%)
 rename meta/recipes-extended/mc/{mc_4.8.9.bb => mc_4.8.10.bb} (93%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.28.1.bb => gdk-pixbuf_2.28.2.bb} (94%)
 rename meta/recipes-graphics/mesa/{mesa-9.1.5 => mesa-9.1.6}/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch (100%)
 rename meta/recipes-graphics/mesa/{mesa-9.1.5 => mesa-9.1.6}/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch (100%)
 rename meta/recipes-graphics/mesa/{mesa_9.1.5.bb => mesa_9.1.6.bb} (79%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.0.7.bb => gstreamer1.0-libav_1.0.9.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.0.7.bb => gstreamer1.0-plugins-bad_1.0.9.bb} (75%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.0.7.bb => gstreamer1.0-plugins-base_1.0.9.bb} (72%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.0.7.bb => gstreamer1.0-plugins-good_1.0.9.bb} (73%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.0.7.bb => gstreamer1.0-plugins-ugly_1.0.9.bb} (66%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.0.7.bb => gstreamer1.0_1.0.9.bb} (72%)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.5/0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
 rename meta/recipes-support/curl/{curl_7.30.0.bb => curl_7.31.0.bb} (92%)
 rename meta/recipes-support/liburcu/{liburcu_0.7.6.bb => liburcu_0.7.7.bb} (80%)
 rename meta/recipes-support/neon/{neon-0.29.6 => neon-0.30.0}/pkgconfig.patch (100%)
 rename meta/recipes-support/neon/{neon_0.29.6.bb => neon_0.30.0.bb} (83%)
 create mode 100755 scripts/contrib/list-packageconfig-flags.py

-- 
1.8.1.4


