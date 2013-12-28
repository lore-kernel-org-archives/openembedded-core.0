Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 111A46B7A6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:30:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:30:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457010073"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:30:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:17 +0000
Message-Id: <a78c25a62b3a26a660cb27593fcce4f4894b9d10.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 21/38] qt4: set SUMMARY and tweak DESCRIPTION
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
X-List-Received-Date: Sat, 28 Dec 2013 22:30:14 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4-embedded.inc | 3 ++-
 meta/recipes-qt/qt4/qt4-x11-free.inc | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index cbdda5f..e87de4b 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -1,4 +1,5 @@
-DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the embedded version."
+SUMMARY = "Cross-platform UI toolkit and application framework (framebuffer version)"
+DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the embedded (framebuffer) version."
 SECTION = "libs"
 HOMEPAGE = "http://qt-project.org/"
 DEPENDS += "directfb tslib"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 369b3d5..73ed2bc 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -1,5 +1,6 @@
 require qt4.inc
 
+SUMMARY = "Cross-platform UI toolkit and application framework (X11 version)"
 DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the X11 version."
 HOMEPAGE = "http://qt-project.org/"
 SECTION = "x11/libs"
-- 
1.8.1.2


