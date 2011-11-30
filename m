Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RVYDu-0008Er-9v
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 01:40:30 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Nov 2011 16:33:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="81378093"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.149])
	by orsmga002.jf.intel.com with ESMTP; 29 Nov 2011 16:33:48 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 16:33:39 -0800
Message-Id: <a27143ec4c493e595e27e6b0a97219a77214b480.1322606832.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1322606832.git.josh@linux.intel.com>
References: <cover.1322606832.git.josh@linux.intel.com>
In-Reply-To: <cover.1322606832.git.josh@linux.intel.com>
References: <cover.1322606832.git.josh@linux.intel.com>
Subject: [PATCH 03/11] task-core-clutter: use clutter-1.8
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
X-List-Received-Date: Wed, 30 Nov 2011 00:40:30 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/tasks/task-core-clutter.bb |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/tasks/task-core-clutter.bb b/meta/recipes-graphics/tasks/task-core-clutter.bb
index 970970c..4044131 100644
--- a/meta/recipes-graphics/tasks/task-core-clutter.bb
+++ b/meta/recipes-graphics/tasks/task-core-clutter.bb
@@ -24,13 +24,14 @@ PACKAGES = "\
 ALLOW_EMPTY = "1"
 
 RDEPENDS_task-core-clutter-core = "\
-    clutter-1.6 \
-    clutter-gst-1.6 \
+    clutter-1.8 \
+    clutter-gst-1.8 \
+    clutter-gtk-1.8 \
     "
 
 #RDEPENDS_task-core-clutter-tests = "\
-#    clutter-gst-1.6-examples \
-#    clutter-gtk-1.6-examples"
+#    clutter-gst-1.8-examples \
+#    clutter-gtk-1.8-examples"
 
 #RDEPENDS_task-core-clutter-apps = "\
 #    clutter-box2d "
-- 
1.7.7.3



