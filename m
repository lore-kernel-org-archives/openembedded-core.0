Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2F0C54E60
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 16:40:33 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.68009.1710175232469165989
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 09:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EnfYJ7YD;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-60a0599f631so24560317b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 09:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710175231; x=1710780031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x93ygu3wutSwEvnwouVk8K8ZroVMK2YQxvXvzAMdy+o=;
        b=EnfYJ7YDVekrwA2v2t+l2BW3KgrgHqAfMuh9LP5VLMP+Q8k9/qsmlwK1uQc7l5DOvD
         McyckfWuIUxSgiE7dTennk5l/gPEROESsVzGKUQunCyOR7186TMswtNd7oxfhRiO2UOh
         T8t+71RV0SbC23V3lPtu+3Qk64J682WEcI4HIB0adKHBWUZDMuC43DMEatRMmPJVOhxW
         vzbtwjk1fMUCSNZJ/3Wd3DUQelC1+WitAtVYxCiRMg+YvRmyjsfZldjdB7Vk+pOCM9Nc
         Vvsg1UY3md5p7g4bn48dMEx8TSkD3lhiJwZnqNjs39Q9fUXLvphOTpPJvnkq9wATDVbr
         hLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710175231; x=1710780031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x93ygu3wutSwEvnwouVk8K8ZroVMK2YQxvXvzAMdy+o=;
        b=eWqkIHhRK66a/fKjIIwG1MrQKeKyhE2BJWiSsfAHOcJ0Fkq9tLiMhixWPNS4qLQP96
         inaGrtE7TB8AeN3lViXjvXWJ4gi+F6plr4dAdwQ1I1ju6L3OjnDW/KucAXBRIKOYQ0KG
         VV8RTNLvH0dmMsH8EdVTYCMO2DLR7/Hm9Jh8yaQLLHOoin3wjyvQ0CHShMToK+llSOAv
         eLSxjCkBW3o53FWsQGo/VKQYVqnFPKMDNV5oChRVCfnKrGPefQCiJYLLexv0VOw7EYPQ
         9vITYPHp14ro5kFO4EG7aOjhKx0OIwa0io1ke4mjHtRa4BLKIxN2xJEZMSNF7kjBC/di
         xd9w==
X-Gm-Message-State: AOJu0YxBBcTXnxnwOvYifLYLaEaS40mEh6GVSJkLStTrT1b+AiTBwIyF
	65NRkU1q6VnvnG1EwauDujSlKSkD7YoUy+hS1XniXQwncUjiSCYgmhJubZTnoZY=
X-Google-Smtp-Source: AGHT+IH/UCdThSe1YDeXXPA2wYSWSZibc7eEvTtFKdTzg9FVzJSfzejBAUNESJy7NfkIcUXuPQ6rkg==
X-Received: by 2002:a81:6041:0:b0:609:71be:18ef with SMTP id u62-20020a816041000000b0060971be18efmr6013983ywb.51.1710175231243;
        Mon, 11 Mar 2024 09:40:31 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id h14-20020a81b64e000000b00603eb201977sm1421672ywk.70.2024.03.11.09.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:40:29 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7][kirkstone] linux-yocto/5.15: update to v5.15.149
