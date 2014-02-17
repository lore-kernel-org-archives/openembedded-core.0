Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CDE8E6F06C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 08:23:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2014 00:23:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,859,1384329600"; d="scan'208";a="476400708"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.197])
	by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2014 00:23:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 00:22:59 -0800
Message-Id: <5ae1dadb208d93e40330ac9e51dfc302e7e5e0f4.1392625337.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1392625337.git.sgw@linux.intel.com>
References: <cover.1392625337.git.sgw@linux.intel.com>
In-Reply-To: <cover.1392625337.git.sgw@linux.intel.com>
References: <cover.1392625337.git.sgw@linux.intel.com>
Subject: [PATCH 4/7] man-pages: Update to 3.56
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
X-List-Received-Date: Mon, 17 Feb 2014 08:23:03 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../man-pages/{man-pages_3.56.bb => man-pages_3.57.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.56.bb => man-pages_3.57.bb} (82%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.56.bb b/meta/recipes-extended/man-pages/man-pages_3.57.bb
similarity index 82%
rename from meta/recipes-extended/man-pages/man-pages_3.56.bb
rename to meta/recipes-extended/man-pages/man-pages_3.57.bb
index c8ecbc2..2277270 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.56.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.57.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "60eb30044fda5b7a8eec7791cf51a066"
-SRC_URI[sha256sum] = "7d567ba8d1a953b94379bdf6fce261cb4b01343ba083ffdc4d3e2b8f9d12e66e"
+SRC_URI[md5sum] = "c56dce7f02bc980a03188276fb5e6f72"
+SRC_URI[sha256sum] = "8183a3d5ffd4870d3af01390380c24f783501c49ff6b28f3d96f592c04f0b06d"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.8.3.1


