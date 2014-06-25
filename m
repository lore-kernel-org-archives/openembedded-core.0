Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BBC5C65D6D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 00:13:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jun 2014 17:13:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,541,1400050800"; d="scan'208";a="560482016"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jun 2014 17:13:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jun 2014 17:13:17 -0700
Message-Id: <63f615eaff5a89e017bf4d0b15e311219d735c3d.1403654908.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1403654908.git.sgw@linux.intel.com>
References: <cover.1403654908.git.sgw@linux.intel.com>
In-Reply-To: <cover.1403654908.git.sgw@linux.intel.com>
References: <cover.1403654908.git.sgw@linux.intel.com>
Subject: [PATCH 07/10] man-pages: Update to 3.69
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
X-List-Received-Date: Wed, 25 Jun 2014 00:13:41 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../man-pages/{man-pages_3.68.bb => man-pages_3.69.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.68.bb => man-pages_3.69.bb} (82%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.68.bb b/meta/recipes-extended/man-pages/man-pages_3.69.bb
similarity index 82%
rename from meta/recipes-extended/man-pages/man-pages_3.68.bb
rename to meta/recipes-extended/man-pages/man-pages_3.69.bb
index fb66984..6ddae51 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.68.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.69.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "b23aa8262f9c999e66a413fb44a0a055"
-SRC_URI[sha256sum] = "ad26df6a8878cb87309e8cb1e5867def3e3bfa731e3cf02af076db7d94f58f1f"
+SRC_URI[md5sum] = "6ba05c9633edba4da64160b95ab7299d"
+SRC_URI[sha256sum] = "933ecb86ac9cce6736540d2556c49f362e34c8417fb708a3b1fe3eb3072b2217"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.8.3.1


