Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ML8q84TjVXYMqa4AxxUTq1YFcQ00omplosYFt3vuWRGzzDqcIA8J8rLj3d9GvgOW9G7kWhXlhq
 fzcwrHVpEgOA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794757"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794757"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:11 -0700
IronPort-SDR: o9e27AE2EIAXckcJ3KH6C2EoQ9RQUjLpSjLEXl/hfdoneKwCCj6HMMLv5GjPXGRaK4vYa6h5Mi
 u5Saz4zHZ9Yw==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331607"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:10 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 15/31] linux-yocto/5.4: update to v5.4.114
Date: Fri,  7 May 2021 15:02:27 +0800
Message-Id: <b67f3e091f9cd40c6790bc7056eab29a5c4e4e97.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    a7eb81c1d11a Linux 5.4.114
    3822683fd101 net: phy: marvell: fix detection of PHY on Topaz switches
    cec3b778f70f ARM: 9071/1: uprobes: Don't hook on thumb instructions
    4f0cda5e9e62 r8169: don't advertise pause in jumbo mode
    c5934da725bb r8169: tweak max read request size for newer chips also in jumbo mtu mode
    50b7a68664dc r8169: improve rtl_jumbo_config
    cbbd3e2a2e7c r8169: fix performance regression related to PCIe max read request size
    0243bb394186 r8169: simplify setting PCI_EXP_DEVCTL_NOSNOOP_EN
    c667953d6433 r8169: remove fiddling with the PCIe max read request size
    b14992c96274 arm64: dts: allwinner: Fix SD card CD GPIO for SOPine systems
    871b569a3e67 ARM: footbridge: fix PCI interrupt mapping
    9a7ac9afc8d7 gro: ensure frag0 meets IP header alignment
    fde195c03bff ibmvnic: remove duplicate napi_schedule call in open function
    c591bbaae545 ibmvnic: remove duplicate napi_schedule call in do_reset function
    c6acd7d19124 ibmvnic: avoid calling napi_disable() twice
    2bc14f5eca10 i40e: fix the panic when running bpf in xdpdrv mode
    51edda8a6334 net: ip6_tunnel: Unregister catch-all devices
    92f93a03cef0 net: sit: Unregister catch-all devices
    4fcbb1fa2703 net: davicom: Fix regulator not turned off on failed probe
    01fb1626b620 netfilter: nft_limit: avoid possible divide error in nft_limit_init
    e65cd80558e5 net: macb: fix the restore of cmp registers
    6449b405f99a netfilter: arp_tables: add pre_exit hook for table unregister
    ce23be37ecac netfilter: bridge: add pre_exit hooks for ebtable unregistration
    61ca5b653220 libnvdimm/region: Fix nvdimm_has_flush() to handle ND_REGION_ASYNC
    4ce8e86d125d netfilter: conntrack: do not print icmpv6 as unknown via /proc
    5f6c1a81713e scsi: libsas: Reset num_scatter if libata marks qc as NODATA
    7779f84e4677 riscv: Fix spelling mistake "SPARSEMEM" to "SPARSMEM"
    ec3bb712fb62 vfio/pci: Add missing range check in vfio_pci_mmap
    9e8c5e3d8279 arm64: alternatives: Move length validation in alternative_{insn, endif}
    b7d15166c1d1 arm64: fix inline asm in load_unaligned_zeropad()
    b9956950f23c readdir: make sure to verify directory entry for legacy interfaces too
    ff821c7ce913 dm verity fec: fix misaligned RS roots IO
    804607635cc1 HID: wacom: set EV_KEY and EV_ABS only for non-HID_GENERIC type of devices
    b428063fb310 Input: i8042 - fix Pegatron C15B ID entry
    995503dd6546 Input: s6sy761 - fix coordinate read bit shift
    7a2ac9ed8cf6 virt_wifi: Return micros for BSS TSF values
    bd7e90c82850 mac80211: clear sta->fast_rx when STA removed from 4-addr VLAN
    f666567a51fb pcnet32: Use pci_resource_len to validate PCI resource
    9e249bc38a48 net: ieee802154: forbid monitor for add llsec seclevel
    7a7899eaaeb8 net: ieee802154: stop dump llsec seclevels for monitors
    fc5f9c33edb5 net: ieee802154: forbid monitor for del llsec devkey
    63581374638b net: ieee802154: forbid monitor for add llsec devkey
    0d5ee2ee9ab2 net: ieee802154: stop dump llsec devkeys for monitors
    6c8caf78304f net: ieee802154: forbid monitor for del llsec dev
    c993c05b9d48 net: ieee802154: forbid monitor for add llsec dev
    f9d7088d385c net: ieee802154: stop dump llsec devs for monitors
    178ddee28d53 net: ieee802154: forbid monitor for del llsec key
    5d025404d513 net: ieee802154: forbid monitor for add llsec key
    d8b4f3a9d732 net: ieee802154: stop dump llsec keys for monitors
    e16998019358 scsi: scsi_transport_srp: Don't block target in SRP_PORT_LOST state
    f0268d35305d ASoC: fsl_esai: Fix TDM slot setup for I2S mode
    d60837aa64be drm/msm: Fix a5xx/a6xx timestamps
    01e86da75c18 ARM: omap1: fix building with clang IAS
    4f02dc4d360f ARM: keystone: fix integer overflow warning
    f3183866b3da neighbour: Disregard DEAD dst in neigh_update
    1cf8b48a4de2 ASoC: max98373: Added 30ms turn on/off time delay
    47d04c039915 arc: kernel: Return -EFAULT if copy_to_user() fails
    68bd0d8ab19e lockdep: Add a missing initialization hint to the "INFO: Trying to register non-static key" message
    6ffc9f854d23 ARM: dts: Fix moving mmc devices with aliases for omap4 & 5
    4609d27ca6e4 ARM: dts: Drop duplicate sha2md5_fck to fix clk_disable race
    09db44ad36b0 dmaengine: dw: Make it dependent to HAS_IOMEM
    5130cda3cb1f gpio: sysfs: Obey valid_mask
    2dce5702ef05 Input: nspire-keypad - enable interrupts only when opened
    6180d2274b17 net/sctp: fix race condition in sctp_destroy_sock
    304c21786b01 scsi: qla2xxx: Fix fabric scan hang
    ca0188d396cd scsi: qla2xxx: Fix stuck login session using prli_pend_timer
    c393c7f77cf8 scsi: qla2xxx: Add a shadow variable to hold disc_state history of fcport
    ad66dc6d8830 scsi: qla2xxx: Retry PLOGI on FC-NVMe PRLI failure
    8b5e82aea7b3 scsi: qla2xxx: Fix device connect issues in P2P configuration
    8eed34d3c444 scsi: qla2xxx: Dual FCP-NVMe target port support
    33beb0e6c244 Revert "scsi: qla2xxx: Fix stuck login session using prli_pend_timer"
    94ac0a8866c4 Revert "scsi: qla2xxx: Retry PLOGI on FC-NVMe PRLI failure"
    ab3bed80f9d3 Linux 5.4.113
    94371b6c5553 xen/events: fix setting irq affinity
    4ea6097986c4 perf map: Tighten snprintf() string precision to pass gcc check on some 32-bit arches
    d462247bb274 perf tools: Use %zd for size_t printf formats on 32-bit
    2715a4c0dc34 perf tools: Use %define api.pure full instead of %pure-parser
    799f02f0dfc4 driver core: Fix locking bug in deferred_probe_timeout_work_func()
    cc59b872f2e1 netfilter: x_tables: fix compat match/target pad out-of-bound write
    8119a2b42028 block: don't ignore REQ_NOWAIT for direct IO
    2d71bffbe9a0 riscv,entry: fix misaligned base for excp_vect_table
    90b71ae8e5cf idr test suite: Create anchor before launching throbber
    b9299c2bf554 idr test suite: Take RCU read lock in idr_find_test_1
    cde89079ce46 radix tree test suite: Register the main thread with the RCU library
    f5b60f26e36b block: only update parent bi_status when bio fail
    5b8f89685a9a drm/tegra: dc: Don't set PLL clock to 0Hz
    db162d8d7d08 gfs2: report "already frozen/thawed" errors
    3c89c7240412 drm/imx: imx-ldb: fix out of bounds array access warning
    e1ff1c6bbe4b KVM: arm64: Disable guest access to trace filter controls
    2012f9f75444 KVM: arm64: Hide system instruction access to Trace registers
    cc678e2f372e interconnect: core: fix error return code of icc_link_destroy()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a24b8651365b333e903b317ad969ba8adfed28c4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index a802a570a1..972b6306a6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "324e77d816cf6434507ab29140beb24044009efa"
