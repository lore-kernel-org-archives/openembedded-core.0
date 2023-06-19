Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE90EB64D8
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 02:56:10 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.37.1687143367347858674
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 19:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=UXQKr3vU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6b465e54f3fso1133575a34.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 19:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687143366; x=1689735366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9lvuWxlvCLAEgl9HbQJwyX10y2MhpZITdzHqZJ0UCY=;
        b=UXQKr3vUmuxQ8OyCBTR8C6RCNCNPFsT2ujqCcVOU2YEm0deuKkkoSpD3yO0SbRxGoy
         9p3FEPT/JQGt2HPEpAu1WpuuOK/Ji/JDerE4kvbWc30aVZC2PF4bRGh+DtxaxEm2p8Md
         73G0Mj14E2LZ+g6ezeGI4qXgMCCa1U9ee/FDN42BP2RBZcnunS2hNu6PoWLhHz3Ui752
         OI6ei0H+2WC2Rd/CoF3hyWFF+mkjooQ4jfWUXIt9Qd4E8aWgQiziXzGsoQKWBB6AMUYk
         TPDUT7sJqnoWUOtUQkQ5jRapwf6/Zk+6kZZir3llFUSnQznvwJjv97UgWHZ9tRZJpOnC
         UA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687143366; x=1689735366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9lvuWxlvCLAEgl9HbQJwyX10y2MhpZITdzHqZJ0UCY=;
        b=Q2l0kzKnp7hedWBF5XLr+cdRPQkGQg0DyrlSx/bzLhpo2SZ06McrQrM/2Ra4ceRDN+
         uEIg3Xia1FVcrvnLw6sPBLC3Dm+O4JHCdFgy31CRXRrPW+SzXo6U8V0iaeAZBgQt6+i6
         Qg44kGH7Lq3yGU5v3Ip3VJCs6KR0dY4OT0oU7q9Sx0yNrHe/WKUHicT92XgBDEe8WzE/
         ZVB7TXu0v5nvXhD+tOsxH6Ep4DXOTTYQ6xZ5m0UtFO5OCrGnW2K+U/LT3TZPhe763mpO
         FDAii5YvOiv63E37Yl3wBbNX4q43TDW9VDSsiWOya6WhrqPJb+SlDpCECJovtk6ZApQl
         izHA==
X-Gm-Message-State: AC+VfDxfpkhp2FXn9X3w/shXZiWKoA5CF3PltRBQ2r/GHK9ih1Na8paN
	p8FRxxHnVKj0h2ESX4fSR4FrQJMZuzZoxAnXqFs=
X-Google-Smtp-Source: ACHHUZ4w51vynpdlvXs2ZtXBUjN2ztfhyEEnUddS8pAbJwNi1eLNvHQ3EF8lDRpi2crOs8QQNvj3tQ==
X-Received: by 2002:a05:6359:62a:b0:12f:91d6:3234 with SMTP id eh42-20020a056359062a00b0012f91d63234mr2533757rwb.14.1687143365519;
        Sun, 18 Jun 2023 19:56:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0062dba4e4706sm16611481pfi.191.2023.06.18.19.56.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 19:56:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/18] linux-yocto/5.15: update to v5.15.111
