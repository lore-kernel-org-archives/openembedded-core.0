Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rj4mT-0004Le-Ri
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 09:04:06 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jan 2012 23:56:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93004468"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 05 Jan 2012 23:56:40 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 23:56:19 -0800
Message-Id: <1074ebab3bf4a30b7c48a9320f7b0f95ef303ace.1325836241.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325836241.git.sgw@linux.intel.com>
References: <cover.1325836241.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325836241.git.sgw@linux.intel.com>
References: <cover.1325836241.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/25] linux-yocto: bump kernel version to v3.0.14
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
X-List-Received-Date: Fri, 06 Jan 2012 08:04:06 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating the 3.0 kernel recipe to contain v3.0.14 -stable.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   18 +++++++++---------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 81d22d0..c8983c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -11,12 +11,12 @@ KMACHINE_qemumips = "mti-malta32-be"
 KBRANCH = "yocto/standard/preempt-rt/base"
 KBRANCH_qemuppc = "yocto/standard/preempt-rt/qemu-ppc32"
 
-LINUX_VERSION ?= "3.0.12"
+LINUX_VERSION ?= "3.0.14"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-SRCREV_machine ?= "6e96ccbbf19a4a7b67d98fdcd74d2c9da2c7c463"
-SRCREV_machine_qemuppc ?= "8ea61de7fd201ff0001a039f2fda8ec2e4a562a1"
-SRCREV_meta ?= "c979f1365b1eb74e882b2cbbc8407ec536ab6eb8"
+SRCREV_machine ?= "bcf4107c7f22d10952618a2ad146e6149d240cd2"
+SRCREV_machine_qemuppc ?= "1e5511ea2cb5f150ffce86071035a81c0499494b"
+SRCREV_meta ?= "6ae3d992cf546184010e87a0349810198f1d167c"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index b650c84..921c258 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -10,15 +10,15 @@ KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 
 KBRANCH = ${KMACHINE}
 
-LINUX_VERSION ?= "3.0.12"
-
-SRCREV_machine_qemuarm ?= "b2a7d668b963f1c5f9876f130278dd9fb7df4831"
-SRCREV_machine_qemumips ?= "62bb04e5ba19b5b8aacd9079fdfbcb8284cd9fc8"
-SRCREV_machine_qemuppc ?= "7ecece328c5987112de2959f8f998dfcedaf7210"
-SRCREV_machine_qemux86 ?= "a611ba462ac51b2bfdac1c5c6538dac95ad9b4dd"
-SRCREV_machine_qemux86-64 ?= "b15a9b67089e31ef9780fdbd0481f48ef7facdba"
-SRCREV_machine ?= "f389d310965a56091f688b28ea8be6d9cbb7fbbe"
-SRCREV_meta ?= "c979f1365b1eb74e882b2cbbc8407ec536ab6eb8"
+LINUX_VERSION ?= "3.0.14"
+
+SRCREV_machine_qemuarm ?= "c498cc6e4b56784b3c2c547cb9a7af435b9412c1"
+SRCREV_machine_qemumips ?= "791c3f4124a238a798e2360340800f4989fad695"
+SRCREV_machine_qemuppc ?= "10e808d1c304b14cf42903fd637f239766b78476"
+SRCREV_machine_qemux86 ?= "e04f9f8e564c60b1ce907d64074c18730f8dab4e"
+SRCREV_machine_qemux86-64 ?= "53c2fa060d34e9a0b59e19398aeebbe73f24d89b"
+SRCREV_machine ?= "fe80c1e343bf8f038328a612cef7f821d7ec8dbf"
+SRCREV_meta ?= "6ae3d992cf546184010e87a0349810198f1d167c"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.6.4