-SRCREV_meta ?= "d7fd0213b75ce9b6206f63dbdd435ab326598642"
+SRCREV_machine ?= "da52117f6cbb53b6242803d432e8649a964f0435"
+SRCREV_meta ?= "e335eb1ff7c2948e263b9d59f1664c5bf198e4cf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.112"
+LINUX_VERSION ?= "5.4.114"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 1edc632de7..3886388ea9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.112"
+LINUX_VERSION ?= "5.4.114"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "8463db325b93f0669446f68c19334cfe11ffb9c2"
-SRCREV_machine ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
-SRCREV_meta ?= "d7fd0213b75ce9b6206f63dbdd435ab326598642"
+SRCREV_machine_qemuarm ?= "06631306658b18d4e29f721a43479d90effc3fc2"
+SRCREV_machine ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
+SRCREV_meta ?= "e335eb1ff7c2948e263b9d59f1664c5bf198e4cf"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 9c8c363713..d2743638ad 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "133328e5d558f6060a5633d71506a6b716bb4fc6"
-SRCREV_machine_qemuarm64 ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
-SRCREV_machine_qemumips ?= "eef7365804592f95bceefa143cdb3cc19e8c6b66"
-SRCREV_machine_qemuppc ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
-SRCREV_machine_qemuriscv64 ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
-SRCREV_machine_qemux86 ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
-SRCREV_machine_qemux86-64 ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
-SRCREV_machine_qemumips64 ?= "996fe040c8d8d01a9af6be42dae3844d127471bf"
-SRCREV_machine ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
-SRCREV_meta ?= "d7fd0213b75ce9b6206f63dbdd435ab326598642"
+SRCREV_machine_qemuarm ?= "d62f2d60acebc640c2749532e1527d1f117003d6"
+SRCREV_machine_qemuarm64 ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
+SRCREV_machine_qemumips ?= "ec6cca9ea72879a0d06ce1243e952a42a3435607"
+SRCREV_machine_qemuppc ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
+SRCREV_machine_qemuriscv64 ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
+SRCREV_machine_qemux86 ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
+SRCREV_machine_qemux86-64 ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
+SRCREV_machine_qemumips64 ?= "fd8bb72df12890ec21b27b83e26492ba527ebea3"
+SRCREV_machine ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
+SRCREV_meta ?= "e335eb1ff7c2948e263b9d59f1664c5bf198e4cf"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.112"
+LINUX_VERSION ?= "5.4.114"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.30.2

