Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1S2I9p-0004sr-Tf
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 09:11:38 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Feb 2012 00:02:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="115563801"
Received: from yocto-build3.sh.intel.com ([10.239.48.15])
	by orsmga002.jf.intel.com with ESMTP; 28 Feb 2012 00:01:05 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 16:00:50 +0800
Message-Id: <4b78b4f6dceadd5c8aff4a5cc2c5794983ecf867.1330415940.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1330415940.git.edwin.zhai@intel.com>
References: <cover.1330415940.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1330415940.git.edwin.zhai@intel.com>
References: <cover.1330415940.git.edwin.zhai@intel.com>
Subject: [PATCH 5/5] self-hosted: Fix multiple libx11 error
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
X-List-Received-Date: Tue, 28 Feb 2012 08:11:38 -0000

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



