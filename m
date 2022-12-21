Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1E2C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 16:13:24 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.22530.1671639203530531225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 08:13:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aXpkFlOk;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id bq12so3834710qtb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 08:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Avj18n96ZeSoNgVJH12KQ8plrzxF1+LQwMA6C4uqEfQ=;
        b=aXpkFlOkt8reksyk2W+b8/1Yk70JnFhgBHLsrVXWL2YMPzNYYMYuDASRfD48u9TYn1
         bign/FDqVTlirau+W/qsO68A0FWtfDDgcBibqgPqNGkm7CzlMAXSdLj0IV9QrE3Hedhk
         VcDpp36n/89OvNOv5SWjzdfLgPntmXby7mohRJBQHcaM25czxmRs+yOdAl9OQjsYPXq8
         r/1ewxDwoHobyBBH7p8ACB+TpPLWtZ/X/P2gmMpFoWFX0qidRL9kTGayZ94ygmxEwjsV
         6GtNPMDhWWKEXbQ0ILSw/vIqAElqeYGxcfokSjfcODCgg92yFqh1rr+1q6Zc+a+gNWeG
         jbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Avj18n96ZeSoNgVJH12KQ8plrzxF1+LQwMA6C4uqEfQ=;
        b=PikvnWdRCuvvVYDdE/Lj/dbHXLLSncVj+P6SeDVGj4y/1EQ/RwLaXESpCON8NrZr1T
         KTa9nm+w8UceSjufxFXEbWYVLXtHpWgGvE1oLssAO3Nf4zfp2HekYXL3aYxpm9JXKMJa
         gjOd19CxtHFU+IFgZ13R3VJe6pwtWqIyl4Y+fIUMb+hRVwduU3ECrldUyDsOla+BfZEK
         +vlOlaB7OmYgJ0R+cGf3b0Zz68EQLvpBpKo1yaY9mzBEddLb/OmLLW57m4Z+efNhMPQg
         fYadtc8cHzTVkdtlgKSE4T/PRFE/xwWYdaUoT9vSV0QafGMn8QX6v0r91mmFmwPqodMN
         bXUQ==
X-Gm-Message-State: AFqh2krk+wm9mNnGnqstGadwaDsZQNdoKuPOrMrT3DQ1elVXBvmEnHCW
	p8U7AKZ1op3uUVULCkymiuN0KTJVHpo=
X-Google-Smtp-Source: AMrXdXv0j0UcuvGapClVusA+Gmdj89/bgro+LSHdKigmcaKQeatVoG+3SAKkiQPXkBzVmS+pigiKhA==
X-Received: by 2002:ac8:7772:0:b0:3a8:22f2:1782 with SMTP id h18-20020ac87772000000b003a822f21782mr2345240qtu.35.1671639201952;
        Wed, 21 Dec 2022 08:13:21 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id y23-20020ac87097000000b003a50b9f099esm9220188qto.12.2022.12.21.08.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 08:13:21 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][v2] linux-yocto/5.15: update to v5.15.84
