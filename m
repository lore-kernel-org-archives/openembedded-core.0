Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AE4997688D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 14:22:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 10 Aug 2015 07:22:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,645,1432623600"; d="scan'208";a="745683981"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 10 Aug 2015 07:22:17 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 17:23:18 +0300
Message-Id: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/8] Package version updates
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
X-List-Received-Date: Mon, 10 Aug 2015 14:22:24 -0000

This patchset contains a few easy version updates. I skipped recipes that
require deep specialist knowledge (for example anything toolchain-related), 
or those with a big set of custom oe-core patches that would require a long 
study to understand and update those patches.

The following changes since commit c75cefe8a382a63f625123c156137782db118f64:

  libpam: Fix patch broken during upgrade (2015-08-09 15:15:33 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (8):
  autogen: update to 5.18.5
  apmd: update to 3.2.2-15
  apt: update to 1.0.10.1
  blktool: update to 4-7
  bluez5: update to 5.33
  bootchart2: update to 0.14.7
  cdrtools: update to 3.01a31
  clutter-gst: update to 3.0.8

 .../apmd/{apmd-3.2.2-14 => apmd}/apmd.service      |   0
 .../apmd/{apmd-3.2.2-14 => apmd}/apmd_proxy        |   0
 .../apmd/{apmd-3.2.2-14 => apmd}/apmd_proxy.conf   |   0
 .../apmd/{apmd-3.2.2-14 => apmd}/default           |   0
 meta/recipes-bsp/apmd/{apmd-3.2.2-14 => apmd}/init |   0
 meta/recipes-bsp/apmd/apmd/legacy.patch            | 112 ++++++++++++
 .../apmd/{apmd-3.2.2-14 => apmd}/libtool.patch     |   0
 .../apmd/{apmd-3.2.2-14 => apmd}/unlinux.patch     |   0
 .../apmd/{apmd_3.2.2-14.bb => apmd_3.2.2-15.bb}    |   6 +-
 .../bluez5/{bluez5_5.32.bb => bluez5_5.33.bb}      |   4 +-
 meta/recipes-devtools/apt/apt-native_1.0.10.1.bb   |   4 +
 meta/recipes-devtools/apt/apt-native_1.0.9.9.bb    |   9 -
 meta/recipes-devtools/apt/apt.inc                  |   5 +-
 ...ys-run-dpkg-configure-a-at-the-end-of-our.patch |   0
 .../0001-fix-the-gcc-version-check.patch           |   0
 ...001-remove-Wsuggest-attribute-from-CFLAGS.patch |   0
 .../disable-configure-in-makefile.patch            |   0
 .../apt/{apt-1.0.9.9 => apt}/disable-test.patch    |   0
 .../fix-gcc-4.6-null-not-defined.patch             |   0
 .../apt/{apt-1.0.9.9 => apt}/makerace.patch        |   0
 .../apt/{apt-1.0.9.9 => apt}/no-nls-dpkg.patch     |   0
 .../apt/{apt-1.0.9.9 => apt}/noconfigure.patch     |   0
 .../apt/{apt-1.0.9.9 => apt}/nodoc.patch           |   0
 .../{apt-1.0.9.9 => apt}/truncate-filename.patch   |   0
 .../apt/{apt-1.0.9.9 => apt}/use-host.patch        |   0
 .../apt/{apt_1.0.9.9.bb => apt_1.0.10.1.bb}        |   4 -
 ...n-native_5.18.4.bb => autogen-native_5.18.5.bb} |   5 +-
 meta/recipes-devtools/autogen/autogen/guile.patch  | 191 ---------------------
 .../bootchart2/bootchartd-no-bashism.patch         |  27 ---
 .../{bootchart2_git.bb => bootchart2_0.14.7.bb}    |   7 +-
 ...ative_3.01a20.bb => cdrtools-native_3.01a31.bb} |   4 +-
 .../blktool/0001-fix-typos-in-manpage.patch        |  34 ++++
 .../blktool/blktool/0002-fix-string-error.patch    |  25 +++
 ...rgument-for-BLKROSET-it-must-be-const-int.patch |  71 ++++++++
 .../blktool/{blktool_4-6.1.bb => blktool_4-7.bb}   |   9 +-
 ...r-gst-3.0_3.0.6.bb => clutter-gst-3.0_3.0.8.bb} |   4 +-
 36 files changed, 266 insertions(+), 255 deletions(-)
 rename meta/recipes-bsp/apmd/{apmd-3.2.2-14 => apmd}/apmd.service (100%)
 rename meta/recipes-bsp/apmd/{apmd-3.2.2-14 => apmd}/apmd_proxy (100%)
 rename meta/recipes-bsp/apmd/{apmd-3.2.2-14 => apmd}/apmd_proxy.conf (100%)
 rename meta/recipes-bsp/apmd/{apmd-3.2.2-14 => apmd}/default (100%)
 rename meta/recipes-bsp/apmd/{apmd-3.2.2-14 => apmd}/init (100%)
 create mode 100644 meta/recipes-bsp/apmd/apmd/legacy.patch
 rename meta/recipes-bsp/apmd/{apmd-3.2.2-14 => apmd}/libtool.patch (100%)
 rename meta/recipes-bsp/apmd/{apmd-3.2.2-14 => apmd}/unlinux.patch (100%)
 rename meta/recipes-bsp/apmd/{apmd_3.2.2-14.bb => apmd_3.2.2-15.bb} (92%)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.32.bb => bluez5_5.33.bb} (88%)
 create mode 100644 meta/recipes-devtools/apt/apt-native_1.0.10.1.bb
 delete mode 100644 meta/recipes-devtools/apt/apt-native_1.0.9.9.bb
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/0001-fix-the-gcc-version-check.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/0001-remove-Wsuggest-attribute-from-CFLAGS.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/disable-configure-in-makefile.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/disable-test.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/fix-gcc-4.6-null-not-defined.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/makerace.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/no-nls-dpkg.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/noconfigure.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/nodoc.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/truncate-filename.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/use-host.patch (100%)
 rename meta/recipes-devtools/apt/{apt_1.0.9.9.bb => apt_1.0.10.1.bb} (70%)
 rename meta/recipes-devtools/autogen/{autogen-native_5.18.4.bb => autogen-native_5.18.5.bb} (88%)
 delete mode 100644 meta/recipes-devtools/autogen/autogen/guile.patch
 delete mode 100644 meta/recipes-devtools/bootchart2/bootchart2/bootchartd-no-bashism.patch
 rename meta/recipes-devtools/bootchart2/{bootchart2_git.bb => bootchart2_0.14.7.bb} (97%)
 rename meta/recipes-devtools/cdrtools/{cdrtools-native_3.01a20.bb => cdrtools-native_3.01a31.bb} (81%)
 create mode 100644 meta/recipes-extended/blktool/blktool/0001-fix-typos-in-manpage.patch
 create mode 100644 meta/recipes-extended/blktool/blktool/0002-fix-string-error.patch
 create mode 100644 meta/recipes-extended/blktool/blktool/0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch
 rename meta/recipes-extended/blktool/{blktool_4-6.1.bb => blktool_4-7.bb} (72%)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.6.bb => clutter-gst-3.0_3.0.8.bb} (58%)

-- 
2.1.4


