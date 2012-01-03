Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ri8jR-00081e-81
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 19:05:05 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Jan 2012 09:57:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91940912"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 03 Jan 2012 09:57:42 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2012 09:57:40 -0800
Message-Id: <5658f5ece1372d1d002df9aa106d1b9f441b2ca8.1325613367.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325613367.git.sgw@linux.intel.com>
References: <cover.1325613367.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325613367.git.sgw@linux.intel.com>
References: <cover.1325613367.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] Rename references from POKY_*_INSTALL to COREIMAGE_*_INSTALL
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
X-List-Received-Date: Tue, 03 Jan 2012 18:05:05 -0000

The names POKY_BASE_INSTALL and POKY_EXTRA_INSTALL have been renamed to
COREIMAGE_BASE_INSTALL and COREIMAGE_EXTRA_INSTALL

Based on Mark Hatle's original work.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/core-image.bbclass                    |    8 ++++----
 meta/recipes-core/images/core-image-minimal.bb     |    2 +-
 meta/recipes-core/images/self-hosted-image.bb      |    2 +-
 meta/recipes-extended/images/core-image-basic.bb   |    2 +-
 meta/recipes-extended/images/core-image-lsb-dev.bb |    2 +-
 meta/recipes-extended/images/core-image-lsb-sdk.bb |    2 +-
 meta/recipes-extended/images/core-image-lsb.bb     |    2 +-
 meta/recipes-graphics/images/core-image-clutter.bb |    2 +-
 meta/recipes-qt/images/qt4e-demo-image.bb          |    2 +-
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index c08895f..f2478f6 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -47,18 +47,18 @@ PACKAGE_GROUP_ssh-server-openssh = "task-core-ssh-openssh"
 PACKAGE_GROUP_package-management = "${ROOTFS_PKGMANAGE}"
 PACKAGE_GROUP_qt4-pkgs = "task-core-qt-demos"
 
-POKY_BASE_INSTALL = '\
+COREIMAGE_BASE_INSTALL = '\
     task-core-boot \
     task-base-extended \
     \
     ${@base_contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)} \
     \
-    ${POKY_EXTRA_INSTALL} \
+    ${COREIMAGE_EXTRA_INSTALL} \
     '
 
-POKY_EXTRA_INSTALL ?= ""
+COREIMAGE_EXTRA_INSTALL ?= ""
 
-IMAGE_INSTALL ?= "${POKY_BASE_INSTALL}"
+IMAGE_INSTALL ?= "${COREIMAGE_BASE_INSTALL}"
 
 X11_IMAGE_FEATURES  = "x11-base apps-x11-core package-management"
 ENHANCED_IMAGE_FEATURES = "${X11_IMAGE_FEATURES} apps-x11-games apps-x11-pimlico package-management"
diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index 56fc20c..cdfbff1 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -1,7 +1,7 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
-IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${POKY_EXTRA_INSTALL}"
+IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${COREIMAGE_EXTRA_INSTALL}"
 
 IMAGE_LINGUAS = " "
 
diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
index 111c057..c453ce5 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -1,6 +1,6 @@
 IMAGE_INSTALL = "task-core-boot task-core-apps-console task-core-ssh-openssh task-self-hosted"
 
-POKY_EXTRA_INSTALL = "\
+COREIMAGE_EXTRA_INSTALL = "\
     task-self-hosted \
     "
 
diff --git a/meta/recipes-extended/images/core-image-basic.bb b/meta/recipes-extended/images/core-image-basic.bb
index ba71cd0..ef27e06 100644
--- a/meta/recipes-extended/images/core-image-basic.bb
+++ b/meta/recipes-extended/images/core-image-basic.bb
@@ -5,6 +5,6 @@ IMAGE_INSTALL = "\
     task-core-basic \
     "
 
-#    ${POKY_BASE_INSTALL} 
+#    ${COREIMAGE_BASE_INSTALL} 
 
 inherit core-image
diff --git a/meta/recipes-extended/images/core-image-lsb-dev.bb b/meta/recipes-extended/images/core-image-lsb-dev.bb
index 9ef85ff..40787bb 100644
--- a/meta/recipes-extended/images/core-image-lsb-dev.bb
+++ b/meta/recipes-extended/images/core-image-lsb-dev.bb
@@ -1,7 +1,7 @@
 IMAGE_FEATURES += "apps-console-core dev-pkgs ssh-server-openssh"
 
 IMAGE_INSTALL = "\
-    ${POKY_BASE_INSTALL} \
+    ${COREIMAGE_BASE_INSTALL} \
     task-core-basic \
     task-core-lsb \
     "
diff --git a/meta/recipes-extended/images/core-image-lsb-sdk.bb b/meta/recipes-extended/images/core-image-lsb-sdk.bb
index 5e0e7ae..6a17de5 100644
--- a/meta/recipes-extended/images/core-image-lsb-sdk.bb
+++ b/meta/recipes-extended/images/core-image-lsb-sdk.bb
@@ -3,7 +3,7 @@ EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps debug-tweaks"
 
 
 IMAGE_INSTALL = "\
-    ${POKY_BASE_INSTALL} \
+    ${COREIMAGE_BASE_INSTALL} \
     task-core-basic \
     task-core-lsb \
     "
diff --git a/meta/recipes-extended/images/core-image-lsb.bb b/meta/recipes-extended/images/core-image-lsb.bb
index 22eb7f4..d80954b 100644
--- a/meta/recipes-extended/images/core-image-lsb.bb
+++ b/meta/recipes-extended/images/core-image-lsb.bb
@@ -1,7 +1,7 @@
 IMAGE_FEATURES += "apps-console-core ssh-server-openssh"
 
 IMAGE_INSTALL = "\
-    ${POKY_BASE_INSTALL} \
+    ${COREIMAGE_BASE_INSTALL} \
     task-core-basic \
     task-core-lsb \
     "
diff --git a/meta/recipes-graphics/images/core-image-clutter.bb b/meta/recipes-graphics/images/core-image-clutter.bb
index 7d50405..194748a 100644
--- a/meta/recipes-graphics/images/core-image-clutter.bb
+++ b/meta/recipes-graphics/images/core-image-clutter.bb
@@ -3,7 +3,7 @@ IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES}"
 LICENSE = "MIT"
 
 IMAGE_INSTALL = "\
-    ${POKY_BASE_INSTALL} \
+    ${COREIMAGE_BASE_INSTALL} \
     task-core-clutter-core \
     task-core-clutter-tests \
     task-core-clutter-apps"
diff --git a/meta/recipes-qt/images/qt4e-demo-image.bb b/meta/recipes-qt/images/qt4e-demo-image.bb
index 6523379..01c7921 100644
--- a/meta/recipes-qt/images/qt4e-demo-image.bb
+++ b/meta/recipes-qt/images/qt4e-demo-image.bb
@@ -11,7 +11,7 @@ RDEPENDS_${PN} += " \
 	"
 
 IMAGE_INSTALL += "\
-	${POKY_BASE_INSTALL} \
+	${COREIMAGE_BASE_INSTALL} \
 	module-init-tools \
 	task-qt4e-base \
 "
-- 
1.7.6.4