Date: Wed, 21 Dec 2022 11:13:19 -0500
Message-Id: <20221221161319.33542-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 16:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174920

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    d68f50bfb00f Linux 5.15.84
    972707bae3d7 net: fec: properly guard irq coalesce setup
    289721fe0993 ASoC: ops: Correct bounds check for second channel on SX controls
    de0866b94a64 nvme-pci: clear the prp2 field when not used
    8bffa95ac19f perf: Fix perf_pending_task() UaF
    825bd2af4227 ASoC: cs42l51: Correct PGA Volume minimum value
    91582b3a1ab2 net: fec: don't reset irq coalesce settings to defaults on "ip link up"
    c772dab247f1 can: mcba_usb: Fix termination command argument
    aa822de7de3b can: sja1000: fix size of OCR_MODE_MASK define
    09e08740d78c pinctrl: meditatek: Startup with the IRQs disabled
    172a95026f06 libbpf: Use page size as max_entries when probing ring buffer map
    cf611d786796 ASoC: ops: Check bounds for second channel in snd_soc_put_volsw_sx()
    a74b88e17025 ASoC: fsl_micfil: explicitly clear CHnF flags
    afac1e7d78eb ASoC: fsl_micfil: explicitly clear software reset bit
    9d933af8fef3 nfp: fix use-after-free in area_cache_get()
    e1a4f5880d00 vfs: fix copy_file_range() averts filesystem freeze protection
    86e28ed25b00 x86/vdso: Conditionally export __vdso_sgx_enter_enclave()
    fd6d66840b42 Linux 5.15.83
    f895511de9d2 io_uring: Fix a null-ptr-deref in io_tctx_exit_cb()
    f435c66d2336 io_uring: move to separate directory
    d9e1e5d8a74c block: move CONFIG_BLOCK guard to top Makefile
    e5c0bc4ff5b0 can: esd_usb: Allow REC and TEC to return to zero
    db6343a5b0d9 s390/qeth: fix use-after-free in hsci
    a56c1cebe4a0 s390/qeth: fix various format strings
    a6dba316c93e macsec: add missing attribute validation for offload
    40500f1f4745 net: mvneta: Fix an out of bounds check
    b9274dbe3999 net: thunderbolt: fix memory leak in tbnet_open()
    7390c70bd431 ipv6: avoid use-after-free in ip6_fragment()
    1beb475892f7 net: plip: don't call kfree_skb/dev_kfree_skb() under spin_lock_irq()
    b08412a9cf26 net: phy: mxl-gpy: fix version reporting
    dec5abd91abc xen/netback: fix build warning
    54d830e24247 dpaa2-switch: Fix memory leak in dpaa2_switch_acl_entry_add() and dpaa2_switch_acl_entry_remove()
    c7adcbd0fd3f ethernet: aeroflex: fix potential skb leak in greth_init_rings()
    d962d42d6376 tipc: call tipc_lxc_xmit without holding node_read_lock
    f3b5dda26cd0 net: dsa: sja1105: fix memory leak in sja1105_setup_devlink_regions()
    5dab6fa068d7 ipv4: Fix incorrect route flushing when table ID 0 is used
    ac566bd5770f ipv4: Fix incorrect route flushing when source address is deleted
    af4ccae4b704 tipc: Fix potential OOB in tipc_link_proto_rcv()
    b8ce0e6f9f88 net: hisilicon: Fix potential use-after-free in hix5hd2_rx()
    16854177745a net: mdio: fix unbalanced fwnode reference count in mdio_device_release()
    6f4798ac9c9e net: hisilicon: Fix potential use-after-free in hisi_femac_rx()
    114e65a22189 net: thunderx: Fix missing destroy_workqueue of nicvf_rx_mode_wq
    51c04945756a net: microchip: sparx5: Fix missing destroy_workqueue of mact_queue
    99eec0a766f9 ip_gre: do not report erspan version on GRE interface
    2891957853f2 net: stmmac: fix "snps,axi-config" node property parsing
    5cb8f1a784fd gpio/rockchip: fix refcount leak in rockchip_gpiolib_register()
    b8c2f0392d1d nvme initialize core quirks before calling nvme_init_subsystem
    908b2da426fe NFC: nci: Bounds check struct nfc_target arrays
    d841cc156304 i40e: Disallow ip4 and ip6 l4_4_bytes
    625a13850b31 i40e: Fix for VF MAC address 0
    5538794dbd42 i40e: Fix not setting default xps_cpus after reset
    a6b30598fec8 net: mvneta: Prevent out of bounds read in mvneta_config_rss()
    e6e897d4fe2f xen-netfront: Fix NULL sring after live migration
    eefd8953a748 octeontx2-pf: Fix potential memory leak in otx2_init_tc()
    f88acaed07b1 net: mdiobus: fix double put fwnode in the error path
    cc62d76928e0 net: mdiobus: fwnode_mdiobus_register_phy() rework error handling
    ea113b570eee net: encx24j600: Fix invalid logic in reading of MISTAT register
    8aae746d065c net: encx24j600: Add parentheses to fix precedence
    a110287ef4a4 mac802154: fix missing INIT_LIST_HEAD in ieee802154_if_add()
    e046421bed5a selftests: rtnetlink: correct xfrm policy rule in kci_test_ipsec_offload
    4fa8988a36d5 net: dsa: sja1105: Check return value
    b35be171dfe6 net: dsa: hellcreek: Check return value
    a4c342e645d6 net: dsa: ksz: Check return value
    edf7284a9829 Bluetooth: Fix not cleanup led when bt_init fails
    3322193949ac Bluetooth: 6LoWPAN: add missing hci_dev_put() in get_l2cap_conn()
    6c88c764e0c4 vmxnet3: use correct intrConf reference when using extended queues
    5ad0d85757f8 vmxnet3: correctly report encapsulated LRO packet
    5c014eb0ed6c af_unix: Get user_ns from in_skb in unix_diag_get_exact().
    807a01a32979 drm: bridge: dw_hdmi: fix preference of RGB modes over YUV420
    eb96fd3983b2 net: broadcom: Add PTP_1588_CLOCK_OPTIONAL dependency for BCMGENET under ARCH_BCM2835
    16eb678bca8e igb: Allocate MSI-X vector when testing
    34c6367c946c e1000e: Fix TX dispatch condition
    4271515f189b gpio: amd8111: Fix PCI device reference count leak
    d57b60e9b355 drm/bridge: ti-sn65dsi86: Fix output polarity setting bug
    f8b29656013c netfilter: ctnetlink: fix compilation warning after data race fixes in ct mark
    246bcd05ba6c ca8210: Fix crash by zero initializing data
    80dad8df5fc2 ieee802154: cc2520: Fix error return code in cc2520_hw_init()
    dd9dcfb85c65 drm/vmwgfx: Fix race issue calling pin_user_pages
    7b09ba9036b2 netfilter: nft_set_pipapo: Actually validate intervals in fields after the first one
    6daaa84b6214 gpiolib: fix memory leak in gpiochip_setup_dev()
    1a1075d37108 gpiolib: check the 'ngpios' property in core gpiolib code
    70c5515c1c30 gpiolib: improve coding style for local variables
    3b714f25fc59 clk: Fix pointer casting to prevent oops in devm_clk_release()
    c142cba37de2 can: af_can: fix NULL pointer dereference in can_rcv_filter
    104bb1f67e3c HID: ite: Enable QUIRK_TOUCHPAD_ON_OFF_REPORT on Acer Aspire Switch V 10
    f755d11c55b2 HID: core: fix shift-out-of-bounds in hid_report_raw_event
    2d4b310c32d4 HID: hid-lg4ff: Add check for empty lbuf
    5e8021ae0865 HID: usbhid: Add ALWAYS_POLL quirk for some mice
    5e88c6f4aaa7 net: dsa: sja1105: avoid out of bounds access in sja1105_init_l2_policing()
    1074fefce9cc drm/shmem-helper: Avoid vm_open error paths
    83e3da8bb92f drm/shmem-helper: Remove errant put in error path
    249011f4c3b8 drm/amdgpu/sdma_v4_0: turn off SDMA ring buffer in the s2idle suspend
    1e4fe9a1546f drm/vmwgfx: Don't use screen objects when SEV is active
    f6550976fe22 KVM: s390: vsie: Fix the initialization of the epoch extension (epdx) field
    fe50a9bbeb1f net: mana: Fix race on per-CQ variable napi work_done
    a49894a5ac36 Bluetooth: Fix crash when replugging CSR fake controllers
    1dee2b504771 Bluetooth: btusb: Add debug message for CSR controllers
    3ac29732a2ff mm/gup: fix gup_pud_range() for dax
    aad8bbd17a1d memcg: fix possible use-after-free in memcg_write_event_control()
    6fb8bc29bfa8 media: v4l2-dv-timings.c: fix too strict blanking sanity checks
    a4c575541eeb Revert "ARM: dts: imx7: Fix NAND controller size-cells"
    28abc1145924 soundwire: intel: Initialize clock stop timeout
    22d800b378e4 media: videobuf2-core: take mmap_lock in vb2_get_unmapped_area()
    5d0fa6fc8899 xen/netback: don't call kfree_skb() with interrupts disabled
    4422241ceffc xen/netback: do some code cleanup
    0fe29bd92594 xen/netback: Ensure protocol headers don't fall in the non-linear area
    f01677be31d1 drm/bridge: anx7625: Fix edid_read break case in sp_tx_edid_read()
    ee2536830b16 cifs: fix use-after-free caused by invalid pointer `hostname`
    dc62f05f666c rtc: cmos: avoid UIP when reading alarm time
    48ea4199af85 rtc: cmos: avoid UIP when writing alarm time
    3f52afc6ed93 rtc: mc146818-lib: extract mc146818_avoid_UIP
    1a3f8c6cd29d mm/khugepaged: invoke MMU notifiers in shmem/file collapse paths
    79ad784c9d21 mm/khugepaged: fix GUP-fast interaction by sending IPI
    d15cd6de0123 mm/khugepaged: take the right locks for page table retraction
    26f084e55466 net: usb: qmi_wwan: add u-blox 0x1342 composition
    029a7f1c5d70 9p/xen: check logical size for buffer size
    b398832893c8 usb: dwc3: gadget: Disable GUSB2PHYCFG.SUSPHY for End Transfer
    e70a5724400a fbcon: Use kzalloc() in fbcon_prepare_logo()
    fd3768597d2a regulator: twl6030: fix get status of twl6032 regulators
    9f74b9aa8d58 ASoC: soc-pcm: Add NULL check in BE reparenting
    dae93f4168c4 btrfs: send: avoid unaligned encoded writes when attempting to clone range
    f54e1edf579d selftests/net: Find nettest in current directory
    fccd454129f6 ALSA: seq: Fix function prototype mismatch in snd_seq_expand_var_event
    542a563bb751 regulator: slg51000: Wait after asserting CS pin
    3d1b5fde360e 9p/fd: Use P9_HDRSZ for header size
    fe2d44e86e96 ASoC: rt711-sdca: fix the latency time of clock stop prepare state machine transitions
    e945f3d809ed ARM: dts: rockchip: disable arm_global_timer on rk3066 and rk3188
    c3b818c91a11 spi: mediatek: Fix DEVAPC Violation at KO Remove
    d9f0107be1a9 ASoC: wm8962: Wait for updated value of WM8962_CLOCKING1 register
    7ae0262748e5 ARM: 9266/1: mm: fix no-MMU ZERO_PAGE() implementation
    d81c62e3121f ARM: 9251/1: perf: Fix stacktraces for tracepoint events in THUMB2 kernels
    66717ad03b80 fs: use acquire ordering in __fget_light()
    1222e2364ac7 ARM: dts: rockchip: rk3188: fix lcdc1-rgb24 node name
    996fb29b06b6 arm64: dts: rockchip: fix ir-receiver node names
    752138ef89e8 ARM: dts: rockchip: fix ir-receiver node names
    8045971e40cd arm: dts: rockchip: remove clock-frequency from rtc
    5e9fb8013ac9 arm: dts: rockchip: fix node name for hym8563 rtc
    2ed7137e911a arm64: dts: rockchip: keep I2S1 disabled for GPIO function on ROCK Pi 4 series
    5a1122e1a896 mmc: mtk-sd: Fix missing clk_disable_unprepare in msdc_of_clock_parse()
    282f52c954a8 clk: Provide new devm_clk helpers for prepared and enabled clocks
    eb94a7a20f3c clk: generalize devm_clk_get() a bit
    d9790301361c Linux 5.15.82
    48642f94311b proc: proc_skip_spaces() shouldn't think it is working on C strings
    3eb9213f6612 proc: avoid integer type confusion in get_proc_long
    4a4073a2e2fe ipc/sem: Fix dangling sem_array access in semtimedop race
    53b9b1201e34 Input: raydium_ts_i2c - fix memory leak in raydium_i2c_send()
    571b6bbbf54d char: tpm: Protect tpm_pm_suspend with locks
    f39891cfe79b Revert "clocksource/drivers/riscv: Events are stopped during CPU suspend"
    a759057af728 ACPI: HMAT: Fix initiator registration for single-initiator systems
    da8a794d71ec ACPI: HMAT: remove unnecessary variable initialization
    2d16161a2c98 i2c: imx: Only DMA messages with I2C_M_DMA_SAFE flag set
    950a05cb15e3 i2c: npcm7xx: Fix error handling in npcm_i2c_init()
    db3f8da033d9 serial: stm32: Deassert Transmit Enable on ->rs485_config()
    45f628f4fd81 serial: stm32: Use TC interrupt to deassert GPIO RTS in RS485 mode
    c60eae5b1d0b serial: stm32: Factor out GPIO RTS toggling into separate function
    041f8dc88292 ipv4: Fix route deletion when nexthop info is not specified
    25174d91e4a3 ipv4: Handle attempt to delete multipath route when fib_info contains an nh reference
    a0ad247e55ea selftests: net: fix nexthop warning cleanup double ip typo
    532847b69c29 selftests: net: add delete nexthop route warning test
    e0783558817d Kconfig.debug: provide a little extra FRAME_WARN leeway when KASAN is enabled
    723fa02e0e0a parisc: Increase FRAME_WARN to 2048 bytes on parisc
    b951ab4b35ba mm: migrate: fix THP's mapcount on isolation
    c5eda6029cf9 mm: __isolate_lru_page_prepare() in isolate_migratepages_block()
    bdb613ef179a iommu/vt-d: Fix PCI device refcount leak in dmar_dev_scope_init()
    b6eea8b2e858 iommu/vt-d: Fix PCI device refcount leak in has_external_pci()
    787d81d4eb15 nvme: fix SRCU protection of nvme_ns_head list
    12f237200c16 riscv: kexec: Fixup irq controller broken in kexec crash path
    ac00301adb19 riscv: fix race when vmap stack overflow
    fa7a7d185ef3 riscv: Sync efi page table's kernel mappings before switching
    d86d69892545 pinctrl: single: Fix potential division by zero
    98b15c706644 ASoC: ops: Fix bounds check for _sx controls
    f88a6977f8b9 KVM: x86/mmu: Fix race condition in direct_page_fault
    df4b177b4851 io_uring/poll: fix poll_refs race with cancelation
    4b702b7d11ce io_uring: make poll refs more robust
    1d58849ac26f io_uring: cmpxchg for poll arm refs release
    cd1981a8c30d io_uring: fix tw losing poll events
    62321dc7b081 io_uring: update res mask in io_poll_check_events
    417d5ea6e735 tracing: Free buffers when a used dynamic event is removed
    52fc245d150c tracing: Fix race where histograms can be called before the event
    cb2b0612cd25 tracing/osnoise: Fix duration type
    615a996ff397 drm/i915: Never return 0 if not all requests retired
    01a2b25ef2cd drm/i915: Fix negative value passed as remaining time
    ff1591ba33b8 drm/amdgpu: enable Vangogh VCN indirect sram mode
    ac2d7fa90848 drm/amdgpu: temporarily disable broken Clang builds due to blown stack-frame
    57ee7bc4c60a mmc: sdhci: Fix voltage switch delay
    bb8f8095143e mmc: sdhci-sprd: Fix no reset data and command after voltage switch
    4c7681c1a52f mmc: sdhci-esdhc-imx: correct CQHCI exit halt state check
    01dbe4db590a mmc: core: Fix ambiguous TRIM and DISCARD arg
    738946e35504 mmc: mmc_test: Fix removal of debugfs file
    635d0517348e net: stmmac: Set MAC's flow control register to reflect current settings
    9132dcdf3bf6 v4l2: don't fall back to follow_pfn() if pin_user_pages_fast() fails
    76ad884be092 pinctrl: intel: Save and restore pins in "direct IRQ" mode
    41296b85fafa x86/bugs: Make sure MSR_SPEC_CTRL is updated properly upon resume from S3
    33021419fd81 nilfs2: fix NULL pointer dereference in nilfs_palloc_commit_free_entry()
    2e44dd9a8dd6 tools/vm/slabinfo-gnuplot: use "grep -E" instead of "egrep"
    b60a8ad771fd error-injection: Add prompt for function error injection
    757eb00c4c40 ALSA: dice: fix regression for Lexicon I-ONIX FW810S
    a1a96a6f302c riscv: mm: Proper page permissions after initmem free
    823df3607d8b riscv: vdso: fix section overlapping under some conditions
    6e035d5a2a6b hwmon: (coretemp) fix pci device refcount leak in nv1a_ram_new()
    7692700ac818 hwmon: (coretemp) Check for null before removing sysfs attrs
    9b5836b9c4b0 net: ethernet: renesas: ravb: Fix promiscuous mode after system resumed
    0dfb9a566327 sctp: fix memory leak in sctp_stream_outq_migrate()
    fcb3e0216156 packet: do not set TP_STATUS_CSUM_VALID on CHECKSUM_COMPLETE
    04b995e96322 net: tun: Fix use-after-free in tun_detach()
    43ca0adf79e5 afs: Fix fileserver probe RTT handling
    543d917f691a net: mdiobus: fix unbalanced node reference count
    dca370e575d9 net: hsr: Fix potential use-after-free
    1daec0815655 tipc: re-fetch skb cb after tipc_msg_validate
    16a64dc26545 dsa: lan9303: Correct stat name
    766086ea8ca7 net: wwan: iosm: fix dma_alloc_coherent incompatible pointer type
    c667751a4265 net: wwan: iosm: fix kernel test robot reported error
    9c584d6d9cfb net: ethernet: nixge: fix NULL dereference
    8782b32ef867 net/9p: Fix a potential socket leak in p9_socket_open
    6fc9425bff4b net: net_netdev: Fix error handling in ntb_netdev_init_module()
    3bc893ef36f9 net: ethernet: ti: am65-cpsw: fix error handling in am65_cpsw_nuss_probe()
    7730904f50c7 net: phy: fix null-ptr-deref while probe() failed
    59b54f0563b6 wifi: mac8021: fix possible oob access in ieee80211_get_rate_duration
    dc0853f8b502 wifi: cfg80211: don't allow multi-BSSID in S1G
    88a6fe370788 wifi: cfg80211: fix buffer overflow in elem comparison
    08fff7aaeb7e aquantia: Do not purge addresses when setting the number of rings
    2a7aa52573da qlcnic: fix sleep-in-atomic-context bugs caused by msleep
    7b734d26f037 can: m_can: Add check for devm_clk_get
    ea8dc27bb044 can: m_can: pci: add missing m_can_class_free_dev() in probe/remove methods
    b1d2a8e02acc can: etas_es58x: es58x_init_netdev(): free netdev when register_candev()
    e53da04e37e4 can: cc770: cc770_isa_probe(): add missing free_cc770dev()
    d452a71995cb can: sja1000_isa: sja1000_isa_probe(): add missing free_sja1000dev()
    372eb550faa0 net/mlx5e: Fix use-after-free when reverting termination table
    839eeab03c83 net/mlx5: Fix uninitialized variable bug in outlen_write()
    34feea3bfb37 net/mlx5: DR, Fix uninitialized var warning
    3485ef2aabeb net/mlx5: DR, Rename list field in matcher struct to list_node
    9fc27d22cdb9 e100: Fix possible use after free in e100_xmit_prepare
    0d9f5bd54b91 iavf: Fix error handling in iavf_init_module()
    b0b2b9050c17 iavf: remove redundant ret variable
    69501d820508 fm10k: Fix error handling in fm10k_init_module()
    5e3657dede36 i40e: Fix error handling in i40e_init_module()
    7109e9410992 ixgbevf: Fix resource leak in ixgbevf_init_module()
    196ea810e21c of: property: decrement node refcount in of_fwnode_get_reference_args()
    36164db278a8 nvmem: rmem: Fix return value check in rmem_read()
    e3761831674a bpf: Do not copy spin lock field from user in bpf_selem_alloc
    45f6e8186374 hwmon: (ibmpex) Fix possible UAF when ibmpex_register_bmc() fails
    a90251376c3e hwmon: (i5500_temp) fix missing pci_disable_device()
    eeb31b828daf hwmon: (ina3221) Fix shunt sum critical calculation
    9514b95cac51 hwmon: (ltc2947) fix temperature scaling
    0140e079a420 libbpf: Handle size overflow for ringbuf mmap
    06d5790e7df5 ARM: at91: rm9200: fix usb device clock id
    d074f173fbd1 scripts/faddr2line: Fix regression in name resolution on ppc64le
    ee3d37d79610 bpf, perf: Use subprog name when reporting subprog ksymbol
    ec02fc0a4101 iio: light: rpr0521: add missing Kconfig dependencies
    f7419fc42afc iio: health: afe4404: Fix oob read in afe4404_[read|write]_raw
    e7e76a77aabe iio: health: afe4403: Fix oob read in afe4403_read_raw
    ebdca90efbb5 drm/amdgpu: Partially revert "drm/amdgpu: update drm_display_info correctly when the edid is read"
    c365d3c3e512 drm/amdgpu: update drm_display_info correctly when the edid is read
    df5346466e51 drm/display/dp_mst: Fix drm_dp_mst_add_affected_dsc_crtcs() return code
    044da1a371a0 btrfs: qgroup: fix sleep from invalid context bug in btrfs_qgroup_inherit()
    da86809ab822 btrfs: move QUOTA_ENABLED check to rescan_should_stop from btrfs_qgroup_rescan_worker
    5d66eadc1cc3 spi: spi-imx: Fix spi_bus_clk if requested clock is higher than input clock
    6b4544a13179 btrfs: free btrfs_path before copying inodes to userspace
    c7ae3becee72 btrfs: sink iterator parameter to btrfs_ioctl_logical_to_ino
    acc2f40b980c erofs: fix order >= MAX_ORDER warning due to crafted negative i_size
    ca9f27448af0 drm/i915/gt: Use i915_vm_put on ppgtt_create error paths
    c2f2972889eb drm/i915: Create a dummy object for gen6 ppgtt
    918002bdbe43 arm64: mte: Avoid setting PG_mte_tagged if no tags cleared or restored
    e4a7232c917c Linux 5.15.81
    5c5c563a0817 cifs: fix missed refcounting of ipc tcon
    ee2d04f23bbb drm/i915: fix TLB invalidation for Gen12 video and compute engines
    bef834845d89 drm/amdgpu: always register an MMU notifier for userptr
    7901de7aa833 drm/amdgpu: Enable Aldebaran devices to report CU Occupancy
    e7bf1fe53817 drm/amd/display: No display after resume from WB/CB
    5033cba00c71 drm/amd/dc/dce120: Fix audio register mapping, stop triggering KASAN
    b8dc24590923 btrfs: sysfs: normalize the error handling branch in btrfs_init_sysfs()
    914baca57af7 btrfs: use kvcalloc in btrfs_get_dev_zone_info
    c1e6d4bfdee3 btrfs: zoned: fix missing endianness conversion in sb_write_pointer
    d88bf6be02de btrfs: free btrfs_path before copying subvol info to userspace
    f218b404fc0e btrfs: free btrfs_path before copying fspath to userspace
    fea9397101c1 btrfs: free btrfs_path before copying root refs to userspace
    7d0c25b5fe54 genirq: Take the proposed affinity at face value if force==true
    f17657cce069 irqchip/gic-v3: Always trust the managed affinity provided by the core code
    52a93f2dcf6c genirq: Always limit the affinity to online CPUs
    599cf4b84526 genirq/msi: Shutdown managed interrupts with unsatifiable affinities
    7aed1dd5d221 wifi: wilc1000: validate number of channels
    e9de501cf70d wifi: wilc1000: validate length of IEEE80211_P2P_ATTR_CHANNEL_LIST attribute
    143232cb5a4c wifi: wilc1000: validate length of IEEE80211_P2P_ATTR_OPER_CHANNEL attribute
    cd9c4869710b wifi: wilc1000: validate pairwise and authentication suite offsets
    f2fb18d429c3 fuse: lock inode unconditionally in fuse_fallocate()
    bb1c33bdf409 dm integrity: clear the journal on suspend
    20ad31b09e98 dm integrity: flush the journal on suspend
    5ca2110ba5e3 gpu: host1x: Avoid trying to use GART on Tegra20
    97f47617e813 scsi: iscsi: Fix possible memory leak when device_register() failed
    56ab7f237e7e net: usb: qmi_wwan: add Telit 0x103a composition
    e2e33f213dea tcp: configurable source port perturb table size
    269928e5c7bb platform/x86: ideapad-laptop: Fix interrupt storm on fn-lock toggle on some Yoga laptops
    17d995dc69c8 platform/x86: hp-wmi: Ignore Smart Experience App event
    e85bdc78720c zonefs: fix zone report size in __zonefs_io_error()
    982fcd83fb16 drm/amdgpu: disable BACO support on more cards
    ea11f8197dad platform/x86: acer-wmi: Enable SW_TABLET_MODE on Switch V 10 (SW5-017)
    09af15e69196 platform/x86: asus-wmi: add missing pci_dev_put() in asus_wmi_set_xusb2pr()
    ba040bea9deb xen/platform-pci: add missing free_irq() in error path
    6815b2087d23 xen-pciback: Allow setting PCI_MSIX_FLAGS_MASKALL too
    4c13ddb74f2c ASoC: stm32: dfsdm: manage cb buffers cleanup
    dd82295a23bc Input: i8042 - apply probe defer to more ASUS ZenBook models
    e12e121feb63 Input: soc_button_array - add Acer Switch V 10 to dmi_use_low_level_irq[]
    9f5c167074d3 Input: soc_button_array - add use_low_level_irq module parameter
    aaef86eac9e2 Input: goodix - try resetting the controller when no config is set
    e2223f5fbbb8 serial: 8250: 8250_omap: Avoid RS485 RTS glitch on ->set_termios()
    4e208294de45 tools: iio: iio_generic_buffer: Fix read size
    0d0e2545fa92 ASoC: Intel: bytcht_es8316: Add quirk for the Nanote UMPC-01
    e394cf9d7a83 Input: synaptics - switch touchpad on HP Laptop 15-da3001TU to RMI mode
    96b5d1177752 x86/ioremap: Fix page aligned size calculation in __ioremap_caller()
    d048f7481524 x86/pm: Add enumeration check before spec MSRs save/restore setup
    070e3560bf04 x86/tsx: Add a feature bit for TSX control MSR support
    1430c98ebbe7 KVM: x86: remove exit_int_info warning in svm_handle_exit
    27550a5930bb KVM: x86: add kvm_leave_nested
    3e87cb0caa25 KVM: x86: nSVM: harden svm_free_nested against freeing vmcb02 while still in use
    6425c590d0cc KVM: x86: forcibly leave nested mode on vCPU reset
    f42ebf972a9f KVM: x86: nSVM: leave nested mode on vCPU free
    7b3c9405b272 mm: vmscan: fix extreme overreclaim and swap floods
    feb2eda5e11f gcov: clang: fix the buffer overflow issue
    ea6aa25c9ac0 nilfs2: fix nilfs_sufile_mark_dirty() not set segment usage as dirty
    9d97a9fbfc11 usb: dwc3: gadget: Clear ep descriptor last
    02632ea4dfaa usb: dwc3: gadget: Return -ESHUTDOWN on ep disable
    765ca3e63f37 usb: dwc3: gadget: conditionally remove requests
    7945cbf8666a bus: ixp4xx: Don't touch bit 7 on IXP42x
    39c039018a2c iio: core: Fix entry not deleted when iio_register_sw_trigger_type() fails
    0791a5ddbac2 iio: light: apds9960: fix wrong register for gesture gain
    f0158b9bfcc2 arm64: dts: rockchip: lower rk3399-puma-haikou SD controller clock frequency
    277d19ec283d ext4: fix use-after-free in ext4_ext_shift_extents
    c9d133100bce usb: cdnsp: fix issue with ZLP - added TD_SIZE = 1
    c2ad434cd4b2 usb: cdnsp: Fix issue with Clear Feature Halt Endpoint
    1d91c648874e usb: dwc3: exynos: Fix remove() function
    0a216625c3ab KVM: arm64: pkvm: Fixup boot mode to reflect that the kernel resumes from EL1
    f0044a4a31c9 mmc: sdhci-brcmstb: Fix SDHCI_RESET_ALL for CQHCI
    8e6940979bb8 mmc: sdhci-brcmstb: Enable Clock Gating to save power
    24b46bfa9661 mmc: sdhci-brcmstb: Re-organize flags
    227543ccacf8 nios2: add FORCE for vmlinuz.gz
    6a4ea16a6734 init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash
    c4a9046c2735 lib/vdso: use "grep -E" instead of "egrep"
    5fefdceafb78 s390/crashdump: fix TOD programmable field size
    592b6fd74afd net: thunderx: Fix the ACPI memory leak
    697eb30a3534 octeontx2-af: Fix reference count issue in rvu_sdp_init()
    6ba1687ea102 octeontx2-pf: Add check for devm_kcalloc
    26c31e7c73d4 net: enetc: preserve TX ring priority across reconfiguration
    0e16bbf616cc net: enetc: cache accesses to &priv->si->hw
    68de40f66a5a net: enetc: manage ENETC_F_QBV in priv->active_offloads only when enabled
    5c0858e1426b nfc: st-nci: fix incorrect sizing calculations in EVT_TRANSACTION
    e09243fb160b nfc: st-nci: fix memory leaks in EVT_TRANSACTION
    dca20b7a1959 nfc: st-nci: fix incorrect validating logic in EVT_TRANSACTION
    67d638f8efc4 s390/dasd: fix no record found for raw_track_access
    88277853cf8a arcnet: fix potential memory leak in com20020_probe()
    1d44ec8507b7 ipv4: Fix error return code in fib_table_insert()
    918e83c6bfa7 dccp/tcp: Reset saddr on failure after inet6?_hash_connect().
    8ce9b1c97fce fs: do not update freeing inode i_io_list
    8db9e60cdfda netfilter: flowtable_offload: add missing locking
    c1da3bfca111 netfilter: ipset: restore allowing 64 clashing elements in hash:net,iface
    606091b2f6dc dma-buf: fix racing conflict of dma_heap_add()
    8af9450befba bnx2x: fix pci device refcount leak in bnx2x_vf_is_pcie_pending()
    251bcf6cfb35 regulator: twl6030: re-add TWL6032_SUBCLASS
    6258a8f91304 NFC: nci: fix memory leak in nci_rx_data_packet()
    ffe6021154ea net: sched: allow act_ct to be built without NF_NAT
    a05c0f9511d0 net: sparx5: fix error handling in sparx5_port_open()
    182ef20f0f1c sfc: fix potential memleak in __ef100_hard_start_xmit()
    2da022fac96d net: wwan: iosm: use ACPI_FREE() but not kfree() in ipc_pcie_read_bios_cfg()
    a48b345b87f9 xfrm: Fix ignored return value in xfrm6_init()
    19989e163595 xfrm: Fix oops in __xfrm_state_delete()
    46d450067fc0 tipc: check skb_linearize() return value in tipc_disc_rcv()
    33fb115a76ae tipc: add an extra conn_get in tipc_conn_alloc
    4ae907c45fca tipc: set con sock in tipc_conn_alloc
    ef866d9ea922 net/mlx5: Fix handling of entry refcount when command is not issued to FW
    3101318939f5 net/mlx5: Fix FW tracer timestamp calculation
    1eaabb5bbbb6 net/mlx5: Do not query pci info while pci disabled
    8180099b2aea netfilter: ipset: regression in ip_set_hash_ip.c
    448b6273706c Drivers: hv: vmbus: fix possible memory leak in vmbus_device_register()
    082c31cb99d8 Drivers: hv: vmbus: fix double free in the error path of vmbus_add_channel_work()
    7fdd9daa5b12 macsec: Fix invalid error code set
    e8fb93a0792c nfp: add port from netdev validation for EEPROM access
    e44e424ed95f nfp: fill splittable of devlink_port_attrs correctly
    527046c13815 net: pch_gbe: fix pci device refcount leak while module exiting
    f77c84dd5b28 octeontx2-af: debugsfs: fix pci device refcount leak
    cd581ffd8dda net/qla3xxx: fix potential memleak in ql3xxx_send()
    a8976074e2cb net: mvpp2: fix possible invalid pointer dereference
    3a4cc56cd17d net/mlx4: Check retval of mlx4_bitmap_init
    c368220e1780 net: ethernet: mtk_eth_soc: fix error handling in mtk_open()
    d9729437b28f ARM: dts: imx6q-prti6q: Fix ref/tcxo-clock-frequency properties
    1c0b6a97c478 ARM: mxs: fix memory leak in mxs_machine_init()
    ecff08f3c469 iavf: Fix race condition between iavf_shutdown and iavf_remove
    31147d4e907c iavf: Do not restart Tx queues after reset task failure
    232942b26c54 iavf: Fix a crash during reset task
    0600615d010f netfilter: nf_tables: do not set up extensions for end interval
    60387731e69f netfilter: conntrack: Fix data-races around ct mark
    ee3ccd1abbe1 9p/fd: fix issue of list_del corruption in p9_fd_cancel()
    131c2eeabc72 net: pch_gbe: fix potential memleak in pch_gbe_tx_queue()
    f58df483ff37 nfc/nci: fix race with opening and closing
    da22d7410afd net: dsa: sja1105: disallow C45 transactions on the BASE-TX MDIO bus
    38fe0988bd51 rxrpc: Fix race between conn bundle lookup and bundle removal [ZDI-CAN-15975]
    d92151b4659b rxrpc: Use refcount_t rather than atomic_t
    3c33e41fa5b3 rxrpc: Allow list of in-use local UDP endpoints to be viewed in /proc
    46cefa268958 net: liquidio: simplify if expression
    95500ee0b3bd selftests: mptcp: fix mibit vs mbit mix up
    f8c4da198eed selftests: mptcp: more stable simult_flows tests
    1c0efab08c9b ARM: dts: at91: sam9g20ek: enable udc vbus gpio pinctrl
    ade662f3f242 tee: optee: fix possible memory leak in optee_register_device()
    d1dd119134ba bus: sunxi-rsb: Support atomic transfers
    b1ed61e7066b bus: sunxi-rsb: Remove the shutdown callback
    61a41d1abc7c regulator: core: fix UAF in destroy_regulator()
    a85c0db3f5ad spi: dw-dma: decrease reference count in dw_spi_dma_init_mfld()
    d9f9b3255b97 regulator: core: fix kobject release warning and memory leak in regulator_register()
    bd419c7c68bd ASoC: max98373: Add checks for devm_kcalloc
    f9bc4a18e7d5 scsi: storvsc: Fix handling of srb_status and capacity change events
    c2153fe2d0c6 x86/hyperv: Restore VP assist page after cpu offlining/onlining
    b2ddd7623712 ASoC: soc-pcm: Don't zero TDM masks in __soc_pcm_open()
    dd62cb7e6fd4 ASoC: sgtl5000: Reset the CHIP_CLK_CTRL reg on remove
    d80ffd4823b6 ASoC: hdac_hda: fix hda pcm buffer overflow issue
    10bee7eb2a2f ARM: dts: am335x-pcm-953: Define fixed regulators in root node
    8fe533c0f909 af_key: Fix send_acquire race with pfkey_register
    0c69a4658e94 xfrm: replay: Fix ESN wrap around for GSO
    ecc6ce4fdf0d xfrm: fix "disable_policy" on ipv4 early demux
    5a792c1d4d77 MIPS: pic32: treat port as signed integer
    144452b42143 RISC-V: vdso: Do not add missing symbols to version section in linker script
    799970b8cc45 ALSA: usb-audio: add quirk to fix Hamedal C20 disconnect issue
    38b09dc14f7c Revert "drm/amdgpu: Revert "drm/amdgpu: getting fan speed pwm for vega10 properly""
    44d50fccf889 nvmet: fix memory leak in nvmet_subsys_attr_model_store_locked
    5adc12d9e2b5 arm64/syscall: Include asm/ptrace.h in syscall_wrapper header.
    1340f02773ae block, bfq: fix null pointer dereference in bfq_bio_bfqg()
    86d4dca4a6ae drm: panel-orientation-quirks: Add quirk for Acer Switch V 10 (SW5-017)
    b90e6234f57e scsi: scsi_debug: Make the READ CAPACITY response compliant with ZBC
    cdbba6a4de39 scsi: ibmvfc: Avoid path failures during live migration
    6e8124a151bd platform/x86/intel/hid: Add some ACPI device IDs
    32735e24f47a platform/x86/intel/pmt: Sapphire Rapids PMT errata fix
    83a6823016f2 platform/x86: touchscreen_dmi: Add info for the RCA Cambio W101 v2 2-in-1
    f707986a1414 platform/x86: ideapad-laptop: Disable touchpad_switch
    5e38740ae545 Revert "net: macsec: report real_dev features when HW offloading is enabled"
    26b72202ee26 selftests/bpf: Add verifier test for release_reference()
    8395e3f98c4a spi: stm32: fix stm32_spi_prepare_mbr() that halves spi clk for every run
    d04722f2809c wifi: ath11k: Fix QCN9074 firmware boot on x86
    9cc96a20a92a wifi: mac80211: Fix ack frame idr leak when mesh has no route
    86f90014e767 wifi: airo: do not assign -1 to unsigned char
    f5558fbda022 audit: fix undefined behavior in bit shift for AUDIT_BIT
    af5de982ffc9 riscv: dts: sifive unleashed: Add PWM controlled LEDs
    ee34a19dbe2a wifi: mac80211_hwsim: fix debugfs attribute ps with rc table support
    3513785dc13f wifi: mac80211: fix memory free error when registering wiphy fail
    855485d31e2a ceph: fix NULL pointer dereference for req->r_session
    729c9ad2940e ceph: Use kcalloc for allocating multiple elements
    d276fb4a7eb8 binder: validate alloc->mm in ->mmap() handler
    5277e3d633a5 x86/sgx: Add overflow check in sgx_validate_offset_length()
    b5a838ba47f2 x86/sgx: Create utility to validate user provided offset and length
    2f6e2de3a528 ceph: avoid putting the realm twice when decoding snaps fails
    8bef55d7934d ceph: do not update snapshot context when there is no new snapshot
    cdee3136c966 iio: pressure: ms5611: fixed value compensation bug
    5d6696e79d94 iio: ms5611: Simplify IO callback parameters
    f0ee88e83ce9 nvme-pci: add NVME_QUIRK_BOGUS_NID for Netac NV7000
    a61716cd2401 nvme-pci: disable write zeroes on various Kingston SSD
    19b60f336317 nvme-pci: disable namespace identifiers for the MAXIO MAP1001
    d537e1930640 nvme-pci: add NVME_QUIRK_BOGUS_NID for Micron Nitro
    af03ce894c9c nvme: add a bogus subsystem NQN quirk for Micron MTFDKBA2T0TFH
    c6803faa6a6d drm/display: Don't assume dual mode adaptors support i2c sub-addressing
    d2284fe43c63 ata: libata-core: do not issue non-internal commands once EH is pending
    e09583e83e4a ata: libata-scsi: simplify __ata_scsi_queuecmd()
    a9059e338fc0 cifs: Fix connections leak when tlink setup failed
    81d583baa5f1 cifs: support nested dfs links over reconnect
    dbc0ea91be28 cifs: split out dfs code from cifs_reconnect()
    b3ce844d234f cifs: introduce new helper for cifs_reconnect()
    2ea600b598dd sctp: clear out_curr if all frag chunks of current msg are pruned
    1f9f346fbb78 sctp: remove the unnecessary sinfo_stream check in sctp_prsctp_prune_unsent
    e8915faa9f41 tty: serial: fsl_lpuart: don't break the on-going transfer when global reset
    bd19013935af serial: fsl_lpuart: Fill in rs485_supported
    87c81c19cda1 serial: Add rs485_supported to uart_port
    c08f4ea79f7a ASoC: fsl_asrc fsl_esai fsl_sai: allow CONFIG_PM=N
    d1e4288d2a63 ASoC: fsl_sai: use local device pointer
    71e496bd3382 Linux 5.15.80
    b63ddb3ba61e ntfs: check overflow when iterating ATTR_RECORDs
    ab6a1bb17e3c ntfs: fix out-of-bounds read in ntfs_attr_find()
    5330c423b862 ntfs: fix use-after-free in ntfs_attr_find()
    43bbadb7e463 net/9p: use a dedicated spinlock for trans_fd
    9357fca9dad7 mm: fs: initialize fsdata passed to write_begin/write_end interface
    b334ab4c3347 wifi: wext: use flex array destination for memcpy()
    0e07032b4b47 9p/trans_fd: always use O_NONBLOCK read/write
    7c7b7476b56e gfs2: Switch from strlcpy to strscpy
    28275a7c84d2 gfs2: Check sb_bsize_shift after reading superblock
    a4f1a01b2e81 9p: trans_fd/p9_conn_cancel: drop client lock earlier
    f7b0e95071bb kcm: close race conditions on sk_receive_queue
    27d706b0d394 kcm: avoid potential race in kcm_tx_work
    b49026d9c86f tcp: cdg: allow tcp_cdg_release() to be called multiple times
    e41cbf98df22 macvlan: enforce a consistent minimal mtu
    d5f7f6e63fed Input: i8042 - fix leaking of platform device on module removal
    c49cc2c059b5 kprobes: Skip clearing aggrprobe's post_handler in kprobe-on-ftrace case
    71beab7119d0 scsi: scsi_debug: Fix possible UAF in sdebug_add_host_helper()
    a636772988ba scsi: target: tcm_loop: Fix possible name leak in tcm_loop_setup_hba_bus()
    cb7893c85ea8 net: use struct_group to copy ip/ipv6 header addresses
    9b8c0c88f414 tracing: Fix warning on variable 'struct trace_array'
    73cf0ff9a393 ring-buffer: Include dropped pages in counting dirty patches
    35c60b4e8ca7 perf: Improve missing SIGTRAP checking
    2ac6276864de serial: 8250_lpss: Use 16B DMA burst with Elkhart Lake
    b1a27b2aad93 nvme: ensure subsystem reset is single threaded
    bccece3c3331 nvme: restrict management ioctls to admin
    8cddb0d96b9c perf/x86/intel/pt: Fix sampling using single range output
    8e2f33c59837 misc/vmw_vmci: fix an infoleak in vmci_host_do_receive_datagram()
    9a72a46cb01d docs: update mediator contact information in CoC doc
    a99a547658e5 mmc: sdhci-pci: Fix possible memory leak caused by missing pci_dev_put()
    4a1b6f7839d3 mmc: sdhci-pci-o2micro: fix card detect fail issue caused by CD# debounce timeout
    fd285d421563 mmc: core: properly select voltage range without power cycle
    8a9bae5f1b53 firmware: coreboot: Register bus in module init
    052d0e79efe5 iommu/vt-d: Set SRE bit only when hardware has SRS cap
    c31a792a825a iommu/vt-d: Preset Access bit for IOVA in FL non-leaf paging entries
    11edbdee4399 scsi: zfcp: Fix double free of FSF request when qdio send fails
    fdf87b5b3087 net: phy: marvell: add sleep time after enabling the loopback bit
    9648d760edf4 maccess: Fix writing offset in case of fault in strncpy_from_kernel_nofault()
    fdd57c20d440 Input: iforce - invert valid length check when fetching device IDs
    0cafb719bed5 serial: 8250_lpss: Configure DMA also w/o DMA filter
    59f6596697f1 serial: 8250: Flush DMA Rx on RLSI
    118b52c2ae08 serial: 8250: Fall back to non-DMA Rx if IIR_RDI occurs
    6ffce7a92ef5 dm ioctl: fix misbehavior if list_versions races with module loading
    2b104973f7fd iio: pressure: ms5611: changed hardcoded SPI speed to value limited
    1678d4abb2dc iio: adc: mp2629: fix potential array out of bound access
    bd22c232ead9 iio: adc: mp2629: fix wrong comparison of channel
    656f67061366 iio: trigger: sysfs: fix possible memory leak in iio_sysfs_trig_init()
    1bf8c0aff8fb iio: adc: at91_adc: fix possible memory leak in at91_adc_allocate_trigger()
    afc0aea70261 usb: typec: mux: Enter safe mode only when pins need to be reconfigured
    8236628a549d usb: cdns3: host: fix endless superspeed hub port reset
    ead83b0db81f usb: chipidea: fix deadlock in ci_otg_del_timer
    cc9e6d8c55c9 usb: add NO_LPM quirk for Realforce 87U Keyboard
    70eca1d261b2 USB: serial: option: add Fibocom FM160 0x0111 composition
    1b6a54885c40 USB: serial: option: add u-blox LARA-L6 modem
    b0467d0059bc USB: serial: option: add u-blox LARA-R6 00B modem
    95688a8a5735 USB: serial: option: remove old LARA-R6 PID
    53dee78ea382 USB: serial: option: add Sierra Wireless EM9191
    e7764e88e6c4 USB: bcma: Make GPIO explicitly optional
    a190a83db284 speakup: fix a segfault caused by switching consoles
    b3c6edbee48e slimbus: stream: correct presence rate frequencies
    6b35ac831555 slimbus: qcom-ngd: Fix build error when CONFIG_SLIM_QCOM_NGD_CTRL=y && CONFIG_QCOM_RPROC_COMMON=m
    0f847462fea1 Revert "usb: dwc3: disable USB core PHY management"
    23ad214a8665 ALSA: hda/realtek: Fix the speaker output on Samsung Galaxy Book Pro 360
    a36b505749c6 ALSA: hda/realtek: fix speakers for Samsung Galaxy Book Pro
    02b94885b2fd ALSA: usb-audio: Drop snd_BUG_ON() from snd_usbmidi_output_open()
    7176d6f3adb9 drm/amd/display: Add HUBP surface flip interrupt handler
    e57daa750369 tracing: kprobe: Fix potential null-ptr-deref on trace_array in kprobe_event_gen_test_exit()
    3a41c0f2a5c3 tracing: kprobe: Fix potential null-ptr-deref on trace_event_file in kprobe_event_gen_test_exit()
    7291dec4f2d1 tracing: Fix race where eprobes can be called before the event
    6517b97134f7 tracing: Fix wild-memory-access in register_synth_event()
    07ba4f0603ab tracing: Fix memory leak in test_gen_synth_cmd() and test_empty_synth_event()
    8b318f3032bf tracing/ring-buffer: Have polling block on watermark
    2c21ee020ce4 tracing: Fix memory leak in tracing_read_pipe()
    00f74b1a98a2 ring_buffer: Do not deactivate non-existant pages
    1bea037a1abb ftrace: Fix null pointer dereference in ftrace_add_mod()
    fadfcf39fbcd ftrace: Optimize the allocation for mcount entries
    5c5f2642898f ftrace: Fix the possible incorrect kernel message
    2ab249416244 cifs: add check for returning value of SMB2_set_info_init
    5783abda58d6 net: thunderbolt: Fix error handling in tbnet_init()
    80e590aeb132 net: microchip: sparx5: Fix potential null-ptr-deref in sparx_stats_init() and sparx5_start()
    4a55aec1425f cifs: Fix wrong return value checking when GETFLAGS
    c8baf1fc248b net/x25: Fix skb leak in x25_lapb_receive_frame()
    af4b57fa6bd0 net: ag71xx: call phylink_disconnect_phy if ag71xx_hw_enable() fail in ag71xx_open()
    61404a182eb5 cifs: add check for returning value of SMB2_close_init
    d3233f4bf3dd platform/surface: aggregator: Do not check for repeated unsequenced packets
    69691714035b platform/x86/intel: pmc: Don't unconditionally attach Intel PMC when virtualized
    7d93417d5964 drbd: use after free in drbd_create_device()
    fc16a2c81a3e bridge: switchdev: Fix memory leaks when changing VLAN protocol
    3d90a668c4bc net: hns3: fix setting incorrect phy link ksettings for firmware in resetting process
    3f7b2ef8fe92 net: ena: Fix error handling in ena_init()
    2540eea1bdc3 net: ionic: Fix error handling in ionic_init_module()
    c08c13cb13fa xen/pcpu: fix possible memory leak in register_pcpu()
    97009f07f217 net: dsa: make dsa_master_ioctl() see through port_hwtstamp_get() shims
    88da008e5e2f net: mhi: Fix memory leak in mhi_net_dellink()
    8f839715d032 bnxt_en: Remove debugfs when pci_register_driver failed
    b88713d92bd3 net: caif: fix double disconnect client in chnl_net_open()
    6d2403416089 net: macvlan: Use built-in RCU list checking
    596230471da3 mISDN: fix misuse of put_device() in mISDN_register_device()
    07a6a8cf1712 net: liquidio: release resources when liquidio driver open failed
    19feb6cf4136 soc: imx8m: Enable OCOTP clock before reading the register
    8c54d706d829 net: stmmac: ensure tx function is not running in stmmac_xdp_release()
    6219f46c2b9d net: hinic: Fix error handling in hinic_module_init()
    7a05e3929668 mISDN: fix possible memory leak in mISDN_dsp_element_register()
    0ee6455c9cfa net: bgmac: Drop free_netdev() from bgmac_enet_remove()
    7ff4fa179e4e bpf: Initialize same number of free nodes for each pcpu_freelist
    12f178cf05f3 MIPS: Loongson64: Add WARN_ON on kexec related kmalloc failed
    a4d6e024bea2 MIPS: fix duplicate definitions for exported symbols
    44142b652a28 nfp: change eeprom length to max length enumerators
    f23058dc2398 ata: libata-transport: fix error handling in ata_tdev_add()
    67b219314628 ata: libata-transport: fix error handling in ata_tlink_add()
    e7bb1b7a7bf2 ata: libata-transport: fix error handling in ata_tport_add()
    377ff82c33c0 ata: libata-transport: fix double ata_host_put() in ata_tport_add()
    494df0b0efe8 arm64: dts: imx8mn: Fix NAND controller size-cells
    7178d568f7cc arm64: dts: imx8mm: Fix NAND controller size-cells
    8ccf18c82a0a ARM: dts: imx7: Fix NAND controller size-cells
    e884a6c2d49a drm: Fix potential null-ptr-deref in drm_vblank_destroy_worker()
    07e56de8766f drm/drv: Fix potential memory leak in drm_dev_init()
    45c300613bee drm/panel: simple: set bpc field for logic technologies displays
    779f3f9e0cdc drm/vc4: kms: Fix IS_ERR() vs NULL check for vc4_kms
    97e5b508e961 pinctrl: devicetree: fix null pointer dereferencing in pinctrl_dt_to_map
    9a77b8557fdb parport_pc: Avoid FIFO port location truncation
    5d03c2911c52 siox: fix possible memory leak in siox_device_add()
    530e987a0226 arm64: Fix bit-shifting UB in the MIDR_CPU_MODEL() macro
    d4944497827a bpf: Fix memory leaks in __check_func_call
    25521fd2e217 block: sed-opal: kmalloc the cmd/resp buffers
    2f21d653c648 scsi: scsi_transport_sas: Fix error handling in sas_phy_add()
    7cd28bc410d2 pinctrl: rockchip: list all pins in a possible mux route for PX30
    ab79b8dbe21e ASoC: soc-utils: Remove __exit for snd_soc_util_exit()
    eaa8edd86514 bpf, test_run: Fix alignment problem in bpf_prog_test_run_skb()
    33cabe04d2c8 tty: n_gsm: fix sleep-in-atomic-context bug in gsm_control_send
    ae22294e213a serial: imx: Add missing .thaw_noirq hook
    26db1cd5191e serial: 8250: omap: Flush PM QOS work on remove
    e0db709a58bd serial: 8250: omap: Fix unpaired pm_runtime_put_sync() in omap8250_remove()
    83b6d4d6da67 serial: 8250_omap: remove wait loop from Errata i202 workaround
    76db05ab7092 serial: 8250: omap: Fix missing PM runtime calls for omap8250_set_mctrl()
    2aee616a6b11 ARM: at91: pm: avoid soft resetting AC DLL
    188546c78006 ASoC: tas2764: Fix set_tdm_slot in case of single slot
    5782896daf65 ASoC: tas2770: Fix set_tdm_slot in case of single slot
    34eee4189bce ASoC: core: Fix use-after-free in snd_soc_exit()
    aa6f8aecbbf2 ARM: dts: at91: sama7g5: fix signal name of pin PB2
    487fff700f5f spi: stm32: Print summary 'callbacks suppressed' message
    2cec2f65c1e7 arm64: dts: qcom: sm8350-hdk: Specify which LDO modes are allowed
    44dbe66bb3ea arm64: dts: qcom: sm8250-xperia-edo: Specify which LDO modes are allowed
    8b2eae7def2b arm64: dts: qcom: sm8150-xperia-kumano: Specify which LDO modes are allowed
    c8e76eeea77c arm64: dts: qcom: sa8155p-adp: Specify which LDO modes are allowed
    30571f28bb35 hugetlbfs: don't delete error page from pagecache
    14ddbb83c342 KVM: x86/pmu: Do not speculatively query Intel GP PMCs that don't exist yet
    a9b964ed7cf9 spi: intel: Use correct mask for flash and protected regions
    f4eb68642ed3 mtd: spi-nor: intel-spi: Disable write protection only if asked
    156d0c823c59 ASoC: codecs: jz4725b: Fix spelling mistake "Sourc" -> "Source", "Routee" -> "Route"
    5907ff9f2c8f x86/cpu: Add several Intel server CPU model numbers
    41e37d04e397 Bluetooth: L2CAP: Fix l2cap_global_chan_by_psm
    b02a025dd188 btrfs: remove pointless and double ulist frees in error paths of qgroup tests
    1c366c206ff2 drm/imx: imx-tve: Fix return type of imx_tve_connector_mode_valid
    1c8ded1b3879 i2c: i801: add lis3lv02d's I2C address for Vostro 5568
    b432581f19a0 i2c: tegra: Allocate DMA memory for DMA engine
    7b0ae4c7b918 firmware: arm_scmi: Cleanup the core driver removal callback
    1a8a2fef273d ACPI: x86: Add another system to quirk list for forcing StorageD3Enable
    8a03a4a5cf6d NFSv4: Retry LOCK on OLD_STATEID during delegation return
    49ca2227c47b btrfs: raid56: properly handle the error when unable to find the missing stripe
    0f7bd3a2dfe1 RDMA/efa: Add EFA 0xefa2 PCI ID
    a42d4363e78f ACPI: scan: Add LATT2021 to acpi_ignore_dep_ids[]
    004decd41b32 drm/amd/display: Remove wrong pipe control lock
    7779efbb99bf ASoC: rt1308-sdw: add the default value of some registers
    ef1e4ed85814 selftests/intel_pstate: fix build for ARCH=x86_64
    dfd3cc1ef3e2 selftests/futex: fix build for clang
    648467236c12 ASoC: Intel: sof_sdw: add quirk variant for LAPBC710 NUC15
    64ee750c29da ASoC: codecs: jz4725b: fix capture selector naming
    150b74cd0625 ASoC: codecs: jz4725b: use right control for Capture Volume
    5352d8b31572 ASoC: codecs: jz4725b: fix reported volume for Master ctl
    85134577a7f2 ASoC: codecs: jz4725b: add missed Line In power control bit
    5e61dffb16dc spi: intel: Fix the offset to get the 64K erase opcode
    c697cb2e6663 ASoC: wm8962: Add an event handler for TEMP_HP and TEMP_SPK
    569085124d75 ASoC: rt1019: Fix the TDM settings
    4160a515c75b ASoC: mt6660: Keep the pm_runtime enables before component stuff in mt6660_i2c_probe
    2963ec4535a1 ASoC: wm8997: Revert "ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe"
    30a2f9479c21 ASoC: wm5110: Revert "ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe"
    3bf6da38a292 ASoC: wm5102: Revert "ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe"
    94fa250ea55c mm: shmem: don't truncate page if memory failure happens
    003fa195911d mm: hwpoison: handle non-anonymous THP correctly
    a62b1bc603a1 mm: hwpoison: refactor refcount check handling
    3df0eeae4d9a Linux 5.15.79
    599b24eedf2a x86/cpu: Restore AMD's DE_CFG MSR after resume
    9132fa043f96 net: tun: call napi_schedule_prep() to ensure we own a napi
    1dea25e25acd drm/amdkfd: Migrate in CPU page fault use current mm
    a1c303fbd4dd marvell: octeontx2: build error: unknown type name 'u64'
    d948b228343a dmaengine: at_hdmac: Check return code of dma_async_device_register
    c556ecf32a07 dmaengine: at_hdmac: Fix impossible condition
    8a941ff34e53 dmaengine: at_hdmac: Don't allow CPU to reorder channel enable
    53831f7a13c3 dmaengine: at_hdmac: Fix completion of unissued descriptor in case of errors
    14f5462e4a00 dmaengine: at_hdmac: Fix descriptor handling when issuing it to hardware
    5482403228be dmaengine: at_hdmac: Fix concurrency over the active list
    82ca19414faa dmaengine: at_hdmac: Free the memset buf without holding the chan lock
    8fd36e069d65 dmaengine: at_hdmac: Fix concurrency over descriptor
    1ee012d452b1 dmaengine: at_hdmac: Fix concurrency problems by removing atc_complete_all()
    90c1b07406f0 dmaengine: at_hdmac: Protect atchan->status with the channel lock
    b5ee1fe06ad7 dmaengine: at_hdmac: Do not call the complete callback on device_terminate_all
    9bbf5df0fc8c dmaengine: at_hdmac: Fix premature completion of desc in issue_pending
    f7d1aaa90319 dmaengine: at_hdmac: Start transfer for cyclic channels in issue_pending
    e9777b4efcce dmaengine: at_hdmac: Don't start transactions at tx_submit level
    4e28674a0ecd dmaengine: at_hdmac: Fix at_lli struct definition
    49eba53137f5 cert host tools: Stop complaining about deprecated OpenSSL functions
    69e86c6268d5 can: j1939: j1939_send_one(): fix missing CAN header initialization
    81fc8f90b885 mm/shmem: use page_mapping() to detect page cache for uffd continue
    e91451af11f9 mm/memremap.c: map FS_DAX device memory as decrypted
    48998c1773a4 mm/damon/dbgfs: check if rm_contexts input is for a real context
    c736ed854160 udf: Fix a slab-out-of-bounds write bug in udf_find_entry()
    2e87eddf5736 mms: sdhci-esdhc-imx: Fix SDHCI_RESET_ALL for CQHCI
    91c38504e589 btrfs: zoned: initialize device's zone info for seeding
    432c30ba3f56 btrfs: selftests: fix wrong error check in btrfs_free_dummy_root()
    c9fe4719c662 btrfs: fix match incorrectly in dev_args_match_device
    f96fd3693631 wifi: ath11k: avoid deadlock during regulatory update in ath11k_regd_update()
    8e2b576caf91 platform/x86: hp_wmi: Fix rfkill causing soft blocked wifi
    cb3ab0e1e074 drm/amdgpu: disable BACO on special BEIGE_GOBY card
    dc066a78500a drm/i915/dmabuf: fix sg_table handling in map_dma_buf
    afbd1188382a nilfs2: fix use-after-free bug of ns_writer on remount
    abc082aac0d9 nilfs2: fix deadlock in nilfs_count_free_blocks()
    589da2288197 ata: libata-scsi: fix SYNCHRONIZE CACHE (16) command failure
    51ae4579a5d5 vmlinux.lds.h: Fix placement of '.data..decrypted' section
    1f8e08ab3269 ALSA: usb-audio: Add DSD support for Accuphase DAC-60
    c2451f62b2bd ALSA: usb-audio: Add quirk entry for M-Audio Micro
    031d1480a0f4 ALSA: usb-audio: Yet more regression for for the delayed card registration
    574f51e4aa40 ALSA: hda/realtek: Add Positivo C6300 model quirk
    7140d7aaf93d ALSA: hda: fix potential memleak in 'add_widget_node'
    f6d7a487aabd ALSA: hda/ca0132: add quirk for EVGA Z390 DARK
    1ccd55b3901b ALSA: hda/hdmi - enable runtime pm for more AMD display audio
    29100c674208 mmc: sdhci-esdhc-imx: use the correct host caps for MMC_CAP_8_BIT_DATA
    3dce99e2eb06 mmc: sdhci-tegra: Fix SDHCI_RESET_ALL for CQHCI
    9d6bd33e6aeb mmc: sdhci_am654: Fix SDHCI_RESET_ALL for CQHCI
    ad01f16ca90c mmc: sdhci-of-arasan: Fix SDHCI_RESET_ALL for CQHCI
    1aa78c1d013c mmc: cqhci: Provide helper for resetting both SDHCI and CQHCI
    c198524a99cb MIPS: jump_label: Fix compat branch range check
    9713ceffa40a arm64: efi: Fix handling of misaligned runtime regions and drop warning
    518e49f0590d riscv: fix reserved memory setup
    d07c3d7491b4 riscv: vdso: fix build with llvm
    cc36c7fa5d93 riscv: process: fix kernel info leakage
    a8d67367ab33 net: macvlan: fix memory leaks of macvlan_common_newlink
    7b194dd32b13 ethernet: tundra: free irq when alloc ring failed in tsi108_open()
    7de10342fe14 net: mv643xx_eth: disable napi when init rxq or txq failed in mv643xx_eth_open()
    88e1dd2d9291 ethernet: s2io: disable napi when start nic failed in s2io_card_up()
    3652f1f8d3ea net: atlantic: macsec: clear encryption keys from the stack
    fca3b0a1fd3e net: phy: mscc: macsec: clear encryption keys when freeing a flow
    60a0af8813fd stmmac: dwmac-loongson: fix missing of_node_put() while module exiting
    ee4a9bd2c7f4 stmmac: dwmac-loongson: fix missing pci_disable_device() in loongson_dwmac_probe()
    4a8770eebc39 stmmac: dwmac-loongson: fix missing pci_disable_msi() while module exiting
    83196d8dc5a8 cxgb4vf: shut down the adapter when t4vf_update_port_info() failed in cxgb4vf_open()
    49d8a6e24a34 mctp: Fix an error handling path in mctp_init()
    29961d2332a5 stmmac: intel: Update PCH PTP clock rate from 200MHz to 204.8MHz
    8604bebc5c32 stmmac: intel: Enable 2.5Gbps for Intel AlderLake-S
    7dec6dae2b61 net: cxgb3_main: disable napi when bind qsets failed in cxgb_up()
    960f9d30def3 net: cpsw: disable napi in cpsw_ndo_open()
    1360778fdb6f net/mlx5e: E-Switch, Fix comparing termination table instance
    f13e9ebd2925 net/mlx5: Allow async trigger completion execution on single CPU systems
    48b73b46a5b0 net/mlx5: Bridge, verify LAG state when adding bond to bridge
    13b1ea861e8a net: wwan: iosm: fix memory leak in ipc_pcie_read_bios_cfg
    7e4dcacb4dd6 net: nixge: disable napi when enable interrupts failed in nixge_open()
    409731df6310 net: marvell: prestera: fix memory leak in prestera_rxtx_switch_init()
    77ff31cba9a6 netfilter: Cleanup nft_net->module_list from nf_tables_exit_net()
    e62cb1c093d6 netfilter: nfnetlink: fix potential dead lock in nfnetlink_rcv_msg()
    0bd20318da08 perf tools: Add the include/perf/ directory to .gitignore
    a733671e388c perf stat: Fix printing os->prefix in CSV metrics output
    c36e9e2c4aff drivers: net: xgene: disable napi when register irq failed in xgene_enet_open()
    4689bd3a1b23 net: lapbether: fix issue of invalid opcode in lapbeth_open()
    1dd27541aa2b dmaengine: ti: k3-udma-glue: fix memory leak when register device fail
    992e966caf57 dmaengine: mv_xor_v2: Fix a resource leak in mv_xor_v2_remove()
    9766af75ba5a dmaengine: pxa_dma: use platform_get_irq_optional
    301caa06091a tipc: fix the msg->req tlv len check in tipc_nl_compat_name_table_dump_header
    6a264203dbdb net: broadcom: Fix BCMGENET Kconfig
    e7871b9a21ae net: stmmac: dwmac-meson8b: fix meson8b_devm_clk_prepare_enable()
    261178a1c262 can: af_can: fix NULL pointer dereference in can_rx_register()
    2acb2779b147 ipv6: addrlabel: fix infoleak when sending struct ifaddrlblmsg to network
    13ecaa6832fb tcp: prohibit TCP_REPAIR_OPTIONS if data was already sent
    bc79cb9fb006 drm/vc4: Fix missing platform_unregister_drivers() call in vc4_drm_register()
    2845bc9070ce net: wwan: mhi: fix memory leak in mhi_mbim_dellink
    2ce2348c2858 net: wwan: iosm: fix memory leak in ipc_wwan_dellink
    7b6bc50f65e9 hamradio: fix issue of dev reference count leakage in bpq_device_event()
    f59adebb8c28 net: lapbether: fix issue of dev reference count leakage in lapbeth_device_event()
    119407dc329a KVM: s390: pv: don't allow userspace to set the clock under PV
    500bcd3a99ea phy: ralink: mt7621-pci: add sentinel to quirks table
    151dc8087b56 capabilities: fix undefined behavior in bit shift for CAP_TO_MASK
    435c7ddfd510 net: fman: Unregister ethernet device on removal
    3a504d6d96ea bnxt_en: fix potentially incorrect return value for ndo_rx_flow_steer
    ac257c43fa61 bnxt_en: Fix possible crash in bnxt_hwrm_set_coal()
    d7569302a7a5 net: tun: Fix memory leaks of napi_get_frags
    430d1f4964dd octeontx2-pf: NIX TX overwrites SQ_CTX_HW_S[SQ_INT]
    ec0db81883b4 octeontx2-pf: Use hardware register for CQE count
    b89a0d8859ae macsec: clear encryption keys from the stack after setting up offload
    eeba7f07a0cb macsec: fix detection of RXSCs when toggling offloading
    3070a880eb03 macsec: fix secy->n_rx_sc accounting
    e957555a3694 macsec: delete new rxsc when offload fails
    ad25a115f508 net: gso: fix panic on frag_list with mixed head alloc types
    466ce46f251d bpf: Fix wrong reg type conversion in release_reference()
    35d8130f2ad0 bpf: Add helper macro bpf_for_each_reg_in_vstate
    61274498fbf8 bpf, sock_map: Move cancel_work_sync() out of sock lock
    32b5dd03beeb bpf: Fix sockmap calling sleepable function in teardown path
    e9915581899c bpf, sockmap: Fix sk->sk_forward_alloc warn_on in sk_stream_kill_queues
    5ad95d71344b HID: hyperv: fix possible memory leak in mousevsc_probe()
    6dcdd1b68b7f bpftool: Fix NULL pointer dereference when pin {PROG, MAP, LINK} without FILE
    2fc902245c82 wifi: mac80211: Set TWT Information Frame Disabled bit as 1
    95adbd2ac8de bpf, sockmap: Fix the sk->sk_forward_alloc warning of sk_stream_kill_queues
    06615967d488 bpf, verifier: Fix memory leak in array reallocation for stack state
    4335a82c4f7b soundwire: qcom: check for outanding writes before doing a read
    ae4dad2e5374 soundwire: qcom: reinit broadcast completion
    38c9fa2cc6bf wifi: cfg80211: fix memory leak in query_regdb_file()
    2c6ba0a7872b wifi: cfg80211: silence a sparse RCU warning
    921738c280ab phy: stm32: fix an error code in probe
    fa722006f762 hwspinlock: qcom: correct MMIO max register for newer SoCs
    3c1bb6187e56 drm/amdkfd: Fix NULL pointer dereference in svm_migrate_to_ram()
    b1f852277171 drm/amdkfd: handle CPU fault on COW mapping
    36770c045aba drm/amdkfd: avoid recursive lock in migrations back to RAM
    93a5de7e8843 fuse: fix readdir cache race
    1920cf94545a thunderbolt: Add DP OUT resource when DP tunnel is discovered
    47dbf2496990 thunderbolt: Tear down existing tunnels when resuming from hibernate

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

This needs to be applied after [linux-yocto/5.15: libbpf: Fix build
warning on ref_ctr_off], as that commit has the SRCREV bumps to pickup
the kernel changes. This puts the version and the source in alignment.

Alternatively, this can be squashed into the libbpf commit.

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 3dac2fbcd2..dd9f940c7c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -17,7 +17,7 @@ SRCREV_meta ?= "72756ee16d7230f04fb6bbf0bb115e32a9d73d8d"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.78"
+LINUX_VERSION ?= "5.15.84"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 3dd2ecdf6f..8aa2ee14f2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.78"
+LINUX_VERSION ?= "5.15.84"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 74dc684f89..57231db576 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -40,7 +40,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.78"
+LINUX_VERSION ?= "5.15.84"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.37.3


