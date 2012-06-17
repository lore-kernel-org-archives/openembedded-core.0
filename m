Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sg8Nw-0008Qm-BM
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 07:50:52 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 22:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181103280"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2012 22:40:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 22:39:46 -0700
Message-Id: <9e0321c230895766dac846ccf1a561d78c382305.1339911478.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 02/23] core-image-gtk-directfb, qt4e-demo-image: Remove module-init-tools from IMAGE_INSTALL list
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
X-List-Received-Date: Sun, 17 Jun 2012 05:50:52 -0000

From: Laurentiu Palcu <laurentiu.palcu@intel.com>

As module-init-tools package does not exist anymore there's no reason to
have it in the IMAGE_INSTALL package list. If RPM package manager is
used, build will fail with:

Unable to find package module-init-tools (module-init-tools)!

[Yocto #2580]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../images/core-image-gtk-directfb.bb              |    3 +--
 meta/recipes-qt/images/qt4e-demo-image.bb          |    3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/images/core-image-gtk-directfb.bb b/meta/recipes-graphics/images/core-image-gtk-directfb.bb
index a5fba17..dcf5165 100644
--- a/meta/recipes-graphics/images/core-image-gtk-directfb.bb
+++ b/meta/recipes-graphics/images/core-image-gtk-directfb.bb
@@ -1,5 +1,5 @@
 LICENSE = "MIT"
-PR="r0"
+PR="r1"
 
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
@@ -17,7 +17,6 @@ inherit core-image
 IMAGE_INSTALL += "\
 	${CORE_IMAGE_BASE_INSTALL} \
 	task-core-basic \
-	module-init-tools \
 	task-core-gtk-directfb-base \
 "
 
diff --git a/meta/recipes-qt/images/qt4e-demo-image.bb b/meta/recipes-qt/images/qt4e-demo-image.bb
index 6c0dc70..794dac5 100644
--- a/meta/recipes-qt/images/qt4e-demo-image.bb
+++ b/meta/recipes-qt/images/qt4e-demo-image.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Version 1.0-r1 of the qtr3-demo-image."
 LICENSE = "MIT"
-PR="r1"
+PR="r2"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -13,7 +13,6 @@ RDEPENDS_${PN} += " \
 
 IMAGE_INSTALL += "\
 	${CORE_IMAGE_BASE_INSTALL} \
-	module-init-tools \
 	task-qt4e-base \
 "
 
-- 
1.7.7.6



