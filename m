Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.1007.1629822370707707263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360317"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360317"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455659003"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:57 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 17/28] linux-yocto/5.10: update to v5.10.57
Date: Wed, 25 Aug 2021 00:25:19 +0800
Message-Id: <40c1a043bf841165556a84c7389cf867da472761.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    1cd6e30b83d7 Linux 5.10.57
    9c645a020bab spi: mediatek: Fix fifo transfer
    7254e2d9eb41 selftest/bpf: Verifier tests for var-off access
    30ea1c535291 bpf, selftests: Adjust few selftest outcomes wrt unreachable code
    98bf2906d3be bpf: Update selftests to reflect new error states
    360e5b7af653 bpf, selftests: Adjust few selftest result_unpriv outcomes
    5abcd138cbd8 selftest/bpf: Adjust expected verifier errors
    83bbf953f66c selftests/bpf: Add a test for ptr_to_map_value on stack for helper access
    e2b7a4ccbf7c Revert "watchdog: iTCO_wdt: Account for rebooting on second timeout"
    1b1a00b13c34 firmware: arm_scmi: Add delayed response status check
    93ef561406a7 firmware: arm_scmi: Ensure drivers provide a probe function
    1812895f17e1 Revert "Bluetooth: Shutdown controller after workqueues are flushed or cancelled"
    cae3fa3d8165 ACPI: fix NULL pointer dereference
    98b070694f45 drm/amd/display: Fix max vstartup calculation for modes with borders
    f9d875c8c92f drm/amd/display: Fix comparison error in dcn21 DML
    91865b458edd nvme: fix nvme_setup_command metadata trace event
    06a9092f6647 efi/mokvar: Reserve the table only if it is in boot services data
    27ff30c8b3f3 ASoC: ti: j721e-evm: Check for not initialized parent_clk_id
    a00bcc5298be ASoC: ti: j721e-evm: Fix unbalanced domain activity tracking during startup
    e8b287e78381 net: Fix zero-copy head len calculation.
    c6bdf7d97d5f ASoC: rt5682: Fix the issue of garbled recording after powerd_dbus_suspend
    74b53ee4b89e qed: fix possible unpaired spin_{un}lock_bh in _qed_mcp_cmd_and_union()
    f6a2ff040b5c r8152: Fix potential PM refcount imbalance
    c98a7916cd37 ASoC: tlv320aic31xx: fix reversed bclk/wclk master bits
    03258515c9eb spi: stm32h7: fix full duplex irq handler handling
    cfb8173a23cf regulator: rt5033: Fix n_voltages settings for BUCK and LDO
    81dc9a4868a9 regulator: rtmv20: Fix wrong mask for strobe-polarity-high
    9e55b9278c47 btrfs: fix lost inode on log replay after mix of fsync, rename and inode eviction
    e2419c570986 btrfs: fix race causing unnecessary inode logging during link and rename
    118b070bf415 Revert "drm/i915: Propagate errors on awaiting already signaled fences"
    6976f3cf34a1 drm/i915: Revert "drm/i915/gem: Asynchronous cmdparser"
    9746c25334cb Linux 5.10.56
    55dd22c5d029 can: j1939: j1939_session_deactivate(): clarify lifetime of session object
    75ebe1d355b5 i40e: Add additional info to PHY type error
    2ca5ec188b20 Revert "perf map: Fix dso->nsinfo refcounting"
    c14cee5bc466 powerpc/pseries: Fix regression while building external modules
    bfc8e67c60b9 SMB3: fix readpage for large swap cache
    be561c0154dc bpf: Fix pointer arithmetic mask tightening under state pruning
    ffb9d5c48b4b bpf: verifier: Allocate idmap scratch in verifier env
    a11ca29c65c1 bpf: Remove superfluous aux sanitation on subprog rejection
    0e9280654aa4 bpf: Fix leakage due to insufficient speculative store bypass mitigation
    bea9e2fd1808 bpf: Introduce BPF nospec instruction for mitigating Spectre v4
    cd61e665a166 can: hi311x: fix a signedness bug in hi3110_cmd()
    65dfa6cb2233 sis900: Fix missing pci_disable_device() in probe and remove
    93e5bf4b2925 tulip: windbond-840: Fix missing pci_disable_device() in probe and remove
    58b8c812c764 sctp: fix return value check in __sctp_rcv_asconf_lookup
    362e9d23cf70 net/mlx5e: Fix nullptr in mlx5e_hairpin_get_mdev()
    bd744f2a2755 net/mlx5: Fix flow table chaining
    1b148bd72e50 skmsg: Make sk_psock_destroy() static
    645a1d3bef5f drm/msm/dp: Initialize the INTF_CONFIG register
    4a6841921cc8 drm/msm/dpu: Fix sm8250_mdp register length
    e6097071a4ff net: llc: fix skb_over_panic
    01f3581d4400 KVM: x86: Check the right feature bit for MSR_KVM_ASYNC_PF_ACK access
    f5f78ae5f1be mlx4: Fix missing error code in mlx4_load_one()
    51b751fc06b8 octeontx2-pf: Fix interface down flag on error
    4951ffa3fac8 tipc: do not write skb_shinfo frags when doing decrytion
    7eefa0b74f3e ionic: count csum_none when offload enabled
    60decbe01d7d ionic: fix up dim accounting for tx and rx
    a7c85a516cd0 ionic: remove intr coalesce update from napi
    6961323eed46 net: qrtr: fix memory leaks
    91350564ea8c net: Set true network header for ECN decapsulation
    a41282e82a1d tipc: fix sleeping in tipc accept routine
    10f585740cf0 tipc: fix implicit-connect for SYN+
    bb6061616211 i40e: Fix log TC creation failure when max num of queues is exceeded
    c1cc6bce1afd i40e: Fix queue-to-TC mapping on Tx
    4382cca17915 i40e: Fix firmware LLDP agent related warning
    e090ffdf0563 i40e: Fix logic of disabling queues
    cbc8012902b3 netfilter: nft_nat: allow to specify layer 4 protocol NAT only
    3dbda8483f42 netfilter: conntrack: adjust stop timestamp to real expiry value
    ac038f4152ef mac80211: fix enabling 4-address mode on a sta vif after assoc
    076bc6ebce48 bpf: Fix OOB read when printing XDP link fdinfo
    e6a06a13ec6f RDMA/bnxt_re: Fix stats counters
    c8667cb406fd cfg80211: Fix possible memory leak in function cfg80211_bss_update
    9ab284bc3530 nfc: nfcsim: fix use after free during module unload
    ea04a3b5727e blk-iocost: fix operation ordering in iocg_wake_fn()
    fc2756cce06f drm/amdgpu: Fix resource leak on probe error path
    ccc7a1bb322e drm/amdgpu: Avoid printing of stack contents on firmware load error
    63570e578094 drm/amd/display: ensure dentist display clock update finished in DCN20
    2eab387507fd NIU: fix incorrect error return, missed in previous revert
    cb71730a6312 HID: wacom: Re-enable touch by default for Cintiq 24HDT / 27QHDT
    7bca5da00539 alpha: register early reserved memory in memblock
    30e19d072ea0 can: esd_usb2: fix memory leak
    88b40258162b can: ems_usb: fix memory leak
    f58ac91ff87d can: usb_8dev: fix memory leak
    a6ebfbdaca3d can: mcba_usb_start(): add missing urb->transfer_dma initialization
    2fc2c2816cb7 can: peak_usb: pcan_usb_handle_bus_evt(): fix reading rxerr/txerr values
    afe2ffd92061 can: raw: raw_setsockopt(): fix raw_rcv panic for sock UAF
    a9c02d0e1513 can: j1939: j1939_xtp_rx_dat_one(): fix rxtimer value between consecutive TP.DT to 750ms
    da4f4916dab2 ocfs2: issue zeroout to EOF blocks
    943014593061 ocfs2: fix zero out valid data
    52acb6c147b3 KVM: add missing compat KVM_CLEAR_DIRTY_LOG
    7d67d4ab28e3 x86/kvm: fix vcpu-id indexed array sizes
    2388c7674fbd ACPI: DPTF: Fix reading of attributes
    0d6afa25975e Revert "ACPI: resources: Add checks for ACPI IRQ override"
    0a421a2fc516 btrfs: mark compressed range uptodate only if all bio succeed
    4e1a57d75264 btrfs: fix rw device counting in __btrfs_free_extra_devids
    27aa7171fe2b pipe: make pipe writes always wake up readers
    02210a5e1894 x86/asm: Ensure asm/proto.h can be included stand-alone
    65b2658634fe io_uring: fix null-ptr-deref in io_sq_offload_start()
    e44d22fdf756 selftest: fix build error in tools/testing/selftests/vm/userfaultfd.c

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6ab4c36223e62ad99efb76863a703c83fb6da324)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index a06b9f717f..351970c03a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a40806f61a2749b78c03eb0e0c9394246e632a99"
-SRCREV_meta ?= "0c461183d295a8e45096b9af71e07e06da7da13c"
+SRCREV_machine ?= "9ad4f13ee44c39e890638d8a2157adcf830fc7bc"
+SRCREV_meta ?= "22257690910a1befc2ed8a98ef218bd0c5cfd844"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.55"
+LINUX_VERSION ?= "5.10.57"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 615c3b0f00..b035ed3d15 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.55"
+LINUX_VERSION ?= "5.10.57"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ecb67002c7688875f76a424c87308eea5b2709f5"
-SRCREV_machine ?= "be59a3f77944fe82deaab2c3d61e76292cf04afb"
-SRCREV_meta ?= "0c461183d295a8e45096b9af71e07e06da7da13c"
+SRCREV_machine_qemuarm ?= "60d8a10a1e8acdabbd61f3705b67b2112e7866e0"
+SRCREV_machine ?= "df4ea731a9dc6e1076f3e2935d6689668d8f58ac"
+SRCREV_meta ?= "22257690910a1befc2ed8a98ef218bd0c5cfd844"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index c5b60e0242..05cfa54480 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "159ecaed431c9b022eaa42e164603a998f458831"
-SRCREV_machine_qemuarm64 ?= "374000778a234761cdf27d9c5822efdd97626e6f"
-SRCREV_machine_qemumips ?= "b0216d371845ea01c5b6255f4a9eb6518f26a2cb"
-SRCREV_machine_qemuppc ?= "007217c338a8e496c110f86004b8268d10e94cdd"
-SRCREV_machine_qemuriscv64 ?= "9d31ee7f08cb276fbc4473a2279cb614ec4735be"
-SRCREV_machine_qemuriscv32 ?= "9d31ee7f08cb276fbc4473a2279cb614ec4735be"
-SRCREV_machine_qemux86 ?= "9d31ee7f08cb276fbc4473a2279cb614ec4735be"
-SRCREV_machine_qemux86-64 ?= "9d31ee7f08cb276fbc4473a2279cb614ec4735be"
-SRCREV_machine_qemumips64 ?= "a7f0d6ea0ddad123475e25725dadba0ed7888623"
-SRCREV_machine ?= "9d31ee7f08cb276fbc4473a2279cb614ec4735be"
-SRCREV_meta ?= "0c461183d295a8e45096b9af71e07e06da7da13c"
+SRCREV_machine_qemuarm ?= "21075c593dd7a09fc2e0fe4c1f751999fee1127a"
+SRCREV_machine_qemuarm64 ?= "e32f43fed15419c8461207c4d2b76879920d5928"
+SRCREV_machine_qemumips ?= "127501aba35af6e38f50ecd814da4416f361fd84"
+SRCREV_machine_qemuppc ?= "219057449c55acde1060af4b63c2d1ba5ec19978"
+SRCREV_machine_qemuriscv64 ?= "b1ff0bb0de7abc5039e0db14f66e01eb0a3c24bb"
+SRCREV_machine_qemuriscv32 ?= "b1ff0bb0de7abc5039e0db14f66e01eb0a3c24bb"
+SRCREV_machine_qemux86 ?= "b1ff0bb0de7abc5039e0db14f66e01eb0a3c24bb"
+SRCREV_machine_qemux86-64 ?= "b1ff0bb0de7abc5039e0db14f66e01eb0a3c24bb"
+SRCREV_machine_qemumips64 ?= "dd28c0cc8a79329b8b724821e7c09b210a2e2948"
+SRCREV_machine ?= "b1ff0bb0de7abc5039e0db14f66e01eb0a3c24bb"
+SRCREV_meta ?= "22257690910a1befc2ed8a98ef218bd0c5cfd844"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.55"
+LINUX_VERSION ?= "5.10.57"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1

