Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7B00E6B205
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 15:02:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jul 2013 08:02:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,653,1367996400"; d="scan'208";a="369298273"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jul 2013 08:02:54 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2013 18:10:26 +0300
Message-Id: <cover.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/6] Fix typos
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
X-List-Received-Date: Fri, 12 Jul 2013 15:02:57 -0000

Add/Update PV variable into git recipes

The following changes since commit a63229917a5708de2d161aba0d67168ce0da6365:

  meta-yocto-bsp: update reference board SRCREVs (2013-07-10 09:45:51 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib emac/add_pv_to_recipes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=emac/add_pv_to_recipes

Emilia Ciobanu (6):
  rt-tests: add PV variable into recipe
  kmod: add PV variable into recipe
  hwlatdetect: add PV variable into recipe
  lttng-ust: add PV variable into recipe
  connman-gnome: add PV variable into recipe
  mtd-utils: add PV variable into recipe

 .../connman/connman-gnome_0.7.bb                   |    2 ++
 meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb       |    2 +-
 meta/recipes-kernel/kmod/kmod_git.bb               |    1 +
 meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb       |    2 +-
 meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb       |    1 +
 meta/recipes-rt/rt-tests/rt-tests_0.85.bb          |    1 +
 6 files changed, 7 insertions(+), 2 deletions(-)

-- 
1.7.9.5


