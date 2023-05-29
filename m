Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5EEC77B7A
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 16:47:25 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.53946.1685378842953722507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 09:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LVm98H6K;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-75cbbb10c69so319599585a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 09:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685378842; x=1687970842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0SnDh/8p+sW5w/qG8iZTZtP9rdld47cPkmoIkP07j4=;
        b=LVm98H6KAIF3mwS3kJqNcZvdMqW9VbaNVMdCkWXyItUq/u5faybX8Vyvt6ZBLSMOVM
         xcwT2tBM2T2+qzJ/hTsl9xH7xfOZ39Fpg/UM595Yd4Vi2UmnBFm0aYcCqpvhIr+Se7VT
         UgaCln6Of3oVWVbYlZqYSKj/0xZku5slDboQ97CDVXCgakzXyw1/ASPyuESPLfZ/jyxa
         zEcd37wmemSBCBlvN7G2CM0Trel2TO2VEnvFL/f7LeILjKw/0nmzqOryalONQDqEW8Kw
         8wpS8hkV1f7LsId2oOsSVfZgRuxrD+3cEypkCFJWJluNZ2Az2fGTBwoVq+xpvc90fb7T
         nCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685378842; x=1687970842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0SnDh/8p+sW5w/qG8iZTZtP9rdld47cPkmoIkP07j4=;
        b=mC/ma/tAJsUZXrd22Aw6t24oGwddIKBoiwiZjtVt6D0ROHcQDPgSVimWOt3G+YxSOf
         B4nGADhSIJ5gak66dv6F2JIP3DeF5K9Vjc/3rkMLiGZXKTrypkwiHX46mKhRoMv/gDnC
         H/K1ymMu1BuQSV816bp+xUewVDeWuOB/Y5gOETpkn1BUnEwWFbQ9A4Acd8acUcotqvFH
         oWSDPMNfVXKt+b4G0haHnPrIN6PdCcTfxTYcnTNYLUKeaYsu4Oem4R55AEkGENG+wWjk
         /ZS0e08K+cqHZSga5KbVBKMOH0gyT0tjgBiCo64h6SVivQq/YCYhib15dUNlFxG5VYaF
         8XTA==
X-Gm-Message-State: AC+VfDwAn9Fg+ofc1zNNLBgqhDFhZ+gVlGAGTcx7TiwJk/DkTOYgy2mm
	ADJMKd7E4YFGYoxU8dbMcG1RSD1Efeg5bg==
X-Google-Smtp-Source: ACHHUZ5F9uiozNEz4HguNm+7k2m2eLoog2pHBRNgCFuLxImhXQsyuh9Y0V85jvtlywuy4/YXsCF+9Q==
X-Received: by 2002:a05:620a:1b92:b0:75c:cc95:671 with SMTP id dv18-20020a05620a1b9200b0075ccc950671mr7300186qkb.26.1685378841727;
        Mon, 29 May 2023 09:47:21 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id o15-20020ae9f50f000000b0074a6c29df4dsm3461394qkg.119.2023.05.29.09.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 09:47:21 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [dunfell 5/5] linux-yocto/5.4: update to v5.4.243
