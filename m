Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.36702.1606144038537265324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: LTeVRYxUvDpdLIdNTAUmZ6gbiBNJzOl/HmU2jqm3SPJ0lMUJbhhsj7l9EO5fBwz/Qc1cO0PdRm
 NxsDfOkveVCw==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="235920696"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="235920696"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:19 -0800
IronPort-SDR: y2oF7DrKdcVUXN8fFsQyVsepw8oxNoJGejcIo2umDGiERmfoN/38TeZmetaP5GrEQcerYfIs3d
 QGGzzJjyDXiw==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="361475189"
Received: from kpteh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.244.15])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:17 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 11/21] linux-yocto/5.8: update to v5.8.18
Date: Mon, 23 Nov 2020 23:06:41 +0800
Message-Id: <ba9858ac4397958b0e693b687622923266c951c7.1606111370.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606111370.git.anuj.mittal@intel.com>
References: <cover.1606111370.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.8 to the latest korg -stable release that comprises
the following commits:

    ab435ce49bd1 Linux 5.8.18
    4a5649e0d379 phy: marvell: comphy: Convert internal SMCC firmware return codes to errno
    b8049438969b misc: rtsx: do not setting OC_POWER_DOWN reg in rtsx_pci_init_ocp()
    ad9ee9ce9d68 openrisc: Fix issue with get_user for 64-bit values
    f594998331bc xen/gntdev.c: Mark pages as dirty
    67e326e4f5df ata: sata_rcar: Fix DMA boundary mask
    f6b94060a123 PM: runtime: Fix timer_expires data type on 32-bit arches
    53faca2f4ca3 serial: pl011: Fix lockdep splat when handling magic-sysrq interrupt
    e3f6c126a3f7 serial: qcom_geni_serial: To correct QUP Version detection logic
    8f924c0a5665 drm/i915/gem: Serialise debugfs i915_gem_objects with ctx->mutex
    241bd102e337 mtd: lpddr: Fix bad logic in print_drs_error
    5868beda60c8 RDMA/addr: Fix race with netevent_callback()/rdma_addr_cancel()
    a8069b80a1fb cxl: Rework error message for incompatible slots
    9f9dc704c8cd p54: avoid accessing the data mapped to streaming DMA
    9f4ef6a90c1b evm: Check size of security.evm before using it
    a42b1273af73 bpf: Fix comment for helper bpf_current_task_under_cgroup()
    07d54b8dc56e fuse: fix page dereference after free
    78453a7dbb1a ata: ahci: mvebu: Make SATA PHY optional for Armada 3720
    4752a1313463 PCI: aardvark: Fix initialization with old Marvell's Arm Trusted Firmware
    b9cc04b049d8 x86/xen: disable Firmware First mode for correctable memory errors
    ea4e8cf5072e x86/traps: Fix #DE Oops message regression
    085f6be2fe88 arch/x86/amd/ibs: Fix re-arming IBS Fetch
    b4818cfc3f9c erofs: avoid duplicated permission check for "trusted." xattrs
    3a9e7db9a40e net: protect tcf_block_unbind with block lock
    af5d5b8afd12 tipc: fix memory leak caused by tipc_buf_append()
    519366f64c27 tcp: Prevent low rmem stalls with SO_RCVLOWAT.
    9ceecfdba701 ravb: Fix bit fields checking in ravb_hwtstamp_get()
    fa67cc69a8c8 r8169: fix issue with forced threading in combination with shared interrupts
    62d9cec6f928 net/sched: act_mpls: Add softdep on mpls_gso.ko
    2bc5d5c373ef net: ipa: command payloads already mapped
    1336d288b353 net: hns3: Clear the CMDQ registers before unmapping BAR region
    7fb8fbceb0e3 netem: fix zero division in tabledist
    25259932e1bb mlxsw: core: Fix memory leak on module removal
    d6f6e3f97885 ibmvnic: fix ibmvnic_set_mac
    4606d3512043 ibmveth: Fix use of ibmveth in a bridge.
    b520e574fdbf gtp: fix an use-before-init in gtp_newlink()
    9921e777a347 cxgb4: set up filter action after rewrites
    b97638e0f3be chelsio/chtls: fix tls record info to user
    eb592f2ae478 chelsio/chtls: fix memory leaks in CPL handlers
    c3208dec446a chelsio/chtls: fix deadlock issue
    b334112f20b7 bnxt_en: Send HWRM_FUNC_RESET fw command unconditionally.
    f739fc7e1072 bnxt_en: Re-write PCI BARs after PCI fatal error.
    7fe9514cfe68 bnxt_en: Invoke cancel_delayed_work_sync() for PFs also.
    bfbbfb501e74 bnxt_en: Fix regression in workqueue cleanup logic in bnxt_remove_one().
    0b17de4d67bf bnxt_en: Check abort error state in bnxt_open_nic().
    c328793e21fb efivarfs: Replace invalid slashes with exclamation marks in dentries.
    61ececc85274 x86/copy_mc: Introduce copy_mc_enhanced_fast_string()
    a092869e0351 x86, powerpc: Rename memcpy_mcsafe() to copy_mc_to_{user, kernel}()
    18703f749e99 x86/PCI: Fix intel_mid_pci.c build error when ACPI is not enabled
    4b0a9591dd78 arm64: link with -z norelro regardless of CONFIG_RELOCATABLE
    dfaa0f7d0832 arm64: Run ARCH_WORKAROUND_2 enabling code on all CPUs
    0ccd5c2c60e0 arm64: Run ARCH_WORKAROUND_1 enabling code on all CPUs
    4720b25e4ca3 fs/kernel_read_file: Remove FIRMWARE_EFI_EMBEDDED enum
    8b23af0ef2f7 efi/arm64: libstub: Deal gracefully with EFI_RNG_PROTOCOL failure
    865013fcf4c3 scripts/setlocalversion: make git describe output more reliable
    6f4c9772e195 io_uring: Convert advanced XArray uses to the normal API
    f7b24bee5e6e io_uring: Fix XArray usage in io_uring_add_task_file
    efce965a49f1 io_uring: Fix use of XArray in __io_uring_files_cancel
    5ee3fea0c227 io_uring: no need to call xa_destroy() on empty xarray
    0ca6ce23f4f6 io-wq: fix use-after-free in io_wq_worker_running
    4863be653425 io_wq: Make io_wqe::lock a raw_spinlock_t
    b6a6d1df552b io_uring: reference ->nsproxy for file table commands
    511abceaf0a0 io_uring: don't rely on weak ->files references
    fdc84c9bf131 io_uring: enable task/files specific overflow flushing
    3de61f9bcc1c io_uring: return cancelation status from poll/timeout/files handlers
    f34e674fbe6d io_uring: unconditionally grab req->task
    bf0305989241 io_uring: stash ctx task reference for SQPOLL
    dd1acc182c85 io_uring: move dropping of files into separate helper
    cecf78cc0890 io_uring: allow timeout/poll/files killing to take task into account
    07463d7da999 io_uring: don't run task work on an exiting task
    6e1f770fbc0a netfilter: nftables_offload: KASAN slab-out-of-bounds Read in nft_flow_rule_create

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8c81b83bfe7cb870eb12c93d0793cad27d1de162)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index d0f3ecb8c8..203ddf6684 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_meta ?= "d5ca337b7e9b5834c83b629b5456bb4744efa644"
+SRCREV_machine ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.8.17"
+LINUX_VERSION ?= "5.8.18"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 536bc26c5e..f37f525cc3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.8.17"
+LINUX_VERSION ?= "5.8.18"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "c548e45d83f9cdf224d2a7e318d68aecf390f3bd"
-SRCREV_machine ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_meta ?= "d5ca337b7e9b5834c83b629b5456bb4744efa644"
+SRCREV_machine_qemuarm ?= "aa614dcf182db126013b255968ab125afd96eb88"
+SRCREV_machine ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index c468170968..c0cdffce73 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "3bb879f7650c06b97ee4d4b496d33bb5d62a4679"
-SRCREV_machine_qemuarm64 ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_machine_qemumips ?= "6dd61d0707b17293a472f5717acb68d5a86e1e4d"
-SRCREV_machine_qemuppc ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_machine_qemuriscv64 ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_machine_qemux86 ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_machine_qemux86-64 ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_machine_qemumips64 ?= "a92b9df163d6e6b05bf1e7137d6868760537f326"
-SRCREV_machine ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_meta ?= "d5ca337b7e9b5834c83b629b5456bb4744efa644"
+SRCREV_machine_qemuarm ?= "cd6c8c74317d2f9504c25e28e37f4140deec2d19"
+SRCREV_machine_qemuarm64 ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_machine_qemumips ?= "c610a204d0821f5abc253e72894fd32b41b92db3"
+SRCREV_machine_qemuppc ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_machine_qemuriscv64 ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_machine_qemux86 ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_machine_qemux86-64 ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_machine_qemumips64 ?= "86cc0d9a3f6751ada12fa4630b3e3c23221d6da7"
+SRCREV_machine ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.8.17"
+LINUX_VERSION ?= "5.8.18"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.28.0

