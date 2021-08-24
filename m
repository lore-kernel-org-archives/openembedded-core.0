Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.1007.1629822370707707263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360306"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360306"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:57 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455658993"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:56 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 16/28] linux-yocto/5.4: update to v5.4.139
Date: Wed, 25 Aug 2021 00:25:18 +0800
Message-Id: <c9ea9bafa1f767328bc0fdccb8f5c9f1ed5304a3.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    e350cd02e293 Linux 5.4.139
    03ff8a4f9db6 spi: mediatek: Fix fifo transfer
    a0f66ddf05c2 bpf, selftests: Adjust few selftest outcomes wrt unreachable code
    d3796e8f6b3d bpf, selftests: Add a verifier test for assigning 32bit reg states to 64bit ones
    8dec99abcd74 bpf: Test_verifier, add alu32 bounds tracking tests
    fd568de5806f bpf: Fix leakage under speculation on mispredicted branches
    d2f790327f83 bpf: Do not mark insn as seen under speculative path verification
    283d742988f6 bpf: Inherit expanded/patched seen count from old aux data
    a0a9546aaec3 Revert "watchdog: iTCO_wdt: Account for rebooting on second timeout"
    76f5314d7859 firmware: arm_scmi: Add delayed response status check
    1b38f70bbc7c firmware: arm_scmi: Ensure drivers provide a probe function
    44f522298c94 Revert "Bluetooth: Shutdown controller after workqueues are flushed or cancelled"
    38f54217b423 ACPI: fix NULL pointer dereference
    0ea2f55babb7 nvme: fix nvme_setup_command metadata trace event
    b508b652d4f3 net: Fix zero-copy head len calculation.
    bf692e7ef657 qed: fix possible unpaired spin_{un}lock_bh in _qed_mcp_cmd_and_union()
    6bc48348eca7 r8152: Fix potential PM refcount imbalance
    a57c75ff0700 ASoC: tlv320aic31xx: fix reversed bclk/wclk master bits
    e2cccb839a18 spi: stm32h7: fix full duplex irq handler handling
    b72f2d9e91e1 regulator: rt5033: Fix n_voltages settings for BUCK and LDO
    86f2a3e9aae9 btrfs: fix lost inode on log replay after mix of fsync, rename and inode eviction
    b7f0fa2192c5 btrfs: fix race causing unnecessary inode logging during link and rename
    cb006da62a9e btrfs: do not commit logs and transactions during link and rename operations
    174c27d0f9ef btrfs: delete duplicated words + other fixes in comments
    7b90d57b09fa Linux 5.4.138
    7eef18c0479b can: j1939: j1939_session_deactivate(): clarify lifetime of session object
    18b536de3b97 i40e: Add additional info to PHY type error
    d21eb931109a Revert "perf map: Fix dso->nsinfo refcounting"
    16447b2f5c66 powerpc/pseries: Fix regression while building external modules
    265883d1d839 PCI: mvebu: Setup BAR0 in order to fix MSI
    21734a31c9a0 can: hi311x: fix a signedness bug in hi3110_cmd()
    f4fa45b0f91e sis900: Fix missing pci_disable_device() in probe and remove
    dff00ce44891 tulip: windbond-840: Fix missing pci_disable_device() in probe and remove
    e0310bbeaaa2 sctp: fix return value check in __sctp_rcv_asconf_lookup
    408614108abd net/mlx5e: Fix nullptr in mlx5e_hairpin_get_mdev()
    ac4983230616 net/mlx5: Fix flow table chaining
    527feae56fe6 net: llc: fix skb_over_panic
    ede4c93860e6 mlx4: Fix missing error code in mlx4_load_one()
    acb97d4b2d0e net: Set true network header for ECN decapsulation
    851946a68136 tipc: fix sleeping in tipc accept routine
    194b71d28b26 i40e: Fix log TC creation failure when max num of queues is exceeded
    834af62212c7 i40e: Fix queue-to-TC mapping on Tx
    74aea4b7159a i40e: Fix firmware LLDP agent related warning
    b2ab34e862eb i40e: Fix logic of disabling queues
    519582e44e6a netfilter: nft_nat: allow to specify layer 4 protocol NAT only
    3a7a4cee7bec netfilter: conntrack: adjust stop timestamp to real expiry value
    1c043783403c cfg80211: Fix possible memory leak in function cfg80211_bss_update
    6cf2abea1018 nfc: nfcsim: fix use after free during module unload
    6b313d0ffa71 NIU: fix incorrect error return, missed in previous revert
    c4663c162778 HID: wacom: Re-enable touch by default for Cintiq 24HDT / 27QHDT
    e9e2ce00aeda can: esd_usb2: fix memory leak
    43726620b2f6 can: ems_usb: fix memory leak
    819867389276 can: usb_8dev: fix memory leak
    a051dbd17b5b can: mcba_usb_start(): add missing urb->transfer_dma initialization
    793581441b5c can: raw: raw_setsockopt(): fix raw_rcv panic for sock UAF
    c621638d0e6d can: j1939: j1939_xtp_rx_dat_one(): fix rxtimer value between consecutive TP.DT to 750ms
    a24d87b429a9 ocfs2: issue zeroout to EOF blocks
    eaaa4284e288 ocfs2: fix zero out valid data
    9bd1092148b5 KVM: add missing compat KVM_CLEAR_DIRTY_LOG
    7a94dfe5e2a0 x86/kvm: fix vcpu-id indexed array sizes
    2dc291582cce Revert "ACPI: resources: Add checks for ACPI IRQ override"
    a8eec6979734 btrfs: mark compressed range uptodate only if all bio succeed
    57429c1ec770 btrfs: fix rw device counting in __btrfs_free_extra_devids
    61f2cbc792eb x86/asm: Ensure asm/proto.h can be included stand-alone
    99372c38a948 net_sched: check error pointer in tcf_dump_walker()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d5455d9e201e324b7cf7bb19381bfebb0e892312)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index d8a02f567f..e810132d02 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c2634e34da0641aafe30fd3fb924386dd62f4941"
