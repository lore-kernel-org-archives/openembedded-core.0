Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1ROJYt-0000IY-W5
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 02:36:16 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Nov 2011 17:29:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,486,1315206000"; d="scan'208";a="72645347"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.15])
	by azsmga001.ch.intel.com with ESMTP; 09 Nov 2011 17:29:57 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 17:29:50 -0800
Message-Id: <ea0b46fedcb5897c976941614b57348ea6f1c9dc.1320888203.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1320888203.git.josh@linux.intel.com>
References: <cover.1320888203.git.josh@linux.intel.com>
In-Reply-To: <cover.1320888203.git.josh@linux.intel.com>
References: <cover.1320888203.git.josh@linux.intel.com>
Subject: [PATCH 3/7] task-core-clutter: use clutter-1.8
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
X-List-Received-Date: Thu, 10 Nov 2011 01:36:16 -0000

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
1.7.7



