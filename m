Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T108d-00020j-Ck
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 21:17:19 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7DJ5LCw016933;
	Mon, 13 Aug 2012 12:05:22 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 13 Aug 2012 15:04:52 -0400
Message-Id: <3586d6fded3be13f29057600255bd86a160465aa.1344884450.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1344884450.git.bruce.ashfield@windriver.com>
References: <cover.1344884450.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1344884450.git.bruce.ashfield@windriver.com>
References: <cover.1344884450.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/2] linux-yocto: bump version to 3.4.7
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
X-List-Received-Date: Mon, 13 Aug 2012 19:17:19 -0000

The v3.4.7 -stable update has been released, updating all in-tree
BSPs to this new baseline.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   16 ++++++++--------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index ea2ce02..b995a42 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.6"
+LINUX_VERSION ?= "3.4.7"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "2d008a6dcbf565878cee14c5f050eca53897316f"
-SRCREV_machine_qemuppc ?= "94d25f958b6dfb1e8009a0feea7ab4c9a8f54a99"
-SRCREV_meta ?= "7ff48aa47c50b6455d60ca93bc81260ce8fe1a1b"
+SRCREV_machine ?= "50cc910aeb0571921b7ad86091ec2dc621adf67f"
+SRCREV_machine_qemuppc ?= "713b13fa93d4d0b1780b31ed9bbb7a5527447886"
+SRCREV_meta ?= "8d2012649516f3c489295a31fb9ea7afd1b464e4"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 5ab46b7..9f1e550 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -10,19 +10,19 @@ KBRANCH_qemumips64 = "standard/mti-malta64"
 KBRANCH_qemumips64el = "standard/mti-malta64"
 KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
 
-SRCREV_machine_qemuarm ?= "b57548a29e44655e27cfbdf3a0642d682401b835"
-SRCREV_machine_qemumips  ?= "633d487b0f6e5d328400b47f0d69d9dac7354c84"
-SRCREV_machine_qemuppc ?= "6229fc0f62283e0dc9f8b5d2be01b048a92867f3"
-SRCREV_machine_qemux86 ?= "19f7e43b54aef08d58135ed2a897d77b624b320a"
-SRCREV_machine_qemux86-64 ?= "19f7e43b54aef08d58135ed2a897d77b624b320a"
-SRCREV_machine ?= "19f7e43b54aef08d58135ed2a897d77b624b320a"
-SRCREV_meta ?= "7ff48aa47c50b6455d60ca93bc81260ce8fe1a1b"
+SRCREV_machine_qemuarm ?= "469cf6a66c720944adeaf8e43c044dfcb8d90599"
+SRCREV_machine_qemumips  ?= "0985f3076c1a5a2cc3a01054e8a0411ffe440395"
+SRCREV_machine_qemuppc ?= "e662bb66d9114c05919cd57ee4d620f4e67d2123"
+SRCREV_machine_qemux86 ?= "f01bddc9534f31b27b475b68d13b5897533a6fca"
+SRCREV_machine_qemux86-64 ?= "f01bddc9534f31b27b475b68d13b5897533a6fca"
+SRCREV_machine ?= "f01bddc9534f31b27b475b68d13b5897533a6fca"
+SRCREV_meta ?= "8d2012649516f3c489295a31fb9ea7afd1b464e4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
 SRC_URI += "file://noslang.patch"
 
-LINUX_VERSION ?= "3.4.6"
+LINUX_VERSION ?= "3.4.7"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4



