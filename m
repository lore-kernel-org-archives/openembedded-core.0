Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCCB462135
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 15:35:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9LFZX0U030011
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 21 Oct 2016 08:35:33 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 21 Oct 2016 08:35:32 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 21 Oct 2016 11:35:31 -0400
Message-ID: <1477064131-24205-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] linux-yocto/4.8: update to v4.8.3
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
X-List-Received-Date: Fri, 21 Oct 2016 15:35:38 -0000
Content-Type: text/plain

Integrating the korg -stable release

One commit of note is the fix for CVE-2016-5195 (http://dirtycow.ninja/):

 mm: remove gup_flags FOLL_WRITE games from __get_user_pages()

The remaining changes are covered by the following shortlog export:

   mm: remove gup_flags FOLL_WRITE games from __get_user_pages()
   Make __xfs_xattr_put_listen preperly report errors.
   scsi: configure runtime pm before calling device_add in scsi_add_host_with_dma
   v4l: rcar-fcp: Don't force users to check for disabled FCP support
   Linux 4.8.2
   tpm_crb: fix crb_req_canceled behavior
   tpm: fix a race condition in tpm2_unseal_trusted()
   ima: use file_dentry()
   Bluetooth: Add a new 04ca:3011 QCA_ROME device
   ARM: cpuidle: Fix error return code
   ARM: dts: MSM8660 remove flags from SPMI/MPP IRQs
   ARM: dts: MSM8064 remove flags from SPMI/MPP IRQs
   ARM: dts: mvebu: armada-390: add missing compatibility string and bracket
   ARM: fix delays
   x86/dumpstack: Fix x86_32 kernel_stack_pointer() previous stack access
   x86/mm/pkeys: Do not skip PKRU register if debug registers are not used
   arch/x86: Handle non enumerated CPU after physical hotplug
   x86/apic: Get rid of apic_version[] array
   x86/platform/intel-mid: Keep SRAM powered on at boot
   x86/platform/intel-mid: Add Intel Penwell to ID table
   x86/cpu: Rename Merrifield2 to Moorefield
   x86/pkeys: Make protection keys an "eager" feature
   x86/irq: Prevent force migration of irqs which are not in the vector domain
   x86/boot: Fix kdump, cleanup aborted E820_PRAM max_pfn manipulation
   arm64: fix dump_backtrace/unwind_frame with NULL tsk
   KVM: PPC: BookE: Fix a sanity check
   KVM: arm/arm64: vgic: Don't flush/sync without a working vgic
   KVM: arm64: Require in-kernel irqchip for PMU support
   KVM: MIPS: Drop other CPU ASIDs on guest MMU changes
   KVM: PPC: Book3s PR: Allow access to unprivileged MMCR2 register
   xen/x86: Update topology map for PV VCPUs
   mfd: wm8350-i2c: Make sure the i2c regmap functions are compiled
   mfd: 88pm80x: Double shifting bug in suspend/resume
   mfd: atmel-hlcdc: Do not sleep in atomic context
   mfd: rtsx_usb: Avoid setting ucr->current_sg.status
   ALSA: usb-line6: use the same declaration as definition in header for MIDI manufacturer ID
   ALSA: usb-audio: Extend DragonFly dB scale quirk to cover other variants
   ALSA: ali5451: Fix out-of-bound position reporting
   phy: sun4i-usb: Use spinlock to guard phyctl register access
   usb: dwc3: fix Clear Stall EP command failure
   timekeeping: Fix __ktime_get_fast_ns() regression
   usb: storage: fix runtime pm issue in usb_stor_probe2
   Linux 4.8.1
   ALSA: hda - Add the top speaker pin config for HP Spectre x360
   ALSA: hda - Fix headset mic detection problem for several Dell laptops
   ALSA: hda - Adding one more ALC255 pin definition for headset problem
   Revert "usbtmc: convert to devm_kzalloc"
   USB: serial: cp210x: Add ID for a Juniper console
   usb: usbip: vudc: fix left shift overflow
   Staging: fbtft: Fix bug in fbtft-core
   usb: misc: legousbtower: Fix NULL pointer deference
   Using BUG_ON() as an assert() is _never_ acceptable
   arm64: debug: avoid resetting stepping state machine when TIF_SINGLESTEP
   Using BUG_ON() as an assert() is _never_ acceptable

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---

Josh suggested that I highlight the dirtycow CVE fix, so I've spun a v2
patch for this update that has much more information.

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index fc1c40caf7b2..00c3d2c7bc1f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b266f7ba78f0cb3d7073e1bf7bd7dfc92bec7431"
-SRCREV_meta ?= "552a83790b1797b6dd4e4c48ff5bc8f215ed57da"
+SRCREV_machine ?= "320bceb35315d118c1e209effd441eb8a8dbad57"
+SRCREV_meta ?= "6d028d2818603cd82cfb707b3231b8a9038f13bb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8"
+LINUX_VERSION ?= "4.8.3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 41ff5637ec59..799c3f37577d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.8"
+LINUX_VERSION ?= "4.8.3"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
-SRCREV_meta ?= "552a83790b1797b6dd4e4c48ff5bc8f215ed57da"
+SRCREV_machine ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
+SRCREV_meta ?= "6d028d2818603cd82cfb707b3231b8a9038f13bb"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index 5738f4974b9b..56fbfc7001bf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "f46e49344b4c66a6f0917c5a2e9a1d146176519d"
-SRCREV_machine_qemuarm64 ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
-SRCREV_machine_qemumips ?= "5a299402ae58d61429ab091f94748550efe45858"
-SRCREV_machine_qemuppc ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
-SRCREV_machine_qemux86 ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
-SRCREV_machine_qemux86-64 ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
-SRCREV_machine_qemumips64 ?= "674818dad577cdfc23c6c857aa2b769fc64e379c"
-SRCREV_machine ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
-SRCREV_meta ?= "552a83790b1797b6dd4e4c48ff5bc8f215ed57da"
+SRCREV_machine_qemuarm ?= "4cc544ad09ad704322cb66fe4ba197a6a05dc71f"
+SRCREV_machine_qemuarm64 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
+SRCREV_machine_qemumips ?= "c285969d4f9376a671167ecf397578c8ad3e6a75"
+SRCREV_machine_qemuppc ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
+SRCREV_machine_qemux86 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
+SRCREV_machine_qemux86-64 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
+SRCREV_machine_qemumips64 ?= "64f96ba530e58456070f26b0f3fcce3f64988b72"
+SRCREV_machine ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
+SRCREV_meta ?= "6d028d2818603cd82cfb707b3231b8a9038f13bb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8"
+LINUX_VERSION ?= "4.8.3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


