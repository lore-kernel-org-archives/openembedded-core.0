Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tzl4T-0003nW-AC
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:32:25 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Jan 2013 01:16:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,550,1355126400"; d="scan'208";a="195769983"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.19])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jan 2013 01:16:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 01:15:52 -0800
Message-Id: <4fe729269bc24c091e2381759b7ca5e40ac0b2aa.1359364462.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
Subject: [PATCH 05/13] man-pages: Update to 3.45
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 09:32:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../man-pages/{man-pages_3.44.bb => man-pages_3.45.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.44.bb => man-pages_3.45.bb} (82%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.44.bb b/meta/recipes-extended/man-pages/man-pages_3.45.bb
similarity index 82%
rename from meta/recipes-extended/man-pages/man-pages_3.44.bb
rename to meta/recipes-extended/man-pages/man-pages_3.45.bb
index ad9df4f..c801195 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.44.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.45.bb
@@ -8,8 +8,8 @@ PR = "r0"
 LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "9b5b9c38f1db0ab944d5f879ba9d0557"
-SRC_URI[sha256sum] = "4ec49f5f9faac757ffa2dfe6213e3ab8840a69325c377bfc4323b176c35cd0b2"
+SRC_URI[md5sum] = "63cb9e58cd2865dd4523999604d1d248"
+SRC_URI[sha256sum] = "2cdcca3c1b0f3e223f66fa244954b871bc6bccbb1595d5d819e453ab05f87c36"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.8.0.2



