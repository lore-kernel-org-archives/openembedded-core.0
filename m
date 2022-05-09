Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8B7C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 21:04:07 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.1146.1652130245768099063
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 14:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BQTU9Fn3;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id n8so11418657qke.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 14:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8nTa3tZw2tTlMGf3nzqwI4Dt5qk5Ru6ZKKuu3W6Uz4k=;
        b=BQTU9Fn3Hdnzb0Xol0hNaKOOvH3aUw7I5ARf3gmzIAXAJk/3kKdQhlnIAz22K+Yj78
         43jlBjFeQi1AgojoXYOHqKXuumma1tcyBQXfImsmIscTF2W/ygUkc0GedVJYgDYlGZ7Z
         49q6cf0kKgbpuMJ7LZg29eSxotmhhaP5xtKPvDJBd3F3BgS4hAXN/X0Hm1w1DKjtp6J4
         0BEJXGr+e5HtbJG94bMKMh4NmpaeUUhn1xGEkiF1o/0N29jLRfyQRLQFoLSxDCJU7bwo
         iOnCEgBad/Ykqc/xVrfK5UsiLXBJBdffIdR0f8ua0pck7s/s5MfoaX9AvjEdRcwrGE9d
         xGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8nTa3tZw2tTlMGf3nzqwI4Dt5qk5Ru6ZKKuu3W6Uz4k=;
        b=D+Z42Ssqtji//e5WC/cDNnevX6Kbd6UOC8Buu9+WNyN7iOgrxuFJczVj/yI38LZMqd
         ++yWKmoIlJQdj2Z7nv2Vm9i3klOpw4sxezMD3fnnYJdCpK+YXuLUDsMFxttYeSxZYP1n
         a4A8Xhz+ZnWeZu8YDr0WJmeRnmUg1AGrsH3/VJX28u3aLWoFmpuVAGHkFgYCryKBUtb9
         99dOq1k3OA34BQZy2/6/wm+1KZLqE8ypu+4w0LL0DB76s4uOuSMGL9mzzQbmpp4h/xI2
         D9AKeqCbNcqzt7LsiVTFrILopMhjLfaGwYuM7V0IWgN3mgxt5Q3eyyVOu2woVR7MCCGc
         r9QQ==
X-Gm-Message-State: AOAM533b/wQDOP6UBrYnW0e7kkA/vONY5Dwi9F8EmEFhsbg4UYMRR9Pw
	ij7G8NhuWYDKU58KyxwfyOPXH3UqT2Ou6g==
X-Google-Smtp-Source: 
 ABdhPJz6tyycql8ovCPVuSUFhVoNPzJH+et02mCFTWKDSCBCuKTGYNoCZKvVSvGHInvlI7A8wNuwFQ==
X-Received: by 2002:a05:620a:989:b0:69f:c506:2ac1 with SMTP id
 x9-20020a05620a098900b0069fc5062ac1mr13052013qkx.645.1652130244614;
        Mon, 09 May 2022 14:04:04 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 k80-20020a37a153000000b0069fc13ce1fdsm7655156qke.46.2022.05.09.14.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 14:04:04 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] linux-yocto/5.4: update to v5.4.192
