Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RxJr0-0008FU-1P
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 15:59:38 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Feb 2012 06:51:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="107352404"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga001.jf.intel.com with ESMTP; 14 Feb 2012 06:51:25 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Date: Tue, 14 Feb 2012 22:51:47 +0800
Message-Id: <7603c62fbf8e69f64e358406e9c2ed6c145279f4.1329230985.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1329230985.git.dexuan.cui@intel.com>
References: <cover.1329230985.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1329230985.git.dexuan.cui@intel.com>
References: <cover.1329230985.git.dexuan.cui@intel.com>
Subject: [PATCH 2/2] task-self-hosted: add connman and connman-plugin-ethernet
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
X-List-Received-Date: Tue, 14 Feb 2012 14:59:38 -0000

Without this, the VMware guest running self-hosted-image can't get IP
address automatically.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-core/tasks/task-self-hosted.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
index 63fa1cc..1678ac3 100644
--- a/meta/recipes-core/tasks/task-self-hosted.bb
+++ b/meta/recipes-core/tasks/task-self-hosted.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Create Basic Image Tasks"
-PR = "r4"
+PR = "r5"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -28,6 +28,8 @@ RDEPENDS_task-self-hosted = "\
     "
 
 RDEPENDS_task-self-hosted-host-tools = "\
+    connman \
+    connman-plugin-ethernet \
     parted \
     e2fsprogs \
     e2fsprogs-mke2fs \
-- 
1.7.6



