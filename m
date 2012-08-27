Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T5rSM-0007dj-BE
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 07:01:46 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7R4nSi1010798;
	Sun, 26 Aug 2012 21:49:30 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 27 Aug 2012 00:49:19 -0400
Message-Id: <54fde8f9eb166d242f78fb748d2210f215d83392.1346042224.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346042224.git.bruce.ashfield@windriver.com>
References: <cover.1346042224.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1346042224.git.bruce.ashfield@windriver.com>
References: <cover.1346042224.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/3] linux-yocto/3.4: v3.4.9, unionfs, perf and configuration changes
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
X-List-Received-Date: Mon, 27 Aug 2012 05:01:46 -0000

Updating the SRCREVs for the following updates:

  - v3.4.8, v3.4.9

  - bug fixes:
      a4c7a04 perf: add SLANG_INC for slang.h
      e32ab98 unionfs: restore FD_* utility defines
      9f0fe58 unionfs: update unionfs fork to align with mainline
      b3fcc2f codel: refine one condition to avoid a nul rec_inv_sqrt
      ef7cf65 fq_codel: should use qdisc backlog as threshold
      3f0ed1d net: codel: fix build errors
      4c06aa1 net/codel: Add missing #include <linux/prefetch.h>
      2888bf2 codel: use u16 field instead of 31bits for rec_inv_sqrt
      6edeb2e codel: use Newton method instead of sqrt() and divides
      2faecd6 fq_codel: Fair Queue Codel AQM
      edca95f netem: add ECN capability

  - config/BSP updates:

      463299b meta: bump kver to v3.4.9
      6b961c8 CrystalForest: Enable PCI IOV feature
      4bc2238 meta: Add new pci iov feature
      70346e6 mpc8315: remove now obsolete CONFIG_MISC_DEVICES

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   16 ++++++++--------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 1c4d2fd..322ee5c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.7"
+LINUX_VERSION ?= "3.4.9"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "7c172e3f3d3109b23a1107f512f9463d3108f5b2"
-SRCREV_machine_qemuppc ?= "ee88dfc005ec2cdbfe5fda3c27e5f8a175991948"
-SRCREV_meta ?= "28bcd46af1d592dab39bd8a0891c872454fde8bc"
+SRCREV_machine ?= "e8b22d297b61fb6f107f769042d47235c571da74"
+SRCREV_machine_qemuppc ?= "9cdefb26d9a263430f98d642aff6551ae925fce8"
+SRCREV_meta ?= "463299bc2e533e1bd38b0053ae7b210980f269c3"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 440deef..edb87da 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "6db2c606429fa8671e76eb312cdd92f9451cf8e8"
-SRCREV_machine_qemumips  ?= "a9f79fc1bde4f5adb7cb015d2f2b5a04bd5597a1"
-SRCREV_machine_qemuppc ?= "492560e2f9a6864c5b4bbb24a35631c182fa35a5"
-SRCREV_machine_qemux86 ?= "c77666c1d4c4be4be4b2046c3ff25bf1db34eb21"
-SRCREV_machine_qemux86-64 ?= "c77666c1d4c4be4be4b2046c3ff25bf1db34eb21"
-SRCREV_machine ?= "c77666c1d4c4be4be4b2046c3ff25bf1db34eb21"
-SRCREV_meta ?= "28bcd46af1d592dab39bd8a0891c872454fde8bc"
+SRCREV_machine_qemuarm ?= "67376c621baf82ce51657246896647ababf5aa7c"
+SRCREV_machine_qemumips  ?= "7a8c1836ce33d49ff68e549e9415538a7419e3dc"
+SRCREV_machine_qemuppc ?= "5a3c4cf87fd94add818880a158e8e5a9e07303c9"
+SRCREV_machine_qemux86 ?= "a4c7a048fe3407e8eea0020db4a9c41d3feb8247"
+SRCREV_machine_qemux86-64 ?= "a4c7a048fe3407e8eea0020db4a9c41d3feb8247"
+SRCREV_machine ?= "a4c7a048fe3407e8eea0020db4a9c41d3feb8247"
+SRCREV_meta ?= "463299bc2e533e1bd38b0053ae7b210980f269c3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.4.7"
+LINUX_VERSION ?= "3.4.9"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4



