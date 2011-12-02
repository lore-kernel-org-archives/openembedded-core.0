Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWN8s-0002ay-P4
	for openembedded-core@openembedded.org; Fri, 02 Dec 2011 08:02:43 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 22:55:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,282,1320652800"; d="scan'208";a="43189781"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Dec 2011 22:55:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 22:55:46 -0800
Message-Id: <8425c8cf54634660c2ebd09f9c6e010ca709c8a8.1322808632.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/18] linux-yocto: v3.0.10 + rt27
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
X-List-Received-Date: Fri, 02 Dec 2011 07:02:49 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating linux-yocto to a 3.0.10 base, and refreshing the rt kernel
branches to contain the latest 3.0-rt27 changes.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   18 +++++++++---------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 615209b..9833b90 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -11,12 +11,12 @@ KMACHINE_qemumips = "mti-malta32-be"
 KBRANCH = "yocto/standard/preempt-rt/base"
 KBRANCH_qemuppc = "yocto/standard/preempt-rt/qemu-ppc32"
 
-LINUX_VERSION ?= "3.0.4"
+LINUX_VERSION ?= "3.0.10"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-SRCREV_machine ?= "0936e13cc65d816f1759e2322c5e3fc82a5037f3"
-SRCREV_machine_qemuppc ?= "0936e13cc65d816f1759e2322c5e3fc82a5037f3"
-SRCREV_meta ?= "4095bb597a7bcd647856aa35b5fb8637ed7ff975"
+SRCREV_machine ?= "bffda9207cdc3b309bfa7b3e23eb7dc838f50223"
+SRCREV_machine_qemuppc ?= "f02dda1ccaf95f10a1e65359184e90484a5fd0d9"
+SRCREV_meta ?= "67ce7623909cef63927fd145026aaf371cf4abf1"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 85c8e39..4032567 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -10,15 +10,15 @@ KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 
 KBRANCH = ${KMACHINE}
 
-LINUX_VERSION ?= "3.0.9"
-
-SRCREV_machine_qemuarm ?= "774710abff369c063226452de2114403e0bbff9f"
-SRCREV_machine_qemumips ?= "a558a07a706756cd83199146c89c2677d9f14364"
-SRCREV_machine_qemuppc ?= "d06082c227f12f62b9ce9e3823f8b7d2ad055880"
-SRCREV_machine_qemux86 ?= "a231348953ce9f1bc2f520b2fe6806337efccfa8"
-SRCREV_machine_qemux86-64 ?= "08db6e4d159a26a4caf06258b1d7dbd17e6ebe26"
-SRCREV_machine ?= "5c974770213858c380599a0fb743f24ffb619d62"
-SRCREV_meta ?= "74665003a89510fb5bd4e29e81d568d72eede08c"
+LINUX_VERSION ?= "3.0.10"
+
+SRCREV_machine_qemuarm ?= "42573a6932e65456471efa94d4863b8df88e48b3"
+SRCREV_machine_qemumips ?= "55d4921f21dea9f07344029c12400bb3ef15d76b"
+SRCREV_machine_qemuppc ?= "d10f26a8325a40610fc8d6a830a9f34dcb794075"
+SRCREV_machine_qemux86 ?= "7814f075ea132cc17da89ecd6d886036e61e2187"
+SRCREV_machine_qemux86-64 ?= "988fcbe64829f0a03ccfcc08d45cedb26cabe9ed"
+SRCREV_machine ?= "ab1de8c21d2b1d084b8488496d75cc54fcd94f02"
+SRCREV_meta ?= "67ce7623909cef63927fd145026aaf371cf4abf1"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.6.4



