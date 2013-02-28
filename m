Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <emilia.maria.silvia.ciobanu@intel.com>)
	id 1UB4R7-0000wD-T7 for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 15:26:19 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Feb 2013 06:09:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,755,1355126400"; d="scan'208";a="262631235"
Received: from ema-vostro-460 (HELO localhost.localdomain) ([10.237.105.140])
	by azsmga001.ch.intel.com with ESMTP; 28 Feb 2013 06:09:53 -0800
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2013 16:14:34 +0200
Message-Id: <1362060874-7660-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] btrfs-tools: added PV to git package recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2013 14:26:26 -0000

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 .../btrfs-tools/btrfs-tools_git.bb                 |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
index e963a74..ef575ae 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -17,6 +17,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git;p
 
 S = "${WORKDIR}/git"
 
+PV = "0.19+git${SRCPV}"
+
 PR = "r6"
 
 SRC_URI += " file://fix_use_of_gcc.patch \
-- 
1.7.9.5



