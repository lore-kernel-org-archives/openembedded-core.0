Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 323AD6B09C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 00:32:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jul 2013 17:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1023,1363158000"; d="scan'208";a="367139945"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.85])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jul 2013 17:32:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2013 17:32:04 -0700
Message-Id: <fa6b09a3403f83b03d8aa71b290199bf93944e41.1373329833.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1373329833.git.sgw@linux.intel.com>
References: <cover.1373329833.git.sgw@linux.intel.com>
In-Reply-To: <cover.1373329833.git.sgw@linux.intel.com>
References: <cover.1373329833.git.sgw@linux.intel.com>
Subject: [PATCH 1/4] man-pages: Update to 3.52
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
X-List-Received-Date: Tue, 09 Jul 2013 00:32:09 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../man-pages/{man-pages_3.50.bb => man-pages_3.52.bb}               | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.50.bb => man-pages_3.52.bb} (81%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.50.bb b/meta/recipes-extended/man-pages/man-pages_3.52.bb
similarity index 81%
rename from meta/recipes-extended/man-pages/man-pages_3.50.bb
rename to meta/recipes-extended/man-pages/man-pages_3.52.bb
index 8e48edb..1bf5868 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.50.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.52.bb
@@ -3,13 +3,12 @@ DESCRIPTION = "The Linux man-pages project documents the Linux kernel and C libr
 SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPLv2+"
-PR = "r0"
 
 LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "076a0c2df9b0e14c5485b2800383007c"
-SRC_URI[sha256sum] = "024a98cac9972a2328b8d7840bcfee43d7e5a752fed50d55e64d4029165fee83"
+SRC_URI[md5sum] = "1565a7aadd13bd8eea3bde4f1b60e65b"
+SRC_URI[sha256sum] = "6c0bd93dbee7bb6193be2096f5d81f11c976268bb87b0587b739722cecf186d7"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.8.1.4


