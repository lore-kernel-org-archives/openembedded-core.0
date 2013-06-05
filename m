Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 16BE56065C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 12:06:33 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Jun 2013 05:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,806,1363158000"; d="scan'208";a="312601169"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2013 05:06:32 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2013 15:07:34 +0300
Message-Id: <1370434054-5470-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] connman: upgrade to 1.15
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
X-List-Received-Date: Wed, 05 Jun 2013 12:06:33 -0000

Bugfix release.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../connman/{connman_1.14.bb => connman_1.15.bb}                   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.14.bb => connman_1.15.bb} (73%)

diff --git a/meta/recipes-connectivity/connman/connman_1.14.bb b/meta/recipes-connectivity/connman/connman_1.15.bb
similarity index 73%
rename from meta/recipes-connectivity/connman/connman_1.14.bb
rename to meta/recipes-connectivity/connman/connman_1.15.bb
index f9a5ecc..0ec29c9 100644
--- a/meta/recipes-connectivity/connman/connman_1.14.bb
+++ b/meta/recipes-connectivity/connman/connman_1.15.bb
@@ -7,8 +7,8 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://inet-fix-ip-cleanup-functions.patch \
             "
 
-SRC_URI[md5sum] = "6c9ecaf9c044f8c66a7b465f6716b569"
-SRC_URI[sha256sum] = "d0c37452a4e8eec27e433ff901a6c447963b9d8a8ceddd4a7311cc322e2dbf8c"
+SRC_URI[md5sum] = "e785c0c4564bfffb5215272f1be6f17c"
+SRC_URI[sha256sum] = "8229cc5e3e75197453ba2a644c03860a7cf9f4f27fcbf111bb589530d4efb58f"
 
 PR = "${INC_PR}.0"
 
-- 
1.7.10.4


