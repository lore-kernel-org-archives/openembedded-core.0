Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TYejd-00088d-Hh
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 16:18:37 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAEF343J022189;
	Wed, 14 Nov 2012 07:03:07 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 14 Nov 2012 10:02:59 -0500
Message-Id: <e1ff20958cce39d58352fdf3ff5cfc0bdddda225.1352840087.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1352840087.git.bruce.ashfield@windriver.com>
References: <cover.1352840087.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1352840087.git.bruce.ashfield@windriver.com>
References: <cover.1352840087.git.bruce.ashfield@windriver.com>
Cc: linux-yocto@yoctoproject.org, Rahul.Saxena@intel.com,
	dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-yocto/3.4: bump kver to v3.4.16
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
X-List-Received-Date: Wed, 14 Nov 2012 15:18:38 -0000

The -stable 3.4 kernel has updated versions, so we import 3.4.16 and
make that our new baseline.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index bdbecf4..3ccd64a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.11"
+LINUX_VERSION ?= "3.4.16"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "fb596148058bf5e7ef550a040d143bdfbf4146b0"
-SRCREV_machine_qemuppc ?= "b24ede45575d58ace08633f0e8fd31b594c5c80e"
-SRCREV_meta ?= "68a635bf8dfb64b02263c1ac80c948647cc76d5f"
+SRCREV_machine ?= "e9e1c1ef7b67464cb81b4c77bb9e97518851e2ad"
+SRCREV_machine_qemuppc ?= "6ce035a7528b710e0483d3d0a3f4e27e152bfccb"
+SRCREV_meta ?= "7c258779acffc9be33c7a31fa799dd416e9784a0"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 772cfef..e3c44ca 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.4.11"
+LINUX_VERSION ?= "3.4.16"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "218bd8d2022b9852c60d32f0d770931e3cf343e2"
-SRCREV_meta ?= "68a635bf8dfb64b02263c1ac80c948647cc76d5f"
+SRCREV_machine ?= "0d734af0fa4dbef33cb486e147dccf35c4ad0900"
+SRCREV_meta ?= "7c258779acffc9be33c7a31fa799dd416e9784a0"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 22593c6..156619e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "cec289be595a5889740ad4f0a58d12579f528d5e"
-SRCREV_machine_qemumips  ?= "01ab58eb9dc64ceccb2d7be80ef4a511479fc899"
-SRCREV_machine_qemuppc ?= "c820da3c7fa5176507c116352ee3bd1e682f36bd"
-SRCREV_machine_qemux86 ?= "218bd8d2022b9852c60d32f0d770931e3cf343e2"
-SRCREV_machine_qemux86-64 ?= "218bd8d2022b9852c60d32f0d770931e3cf343e2"
-SRCREV_machine ?= "218bd8d2022b9852c60d32f0d770931e3cf343e2"
-SRCREV_meta ?= "68a635bf8dfb64b02263c1ac80c948647cc76d5f"
+SRCREV_machine_qemuarm ?= "ca1bbde92c0d66ba8db6ac4654de12c0fbd5c0c8"
+SRCREV_machine_qemumips  ?= "c349c5fd5d9dc04b3983565c239805f2c30ce6ca"
+SRCREV_machine_qemuppc ?= "475a5e7d76f4e2914caefda3fed0adf40d0a2cc6"
+SRCREV_machine_qemux86 ?= "0d734af0fa4dbef33cb486e147dccf35c4ad0900"
+SRCREV_machine_qemux86-64 ?= "0d734af0fa4dbef33cb486e147dccf35c4ad0900"
+SRCREV_machine ?= "0d734af0fa4dbef33cb486e147dccf35c4ad0900"
+SRCREV_meta ?= "7c258779acffc9be33c7a31fa799dd416e9784a0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.4.11"
+LINUX_VERSION ?= "3.4.16"
 
 PR = "${INC_PR}.3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.10.4



