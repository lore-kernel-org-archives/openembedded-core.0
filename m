Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvS-0004HI-Jt
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:16 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:46:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206465"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:46:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:52 -0800
Message-Id: <103fdce5cba444bad8befb9904109d3cd007b26e.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 32/35] classes, recipes: Replace POKY_* with CORE_IMAGE_*
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
X-List-Received-Date: Tue, 07 Feb 2012 22:54:18 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/core-image.bbclass                    |    8 ++++----
 meta/recipes-core/images/core-image-minimal.bb     |    2 +-
 meta/recipes-core/images/self-hosted-image.bb      |    2 +-
 meta/recipes-extended/images/core-image-basic.bb   |    2 +-
 meta/recipes-extended/images/core-image-lsb-dev.bb |    2 +-
 meta/recipes-extended/images/core-image-lsb-sdk.bb |    2 +-
 meta/recipes-extended/images/core-image-lsb.bb     |    2 +-
 meta/recipes-graphics/images/core-image-clutter.bb |    2 +-
 .../images/core-image-gtk-directfb.bb              |    2 +-
 meta/recipes-qt/images/qt4e-demo-image.bb          |    2 +-
 10 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index c08895f..668297b 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -47,18 +47,18 @@ PACKAGE_GROUP_ssh-server-openssh = "task-core-ssh-openssh"
 PACKAGE_GROUP_package-management = "${ROOTFS_PKGMANAGE}"
 PACKAGE_GROUP_qt4-pkgs = "task-core-qt-demos"
 
-POKY_BASE_INSTALL = '\
+CORE_IMAGE_BASE_INSTALL = '\
     task-core-boot \
     task-base-extended \
     \
     ${@base_contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)} \
     \
-    ${POKY_EXTRA_INSTALL} \
+    ${CORE_IMAGE_EXTRA_INSTALL} \
     '
 
-POKY_EXTRA_INSTALL ?= ""
+CORE_IMAGE_EXTRA_INSTALL ?= ""
 
-IMAGE_INSTALL ?= "${POKY_BASE_INSTALL}"
+IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
 
 X11_IMAGE_FEATURES  = "x11-base apps-x11-core package-management"
 ENHANCED_IMAGE_FEATURES = "${X11_IMAGE_FEATURES} apps-x11-games apps-x11-pimlico package-management"
diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index 687f72a..7953b80 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -3,7 +3,7 @@
 #
 DESCRIPTION = "A small image just capable of allowing a device to boot."
 
-IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${POKY_EXTRA_INSTALL}"
+IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL}"
 
 IMAGE_LINGUAS = " "
 
diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
index 5029ac2..a0a7592 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -1,6 +1,6 @@
 IMAGE_INSTALL = "task-core-boot task-core-apps-console task-core-ssh-openssh task-self-hosted"
 
-POKY_EXTRA_INSTALL = "\
+CORE_IMAGE_EXTRA_INSTALL = "\
     task-self-hosted \
     "
 
diff --git a/meta/recipes-extended/images/core-image-basic.bb b/meta/recipes-extended/images/core-image-basic.bb
index 5e58e60..f801346 100644
--- a/meta/recipes-extended/images/core-image-basic.bb
+++ b/meta/recipes-extended/images/core-image-basic.bb
@@ -8,6 +8,6 @@ IMAGE_INSTALL = "\
     task-core-basic \
     "
 
-#    ${POKY_BASE_INSTALL} 
+#    ${CORE_IMAGE_BASE_INSTALL} 
 
 inherit core-image
diff --git a/meta/recipes-extended/images/core-image-lsb-dev.bb b/meta/recipes-extended/images/core-image-lsb-dev.bb
index 2d6f674..e6d7bc9 100644
--- a/meta/recipes-extended/images/core-image-lsb-dev.bb
+++ b/meta/recipes-extended/images/core-image-lsb-dev.bb
@@ -5,7 +5,7 @@ standalone SDK."
 IMAGE_FEATURES += "apps-console-core dev-pkgs ssh-server-openssh"
 
 IMAGE_INSTALL = "\
-    ${POKY_BASE_INSTALL} \
+    ${CORE_IMAGE_BASE_INSTALL} \
     task-core-basic \
     task-core-lsb \
     "
diff --git a/meta/recipes-extended/images/core-image-lsb-sdk.bb b/meta/recipes-extended/images/core-image-lsb-sdk.bb
index 105c8db..0892891 100644
--- a/meta/recipes-extended/images/core-image-lsb-sdk.bb
+++ b/meta/recipes-extended/images/core-image-lsb-sdk.bb
@@ -7,7 +7,7 @@ EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps debug-tweaks"
 
 
 IMAGE_INSTALL = "\
-    ${POKY_BASE_INSTALL} \
+    ${CORE_IMAGE_BASE_INSTALL} \
     task-core-basic \
     task-core-lsb \
     "
diff --git a/meta/recipes-extended/images/core-image-lsb.bb b/meta/recipes-extended/images/core-image-lsb.bb
index f669618..b0a3a4d 100644
--- a/meta/recipes-extended/images/core-image-lsb.bb
+++ b/meta/recipes-extended/images/core-image-lsb.bb
@@ -4,7 +4,7 @@ conform to Linux Standard Base (LSB)."
 IMAGE_FEATURES += "apps-console-core ssh-server-openssh"
 
 IMAGE_INSTALL = "\
-    ${POKY_BASE_INSTALL} \
+    ${CORE_IMAGE_BASE_INSTALL} \
     task-core-basic \
     task-core-lsb \
     "
diff --git a/meta/recipes-graphics/images/core-image-clutter.bb b/meta/recipes-graphics/images/core-image-clutter.bb
index 636238a..6c49a02 100644
--- a/meta/recipes-graphics/images/core-image-clutter.bb
+++ b/meta/recipes-graphics/images/core-image-clutter.bb
@@ -6,7 +6,7 @@ IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES}"
 LICENSE = "MIT"
 
 IMAGE_INSTALL = "\
-    ${POKY_BASE_INSTALL} \
+    ${CORE_IMAGE_BASE_INSTALL} \
     task-core-clutter-core \
     task-core-clutter-tests \
     task-core-clutter-apps"
diff --git a/meta/recipes-graphics/images/core-image-gtk-directfb.bb b/meta/recipes-graphics/images/core-image-gtk-directfb.bb
index 87b3a86..a5fba17 100644
--- a/meta/recipes-graphics/images/core-image-gtk-directfb.bb
+++ b/meta/recipes-graphics/images/core-image-gtk-directfb.bb
@@ -15,7 +15,7 @@ RDEPENDS_${PN} += " \
 inherit core-image
 
 IMAGE_INSTALL += "\
-	${POKY_BASE_INSTALL} \
+	${CORE_IMAGE_BASE_INSTALL} \
 	task-core-basic \
 	module-init-tools \
 	task-core-gtk-directfb-base \
diff --git a/meta/recipes-qt/images/qt4e-demo-image.bb b/meta/recipes-qt/images/qt4e-demo-image.bb
index 6523379..2e50bf6 100644
--- a/meta/recipes-qt/images/qt4e-demo-image.bb
+++ b/meta/recipes-qt/images/qt4e-demo-image.bb
@@ -11,7 +11,7 @@ RDEPENDS_${PN} += " \
 	"
 
 IMAGE_INSTALL += "\
-	${POKY_BASE_INSTALL} \
+	${CORE_IMAGE_BASE_INSTALL} \
 	module-init-tools \
 	task-qt4e-base \
 "
-- 
1.7.6.5



