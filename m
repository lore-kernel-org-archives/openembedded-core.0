Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TsF5p-0000wr-9U
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 16:58:29 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r07FhFFo014487;
	Mon, 7 Jan 2013 07:43:16 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  7 Jan 2013 10:43:04 -0500
Message-Id: <5405200661e06a1361fbc3aef31e21db97bde636.1357572952.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1357572952.git.bruce.ashfield@windriver.com>
References: <cover.1357572952.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1357572952.git.bruce.ashfield@windriver.com>
References: <cover.1357572952.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/3.4: update to v3.4.24
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

Updating the 3.4 recipes to v3.4.24 stable version.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index c3f3c4f..93adb06 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.23"
+LINUX_VERSION ?= "3.4.24"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "14f4a06b2275a9b23c5a5e50da687d4218227981"
-SRCREV_machine_qemuppc ?= "ebcf52db41ea59f6dfb8824cf214eb2ed0318dac"
-SRCREV_meta ?= "6d4cb3c86cde2f37ea1d67933a1d24e45920753c"
+SRCREV_machine ?= "729e8634f75bf10582916eae6b5b96325785c001"
+SRCREV_machine_qemuppc ?= "15ce18fac50c49ea4893b0d7ed3d0086ef9c7448"
+SRCREV_meta ?= "7e0cd2990798aae80565baa17d3b6c771874f284"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 62fb184..5a4959e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.4.23"
+LINUX_VERSION ?= "3.4.24"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "782622711662dc3676040f085f589d10780a1e33"
-SRCREV_meta ?= "6d4cb3c86cde2f37ea1d67933a1d24e45920753c"
+SRCREV_machine ?= "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
+SRCREV_meta ?= "7e0cd2990798aae80565baa17d3b6c771874f284"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index ace0b7f..70ed967 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "c1e1ed0f4ab5f90f11f49d4d1aa79b378a14708f"
-SRCREV_machine_qemumips  ?= "d6138383ef03c70e3580beffe318e6a2f1a2767e"
-SRCREV_machine_qemuppc ?= "9ef6eddfeeb8e5cda01c008c4fa49629902561de"
-SRCREV_machine_qemux86 ?= "782622711662dc3676040f085f589d10780a1e33"
-SRCREV_machine_qemux86-64 ?= "782622711662dc3676040f085f589d10780a1e33"
-SRCREV_machine ?= "782622711662dc3676040f085f589d10780a1e33"
-SRCREV_meta ?= "6d4cb3c86cde2f37ea1d67933a1d24e45920753c"
+SRCREV_machine_qemuarm ?= "50986c7d971c28505acdbdcab6601f4d5b6dbff4"
+SRCREV_machine_qemumips  ?= "4d355c57fe0d9f117c272f1679fa3d3f451a8c8e"
+SRCREV_machine_qemuppc ?= "1c8a1aa8cc839f0328edbfe0d755100368bc4ae6"
+SRCREV_machine_qemux86 ?= "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
+SRCREV_machine_qemux86-64 ?= "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
+SRCREV_machine ?= "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
+SRCREV_meta ?= "7e0cd2990798aae80565baa17d3b6c771874f284"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.4.23"
+LINUX_VERSION ?= "3.4.24"
 
 PR = "${INC_PR}.3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.10.4



