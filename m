Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2FhT-0008QI-Gi
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 06:34:12 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 21:25:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130197481"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2012 21:25:41 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 21:25:25 -0800
Message-Id: <6b33dfcc9701fe704bc6525bb68183cca8800969.1330406574.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 27/36] linux-yocto: update 3.2 kernel to v3.2.7
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
X-List-Received-Date: Tue, 28 Feb 2012 05:34:13 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

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
1.7.7.6



