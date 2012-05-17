Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SUvv5-0006EF-Di
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 10:18:47 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 May 2012 01:07:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="145044830"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.104.69])
	by orsmga002.jf.intel.com with ESMTP; 17 May 2012 01:07:38 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2012 11:13:18 +0300
Message-Id: <1337242398-8980-1-git-send-email-radu.moisan@intel.com>
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
X-List-Received-Date: Thu, 17 May 2012 08:18:47 -0000

---
 build/conf/sanity_info                             |    3 +++
 build/pseudodone                                   |    1 +
 .../{man-pages_3.36.bb => man-pages_3.41.bb}       |    8 ++++----
 3 files changed, 8 insertions(+), 4 deletions(-)
 create mode 100644 build/bitbake.lock
 create mode 100644 build/conf/sanity_info
 create mode 100644 build/pseudodone
 rename meta/recipes-extended/man-pages/{man-pages_3.36.bb => man-pages_3.41.bb} (68%)

diff --git a/build/bitbake.lock b/build/bitbake.lock
new file mode 100644
index 0000000..e69de29
diff --git a/build/conf/sanity_info b/build/conf/sanity_info
new file mode 100644
index 0000000..3744c0d
--- /dev/null
+++ b/build/conf/sanity_info
@@ -0,0 +1,3 @@
+SANITY_VERSION 1
+TMPDIR /home/radu/Documents/Development/yocto/poky/build/tmp
+SSTATE_DIR /home/radu/Documents/Development/yocto/poky/build/sstate-cache
diff --git a/build/pseudodone b/build/pseudodone
new file mode 100644
index 0000000..a9331dd
--- /dev/null
+++ b/build/pseudodone
@@ -0,0 +1 @@
+/home/radu/Documents/Development/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin
diff --git a/meta/recipes-extended/man-pages/man-pages_3.36.bb b/meta/recipes-extended/man-pages/man-pages_3.41.bb
similarity index 68%
rename from meta/recipes-extended/man-pages/man-pages_3.36.bb
rename to meta/recipes-extended/man-pages/man-pages_3.41.bb
index 6025a87..1e1d359 100644
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
+SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${PN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "cfe991b1ce9e0ea5355f29ff9fcac125"
-SRC_URI[sha256sum] = "c0575e31f73cd9dc2761c274217e06e7130fdfee510170957a9d72d012a5437c"
+SRC_URI[md5sum] = "ee8412e72dc79f3c62573add29954b26"
+SRC_URI[sha256sum] = "13f08bf1bb7429cd7208acd41250f36fb6b2e12ab9f86f7e8fa8c67af142d81d"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.7.9.5



