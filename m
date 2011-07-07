Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QepXD-00076o-FH
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 16:26:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2011 07:22:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,493,1304319600"; d="scan'208";a="22647086"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by orsmga002.jf.intel.com with ESMTP; 07 Jul 2011 07:22:38 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 22:22:11 +0800
Message-Id: <5d74762c2631c97aee2bbebc5e0baf56fa4ed1ad.1310048449.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1310048449.git.ke.yu@intel.com>
References: <cover.1310048449.git.ke.yu@intel.com>
In-Reply-To: <cover.1310048449.git.ke.yu@intel.com>
References: <cover.1310048449.git.ke.yu@intel.com>
Subject: [PATCH 1/1] sato-sdk: add clutter for sato-sdk image
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
X-List-Received-Date: Thu, 07 Jul 2011 14:26:31 -0000

Yocto ADT has Eclips clutter template, so it is better to have
clutter in SDK image to support ADT. this patch add clutter
and clutter-box2d app to sato-sdk image for this purpose

Fix [YOCTO #891]

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/recipes-core/tasks/task-core-tools.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-tools.bb b/meta/recipes-core/tasks/task-core-tools.bb
index 4a98b0f..44520a7 100644
--- a/meta/recipes-core/tasks/task-core-tools.bb
+++ b/meta/recipes-core/tasks/task-core-tools.bb
@@ -82,4 +82,6 @@ RDEPENDS_task-core-tools-testapps = "\
     xrestop \
     xwininfo \
     xprop \
-    xvideo-tests"
+    xvideo-tests \
+    clutter-box2d-1.6 \
+    "
-- 
1.7.0.4



