Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T6QXh-00046J-Fx
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 20:29:37 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Aug 2012 11:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,328,1344236400"; d="scan'208";a="186360387"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.20])
	by orsmga001.jf.intel.com with ESMTP; 28 Aug 2012 11:17:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2012 11:17:23 -0700
Message-Id: <1346177843-24150-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH v2] task-self-hosted: remove e2fsprogs-fsck from task list
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2012 18:29:37 -0000

Matches changes made to the e2fsprogs PACKAGE list

Added PR Bump

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/tasks/task-self-hosted.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
index 61d08ed..4d6ab07 100644
--- a/meta/recipes-core/tasks/task-self-hosted.bb
+++ b/meta/recipes-core/tasks/task-self-hosted.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Create Basic Image Tasks"
-PR = "r10"
+PR = "r11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -33,7 +33,6 @@ RDEPENDS_task-self-hosted-host-tools = "\
     dhcp-client \
     e2fsprogs \
     e2fsprogs-e2fsck \
-    e2fsprogs-fsck \
     e2fsprogs-mke2fs \
     e2fsprogs-tune2fs \
     genext2fs \
-- 
1.7.7.6



