Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FD5C7619A
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 16:42:49 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.48834.1680453759744339880
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 09:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=bUmqJe9A;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id ja10so25837391plb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 09:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680453759; x=1683045759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Be/TOg0JFi7AYsPf1a0hmy28XdIScq8MvC3KOhQWX8s=;
        b=bUmqJe9A2iqQTXxE/HuyIM2yl5b0pv42K8OmdkZg8Mn0GUfEz/bqeKk8aI5CbnPA6p
         X2kHr8cAeqZPCgvZkke1qp8Md+aDn7JIYpsZ9v9U2KXwXwD2nN3dHWt/ha79b4HQomeD
         HpF7MvpqBcum4a5NI9Hjd7v99F+Xx55Z95gvzjFvsJT/n4b//doEB5m71uZdVEFbcMg6
         lJ7YW/OU3A6gXiVke7fTs9VmFOTq1G3Rg/5hPg72CHI3K9pNGqjCFXd7w7zYI+FoIF9X
         VjDYCn6MIlwLj3Y9+auNV/NnwddXxV8wVhGGZaxxxqRk8BdnXtAIliNRiOjCKytjwMPM
         Swqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680453759; x=1683045759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Be/TOg0JFi7AYsPf1a0hmy28XdIScq8MvC3KOhQWX8s=;
        b=yhqc2i/9VUzasP1dn3mNZLlkCEBDpj99bv1kKQ9WjxXTbymoiecGp8fmmt87fYiizR
         cE+ne7EaFFM5AceAE/s64RdnREuKAi46bMN8sNH8Lct5r91A0WDQtCrRMsnt5pUbzSnk
         Iiltd+rj/EVaGCdMpMZhs3HpM1sKHPqzTSJOkhCjjYmb1VoQNbZuXLSlCtIfOUniDsww
         uOUmi+OSF+P4xWyxm6H8K9IG5uZxmRA8r6BVTjbABGJBG1dqvTeeqhTAOFoC9ghPl3+T
         BIAVNFZOHADNcaVOASqmtB6OXKI1Gi5XN2wk/93CetFnuPr1WuWR1bw9HWBIwXoq0lhF
         zX8g==
X-Gm-Message-State: AAQBX9fY+5YBFsVn54dT0F1yINiB0ZUcB/89drXBAoH9sZXki6HaZ4Mg
	+1Txo6KAYTgFRkTF/2S3qQvoVLKWQZ7AnCpyuVU=
X-Google-Smtp-Source: AKy350Y3+OKryldjxxiPkTxIl5S49jxGSPfwUgt2m0L0FmBlpY6mB5kVmLZFzC5VZmttXzlks11IhA==
X-Received: by 2002:a17:903:181:b0:1a1:f0ad:8657 with SMTP id z1-20020a170903018100b001a1f0ad8657mr42790075plg.37.1680453758468;
        Sun, 02 Apr 2023 09:42:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001a1ddd224desm5042079plb.89.2023.04.02.09.42.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 09:42:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/21] linux-yocto/5.10: update to v5.10.166
