Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S26Uj-0002tu-FJ
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 20:44:25 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1RJZplc010298;
	Mon, 27 Feb 2012 11:35:52 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 27 Feb 2012 14:34:14 -0500
Message-Id: <50d11c7f7c5a0eb227f1f0813c0c22131d12ff02.1330371008.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1330371008.git.bruce.ashfield@windriver.com>
References: <cover.1330371008.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1330371008.git.bruce.ashfield@windriver.com>
References: <cover.1330371008.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/3] linux-yocto: update 3.0 kernel to v3.0.22
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
X-List-Received-Date: Mon, 27 Feb 2012 19:44:25 -0000

bumping the revision of the 3.0 kernel to the latest -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb      |   18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 3d4a1d0..41a37fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -11,12 +11,12 @@ KMACHINE_qemumips = "mti-malta32-be"
 KBRANCH = "yocto/standard/preempt-rt/base"
 KBRANCH_qemuppc = "yocto/standard/preempt-rt/qemu-ppc32"
 
-LINUX_VERSION ?= "3.0.18"
+LINUX_VERSION ?= "3.0.22"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-SRCREV_machine ?= "2f9d925f5681eaae7f341cc1270c739e8b329c03"
-SRCREV_machine_qemuppc ?= "c66f7ef2315010756c8c97af6b13d52f9f18c03b"
-SRCREV_meta ?= "b78a519841bd8b477cad599af8d38df6760445c1"
+SRCREV_machine ?= "03705f7f066d83b4cd3a6088781d47e3b9e45b71"
+SRCREV_machine_qemuppc ?= "c8b184e8171f6f5a8017be4c5bf1e7a38c3f3002"
+SRCREV_meta ?= "808b49474268040ab27c8ee687b60807a11547b4"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
index 061476c..f4eedb7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
@@ -5,10 +5,10 @@ require recipes-kernel/linux/linux-yocto.inc
 KMACHINE = "yocto/standard/base"
 KBRANCH = "${KMACHINE}"
 
-LINUX_VERSION ?= "3.0.12"
+LINUX_VERSION ?= "3.0.22"
 
-SRCREV_machine ?= "f389d310965a56091f688b28ea8be6d9cbb7fbbe"
-SRCREV_meta ?= "04a52a32cbdf0972033b97b83eaa83eb275dfdc9"
+SRCREV_machine ?= "c578f3a1f357142a6e02a1df4ae9aa16f45094d6"
+SRCREV_meta ?= "808b49474268040ab27c8ee687b60807a11547b4"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index d52e93a..8e7842e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -10,15 +10,15 @@ KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 
 KBRANCH = "${KMACHINE}"
 
-LINUX_VERSION ?= "3.0.18"
-
-SRCREV_machine_qemuarm ?= "48e68bd72da497a14200801140b3b87dae6d60e9"
-SRCREV_machine_qemumips ?= "9d86aeb43e5bbb0851cc4f105b64caab13bc71f3"
-SRCREV_machine_qemuppc ?= "15fd748017f0849138ff4b47d73f6866fa26cfe8"
-SRCREV_machine_qemux86 ?= "8f74a4339b3dc029fafff0ba7d88d6dc950d4b31"
-SRCREV_machine_qemux86-64 ?= "610c5a62daeda033755b0b7bfcb3e2cad5c76f3f"
-SRCREV_machine ?= "5df0b4c2538399aed543133b3855f809adf08ab8"
-SRCREV_meta ?= "b78a519841bd8b477cad599af8d38df6760445c1"
+LINUX_VERSION ?= "3.0.22"
+
+SRCREV_machine_qemuarm ?= "6d4d3334bf648b97a0d44b7833060f4da40840d5"
+SRCREV_machine_qemumips ?= "1d8d58d120c92510be8a97b0ed493a25a3010d6c"
+SRCREV_machine_qemuppc ?= "804aff4612bb7a53ac4679412c2a78bc06e3c4ce"
+SRCREV_machine_qemux86 ?= "7b0476fde681e828417d8fa86c47b0ca539ade70"
+SRCREV_machine_qemux86-64 ?= "14fe1742198bd5a85fbcf6e53d336838ff87b2ef"
+SRCREV_machine ?= "c578f3a1f357142a6e02a1df4ae9aa16f45094d6"
+SRCREV_meta ?= "808b49474268040ab27c8ee687b60807a11547b4"
 
 PR = "r3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.0.4



