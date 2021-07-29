Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.5422.1627534208066189361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 21:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d0qfDOUh;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id x9so3083568qtw.13
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 21:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hGI+Mi4RshU4+AAXtqPxslEIjw3IapI5mRb0Dkhards=;
        b=d0qfDOUhuit8dn4ONx9aoujyF7ocwHaEhyBQOajs4xDpMWswPE9GVT+690BZL2UA+c
         gDeif4Uy2uF0G1phYQKXsPCQnSqaB2VVinZpeeCkPM0dWu2O2CWm8+githX0KBkeiKaU
         1/a9IXl0RGbEm0yJHPQViSzTCow+nkHZtqxKnHBUCuuCeVpbeWSAP8iRpoe22PmGzyxU
         6T4m2EUYSNNVJBZTih+mrMk0tD/qrNV7tOODIg8rytcWerTEOSDVtI+Unv+EILy6kxB3
         9/SieIQ3NBta+iPsqs8ivycRH53Dg/KSn9HOsKkjTyzaAXkE+TsMGNwA9SjQpETjesEF
         HWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hGI+Mi4RshU4+AAXtqPxslEIjw3IapI5mRb0Dkhards=;
        b=pFGzMBfWusulMeKK8WFWNyA6IEq6WrAT8tZYWERgGCaDsnuOJ24mUp4PUmGaLvvEJF
         TSrypOz+iQ6QyiTMXRMebu1ieU5eaN9YiNakkf8Vn4fjpT4yh8dzHkIXKqh+2Y3PRciS
         1vrH3HnjUzQwfznlzwOHcCb1Vqb4vB+D5Aq1J18kk2k3crcYwZXz2GAI6iDl260SZnqs
         PlKTBs9/jBhIsC+mIQ04GiR1qQVwOXEtCXjPLSnPgMF0tcsgmVjYWOLPLGgolTslJVkc
         c5D+7Yrvtljl4YJLZxzNtkfYwihRJouRush2VJU26GCE/c/xIxFnbvH7idyy1JHIP7fb
         A2tg==
X-Gm-Message-State: AOAM533bcOhcaClOeNAydEmDoIMfCJZ4FxDNW3PxP2st1WsF45l6KPaS
	sDWutHd6oa0S6tYN2Kbw+wtIFVfaXDtbkQAl
X-Google-Smtp-Source: ABdhPJx1tR63WosiSdCmW0AFPHN7C/0l5SOR4hnq+UDl0B3A18BzTzduLH9Glx2IPvhGvHUhy9pyQA==
X-Received: by 2002:a05:622a:14a:: with SMTP id v10mr2723010qtw.383.1627534207115;
        Wed, 28 Jul 2021 21:50:07 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id t26sm826147qtc.44.2021.07.28.21.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 21:50:06 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] linux-yocto/5.13: update to v5.13.5
