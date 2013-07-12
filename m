Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 99A7160896
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 15:04:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2013 08:01:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,653,1367996400"; d="scan'208";a="344585561"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2013 08:03:19 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2013 18:10:34 +0300
Message-Id: <a3cf8140f2ad28328df73a9d7d9cc6a9bcf04da3.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <03982e313990aad86cd24f5cbcb4994448ab58a0.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
References: <03982e313990aad86cd24f5cbcb4994448ab58a0.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH 6/6] mtd-utils: add PV variable into recipe
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
X-List-Received-Date: Fri, 12 Jul 2013 15:04:18 -0000

Git packages should include git token inside the PV variable.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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


