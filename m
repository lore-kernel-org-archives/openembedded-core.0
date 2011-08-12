Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrma6-0004dc-TC
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 09:55:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2011 00:50:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37809741"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2011 00:50:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 00:50:12 -0700
Message-Id: <e1f6016d4a8b6bd96cb1283841e74465c3acd45d.1313134270.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 23/25] meta-rt: default KMACHINE and SRCREV_machine to avoid parsing errors
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
X-List-Received-Date: Fri, 12 Aug 2011 07:55:06 -0000

From: Darren Hart <dvhart@linux.intel.com>

Without a default KMACHINE and SRCREV_machine the git URL will fail to
expand to something usable and we get a parsing error. This approach was
also used in the non-rt version of this recipe.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_2.6.34.bb  |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-rt/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb b/meta-rt/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb
index d58b86b..0ca53ae 100644
--- a/meta-rt/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb
+++ b/meta-rt/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb
@@ -1,6 +1,7 @@
 inherit kernel
 require recipes-kernel/linux/linux-yocto.inc
 
+KMACHINE = "common-pc"
 KMACHINE_qemux86  = "common_pc"
 KMACHINE_qemux86-64  = "common_pc_64"
 
@@ -13,6 +14,7 @@ KBRANCH = ${KMACHINE}-${LINUX_KERNEL_TYPE}
 
 SRCREV_machine_qemux86 = "439602eb6acd53d9beb8493710310214fc7bd749"
 SRCREV_machine_qemux86-64 = "3c84c45ad3c3592f9c7ff4076de9bee417cd322e"
+SRCREV_machine = "439602eb6acd53d9beb8493710310214fc7bd749"
 SRCREV_meta = "e1f85a470934a0cf6abde5d95533e74501822c6b"
 
 PR = "r2"
-- 
1.7.3.4



