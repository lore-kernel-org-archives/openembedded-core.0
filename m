Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1RWVDK-0004IB-49
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 16:39:50 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Dec 2011 07:33:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="82236176"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by orsmga001.jf.intel.com with ESMTP; 02 Dec 2011 07:33:06 -0800
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 23:54:10 +0800
Message-Id: <fc0ef81c90c33d489a386dae5c912527e699598e.1322840490.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <658bdcf24a1ade76126924fcb937c50abce6d08d.1322840490.git.jiajun.xu@intel.com>
References: <658bdcf24a1ade76126924fcb937c50abce6d08d.1322840490.git.jiajun.xu@intel.com>
In-Reply-To: <cover.1322840490.git.jiajun.xu@intel.com>
References: <cover.1322840490.git.jiajun.xu@intel.com>
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
X-List-Received-Date: Fri, 02 Dec 2011 15:39:50 -0000

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



