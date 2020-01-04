Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id BA4AB7F8AF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:26 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id n96so5778707pjc.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=H5r+lEC9TDg94C1eV3ipyGm9MbXiVMIy1FpUMVbPIbc=;
	b=EOe+xr9ZsNYOin/m/LFf3Tap7UuBNsvoTiuieRdeWxigkqn4EpknkPs1M8oDhm2eKl
	sxjZDmPME/0jFFdbXmu9XX79KJ6934ipGdzV9TMIFtLqjO9LuUBVfv/Kx4YhDvmYr9Vd
	xjh4uU4k2KtrC9CjdbE+jpufaky+Uos3u9vXTGxbkoJwLU0gq5RU5sWF0oqDs1Ft0rW3
	/9rIfcSdFzKlZcjld55Eygs17xoSnBGDz+Qb0BwkJTd2VH2ijMnG5UeQ3KrG0sHaeHX1
	wpdVTtokeVbuoyQ0q3qbWtjthWmWGF1af9eTOkQweo+L3lBIERzkYDveO8aBJEMWBLLJ
	Sxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=H5r+lEC9TDg94C1eV3ipyGm9MbXiVMIy1FpUMVbPIbc=;
	b=r31OG8ThaW6MV3aa6bIzVhxJp8/9m/XaAK7PzAa7yqZKq5yd6Fj/zKLMaqhO5FCwbg
	pOXYlF1qFZqw8jnr2nnVtgGC4Q/nAqaFKrF5KCOuoGwggK3uOZAar+ggxYUbRtNz4Dox
	f6laXjSdn0EMc2NlWNmha2F8O2yV/zRWtGafR2mzvxdZiNUS8bHK2lhCunp8N9ekKEA6
	sSpy3kfR25UhHNFwsb+R6nup2vgrRsyB0egDdccrTtjuOxZEeRgLrE0pV+PJVNXxGky0
	DYN6V4uPB1wbJJ1OmJDlUt+2gmm3FUDkYVmwR3zFbXItlQxDmcaTGmvrLGSjtC0yEAdp
	15ig==
X-Gm-Message-State: APjAAAXVKn4+b+/AL4UiZ1zruYWyO5qZ0gNUz0LnPXARiA4y2rgyD953
	lOX5danSmDy24XRqmoL06QZfGKV0uOw=
X-Google-Smtp-Source: APXvYqyJXsd4UVsOrw6PV0nUve9q6KCRDsXYT1y6yR48gJwIBUcXY0OPW2ojEd9J0oDuIP08eL89OA==
X-Received: by 2002:a17:90a:a88d:: with SMTP id
	h13mr33557457pjq.48.1578155187420; 
	Sat, 04 Jan 2020 08:26:27 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:25:56 -0800