Date: Thu, 29 Jul 2021 00:49:59 -0400
Message-Id: <60ce6f33c4dc7919bb796d27791f06541f7ff002.1627533955.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1627533955.git.bruce.ashfield@gmail.com>
References: <cover.1627533955.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.13 to the latest korg -stable release that comprises
the following commits:

    25423f4bd9a9 Linux 5.13.5
    c50bcc85a057 mt76: mt7921: continue to probe driver when fw already downloaded
    c1b582a7e364 udp: properly flush normal packet at GRO time
    e3104dccdd79 udp: annotate data races around unix_sk(sk)->gso_size
    010f5d09fa32 firmware: arm_scmi: Avoid padding in sensor message structure
    90ed7e5771ea drm/panel: nt35510: Do not fail if DSI read fails
    fcd280d92bad perf test bpf: Free obj_buf
    599148d40366 bpf: Track subprog poke descriptors correctly and fix use-after-free
    4edc469e4a63 bpftool: Properly close va_list 'ap' by va_end() on error
    a3b4cb28a2e8 tools: bpf: Fix error in 'make -C tools/ bpf_install'
    e023c648a764 tcp: call sk_wmem_schedule before sk_mem_charge in zerocopy path
    c0fea93d9f77 ipv6: tcp: drop silly ICMPv6 packet too big messages
    fe77b85828ca tcp: fix tcp_init_transfer() to not reset icsk_ca_initialized
    341dd0904d4f tcp: annotate data races around tp->mtu_info
    108727841c25 tcp: consistently disable header prediction for mptcp
    ed8c953ef967 ARM: dts: everest: Add phase corrections for eMMC
    cc02a1bd5b7b ARM: dts: tacoma: Add phase corrections for eMMC
    5cc4abeab14f ARM: dts: aspeed: Fix AST2600 machines line names
    6f6f8f894a55 vboxsf: Add support for the atomic_open directory-inode op
    53c4f60ed9dd vboxsf: Add vboxsf_[create|release]_sf_handle() helpers
    6e64fd2f677f vboxsf: Make vboxsf_dir_create() return the handle for the created file
    1f7cdb5def52 vboxsf: Honor excl flag to the dir-inode create op
    753b33d387ec kbuild: do not suppress Kconfig prompts for silent build
    19edcd97727a dma-buf/sync_file: Don't leak fences on merge failure
    bdfbb51f7a43 net: fddi: fix UAF in fza_probe
    d7243e2ab1c6 net: dsa: properly check for the bridge_leave methods in dsa_switch_bridge_leave()
    a915379594f1 net: validate lwtstate->data before returning from skb_tunnel_info()
    12917871d234 net: do not reuse skbuff allocated from skbuff_fclone_cache in the skb cache
    d731dcbcefd2 net: send SYNACK packet with accepted fwmark
    93efab0ef2a6 net: ti: fix UAF in tlan_remove_one
    8a225a6e07a5 net: qcom/emac: fix UAF in emac_remove
    aa92c87dc2d8 net: moxa: fix UAF in moxart_mac_probe
    db3177b7ff0e net: ip_tunnel: fix mtu calculation for ETHER tunnel devices
    02906fda9e7f net: bcmgenet: Ensure all TX/RX queues DMAs are disabled
    fd51ccd9c971 net: netdevsim: use xso.real_dev instead of xso.dev in callback functions of struct xfrmdev_ops
    c5e07e8c8ec8 net: marvell: always set skb_shared_info in mvneta_swbm_add_rx_fragment
    3863428b04be net: bridge: sync fdb to new unicast-filtering ports
    fda8adcbbc70 net/sched: act_ct: remove and free nf_table callbacks
    c3eb534eae09 vmxnet3: fix cksum offload issues for tunnels with non-default udp ports
    70a5a1950cca netfilter: nf_tables: Fix dereference of null pointer flow
    c6eb7ce9f11c net/sched: act_ct: fix err check for nf_conntrack_confirm
    a598091fc909 netfilter: ctnetlink: suspicious RCU usage in ctnetlink_dump_helpinfo
    f6eaa0620312 net: ipv6: fix return value of ip6_skb_dst_mtu
    231ea2169024 net: dsa: mv88e6xxx: enable SerDes PCS register dump via ethtool -d on Topaz
    c57e63264dfb net: dsa: mv88e6xxx: enable SerDes RX stats for Topaz
    8eef55a59620 net: dsa: mv88e6xxx: enable devlink ATU hash param for Topaz
    0104c68efb3e net: dsa: mv88e6xxx: enable .rmu_disable() on Topaz
    8263e5c08f46 net: dsa: mv88e6xxx: use correct .stats_set_histogram() on Topaz
    36d57bbdf93f net: dsa: mv88e6xxx: enable .port_set_policy() on Topaz
    c74ded51a37f net: bcmgenet: ensure EXT_ENERGY_DET_MASK is clear
    8c4f51b15196 f2fs: Show casefolding support only when supported
    ac1714556003 mm/userfaultfd: fix uffd-wp special cases for fork()
    fd26ee0a1a82 mm/thp: simplify copying of huge zero page pmd when fork
    b33e80b18a0a Revert "mm/shmem: fix shmem_swapin() race with swapoff"
    58d7ce3934ae Revert "swap: fix do_swap_page() race with swapoff"
    03c03b893661 arm64: dts: marvell: armada-37xx: move firmware node to generic dtsi file
    cffb7390312e firmware: turris-mox-rwtm: add marvell,armada-3700-rwtm-firmware compatible string
    ae3d181f4e91 cifs: prevent NULL deref in cifs_compose_mount_options()
    c007614e78a1 s390: introduce proper type handling call_on_stack() macro
    6ef3f584b593 s390/traps: do not test MONITOR CALL without CONFIG_BUG
    09f1a8d85ec1 thermal/core/thermal_of: Stop zone device before unregistering it
    505c12a1bd71 perf/x86/intel/uncore: Clean up error handling path of iio mapping
    06d6142e1421 sched/fair: Fix CFS bandwidth hrtimer expiry type
    8997002a88aa scsi: qedf: Add check to synchronize abort and flush
    8511293e643a scsi: libfc: Fix array index out of bound exception
    f661723909ad scsi: libsas: Add LUN number check in .slave_alloc callback
    9015de5e72d0 scsi: aic7xxx: Fix unintentional sign extension issue on left shift of u8
    1c033966a916 rtc: max77686: Do not enforce (incorrect) interrupt trigger type
    2a04a3607548 arch/arm64/boot/dts/marvell: fix NAND partitioning scheme
    26125ddc6904 kbuild: mkcompile_h: consider timestamp if KBUILD_BUILD_TIMESTAMP is set
    4a7f9e9b24b9 arm64: dts: qcom: sm8150: Disable Adreno and modem by default
    81c2374228cf arm64: dts: qcom: sm8250: Fix pcie2_lane unit address
    9e159edfefb1 thermal/drivers/sprd: Add missing of_node_put for loop iteration
    9a70f266994e thermal/drivers/imx_sc: Add missing of_node_put for loop iteration
    82ad14246066 thermal/drivers/rcar_gen3_thermal: Do not shadow rcar_gen3_ths_tj_1
    c3e1034bf7a2 thermal/core: Correct function name thermal_zone_device_unregister()
    bbb41aa6ee41 arm64: dts: imx8: conn: fix enet clock setting
    6d14b0e1cea1 arm64: dts: imx8mq: assign PCIe clocks
    646b6021ff2e arm64: dts: imx8mn-beacon-som: Assign PMIC clock
    5345699a5297 arm64: dts: ls208xa: remove bus-num from dspi node
    cef210690a7a arm64: dts: rockchip: Update RK3399 PCI host bridge window to 32-bit address memory
    ee3acd45dc45 firmware: tegra: bpmp: Fix Tegra234-only builds
    ad36bf954334 soc/tegra: fuse: Fix Tegra234-only builds
    7d9beefb89d0 ARM: OMAP2+: Block suspend for am3 and am4 if PM is not configured
    72ea603ebc7f arm64: dts: qcom: sc7180: Add wakeup delay for adau codec
    a38e8678f0ad ARM: dts: stm32: fix stpmic node for stm32mp1 boards
    6ea5c31a9ff6 ARM: dts: stm32: Rename spi-flash/mx66l51235l@N to flash@N on DHCOM SoM
    208d0b5c4fe8 ARM: dts: stm32: Rename eth@N to ethernet@N on DHCOM SoM
    5ba5ec23b95d ARM: dts: stm32: Drop unused linux,wakeup from touchscreen node on DHCOM SoM
    1ff4043818da ARM: dts: stm32: fix the Odyssey SoM eMMC VQMMC supply
    d3ad6193b11b ARM: dts: stm32: fix ltdc pinctrl on microdev2.0-of7
    45134048d407 ARM: dts: stm32: move stmmac axi config in ethernet node on stm32mp15
    c68df704e91f ARM: dts: stm32: fix i2c node name on stm32f746 to prevent warnings
    4d74e43113bc ARM: dts: rockchip: fix supply properties in io-domains nodes
    b6824bc92923 arm64: dts: juno: Update SCPI nodes as per the YAML schema
    6ddae8441dc2 i3c: master: svc: drop free_irq of devm_request_irq allocated irq
    81cc76202847 ARM: dts: bcm283x: Fix up GPIO LED node names
    97b95aa1abfc ARM: dts: bcm283x: Fix up MMC node names
    668f66189026 ARM: dts: aspeed: Everest: Fix cable card PCA chips
    9a92a6efb8e6 firmware: arm_scmi: Fix the build when CONFIG_MAILBOX is not selected
    b9e7b8c0b9ef firmware: arm_scmi: Add SMCCC discovery dependency in Kconfig
    8ec19b8b9c33 memory: tegra: Fix compilation warnings on 64bit platforms
    bf6e424135e3 ARM: dts: stm32: fix timer nodes on STM32 MCU to prevent warnings
    9e4183ab28b0 ARM: dts: stm32: fix RCC node name on stm32f429 MCU
    5d36882a85f7 ARM: dts: stm32: fix gpio-keys node on STM32 MCU boards
    2a735d7a8167 ARM: dts: stm32: fix stm32mp157c-odyssey card detect pin
    ea9312e7804e ARM: dts: stm32: Fix touchscreen node on dhcom-pdk2
    39fb433494c2 ARM: dts: stm32: Remove extra size-cells on dhcom-pdk2
    1dfe852260bd arm64: dts: qcom: sc7180: Move rmtfs memory region
    58e1d4a68cb5 arm64: dts: qcom: sm8250: fix display nodes
    638c3fc9774e arm64: dts: qcom: sm8350: fix the node unit addresses
    3df317941718 ARM: tegra: nexus7: Correct 3v3 regulator GPIO of PM269 variant
    94c054179d17 ARM: tegra: wm8903: Fix polarity of headphones-detection GPIO in device-trees
    cf48dfa5aa26 arm64: dts: ti: k3-am654x/j721e/j7200-common-proc-board: Fix MCU_RGMII1_TXC direction
    105f6beddcb8 arm64: tegra: Add PMU node for Tegra194
    7ac85c09d5be ARM: dts: OMAP2+: Replace underscores in sub-mailbox node names
    7752857c652f ARM: dts: am335x: fix ti,no-reset-on-init flag for gpios
    7bfbec1bf56f ARM: dts: am437x-gp-evm: fix ti,no-reset-on-init flag for gpios
    24df090958a3 ARM: dts: am57xx-cl-som-am57x: fix ti,no-reset-on-init flag for gpios
    1b45d9048ff4 kbuild: sink stdout from cmd for silent build
    3e079812f469 arm64: dts: renesas: beacon: Fix USB ref clock references
    27469bcc5b05 arm64: dts: renesas: beacon: Fix USB extal reference
    b5f38dc8381c rtc: mxc_v2: add missing MODULE_DEVICE_TABLE
    0c5b081a4d0a ARM: dts: ux500: Fix orientation of Janice accelerometer
    15cd8eb0c2e6 ARM: dts: imx6dl-riotboard: configure PHY clock and set proper EEE value
    4f0520fad7d8 ARM: dts: ux500: Fix some compatible strings
    b28ddd20572a ARM: dts: ux500: Fix orientation of accelerometer
    7f1d0da1cc41 ARM: dts: ux500: Rename gpio-controller node
    049ec888cd62 ARM: dts: ux500: Fix interrupt cells
    ea98b9eb6862 arm64: dts: rockchip: fix regulator-gpio states array
    9680f1e8f8b5 ARM: imx: pm-imx5: Fix references to imx5_cpu_suspend_info
    9b3161825b24 ARM: dts: imx6: phyFLEX: Fix UART hardware flow control
    f686c2ca9145 soc: mediatek: add missing MODULE_DEVICE_TABLE
    556e5beac048 soc: bcm: brcmstb: remove unused variable 'brcmstb_machine_match'
    3e3a7d2bf0d5 ARM: dts: BCM5301X: Fix pinmux subnodes names
    d8428468f91a ARM: dts: Hurricane 2: Fix NAND nodes names
    051500990321 ARM: dts: BCM63xx: Fix NAND nodes names
    c477ee9b6402 ARM: NSP: dts: fix NAND nodes names
    14a49e42f74c ARM: Cygnus: dts: fix NAND nodes names
    12e303c937a2 ARM: brcmstb: dts: fix NAND nodes names
    ca57a034e846 ARM: dts: BCM5301X: Fix NAND nodes names
    ea49b15d27f0 reset: ti-syscon: fix to_ti_syscon_reset_data macro
    ac00948749f1 arm64: dts: rockchip: Fix power-controller node names for rk3399
    e2cc3578a628 arm64: dts: rockchip: Fix power-controller node names for rk3328
    0ff2235f030a arm64: dts: rockchip: Fix power-controller node names for px30
    5ada42440f49 ARM: dts: rockchip: Fix power-controller node names for rk3288
    0151a90fc279 ARM: dts: rockchip: Fix power-controller node names for rk3188
    af5ca9f83fad ARM: dts: rockchip: Fix power-controller node names for rk3066a
    9015d0c9b072 ARM: dts: rockchip: Fix IOMMU nodes properties on rk322x
    991661f15817 ARM: dts: rockchip: Fix the timer clocks order
    670079df8659 arm64: dts: rockchip: fix pinctrl sleep nodename for rk3399.dtsi
    5980cb81f165 arm64: dts: rockchip: Use only supported PCIe link speed on rk3399
    68d1369daf96 ARM: dts: rockchip: fix pinctrl sleep nodename for rk3036-kylin and rk3288
    deacb07e91be ARM: dts: rockchip: Fix thermal sensor cells o rk322x
    f6e1fd15b3ee ARM: dts: gemini: add device_type on pci
    6f9ba39547e2 ARM: dts: gemini: rename mdio to the right name

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.13.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.13.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
index adcc84bd4a..feaad79d92 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "10eba41eae2548d854c5d1908db77e8235336191"
-SRCREV_meta ?= "ab5f1940535350791d2e111e0e16b08be277568d"
+SRCREV_machine ?= "f7609685b99c816483dd1eb4d3d7cfd236abcd8a"
+SRCREV_meta ?= "676addb3befc0f44818ed231d90c58d8e4fc005f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.13.4"
+LINUX_VERSION ?= "5.13.5"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
index 6598684bbb..b2e7a2f512 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.13.4"
+LINUX_VERSION ?= "5.13.5"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "e394a72e8bc77484bf7bae8c842c75b23cc3dd63"
-SRCREV_machine ?= "7275d462cec720120d1767e277a2525d88901c80"
-SRCREV_meta ?= "ab5f1940535350791d2e111e0e16b08be277568d"
+SRCREV_machine_qemuarm ?= "52d457436c83b3ce994a12d5387c532df7859e3d"
+SRCREV_machine ?= "e167b61e5f9f6e6de8d57f72ed022ea6cdf9ba85"
+SRCREV_meta ?= "676addb3befc0f44818ed231d90c58d8e4fc005f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
index 497c3307d5..b26bb22f3f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.13/standard/base"
 KBRANCH_qemux86-64 ?= "v5.13/standard/base"
 KBRANCH_qemumips64 ?= "v5.13/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "dc19ba17f4d43a220ae8129312703add02d03d1e"
