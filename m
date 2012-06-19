Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11T-00027q-6M
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:19 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520404"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 09:00:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:53 -0700
Message-Id: <ed4ba40c1365820d4410f14ad951fcfbf547acce.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 35/39] man-pages: Clean up FILES_* after PACKAGES reoder
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:21 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/man-pages/man-pages_3.41.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.41.bb b/meta/recipes-extended/man-pages/man-pages_3.41.bb
index cf0523c..f6a399a 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.41.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.41.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The Linux man-pages project documents the Linux kernel and C libr
 SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPLv2+"
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
@@ -25,4 +25,6 @@ do_install() {
         oe_runmake install DESTDIR=${D}
 }
 
-FILES_${PN} += "${datadir}/man/"
+# Only deliveres man-pages so FILES_${PN} gets everything
+FILES_${PN}-doc = ""
+FILES_${PN} = "${mandir}/*"
-- 
1.7.7.6



