Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A16C6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:15:27 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.104609.1679670922950354733
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ax8ZRCU0;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id m16so1726136qvi.12
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679670922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uf1wZHg+iy6Kpw7/ROhXPrGDMd1acNMvZ5AsvdZT1Gc=;
        b=ax8ZRCU0wc8IP1n5t0eSzjHsiRSp6AMyp1qZkjHRyEqw6K3i4+uCph54GkYNdCZO/H
         H7BsSCTJKs93rm3Xy1dO+EAcjhC41pt5FlVboxaN+AsAHLqVKpt0CIPkg4sjmaKPC/eA
         Udc9TA9F6lL7Asx16L9x1YsRjlzT1WmS077fvgraZ1V6gcfeecEsykjpRU475TxdLjLT
         ZZYHnOkzLptdaWnYnGIsoptzQFu4TFFhrwNrbCl5Nj1IEFjH7pXYeeIJUKSIFVT4Hezn
         YHDTRHnTMnPLCtNKoxoFcftKYkWjwk1c9dF/tWn5k6exCZLg5oztlRcqcaMqs55LxRxI
         YIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679670922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uf1wZHg+iy6Kpw7/ROhXPrGDMd1acNMvZ5AsvdZT1Gc=;
        b=MY1paM2XHyCPNDHjmTqaKPVcaB3rMUlrBZ0L2iX4lTBqD1jDhJS9MKoo0+2a7iL0K3
         tuKs4puV1P2b0WnSSaT8HYEjvsUWNZD1IvAnrzKj/xlqFCVARV+L8rJ3z1SlwsyIagOS
         bKk9zQdI9X5/seDaw5HFjbgfIsycKj1Jn7ZRJbHqqpGGiM7So/x4cjh+PJrZl24rbKMz
         JC6hLAwdvpH2y7RGlRrzuCrK48/QblAQpFmF/6tXY4pi9qVP3pOpWTBb+MuDB7lOiizi
         Sg7nlpuI9QBidUvfGbCjfZdpmV+TFdvF/zhQhIUaOGyKn7iJfnGV8bLFPpbtNTFLMVcE
         xVcg==
X-Gm-Message-State: AAQBX9fwRho0S1j9g5Dppxj8FpDyaOzWoAc0efqeojtjG+95x80sQQa/
	4CyoQ2eB6Or/heRkXX3yDv0yKm+JAaql2Q==
X-Google-Smtp-Source: AKy350YDVkii+9l7U62t4sOJ3HDju+5oI8aUgZQzaOFEokmUfgMx9CQXeNUJusnPLhui3pCaXdi7Bg==
X-Received: by 2002:ad4:5962:0:b0:5c8:ad0d:3b7e with SMTP id eq2-20020ad45962000000b005c8ad0d3b7emr3381893qvb.35.1679670921598;
        Fri, 24 Mar 2023 08:15:21 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id ek5-20020ad45985000000b005dd8b93459fsm748200qvb.55.2023.03.24.08.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:15:21 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4][dunfell] linux-yocto/5.4: update to v5.4.231
