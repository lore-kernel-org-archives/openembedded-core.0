Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SXv4m-0007Q1-IJ
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 16:01:08 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2012 06:50:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157231633"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.104.69])
	by fmsmga001.fm.intel.com with ESMTP; 25 May 2012 06:50:54 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2012 16:56:50 +0300
Message-Id: <1337954210-2560-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] man-pages: update to version 3.41
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
X-List-Received-Date: Fri, 25 May 2012 14:01:08 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../{man-pages_3.36.bb => man-pages_3.41.bb}       |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.36.bb => man-pages_3.41.bb} (68%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.36.bb b/meta/recipes-extended/man-pages/man-pages_3.41.bb
similarity index 68%
rename from meta/recipes-extended/man-pages/man-pages_3.36.bb
rename to meta/recipes-extended/man-pages/man-pages_3.41.bb
index 6025a87..cf0523c 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.36.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.41.bb
@@ -3,13 +3,13 @@ DESCRIPTION = "The Linux man-pages project documents the Linux kernel and C libr
 SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPLv2+"
-PR = "r1"
+PR = "r0"
 
 LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
-SRC_URI = "${KERNELORG_MIRROR}/linux/docs/man-pages/Archive/${BPN}-${PV}.tar.gz"
+SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "cfe991b1ce9e0ea5355f29ff9fcac125"
-SRC_URI[sha256sum] = "c0575e31f73cd9dc2761c274217e06e7130fdfee510170957a9d72d012a5437c"
+SRC_URI[md5sum] = "ee8412e72dc79f3c62573add29954b26"
+SRC_URI[sha256sum] = "13f08bf1bb7429cd7208acd41250f36fb6b2e12ab9f86f7e8fa8c67af142d81d"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.7.9.5



