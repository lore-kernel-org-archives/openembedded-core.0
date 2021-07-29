Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web09.5336.1627534207277940673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 21:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OIbSLJt7;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id az7so4724303qkb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 21:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K8YSITPqG3WBsdr2TBRWvDk1rhlHRkTrTabgOr8umR4=;
        b=OIbSLJt7mlVvLfzFgSV15OxRKUe52NdchnVQ68OFghqXueSpEIS77LLaw0tlCgIQZc
         PILIXuyOmExwqhzpBUn3dTsyIr+NAOBPwHqs/llCSHpv2QFaZgz4hz56Rl+ckaT0F9uc
         ZEHg88fKYT54Qyca4v8Kw6ZneOmJDem84a3ZF9X2x5MrH2x6p8+zrTkvxGVY2t/JbsfY
         gAMjUQwutnShOJF7agcCwRTBp/jcAxnipbPFFASXJB7b0xtWhKjFPSGrwEdLDPOuI6YX
         8t2YOX5uHm7WtLGzGXhKOXL1IgBbDzWHO9gIunIV5Kgscao2y24um9WgEDA5JQJdcruV
         4D+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K8YSITPqG3WBsdr2TBRWvDk1rhlHRkTrTabgOr8umR4=;
        b=aolOSq5rhMwbLj6gUB8l+bn0ymzC6MW6vW27udzGqzOuZGGZYCTIi4lld8u+YKQiYs
         0E0zast19u0uvtFpajlRf3yV3zAmRvdQHislYzYw/0RMk8F/NAO5r+zXNq9T7AswldfI
         Y88jzYRHUs93tnw0H2NUYjnKt+Cy6reoRylhbhqEXnfIBui4u9UJQhhKenygu4f0nsse
         Zw6/PAng6aRgaUWPsZ066bTCGzqDfCoxnPjcj1+a5vTOC8QnDq2rb+obkWBLtocxWKGf
         WFVY/H4PnvT2J1YS5jqai0WKEt9B8RnV89ltTbHsCQuzROD73NNLY9PbCCrUf5v2OcHN
         ai+A==
X-Gm-Message-State: AOAM531lh/N6QOcqNg50JRmeZMVXvUl/ZVaVWGlwMDyvs3Be32FjOLQY
	oQUbWagybpDOTbsxYickYidlUiDkMfZt0Xhd
X-Google-Smtp-Source: ABdhPJyleMtLquGw+JA9dslO4iOlsDutbyDO31G5GTKMftEfemRzDWGQ2gQK/SYu6CGsm12whJdn+g==
X-Received: by 2002:a05:620a:11b4:: with SMTP id c20mr3283148qkk.493.1627534206218;
        Wed, 28 Jul 2021 21:50:06 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id t26sm826147qtc.44.2021.07.28.21.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 21:50:05 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto/5.10: update to v5.10.53