-SRCREV_machine_qemuarm64 ?= "1e086c08b65e8bd1f45f01fd8026599a62deb6c0"
-SRCREV_machine_qemumips ?= "4dd19bc8178a6100a2cb9ffd8364e359230253c8"
-SRCREV_machine_qemuppc ?= "73c8e406db9beb3a99a5dd3ea67824f0e3c0d7a8"
-SRCREV_machine_qemuriscv64 ?= "5e41c505c6057535da2c289d2cc2fec1f64a5068"
-SRCREV_machine_qemuriscv32 ?= "5e41c505c6057535da2c289d2cc2fec1f64a5068"
-SRCREV_machine_qemux86 ?= "5e41c505c6057535da2c289d2cc2fec1f64a5068"
-SRCREV_machine_qemux86-64 ?= "5e41c505c6057535da2c289d2cc2fec1f64a5068"
-SRCREV_machine_qemumips64 ?= "0632623fd488acc7c78a4f48d4630caba5e6044e"
-SRCREV_machine ?= "5e41c505c6057535da2c289d2cc2fec1f64a5068"
-SRCREV_meta ?= "ab5f1940535350791d2e111e0e16b08be277568d"
+SRCREV_machine_qemuarm ?= "d7f11adcd88182a9201a9901f3ccd07e2143bf5b"
+SRCREV_machine_qemuarm64 ?= "8ba49ea4d2954c788b44acf8efd2713d8d69f1e3"
+SRCREV_machine_qemumips ?= "9d92ef75cabdf752e3186aa734ba57866cc512d9"
+SRCREV_machine_qemuppc ?= "6fac7caad94efa0be0e46d04af4e7b5f1300aa92"
+SRCREV_machine_qemuriscv64 ?= "aa7f96bda2be286bc15b1131be30411bb6016ea1"
+SRCREV_machine_qemuriscv32 ?= "aa7f96bda2be286bc15b1131be30411bb6016ea1"
+SRCREV_machine_qemux86 ?= "aa7f96bda2be286bc15b1131be30411bb6016ea1"
+SRCREV_machine_qemux86-64 ?= "aa7f96bda2be286bc15b1131be30411bb6016ea1"
+SRCREV_machine_qemumips64 ?= "c6c25c0c1a64480f255a9c2e86895db0aea8b92b"
+SRCREV_machine ?= "aa7f96bda2be286bc15b1131be30411bb6016ea1"
+SRCREV_meta ?= "676addb3befc0f44818ed231d90c58d8e4fc005f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "ab5f1940535350791d2e111e0e16b08be277568d"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE_class-devupstream = "-1"
-SRCREV_machine_class-devupstream ?= "64376a981a0e2e57c46efa63197c2ebb7dab35df"
+SRCREV_machine_class-devupstream ?= "25423f4bd9a9ac3e6b0ce7ecfe56c36f4e514893"
 PN_class-devupstream = "linux-yocto-upstream"
 KBRANCH_class-devupstream = "v5.13/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.13.4"
+LINUX_VERSION ?= "5.13.5"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

