Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 16A16728CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 19:09:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4LJ93RK010774
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 May 2015 12:09:03 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 21 May 2015 12:09:02 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 21 May 2015 15:08:57 -0400
Message-ID: <956b9a1c7e1876e13bda383889664f76a63065c5.1432235097.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1432235097.git.bruce.ashfield@windriver.com>
References: <cover.1432235097.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto/3.19: NFC config, Braswell fixes and axxia support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 May 2015 19:09:03 -0000
Content-Type: text/plain

Updating the 3.19 kernel SRCREVs for the following commits:

NFC:

   727cfce45077 meta: intel-common: enable generic NFC support
   f3e890065903 meta: features/nfc: add generic configuration for NFC support

Braswell:

   d3c0b958e688 drm/i915: New offset for reading frequencies on CHV.
   dac6babbba62 drm/i915/chv: Populate total EU count on Cherryview

Axxia:

   c706cb356dea arch/arm/axxia: Remove the axxia zImage.fm build
   45a1aaacf6cb drivers/hwmon: Remove adt75 redundant driver
   7203ee166c01 arch/arm/mach-axxia: Fixed L2 power up failure
   a1541e9f0a4c kernel/irq/manage.c: Fix irq_set_affinity to allow use with buslocks
   d42c0bd1c8be arch/arm/mach-axxia: Reverse checkpatch compatibility
   5dbd07431a7a arch/arm/mach-axxia: changed affinity parameter to cpu
   23e4ebc66acb char: hwrng: AXXIA TRNG driver added for AXM55xx
   61eb3c8ee1d7 arch/arm/mach-axxia: Updated Axxia 55xx PCIe driver to use correct Doorbell interrupt IRQs
   b03e0655094a AXM55xx RapidIO : Added support for Device revision and link down Monitor.
   7577ad26cf73 rionet: Fix the corruption of tx_cnt during Transmit.
   07fd2163ae56 arch/arm/mach-axxia: fixed NO SMP
   c9371e98cc80 arch/arm/mach-axxia: fixed compiler warning
   0a814fe7e747 arch/arm/mach-axxia: Updated PCIe driver doorbell support
   cd3d9b46bea4 misc: lsi-ncr: Only use AMP lock on PPC platforms.
   826c600c6ad6 fs: vmfs: Use generic mmap function
   e2d0047cb106 arch/arm/mach-axxia: Removed axxia_circular_queue
   f1ff06eaabed ARM: axxia: Add cluster and L2 power off in hotplug
   b98711344263 ARM: irq: Return error when set_affinity is called from hotplug
   9fd9306a30ae arch/arm/mach-axxia: Enable L3
   68989d446582 Revert "arch/arm/mach-axxia: Fixed affinity error on IRQ migration"
   0be0ef90a887 Revert "arch/arm/mach-axxia: fixed failure to power up cluster"
   1c6522a03e81 Revert "arch/arm/mach-axxia: fixed hang in preempt kernel"
   ef06a68393a3 fs/vmfs: Changes to add VMFS support for axxia.
   3025e9deede6 drivers/usb/host: Changes to support the axxia BSP
   b128b4f0d4e8 drivers/tty: Changes to support the axxia BSP
   d1b60a7e62ef drivers/hwmon: Changes made to support the axxia BSP
   2899ccbf1438 drivers/spi: Changes to support the axxia BSP
   8e9cff566254 drivers/rapidio/devices: Changes to support axxia BSP
   3424d2ca2653 drivers/net/ethernet: Changes to support the axxia BSP
   2353dc816d6b drivers/mtd: Changes to support the axxia BSP
   4b5fa2bf86cf drivers/misc: Changes made to support axxia BSP
   8a5bd53ec241 drivers/i2c: Changes to support axxia BSP
   02bfe1548d1a arch/arm/drivers/edac: Changes to support axxia BSP
   2431db7c0c90 arch/arm/drivers/dma: Changes to support the axxia BSP
   61fa3f268d5c arch/arm: arm changes to support the axxia BSP
   22e0fb7be665 arch/arm/mach-axxia: add power management support
   5cab63c5a1f2 arch/arm/mach-axxia: kernel files to support the mach-axxia
   1336aba51616 arch/arm/boot: Changes to support the axxia BSP
   97324fa920cb arch/arm/boot/dts: Files added to support axxia 5500 board

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 18 +++++++++---------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
index bb567d67a3fd..777aa60b14c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "3.19.5"
 KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a3f6f39fc369dba2816908bc1b324e0170aaa27d"
-SRCREV_meta ?= "44879ee54dce8e11695dcb476d1b178a48a71f6a"
+SRCREV_machine ?= "d3c0b958e68824c7037005e2a84e5661ba98d5b0"
+SRCREV_meta ?= "727cfce45077a1f73f1dbc42e8093fde0c5e36a7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index 8d8a8c5901d1..975b3afbf1d1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "97428dbb2231f8a715de9db66f3c2358e4927716"
-SRCREV_machine_qemuarm64 ?= "a3f6f39fc369dba2816908bc1b324e0170aaa27d"
-SRCREV_machine_qemumips ?= "a4573b23f8fa35a6e93131fac2f1c0f1d5115fea"
-SRCREV_machine_qemuppc ?= "8bbd8a1369c773dbe8bed27b613aa4b7dd175670"
-SRCREV_machine_qemux86 ?= "a3f6f39fc369dba2816908bc1b324e0170aaa27d"
-SRCREV_machine_qemux86-64 ?= "a3f6f39fc369dba2816908bc1b324e0170aaa27d"
-SRCREV_machine_qemumips64 ?= "62681c2cfa32bee03aee368b704228bc91c2483f"
-SRCREV_machine ?= "a3f6f39fc369dba2816908bc1b324e0170aaa27d"
-SRCREV_meta ?= "44879ee54dce8e11695dcb476d1b178a48a71f6a"
+SRCREV_machine_qemuarm ?= "e5aa4ad4249e079b8459a90b4ffa50d04b474458"
+SRCREV_machine_qemuarm64 ?= "d3c0b958e68824c7037005e2a84e5661ba98d5b0"
+SRCREV_machine_qemumips ?= "3b8cc925c5312b37cb824dfe58c2a4dcbb2b9732"
+SRCREV_machine_qemuppc ?= "4ac61cf97719f01c5cb226881956e77624fb534c"
+SRCREV_machine_qemux86 ?= "d3c0b958e68824c7037005e2a84e5661ba98d5b0"
+SRCREV_machine_qemux86-64 ?= "d3c0b958e68824c7037005e2a84e5661ba98d5b0"
+SRCREV_machine_qemumips64 ?= "f5bf944a0edde0e379af4296917d33a562e6586b"
+SRCREV_machine ?= "d3c0b958e68824c7037005e2a84e5661ba98d5b0"
+SRCREV_meta ?= "727cfce45077a1f73f1dbc42e8093fde0c5e36a7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
2.1.0


