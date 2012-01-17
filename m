Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4b4-0006gw-Ro
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:51 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:33:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96633053"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:08 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:30 -0800
Message-Id: <91937e7bc345ae9fdbeb8e9c415e2c6026ca729d.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 45/62] task-base: add VIRTUAL-RUNTIME_alsa-state to task-base-alsa
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
X-List-Received-Date: Tue, 17 Jan 2012 08:44:36 -0000

From: Joshua Lock <josh@linux.intel.com>

Define this to be the alsa-state package by default. This enables automatic
configuration setting and restoration on systems with alsa.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/conf/distro/include/default-providers.inc |    1 +
 meta/recipes-core/tasks/task-base.bb           |    5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 2445049..6615d55 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -16,6 +16,7 @@ PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
 #
 VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-cworth"
 VIRTUAL-RUNTIME_apm ?= "apm"
+VIRTUAL-RUNTIME-alsa-state ?= "alsa-state"
 
 #
 # Default recipe providers
diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
index 12e171a..a7d7c40 100644
--- a/meta/recipes-core/tasks/task-base.bb
+++ b/meta/recipes-core/tasks/task-base.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Merge machine and distro options to create a basic machine task/p
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r72"
+PR = "r73"
 
 inherit task
 
@@ -180,7 +180,8 @@ RRECOMMENDS_task-base-vfat = "\
 
 RDEPENDS_task-base-alsa = "\
     alsa-utils-alsactl \
-    alsa-utils-alsamixer"
+    alsa-utils-alsamixer \
+    ${VIRTUAL-RUNTIME-alsa-state}"
 
 RRECOMMENDS_task-base-alsa = "\
     kernel-module-snd-mixer-oss \
-- 
1.7.6.5



