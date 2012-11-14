Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TYejd-00088g-J1
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 16:18:37 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAEF343L022189;
	Wed, 14 Nov 2012 07:03:08 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 14 Nov 2012 10:03:01 -0500
Message-Id: <3add1bcfd8f028fd5fda964fa2fa6275d5739de9.1352840087.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1352840087.git.bruce.ashfield@windriver.com>
References: <cover.1352840087.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1352840087.git.bruce.ashfield@windriver.com>
References: <cover.1352840087.git.bruce.ashfield@windriver.com>
Cc: linux-yocto@yoctoproject.org, Rahul.Saxena@intel.com,
	dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] linux-yocto/3.2: update to v3.2.32 and 3.2.32-rt48
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

The 3.2 kernel was lagging behind on kernel.org -stable and -rt
updates. Even though no 1.3 BSPs directly use this kernel, it should be
updated for those that may use it.

Sanity test on qemu* for -rt and standard builds.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index a3900ce..0c82e16 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemu-ppc32"
 
-LINUX_VERSION ?= "3.2.18"
+LINUX_VERSION ?= "3.2.32"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "c094363010bd4645e65cc8845dd23e513ac894d1"
-SRCREV_machine_qemuppc ?= "8e63a7522e4901c1312f7f53e490027070ffc057"
-SRCREV_meta ?= "486f7aec824b4127e91ef53228823e996b3696f0"
+SRCREV_machine ?= "d8f7347b67d909a999391c4b6f64447b0ccdc86a"
+SRCREV_machine_qemuppc ?= "65c57e1a8656830260aa56a25bc8512dcb68258a"
+SRCREV_meta ?= "e7f2fdc48f8808887175f0328274a2668084738c"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
index 2bd7eee..00f706b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.2.18"
+LINUX_VERSION ?= "3.2.32"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "da6291c46f37e2fb799d964c807d8d57ea89c375"
-SRCREV_meta ?= "486f7aec824b4127e91ef53228823e996b3696f0"
+SRCREV_machine ?= "c07ec7159c3ede723953b0d603a7bb55d8614b44"
+SRCREV_meta ?= "e7f2fdc48f8808887175f0328274a2668084738c"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index 45414d5..77508fc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -7,15 +7,15 @@ KBRANCH_qemuppc  = "standard/default/qemu-ppc32"
 KBRANCH_qemumips = "standard/default/mti-malta32-be"
 KBRANCH_qemuarm  = "standard/default/arm-versatile-926ejs"
 
-LINUX_VERSION ?= "3.2.18"
-
-SRCREV_machine_qemuarm ?= "c721e94f7cd1b1ae7da5edc52076c771b2e9d134"
-SRCREV_machine_qemumips  ?= "2172812072c372cc704dac5e1654da81d6eabad3"
-SRCREV_machine_qemuppc ?= "800615ccdce45f6900b841954fa2f47987bb2a95"
-SRCREV_machine_qemux86 ?= "9e23973679d82a54dda697f539243fdea612e878"
-SRCREV_machine_qemux86-64 ?= "d7823aebcf7f724f50e30f245e5e71b3b4db1a0b"
-SRCREV_machine ?= "06882fc16a4e965872e7faacb91da1497efd9ac3"
-SRCREV_meta ?= "486f7aec824b4127e91ef53228823e996b3696f0"
+LINUX_VERSION ?= "3.2.32"
+
+SRCREV_machine_qemuarm ?= "ec68698f59bed87be4e13954d5d2b9dc1f314b45"
+SRCREV_machine_qemumips  ?= "ce21a2ab86277e410fd2229a10c45be6c9d0aa17"
+SRCREV_machine_qemuppc ?= "edd27681039f2077d83eb02d7c1c44afb7b6224f"
+SRCREV_machine_qemux86 ?= "2223d2fb00365c168ec380bdcbef05ef89751c85"
+SRCREV_machine_qemux86-64 ?= "2d7956d7e3d15f69c923315c175847813f353d39"
+SRCREV_machine ?= "6970a8f4f7caa2633aa1ae0b51732b246eb581ef"
+SRCREV_meta ?= "e7f2fdc48f8808887175f0328274a2668084738c"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.10.4



