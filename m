Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: TRmpLWNUJlu7iaicOjrcZ+WmMdhaH46BD2RLbU2zyKY3U23llKc+pe9skkhiNQOghbjSJNyD7e
 +o1LLpaNSulQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794760"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794760"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:12 -0700
IronPort-SDR: tSecyoHZ/1/lHHMGNxJhKItoAo0WxNi90/fmV+xf0Z28BAGkOMgPJdgo96dhK+H1rQVGg5fuEh
 e2QAVl5dI9Ew==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331615"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:11 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 16/31] linux-yocto/5.10: update to v5.10.34
Date: Fri,  7 May 2021 15:02:28 +0800
Message-Id: <5d5e21cfb052618d3a3dec2fd0b2bf74473755be.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    0aa66717f684 Linux 5.10.34
    47d54b990103 mei: me: add Alder Lake P device id.
    2a442f11407e iwlwifi: Fix softirq/hardirq disabling in iwl_pcie_gen2_enqueue_hcmd()
    8bd8301ccc11 Linux 5.10.33
    8a661bad6cee USB: CDC-ACM: fix poison/unpoison imbalance
    90642ee9eb58 net: hso: fix NULL-deref on disconnect regression
    31720f9e87c0 x86/crash: Fix crash_setup_memmap_entries() out-of-bounds access
    bed21bed2e79 ia64: tools: remove duplicate definition of ia64_mf() on ia64
    ba0910ad1c57 ia64: fix discontig.c section mismatches
    f4a777bcc8d1 csky: change a Kconfig symbol name to fix e1000 build error
    393200a1b095 kasan: fix hwasan build for gcc
    f2b46286e326 cavium/liquidio: Fix duplicate argument
    1bfefd866195 xen-netback: Check for hotplug-status existence before watching
    509ae27a1874 arm64: kprobes: Restore local irqflag if kprobes is cancelled
    da99331fc6ce s390/entry: save the caller of psw_idle
    d33031a894d2 dmaengine: tegra20: Fix runtime PM imbalance on error
    66d0cf7dcaa1 net: geneve: check skb is large enough for IPv4/IPv6 header
    6ce64437224d ARM: dts: Fix swapped mmc order for omap3
    db010ba54a96 dmaengine: xilinx: dpdma: Fix race condition in done IRQ
    e8d9a93ec46e dmaengine: xilinx: dpdma: Fix descriptor issuing on video group
    eb2c81ee764d soc: qcom: geni: shield geni_icc_get() for ACPI boot
    8c4bfe30eb55 HID: wacom: Assign boolean values to a bool variable
    e913cbc952c3 HID cp2112: fix support for multiple gpiochips
    f691dc86411d HID: alps: fix error return code in alps_input_configured()
    079e32723f78 HID: google: add don USB id
    ffe249b4fc2c perf map: Fix error return code in maps__clone()
    4d0cfb3713bc perf auxtrace: Fix potential NULL pointer dereference
    ab112cc573cc perf/x86/kvm: Fix Broadwell Xeon stepping in isolation_ucodes[]
    6f8315e5d951 perf/x86/intel/uncore: Remove uncore extra PCI dev HSWEP_PCI_PCU_3
    82fa9ced35d8 locking/qrwlock: Fix ordering in queued_write_lock_slowpath()
    b642e493a9a0 bpf: Tighten speculative pointer arithmetic mask
    2982ea926b5c bpf: Refactor and streamline bounds check into helper
    f3c4b01689d3 bpf: Allow variable-offset stack access
    f79efcb0075a bpf: Permits pointers on stack for helper calls
    edc5d1601389 arm64: dts: allwinner: Revert SD card CD GPIO for Pine64-LTS
    83d93d05376a pinctrl: core: Show pin numbers for the controllers with base = 0
    fc2454cc0c4b block: return -EBUSY when there are open partitions in blkdev_reread_part
    2bbd8aafde36 pinctrl: lewisburg: Update number of pins in community
    a8cd07e4400d vdpa/mlx5: Set err = -ENOMEM in case dma_map_sg_attrs fails
    bf84ef2dd2cc KEYS: trusted: Fix TPM reservation for seal/unseal
    9857fccd653c gpio: omap: Save and restore sysconfig
    71777492b745 vhost-vdpa: protect concurrent access to vhost device iotlb

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2cfc4489c14f8d1ec2c6fc2aa411d158058f5aea)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 6b6b7ac785..bbac0d0336 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9a09bd7febd325064c9f291ebcda2186fa514884"
-SRCREV_meta ?= "6eb23a018005ebef5a4265738f2643deedaba4e2"
+SRCREV_machine ?= "400fbf5b14a0c88afb7c31d65be56fb9d6214c81"
+SRCREV_meta ?= "bca3bfbc7473963f53aeefa74cb7a6e60b50831f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.32"
+LINUX_VERSION ?= "5.10.34"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index df76483244..f08dc68a6e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.32"
+LINUX_VERSION ?= "5.10.34"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "2524b7aa4cdc2185862648c257c8774628d87226"
-SRCREV_machine ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
-SRCREV_meta ?= "6eb23a018005ebef5a4265738f2643deedaba4e2"
+SRCREV_machine_qemuarm ?= "bf33b78f5136873b6d2ec6274908cf688341bc9e"
+SRCREV_machine ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
+SRCREV_meta ?= "bca3bfbc7473963f53aeefa74cb7a6e60b50831f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index cdc3fd1cdd..d26f02283f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "058fd44194d6c2a83506870bae3aca31c7f8be29"
-SRCREV_machine_qemuarm64 ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
-SRCREV_machine_qemumips ?= "c723ea1bc1fa3fd81f3e0ae2ba030898c40f7548"
-SRCREV_machine_qemuppc ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
-SRCREV_machine_qemuriscv64 ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
-SRCREV_machine_qemuriscv32 ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
-SRCREV_machine_qemux86 ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
-SRCREV_machine_qemux86-64 ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
-SRCREV_machine_qemumips64 ?= "9c9b0edd160d0bbef687e574f2975fc54cf46843"
-SRCREV_machine ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
-SRCREV_meta ?= "6eb23a018005ebef5a4265738f2643deedaba4e2"
+SRCREV_machine_qemuarm ?= "78e8e722eec4434024c5db3e0d59da0b128c7647"
+SRCREV_machine_qemuarm64 ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
+SRCREV_machine_qemumips ?= "b5c0852a90709e77f7a3d185d1745e6a1f66b77c"
+SRCREV_machine_qemuppc ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
+SRCREV_machine_qemuriscv64 ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
+SRCREV_machine_qemuriscv32 ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
+SRCREV_machine_qemux86 ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
+SRCREV_machine_qemux86-64 ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
+SRCREV_machine_qemumips64 ?= "bf264e264d2141a4fb61d515573c27935e67ecfa"
+SRCREV_machine ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
+SRCREV_meta ?= "bca3bfbc7473963f53aeefa74cb7a6e60b50831f"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.32"
+LINUX_VERSION ?= "5.10.34"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.30.2

