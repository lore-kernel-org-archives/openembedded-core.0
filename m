Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: LgvS69IsDthRjyF7aVhxmH4CSGyA6JsJP2pVOyIcEftV0nwdtC9tPAz/aYbvy0iEh3GXMFXuph
 JjqGHlxhx5jA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794742"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794742"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:08 -0700
IronPort-SDR: a6SoNJuJBixgzz7zNGqPXjdKO8nZmn4IKyP2zKTrFxRxQm5xBa0zlrytagBL2h8AP8GotfAbJM
 cCkemJftGyUw==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331598"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:07 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 13/31] linux-yocto/5.10: update to v5.10.32
Date: Fri,  7 May 2021 15:02:25 +0800
Message-Id: <848984a8678093790f9f03e7e62ab7fcb12346ac.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    aea70bd5a455 Linux 5.10.32
    6ac98ee9cb7c net: phy: marvell: fix detection of PHY on Topaz switches
    fbe6603e7cab bpf: Move sanitize_val_alu out of op switch
    7723d3243857 bpf: Improve verifier error messages for users
    55565c307908 bpf: Rework ptr_limit into alu_limit and add common error path
    496e2fabbbe3 arm64: mte: Ensure TIF_MTE_ASYNC_FAULT is set atomically
    cada2ed0bb70 ARM: 9071/1: uprobes: Don't hook on thumb instructions
    480d875f1242 bpf: Move off_reg into sanitize_ptr_alu
    589fd9684dfa bpf: Ensure off_reg has no mixed signed bounds for all types
    b2df20c0f19f r8169: don't advertise pause in jumbo mode
    154fb9cb3e6f r8169: tweak max read request size for newer chips also in jumbo mtu mode
    7f64753835a7 KVM: VMX: Don't use vcpu->run->internal.ndata as an array index
    c670ff84fac9 KVM: VMX: Convert vcpu_vmx.exit_reason to a union
    4f3ff11204ea bpf: Use correct permission flag for mixed signed bounds arithmetic
    8d7906c548aa arm64: dts: allwinner: h6: beelink-gs1: Remove ext. 32 kHz osc reference
    286c39d08664 arm64: dts: allwinner: Fix SD card CD GPIO for SOPine systems
    4f90db2e92d2 ARM: OMAP2+: Fix uninitialized sr_inst
    1fc087fdb98d ARM: footbridge: fix PCI interrupt mapping
    11a718ef953f ARM: 9069/1: NOMMU: Fix conversion for_each_membock() to for_each_mem_range()
    a13d4a1228ab ARM: OMAP2+: Fix warning for omap_init_time_of()
    9143158a6bd3 gro: ensure frag0 meets IP header alignment
    fd766f792a56 ch_ktls: do not send snd_una update to TCB in middle
    65bdd564b387 ch_ktls: tcb close causes tls connection failure
    5f3c278035c0 ch_ktls: fix device connection close
    8d5a9dbd2116 ch_ktls: Fix kernel panic
    976da1b08784 ibmvnic: remove duplicate napi_schedule call in open function
    008885a880dc ibmvnic: remove duplicate napi_schedule call in do_reset function
    685bc730e3a9 ibmvnic: avoid calling napi_disable() twice
    e154b5060aa1 ia64: tools: remove inclusion of ia64-specific version of errno.h header
    f8f01fc8c653 ia64: remove duplicate entries in generic_defconfig
    1aec111c944f ethtool: pause: make sure we init driver stats
    44ef38c0a2b3 i40e: fix the panic when running bpf in xdpdrv mode
    35d7491e2f77 net: Make tcp_allowed_congestion_control readonly in non-init netns
    76af8126a6e4 mm: ptdump: fix build failure
    33f3dab42ae2 net: ip6_tunnel: Unregister catch-all devices
    ea0340e632ba net: sit: Unregister catch-all devices
    154ac84d497a net: davicom: Fix regulator not turned off on failed probe
    e072247938a8 net/mlx5e: Fix setting of RS FEC mode
    dc1732baa9da netfilter: nft_limit: avoid possible divide error in nft_limit_init
    cda5507d234f net/mlx5e: fix ingress_ifindex check in mlx5e_flower_parse_meta
    40ed1d29f151 net: macb: fix the restore of cmp registers
    7f8e59c4c5e5 libbpf: Fix potential NULL pointer dereference
    7824d5a9935a netfilter: arp_tables: add pre_exit hook for table unregister
    4d26865974fb netfilter: bridge: add pre_exit hooks for ebtable unregistration
    eb82199e377a libnvdimm/region: Fix nvdimm_has_flush() to handle ND_REGION_ASYNC
    a2af8a0f38e4 ice: Fix potential infinite loop when using u8 loop counter
    783645e65b57 netfilter: conntrack: do not print icmpv6 as unknown via /proc
    394c81e36e49 netfilter: flowtable: fix NAT IPv6 offload mangling
    be07581aacae ixgbe: fix unbalanced device enable/disable in suspend/resume
    0ef9919a06a3 scsi: libsas: Reset num_scatter if libata marks qc as NODATA
    6a70ab9769cd riscv: Fix spelling mistake "SPARSEMEM" to "SPARSMEM"
    f66d695c06f4 vfio/pci: Add missing range check in vfio_pci_mmap
    e6177990e17d arm64: alternatives: Move length validation in alternative_{insn, endif}
    e2931f05eb32 arm64: fix inline asm in load_unaligned_zeropad()
    957f83a138f1 readdir: make sure to verify directory entry for legacy interfaces too
    2b8308741cf5 dm verity fec: fix misaligned RS roots IO
    18ba387261ea HID: wacom: set EV_KEY and EV_ABS only for non-HID_GENERIC type of devices
    dedf75aec8fc Input: i8042 - fix Pegatron C15B ID entry
    8b978750dcd2 Input: s6sy761 - fix coordinate read bit shift
    955da2b5cd98 lib: fix kconfig dependency on ARCH_WANT_FRAME_POINTERS
    024f9d048000 virt_wifi: Return micros for BSS TSF values
    cc413b375c6d mac80211: clear sta->fast_rx when STA removed from 4-addr VLAN
    2e08d9a56838 pcnet32: Use pci_resource_len to validate PCI resource
    248b9b61b951 net: ieee802154: forbid monitor for add llsec seclevel
    b97c7bc42d8d net: ieee802154: stop dump llsec seclevels for monitors
    ab9f9a1d5874 net: ieee802154: forbid monitor for del llsec devkey
    4846c2debb2c net: ieee802154: forbid monitor for add llsec devkey
    07714229e0e2 net: ieee802154: stop dump llsec devkeys for monitors
    4c1775d6ea86 net: ieee802154: forbid monitor for del llsec dev
    813b13155d14 net: ieee802154: forbid monitor for add llsec dev
    2f80452951b5 net: ieee802154: stop dump llsec devs for monitors
    08744a622faa net: ieee802154: forbid monitor for del llsec key
    7edf4d2baa8a net: ieee802154: forbid monitor for add llsec key
    c09075df5e4d net: ieee802154: stop dump llsec keys for monitors
    8b9485b651d4 iwlwifi: add support for Qu with AX201 device
    c836374bacfa scsi: scsi_transport_srp: Don't block target in SRP_PORT_LOST state
    d9fc084067f5 ASoC: fsl_esai: Fix TDM slot setup for I2S mode
    79ef0e6c0cf8 drm/msm: Fix a5xx/a6xx timestamps
    d61238aa6482 ARM: omap1: fix building with clang IAS
    505c48942f04 ARM: keystone: fix integer overflow warning
    0d0ad98bee39 neighbour: Disregard DEAD dst in neigh_update
    7a1cd9044da4 gpu/xen: Fix a use after free in xen_drm_drv_init
    bfb5a1523f17 ASoC: max98373: Added 30ms turn on/off time delay
    58d59d9ae56f ASoC: max98373: Changed amp shutdown register as volatile
    b2f8476193eb xfrm: BEET mode doesn't support fragments for inner packets
    806addaf8dfd iwlwifi: Fix softirq/hardirq disabling in iwl_pcie_enqueue_hcmd()
    b448a6a2fc5a arc: kernel: Return -EFAULT if copy_to_user() fails
    f12e8cf6b180 lockdep: Add a missing initialization hint to the "INFO: Trying to register non-static key" message
    a55de4f0d1d4 ARM: dts: Fix moving mmc devices with aliases for omap4 & 5
    9f399a9d7006 ARM: dts: Drop duplicate sha2md5_fck to fix clk_disable race
    f338b8fffd75 ACPI: x86: Call acpi_boot_table_init() after acpi_table_upgrade()
    e5eb9757fe4c dmaengine: idxd: fix wq cleanup of WQCFG registers
    4c59c5c8668e dmaengine: plx_dma: add a missing put_device() on error path
    ac030f5c5680 dmaengine: Fix a double free in dma_async_device_register
    56f9c04893fb dmaengine: dw: Make it dependent to HAS_IOMEM
    4ecf25595273 dmaengine: idxd: fix wq size store permission state
    db23b7b5ca3e dmaengine: idxd: fix opcap sysfs attribute output
    0e3f14755111 dmaengine: idxd: fix delta_rec and crc size field for completion record
    a5ad12d5d69c dmaengine: idxd: Fix clobbering of SWERR overflow bit on writeback
    f567fde02baa gpio: sysfs: Obey valid_mask
    dfed481e62e5 Input: nspire-keypad - enable interrupts only when opened
    b80ea54e1e71 mtd: rawnand: mtk: Fix WAITRDY break condition and timeout
    5a627026be4a net/sctp: fix race condition in sctp_destroy_sock
    65f1995ea1e9 Linux 5.10.31
    ceee49ca34bf xen/events: fix setting irq affinity
    9d9facd32d89 net: sfp: cope with SFPs that set both LOS normal and LOS inverted
    2a60ab2dab3d net: sfp: relax bitrate-derived mode check
    cd8ce27e6caa perf map: Tighten snprintf() string precision to pass gcc check on some 32-bit arches
    1f3b9000cb44 netfilter: x_tables: fix compat match/target pad out-of-bound write
    5402a67ac403 block: don't ignore REQ_NOWAIT for direct IO
    efa7b6e4017a riscv,entry: fix misaligned base for excp_vect_table
    6fbdce3cde97 io_uring: don't mark S_ISBLK async work as unbounded
    5d4600017bee null_blk: fix command timeout completion handling
    b1f6c6f39bd6 idr test suite: Create anchor before launching throbber
    9a7552daa93b idr test suite: Take RCU read lock in idr_find_test_1
    edd822b69241 radix tree test suite: Register the main thread with the RCU library
    1d2310d95fb8 block: only update parent bi_status when bio fail
    d99e22c0ea74 XArray: Fix splitting to non-zero orders
    9576dd89554e gpu: host1x: Use different lock classes for each client
    39af2f472f21 drm/tegra: dc: Don't set PLL clock to 0Hz
    e4a0956574c7 tools/kvm_stat: Add restart delay
    1dcb3ebc2416 ftrace: Check if pages were allocated before calling free_pages()
    6c6d58322079 gfs2: report "already frozen/thawed" errors
    870c8df1d192 drm/imx: imx-ldb: fix out of bounds array access warning
    5b50468a2d4d KVM: arm64: Disable guest access to trace filter controls
    fa0c0dce589d KVM: arm64: Hide system instruction access to Trace registers
    57fb08fb9a25 gfs2: Flag a withdraw if init_threads() fails
    9b57ecb01b43 interconnect: core: fix error return code of icc_link_destroy()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 91fcd094619e25d63a80231c3b776788504ce37b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 0902fe4fa1..6b6b7ac785 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "196677064883beeaacb68de437512a0e4ee07050"
