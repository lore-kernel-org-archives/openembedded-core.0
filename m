Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B5E6B6B2A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 14:09:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Jul 2013 07:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,694,1367996400"; d="scan'208";a="372555678"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by orsmga002.jf.intel.com with ESMTP; 18 Jul 2013 07:09:16 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2013 17:16:35 +0300
Message-Id: <cd7fb2cc9abd88d69a7ebc15156c94eaf22d5493.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a6f5cb59348a434d4b03599b69f101cd0d5177fe.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
References: <a6f5cb59348a434d4b03599b69f101cd0d5177fe.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH 06/11] mtd-utils: add PV variable into recipe
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
X-List-Received-Date: Thu, 18 Jul 2013 14:09:16 -0000

Git packages should include git token inside the PV variable.
Remove version from inner patch folder name.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
 ...t-cleanmarker-with-flash_erase--j-command.patch |    0
 meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb       |    2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.5.0 => mtd-utils}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.5.0 => mtd-utils}/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch (100%)

diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.5.0/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch
similarity index 100%
rename from meta/recipes-devtools/mtd/mtd-utils-1.5.0/add-exclusion-to-mkfs-jffs2-git-2.patch
rename to meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch
diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.5.0/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
similarity index 100%
rename from meta/recipes-devtools/mtd/mtd-utils-1.5.0/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
rename to meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
index 5797204..5e65a69 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git \
         file://mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch "
 
 S = "${WORKDIR}/git/"
-
+PV = "1.5.0+git${SRCPV}"
 PR = "r3"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
-- 
1.7.9.5


