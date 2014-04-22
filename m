Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 00FD765D49
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 23:49:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2014 16:49:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,907,1389772800"; d="scan'208";a="497712233"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2014 16:49:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Apr 2014 16:49:26 -0700
Message-Id: <7e50e44ee102794a75c7f56129b27e7792703aa1.1398210385.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
In-Reply-To: <cover.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
Subject: [PATCH 04/10] man-pages: update to 3.64
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
X-List-Received-Date: Tue, 22 Apr 2014 23:49:39 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../man-pages/{man-pages_3.60.bb => man-pages_3.64.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.60.bb => man-pages_3.64.bb} (82%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.60.bb b/meta/recipes-extended/man-pages/man-pages_3.64.bb
similarity index 82%
rename from meta/recipes-extended/man-pages/man-pages_3.60.bb
rename to meta/recipes-extended/man-pages/man-pages_3.64.bb
index a54d9b0..34ec18b 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.60.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.64.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "5e64e4361b5ee1991e0ec5d44b6c5d69"
-SRC_URI[sha256sum] = "d62d10f2d75257c883118d388021e06d2193a61ae8951f94492ac53a07d83387"
+SRC_URI[md5sum] = "6e015cd7f5afb5c9e5ec978fadb77fa8"
+SRC_URI[sha256sum] = "997fadacbe76fadd23a0a3a20aa6acd9e4bbbd18f0cd5a0a1437f4bb5d5f9209"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.8.3.1


