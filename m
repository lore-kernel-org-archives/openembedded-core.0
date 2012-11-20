Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tact5-0005Xz-7i
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 02:44:31 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2012 17:30:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,282,1352102400"; d="scan'208";a="244596732"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.202])
	by orsmga002.jf.intel.com with ESMTP; 19 Nov 2012 17:30:25 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2012 17:30:16 -0800
Message-Id: <b52428caa2f03631c34a15480ec5864473bce581.1353374801.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
Subject: [PATCH 08/13] man-pages: Update to 3.44
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
X-List-Received-Date: Tue, 20 Nov 2012 01:44:32 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{man-pages_3.42.bb => man-pages_3.44.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.42.bb => man-pages_3.44.bb} (82%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.42.bb b/meta/recipes-extended/man-pages/man-pages_3.44.bb
similarity index 82%
rename from meta/recipes-extended/man-pages/man-pages_3.42.bb
rename to meta/recipes-extended/man-pages/man-pages_3.44.bb
index c96067d..ad9df4f 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.42.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.44.bb
@@ -8,8 +8,8 @@ PR = "r0"
 LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "cc8f73ecd8a123ceb7a8670daa91ee6c"
-SRC_URI[sha256sum] = "e366548e907776780d8558d9ab2918d49c28b7f9f926a4bdbe8559cc27165a1d"
+SRC_URI[md5sum] = "9b5b9c38f1db0ab944d5f879ba9d0557"
+SRC_URI[sha256sum] = "4ec49f5f9faac757ffa2dfe6213e3ab8840a69325c377bfc4323b176c35cd0b2"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.7.7.6



