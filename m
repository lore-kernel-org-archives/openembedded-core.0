Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TYejm-00089C-1Q
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 16:18:46 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAEF343K022189;
	Wed, 14 Nov 2012 07:03:08 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 14 Nov 2012 10:03:00 -0500
Message-Id: <d3688dde67031f850f2b861c89a887ea001fd1ff.1352840087.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1352840087.git.bruce.ashfield@windriver.com>
References: <cover.1352840087.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1352840087.git.bruce.ashfield@windriver.com>
References: <cover.1352840087.git.bruce.ashfield@windriver.com>
Cc: linux-yocto@yoctoproject.org, Rahul.Saxena@intel.com,
	dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] linux-yocto/3.4: v3.4.17, v3.4.18, -rt and config changes
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
X-List-Received-Date: Wed, 14 Nov 2012 15:18:46 -0000

Bumping the linux-yocto/3.4 SRCREVs to incorporate the following updates:

  - v3.4.17
  - v3.4.18
  - 3.4.18-rt29

Also incorporating the following meta branch config changes:

  5bd6d0d rangeley: update include to use the new intel-dpdk feature
  4b277c2 dpdk: Add feature Intel DPDK
  3905e74 meta: rangeley: Enable Zlib Compression
  194c5f1 meta: Add a new feature for Zlib
  14cb04d meta: rangeley: Enable AES feature
  8e4dbf6 meta: Add new feature for Ciphers
  7e75c1f enable IPv6 Router Preference (RFC 4191) support
  dfd56d1 Create IPv4 and IPv6 IPSec fragments
  0a85061 rangeley: Add smp support
  1190856 rangeley: Add efi support
  b262e38 rangeley: Add PCI features
  80c9084 rangeley: Add uio and hugetlb support

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 3ccd64a..1176404 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.16"
+LINUX_VERSION ?= "3.4.18"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "e9e1c1ef7b67464cb81b4c77bb9e97518851e2ad"
-SRCREV_machine_qemuppc ?= "6ce035a7528b710e0483d3d0a3f4e27e152bfccb"
-SRCREV_meta ?= "7c258779acffc9be33c7a31fa799dd416e9784a0"
+SRCREV_machine ?= "2572b13999da8129c37eb2bf7e9a8fa68dc2a4bf"
+SRCREV_machine_qemuppc ?= "2004632314104d4f31bb1577e955da53796f517c"
+SRCREV_meta ?= "553a8512fd924420db5cc2320ece4a6fd9b1e486"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index e3c44ca..6cfec92 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.4.16"
+LINUX_VERSION ?= "3.4.18"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "0d734af0fa4dbef33cb486e147dccf35c4ad0900"
-SRCREV_meta ?= "7c258779acffc9be33c7a31fa799dd416e9784a0"
+SRCREV_machine ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
+SRCREV_meta ?= "553a8512fd924420db5cc2320ece4a6fd9b1e486"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 156619e..7a58e1c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "ca1bbde92c0d66ba8db6ac4654de12c0fbd5c0c8"
-SRCREV_machine_qemumips  ?= "c349c5fd5d9dc04b3983565c239805f2c30ce6ca"
-SRCREV_machine_qemuppc ?= "475a5e7d76f4e2914caefda3fed0adf40d0a2cc6"
-SRCREV_machine_qemux86 ?= "0d734af0fa4dbef33cb486e147dccf35c4ad0900"
-SRCREV_machine_qemux86-64 ?= "0d734af0fa4dbef33cb486e147dccf35c4ad0900"
-SRCREV_machine ?= "0d734af0fa4dbef33cb486e147dccf35c4ad0900"
-SRCREV_meta ?= "7c258779acffc9be33c7a31fa799dd416e9784a0"
+SRCREV_machine_qemuarm ?= "e24986bf7398f5fb471173bda1d4f32008da101a"
+SRCREV_machine_qemumips  ?= "8835a2ba0d8e8f9bb5e2513d3568ae3970acefd5"
+SRCREV_machine_qemuppc ?= "ae8e2cd14e47bceb9c2bdcb927b3a0ea61f6c311"
+SRCREV_machine_qemux86 ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
+SRCREV_machine_qemux86-64 ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
+SRCREV_machine ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
+SRCREV_meta ?= "553a8512fd924420db5cc2320ece4a6fd9b1e486"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.4.16"
+LINUX_VERSION ?= "3.4.18"
 
 PR = "${INC_PR}.3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.10.4



