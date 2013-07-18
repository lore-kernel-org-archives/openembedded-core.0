Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id C62B16B118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 14:08:53 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2013 07:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,694,1367996400"; d="scan'208";a="270103074"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Jul 2013 07:08:52 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2013 17:16:24 +0300
Message-Id: <cover.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 00/11] Add read PV into recipes
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
X-List-Received-Date: Thu, 18 Jul 2013 14:08:53 -0000

Tested for backwards packages.

The following changes since commit 3dee534f1e25109e0bdb681de0746c336f4b8840:

  lib/oeqa: fix dependecy check (2013-07-16 10:04:17 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib emac/pv_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=emac/pv_fixes

Emilia Ciobanu (11):
  rt-tests: add PV variable into recipe
  kmod: add PV variable into recipe
  hwlatdetect: add PV variable into recipe
  lttng-ust: add PV variable into recipe
  connman-gnome: add PV variable into recipe
  mtd-utils: add PV variable into recipe
  update-rc.d: add PV variable into recipe
  build-appliance-image: add PV variable into recipe
  lttng-modules: Append _git to recipe name and update PV with git
    token
  chkconfig-alternatives-native: add git token in package version
  docbook-sgml-dtd-4.5-native.bb: Add real PV inside the recipe

 .../connman/connman-gnome_0.7.bb                   |    2 ++
 .../images/build-appliance-image_8.0.bb            |    2 ++
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb   |    1 +
 .../docbook-sgml-dtd-4.5-native.bb                 |    1 +
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
 ...t-cleanmarker-with-flash_erase--j-command.patch |    0
 meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb       |    2 +-
 .../chkconfig-alternatives-native_1.3.59.bb        |    2 +-
 meta/recipes-kernel/kmod/kmod_git.bb               |    1 +
 ...lttng-modules_2.2.0.bb => lttng-modules_git.bb} |    2 +-
 meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb       |    2 +-
 meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb       |    1 +
 meta/recipes-rt/rt-tests/rt-tests_0.85.bb          |    1 +
 13 files changed, 13 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.5.0 => mtd-utils}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.5.0 => mtd-utils}/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch (100%)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.2.0.bb => lttng-modules_git.bb} (97%)

-- 
1.7.9.5


