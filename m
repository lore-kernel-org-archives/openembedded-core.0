Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D284577A4F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:58:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2SCwCFh012474
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 28 Mar 2017 05:58:12 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 28 Mar 2017 05:58:11 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 28 Mar 2017 08:58:05 -0400
Message-ID: <6802db81006c09f3a041f133cb63a800caeb5171.1490705726.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1490705726.git.bruce.ashfield@windriver.com>
References: <cover.1490705726.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/4.4: update to v4.4.56
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
X-List-Received-Date: Tue, 28 Mar 2017 12:58:12 -0000
Content-Type: text/plain

Integrating the korg release with the following shortlog:

   0136bca4e0f6 Linux 4.4.56
   99d403faba47 futex: Add missing error handling to FUTEX_REQUEUE_PI
   44854c191e2c futex: Fix potential use-after-free in FUTEX_REQUEUE_PI
   62f57041fbdf x86/perf: Fix CR4.PCE propagation to use active_mm instead of mm
   8e0ec20539f8 x86/kasan: Fix boot with KASAN=y and PROFILE_ANNOTATED_BRANCHES=y
   3a19419c50c6 fscrypto: lock inode while setting encryption policy
   fd74e8d258da fscrypt: fix renaming and linking special files
   c10ffe988f15 net sched actions: decrement module reference count after table flush.
   676fe978525d dccp: fix memory leak during tear-down of unsuccessful connection request
   4ab956b56133 dccp/tcp: fix routing redirect race
   56f9b9502f2d bridge: drop netfilter fake rtable unconditionally
   aed728c38c48 ipv6: avoid write to a possibly cloned skb
   5f8bc3856e28 ipv6: make ECMP route replacement less greedy
   b57955ea30e1 mpls: Send route delete notifications when router module is unloaded
   710fbeb3f5c5 act_connmark: avoid crashing on malformed nlattrs with null parms
   6c72458ab428 uapi: fix linux/packet_diag.h userspace compilation error
   e671f1cc588f vrf: Fix use-after-free in vrf_xmit
   d0ebde92fbeb dccp: fix use-after-free in dccp_feat_activate_values
   ec4d8692b76e net: fix socket refcounting in skb_complete_tx_timestamp()
   9e7683301bee net: fix socket refcounting in skb_complete_wifi_ack()
   2681a7853ad7 tcp: fix various issues for sockets morphing to listen state
   9216632bf4a0 dccp: Unlock sock before calling sk_free()
   a70c32859704 net: net_enable_timestamp() can be called from irq contexts
   f331d6445a3e net: don't call strlen() on the user buffer in packet_bind_spkt()
   2cd0afc64e33 l2tp: avoid use-after-free caused by l2tp_ip_backlog_recv
   354f79125f12 ipv4: mask tos for input route
   f1b3aae1f1bf vti6: return GRE_KEY for vti6
   51a219a1371e vxlan: correctly validate VXLAN ID against VXLAN_N_VID
   0c0be310ba29 netlink: remove mmapped netlink support
   28ec98bc2e4a Linux 4.4.55
   1c5265be54d3 ext4: don't BUG when truncating encrypted inodes on the orphan list
   cd8ad4d9eb6d dm: flush queued bios when process blocks to avoid deadlock
   66dd58f56eab nfit, libnvdimm: fix interleave set cookie calculation
   a084aeef5633 s390/kdump: Use "LINUX" ELF note name instead of "CORE"
   b0e85701a776 KVM: s390: Fix guest migration for huge guests resulting in panic
   61fbad6a28fd mvsas: fix misleading indentation
   72ca0ab30680 serial: samsung: Continue to work if DMA request fails
   72bb2b96b856 USB: serial: io_ti: fix information leak in completion handler
   e71c7bad6844 USB: serial: io_ti: fix NULL-deref in interrupt callback
   6498086195b9 USB: iowarrior: fix NULL-deref in write
   179295c38d23 USB: iowarrior: fix NULL-deref at probe
   54f11a9662b6 USB: serial: omninet: fix reference leaks at open
   3cdc94638746 USB: serial: safe_serial: fix information leak in completion handler
   cf09c7d60ccc usb: host: xhci-plat: Fix timeout on removal of hot pluggable xhci controllers
   40c5634ffe3d usb: host: xhci-dbg: HCIVERSION should be a binary number
   4a1a3bb70fb4 usb: gadget: function: f_fs: pass companion descriptor along
   10af24856503 usb: dwc3: gadget: make Set Endpoint Configuration macros safe
   f47b97f2cdaa usb: gadget: dummy_hcd: clear usb_gadget region before registration
   2ca39d130015 powerpc: Emulation support for load/store instructions on LE
   074893495b72 tracing: Add #undef to fix compile error
   127651058594 MIPS: Netlogic: Fix CP0_EBASE redefinition warnings
   2e4aff2405af MIPS: DEC: Avoid la pseudo-instruction in delay slots
   5fad17434465 mm: memcontrol: avoid unused function warning
   5e45d834f762 cpmac: remove hopeless #warning
   32883383f5e0 MIPS: ralink: Remove unused rt*_wdt_reset functions
   4b91e7a2a9a7 MIPS: ralink: Cosmetic change to prom_init().
   3dc8f1e3a8f2 mtd: pmcmsp: use kstrndup instead of kmalloc+strncpy
   d2a8d746ae95 MIPS: Update lemote2f_defconfig for CPU_FREQ_STAT change
   c018595d83a3 MIPS: ip22: Fix ip28 build for modern gcc
   7a6a965f350e MIPS: Update ip27_defconfig for SCSI_DH change
   8ed0fdcc0c11 MIPS: ip27: Disable qlge driver in defconfig
   adc48c710b7e MIPS: Update defconfigs for NF_CT_PROTO_DCCP/UDPLITE change
   e041ad066440 crypto: improve gcc optimization flags for serpent and wp512
   a8cb5c02a20f USB: serial: digi_acceleport: fix OOB-event processing
   4d95645f3dd5 USB: serial: digi_acceleport: fix OOB data sanity check

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 390b0b72c137..278a900c16b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "15a97653eb794367a2b12bfeaf68f0104f8213e3"
-SRCREV_meta ?= "864bc5736aa58c510713e7b76d205d5341377972"
+SRCREV_machine ?= "95f418b97f423e43d144884dc0bd6de207752ad0"
+SRCREV_meta ?= "271b0c8d5128f0cb18ed413cc59f683132ff8e3f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.53"
+LINUX_VERSION ?= "4.4.56"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 35cc2b1b7a56..fcc7e0438c74 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.53"
+LINUX_VERSION ?= "4.4.56"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "cebe1ad56aebd89e0de29412e19433fb441bf13c"
-SRCREV_meta ?= "864bc5736aa58c510713e7b76d205d5341377972"
+SRCREV_machine ?= "2525fc844188708834929d119cecdc2f6ae3c88a"
+SRCREV_meta ?= "271b0c8d5128f0cb18ed413cc59f683132ff8e3f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 70c3beecb3aa..e3153a783a5e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "96c11ef2a20975febadc839abaae3127731de642"
-SRCREV_machine_qemuarm64 ?= "cebe1ad56aebd89e0de29412e19433fb441bf13c"
-SRCREV_machine_qemumips ?= "e22a4ddcb6472ae6f258c16af1b38e8e5866c5eb"
-SRCREV_machine_qemuppc ?= "cebe1ad56aebd89e0de29412e19433fb441bf13c"
-SRCREV_machine_qemux86 ?= "cebe1ad56aebd89e0de29412e19433fb441bf13c"
-SRCREV_machine_qemux86-64 ?= "cebe1ad56aebd89e0de29412e19433fb441bf13c"
-SRCREV_machine_qemumips64 ?= "ca07238310e9ef502adbb1416e9f327657886343"
-SRCREV_machine ?= "cebe1ad56aebd89e0de29412e19433fb441bf13c"
-SRCREV_meta ?= "864bc5736aa58c510713e7b76d205d5341377972"
+SRCREV_machine_qemuarm ?= "01aaede0a243457a3557167d40488d89335d9e73"
+SRCREV_machine_qemuarm64 ?= "2525fc844188708834929d119cecdc2f6ae3c88a"
+SRCREV_machine_qemumips ?= "c7ac6707736e0e7b93d93428d805df356a9f3888"
+SRCREV_machine_qemuppc ?= "2525fc844188708834929d119cecdc2f6ae3c88a"
+SRCREV_machine_qemux86 ?= "2525fc844188708834929d119cecdc2f6ae3c88a"
+SRCREV_machine_qemux86-64 ?= "2525fc844188708834929d119cecdc2f6ae3c88a"
+SRCREV_machine_qemumips64 ?= "6af68e1545ba85755591a1495c6d34b29ac61406"
+SRCREV_machine ?= "2525fc844188708834929d119cecdc2f6ae3c88a"
+SRCREV_meta ?= "271b0c8d5128f0cb18ed413cc59f683132ff8e3f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.53"
+LINUX_VERSION ?= "4.4.56"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


