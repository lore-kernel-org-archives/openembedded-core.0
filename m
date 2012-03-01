Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S30qn-0008UE-7F
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 08:54:57 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Feb 2012 23:46:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="72182131"
Received: from unknown (HELO swold-mobl.myhome.westell.com) ([10.255.15.82])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Feb 2012 23:46:25 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 23:46:19 -0800
Message-Id: <8166980a5f0696c1f88bce1fb9bdcff7089690b8.1330587785.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330587785.git.sgw@linux.intel.com>
References: <cover.1330587785.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330587785.git.sgw@linux.intel.com>
References: <cover.1330587785.git.sgw@linux.intel.com>
Subject: [PATCH 1/4] self-hosted: Fix multiple libx11 error
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
X-List-Received-Date: Thu, 01 Mar 2012 07:54:57 -0000

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
1.7.7.6