Message-Id: <a18248515d0a58948391ca6cc656370f4e228232.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 15/29] linux-yocto/5.2: update to v5.2.27
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Jan 2020 16:26:26 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.2 to the latest korg -stable release that comprises
the following commits:

    766f754fb8ce Linux 5.2.27
    2e635a05d05c ASoC: SOF: Intel: hda-stream: fix the CONFIG_ prefix missing
    1708b2a269de usb: gadget: udc: core: Fix segfault if udc_bind_to_driver() for pending driver fails
    52d4750e4da2 arm64: dts: ti: k3-am65-main: Fix gic-its node unit-address
    d7b2a7ceb695 ASoC: pcm3168a: The codec does not support S32_LE
    8c9d7d01ccf0 selftests/powerpc: Fix compile error on tlbie_test due to newer gcc
    532cc582af44 selftests/powerpc: Add test case for tlbie vs mtpidr ordering issue
    21344b6bacda CIFS: Fix retry mid list corruption on reconnects
    7249aad46eed platform/x86: pmc_atom: Add Siemens SIMATIC IPC227E to critclk_systems DMI table
    48a226ebae98 net/flow_dissector: switch to siphash
    27508702fe6d net: bcmgenet: reset 40nm EPHY on energy detect
    8bbff985b199 net: phy: bcm7xxx: define soft_reset for 40nm EPHY
    3a48c3ea0431 net: netem: correct the parent's backlog when corrupted packet was dropped
    472df452d167 r8152: add device id for Lenovo ThinkPad USB-C Dock Gen 2
    717fa6516e96 net: usb: lan78xx: Connect PHY before registering MAC
    1d2fd4d20889 net: netem: fix error path for corrupted GSO frames
    5f0d17174801 net: hns3: fix mis-counting IRQ vector numbers issue
    18a577972516 net: dsa: fix switch tree list
    b2c233dbbdcb net: dsa: b53: Do not clear existing mirrored port mask
    30f425544ea2 net: bcmgenet: don't set phydev->link from MAC
    3d4a4cfb4ef7 net/mlx5e: Fix handling of compressed CQEs in case of low NAPI budget
    ba405f985d11 net/mlx5e: Fix ethtool self test: link speed
    01284dbae3d4 r8169: fix wrong PHY ID issue with RTL8168dp
    0a02e85ee175 mlxsw: core: Unpublish devlink parameters during reload
    0031274acd73 net/mlx5: Fix rtable reference leak
    0bb43d6b565e net/smc: fix refcount non-blocking connect() -part 2
    5dca2f5212b5 net/smc: fix refcounting for non-blocking connect()
    3320bb716cb3 net/mlx5: Fix flow counter list auto bits struct
    0490b698de8f net/smc: keep vlan_id for SMC-R in smc_listen_work()
    83577bc7531c net/smc: fix closing of fallback SMC sockets
    89b1d3e8dc5e selftests: fib_tests: add more tests for metric update
    52752b65dc62 ipv4: fix route update on metric change.
    c7525fb56257 net: add READ_ONCE() annotation in __skb_wait_for_more_packets()
    c7a5d3e53e0a net: use skb_queue_empty_lockless() in busy poll contexts
    7648cc097d86 net: use skb_queue_empty_lockless() in poll() handlers
    b192ff3d10ba udp: use skb_queue_empty_lockless()
    155f9ae9e73c net: add skb_queue_empty_lockless()
    c17ac3802036 vxlan: check tun_info options_len properly
    9c154c58aa9d udp: fix data-race in udp_set_dev_scratch()
    b64595ce1ed4 selftests: net: reuseport_dualstack: fix uninitalized parameter
    fb87cd347da4 net: Zeroing the structure ethtool_wolinfo in ethtool_get_wol()
    0819acecc962 net: usb: lan78xx: Disable interrupts before calling generic_handle_irq()
    07e413b2fbb0 net: rtnetlink: fix a typo fbd -> fdb
    0e3580cc30bf netns: fix GFP flags in rtnl_net_notifyid()
    338502ee8050 net/mlx4_core: Dynamically set guaranteed amount of counters per VF
    df8fccdba3d1 net: hisilicon: Fix ping latency when deal with high throughput
    1a3cfa10a0d7 net: fix sk_page_frag() recursion from memory reclaim
    b38a3703d880 net: ethernet: ftgmac100: Fix DMA coherency issue with SW checksum
    7ad5a3f67946 net: dsa: bcm_sf2: Fix IMP setup for port different than 8
    9f949630b4e5 net: annotate lockless accesses to sk->sk_napi_id
    8f963115bff3 net: annotate accesses to sk->sk_incoming_cpu
    72e16d7c131f inet: stop leaking jiffies on the wire
    250e30ea064b erspan: fix the tun_info options_len check for erspan
    5001418c1340 dccp: do not leak jiffies on the wire
    7ed4e6ea40b4 cxgb4: request the TX CIDX updates to status page
    11ccb2b93320 cxgb4: fix panic when attaching to ULD fail
    95a7b64f82d0 nbd: handle racing with error'ed out commands
    5d6e015cded5 nbd: protect cmd->status with cmd->lock
    092a5fa02456 irqchip/sifive-plic: Skip contexts except supervisor in plic_init()
    7a3552d0d993 cifs: Fix cifsInodeInfo lock_sem deadlock when reconnect occurs
    81eb09eaf75b i2c: stm32f7: remove warning when compiling with W=1
    29143d76b32e i2c: stm32f7: fix a race in slave mode with arbitration loss irq
    433c1cb88a21 i2c: stm32f7: fix first byte to send in slave mode
    aef36d8fa956 i2c: mt65xx: fix NULL ptr dereference
    47392944abe2 irqchip/gic-v3-its: Use the exact ITSList for VMOVP
    93cfb4dcfa2c MIPS: bmips: mark exception vectors as char arrays
    7639d63d6cdb ALSA: hda: Add Tigerlake/Jasperlake PCI ID
    1b916a8969b6 selftests: kvm: fix sync_regs_test with newer gccs
    782536b540ef selftests: kvm: vmx_set_nested_state_test: don't check for VMX support twice
    e7d861519b9d ARM: 8926/1: v7m: remove register save to stack before svc
    6a70e11c2225 drm/komeda: Don't flush inactive pipes
    2ae6a7ecd31d i2c: aspeed: fix master pending state handling
    db0521235e05 ARM: dts: bcm2837-rpi-cm3: Avoid leds-gpio probing issue
    7d8ff5d7d0bc tracing: Fix "gfp_t" format for synthetic events
    962b999c85b7 scsi: target: core: Do not overwrite CDB byte 1
    14983cdea8af drm/amdgpu: fix error handling in amdgpu_bo_list_create
    a772698fbff7 drm/amdgpu: fix potential VM faults
    7c39141a8e19 ARM: davinci: dm365: Fix McBSP dma_slave_map entry
    f6266068923b perf kmem: Fix memory leak in compact_gfp_flags()
    39fa2e018843 8250-men-mcb: fix error checking when get_num_ports returns -ENODEV
    8695a1b81da1 perf c2c: Fix memory leak in build_cl_output()
    c6bfe2d971a2 perf tools: Fix resource leak of closedir() on the error paths
    74825b0f12f5 arm64: dts: imx8mm: Use correct clock for usdhc's ipg clk
    606b1f7012c4 arm64: dts: imx8mq: Use correct clock for usdhc's ipg clk
    bd48cf1b8785 ARM: dts: imx7s: Correct GPT's ipg clock source
    634adb5ff10d ARM: dts: vf610-zii-scu4-aib: Specify 'i2c-mux-idle-disconnect'
    b5e444ec8046 ARM: dts: imx6q-logicpd: Re-Enable SNVS power key
    21991e6ca3a8 arm64: dts: lx2160a: Correct CPU core idle state name
    0c6787a615a9 arm64: dts: rockchip: fix RockPro64 sdmmc settings
    54a20ce80ef4 ARM: 8914/1: NOMMU: Fix exc_ret for XIP
    65afe1bbf903 ARM: 8908/1: add __always_inline to functions called from __get_user_check()
    f1d2d5999a90 scsi: fix kconfig dependency warning related to 53C700_LE_ON_BE
    f91e21d4ec3a scsi: sni_53c710: fix compilation error
    41c16b471c56 scsi: scsi_dh_alua: handle RTPG sense code correctly during state transitions
    1ca65ebd2038 scsi: qla2xxx: fix a potential NULL pointer dereference
    d6940a823dd4 ARM: mm: fix alignment handler faults under memory pressure
    2dbff99a37af ARM: dts: Use level interrupt for omap4 & 5 wlcore
    1c5dfeaa70da ASoC: simple_card_utils.h: Fix potential multiple redefinition error
    6c1607186a43 ASoC: msm8916-wcd-digital: add missing MIX2 path for RX1/2
    3f03fb38ecb5 ARM: dts: am3874-iceboard: Fix 'i2c-mux-idle-disconnect' usage
    0e688ad61baa arm64: dts: zii-ultra: fix ARM regulator states
    0af649d2eb1f pinctrl: stmfx: fix null pointer on remove
    c4829c0de7f8 pinctrl: ns2: Fix off by one bugs in ns2_pinmux_enable()
    a804692693e4 arm64: dts: rockchip: fix RockPro64 sdhci settings
    adb1f13ec2a3 arm64: dts: rockchip: fix RockPro64 vdd-log regulator settings
    3b7f40e22049 ARM: dts: logicpd-torpedo-som: Remove twl_keypad
    dbae4113b111 arm64: dts: rockchip: fix Rockpro64 RK808 interrupt line
    35121b191493 ASoc: rockchip: i2s: Fix RPM imbalance
    273687c15ca7 ASoC: wm_adsp: Don't generate kcontrols without READ flags
    2a8adb4c41eb regulator: pfuze100-regulator: Variable "val" in pfuze100_regulator_probe() could be uninitialized
    0b37b27e25e4 ASoC: intel: bytcr_rt5651: add null check to support_button_press
    f56de4455199 ASoC: intel: sof_rt5682: add remove function to disable jack
    f7b687159124 ASoC: rt5682: add NULL handler to set_jack function
    4b6e757b6c3b ASoC: SOF: Intel: hda: Disable DMI L1 entry during capture
    375b9b38fbb8 ASoC: SOF: Intel: initialise and verify FW crash dump data.
    70e6d9eafbe8 ASoC: SOF: Intel: hda: fix warnings during FW load
    87df87873d3f ASoC: SOF: topology: fix parse fail issue for byte/bool tuple types
    f0c8c58983c5 ASoC: SOF: loader: fix kernel oops on firmware boot failure
    d972519f0d11 pinctrl: intel: Allocate IRQ chip dynamic
    ceced419c570 regulator: ti-abb: Fix timeout in ti_abb_wait_txdone/ti_abb_clear_all_txdone
    4934e53e51a2 arm64: dts: Fix gpio to pinmux mapping
    9a61c23028d2 arm64: dts: allwinner: a64: sopine-baseboard: Add PHY regulator delay
    39f4a4a170ce arm64: dts: allwinner: a64: Re-add PMU node
    b68dfc690d27 arm64: dts: allwinner: a64: Drop PMU node
    6974df4eb790 arm64: dts: allwinner: a64: pine64-plus: Add PHY regulator delay
    01a832b775a0 ASoC: topology: Fix a signedness bug in soc_tplg_dapm_widget_create()
    94c31579cefb regulator: da9062: fix suspend_enable/disable preparation
    ece602dfdc03 ASoC: wm8994: Do not register inapplicable controls for WM1811
    52cc4490b025 regulator: of: fix suspend-min/max-voltage parsing
    d35e9545daaa ext4: add more paranoia checking in ext4_expand_extra_isize handling

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f558800a5cf1e59310eaacb091d75d06022ecea0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index f7c329c996..6dc2f8078c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e47a046e69c9ab1798c0e246b213d3d051af8565"
-SRCREV_meta ?= "b569dda3975970960e26c45fc1708b1522496b4e"
+SRCREV_machine ?= "817c65ec880afb367c6f1d67f524b94ee9c3ae6a"
+SRCREV_meta ?= "af93d12baae0ddac3d4c3a1e1a8f8e72da8c395a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.2.26"
+LINUX_VERSION ?= "5.2.27"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index 833c8fbfb3..dd14bd4937 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.2.26"
+LINUX_VERSION ?= "5.2.27"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "90883e86e6348ad4fdad00a5eaf1fbdc4c5b2504"
-SRCREV_machine ?= "ef54f0ac8d7caf7cc69f24b69de4633f796a4850"
-SRCREV_meta ?= "b569dda3975970960e26c45fc1708b1522496b4e"
+SRCREV_machine_qemuarm ?= "d55854d3c431023d48875bfd96208ed132c5e19d"
+SRCREV_machine ?= "4a765671adc689f3699cd60f58b2851403d0a880"
+SRCREV_meta ?= "af93d12baae0ddac3d4c3a1e1a8f8e72da8c395a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index 5615d4c773..16b6705f88 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2c9262452bf5b74e820e8435270d76d620e41445"
-SRCREV_machine_qemuarm64 ?= "ef54f0ac8d7caf7cc69f24b69de4633f796a4850"
-SRCREV_machine_qemumips ?= "497185e6a1627c6039dccbb8b7796706abcaf6ad"
-SRCREV_machine_qemuppc ?= "ef54f0ac8d7caf7cc69f24b69de4633f796a4850"
-SRCREV_machine_qemuriscv64 ?= "ef54f0ac8d7caf7cc69f24b69de4633f796a4850"
-SRCREV_machine_qemux86 ?= "ef54f0ac8d7caf7cc69f24b69de4633f796a4850"
-SRCREV_machine_qemux86-64 ?= "ef54f0ac8d7caf7cc69f24b69de4633f796a4850"
-SRCREV_machine_qemumips64 ?= "1b7bd87c8debcffbfa35d06756c53ad748bc62fd"
-SRCREV_machine ?= "ef54f0ac8d7caf7cc69f24b69de4633f796a4850"
-SRCREV_meta ?= "b569dda3975970960e26c45fc1708b1522496b4e"
+SRCREV_machine_qemuarm ?= "78b937b0d5d9852a9620d532bb61c8399fc423b4"
+SRCREV_machine_qemuarm64 ?= "4a765671adc689f3699cd60f58b2851403d0a880"
+SRCREV_machine_qemumips ?= "0e8e4a3475849ac390213833980411f19b148841"
+SRCREV_machine_qemuppc ?= "4a765671adc689f3699cd60f58b2851403d0a880"
+SRCREV_machine_qemuriscv64 ?= "4a765671adc689f3699cd60f58b2851403d0a880"
+SRCREV_machine_qemux86 ?= "4a765671adc689f3699cd60f58b2851403d0a880"
+SRCREV_machine_qemux86-64 ?= "4a765671adc689f3699cd60f58b2851403d0a880"
+SRCREV_machine_qemumips64 ?= "5236aae3076bc8edc7a70b928190ae07512e2425"
+SRCREV_machine ?= "4a765671adc689f3699cd60f58b2851403d0a880"
+SRCREV_meta ?= "af93d12baae0ddac3d4c3a1e1a8f8e72da8c395a"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.2.26"
+LINUX_VERSION ?= "5.2.27"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1


