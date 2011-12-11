Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZsIH-0003rc-DD
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 23:54:53 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2011 14:47:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86045446"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.46])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2011 14:47:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Dec 2011 14:47:33 -0800
Message-Id: <b0187ef99c845115c5bd1574253c851ba4297c07.1323643433.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/26] task-self-hosted: Add host-tools task
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
X-List-Received-Date: Sun, 11 Dec 2011 22:54:53 -0000

Added tools to create and manage ext* partitions
e2fs*, parted

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/tasks/task-self-hosted.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
index 4288499..69b9276 100644
--- a/meta/recipes-core/tasks/task-self-hosted.bb
+++ b/meta/recipes-core/tasks/task-self-hosted.bb
@@ -14,6 +14,7 @@ PACKAGES = "\
     task-self-hosted-sdk \
     task-self-hosted-extended \
     task-self-hosted-graphics \
+    task-self-hosted-host-tools \
     "
 
 ALLOW_EMPTY = "1"
@@ -23,6 +24,17 @@ RDEPENDS_task-self-hosted = "\
     task-self-hosted-sdk \
     task-self-hosted-extended \
     task-self-hosted-graphics \
+    task-self-hosted-host-tools \
+    "
+
+RDEPENDS_task-self-hosted-host-tools = "\
+    e2fsprogs \
+    e2fsprogs-e2fsck \
+    e2fsprogs-fsck \
+    e2fsprogs-mke2fs \
+    e2fsprogs-tune2fs \
+    genext2fs \
+    parted \
     "
 
 # eglibc-utils: for rpcgen
-- 
1.7.6.4



