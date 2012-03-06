Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1S4orw-0004Np-4x
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 08:31:36 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Mar 2012 23:22:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115184982"
Received: from yocto-build3.sh.intel.com ([10.239.48.15])
	by azsmga001.ch.intel.com with ESMTP; 05 Mar 2012 23:22:58 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 15:23:11 +0800
Message-Id: <db01578077aeeed64c5e379b45c3f134186d9dd2.1331017518.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1331017518.git.edwin.zhai@intel.com>
References: <cover.1331017518.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1331017518.git.edwin.zhai@intel.com>
References: <cover.1331017518.git.edwin.zhai@intel.com>
Subject: [PATCH 2/4] self-hosted: Fix multiple libx11 error
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
X-List-Received-Date: Tue, 06 Mar 2012 07:31:36 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Self-hosted needs package libx11-dev, which is ambiguous as virtual/libx11 is
provided by libx11 or libx11-trim. This patch explictly set the perferred one,
libx11-trim-dev, to avoid this.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-core/tasks/task-self-hosted.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
index 586a461..a6cf75f 100644
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
@@ -189,6 +189,6 @@ RDEPENDS_task-self-hosted-graphics = "\
     libglu-dev \
     libsdl \
     libsdl-dev \
-    libx11-dev \
+    libx11-trim-dev \
     python-pygtk \
     "
-- 
1.7.1



