Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.261.1621289831647303669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 15:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j+Nl4zYo;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id h21so6089287qtu.5
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 15:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i1J+0Yihg9H3cK3bsQNJ8ojnXO3t2lUAKDzHjupJywg=;
        b=j+Nl4zYoZPY4B1r5tX5JFki77ku/EZiP4laRlBhO9CJX+9Ts4lQ9fbJq3y8jN3+cd0
         YRKAFE0hiZm/N4POh8XVw2x+plLsCnBpM2SJuYLK6xIM3TRTK/aOLT7JYRA8b/i6tQHC
         SbC6vc8zW9ocv1IMGM1kW4/9zQtre/y5S8kJA2OuICVLy66Obest2ehN3KRQKGa9Xmt8
         YRaRHWIdBt50gN7p/lFpC0FFUiQKdww1DPqNr8mWkxWEbwYPoC7338KB3xYjOimrsFOT
         l04fu2tRKaM7fTND3041H7sV/x3BY+IjTJGo+n0nL0J3ReInGJwyl4H9gk6cqvV4NmAq
         mvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i1J+0Yihg9H3cK3bsQNJ8ojnXO3t2lUAKDzHjupJywg=;
        b=VO3CSsXQzE2k9/XrTHAKesjnqSdB75oLXa1HHKJU4HVIP8SFW7BCAlMFnMgkfIUaRX
         NcZMqkHDqkjdev+IoG30q5iiNfaA+3MG7NPOwkD25zteF2QdlnqCsumCuEbOPB4pLMrU
         tg4p/rpfRZsSsqKQZHjOlIFmRImZCBKhazGfe1kN2/BeILciJ9jKroONHv8MNvuJK1HK
         ZtOadnzp/pDkUfvVPYp1SzlCS4J6NjH9KfwWIouwwXxcfiAJaBfB1HV0mwiXMKQigf2/
         pu+NTLYrca3PXPx2BYgGK4vgp+RSQ8l5Cb36zkah8l0fScamHHUkWgHkVlTObBEGwv/p
         t/Pg==
X-Gm-Message-State: AOAM530NJ55vTVCN7utGPP8tFUsignPKhT3AOYarMrR/ZENI+KV+mjfU
	2nyGwYYk/dFz88ZOvDZvNUxmm4dXU+RWww==
X-Google-Smtp-Source: ABdhPJzwBV/GQ1bJFvUD9S2xD980na338ALSKtTueOjQsl78FFOpX1xUzraDa/VABRLu6G6gfxpboA==
X-Received: by 2002:a05:622a:15c9:: with SMTP id d9mr1671721qty.103.1621289830666;
        Mon, 17 May 2021 15:17:10 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id y10sm9789558qtm.17.2021.05.17.15.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 15:17:10 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] linux-yocto/5.4: update to v5.4.119
