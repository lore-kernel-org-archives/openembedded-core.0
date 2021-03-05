Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.7720.1614918144509118322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: eU9FZ60VvnDN7trbKBFmlj+Dmr4E6fLjMz6opSwkNe5M2sNqg4/jPlHWOR9LHa580tzqklKhlD
 xAglTm1yYECA==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187670883"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187670883"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:09 -0800
IronPort-SDR: yGW/A0stzGB1ir1rL5UlWXXlvEDuR2qJzNR862zKK1f7DpAXdzTteNQAcmt2wlmZttILNEeN33
 V0b5CDcN3rUw==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128795"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:08 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 08/52] linux-yocto/5.4: update to v5.4.98
Date: Fri,  5 Mar 2021 12:20:44 +0800
Message-Id: <aa10b5cd8016063626240b0ca888950d106c7dd1.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    5b9a4104c902 Linux 5.4.98
    3654a0ed0bdc squashfs: add more sanity checks in xattr id lookup
    d78a70667738 squashfs: add more sanity checks in inode lookup
    a814355e7057 squashfs: add more sanity checks in id lookup
    848bcb0a1d96 Fix unsynchronized access to sev members through svm_register_enc_region
    78e2f71b89b2 bpf: Fix 32 bit src register truncation on div/mod
    8589eda99cb1 regulator: Fix lockdep warning resolving supplies
    513fee2aee13 blk-cgroup: Use cond_resched() when destroy blkgs
    d1eb41833408 i2c: mediatek: Move suspend and resume handling to NOIRQ phase
    618b65dbde7a SUNRPC: Handle 0 length opaque XDR object data properly
    19b56e8433e7 SUNRPC: Move simple_get_bytes and simple_get_netobj into private header
    fa758032a546 iwlwifi: mvm: guard against device removal in reprobe
    2fa76f19dc15 iwlwifi: mvm: invalidate IDs of internal stations at mvm start
    c82793ef4f3b iwlwifi: pcie: fix context info memory leak
    b301eaf27f86 iwlwifi: pcie: add a NULL check in iwl_pcie_txq_unmap
    01742ade9286 iwlwifi: mvm: take mutex for calling iwl_mvm_get_sync_time()
    8f630ed7e98e iwlwifi: mvm: skip power command when unbinding vif during CSA
    589cf152fe47 ASoC: ak4458: correct reset polarity
    e96d10250227 pNFS/NFSv4: Try to return invalid layout in pnfs_layout_process()
    a5c70e57c4c1 chtls: Fix potential resource leak
    8b6d5013cd70 ASoC: Intel: Skylake: Zero snd_ctl_elem_value
    db272cd2bc9e mac80211: 160MHz with extended NSS BW in CSA
    26548561cb92 regulator: core: avoid regulator_resolve_supply() race condition
    03d76df5f164 af_key: relax availability checks for skb size calculation
    968b1b034136 tracing/kprobe: Fix to support kretprobe events on unloaded modules
    5e1942063dc3 Linux 5.4.97
    40af962eb1d4 usb: host: xhci: mvebu: make USB 3.0 PHY optional for Armada 3720
    76ab33055fbc net: sched: replaced invalid qdisc tree flush helper in qdisc_replace
    e65d331755de net: dsa: mv88e6xxx: override existent unicast portvec in port_fdb_add
    5d3007b6cc7b net: ip_tunnel: fix mtu calculation
    90d7459d24b8 neighbour: Prevent a dead entry from updating gc_list
    271ea7072901 igc: Report speed and duplex as unknown when device is runtime suspended
    7018edb19a92 md: Set prev_flush_start and flush_bio in an atomic way
    e857e21eb200 iommu/vt-d: Do not use flush-queue when caching-mode is on
    5fdf672759e9 Input: xpad - sync supported devices with fork on GitHub
    03d56dab56ae iwlwifi: mvm: don't send RFH_QUEUE_CONFIG_CMD with no queues
    2d5705150707 x86/apic: Add extra serialization for non-serializing MSRs
    bc1a3aeeff0f x86/build: Disable CET instrumentation in the kernel
    40d0fff29761 mm: thp: fix MADV_REMOVE deadlock on shmem THP
    56d61cd652dd mm, compaction: move high_pfn to the for loop scope
    90ef21e5806f mm: hugetlb: remove VM_BUG_ON_PAGE from page_huge_active
    af5508b1e862 mm: hugetlb: fix a race between isolating and freeing page
    3264a763174f mm: hugetlb: fix a race between freeing and dissolving the page
    108f56ed354f mm: hugetlbfs: fix cannot migrate the fallocated HugeTLB page
    75be4852490f ARM: footbridge: fix dc21285 PCI configuration accessors
    b2640b08c43c KVM: x86: Update emulator context mode if SYSENTER xfers to 64-bit mode
    6d3201c77be5 KVM: SVM: Treat SVM as unsupported when running as an SEV guest
    f9be9445e494 nvme-pci: avoid the deepest sleep state on Kingston A2000 SSDs
    f9034fcb27c0 drm/amd/display: Revert "Fix EDID parsing after resume from suspend"
    6844143e2198 mmc: core: Limit retries when analyse of SDIO tuples fails
    68c825bd2726 smb3: fix crediting for compounding when only one request in flight
    eaf2f835b52c smb3: Fix out-of-bounds bug in SMB2_negotiate()
    00f581964b66 cifs: report error instead of invalid when revalidating a dentry fails
    fd6dc98f66ef xhci: fix bounce buffer usage for non-sg list case
    f6a47f2ce090 genirq/msi: Activate Multi-MSI early when MSI_FLAG_ACTIVATE_EARLY is set
    c9654bbe52b5 libnvdimm/dimm: Avoid race between probe and available_slots_show()
    d0f36951ead4 kretprobe: Avoid re-registration of the same kretprobe earlier
    e80f9021d5be fgraph: Initialize tracing_graph_pause at task creation
    efa17285b338 mac80211: fix station rate table updates on assoc
    ecdd962c4b9b ovl: fix dentry leak in ovl_get_redirect
    6b9a2e5c0c42 usb: host: xhci-plat: add priv quirk for skip PHY initialization
    ddc682d33024 usb: xhci-mtk: break loop when find the endpoint to drop
    32410786279f usb: xhci-mtk: skip dropping bandwidth of unchecked endpoints
    f4e4f067f94c usb: xhci-mtk: fix unreleased bandwidth data
    1f9e9c1048b8 usb: dwc3: fix clock issue during resume in OTG mode
    9d058a06149b usb: dwc2: Fix endpoint direction check in ep_from_windex
    2a968ab0d2dd usb: renesas_usbhs: Clear pipe running flag in usbhs_pkt_pop()
    4d1d959348c1 USB: usblp: don't call usb_set_interface if there's a single alt
    522567fe540d USB: gadget: legacy: fix an error code in eth_bind()
    e57d70c59bb7 memblock: do not start bottom-up allocations with kernel_end
    7e6dcaeadc0e nvmet-tcp: fix out-of-bounds access when receiving multiple h2cdata PDUs
    f1c87b4b2c7b ARM: dts: sun7i: a20: bananapro: Fix ethernet phy-mode
    d97a821b2e9c r8169: fix WoL on shutdown if CONFIG_DEBUG_SHIRQ is set
    c545879e8080 net: mvpp2: TCAM entry enable should be written after SRAM data
    bf0507fb2073 net: lapb: Copy the skb before sending a packet
    1cef1d46add8 net/mlx5: Fix leak upon failure of rule creation
    67b7f73bbe3f i40e: Revert "i40e: don't report link up for a VF who hasn't enabled queues"
    6380ef64b9eb igc: check return value of ret_val in igc_config_fc_after_link_up
    ec68581f7479 igc: set the default return value to -IGC_ERR_NVM in igc_write_nvm_srwr
    5ce999efcaa7 arm64: dts: ls1046a: fix dcfg address range
    68e798fa3c0e rxrpc: Fix deadlock around release of dst cached on udp tunnel
    98650c3d0e33 um: virtio: free vu_dev only with the contained struct device
    02531b5549eb bpf, cgroup: Fix problematic bounds check
    9146fffc5d2a bpf, cgroup: Fix optlen WARN_ON_ONCE toctou
    4921f81ce65a arm64: dts: rockchip: fix vopl iommu irq on px30
    831132b13f0d arm64: dts: amlogic: meson-g12: Set FL-adj property value
    829bf438cb39 Input: i8042 - unbreak Pegatron C15B
    0d6e0a192e2e arm64: dts: qcom: c630: keep both touchpad devices enabled
    96dcfabef504 USB: serial: option: Adding support for Cinterion MV31
    5ad95c521fd5 USB: serial: cp210x: add new VID/PID for supporting Teraoka AD2000
    dfa820563c67 USB: serial: cp210x: add pid/vid for WSDA-200-USB

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 98bb6a3cb528abe02b6edc291d05e240985ca80e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 0047667c0d..d5b6b642e5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d713e8f61a93d8f6e8c1960b2478f19ba616f1e1"
-SRCREV_meta ?= "ab2e5b4ded74e18c58efd99ca6f1661a4f299255"
+SRCREV_machine ?= "0406e600800a40015d02b16ee6a4a46c6673c66f"
+SRCREV_meta ?= "4f6d6c23cc8ca5d9c39b1efc2619b1dfec1ef2bc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.96"
+LINUX_VERSION ?= "5.4.98"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 63e452641c..ff03fd4197 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.96"
+LINUX_VERSION ?= "5.4.98"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "7ddf91d07b54aaf7d9160375b7a084dd115684b1"
-SRCREV_machine ?= "621e232db8554748a51c80f522ec759303cde5d2"
-SRCREV_meta ?= "ab2e5b4ded74e18c58efd99ca6f1661a4f299255"
+SRCREV_machine_qemuarm ?= "fc95a485415d22eb772359b8d350c03b85c0cd1b"
+SRCREV_machine ?= "2d0a4ea86fe97f13a4bc2a92a097e4edb51d737d"
+SRCREV_meta ?= "4f6d6c23cc8ca5d9c39b1efc2619b1dfec1ef2bc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 73cc1e909c..7fdb1e93e9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "e35ee9d9faf9994d4987746db31e9122732d4066"
-SRCREV_machine_qemuarm64 ?= "621e232db8554748a51c80f522ec759303cde5d2"
-SRCREV_machine_qemumips ?= "76bd925d349e98d13f23aed590d3cdb811beea7d"
-SRCREV_machine_qemuppc ?= "621e232db8554748a51c80f522ec759303cde5d2"
-SRCREV_machine_qemuriscv64 ?= "621e232db8554748a51c80f522ec759303cde5d2"
-SRCREV_machine_qemux86 ?= "621e232db8554748a51c80f522ec759303cde5d2"
-SRCREV_machine_qemux86-64 ?= "621e232db8554748a51c80f522ec759303cde5d2"
-SRCREV_machine_qemumips64 ?= "6da088d17f3a6038e01627b47e499899be55f6e2"
-SRCREV_machine ?= "621e232db8554748a51c80f522ec759303cde5d2"
-SRCREV_meta ?= "ab2e5b4ded74e18c58efd99ca6f1661a4f299255"
+SRCREV_machine_qemuarm ?= "28bc6b294bb1e49da671b2848234f9011efcad88"
+SRCREV_machine_qemuarm64 ?= "2d0a4ea86fe97f13a4bc2a92a097e4edb51d737d"
+SRCREV_machine_qemumips ?= "105568d1696f86625cf7bc30d8c5c921732de2f4"
+SRCREV_machine_qemuppc ?= "2d0a4ea86fe97f13a4bc2a92a097e4edb51d737d"
+SRCREV_machine_qemuriscv64 ?= "2d0a4ea86fe97f13a4bc2a92a097e4edb51d737d"
+SRCREV_machine_qemux86 ?= "2d0a4ea86fe97f13a4bc2a92a097e4edb51d737d"
+SRCREV_machine_qemux86-64 ?= "2d0a4ea86fe97f13a4bc2a92a097e4edb51d737d"
+SRCREV_machine_qemumips64 ?= "c76ba20ee1b1de859736f85f0210459c2104b8df"
+SRCREV_machine ?= "2d0a4ea86fe97f13a4bc2a92a097e4edb51d737d"
+SRCREV_meta ?= "4f6d6c23cc8ca5d9c39b1efc2619b1dfec1ef2bc"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.96"
+LINUX_VERSION ?= "5.4.98"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.29.2

