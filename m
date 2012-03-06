Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4xvo-0003ce-D5
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 18:12:12 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2012 09:03:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125714860"
Received: from unknown (HELO swold-mobl.verilan.com) ([10.255.15.180])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2012 09:03:32 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 09:03:15 -0800
Message-Id: <06470a55e6507a71f7491252d8084a06a9bf9c4b.1331053126.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/20] linux-yocto/rt: udpate SRCREVs to 3.2.9-rt16
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
X-List-Received-Date: Tue, 06 Mar 2012 17:12:14 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Bumping the -rt kernel to pickup the incremental update to -rt16.
No major changes from -rt15, except for a bug fix that we want
to pick up.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.2.bb    |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index 872289f..24a885f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -14,9 +14,9 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemu-ppc32"
 LINUX_VERSION ?= "3.2.9"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-SRCREV_machine ?= "3652b606f1ab7769a7ecc86c70d22db4ef99fb2a"
-SRCREV_machine_qemuppc ?= "0c8f5214bc15699b41369751cdecea45f717c79c"
-SRCREV_meta ?= "a9ffedb3d7ed7a1da79d8b46b36518865f7ae4d0"
+SRCREV_machine ?= "ae15fb7aaba7d12c48e1a1d30e5b8857d40b9b10"
+SRCREV_machine_qemuppc ?= "963f79376e583ff79c55fd275b79bfc9a3aedd8e"
+SRCREV_meta ?= "8295227f068f78ec3c433529e4012a38773a88c9"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index 6da16c6..fdfde8a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemuppc ?= "74364f1062a219eb242d7cb300a404516c297601"
 SRCREV_machine_qemux86 ?= "ea0a62d6821aede782c2b9457639f1ca7f2ddc07"
 SRCREV_machine_qemux86-64 ?= "626165edf65281d9b933a6129e935c7a73ab63a7"
 SRCREV_machine ?= "6f164ae4ef5aeec2bef40a1b936ac1f9b9db46ba"
-SRCREV_meta ?= "a9ffedb3d7ed7a1da79d8b46b36518865f7ae4d0"
+SRCREV_meta ?= "8295227f068f78ec3c433529e4012a38773a88c9"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.7.6



