Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1RdP5c-0006NU-5G
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 17:32:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Dec 2011 08:25:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="90037144"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by orsmga002.jf.intel.com with ESMTP; 21 Dec 2011 08:25:17 -0800
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 00:46:54 +0800
Message-Id: <d9af8d4b8f14949396d5da21df5ce4bd9184c1e6.1324485726.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <dcfa0fc805a2946b6db3bc7529c0124b9fc05a27.1324485726.git.jiajun.xu@intel.com>
References: <dcfa0fc805a2946b6db3bc7529c0124b9fc05a27.1324485726.git.jiajun.xu@intel.com>
In-Reply-To: <cover.1324485726.git.jiajun.xu@intel.com>
References: <cover.1324485726.git.jiajun.xu@intel.com>
Subject: [PATCH 3/3] task-core-tools: add ltp to testapps list
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
X-List-Received-Date: Wed, 21 Dec 2011 16:32:24 -0000

Signed-off-by: Jiajun Xu <jiajun.xu@intel.com>
---
 meta/recipes-core/tasks/task-core-tools.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-tools.bb b/meta/recipes-core/tasks/task-core-tools.bb
index 12d4ff9..6632b4f 100644
--- a/meta/recipes-core/tasks/task-core-tools.bb
+++ b/meta/recipes-core/tasks/task-core-tools.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Tools tasks for OE-Core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r13"
+PR = "r14"
 
 PACKAGES = "\
     task-core-tools-debug \
@@ -98,4 +98,5 @@ RDEPENDS_task-core-tools-testapps = "\
     xprop \
     xvideo-tests \
     clutter-box2d \
+    ltp \
     "
-- 
1.7.1