Date: Mon, 29 May 2023 12:47:14 -0400
Message-Id: <20230529164715.3511175-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230529164715.3511175-1-bruce.ashfield@gmail.com>
References: <20230529164715.3511175-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 16:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181880

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    f53660ec669f Linux 5.4.243
    d60f15682a5c drm/amd/display: Fix hang when skipping modeset
    93ca0d7b88e8 mm/page_alloc: fix potential deadlock on zonelist_update_seq seqlock
    3f231e30cdeb drm/exynos: move to use request_irq by IRQF_NO_AUTOEN flag
    65a8b6d129cf drm/msm/adreno: Fix null ptr access in adreno_gpu_cleanup()
    62ac943eb2a9 firmware: raspberrypi: fix possible memory leak in rpi_firmware_probe()
    a781ea3437a0 drm/msm: Fix double pm_runtime_disable() call
    e4e88f74eb2f PM: domains: Restore comment indentation for generic_pm_domain.child_links
    ddcca7299de3 printk: declare printk_deferred_{enter,safe}() in include/linux/printk.h
    c2c3ffc79896 PCI: pciehp: Fix AB-BA deadlock between reset_lock and device_lock
    6a24285f64ea PCI: pciehp: Use down_read/write_nested(reset_lock) to fix lockdep errors
    dde34ef0bc73 drbd: correctly submit flush bio on barrier
    373720b9289c serial: 8250: Fix serial8250_tx_empty() race with DMA Tx
    f2a1071100fe tty: Prevent writing chars during tcsetattr TCSADRAIN/FLUSH
    ba04d6af5ac4 ext4: fix invalid free tracking in ext4_xattr_move_to_block()
    185062a21976 ext4: remove a BUG_ON in ext4_mb_release_group_pa()
    d7ff83a71d77 ext4: bail out of ext4_xattr_ibody_get() fails for any reason
    486efbbc9445 ext4: add bounds checking in get_max_inline_xattr_value_size()
    b4fa4768c9ac ext4: fix deadlock when converting an inline directory in nojournal mode
    2dda20290671 ext4: improve error recovery code paths in __ext4_remount()
    525c802de3f9 ext4: fix data races when using cached status extents
    4f4fd982d972 ext4: avoid a potential slab-out-of-bounds in ext4_group_desc_csum
    1b90fbc75901 ext4: fix WARNING in mb_find_extent
    f9e27d4bdb1f HID: wacom: insert timestamp to packed Bluetooth (BT) events
    d8b609e66244 HID: wacom: Set a default resolution for older tablets
    3decf3a750a9 drm/amdgpu: disable sdma ecc irq only when sdma RAS is enabled in suspend
    625d4112ea25 drm/amdgpu/gfx: disable gfx9 cp_ecc_error_irq only when enabling legacy gfx ras
    b1fabc379463 drm/amdgpu: fix an amdgpu_irq_put() issue in gmc_v9_0_hw_fini()
    c6bb59662432 drm/panel: otm8009a: Set backlight parent to panel device
    3e7703624612 f2fs: fix potential corruption when moving a directory
    dafc5a5c8fda ARM: dts: s5pv210: correct MIPI CSIS clock name
    ad751b896eae ARM: dts: exynos: fix WM8960 clock name in Itop Elite
    823496470790 remoteproc: st: Call of_node_put() on iteration error
    a1366ecb0905 remoteproc: stm32: Call of_node_put() on iteration error
    f16bc5111cc6 sh: nmi_debug: fix return value of __setup handler
    c9871a47f4ce sh: init: use OF_EARLY_FLATTREE for early init
    111b08116dac sh: math-emu: fix macro redefined warning
    8fb33166aed8 inotify: Avoid reporting event with invalid wd
    0ccea97abe6d platform/x86: touchscreen_dmi: Add info for the Dexp Ursus KX210i
    871641c7ebe5 cifs: fix pcchunk length type in smb2_copychunk_range
    3e2b4bceaaf9 btrfs: print-tree: parent bytenr must be aligned to sector size
    1e05bf5e80bb btrfs: don't free qgroup space unless specified
    b232f5e8cf81 btrfs: fix btrfs_prev_leaf() to not return the same key twice
    96f71f669bee perf symbols: Fix return incorrect build_id size in elf_read_build_id()
    78190a6ebe4e perf map: Delete two variable initialisations before null pointer checks in sort__sym_from_cmp()
    ffec80cc6761 perf vendor events power9: Remove UTF-8 characters from JSON files
    62f1ebfe9aac virtio_net: suppress cpu stall when free_unused_bufs
    1dc5faf30a6c virtio_net: split free_unused_bufs()
    b15637e717ad net: dsa: mt7530: fix corrupt frames using trgmii on 40 MHz XTAL MT7621
    544b0de2d767 ALSA: caiaq: input: Add error handling for unsupported input methods in `snd_usb_caiaq_input_init`
    35f2642f4abd drm/amdgpu: add a missing lock for AMDGPU_SCHED
    5cfe3f910f7c af_packet: Don't send zero-byte data in packet_sendmsg_spkt().
    fbcfa00386e1 ionic: remove noise from ethtool rxnfc error msg
    4a56f1f6fe92 rxrpc: Fix hard call timeout units
    dfa36eb38020 net/sched: act_mirred: Add carrier check
    cc5ccfb7c0ee writeback: fix call of incorrect macro
    9c1fcb97f98f net: dsa: mv88e6xxx: add mv88e6321 rsvd2cpu
    e80412439030 sit: update dev->needed_headroom in ipip6_tunnel_bind_dev()
    cc5fe387c629 net/sched: cls_api: remove block_cb from driver_list before freeing
    8acd3a28873f net/ncsi: clear Tx enable mode when handling a Config required AEN
    bc0905a76531 relayfs: fix out-of-bounds access in relay_file_read
    c038ae623a7c kernel/relay.c: fix read_pos error when multiple readers
    4f4de392f492 crypto: safexcel - Cleanup ring IRQ workqueues on load failure
    b9878f485d70 crypto: inside-secure - irq balance
    439d3a7056d5 dm verity: fix error handling for check_at_most_once on FEC
    0156f7dbd822 dm verity: skip redundant verity_handle_err() on I/O errors
    e4875d6e053d mailbox: zynqmp: Fix counts of child nodes
    ff0d64f5127e mailbox: zynq: Switch to flexible array to simplify code
    352b152905cc tick/nohz: Fix cpu_is_hotpluggable() by checking with nohz subsystem
    9b2ed144318e nohz: Add TICK_DEP_BIT_RCU
    c8b6063f13ad netfilter: nf_tables: deactivate anonymous set from preparation phase
    29fb2a1a5f71 debugobject: Ensure pool refill (again)
    cef1b8a4df5c perf intel-pt: Fix CYC timestamps after standalone CBR
    5ead86d57583 perf auxtrace: Fix address filter entire kernel size
    29a1ef57c3be dm ioctl: fix nested locking in table_clear() to remove deadlock concern
    337b7af27356 dm flakey: fix a crash with invalid table line
    6d126899b074 dm integrity: call kmem_cache_destroy() in dm_integrity_init() error path
    cbe0a7ec67c3 dm clone: call kmem_cache_destroy() in dm_clone_init() error path
    d8f66a19f8be s390/dasd: fix hanging blockdevice after request requeue
    5492d4081274 btrfs: scrub: reject unsupported scrub flags
    946e067b4cda scripts/gdb: fix lx-timerlist for Python3
    7cf5ce2857b8 clk: rockchip: rk3399: allow clk_cifout to force clk_cifout_src to reparent
    4379d5ce9235 wifi: rtl8xxxu: RTL8192EU always needs full init
    ecdcefd312d4 mailbox: zynqmp: Fix typo in IPI documentation
    38afc633d374 mailbox: zynqmp: Fix IPI isr handling
    14964127be77 md/raid10: fix null-ptr-deref in raid10_sync_request
    fe1cbbcb1a25 nilfs2: fix infinite loop in nilfs_mdt_get_block()
    4569a292a84e nilfs2: do not write dirty data after degenerating to read-only
    fd37a5c6998b parisc: Fix argument pointer in real64_call_asm()
    736aeb17b6a0 afs: Fix updating of i_size with dv jump from server
    27263ff39784 dmaengine: at_xdmac: do not enable all cyclic channels
    8c821199bc28 dmaengine: dw-edma: Fix to enable to issue dma request on DMA processing
    24c9c4ad23d3 dmaengine: dw-edma: Fix to change for continuous transfer
    2e900f363174 phy: tegra: xusb: Add missing tegra_xusb_port_unregister for usb2_port and ulpi_port
    58e026465814 pwm: mtk-disp: Disable shadow registers before setting backlight values
    33f00f0a7368 pwm: mtk-disp: Adjust the clocks to avoid them mismatch
    e5e9e59c4564 pwm: mtk-disp: Don't check the return code of pwmchip_remove()
    8e238e88822f dmaengine: mv_xor_v2: Fix an error code.
    026df12f3c4d leds: TI_LMU_COMMON: select REGMAP instead of depending on it
    a34f6dcb78c6 ext4: fix use-after-free read in ext4_find_extent for bigalloc + inline
    6dfd85ada867 openrisc: Properly store r31 to pt_regs on unhandled exceptions
    2fd44d2bde34 clocksource/drivers/davinci: Fix memory leak in davinci_timer_register when init fails
    f2aaf419889c clocksource: davinci: axe a pointless __GFP_NOFAIL
    fc051820d616 clocksource/drivers/davinci: Avoid trailing '\n' hidden in pr_fmt()
    945e9898624d RDMA/mlx5: Use correct device num_ports when modify DC
    9bf843683a32 SUNRPC: remove the maximum number of retries in call_bind_status
    1dfa3c9dd27b Input: raspberrypi-ts - fix refcount leak in rpi_ts_probe
    ce6c42f0b644 input: raspberrypi-ts: Release firmware handle when not needed
    de85be00a8f3 firmware: raspberrypi: Introduce devm_rpi_firmware_get()
    d537afa08e15 firmware: raspberrypi: Keep count of all consumers
    919f470337e1 NFSv4.1: Always send a RECLAIM_COMPLETE after establishing lease
    fe60c3af70bf IB/hfi1: Fix SDMA mmu_rb_node not being evicted in LRU order
    b4f12e2402a5 RDMA/siw: Remove namespace check from siw_netdev_event()
    795d11e8ff35 clk: add missing of_node_put() in "assigned-clocks" property parsing
    0c770f95a2d7 power: supply: generic-adc-battery: fix unit scaling
    31ca78dc1f50 rtc: meson-vrtc: Use ktime_get_real_ts64() to get the current time
    8feca6259007 RDMA/mlx4: Prevent shift wrapping in set_user_sq_size()
    683cd87041ac rtc: omap: include header for omap_rtc_power_off_program prototype
    a48403e8c325 RDMA/rdmavt: Delete unnecessary NULL check
    b24e0e4612a5 RDMA/siw: Fix potential page_array out of range access
    318bc22decd4 perf/core: Fix hardlockup failure caused by perf throttle
    ff3edfb3c825 powerpc/rtas: use memmove for potentially overlapping buffer copy
    333a2a9846b9 macintosh: via-pmu-led: requires ATA to be set
    e2dd8bbab7b5 powerpc/sysdev/tsi108: fix resource printk format warnings
    770d583cd5ae powerpc/wii: fix resource printk format warnings
    f60c8d7c16bb powerpc/mpc512x: fix resource printk format warning
    97cd970f8add macintosh/windfarm_smu_sat: Add missing of_node_put()
    54dda7322255 spmi: Add a check for remove callback when removing a SPMI driver
    af9bfe1c0a50 staging: rtl8192e: Fix W_DISABLE# does not work after stop/start
    572d48361aa0 serial: 8250: Add missing wakeup event reporting
    488baa8038fa tty: serial: fsl_lpuart: adjust buffer length to the intended size
    8fa80b452bc9 firmware: stratix10-svc: Fix an NULL vs IS_ERR() bug in probe
    26ca30516b2c usb: mtu3: fix kernel panic at qmu transfer done irq handler
    bd7a3e6416ab usb: chipidea: fix missing goto in `ci_hdrc_probe`
    f9e2abb6df6d sh: sq: Fix incorrect element size for allocating bitmap buffer
    e1431faa89bd uapi/linux/const.h: prefer ISO-friendly __typeof__
    6716203844bc spi: cadence-quadspi: fix suspend-resume implementations
    caaefbf823ab mtd: spi-nor: cadence-quadspi: Handle probe deferral while requesting DMA channel
    ee5ffe4cdfea mtd: spi-nor: cadence-quadspi: Don't initialize rx_dma_complete on failure
    7c69aeca59f2 mtd: spi-nor: cadence-quadspi: Provide a way to disable DAC mode
    df9708297bb2 mtd: spi-nor: cadence-quadspi: Make driver independent of flash geometry
    30ac77e99525 scripts/gdb: bail early if there are no generic PD
    35a2681e9937 PM: domains: Fix up terminology with parent/child
    0fbc62db7e10 scripts/gdb: bail early if there are no clocks
    0988baae3984 ia64: salinfo: placate defined-but-not-used warning
    d6cb7b6868b9 ia64: mm/contig: fix section mismatch warning/error
    d3c6d52148a1 of: Fix modalias string generation
    ca0f4ad2b7a3 vmci_host: fix a race condition in vmci_host_poll() causing GPF
    170e22324052 spi: fsl-spi: Fix CPM/QE mode Litte Endian
    863238433703 spi: qup: Don't skip cleanup in remove's error path
    814a9a6de1b1 linux/vt_buffer.h: allow either builtin or modular for macros
    3547e5bd0d10 ASoC: es8316: Handle optional IRQ assignment
    9650d5a1e7df ASoC: es8316: Use IRQF_NO_AUTOEN when requesting the IRQ
    f5ce428e3eae genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()
    0f31993721f9 PCI: imx6: Install the fault handler only on compatible match
    0fee5030c094 usb: gadget: udc: renesas_usb3: Fix use after free bug in renesas_usb3_remove due to race condition
    7d2bc728cc8d iio: light: max44009: add missing OF device matching
    ee0e2f7af02a fpga: bridge: fix kernel-doc parameter description
    3fb02404c1e0 usb: host: xhci-rcar: remove leftover quirk handling
    36fb7843f1c3 pstore: Revert pmsg_lock back to a normal mutex
    602fa8af44fd tcp/udp: Fix memleaks of sk and zerocopy skbs with TX timestamp.
    638810f5d020 net: amd: Fix link leak when verifying config failed
    9ef809945edd netlink: Use copy_to_user() for optval in netlink_getsockopt().
    de0ffb5145c9 Revert "Bluetooth: btsdio: fix use after free bug in btsdio_remove due to unfinished work"
    27c468ec1af1 ipv4: Fix potential uninit variable access bug in __ip_make_skb()
    3b9960e21e8b netfilter: nf_tables: don't write table validation state without mutex
    64d2c1cfd04f bpf: Don't EFAULT for getsockopt with optval=NULL
    3bf918f90f93 ixgbe: Enable setting RSS table to default values
    053b36c50bdd ixgbe: Allow flow hash to be set via ethtool
    ae23fc2b230a wifi: iwlwifi: mvm: check firmware response size
    ffdfaf27ebf1 wifi: iwlwifi: make the loop for card preparation effective
    3725b35fc0e5 md/raid10: fix memleak of md thread
    fb3f2f2fa0f3 md: update the optimal I/O size on reshape
    b6460f68c1cc md/raid10: fix memleak for 'conf->bio_split'
    8c5d5d7ffd1e md/raid10: fix leak of 'r10bio->remaining' for recovery
    1fee7e391d99 bpf, sockmap: Revert buggy deadlock fix in the sockhash and sockmap
    d5fdcd2384ff nvme-fcloop: fix "inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage"
    b1e6b3fd1104 nvme: fix async event trace event
    eaaa0c6b0540 nvme: handle the persistent internal error AER
    c229821510df bpf, sockmap: fix deadlocks in the sockhash and sockmap
    74d90f92eafe scsi: lpfc: Fix ioremap issues in lpfc_sli4_pci_mem_setup()
    01993768b3e7 crypto: drbg - Only fail when jent is unavailable in FIPS mode
    b21c7e28e801 crypto: drbg - make drbg_prepare_hrng() handle jent instantiation errors
    14efbe2499c1 bpftool: Fix bug for long instructions in program CFG dumps
    3e3533c56cf8 wifi: rtlwifi: fix incorrect error codes in rtl_debugfs_set_write_reg()
    03109f1870e2 wifi: rtlwifi: fix incorrect error codes in rtl_debugfs_set_write_rfreg()
    e163e64227ad rtlwifi: Replace RT_TRACE with rtl_dbg
    faec6b865468 rtlwifi: Start changing RT_TRACE into rtl_dbg
    7c5e804b6d52 f2fs: handle dqget error in f2fs_transfer_project_quota()
    7a2ae008a53c scsi: megaraid: Fix mega_cmd_done() CMDID_INT_CMDS
    a4245323d272 scsi: target: iscsit: Fix TAS handling during conn cleanup
    8e402d5198b3 net/packet: convert po->auxdata to an atomic flag
    f3ac72c7ab20 net/packet: convert po->origdev to an atomic flag
    4760229b820d net/packet: annotate accesses to po->xmit
    47464e0c658a vlan: partially enable SIOCSHWTSTAMP in container
    8f851a75bbc7 scm: fix MSG_CTRUNC setting condition for SO_PASSSEC
    7160c6940a97 wifi: rtw88: mac: Return the original error from rtw_mac_power_switch()
    743ae09b28ce wifi: rtw88: mac: Return the original error from rtw_pwr_seq_parser()
    72d5edceb2de tools: bpftool: Remove invalid \' json escape
    0d1792c98351 wifi: ath6kl: reduce WARN to dev_dbg() in callback
    8d17563174b0 wifi: ath5k: fix an off by one check in ath5k_eeprom_read_freq_list()
    d98993186607 wifi: ath9k: hif_usb: fix memory leak of remain_skbs
    1286c4ce1f01 wifi: ath6kl: minor fix for allocation size
    a3e7a3d472c2 tick/common: Align tick period with the HZ tick.
    04be737176e6 tick: Get rid of tick_period
    3df29117d8a6 tick/sched: Optimize tick_do_update_jiffies64() further
    b6fe34d93655 tick/sched: Reduce seqcount held scope in tick_do_update_jiffies64()
    746eac77e008 tick/sched: Use tick_next_period for lockless quick check
    a23607579f12 timekeeping: Split jiffies seqlock
    22d7ec50ffdd debugobject: Prevent init race with static objects
    a687da500464 arm64: kgdb: Set PSTATE.SS to 1 to re-enable single-step
    442470948c04 x86/ioapic: Don't return 0 from arch_dynirq_lower_bound()
    824683dbec23 regulator: stm32-pwr: fix of_iomap leak
    53adb408b170 media: rc: gpio-ir-recv: Fix support for wake-up
    9df630dafa1a media: rcar_fdp1: Fix refcount leak in probe and remove function
    6fd6e2f29c18 media: rcar_fdp1: Fix the correct variable assignments
    75b55a3cbb4a media: rcar_fdp1: Make use of the helper function devm_platform_ioremap_resource()
    03d234459259 media: rcar_fdp1: fix pm_runtime_get_sync() usage count
    aebe8e43d85e media: rcar_fdp1: simplify error check logic at fdp_open()
    a4b6ab360f56 media: saa7134: fix use after free bug in saa7134_finidev due to race condition
    cd1583caed7e media: dm1105: Fix use after free bug in dm1105_remove due to race condition
    0c61a6897c47 x86/apic: Fix atomic update of offset in reserve_eilvt_offset()
    5224ea575196 regulator: core: Avoid lockdep reports when resolving supplies
    73b262115f5f regulator: core: Consistently set mutex_owner when using ww_mutex_lock_slow()
    9b53238b3be2 drm/lima/lima_drv: Add missing unwind goto in lima_pdev_probe()
    0a6d476d9c9d mmc: sdhci-of-esdhc: fix quirk to ignore command inhibit for data
    f79421c36070 drm/msm/adreno: drop bogus pm_runtime_set_active()
    438d00b18d55 drm/msm/adreno: Defer enabling runpm until hw_init()
    594726c93841 drm/msm: fix unbalanced pm_runtime_enable in adreno_gpu_{init, cleanup}
    37c8085cf9c0 firmware: qcom_scm: Clear download bit during reboot
    620b983589e0 media: av7110: prevent underflow in write_ts_to_decoder()
    1205c52cf270 media: uapi: add MEDIA_BUS_FMT_METADATA_FIXED media bus format.
    c6a315f0b140 media: bdisp: Add missing check for create_workqueue
    1a057b68952d ARM: dts: qcom: ipq8064: Fix the PCI I/O port range
    699bf5a793ca ARM: dts: qcom: ipq8064: reduce pci IO size to 64K
    1d207fcdf670 ARM: dts: qcom: ipq4019: Fix the PCI I/O port range
    e0162c92973b EDAC/skx: Fix overflows on the DRAM row address mapping arrays
    acb6f45775bb arm64: dts: renesas: r8a774c0: Remove bogus voltages from OPP table
    0524eb688297 arm64: dts: renesas: r8a77990: Remove bogus voltages from OPP table
    a535b5d4a2c3 drm/probe-helper: Cancel previous job before starting new one
    4223f98d4d45 drm/vgem: add missing mutex_destroy
    8747cd580b59 drm/rockchip: Drop unbalanced obj unref
    9773c58594ff erofs: fix potential overflow calculating xattr_isize
    880c79bdb002 erofs: stop parsing non-compact HEAD index if clusterofs is invalid
    e998107daad2 tpm, tpm_tis: Do not skip reset of original interrupt vector
    1c131a32a9b5 selinux: ensure av_permissions.h is built when needed
    11458692ebd2 selinux: fix Makefile dependencies of flask.h
    823f554747f8 ubifs: Free memory for tmpfile name
    d3f1b113a503 ubi: Fix return value overwrite issue in try_write_vid_and_data()
    6f2eee5457bc ubifs: Fix memleak when insert_old_idx() failed
    2c2a76b7c4b5 Revert "ubifs: dirty_cow_znode: Fix memleak in error handling path"
    5d1f14beabab i2c: omap: Fix standard mode false ACK readings
    d482617fa662 KVM: nVMX: Emulate NOPs in L2, and PAUSE if it's not intercepted
    67d33b8c5696 reiserfs: Add security prefix to xattr name in reiserfs_security_write()
    2399b1fda025 ring-buffer: Sync IRQ works before buffer destruction
    a7fa8c9dc851 pwm: meson: Fix g12a ao clk81 name
    a3e0d3430f33 pwm: meson: Fix axg ao mux parents
    719459877d58 kheaders: Use array declaration instead of char
    4ec3be7003b6 ipmi: fix SSIF not responding under certain cond.
    bead854bcca2 ipmi:ssif: Add send_retries increment
    0f91290774c7 MIPS: fw: Allow firmware to pass a empty env
    3092933b2637 xhci: fix debugfs register accesses while suspended
    3c5a28658d12 debugfs: regset32: Add Runtime PM support
    2298b30010fd staging: iio: resolver: ads1210: fix config mode
    fbd11f086bf1 perf sched: Cast PTHREAD_STACK_MIN to int as it may turn into sysconf(__SC_THREAD_STACK_MIN_VALUE)
    6525d2fd6f83 USB: dwc3: fix runtime pm imbalance on unbind
    2d5844aa6e56 USB: dwc3: fix runtime pm imbalance on probe errors
    0804f3715c09 asm-generic/io.h: suppress endianness warnings for readq() and writeq()
    944ff47a19f2 ASoC: Intel: bytcr_rt5640: Add quirk for the Acer Iconia One 7 B1-750
    f00e4bfd7f08 iio: adc: palmas_gpadc: fix NULL dereference on rmmod
    85ed09c33021 USB: serial: option: add UNISOC vendor and TOZED LT70C product
    48cdcb40d589 bluetooth: Perform careful capability checks in hci_sock_ioctl()
    c8258fc827c8 drm/fb-helper: set x/yres_virtual in drm_fb_helper_check_var
    425eea395f1f wifi: brcmfmac: slab-out-of-bounds read in brcmf_get_assoc_ies()
    3b7509b6f5e2 counter: 104-quad-8: Fix race condition between FLAG and CNTR reads

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 8ad2207dd2..01eca24a00 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b2e35e842864b87c1b081e27327799f9e0d2ac97"
-SRCREV_meta ?= "12e1d8d16de51659eddf0411d67d4eae4b4ac767"
+SRCREV_machine ?= "c705bb899d37bbd61a87a2f850e4d6f04613a908"
+SRCREV_meta ?= "c7d5b73674d53f51772862b951d8cc56683ef04f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.242"
+LINUX_VERSION ?= "5.4.243"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 31a1ee783b..c3d4ff4608 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.242"
+LINUX_VERSION ?= "5.4.243"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "1091132f5b9b1f56bbd6b408a2d3652aeb1b5405"
-SRCREV_machine ?= "98224933ef9fd6b6f600c27037d7c59c3af2aab2"
-SRCREV_meta ?= "12e1d8d16de51659eddf0411d67d4eae4b4ac767"
+SRCREV_machine_qemuarm ?= "140d4ff6bab1e5959377d4974ade490c837ef9cc"
+SRCREV_machine ?= "66990885cd865944a093b47ee7164ef2838f75a3"
+SRCREV_meta ?= "c7d5b73674d53f51772862b951d8cc56683ef04f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index e606bb4c73..c361f0c701 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "210301f79471a6b8bbd8ce7da56f19f34beacf1d"
-SRCREV_machine_qemuarm64 ?= "78a9e72b8046e89a23e44e8f3ad79ded96484237"
-SRCREV_machine_qemumips ?= "d71f42f88b7b8fb09b722d269e140edf465af454"
-SRCREV_machine_qemuppc ?= "2144b992dd135ca0ffe168d112d99d48a2896b98"
-SRCREV_machine_qemuriscv64 ?= "37cd360d09d440f38d15efcd9f2a57ab9d3a10b7"
-SRCREV_machine_qemux86 ?= "37cd360d09d440f38d15efcd9f2a57ab9d3a10b7"
-SRCREV_machine_qemux86-64 ?= "37cd360d09d440f38d15efcd9f2a57ab9d3a10b7"
-SRCREV_machine_qemumips64 ?= "8e77596aadf62832d1a8bc307dab9598ce6a85d1"
-SRCREV_machine ?= "37cd360d09d440f38d15efcd9f2a57ab9d3a10b7"
-SRCREV_meta ?= "12e1d8d16de51659eddf0411d67d4eae4b4ac767"
+SRCREV_machine_qemuarm ?= "3c105623bdba36118195e9c188d728edcc00345a"
+SRCREV_machine_qemuarm64 ?= "993c666984249097d093ee71eb3dffa0844fef6c"
+SRCREV_machine_qemumips ?= "2469bc35f1c2ef5ab2e85b7b705b32e33c6350c7"
+SRCREV_machine_qemuppc ?= "98229034b888ad319d7d030d279381a671c41dc0"
+SRCREV_machine_qemuriscv64 ?= "ba7e46214a9d60247170245cc09e2e1faf6622a1"
+SRCREV_machine_qemux86 ?= "ba7e46214a9d60247170245cc09e2e1faf6622a1"
+SRCREV_machine_qemux86-64 ?= "ba7e46214a9d60247170245cc09e2e1faf6622a1"
+SRCREV_machine_qemumips64 ?= "fb1936fa93be6bfd1b18cd8568cfc5b279904fa5"
+SRCREV_machine ?= "ba7e46214a9d60247170245cc09e2e1faf6622a1"
+SRCREV_meta ?= "c7d5b73674d53f51772862b951d8cc56683ef04f"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.242"
+LINUX_VERSION ?= "5.4.243"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