-SRCREV_meta ?= "a19886b00ea7d874fdd60d8e3435894bb16e6434"
+SRCREV_machine ?= "9a09bd7febd325064c9f291ebcda2186fa514884"
+SRCREV_meta ?= "6eb23a018005ebef5a4265738f2643deedaba4e2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.30"
+LINUX_VERSION ?= "5.10.32"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 079f4a215e..df76483244 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.30"
+LINUX_VERSION ?= "5.10.32"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "bcb76d132fb1e90f6db0a598b3c46b180a9b71ea"
-SRCREV_machine ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
-SRCREV_meta ?= "a19886b00ea7d874fdd60d8e3435894bb16e6434"
+SRCREV_machine_qemuarm ?= "2524b7aa4cdc2185862648c257c8774628d87226"
+SRCREV_machine ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
+SRCREV_meta ?= "6eb23a018005ebef5a4265738f2643deedaba4e2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index c8a2e3906f..cdc3fd1cdd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "68066f8eb689b650bc95dd5abbba2336e11ca896"
-SRCREV_machine_qemuarm64 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
-SRCREV_machine_qemumips ?= "e609eb0cc21b9037f0adf73dfb524d4e44d0f51c"
-SRCREV_machine_qemuppc ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
-SRCREV_machine_qemuriscv64 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
-SRCREV_machine_qemuriscv32 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
-SRCREV_machine_qemux86 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
-SRCREV_machine_qemux86-64 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
-SRCREV_machine_qemumips64 ?= "f89a64b85a068ac96ccd69f5170b2fbe957d4162"
-SRCREV_machine ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
-SRCREV_meta ?= "a19886b00ea7d874fdd60d8e3435894bb16e6434"
+SRCREV_machine_qemuarm ?= "058fd44194d6c2a83506870bae3aca31c7f8be29"
+SRCREV_machine_qemuarm64 ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
+SRCREV_machine_qemumips ?= "c723ea1bc1fa3fd81f3e0ae2ba030898c40f7548"
+SRCREV_machine_qemuppc ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
+SRCREV_machine_qemuriscv64 ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
+SRCREV_machine_qemuriscv32 ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
+SRCREV_machine_qemux86 ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
+SRCREV_machine_qemux86-64 ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
+SRCREV_machine_qemumips64 ?= "9c9b0edd160d0bbef687e574f2975fc54cf46843"
+SRCREV_machine ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
+SRCREV_meta ?= "6eb23a018005ebef5a4265738f2643deedaba4e2"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.30"
+LINUX_VERSION ?= "5.10.32"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.30.2

