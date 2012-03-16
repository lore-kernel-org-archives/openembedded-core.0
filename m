Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S8aJm-0001DQ-1x
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 17:47:54 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2GGcx37023581;
	Fri, 16 Mar 2012 09:39:02 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 16 Mar 2012 12:38:47 -0400
Message-Id: <f9a2a51a826fc9995e79c807cc013f48b1eec9be.1331915755.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331915755.git.bruce.ashfield@windriver.com>
References: <cover.1331915755.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1331915755.git.bruce.ashfield@windriver.com>
References: <cover.1331915755.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 3/4] linux-yocto/3.2: update to v3.2.11
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
X-List-Received-Date: Fri, 16 Mar 2012 16:47:54 -0000

Updating the 3.2 meta and board branches to the latest 3.2-stable
update.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto_3.2.bb    |   18 +++++++++---------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index 85e2f56..f31baeb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -11,12 +11,12 @@ KMACHINE_qemumips = "mti-malta32-be"
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemu-ppc32"
 
-LINUX_VERSION ?= "3.2.9"
+LINUX_VERSION ?= "3.2.11"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-SRCREV_machine ?= "ae15fb7aaba7d12c48e1a1d30e5b8857d40b9b10"
-SRCREV_machine_qemuppc ?= "963f79376e583ff79c55fd275b79bfc9a3aedd8e"
-SRCREV_meta ?= "42fff722188e0de7246a3a6900eeeeaf69f87047"
+SRCREV_machine ?= "32ecb53e9ff759bbd297a10712b62a6575daaf86"
+SRCREV_machine_qemuppc ?= "0d5625bb868cc2471d5dd49eb7abe7eb5fe1044b"
+SRCREV_meta ?= "514847185c78c07f52e02750fbe0a03ca3a31d8f"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index c98937f..94423b6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -15,15 +15,15 @@ KBRANCH_qemuppc  = "standard/default/qemu-ppc32"
 KBRANCH_qemumips = "standard/default/mti-malta32-be"
 KBRANCH_qemuarm  = "standard/default/arm-versatile-926ejs"
 
-LINUX_VERSION ?= "3.2.9"
-
-SRCREV_machine_qemuarm ?= "a4d4d3dd9a69611bd1915626d1f2e9f2b1571b39"
-SRCREV_machine_qemumips ?= "79a0a4c9872ebc70af688f9b09f6be4e4d2249e0"
-SRCREV_machine_qemuppc ?= "74364f1062a219eb242d7cb300a404516c297601"
-SRCREV_machine_qemux86 ?= "ea0a62d6821aede782c2b9457639f1ca7f2ddc07"
-SRCREV_machine_qemux86-64 ?= "626165edf65281d9b933a6129e935c7a73ab63a7"
-SRCREV_machine ?= "6f164ae4ef5aeec2bef40a1b936ac1f9b9db46ba"
-SRCREV_meta ?= "42fff722188e0de7246a3a6900eeeeaf69f87047"
+LINUX_VERSION ?= "3.2.11"
+
+SRCREV_machine_qemuarm ?= "dfbba772cbee84125ac1558c904a7dc181445f5f"
+SRCREV_machine_qemumips ?= "0e0c67635b74199d534f75500e5c1654a1219bc6"
+SRCREV_machine_qemuppc ?= "92de4e2f3c6b397c8b363e079cc4d5e9bcadf877"
+SRCREV_machine_qemux86 ?= "8ada1bb97415fe959a57a08504be4eb8a656ed30"
+SRCREV_machine_qemux86-64 ?= "4ca7e2c5d42e755e1b4c3e1478128f047a8ed2a8"
+SRCREV_machine ?= "01e948c2bdf7f5ad9f2b30047a8d3493a1a2880a"
+SRCREV_meta ?= "514847185c78c07f52e02750fbe0a03ca3a31d8f"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4



