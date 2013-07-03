Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C4A7A612D1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 17:04:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 03 Jul 2013 10:04:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,989,1363158000"; d="scan'208";a="360047347"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.227])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2013 10:05:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2013 18:04:37 +0100
Message-Id: <1372871077-6363-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] qt4: disable qmeegographicssystemhelper
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Jul 2013 17:04:53 -0000

We don't want this enabled just because we have EGL and OpenGL ES 2.0
enabled.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4-4.8.4.inc                  |  1 +
 ...ls.pro-disable-qmeegographicssystemhelper.patch | 28 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.4/0027-tools.pro-disable-qmeegographicssystemhelper.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.4.inc b/meta/recipes-qt/qt4/qt4-4.8.4.inc
index e87dacc..0a8e00b 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.4.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.4.inc
@@ -26,6 +26,7 @@ SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-sr
            file://0024-Change-all-shmget-calls-to-user-only-memory.patch \
            file://0025-Remove-unnecessary-typedef-found-by-gcc4-8.patch \
            file://0026-Don-t-overwrite-QMAKE_QT_CONFIG-with-empty-value.patch \
+           file://0027-tools.pro-disable-qmeegographicssystemhelper.patch \
            file://g++.conf \
            file://linux.conf \
            "
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0027-tools.pro-disable-qmeegographicssystemhelper.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0027-tools.pro-disable-qmeegographicssystemhelper.patch
new file mode 100644
index 0000000..6e30aee
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0027-tools.pro-disable-qmeegographicssystemhelper.patch
@@ -0,0 +1,28 @@
+From 0460e2a5f13aaf0081c3c9fec89280046842ddbb Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Wed, 3 Jul 2013 17:48:30 +0100
+Subject: [PATCH] tools.pro: disable qmeegographicssystemhelper
+
+We don't want this enabled just because we have EGL and OpenGL ES 2.0
+enabled.
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ tools/tools.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/tools.pro b/tools/tools.pro
+index 0e27053..2d3f36d 100644
+--- a/tools/tools.pro
++++ b/tools/tools.pro
+@@ -49,4 +49,4 @@ QTDIR_build:REQUIRES = "contains(QT_CONFIG, full-config)"
+ 
+ !win32:!embedded:!mac:!symbian:CONFIG += x11
+ 
+-x11:contains(QT_CONFIG, opengles2):contains(QT_CONFIG, egl):SUBDIRS += qmeegographicssystemhelper
++#x11:contains(QT_CONFIG, opengles2):contains(QT_CONFIG, egl):SUBDIRS += qmeegographicssystemhelper
+-- 
+1.8.1.2
+
-- 
1.8.1.2


