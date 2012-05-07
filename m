Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SRPIs-0000BI-Hh
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 16:52:47 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q47Egpt5022301;
	Mon, 7 May 2012 07:42:52 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  7 May 2012 10:42:46 -0400
Message-Id: <8edcd68611811afb6ecacc7c7fbbeb393ce36679.1336400779.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1336400779.git.bruce.ashfield@windriver.com>
References: <cover.1336400779.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1336400779.git.bruce.ashfield@windriver.com>
References: <cover.1336400779.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto/3.2: configuration and pch merge
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
X-List-Received-Date: Mon, 07 May 2012 14:52:47 -0000

Updating the 3.2 SRCREVs to import the following meta/config
changes:

   6b3d4e0 meta: add mei feature
   519abac meta: add usb/uhci-hcd feature
   a67c5a3 meta/crownbay: use usb features
   0855066 meta: add usb/ohci-hcd feature
   15f1a99 meta: add usb/ehci-hcd feature
   8fa6408 meta: add usb/xhci-hcd feature
   c724a55 meta: add usb/base feature
   b55b3a1 sys940x: Cleanup sys940x.scc
   93f2e97 sys940x: Use PHYSICAL_START of 0x200000 to boot
   aaa034b sys940x: Add common standard and preempt-rt features
   e2b1286 sys940x: Add efi-ext to standard and preempt-rt configs
   d188c21 sys940x: Move emgd-1.10 data to the standard scc file
   72d9369 fri2: Cleanup fri2-$KTYPE.scc files re efi-ext.scc
   dbcb120 fri2: Use emgd-1.10 feature and branch

And the following driver fix:

   f39a0a9 pch_gbe: Do not abort probe on bad MAC

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   14 +++++++-------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index 05674ef..7e01efb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -14,9 +14,9 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemu-ppc32"
 LINUX_VERSION ?= "3.2.11"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-SRCREV_machine ?= "32ecb53e9ff759bbd297a10712b62a6575daaf86"
-SRCREV_machine_qemuppc ?= "0d5625bb868cc2471d5dd49eb7abe7eb5fe1044b"
-SRCREV_meta ?= "b14a08f5c7b469a5077c10942f4e1aec171faa9d"
+SRCREV_machine ?= "3ebf4d172cf4a41d2abf09e4036f0850e08064e7"
+SRCREV_machine_qemuppc ?= "7cebfe717987f4ffa9ae90558c28f45049847c1c"
+SRCREV_meta ?= "6b3d4e09aa2531e9649f3f03827b7efbccfcec03"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
index 4957e33..27de229 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
@@ -11,8 +11,8 @@ KCONFIG_MODE = "--allnoconfig"
 
 LINUX_VERSION ?= "3.2.11"
 
-SRCREV_machine ?= "ec236058dc254183dbfb3744bf21f110c37af30b"
-SRCREV_meta ?= "b14a08f5c7b469a5077c10942f4e1aec171faa9d"
+SRCREV_machine ?= "61960ba8e910d54b5525d5e9b6a7469bc399c246"
+SRCREV_meta ?= "6b3d4e09aa2531e9649f3f03827b7efbccfcec03"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index d81f6b5..51119bb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -17,13 +17,13 @@ KBRANCH_qemuarm  = "standard/default/arm-versatile-926ejs"
 
 LINUX_VERSION ?= "3.2.11"
 
-SRCREV_machine_qemuarm ?= "dfbba772cbee84125ac1558c904a7dc181445f5f"
-SRCREV_machine_qemumips ?= "0e0c67635b74199d534f75500e5c1654a1219bc6"
-SRCREV_machine_qemuppc ?= "92de4e2f3c6b397c8b363e079cc4d5e9bcadf877"
-SRCREV_machine_qemux86 ?= "8ada1bb97415fe959a57a08504be4eb8a656ed30"
-SRCREV_machine_qemux86-64 ?= "4ca7e2c5d42e755e1b4c3e1478128f047a8ed2a8"
-SRCREV_machine ?= "01e948c2bdf7f5ad9f2b30047a8d3493a1a2880a"
-SRCREV_meta ?= "b14a08f5c7b469a5077c10942f4e1aec171faa9d"
+SRCREV_machine_qemuarm ?= "ba47a1cc9bb6ad576b2ac7adb3036bcfa569fe2e"
+SRCREV_machine_qemumips ?= "3b2fd654392a2f33aed12748548c04e9b169591b"
+SRCREV_machine_qemuppc ?= "cf3e188cf2a18c48a0e6f9ca54c36e6ac39512ec"
+SRCREV_machine_qemux86 ?= "46f1007ad22b6790224c66a8dc4e80fdbd21eea1"
+SRCREV_machine_qemux86-64 ?= "00e5ec2393bada6723bd9a07ded3d001c02fa727"
+SRCREV_machine ?= "f4f8ba730e7783e09413872414d0a17c142c816d"
+SRCREV_meta ?= "6b3d4e09aa2531e9649f3f03827b7efbccfcec03"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4



