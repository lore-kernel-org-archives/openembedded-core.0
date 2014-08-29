Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BDCCE706AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 15:26:50 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by orsmga102.jf.intel.com with ESMTP; 29 Aug 2014 08:20:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,424,1406617200"; d="scan'208";a="473835161"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.12.242])
	by azsmga001.ch.intel.com with ESMTP; 29 Aug 2014 08:26:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 08:26:28 -0700
Message-Id: <0cb4456453b6799a0492e41e0348a6af830f8308.1409325858.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1409325858.git.sgw@linux.intel.com>
References: <cover.1409325858.git.sgw@linux.intel.com>
In-Reply-To: <cover.1409325858.git.sgw@linux.intel.com>
References: <cover.1409325858.git.sgw@linux.intel.com>
Subject: [PATCH 2/5] man-pages: Upgrade to 3.71
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
X-List-Received-Date: Fri, 29 Aug 2014 15:26:56 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../man-pages/{man-pages_3.70.bb => man-pages_3.71.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.70.bb => man-pages_3.71.bb} (82%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.70.bb b/meta/recipes-extended/man-pages/man-pages_3.71.bb
similarity index 82%
rename from meta/recipes-extended/man-pages/man-pages_3.70.bb
rename to meta/recipes-extended/man-pages/man-pages_3.71.bb
index e1cda88..759bad5 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.70.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.71.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "992c773a0d9e3c4a7ba5055eadb58461"
-SRC_URI[sha256sum] = "70298623da10a70e2d124b4059129b8d79e50d4532fa1f8c1d8c67de48f7f965"
+SRC_URI[md5sum] = "a853ef29d835e8522c04f832919139f1"
+SRC_URI[sha256sum] = "307c9ac65b98a3a3d377050f0dc62d40b7a5995e6e6e6049d63fd9cc4fc27059"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.8.3.1


