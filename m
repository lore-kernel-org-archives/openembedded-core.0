Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TsF5p-0000wt-B0
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 16:58:29 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r07FhFFn014487;
	Mon, 7 Jan 2013 07:43:15 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  7 Jan 2013 10:43:03 -0500
Message-Id: <2adc6eec90af8e312f64ec60dd84456f9000c7f2.1357572952.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1357572952.git.bruce.ashfield@windriver.com>
References: <cover.1357572952.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1357572952.git.bruce.ashfield@windriver.com>
References: <cover.1357572952.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/3.4: integrate v3.4.21, v3.4.22, v3.4.23
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
X-List-Received-Date: Mon, 07 Jan 2013 15:58:30 -0000

Updating the SRCREVs to integrate the korg -stable updates.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 6412edc..c3f3c4f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.20"
+LINUX_VERSION ?= "3.4.23"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "61a6e7a812b3b49988c4eb29a78c5db94d380197"
-SRCREV_machine_qemuppc ?= "0d29fe9056288412b8b538e48af3c78bac3494f1"
-SRCREV_meta ?= "6737e890fff2a423fbb022ab1f7f82ef187fd8b1"
+SRCREV_machine ?= "14f4a06b2275a9b23c5a5e50da687d4218227981"
+SRCREV_machine_qemuppc ?= "ebcf52db41ea59f6dfb8824cf214eb2ed0318dac"
+SRCREV_meta ?= "6d4cb3c86cde2f37ea1d67933a1d24e45920753c"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index a18a561..62fb184 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.4.20"
+LINUX_VERSION ?= "3.4.23"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "b13bef6377719a488293af196236cc290566fad3"
-SRCREV_meta ?= "6737e890fff2a423fbb022ab1f7f82ef187fd8b1"
+SRCREV_machine ?= "782622711662dc3676040f085f589d10780a1e33"
+SRCREV_meta ?= "6d4cb3c86cde2f37ea1d67933a1d24e45920753c"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 91785f9..ace0b7f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "092d66e326abfda80c50dcf1869417d7420847f1"
-SRCREV_machine_qemumips  ?= "b258437665477f44a868c38c6c9cc5199db58cd8"
-SRCREV_machine_qemuppc ?= "67a370223d695ec08b6e5a38860fa1fe5d0d9f1e"
-SRCREV_machine_qemux86 ?= "b13bef6377719a488293af196236cc290566fad3"
-SRCREV_machine_qemux86-64 ?= "b13bef6377719a488293af196236cc290566fad3"
-SRCREV_machine ?= "b13bef6377719a488293af196236cc290566fad3"
-SRCREV_meta ?= "6737e890fff2a423fbb022ab1f7f82ef187fd8b1"
+SRCREV_machine_qemuarm ?= "c1e1ed0f4ab5f90f11f49d4d1aa79b378a14708f"
+SRCREV_machine_qemumips  ?= "d6138383ef03c70e3580beffe318e6a2f1a2767e"
+SRCREV_machine_qemuppc ?= "9ef6eddfeeb8e5cda01c008c4fa49629902561de"
+SRCREV_machine_qemux86 ?= "782622711662dc3676040f085f589d10780a1e33"
+SRCREV_machine_qemux86-64 ?= "782622711662dc3676040f085f589d10780a1e33"
+SRCREV_machine ?= "782622711662dc3676040f085f589d10780a1e33"
+SRCREV_meta ?= "6d4cb3c86cde2f37ea1d67933a1d24e45920753c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.4.20"
+LINUX_VERSION ?= "3.4.23"
 
 PR = "${INC_PR}.3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.10.4



