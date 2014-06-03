Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 453BB6FA99
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 03:26:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2014 20:26:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,962,1392192000"; d="scan'208";a="521786735"
Received: from kmaligas-mobl1.gar.corp.intel.com (HELO swold-linux.bigsur.com)
	([10.255.12.167])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2014 20:26:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jun 2014 20:26:09 -0700
Message-Id: <71fd18d530e8470d0a3bc4289469976ee5f8989f.1401765630.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1401765630.git.sgw@linux.intel.com>
References: <cover.1401765630.git.sgw@linux.intel.com>
In-Reply-To: <cover.1401765630.git.sgw@linux.intel.com>
References: <cover.1401765630.git.sgw@linux.intel.com>
Subject: [PATCH 4/7] man-pages: Update to 3.68
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
X-List-Received-Date: Tue, 03 Jun 2014 03:26:35 -0000

README updated with general text regarding installation location

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../man-pages/{man-pages_3.65.bb => man-pages_3.68.bb}              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.65.bb => man-pages_3.68.bb} (72%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.65.bb b/meta/recipes-extended/man-pages/man-pages_3.68.bb
similarity index 72%
rename from meta/recipes-extended/man-pages/man-pages_3.65.bb
rename to meta/recipes-extended/man-pages/man-pages_3.68.bb
index 435b557..fb66984 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.65.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.68.bb
@@ -4,11 +4,11 @@ SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPLv2+"
 
-LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
+LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "8d273473a803cbe9f41b29b2294e5fda"
-SRC_URI[sha256sum] = "3e936fb931239882ab2816a1497218b48ddc4834793a9779dfe91328c7587eb0"
+SRC_URI[md5sum] = "b23aa8262f9c999e66a413fb44a0a055"
+SRC_URI[sha256sum] = "ad26df6a8878cb87309e8cb1e5867def3e3bfa731e3cf02af076db7d94f58f1f"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.8.3.1


