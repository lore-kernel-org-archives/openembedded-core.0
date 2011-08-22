Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1QvWLx-00010o-T1
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 17:23:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Aug 2011 08:18:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="40987545"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2011 08:18:03 -0700
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2011 23:36:51 +0800
Message-Id: <fc58590d64ead54992532fd8bc555d5853e3c64f.1314027196.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <affcf82437bc5de4cc1fb470d09eb5fa5c6357f6.1314027196.git.jiajun.xu@intel.com>
References: <affcf82437bc5de4cc1fb470d09eb5fa5c6357f6.1314027196.git.jiajun.xu@intel.com>
In-Reply-To: <cover.1314027196.git.jiajun.xu@intel.com>
References: <cover.1314027196.git.jiajun.xu@intel.com>
Subject: [PATCH 2/2] task-core-x11-sato: add libsdl into sato image
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
X-List-Received-Date: Mon, 22 Aug 2011 15:23:54 -0000

We add libsdl into sato image since some 3D graphics testing needs it.

Signed-off-by: Jiajun Xu <jiajun.xu@intel.com>
---
 meta/recipes-sato/tasks/task-core-x11-sato.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/tasks/task-core-x11-sato.bb b/meta/recipes-sato/tasks/task-core-x11-sato.bb
index cd71077..ed43075 100644
--- a/meta/recipes-sato/tasks/task-core-x11-sato.bb
+++ b/meta/recipes-sato/tasks/task-core-x11-sato.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Sato Tasks for Poky"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r30"
+PR = "r31"
 
 PACKAGES = "\
     task-core-x11-sato \
@@ -33,4 +33,5 @@ RDEPENDS_task-core-x11-sato = "\
     gtk-sato-engine \
     gthumb \
     x11vnc \
+    libsdl \
     ${NETWORK_MANAGER}"
-- 
1.7.1