Date: Sun,  2 Apr 2023 06:42:02 -1000
Message-Id: <4696c21e0b6f096847559dff4ac71d0cb91fda57.1680453201.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680453201.git.steve@sakoman.com>
References: <cover.1680453201.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 16:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179588

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    8d823aaa220e Linux 5.10.166
    19f1f99be371 clk: Fix pointer casting to prevent oops in devm_clk_release()
    f84c9b72fb20 perf/x86/amd: fix potential integer overflow on shift of a int
    743435cd1705 netfilter: conntrack: unify established states for SCTP paths
    e284c273dbb4 x86/i8259: Mark legacy PIC interrupts with IRQ_LEVEL
    2eca102b350f block: fix and cleanup bio_check_ro
    7fe4fab87061 Revert "selftests/ftrace: Update synthetic event syntax errors"
    032a7d5ff519 nfsd: Ensure knfsd shuts down when the "nfsd" pseudofs is unmounted
    8fe3e574b3ac nouveau: explicitly wait on the fence in nouveau_bo_move_m2mf
    9f3dd454fea5 Revert "Input: synaptics - switch touchpad on HP Laptop 15-da3001TU to RMI mode"
    230be65a18f8 tools: gpio: fix -c option of gpio-event-mon
    7ff8128bb116 net: mdio-mux-meson-g12a: force internal PHY off on mux switch
    62a0806eb4d2 net/tg3: resolve deadlock in tg3_reset_task() during EEH
    e9c1b1e1a00b thermal: intel: int340x: Add locking to int340x_thermal_get_trip_type()
    3af20f63212d net: ravb: Fix possible hang if RIS2_QFF1 happen
    6ef652f35dcf sctp: fail if no bound addresses can be used for a given scope
    cf9a2ce0383e net/sched: sch_taprio: do not schedule in taprio_reset()
    7de16d75b20a netrom: Fix use-after-free of a listening socket.
    498584ccf46c netfilter: conntrack: fix vtag checks for ABORT/SHUTDOWN_COMPLETE
    7f9828fb1f68 ipv4: prevent potential spectre v1 gadget in fib_metrics_match()
    34c6142f0df9 ipv4: prevent potential spectre v1 gadget in ip_metrics_convert()
    870a565bd6fe netlink: annotate data races around sk_state
    8583f52c23c3 netlink: annotate data races around dst_portid and dst_group
    eccb532adabc netlink: annotate data races around nlk->portid
    0308b7dfea6f netfilter: nft_set_rbtree: skip elements in transaction from garbage collection
    4aacf3d78424 netfilter: nft_set_rbtree: Switch to node list walk for overlap detection
    d4c008f3b7f7 net: fix UaF in netns ops registration error path
    539ca5dcbc91 netlink: prevent potential spectre v1 gadgets
    ed173f77fd28 i2c: designware: use casting of u64 in clock multiplication to avoid overflow
    8949ef3a7a0c i2c: designware: Use DIV_ROUND_CLOSEST() macro
    8ebc2efcb6d6 units: Add SI metric prefix definitions
    974aaf11804f units: Add Watt units
    76d9ebb7f0bc EDAC/qcom: Do not pass llcc_driv_data as edac_device_ctl_info's pvt_info
    511f6c7c40b0 EDAC/device: Respect any driver-supplied workqueue polling value
    0cb922cef7e9 ARM: 9280/1: mm: fix warning on phys_addr_t to void pointer assignment
    98d85586aace thermal: intel: int340x: Protect trip temperature from concurrent updates
    76c5640737b8 KVM: x86/vmx: Do not skip segment attributes if unusable bit is set
    e037baee16e0 cifs: Fix oops due to uncleared server->smbd_conn in reconnect
    c42a6e687060 ftrace/scripts: Update the instructions for ftrace-bisect.sh
    886aa449235f trace_events_hist: add check for return value of 'create_hist_field'
    de3930a4883d tracing: Make sure trace_printk() can output as soon as it can be used
    083b3dda86f8 module: Don't wait for GOING modules
    ce3aa7694627 scsi: hpsa: Fix allocation size for scsi_host_alloc()
    6da7055826a1 xhci: Set HCD flag to defer primary roothub registration
    1d580d3e1311 Bluetooth: hci_sync: cancel cmd_timer if hci_open failed
    b98a8b731bd2 exit: Use READ_ONCE() for all oops/warn limit reads
    53f177b50449 docs: Fix path paste-o for /sys/kernel/warn_count
    b0bd5dcfa608 panic: Expose "warn_count" to sysfs
    8c99d4c4c192 panic: Introduce warn_limit
    55eba18262cb panic: Consolidate open-coded panic_on_warn checks
    530cdae5c2b2 exit: Allow oops_limit to be disabled
    7cffbcd68f1c exit: Expose "oops_count" to sysfs
    de586785b981 exit: Put an upper limit on how often we can oops
    191a3b17dd9b panic: Separate sysctl logic from CONFIG_SMP
    1b9a33a94b9c ia64: make IA64_MCA_RECOVERY bool instead of tristate
    6d971830da31 csky: Fix function name in csky_alignment() and die()
    648d8b8c4938 h8300: Fix build errors from do_exit() to make_task_dead() transition
    63d77c559678 hexagon: Fix function name in die()
    b2c178f31162 objtool: Add a missing comma to avoid string concatenation
    d9c740c765e5 exit: Add and use make_task_dead.
    715a63588f56 kasan: no need to unset panic_on_warn in end_report()
    b857b42a8c09 ubsan: no need to unset panic_on_warn in ubsan_epilogue()
    590ba6fee095 panic: unset panic_on_warn inside panic()
    e97ec099d7fd kernel/panic: move panic sysctls to its own file
    e6226917f4cf sysctl: add a new register_sysctl_init() interface
    c4097e844a6e fs: reiserfs: remove useless new_opts in reiserfs_remount
    1f6768143bf7 x86: ACPI: cstate: Optimize C3 entry on AMD CPUs
    5fb884d748e4 netfilter: conntrack: do not renew entry stuck in tcp SYN_SENT state
    a7345145e7bd Revert "selftests/bpf: check null propagation only neither reg is PTR_TO_BTF_ID"
    20a02bc84508 lockref: stop doing cpu_relax in the cmpxchg loop
    f8ddf7dbf5e7 platform/x86: asus-nb-wmi: Add alternate mapping for KEY_SCREENLOCK
    9968f9a86251 platform/x86: touchscreen_dmi: Add info for the CSL Panther Tab HD
    52249c2168af scsi: hisi_sas: Set a port invalid only if there are no devices attached when refreshing port id
    71bd134c4e9e KVM: s390: interrupt: use READ_ONCE() before cmpxchg()
    300da569a128 spi: spidev: remove debug messages that access spidev->spi without locking
    a84def9b108a ASoC: fsl-asoc-card: Fix naming of AC'97 CODEC widgets
    d9a0752a6a11 ASoC: fsl_ssi: Rename AC'97 streams to avoid collisions with AC'97 CODEC
    00f230161187 cpufreq: armada-37xx: stop using 0 as NULL pointer
    2ca345d19cbd s390/debug: add _ASM_S390_ prefix to header guard
    ae108a5fc929 drm: Add orientation quirk for Lenovo ideapad D330-10IGL
    96f4899a3810 ASoC: fsl_micfil: Correct the number of steps on SX controls
    3b154d5204ff kcsan: test: don't put the expect array on the stack
    b75e9fc402c4 cpufreq: Add Tegra234 to cpufreq-dt-platdev blocklist
    6bc564f3fec0 scsi: iscsi: Fix multiple iSCSI session unbind events sent to userspace
    d79e700680f9 tcp: fix rate_app_limited to default to 1
    a84240df7079 net: dsa: microchip: ksz9477: port map correction in ALU table entry register
    704a423c9379 driver core: Fix test_async_probe_init saves device in wrong array
    216f35db6ec6 w1: fix WARNING after calling w1_process()
    8e5be0ae5506 w1: fix deadloop in __w1_remove_master_device()
    ddf16dae65d3 tcp: avoid the lookup process failing to get sk in ehash table
    5f10f7efe0fc nvme-pci: fix timeout request state check
    98519ed69113 dmaengine: xilinx_dma: call of_node_put() when breaking out of for_each_child_of_node()
    28fc6095da22 HID: betop: check shape of output reports
    16791d5a7a9a l2tp: prevent lockdep issue in l2tp_tunnel_register()
    f96b2f690887 net: macb: fix PTP TX timestamp failure due to packet padding
    42ecd72f02cd dmaengine: Fix double increment of client_count in dma_chan_get()
    1e97e2e08e79 drm/panfrost: fix GENERIC_ATOMIC64 dependency
    31f63c62a8e8 net: mlx5: eliminate anonymous module_init & module_exit
    4b3b5cc1a7dc usb: gadget: f_fs: Ensure ep0req is dequeued before free_request
    6dd9ea05534f usb: gadget: f_fs: Prevent race during ffs_ep0_queue_wait
    55be77aa8974 HID: revert CHERRY_MOUSE_000C quirk
    34f11949938b net: stmmac: fix invalid call to mdiobus_get_phy()
    20fd4598762e HID: check empty report_list in bigben_probe()
    5dc3469a1170 HID: check empty report_list in hid_validate_values()
    4bc5f1f6bc94 net: mdio: validate parameter addr in mdiobus_get_phy()
    67866b1e0ab9 net: usb: sr9700: Handle negative len
    2d77e5c0ad79 l2tp: close all race conditions in l2tp_tunnel_register()
    76c640d6a1e8 l2tp: convert l2tp_tunnel_list to idr
    5b209b8c99d4 l2tp: Don't sleep and disable BH under writer-side sk_callback_lock
    e34a965f771f l2tp: Serialize access to sk_user_data with sk_callback_lock
    c60fe70078d6 net/sched: sch_taprio: fix possible use-after-free
    802fd7623e9e wifi: rndis_wlan: Prevent buffer overflow in rndis_query_oid
    1af8071bd08e gpio: mxc: Always set GPIOs used as interrupt source to INPUT mode
    613020d0489e net: wan: Add checks for NULL for utdm in undo_uhdlc_init and unmap_si_regs
    ad1baab3a5c0 net: nfc: Fix use-after-free in local_cleanup()
    2a0156a4aaea phy: rockchip-inno-usb2: Fix missing clk_disable_unprepare() in rockchip_usb2phy_power_on()
    da75dec7c661 bpf: Fix pointer-leak due to insufficient speculative store bypass mitigation
    f351af45e203 amd-xgbe: Delay AN timeout during KR training
    a65a8727a2fe amd-xgbe: TX Flow Ctrl Registers are h/w ver dependent
    aa8b584cec01 ARM: dts: at91: sam9x60: fix the ddr clock for sam9x60
    fa566549a152 phy: ti: fix Kconfig warning and operator precedence
    b18490138dc6 PM: AVS: qcom-cpr: Fix an error handling path in cpr_probe()
    39ab0fc49842 affs: initialize fsdata in affs_truncate()
    f6fa12fbb17c IB/hfi1: Remove user expected buffer invalidate race
    6ce4382bd137 IB/hfi1: Immediately remove invalid memory from hardware
    6dd8136fd1b3 IB/hfi1: Fix expected receive setup error exit issues
    ee474dd66e82 IB/hfi1: Reserve user expected TIDs
    73e5666bf30d IB/hfi1: Reject a zero-length user expected buffer
    d66c1d4178c2 RDMA/core: Fix ib block iterator counter overflow
    eab7a920379a tomoyo: fix broken dependency on *.conf.default
    6813d8ba7dac firmware: arm_scmi: Harden shared memory access in fetch_notification
    e85df1db28dc firmware: arm_scmi: Harden shared memory access in fetch_response
    329fbd260352 EDAC/highbank: Fix memory leak in highbank_mc_probe()
    7b4516ba56f1 HID: intel_ish-hid: Add check for ishtp_dma_tx_map
    d775671dccf4 ARM: imx: add missing of_node_put()
    5c1dcedd5206 arm64: dts: imx8mm-beacon: Fix ecspi2 pinmux
    cccb0aea9c3f ARM: dts: imx6qdl-gw560x: Remove incorrect 'uart-has-rtscts'
    6805e392f508 ARM: dts: imx7d-pico: Use 'clock-frequency'
    2a3c3a01e2f0 ARM: dts: imx6ul-pico-dwarf: Use 'clock-frequency'
    e57ea0c6ba7f memory: mvebu-devbus: Fix missing clk_disable_unprepare in mvebu_devbus_probe()
    53f55d6e07c4 memory: atmel-sdramc: Fix missing clk_disable_unprepare in atmel_ramc_probe()
    935ec78de50e clk: Provide new devm_clk helpers for prepared and enabled clocks
    0b8b21c0b38f clk: generalize devm_clk_get() a bit
    179624a57b78 Linux 5.10.165
    e699cce29acc io_uring/rw: remove leftover debug statement
    3d5f181bda25 io_uring/rw: ensure kiocb_end_write() is always called
    c1a279d79e31 io_uring: fix double poll leak on repolling
    ddaaadf22bea io_uring: Clean up a false-positive warning from GCC 9.3.0
    8bc72b4952cf mm/khugepaged: fix collapse_pte_mapped_thp() to allow anon_vma
    217721b76313 Bluetooth: hci_qca: Fixed issue during suspend
    c208f1e84a67 Bluetooth: hci_qca: check for SSR triggered flag while suspend
    ef11bc4bb975 Bluetooth: hci_qca: Wait for SSR completion during suspend
    c392c350a042 soc: qcom: apr: Make qcom,protection-domain optional again
    71e5cd1018d3 Revert "wifi: mac80211: fix memory leak in ieee80211_if_add()"
    be1067427abd net/mlx5: fix missing mutex_unlock in mlx5_fw_fatal_reporter_err_work()
    f6c201b4382d net/ulp: use consistent error code when blocking ULP
    fc2491562a9b io_uring/net: fix fast_iov assignment in io_setup_async_msg()
    89a77271d254 io_uring: io_kiocb_update_pos() should not touch file for non -1 offset
    c6e3c12ff9fb tracing: Use alignof__(struct {type b;}) instead of offsetof()
    03ba86bb3811 x86/fpu: Use _Alignof to avoid undefined behavior in TYPE_ALIGN
    2f45b20c3999 Revert "drm/amdgpu: make display pinning more flexible (v2)"
    d6544bccc196 efi: rt-wrapper: Add missing include
    4012603cbd46 arm64: efi: Execute runtime services from a dedicated stack
    bf1d287c1413 drm/amd/display: Fix COLOR_SPACE_YCBCR2020_TYPE matrix
    75105d943d7a drm/amd/display: Calculate output_color_space after pixel encoding adjustment
    a3ef53248399 drm/amd/display: Fix set scaling doesn's work
    59590f50ec9d drm/i915: re-disable RC6p on Sandy Bridge
    d960fff8e2c0 mei: me: add meteor lake point M DID
    ae2a9dcc8caa gsmi: fix null-deref in gsmi_get_variable
    a75e80d11826 serial: atmel: fix incorrect baudrate setup
    5a7a04079592 dmaengine: tegra210-adma: fix global intr clear
    c9da2cb968ea serial: pch_uart: Pass correct sg to dma_unmap_sg()
    e924f79e67d7 dt-bindings: phy: g12a-usb3-pcie-phy: fix compatible string documentation
    31132df12a93 dt-bindings: phy: g12a-usb2-phy: fix compatible string documentation
    a9f2658a0192 usb-storage: apply IGNORE_UAS only for HIKSEMI MD202 on RTL9210
    e92c70059178 usb: gadget: f_ncm: fix potential NULL ptr deref in ncm_bitrate()
    06600ae7e069 usb: gadget: g_webcam: Send color matching descriptor per frame
    6107a8f15c0f usb: typec: altmodes/displayport: Fix pin assignment calculation
    d26f38d16fcb usb: typec: altmodes/displayport: Add pin assignment helper
    9c58f1e9e693 usb: host: ehci-fsl: Fix module alias
    3dc896db027b USB: serial: cp210x: add SCALANCE LPE-9000 device id
    856e4b5e53f2 USB: gadgetfs: Fix race between mounting and unmounting
    894681682dbe tty: serial: qcom-geni-serial: fix slab-out-of-bounds on RX FIFO buffer
    c4ab24e3334b thunderbolt: Use correct function to calculate maximum USB3 link rate
    531268a875dc cifs: do not include page data when checking signature
    3bd433748571 btrfs: fix race between quota rescan and disable leading to NULL pointer deref
    6ee8feca9150 mmc: sdhci-esdhc-imx: correct the tuning start tap and step setting
    79819909c223 mmc: sunxi-mmc: Fix clock refcount imbalance during unbind
    2eed23765b7e comedi: adv_pci1760: Fix PWM instruction handling
    7efeed828c90 usb: core: hub: disable autosuspend for TI TUSB8041
    b171d0d2cf1b misc: fastrpc: Fix use-after-free race condition for maps
    193cd853145b misc: fastrpc: Don't remove map on creater_process and device_release
    e0db5d44bc27 USB: misc: iowarrior: fix up header size for USB_DEVICE_ID_CODEMERCS_IOW100
    20d0dedc7a04 staging: vchiq_arm: fix enum vchiq_status return types
    a06e9ec5abde USB: serial: option: add Quectel EM05CN modem
    2f44c60bb89c USB: serial: option: add Quectel EM05CN (SG) modem
    fcd49b230906 USB: serial: option: add Quectel EC200U modem
    21c5b618128b USB: serial: option: add Quectel EM05-G (RS) modem
    46b898f9345d USB: serial: option: add Quectel EM05-G (CS) modem
    3774654f7a63 USB: serial: option: add Quectel EM05-G (GR) modem
    9f8e45720e0e prlimit: do_prlimit needs to have a speculation check
    96562a23cfaf xhci: Detect lpm incapable xHC USB3 roothub ports from ACPI tables
    2551f8cbf2de usb: acpi: add helper to check port lpm capability using acpi _DSM
    4d70a8a9ab8e xhci: Add a flag to disable USB3 lpm on a xhci root port level.
    83e3a5be7475 xhci: Add update_hub_device override for PCI xHCI hosts
    081105213ff6 xhci: Fix null pointer dereference when host dies
    66fc1600855c usb: xhci: Check endpoint is valid before dereferencing it
    8ca60d59b963 xhci-pci: set the dma max_seg_size
    ea2e6286e3e8 io_uring/rw: defer fsnotify calls to task context
    e90cfb969994 io_uring: do not recalculate ppos unnecessarily
    ea528ecac3ae io_uring: update kiocb->ki_pos at execution time
    076f872314d4 io_uring: remove duplicated calls to io_kiocb_ppos
    e9c6556708d3 io_uring: ensure that cached task references are always put on exit
    e0140e9da31e io_uring: fix CQ waiting timeout handling
    de77faee2801 io_uring: lock overflowing for IOPOLL
    78e8151f04f0 io_uring: check for valid register opcode earlier
    aa4c9b3e45e2 io_uring: fix async accept on O_NONBLOCK sockets
    4bc17e6381bd io_uring: allow re-poll if we made progress
    f901b4bfd03e io_uring: support MSG_WAITALL for IORING_OP_SEND(MSG)
    96ccba4a1a59 io_uring: add flag for disabling provided buffer recycling
    aadd9b093018 io_uring: ensure recv and recvmsg handle MSG_WAITALL correctly
    abdc16c8361b io_uring: improve send/recv error handling
    2fd232bbd66f io_uring: don't gate task_work run on TIF_NOTIFY_SIGNAL
    e84ec6e25df9 Bluetooth: hci_qca: Fix driver shutdown on closed serdev
    1ab0098333f5 Bluetooth: hci_qca: Wait for timeout during suspend
    413638f61501 drm/i915/gt: Reset twice
    cab2123567af ALSA: hda/realtek - Turn on power early
    5822baf9501a efi: fix userspace infinite retry read efivars after EFI runtime services page fault
    712bd74eccb9 nilfs2: fix general protection fault in nilfs_btree_insert()
    03bf73e09ad6 zonefs: Detect append writes at invalid locations
    20d0a6d17e85 Add exception protection processing for vd in axi_chan_handle_err function
    187523fa7c2d wifi: mac80211: sdata can be NULL during AMPDU start
    2d1fd99e8e12 wifi: brcmfmac: fix regression for Broadcom PCIe wifi devices
    72009139a661 f2fs: let's avoid panic if extent_tree is not created
    bf6c7f180131 x86/asm: Fix an assembler warning with current binutils
    18bd1c9c02e6 btrfs: always report error in run_one_delayed_ref()
    936b8b15a23b RDMA/srp: Move large values to a new enum for gcc13
    0040e48492f3 net/ethtool/ioctl: return -EOPNOTSUPP if we have no phy stats
    f7845de23f90 tools/virtio: initialize spinlocks in vring_test.c
    3093027183f2 selftests/bpf: check null propagation only neither reg is PTR_TO_BTF_ID
    c7c36bb6eafd pNFS/filelayout: Fix coalescing test for single DS
    2cbd815970f8 btrfs: fix trace event name typo for FLUSH_DELAYED_REFS

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index b405e26559..18ec2c3137 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bef23484a248b16734799b2e20c2cb54f10dbf02"
-SRCREV_meta ?= "c80b8535ceb3b543cbb942bf6988842440b419ad"
+SRCREV_machine ?= "4b9f53c8732f618357c28957a9fa253633a22cbc"
+SRCREV_meta ?= "3c0a8fa9826fee4dad01f1142425d56358450baa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.164"
+LINUX_VERSION ?= "5.10.166"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 8688ae1fd1..1082c64062 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.164"
+LINUX_VERSION ?= "5.10.166"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "6aba4eb1e717741460f622635615638ce58b959d"
-SRCREV_machine ?= "274102e69a66a9a5e5d844ab0e6f0e00a0b0317f"
-SRCREV_meta ?= "c80b8535ceb3b543cbb942bf6988842440b419ad"
+SRCREV_machine:qemuarm ?= "fac8197767b17e3d19a9bd32095d95ae30ca85f6"
+SRCREV_machine ?= "54f21c5d3b57ff1c4035e269cd07c212eabdc78e"
+SRCREV_meta ?= "3c0a8fa9826fee4dad01f1142425d56358450baa"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index cffd318a7a..6197e74583 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "883d66d6ccfc4cedc3114056b093a615d52ade21"
-SRCREV_machine:qemuarm64 ?= "1ad0cb1a6e23446436925d091b1312a6c671df4e"
-SRCREV_machine:qemumips ?= "36a2c0a0bf3fb832075d04e7fad9b1ff6cfaa3c8"
-SRCREV_machine:qemuppc ?= "8cd004bdeab7d416914d014f70453395d3ef6ba1"
-SRCREV_machine:qemuriscv64 ?= "aa3e6f9612a65d12729f2ed729c421a0f29e3798"
-SRCREV_machine:qemuriscv32 ?= "aa3e6f9612a65d12729f2ed729c421a0f29e3798"
-SRCREV_machine:qemux86 ?= "aa3e6f9612a65d12729f2ed729c421a0f29e3798"
-SRCREV_machine:qemux86-64 ?= "aa3e6f9612a65d12729f2ed729c421a0f29e3798"
-SRCREV_machine:qemumips64 ?= "8280b4262663052c504b5d0f6990af84d6d3aaf4"
-SRCREV_machine ?= "aa3e6f9612a65d12729f2ed729c421a0f29e3798"
-SRCREV_meta ?= "c80b8535ceb3b543cbb942bf6988842440b419ad"
+SRCREV_machine:qemuarm ?= "1e771a9729b622bf80c369af9e89d8dc5ecb90cd"
+SRCREV_machine:qemuarm64 ?= "d592de06ff6e9a351af5b182b9764cb9ce45bda5"
+SRCREV_machine:qemumips ?= "ebb48115617144f5dd1df0cab3efe56389bebef5"
+SRCREV_machine:qemuppc ?= "ad5f39dbc18c165db00411436d724dc380909ce8"
+SRCREV_machine:qemuriscv64 ?= "58c04d94261d55a4bd1c9713b1a309afdd56080c"
+SRCREV_machine:qemuriscv32 ?= "58c04d94261d55a4bd1c9713b1a309afdd56080c"
+SRCREV_machine:qemux86 ?= "58c04d94261d55a4bd1c9713b1a309afdd56080c"
+SRCREV_machine:qemux86-64 ?= "58c04d94261d55a4bd1c9713b1a309afdd56080c"
+SRCREV_machine:qemumips64 ?= "250545528ee6cefb5bc92d406c92115e89589c15"
+SRCREV_machine ?= "58c04d94261d55a4bd1c9713b1a309afdd56080c"
+SRCREV_meta ?= "3c0a8fa9826fee4dad01f1142425d56358450baa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.164"
+LINUX_VERSION ?= "5.10.166"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


