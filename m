Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SUv0J-00083P-7c
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 09:20:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 May 2012 00:08:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="145025686"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.104.69])
	by orsmga002.jf.intel.com with ESMTP; 17 May 2012 00:08:58 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2012 10:14:43 +0300
Message-Id: <1337238883-7920-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] man-pages: Update to 3.41
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 May 2012 07:20:08 -0000

---
 .../{man-pages_3.36.bb => man-pages_3.41.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.36.bb => man-pages_3.41.bb} (80%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.36.bb b/meta/recipes-extended/man-pages/man-pages_3.41.bb
similarity index 80%
rename from meta/recipes-extended/man-pages/man-pages_3.36.bb
rename to meta/recipes-extended/man-pages/man-pages_3.41.bb
index 6025a87..cc1c224 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.36.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.41.bb
@@ -8,8 +8,8 @@ PR = "r1"
 LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/man-pages/Archive/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "cfe991b1ce9e0ea5355f29ff9fcac125"
-SRC_URI[sha256sum] = "c0575e31f73cd9dc2761c274217e06e7130fdfee510170957a9d72d012a5437c"
+SRC_URI[md5sum] = "ee8412e72dc79f3c62573add29954b26"
+SRC_URI[sha256sum] = "13f08bf1bb7429cd7208acd41250f36fb6b2e12ab9f86f7e8fa8c67af142d81d"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.7.9.5



