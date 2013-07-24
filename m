Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E58326B35B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 14:08:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Jul 2013 07:05:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,735,1367996400"; d="scan'208";a="350794803"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2013 07:08:11 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 17:15:32 +0300
Message-Id: <0fe628aaee7906b4f36307595976b8c699c730f2.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <99af89e892d80f5ebdbca319decc59aa5e611dfc.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
References: <99af89e892d80f5ebdbca319decc59aa5e611dfc.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH v3 09/12] mtd-utils: fix recipe name and add GIT revision to PV variable
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
X-List-Received-Date: Wed, 24 Jul 2013 14:08:12 -0000

Git packages should have the following format for the PV variable:
	version_tag+git[r|\-|]?AUTOINC+git_revision

Git recipes should also contain _git token in their name instead of
their version.

The change also needed removal of version from inner patch folder name.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
 ...t-cleanmarker-with-flash_erase--j-command.patch |    0
 .../mtd/{mtd-utils_1.5.0.bb => mtd-utils_git.bb}   |    2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.5.0 => mtd-utils}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.5.0 => mtd-utils}/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils_1.5.0.bb => mtd-utils_git.bb} (98%)

diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.5.0/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch
similarity index 100%
rename from meta/recipes-devtools/mtd/mtd-utils-1.5.0/add-exclusion-to-mkfs-jffs2-git-2.patch
rename to meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch
diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.5.0/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
similarity index 100%
rename from meta/recipes-devtools/mtd/mtd-utils-1.5.0/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
rename to meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
similarity index 98%
rename from meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
rename to meta/recipes-devtools/mtd/mtd-utils_git.bb
index 5797204..5e65a69 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git \
         file://mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch "
 
 S = "${WORKDIR}/git/"
-
+PV = "1.5.0+git${SRCPV}"
 PR = "r3"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
-- 
1.7.9.5


