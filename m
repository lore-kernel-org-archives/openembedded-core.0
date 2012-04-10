Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHj5Q-0002dK-1q
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 23:58:52 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Apr 2012 14:49:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130933018"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2012 14:49:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	dvhart@linux.intel.com
Date: Tue, 10 Apr 2012 14:49:09 -0700
Message-Id: <2a38835147ef4453bec97d5d000c4b661383b9f7.1334094326.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334094326.git.sgw@linux.intel.com>
References: <cover.1334094326.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334094326.git.sgw@linux.intel.com>
References: <cover.1334094326.git.sgw@linux.intel.com>
Subject: [PATCH 2/2] task-self-hosted: Add vte and eglibc-gconv-ibm850
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
X-List-Received-Date: Tue, 10 Apr 2012 21:58:52 -0000

Adding vte for a more full featured terminal
adding eglibc-gconv-ibm850 for mcopy

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/tasks/task-self-hosted.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
index 6a24a7f..5588cd3 100644
--- a/meta/recipes-core/tasks/task-self-hosted.bb
+++ b/meta/recipes-core/tasks/task-self-hosted.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Create Basic Image Tasks"
-PR = "r8"
+PR = "r9"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -48,6 +48,7 @@ RDEPENDS_task-self-hosted-host-tools = "\
     parted \
     pseudo \
     screen \
+    vte \
     "
 
 # eglibc-utils: for rpcgen
@@ -62,6 +63,7 @@ RDEPENDS_task-self-hosted-sdk = "\
     cpp-symlinks \
     distcc \
     eglibc-utils \
+    eglibc-gconv-ibm850 \
     file \
     findutils \
     g++ \
-- 
1.7.7.6



