Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMc00-0000eN-BE
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 10:20:56 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 May 2011 01:17:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,230,1304319600"; d="scan'208";a="438114068"
Received: from unknown (HELO localhost) ([10.255.12.160])
	by azsmga001.ch.intel.com with ESMTP; 18 May 2011 01:17:53 -0700
Message-Id: <c6d97485966058c818369a469a3e5b1ad8124a33.1305702436.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305702436.git.sgw@linux.intel.com>
References: <cover.1305702436.git.sgw@linux.intel.com>
Old-Date: Sat, 14 May 2011 21:23:06 -0700
Date: Wed, 18 May 2011  1:17:52 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Robert Yang <liezhi.yang@windriver.com>
Subject: [PATCH 04/15] task-core-clutter: Update to 1.6
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
X-List-Received-Date: Wed, 18 May 2011 08:20:56 -0000

From: Saul Wold <sgw@linux.intel.com>

Removed clutter-gtk and box2d

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/tasks/task-core-clutter.bb |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/tasks/task-core-clutter.bb b/meta/recipes-graphics/tasks/task-core-clutter.bb
index 43c6525..970970c 100644
--- a/meta/recipes-graphics/tasks/task-core-clutter.bb
+++ b/meta/recipes-graphics/tasks/task-core-clutter.bb
@@ -24,13 +24,13 @@ PACKAGES = "\
 ALLOW_EMPTY = "1"
 
 RDEPENDS_task-core-clutter-core = "\
-    clutter-1.4 \
-    clutter-gst-1.4 \
-    clutter-gtk-1.4"
+    clutter-1.6 \
+    clutter-gst-1.6 \
+    "
 
-RDEPENDS_task-core-clutter-tests = "\
-    clutter-gst-1.4-examples \
-    clutter-gtk-1.4-examples"
+#RDEPENDS_task-core-clutter-tests = "\
+#    clutter-gst-1.6-examples \
+#    clutter-gtk-1.6-examples"
 
 #RDEPENDS_task-core-clutter-apps = "\
 #    clutter-box2d "
-- 
1.7.3.4



