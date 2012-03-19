Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1S9TOd-00081w-Uo
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 04:36:36 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Mar 2012 20:27:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="118972473"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by orsmga001.jf.intel.com with ESMTP; 18 Mar 2012 20:27:43 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org,
	sgw@linux.intel.com
Date: Mon, 19 Mar 2012 11:28:03 +0800
Message-Id: <5731ab06df2e9c29f423be394558b103449364e2.1332127031.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1332127031.git.dexuan.cui@intel.com>
References: <cover.1332127031.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1332127031.git.dexuan.cui@intel.com>
References: <cover.1332127031.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] task-self-hosted: add nfs-utils and nfs-utils-client into the target
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
X-List-Received-Date: Mon, 19 Mar 2012 03:36:36 -0000

Without this, in the target, we don't have the mount.nfs utility.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-core/tasks/task-self-hosted.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
index 586a461..d349078 100644
--- a/meta/recipes-core/tasks/task-self-hosted.bb
+++ b/meta/recipes-core/tasks/task-self-hosted.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Create Basic Image Tasks"
-PR = "r6"
+PR = "r7"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -123,6 +123,8 @@ RDEPENDS_task-self-hosted-extended = "\
     mtools \
     ncurses \
     neon \
+    nfs-utils \
+    nfs-utils-client \
     openssl \
     opkg \
     opkg-utils \
-- 
1.7.6



