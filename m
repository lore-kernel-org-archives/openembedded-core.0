Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RhuCK-0000ym-V8
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 03:33:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jan 2012 18:26:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102521738"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.13.153])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jan 2012 18:26:34 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 18:26:32 -0800
Message-Id: <cfc23ba559e9f602225c45ded4c5a0a33b4818e1.1325557342.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
In-Reply-To: <cover.1325557342.git.josh@linux.intel.com>
References: <cover.1325557342.git.josh@linux.intel.com>
In-Reply-To: <cover.1325557342.git.josh@linux.intel.com>
References: <cover.1325557342.git.josh@linux.intel.com>
Subject: [RFC PATCH 2/2] task-base: add alsa-state to task-base-alsa
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
X-List-Received-Date: Tue, 03 Jan 2012 02:33:57 -0000

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
1.7.7.4



