Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDE2C4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 17:44:47 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web11.28854.1671471886153542261
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 09:44:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pW658951;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id b189so9425489vsc.10
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 09:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrTsCzMtAEH9hMwXOhtKsr5XZemzl3gcVYXAlrPZ+CU=;
        b=pW658951iP7t8IIp0FyAvJhrhWLvW3B4DhLEMkLkqUHSL2Y3bPIU1DMWFSHcjl4spk
         wIPAVkDUTzamrdJv0bZYQ23xQt9IHbr3XNIm6cjvsu3rO/hmgyUVYM493caUjpVjfLAG
         zvTqgYqN48uqmMlZ1RytmwFdGo/4F7B1zBephJZUMtrIhiJcXvwYjMRjdSeNe1hgxD3q
         G6RYGAzhYSOmIBSnct4stEO98BHws97A8NYAtSJnmAu6nCVPbSAObj8BAdddIyqTHDI+
         SUX70iJMEaogTGiM+gEx8OKigF9VneRAPNBmrT5TOZZd/Ctkrt1h8DP/XT0dSg0TAK4l
         K1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrTsCzMtAEH9hMwXOhtKsr5XZemzl3gcVYXAlrPZ+CU=;
        b=zJisBMTJodrGMtpUh48BjEiyczO+Olc25pbEUhFfBt/Rd6J14wo+wn/HSBB4tjuMMB
         DVij3mCcGzTfpLeR/1TL1Sq9y57j7EPVin+lHEYnjo9GpqzFr7RiWO9+BFnFtic44K4n
         S6QgcwuvlKVe1gEA3joJS0F4OZt7ow6AZF3xKdOpof8Ct7W1h1IqAGrBPhT32JgQPY0B
         Jlo6oSezPoLHiv62uxwhl3tlrOH/d0ssCp8RzjxLTM8mOmtfkZntUxVJzYVyMhUMfqff
         27XeWItbYkrvR8iIxGNSgW20pL+8FmHumwZUN1jvZ9w9ZGVbgdeKuH8Ao324ARAUTCpS
         ygSQ==
X-Gm-Message-State: AFqh2kobZZWSG3xehIGS/rcNf+fRBIMYvqWviS9zXZGr5TPZFqgKq6Lj
	O9Wr06vKQxlluc9vs0D+Mq7EH6F9leM=
X-Google-Smtp-Source: AMrXdXvEAE6cVNASL4EfhfrsktqkvKOtyjnVjSRoDq/rqy85a8TXvCFpBeZTInZGep08gKFBVYjbFA==
X-Received: by 2002:a05:6102:3347:b0:3b5:36cc:a5f5 with SMTP id j7-20020a056102334700b003b536cca5f5mr10206731vse.35.1671471884693;
        Mon, 19 Dec 2022 09:44:44 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id bn35-20020a05620a2ae300b006ce76811a07sm7268913qkb.75.2022.12.19.09.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 09:44:44 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3][kirkstone] linux-yocto/5.10: update to v5.10.160
