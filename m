Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S26Uj-0002tt-3P
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 20:44:25 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1RJZpld010298;
	Mon, 27 Feb 2012 11:35:53 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 27 Feb 2012 14:34:15 -0500
Message-Id: <a2440ad66968c13a0db6f97f69b04b8670ac9ffd.1330371008.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1330371008.git.bruce.ashfield@windriver.com>
References: <cover.1330371008.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1330371008.git.bruce.ashfield@windriver.com>
References: <cover.1330371008.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 2/3] linux-yocto: update 3.2 kernel to v3.2.7
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

Updating the 3.2 kernel recipe to the latest -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    9 +++++----
 meta/recipes-kernel/linux/linux-yocto_3.2.bb    |   19 ++++++++++---------
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index 329527f..3370729 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -11,12 +11,13 @@ KMACHINE_qemumips = "mti-malta32-be"
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemu-ppc32"
 
-LINUX_VERSION ?= "3.2.2"
+LINUX_VERSION ?= "3.2.7"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-SRCREV_machine ?= "415af017cf163c63d7b1e6e929e4a9c9baf5ba6d"
-SRCREV_machine_qemuppc ?= "38345c1e41b15c49308a9adbdde95167eeaa05fa"
-SRCREV_meta ?= "138bf5b502607fe40315c0d76822318d77d97e01"
+SRCREV_machine ?= "2043e8b786dfd06a41a66780141f731d2d788696"
+SRCREV_machine_qemuppc ?= "ec400326633f011c3b7d390beb765ad955145a29"
+SRCREV_meta ?= "5db8963f9aefc70b4483ca4ccce8f2ef6964e2c3"
+
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index a80924d..9be1bd9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -15,15 +15,16 @@ KBRANCH_qemuppc  = "standard/default/qemu-ppc32"
 KBRANCH_qemumips = "standard/default/mti-malta32-be"
 KBRANCH_qemuarm  = "standard/default/arm-versatile-926ejs"
 
-LINUX_VERSION ?= "3.2.2"
-
-SRCREV_machine_qemuarm ?= "8d79190c307c7d41580beb77f83526ae3defcacc"
-SRCREV_machine_qemumips ?= "c88f8c4f3be717be33a8ad89a14731eb94932336"
-SRCREV_machine_qemuppc ?= "b8228f337002ad88f1e152d0c0c46c6035cd0428"
-SRCREV_machine_qemux86 ?= "417fc778a86e81303bab5883b919ee422ec51c04"
-SRCREV_machine_qemux86-64 ?= "417fc778a86e81303bab5883b919ee422ec51c04"
-SRCREV_machine ?= "417fc778a86e81303bab5883b919ee422ec51c04"
-SRCREV_meta ?= "138bf5b502607fe40315c0d76822318d77d97e01"
+LINUX_VERSION ?= "3.2.7"
+
+
+SRCREV_machine_qemuarm ?= "c2028a144fe035719af7c5e9989fedc62ccf3c2c"
+SRCREV_machine_qemumips ?= "7dfffd937d4755cba0fcf3f2b9b69a1c62262084"
+SRCREV_machine_qemuppc ?= "8fc0489fffe4c626f9a8053ad86014e75073a3d0"
+SRCREV_machine_qemux86 ?= "0fae9c2722039df3e93398d314ee10e3f4330b86"
+SRCREV_machine_qemux86-64 ?= "0fae9c2722039df3e93398d314ee10e3f4330b86"
+SRCREV_machine ?= "0fae9c2722039df3e93398d314ee10e3f4330b86"
+SRCREV_meta ?= "5db8963f9aefc70b4483ca4ccce8f2ef6964e2c3"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.0.4