Date: Sun, 18 Jun 2023 16:55:32 -1000
Message-Id: <ea29961df7334f4df7d19ede2a955fadb64fdf0e.1687143192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687143192.git.steve@sakoman.com>
References: <cover.1687143192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 02:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183079

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    b0ece631f84a Linux 5.15.111
    0a008c5098d8 sched: Fix DEBUG && !SCHEDSTATS warn
    21c2a454486d netfilter: nf_tables: deactivate anonymous set from preparation phase
    aa6ff950f875 arm64: dts: qcom: sdm845: correct dynamic power coefficients - again
    2931ed45bfe3 sound/oss/dmasound: fix 'dmasound_setup' defined but not used
    503e554782c9 debugobject: Ensure pool refill (again)
    6b84832966a0 perf intel-pt: Fix CYC timestamps after standalone CBR
    06106efa20f7 perf auxtrace: Fix address filter entire kernel size
    11c6fb35df5c dm: don't lock fs when the map is NULL in process of resume
    e11765cea205 dm ioctl: fix nested locking in table_clear() to remove deadlock concern
    f76fcb9d43ec dm flakey: fix a crash with invalid table line
    a5d8c6bf58e5 dm integrity: call kmem_cache_destroy() in dm_integrity_init() error path
    56e952ae6d89 dm clone: call kmem_cache_destroy() in dm_clone_init() error path
    f382705d0460 dm verity: fix error handling for check_at_most_once on FEC
    1821a33bb23e ia64: fix an addr to taddr in huge_pte_offset()
    3a57c70e9e92 s390/dasd: fix hanging blockdevice after request requeue
    ed7e8beb201b btrfs: scrub: reject unsupported scrub flags
    14383698c0de scripts/gdb: fix lx-timerlist for Python3
    33383fbe4f01 clk: rockchip: rk3399: allow clk_cifout to force clk_cifout_src to reparent
    e8353dea7d7d wifi: rtl8xxxu: RTL8192EU always needs full init
    384a0dcac2a6 mailbox: zynqmp: Fix typo in IPI documentation
    09206edff007 mailbox: zynqmp: Fix IPI isr handling
    6d1af517817a mtd: core: fix error path for nvmem provider
    8444b46e163a mtd: core: fix nvmem error reporting
    7c253e98685e mtd: core: provide unique name for nvmem device, take two
    68695084077e md/raid10: fix null-ptr-deref in raid10_sync_request
    8d07d9119642 nilfs2: fix infinite loop in nilfs_mdt_get_block()
    13f73ef77baa nilfs2: do not write dirty data after degenerating to read-only
    ab0748f246b7 ALSA: usb-audio: Add quirk for Pioneer DDJ-800
    a87e5b9b4c64 parisc: Fix argument pointer in real64_call_asm()
    f1b4681cfa0a afs: Fix updating of i_size with dv jump from server
    33f302c9bf3e mfd: tqmx86: Correct board names for TQMxE39x
    ce01b75447f6 mfd: tqmx86: Specify IO port register range more precisely
    a23b3b2be0d0 mfd: tqmx86: Do not access I2C_DETECT register through io_base
    388d2578c7d7 thermal/drivers/mediatek: Use devm_of_iomap to avoid resource leak in mtk_thermal_probe
    bdcf9fec87b2 dmaengine: at_xdmac: do not enable all cyclic channels
    a5227b3be869 dmaengine: at_xdmac: Fix race for the tx desc callback
    2b68028d771a dmaengine: at_xdmac: Fix concurrency over chan's completed_cookie
    738a4fdbd157 dmaengine: dw-edma: Fix to enable to issue dma request on DMA processing
    fd6316dec20f dmaengine: dw-edma: Fix to change for continuous transfer
    dd23c11136ff dma: gpi: remove spurious unlock in gpi_ch_init
    dce3bdaee3f2 phy: tegra: xusb: Add missing tegra_xusb_port_unregister for usb2_port and ulpi_port
    1cccf7c5c7f5 pwm: mtk-disp: Configure double buffering before reading in .get_state()
    d2798512fafc pwm: mtk-disp: Disable shadow registers before setting backlight values
    8ffa1cb8bcfa leds: tca6507: Fix error handling of using fwnode_property_read_string
    e63e3a0fc062 dmaengine: mv_xor_v2: Fix an error code.
    332ca024a82e leds: TI_LMU_COMMON: select REGMAP instead of depending on it
    c904a070d7cd pinctrl: renesas: r8a779a0: Remove incorrect AVB[01] pinmux configuration
    40566def189c ext4: fix use-after-free read in ext4_find_extent for bigalloc + inline
    18eb23891aea ext4: fix i_disksize exceeding i_size problem in paritally written case
    3dc3a86b88bd SMB3: Close deferred file handles in case of handle lease break
    0f87e18203bd SMB3: Add missing locks to protect deferred close file list
    b574e73db844 timekeeping: Fix references to nonexistent ktime_get_fast_ns()
    ccfede0a2cb1 openrisc: Properly store r31 to pt_regs on unhandled exceptions
    1c7456aa5d3a clocksource/drivers/davinci: Fix memory leak in davinci_timer_register when init fails
    c87c6d50505b RDMA/mlx5: Use correct device num_ports when modify DC
    d2823237dabc SUNRPC: remove the maximum number of retries in call_bind_status
    c11e44ac1a71 RDMA/mlx5: Fix flow counter query via DEVX
    7acad58049ac Input: raspberrypi-ts - fix refcount leak in rpi_ts_probe
    b6157a9f0fc7 clk: qcom: gcc-sm8350: fix PCIe PIPE clocks handling
    33f9b8de1b00 clk: qcom: regmap: add PHY clock source implementation
    0ccc1a6bac34 NFSv4.1: Always send a RECLAIM_COMPLETE after establishing lease
    a2bd706ab635 IB/hfi1: Fix bugs with non-PAGE_SIZE-end multi-iovec user SDMA requests
    6bbc49661c31 IB/hfi1: Fix SDMA mmu_rb_node not being evicted in LRU order
    00cc21e32ea1 RDMA/srpt: Add a check for valid 'mad_agent' pointer
    03b9d26f33e6 RDMA/cm: Trace icm_send_rej event before the cm state is reset
    30218b769845 clk: qcom: gcc-sm6115: Mark RCGs shared where applicable
    5255051c8f31 RDMA/siw: Remove namespace check from siw_netdev_event()
    48ba87f6e14d clk: add missing of_node_put() in "assigned-clocks" property parsing
    3d7c6f2076f1 power: supply: generic-adc-battery: fix unit scaling
    c58ea97aa94f fs/ntfs3: Fix slab-out-of-bounds read in hdr_delete_de()
    cd7e1d679240 fs/ntfs3: Fix OOB read in indx_insert_into_buffer
    952bbfcedbf8 fs/ntfs3: Add check for kmemdup
    3030f2b9b332 fs/ntfs3: Fix memory leak if ntfs_read_mft failed
    d1faeb14bce3 rtc: meson-vrtc: Use ktime_get_real_ts64() to get the current time
    9911be215572 RDMA/mlx4: Prevent shift wrapping in set_user_sq_size()
    44438a49593a rtc: omap: include header for omap_rtc_power_off_program prototype
    6d19fe968ef6 workqueue: Fix hung time report of worker pools
    6c073c5a5b97 workqueue: Introduce show_one_worker_pool and show_one_workqueue.
    e89f95c68536 RDMA/rdmavt: Delete unnecessary NULL check
    9721b14e6c8a RDMA/siw: Fix potential page_array out of range access
    8d909684bdf6 clk: at91: clk-sam9x60-pll: fix return value check
    623941780df3 sched/rt: Fix bad task migration for rt tasks
    594d2a055526 Revert "objtool: Support addition to set CFA base"
    80973ce36f4b perf/core: Fix hardlockup failure caused by perf throttle
    3e09b68fc520 sched/fair: Fix inaccurate tally of ttwu_move_affine
    c3b9f95598b8 sched: Make struct sched_statistics independent of fair sched class
    6002989848c5 sched/fair: Use __schedstat_set() in set_next_entity()
    94bcf94c25aa powerpc/rtas: use memmove for potentially overlapping buffer copy
    f7107d44dff7 macintosh: via-pmu-led: requires ATA to be set
    85842228df0e powerpc/sysdev/tsi108: fix resource printk format warnings
    179cc5ab9591 powerpc/wii: fix resource printk format warnings
    516c27922c96 powerpc/mpc512x: fix resource printk format warning
    da961d510b21 macintosh/windfarm_smu_sat: Add missing of_node_put()
    5b9fc529b689 virtio_ring: don't update event idx on get_buf
    ee0b6146317a spmi: Add a check for remove callback when removing a SPMI driver
    be267f30b07e staging: rtl8192e: Fix W_DISABLE# does not work after stop/start
    424cf2929635 serial: 8250: Add missing wakeup event reporting
    8dfd00bfd53f tty: serial: fsl_lpuart: adjust buffer length to the intended size
    59ecc2cf3466 firmware: stratix10-svc: Fix an NULL vs IS_ERR() bug in probe
    ee53a7a88027 usb: mtu3: fix kernel panic at qmu transfer done irq handler
    6b0d399dac58 usb: chipidea: fix missing goto in `ci_hdrc_probe`
    6d4325ebd8c0 usb: gadget: tegra-xudc: Fix crash in vbus_draw
    d96f6bc10789 sh: sq: Fix incorrect element size for allocating bitmap buffer
    397eb669dac0 uapi/linux/const.h: prefer ISO-friendly __typeof__
    d1c4dedcd2df scripts/gdb: raise error with reduced debugging information
    2d65599ad1e4 i2c: cadence: cdns_i2c_master_xfer(): Fix runtime PM leak on error path
    d453f25faf68 spi: cadence-quadspi: fix suspend-resume implementations
    6a129c0e9935 ASoC: fsl_mqs: move of_node_put() to the correct location
    850631845531 coresight: etm_pmu: Set the module field
    db6f1b2bba34 HID: amd_sfh: Add support for shutdown operation
    b711dd0ba9b3 scripts/gdb: bail early if there are no generic PD
    eaecf281c27f scripts/gdb: bail early if there are no clocks
    0110bfacff03 ia64: salinfo: placate defined-but-not-used warning
    51395777f66d ia64: mm/contig: fix section mismatch warning/error
    1a2a0d5b0617 PCI/EDR: Clear Device Status after EDR error recovery
    cc4f0e168a56 of: Fix modalias string generation
    770d30b1355c vmci_host: fix a race condition in vmci_host_poll() causing GPF
    08c7608798a9 spi: fsl-spi: Fix CPM/QE mode Litte Endian
    f345d4d71e87 spi: qup: Don't skip cleanup in remove's error path
    77b0c0dd2c56 linux/vt_buffer.h: allow either builtin or modular for macros
    af9ec18aa8ee ASoC: es8316: Handle optional IRQ assignment
    39287d16b2d2 PCI: imx6: Install the fault handler only on compatible match
    1e58fb6b1cef usb: gadget: udc: renesas_usb3: Fix use after free bug in renesas_usb3_remove due to race condition
    f90822ad63d1 spi: imx: Don't skip cleanup in remove's error path
    e9ded9dd5d05 spi: spi-imx: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
    193f7fffdcaf serial: 8250_bcm7271: Fix arbitration handling
    f67cc4929ef9 iio: light: max44009: add missing OF device matching
    7e42057532ea fpga: bridge: fix kernel-doc parameter description
    72b1ce904567 serial: stm32: Re-assert RTS/DE GPIO in RS485 mode only if more data are transmitted
    59ed254dd35e serial: stm32: re-introduce an irq flag condition in usart_receive_chars
    4b7bb1c7be4f usb: dwc3: gadget: Change condition for processing suspend event
    beb12083c1ac usb: host: xhci-rcar: remove leftover quirk handling
    295f3fcaa8ea pstore: Revert pmsg_lock back to a normal mutex
    2491b999a60d drivers: staging: rtl8723bs: Fix locking in rtw_scan_timeout_handler()
    209850f17717 drivers: staging: rtl8723bs: Fix locking in _rtw_join_timeout_handler()
    1ffb2ca65051 ipmi: ASPEED_BT_IPMI_BMC: select REGMAP_MMIO instead of depending on it
    43e4197dd5f6 tcp/udp: Fix memleaks of sk and zerocopy skbs with TX timestamp.
    1d2f799c1604 net: amd: Fix link leak when verifying config failed
    5d6e5c054ed2 netlink: Use copy_to_user() for optval in netlink_getsockopt().
    a789192f3661 Revert "Bluetooth: btsdio: fix use after free bug in btsdio_remove due to unfinished work"
    a54ec573d9b8 ipv4: Fix potential uninit variable access bug in __ip_make_skb()
    d0b43125ec89 net/sched: sch_fq: fix integer overflow of "credit"
    7a45b4e1c82b netfilter: nf_tables: don't write table validation state without mutex
    8913abddad4a bpf: Don't EFAULT for getsockopt with optval=NULL
    77f245ce053e net: stmmac:fix system hang when setting up tag_8021q VLAN for DSA ports
    a9e96eef8218 net/mlx5: E-switch, Don't destroy indirect table in split rule
    05cf6f353d3c ixgbe: Enable setting RSS table to default values
    624b73f77664 ixgbe: Allow flow hash to be set via ethtool
    e302e9ca14a8 wifi: iwlwifi: fw: fix memory leak in debugfs
    53b3b1f563bc wifi: iwlwifi: mvm: check firmware response size
    aa11a894458d wifi: mt76: mt7921e: improve reliability of dma reset
    f8923ad9dd8e wifi: mt76: fix 6GHz high channel not be scanned
    613b51663fc4 wifi: mt76: mt7921e: fix probe timeout after reboot
    5279aaf9f5b0 wifi: mt76: add flexible polling wait-interval support
    ac9fec5b5688 wifi: mt76: handle failure of vzalloc in mt7615_coredump_work
    210e6d01cc49 wifi: iwlwifi: make the loop for card preparation effective
    dff2a7b33060 jdb2: Don't refuse invalidation of already invalidated buffers
    358317ad9cf4 wifi: iwlwifi: fw: move memset before early return
    cccf85e047c3 wifi: iwlwifi: mvm: initialize seq variable
    b3cecbb2571c wifi: iwlwifi: yoyo: Fix possible division by zero
    4636c35b7e6e wifi: iwlwifi: yoyo: skip dump correctly on hw error
    34222897e0eb md/raid10: don't call bio_start_io_acct twice for bio which experienced read error
    d6cfcf98b824 md/raid10: fix memleak of md thread
    7f673fa34c0e md/raid10: fix memleak for 'conf->bio_split'
    8d09065802c5 md/raid10: fix leak of 'r10bio->remaining' for recovery
    901b4918faa4 md/raid10: fix task hung in raid10d
    fc04998351fe md/raid10: factor out code from wait_barrier() to stop_waiting_barrier()
    39db562b3fed md: raid10 add nowait support
    74af08efa5cd md: drop queue limitation for RAID1 and RAID10
    337d1d88be9d bpf, sockmap: Revert buggy deadlock fix in the sockhash and sockmap
    12e70c6f4ed8 selftests/bpf: Fix leaked bpf_link in get_stackid_cannot_attach
    103a4275420e nvme-fcloop: fix "inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage"
    9fe41e648254 nvme: fix async event trace event
    13475e639162 nvme: handle the persistent internal error AER
    30b9073583ac nvmet: fix I/O Command Set specific Identify Controller
    42bcbc2a90a8 nvmet: fix Identify Active Namespace ID list handling
    92cf81746ebc nvmet: fix Identify Controller handling
    ac86d59eaa69 nvmet: fix Identify Namespace handling
    c7e98afecab2 nvmet: fix error handling in nvmet_execute_identify_cns_cs_ns()
    537083b1275c nvmet: move the call to nvmet_ns_changed out of nvmet_ns_revalidate
    080826d16758 nvmet: use i_size_read() to set size for file-ns
    f333854dce4a bpf, sockmap: fix deadlocks in the sockhash and sockmap
    c8a67bc85772 net: ethernet: stmmac: dwmac-rk: fix optional phy regulator handling
    fd8c83d8375b scsi: lpfc: Fix ioremap issues in lpfc_sli4_pci_mem_setup()
    9a7f63283af6 f2fs: fix to avoid use-after-free for cached IPU bio
    119f278ea9c1 xsk: Fix unaligned descriptor validation
    1056b209935d crypto: drbg - Only fail when jent is unavailable in FIPS mode
    9317d6612011 crypto: drbg - make drbg_prepare_hrng() handle jent instantiation errors
    80bfd8b184d8 bpftool: Fix bug for long instructions in program CFG dumps
    afdc3a4bd77d selftests/bpf: Wait for receive in cg_storage_multi test
    c5fa99bce673 selftests: xsk: Disable IPv6 on VETH1
    c4afd6410f3c net: qrtr: correct types of trace event parameters
    eb77c0c0a17c wifi: rt2x00: Fix memory leak when handling surveys
    0b0c3e37a43f wifi: rtlwifi: fix incorrect error codes in rtl_debugfs_set_write_reg()
    0a847af3cb40 wifi: rtlwifi: fix incorrect error codes in rtl_debugfs_set_write_rfreg()
    3e660d117513 crypto: sa2ul - Select CRYPTO_DES
    d82d82e0372b crypto: caam - Clear some memory in instantiate_rng
    169134da419c f2fs: compress: fix to call f2fs_wait_on_page_writeback() in f2fs_write_raw_pages()
    d0cf44f06dd4 f2fs: apply zone capacity to all zone type
    2cc6a05661ad f2fs: enforce single zone capacity
    e5a56f13ba2d f2fs: handle dqget error in f2fs_transfer_project_quota()
    6d6415e5bce2 scsi: megaraid: Fix mega_cmd_done() CMDID_INT_CMDS
    eb4cf26d2e86 scsi: target: iscsit: Fix TAS handling during conn cleanup
    9158c86fd323 scsi: target: Fix multiple LUN_RESET handling
    ad4a647aa587 net/packet: convert po->auxdata to an atomic flag
    f1a111ca05ce net/packet: convert po->origdev to an atomic flag
    c3238c7dbed9 net/packet: annotate accesses to po->xmit
    97e7b1c1da12 vlan: partially enable SIOCSHWTSTAMP in container
    5f44dfa841e9 net: pcs: xpcs: remove double-read of link state when using AN
    a7282fc797df bpf: Remove misleading spec_v1 check on var-offset stack read
    60f9ed23b954 selftests/bpf: Fix a fd leak in an error path in network_helpers.c
    9b9e803b4823 scm: fix MSG_CTRUNC setting condition for SO_PASSSEC
    670754766ac3 bpf: fix precision propagation verbose logging
    c022b09fcc32 bpf: take into account liveness when propagating precision
    23634d119ca7 wifi: rtw88: mac: Return the original error from rtw_mac_power_switch()
    3fc0be9f48ff wifi: rtw88: mac: Return the original error from rtw_pwr_seq_parser()
    2ba1e4a623bf tools: bpftool: Remove invalid \' json escape
    484d95c69fc1 wifi: ath6kl: reduce WARN to dev_dbg() in callback
    19ba40acb170 wifi: brcmfmac: support CQM RSSI notification with older firmware
    378364abbe55 wifi: ath5k: fix an off by one check in ath5k_eeprom_read_freq_list()
    59073060fe09 wifi: ath9k: hif_usb: fix memory leak of remain_skbs
    104b1b48b679 wifi: ath6kl: minor fix for allocation size
    d1138f118f43 hwmon: (pmbus/fsp-3y) Fix functionality bitmask in FSP-3Y YM-2151E
    f1d68061b074 cpufreq: use correct unit when verify cur freq
    a55050c7989c tick/common: Align tick period with the HZ tick.
    54202488c835 drm/i915: Make intel_get_crtc_new_encoder() less oopsy
    500ffa58e70b debugobject: Prevent init race with static objects
    af04d8d3c156 arm64: kgdb: Set PSTATE.SS to 1 to re-enable single-step
    00132fab90ea x86/ioapic: Don't return 0 from arch_dynirq_lower_bound()
    ad6481f49fb2 regulator: stm32-pwr: fix of_iomap leak
    b8c2678d0fe7 media: venus: dec: Fix handling of the start cmd
    2ed8f8c09d2a media: rc: gpio-ir-recv: Fix support for wake-up
    4b1afffdd940 drm/amd/display: Fix potential null dereference
    2322b262d220 media: rcar_fdp1: Fix refcount leak in probe and remove function
    5847021f8052 media: rcar_fdp1: Convert to platform remove callback returning void
    d18789f43484 platform: Provide a remove callback that returns no value
    825281f34bec media: rcar_fdp1: Fix the correct variable assignments
    3c300022c188 media: rcar_fdp1: Make use of the helper function devm_platform_ioremap_resource()
    2f48c0a463a3 media: saa7134: fix use after free bug in saa7134_finidev due to race condition
    c94388b5b909 media: dm1105: Fix use after free bug in dm1105_remove due to race condition
    cac0f4f36e22 media: rkvdec: fix use after free bug in rkvdec_remove
    d991f6139fa6 x86/apic: Fix atomic update of offset in reserve_eilvt_offset()
    1e3056b8067c regulator: core: Avoid lockdep reports when resolving supplies
    4e5c9738185b regulator: core: Consistently set mutex_owner when using ww_mutex_lock_slow()
    678b3f29aaaf drm/ttm/pool: Fix ttm_pool_alloc error path
    b19bebc96381 drm/ttm: optimize pool allocations a bit v2
    1e26766dc83a arm64: dts: qcom: msm8994-msft-lumia-octagon: drop unit address from PMI8994 regulator
    bee1a285732a arm64: dts: qcom: msm8994-kitakami: drop unit address from PMI8994 regulator
    fb0bea59d078 arm64: dts: qcom: sc7180-trogdor-lazor: correct trackpad supply
    8853aab16787 mailbox: mpfs: switch to txdone_poll
    623275db2841 drm/lima/lima_drv: Add missing unwind goto in lima_pdev_probe()
    5a8aedb7b9fe ACPI: VIOT: Initialize the correct IOMMU fwspec
    111af9798356 firmware: arm_scmi: Fix xfers allocation on Rx channel
    657776d47bed ARM: dts: gta04: fix excess dma channel usage
    d3047a1b0422 drm: rcar-du: Fix a NULL vs IS_ERR() bug
    3cfaa8713e8b mmc: sdhci-of-esdhc: fix quirk to ignore command inhibit for data
    60cadfcfa44c ACPI: processor: Fix evaluating _PDC method when running as Xen dom0
    aa8d52ddf7c8 drm/amd/display/dc/dce60/Makefile: Fix previous attempt to silence known override-init warnings
    d28ec12c48dd drm: msm: adreno: Disable preemption on Adreno 510
    2ad781393eb3 drm/msm/adreno: drop bogus pm_runtime_set_active()
    86c1a99528c6 drm/msm/adreno: Defer enabling runpm until hw_init()
    1ad4b8c4552b media: max9286: Free control handler
    3d7003c400ca drm/bridge: adv7533: Fix adv7533_mode_valid for adv7533 and adv7535
    a3ea89b5978d firmware: qcom_scm: Clear download bit during reboot
    ca4ce92e3ec9 media: av7110: prevent underflow in write_ts_to_decoder()
    519b08494011 media: bdisp: Add missing check for create_workqueue
    11c58a0c1937 x86/MCE/AMD: Use an u64 for bank_map
    88a9d3c0b59a ARM: dts: qcom: ipq8064: Fix the PCI I/O port range
    112ff0f25305 ARM: dts: qcom: ipq8064: reduce pci IO size to 64K
    99e7b14569da ARM: dts: qcom: ipq4019: Fix the PCI I/O port range
    96158bfc764f arm64: dts: qcom: sm8250: Fix the PCI I/O port range
    cc1ae8710ac4 arm64: dts: qcom: msm8996: Fix the PCI I/O port range
    656657bdeb8a arm64: dts: qcom: ipq6018: Fix the PCI I/O port range
    a19c40b97908 arm64: dts: qcom: ipq8074: Fix the PCI I/O port range
    9f89689d8b9d arm64: dts: qcom: msm8998: Fix the PCI I/O port range
    16111402966e arm64: dts: qcom: sdm845: Fix the PCI I/O port range
    3e7be9b63264 arm64: dts: qcom: sdm845: correct dynamic power coefficients
    a9e9a4a62725 arm64: dts: qcom: msm8998: Fix stm-stimulus-base reg name
    a46878476c55 arm64: dts: broadcom: bcmbca: bcm4908: fix procmon nodename
    1994284cb922 arm64: dts: broadcom: bcmbca: bcm4908: fix NAND interrupt name
    6ae67829fa5e arm64: dts: Move BCM4908 dts to bcmbca folder
    fe8ab85ed495 arm64: dts: Add base DTS file for bcmbca device Asus GT-AX6000
    aefde9ada466 ARM64: dts: Add DTS files for bcmbca SoC BCM6858
    273be36e4209 arm64: dts: Add DTS files for bcmbca SoC BCM4912
    fe07b3b5af01 arm64: dts: Add DTS files for bcmbca SoC BCM63158
    77112d23a671 arm64: dts: broadcom: bcm4908: add DT for Netgear RAXE500
    a53862a20239 arm64: dts: ti: k3-j721e-main: Remove ti,strobe-sel property
    e3143e6cca0a regulator: core: Shorten off-on-delay-us for always-on/boot-on by time since booted
    30b4edaf221d EDAC/skx: Fix overflows on the DRAM row address mapping arrays
    d450fa865750 drm/msm/disp/dpu: check for crtc enable rather than crtc active to release shared resources
    62cd3e056123 arm64: dts: renesas: r8a774c0: Remove bogus voltages from OPP table
    667c86b2a941 arm64: dts: renesas: r8a77990: Remove bogus voltages from OPP table
    6a50350033e0 soc: ti: pm33xx: Fix refcount leak in am33xx_pm_probe
    fb2a6e00291a tools/x86/kcpuid: Fix avx512bw and avx512lvl fields in Fn00000007
    00f79abccc5b drm/probe-helper: Cancel previous job before starting new one
    9fde84fb59e5 drm/vgem: add missing mutex_destroy
    a51b71af169f drm/rockchip: Drop unbalanced obj unref
    0834a2b554e5 erofs: fix potential overflow calculating xattr_isize
    060fecf1114f erofs: stop parsing non-compact HEAD index if clusterofs is invalid
    5a37916d988e tpm, tpm_tis: Claim locality when interrupts are reenabled on resume
    46da635566dc tpm, tpm: Implement usage counter for locality
    51162b05a44c tpm, tpm_tis: Claim locality before writing interrupt registers
    b665edd7a585 tpm, tpm_tis: Disable interrupts if tpm_tis_probe_irq() failed
    fd9b4b2bff6b tpm, tpm_tis: Claim locality before writing TPM_INT_ENABLE register
    8c08c74de718 tpm, tpm_tis: Do not skip reset of original interrupt vector
    dfa1e84b774c selinux: ensure av_permissions.h is built when needed
    8a3a1f7b54b8 selinux: fix Makefile dependencies of flask.h
    08e403705778 selftests/resctrl: Check for return value after write_schemata()
    25661fe5f658 selftests/resctrl: Allow ->setup() to return errors
    b5adaf5045d0 selftests/resctrl: Move ->setup() call outside of test specific branches
    f9eeea03a5e7 selftests/resctrl: Extend CPU vendor detection
    ebd40f52de19 selftests/resctrl: Return NULL if malloc_and_init_memory() did not alloc mem
    988901984ddd rcu: Fix missing TICK_DEP_MASK_RCU_EXP dependency check
    74f06429b727 sound/oss/dmasound: fix build when drivers are mixed =y/=m
    c628b07d5974 xfs: don't consider future format versions valid
    ce840284929b ubifs: Free memory for tmpfile name
    20ef288612e5 ubi: Fix return value overwrite issue in try_write_vid_and_data()
    3ae75f82c33f ubifs: Fix memleak when insert_old_idx() failed
    149ea56995c2 Revert "ubifs: dirty_cow_znode: Fix memleak in error handling path"
    dc299bd1d5c4 iommu/amd: Fix "Guest Virtual APIC Table Root Pointer" configuration in IRTE
    b7bc8f6c8a31 tracing: Fix permissions for the buffer_percent file
    b91a5aa1e7ea riscv: mm: remove redundant parameter of create_fdt_early_page_table
    ec1814116fa4 i2c: omap: Fix standard mode false ACK readings
    671f21fbcb47 ksmbd: fix memleak in session setup
    227eb2689b44 ksmbd: fix NULL pointer dereference in smb2_get_info_filesystem()
    c053e389db0d ksmbd: call rcu_barrier() in ksmbd_server_exit()
    2db4b91480b2 writeback, cgroup: fix null-ptr-deref write in bdi_split_work_to_wbs
    0b46ee654a9d relayfs: fix out-of-bounds access in relay_file_read
    a18bdaca46d0 KVM: nVMX: Emulate NOPs in L2, and PAUSE if it's not intercepted
    a79fb2ce4fbe reiserfs: Add security prefix to xattr name in reiserfs_security_write()
    4c3d1a6720ae rcu: Avoid stack overflow due to __rcu_irq_enter_check_tick() being kprobe-ed
    09e177d6f7ed crypto: safexcel - Cleanup ring IRQ workqueues on load failure
    63b7fbaa1278 crypto: api - Demote BUG_ON() in crypto_unregister_alg() to a WARN_ON()
    c63741e872fc ring-buffer: Sync IRQ works before buffer destruction
    333f49fcf0e7 pinctrl: qcom: lpass-lpi: set output value before enabling output
    3028ac7dc0c0 soundwire: qcom: correct setting ignore bit on v1.5.1
    01fefb82fd79 pwm: meson: Fix g12a ao clk81 name
    dcf6611e80f9 pwm: meson: Fix axg ao mux parents
    2104e15b0072 wifi: mt76: add missing locking to protect against concurrent rx/status calls
    4a07d2d511e2 kheaders: Use array declaration instead of char
    99d561199bf8 ipmi: fix SSIF not responding under certain cond.
    8fddbd9c5c86 ipmi:ssif: Add send_retries increment
    3ef93b7bd9e0 MIPS: fw: Allow firmware to pass a empty env
    e047e40676d1 tick/nohz: Fix cpu_is_hotpluggable() by checking with nohz subsystem
    9c0b37d0da47 xhci: fix debugfs register accesses while suspended
    321e16a5709e tty: Prevent writing chars during tcsetattr TCSADRAIN/FLUSH
    fa30909fbd1f staging: iio: resolver: ads1210: fix config mode
    ac44e1275dae ext4: use ext4_journal_start/stop for fast commit transactions
    5bb4005fb667 blk-crypto: make blk_crypto_evict_key() more robust
    f8d9d6c3ffcc blk-crypto: make blk_crypto_evict_key() return void
    d206f79d9cd6 blk-mq: release crypto keyslot before reporting I/O complete
    2c62f4abd714 posix-cpu-timers: Implement the missing timer_wait_running callback
    dca7427a8b12 hwmon: (adt7475) Use device_property APIs when configuring polarity
    d50321946ec0 hwmon: (k10temp) Check range scale when CUR_TEMP register is read-write
    d40fa6f78835 USB: dwc3: fix runtime pm imbalance on unbind
    9436221ea250 USB: dwc3: fix runtime pm imbalance on probe errors
    bfd693628192 IMA: allow/fix UML builds
    c23e103fd736 PCI: qcom: Fix the incorrect register usage in v2.7.0 config
    8a0b61e5a7d2 PCI: pciehp: Fix AB-BA deadlock between reset_lock and device_lock
    402d2b1d54b7 arm64: Stash shadow stack pointer in the task struct on interrupt
    21cc4e5304d2 arm64: Always load shadow stack pointer directly from the task struct
    a00f75f71fca wifi: mt76: mt7921e: Set memory space enable in PCI_COMMAND if unset
    a646556769e1 wireguard: timers: cast enum limits members to int in prints
    95ec7a59ceb2 x86/cpu: Add model number for Intel Arrow Lake processor
    520820400608 asm-generic/io.h: suppress endianness warnings for readq() and writeq()
    5e3c87e4d3bd selftests mount: Fix mount_setattr_test builds failed
    e1383b440132 ASoC: Intel: bytcr_rt5640: Add quirk for the Acer Iconia One 7 B1-750
    21976532f274 iio: adc: palmas_gpadc: fix NULL dereference on rmmod
    50015dbdec70 x86/hyperv: Block root partition functionality in a Confidential VM
    a7d91f67a10a ASoC: soc-pcm: fix hw->formats cleared by soc_pcm_hw_init() for dpcm
    cf5b14b8de0d ASOC: Intel: sof_sdw: add quirk for Intel 'Rooks County' NUC M15

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 5425b3557b6efdba07bd3efa51c647bd62d5259b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index d719a959d6..6e2af48543 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "91c85a978457d009bb57ec0a0867afe4ff7c8278"
-SRCREV_meta ?= "8ce5ee0184fb213962a82ca5ee8c74851452e260"
+SRCREV_machine ?= "b7b557241341ae3bd6dc793eac41232739778578"
+SRCREV_meta ?= "e316987285bb86fec4c567569c4977d264599c0a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.110"
+LINUX_VERSION ?= "5.15.111"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 88af7d2ee7..7717b2d6a0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.110"
+LINUX_VERSION ?= "5.15.111"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "37cc630d5574860de0b48e67fca03d8cb7d2a260"
-SRCREV_meta ?= "8ce5ee0184fb213962a82ca5ee8c74851452e260"
+SRCREV_machine ?= "a2c822d25ca2ddf1df5317a88d2319cb50330de4"
+SRCREV_meta ?= "e316987285bb86fec4c567569c4977d264599c0a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 9c531ab4da..2019a07c07 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c9c4163f1d7a05a8a9e74f519ec7acc54259f53b"
-SRCREV_machine:qemuarm64 ?= "1cbfaca7888ffe8f6ce58987080a86b48161ce44"
-SRCREV_machine:qemumips ?= "9d83787163c68c2390136915fcfbf3e781d56874"
-SRCREV_machine:qemuppc ?= "a6d06d797ba2ae6c391898a42fced6c3eb71aad0"
-SRCREV_machine:qemuriscv64 ?= "4399f7dbd01bd141ad6033438eb818820322ef13"
-SRCREV_machine:qemuriscv32 ?= "4399f7dbd01bd141ad6033438eb818820322ef13"
-SRCREV_machine:qemux86 ?= "4399f7dbd01bd141ad6033438eb818820322ef13"
-SRCREV_machine:qemux86-64 ?= "4399f7dbd01bd141ad6033438eb818820322ef13"
-SRCREV_machine:qemumips64 ?= "577bbb0ffdafbe77c802b1ff6cd09beec4cf0302"
-SRCREV_machine ?= "4399f7dbd01bd141ad6033438eb818820322ef13"
-SRCREV_meta ?= "8ce5ee0184fb213962a82ca5ee8c74851452e260"
+SRCREV_machine:qemuarm ?= "6bea924ca14afde95155405061b7a38698b627bb"
+SRCREV_machine:qemuarm64 ?= "61af9ffc157af5a77c0df7f2a9c672e96d2dbbd9"
+SRCREV_machine:qemumips ?= "44a1952d813a46156aa652da567537a4c49cd257"
+SRCREV_machine:qemuppc ?= "931fcfcbb0537ff882718af07d0941ac4d571361"
+SRCREV_machine:qemuriscv64 ?= "aebcdb3f8bdb1a08ca6032d8369edd3f9bf86251"
+SRCREV_machine:qemuriscv32 ?= "aebcdb3f8bdb1a08ca6032d8369edd3f9bf86251"
+SRCREV_machine:qemux86 ?= "aebcdb3f8bdb1a08ca6032d8369edd3f9bf86251"
+SRCREV_machine:qemux86-64 ?= "aebcdb3f8bdb1a08ca6032d8369edd3f9bf86251"
+SRCREV_machine:qemumips64 ?= "081f014de8e7c8ff3627e54fdd5149f573df34e9"
+SRCREV_machine ?= "aebcdb3f8bdb1a08ca6032d8369edd3f9bf86251"
+SRCREV_meta ?= "e316987285bb86fec4c567569c4977d264599c0a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "8a7f2a5c5aa1648edb4f2029c6ec33870afb7a95"
+SRCREV_machine:class-devupstream ?= "b0ece631f84a3e70341496b000b094b7dfdf4e5f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.110"
+LINUX_VERSION ?= "5.15.111"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


