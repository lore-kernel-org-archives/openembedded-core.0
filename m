Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rkg0p-0006J8-DT
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 19:01:31 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Jan 2012 09:39:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94381687"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.3])
	by azsmga001.ch.intel.com with ESMTP; 10 Jan 2012 09:39:19 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 09:39:16 -0800
Message-Id: <35eca064e6310d94b517b481beef5f5a5a3f395b.1326216024.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.5
In-Reply-To: <cover.1326216024.git.josh@linux.intel.com>
References: <cover.1326216024.git.josh@linux.intel.com>
In-Reply-To: <cover.1326216024.git.josh@linux.intel.com>
References: <cover.1326216024.git.josh@linux.intel.com>
Subject: [PATCH 3/3] task-base: add alsa-state to task-base-alsa
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
X-List-Received-Date: Tue, 10 Jan 2012 18:01:31 -0000

This enables automatic configuration setting and restoration on systems
with alsa.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-core/tasks/task-base.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
index e0960b5..7460be4 100644
--- a/meta/recipes-core/tasks/task-base.bb
+++ b/meta/recipes-core/tasks/task-base.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Merge machine and distro options to create a basic machine task/p
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r72"
+PR = "r73"
 
 inherit task
 
@@ -183,7 +183,8 @@ RRECOMMENDS_task-base-vfat = "\
 
 RDEPENDS_task-base-alsa = "\
     alsa-utils-alsactl \
-    alsa-utils-alsamixer"
+    alsa-utils-alsamixer \
+    alsa-state"
 
 RRECOMMENDS_task-base-alsa = "\
     kernel-module-snd-mixer-oss \
-- 
1.7.7.5



