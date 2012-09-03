Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T8ZtI-0001A9-V2
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 18:52:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Sep 2012 09:40:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,360,1344236400"; d="scan'208";a="188269376"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by azsmga001.ch.intel.com with ESMTP; 03 Sep 2012 09:40:29 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 18:45:20 +0300
Message-Id: <cf80aafe71d6fe3fdb4e30104c2b0d61d83b1a13.1346686600.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346686600.git.constantinx.musca@intel.com>
References: <cover.1346686600.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1346686600.git.constantinx.musca@intel.com>
References: <cover.1346686600.git.constantinx.musca@intel.com>
Subject: [PATCH 5/9] man-pages: upgrade to 3.42
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
X-List-Received-Date: Mon, 03 Sep 2012 16:52:49 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../{man-pages_3.41.bb => man-pages_3.42.bb}       |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.41.bb => man-pages_3.42.bb} (81%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.41.bb b/meta/recipes-extended/man-pages/man-pages_3.42.bb
similarity index 81%
rename from meta/recipes-extended/man-pages/man-pages_3.41.bb
rename to meta/recipes-extended/man-pages/man-pages_3.42.bb
index f6a399a..c96067d 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.41.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.42.bb
@@ -3,13 +3,13 @@ DESCRIPTION = "The Linux man-pages project documents the Linux kernel and C libr
 SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPLv2+"
-PR = "r1"
+PR = "r0"
 
 LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "ee8412e72dc79f3c62573add29954b26"
-SRC_URI[sha256sum] = "13f08bf1bb7429cd7208acd41250f36fb6b2e12ab9f86f7e8fa8c67af142d81d"
+SRC_URI[md5sum] = "cc8f73ecd8a123ceb7a8670daa91ee6c"
+SRC_URI[sha256sum] = "e366548e907776780d8558d9ab2918d49c28b7f9f926a4bdbe8559cc27165a1d"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.7.9.5