-SRCREV_meta ?= "cfd547115bc4d65c29f0f4313bd950976f41ebd8"
+SRCREV_machine ?= "0ad6f2204daf35fb25df5e9b52383507df813bb4"
+SRCREV_meta ?= "98ba88191b7c489bc0d83b6c87a31b2330fcd886"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.137"
+LINUX_VERSION ?= "5.4.139"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index dd2a9cbcc0..c734ce8db5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.137"
+LINUX_VERSION ?= "5.4.139"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "a51fc55766d4ae07f7b67adc4c9d3b07a1d1d475"
-SRCREV_machine ?= "4c6ef497d892e3b5846a60fdd6f2a6df7177f570"
-SRCREV_meta ?= "cfd547115bc4d65c29f0f4313bd950976f41ebd8"
+SRCREV_machine_qemuarm ?= "a80ea6be16b19c18855f831333c93d4f3b55e58a"
+SRCREV_machine ?= "405fce9e3f0314767e38b5e8295b34a24cd97a46"
+SRCREV_meta ?= "98ba88191b7c489bc0d83b6c87a31b2330fcd886"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 841c2ae811..fcf65149f0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "88d3d4ec2c23ed165ee11dd9fc48ac77fee480ba"
-SRCREV_machine_qemuarm64 ?= "7cad0ac3beb6fc0a1f84dc079d0e6a68fedb3df4"
-SRCREV_machine_qemumips ?= "d8b1cb081cbfa6a7157561d61ce383bc661208d8"
-SRCREV_machine_qemuppc ?= "528a4de381c0a22e9eeebe899e159ed8d4fccff3"
-SRCREV_machine_qemuriscv64 ?= "90d297d951740cd13553072fb00afbf39045d38a"
-SRCREV_machine_qemux86 ?= "90d297d951740cd13553072fb00afbf39045d38a"
-SRCREV_machine_qemux86-64 ?= "90d297d951740cd13553072fb00afbf39045d38a"
-SRCREV_machine_qemumips64 ?= "29b36c7b1c51b5322cba165dd11b435ad9439adf"
-SRCREV_machine ?= "90d297d951740cd13553072fb00afbf39045d38a"
-SRCREV_meta ?= "cfd547115bc4d65c29f0f4313bd950976f41ebd8"
+SRCREV_machine_qemuarm ?= "3d243cfd29a57dfe6b04a6a6cf1b1088d107f1f6"
+SRCREV_machine_qemuarm64 ?= "dcac97a2b4469136189f86fe42703026693384be"
+SRCREV_machine_qemumips ?= "ee74231b68518107954078d03d0606910603cf7a"
+SRCREV_machine_qemuppc ?= "76c51679aa6b9c25fe2b5c2052e84197ff2e4e2d"
+SRCREV_machine_qemuriscv64 ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
+SRCREV_machine_qemux86 ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
+SRCREV_machine_qemux86-64 ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
+SRCREV_machine_qemumips64 ?= "3396071f8ce8ca148231fee4d2130feeead41926"
+SRCREV_machine ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
+SRCREV_meta ?= "98ba88191b7c489bc0d83b6c87a31b2330fcd886"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.137"
+LINUX_VERSION ?= "5.4.139"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1

