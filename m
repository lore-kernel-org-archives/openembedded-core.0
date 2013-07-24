Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 46F936B276
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 14:07:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Jul 2013 07:05:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,735,1367996400"; d="scan'208";a="375670613"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by orsmga002.jf.intel.com with ESMTP; 24 Jul 2013 07:07:42 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 17:15:27 +0300
Message-Id: <cover.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v3 00/12] Add/Update PV variable into recipes
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
X-List-Received-Date: Wed, 24 Jul 2013 14:07:43 -0000

Patches were tested against backwards revs using buildhistory class.

The following changes since commit 67864ca79da08df752487a3a4e1a975546da123d:

  systemd: Remove systemd_unitdir if systemd is not in distro features (2013-07-24 11:35:39 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib emac/add_pv_to_recipes_v3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=emac/add_pv_to_recipes_v3

Emilia Ciobanu (12):
  babeltrace: fix recipe name
  build-appliance-image: fix recipe name add GIT revision to PV
    variable
  chkconfig-alternatives-native: fix recipe name and add GIT revision
    to PV variable
  connman-gnome: fix recipe name add GIT revision to PV variable
  docbook-sgml-dtd-3.1-native: fix recipe name
  docbook-sgml-dtd-4.1-native: fix recipe name
  hwlatdetect: fix recipe name and add GIT revision to PV variable
  lttng-ust: fix recipe name and add GIT revision to PV variable
  mtd-utils: fix recipe name and add GIT revision to PV variable
  neard: fix recipe name
  rt-tests: fix recipe name add GIT revision to PV variable
  update-rc.d: fix recipe name and add GIT revision to PV variable

 .../{connman-gnome_0.7.bb => connman-gnome_git.bb} |    2 ++
 .../neard/{neard_0.10.bb => neard_git.bb}          |    0
 ...e-image_8.0.bb => build-appliance-image_git.bb} |    2 ++
 .../{update-rc.d_0.7.bb => update-rc.d_git.bb}     |    1 +
 ...ative.bb => docbook-sgml-dtd-3.1-native_3.1.bb} |    0
 ...ative.bb => docbook-sgml-dtd-4.1-native_4.1.bb} |    0
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
 ...t-cleanmarker-with-flash_erase--j-command.patch |    0
 .../mtd/{mtd-utils_1.5.0.bb => mtd-utils_git.bb}   |    2 +-
 ....59.bb => chkconfig-alternatives-native_git.bb} |    2 +-
 .../{babeltrace_1.1.1.bb => babeltrace_git.bb}     |    0
 .../lttng/{lttng-ust_2.2.0.bb => lttng-ust_git.bb} |    2 +-
 .../{hwlatdetect_0.85.bb => hwlatdetect_git.bb}    |    1 +
 .../rt-tests/{rt-tests_0.85.bb => rt-tests_git.bb} |    1 +
 14 files changed, 10 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/connman/{connman-gnome_0.7.bb => connman-gnome_git.bb} (97%)
 rename meta/recipes-connectivity/neard/{neard_0.10.bb => neard_git.bb} (100%)
 rename meta/recipes-core/images/{build-appliance-image_8.0.bb => build-appliance-image_git.bb} (99%)
 rename meta/recipes-core/update-rc.d/{update-rc.d_0.7.bb => update-rc.d_git.bb} (97%)
 rename meta/recipes-devtools/docbook-sgml-dtd/{docbook-sgml-dtd-3.1-native.bb => docbook-sgml-dtd-3.1-native_3.1.bb} (100%)
 rename meta/recipes-devtools/docbook-sgml-dtd/{docbook-sgml-dtd-4.1-native.bb => docbook-sgml-dtd-4.1-native_4.1.bb} (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.5.0 => mtd-utils}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.5.0 => mtd-utils}/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils_1.5.0.bb => mtd-utils_git.bb} (98%)
 rename meta/recipes-extended/chkconfig/{chkconfig-alternatives-native_1.3.59.bb => chkconfig-alternatives-native_git.bb} (98%)
 rename meta/recipes-kernel/lttng/{babeltrace_1.1.1.bb => babeltrace_git.bb} (100%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.2.0.bb => lttng-ust_git.bb} (97%)
 rename meta/recipes-rt/rt-tests/{hwlatdetect_0.85.bb => hwlatdetect_git.bb} (97%)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.85.bb => rt-tests_git.bb} (97%)

-- 
1.7.9.5


