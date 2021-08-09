Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.24726.1628523364931716435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 08:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="278466818"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="278466818"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="483462888"
Received: from abinzahx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.229.181])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:10 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 06/23] linux-yocto/5.4: update to v5.4.135
Date: Mon,  9 Aug 2021 23:35:38 +0800
Message-Id: <d3c82fed0ac3364e9eec1d49f982dea251033a81.1628522214.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628522214.git.anuj.mittal@intel.com>
References: <cover.1628522214.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    0a0beb1f9120 Linux 5.4.135
    d2f7b384a74f udp: annotate data races around unix_sk(sk)->gso_size
    c72374978b3f perf test bpf: Free obj_buf
    17bc942c0b96 bpftool: Properly close va_list 'ap' by va_end() on error
    84ed8340941a ipv6: tcp: drop silly ICMPv6 packet too big messages
    315033cab379 tcp: annotate data races around tp->mtu_info
    41f45e91c92c dma-buf/sync_file: Don't leak fences on merge failure
    04b06716838b net: fddi: fix UAF in fza_probe
    8aa13a86964c net: validate lwtstate->data before returning from skb_tunnel_info()
    8cff7b28ab05 net: send SYNACK packet with accepted fwmark
    b7e5563f2a78 net: ti: fix UAF in tlan:remove_one
    2b70ca92847c net: qcom/emac: fix UAF in emac:remove
    463c0addb4eb net: moxa: fix UAF in moxart_mac_probe
    7ac4a6a74e75 net: ip_tunnel: fix mtu calculation for ETHER tunnel devices
    d5dc50ca1f7a net: bcmgenet: Ensure all TX/RX queues DMAs are disabled
    7ecd40801e5b net: bridge: sync fdb to new unicast-filtering ports
    813d45499f51 net/sched: act_ct: fix err check for nf_conntrack_confirm
    24973073562f netfilter: ctnetlink: suspicious RCU usage in ctnetlink_dump_helpinfo
    c6f4a71153f4 net: ipv6: fix return value of ip6_skb_dst_mtu
    9872273b670a net: dsa: mv88e6xxx: enable .rmu_disable() on Topaz
    6148ddff2dcb net: dsa: mv88e6xxx: enable .port_set_policy() on Topaz
    d73c180e6add dm writecache: return the exact table values that were set
    8a85afc6621a mm: slab: fix kmem_cache_create failed when sysfs node not destroyed
    f53729b828db usb: cdns3: Enable TDL_CHK only for OUT ep
    52b01a808696 f2fs: Show casefolding support only when supported
    91d846016729 arm64: dts: marvell: armada-37xx: move firmware node to generic dtsi file
    f696cc7f1bc8 firmware: turris-mox-rwtm: add marvell,armada-3700-rwtm-firmware compatible string
    e2b28026b861 arm64: dts: armada-3720-turris-mox: add firmware node
    f7d1fa65e742 cifs: prevent NULL deref in cifs_compose_mount_options()
    06d8a7eb5803 s390: introduce proper type handling call_on_stack() macro
    2a47e0719ae7 sched/fair: Fix CFS bandwidth hrtimer expiry type
    5b7d065868a6 scsi: qedf: Add check to synchronize abort and flush
    0fe70c15f943 scsi: libfc: Fix array index out of bound exception
    d7b647d05586 scsi: libsas: Add LUN number check in .slave_alloc callback
    863c4bc883d5 scsi: aic7xxx: Fix unintentional sign extension issue on left shift of u8
    712e9ed6134f rtc: max77686: Do not enforce (incorrect) interrupt trigger type
    199d8ea4c7b1 kbuild: mkcompile_h: consider timestamp if KBUILD_BUILD_TIMESTAMP is set
    484193b635a7 thermal/core: Correct function name thermal_zone_device_unregister()
    556cf0283035 arm64: dts: imx8mq: assign PCIe clocks
    9d3eb68a5385 arm64: dts: ls208xa: remove bus-num from dspi node
    e054b361caec firmware: tegra: bpmp: Fix Tegra234-only builds
    94d009577033 soc/tegra: fuse: Fix Tegra234-only builds
    270a2e9fafea ARM: dts: stm32: move stmmac axi config in ethernet node on stm32mp15
    4bc66215bc22 ARM: dts: stm32: fix i2c node name on stm32f746 to prevent warnings
    856c753237ae ARM: dts: rockchip: fix supply properties in io-domains nodes
    c5bb9cc2ce23 arm64: dts: juno: Update SCPI nodes as per the YAML schema
    f572a9139396 ARM: dts: stm32: fix timer nodes on STM32 MCU to prevent warnings
    95e795474c81 ARM: dts: stm32: fix RCC node name on stm32f429 MCU
    a898aa9f88cc ARM: dts: stm32: fix gpio-keys node on STM32 MCU boards
    5c17edaaead7 ARM: dts: am437x-gp-evm: fix ti,no-reset-on-init flag for gpios
    3446233096ff ARM: dts: am57xx-cl-som-am57x: fix ti,no-reset-on-init flag for gpios
    e79e29a4e162 kbuild: sink stdout from cmd for silent build
    f817d4677582 rtc: mxc_v2: add missing MODULE_DEVICE_TABLE
    0a22b5178276 ARM: imx: pm-imx5: Fix references to imx5_cpu_suspend_info
    e20e85639e25 ARM: dts: imx6: phyFLEX: Fix UART hardware flow control
    a5b19d33ae22 ARM: dts: Hurricane 2: Fix NAND nodes names
    f83535a47ff8 ARM: dts: BCM63xx: Fix NAND nodes names
    cb05b84ad7f1 ARM: NSP: dts: fix NAND nodes names
    14e3bad3b548 ARM: Cygnus: dts: fix NAND nodes names
    587a757afe73 ARM: brcmstb: dts: fix NAND nodes names
    a9c32c7aeee6 reset: ti-syscon: fix to_ti_syscon_reset_data macro
    b400afa42739 arm64: dts: rockchip: Fix power-controller node names for rk3328
    dfb4e8ed0792 arm64: dts: rockchip: Fix power-controller node names for px30
    789070f17886 ARM: dts: rockchip: Fix power-controller node names for rk3288
    6aaffe6ce8a9 ARM: dts: rockchip: Fix power-controller node names for rk3188
    439115ee56d8 ARM: dts: rockchip: Fix power-controller node names for rk3066a
    3b4c34728382 ARM: dts: rockchip: Fix IOMMU nodes properties on rk322x
    c9d29d62da59 ARM: dts: rockchip: Fix the timer clocks order
    d105e15de610 arm64: dts: rockchip: fix pinctrl sleep nodename for rk3399.dtsi
    cfe3d29e5cde ARM: dts: rockchip: fix pinctrl sleep nodename for rk3036-kylin and rk3288
    79573c64410b ARM: dts: gemini: add device_type on pci
    7037876393ce ARM: dts: gemini: rename mdio to the right name

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5c36549fab7cc27bd2f4f9e8b6be1ec8546d32bd)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index a975004d76..0b5afd83cf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "849a67646d942d3a6d706f456df39954367ac7bf"
-SRCREV_meta ?= "d6aec4fb69bae34f34db6f153871a0847d8198f3"
+SRCREV_machine ?= "f4e30367bf1e579ff497fc9e7a16010c879048dc"
+SRCREV_meta ?= "231d3a07e10680c7c89ea101cd803b0684482b11"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.134"
+LINUX_VERSION ?= "5.4.135"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 95ead533d1..d7911cd54e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.134"
+LINUX_VERSION ?= "5.4.135"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "86c31c51c87557af60e4d4dbee73f18618bc4c92"
-SRCREV_machine ?= "bf89a54b3f77fbac15dd0194870db288aee5c8b7"
-SRCREV_meta ?= "d6aec4fb69bae34f34db6f153871a0847d8198f3"
+SRCREV_machine_qemuarm ?= "fa414639057bbad7acd21a1a70a3847f9be469c0"
+SRCREV_machine ?= "c81f0e376b1fce7a1198eec7b286966d98eae44d"
+SRCREV_meta ?= "231d3a07e10680c7c89ea101cd803b0684482b11"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 90a557bb63..4ac84e8ca3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "bea52ab7529ef152f99a0f6ebd97cc7e904e5360"
-SRCREV_machine_qemuarm64 ?= "8a29c9de0fc366bd89ce6954685dce0e330dbabe"
-SRCREV_machine_qemumips ?= "b15816ccad0762d27c78c269e7a1986504e60c63"
-SRCREV_machine_qemuppc ?= "906f9509a8d2f842ec8766bf81287f8939ff1fa8"
-SRCREV_machine_qemuriscv64 ?= "dd8a64a523fb714a98328441e0de72cde115a6fc"
-SRCREV_machine_qemux86 ?= "dd8a64a523fb714a98328441e0de72cde115a6fc"
-SRCREV_machine_qemux86-64 ?= "dd8a64a523fb714a98328441e0de72cde115a6fc"
-SRCREV_machine_qemumips64 ?= "152e33a0782920e9707c36ccacf53585a8911e9f"
-SRCREV_machine ?= "dd8a64a523fb714a98328441e0de72cde115a6fc"
-SRCREV_meta ?= "d6aec4fb69bae34f34db6f153871a0847d8198f3"
+SRCREV_machine_qemuarm ?= "f367cbe6d0c21c65257c66a4c9b1845fd43285f8"
+SRCREV_machine_qemuarm64 ?= "8dcb7ee83e58da8bf51ed8b72165e1ed35beb928"
+SRCREV_machine_qemumips ?= "3d4c6263bfdf95960894b75c76aa450d240e3e8e"
+SRCREV_machine_qemuppc ?= "125a824c8d14c49b640bc0d6e040d495177caa10"
+SRCREV_machine_qemuriscv64 ?= "997c04e7a40084a53bc3d45490949584364697bd"
+SRCREV_machine_qemux86 ?= "997c04e7a40084a53bc3d45490949584364697bd"
+SRCREV_machine_qemux86-64 ?= "997c04e7a40084a53bc3d45490949584364697bd"
+SRCREV_machine_qemumips64 ?= "7082f58984404a5aad90bca1dac4e27773fff26e"
+SRCREV_machine ?= "997c04e7a40084a53bc3d45490949584364697bd"
+SRCREV_meta ?= "231d3a07e10680c7c89ea101cd803b0684482b11"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.134"
+LINUX_VERSION ?= "5.4.135"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1

