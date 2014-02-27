Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CE4BD6EE30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:27:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Feb 2014 14:23:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,557,1389772800"; d="scan'208";a="491174173"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.14.50])
	by orsmga002.jf.intel.com with ESMTP; 27 Feb 2014 14:27:36 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2014 00:27:34 +0200
Message-Id: <1393540055-13033-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 1/2] man-pages: Update to 3.60
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
X-List-Received-Date: Thu, 27 Feb 2014 22:27:38 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../man-pages/{man-pages_3.57.bb => man-pages_3.60.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.57.bb => man-pages_3.60.bb} (82%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.57.bb b/meta/recipes-extended/man-pages/man-pages_3.60.bb
similarity index 82%
rename from meta/recipes-extended/man-pages/man-pages_3.57.bb
rename to meta/recipes-extended/man-pages/man-pages_3.60.bb
index 2277270..a54d9b0 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.57.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.60.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "c56dce7f02bc980a03188276fb5e6f72"
-SRC_URI[sha256sum] = "8183a3d5ffd4870d3af01390380c24f783501c49ff6b28f3d96f592c04f0b06d"
+SRC_URI[md5sum] = "5e64e4361b5ee1991e0ec5d44b6c5d69"
+SRC_URI[sha256sum] = "d62d10f2d75257c883118d388021e06d2193a61ae8951f94492ac53a07d83387"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.8.3.1


