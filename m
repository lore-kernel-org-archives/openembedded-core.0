Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrma0-0004dc-74
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 09:54:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2011 00:50:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37809712"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2011 00:50:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 00:49:57 -0700
Message-Id: <5da8f59ceed178c8a7fb35244dcc65ec5a4bc7b2.1313134270.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/25] linux-yocto: update SRCREVs for preempt-rt support + build fixes
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
X-List-Received-Date: Fri, 12 Aug 2011 07:54:56 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating the SRCREVs for linux-yocto to pickup a series of changes
that were made to support the build/boot of preempt-rt on 3.0.x.

7782fc6 routerstationpro: remove CONFIG_PREEMPT* definitions
b51300c meta/rt: sugarbay preempt-rt support
735711e meta/rt: common-pc[-64] preempt-rt no branch fix
53026bf meta/rt: jasperforest preempt-rt support
99bc260 meta/rt: fri2 preempt-rt support
e746ab8 meta/rt: fishriver preempt-rt support
fa1b73f meta/rt: emenlow preempt-rt support
1f686ab meta/rt: crownbay preempt-rt support
64a5069 meta/rt: arm-versatile-926ejs preempt-rt support
7f827a1 meta/rt: mti-malta32-be preempt-rt support
930a983 meta/rt: qemu-ppc32 preempt-rt support
367fc55 meta-rt: rsp preempt-rt support
b8a62ea meta/rt: mpc8315 preempt-rt support
b5f9daa meta/rt: beagleboard preempt-rt support
1e6e9eb meta/rt: use CONFIG_PREEMPT_RT_FULL for 3.0 kernels
eb5a06b boot: move -Os patch to standard branch
c692a23 meta/rt: remove explicit patch references
8a2ac6b meta/rt: updating to rt8
76b3679 meta: atom-pc update definition to re-use preempt-rt

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index a7bd67a..ba352e2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -14,13 +14,13 @@ KMETA = meta
 LINUX_VERSION ?= "3.0"
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
-SRCREV_machine_qemuarm = "30a2cec4e9d7048681c1d239f49cc935287a7012"
-SRCREV_machine_qemumips = "f9b9688cefaa87d898394902acfb858d6b0f1e28"
-SRCREV_machine_qemuppc = "a46a4c356f8bcf7a30d967a1b43633b824cd07a1"
-SRCREV_machine_qemux86 = "efaab1f75dbc577922c862fa19d45c3f31cb99cb"
-SRCREV_machine_qemux86-64 = "c30a56850c73c74af2d056d803081a0d829ce35c"
-SRCREV_machine = "318b059a472128f67119f367f51f11893ee60269"
-SRCREV_meta = "76b3679beff6c640388a609ccf87f46bb7bf0f2b"
+SRCREV_machine_qemuarm = "36b4cdddcafc711f0ec9ad97882f23a6443c61b2"
+SRCREV_machine_qemumips = "2db2aacc589a518a74e8a8543e80403f09de8134"
+SRCREV_machine_qemuppc = "c0f5dd4ef37b445d8ac73b11dd93e0ffdb7e9f6d"
+SRCREV_machine_qemux86 = "c29beadfd4364aca9358ac0fdb8356c1dbbdacb2"
+SRCREV_machine_qemux86-64 = "d0b814813bce09971c5cbb0d22bacb8842146fa0"
+SRCREV_machine = "ad13129a87957656c18584793abcee51de0e196a"
+SRCREV_meta = "7782fc673afd6a1c742409896ae787560d96fce8"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.3.4



