Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QUZHx-0008AU-R3
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 09:04:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Jun 2011 00:00:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,340,1304319600"; d="scan'208";a="11662761"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by orsmga001.jf.intel.com with ESMTP; 09 Jun 2011 00:00:40 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2011 15:03:25 +0800
Message-Id: <3c7d4b99a5326a89880078e929dc538c60591f38.1307602786.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1307602786.git.ke.yu@intel.com>
References: <cover.1307602786.git.ke.yu@intel.com>
In-Reply-To: <cover.1307602786.git.ke.yu@intel.com>
References: <cover.1307602786.git.ke.yu@intel.com>
Subject: [PATCH 1/1] sato-sdk: add mesa-demos application
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
X-List-Received-Date: Thu, 09 Jun 2011 07:04:22 -0000

Q/A requires more demo applications to test graphics.
This patch add x11-demos feature category, and add it to sato-sdk.
Currently mesa-demos is the only recips in x11-demos, and this can
be extended in the future when more demo apps are added

Fix [YOCTO #1112]

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/classes/core-image.bbclass                 |    1 +
 meta/recipes-sato/images/core-image-sato-sdk.bb |    2 +-
 meta/recipes-sato/tasks/task-core.bb            |    6 +++++-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index c8c6a57..d00c20a 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -93,6 +93,7 @@ POKY_BASE_INSTALL = '\
     \
     ${@base_contains("IMAGE_FEATURES", "package-management", "${ROOTFS_PKGMANAGE}", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)} \
     ${@base_contains("IMAGE_FEATURES", "qt4-pkgs", "task-core-qt-demos", "",d)} \
+    ${@base_contains("IMAGE_FEATURES", "x11-demos", "task-core-x11-demos", "",d)} \
     ${POKY_EXTRA_INSTALL} \
     '
 
diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
index ee9d799..3240a7d 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2007 OpenedHand Ltd.
 #
 
-IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} tools-debug tools-profile tools-sdk dev-pkgs qt4-pkgs"
+IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} tools-debug tools-profile tools-sdk dev-pkgs qt4-pkgs x11-demos"
 
 LICENSE = "MIT"
 
diff --git a/meta/recipes-sato/tasks/task-core.bb b/meta/recipes-sato/tasks/task-core.bb
index a595ad7..22e5754 100644
--- a/meta/recipes-sato/tasks/task-core.bb
+++ b/meta/recipes-sato/tasks/task-core.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Tasks for OpenedHand Poky"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r34"
+PR = "r35"
 
 PACKAGES = "\
     task-core-apps-console \
@@ -21,6 +21,7 @@ PACKAGES = "\
     task-core-x11-base \
     task-core-x11-base-dbg \
     task-core-x11-base-dev \
+    task-core-x11-demos \
     "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -71,3 +72,6 @@ RDEPENDS_task-core-apps-x11-core = "\
 
 RDEPENDS_task-core-apps-x11-games = "\
     oh-puzzles"
+
+RDEPENDS_task-core-x11-demos = "\
+    mesa-demos"
-- 
1.7.0.4



