Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rt1se-0004SR-D4
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 19:59:36 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Feb 2012 10:51:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="103229356"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.78])
	by orsmga001.jf.intel.com with ESMTP; 02 Feb 2012 10:51:37 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 10:51:35 -0800
Message-Id: <2e86c284dea7b710d380d262e1a76b79b530b422.1328208481.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1328208481.git.josh@linux.intel.com>
References: <cover.1328208481.git.josh@linux.intel.com>
In-Reply-To: <cover.1328208481.git.josh@linux.intel.com>
References: <cover.1328208481.git.josh@linux.intel.com>
Subject: [PATCH 1/1] netbase: make netbase recipe MACHINE specific for all targets
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
X-List-Received-Date: Thu, 02 Feb 2012 18:59:36 -0000

Several BSP's are appending netbase to add MACHINE specific
networking functionality. Rather than BSP creators having to mark
netbase MACHINE specific just default to PACKAGE_ARCH = "${MACHINE_ARCH}"
in netbase.

This shouldn't be a huge hit as netbase just copies files around.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
CC: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-core/netbase/netbase_4.47.bb |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/netbase/netbase_4.47.bb b/meta/recipes-core/netbase/netbase_4.47.bb
index ddfa8ad..5645580 100644
--- a/meta/recipes-core/netbase/netbase_4.47.bb
+++ b/meta/recipes-core/netbase/netbase_4.47.bb
@@ -48,6 +48,4 @@ do_install () {
 
 CONFFILES_${PN} = "${sysconfdir}/hosts ${sysconfdir}/network/interfaces"
 
-PACKAGE_ARCH_qemuarm = "${MACHINE_ARCH}"
-PACKAGE_ARCH_qemux86 = "${MACHINE_ARCH}"
-PACKAGE_ARCH_qemux86-64 = "${MACHINE_ARCH}"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.7.6



