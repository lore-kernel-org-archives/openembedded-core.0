Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7jmj-0004Xu-LZ
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 09:42:18 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Mar 2012 01:33:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138551620"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by fmsmga002.fm.intel.com with ESMTP; 14 Mar 2012 01:33:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 01:33:21 -0700
Message-Id: <e26bacddf814bb85108dc2a8518c87e1727a71b2.1331713807.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
Subject: [PATCH 10/14] man-pages: Update to 3.36
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
X-List-Received-Date: Wed, 14 Mar 2012 08:42:18 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{man-pages_3.32.bb => man-pages_3.36.bb}       |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.32.bb => man-pages_3.36.bb} (80%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.32.bb b/meta/recipes-extended/man-pages/man-pages_3.36.bb
similarity index 80%
rename from meta/recipes-extended/man-pages/man-pages_3.32.bb
rename to meta/recipes-extended/man-pages/man-pages_3.36.bb
index 26e64e4..4e888dc 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.32.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.36.bb
@@ -2,14 +2,14 @@ SUMMARY = "Linux man-pages"
 DESCRIPTION = "The Linux man-pages project documents the Linux kernel and C library interfaces that are employed by user programs"
 SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
-LICENSE = "GPL"
-PR = "r1"
+LICENSE = "GPLv2+"
+PR = "r0"
 
 LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/man-pages/Archive/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "cc6c2d4d4eb364fd8da718c412db09d4"
-SRC_URI[sha256sum] = "61ef2fc36421e72eb92d1f533576a439a2fcdae20269393f740dd98abd8be519"
+SRC_URI[md5sum] = "cfe991b1ce9e0ea5355f29ff9fcac125"
+SRC_URI[sha256sum] = "c0575e31f73cd9dc2761c274217e06e7130fdfee510170957a9d72d012a5437c"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.7.7.6