Date: Mon, 19 Dec 2022 12:44:41 -0500
Message-Id: <20221219174441.64835-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20221219174441.64835-1-bruce.ashfield@gmail.com>
References: <20221219174441.64835-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 17:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174829

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    a2428a8dcb4f Linux 5.10.160
    54c15f67cb72 ASoC: ops: Correct bounds check for second channel on SX controls
    74b139c63f07 nvme-pci: clear the prp2 field when not used
    77ebf88e0031 ASoC: cs42l51: Correct PGA Volume minimum value
    4db1d19b74e0 can: mcba_usb: Fix termination command argument
    683837f2f69d can: sja1000: fix size of OCR_MODE_MASK define
    434b5236710f pinctrl: meditatek: Startup with the IRQs disabled
    5cb4abb0caa5 libbpf: Use page size as max_entries when probing ring buffer map
    50b5f6d4d9d2 ASoC: ops: Check bounds for second channel in snd_soc_put_volsw_sx()
    344739dc56f1 ASoC: fsl_micfil: explicitly clear CHnF flags
    a49c1a730775 ASoC: fsl_micfil: explicitly clear software reset bit
    75454b4bbfc7 io_uring: add missing item types for splice request
    17f386e6b769 fuse: always revalidate if exclusive create
    eb6313c12955 nfp: fix use-after-free in area_cache_get()
    965d93fb39b9 vfs: fix copy_file_range() averts filesystem freeze protection
    ed9673394979 vfs: fix copy_file_range() regression in cross-fs copies
    970862a96c0d x86/smpboot: Move rcu_cpu_starting() earlier
    931578be6987 Linux 5.10.159
    4fd6f84e0a0c can: esd_usb: Allow REC and TEC to return to zero
    cf0e42310648 macsec: add missing attribute validation for offload
    6b03e41767c7 net: mvneta: Fix an out of bounds check
    8208d7e56b1e ipv6: avoid use-after-free in ip6_fragment()
    3d59adad126d net: plip: don't call kfree_skb/dev_kfree_skb() under spin_lock_irq()
    a00444e25bbc xen/netback: fix build warning
    87277bdf2c37 ethernet: aeroflex: fix potential skb leak in greth_init_rings()
    cc668fddde42 tipc: call tipc_lxc_xmit without holding node_read_lock
    4be43e46c3f9 net: dsa: sja1105: fix memory leak in sja1105_setup_devlink_regions()
    8e3f9ac00956 ipv4: Fix incorrect route flushing when table ID 0 is used
    5211e5ff9ddc ipv4: Fix incorrect route flushing when source address is deleted
    36e248269a16 tipc: Fix potential OOB in tipc_link_proto_rcv()
    93aaa4bb72e3 net: hisilicon: Fix potential use-after-free in hix5hd2_rx()
    296a50aa8b29 net: hisilicon: Fix potential use-after-free in hisi_femac_rx()
    8d1aed7a117a net: thunderx: Fix missing destroy_workqueue of nicvf_rx_mode_wq
    a5cfbc199536 ip_gre: do not report erspan version on GRE interface
    696e34d54ca1 net: stmmac: fix "snps,axi-config" node property parsing
    ca26f45083d6 nvme initialize core quirks before calling nvme_init_subsystem
    27eb2d7a1b99 NFC: nci: Bounds check struct nfc_target arrays
    a2506b19d7a3 i40e: Disallow ip4 and ip6 l4_4_bytes
    8329b65e34ef i40e: Fix for VF MAC address 0
    215f3ac53b18 i40e: Fix not setting default xps_cpus after reset
    146ebee8fcdb net: mvneta: Prevent out of bounds read in mvneta_config_rss()
    e6860c889f4a xen-netfront: Fix NULL sring after live migration
    3d3b30718ae3 net: encx24j600: Fix invalid logic in reading of MISTAT register
    51ba1820e736 net: encx24j600: Add parentheses to fix precedence
    42c319635c0c mac802154: fix missing INIT_LIST_HEAD in ieee802154_if_add()
    4c693330cec2 selftests: rtnetlink: correct xfrm policy rule in kci_test_ipsec_offload
    bccda3ad0748 net: dsa: ksz: Check return value
    e7b950458156 Bluetooth: Fix not cleanup led when bt_init fails
    1717354d77f8 Bluetooth: 6LoWPAN: add missing hci_dev_put() in get_l2cap_conn()
    80c69b31aa5b vmxnet3: correctly report encapsulated LRO packet
    575a6266f63d af_unix: Get user_ns from in_skb in unix_diag_get_exact().
    6c788c0a2506 drm: bridge: dw_hdmi: fix preference of RGB modes over YUV420
    de918d9738c7 igb: Allocate MSI-X vector when testing
    6595c9208d97 e1000e: Fix TX dispatch condition
    5ee6413d3dd9 gpio: amd8111: Fix PCI device reference count leak
    b9aca69a6c82 drm/bridge: ti-sn65dsi86: Fix output polarity setting bug
    b46e8c50c386 netfilter: ctnetlink: fix compilation warning after data race fixes in ct mark
    0a8e66e37573 ca8210: Fix crash by zero initializing data
    27c71825ffc4 ieee802154: cc2520: Fix error return code in cc2520_hw_init()
    a0418d0a6b2d netfilter: nft_set_pipapo: Actually validate intervals in fields after the first one
    cb283cca1ddc rtc: mc146818-lib: fix signedness bug in mc146818_get_time()
    5c432383b687 rtc: mc146818-lib: fix locking in mc146818_set_time
    5e26531d8113 rtc: cmos: Disable irq around direct invocation of cmos_interrupt()
    fccee93eb20d mm/hugetlb: fix races when looking up a CONT-PTE/PMD size hugetlb page
    c42221efb115 can: af_can: fix NULL pointer dereference in can_rcv_filter
    bc03f809da78 HID: core: fix shift-out-of-bounds in hid_report_raw_event
    959a23a4d111 HID: hid-lg4ff: Add check for empty lbuf
    4dde75945a9c HID: usbhid: Add ALWAYS_POLL quirk for some mice
    11e95d85c3c9 drm/shmem-helper: Avoid vm_open error paths
    6a4da05acd06 drm/shmem-helper: Remove errant put in error path
    007f561f599f drm/vmwgfx: Don't use screen objects when SEV is active
    3cb78c39252e KVM: s390: vsie: Fix the initialization of the epoch extension (epdx) field
    549b46f8130e Bluetooth: Fix crash when replugging CSR fake controllers
    380d183e998b Bluetooth: btusb: Add debug message for CSR controllers
    f1cf856123ce mm/gup: fix gup_pud_range() for dax
    f1f7f36cf682 memcg: fix possible use-after-free in memcg_write_event_control()
    32f01f0306a9 media: v4l2-dv-timings.c: fix too strict blanking sanity checks
    043b2bc96ca2 Revert "ARM: dts: imx7: Fix NAND controller size-cells"
    abfb8ae69bdc media: videobuf2-core: take mmap_lock in vb2_get_unmapped_area()
    83632fc41449 xen/netback: don't call kfree_skb() with interrupts disabled
    3eecd2bc10e0 xen/netback: do some code cleanup
    49e07c0768db xen/netback: Ensure protocol headers don't fall in the non-linear area
    db44a9443e58 rtc: mc146818: Reduce spinlock section in mc146818_set_time()
    17293d630f5f rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ
    acfd8ef683fb rtc: cmos: avoid UIP when reading alarm time
    949bae02827e rtc: cmos: avoid UIP when writing alarm time
    33ac73a41af6 rtc: mc146818-lib: extract mc146818_avoid_UIP
    8bb5fe58305f rtc: mc146818-lib: fix RTC presence check
    775d4661f145 rtc: Check return value from mc146818_get_time()
    b9a5c470e075 rtc: mc146818-lib: change return values of mc146818_get_time()
    94eaf9966e04 rtc: cmos: remove stale REVISIT comments
    f5b51f855036 rtc: mc146818: Dont test for bit 0-5 in Register D
    3736972360fa rtc: mc146818: Detect and handle broken RTCs
    7c7075c88da4 rtc: mc146818: Prevent reading garbage
    7f445ca2e0e5 mm/khugepaged: invoke MMU notifiers in shmem/file collapse paths
    4a1cdb49d0f2 mm/khugepaged: fix GUP-fast interaction by sending IPI
    cdfd3739b212 mm/khugepaged: take the right locks for page table retraction
    1c0eec6a1d17 net: usb: qmi_wwan: add u-blox 0x1342 composition
    a8c5ffb4dffd 9p/xen: check logical size for buffer size
    ec36ebae3667 usb: dwc3: gadget: Disable GUSB2PHYCFG.SUSPHY for End Transfer
    d9b53caf0191 fbcon: Use kzalloc() in fbcon_prepare_logo()
    8b130c770d00 regulator: twl6030: fix get status of twl6032 regulators
    f6f45e538328 ASoC: soc-pcm: Add NULL check in BE reparenting
    688a45aff2b2 btrfs: send: avoid unaligned encoded writes when attempting to clone range
    15c42ab8d43a ALSA: seq: Fix function prototype mismatch in snd_seq_expand_var_event
    d38e021416b2 regulator: slg51000: Wait after asserting CS pin
    1331bcfcac18 9p/fd: Use P9_HDRSZ for header size
    96b43f36a593 ARM: dts: rockchip: disable arm_global_timer on rk3066 and rk3188
    ddf58f59393b ASoC: wm8962: Wait for updated value of WM8962_CLOCKING1 register
    dbd78abd696d ARM: 9266/1: mm: fix no-MMU ZERO_PAGE() implementation
    bb1866cf1ee9 ARM: 9251/1: perf: Fix stacktraces for tracepoint events in THUMB2 kernels
    b1f40a0cdf00 ARM: dts: rockchip: rk3188: fix lcdc1-rgb24 node name
    5f9474d07b60 arm64: dts: rockchip: fix ir-receiver node names
    060d58924af6 ARM: dts: rockchip: fix ir-receiver node names
    3e0c4667713a arm: dts: rockchip: fix node name for hym8563 rtc
    3ada63a87654 arm64: dts: rockchip: keep I2S1 disabled for GPIO function on ROCK Pi 4 series
    592346d5dc9b Linux 5.10.158
    cc1b4718cc42 ipc/sem: Fix dangling sem_array access in semtimedop race
    d072a10c81d3 v4l2: don't fall back to follow_pfn() if pin_user_pages_fast() fails
    9ba389863ac6 proc: proc_skip_spaces() shouldn't think it is working on C strings
    4aa32aaef6c1 proc: avoid integer type confusion in get_proc_long
    5f2f77560591 block: unhash blkdev part inode when the part is deleted
    a82869ac52f3 Input: raydium_ts_i2c - fix memory leak in raydium_i2c_send()
    4e0d6c687c92 char: tpm: Protect tpm_pm_suspend with locks
    5a6f935ef34e Revert "clocksource/drivers/riscv: Events are stopped during CPU suspend"
    f075cf139f55 ACPI: HMAT: Fix initiator registration for single-initiator systems
    f3b76b4d38fd ACPI: HMAT: remove unnecessary variable initialization
    63e72417a1ad i2c: imx: Only DMA messages with I2C_M_DMA_SAFE flag set
    df7613659872 i2c: npcm7xx: Fix error handling in npcm_i2c_init()
    7462cd2443bc x86/pm: Add enumeration check before spec MSRs save/restore setup
    5e3d4a68e2e1 x86/tsx: Add a feature bit for TSX control MSR support
    b7f7a0402eb7 Revert "tty: n_gsm: avoid call of sleeping functions from atomic context"
    481f9ed8ebdc ipv4: Fix route deletion when nexthop info is not specified
    0b5394229eba ipv4: Handle attempt to delete multipath route when fib_info contains an nh reference
    4919503426c9 selftests: net: fix nexthop warning cleanup double ip typo
    7ca14c5f24db selftests: net: add delete nexthop route warning test
    f09ac62f0e3f Kconfig.debug: provide a little extra FRAME_WARN leeway when KASAN is enabled
    19d91d3798e7 parisc: Increase FRAME_WARN to 2048 bytes on parisc
    fcf20da09974 xtensa: increase size of gcc stack frame check
    a1877001ed6d parisc: Increase size of gcc stack frame check
    a5c65cd56aed iommu/vt-d: Fix PCI device refcount leak in dmar_dev_scope_init()
    10ed7655a17f iommu/vt-d: Fix PCI device refcount leak in has_external_pci()
    302edce1dd42 pinctrl: single: Fix potential division by zero
    b50c96418972 ASoC: ops: Fix bounds check for _sx controls
    a2efc465245e io_uring: don't hold uring_lock when calling io_run_task_work*
    be111ebd8868 tracing: Free buffers when a used dynamic event is removed
    648b92e57607 drm/i915: Never return 0 if not all requests retired
    8649c023c427 drm/amdgpu: temporarily disable broken Clang builds due to blown stack-frame
    940b774069f1 mmc: sdhci: Fix voltage switch delay
    ed1966245307 mmc: sdhci-sprd: Fix no reset data and command after voltage switch
    ef767907e77d mmc: sdhci-esdhc-imx: correct CQHCI exit halt state check
    46ee041cd655 mmc: core: Fix ambiguous TRIM and DISCARD arg
    b79be962b567 mmc: mmc_test: Fix removal of debugfs file
    d4fc344c0d9c net: stmmac: Set MAC's flow control register to reflect current settings
    549e24409ac5 pinctrl: intel: Save and restore pins in "direct IRQ" mode
    471fb7b735bf x86/bugs: Make sure MSR_SPEC_CTRL is updated properly upon resume from S3
    e858917ab785 nilfs2: fix NULL pointer dereference in nilfs_palloc_commit_free_entry()
    6ddf788400dd tools/vm/slabinfo-gnuplot: use "grep -E" instead of "egrep"
    c099d12c5502 error-injection: Add prompt for function error injection
    26b6f927bb86 riscv: vdso: fix section overlapping under some conditions
    2b1d8f27e205 net/mlx5: DR, Fix uninitialized var warning
    c40db1e5f316 hwmon: (coretemp) fix pci device refcount leak in nv1a_ram_new()
    f06e0cd01eab hwmon: (coretemp) Check for null before removing sysfs attrs
    d93522d04f84 net: ethernet: renesas: ravb: Fix promiscuous mode after system resumed
    176ee6c673cc sctp: fix memory leak in sctp_stream_outq_migrate()
    1c38c88acc96 packet: do not set TP_STATUS_CSUM_VALID on CHECKSUM_COMPLETE
    5f442e1d403e net: tun: Fix use-after-free in tun_detach()
    5fa0fc5876b5 afs: Fix fileserver probe RTT handling
    7ca81a161e40 net: hsr: Fix potential use-after-free
    a1ba595e35aa tipc: re-fetch skb cb after tipc_msg_validate
    4621bdfff5f8 dsa: lan9303: Correct stat name
    45752af02475 net: ethernet: nixge: fix NULL dereference
    e01c1542379f net/9p: Fix a potential socket leak in p9_socket_open
    b080d4668f3f net: net_netdev: Fix error handling in ntb_netdev_init_module()
    fe6bc99c27c2 net: phy: fix null-ptr-deref while probe() failed
    0184ede0ec61 wifi: mac8021: fix possible oob access in ieee80211_get_rate_duration
    e2ed90fd3ae0 wifi: cfg80211: don't allow multi-BSSID in S1G
    9e6b79a3cd17 wifi: cfg80211: fix buffer overflow in elem comparison
    6922948c2ec1 aquantia: Do not purge addresses when setting the number of rings
    fa59d49a49b0 qlcnic: fix sleep-in-atomic-context bugs caused by msleep
    d753f554f25d can: cc770: cc770_isa_probe(): add missing free_cc770dev()
    e74746bf0453 can: sja1000_isa: sja1000_isa_probe(): add missing free_sja1000dev()
    0d2f9d95d9fb net/mlx5e: Fix use-after-free when reverting termination table
    2cb84ff34938 net/mlx5: Fix uninitialized variable bug in outlen_write()
    b775f37d9439 e100: Fix possible use after free in e100_xmit_prepare
    086f656e447b e100: switch from 'pci_' to 'dma_' API
    971c55f0763b iavf: Fix error handling in iavf_init_module()
    d389a4c69877 iavf: remove redundant ret variable
    fd4960ea5362 fm10k: Fix error handling in fm10k_init_module()
    dd425cec79ba i40e: Fix error handling in i40e_init_module()
    f166c62cad79 ixgbevf: Fix resource leak in ixgbevf_init_module()
    8f7047f41810 of: property: decrement node refcount in of_fwnode_get_reference_args()
    be006212bd53 bpf: Do not copy spin lock field from user in bpf_selem_alloc
    90907cd4d113 hwmon: (ibmpex) Fix possible UAF when ibmpex_register_bmc() fails
    7649bba2633d hwmon: (i5500_temp) fix missing pci_disable_device()
    dddfc03f044b hwmon: (ina3221) Fix shunt sum critical calculation
    984fcd3ec1aa hwmon: (ltc2947) fix temperature scaling
    8a549ab67245 libbpf: Handle size overflow for ringbuf mmap
    cc140c729c68 ARM: at91: rm9200: fix usb device clock id
    592724b14da7 scripts/faddr2line: Fix regression in name resolution on ppc64le
    353c3aaaf3c4 bpf, perf: Use subprog name when reporting subprog ksymbol
    d48f6a578405 iio: light: rpr0521: add missing Kconfig dependencies
    5eb114f55b37 iio: health: afe4404: Fix oob read in afe4404_[read|write]_raw
    b1756af172fb iio: health: afe4403: Fix oob read in afe4403_read_raw
    01d7c41eac91 btrfs: qgroup: fix sleep from invalid context bug in btrfs_qgroup_inherit()
    d3f5be824669 drm/amdgpu: Partially revert "drm/amdgpu: update drm_display_info correctly when the edid is read"
    00570fafc2bc drm/amdgpu: update drm_display_info correctly when the edid is read
    44b204730bf3 drm/display/dp_mst: Fix drm_dp_mst_add_affected_dsc_crtcs() return code
    1faf21bdd111 btrfs: move QUOTA_ENABLED check to rescan_should_stop from btrfs_qgroup_rescan_worker
    6050872f9f31 spi: spi-imx: Fix spi_bus_clk if requested clock is higher than input clock
    7b020665d482 btrfs: free btrfs_path before copying inodes to userspace
    d5b7a34379fa btrfs: sink iterator parameter to btrfs_ioctl_logical_to_ino
    f4245f05389c Linux 5.10.157
    4801672fb076 fuse: lock inode unconditionally in fuse_fallocate()
    86f0082fb947 drm/i915: fix TLB invalidation for Gen12 video and compute engines
    feb97cf45e77 drm/amdgpu: always register an MMU notifier for userptr
    596b7d55d7c6 drm/amd/dc/dce120: Fix audio register mapping, stop triggering KASAN
    c86c1a7037cd btrfs: sysfs: normalize the error handling branch in btrfs_init_sysfs()
    1581830c0eca btrfs: free btrfs_path before copying subvol info to userspace
    0bdb8f7ef87d btrfs: free btrfs_path before copying fspath to userspace
    24a37ba2cb66 btrfs: free btrfs_path before copying root refs to userspace
    b56d6e55857b genirq: Take the proposed affinity at face value if force==true
    9d90a2b98e6e irqchip/gic-v3: Always trust the managed affinity provided by the core code
    e0d2c59ee995 genirq: Always limit the affinity to online CPUs
    f8f80d532f78 genirq/msi: Shutdown managed interrupts with unsatifiable affinities
    3eb6b89a4e9f wifi: wilc1000: validate number of channels
    5a068535c007 wifi: wilc1000: validate length of IEEE80211_P2P_ATTR_CHANNEL_LIST attribute
    905f886eae4b wifi: wilc1000: validate length of IEEE80211_P2P_ATTR_OPER_CHANNEL attribute
    7c6535fb4d67 wifi: wilc1000: validate pairwise and authentication suite offsets
    64b7f9a7ddfb dm integrity: clear the journal on suspend
    d306f73079f3 dm integrity: flush the journal on suspend
    79d9a1167978 gpu: host1x: Avoid trying to use GART on Tegra20
    a7f30b5b8d7c net: usb: qmi_wwan: add Telit 0x103a composition
    7e8eaa939eea tcp: configurable source port perturb table size
    0acc008cf98e platform/x86: hp-wmi: Ignore Smart Experience App event
    0964b77bab54 zonefs: fix zone report size in __zonefs_io_error()
    a5937dae662b platform/x86: acer-wmi: Enable SW_TABLET_MODE on Switch V 10 (SW5-017)
    52fb7bcea0c6 platform/x86: asus-wmi: add missing pci_dev_put() in asus_wmi_set_xusb2pr()
    4fa717ba2d25 xen/platform-pci: add missing free_irq() in error path
    f45a5a6c9f6d xen-pciback: Allow setting PCI_MSIX_FLAGS_MASKALL too
    9bbb58747243 Input: soc_button_array - add Acer Switch V 10 to dmi_use_low_level_irq[]
    4ea4316dffda Input: soc_button_array - add use_low_level_irq module parameter
    c1620e996d0a Input: goodix - try resetting the controller when no config is set
    f4db0509587a serial: 8250: 8250_omap: Avoid RS485 RTS glitch on ->set_termios()
    7c3e39ccf5bd ASoC: Intel: bytcht_es8316: Add quirk for the Nanote UMPC-01
    36e0b976196c Input: synaptics - switch touchpad on HP Laptop 15-da3001TU to RMI mode
    ae9e0cc973fb binder: Gracefully handle BINDER_TYPE_FDA objects with num_fds=0
    017de842533f binder: Address corner cases in deferred copy and fixup
    2e3c27f24173 binder: fix pointer cast warning
    c9d3f25a7f4e binder: defer copies of pre-patched txn data
    5204296fc766 binder: read pre-translated fds from sender buffer
    23e9d815fad8 binder: avoid potential data leakage when copying txn
    22870431cd25 x86/ioremap: Fix page aligned size calculation in __ioremap_caller()
    3fdeacf087ff KVM: x86: remove exit_int_info warning in svm_handle_exit
    7e5cb13091e6 KVM: x86: nSVM: leave nested mode on vCPU free
    d925dd3e444c mm: vmscan: fix extreme overreclaim and swap floods
    a4a62a23fadc gcov: clang: fix the buffer overflow issue
    e7f21d10e93e nilfs2: fix nilfs_sufile_mark_dirty() not set segment usage as dirty
    f06b7e6a77c1 usb: dwc3: gadget: Clear ep descriptor last
    cff7523ab8b8 usb: dwc3: gadget: Return -ESHUTDOWN on ep disable
    a32635528d65 usb: dwc3: gadget: conditionally remove requests
    ca3a08e9d9eb ceph: fix NULL pointer dereference for req->r_session
    00c004c070f2 ceph: Use kcalloc for allocating multiple elements
    69263bf781be ceph: fix possible NULL pointer dereference for req->r_session
    8e137ace5333 ceph: put the requests/sessions when it fails to alloc memory
    38993788f40c ceph: fix off by one bugs in unsafe_request_wait()
    8a31ae7f7794 ceph: flush the mdlog before waiting on unsafe reqs
    78b2f546f789 ceph: flush mdlog before umounting
    d94ba7b3b7e7 ceph: make iterate_sessions a global symbol
    9ac038d3c2f2 ceph: make ceph_create_session_msg a global symbol
    8382cdf0ab5d usb: cdns3: Add support for DRD CDNSP
    57112da86b1b mmc: sdhci-brcmstb: Fix SDHCI_RESET_ALL for CQHCI
    b5d770977b18 mmc: sdhci-brcmstb: Enable Clock Gating to save power
    049194538cb8 mmc: sdhci-brcmstb: Re-organize flags
    fbe955be268b nios2: add FORCE for vmlinuz.gz
    c0a9c9973d24 init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash
    456e895fd0b8 iio: core: Fix entry not deleted when iio_register_sw_trigger_type() fails
    fa9efcbfbf77 iio: light: apds9960: fix wrong register for gesture gain
    bd1b8041c2f6 arm64: dts: rockchip: lower rk3399-puma-haikou SD controller clock frequency
    86ba9c859577 ext4: fix use-after-free in ext4_ext_shift_extents
    350e98a08af1 usb: dwc3: exynos: Fix remove() function
    d21d26e65b5f lib/vdso: use "grep -E" instead of "egrep"
    c0cf8bc259e0 net: enetc: preserve TX ring priority across reconfiguration
    de4dd4f9b3f6 net: enetc: cache accesses to &priv->si->hw
    1f080b8caae9 net: enetc: manage ENETC_F_QBV in priv->active_offloads only when enabled
    1d840c5d673d s390/crashdump: fix TOD programmable field size
    11052f118879 net: thunderx: Fix the ACPI memory leak
    b034fe2a0800 nfc: st-nci: fix memory leaks in EVT_TRANSACTION
    e14583073fc0 nfc: st-nci: fix incorrect validating logic in EVT_TRANSACTION
    9cc863d52399 arcnet: fix potential memory leak in com20020_probe()
    4d2be0cf27d9 net: arcnet: Fix RESET flag handling
    e61b00374a6e s390/dasd: fix no record found for raw_track_access
    aeebb0749972 ipv4: Fix error return code in fib_table_insert()
    c0af4d005a26 dccp/tcp: Reset saddr on failure after inet6?_hash_connect().
    b8e494240e69 netfilter: flowtable_offload: add missing locking
    af9de5cdcb10 dma-buf: fix racing conflict of dma_heap_add()
    c40b76dfa7e4 bnx2x: fix pci device refcount leak in bnx2x_vf_is_pcie_pending()
    f81e9c0510b0 regulator: twl6030: re-add TWL6032_SUBCLASS
    32b944b9c4b2 NFC: nci: fix memory leak in nci_rx_data_packet()
    68a7aec3f4b5 net: sched: allow act_ct to be built without NF_NAT
    8e2664e12bc6 sfc: fix potential memleak in __ef100_hard_start_xmit()
    6b638a16ead1 xfrm: Fix ignored return value in xfrm6_init()
    c7788361a645 tipc: check skb_linearize() return value in tipc_disc_rcv()
    4058e3b74ab3 tipc: add an extra conn_get in tipc_conn_alloc
    e87a077d09c0 tipc: set con sock in tipc_conn_alloc
    891daa95b0bb net/mlx5: Fix handling of entry refcount when command is not issued to FW
    e06ff9f8fedf net/mlx5: Fix FW tracer timestamp calculation
    5689eba90a20 netfilter: ipset: regression in ip_set_hash_ip.c
    e62e62ea912a netfilter: ipset: Limit the maximal range of consecutive elements to add/delete
    8dca384970ac Drivers: hv: vmbus: fix possible memory leak in vmbus_device_register()
    909186cf34de Drivers: hv: vmbus: fix double free in the error path of vmbus_add_channel_work()
    f42802e14a87 macsec: Fix invalid error code set
    72be055615e0 nfp: add port from netdev validation for EEPROM access
    ce41e03cacaa nfp: fill splittable of devlink_port_attrs correctly
    0b553ded3450 net: pch_gbe: fix pci device refcount leak while module exiting
    2c59ef9ab63d net/qla3xxx: fix potential memleak in ql3xxx_send()
    a24d5f6c8b7b net/mlx4: Check retval of mlx4_bitmap_init
    da86a63479e5 net: ethernet: mtk_eth_soc: fix error handling in mtk_open()
    756534f7cf53 ARM: dts: imx6q-prti6q: Fix ref/tcxo-clock-frequency properties
    290a71ff721b ARM: mxs: fix memory leak in mxs_machine_init()
    5c97af75f53c netfilter: conntrack: Fix data-races around ct mark
    459332f8dbfb 9p/fd: fix issue of list_del corruption in p9_fd_cancel()
    26bb8f6aaae3 net: pch_gbe: fix potential memleak in pch_gbe_tx_queue()
    398a860a4429 nfc/nci: fix race with opening and closing
    3535c632e6d1 rxrpc: Fix race between conn bundle lookup and bundle removal [ZDI-CAN-15975]
    23c03ee0eec4 rxrpc: Use refcount_t rather than atomic_t
    bddde342c62e rxrpc: Allow list of in-use local UDP endpoints to be viewed in /proc
    a2d5dba2fc69 net: liquidio: simplify if expression
    8124a02e1717 ARM: dts: at91: sam9g20ek: enable udc vbus gpio pinctrl
    b547bf71fa7e tee: optee: fix possible memory leak in optee_register_device()
    b76c5a99f44a bus: sunxi-rsb: Support atomic transfers
    0c059b7d2a6b regulator: core: fix UAF in destroy_regulator()
    fcb2d286362b spi: dw-dma: decrease reference count in dw_spi_dma_init_mfld()
    0b6441abfa5d regulator: core: fix kobject release warning and memory leak in regulator_register()
    26d3d3ffa82b scsi: storvsc: Fix handling of srb_status and capacity change events
    c34db0d6b88b ASoC: soc-pcm: Don't zero TDM masks in __soc_pcm_open()
    4f6c7344ab26 ASoC: sgtl5000: Reset the CHIP_CLK_CTRL reg on remove
    164a5b50d104 ASoC: hdac_hda: fix hda pcm buffer overflow issue
    7cfb4b8579d3 ARM: dts: am335x-pcm-953: Define fixed regulators in root node
    b7000254c125 af_key: Fix send_acquire race with pfkey_register
    51969d679ba4 xfrm: replay: Fix ESN wrap around for GSO
    497653f6d239 xfrm: fix "disable_policy" on ipv4 early demux
    836bbdfcf8ef MIPS: pic32: treat port as signed integer
    c0bb600f0768 RISC-V: vdso: Do not add missing symbols to version section in linker script
    81cc6d8400ac arm64/syscall: Include asm/ptrace.h in syscall_wrapper header.
    fa5f2c72d39f block, bfq: fix null pointer dereference in bfq_bio_bfqg()
    d29bde868945 drm: panel-orientation-quirks: Add quirk for Acer Switch V 10 (SW5-017)
    f7ce6fb04e04 scsi: scsi_debug: Make the READ CAPACITY response compliant with ZBC
    2574903ee260 scsi: ibmvfc: Avoid path failures during live migration
    7fc62181c1d4 platform/x86: touchscreen_dmi: Add info for the RCA Cambio W101 v2 2-in-1
    f54a11b6bf82 Revert "net: macsec: report real_dev features when HW offloading is enabled"
    f4b8c0710ab6 selftests/bpf: Add verifier test for release_reference()
    361a16509898 spi: stm32: fix stm32_spi_prepare_mbr() that halves spi clk for every run
    2c1ca23555ed wifi: mac80211: Fix ack frame idr leak when mesh has no route
    8d39913158ad wifi: airo: do not assign -1 to unsigned char
    8552e6048ec9 audit: fix undefined behavior in bit shift for AUDIT_BIT
    1c9eb641d13e riscv: dts: sifive unleashed: Add PWM controlled LEDs
    92ae6facd129 wifi: mac80211_hwsim: fix debugfs attribute ps with rc table support
    2fcc593b5047 wifi: mac80211: fix memory free error when registering wiphy fail
    044bc6d3c2c0 ceph: avoid putting the realm twice when decoding snaps fails
    d43219bb33d5 ceph: do not update snapshot context when there is no new snapshot
    49c71b68141e iio: pressure: ms5611: fixed value compensation bug
    879139bc7afb iio: ms5611: Simplify IO callback parameters
    80c825e1e33b nvme-pci: add NVME_QUIRK_BOGUS_NID for Micron Nitro
    f4066fb91021 nvme: add a bogus subsystem NQN quirk for Micron MTFDKBA2T0TFH
    4f0cea018e03 drm/display: Don't assume dual mode adaptors support i2c sub-addressing
    347f1793b573 bridge: switchdev: Fix memory leaks when changing VLAN protocol
    89a7f155e6b2 bridge: switchdev: Notify about VLAN protocol changes
    f5cbd86ebf28 ata: libata-core: do not issue non-internal commands once EH is pending
    4034d06a4dbe ata: libata-scsi: simplify __ata_scsi_queuecmd()
    03aabcb88aee scsi: scsi_transport_sas: Fix error handling in sas_phy_add()
    6d46ef50b123 Linux 5.10.156
    7be134eb691f Revert "net: broadcom: Fix BCMGENET Kconfig"
    957732a09c38 ntfs: check overflow when iterating ATTR_RECORDs
    6322dda48334 ntfs: fix out-of-bounds read in ntfs_attr_find()
    b825bfbbaafb ntfs: fix use-after-free in ntfs_attr_find()
    294ef12dccc6 mm: fs: initialize fsdata passed to write_begin/write_end interface
    a8e2fc8f7b41 9p/trans_fd: always use O_NONBLOCK read/write
    a5da76df467a gfs2: Switch from strlcpy to strscpy
    5fa30be7ba81 gfs2: Check sb_bsize_shift after reading superblock
    f14858bc77c5 9p: trans_fd/p9_conn_cancel: drop client lock earlier
    4154b6afa2bd kcm: close race conditions on sk_receive_queue
    7deb7a9d33e4 kcm: avoid potential race in kcm_tx_work
    35309be06b6f tcp: cdg: allow tcp_cdg_release() to be called multiple times
    e929ec98c0c3 macvlan: enforce a consistent minimal mtu
    95ebea5a15e4 uapi/linux/stddef.h: Add include guards
    3f25add5ecf8 Input: i8042 - fix leaking of platform device on module removal
    7d606ae1abcc kprobes: Skip clearing aggrprobe's post_handler in kprobe-on-ftrace case
    89ece5ff7dbe scsi: scsi_debug: Fix possible UAF in sdebug_add_host_helper()
    75205f1b47a8 scsi: target: tcm_loop: Fix possible name leak in tcm_loop_setup_hba_bus()
    6e9334436d78 net: use struct_group to copy ip/ipv6 header addresses
    9fd7bdaffe0e stddef: Introduce struct_group() helper macro
    47c3bdd95505 usbnet: smsc95xx: Fix deadlock on runtime resume
    8208c266fe27 ring-buffer: Include dropped pages in counting dirty patches
    36b5095b07ac net: fix a concurrency bug in l2tp_tunnel_register()
    023435a095d2 nvme: ensure subsystem reset is single threaded
    b9a5ecf24180 nvme: restrict management ioctls to admin
    5e2f14d77223 perf/x86/intel/pt: Fix sampling using single range output
    62634b43d3c4 misc/vmw_vmci: fix an infoleak in vmci_host_do_receive_datagram()
    c1eb46a65b09 docs: update mediator contact information in CoC doc
    4423866d31a0 mmc: sdhci-pci: Fix possible memory leak caused by missing pci_dev_put()
    440653a180f5 mmc: sdhci-pci-o2micro: fix card detect fail issue caused by CD# debounce timeout
    8e70b1413178 mmc: core: properly select voltage range without power cycle
    05b0f6624dda firmware: coreboot: Register bus in module init
    deda86a0d84d iommu/vt-d: Set SRE bit only when hardware has SRS cap
    d2c7d8f58e9c scsi: zfcp: Fix double free of FSF request when qdio send fails
    db744288af73 maccess: Fix writing offset in case of fault in strncpy_from_kernel_nofault()
    24cc679abbf3 Input: iforce - invert valid length check when fetching device IDs
    5f4611fe012f serial: 8250_lpss: Configure DMA also w/o DMA filter
    8679087e9357 serial: 8250: Flush DMA Rx on RLSI
    a5eaad87bfca serial: 8250: Fall back to non-DMA Rx if IIR_RDI occurs
    f59f5a269ca5 dm ioctl: fix misbehavior if list_versions races with module loading
    67a75a9480fc iio: pressure: ms5611: changed hardcoded SPI speed to value limited
    d95b85c5084a iio: adc: mp2629: fix potential array out of bound access
    46b8bc62c5ea iio: adc: mp2629: fix wrong comparison of channel
    8dddf2699da2 iio: trigger: sysfs: fix possible memory leak in iio_sysfs_trig_init()
    85d2a8b287a8 iio: adc: at91_adc: fix possible memory leak in at91_adc_allocate_trigger()
    85cc1a2fd8bf usb: typec: mux: Enter safe mode only when pins need to be reconfigured
    efaab055201b usb: chipidea: fix deadlock in ci_otg_del_timer
    143ba5c2d2a7 usb: add NO_LPM quirk for Realforce 87U Keyboard
    249cef723fee USB: serial: option: add Fibocom FM160 0x0111 composition
    5c44c60358da USB: serial: option: add u-blox LARA-L6 modem
    0e88a3cfa6ed USB: serial: option: add u-blox LARA-R6 00B modem
    de707957d9d4 USB: serial: option: remove old LARA-R6 PID
    878227a3ddb2 USB: serial: option: add Sierra Wireless EM9191
    25c652811ddd USB: bcma: Make GPIO explicitly optional
    eb3af3ea5bca speakup: fix a segfault caused by switching consoles
    8cbaf4ed530e slimbus: stream: correct presence rate frequencies
    15155f7c0e30 Revert "usb: dwc3: disable USB core PHY management"
    100d1e53bb3b ALSA: hda/realtek: Fix the speaker output on Samsung Galaxy Book Pro 360
    c7dcc8948279 ALSA: hda/realtek: fix speakers for Samsung Galaxy Book Pro
    a80369c8ca50 ALSA: usb-audio: Drop snd_BUG_ON() from snd_usbmidi_output_open()
    28a54854a959 tracing: kprobe: Fix potential null-ptr-deref on trace_array in kprobe_event_gen_test_exit()
    bb70fcae4115 tracing: kprobe: Fix potential null-ptr-deref on trace_event_file in kprobe_event_gen_test_exit()
    315b149f0822 tracing: Fix wild-memory-access in register_synth_event()
    65ba7e7c2411 tracing: Fix memory leak in test_gen_synth_cmd() and test_empty_synth_event()
    5d4cc7bc1a8d tracing/ring-buffer: Have polling block on watermark
    5fdebbeca5db ring_buffer: Do not deactivate non-existant pages
    6a14828cadda ftrace: Fix null pointer dereference in ftrace_add_mod()
    6ed60c60ec90 ftrace: Optimize the allocation for mcount entries
    9569eed79bc0 ftrace: Fix the possible incorrect kernel message
    5fc19c831320 cifs: add check for returning value of SMB2_set_info_init
    0aeb0de528ec net: thunderbolt: Fix error handling in tbnet_init()
    e13ef43813eb cifs: Fix wrong return value checking when GETFLAGS
    9f00da9c866d net/x25: Fix skb leak in x25_lapb_receive_frame()
    94822d23310a net: ag71xx: call phylink_disconnect_phy if ag71xx_hw_enable() fail in ag71xx_open()
    3aeb13bc3db2 cifs: add check for returning value of SMB2_close_init
    c24013273ed4 platform/x86/intel: pmc: Don't unconditionally attach Intel PMC when virtualized
    9ed51414aef6 drbd: use after free in drbd_create_device()
    6b23a4b25204 net: ena: Fix error handling in ena_init()
    2d5a49550135 net: ionic: Fix error handling in ionic_init_module()
    bb9924a6edd9 xen/pcpu: fix possible memory leak in register_pcpu()
    d6a561bd4c53 bnxt_en: Remove debugfs when pci_register_driver failed
    389738f5dbc5 net: caif: fix double disconnect client in chnl_net_open()
    fb5ee1560bab net: macvlan: Use built-in RCU list checking
    709aa1f73d3e mISDN: fix misuse of put_device() in mISDN_register_device()
    417f2d2edf30 net: liquidio: release resources when liquidio driver open failed
    4cba73f2d6fc net: hinic: Fix error handling in hinic_module_init()
    083a2c9ef82e mISDN: fix possible memory leak in mISDN_dsp_element_register()
    6b23993d5bef net: bgmac: Drop free_netdev() from bgmac_enet_remove()
    1f6a73b25dab bpf: Initialize same number of free nodes for each pcpu_freelist
    ef2ac07ab831 ata: libata-transport: fix error handling in ata_tdev_add()
    7377a14598f6 ata: libata-transport: fix error handling in ata_tlink_add()
    b5362dc1634d ata: libata-transport: fix error handling in ata_tport_add()
    ac471468f7c1 ata: libata-transport: fix double ata_host_put() in ata_tport_add()
    ac4f404c250b arm64: dts: imx8mn: Fix NAND controller size-cells
    30ece7dbeeca arm64: dts: imx8mm: Fix NAND controller size-cells
    f68a9efd7895 ARM: dts: imx7: Fix NAND controller size-cells
    1d160dfb3fdf drm: Fix potential null-ptr-deref in drm_vblank_destroy_worker()
    c47a823ea186 drm/drv: Fix potential memory leak in drm_dev_init()
    c776a49d099c drm/panel: simple: set bpc field for logic technologies displays
    777430aa4ddc pinctrl: devicetree: fix null pointer dereferencing in pinctrl_dt_to_map
    bce3e6fe8ba7 parport_pc: Avoid FIFO port location truncation
    a4b5423f88a1 siox: fix possible memory leak in siox_device_add()
    0679f571d3de arm64: Fix bit-shifting UB in the MIDR_CPU_MODEL() macro
    58636b5ff3f6 block: sed-opal: kmalloc the cmd/resp buffers
    e27458b18b35 sctp: clear out_curr if all frag chunks of current msg are pruned
    0b4c259b63ea sctp: remove the unnecessary sinfo_stream check in sctp_prsctp_prune_unsent
    7360e7c29d27 ASoC: soc-utils: Remove __exit for snd_soc_util_exit()
    e60f37a1d379 bpf, test_run: Fix alignment problem in bpf_prog_test_run_skb()
    b8fe1a5aa733 tty: n_gsm: fix sleep-in-atomic-context bug in gsm_control_send
    0a3160f4ffc7 serial: imx: Add missing .thaw_noirq hook
    7e1f908e65c5 serial: 8250: omap: Flush PM QOS work on remove
    d833cba201ad serial: 8250: omap: Fix unpaired pm_runtime_put_sync() in omap8250_remove()
    b0b6ea651ecf serial: 8250_omap: remove wait loop from Errata i202 workaround
    f14c312c2189 serial: 8250: omap: Fix missing PM runtime calls for omap8250_set_mctrl()
    85cdbf04b435 serial: 8250: Remove serial_rs485 sanitization from em485
    f5dedad4059b ASoC: tas2764: Fix set_tdm_slot in case of single slot
    9e82d78fbe54 ASoC: tas2770: Fix set_tdm_slot in case of single slot
    8d21554ec768 ASoC: core: Fix use-after-free in snd_soc_exit()
    38ca9bd336c8 spi: stm32: Print summary 'callbacks suppressed' message
    a180da5564b5 drm/amdgpu: disable BACO on special BEIGE_GOBY card
    f3adf0adf306 drm/amd/pm: disable BACO entry/exit completely on several sienna cichlid cards
    b0faeff69a0a drm/amd/pm: Read BIF STRAP also for BACO check
    6958556285ec drm/amd/pm: support power source switch on Sienna Cichlid
    7daab001a6f6 mmc: sdhci-esdhc-imx: use the correct host caps for MMC_CAP_8_BIT_DATA
    65ac4d1807d2 spi: intel: Use correct mask for flash and protected regions
    23793518a752 mtd: spi-nor: intel-spi: Disable write protection only if asked
    a326fffdc78b ALSA: hda/realtek: fix speakers and micmute on HP 855 G8
    24839d027c83 ASoC: codecs: jz4725b: Fix spelling mistake "Sourc" -> "Source", "Routee" -> "Route"
    bd487932408d Bluetooth: L2CAP: Fix l2cap_global_chan_by_psm
    ce75e9085988 btrfs: remove pointless and double ulist frees in error paths of qgroup tests
    16743c4bf3ef drm/imx: imx-tve: Fix return type of imx_tve_connector_mode_valid
    df2747f295ac i2c: i801: add lis3lv02d's I2C address for Vostro 5568
    959cb0fd6951 i2c: tegra: Allocate DMA memory for DMA engine
    6cb657722e37 NFSv4: Retry LOCK on OLD_STATEID during delegation return
    f0187227e2b8 drm/amd/display: Remove wrong pipe control lock
    bb3edbd09287 ASoC: rt1308-sdw: add the default value of some registers
    b1619f030776 selftests/intel_pstate: fix build for ARCH=x86_64
    fdf680760629 selftests/futex: fix build for clang
    c1f0defecbdc ASoC: codecs: jz4725b: fix capture selector naming
    aeb7e8bc0d3e ASoC: codecs: jz4725b: use right control for Capture Volume
    c87945c17385 ASoC: codecs: jz4725b: fix reported volume for Master ctl
    9aae00961ab3 ASoC: codecs: jz4725b: add missed Line In power control bit
    0b4d650f905c spi: intel: Fix the offset to get the 64K erase opcode
    6910e7279f5d ASoC: wm8962: Add an event handler for TEMP_HP and TEMP_SPK
    c7432616f6aa ASoC: mt6660: Keep the pm_runtime enables before component stuff in mt6660_i2c_probe
    a47606064cc0 ASoC: wm8997: Revert "ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe"
    f8f254c8b506 ASoC: wm5110: Revert "ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe"
    c73aa2cc4156 ASoC: wm5102: Revert "ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe"
    41217963b1d9 Linux 5.10.155
    0f544353fec8 io_uring: kill goto error handling in io_sqpoll_wait_sq()
    154d744fbefc x86/cpu: Restore AMD's DE_CFG MSR after resume
    e7294b01de40 mmc: sdhci-esdhc-imx: Convert the driver to DT-only
    534762e261c8 net: tun: call napi_schedule_prep() to ensure we own a napi
    367bc0fa988f dmaengine: at_hdmac: Check return code of dma_async_device_register
    85f97c97efc5 dmaengine: at_hdmac: Fix impossible condition
    f53a233eaad6 dmaengine: at_hdmac: Don't allow CPU to reorder channel enable
    f4512855223c dmaengine: at_hdmac: Fix completion of unissued descriptor in case of errors
    6be4ab08c863 dmaengine: at_hdmac: Fix descriptor handling when issuing it to hardware
    a35dd5dd98b6 dmaengine: at_hdmac: Fix concurrency over the active list
    0f603bf553a7 dmaengine: at_hdmac: Free the memset buf without holding the chan lock
    7f07cecc7411 dmaengine: at_hdmac: Fix concurrency over descriptor
    1582cc3b4805 dmaengine: at_hdmac: Fix concurrency problems by removing atc_complete_all()
    9b69060a725d dmaengine: at_hdmac: Protect atchan->status with the channel lock
    ee356822618e dmaengine: at_hdmac: Do not call the complete callback on device_terminate_all
    7078e935b410 dmaengine: at_hdmac: Fix premature completion of desc in issue_pending
    ad4cbe8e9c3a dmaengine: at_hdmac: Start transfer for cyclic channels in issue_pending
    24f9e93e506a dmaengine: at_hdmac: Don't start transactions at tx_submit level
    4b51cce72ab7 dmaengine: at_hdmac: Fix at_lli struct definition
    d37dfb9357e9 cert host tools: Stop complaining about deprecated OpenSSL functions
    f8e0edeaa0f2 can: j1939: j1939_send_one(): fix missing CAN header initialization
    0b692d41ee5c mm/memremap.c: map FS_DAX device memory as decrypted
    03f9582a6a2e udf: Fix a slab-out-of-bounds write bug in udf_find_entry()
    4ea3aa3b983b mms: sdhci-esdhc-imx: Fix SDHCI_RESET_ALL for CQHCI
    9c0accfa5a35 btrfs: selftests: fix wrong error check in btrfs_free_dummy_root()
    8fa0c22ef824 platform/x86: hp_wmi: Fix rfkill causing soft blocked wifi
    b5ee579fcb14 drm/i915/dmabuf: fix sg_table handling in map_dma_buf
    4feedde5486c nilfs2: fix use-after-free bug of ns_writer on remount
    1d4ff7306209 nilfs2: fix deadlock in nilfs_count_free_blocks()
    344ddbd688d8 ata: libata-scsi: fix SYNCHRONIZE CACHE (16) command failure
    516f9f23008b vmlinux.lds.h: Fix placement of '.data..decrypted' section
    f6896fb69d50 ALSA: usb-audio: Add DSD support for Accuphase DAC-60
    2032c2d32b2a ALSA: usb-audio: Add quirk entry for M-Audio Micro
    a414a6d6ef3c ALSA: hda/realtek: Add Positivo C6300 model quirk
    3a79f9568de0 ALSA: hda: fix potential memleak in 'add_widget_node'
    380d64168da4 ALSA: hda/ca0132: add quirk for EVGA Z390 DARK
    181cfff57bdc ALSA: hda/hdmi - enable runtime pm for more AMD display audio
    ea6787e482ad mmc: sdhci-tegra: Fix SDHCI_RESET_ALL for CQHCI
    0a8d4531a0d5 mmc: sdhci_am654: Fix SDHCI_RESET_ALL for CQHCI
    3f558930add7 mmc: sdhci-of-arasan: Fix SDHCI_RESET_ALL for CQHCI
    b55e64d0a3a3 mmc: cqhci: Provide helper for resetting both SDHCI and CQHCI
    4631cb040645 MIPS: jump_label: Fix compat branch range check
    475fd3991a0d arm64: efi: Fix handling of misaligned runtime regions and drop warning
    94ab8f88feb7 riscv: fix reserved memory setup
    0cf9cb061493 riscv: Separate memory init from paging init
    d7716240bca5 riscv: Enable CMA support
    ecf78af5141f riscv: vdso: fix build with llvm
    e56d18a976dd riscv: process: fix kernel info leakage
    956e0216a199 net: macvlan: fix memory leaks of macvlan_common_newlink
    59ec132386a0 ethernet: tundra: free irq when alloc ring failed in tsi108_open()
    dd7beaec8b48 net: mv643xx_eth: disable napi when init rxq or txq failed in mv643xx_eth_open()
    56d3b5531bf6 ethernet: s2io: disable napi when start nic failed in s2io_card_up()
    05b222843457 net: atlantic: macsec: clear encryption keys from the stack
    1a4e495edfe2 net: phy: mscc: macsec: clear encryption keys when freeing a flow
    4ad684ba028c cxgb4vf: shut down the adapter when t4vf_update_port_info() failed in cxgb4vf_open()
    38aa7ed8c2c3 net: cxgb3_main: disable napi when bind qsets failed in cxgb_up()
    fd52dd2d6e2f net: cpsw: disable napi in cpsw_ndo_open()
    3b27e20601ab net/mlx5e: E-Switch, Fix comparing termination table instance
    eb6fa0ac2a9c net/mlx5: Allow async trigger completion execution on single CPU systems
    bdd282bba72d net: nixge: disable napi when enable interrupts failed in nixge_open()
    5333cf1b7f68 net: marvell: prestera: fix memory leak in prestera_rxtx_switch_init()
    cf4853880e24 perf stat: Fix printing os->prefix in CSV metrics output
    3a4a3c3b1fe6 drivers: net: xgene: disable napi when register irq failed in xgene_enet_open()
    0b7ee3d50f32 dmaengine: mv_xor_v2: Fix a resource leak in mv_xor_v2_remove()
    6e2ffae69d17 dmaengine: pxa_dma: use platform_get_irq_optional
    f31dd1585809 tipc: fix the msg->req tlv len check in tipc_nl_compat_name_table_dump_header
    fbb4e8e6dc7b net: broadcom: Fix BCMGENET Kconfig
    cb6d639bb1ef net: stmmac: dwmac-meson8b: fix meson8b_devm_clk_prepare_enable()
    d68fa77ee3d0 can: af_can: fix NULL pointer dereference in can_rx_register()
    a033b86c7f76 ipv6: addrlabel: fix infoleak when sending struct ifaddrlblmsg to network
    02f8dfee7580 tcp: prohibit TCP_REPAIR_OPTIONS if data was already sent
    f3aa8a7d9550 drm/vc4: Fix missing platform_unregister_drivers() call in vc4_drm_register()
    bcb3bb10695f hamradio: fix issue of dev reference count leakage in bpq_device_event()
    bc4591a86b8f net: lapbether: fix issue of dev reference count leakage in lapbeth_device_event()
    2bf8b1c111ff KVM: s390: pv: don't allow userspace to set the clock under PV
    a60cc64db72f KVM: s390x: fix SCK locking
    fcbd2b336834 capabilities: fix undefined behavior in bit shift for CAP_TO_MASK
    8aae24b0ed76 net: fman: Unregister ethernet device on removal
    e2c5ee3b628f bnxt_en: fix potentially incorrect return value for ndo_rx_flow_steer
    38147073c96d bnxt_en: Fix possible crash in bnxt_hwrm_set_coal()
    3401f964028a net: tun: Fix memory leaks of napi_get_frags
    adaa0f180de5 macsec: clear encryption keys from the stack after setting up offload
    9dc7503bae33 macsec: fix detection of RXSCs when toggling offloading
    7f4456f0119b macsec: fix secy->n_rx_sc accounting
    3b05d9073ae2 macsec: delete new rxsc when offload fails
    50868de7dc4e net: gso: fix panic on frag_list with mixed head alloc types
    cedd4f01f67b bpf: Fix wrong reg type conversion in release_reference()
    9069db2579e9 bpf: Add helper macro bpf_for_each_reg_in_vstate
    95b6ec733752 bpf: Support for pointers beyond pkt_end.
    8597b59e3d22 HID: hyperv: fix possible memory leak in mousevsc_probe()
    8c80b2fca411 bpftool: Fix NULL pointer dereference when pin {PROG, MAP, LINK} without FILE
    cc21dc48a78c bpf, sockmap: Fix the sk->sk_forward_alloc warning of sk_stream_kill_queues
    e1e12180321f wifi: cfg80211: fix memory leak in query_regdb_file()
    914cb94e738b wifi: cfg80211: silence a sparse RCU warning
    72ea2fc29962 phy: stm32: fix an error code in probe
    925bf1ba7604 hwspinlock: qcom: correct MMIO max register for newer SoCs
    76eba54f0ddf fuse: fix readdir cache race

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index c2f5df0878..4391c45fa9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "200dde5f2bbc51223a23c3c9ae19b74a3792305c"
-SRCREV_meta ?= "71ac1dd35ef4f83a56462757380a83f501a5e1ad"
+SRCREV_machine ?= "609783e001b7bddeb8d66711b1a0617d6d40557e"
+SRCREV_meta ?= "a4d33186b2f3b4c22b1fc57db5f161168863080f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.154"
+LINUX_VERSION ?= "5.10.160"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index d1bcc972ce..e7565e1cb8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.154"
+LINUX_VERSION ?= "5.10.160"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "0099684b19d9c16d500a02b35ad898c0a9dc3106"
-SRCREV_machine ?= "f76f3607e10bfc8f531d7efabf32ea34049f91ae"
-SRCREV_meta ?= "71ac1dd35ef4f83a56462757380a83f501a5e1ad"
+SRCREV_machine:qemuarm ?= "16e60c5bf21350952be933d49fde64889174b5cf"
+SRCREV_machine ?= "fb5efade4aa75991204b037c02c0b50f30fa1c18"
+SRCREV_meta ?= "a4d33186b2f3b4c22b1fc57db5f161168863080f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 9690e9012d..c37b7f63c8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "181ab6e2f032db917d0a37752abc7d6512f9f9d9"
-SRCREV_machine:qemuarm64 ?= "4f22fcb495ad1cbf4828cce8bb14b03880faa3a5"
-SRCREV_machine:qemumips ?= "da60efd65e9442fb70c902e9f9d4656933948ed3"
-SRCREV_machine:qemuppc ?= "2dc9ff9466c872180d0a64de8995109dc78e5394"
-SRCREV_machine:qemuriscv64 ?= "e37d01c98215ba1b8fb714d931beee6e60f8ffa2"
-SRCREV_machine:qemuriscv32 ?= "e37d01c98215ba1b8fb714d931beee6e60f8ffa2"
-SRCREV_machine:qemux86 ?= "e37d01c98215ba1b8fb714d931beee6e60f8ffa2"
-SRCREV_machine:qemux86-64 ?= "e37d01c98215ba1b8fb714d931beee6e60f8ffa2"
-SRCREV_machine:qemumips64 ?= "f150eeba3fb02ca54b8d174b880c77a8ca425154"
-SRCREV_machine ?= "e37d01c98215ba1b8fb714d931beee6e60f8ffa2"
-SRCREV_meta ?= "71ac1dd35ef4f83a56462757380a83f501a5e1ad"
+SRCREV_machine:qemuarm ?= "2bb2a540cf1d7af197613bd84e4ebe676dbcebb3"
+SRCREV_machine:qemuarm64 ?= "a985b377a910a67793055f0037899488f012bdbb"
+SRCREV_machine:qemumips ?= "19ba1e5a948b1ad4e12da79c243257308e40927f"
+SRCREV_machine:qemuppc ?= "7eb969488b7e00cdd5971ff0f89c85bdef9a6922"
+SRCREV_machine:qemuriscv64 ?= "56918b5f8355ccd5a9bc51ed4b058d4d92fab15b"
+SRCREV_machine:qemuriscv32 ?= "56918b5f8355ccd5a9bc51ed4b058d4d92fab15b"
+SRCREV_machine:qemux86 ?= "56918b5f8355ccd5a9bc51ed4b058d4d92fab15b"
+SRCREV_machine:qemux86-64 ?= "56918b5f8355ccd5a9bc51ed4b058d4d92fab15b"
+SRCREV_machine:qemumips64 ?= "be75e1ae0d7d66ed258fc648a82d09ac996d1aee"
+SRCREV_machine ?= "56918b5f8355ccd5a9bc51ed4b058d4d92fab15b"
+SRCREV_meta ?= "a4d33186b2f3b4c22b1fc57db5f161168863080f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.154"
+LINUX_VERSION ?= "5.10.160"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