Date: Mon, 17 May 2021 18:16:59 -0400
Message-Id: <c74e808457dbf922ae4a8d5e41dd446b39baa8d9.1621275692.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1621275692.git.bruce.ashfield@gmail.com>
References: <cover.1621275692.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    b82e5721a173 Linux 5.4.119
    6b183fbf18b9 Revert "fdt: Properly handle "no-map" field in the memory region"
    66b8853dfa3c Revert "of/fdt: Make sure no-map does not remove already reserved regions"
    3fe9ee040fb7 sctp: delay auto_asconf init until binding the first addr
    e1bf000709cc Revert "net/sctp: fix race condition in sctp_destroy_sock"
    32e046965fac smp: Fix smp_call_function_single_async prototype
    9884f745108f net: Only allow init netns to set default tcp cong to a restricted algo
    4a83a9deead9 mm/memory-failure: unnecessary amount of unmapping
    de143fb2feac mm/sparse: add the missing sparse_buffer_fini() in error branch
    ba450bba7115 kfifo: fix ternary sign extension bugs
    24c54e0a9747 net:nfc:digital: Fix a double free in digital_tg_recv_dep_req
    07ef3f7bc5c4 net: bridge: mcast: fix broken length + header check for MRDv6 Adv.
    da5b49598a11 RDMA/bnxt_re: Fix a double free in bnxt_qplib_alloc_res
    30b9e92d0b5e RDMA/siw: Fix a use after free in siw_alloc_mr
    55fcdd1258fa net:emac/emac-mac: Fix a use after free in emac_mac_tx_buf_send
    b1523e4ba293 bnxt_en: Fix RX consumer index logic in the error path.
    d1ad9f2f7e2d selftests: net: mirror_gre_vlan_bridge_1q: Make an FDB entry static
    6f92124d7441 net: geneve: modify IP header check in geneve6_xmit_skb and geneve_xmit_skb
    06e03b867d96 arm64: dts: uniphier: Change phy-mode to RGMII-ID to enable delay pins for RTL8211E
    978170191d3d ARM: dts: uniphier: Change phy-mode to RGMII-ID to enable delay pins for RTL8211E
    4bfea784ea35 bnxt_en: fix ternary sign extension bug in bnxt_show_temp()
    10ff6ad91e0d powerpc/52xx: Fix an invalid ASM expression ('addi' used instead of 'add')
    c6af4c1d196e ath10k: Fix ath10k_wmi_tlv_op_pull_peer_stats_info() unlock without lock
    bf0be675e646 ath9k: Fix error check in ath9k_hw_read_revisions() for PCI devices
    87fc6b2914e5 net: phy: intel-xway: enable integrated led functions
    57bed78ce64a net: renesas: ravb: Fix a stuck issue when a lot of frames are received
    27a894a9556f net: davinci_emac: Fix incorrect masking of tx and rx error channel
    8d77c9564309 ALSA: usb: midi: don't return -ENOMEM when usb_urb_ep_type_check fails
    59f965ef61d7 RDMA/i40iw: Fix error unwinding when i40iw_hmc_sd_one fails
    d7ba506b00ea RDMA/cxgb4: add missing qpid increment
    f7368865da57 gro: fix napi_gro_frags() Fast GRO breakage due to IP alignment check
    e97aea9f2503 vsock/vmci: log once the failed queue pair allocation
    469135100325 mwl8k: Fix a double Free in mwl8k_probe_hw
    afb735e764ba i2c: sh7760: fix IRQ error path
    da80b35b6e26 rtlwifi: 8821ae: upgrade PHY and RF parameters
    b1b8d90d4550 powerpc/pseries: extract host bridge from pci_bus prior to bus removal
    bdad13dd15e2 MIPS: pci-legacy: stop using of_pci_range_to_resource
    5950c9d7f987 perf beauty: Fix fsconfig generator
    0ff76bd07bc4 drm/i915/gvt: Fix error code in intel_gvt_init_device()
    ecfbcb858007 ASoC: ak5558: correct reset polarity
    c77bf004717d powerpc/xive: Fix xmon command "dxi"
    65b771660f57 i2c: sh7760: add IRQ check
    cb834ff29bdb i2c: jz4780: add IRQ check
    aa90700f953a i2c: emev2: add IRQ check
    45f02a0f8ded i2c: cadence: add IRQ check
    7e1764312440 i2c: sprd: fix reference leak when pm_runtime_get_sync fails
    5f51ddcbfc78 i2c: omap: fix reference leak when pm_runtime_get_sync fails
    815859cb1d23 i2c: imx-lpi2c: fix reference leak when pm_runtime_get_sync fails
    4734c4b1d957 i2c: img-scb: fix reference leak when pm_runtime_get_sync fails
    ed016b77012e RDMA/srpt: Fix error return code in srpt_cm_req_recv()
    e1d10b2cc792 net: thunderx: Fix unintentional sign extension issue
    b0d8fa3adc9d cxgb4: Fix unintentional sign extension issues
    05692b952365 IB/hfi1: Fix error return code in parse_platform_config()
    53656a2a0183 RDMA/qedr: Fix error return code in qedr_iw_connect()
    bf365066fbe0 KVM: PPC: Book3S HV P9: Restore host CTRL SPR after guest exit
    af5a87a1d413 mt7601u: fix always true expression
    53ada35f2ecc mac80211: bail out if cipher schemes are invalid
    22cb8496f290 powerpc: iommu: fix build when neither PCI or IBMVIO is set
    5aa028a827fe powerpc/perf: Fix PMU constraint check for EBB events
    73f9dccb29e4 powerpc/64s: Fix pte update for kernel memory on radix
    440fead0fc81 liquidio: Fix unintented sign extension of a left shift of a u16
    92626cf41b0e ASoC: simple-card: fix possible uninitialized single_cpu local variable
    e1b01d914c31 ALSA: usb-audio: Add error checks for usb_driver_claim_interface() calls
    11fa9b38e030 mips: bmips: fix syscon-reboot nodes
    c8f7e2e04724 net: hns3: Limiting the scope of vector_ring_chain variable
    cab33b3b6da8 nfc: pn533: prevent potential memory corruption
    efb0f45b4535 bug: Remove redundant condition check in report_bug
    7628bc544ba8 ALSA: core: remove redundant spin_lock pair in snd_card_disconnect
    3733a64d5828 powerpc: Fix HAVE_HARDLOCKUP_DETECTOR_ARCH build configuration
    fee81285bd09 inet: use bigger hash table for IP ID generation
    318993949423 powerpc/prom: Mark identical_pvr_fixup as __init
    4543fcd6835b powerpc/fadump: Mark fadump_calculate_reserve_size as __init
    e00c5b9eebf0 net: lapbether: Prevent racing when checking whether the netif is running
    f937a0f6ada1 perf symbols: Fix dso__fprintf_symbols_by_name() to return the number of printed chars
    1121f5f3d440 HID: plantronics: Workaround for double volume key presses
    59021008b317 drivers/block/null_blk/main: Fix a double free in null_init.
    279749d0d4ef sched/debug: Fix cgroup_path[] serialization
    c01fc0adba30 x86/events/amd/iommu: Fix sysfs type mismatch
    846357609409 HSI: core: fix resource leaks in hsi_add_client_from_dt()
    ff386ac05098 nvme-pci: don't simple map sgl when sgls are disabled
    7e1ab103f63f mfd: stm32-timers: Avoid clearing auto reload register
    e8fe98f6ec69 scsi: ibmvfc: Fix invalid state machine BUG_ON()
    ce8585f979e4 scsi: sni_53c710: Add IRQ check
    1ff0b82c6674 scsi: sun3x_esp: Add IRQ check
    4b94098f0aa7 scsi: jazz_esp: Add IRQ check
    ae0cadd35daf scsi: hisi_sas: Fix IRQ checks
    6adac4efe77d clk: uniphier: Fix potential infinite loop
    e1a5c8594c0e clk: qcom: a53-pll: Add missing MODULE_DEVICE_TABLE
    6c9bbf98b1d8 clk: zynqmp: move zynqmp_pll_set_mode out of round_rate callback
    3d81ce0cfb31 vfio/mdev: Do not allow a mdev_type to have a NULL parent pointer
    e6707395c839 media: v4l2-ctrls.c: fix race condition in hdl->requests list
    b22867aa3d32 nvme: retrigger ANA log update if group descriptor isn't found
    999d606a820c nvmet-tcp: fix incorrect locking in state_change sk callback
    ced0760eb45a nvme-tcp: block BH in sk state_change sk callback
    4bbae57c7bde ata: libahci_platform: fix IRQ check
    bafcaa016585 sata_mv: add IRQ checks
    782ec39b37bd pata_ipx4xx_cf: fix IRQ check
    af9c0391353d pata_arasan_cf: fix IRQ check
    c66229b36fd3 x86/kprobes: Fix to check non boostable prefixes correctly
    1cfaa6444a5e drm/amdkfd: fix build error with AMD_IOMMU_V2=m
    bfd83cf79b7f media: m88rs6000t: avoid potential out-of-bounds reads on arrays
    7db94692631e media: platform: sunxi: sun6i-csi: fix error return code of sun6i_video_start_streaming()
    1dc1d30ac101 media: aspeed: fix clock handling logic
    d36f9755d1db media: omap4iss: return error code when omap4iss_get() failed
    75c6252e8630 media: vivid: fix assignment of dev->fbuf_out_flags
    6b121dc6807c soc: aspeed: fix a ternary sign expansion bug
    f276d195ce10 xen-blkback: fix compatibility bug with single page rings
    aafb5e38e695 ttyprintk: Add TTY hangup callback.
    ce7b62d85791 usb: dwc2: Fix hibernation between host and device modes.
    6f7ed537ca2d usb: dwc2: Fix host mode hibernation exit with remote wakeup flow.
    e83dcf255a13 Drivers: hv: vmbus: Increase wait time for VMbus unload
    9b47b3a67552 x86/platform/uv: Fix !KEXEC build failure
    9a9ce397336e platform/x86: pmc_atom: Match all Beckhoff Automation baytrail boards with critclk_systems DMI table
    eec90f4b9575 usbip: vudc: fix missing unlock on error in usbip_sockfd_store()
    d3b6b252bab0 node: fix device cleanups in error handling code
    3f605558a4f7 firmware: qcom-scm: Fix QCOM_SCM configuration
    77a1c15145c8 serial: core: return early on unsupported ioctls
    b6803d57f587 tty: fix return value for unsupported ioctls
    932d67b84b4f tty: actually undefine superseded ASYNC flags
    a6fb73f4e009 USB: cdc-acm: fix TIOCGSERIAL implementation
    8abef571fd92 USB: cdc-acm: fix unprivileged TIOCCSERIAL
    9aa155203427 usb: gadget: r8a66597: Add missing null check on return from platform_get_resource
    4a01ad002d2e spi: fsl-lpspi: Fix PM reference leak in lpspi_prepare_xfer_hardware()
    eaf03935b859 cpufreq: armada-37xx: Fix determining base CPU frequency
    d33a00f35531 cpufreq: armada-37xx: Fix driver cleanup when registration failed
    4bffea742b66 clk: mvebu: armada-37xx-periph: Fix workaround for switching from L1 to L0
    0289edd869ac clk: mvebu: armada-37xx-periph: Fix switching CPU freq from 250 Mhz to 1 GHz
    0c793b76066b cpufreq: armada-37xx: Fix the AVS value for load L1
    b671a3277b7c clk: mvebu: armada-37xx-periph: remove .set_parent method for CPU PM clock
    3518c6d0178c cpufreq: armada-37xx: Fix setting TBG parent for load levels
    19d16a689793 crypto: qat - Fix a double free in adf_create_ring
    32f5f51a3703 ACPI: CPPC: Replace cppc_attr with kobj_attribute
    726837481c93 soc: qcom: mdt_loader: Detect truncated read of segments
    08b601cb7aef soc: qcom: mdt_loader: Validate that p_filesz < p_memsz
    001c8e83646a spi: Fix use-after-free with devm_spi_alloc_*
    3b0cd47fe1b7 PM / devfreq: Use more accurate returned new_freq as resume_freq
    51a5e5e93c01 staging: greybus: uart: fix unprivileged TIOCCSERIAL
    c751e448b726 staging: rtl8192u: Fix potential infinite loop
    8148375c865f irqchip/gic-v3: Fix OF_BAD_ADDR error handling
    ef8e7bfea99a mtd: rawnand: gpmi: Fix a double free in gpmi_nand_init
    f6a90818a320 m68k: mvme147,mvme16x: Don't wipe PCC timer config bits
    870533403ffa soundwire: stream: fix memory leak in stream config error path
    7cd10f8a5a9d memory: pl353: fix mask of ECC page_size config register
    6b18f6ac820e USB: gadget: udc: fix wrong pointer passed to IS_ERR() and PTR_ERR()
    93615b25c78f usb: gadget: aspeed: fix dma map failure
    c675ead206b7 crypto: qat - fix error path in adf_isr_resource_alloc()
    f3685a9ef29d phy: marvell: ARMADA375_USBCLUSTER_PHY should not default to y, unconditionally
    4dc0332faf80 soundwire: bus: Fix device found flag correctly
    3a76ec28824c bus: qcom: Put child node before return
    5880afefe0cb mtd: require write permissions for locking and badblock ioctls
    ff352d27d4ce fotg210-udc: Complete OUT requests on short packets
    0d19ad0706c2 fotg210-udc: Don't DMA more than the buffer can take
    88f1100e523c fotg210-udc: Mask GRP2 interrupts we don't handle
    f580a8046acf fotg210-udc: Remove a dubious condition leading to fotg210_done
    359d1b0ad239 fotg210-udc: Fix EP0 IN requests bigger than two packets
    9a97aa4bbe0f fotg210-udc: Fix DMA on EP0 for length > max packet size
    05ec8192ee4b crypto: qat - ADF_STATUS_PF_RUNNING should be set after adf_dev_init
    2a41049a0e21 crypto: qat - don't release uninitialized resources
    cfd99d250cde usb: gadget: pch_udc: Check for DMA mapping error
    44452b7bd35d usb: gadget: pch_udc: Check if driver is present before calling ->setup()
    23978eb064dc usb: gadget: pch_udc: Replace cpu_to_le32() by lower_32_bits()
    369428a646b7 x86/microcode: Check for offline CPUs before requesting new microcode
    6b8ff2a35a74 arm64: dts: renesas: r8a77980: Fix vin4-7 endpoint binding
    cbf784eff5de spi: stm32: drop devres version of spi_register_master
    15ee35be9286 arm64: dts: qcom: sm8150: fix number of pins in 'gpio-ranges'
    168877a575a5 mtd: rawnand: qcom: Return actual error code instead of -ENODEV
    73744fcb4eb0 mtd: Handle possible -EPROBE_DEFER from parse_mtd_partitions()
    e5b3e69eb36a mtd: rawnand: brcmnand: fix OOB R/W with Hamming ECC
    9e612890bb87 mtd: rawnand: fsmc: Fix error code in fsmc_nand_probe()
    d8897f7b2283 regmap: set debugfs_name to NULL after it is freed
    0d2c86076844 usb: typec: tcpci: Check ROLE_CONTROL while interpreting CC_STATUS
    6e666a05e540 serial: stm32: fix tx_empty condition
    12e423331ec9 serial: stm32: fix incorrect characters on console
    6be27923140a ARM: dts: exynos: correct PMIC interrupt trigger level on Snow
    aacfc3bef07b ARM: dts: exynos: correct PMIC interrupt trigger level on SMDK5250
    d788a900f362 ARM: dts: exynos: correct PMIC interrupt trigger level on Odroid X/U3 family
    f9b701bc13da ARM: dts: exynos: correct PMIC interrupt trigger level on Midas family
    6cf80f1fc1a9 ARM: dts: exynos: correct MUIC interrupt trigger level on Midas family
    73bc2732108c ARM: dts: exynos: correct fuel gauge interrupt trigger level on Midas family
    12d9d517a2fe memory: gpmc: fix out of bounds read and dereference on gpmc_cs[]
    52189bf0b2a2 usb: gadget: pch_udc: Revert d3cb25a12138 completely
    db699975f72d ovl: fix missing revert_creds() on error path
    a51050108bed Revert "i3c master: fix missing destroy_workqueue() on error in i3c_master_register"
    7d1bc32d6477 KVM: Stop looking for coalesced MMIO zones if the bus is destroyed
    cc6623055f2d KVM: nVMX: Truncate bits 63:32 of VMCS field on nested check in !64-bit
    358264425747 KVM: s390: split kvm_s390_real_to_abs
    45a3ae26fcd9 s390: fix detection of vector enhancements facility 1 vs. vector packed decimal facility
    9ea2c4fd1a72 KVM: s390: fix guarded storage control register handling
    34a6d1d57c71 KVM: s390: split kvm_s390_logical_to_effective
    027de80194fb ALSA: hda/realtek: ALC285 Thinkpad jack pin quirk is unreachable
    1bfa051571ac ALSA: hda/realtek: Remove redundant entry for ALC861 Haier/Uniwill devices
    9337f5ba5090 ALSA: hda/realtek: Re-order ALC662 quirk table entries
    5f68b0ec9882 ALSA: hda/realtek: Re-order remaining ALC269 quirk table entries
    15b414029478 ALSA: hda/realtek: Re-order ALC269 Lenovo quirk table entries
    99aa203c6eb6 ALSA: hda/realtek: Re-order ALC269 Sony quirk table entries
    1f1612fc6bea ALSA: hda/realtek: Re-order ALC269 ASUS quirk table entries
    65d5b99c1ea9 ALSA: hda/realtek: Re-order ALC269 Dell quirk table entries
    b161e02481d8 ALSA: hda/realtek: Re-order ALC269 Acer quirk table entries
    bd0e9154100c ALSA: hda/realtek: Re-order ALC269 HP quirk table entries
    e97cf247ba44 ALSA: hda/realtek: Re-order ALC882 Clevo quirk table entries
    02968e62200a ALSA: hda/realtek: Re-order ALC882 Sony quirk table entries
    6d9e8828fa77 ALSA: hda/realtek: Re-order ALC882 Acer quirk table entries
    e584e52783a4 drm/amd/display: Reject non-zero src_y and src_x for video planes
    56f2ea0bc2a1 drm/radeon: fix copy of uninitialized variable back to userspace
    4aea3ddac00a drm/panfrost: Don't try to map pages that are already mapped
    debaae7ac45a drm/panfrost: Clear MMU irqs before handling the fault
    6b5aa0cf321c rtw88: Fix array overrun in rtw_get_tx_power_params()
    e5b02c096145 cfg80211: scan: drop entry from hidden_list on overflow
    16b68fb8df43 ipw2x00: potential buffer overflow in libipw_wx_set_encodeext()
    af7ea06b3cae md: Fix missing unused status line of /proc/mdstat
    79c1bfae668d md: md_open returns -EBUSY when entering racing area
    adb9bbf1a284 md: factor out a mddev_find_locked helper from mddev_find
    afa4de092663 md: split mddev_find
    acdf531e77f0 md-cluster: fix use-after-free issue when removing rdev
    a72373588ce3 md/bitmap: wait for external bitmap writes to complete during tear down
    45bc83f71b22 misc: vmw_vmci: explicitly initialize vmci_datagram payload
    0f8f75b92ecc misc: vmw_vmci: explicitly initialize vmci_notify_bm_set_msg struct
    34f6ba8810c3 misc: lis3lv02d: Fix false-positive WARN on various HP models
    8809d87cb86f iio:accel:adis16201: Fix wrong axis assignment that prevents loading
    7cb1f304237a PCI: Allow VPD access for QLogic ISP2722
    f30ded0ba1b6 FDDI: defxx: Bail out gracefully with unassigned PCI resource for CSR
    8943172edaf7 MIPS: pci-rt2880: fix slot 0 configuration
    cd2e53ad366f MIPS: pci-mt7620: fix PLL lock check
    4dce2a19e76b ASoC: Intel: kbl_da7219_max98927: Fix kabylake_ssp_fixup function
    79cc386696fb ASoC: samsung: tm2_wm5110: check of of_parse return value
    2b8b8cc94f4d usb: xhci-mtk: improve bandwidth scheduling with TT
    9f0d3e676a25 usb: xhci-mtk: remove or operator for setting schedule parameters
    230bd196536b usb: typec: tcpm: update power supply once partner accepts
    9d7bb10859b9 usb: typec: tcpm: Address incorrect values of tcpm psy for pps supply
    c87bb48ac5c5 usb: typec: tcpm: Address incorrect values of tcpm psy for fixed supply
    66ca71d28301 staging: fwserial: fix TIOCSSERIAL permission check
    ebb46274e33f tty: moxa: fix TIOCSSERIAL permission check
    d524fb44c657 staging: fwserial: fix TIOCSSERIAL jiffies conversions
    f80f12ee00b8 USB: serial: ti_usb_3410_5052: fix TIOCSSERIAL permission check
    f50cad556c28 staging: greybus: uart: fix TIOCSSERIAL jiffies conversions
    3114fedf4020 USB: serial: usb_wwan: fix TIOCSSERIAL jiffies conversions
    edce32412096 tty: amiserial: fix TIOCSSERIAL permission check
    e503d7bc7bfe tty: moxa: fix TIOCSSERIAL jiffies conversions
    c30b11c74cbb Revert "USB: cdc-acm: fix rounding error in TIOCSSERIAL"
    e32352070bca net/nfc: fix use-after-free llcp_sock_bind/connect
    eeec325c9944 bluetooth: eliminate the potential race condition when removing the HCI controller
    119858caf400 hsr: use netdev_err() instead of WARN_ONCE()
    3a826ffa80d5 Bluetooth: verify AMP hci_chan before amp_destroy

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 1ef68b8e08..ab24201e62 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8cfbd0ce8afc58d4e73765fc2b84d0cf4144f0f1"
-SRCREV_meta ?= "19fddc3eadeb05f3ba6001833ccfd32257251301"
+SRCREV_machine ?= "62f2f19316f63910f27760e24314d02814a8a90e"
+SRCREV_meta ?= "9e2546ab8d63f70ba458eb159d29ce6736ffd3e4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.118"
+LINUX_VERSION ?= "5.4.119"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index bc8dff54f1..26a7da085a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.118"
+LINUX_VERSION ?= "5.4.119"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "856d692bf93a8b33482d05c7dfc76f8f51506c16"
-SRCREV_machine ?= "f54311bd4aeddc4f600d3553054891a8198f8f72"
-SRCREV_meta ?= "19fddc3eadeb05f3ba6001833ccfd32257251301"
+SRCREV_machine_qemuarm ?= "de992e88dcfe547cc08bfc1a371b0fc0c0892a31"
+SRCREV_machine ?= "8997f663001be812a7670488ac8698eb916d9d50"
+SRCREV_meta ?= "9e2546ab8d63f70ba458eb159d29ce6736ffd3e4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index ab92811062..c4abfe7640 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "161dbe7187d5de2c6c0f7ab8ab43041e6f1d42bc"
-SRCREV_machine_qemuarm64 ?= "f54311bd4aeddc4f600d3553054891a8198f8f72"
-SRCREV_machine_qemumips ?= "7731d7417fce687fd880da263e12d4cd96ba5bc5"
-SRCREV_machine_qemuppc ?= "f54311bd4aeddc4f600d3553054891a8198f8f72"
-SRCREV_machine_qemuriscv64 ?= "f54311bd4aeddc4f600d3553054891a8198f8f72"
-SRCREV_machine_qemux86 ?= "f54311bd4aeddc4f600d3553054891a8198f8f72"
-SRCREV_machine_qemux86-64 ?= "f54311bd4aeddc4f600d3553054891a8198f8f72"
-SRCREV_machine_qemumips64 ?= "e1a389552633ff7df9f8d003503a69f844539db7"
-SRCREV_machine ?= "f54311bd4aeddc4f600d3553054891a8198f8f72"
-SRCREV_meta ?= "19fddc3eadeb05f3ba6001833ccfd32257251301"
+SRCREV_machine_qemuarm ?= "715f9e60c9426156cb73904e65d39daea51288ca"
+SRCREV_machine_qemuarm64 ?= "8997f663001be812a7670488ac8698eb916d9d50"
+SRCREV_machine_qemumips ?= "bd95d2d0a38cf539f34d84740262c4d3aef1833f"
+SRCREV_machine_qemuppc ?= "8997f663001be812a7670488ac8698eb916d9d50"
+SRCREV_machine_qemuriscv64 ?= "8997f663001be812a7670488ac8698eb916d9d50"
+SRCREV_machine_qemux86 ?= "8997f663001be812a7670488ac8698eb916d9d50"
+SRCREV_machine_qemux86-64 ?= "8997f663001be812a7670488ac8698eb916d9d50"
+SRCREV_machine_qemumips64 ?= "45be3768458cb4186ee2761de2a414e323bd6fe0"
+SRCREV_machine ?= "8997f663001be812a7670488ac8698eb916d9d50"
+SRCREV_meta ?= "9e2546ab8d63f70ba458eb159d29ce6736ffd3e4"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.118"
+LINUX_VERSION ?= "5.4.119"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

