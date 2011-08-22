Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvcUQ-0006yL-4b
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 23:57:02 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2011 14:52:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,265,1312182000"; d="scan'208";a="43970304"
Received: from unknown (HELO swold-MOBL.lan) ([10.255.13.234])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2011 14:52:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2011 14:52:03 -0700
Message-Id: <d12f4520c516fd2cf6c05fe66588917a19af0d32.1314043945.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/19] task-core-x11-sato: add libsdl into sato image
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
X-List-Received-Date: Mon, 22 Aug 2011 21:57:02 -0000

From: Jiajun Xu <jiajun.xu@intel.com>

We add libsdl into sato image since some 3D graphics testing needs it.

Signed-off-by: Jiajun Xu <jiajun.xu@intel.com>
---
 meta/recipes-sato/tasks/task-core-x11-sato.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/tasks/task-core-x11-sato.bb b/meta/recipes-sato/tasks/task-core-x11-sato.bb
index cd71077..ed43075 100644
--- a/meta/recipes-sato/tasks/task-core-x11-sato.bb
+++ b/meta/recipes-sato/tasks/task-core-x11-sato.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Sato Tasks for Poky"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r30"
+PR = "r31"
 
 PACKAGES = "\
     task-core-x11-sato \
@@ -33,4 +33,5 @@ RDEPENDS_task-core-x11-sato = "\
     gtk-sato-engine \
     gthumb \
     x11vnc \
+    libsdl \
     ${NETWORK_MANAGER}"
-- 
1.7.6



