Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TfdAv-0007R7-1A
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 22:03:37 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB3Kn7lt013095;
	Mon, 3 Dec 2012 12:49:09 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  3 Dec 2012 15:49:04 -0500
Message-Id: <5bbe28c9fb605704b709cb103d4ab2066beba4fb.1354566708.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354566708.git.bruce.ashfield@windriver.com>
References: <cover.1354566708.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1354566708.git.bruce.ashfield@windriver.com>
References: <cover.1354566708.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/3.4: merge v3.4.19, v3.4.20
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
X-List-Received-Date: Mon, 03 Dec 2012 21:03:37 -0000

Updating the linux-yocto-3.4 trees to incorporate both 3.4.19 and
3.4.20 from the kernel.org -stable team.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index e0800ff..d524120 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.18"
+LINUX_VERSION ?= "3.4.20"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "2572b13999da8129c37eb2bf7e9a8fa68dc2a4bf"
-SRCREV_machine_qemuppc ?= "2004632314104d4f31bb1577e955da53796f517c"
-SRCREV_meta ?= "4e5f2b43acfbdb924edbdf42a816e3e2b15203b3"
+SRCREV_machine ?= "61a6e7a812b3b49988c4eb29a78c5db94d380197"
+SRCREV_machine_qemuppc ?= "0d29fe9056288412b8b538e48af3c78bac3494f1"
+SRCREV_meta ?= "8b0a93c0a224c9b91f90545b123b055b2e313bfc"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index ab214c8..d6fe8bb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.4.18"
+LINUX_VERSION ?= "3.4.20"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
-SRCREV_meta ?= "4e5f2b43acfbdb924edbdf42a816e3e2b15203b3"
+SRCREV_machine ?= "b13bef6377719a488293af196236cc290566fad3"
+SRCREV_meta ?= "8b0a93c0a224c9b91f90545b123b055b2e313bfc"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index bb3c860..814492d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "e24986bf7398f5fb471173bda1d4f32008da101a"
-SRCREV_machine_qemumips  ?= "8835a2ba0d8e8f9bb5e2513d3568ae3970acefd5"
-SRCREV_machine_qemuppc ?= "ae8e2cd14e47bceb9c2bdcb927b3a0ea61f6c311"
-SRCREV_machine_qemux86 ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
-SRCREV_machine_qemux86-64 ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
-SRCREV_machine ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
-SRCREV_meta ?= "4e5f2b43acfbdb924edbdf42a816e3e2b15203b3"
+SRCREV_machine_qemuarm ?= "092d66e326abfda80c50dcf1869417d7420847f1"
+SRCREV_machine_qemumips  ?= "b258437665477f44a868c38c6c9cc5199db58cd8"
+SRCREV_machine_qemuppc ?= "67a370223d695ec08b6e5a38860fa1fe5d0d9f1e"
+SRCREV_machine_qemux86 ?= "b13bef6377719a488293af196236cc290566fad3"
+SRCREV_machine_qemux86-64 ?= "b13bef6377719a488293af196236cc290566fad3"
+SRCREV_machine ?= "b13bef6377719a488293af196236cc290566fad3"
+SRCREV_meta ?= "8b0a93c0a224c9b91f90545b123b055b2e313bfc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.4.18"
+LINUX_VERSION ?= "3.4.20"
 
 PR = "${INC_PR}.3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.10.4