Date: Thu, 29 Jul 2021 00:49:58 -0400
Message-Id: <9963e71bd1b8ec8a47a99d1e60aea9c8a1270041.1627533955.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1627533955.git.bruce.ashfield@gmail.com>
References: <cover.1627533955.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    71046eac2db9 Linux 5.10.53
    6cd9bd2a2ddb udp: annotate data races around unix_sk(sk)->gso_size
    bfdb38a4268a drm/panel: nt35510: Do not fail if DSI read fails
    0d90d8492fb9 perf test bpf: Free obj_buf
    a9f36bf3613c bpf: Track subprog poke descriptors correctly and fix use-after-free
    782d71e29b29 bpftool: Properly close va_list 'ap' by va_end() on error
    2381b8e882d0 tools: bpf: Fix error in 'make -C tools/ bpf_install'
    638632997c31 tcp: call sk_wmem_schedule before sk_mem_charge in zerocopy path
    2fee3cf4c97b ipv6: tcp: drop silly ICMPv6 packet too big messages
    ad4ba3404931 tcp: fix tcp_init_transfer() to not reset icsk_ca_initialized
    d60f07bcb76f tcp: annotate data races around tp->mtu_info
    ea66fcb29605 tcp: consistently disable header prediction for mptcp
    c28c747e37db ARM: dts: tacoma: Add phase corrections for eMMC
    e55160537d76 ARM: dts: aspeed: Fix AST2600 machines line names
    ff4b8f35c96c kbuild: do not suppress Kconfig prompts for silent build
    0d514185ae79 dma-buf/sync_file: Don't leak fences on merge failure
    f33605908a9b net: fddi: fix UAF in fza_probe
    66c73f187d1e net: dsa: properly check for the bridge_leave methods in dsa_switch_bridge_leave()
    7d7d0e84ac0d Revert "mm/shmem: fix shmem_swapin() race with swapoff"
    2179d96ec702 net: validate lwtstate->data before returning from skb_tunnel_info()
    b61d8814c477 net: send SYNACK packet with accepted fwmark
    f2a062fcfe1d net: ti: fix UAF in tlan_remove_one
    b560521eca03 net: qcom/emac: fix UAF in emac_remove
    dbbf5b957bd9 net: moxa: fix UAF in moxart_mac_probe
    88ff9ec9c67a net: ip_tunnel: fix mtu calculation for ETHER tunnel devices
    846829e75db5 net: bcmgenet: Ensure all TX/RX queues DMAs are disabled
    b9fa66072fee net: netdevsim: use xso.real_dev instead of xso.dev in callback functions of struct xfrmdev_ops
    59070cc43d1d net: bridge: sync fdb to new unicast-filtering ports
    7b5a2910e782 net/sched: act_ct: remove and free nf_table callbacks
    6d4476236f79 vmxnet3: fix cksum offload issues for tunnels with non-default udp ports
    c3bc9ce7d400 net/sched: act_ct: fix err check for nf_conntrack_confirm
    fc40fdefd94a netfilter: ctnetlink: suspicious RCU usage in ctnetlink_dump_helpinfo
    34365de50806 net: ipv6: fix return value of ip6_skb_dst_mtu
    73146745ff28 net: dsa: mv88e6xxx: enable devlink ATU hash param for Topaz
    a8c7ba368748 net: dsa: mv88e6xxx: enable .rmu_disable() on Topaz
    14cd8ce80ad7 net: dsa: mv88e6xxx: use correct .stats_set_histogram() on Topaz
    c657413dcddf net: dsa: mv88e6xxx: enable .port_set_policy() on Topaz
    fcb970edc0be net: bcmgenet: ensure EXT_ENERGY_DET_MASK is clear
    4e275a4aca68 usb: cdns3: Enable TDL_CHK only for OUT ep
    ce6ee46e0f39 mm/page_alloc: fix memory map initialization for descending nodes
    9e1cf2d1ed37 mm/userfaultfd: fix uffd-wp special cases for fork()
    84ff5f66c3f6 mm/thp: simplify copying of huge zero page pmd when fork
    a62177b35730 f2fs: Show casefolding support only when supported
    277b311ae170 Revert "swap: fix do_swap_page() race with swapoff"
    d92aa22f2419 arm64: dts: marvell: armada-37xx: move firmware node to generic dtsi file
    0e67c76384e9 firmware: turris-mox-rwtm: add marvell,armada-3700-rwtm-firmware compatible string
    e58c162789be cifs: prevent NULL deref in cifs_compose_mount_options()
    faa3e7da487a s390: introduce proper type handling call_on_stack() macro
    be10fff3a461 s390/traps: do not test MONITOR CALL without CONFIG_BUG
    9beba1469996 thermal/core/thermal_of: Stop zone device before unregistering it
    7412c988fe12 perf/x86/intel/uncore: Clean up error handling path of iio mapping
    892387e7619e sched/fair: Fix CFS bandwidth hrtimer expiry type
    eb859b043c2e scsi: qedf: Add check to synchronize abort and flush
    a4a54c54af25 scsi: libfc: Fix array index out of bound exception
    0d7596a954f1 scsi: libsas: Add LUN number check in .slave_alloc callback
    2f8df6332eb2 scsi: aic7xxx: Fix unintentional sign extension issue on left shift of u8
    cdb995a6cbb5 rtc: max77686: Do not enforce (incorrect) interrupt trigger type
    d3ba15fb0401 arch/arm64/boot/dts/marvell: fix NAND partitioning scheme
    e378db118925 kbuild: mkcompile_h: consider timestamp if KBUILD_BUILD_TIMESTAMP is set
    8c12a3a68d4f thermal/drivers/sprd: Add missing of_node_put for loop iteration
    20babcd83092 thermal/drivers/imx_sc: Add missing of_node_put for loop iteration
    469951ce4bb0 thermal/drivers/rcar_gen3_thermal: Do not shadow rcar_gen3_ths_tj_1
    bd40e2da3ae5 thermal/core: Correct function name thermal_zone_device_unregister()
    6c099d595fd7 arm64: dts: imx8mq: assign PCIe clocks
    24c41aa9d01b arm64: dts: ls208xa: remove bus-num from dspi node
    7e3f5739cccb firmware: tegra: bpmp: Fix Tegra234-only builds
    7c03982fa134 soc/tegra: fuse: Fix Tegra234-only builds
    ffa6f08be14a ARM: OMAP2+: Block suspend for am3 and am4 if PM is not configured
    f40a7c9b8ee1 ARM: dts: stm32: fix stpmic node for stm32mp1 boards
    2670d3d1ef47 ARM: dts: stm32: Rename spi-flash/mx66l51235l@N to flash@N on DHCOM SoM
    26cd441c529d ARM: dts: stm32: Drop unused linux,wakeup from touchscreen node on DHCOM SoM
    a5bc2a2d838e ARM: dts: stm32: fix the Odyssey SoM eMMC VQMMC supply
    e27052f21a2f ARM: dts: stm32: move stmmac axi config in ethernet node on stm32mp15
    6a7af6347810 ARM: dts: stm32: fix i2c node name on stm32f746 to prevent warnings
    160c92d728f3 ARM: dts: rockchip: fix supply properties in io-domains nodes
    d671fae04648 arm64: dts: juno: Update SCPI nodes as per the YAML schema
    fc71d8df5807 ARM: dts: bcm283x: Fix up GPIO LED node names
    4bc03e321f2a ARM: dts: bcm283x: Fix up MMC node names
    15d727c044d5 firmware: arm_scmi: Fix the build when CONFIG_MAILBOX is not selected
    b4009ea92f29 firmware: arm_scmi: Add SMCCC discovery dependency in Kconfig
    41e2bcca23f1 memory: tegra: Fix compilation warnings on 64bit platforms
    7ad965c8a723 ARM: dts: stm32: fix timer nodes on STM32 MCU to prevent warnings
    ccec32f77144 ARM: dts: stm32: fix RCC node name on stm32f429 MCU
    bfbc4b482078 ARM: dts: stm32: fix gpio-keys node on STM32 MCU boards
    34ec6702a2a1 ARM: dts: stm32: fix stm32mp157c-odyssey card detect pin
    44f4e344f4f0 ARM: dts: stm32: Fix touchscreen node on dhcom-pdk2
    3534a4b2d059 ARM: dts: stm32: Remove extra size-cells on dhcom-pdk2
    8da771b5527c arm64: dts: qcom: sc7180: Move rmtfs memory region
    a74d3bbe0553 ARM: tegra: nexus7: Correct 3v3 regulator GPIO of PM269 variant
    e89f4098d528 ARM: tegra: wm8903: Fix polarity of headphones-detection GPIO in device-trees
    c8815d6fee79 arm64: dts: ti: k3-am654x/j721e/j7200-common-proc-board: Fix MCU_RGMII1_TXC direction
    28d2ae98154e ARM: dts: OMAP2+: Replace underscores in sub-mailbox node names
    a73a22a69f6a ARM: dts: am335x: fix ti,no-reset-on-init flag for gpios
    ddf2d14894d0 ARM: dts: am437x-gp-evm: fix ti,no-reset-on-init flag for gpios
    a09b4c444941 ARM: dts: am57xx-cl-som-am57x: fix ti,no-reset-on-init flag for gpios
    3f0948569997 kbuild: sink stdout from cmd for silent build
    27582c9fa294 rtc: mxc_v2: add missing MODULE_DEVICE_TABLE
    6f5891a560df ARM: dts: imx6dl-riotboard: configure PHY clock and set proper EEE value
    5190a6604a10 ARM: dts: ux500: Fix orientation of accelerometer
    61fda04276bb ARM: dts: ux500: Rename gpio-controller node
    985947c53555 ARM: dts: ux500: Fix interrupt cells
    ff9ef21bb6fb arm64: dts: rockchip: fix regulator-gpio states array
    31e1b8c07d35 ARM: imx: pm-imx5: Fix references to imx5_cpu_suspend_info
    d05ebeffca1d ARM: dts: imx6: phyFLEX: Fix UART hardware flow control
    249d8e4ea168 ARM: dts: Hurricane 2: Fix NAND nodes names
    f6541401dbd6 ARM: dts: BCM63xx: Fix NAND nodes names
    b5fc6b9ab427 ARM: NSP: dts: fix NAND nodes names
    5f844007eb91 ARM: Cygnus: dts: fix NAND nodes names
    9525d58c5af8 ARM: brcmstb: dts: fix NAND nodes names
    4e8eb51ae633 reset: ti-syscon: fix to_ti_syscon_reset_data macro
    cabcb576fc3e arm64: dts: rockchip: Fix power-controller node names for rk3399
    81ea23d988f9 arm64: dts: rockchip: Fix power-controller node names for rk3328
    e4f97b740d6a arm64: dts: rockchip: Fix power-controller node names for px30
    95b64be2e741 ARM: dts: rockchip: Fix power-controller node names for rk3288
    5881af8d692b ARM: dts: rockchip: Fix power-controller node names for rk3188
    70abb828312a ARM: dts: rockchip: Fix power-controller node names for rk3066a
    fc01549d7b87 ARM: dts: rockchip: Fix IOMMU nodes properties on rk322x
    55014c38e73d ARM: dts: rockchip: Fix the timer clocks order
    2e1f681b680c arm64: dts: rockchip: fix pinctrl sleep nodename for rk3399.dtsi
    7d3408c72336 ARM: dts: rockchip: fix pinctrl sleep nodename for rk3036-kylin and rk3288
    e2d1e4416174 ARM: dts: rockchip: Fix thermal sensor cells o rk322x
    c8f0cef75dd7 ARM: dts: gemini: add device_type on pci
    191523dcfa68 ARM: dts: gemini: rename mdio to the right name

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 133b1f6fe3..2e46d72dfa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "dad5434fab65cdd316f940c5e9bd46e0d0607b5a"
-SRCREV_meta ?= "c3900f83a5679b563adff82c24fdeb02096ed736"
+SRCREV_machine ?= "e1b9700217e1dd963f9b034ffde9863abb53a92d"
+SRCREV_meta ?= "26a2a3cf764dde593325b8c08024f5990a5f6f02"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.52"
+LINUX_VERSION ?= "5.10.53"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 238123a42f..073dff1a5b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.52"
+LINUX_VERSION ?= "5.10.53"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "faa3b7802d0ee1fe0217283ecaf2c54c9503fa20"
-SRCREV_machine ?= "240422889570d39c3f7d63808159c8e743117a1d"
-SRCREV_meta ?= "c3900f83a5679b563adff82c24fdeb02096ed736"
+SRCREV_machine_qemuarm ?= "d5a79da206965b27043f558739b28a434efca75c"
+SRCREV_machine ?= "f44b5bb716fdb6f804383fa087c9fdb54584cd5b"
+SRCREV_meta ?= "26a2a3cf764dde593325b8c08024f5990a5f6f02"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 40a2a5e3b2..1c072b3e22 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "96a6083817785461bcabad63f3872d0a08b21c29"
-SRCREV_machine_qemuarm64 ?= "c8d8b20a749f476020d0844d76f63cd9e4cca644"
-SRCREV_machine_qemumips ?= "acdebd5080a846f3906ba1d5343d5af5c4b76522"
-SRCREV_machine_qemuppc ?= "afd31d567447f4693b7c9af35f09bb37cc0c0fa4"
-SRCREV_machine_qemuriscv64 ?= "c2dc854ee7392d43728093bfc206a2ade98c76dd"
-SRCREV_machine_qemuriscv32 ?= "c2dc854ee7392d43728093bfc206a2ade98c76dd"
-SRCREV_machine_qemux86 ?= "c2dc854ee7392d43728093bfc206a2ade98c76dd"
-SRCREV_machine_qemux86-64 ?= "c2dc854ee7392d43728093bfc206a2ade98c76dd"
-SRCREV_machine_qemumips64 ?= "efad0ca4150cddffa6d052ffb53fec0553de4da8"
-SRCREV_machine ?= "c2dc854ee7392d43728093bfc206a2ade98c76dd"
-SRCREV_meta ?= "c3900f83a5679b563adff82c24fdeb02096ed736"
+SRCREV_machine_qemuarm ?= "c74da440f36f7073b1e99f42cb363031bb0c38ca"
+SRCREV_machine_qemuarm64 ?= "e4e52d0a19fba26538218d78c70e54319ae00ca3"
+SRCREV_machine_qemumips ?= "60118f08d49cd825d17f11b078d5848eb5bb7e6d"
+SRCREV_machine_qemuppc ?= "eb3d2abf3d5aab1814d53767193770c282552774"
+SRCREV_machine_qemuriscv64 ?= "0b44b705c4f7d5c83e562dd7036cb5188d622285"
+SRCREV_machine_qemuriscv32 ?= "0b44b705c4f7d5c83e562dd7036cb5188d622285"
+SRCREV_machine_qemux86 ?= "0b44b705c4f7d5c83e562dd7036cb5188d622285"
+SRCREV_machine_qemux86-64 ?= "0b44b705c4f7d5c83e562dd7036cb5188d622285"
+SRCREV_machine_qemumips64 ?= "643c332e487cfa1557d14050d6e1148d1c5d75da"
+SRCREV_machine ?= "0b44b705c4f7d5c83e562dd7036cb5188d622285"
+SRCREV_meta ?= "26a2a3cf764dde593325b8c08024f5990a5f6f02"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.52"
+LINUX_VERSION ?= "5.10.53"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

