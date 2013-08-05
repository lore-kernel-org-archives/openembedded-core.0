Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 73BA76B451
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 21:07:42 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2013 14:07:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,821,1367996400"; d="scan'208";a="342090548"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.23])
	by azsmga001.ch.intel.com with ESMTP; 05 Aug 2013 14:07:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2013 14:07:39 -0700
Message-Id: <3cea9e4234c4fcac0b0588be80b2823c7b955c05.1375736784.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1375736784.git.sgw@linux.intel.com>
References: <cover.1375736784.git.sgw@linux.intel.com>
In-Reply-To: <cover.1375736784.git.sgw@linux.intel.com>
References: <cover.1375736784.git.sgw@linux.intel.com>
Subject: [PATCH 3/3] man-pages: upgrade to 3.53
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
X-List-Received-Date: Mon, 05 Aug 2013 21:07:43 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../man-pages/{man-pages_3.52.bb => man-pages_3.53.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.52.bb => man-pages_3.53.bb} (82%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.52.bb b/meta/recipes-extended/man-pages/man-pages_3.53.bb
similarity index 82%
rename from meta/recipes-extended/man-pages/man-pages_3.52.bb
rename to meta/recipes-extended/man-pages/man-pages_3.53.bb
index 1bf5868..965adbf 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.52.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.53.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "1565a7aadd13bd8eea3bde4f1b60e65b"
-SRC_URI[sha256sum] = "6c0bd93dbee7bb6193be2096f5d81f11c976268bb87b0587b739722cecf186d7"
+SRC_URI[md5sum] = "3f827368bc0e2330f61d4b4c1c98a792"
+SRC_URI[sha256sum] = "618715dd7e5536ba819710436a76cd897585447a0cf9bf1af270ca83fbad27d5"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.8.1.4