Date: Mon, 11 Mar 2024 12:40:21 -0400
Message-Id: <24a7a9bbf2e49bf8c8e94b97c7562f831ed72917.1710175022.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710175022.git.bruce.ashfield@gmail.com>
References: <cover.1710175022.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 16:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196946

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    458ce51d0356 Linux 5.15.149
    d72da18772ff usb: dwc3: gadget: Ignore End Transfer delay on teardown
    acff71e58748 media: Revert "media: rkisp1: Drop IRQF_SHARED"
    9ae312f7f3c2 usb: dwc3: gadget: Execute gadget stop after halting the controller
    921acacb92b7 usb: dwc3: gadget: Don't delay End Transfer on delayed_status
    4178bfa3fc9d staging: fbtft: core: set smem_len before fb_deferred_io_init call
    9e25a0054090 smb3: Replace smb2pdu 1-element arrays with flex-arrays
    0b49eac39c99 fs/ntfs3: Add null pointer checks
    4c73597f68d7 net: bcmgenet: Fix EEE implementation
    62900d358c48 Revert "selftests/bpf: Test tail call counting with bpf2bpf and data on stack"
    75ac8dc02850 drm/msm/dsi: Enable runtime PM
    c7a0fa3a6657 PM: runtime: Have devm_pm_runtime_enable() handle pm_runtime_dont_use_autosuspend()
    1974b3c19a79 arm64: Subscribe Microsoft Azure Cobalt 100 to ARM Neoverse N2 errata
    888a0a46b80f dm: limit the number of targets and parameter size area
    cf4da91e99f1 nilfs2: replace WARN_ONs for invalid DAT metadata block requests
    8fa90634ec3e nilfs2: fix potential bug in end_buffer_async_write
    50fb4e17df31 sched/membarrier: reduce the ability to hammer on sys_membarrier
    b9aafef74407 netfilter: ipset: Missing gc cancellations fixed
    6c53e8547687 net: prevent mss overflow in skb_segment()
    95c0babebe6a hrtimer: Ignore slack time for RT tasks in schedule_hrtimeout_range()
    c2dc077d8f72 netfilter: ipset: fix performance regression in swap operation
    3b3e4d3560e3 scripts/decode_stacktrace.sh: optionally use LLVM utilities
    473791d286a8 scripts: decode_stacktrace: demangle Rust symbols
    1ce4ac55d96e scripts/decode_stacktrace.sh: support old bash version
    2655757a3f10 fbdev: flush deferred IO before closing
    15492bab7393 fbdev: Fix incorrect page mapping clearance at fb_deferred_io_release()
    87b9802ca824 fbdev: Fix invalid page access after closing deferred I/O devices
    9a95fc04261f fbdev: Rename pagelist to pagereflist for deferred I/O
    186b89659c4c fbdev: Track deferred-I/O pages in pageref struct
    e79b2b2aadef fbdev: defio: fix the pagelist corruption
    0616b00a31d6 fbdev: Don't sort deferred-I/O pages by default
    5d3aff76a316 fbdev/defio: Early-out if page is already enlisted
    48a09969e43e serial: 8250_exar: Set missing rs485_supported flag
    9ef7419bc20c serial: 8250_exar: Fill in rs485_supported
    aded03eda2ba usb: dwc3: gadget: Queue PM runtime idle on disconnect event
    21f0bff281b5 usb: dwc3: gadget: Handle EP0 request dequeuing properly
    89353c886477 usb: dwc3: gadget: Refactor EP0 forced stall/restart into a separate API
    915619257332 usb: dwc3: gadget: Stall and restart EP0 if host is unresponsive
    352b38d15c6d usb: dwc3: gadget: Submit endxfer command if delayed during disconnect
    9cccdcc95e33 usb: dwc3: gadget: Force sending delayed status during soft disconnect
    1ea8a2a532e9 usb: dwc3: Fix ep0 handling when getting reset while doing control transfer
    12c0a0804ade usb: dwc3: gadget: Delay issuing End Transfer
    487341852fbc usb: dwc3: gadget: Only End Transfer for ep0 data phase
    9273bd26b06d usb: dwc3: ep0: Don't prepare beyond Setup stage
    92f7a10a2bfe usb: dwc3: gadget: Wait for ep0 xfers to complete during dequeue
    2bb86817b33c crypto: lib/mpi - Fix unexpected pointer access in mpi_ec_init
    44a8a2c92e5a bus: moxtet: Add spi device table
    4e82b9c11d3c dma-buf: add dma_fence_timestamp helper
    36f7371de977 af_unix: Fix task hung while purging oob_skb in GC.
    ff2f35f5cda0 tracing: Inform kmemleak of saved_cmdlines allocation
    579cb4ff1fc5 pmdomain: core: Move the unused cleanup to a _sync initcall
    41ccb5bcbf03 can: j1939: Fix UAF in j1939_sk_match_filter during setsockopt(SO_J1939_FILTER)
    03358aba9916 can: j1939: prevent deadlock by changing j1939_socks_lock to rwlock
    6315697fc5bf of: property: fix typo in io-channels
    310c7d9853ef mm: hugetlb pages should not be reserved by shmat() if SHM_NORESERVE
    70e329b44076 ceph: prevent use-after-free in encode_cap_msg()
    99fa6d451d98 net: ethernet: ti: cpsw_new: enable mac_managed_pm to fix mdio
    ff42d99e50b9 s390/qeth: Fix potential loss of L3-IP@ in case of network issues
    ddb4be0eb2ac net: ethernet: ti: cpsw: enable mac_managed_pm to fix mdio
    86244ae70715 irqchip/gic-v3-its: Fix GICv4.1 VPE affinity update
    27a2af914ff5 irqchip/irq-brcmstb-l2: Add write memory barrier before exit
    b10c8883f845 wifi: mac80211: reload info pointer in ieee80211_tx_dequeue()
    ef5b1041f756 nfp: flower: prevent re-adding mac index for bonded port
    e58efe0f7af8 nfp: use correct macro for LengthSelect in BAR config
    7535ec350a5f crypto: ccp - Fix null pointer dereference in __sev_platform_shutdown_locked
    7e9b622bd074 nilfs2: fix hang in nilfs_lookup_dirty_data_buffers()
    120f7fa2008e nilfs2: fix data corruption in dsync block recovery for small block sizes
    ee28bbb68518 ALSA: hda/conexant: Add quirk for SWS JS201D
    776f0c695df1 mmc: slot-gpio: Allow non-sleeping GPIO ro
    62fa823049c2 x86/mm/ident_map: Use gbpages only where full GB page should be mapped.
    1fb17e9b840c x86/Kconfig: Transmeta Crusoe is CPU family 5, not 6
    0fc0bcbab6c2 powerpc/64: Set task pt_regs->link to the LR value on scv entry
    72bf8760ad52 serial: max310x: fail probe if clock crystal is unstable
    b67b421a825f serial: max310x: improve crystal stable clock detection
    2e8b2b9180a5 serial: max310x: set default value when reading clock ready bit
    f8777d33ccc5 ring-buffer: Clean ring_buffer_poll_wait() error return
    7656372ae190 hv_netvsc: Fix race condition between netvsc_probe and netvsc_remove
    4cc9092827c9 drm/prime: Support page array >= 4GB
    d98210108e7b media: rc: bpf attach/detach requires write permission
    a4b4ba772e4b iio: accel: bma400: Fix a compilation problem
    1c6d19c8cbf6 iio: core: fix memleak in iio_device_register_sysfs
    8d5838a473e8 iio: magnetometer: rm3100: add boundary check for the value read from RM3100_REG_TMRC
    7b9cabd478d8 staging: iio: ad5933: fix type mismatch regression
    047aa3dc0aeb tracing: Fix wasted memory in saved_cmdlines logic
    afba9d11320d ext4: fix double-free of blocks due to wrong extents moved_len
    b7902e34b0d7 misc: fastrpc: Mark all sessions as invalid in cb_remove
    82722b453dc2 binder: signal epoll threads of self-work
    4052b1803127 ALSA: hda/cs8409: Suppress vmaster control for Dolphin models
    cc3cb482c093 ASoC: codecs: wcd938x: handle deferred probe
    08c84d164091 ALSA: hda/realtek: Enable headset mic on Vaio VJFE-ADL
    8b2f21991479 xen-netback: properly sync TX responses
    de769423b2f0 net: hsr: remove WARN_ONCE() in send_hsr_supervision_frame()
    471c9ede8061 nfc: nci: free rx_data_reassembly skb on NCI device cleanup
    ac0f160a364e kbuild: Fix changing ELF file type for output of gen_btf for big endian
    4bcfab73882d firewire: core: correct documentation of fw_csr_string() kernel API
    d260a5b76d7a lsm: fix the logic in security_inode_getsecctx()
    65158edb0a3a Revert "drm/amd: flush any delayed gfxoff on suspend entry"
    5b8f473c4de9 scsi: Revert "scsi: fcoe: Fix potential deadlock on &fip->ctlr_lock"
    6f95120f898b mptcp: fix data re-injection from stale subflow
    b7449c9fe003 modpost: trim leading spaces when processing source files list
    1f8d0691c505 i2c: i801: Fix block process call transactions
    23a8b74fe9c4 i2c: i801: Remove i801_set_block_buffer_mode
    2738e0aa2fb2 powerpc/kasan: Fix addr error caused by page alignment
    207557e393a1 media: ir_toy: fix a memleak in irtoy_tx
    88936ceab6b4 usb: dwc3: gadget: Fix NULL pointer dereference in dwc3_gadget_suspend
    6f54aa9ad56e usb: f_mass_storage: forbid async queue when shutdown happen
    44c7567cc4aa USB: hub: check for alternate port before enabling A_ALT_HNP_SUPPORT
    3aa71c77170c usb: ucsi_acpi: Fix command completion handling
    712afb6ba16c iio: hid-sensor-als: Return 0 for HID_USAGE_SENSOR_TIME_TIMESTAMP
    853307924a90 HID: wacom: Do not register input devices until after hid_hw_start
    20902b760efd HID: wacom: generic: Avoid reporting a serial of '0' to userspace
    62f5d219edbd HID: i2c-hid-of: fix NULL-deref on failed power up
    20d8a8fe00b2 ALSA: hda/realtek: Enable Mute LED on HP Laptop 14-fq0xxx
    16dc27567244 ALSA: hda/realtek: Fix the external mic not being recognised for Acer Swift 1 SF114-32
    595865eb4ec5 scsi: storvsc: Fix ring buffer size calculation
    5099871b3703 mm/writeback: fix possible divide-by-zero in wb_dirty_limits(), again
    b5085b5ac1d9 tracing/trigger: Fix to return error if failed to alloc snapshot
    cd459beede7b scs: add CONFIG_MMU dependency for vfree_atomic()
    29b368101086 i40e: Fix waiting for queues of all VSIs to be disabled
    8e89ac8852b5 MIPS: Add 'memory' clobber to csum_ipv6_magic() inline assembler
    9bc718f6a56a net: sysfs: Fix /sys/class/net/<iface> path for statistics
    d14b8e2005f3 ASoC: rt5645: Fix deadlock in rt5645_jack_detect_work()
    2ed13fda5942 spi: ppc4xx: Drop write-only variable
    c45f2fa92cb2 net: openvswitch: limit the number of recursions from action sets
    ca8c08db6473 wifi: iwlwifi: Fix some error codes
    1ab2a02bf103 of: unittest: Fix compile in the non-dynamic case
    f0dc9c004b22 btrfs: send: return EOPNOTSUPP on unknown flags
    980e2bee30f1 btrfs: forbid deleting live subvol qgroup
    e31546b0f34a btrfs: do not ASSERT() if the newly created subvolume already got read
    08bead026bd1 btrfs: forbid creating subvol qgroups
    2bab493a5624 netfilter: nft_set_rbtree: skip end interval element from gc
    658020d79781 net: stmmac: xgmac: fix a typo of register name in DPP safety handling
    3f2e5581cb39 net: stmmac: xgmac: use #define for string constants
    1027d6d63c8d clocksource: Skip watchdog check for large watchdog intervals
    be38f291fd4d vhost: use kzalloc() instead of kmalloc() followed by memset()
    132305ee7348 Input: atkbd - skip ATKBD_CMD_SETLEDS when skipping ATKBD_CMD_GETID
    76889580163c Input: i8042 - fix strange behavior of touchpad on Clevo NS70PU
    15524057a390 hrtimer: Report offline hrtimer enqueue
    e2aaab6fcb16 usb: host: xhci-plat: Add support for XHCI_SG_TRB_CACHE_SIZE_QUIRK
    5c654c582f5a usb: dwc3: host: Set XHCI_SG_TRB_CACHE_SIZE_QUIRK
    efe1bfe067b8 USB: serial: cp210x: add ID for IMST iM871A-USB
    3799bb646f5e USB: serial: option: add Fibocom FM101-GL variant
    2998a7ddff07 USB: serial: qcserial: add new usb-id for Dell Wireless DW5826e
    c1be84b8ee61 ALSA: usb-audio: Add a quirk for Yamaha YIT-W12TX transmitter
    8b0386bca533 drivers: lkdtm: fix clang -Wformat warning
    1e4d3f8bd880 blk-iocost: Fix an UBSAN shift-out-of-bounds warning
    0d3dab886706 scsi: core: Move scsi_host_busy() out of host lock if it is for per-command
    ae4acad41b0f fs/ntfs3: Fix an NULL dereference bug
    4f0b6f2c222b netfilter: nft_set_pipapo: remove scratch_aligned pointer
    ed965103651b netfilter: nft_set_pipapo: add helper to release pcpu scratch area
    24547e88da4d netfilter: nft_set_pipapo: store index in scratch maps
    44725dc0049d netfilter: nft_ct: reject direction for ct id
    42442f74314d drm/amd/display: Implement bounds check for stream encoder creation in DCN301
    bc6f288c10f8 drm/amd/display: Fix multiple memory leaks reported by coverity
    fb49e60d7181 netfilter: nft_compat: restrict match/target protocol to u16
    5f1c4efced3b netfilter: nft_compat: reject unused compat flag
    58fbe665b097 ppp_async: limit MRU to 64K
    4fe505c63aa3 af_unix: Call kfree_skb() for dead unix_(sk)->oob_skb in GC.
    c1701ea85ef0 tipc: Check the bearer type before calling tipc_udp_nl_bearer_add()
    69682953dddb rxrpc: Fix response to PING RESPONSE ACKs to a dead call
    3266e638ba5c inet: read sk->sk_family once in inet_recv_error()
    7df911d4f1f6 hwmon: (coretemp) Fix bogus core_id to attr name mapping
    a16afec8e83c hwmon: (coretemp) Fix out-of-bounds memory access
    0d5ceb4caa92 hwmon: (aspeed-pwm-tacho) mutex for tach reading
    c08a3943dc6b octeontx2-pf: Fix a memleak otx2_sq_init
    15393c8fd385 atm: idt77252: fix a memleak in open_card_ubr0
    d964dd1bc145 tunnels: fix out of bounds access when building IPv6 PMTU error
    5c45e6d015b7 selftests: net: avoid just another constant wait
    ea51f12e93ee selftests: net: cut more slack for gro fwd tests.
    6609e98ed829 net: stmmac: xgmac: fix handling of DPP safety error for DMA channels
    513dd309b3d0 drm/msm/dp: return correct Colorimetry for DP_TEST_DYNAMIC_RANGE_CEA case
    8cc889b9dea0 phy: ti: phy-omap-usb2: Fix NULL pointer dereference for SRP
    5db6dd838edf dmaengine: fix is_slave_direction() return false when DMA_DEV_TO_DEV
    850b64fd38aa phy: renesas: rcar-gen3-usb2: Fix returning wrong error code
    15eb996d7d13 dmaengine: fsl-qdma: Fix a memory leak related to the queue command DMA
    c71d4578a377 dmaengine: fsl-qdma: Fix a memory leak related to the status queue DMA
    71fe7fd3d9dd dmaengine: ti: k3-udma: Report short packet errors
    c75460bf7ac2 dmaengine: fsl-dpaa2-qdma: Fix the size of dma pools
    725a9ac71732 ASoC: codecs: lpass-wsa-macro: fix compander volume hack
    48471f7a4c5a bonding: remove print in bond_verify_device_path
    85d64b0c3929 HID: apple: Add 2021 magic keyboard FN key mapping
    97799743b495 HID: apple: Add support for the 2021 Magic Keyboard
    c5b70b8f78ab gve: Fix use-after-free vulnerability
    ce3c5039e614 arm64: irq: set the correct node for shadow call stack
    8cdf9b6caa7e net: sysfs: Fix /sys/class/net/<iface> path
    f3ce3e003890 selftests: net: fix available tunnels detection
    c8f6b3b864cb af_unix: fix lockdep positive in sk_diag_dump_icons()
    5823acd7593a net: ipv4: fix a memleak in ip_setup_cork
    b775ced05489 netfilter: nft_ct: sanitize layer 3 and 4 protocol number in custom expectations
    5d7a4559bce6 netfilter: nf_log: replace BUG_ON by WARN_ON_ONCE when putting logger
    4cdab7167545 netfilter: nf_tables: restrict tunnel object to NFPROTO_NETDEV
    beb732819261 bridge: mcast: fix disabled snooping after long uptime
    dbc1b89981f9 llc: call sock_orphan() at release time
    a9ef5dc93890 ipv6: Ensure natural alignment of const ipv6 loopback and router addresses
    a2e5f021cac1 ixgbe: Fix an error handling path in ixgbe_read_iosf_sb_reg_x550()
    c7f47912f72f ixgbe: Refactor overtemp event handling
    52ec65d4d4ba ixgbe: Refactor returning internal error codes
    7683f41c7b7b ixgbe: Remove non-inclusive language
    718f446e6031 tcp: add sanity checks to rx zerocopy
    af6b5c50d47a ip6_tunnel: make sure to pull inner header in __ip6_tnl_rcv()
    6d5645016600 ip6_tunnel: use dev_sw_netstats_rx_add()
    157e1cb2c0d8 selftests: net: give more time for GRO aggregation
    d37c1c81419f scsi: core: Move scsi_host_busy() out of host lock for waking up EH handler
    022e2310e86d scsi: isci: Fix an error code problem in isci_io_request_build()
    bc009cb12f7f drm: using mul_u32_u32() requires linux/math64.h
    cfe839036758 wifi: cfg80211: fix RCU dereference in __cfg80211_bss_update
    8a070a5884dc perf: Fix the nr_addr_filters fix
    b203bc5e229a drm/amdkfd: Fix 'node' NULL check in 'svm_range_get_range_boundaries()'
    362754ec2c32 drm/amdgpu: Release 'adev->pm.fw' before return in 'amdgpu_device_need_post()'
    2f7f8e109b54 drm/amd/powerplay: Fix kzalloc parameter 'ATOM_Tonga_PPM_Table' in 'get_platform_power_management_table()'
    a9c15d6e8aee ceph: fix deadlock or deadcode of misusing dget()
    89e0e66682e1 blk-mq: fix IO hang from sbitmap wakeup race
    105874a454e8 virtio_net: Fix "‘%d’ directive writing between 1 and 11 bytes into a region of size 10" warnings
    7a70663ba02b drm/amdkfd: Fix lock dependency warning
    93ecc12925b4 libsubcmd: Fix memory leak in uniq()
    82006e24aa10 PCI/AER: Decode Requester ID when no error info found
    7289a6e6fc6e PCI: Fix 64GT/s effective data rate calculation
    f4dce08ba119 fs/kernfs/dir: obey S_ISGID
    ef86cdc688a9 tty: allow TIOCSLCKTRMIOS with CAP_CHECKPOINT_RESTORE
    8451aa66943b selftests/sgx: Fix linker script asserts
    56073287613b usb: hub: Replace hardcoded quirk value with BIT() macro
    a7af1be5cf55 perf cs-etm: Bump minimum OpenCSD version to ensure a bugfix is present
    ff1c7e2fb9e9 PCI: switchtec: Fix stdev_release() crash after surprise hot remove
    52d42ac643e8 PCI: Only override AMD USB controller if required
    1a4f408561e7 mailbox: arm_mhuv2: Fix a bug for mhuv2_sender_interrupt
    28497271ff33 mfd: ti_am335x_tscadc: Fix TI SoC dependencies
    f7752e5f53db xen/gntdev: Fix the abuse of underlying struct page in DMA-buf import
    9b7d253b823a i3c: master: cdns: Update maximum prescaler value for i2c clock
    0c7478a2da3f um: time-travel: fix time corruption
    1e3d449b15c2 um: net: Fix return type of uml_net_start_xmit()
    b7b44ee08d73 um: Don't use vfprintf() for os_info()
    4c4b366addb3 um: Fix naming clash between UML and scheduler
    f5010e2892ae leds: trigger: panic: Don't register panic notifier if creating the trigger failed
    f13b8cb5a692 ALSA: hda/conexant: Fix headset auto detect fail in cx8070 and SN6140
    bd086bd1e331 drm/amdgpu: Drop 'fence' check in 'to_amdgpu_amdkfd_fence()'
    702b759168d8 drm/amdgpu: Let KFD sync with VM fences
    8998723de474 clk: imx: clk-imx8qxp: fix LVDS bypass, pixel and phy clocks
    9709da9d1086 clk: imx: scu: Fix memory leak in __imx_clk_gpr_scu()
    91828d9316eb watchdog: it87_wdt: Keep WDTCTRL bit 3 unmodified for IT8784/IT8786
    54a84bad7b3b clk: mmp: pxa168: Fix memory leak in pxa168_clk_init()
    fcc477e61044 clk: hi3620: Fix memory leak in hi3620_mmc_clk_init()
    77bcd4ab446f drm/amdgpu: fix ftrace event amdgpu_bo_move always move on same heap
    2b5a22f0ccc0 drm/msm/dpu: Ratelimit framedone timeout msgs
    a889d9012dae media: i2c: imx335: Fix hblank min/max values
    d1e0fdbabff7 media: ddbridge: fix an error code problem in ddb_probe
    ed790bd0903e IB/ipoib: Fix mcast list locking
    5fcd8a81d303 drm/exynos: Call drm_atomic_helper_shutdown() at shutdown/unbind time
    7ea0f29d9fd8 f2fs: fix to tag gcing flag on page during block migration
    8ab28b2d70a4 media: rkisp1: Drop IRQF_SHARED
    9d23b21a2df2 ALSA: hda: intel-dspcfg: add filters for ARL-S and ARL
    b1a53c923cc7 ALSA: hda: Intel: add HDA_ARL PCI ID support
    684cb957fe1a PCI: add INTEL_HDA_ARL to pci_ids.h
    d08e032f752b media: rockchip: rga: fix swizzling for RGB formats
    fdf14a7c2bea media: stk1160: Fixed high volume of stk1160_dbg messages
    3cdc644470e4 drm/mipi-dsi: Fix detach call without attach
    711b5cc5f60e drm/framebuffer: Fix use of uninitialized variable
    df31f3cb0449 drm/drm_file: fix use of uninitialized variable
    6941fe8d9444 f2fs: fix write pointers on zoned device after roll forward
    2ed3db899167 drm/amd/display: Fix tiled display misalignment
    f217be126ac4 RDMA/IPoIB: Fix error code return in ipoib_mcast_join
    8eb8fca117e8 fast_dput(): handle underflows gracefully
    7fa0c4ef6776 ASoC: doc: Fix undefined SND_SOC_DAPM_NOPM argument
    82ccd840e039 ALSA: hda: Refer to correct stream index at loops
    b4fb0807a1d6 f2fs: fix to check return value of f2fs_reserve_new_block()
    315d966df2c6 octeontx2-af: Fix max NPC MCAM entry check while validating ref_entry
    28764fab4d51 i40e: Fix VF disable behavior to block all traffic
    2cf9158fffcc bridge: cfm: fix enum typo in br_cc_ccm_tx_parse
    1fbcb194aad5 Bluetooth: L2CAP: Fix possible multiple reject send
    84e3f673b23d Bluetooth: qca: Set both WIDEBAND_SPEECH and LE_STATES quirks for QCA2066
    2fde2254e057 wifi: cfg80211: free beacon_ies when overridden from hidden BSS
    f589258f4066 wifi: rtlwifi: rtl8723{be,ae}: using calculate_bit_shift()
    49ec369f56be ALSA: usb-audio: Add delay quirk for MOTU M Series 2nd revision
    90dbf4535668 libbpf: Fix NULL pointer dereference in bpf_object__collect_prog_relos
    9e1cae315724 wifi: rtl8xxxu: Add additional USB IDs for RTL8192EU devices
    40a71f7e91bf arm64: dts: qcom: msm8998: Fix 'out-ports' is a required property
    2f747a4f664b arm64: dts: qcom: msm8996: Fix 'in-ports' is a required property
    2aee6c4517f9 md: Whenassemble the array, consult the superblock of the freshest device
    6ab391eafa43 block: prevent an integer overflow in bvec_try_merge_hw_page
    a9d12fdc5192 net: dsa: mv88e6xxx: Fix mv88e6352_serdes_get_stats error path
    fed146364402 ARM: dts: imx23/28: Fix the DMA controller node name
    e9b724664b6f ARM: dts: imx23-sansa: Use preferred i2c-gpios properties
    3995aa523842 ARM: dts: imx27-apf27dev: Fix LED name
    7a01ad0f04f7 ARM: dts: imx25/27: Pass timing0
    b60d572d8555 ARM: dts: imx25: Fix the iim compatible string
    f6abd5e17da3 block/rnbd-srv: Check for unlikely string overflow
    963b9c5484af ionic: pass opcode to devcmd_wait
    138170757875 ARM: dts: imx1: Fix sram node
    ad54a5b041d0 ARM: dts: imx27: Fix sram node
    b4130668dce3 ARM: dts: imx: Use flash@0,0 pattern
    3693ecc0c1c8 ARM: dts: imx25/27-eukrea: Fix RTC node name
    cf5f3489b6b6 ARM: dts: rockchip: fix rk3036 hdmi ports node
    fdb812bea0bb bpf: Set uattr->batch.count as zero before batched update or deletion
    813ebba2a7bd scsi: libfc: Fix up timeout error in fc_fcp_rec_error()
    43ba03c31aed scsi: libfc: Don't schedule abort twice
    5ef63c872d24 bpf: Add map and need_defer parameters to .map_fd_put_ptr()
    9003fa9a0198 wifi: ath9k: Fix potential array-index-out-of-bounds read in ath9k_htc_txstatus()
    8c965c9c4bed ARM: dts: imx7s: Fix nand-controller #size-cells
    3eeefee8da2d ARM: dts: imx7s: Fix lcdif compatible
    f9ec664f94f0 ARM: dts: imx7d: Fix coresight funnel ports
    7733800d38c1 scsi: arcmsr: Support new PCI device IDs 1883 and 1886
    34acf5225ea0 bonding: return -ENOMEM instead of BUG in alb_upper_dev_walk
    2abaf726280e PCI: Add no PM reset quirk for NVIDIA Spectrum devices
    6b9abf50d37a scsi: lpfc: Fix possible file string name overflow when updating firmware
    79aadf649273 selftests/bpf: Fix issues in setup_classid_environment()
    6aad0814705f selftests/bpf: Fix pyperf180 compilation failure with clang18
    efe701e91697 selftests/bpf: satisfy compiler by having explicit return in btf test
    4cc198580a7b wifi: rt2x00: restart beacon queue when hardware reset
    d76c8d7ffe16 ext4: avoid online resizing failures due to oversized flex bg
    0cabe04c5616 ext4: remove unnecessary check from alloc_flex_gd()
    474f5b00c564 ext4: unify the type of flexbg_size to unsigned int
    5d2090597ca7 ext4: fix inconsistent between segment fstrim and full fstrim
    9f2e407814a6 ecryptfs: Reject casefold directory inodes
    f8cf4dabbdcb SUNRPC: Fix a suspicious RCU usage warning
    732a3bea7aba KVM: s390: fix setting of fpc register
    28a1f492cb52 s390/ptrace: handle setting of fpc register correctly
    df81cbcd26bb arch: consolidate arch_irq_work_raise prototypes
    6aa300208790 jfs: fix array-index-out-of-bounds in diNewExt
    40e21a9e48a0 rxrpc_find_service_conn_rcu: fix the usage of read_seqbegin_or_lock()
    44b86400480f afs: fix the usage of read_seqbegin_or_lock() in afs_find_server*()
    78b6ff52a541 afs: fix the usage of read_seqbegin_or_lock() in afs_lookup_volume_rcu()
    556be726a42e crypto: stm32/crc32 - fix parsing list of devices
    70a3b16113a8 crypto: octeontx2 - Fix cptvf driver cleanup
    2a37905d47bf pstore/ram: Fix crash when setting number of cpus to an odd number
    8e44dc3f96e9 jfs: fix uaf in jfs_evict_inode
    8393c80cce45 jfs: fix array-index-out-of-bounds in dbAdjTree
    6c6a96c3d74d jfs: fix slab-out-of-bounds Read in dtSearch
    e4ce01c25ccb UBSAN: array-index-out-of-bounds in dtSplitRoot
    6fe8b702125a FS:JFS:UBSAN:array-index-out-of-bounds in dbAdjTree
    7cb410316688 ACPI: APEI: set memory failure flags as MF_ACTION_REQUIRED on synchronous events
    099f6a9edbe3 PM / devfreq: Synchronize devfreq_monitor_[start/stop]
    5457b0cbaa02 ACPI: extlog: fix NULL pointer dereference check
    b17cb541f13b PNP: ACPI: fix fortify warning
    4d169334e5c0 ACPI: video: Add quirk for the Colorful X15 AT 23 Laptop
    53ab23237537 audit: Send netlink ACK before setting connection in auditd_set
    0f10c84e4437 regulator: core: Only increment use_count when enable_count changes
    a5d70e22b920 debugobjects: Stop accessing objects after releasing hash bucket lock
    c128e64ae0e6 perf/core: Fix narrow startup race when creating the perf nr_addr_filters sysfs file
    330cb5e77adb x86/mce: Mark fatal MCE's page as poison to avoid panic in the kdump kernel
    de4f5ed63b8a powerpc/lib: Validate size for vector operations
    027e61b866cb powerpc: pmd_move_must_withdraw() is only needed for CONFIG_TRANSPARENT_HUGEPAGE
    33595c0c7782 x86/boot: Ignore NMIs during very early boot
    b3bc07aec73f powerpc/64s: Fix CONFIG_NUMA=n build due to create_section_mapping()
    88a28bec865e powerpc/mm: Fix build failures due to arch_reserved_kernel_pages()
    b00f2757335e powerpc: Fix build error due to is_valid_bugaddr()
    b246a9a3c3cc drivers/perf: pmuv3: don't expose SW_INCR event in sysfs
    17093c32f644 arm64: irq: set the correct node for VMAP stack
    ac3ed969a403 powerpc/mm: Fix null-pointer dereference in pgtable_cache_add
    fb6c8127dbe1 x86/entry/ia32: Ensure s32 is sign extended to s64
    59b24e6245d1 tick/sched: Preserve number of idle sleeps across CPU hotplug events
    f3bc406e1b71 mips: Call lose_fpu(0) before initializing fcr31 in mips_set_personality_nan
    ccb03ec4294c spi: bcm-qspi: fix SFDP BFPT read by usig mspi read
    3bc801ce9d7f block: Move checking GENHD_FL_NO_PART to bdev_add_partition()
    f2d3ae8cf69b gpio: eic-sprd: Clear interrupt after set the interrupt type
    fcf44c782cac drm/exynos: gsc: minor fix for loop iteration in gsc_runtime_resume
    22937c97c527 drm/exynos: fix accidental on-stack copy of exynos_drm_plane
    76d1ffa908e1 drm: panel-simple: add missing bus flags for Tianma tm070jvhg[30/33]
    7ae053227c8c cpufreq: intel_pstate: Refine computation of P-state for given frequency
    34c02fec33ea cpufreq: intel_pstate: Drop redundant intel_pstate_get_hwp_cap() call
    aaa1f1a2ee80 ksmbd: fix global oob in ksmbd_nl_policy
    4056ece66090 btrfs: add definition for EXTENT_TREE_V2
    796d3fad8c35 PM / devfreq: Fix buffer overflow in trans_stat_show
    b448de2459b6 mm/sparsemem: fix race in accessing memory_section->usage
    904fafac104d mm: use __pfn_to_section() instead of open coding it
    1b1036c60a37 media: mtk-jpeg: Fix use after free bug due to error path handling in mtk_jpeg_dec_device_run
    4cebb1edb14e ARM: dts: qcom: sdx55: fix USB SS wakeup
    462d5a6fb272 ARM: dts: qcom: sdx55: fix USB DP/DM HS PHY interrupts
    a98b715c9449 ARM: dts: qcom: sdx55: fix pdc '#interrupt-cells'
    57be4dd630ca ARM: dts: samsung: exynos4210-i9100: Unconditionally enable LDO12
    28092c1137b7 ARM: dts: qcom: sdx55: fix USB wakeup interrupt types
    3efbd114b915 pipe: wakeup wr_wait after setting max_usage
    26bfccac21fc fs/pipe: move check to pipe_has_watch_queue()
    94991728c84f bus: mhi: host: Add alignment check for event ring read pointer
    d73f63a6452b bus: mhi: host: Rename "struct mhi_tre" to "struct mhi_ring_element"
    a1d62c775b07 PM: sleep: Fix possible deadlocks in core system-wide PM code
    d5f15888d3e2 PM: core: Remove unnecessary (void *) conversions
    fd8d6b04de04 drm/bridge: nxp-ptn3460: simplify some error checking
    9d2a462917a2 drm/tidss: Fix atomic_flush check
    bcf51e8f3cfe drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking
    b4af63da9d94 drm: Don't unref the same fb many times by mistake due to deadlock handling
    4fc86c70ea0c gpiolib: acpi: Ignore touchpad wakeup on GPD G1619-04
    e44e240d537e xfs: read only mounts with fsopen mount API are busted
    614cc65032dc firmware: arm_scmi: Check mailbox/SMT channel for consistency
    960cf4f81253 netfilter: nf_tables: reject QUEUE/DROP verdict parameters
    70f17b48c866 netfilter: nft_chain_filter: handle NETDEV_UNREGISTER for inet/ingress basechain
    0ac9cbe006bf hv_netvsc: Calculate correct ring size when PAGE_SIZE is not 4 Kbytes
    99a23462fe1a wifi: iwlwifi: fix a memory corruption
    9a64c7fc15f3 exec: Fix error handling in begin_new_exec()
    04a0786a97fc rbd: don't move requests to the running list on errors
    0877497dc978 btrfs: don't abort filesystem when attempting to snapshot deleted subvolume
    07beceb3e133 btrfs: defrag: reject unknown flags of btrfs_ioctl_defrag_range_args
    5b5319e11279 btrfs: don't warn if discard range is not aligned to sector
    f054f328bf74 btrfs: tree-checker: fix inline ref size in error messages
    5550250f36c3 btrfs: ref-verify: free ref cache before clearing mount opt
    f76e961a34ec btrfs: avoid copying BTRFS_ROOT_SUBVOL_DEAD flag to snapshot of subvolume being deleted
    415fb71a9a77 btrfs: fix race between reading a directory and adding entries to it
    a6c2dfbfa250 btrfs: refresh dir last index during a rewinddir(3) call
    0b04bbfd07d5 btrfs: set last dir index to the current last index when opening dir
    79cf35e16dd5 btrfs: fix infinite directory reads
    4c24059dd3ad net: fec: fix the unhandled context fault from smmu
    5b0f2af31a0c fjes: fix memleaks in fjes_hw_setup
    c0d29d303390 selftests: netdevsim: fix the udp_tunnel_nic test
    af47faa6d332 net: mvpp2: clear BM pool before initialization
    5305727ba6a4 net: stmmac: Wait a bit for the reset to take effect
    022a8d0bc9c8 netfilter: nf_tables: validate NFPROTO_* family
    064bccd4a946 netfilter: nf_tables: restrict anonymous set and map names to 16 bytes
    79d4efd75e7d netfilter: nft_limit: reject configurations that cause integer overflow
    53f2cd86a81c overflow: Allow mixed type arguments
    72a729868592 net/mlx5e: fix a potential double-free in fs_any_create_groups
    c57ca114eb00 net/mlx5e: fix a double-free in arfs_create_groups
    cf0a8a3a891a net/mlx5: DR, Can't go to uplink vport on RX rule
    e5783345bdb9 net/mlx5: DR, Align mlx5dv_dr API vport action with FW behavior
    8e215c249a73 net/mlx5: DR, Replace local WIRE_PORT macro with the existing MLX5_VPORT_UPLINK
    fda9109e15a5 net/mlx5: DR, Use the right GVMI number for drop action
    50bd41dcca35 ipv6: init the accept_queue's spinlocks in inet6_create
    931366b9f29d netlink: fix potential sleeping issue in mqueue_flush_file
    fc0f8e2c9380 tcp: Add memory barrier to tcp_push()
    21a2115e0ca0 afs: Hide silly-rename files from userspace
    aef1cb00856c tracing: Ensure visibility when inserting an element into tracing_map
    00d1ee8e1d02 net/rds: Fix UBSAN: array-index-out-of-bounds in rds_cmsg_recv
    c0fe2fe7a5a2 llc: Drop support for ETH_P_TR_802_2.
    c22044270da6 llc: make llc_ui_sendmsg() more robust against bonding changes
    79eeb85c44dd vlan: skip nested type that is not IFLA_VLAN_QOS_MAPPING
    32430251129e bnxt_en: Wait for FLR to complete during probe
    d86cc6ab33b0 tcp: make sure init the accept_queue's spinlocks once
    68b888d51ac8 net/smc: fix illegal rmb_desc access in SMC-D connection dump
    bb27126aefce ksmbd: Add missing set_freezable() for freezable kthread
    d7a62b3a3d7c ksmbd: send lease break notification on FILE_RENAME_INFORMATION
    6cc508233e54 ksmbd: don't increment epoch if current state and request state are same
    5349fd419e4f ksmbd: fix potential circular locking issue in smb2_set_ea()
    9ab89353360b ksmbd: set v2 lease version on lease upgrade
    dfda2a5eb66a rename(): fix the locking of subdirectories
    b2512424c9c5 ubifs: ubifs_symlink: Fix memleak of inode->i_link in error path
    689c5f8d894b nouveau/vmm: don't set addr on the fail path to avoid warning
    2d07a63b01de rtc: Adjust failure return code for cmos_set_alarm()
    3ff34c00db0d mmc: mmc_spi: remove custom DMA mapped buffers
    50b8b7a22e90 mmc: core: Use mrq.sbc in close-ended ffu
    f0bb5d185f6e scripts/get_abi: fix source path leak
    4590f2077ef2 lsm: new security_file_ioctl_compat() hook
    cdcd8df577a8 arm64: dts: qcom: sdm845: fix USB DP/DM HS PHY interrupts
    8ed011c4e031 arm64: dts: qcom: sm8150: fix USB wakeup interrupt types
    aa38eb962673 arm64: dts: qcom: sdm845: fix USB wakeup interrupt types
    121d89f0c6d0 arm64: dts: qcom: sc7180: fix USB wakeup interrupt types
    33f8bdf37def async: Introduce async_schedule_dev_nocall()
    86c8e16252ac async: Split async_schedule_node_domain()
    58031306c022 parisc/firmware: Fix F-extend for PDC addresses
    176ed1727bad bus: mhi: host: Add spinlock to protect WP access when queueing TREs
    6e4c84316e2b bus: mhi: host: Drop chan lock before queuing buffers
    cdb15ac80aae mips: Fix max_mapnr being uninitialized on early stages
    473f1ae44b8e media: ov9734: Enable runtime PM before registering async sub-device
    2d27a7b19cb3 rpmsg: virtio: Free driver_override when rpmsg_remove()
    3c1b795124a5 media: imx355: Enable runtime PM before registering async sub-device
    a7f580cdb42e crypto: s390/aes - Fix buffer overread in CTR mode
    26cc6d7006f9 hwrng: core - Fix page fault dead lock on mmap-ed hwrng
    4d4bf19c81a1 PM: hibernate: Enforce ordering during image compression/decompression
    a6fec6324f51 crypto: api - Disallow identical driver names
    ad23246ccfa9 btrfs: sysfs: validate scrub_speed_max value
    cb904f5c7162 ext4: allow for the last group to be marked as trimmed
    a604d5f2f983 iio:adc:ad7091r: Move exports into IIO_AD7091R namespace.
    72a339554352 scsi: ufs: core: Remove the ufshcd_hba_exit() call from ufshcd_async_scan()
    226554bd27a0 scsi: ufs: core: Simplify power management during async scan
    047fce470412 dmaengine: fix NULL pointer in channel unregistration function
    e44eb4ccad49 iio: adc: ad7091r: Enable internal vref if external vref is not supplied
    49f322ce1f26 iio: adc: ad7091r: Allow users to configure device events
    6ef852a43090 iio: adc: ad7091r: Set alert bit in config register
    81ea755b8fa5 ksmbd: only v2 leases handle the directory
    999daf367b92 ksmbd: fix UAF issue in ksmbd_tcp_new_connection()
    dd1de9268745 ksmbd: validate mech token in session setup
    65cadfb3b05a ksmbd: don't allow O_TRUNC open on read-only share
    c917b0529ea9 ksmbd: free ppace array on error in parse_dacl

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 4578a1d819..39a0647c63 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "198d85bb67700ac968a286cf7f89f008bb6eff39"
-SRCREV_meta ?= "c07c75a1e9438e70a80615cac0f48eb91d8f34ea"
+SRCREV_machine ?= "8d1e346a6d3dc165a31d91b3553490eaeec7100f"
+SRCREV_meta ?= "5411949c94717c9a1b7108df7fb0ed12af43f708"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.148"
+LINUX_VERSION ?= "5.15.149"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 267ebb11c4..93b947f75a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.148"
+LINUX_VERSION ?= "5.15.149"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0780801e81912c4bbd53b4fc01dad6df556739b6"
-SRCREV_meta ?= "c07c75a1e9438e70a80615cac0f48eb91d8f34ea"
+SRCREV_machine ?= "dbe71b3b8d620bc5d1d083fd0a86a806b4d94472"
+SRCREV_meta ?= "5411949c94717c9a1b7108df7fb0ed12af43f708"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 9a7c96b453..1c6b3d1112 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c0150afdb5ca785c04acec22c7f42f42b044ca43"
-SRCREV_machine:qemuarm64 ?= "201f4f28b183815dbabda398e9ee90a2e628ad94"
-SRCREV_machine:qemumips ?= "1d82f42872b46d7f129bbe631931a09590d9d6bf"
-SRCREV_machine:qemuppc ?= "e985732d9de961b364b9bbf03ef3eba41adf8e37"
-SRCREV_machine:qemuriscv64 ?= "9bc0938c9f31f2f63b8e9d7b8f43671927858068"
-SRCREV_machine:qemuriscv32 ?= "9bc0938c9f31f2f63b8e9d7b8f43671927858068"
-SRCREV_machine:qemux86 ?= "9bc0938c9f31f2f63b8e9d7b8f43671927858068"
-SRCREV_machine:qemux86-64 ?= "9bc0938c9f31f2f63b8e9d7b8f43671927858068"
-SRCREV_machine:qemumips64 ?= "c87c9b74f382aba2886320ca29dd32544e53f15b"
-SRCREV_machine ?= "9bc0938c9f31f2f63b8e9d7b8f43671927858068"
-SRCREV_meta ?= "c07c75a1e9438e70a80615cac0f48eb91d8f34ea"
+SRCREV_machine:qemuarm ?= "8792e65a06ea69eb8ff127c2a8eb90a9567be18a"
+SRCREV_machine:qemuarm64 ?= "79d37a48e7d9d41c547d36a405b6d9b9bbf81dae"
+SRCREV_machine:qemumips ?= "57aa05a2dbb323d83f8c76855705b24f6d6ed8d4"
+SRCREV_machine:qemuppc ?= "74e68b09de66b30e1d47088474d649d22329425d"
+SRCREV_machine:qemuriscv64 ?= "dd895a1b020a475adf0e6cb8f885836e7f52e8a5"
+SRCREV_machine:qemuriscv32 ?= "dd895a1b020a475adf0e6cb8f885836e7f52e8a5"
+SRCREV_machine:qemux86 ?= "dd895a1b020a475adf0e6cb8f885836e7f52e8a5"
+SRCREV_machine:qemux86-64 ?= "dd895a1b020a475adf0e6cb8f885836e7f52e8a5"
+SRCREV_machine:qemumips64 ?= "b2d4206f5c808efbb98671d9a66a97e161713341"
+SRCREV_machine ?= "dd895a1b020a475adf0e6cb8f885836e7f52e8a5"
+SRCREV_meta ?= "5411949c94717c9a1b7108df7fb0ed12af43f708"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "6139f2a02fe0ac7a08389b4eb786e0c659039ddd"
+SRCREV_machine:class-devupstream ?= "458ce51d0356ee60c93f9f807d9827cf2a41643d"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.148"
+LINUX_VERSION ?= "5.15.149"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