Date: Fri, 24 Mar 2023 11:15:17 -0400
Message-Id: <20230324151520.1349287-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179049

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    59342376e8f0 Linux 5.4.231
    268d595d4da3 Revert "xprtrdma: Fix regbuf data not freed in rpcrdma_req_create()"
    6c24a20223db usb: host: xhci-plat: add wakeup entry at sysfs
    1c1291a84e94 Bluetooth: fix null ptr deref on hci_sync_conn_complete_evt
    af51fc23a03f ipv6: ensure sane device mtu in tunnels
    a7cc1b5d76a2 exit: Use READ_ONCE() for all oops/warn limit reads
    eb768617dafa docs: Fix path paste-o for /sys/kernel/warn_count
    6f18d28c2634 panic: Expose "warn_count" to sysfs
    7c1273646f7e panic: Introduce warn_limit
    51538bdde3c2 panic: Consolidate open-coded panic_on_warn checks
    7020a9234e86 exit: Allow oops_limit to be disabled
    5a3482f2c1cc exit: Expose "oops_count" to sysfs
    28facdf7b097 exit: Put an upper limit on how often we can oops
    3fa431bac23c ia64: make IA64_MCA_RECOVERY bool instead of tristate
    86926761ca80 csky: Fix function name in csky_alignment() and die()
    3bf1fa2c7b0f h8300: Fix build errors from do_exit() to make_task_dead() transition
    fcae924b945e hexagon: Fix function name in die()
    49a128ae2823 objtool: Add a missing comma to avoid string concatenation
    9a18c9c8336f exit: Add and use make_task_dead.
    2f87e255123f mm: kasan: do not panic if both panic_on_warn and kasan_multishot set
    119f6bcef753 panic: unset panic_on_warn inside panic()
    f6c20ed17ef0 sysctl: add a new register_sysctl_init() interface
    dbe634ce8243 dmaengine: imx-sdma: Fix a possible memory leak in sdma_transfer_init
    1986cd616b63 blk-cgroup: fix missing pd_online_fn() while activating policy
    4923160393b0 bpf: Skip task with pid=1 in send_signal_common()
    bd393f0ad5b5 ARM: dts: imx: Fix pca9547 i2c-mux node name
    8667280a673a x86/asm: Fix an assembler warning with current binutils
    1a5119369a50 clk: Fix pointer casting to prevent oops in devm_clk_release()
    fbf7b0e4cef3 perf/x86/amd: fix potential integer overflow on shift of a int
    f571e340050d netfilter: conntrack: unify established states for SCTP paths
    8770cd9d7c14 x86/i8259: Mark legacy PIC interrupts with IRQ_LEVEL
    4d1757f9fe57 block: fix and cleanup bio_check_ro
    3a10a4d5d08a nfsd: Ensure knfsd shuts down when the "nfsd" pseudofs is unmounted
    52462669581f Revert "Input: synaptics - switch touchpad on HP Laptop 15-da3001TU to RMI mode"
    f7a564412931 net: mdio-mux-meson-g12a: force internal PHY off on mux switch
    2635c4fd91ca net: xgene: Move shared header file into include/linux
    a70b966c6c1e net/phy/mdio-i2c: Move header file to include/linux/mdio
    a9a022a0db1a net/tg3: resolve deadlock in tg3_reset_task() during EEH
    92a65b0f207b thermal: intel: int340x: Add locking to int340x_thermal_get_trip_type()
    e249cea3abd5 net: ravb: Fix possible hang if RIS2_QFF1 happen
    a7585028ac0a sctp: fail if no bound addresses can be used for a given scope
    dae05cd3716f net/sched: sch_taprio: do not schedule in taprio_reset()
    fe9b9e621ceb netrom: Fix use-after-free of a listening socket.
    67ac3b4cd551 netfilter: conntrack: fix vtag checks for ABORT/SHUTDOWN_COMPLETE
    8f0eb24f1a7a ipv4: prevent potential spectre v1 gadget in fib_metrics_match()
    746db9ec1e67 ipv4: prevent potential spectre v1 gadget in ip_metrics_convert()
    4cde1d2f16b6 netlink: annotate data races around sk_state
    c64bb8547160 netlink: annotate data races around dst_portid and dst_group
    ea11a52f55c9 netlink: annotate data races around nlk->portid
    cfdd81ae4752 netfilter: nft_set_rbtree: skip elements in transaction from garbage collection
    ddd49cbbd4c1 net: fix UaF in netns ops registration error path
    3e5082b1c66c netlink: prevent potential spectre v1 gadgets
    66e10d5f3996 EDAC/qcom: Do not pass llcc_driv_data as edac_device_ctl_info's pvt_info
    594618c701ac EDAC/device: Respect any driver-supplied workqueue polling value
    a536d87ec73f ARM: 9280/1: mm: fix warning on phys_addr_t to void pointer assignment
    768e8cdf93e7 thermal: intel: int340x: Protect trip temperature from concurrent updates
    aa33d334bd7e KVM: x86/vmx: Do not skip segment attributes if unusable bit is set
    91be54849d53 cifs: Fix oops due to uncleared server->smbd_conn in reconnect
    bcb65adaa9a1 ftrace/scripts: Update the instructions for ftrace-bisect.sh
    31b2414abeaa trace_events_hist: add check for return value of 'create_hist_field'
    76b2390fdc80 tracing: Make sure trace_printk() can output as soon as it can be used
    4a4a22dda0a3 module: Don't wait for GOING modules
    1cd70d842731 scsi: hpsa: Fix allocation size for scsi_host_alloc()
    4d55f918e1cd Bluetooth: hci_sync: cancel cmd_timer if hci_open failed
    e588a5872d41 Revert "Revert "xhci: Set HCD flag to defer primary roothub registration""
    8eb5a68064a5 fs: reiserfs: remove useless new_opts in reiserfs_remount
    a61bc9197d90 netfilter: conntrack: do not renew entry stuck in tcp SYN_SENT state
    d39117d7797f Revert "selftests/bpf: check null propagation only neither reg is PTR_TO_BTF_ID"
    b4253b47bf5e mmc: sdhci-esdhc-imx: correct the tuning start tap and step setting
    14b70b4b4a1c mmc: sdhci-esdhc-imx: disable the CMD CRC check for standard tuning
    7e66f28ce510 mmc: sdhci-esdhc-imx: clear pending interrupt and halt cqhci
    a58c144b9e69 lockref: stop doing cpu_relax in the cmpxchg loop
    d6ff82a4d712 platform/x86: asus-nb-wmi: Add alternate mapping for KEY_SCREENLOCK
    295690bb0596 platform/x86: touchscreen_dmi: Add info for the CSL Panther Tab HD
    890d850cb25b scsi: hisi_sas: Set a port invalid only if there are no devices attached when refreshing port id
    45b3fc9cc64b KVM: s390: interrupt: use READ_ONCE() before cmpxchg()
    dc0867c44722 spi: spidev: remove debug messages that access spidev->spi without locking
    0dfd34fb4506 ASoC: fsl-asoc-card: Fix naming of AC'97 CODEC widgets
    9e02118045f8 ASoC: fsl_ssi: Rename AC'97 streams to avoid collisions with AC'97 CODEC
    3163f4ed49bd cpufreq: armada-37xx: stop using 0 as NULL pointer
    1ec79234c20a s390/debug: add _ASM_S390_ prefix to header guard
    18699224059c drm: Add orientation quirk for Lenovo ideapad D330-10IGL
    aff2bc578482 ASoC: fsl_micfil: Correct the number of steps on SX controls
    1c587aa6cd23 cpufreq: Add Tegra234 to cpufreq-dt-platdev blocklist
    8cca0afccefd tcp: fix rate_app_limited to default to 1
    11a4d51a4f18 net: dsa: microchip: ksz9477: port map correction in ALU table entry register
    02a4a7dc90c2 driver core: Fix test_async_probe_init saves device in wrong array
    276052159ba9 w1: fix WARNING after calling w1_process()
    82867190ce30 w1: fix deadloop in __w1_remove_master_device()
    c9ada353403d tcp: avoid the lookup process failing to get sk in ehash table
    e963b33723f7 dmaengine: xilinx_dma: call of_node_put() when breaking out of for_each_child_of_node()
    9b4482267eee dmaengine: xilinx_dma: Fix devm_platform_ioremap_resource error handling
    fe39e74a6435 dmaengine: xilinx_dma: use devm_platform_ioremap_resource()
    d3065cc56221 HID: betop: check shape of output reports
    d16b83c804ad net: macb: fix PTP TX timestamp failure due to packet padding
    18dd3b30d4c7 dmaengine: Fix double increment of client_count in dma_chan_get()
    cbed756bd198 drm/panfrost: fix GENERIC_ATOMIC64 dependency
    914c58fec1a6 net: mlx5: eliminate anonymous module_init & module_exit
    7335ba0c0345 usb: gadget: f_fs: Ensure ep0req is dequeued before free_request
    a8d40942df07 usb: gadget: f_fs: Prevent race during ffs_ep0_queue_wait
    edec50677b41 HID: revert CHERRY_MOUSE_000C quirk
    efa29f4ba01e net: stmmac: fix invalid call to mdiobus_get_phy()
    8c3653c4e71f HID: check empty report_list in bigben_probe()
    89e7fe3999e0 HID: check empty report_list in hid_validate_values()
    8a7b9560a3a8 net: mdio: validate parameter addr in mdiobus_get_phy()
    ce1e79bf31aa net: usb: sr9700: Handle negative len
    4fd6a6b1019e l2tp: Don't sleep and disable BH under writer-side sk_callback_lock
    7188c37f3c25 l2tp: Serialize access to sk_user_data with sk_callback_lock
    24c7614d31c8 net: fix a concurrency bug in l2tp_tunnel_register()
    1200388a0b1c net/sched: sch_taprio: fix possible use-after-free
    9042a9a3f29c wifi: rndis_wlan: Prevent buffer overflow in rndis_query_oid
    de0e084f85ff gpio: mxc: Always set GPIOs used as interrupt source to INPUT mode
    8df414fce41c net: wan: Add checks for NULL for utdm in undo_uhdlc_init and unmap_si_regs
    a59cdbda3714 net: nfc: Fix use-after-free in local_cleanup()
    2a05d513d2b9 phy: rockchip-inno-usb2: Fix missing clk_disable_unprepare() in rockchip_usb2phy_power_on()
    81b3374944d2 bpf: Fix pointer-leak due to insufficient speculative store bypass mitigation
    8b35c7f6920d amd-xgbe: Delay AN timeout during KR training
    b85e0bb478fd amd-xgbe: TX Flow Ctrl Registers are h/w ver dependent
    3d41f4eeabd0 affs: initialize fsdata in affs_truncate()
    03965f8ad2cd IB/hfi1: Fix expected receive setup error exit issues
    f5c918dc4ed9 IB/hfi1: Reserve user expected TIDs
    d307c75f4328 IB/hfi1: Reject a zero-length user expected buffer
    902063a9fea5 RDMA/core: Fix ib block iterator counter overflow
    048c17b619b4 tomoyo: fix broken dependency on *.conf.default
    8d23f5d25264 EDAC/highbank: Fix memory leak in highbank_mc_probe()
    97445814efcd HID: intel_ish-hid: Add check for ishtp_dma_tx_map
    4be51ea91a8b ARM: imx: add missing of_node_put()
    12a763015b83 ARM: imx35: Retrieve the IIM base address from devicetree
    3b76bc159878 ARM: imx31: Retrieve the IIM base address from devicetree
    61669e6dec15 ARM: imx27: Retrieve the SYSCTRL base address from devicetree
    d4e913bad2b5 ARM: dts: imx6qdl-gw560x: Remove incorrect 'uart-has-rtscts'
    6d7f38426895 memory: mvebu-devbus: Fix missing clk_disable_unprepare in mvebu_devbus_probe()
    8959188b2f31 memory: atmel-sdramc: Fix missing clk_disable_unprepare in atmel_ramc_probe()
    310268050d58 clk: Provide new devm_clk helpers for prepared and enabled clocks
    c7ef7185a15f clk: generalize devm_clk_get() a bit

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 222c8708a1..bb164928ae 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "053238af99b52ce5ffb19755cdfeb10f206463da"
-SRCREV_meta ?= "9c5bb858a6f5a9b1cc2e585e74e8517387863fd7"
+SRCREV_machine ?= "da7f3c7acf315f6e17fe65f760adf9f28ba74138"
+SRCREV_meta ?= "04a8941a1c8ce5c21e2ec10231f61c96d918bd6d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.230"
+LINUX_VERSION ?= "5.4.231"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 2727a9b094..273e28d102 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.230"
+LINUX_VERSION ?= "5.4.231"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "8517d03dcde5d19a2fd9493433275b3790450ae5"
-SRCREV_machine ?= "d05044bfcb54db9a3dfb9cccd3a39c2c07d844b1"
-SRCREV_meta ?= "9c5bb858a6f5a9b1cc2e585e74e8517387863fd7"
+SRCREV_machine_qemuarm ?= "3bc636e9bb56206940d4b524e0f45ab0138b7cac"
+SRCREV_machine ?= "a21707495771d630b7d8f5a271a4748e634c7ef6"
+SRCREV_meta ?= "04a8941a1c8ce5c21e2ec10231f61c96d918bd6d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index c5c846deb6..bd4889b6de 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c3e35e461a4f880bfe3d007c763fe4ff1670621f"
-SRCREV_machine_qemuarm64 ?= "5604d6b87d39cd4eb427762610f505d5659ce73f"
-SRCREV_machine_qemumips ?= "d0ef5b5eea98083cbb30d42bb191b280d2637a02"
-SRCREV_machine_qemuppc ?= "79202d38795f70dd5c7601cbc8d1c54ecb831ad9"
-SRCREV_machine_qemuriscv64 ?= "c32d5a645da049cf72f9e6b819c32609c7effcec"
-SRCREV_machine_qemux86 ?= "c32d5a645da049cf72f9e6b819c32609c7effcec"
-SRCREV_machine_qemux86-64 ?= "c32d5a645da049cf72f9e6b819c32609c7effcec"
-SRCREV_machine_qemumips64 ?= "eafe1aabab778a089d20f0c686902a7a7215b57e"
-SRCREV_machine ?= "c32d5a645da049cf72f9e6b819c32609c7effcec"
-SRCREV_meta ?= "9c5bb858a6f5a9b1cc2e585e74e8517387863fd7"
+SRCREV_machine_qemuarm ?= "163b7401067e07185336b59280f220e2f49578b3"
+SRCREV_machine_qemuarm64 ?= "8842f2841c82e8a8739eeaf5b1685d32a2089f48"
+SRCREV_machine_qemumips ?= "e2e5389765a4252dd08068b99726f44b82ab190a"
+SRCREV_machine_qemuppc ?= "540bdafa098e2a3566b074e66e4946b4f6997775"
+SRCREV_machine_qemuriscv64 ?= "36bd96a78e924503c332c2999a8d9ae105ebd05a"
+SRCREV_machine_qemux86 ?= "36bd96a78e924503c332c2999a8d9ae105ebd05a"
+SRCREV_machine_qemux86-64 ?= "36bd96a78e924503c332c2999a8d9ae105ebd05a"
+SRCREV_machine_qemumips64 ?= "816c4ec95a87309ec9ae6a8ff39fd4498e3e60f1"
+SRCREV_machine ?= "36bd96a78e924503c332c2999a8d9ae105ebd05a"
+SRCREV_meta ?= "04a8941a1c8ce5c21e2ec10231f61c96d918bd6d"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.230"
+LINUX_VERSION ?= "5.4.231"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