Date: Mon,  9 May 2022 17:04:02 -0400
Message-Id: <20220509210402.13465-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 21:04:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165404

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    1d72b776f6dc Linux 5.4.192
    aa2a047b5842 mm, hugetlb: allow for "high" userspace addresses
    6a79b2433eb1 hugetlbfs: get unmapped area below TASK_UNMAPPED_BASE for hugetlbfs
    b69e60f6fc00 tty: n_gsm: fix incorrect UA handling
    0f4be29febdc tty: n_gsm: fix wrong command frame length field encoding
    21cc640385b4 tty: n_gsm: fix wrong command retry handling
    49c40febd45c tty: n_gsm: fix missing explicit ldisc flush
    85522dcf0053 tty: n_gsm: fix insufficient txframe size
    563bb0f794ca netfilter: nft_socket: only do sk lookups when indev is available
    fae209521000 tty: n_gsm: fix malformed counter for out of frame data
    cec2d0782a7b tty: n_gsm: fix wrong signal octet encoding in convergence layer type 2
    a6d9847a4f82 x86/cpu: Load microcode during restore_processor_state()
    9e9d12b81df6 net: ethernet: stmmac: fix write to sgmii_adapter_base
    10ba1ac9a22a drivers: net: hippi: Fix deadlock in rr_close()
    a8275219759e cifs: destage any unwritten data to the server before calling copychunk_write
    5335370366a3 x86: __memcpy_flushcache: fix wrong alignment if size > 2^32
    0ecc5304e80a ip6_gre: Avoid updating tunnel->tun_hlen in __gre6_xmit()
    781571034993 ASoC: wm8731: Disable the regulator when probing fails
    a71df406a6a5 tcp: fix F-RTO may not work correctly when receiving DSACK
    a4ed61e30e32 ixgbe: ensure IPsec VF<->PF compatibility
    406aaef0feae bnx2x: fix napi API usage sequence
    c3e7ea58608a tls: Skip tls_append_frag on zero copy size
    cd5cec3a0c8f drm/amd/display: Fix memory leak in dcn21_clock_source_create
    ffce11a39102 net: dsa: lantiq_gswip: Don't set GSWIP_MII_CFG_RMII_CLK
    3a179538bfd7 net: bcmgenet: hide status block before TX timestamping
    8ef6d60aa2f1 clk: sunxi: sun9i-mmc: check return value after calling platform_get_resource()
    194f474ad9b4 bus: sunxi-rsb: Fix the return value of sunxi_rsb_device_create()
    e80054ea0cde tcp: fix potential xmit stalls caused by TCP_NOTSENT_LOWAT
    685ff7d24487 ip_gre: Make o_seqno start from 0 in native mode
    69555bb27b2e net/smc: sync err code when tcp connection was refused
    daca23846eb3 net: hns3: add validity check for message data length
    7763a7956632 cpufreq: fix memory leak in sun50i_cpufreq_nvmem_probe
    f5bb5940d754 pinctrl: pistachio: fix use of irq_of_parse_and_map()
    d22fc603694b arm64: dts: imx8mn-ddr4-evk: Describe the 32.768 kHz PMIC clock
    68f5200a1f60 ARM: dts: imx6ull-colibri: fix vqmmc regulator
    c45180375afd sctp: check asoc strreset_chunk in sctp_generate_reconf_event
    2cba635570d8 tcp: ensure to use the most recently sent skb when filling the rate sample
    3ea6190be92f tcp: md5: incorrect tcp_header_len for incoming connections
    2b9a13d98dfc bpf, lwt: Fix crash when using bpf_skb_set_tunnel_key() from bpf_xmit lwt hook
    2e7f70d324ef mtd: rawnand: Fix return value check of wait_for_completion_timeout
    2a36ba067b36 ipvs: correctly print the memory size of ip_vs_conn_tab
    abe86a10dc5c ARM: dts: logicpd-som-lv: Fix wrong pinmuxing on OMAP35
    54212850e38f ARM: dts: am3517-evm: Fix misc pinmuxing
    bba67fe6b022 ARM: dts: Fix mmc order for omap3-gta04
    416e0f890732 phy: ti: Add missing pm_runtime_disable() in serdes_am654_probe
    6ff7c1b827c8 phy: mapphone-mdm6600: Fix PM error handling in phy_mdm6600_probe
    59bdaed5dd73 ARM: dts: at91: Map MCLK for wm8731 on at91sam9g20ek
    dbce8fc16a08 phy: ti: omap-usb2: Fix error handling in omap_usb2_enable_clocks
    b7fc45354be6 ARM: OMAP2+: Fix refcount leak in omap_gic_of_init
    dd99939b70c4 phy: samsung: exynos5250-sata: fix missing device put in probe error paths
    6331b77fdc17 phy: samsung: Fix missing of_node_put() in exynos_sata_phy_probe
    fccbc3168e5e ARM: dts: imx6qdl-apalis: Fix sgtl5000 detection issue
    b8f0c19d4864 USB: Fix xhci event ring dequeue pointer ERDP update issue
    1f47c2625773 mtd: rawnand: fix ecc parameters for mt7622
    0405bd7f1888 arm64: dts: meson: remove CPU opps below 1GHz for SM1 boards
    5f80b5c5f406 arm64: dts: meson: remove CPU opps below 1GHz for G12B boards
    f6db63819db6 video: fbdev: udlfb: properly check endpoint type
    c00f3892f4f0 hex2bin: fix access beyond string end
    15b78a8e38e8 hex2bin: make the function hex_to_bin constant-time
    73f4668ee875 arch_topology: Do not set llc_sibling if llc_id is invalid
    a3cdd33ca163 serial: 8250: Correct the clock for EndRun PTP/1588 PCIe device
    89a5728b053c serial: 8250: Also set sticky MCR bits in console restoration
    42f749f2232a serial: imx: fix overrun interrupts in DMA mode
    d29c197df7fa usb: dwc3: gadget: Return proper request status
    0f3d081315c5 usb: dwc3: core: Fix tx/rx threshold settings
    e2ec7b1f6a06 usb: gadget: configfs: clear deactivation flag in configfs_composite_unbind()
    debb276670b0 usb: gadget: uvc: Fix crash when encoding data for usb request
    324e67c3b2fc usb: typec: ucsi: Fix role swapping
    0366beb40239 usb: misc: fix improper handling of refcount in uss720_probe()
    2c97a2b5ef84 iio: magnetometer: ak8975: Fix the error handling in ak8975_power_on()
    e82c726c94ec iio: dac: ad5446: Fix read_raw not returning set value
    1aea30f87c65 iio: dac: ad5592r: Fix the missing return value.
    1e8716a5c087 xhci: increase usb U3 -> U0 link resume timeout from 100ms to 500ms
    b8d3a4681f28 xhci: stop polling roothubs after shutdown
    c8fbc2f875b6 USB: serial: option: add Telit 0x1057, 0x1058, 0x1075 compositions
    68088dec9b3c USB: serial: option: add support for Cinterion MV32-WA/MV32-WB
    56cbdb9d958a USB: serial: cp210x: add PIDs for Kamstrup USB Meter Reader
    6b10dd966c12 USB: serial: whiteheat: fix heap overflow in WHITEHEAT_GET_DTR_RTS
    890fc65448ea USB: quirks: add STRING quirk for VCOM device
    c4b31d41f5f2 USB: quirks: add a Realtek card reader
    5666334ce3bf usb: mtu3: fix USB 3.0 dual-role-switch from device to host
    b2589647008f lightnvm: disable the subsystem
    c9af90f0c6b8 hamradio: remove needs_free_netdev to avoid UAF
    7361a35bf330 hamradio: defer 6pack kfree after unregister_netdev
    7dea5913000c floppy: disable FDRAWCMD by default
    4426e6017f73 Linux 5.4.191
    3c946909a3ed Revert "net: micrel: fix KS8851_MLL Kconfig"
    c028b81d062e block/compat_ioctl: fix range check in BLKGETSIZE
    27da8d16e4f0 staging: ion: Prevent incorrect reference counting behavour
    cb158b152ea6 spi: atmel-quadspi: Fix the buswidth adjustment between spi-mem and controller
    1b6ad2421084 jbd2: fix a potential race while discarding reserved buffers after an abort
    0b1ba14ab263 ext4: force overhead calculation if the s_overhead_cluster makes no sense
    425301ef608a ext4: fix overhead calculation to account for the reserved gdt blocks
    ea9c206111ea ext4, doc: fix incorrect h_reserved size
    259dc49deaa2 ext4: limit length to bitmap_maxbytes - blocksize in punch_hole
    faadbf7ac4f2 ext4: fix use-after-free in ext4_search_dir
    0309665eb244 ext4: fix symlink file size not match to file content
    ddfe3babc546 arm_pmu: Validate single/group leader events
    852b02d1f808 ARC: entry: fix syscall_trace_exit argument
    016ba7cbed57 e1000e: Fix possible overflow in LTR decoding
    1217cf141b24 ASoC: soc-dapm: fix two incorrect uses of list iterator
    aa7070556087 openvswitch: fix OOB access in reserve_sfa_size()
    d24e0d9d691b xtensa: fix a7 clobbering in coprocessor context load/store
    4c26a96d0c29 xtensa: patch_text: Fixup last cpu should be master
    8d6937c1e093 powerpc/perf: Fix power9 event alternatives
    0dafb826ed70 drm/vc4: Use pm_runtime_resume_and_get to fix pm_runtime_get_sync() usage
    013231f75fce KVM: PPC: Fix TCE handling for VFIO
    9cf05812cb10 drm/panel/raspberrypi-touchscreen: Initialise the bridge in prepare
    4f08e85ca0fc drm/panel/raspberrypi-touchscreen: Avoid NULL deref if not initialised
    23f0ba5585a5 dma: at_xdmac: fix a missing check on list iterator
    a22f3c99268c ata: pata_marvell: Check the 'bmdma_addr' beforing reading
    0441d3e95bca oom_kill.c: futex: delay the OOM reaper to allow time for proper futex cleanup
    530d32ac52f7 EDAC/synopsys: Read the error count from the correct register
    91367af460da stat: fix inconsistency between struct stat and struct compat_stat
    837e319ebe62 scsi: qedi: Fix failed disconnect handling
    4b813ce289ed net: macb: Restart tx only if queue pointer is lagging
    a1419bee4dde drm/msm/mdp5: check the return of kzalloc()
    80b188da30aa dpaa_eth: Fix missing of_node_put in dpaa_get_ts_info()
    46f9fa0a6632 brcmfmac: sdio: Fix undefined behavior due to shift overflowing the constant
    12a753edd963 mt76: Fix undefined behavior due to shift overflowing the constant
    7c48a6e62ddb cifs: Check the IOCB_DIRECT flag, not O_DIRECT
    435142fbdcc0 vxlan: fix error return code in vxlan_fdb_append
    99c2d9a52f37 ALSA: usb-audio: Fix undefined behavior due to shift overflowing the constant
    3e28d157e5f2 platform/x86: samsung-laptop: Fix an unsigned comparison which can never be negative
    54be94d33660 reset: tegra-bpmp: Restore Handle errors in BPMP response
    0cb2c00dd1ab ARM: vexpress/spc: Avoid negative array index when !SMP
    3a5ad1b8db9f selftests: mlxsw: vxlan_flooding: Prevent flooding of unwanted packets
    d37295129efa netlink: reset network and mac headers in netlink_dump()
    4c4f2a019ff9 l3mdev: l3mdev_master_upper_ifindex_by_index_rcu should be using netdev_master_upper_dev_get_rcu
    8c5ca6492a86 net/sched: cls_u32: fix possible leak in u32_init_knode()
    f883def54654 net/packet: fix packet_sock xmit return value checking
    e1bc684c81f1 net/smc: Fix sock leak when release after smc_shutdown()
    f10e5c9f226c rxrpc: Restore removed timer deletion
    9a9c48159365 igc: Fix BUG: scheduling while atomic
    f9d5d17d234f igc: Fix infinite loop in release_swfw_sync
    6d6271dbbbe5 dmaengine: mediatek:Fix PM usage reference leak of mtk_uart_apdma_alloc_chan_resources
    65c36555bd7d dmaengine: imx-sdma: Fix error checking in sdma_event_remap
    ccf554d148eb ASoC: msm8916-wcd-digital: Check failure for devm_snd_soc_register_component
    6a20bf46c625 ASoC: atmel: Remove system clock tree configuration for at91sam9g20ek
    6a54979c7830 ALSA: usb-audio: Clear MIDI port active flag after draining
    9c99aacfb4c6 tcp: Fix potential use-after-free due to double kfree()
    5a4f3eba211a net/sched: cls_u32: fix netns refcount changes in u32_change()
    b01b700e0c5a tcp: fix race condition when creating child sockets from syncookies
    ebb3b84596bd gfs2: assign rgrp glock before compute_bitstructs
    660784e7194a can: usb_8dev: usb_8dev_start_xmit(): fix double dev_kfree_skb() in error path
    2da11442a1e3 tracing: Dump stacktrace trigger to the corresponding instance
    bad7ed55756f mm: page_alloc: fix building error on -Werror=array-compare
    ac94e87675b2 etherdevice: Adjust ether_addr* prototypes to silence -Wstringop-overead

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 764a875699..bf5359d120 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5b157591793811a9d226866d9f8acde817339fe9"
-SRCREV_meta ?= "6a12bea7312868626062fe8206ce3c5bcb7c9101"
+SRCREV_machine ?= "24d323fa0e17bcd62c9cfe1fd4153c304a06f38c"
+SRCREV_meta ?= "3fecb08507e286d1458497faaf31d1a07cc7d373"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.190"
+LINUX_VERSION ?= "5.4.192"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 7be0f31eb0..dee636aca5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.190"
+LINUX_VERSION ?= "5.4.192"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "25567bdff9816844f3b9e09cdb490d7c7bfb4edb"
-SRCREV_machine ?= "36a8131ee4418c5f8883ff165833776746e61e84"
-SRCREV_meta ?= "6a12bea7312868626062fe8206ce3c5bcb7c9101"
+SRCREV_machine_qemuarm ?= "460de085c07ab1a221317e6804c13657456c5368"
+SRCREV_machine ?= "b414a2fc5ce5f68c33d297d9cde4fef5437b773b"
+SRCREV_meta ?= "3fecb08507e286d1458497faaf31d1a07cc7d373"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 23a5abb2c6..680f40d208 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c4efc0b0650c3d2a7a321a6ba5fe612b7d14bd3f"
-SRCREV_machine_qemuarm64 ?= "c5b5ccb7df29d44c4e3d71d0e2ccf3e8a462a7f0"
-SRCREV_machine_qemumips ?= "addad5fd9e5c386a4b06938ae73de42292d552be"
-SRCREV_machine_qemuppc ?= "ee0f3e8a7de91b0520da532f87f8deeb91a92e27"
-SRCREV_machine_qemuriscv64 ?= "d9d6c6e0d0a9a52f9acd488036a5ed6409352f44"
-SRCREV_machine_qemux86 ?= "d9d6c6e0d0a9a52f9acd488036a5ed6409352f44"
-SRCREV_machine_qemux86-64 ?= "d9d6c6e0d0a9a52f9acd488036a5ed6409352f44"
-SRCREV_machine_qemumips64 ?= "971edcacc688c0deb078f4643125c5c5372010c5"
-SRCREV_machine ?= "d9d6c6e0d0a9a52f9acd488036a5ed6409352f44"
-SRCREV_meta ?= "6a12bea7312868626062fe8206ce3c5bcb7c9101"
+SRCREV_machine_qemuarm ?= "68a2ce69aaf2e8d96eef4aaccd70fc0ef7368a46"
+SRCREV_machine_qemuarm64 ?= "acfed0930d37a714d705645ff7cfbfbd0ad040e7"
+SRCREV_machine_qemumips ?= "e7046a2c8972e925cd2e6ac7f392abe87cbec5f5"
+SRCREV_machine_qemuppc ?= "997e06e0af674c27627eaa76a60b2f63cb16f38d"
+SRCREV_machine_qemuriscv64 ?= "85f0668fea1442bbcc2c8b1509d9f711b4b73649"
+SRCREV_machine_qemux86 ?= "85f0668fea1442bbcc2c8b1509d9f711b4b73649"
+SRCREV_machine_qemux86-64 ?= "85f0668fea1442bbcc2c8b1509d9f711b4b73649"
+SRCREV_machine_qemumips64 ?= "7b526cde12d78604b6f1e1ad62da31dcb729f35f"
+SRCREV_machine ?= "85f0668fea1442bbcc2c8b1509d9f711b4b73649"
+SRCREV_meta ?= "3fecb08507e286d1458497faaf31d1a07cc7d373"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.190"
+LINUX_VERSION ?= "5.4.192"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


