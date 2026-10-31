Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3755.1793405770983709768
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=e/OxMjZo;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a208d93758so13417555e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405769; x=1794010569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M0egYazAavA6x0CYr1cs169/P7uvw6YmANIWT79uPvw=;
        b=e/OxMjZo4p3wABWcoVcI833Kmjvk39wJkiZPTXykLahReP57UPBLkrCdacg/Ql7OG3
         +5Ma/Zo5EZUF/NTQb6iyd60o4W1tPq+B87Hyl7K9zXP79BLYusktl4KuypNXUWdRx6if
         9ylJlK+/v6/WICT1SrSx5tTKb+pPMueikVJLq696ixIHBo7UvG6KvO6dew6OV++6/dhe
         fcqZDCjDTJStdFi46n8ptv8AHCJzy+Rip6Q//35Y7pz186/6fhD76/s3utDSh5y4CzXs
         qd9gIVTN63hlGEOjdfDNW+PLyvqLEBRpLICmCR5vRbErV3tbLKJQM4DT4RPlUj2pBUY9
         65Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405769; x=1794010569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M0egYazAavA6x0CYr1cs169/P7uvw6YmANIWT79uPvw=;
        b=b6T1UjVUlmu5sqJIFlifY2kwhAc9QuM/DPYqvetR6HwGQ54z2XCbUpkirfPRxrak6R
         sx8DOQC9yejhzzcGNtjRBJCwxDWLgC9W9UdlFzw0QlqdmhI2OLNlhbUnyTZv3jFI/QwQ
         49lxDcNWwlOuO0VxkK8uoXA/0qIpMFMA6j37x0OXhXp2XKIw8sEQxRrDJENs3djmmiVU
         LtgpCgoGNCp+KtW4cbpQjvfdSQ3zNXJelAk9vOj0WGU5KTlh1i5xwW+U6AMbWwEESDu2
         mHVXl9Qqr2ZR2O6QmSBp4FTkgKArR1M1hl6IGJV9pNj2SgTQOKeqr2a6YGvlZqAEDnNd
         vr4A==
X-Gm-Message-State: AFq9FYL31zbKxdlaTRbYX2fDnyyFRQWe5HGWyFi4rn74oCqeWRI68kaZ
	j44aKzxfv4mt2UB827kjlFAQtSlHaCph7Nn9v4qyXy6JF5dWa0HZ2w2i7WsHbsF4WhsAM95Qy2h
	QP8J0Ru4=
X-Gm-Gg: AYBFou2ARyI8NZR7uDLYdiyZu1+naTpSLUwHNu/JNp9o+7h7JGZTGK3jjpf6LUGTe4A
	5ejptOrNkBXZayi3oj6NNQxc+Y4nk/OjVDqRue/xaBSq84cXTOWIKLEYdfATPhdQIabQWz5JAV/
	dl+pONKOd9s5YbcS8WjuoPrFoOKktXLzGvaw81w2TS8qyRX15Nezwt2csQTQLzwqzUvUbmXl1fO
	J04N/AS7TCfzsGdwhA1MHMNj6e+DNtOFPr8hvRGfF9J6P8HvE688ApWWluMQjH8ZGPDQayW6xFm
	xL1+OoytYcLeNwVmjVvl3ECk3V6l5E9SQjYAEkX5/Z4uEx4jC1mkr9hjRr/SSdwp2CQj3Iqlqs0
	9tLjA67d+kf06buXdp/UvWScKv/QHpvSTTSl+AIBzQyQY4JK2zwuIzMZ0nkxZ+bDMs4zJgRc4Ly
	aDdw2pggVot22T3Da47VZ56plwMXBjqSiq2d2P4c8yxFqdmTtu6v9rd5aQdRVAt9ZjhfxBlO28t
	4CFqP3fNqeruLz3k1zLOdZPGGhm8/JtSbNgZqB0xxeqz04piHxpebfHDLFqUcQw1XPdlvd9txIl
	Cn/4sPqvG+nJ926KOk6b9KbezrBbqBaQzzKazYrP/Wi2Mw6RBdETYEtlUDCRwk9xZx6iG4cqH4C
	eHqFMafeM2u1aIVKQYVEgPQ3TJKzZsZTyVNgyx6Ow3nNHPiS/3Q==
X-Received: by 2002:a05:600c:1d29:b0:4a5:5fb9:5d35 with SMTP id 5b1f17b1804b1-4ac187a7678mr89981035e9.21.1793405767835;
        Fri, 30 Oct 2026 17:16:07 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 42/55] linux-yocto/6.6: update to v6.6.157
Date: Sat, 31 Oct 2026 01:15:03 +0100
Message-ID: <62c4ea3a235c6a2e8e921a0d1e99736323825fa9.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249117
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    79643295eba17 Linux 6.6.157
    32e598324edc3 nvmet-rdma: fix queue leak when connect backlog is exceeded
    6536d707ed924 perf/x86/amd/uncore: Fix the return value of amd_uncore_df_event_init() on error
    a77a45fbadd9c net: hsr: must allocate more bytes for RedBox support
    4cad6ecdfee8c pinctrl: mediatek: common-v1: Fix error checking in mtk_eint_init()
    dfda4aabd3213 tools/build: Use SYSTEM_BPFTOOL for system bpftool
    1fb06c7a5d307 ALSA: control: Fix unannotated kfree() cleanup
    42ddedd71536d net: hsr: init prune_proxy_timer sooner
    2ea73f9a1fe72 net: hsr: Use the seqnr lock for frames received via interlink port.
    4cdb74d35b0e0 net: hsr: enable promiscuous mode on interlink port with fwd offload
    7840a2c9c797c wifi: ath11k: Fix error handling in ath11k_wmi_p2p_noa_event()
    7554d498e4283 wifi: ath11k: fix NULL dereference in ath11k_qmi_m3_load()
    ee556d118b11c firmware: arm_scmi: Roll back partial protocol table registration
    6f5fb111a0a72 irqdomain: Make build work for CONFIG_GENERIC_IRQ_CHIP=n
    712f3268a62d0 nvme: target: rdma: fix ndev refcount leak on queue connect
    b93f47d5c0288 kselftest/arm64: mte: Use the correct naming for tag check modes in check_hugetlb_options.c
    6a22da9752591 kselftest/arm64: mte: Skip the hugetlb tests if MTE not supported on such mappings
    08aaba219793b xsk: Fix offset calculation in unaligned mode
    85316d624f565 nvme-apple: Reset q->sq_tail during queue init
    073b9238fac4d nvme-apple: Prevent shared tags across queues on Apple A11
    0f0a317dd9e66 ACPI: processor: Update cpuidle driver check in __acpi_processor_start()
    a8adb672758fb ACPI: processor: Add cpuidle driver check in acpi_processor_register_idle_driver()
    d607e038f1024 ACPI: processor: idle: Remove redundant static variable and rename cstate check function
    6da7c7a29009f ACPI: processor: idle: Move max_cstate update out of the loop
    60e5299f552d4 ACPI: processor: idle: Remove redundant cstate check in acpi_processor_power_init
    49457494d5d97 pinctrl: mediatek: common-v1: Fix EINT breakage on older controllers
    944b7b366ce5d pinctrl: mediatek: Fix new design debounce issue
    d6ba3a2ca3c9d pinctrl: mediatek: eint: Drop base from mtk_eint_chip_write_mask()
    010d05df52cec net/sched: sch_htb: limit htb_classify inner-class filter hops
    4fd2ee4ac154c tcp: fix corruption of urgent data on multi-segment retransmit
    7baa0c92be39e usb: atm: usbatm: fix invalid ci_range initialization
    7566789664813 net: fec: only stop PTP if it was initialized
    a2dbac3fb03b4 slip: remove slip_hangup() to fix use-after-free in slip_receive_buf()
    82fdbf49b9f75 net/sched: bound qdisc_pkt_len to prevent qdisc soft lockup
    e4570c6556d47 net: stmmac: selftests: Account for the UC filter list for filtering tests
    556b55a209ea0 net: stmmac: dwxgmac: Account for the primary MAC address for UC filtering
    ee22ca41efdcb net: stmmac: dwmac4: Account for the primary MAC address for UC filtering
    b7be75bb83add net: stmmac: dwmac1000: Account for the primary MAC address for UC filtering
    6315e468ef7e6 net: stmmac: selftests: Check multiple MMC counters
    81dd9ed216358 selftests/arm64: Treat KSM merge_across_nodes as optional
    3e0e4275b4b12 selftests/arm64: Print missing MTE TAP headers
    2c75d9087a8e7 selftests: arm64: add hugetlb mte tests
    6030f45bd0656 netfilter: x_tables: replace pr_{info,err}() by pr_info_ratelimited()
    87f49ea98c88f netfilter: xt_HL: add pr_fmt and checkentry validation
    4fc6882b18350 netfilter: xt_cgroup: Make it independent from net_cls
    79eafe22ab0a6 netfilter: nf_tables: move hardware offload step after building the chain blob
    339f47ae04dcc virtio-net: Ensure that TCP packets don't overflow gso_segs
    ae7173188ab06 net: stmmac: selftests: Pass the IP proto mask in the TC selftest
    96a4696f8b74c net: ethernet: sun4i-emac: Fix IRQ error handling
    7a96b9f6d5ba2 samples/ftrace: Fix kthread_stop() on ERR_PTR in ftrace-direct-multi-modify
    1630774d81d06 samples/ftrace: Fix kthread_stop() on ERR_PTR in ftrace-direct-modify
    3b2e62a7655d3 libceph: validate banner payload length
    7a64106070d4b ceph: revalidate ki_pos for O_APPEND writes after cap acquisition
    faf539af1a595 ASoC: dapm: Fix off-by-one check on the second enum channel
    0664c75afe87a apparmor: policy_int make sure list heads are initialized before fail path
    fc75c2c7001c6 apparmor: Replace sprintf/strcpy with scnprintf/strscpy in aa_policy_init
    93c6fe34f22da tpm: st33zp24: Validate locality read result
    1bfd5c54e4070 tpm: st33zp24: Return zero on status read failure
    aa39a790d56b4 net/sched: sch_teql: restore skb->dev on the slave failure path
    9d782c662879c net/sched: sfq: clamp quantum to avoid signed overflow soft lockup
    dea2789a9d5ff net/sched: hhf: clamp quantum before hhf_change() to avoid overflow
    435da3734a8e6 net/sched: fq_pie: clamp default quantum to avoid signed overflow
    19bc715de421b net/sched: sch_codel: clamp default mtu to avoid disabling CoDel
    397e2b1f71d9f net/sched: fq_codel: clamp default quantum and mtu
    0675cff3c2924 net/sched: act_skbmod: fix length calculations and avoid invalid header warnings
    d9a8113a5c152 maple_tree: fix argument name in header
    bc8be70fdeb94 selftests/mm: skip COW tmpfile cases when fallocate() is unsupported
    4498f617a4948 selftests/mm: report unique test names for each cow test
    328256478e9f3 selftests/mm/cow: modify the incorrect checking parameters
    bdd5574a636f9 selftests: mm: cow: flag vmsplice() hugetlb tests as XFAIL
    d10b6f53483bb selftests/mm/cow: generalize do_run_with_thp() helper
    8086709b7f87e cifs: fix clearing stats for fastest execution of each smb2 command
    42884bd8b8fd0 net/rds: use wq_has_sleeper() in rds_cong_map_updated()
    573c088b6d479 octeontx2-af: Fix TL3/TL2 link config ENA clearing
    4bcef54e4a335 net: qualcomm: rmnet: restore skb->dev on deaggregated frames
    e3b9aa0773abd gtp: add synchronize_net() in gtp_newlink() error path to prevent use-after-free
    fc4851ff8dfb5 Bluetooth: RFCOMM: Validate MTU in rfcomm_apply_pn() to prevent infinite loop
    0b71a6caaf284 Bluetooth: btmtksdio: Fix out-of-bounds DMA read in the TX path
    89d23a0fd43e7 Bluetooth: btmtksdio: Take exclusive ownership of the SKB before TX
    8765eb64f9deb Bluetooth: btmtk: Do not discard the subsystem reset timeout
    7c7ac736b50fa Bluetooth: L2CAP: fix race l2cap_sock_cleanup_listen() vs. put_chan
    bbd262d2d750b Bluetooth: mgmt: fix 'hdev->discovery.uuids' NULL dereference
    491e4c6001796 Bluetooth: L2CAP: reject accept queue add unless BT_LISTEN
    0911a5e777e3b erofs: Fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS default logic
    74e4a43e1b0ea scsi: qla2xxx: Fix an loop timeout test
    d3c55dcc863f3 rtc: pcf85363: Add error checking to regmap calls in probe()
    dd5bd091daa48 NFSv4/pnfs: key the data server cache on the NFS version
    0faf682964678 nfs: move the nfs4_data_server_cache into struct nfs_net
    5aca000630c0f NFSv4.2: fix LAYOUTSTATS send buffer exhaustion
    957dba2b8b5ae net/smc: free pending qentry in smc_llc_flow_stop() before memset
    056395acb7041 net/smc: free stashed qentry before overwrite in REQ_ADD_LINK to ADD_LINK transition
    5f127e3cc9647 inetpeer: randomize RB-tree node comparison using SipHash
    9b0a36df7f443 net: add missing ref_tracker_dir_exit() to net_passive_dec()
    be9ed08140dee net: ipa: balance runtime PM reference on remove error
    c1ac60ad8c182 net: ipa: Convert to platform remove callback returning void
    95428d7d2c712 forcedeth: stop the tx_timeout register dump past the requested window
    93c413d953e19 net: thunderbolt: Count delivered packets in rx_packets and rx_bytes
    4b0f5b25f1146 net: bridge: Reject descending VLAN tunnel ranges
    aaebce297efc3 xsk: fix NULL pointer dereference in __xsk_rcv()
    b9d97ecb89576 xsk: avoid double checking against rx queue being full
    ba95f77c98687 xsk: Get rid of xdp_buff_xsk::orig_addr
    e4746c6e60ab1 RDMA/ucma: Allow path records to exactly fit the output buffer
    c5c7c7b6cfae7 ALSA: ice1712: Fix the card leak at probe error with the auto-cleanup
    da3c2437df2c6 ALSA: core: Add scoped cleanup helper for card references
    c2a2036209b37 ALSA: control: Use guard() for locking
    478cfdb6844fe ALSA: control: Use automatic cleanup of kfree()
    9f756f1965bad clk: visconti: Make sure clk_init_data is fully initialized
    73f4671d68193 clk: ti: Make sure clk_init_data is fully initialized
    5f74a6e9afc90 prctl: fix PR_SET_MM_AUXV losing the forced AT_NULL terminator
    6945acee8677b rtc: gamecube: check return value of devm_rtc_register_device()
    68bf51c58479d i2c: ocores: Disable clock on failed resume
    b5ba8b861b5d8 irqchip/renesas-rzg2l: Fix loss of interrupt
    321ef4e8f74e6 rtc: zynqmp: Return optional clock lookup errors
    58066940076b9 smb: client: fix request buffer leak in smb2_new_read_req()
    7afb8db47c4f1 rtc: pcf8563: fix clock provider leak on unbind
    eeac2ea4ad265 vdpa/mlx5: fix wrong list iterated in add_direct_chain error path
    feafa109f031e vdpa_sim: fix cleanup after worker creation failure
    f20ade5e9739b virtio_balloon: disable indirect descriptors
    ad22f0605c2d3 i3c: mipi-i3c-hci: Fix missing STAT_IBI_STATUS_THLD in PIO mode
    fa47845df3626 i3c: mipi-i3c-hci: Refactor PIO register initialization
    25c99c36760ec i3c: mipi-i3c-hci: Switch PIO data allocation to devm_kzalloc()
    31d1e6df88c0f i3c: mipi-i3c-hci: Quieten initialization messages
    2011e714e5f99 i3c: mipi-i3c-hci: Fix number of DAT/DCT entries for HCI versions < 1.1
    b5e40cceb591c i3c: mipi-i3c-hci: Fix DAT/DCT entry sizes
    18a4463528f09 bonding: initialize err for empty target lists
    4c2ffe2bbfdb9 mlxbf-bootctl: fix the build error with FIELD_PREP()
    c224759555a13 platform/x86: hp-bioscfg: fix password encoding bounds check
    35364a037c2df vsock: use sock_error() to consume sk_err after a failed connect
    93808d9572d40 platform/x86: dell-wmi-sysman: Fix instance ID bounds
    48796058a5cd1 net/smc: hash socket only after full initialisation in smc_sk_init()
    4944ed85a0e8a 8139cp: fix Rx and Tx not being disabled in cp_suspend
    f8a9b988e7a7b vxlan: mdb: Fix use-after-free in vxlan_mdb_flush()
    7c197d96f053f vxlan: mdb: Add MDB bulk deletion support
    2e4fe6c423379 net: Add MDB bulk deletion device operation
    94d8313ba1aaa bridge: add MDB state mask uAPI attribute
    75ee201a1303f vxlan: mdb: Add MDB get support
    88f464358411e net: Add MDB get device operation
    c9a5c400dfc59 bridge: add MDB get uAPI attributes
    c2a7f6064dfb5 vxlan: mdb: Factor out a helper for remote entry size calculation
    8e4be8729f256 vxlan: mdb: Adjust function arguments
    9cf0fc4bb6296 ALSA: hda: Fix connection list comparison in proc output
    17120c5bfb168 fuse: check for NULL root inode in fuse_fill_super_submount
    dc925f22df8ad fuse: check attributes staleness on fuse_iget()
    051eaaa875f50 fuse: convert readdir to use folios
    358640784ba10 fuse: support folios in struct fuse_args_pages and fuse_copy_pages()
    a3713498429e4 fuse: use FUSE_ROOT_ID in fuse_get_root_inode()
    be829860d1dbb fuse: convert to new timestamp accessors
    d585ed0830890 fs/ntfs3: validate ef->size covers the record's name and value
    700973cc65db4 fs/ntfs3: fix out-of-bounds read in read_log_rec_buf()
    ac5c499413385 cuse: wait for pending RCU callbacks on module exit
    9c59ee8d63c42 net: bridge: vlan: fix inverted default vlan notification
    59f4ad9b3d1e8 tls: fix RX desync on overlapping skbs
    7df3271df8678 net: dsa: mv88e6xxx: Fix PCS link check on CMODE read error
    47bfcc871576e vxlan: vnifilter: enforce exact length of GROUP/GROUP6 attributes
    deaa88fa010ba ipvs: fix integer overflow in ftp helper port/address parsing
    0a340ffd96943 net: hsr: free learned nodes on device setup failure
    d90e4f72e8d46 net: hsr: Provide RedBox support (HSR-SAN)
    9baf4bf4763ce net: hsr: Use full string description when opening HSR network device
    f3d74ab3f49ea pppox: drain queued packets on channel handoff
    cbb0879aeaa13 net: dsa: b53: fix error propagation from b53_fdb_dump()
    b0e94ea63dbdc net: kcm: Hold RCU read lock while running BPF parser
    5d6c3f6e90d73 octeontx2-af: initialize lmac_bmap in rvu_mcs_set_lmac_bmap()
    642d3bc08c731 clk: ti: mux: resolve parent clocks by DT index, not by name
    6b9aedc0b998b clk: ti: use kcalloc() instead of kzalloc()
    fc95ca82d5ae5 NFSv4: remove callback IDR entry on client allocation failure
    788b59a395434 nfs: refactor pNFS functions using clear_and_wake_up_bit
    a49d54e6cb560 nfs: replace atomic bitops sequence with clear_and_wake_up_bit helper
    a2051ffe452af ksmbd: bound smb_check_perm_dacl() ACE walks by DACL size
    6bf378cfea2de ksmbd: disconnect on SMB3 decryption failure
    e6fbf0eba87f5 bpf: Reject negative optlen in cgroup getsockopt hook
    7d3f15a664d11 m68k: nfcon: Do not call console_is_registered() in nfcon_device()
    de2b2004e16f2 lwt_bpf: Restore reserved headroom after xmit program
    ca119d4a6b19e smb/server: preserve error status in smb2_handle_negotiate()
    3f8651f6bb521 smb/server: fix invalid pointer dereference in ksmbd_stop_durable_scavenger()
    effcf48d79d8a ksmbd: free preauth sessions on connection teardown
    c3a8100dbf6bc ksmbd: do not advertise unimplemented CA support
    17b7d1a2b4d54 ksmbd: validate ipc response length before dereferencing its fields
    4d6fe49fa3e7f smb: server: fix leak of ksmbd_ipc_login_request_ext() returned buffer
    993e0158331d3 ksmbd: Do not skip lock checks for single-byte ranges
    9281eb1e4ea31 hwmon: (emc1403) Drop hysteresis for low limit temperature
    e43ba8be636ab hwmon: (emc1403) Rely on subsystem locking
    5efc8eeb33183 hwmon: (emc1403) Add support for EMC1428 and EMC1438.
    5eee537872d86 hwmon: (emc1403) Support 11 bit accuracy
    e33dc202fb6f6 hwmon: (emc1403) Convert to with_info API
    b92949bc1a099 hwmon: (emc1403) Add support for EMC1442
    8283049aa5fcb block: mtip32xx: synchronize ioctls with device removal
    7de792b4c48fb null_blk: serialize configfs attribute updates with device setup
    88d806d0e1d36 null_blk: serialize configfs attribute stores with the lock
    fcd53f3e8b758 null_blk: reject per-device queue resize for shared tag set
    665c94554ff0d null_blk: free global tag_set on init error path
    dbcedbe4819ae null_blk: register configfs subsystem after creating default devices
    b6869f48ddec2 null_blk: add configfs variable shared_tags
    349903f7ee72f null_blk: use DEFINE_MUTEX for the file-scope mutex
    09372aa5774e3 mailbox: pcc: Fix command timeout due to missed interrupt
    81e2b32d1d11d Revert "mailbox/pcc: support mailbox management of the shared buffer"
    dc14620fe268d mailbox/pcc: support mailbox management of the shared buffer
    871b0bf25cc7e mailbox: pcc: Always map the shared memory communication address
    82aa56d548f68 mailbox: rockchip: disable pclk on probe failure and unbind
    606cbd749ff33 perf dso: Guard against cache underflow on short reads in dso_cache__memcpy()
    d3231c74c9a9f perf dso: Guard close() against invalid fd in dso__decompress_kmodule_path()
    4536ff6a67ea9 crypto: hisilicon/sec2 - fix CCM algorithm long packet failure
    595dd1c0e1c47 bpf: Fix pending_pos walk on 32-bit ring position wrap
    f30379b8a4e24 ACPI: scan: fix bus ID cleanup on device_add() failures
    cd63a1eb677e9 ASoC: SOF: validate topology volume range before allocation
    60d98480caafc tracing: Have trace_event_update_all() only handle module that is loading
    11755741ff074 tracing: Remove "__attribute__()" from the type field of event format
    03c5dabc8f16b ALSA: core: Fix use-after-free in snd_card_do_free()
    0441e34ce098c fs/ntfs3: reject out-of-range evcn in mi_enum_attr()
    f77a8d9fdf58e fs/ntfs3: fix integer overflow in MFT cluster validation
    b51535ca5eb90 scsi: ufs: core: Set task state before io_schedule_timeout()
    5d602d4ebb58c scsi: ufs: core: Remove redundant host_lock calls around UTMRLDBR
    7612b5d2c00aa scsi: ufs: core: Remove unnecessary wmb() after ringing doorbell
    afedf35df054b scsi: mpt3sas: Avoid freeing unallocated PCIe SGL buffers
    5b37a7c2270cb selftests/bpf: Fix for veristat file/prog filters processing
    3d2f0cb66c909 Squashfs: check block offset is not negative
    8d88f52fbbbcc ocfs2: fix circular locking dependency in ocfs2_init_acl()
    340821bc169bc bpftool: Fix double close in map dump
    23e5b485da229 x86/pkeys: Fix pkey_alloc() return value when pkeys are not supported
    89d986897aff7 ALSA: seq: midi: Serialize input teardown with event_input
    679087a7acdc4 ALSA: seq: midi: Optimize event_input locking with RCU
    a3efa5d4eed38 clocksource/drivers/armada: Unwind timer clock on init failure
    3cac7e8adb006 clocksource/drivers/clps711x: Do not unmap clocksource MMIO
    a08b70ed2d1ec s390/debug: Fix deadlock during unregister
    57ec8827f414b xenbus: Unregister reboot notifier on init failure
    3a6b43ebc0c2e power: supply: bq27xxx: bq27z561: fix invalid AverageEnergy address
    c86a998bd46da power: supply: bq27xxx: bq28z610: fix invalid AverageEnergy address
    60e5d928081b7 power: supply: bq27xxx: bq27520g4: fix REG_TTES address
    f1b4447402fca power: supply: bd99954: Drop bad register fields
    49e717f3f3d20 spi: img-spfi: don't disable runtime PM on DMA deferred probe
    6746ba44cd04d selftests/bpf: vmtest.sh: Preserve command quoting when running in the VM
    a4e68a4f68c2a selftests/bpf: Add description for running vmtest on RV64
    bfeb336e48a96 selftests/bpf: Support local rootfs image for vmtest
    c4579f1b7fe17 selftests/bpf: Limit URLS parsing logic to actual scope in vmtest
    47a7a4443c6e7 kunit: tool: fix _list_tests filtering wrong variable when list has TAP prefix
    620549b2775e5 UBI: fix two issues in the ubi.mtd MODULE_PARM_DESC
    8c38ae4a46569 ASoC: xilinx: formatter_pcm: fix stream_data leak on open error
    552e565ed8846 ubi: Fix rollback for explicit UBI device numbers
    3f617214c81a2 ubi: fastmap: Add module parameter to control reserving filling pool PEBs
    d99591caca984 ubi: fastmap: Fix lapsed wear leveling for first 64 PEBs
    2d55fd6170613 ubi: fastmap: Wait until there are enough free PEBs before filling pools
    087d820d4bc48 UBI: fastmap: Pass to_be_tortured when reusing old fastmap PEBs
    3c5599d3cf1ab UBI: Preserve torture flag when rescheduling failed erasures
    3996be3f5b8a9 ubi: Replace erase_block() with sync_erase()
    d8307a8bc986b ubi: fastmap: Allocate memory with GFP_NOFS in ubi_update_fastmap
    4e0ab4f291a76 ubi: fastmap: erase_block: Get erase counter from wl_entry rather than flash
    2a623a56b513b ubi: fastmap: Fix missed ec updating after erasing old fastmap data block
    eaaeabf566c3c ASoC: fsl-asoc-card: defer probe when the CPU DAI device is not ready
    48cece7b287ec ASoC: pxa: Use devm_clk_get_optional() for extclk clock
    30c48da114915 ice: clear the default forwarding VSI rule when releasing a VSI
    2a63cb9ea862a RDMA/cma: Fix WARNING in res_to_rt
    f98e894ec029a RDMA/cxgb4: Free debugfs on registration failure
    8980385438975 dmaengine: qcom-bam-dma: fix autosuspend cleanup during removal
    5487f04c1ccbf nfc: nci: fix use of uninitialized memory in CORE_INIT_RSP parsing
    c001abaaa35bc nfc: digital: Do not dump a NULL response in command completion
    753bdaf3220fe nfc: pn533: hold a reference to the request skb during send_frame
    02030f95820c4 nfc: llcp: bound SNL TLV parsing to the skb and add length checks
    9030a1bbe2c6b nfc: nci: fix double completion race in nci_data_exchange_complete
    fe65727a4a21b nfc: llcp: read llcp_sock->local under the socket lock in getsockopt
    35573c6cb081a nfc: llcp: avoid userspace overflow on invalid optlen
    7084caabc0370 nvme: reject passthrough of driver-managed Set Features
    c35cd98eed1a8 nvme/ioctl: check SUBMIT_IO with nvme_cmd_allowed()
    ff28a93a89591 nvmet: fix NULL pointer dereference in nvmet_execute_identify_ns_zns()
    ca6b14f01d099 nvme-apple: Drop the PRP null check chicken bit
    7256eed48ce7d nvme: apple: Add Apple A11 support
    eb86b1844a1b4 nvme-apple: Never set the opcode in the NVMMU TCB
    5ce74613edd36 nvme-apple: Don't set a DMA direction for commands without a data transfer
    5f6f4777b7a86 nvme-apple: Destroy the admin queue on removal
    89ff11b72f389 nvmet: fix heap out-of-bounds read in nvmet_auth_negotiate()
    cefb177da32fe nvme: Add the DHCHAP maximum HD IDs
    ac6c240e0f448 nvme: introduce change ptpl and iekey definition
    cef6c15f8b54d nvme: add reservation command's defines
    c26fa54201acb ASoC: qcom: q6apm: keep the graph start count in sync with the DSP
    cd12a36c77fdd spi: sprd-adi: Fix probe succeeding without registering the controller
    d10e4173d8c2a phy: qcom: qmp-combo: Correct pre-emphasis table for QMP v4 DP PHYs
    c653b97b9fefc powerpc/configs: enable CONFIG_RAS to fix EDAC support
    ed80d009b154a sunrpc: xprtsock: annotate shared socket callbacks with READ_ONCE/WRITE_ONCE
    12bf3e0182ccd SUNRPC: check rpc_sockaddr2uaddr() return value in rpcb_register_inet4/6
    3cee888393f6e arm64: Disable KCSAN instrumentation in delay.o
    e3405bf334b02 m68k: Fix backtraces for non-running tasks
    071ac1722fe2e iommu/vt-d: Fix UCTP context table slot when copying root entries
    e8d4e4cf388da fbdev: kyro: Validate overlay viewport coordinates
    f3222a7a5e65c fbdev: tdfxfb: fix PCI enable cleanup with pcim_enable_device()
    3d0f487661a69 perf synthetic-events: Fix divide by zero in perf_event__synthesize_threads
    e7a3768a295a0 perf synthetic-events: Fix uninitialized pthread_join
    ba7a7e1a41c8e perf stat: Fix evsel_list leak in cmd_stat
    518c47e2c59f3 ARM: dts: helios4: add SATA regulator supplies
    0fb9acbc7fbd3 ARM: dts: helios4: add vcc-supply to GPIO expander
    9f8e9aa4b1231 ARM: dts: helios4: add vcc-supply to EEPROM
    fb9043b5ce0c8 arm64: dts: turris-mox: fix usb3 phys
    d9ea72c04a1df riscv: cpufeature: Clarify ISA spec version for canonical order
    bee2208276c8e net/sched: cls_api: fix teardown of an adopted proto on insert-race loss
    83db3f0d7982e iio: light: gp2ap002: re-enable irq if runtime suspend fails
    8e76ab8131985 iio: light: gp2ap002: Fix unbalanced runtime PM on repeated event writes
    e804d54a5a99d Bluetooth: MSFT: validate evt_prefix_len against the response length
    416fabca9b723 Bluetooth: MGMT: free the mesh send cancel command when it is cancelled
    193182c6467f5 Bluetooth: hci_sync: free the advertising instance on the failure and cancel paths
    9a2ba69cebe3f Bluetooth: hci_conn: fix the SCO setup context lifetime
    50dae81942575 Bluetooth: btintel: Fix diagnostics event detection
    0e388d805233a Bluetooth: virtio_bt: avoid OOB read of build info string
    90e9eae1b5907 btrfs: retry verity reads for not-uptodate Merkle folios
    a5add36fd9908 scsi: sd: Fix sd_done() sense handling condition
    2cd80d83cc1a2 perf trace-event: Fix integer truncation in do_read() and skip()
    5317d73c7876c Bluetooth: btusb: QCA: Fix populating devcoredump fields on unenabled devices
    af6f77f20510d Bluetooth: btusb: Record matched usb_device_id into btusb_data
    9b0b4fbb8c863 Bluetooth: btusb: refactor endpoint lookup
    61df5d818baf3 Bluetooth: btusb: Fix BD_ADDR byte order in btusb_set_bdaddr_wcn6855()
    32be97642c514 Bluetooth: btqca: Fix qca_set_bdaddr() waiting for wrong HCI event
    e60f304c65013 sched/fair: Check CPU capacity before comparing group types during load balance
    7ac16ee2d3766 ACPI: video: Release PCI device reference after lookup
    f1bea8cf618b3 regulator: qcom-rpmh: Fix PMIC5 BOB bypass mode handling
    ea4fe6a450210 coresight: etm4x: fix leaked trace id
    be7b2de5b9a96 coresight: etm4x: fix underflow for usage of (nrseqstate - 1)
    b822e5966d5a3 coresight: Change syncfreq to be a u8
    885d831237337 coresight: etm4x: fix wrong check of etm4x_sspcicrn_present()
    668d99ba47210 md/raid1: don't set array_frozen in raid1_takeover()
    cfb75fae75c96 md: avoid stale clone I/O accounting timestamps
    9d7490007707f md/raid5: round bitmap stripes with sector division
    9b28287c5dea7 phy: qcom: qmp-usb: Fix possible NULL-deref on early runtime suspend
    3ddf41938fee3 phy: qcom: snps-femto-v2: Fix possible NULL-deref on early runtime suspend
    602059c5128a7 phy: qcom: qmp-usb-legacy: Fix possible NULL-deref on early runtime suspend
    9e7448bb0e2f0 phy: qcom: sgmii-eth: vote for both voltage rails with correct current loads
    c9f829195f84a phy: qcom-sgmii-eth: relax order of .power_on() vs .set_mode*()
    cf2f1cee7080e soc: fsl: qe: check platform_driver_register() in qe_ic_of_init()
    5b7fc7a1ce2a5 hugetlbfs: release subpool on fill_super failure
    e36eee4fc56cf pinctrl: rockchip: Reset the pin count when recalculating SoC data
    5a250bff75a44 firmware_loader: do not queue completed sysfs fallback requests
    9b6325fc58ab8 scsi: qla2xxx: Remove redundant VPD flash read in sysfs read path
    b5d1d3e4519dc drm/amdgpu/gfx6: Use PFP on the compute queues too
    0d567a5cb347e drm/amdgpu/gfx6: Fixup emitting SWITCH_BUFFER packets
    d5f170189b07a perf trace-event: Fix buffer overflow in read_string()
    dd9fee2b29e2f phy: rockchip: phy-rockchip-inno-csidphy: fix rk1808 hsfreq table
    1fce81a40e3b3 phy: sunplus: fix error handling in sp_uphy_init()
    ba56017b0c04e arm64: dts: ti: k3-am64: Fix MDIO clock reference for ICSSG0 node
    9e1efab410a4a ext4: fix spurious message about orphan cleanup on RO fs
    4b7623e92545d drm/amdgpu/gfx6: Fixup emit_cntxcntl()
    e92a83a9a7617 mfd: iqs62x: Reject zero-length firmware records
    f943448aeae0a mfd: rave-sp: validate received frame payload lengths
    ad3839fe2114b arm64: hibernate: Restore DAIF state on error
    5370853041a3c arm64: hibernate: mask DAIF before restoring hibernated kernel
    0ab5739f1f448 wifi: mac80211: skip default WMM setup for AP_VLAN links
    f82e13c16da63 RDMA/erdma: restrict the driver to little-endian systems
    b9e7d3d9fdb2b RDMA/siw: Fix use-after-free in siw_accept()
    b8d5015db908a RDMA/siw: Introduce siw_free_cm_id
    9c21a43302221 IB/isert: post the full-feature receive buffers after session registration
    f84e9adf4d9f4 IB/isert: delay the final Login Response until the session is registered
    55864b26c22cb cpufreq: imx6q: fix out-of-bounds write when probed more than once
    92e53a5274276 cpufreq: imx6q: fix devres accumulation across driver rebind
    53e08b89f7620 drm/sun4i: hdmi-phy: Fix H6 8-bit MPLL config at 594 MHz
    0a3a149d5ac1d drm/sun4i: dw-hdmi: Drop TCON TOP port reference
    543cc7dd263b9 drm/sun4i: tcon: Drop remote endpoint reference
    1882112124a64 drm/sun4i: crtc: Propagate layer initialization error
    4fa22218c2351 drm/sun4i: tcon: Drop TCON TOP device reference
    539817f22063d drm/sun4i: tcon: Set output mux for DSI and LVDS
    f0f5441126f31 of: property: add of_graph_get_next_port_endpoint()
    afb9faa721d43 of: property: add of_graph_get_next_port()
    89a89f7bb2fcc of: property: use unsigned int return on of_graph_get_endpoint_count()
    217340d0ebd0f of: property: add missing kerneldoc for of_graph_get_endpoint_count()
    24790c3b0d99a drm/sun4i: vi scaler: Fix coefficient selection
    cbb4efc2f99d6 ocfs2: synchronize heartbeat callbacks with o2net teardown
    63e3c958a602d ARM: 9485/1: mm: acquire mmap write lock around show_pte() for user faults
    0e7ba61751490 RDMA/srp: fix heap information leak on a truncated SRP_CRED_REQ
    c0a83f29a24c7 RDMA/erdma: Hold CQ references when processing EQ events
    d7ef87c7daa9e modpost: prevent leak when early return no suffix .o in read_symbols()
    16667c8cabe18 scripts/tags.sh: Prevent binary files appearing in cscope.files
    81e425fbd8115 arm64: dts: qcom: sm7225-fairphone-fp4: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies
    f54b00b223954 selftests/mm: fix ternary operator precedence in ksm_tests
    1f53972a5bd40 selftests/mm: fix ksm NUMA merge test for systems with memoryless NUMA nodes
    bdef4a404fab5 selftests/mm: ksm_tests: use kselftest framework
    6b117e23481d9 ksm_tests: skip hugepage test when Transparent Hugepages are disabled
    46f5382b4eeb9 selftests/mm: add new test cases to the migration test
    7eb85d07c15ae selftests: mm: support shmem mTHP collapse testing
    c2b8653d571e8 selftests/mm/khugepaged: enlighten for multi-size THP
    7db5a1d597213 selftests/mm: support multi-size THP interface in thp_settings
    750575653bd6c selftests/mm: factor out thp settings management
    e1e07344d8e19 selftests/mm/kugepaged: restore thp settings at exit
    e26db0d636e4c bpf, cgroup: Fix invalid storage access after __cgroup_bpf_attach failed
    c82241a9454b2 remoteproc: fix OOB read via signed offset in rsc_table_for_each_entry()
    9ca46a1a3e510 remoteproc: use rsc_table_for_each_entry() in rproc_handle_resources()
    829c24afec9ce remoteproc: Move resource table data structure to its own header
    542a6a3ec77cd drm/omap: dsi: Do not copy isr table
    e38587d98d1ce fat: release buffer head after rebuilding parent
    332591a245de9 rapidio: clear mport->net when rio_add_net() fails
    a1b1ff469e573 pps-gpio: remove dead capture_clear code
    c66eb07d65a26 pps: pps-gpio: split IRQ handler into hardirq timestamper + threaded handler
    9ee5b718b2cbd pps: clients: gpio: Bypass edge's direction check when not needed
    6bc73694cbee5 pps: don't try to wait for negative timeouts in PPS_FETCH
    4957320f54311 lib/string: fix memchr_inv() for large ranges
    43b18869f8c8f ublk: check for ublk_unmap_io() returning 0
    364030e3eefce block/kyber-iosched: flush per-cpu latency buckets over possible CPUs
    92865833e8d81 block/blk-iocost: collect per-cpu latency stats over possible CPUs
    28104b1636296 block/blk-stat: drain per-cpu callback stats over possible CPUs
    1a267295b1ea6 blk-cgroup: skip dying blkg in blkcg_activate_policy()
    056eea1a2068a phonet: pep: do not write beyond optlen in getsockopt
    cf62dd07b08e9 iio: light: tsl2583: return zero in write_raw() on success
    d7c5a80939e12 iio: light: isl29028: return zero in write_raw() on success
    3f701835d082a iio: light: tsl2772: fix ALS calibscale readback
    7ac69e177dffe perf intel-bts: Fix off-by-one in auxtrace_info minimum size check
    1bdb0e48e9d87 perf intel-pt: Fix off-by-one in auxtrace_info minimum size check
    2d31a6271975a perf auxtrace: Fix queue grow overflow and old array leak
    aa3045fb5faa0 perf thread-stack: Fix heap buffer overflow on branch stack wrap copy
    6be9b1284d0c3 HID: lg4ff: validate report length before fixed offsets
    178c369b465b5 HID: i2c-hid: goodix: Disable VDD on VDDIO enable failure
    d3ccef6fb7133 HID: i2c-hid: Fix "(null)" output when reading report descriptor fails
    d9caf658694d9 HID: i2c-hid: Revert to await reset ACK before reading report descriptor
    0cab98ab1f57a HID: i2c-hid: Move i2c_hid_finish_hwreset() to after reading the report-descriptor
    a8a1892d18faf HID: i2c-hid: Switch i2c_hid_parse() to goto style error handling
    c1e5bbba94e16 HID: i2c-hid: Split i2c_hid_hwreset() in start() and finish() functions
    69345da556293 HID: i2c-hid: Fold i2c_hid_execute_reset() into i2c_hid_hwreset()
    9a3da56aae28e HID: synchronize input before cleaning up a failed probe
    f54c3219db759 HID: i2c-hid: Refactor _DSM helper and add i2c-hid-acpi-prp0001 driver
    d331c63570af6 tty: clear cdev pointer after cdev_add() failure
    8369acce013b1 serial: amba-pl011: unprepare console clock on unregister
    0ef4365a01cf7 MIPS: ptrace: Fix syscall skipping via PTRACE_SYSCALL
    dcc442a49c0f5 powerpc/irq: Fix missing r2 clobber in PCREL inline assembly
    f89cccf6f5f4f powerpc/smp: add NULL guard for cause_ipi in smp_muxed_ipi_message_pass
    88027241c1d2c firmware: coreboot: Validate table bounds
    f8808b7440c72 firmware: google: Add bounds checks in coreboot_table_populate()
    5fc32f53f8486 wifi: mac80211: skip unused probe response countdown offsets
    a749ab2498238 wifi: zd1211rw: reject secondary interfaces to prevent conflicts
    aa5ff84ca8c39 wifi: mac80211: send TWT teardown to peer after setup TX failure
    11b75fc02d842 perf/cxlpmu: Fix 64-bit write to 32-bit HDM filter register
    a6f2a2d867863 iommu/arm-smmu-v3: Convert to use atomic poll timeout
    eb946595a58de wifi: ath10k: snoc: use memcpy_fromio() for MSA ramdump
    04d8fd716d0ee wifi: mt76: mt7915: report RX chain signal for all RX paths
    6b3d02b422a5d wifi: mt76: mt7915: fix chainmask handling for non-dbdc phys on band 1
    426825d50c700 wifi: mt76: mt7996: fix reg addr remap when addr is 0
    2a434d2637b9c wifi: mt76: mt7915: release hif2 reference on probe IRQ failure
    ad706fcf62554 wifi: mt76: mt7915: fix ext PHY use-after-free on register error path
    927fe8c0eb8c1 wifi: mt76: mt7915: fix double hif2 init on the non-WED path
    1bd5c4ed2b904 wifi: mt76: mt7915: unlink TWT flow if the MCU rejects the agreement
    4f4fada2d3594 perf machine: Check snprintf truncation for guest kallsyms path
    718773cdea4ac perf machine: Free scandir entries in guest kernel map creation
    6c903f77f50f7 perf machine: Reset errno before strtol in guest kernel map creation
    cae1adeb69b94 perf machine: Don't abort guest map creation on first inaccessible dir
    ac436ad9d47dd perf machine: Check snprintf truncation in machines__findnew()
    091cd722190cf perf machine: Use snprintf() for guestmount path construction
    c8b41333e2c89 perf machine: Guard against NULL strlist in machines__findnew()
    3d1f6a9f7f300 perf machine: Fix NULL parent dereference in fork event processing
    6d0a2c5e210f2 regulator: core: use system_freezable_wq for init complete work
    1296cae530528 wifi: ath11k: fix leak in ath11k_service_ready_ext_event()
    d3e8355a63cea drm/msm/dsi: Drop dev_pm_opp_set_rate(0)
    e52a884ecbf3c drm/msm/dpu: Drop sneaky dev_pm_opp_set_rate(0)
    78c2c2ae9a8f4 perf: arm_spe: Make wakeup range check overflow safe
    ccee078503097 ACPI: processor: Unregister cpufreq notifier on init failure
    0306624c843dd ACPI: processor: idle: Optimize ACPI idle driver registration
    4052a0367fa92 wifi: mt76: mt7915: use little-endian for bss_info_ra wire fields
    1d348f96623ec wifi: mt76: mt7996: reserve space for the CSA-abort countdown TLV
    3106f62809d45 wifi: mt76: mt7996: bound TLV walk in mt7996_mcu_get_chip_config
    a4587f1098c97 wifi: mt76: mt7915: poll the correct SLP CTRL register for the second adie
    953357433053a wifi: mt76: mt7996: don't report a zero TX bitrate
    e63c6291ecddf wifi: mt76: mt7915: avoid nss underflow in mt7915_mcu_get_sta_nss
    9fc7b406a7e5e wifi: mt76: mt7996: set MT76_MCU_RESET before waking MCU waiters on full reset
    c2c7f16f2c62f wifi: mt76: mt792x: Fix memory leak in SDIO TX path
    8eae5e5aa09da wifi: mt76: mt7915: fix net_fill_forward_path for non-DBDC mt7986
    b6e7958602bd1 wifi: mt76: mt76x02: do not WARN on invalid rx descriptor length
    1f3e5f4b779d6 fanotify: report full event length for FIONREAD
    adbdf4837c434 misc: vmc_vmci: Fix potential memory leak in vmci_event_subscribe()
    5c3bff6cf26e6 locking/lockdep: Fix NULL pointer dereference in __lock_set_class()
    d22ad96f1a0c8 i3c: master: Fix device_register() error path
    111f559e5b646 i3c: dw: avoid shift-out-of-bounds when DAA assigns no devices
    68bf3ebd8e702 swiotlb: Preserve allocation virtual address for dynamic pools
    06dffc9669308 iommu/dma: Check atomic pool allocation result directly
    9a5a5eafbf168 clk: qcom: Return expected ENOMEM error on dynamic allocation failure
    2636569ea7c19 lib/test_hmm: fail dmirror_fault() when the mirrored mm is gone
    a5c936ac90476 bpf: Fix potential UAF when reading bpf link info
    f4ce6803df409 bpf: Fix potential UAF in bpf_netns_link_update_prog
    972d88069050d power: supply: sc2731_charger: cancel work on remove
    dcc6995b17d11 power: supply: sc2731_charger: Convert to platform remove callback returning void
    c22a9a539c761 power: supply: isp1704_charger: cancel work on remove
    76c695d6e9236 arm64: dts: qcom: sm8550: Fix the PCIe iommu-map entries
    5c28583f58a48 arm64: dts: qcom: sm8550: Fix the msi-map entries
    28bfcbc9b7694 arm64: dts: qcom: sm8550: Use GIC-ITS for PCIe0 and PCIe1
    de01d783368c5 arm64: dts: qcom: sm8450: Fix the PCIe iommu-map entries
    4a2efff1ebdbe arm64: dts: qcom: sm8350: Fix the PCIe iommu-map entries
    9dedefe9d949a arm64: dts: qcom: sm8250: Fix the PCIe iommu-map entries
    796fcf46d7551 arm64: dts: qcom: sm8150: Fix the PCIe iommu-map entries
    3c9cbf39055fa arm64: dts: qcom: sdm845: Fix the PCIe iommu-map entries
    31db9b8610e3f arm64: dts: qcom: sc8180x: Fix the PCIe iommu-map entries
    a331e43e9b78f arm64: dts: qcom: sc8180x: drop duplicated PCI iommus property
    ab813e51988d6 arm64: dts: qcom: sm8250-xiaomi-elish: correct the board ID
    bb7206ebdb1f5 arm64: dts: qcom: sc8280xp-crd: Fix the pin index for misc_3p3_reg_en
    5a430485d1310 clk: qcom: gcc-qcm2290: don't park QUP RCGs upon registration
    ee4eb4b0db3de arm64: dts: qcom: sdm632-motorola-ocean: Fix LED default trigger property
    1c3d2e50e7bc4 arm64: dts: qcom: msm8998: Don't pull-up I2C pins by default in sleep
    29c9c4801f539 rcu: Mark accesses to ->rcu_urgent_qs and ->rcu_need_heavy_qs
    d5ba53140ee78 rcu: Rename rcu_momentary_dyntick_idle() into rcu_momentary_eqs()
    1d1903d64ba52 rcu: Remove unused function declaration rcu_eqs_special_set()
    11d327f0911d3 selftests/zram: fix kernel_gte() for POSIX sh
    590d690a9f668 tools/nolibc/powerpc: mark ctr and xer as clobbered by system call
    e77c80670f2c2 md/raid5-ppl: fix use-after-free in ppl_do_flush()
    3018d86da10b4 md/raid5: protect bitmap batch counters aka seq_flush/seq_write consistency
    55ee71cb96bd3 bus: mhi: host: Flush the posted write after writing to MHI_SOC_RESET_REQ_OFFSET
    aef178ffae542 wifi: rtlwifi: pci: fix error path in rtl_pci_probe()
    56989e2a9c292 platform/chrome: cros_ec_debugfs: Unregister panic notifier
    5ebfc68217b5a platform/chrome: cros_ec_debugfs: Clean up console log on probe failure
    f760b7d7e4358 wifi: ath11k: fix overreads in ath11k_wmi_process_csa_switch_count_event()
    1130f6f42f62b wifi: ath11k: implement handling of P2P NoA event
    5ddc08ef072db wifi: ath11k: refactor ath11k_wmi_tlv_parse_alloc()
    98e373dc08187 wifi: ath11k: add firmware-2.bin support
    aff7ced31b937 wifi: ath11k: qmi: refactor ath11k_qmi_m3_load()
    29e37f768f355 spi: davinci: switch to managed controller allocation
    5db5c788048eb spi: davinci: Unset POWERDOWN bit when releasing resources
    27b0a735ca9f8 spi: davinci: Use helper function devm_clk_get_enabled()
    acc173608ca7a nvme-fc: unmap cmd_iu DMA on rsp_iu mapping failure in init_request
    44fe800ec1338 IB/isert: reject login PDUs declaring more data than was received
    2a6b8f88fb7ee IB/isert: reject PDUs declaring more data than was received
    5a21e5114cec4 RDMA/cxgb4: free STAG index when TPT entry write fails
    08c4a0dede170 RDMA/mlx5: Send cong param changes to the resolved port mdev
    0b0122fcc923a RDMA/mlx5: Fix stack out-of-bounds read in cc_params debugfs
    f42f0cb6be2e8 scsi: smartpqi: Fix AIO retry marker cleared by SCSI core between dispatches.
    5166a21b12f54 nilfs2: fix BUG in nilfs_copy_dirty_pages() on dirty state mismatch
    aaee7ff47a47a nilfs2: convert nilfs_page_bug() to nilfs_folio_bug()
    25a07d5d97a19 nilfs2: convert nilfs_btnode_commit_change_key to use a folio
    62cff5341dfde nilfs2: convert nilfs_btnode_prepare_change_key to use a folio
    6fe7f8240fa83 nilfs2: convert to nilfs_folio_buffers_clean()
    0787197a858dd nilfs2: convert nilfs_forget_buffer to use a folio
    14b101d829fc1 nilfs2: add nilfs_end_folio_io()
    7029e70cf86d5 nilfs2: prevent out-of-bounds read in super root block parsing
    d7afca8e4efbf nilfs2: fix infinite loop in nilfs_clean_segments()
    b9dd1e691cea8 clk: rockchip: Fix the fractional part denominator on RK3588/RK3576 PLLs
    d9057cb059a50 clk: mediatek: mt8135: Fix inverted gate control for devapc_ck
    f7bf9b82c77fd clk/x86: pmc_atom: add kasprintf return value check
    297b278cc4fd1 clk: palmas: Manage external-control prepare with devm
    e86e11c11251a clk: tegra: tegra124-emc: put EMC node on register failure
    5dbefaa1bbbb2 arm64: dts: allwinner: sun50i-a64-pinephone: Fix mpu6050 mount matrix
    aadf3f9b5edb7 RDMA/efa: Fix PBL chunk length computation
    ecde45cd81dc2 fs/ntfs3: reject restart table growth beyond U16_MAX entries
    aeb16d9686b35 staging: rtl8723bs: use kfree_sensitive() for key material
    47de033918cd7 remoteproc: Prevent crash handling to race with rproc_del()
    15673e7195681 remoteproc: core: Attach rproc asynchronously in rproc_add() path via schedule_work()
    166bc60c8d1db remoteproc: Allow shutdown of crashed processors
    48cba5968c148 remoteproc: core: Drop redundant initialization of 'ret' in rproc_shutdown()
    5f25e5c95117b w1: ds2482: Fix signedness bug in ds2482_w1_triplet()
    5677737c2cedf isofs: release zisofs block pointer buffer head
    42fb8aefffff5 RDMA/mlx5: Fix integer overflow of user QP buffer size
    0afd2a1d8fd3d crypto: keembay - publish OF module alias for OCS AES/SM4
    d52a15c4559b6 crypto: keembay - Initialize completion before requesting IRQ
    587be18e09356 scsi: ufs: debugfs: Reserve space for a string terminator
    cd522340b777c power: supply: sbs-battery: Use a per-device serial number buffer
    3b1fa32b00fbf tools/build: Allow versioning of all LLVM tools defined in Makefile.include
    a241079c175c5 tools/build: Add bpftool-skeletons feature test
    903a7cdf63a81 pinctrl: mediatek: free EINT resources on unbind
    e578bbff98582 pinctrl: mediatek: eint: Fix invalid pointer dereference for v1 platforms
    e858183aa84e0 pinctrl: mediatek: Fix the invalid conditions
    7586766229354 pinctrl: mediatek: Add EINT support for multiple addresses
    d626407251868 pinctrl: mediatek: Use C99 initializers in PINCTRL_PIN_GROUP()
    68edf359b0b45 cxl/region: Fix use-after-free in find_pos_and_ways() error path
    dd60d57b1fe73 selftests/bpf: Fix memory leak on subtest_states reallocation
    123d67513c828 selftests/bpf: Fix incorrect error checking for pthread_create
    3f609fc97f22f ARM: lpc32xx: only run SoC init on LPC32xx hardware
    cf2e767ba2693 arm64: dts: rockchip: Fix Gru WLAN sideband interrupt
    94fce1d3e74fe fs/ntfs3: fix out-of-bounds read of INDEX_ROOT in reparse/objid init
    810da5a635495 netfilter: nf_nat_sip: rewind offset when NAT shrinks the packet
    4f10b305da832 drm/tve200: add OF module alias for autoloading
    72e12a20e2fe0 leds: pca9532: Fix phantom device registration on missing hardware
    0f36ce5987d1f PM: hibernate: Fix memory leak in snapshot_write_next() error path
    621871b696b10 xfrm: Fix skb double-free in xfrm_dev_direct_output()
    795e59c83c97c perf cs-etm: Avoid truncating AUX buffer sizes to int
    c2039be327081 perf cs-etm: Flush thread stacks after decoder reset
    524e57035af2d firmware: arm_scmi: Unrequest devices if driver registration fails
    41714150f3d14 firmware: arm_scmi: Add multiple protocols registration support
    e75816535da42 ARM: dts: allwinner: a10: Fix PMU interrupt
    e94676a08af63 ext4: check dir entry fits before reading the hash trailer in ext4_search_dir()
    74637f7fef030 ext4: fix buffer_head leak in ext4_init_orphan_info
    5361fb1e5bc24 RDMA/bnxt_re: Clear VM_MAYWRITE on DBR/toggle page mmap
    2677fc48dd10d wifi: ath11k: Avoid buffer overread in ath11k_wmi_tlv_op_rx()
    9784faa6afd26 wifi: ath12k: Avoid buffer overread in ath12k_wmi_op_rx()
    6ba901a05ca17 wifi: ath11k: Correctly copy the hint BSSID in WMI scan request
    a7918f70784a7 wifi: ath12k: Correctly copy the hint BSSID in WMI scan request
    ea2a77682f9f9 wifi: ath6kl: avoid buffer overreads in WMI event handlers
    74eee4ff9698a ext4: drain in-flight DIO before buffered write fallback
    f82a4929d0ef7 ext4: clear stale xarray tags on folios skipped during writeback
    08df725b92751 thermal: intel: int3400: clean up ODVP on probe failures
    20068f9cce6d4 iommu/qcom: Fix inverted fault report check in qcom_iommu_fault()
    4f408943e79c5 iommu/qcom: Remove sysfs device on probe failure path
    2ff7713b7308c firmware: arm_scmi: Fix requested device removal race
    7647363fa0204 RDMA/core: Fix potential use after free in ib_dealloc_pd_user()
    76f2cb4f72181 RDMA/core: Fix potential use after free in ib_free_cq()
    6318be2f1bdd1 RDMA/core: Add driver APIs pre_destroy_cq() and post_destroy_cq()
    d5cc211e8c39e RDMA/core: Fix potential use after free in counter_release()
    d3d0eabe6e39b RDMA/core: Fix potential use after free in ib_destroy_srq_user()
    253c2ed71a532 RDMA/core: Fix potential use after free in ib_destroy_cq_user()
    a608af8cde3dd RDMA/core: Fix use after free in ib_query_qp()
    2001cb7bf6864 RDMA/core: Add rdma_restrack_begin/abort/commit_del() operations
    7a0cbb5721a1d RDMA/nldev: Fix locking when accessing mr->pd
    e61ac671304bc RDMA/restrack: Fix typos in the comments
    d08cfae802141 RDMA/core: Add an option to display driver-specific QPs in the rdmatool
    7670a3a09cd1b RDMA/core: Add support to set privileged QKEY parameter
    6e129c1310abf RDMA/erdma: Fix CEQ tasklet use-after-free on removal
    7d90d2b7bd961 PCI: j721e: Fix incorrect max_lanes for J7200
    74fc33e4fbe93 RDMA/srpt: Pass the mapped task attribute to target_init_cmd()
    b21c003c8a78b libbpf: Search /lib64 and /lib in resolve_full_path()
    7ba09330d9ea6 ext4: skip extra isize expansion during mount to prevent deadlock
    1a1dea633b724 ext4: fix out-of-bounds read in ext4_read_inline_dir()
    452950461241d ext4: fix circular lock dependency in ext4_ext_migrate
    6aaf6dbf54fdf ACPI: PCI: Clear driver_data on all paths that free the acpi_pci_root
    8e67b58c04990 ACPI: processor: validate MADT IOAPIC entry bounds
    13a1ba508507a ACPI: EC: Avoid _REG disconnect on GPIO IRQ defer
    f8e9315236c8b RDMA/nldev: validate dynamic counter attribute length
    c4643bcb3bdda irqchip/gic-v3-its: Prevent leak in its_vpe_irq_domain_alloc()
    47e59177bfcee selftests/bpf: Silence array bounds warning in global_map_resize
    e967bde356a8a kcsan: avoid unintended access checking in NMIs
    f65f45dfa1e6e RDMA/srpt: Fix srpt_alloc_rw_ctxs() unwind counters
    750bba6ce9bb0 RDMA/rxe: Validate num_sge/cur_sge before indexing wqe->dma.sge[]
    fd6dee13f3857 RDMA/hfi1: Propagate sdma_txinit_ahg() errors
    7987dd37eaeae arm64: dts: amlogic: meson-axg-s400: enable mipi_pcie_analog_dphy for PCIe
    afa5719047522 phy: starfive: Fix runtime PM cleanup in JH7110 DPHY RX probe
    41e92e0caa1fe ASoC: meson: Keep link pointers valid on realloc failure
    351eceec64355 dmaengine: dw-edma: Clear stale requests on termination
    b6293a8a38f4d dmaengine: dw-edma: Serialize channel state checks
    075de95d7a7cd dmaengine: dw-edma: Serialize abort state updates
    65e387b95d385 dmaengine: dw-edma: Terminate all descriptors without callbacks
    fe644b89b0a8e driver core: soc: Unregister bus on early device registration failure
    4ebf96d5f834a software node: Fix software_node_get_reference_args() with index -1
    b604d3f453c99 perf ui hists: Fix uninitialized stack memory free on pstack allocation failure
    a536eb57be584 mtd: part: reject MTDPART_OFS_RETAIN in mtd_add_partition()
    0ce48c6ddea1a mtd: mtdswap: Avoid freeing registered blktrans device twice
    25cdd2a492d86 vfio/pci: clear vdev->msi_perm after freeing it on init failure
    ce6c3dd9f1ce7 char: xilinx_hwicap: unregister class on init errors
    c92ef8fd83452 ipack: ipoctal: fix UAF, null-ptr-deref, and use-after-free in cleanup on remove
    5246bf384f74b tty: ipoctal: convert to u8 and size_t
    f53e742743c46 ppdev: prevent overflow when setting port timeout
    ec713896189fb cacheinfo: don't propagate DT/ACPI error when arch supplies info (arm64)
    0394902df3827 misc: ad525x_dpot: use driver core groups for sysfs files
    362f5e6f8edf3 misc: rtsx: add missing write register handling
    f7a8f4cbc8ced misc: bcm-vk: Use acquire/release for msgq_inited
    2e91ab73f9beb speakup: keyhelp: guard letter_offsets possible out-of-range indexing
    c5e4c36df3e6a accessibility: speakup: Fix incorrect string length computation in report_char_chartab_status()
    15340b00e665a uio: Fix stale info pointer in failed registration path
    57371e743398e UDF symlink pathComponent header OOB read
    0b94b2d1ab3fa tty: hvc: restrict HVC_DCC to ARMv6+ and ARM64
    fd43eae7d539e usb: gadget: f_uac1_legacy: remove broken string configfs attributes
    f593c55e3c125 ACPI: processor: idle: Expand _LPI package sanity checks
    22a5cf7a4b733 crypto: sl3516 - drop invalid sg_dma_len checks before DMA mapping
    079e64469bd21 drm/msm/a6xx: Fix stale rpmh votes after suspend
    4f9f0afdbdf51 gpu: host1x: Avoid stack over-read in debug output helpers
    cfe1b2fa40d24 gpu: host1x: Fix offset calculation in trace_write_gather
    f22ad9d1077c8 wifi: iwlwifi: mei: pass correct argument to function
    11dde137f1258 wifi: iwlwifi: guard against division by zero in iwl_dbg_tlv_alloc_fragments
    b90ebae632318 wifi: iwlwifi: mei: check SAP message length before reading it
    2541d4f165960 wifi: iwlwifi: mei: add support for SAP version 4
    5bcc933c6d47d wifi: iwlwifi: mvm: fix off-by-one in TXF key sanitiser
    8d74cb5fbb7a0 wifi: iwlwifi: fix counter type in iwl_fwrt_dump_error_logs
    c862282b5f4c3 perf jevents: Add more components to the metric sorting order
    489765bfa715e arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table
    533a26a2d6b29 arm64: dts: qcom: sm8250: sort out Iris power domains
    91b0528b4220a arm64: dts: qcom: msm8996-xiaomi-gemini: Fix up ti,drv2604 enable GPIO
    982caa744fce7 drm/bridge: tc358767: clamp the reported AUX read size to the request
    61b393c2de9d8 remoteproc: qcom: Fix glink->node reference leak in qcom_add_glink_subdev
    63d929c6035ca cpufreq: schedutil: Fix self-contradictory comment in sugov_iowait_apply()
    e9c60c62b3fa8 cpufreq: intel_pstate: Fix setting minimum P-state at init time
    dbe2842194426 media: i2c: rdacm21: Fix missing media_entity_cleanup()
    3d39757ef791f irqchip/renesas-irqc: Fix generic interrupt chip leak on remove
    aafec4a897d54 irqdomain: Add support for generic irq chips creation before publishing a domain
    917c6432f7272 genirq/generic_chip: Introduce irq_domain_{alloc,remove}_generic_chips()
    b359b1fe21434 irqdomain: Introduce init() and exit() hooks
    6e6a1e3f3c3f6 irqdomain: Handle domain hierarchy parent in irq_domain_instantiate()
    c2a5d22b10f42 irqdomain: Handle additional domain flags in irq_domain_instantiate()
    2a8a3c8867f08 irqdomain: Introduce irq_domain_instantiate()
    804e2374b4cc2 irqdomain: Introduce irq_domain_free()
    572624cc59dc4 PCI: xgene: Drop unnecessary OF node reference
    bff8e14aa442f PCI: xgene: Drop XGENE_PCIE_IP_VER_UNKN
    dc40f9f4f21c6 cpufreq: spear: Fix an IS_ERR() vs NULL bug in spear1340_set_cpu_rate()
    0a42180d5410c dax: read holder_ops once in dax_holder_notify_failure()
    1c94430cab25f libnvdimm/labels: Bound the on-media label size before the shift
    0f860db24ee95 firmware: arm_scmi: Drop handle on protocol bind failures
    0f4edd93d7089 firmware: arm_scmi: Protect device request lookup with RCU
    fe2aeb5c50683 firmware: arm_scmi: Use channel ID for transport teardown
    8eb2ab2095705 firmware: arm_scmi: Reject out of range DT protocol IDs
    aed24a3c63920 firmware: arm_scmi: Avoid IDR updates while cleaning channels
    ae7980c9af698 firmware: arm_scmi: Free transport channel on IDR failure
    70a26b3738984 firmware: arm_scmi: Unregister device notifier before IDR teardown
    fb7b9a7209f83 wifi: ath11k: cap out-of-range rx MCS instead of leaving bogus rate
    e20f3b749ad24 hfsplus: validate thread record before delete key rebuild
    7e9aee7e4d976 fs/ntfs3: fix slab-out-of-bounds write in ni_create_attr_list()
    1083c7dca912a fs/ntfs3: fix KMSAN uninit-value in ni_create_attr_list
    4ff4b6b9e85cf fs/ntfs3: Mark inode as bad as soon as error detected in mi_enum_attr()
    e3256df116f0a fs/ntfs3: Add more checks in mi_enum_attr (part 2)
    5b8d40df72c55 cxl/pci: Honor -EPROBE_DEFER from component register setup
    4347681957c55 cxl/pci: Store the endpoint's Component Register mappings in struct cxl_dev_state
    86771c105293c cxl/mbox: Break poison list loop on an empty payload
    48f55b90f0d71 rpmsg: glink: fix deadlock in endpoint destroy during driver detach
    db196a8962a53 rpmsg: glink: remove duplicate code for rpmsg device remove
    c7201bd08cad7 media: v4l2-async: Unregister sub-device if asc_list is empty
    601eb7f556810 media: v4l: async: Drop useless list move operation
    85904076cece7 isofs: fix out-of-bounds page array access on empty zisofs block
    648cdd16d633d ASoC: apple: mca: increase SERDES reset delay
    554261c9858a4 RDMA/hfi1: Initialize debugfs after probe completes
    506e333b1410c RDMA/hfi1: Stop flushing the global IB workqueue
    3f5e501f1ac47 RDMA/hfi1: Create workqueues before device initialization
    3471c19584d0d RDMA/hfi1: Remove redundant PCI device ID validation
    10e5e37495096 RDMA/hfi1: Free RX data on late probe failure
    3f1e196eb66b8 RDMA/hfi1: Preserve unit 0 on allocation failure
    695562587466d misc: rtsx_usb: avoid USB I/O in runtime autosuspend
    b0c8786242a77 pmdomain: bcm: bcm2835: handle genpd provider registration errors
    0f34ac40201e8 ALSA: hpi: Check transport errors during HPI6000 adapter initialization
    bdcda866c89f9 xfrm6: fix out-of-bounds write in xfrm6_input_addr() when secpath is full
    9e76202a1befe hwrng: ks-sa - Fix runtime PM cleanup on registration failure
    2016f01404c7d hwrng: ks-sa - access private data via struct hwrng
    c319b986a88ce RDMA/rxe: Avoid reprocessing the current packet after the QP enters the error state
    7bc08d7f9338c RDMA/ipoib: Drain RCU callbacks during module teardown
    2f946e7839f67 RDMA/mlx5: Drain RCU callbacks during module teardown
    7853af5f15738 RDMA/core: Wait for RCU callbacks before unloading ib_core
    39bb722b7e2c9 iio: accel: dmard09: Implement IIO_CHAN_INFO_SCALE
    682cb826b1ec5 bus: qcom-ebi2: use managed resources for clocks and children
    fb9738bf09514 soc: qcom: rpmh-rsc: manage PM notifiers with devres
    a8e5a6cff427c perf metricgroup: Fix metric expression copy leaks
    c582d79c8559a drm/panel: samsung-s6d16d0: Power off on prepare failure
    02e4a3088f21a usb: renesas_usbhs: Fix power-off ordering on unbind
    b76061c76d8c6 usb: mtu3: allow system suspend during active gadget connection
    f276b62f2ce1c platform/surface: acpi-notify: Check ACPI companion before use
    bf1e0cc5cc1d4 platform/mellanox: mlxbf-pmc: Check ACPI_COMPANION() against NULL
    44904468e58d3 usb: fix UAF when probe runs concurrent to dyn ID removal
    767ccd38e02eb USB: make to_usb_driver() use container_of_const()
    6ee22ab55856e USB: make single lock for all usb dynamic id lists
    85c8cb5c0be4a USB: core: Use device_driver directly in struct usb_driver and usb_device_driver
    4aaad88f85749 usb: gadget: aspeed_udc: check endpoint DMA allocation
    bdac0e8594a0c usb: gadget: aspeed_udc: Convert to platform remove callback returning void
    a28c486434634 usb: gadget: configfs: fix out-of-bounds read of qw_sign
    52c423309d461 serial: ma35d1: Fix OF node reference leaks in console init
    84a286a72228f hwspinlock: propagate errno when registering single lock
    a73cfa80f1ec6 remoteproc: qcom_q6v5_adsp: Fix reference leak for device node
    62b24e1c338f5 platform/x86: dell-wmi-base: Fix resource leak on module load failure
    a22beeb90475b platform/x86: dell-privacy: Fix race condition
    374e8007ba86c leds: pca9532: Fix inverted GPIO output polarity
    6347259f70172 iommu/amd: Fix false positive in SB IOAPIC IVRS validation
    9f06a7264aeda iommu/amd: Add support for Hygon family 18h model 4h IOAPIC
    ae2acdee5f8cf iommu/amd: Prevent SB IOAPIC from overriding IVRS validation errors
    c9dfb82df6fee iommu/msm: Return -ENOMEM on memory allocation failure in probe
    b201d43112589 iommu/mediatek-v1: Fix off-by-one in MT2701_LARB_NR_MAX
    51ddb831a3610 bus: mhi: ep: Fix device refcount leak in the error path of MHI device creation
    8e1101fc41180 bpf: Fix use-after-free on mm_struct in bpf_find_vma()
    68f2007738db7 efi: fix stale reference to efi_recover_from_page_fault()
    978524ecfc1c5 bpf: Fix vmlinux BTF prep race in bpf_get_btf_vmlinux
    8034ddf4751d9 udf: Mark LVID buffer as uptodate before marking it dirty
    150d3f3c46134 usb: gadget: r8a66597: avoid double free of ep0_req in probe error path
    fb7393519908b usb: typec: ucsi: unregister debugfs entries on teardown
    810875c5996f7 thermal/drivers/rcar: Fix error checking in probe()
    78c5da6150ded perf data convert json: Fix trace_seq memory leak in process_sample_event()
    4f65a8939518d arm64: dts: qcom: sc8180x-lenovo-flex-5g: Rename regulator nodes
    30dfa367086be arm64: dts: qcom: sc8180x: Enable the power key
    574a1124ab6fd arm64: dts: qcom: sc8180x-lenovo-flex-5g: move pinctrl to appropriate nodes
    f43f9bd3ece31 arm64: dts: qcom: sc8180x-primus: Rename regulator nodes
    0f4733f5fc6b6 clk: qcom: gdsc: tear down per-domain genpds in gdsc_unregister()
    3b110cd72a534 clk: qcom: gdsc: propagate gdsc_enable() failure for ALWAYS_ON domains
    ed07e0adfed4a clk: qcom: gdsc: propagate gdsc_check_status() errors from gdsc_poll_status
    0c3104e7ada4d timekeeping: Account for monotonicity adjustment in ntp_error
    dd29cd572958e y2038: uapi: Use 64-bit __kernel_old_timespec::tv_nsec on x32
    4d76e99010940 clocksource: Unregister subsystem on device registration failure
    98ea7a6cffa01 selftests: timers: leap-a-day: Fix -w option and update usage comment
    8aa8e8f5e236d irqchip/gic-v3-its: Fix its node leak in gic_acpi_parse_madt_its()
    8c701506a3896 irqchip/gic-v3-its: Fix memleak in its_probe_one()
    36d2cf0a9044d selftests/bpf: Fix memory leak in msg_alloc_iov
    fb17bee6b42c6 selftests/bpf: Fix memory leak in msg_alloc_iov error path
    dd4454dbe038d ALSA: via82xx: Remove unreachable branch in snd_via686_pcm_pointer()
    4520d673d49da staging: rtl8723bs: fix mismatched free of HalData in rtw_sdio_if1_init()
    98f9036b2254c staging: octeon: add missing napi_disable in cvm_oct_rx_shutdown
    65374d46e5507 staging: octeon: replace pr_warn with dev_warn in fill and rx paths
    a082526531f19 staging: octeon: ethernet-mem: replace pr_warn with dev_warn in free functions
    03725a114fb42 staging: octeon: fix free_irq dev_id mismatch in cvm_oct_rx_shutdown
    b6365e4186322 staging: octeon: add missing tasklet_kill in cvm_oct_tx_shutdown
    b631de4efcc17 staging: fbtft: Use sysfs_emit_at() to print to sysfs file
    52daf9de692eb greybus: audio: bound the topology section sizes against the fetched size
    6ddc6239b80de staging: sm750fb: gate dualview dataflow using g_dualview
    7b34f757e63c9 staging: greybus: audio: correct sscanf() return value check
    c40ba47f2ba19 wifi: mac80211_hwsim: avoid NULL skb in stop queue drain
    c2d446de9c7d0 bus: qcom-ebi2: Fix clock leak on probe failure
    aca12925ca316 bus: qcom-ebi2: Simplify with scoped for each OF child loop
    c75aed7464f63 arm64: dts: qcom: sm7225-fairphone-fp4: Fix address in fb node name
    8d89d53927ca2 PM: sleep: Fix off-by-one in wakelocks number limit check
    9118429571290 bus: ti-sysc: Fix /chosen node reference leak
    9584b3c30e4ee nvmet-rdma: fix response resource leak on queue teardown
    3220b338d5c79 nvmet-rdma: factor out response resource cleanup
    d130a12a80ca8 nvmet-rdma: use sbitmap to replace rsp free list
    85a79da286b65 nvmet-rdma: avoid circular locking dependency on install_queue()
    86782a72c6d8c nvme-apple: Use acquire/release for queue enabled state
    27ec91c29ee15 crypto: keembay - Fix AEAD unregister count in error path
    a22dc48d58ef4 crypto: rk3288 - fail ahash requests on HASH idle timeout
    04c46784ec249 crypto: sa2ul - stop probe if context pool creation fails
    28cc179252347 crypto: atmel-sha204a - fix heap info leak on I2C transfer failure
    6457162f74f45 crypto: atmel-ecc - reject hardware ECDH without a public key
    70933a1cac1fc crypto: atmel-ecc - clean up and improve ECDH comments
    c0615c85eabf9 crypto: atmel-ecc - replace min_t with min
    892f34dc1819c crypto: qat - clear AES key schedule from stack
    a8aa89686e705 perf/x86/amd/uncore: Add group validation
    e0e7c57c8f654 perf/x86/amd/uncore: Refactor uncore management
    64463f1901d33 perf cs-etm: Fix thread leaks on trace queue init failure
    99d3245941659 perf cs-etm: Queue context packets for frontend
    8e5df43a45788 perf cs-etm: Create decoders after both AUX and HW_ID search passes
    96d80b8319b3d perf cs-etm: Fix incorrect or missing decoder for raw trace
    655c4401c18d7 wifi: rtw89: fix HE extended capability length check
    7780d93ae28f3 platform/chrome: sensorhub: Fix memory overread in ring handler
    c3d0e87485242 selftests/rseq: Replace glibc-specific __GNUC_PREREQ with portable check
    e71a3dc5b8d2e csky: Fix a4/a5 restoration in syscall trace path
    8d32795f0a49f iio: orientation: hid-sensor-rotation: Avoid race between callback setup and device exposure
    f80c31231f85e soundwire: qcom: Fix port exhaustion check in stream_alloc_ports
    aaff22cc321a3 dmaengine: hisilicon: Return -ENOMEM on dynamic memory allocation in probe
    fdaf297ab275c dmaengine: xilinx_dma: Fix channel idle state management in AXIDMA and MCDMA interrupt handlers
    2c6bb2f286369 dmaengine: mediatek: mtk-uart-apdma: Return -ENOMEM on memory allocation failure
    953e85da53541 bpf: Copy per-CPU map value padding in copy_map_value_long()
    9004fc411a4c5 tools/bpf/bpftool: Reset vmlinux BTF after struct_ops commands
    c2dae438fe530 tools/bpf/bpftool: Reset vmlinux BTF after map commands
    b349dcf061a6d drm/amdgpu/pm/powerplay: bounds-check voltage index in Vega10 lookup
    745297208d312 drm/amdgpu/pm/powerplay: bounds-check voltage index in SMU7 lookup
    28f70e0aa767a regulator: tps6594: Fix device node reference leaks in multiphase loop
    017cee438fff6 regulator: tps6594-regulator: refactor variant descriptions
    e8d3e15b9dd68 regulator: tps6594-regulator: remove hardcoded buck config
    23a18b7506a10 regulator: tps6594-regulator: remove interrupt_count
    75ab28f275538 regulator: tps6594-regulator: Constify struct tps6594_regulator_irq_type
    ac25127d2f353 regulator: tps6594-regulator: Fix the number of irqs for TPS65224 and TPS6594
    54308f24ce510 regulator: tps6594-regulator: Add TI TPS65224 PMIC regulators
    d9c48f4e68615 mfd: tps6594: Add register definitions for TI TPS65224 PMIC
    1f27602b20119 perf tests: Fix flakiness in BPF counters test on hybrid systems
    a223216745ed4 perf test: Fix perf stat --bpf-counters on hybrid machines
    c292f2c183254 perf test: Use sqrtloop workload to test bperf event
    ff43d641b3bfb perf test stat_bpf_counter.sh: Stabilize the test results
    30db36f6e1503 perf test bpf-counters: Add test for BPF event modifier
    a04531eb40eb9 perf test: raise limit to 20 percent for perf_stat_--bpf-counters_test
    203514384ea3c perf tests: Skip metrics validation if system-wide recording lacks permission
    6ccaa141be258 perf test: Do not skip when some metrics tests succeeded
    db1ce7949a1cc perf test all metrics: Fully ignore Default metric failures
    ce09d02a597cb perf test metrics: Update all metrics for possibly failing default metrics
    e386dedc41094 perf tests metrics: Permission related fixes
    1437d124d2ede perf test stat_all_metrics: Ensure missing events fail test
    a379a49b88d14 perf test: Update all metrics test like metricgroups test
    361c06583eb3b perf test: Simplify metric value validation test final report
    3db8b4f7f4eaf media: keymaps: Remove obsolete RC_MAP_HAUPPAUGE_NEW keymap define
    68f283e4d2202 media: keymaps: Remove obsolete RC_MAP_RC5_TV keymap define
    3b978fd0a3092 pinctrl: bcm2835: Don't remove an unregistered GPIO chip
    ff48a41a242f2 perf/x86/intel/uncore: Keep PCI PMUs working when MMIO/MSR setup fails
    69fafae4eb2c9 sched/fair: Fix overflow in update_tg_cfs_runnable()
    f5ec164e733b9 mm/mm_init: fix incorrect node_spanned_pages
    788917ba77f5d drm/lima: call drm_mm_init() with a valid allocation range
    0c90fe8d8039f clk: imx: scu: drop redundant init.ops variable assignment
    3f0ebe8f8ae31 ARM: imx: fix device_node refcount leaks in imx7_src_init()
    01a854226f5d1 ARM: imx: fix device_node refcount leak in imx_src_init()
    d3d51e874f7c0 clk: hisilicon: reset: Use devm_kzalloc to initialize hisi_reset_controller
    1bb23c9d68312 ASoC: rt700-sdw: always drain jack work on remove
    b550b77f34f19 clk: nuvoton: ma35d1: fix ma35d1_clk_pll_determine_rate logic
    25f46d2536332 clk: nuvoton: ma35d1-pll: convert from round_rate() to determine_rate()
    418401f2a872d clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field width and fractional calc
    828a90dadda6c clk: nuvoton: ma35d1: fix ignored div_u64 return values in PLL freq calculation
    6956464d233a7 clk: moxart: remove unused variables, fix refcount leak
    909f1b54d5a09 clk: versaclock7: Fix APLL clock leak on probe failure
    b37e82a046e73 media: cec-pin: Fix event FIFO ordering
    111f1311bbdbe soc: samsung: exynos-pmu: fix of_node refcount leak in exynos_get_pmu_regmap()
    4b29be4b23bc2 HID: roccat: bound device-supplied profile index
    e45631bf607fa HID: nintendo: Fix imu_timestamp_us double increment per report
    92cca302a4eaf HID: core: quiesce input in hid_hw_stop() to prevent use-after-free
    4e37371cb4e3b platform/chrome: cros_ec_typec: Reject out-of-bounds PD cap count
    c0e090bd67085 x86/cfi: Use symmetric SYM_START and SYM_END in __CFI_TYPE()
    02e095247f0a9 smack: restrict smackfs/{direct,mapped} values to 0-255
    c7bb74fa9c382 smack: deduplicate smackfs/{direct,mapped} file_operations
    6d4addf839b94 smack: simplify write handlers of sysfs entries
    ec47f4177046d smack: fix incorrect task context in smack_msg_queue_msgrcv
    139460b7723ca drm/bridge: cdns-mhdp8546: Return an error pointer on allocation failure
    a008506e55e33 drm/rockchip: vop2: Recognise 10-bit YUV422 as YUV format
    8504b0e1acef9 drm: lcdif: Wait for vblank before disabling DMA
    9ed9a94c1a41d drm: Remove unused header in drm_dumb_buffers.c
    6d79a939e284e mm/damon/core: skip aging from repeated aggressive merging
    a886ad5f6348f usb: typec: ucsi: use UCSI_TIMEOUT_MS for sync command completion
    404079d124d75 clk: meson: align gxbb_32k_clk_sel number of parents with actual count
    29639f00bfa49 perf sched: Fix register_pid() overflow, strcpy, and BUG_ON
    a3e07db74f22a batman-adv: bla: avoid CRC corruption due to parallel claim add
    1674855a5b6ea batman-adv: dat: atomically update mac addresses
    d161c4456672f ceph: fix BUG_ON in __ceph_build_xattrs_blob() due to stale blob size
    5e641e4ee0bc1 ksmbd: fix durable reconnect error path file lifetime
    f0ff7f12398e8 ksmbd: fix use-after-free in smb2_open during durable reconnect
    64eaf4ecda007 bpf: Fix same-register dst/src OOB read and pointer leak in sock_ops
    2120bd8546cd6 bridge: mrp: reject zero test interval to avoid OOM panic
    de6601f1374fa netfilter: nft_counter: serialize reset with spinlock
    e2e9599f3503d bpf: Reject narrower access to pointer ctx fields
    c9a129c82ddf8 ceph: fix oops due to invalid pointer for kfree() in parse_longname()
    4b9aee707c458 parse_longname(): strrchr() expects NUL-terminated string
    0afd48b173beb net/niu: Niu requires MSIX ENTRY_DATA fields touch before entry reads
    97aabdbf7ba82 ksmbd: fix WARNING "do not call blocking ops when !TASK_RUNNING"
    73f074fb5e139 ksmbd: fix overflow in dacloffset bounds check
    9c6c85ae77efb net: libwx: fix Tx L4 checksum
    5eaf57fdfa37c md/md-bitmap: fix wrong bitmap_limit for clustermd when write sb
    7493b9baf0e54 wifi: ath11k: Clear affinity hint before calling ath11k_pcic_free_irq() in error path
    9d213ca0cb49e net: hns3: fix kernel crash when 1588 is sent on HIP08 devices
    7f1fe43907a63 net: hns3: don't auto enable misc vector
    2b844d952e23d mm/damon/tests/core-kunit: catch test failure in test_merge_regions_of()
    1acb6d1ece3bc mm/damon/core-kunit: handle region split failure in filter_out()
    9b7cf02158d93 mm/damon/vaddr-kunit: check region count in three_regions test
    072d538e9d8c5 mm/damon/paddr: drop last same folio access check reuse optimization
    2b48a84d31dc3 mm/damon/vaddr: drop last same folio access check optimization
    94c4828bee3da mm/damon/core-kunit: check region count before testing in split_at()
    c3c126a6142a1 nvmet-auth: Synchronize timeout work during SQ teardown
    f3d8c2fd591bb net/mlx5e: xsk: Fix unlocked writing to ICOSQ
    9fffa6465851a tcp: clear sock_ops cb flags before force-closing a child socket
    43239fc6dfb62 xhci: fix lost bounce buffers on TDs spanning several ring segments
    a129b2b875c14 drm/nouveau/uvmm: clear the dirty flag when unwinding an OP_UNMAP_SPARSE
    ba42d8a1c2c76 drm/nouveau/uvmm: fix premature region free on failed OP_UNMAP_SPARSE
    f02aefbc43bd7 drm/nouveau: Use write-combined maps for coherent
    0f47c47b45738 drm/amdkfd: Reject zero-sized AQL queue allocations after size halving
    b4c90c78f420c drm/amdgpu: use AMDGPU_GPU_PAGE_SHIFT instead of PAGE_SHIFT
    5d501f7279451 drm/amdgpu: fix autosuspend cleanup during removal
    84a8012601b9a drm/amdgpu: check thunderbolt before switcheroo registration
    e2f27b5ed9084 drm: Fix drm_crtc_commit leak if signaled when PAGE_FLIP_EVENT is used
    4f966558c188b drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value
    082e378886547 drm/gud: validate TV mode names before creating enum property
    89210cb5ff8fd drm/gud: NUL-terminate TV mode names read from the device
    6dceaeceaa7c8 drm/amdgpu/vcn: fix integer overflow in dec_msg buffer count check
    4d5ee095a5846 drm/amd/display: avoid divide-by-zero in __is_lut_linear()
    6fa33b32783e9 drm/hibmc: Use drm_atomic_helper_check_plane_state()
    1f0b71afd81de drm/hibmc: Fix list of formats on the primary plane
    5296c567cbacc drm/sun4i: fix refcount leak in sun4i_backend_init_sat()
    4a0236fe97732 drm/i915: Guard against NULL driver_data in i915_pci_probe()
    a0a7e2e177f2f drm: fix race between partial drm_dev_register() failure and ioctl
    8d9e6dffaea9b drm/panel-edp: fix i2c adapter leak on probe failure
    c0cbdb43e0c65 drm/bridge: dw-hdmi: fix i2c adapter leak on probe failure
    6882d458d2e40 f2fs: fix to zero post-EOF data when extending file size
    d7a07c9ac1e71 f2fs: fix to off-by-one issue in f2fs_zero_post_eof_page()
    e601926015e03 f2fs: fix i_size when pinned fallocate partially fails
    694565c0c14c9 f2fs: return writeback error from collapse range
    4c0c610b480cf f2fs: use the mount idmap for the owner check in f2fs_xattr_advise_set()
    ca1a602d4f73c f2fs: reject overlapping move range after len expansion
    4aa12ba10cbff f2fs: return symlink writeback errors
    2935b730211c5 scsi: qla2xxx: Skip NVMe LS reject IOCB when FW not started
    947c6bfcf7f5e scsi: qla2xxx: Zero-init bsg stack buffers to avoid info leak
    9c00b89160406 scsi: qla2xxx: Use coherent DMA buffer for D_Port diagnostics
    e8f1b0cb97823 scsi: qla2xxx: Hold vport_slock for host map update in report ID acquisition
    e72c9eb93c5f1 scsi: qla2xxx: Drop vport reference under lock in report ID acquisition
    af8650037eec2 scsi: qla2xxx: Fix NVMe abort reference leak on repeated abort
    d79376fbd2a07 scsi: qla2xxx: Avoid req_q_map double-read in qla2x00_error_entry()
    be75ab791c9b3 scsi: qla2xxx: Bound rsp_info_len to avoid OOB sense-data read
    6e217a9482eab scsi: qla2xxx: Avoid double completion in async IOCB timeout
    7ac5be2a86096 scsi: qla2xxx: Quiesce response IRQ before freeing request queue
    6e3f129538c32 scsi: qla2xxx: Fix response queue over-consumption in __qla_consume_iocb()
    8f0e31e7a4137 scsi: qla2xxx: Reject non-SCSI SRB on status IOCB fast path
    b6a30baa29695 scsi: qla2xxx: Don't query firmware state while chip is down
    5762d992dddaf scsi: qla2xxx: Fix FCE trace enable parsing in debugfs
    2f847f06bb223 scsi: qla2xxx: Zero mailbox struct in qla2x00_get_firmware_state()
    6003e79148eca scsi: qla2xxx: Fix FCE trace use-after-free during firmware dump
    ae09260be7454 scsi: qla2xxx: Fix cs84xx use-after-free on host teardown
    9cef42a073a0b scsi: qla2xxx: Serialize flash version read in reset handler
    e80adfeac61b4 scsi: qla2xxx: Clamp MSI-X derived queue counts to avoid truncation
    7eb618877503e scsi: qla2xxx: Hold qpair lock when sending NVMe LS reject
    047f1f7ee6f85 scsi: qla2xxx: Bound image count in qla2x00_update_fru_versions()
    5b8ed910c392c scsi: qla2xxx: Check entry_status in qla24xx_modify_vp_config()
    b403700ac62fb scsi: qla2xxx: Initialize NVMe abort_work once at submission
    f8d2eb510c063 scsi: qla2xxx: Hold vport reference in qla24xx_report_id_acquisition()
    55f8698a6caf8 scsi: qla2xxx: Fix Name Server logout detection on FWI2 adapters
    de0c8ef3b900c scsi: qla2xxx: edif: Fix NULL pointer deref in RX SA delete check
    9a756f277eb89 scsi: qla2xxx: Bound i2c->length in I2C bsg handlers
    84bde5ce4038d scsi: qla2xxx: Zero SFP DMA buffer in FRU/I2C bsg handlers
    c4acac8cdc005 media: zoran: Avoid freeing a registered video_device twice
    ca87a19381ae6 media: vimc: fix pixel format lookup in enum_framesizes
    3d1b10d81fe54 media: video-i2c: fix kthread error pointer left in kthread_vid_cap on failure
    7c0212041fab2 media: venus: fix payload size calculation in parse_raw_formats()
    fdf1eb47a60db media: venus: fix payload size returned by parse_caps() and parse_alloc_mode()
    ef609b3ce456f media: v4l2-fwnode: Fix fwnode leak in v4l2_fwnode_parse_link
    ea5a921d4d277 media: v4l2-ctrls: Allow unknown HDR10 white point and luminance
    d273571e53140 media: v4l2-async: avoid deleting unlinked ASC entry on link error
    593b1172e5d54 media: tda18250: fix possible integer overflow
    77f216f8de622 media: saa7164: fix cleanup on resource allocation failure
    5626785b0e466 media: s2255: check firmware size before reading trailing marker
    79f58f900dd22 media: s2255: bound JPEG frame size before copying into the buffer
    c91e8ae2b39c6 media: rtl2832_sdr: release URBs and stream buffers on start_streaming() failure
    053581d4657c6 media: rtl2832_sdr: use vb2_video_unregister_device() on remove to fix DMA leak
    826763adbd8bd media: rc: sunxi-cir: Unregister rc device on probe failure
    c817f24410626 media: nxp: imx8-isi: Use BIT_ULL() for 64-bit stream masks
    e9fe8e3f758f8 media: nxp: imx8-isi: Correct color map between V4L2 and ISI
    94666ec4ae770 media: nxp: imx8-isi: Fix stream ID validation bypass in crossbar routing
    680a89683197c media: meson: vdec: fix NULL pointer deref in vdec_try_fmt_common
    7512838a19af0 media: i2c: ov7740: fix use-after-destroy in remove
    4c2988bf1ad27 media: i2c: ov02a10: fix endpoint parsing use-after-free
    1c9fdd9465211 media: go7007: defer the ALSA v4l2 put until card release
    20aacd87550be media: em28xx: fix use-after-free of dev_next->devlist on disconnect
    4e11c45dfdc72 media: em28xx: defer audio-only extension registration
    ec82b0cf7f75f media: cx23885: cancel NetUP CI work before teardown
    54ac6df8b8d97 media: cx231xx: reject geometry changes while the VBI queue is busy
    42e00371f83c3 media: cobalt: Avoid freeing ALSA private data twice
    22441be29ec27 media: cedrus: fix memory leak in cedrus_init_ctrls()
    271e57a936dcd media: cec: Serialize exclusive follower delivery
    cf3bf86f32371 media: cec: meson: ao-cec-g12a: name the CEC core regmap to avoid debugfs clash
    954ee95a03b4d media: cec: core: Fix kmemleak due to missed rc_free_device() call
    6e4ea90fdc660 media: airspy: use vb2_video_unregister_device() on disconnect to fix NULL deref
    ff40e597d5d98 LoongArch: Avoid preempt count underflow without probe
    a03b5e7483ad2 LoongArch: Do not save/restore percpu base register in rethook trampoline
    9c55a7d4e521c KVM: s390: Restore sigset on error path
    1914499556464 KVM: s390: pv: Fix rc/rrc offset for PVM_DUMP
    934b7b2b76d34 KVM: s390: Zero initialize irq in reinject_machine_check
    f8e3a9997d5ec KVM: s390: Take srcu when importing watchpoint data
    544a5a665019c KVM: s390: Free guest debug data on vcpu destroy
    5fbf319137735 KVM: s390: Fix old_data leak in guest debug error path
    5940418e4232a KVM: s390: Fix memory leak in guest debug handling
    fec89d327d9b2 KVM: s390: Fix length check __import_wp_info()
    8e19ded843368 KVM: x86: hyper-v: Clamp stimer deadline to avoid livelock
    312cdb6d89408 KVM: nVMX: Service local TLB flushes on failed nested VM-Enter
    62604376c3131 KVM: nVMX: Always flush vpid02 on first use
    ee2d20a386668 iio: light: opt4001: Fix reversed GENMASK() arguments in fault count mask
    7a1be6e7a857e iio: light: opt4001: Reject integration times with a non-zero seconds part
    0f9f6d0ee5a59 iio: light: opt4001: Fix incompatible pointer type passed to div_u64_rem()
    170904917dc8d iio: light: opt4001: Fix power down clearing bits of the wrong register
    9b75d89fd1e3d iio: temperature: hid-sensor-temperature: switch to non-devm iio_device_register()
    e44b2af0c14e2 iio: srf04: fix pm_runtime handling on probe error path
    d97f4e012ba37 iio: pressure: mpl115: Fix runtime PM cleanup
    a32a39da18e01 iio: pressure: dps310: fix NULL pointer dereference on ACPI probe
    da41c3e0e67a3 iio: light: gp2ap002: Disable regulators on resume failure
    82c27dabc391b iio: light: cm32181: return zero after writing calibscale
    7dfbbb2f219fd iio: gyro: mpu3050: fix sign of raw angular velocity readings
    f5acb824277a9 iio: dac: m62332: Fix regulator reference count imbalance
    3462c13bb0f50 iio: chemical: sgp30: Handle IAQ thread creation failure
    f64b437641b5a iio: chemical: atlas-sensor: use iio_trigger_poll_nested() to fix remove UAF
    72daa7eb7fc62 iio: chemical: atlas-sensor: fix PM reference leak in buffer postenable
    ed43e34f431d1 ASoC: samsung: aries_audio_probe: double of_node_put due to direct assignment without of_node_get
    4dc91d0dadfe2 AsoC: intel: sst: fix PCI device reference leak on probe failure
    6150b04ce8474 ASoC: fsl: mpc5200-i2s: Free DMA resources on probe failure
    f4bfd755c52df ASoC: cs35l34: drain threaded IRQ before runtime suspend
    614c2616ea677 ASoC: cs35l33: drain threaded IRQ before runtime suspend
    52f7ce8896d6e i2c: mux: demux-pinctrl: fix OF node leak on kstrdup failure
    0c4c642b4d03e clk: qcom: gcc-mdm9607: Drop incorrect BIMC PLL and related clocks
    ad3436ad31b83 clk: qcom: gcc-mdm9607: Fix halt_reg for gcc_apss_axi_clk
    c93a8c7064b33 clk: qcom: gcc-mdm9607: Fix enable_reg for gcc_blsp1_sleep_clk
    0c0609c1da0df clk: qcom: gcc-mdm9607: Drop incorrect system_noc_bfdcd_clk_src
    0944e2cd198f6 clk: qcom: gcc-mdm9607: Drop incorrect apss_tcu_clk_src
    1e2465ee57a3a clk: rockchip: rk3588: Don't change PLL rates when setting dclk_vop2_src
    ce6f40f8dc66b clk: qcom: gcc-msm8939: Fix enable_reg for gcc_blsp1_sleep_clk
    a2c156d22c3db clk: qcom: gcc-msm8916: Fix enable_reg for gcc_blsp1_sleep_clk
    b89701e1fae14 batman-adv: bla: prevent CRC corruptions after claim flush
    76aedcde5a248 batman-adv: bla: fix freeing of claims on meshif deletion
    c74a4acf41d19 batman-adv: dat: avoid unaligned fault in IP extraction
    6df64825f8b19 batman-adv: fix stale receive device on merged fragments
    ddb6ddf5be742 mtd: rawnand: validate ONFI extended parameter page sections
    f25c804947e0a mtd: mtdoops: free page bitmap when the backing MTD is removed
    da740539e8f37 mtd: afs: validate v2 image info bounds
    58f6f9125e74d s390/vfio-ap: Fix required lock not held during update of ap_matrix_mdev object
    4ba8a08f5f26e s390/vfio-ap: fix potential use of uninitialized apm_filtered bitmap
    31fa0a8a3c337 s390/vfio-ap: Fix NULL deref in status_show() during queue probe
    3a9b049bbdc40 s390/vfio-ap: Fix hot-unplug skipped when last AP adapter or domain removed
    5e932abfcce61 s390/vfio-ap: Fix dereference matrix_mdev->kvm without checking for NULL
    02e72909453de s390/vfio-ap: Fix control domain removal in vfio_ap_mdev_cfg_remove
    1f54efd800320 s390/vfio-ap: Fix stale do_remove flag across iterations in vfio_ap_mdev_cfg_remove
    eb6cc898501a0 s390/vfio-ap: fix stale pqap_hook pointer on error in vfio_ap_mdev_set_kvm()
    114b6ce2cf864 powerpc/crash: stop watchdogs before booting kdump kernel
    9c8e0e526b769 powerpc/pseries: Move H_WATCHDOG definitions to a common header
    b0cf5aceafb4b powerpc/pseries: Handle and log pseries-wdt registration failures
    b96be860673f9 powerpc/mm: fix wrong addr_pfn tracking in compound vmemmap population
    f5e9bea0d7c15 parisc: Fix alignment of asm statements in head.S
    62d88e93ef5e1 parisc: eisa: Fix infinite loop when parsing invalid IRQ value
    f9bf05c63b77d nvdimm/btt: reject an arena whose nfree is below the lane count
    6eddedb1a3009 mm/hugetlb: fix missing migratable flag on same-node hugetlb migration
    0fb7c549357c1 Revert "irqchip/mbigen: Fix mbigen node address layout"
    9fb527103e53f nvmet-tcp: reject unsolicited H2CData PDUs
    cf5f39d2b58f9 nvmet-tcp: fix out-of-bounds write when receiving an over-long PDU
    0673a2affe45c nvme-tcp: check the data direction of a C2HData PDU
    ad29779736cfd ALSA: pcm: Fix race between non-atomic ops and trigger-start
    7dc239edb6d58 ALSA: harmony: initialize locks before requesting IRQ
    08d931a0a850a arm64: mm: Fix the lockless page-table walk in show_pte()
    0927153f2abf4 i2c: mux: Fix channel node leak on adapter add failure
    f9094ace03e0a i2c: core: fix debugfs UAF on adapter removal
    ca19a175e89b7 perf/x86/intel: Fix kernel address leakages in LBR stack
    341ec28243f16 rtc: rzn1: Disable alarm interrupt before reprogramming alarm registers
    5548f41e2f8dc rtc: rzn1: Fix weekday underflow when alarm crosses month boundary
    a098e2cecd9d2 Input: aiptek - validate raw macro indices before updating state
    630ed8734a02b kprobes: Protect kprobe_blacklist with RCU
    30b5c0e17dcad ima: Check for ERR_PTR from dentry_path() in validate_hash_algo()
    23a969a2df8de ata: ahci: work around lost interrupts on Marvell 88SE61xx
    642b76f92bc42 block: flag zoned disks with GENHD_FL_NO_PART
    a38caa9ed0d5c cpuidle: dt_idle_genpd: kfree() the original name allocation
    17ef63843c0fc dmaengine: dw-edma: Initialize IRQ data before requesting IRQs
    8bc87a50fd0ea dmaengine: dw-edma: Complete descriptors before pausing
    718ee263a60d5 dmaengine: dw-edma: Fix HDMA channel status register access
    94f3d399c1ddb dm: fix resume-vs-remove race
    0ea6e5ad4a581 dm: fix race when loading and unloading a table
    96dd0af7597ab HID: wacom: validate report length in wacom_intuos_pro2_bt_irq
    a8be8bbf0952b HID: rmi: fix OOB access with undersized RMI reports
    81aadbd09bf1d futex: Prevent rcuwait use-after-free during requeue PI
    2bf705699fd72 mm/damon/sysfs: kobject_del() target (normal), context and kdamond dirs
    c97ded32334d9 mm/damon/sysfs: kobject_del() region and target (error) dirs
    ffab414fc5e06 mm/damon/sysfs-schemes: kobject_del() scheme region dirs
    0e4aa31ab32a3 mm/damon/sysfs-schemes: kobject_del() scheme filter dirs
    b33f9b0184159 mm/damon/sysfs-schemes: kobject_del() scheme dirs
    2853ce9c88e0e scsi: pm8001: Use rollback index when freeing MSI-X vectors
    6b589ef9d5f6c scsi: target: iscsi: Reserve a terminator byte for the login payload
    635b2bddea565 spi: bcmbca-hsspi: disable clocks on resume failure
    d45f27903f945 spi: bcm63xx: disable clock on resume failure
    5597b4ffd0bec spi: bcm63xx-hsspi: disable clocks on resume failure
    be41733c24be5 ublk: clear VM_MAYWRITE on read-only ublk char device mmap
    d3018aaa5e3b1 thermal/drivers/qoriq: Disable clock on resume failure
    03ff03e5c95a5 thermal/drivers/imx: Disable clock on runtime resume failure
    0b7f64c7bb966 staging: rtl8723bs: fix OOB read in rtw_action_frame_parse()
    fd5e24ea83733 staging: rtl8723bs: fix OOB read / stack overflow in rtw_get_wps_attr()
    7a4f4ca7ff32a usb: gadget: fix null pointer dereference in usb_put_function_instance()
    162178ca83c3d USB: gadget: fix NULL pointer dereference in gadget_dev_ioctl()
    f9bdf4c4f6410 usb: gadget: f_midi2: fix use-after-free in string attribute show path
    51ddc55c75087 usb: gadget: midi2: Fix null-pointer dereference in f_midi2_free_ep_reqs
    58e0ee293ec5e usb: typec: ucsi: displayport: Fix OOB altmode array index
    0b69b166852db usb: typec: qcom-pmic: cancel reset_work on stop
    dbbb3bb0bf2f3 usb: f_mass_storage: Bump local buffer size in fsg_common_create_luns()
    9481bc04a8c35 usb-storage: ene_ub6250: fix race between scan work and probe
    67374e3a00814 media: usbtv: keep device alive while ALSA card exists
    d91993f4c7635 clk: qcom: gcc-mdm9607: Increase delay for USB PHY reset
    1d4add2b832b5 ALSA: usb-audio: fix OOB write in snd_usbmidi_us122l_output()
    553c375e86a49 usb: image: mdc800: change kmalloc() to kzalloc()
    4c5b61b9df6ab drm/amd/display: fix division by zero in get_estimated_bw()
    28ed5343666ff scsi: core: Fill in DMA padding bytes in scsi_alloc_sgtables()
    2df964d141270 tracing/mmiotrace: Add NULL check for mmio_trace_array in logging functions
    517ed2f9ea7d9 tracing/mmiotrace: Remove reference to unused per CPU data pointer
    7ab40f7577d88 net: ntb_netdev: Fix TX busy and drop handling
    23001ee5d8631 entry: Fix seccomp bypass after ptrace with TSYNC
    cd644e6dc72ee tcp: fix potential race in tcp_v6_syn_recv_sock()
    343ae18e960f6 fsnotify: Fix stale object mask after concurrent mark updates
    b4bf67cc0871b wifi: mt76: mt7996: validate default EEPROM firmware size
    dfb10d9890561 landlock: Require LANDLOCK_ACCESS_FS_MAKE_REG for whiteout creation
    680f20d5937fa openvswitch: Fix CT limit teardown use-after-free
    d7c2b66bc5527 net: openvswitch: fix kernel-doc warnings in internal headers
    8069643ae64df net: skbuff: don't skb_tx_error() the source skb in skb_zerocopy()
    e34ff3f882292 platform/chrome: sensorhub: Fix dropped timestamp events and log spam
    8395cff0b286d udf: Fix i_lenExtents truncation on 32-bit kernels
    51e368f723aa5 timer: Keep debugobjects state consistent in migrate_timer_list()
    2252f8ccc3085 taskstats: fix cpumask parsing cutting off the last character
    f9c7b1f2b9d8f smack: fix cred UAF in smack_file_send_sigiotask()
    6b1de022304ef signal: avoid shared siginfo namespace rewrites
    262b805219157 sticon/parisc: Detect default STI graphics card for console output
    b0dc3f18af01b tpm: tpm_i2c_nuvoton: disable IRQ on wait timeout
    6c1a8685be6a7 xarray: honor XA_FLAGS_ACCOUNT in xas_split_alloc()
    0f6496b34cc29 w1: ds28e17: reject an oversize length on an I2C block read
    b9cb4e8ba71c9 vsock/virtio: flush works in dependency order
    ef2ec8b537c3a wifi: mt76: mt7615: avoid waiting for mac work under the mt76 mutex
    c86199357a93b wifi: rtw88: Fix potential memory leak in rtw_txq_push_skb()
    2610885f70861 wifi: rtl818x: initialize eeprom_93cx6 struct to zero
    f2134d6ff30cd wifi: mwifiex: Detach sync cmd buffer on interrupted wait
    7704f6ba2a8c4 wifi: brcmfmac: Fix memory leak in brcmf_sdio_read_control()
    35aa6730b8c56 i3c: master: svc: bound IBI payload to the requested max_payload_len
    ef72ff6650c4e i3c: master: Fix info leak and UAF in device unregister path
    42ea423a50ae1 dm-switch: use WRITE_ONCE() in switch_region_table_write()
    389a50d094e13 dm-stats: fix a crash if allocation of per-cpu data fails
    d1361d4a42bbd arch_numa: avoid false positive fortify warning in setup_node_to_cpumask_map()
    d18bbf8262516 x86/tdx: Fix zero-extension for 32-bit port I/O
    0444f2803b963 PCI: hv: Set irq_retrigger callback for the Hyper-V PCI MSI irqchip
    342d8d63f653c cgroup/cpuset: Fix misplaced DL migration reset
    368c521503e38 ALSA: virmidi: Check card index validity at probe
    487ede9b648fc ALSA: serial-u16550: Check card index validity at probe
    64898e9bd8b7b ALSA: portman2x4: Check card index validity at probe
    ede25b7fea0d7 ALSA: pcxhr: initialize mutexes before requesting threaded IRQ
    9cd7c59a106e7 ALSA: mts64: Check card index validity at probe
    26a25fb4ef4ba ALSA: mpu401: Check card index validity at probe
    6c07aad8a7c9e ALSA: bcd2000: clear the URB pointers on disconnect
    6fe7d13608a9d ALSA: aloop: Check card index validity at probe
    00e84a9ff2d43 ALSA: 6fire: bound the MIDI event length from the device
    96c74420ac929 seg6: reset IP6CB after IPv6 decapsulation
    6ec22afc82a3c net: skbuff: don't touch shared zerocopy state in skb_tx_error()
    bfb1c9e6297b4 net: fix spurious TX timeout after dev_activate()
    84783961cb8bd net: cap advertised IP tunnel headroom
    b6b6ac713ee82 net/smc: unregister the connection before draining the rx tasklet
    df441f3efbb50 net/smc: fix use-after-free in smc_rx_pipe_buf_release()
    09d7a9e162ee1 net/smc: fix socket refcount leak in smc_switch_conns()
    ab26e12dd5d2f net/smc: do not dereference an unset send buffer on the SMC-D teardown path
    746681f9e8773 net: ntb_netdev: Count packets dropped on RX refill failure
    965c4452bfe34 net: ntb_netdev: Avoid double-accounting netif_rx() drops
    b6db88cde0fb5 NTB: ntb_transport: Reject oversized TX buffers
    e6cc541fab010 NTB: ntb_transport: Fail TX enqueue when the QP link is down
    81fbd4021ca93 NTB: ntb_transport: Recycle TX entries before client callbacks
    e0d4a17afde5a net: thunderbolt: Mark the connection down when bringing it up fails
    47981eb66461b net: thunderbolt: Release the Rx HopID that was handed out on mismatch
    bf3308416a2be net: ravb: avoid dereferencing an invalid PTP clock
    06323666c4e2b net: openvswitch: fix nf_connlabels leak in ovs_ct_init
    64051fe200c7c net: openvswitch: fix flow mask use-after-free on flow deletion
    010eee265d6bd net: tun: bound receive headroom
    98610769784d0 net: usb: qmi_wwan: add Telit Cinterion FE990D50 composition
    70e20456bcbf7 slip: fix use-after-free in sl_sync()
    6de17275b3ccd xdp: fix zero-copy frame layout
    0a5af67e7184c net/iucv: filter frames in afiucv_hs_rcv() by ingress device
    d377bf743f29b ipmi: si: Fix NULL pointer dereference after failed registration
    7d66d54b974cf ipmi: ipmb: validate write message length
    fedea72e8f312 interconnect: Fix use after free in icc_get() and of_icc_get_by_index()
    dfdee7ceff6a5 platform/x86: hp-bioscfg: warn on element type mismatch instead of failing
    467e53f231f77 platform/x86: hp-bioscfg: pass validated element count to package parsers
    fe837a99e4e31 platform/x86: hp-bioscfg: fix ORD_LIST_ELEMENTS never being parsed
    8f5aa1506cddd platform/x86: hp-bioscfg: fix off-by-one write in hp_get_string_from_buffer()
    62f6f04abc64a platform/x86: hp-bioscfg: fix new_password_store() overwriting current_password
    21243c15e1d31 platform/x86: hp-bioscfg: fix heap OOB read on empty password write
    81db79fed1156 platform/x86: hp-bioscfg: fix heap OOB read in sk_store() and kek_store()
    1bf0a07a2ea4b platform/x86: hp-bioscfg: bound ordered-list parsing by the package count
    27a93d0fe2398 platform/x86: hp-bioscfg: advance elem past consumed array elements
    d8690d44f1b0d platform/x86: hp-bioscfg: accept reduced ACPI packages from older HP BIOS
    d1b4add68dabf platform/chrome: sensorhub: Bound the EC-reported sensor number
    f2a9289a65d35 platform/x86: ishtp_eclite: Fix ACPI device reference leak in probe error path
    0d601126c7afd platform/x86: ISST: Validate logical CPU id and clos id
    649024043d23f platform/x86: ISST: Just allow 2 bits for SST feature enable
    dde5b9c91e9fc mmc: via-sdmmc: stop card-detect handling on probe failure
    c847ea4851ecf platform/x86: ISST: Validate socket ID in clos_assoc ioctl
    beb22ebf76c04 platform/x86: ISST: Validate level in perf mask ioctls
    44ec7f1113309 platform/x86: dell-wmi-sysman: Don't hex dump attribute security buffer
    579eb867d3da6 iommu/vt-d: Force requesting ACS when tboot is enabled
    d5db80b68ee5c iommu/vt-d: Fix no_iommu to disable platform opt-in
    a6a4cee09b154 PCI/proc: Warn on writes to kernel-exclusive config space regions
    e7730acd6a01c PCI/proc: Use file_ns_capable() when checking config space read access
    d6895710703ea PCI/proc: Avoid spurious runtime PM wakeup on config space accesses
    d0631a0ab18ad PCI/MSI: Enable memory decoding before restoring MSI-X messages
    131900a246137 PCI/sysfs: Avoid spurious runtime PM wakeup on config space accesses
    838e146ae4cd8 PCI: Add ACS quirk for Pericom PI7C9X2G608 switches [12d8:2608]
    5a072fc80a753 PCI: meson: Fix GPIO state while requesting PERST#
    dcaf13f2f4688 PCI: Fix 32-bit config write in Intel PCH Root Port MPC ACS quirk
    f735b9710f0c8 s390/dasd: Propagate partial completion length across ERP recovery
    57db27ccc162a s390/dasd: Guard sysfs discipline callbacks against unallocated private data
    55f4df40178cd s390/dasd: Do not complete a failed ESE read as successful
    991be92489bc7 s390/cpum_cf: Handle CPU hotplug via prepare/dead callbacks
    23783db5642a7 power: supply: max17040: synchronize work cancellation on suspend
    f46465aefa911 power: supply: max17040: drop incorrect I2C functionality check
    2ec4d203ecb06 power: supply: ucs1002: fix use-after-free on remove
    c46c205bab0df power: supply: twl4030_charger: cancel workers via devm
    442c60c08ec23 power: supply: rt9455: quiesce delayed work before teardown
    c06028db62085 power: supply: qcom_battmgr: terminate the strings from firmware
    6f0ce09d60a0e power: supply: lp8727: fix use-after-free in lp8727_release_irq()
    3262977a05b23 power: supply: cros_usbpd: Limit port counts to EC_USB_PD_MAX_PORTS
    2746d502b12b3 power: supply: cros_usbpd-charger: bound the EC-reported port count
    976c10d883a02 power: supply: bq25890: Fix power_supply reference leak
    2cfb59dc9df8b power: supply: bq256xx: drain usb_work before freeing the charger
    6d2eb93975c07 power: supply: bq24257: fix use-after-free on remove
    092acd3c55a40 sctp: fix stream->outcnt underflow on duplicate RECONF responses
    b55c2561d3fec sctp: distinguish sequence zero from wildcard in reconf lookup
    b2d6d873b4dfb sctp: fix NULL deref on untransmitted RECONF completion
    928fd7920ba37 sctp: drop a chunk if its transport was removed
    5c0b2dbbdafc9 sctp: stop processing a packet once its association is deleted
    fca3ebb63e5c8 nvme-tcp: reject a read that transferred too few bytes
    bc4013c7cce58 nvme-tcp: fix host memory disclosure on R2T for a read command
    b96e1ff75e5c0 nvme-tcp: do not accept C2HData based on blk_rq_payload_bytes() alone
    313b05de246a1 nvme-pci: disable controller on admin queue IRQ setup failure
    66b5af23b6f95 nvme: zero the discard fallback page
    da7555248e9bb nvme: nvme-fc: Fix nvme_fc_create_hw_io_queues() queue deletion in error path
    350087f231c11 lockd: pin next file across nlm_inspect_file lock-drop
    697d946853e7e hwmon: (max6621) fix temperature clamp range
    7d69a2747441f hwmon: (max6621) fix negative temperature offset and crit readings
    213a32146337d ASoC: amd: yc: Add DMI entry for MSI Thin A15 B7UC
    9df45b83d6f68 arm64: compat: Fix decrementing LDM/STM alignment emulation
    8a2ec0eb2c5b3 ALSA: ump: Fix corrupted data bytes at MIDI 1.0 SysEx to UMP conversion
    4d5c460ef8754 openvswitch: only skb_tx_error() a packet we are about to drop
    574ae2ac2b314 openrisc: fix arbitrary kernel memory access via or1k_atomic syscall
    f9dd5cad8d091 ocfs2: fix readdir position truncation on 32-bit kernels
    1507c5586ebd3 ocfs2: cluster: fix o2hb_dependent_users leak on pin failure
    da279037473ae ocfs2: cluster: avoid lock order inversion in o2hb_region_pin() from drop_item
    c9be4de77f97f ocfs2: cluster: don't sleep while holding o2hb_live_lock in o2hb_region_pin()
    97584e93fc49a ocfs2: validate rl_used against rl_count in refcount block validator
    77686fa5bba13 ocfs2: validate lengths in dlm_mig_lockres_handler
    24989909d3413 ocfs2: bound namelen in dlm_migrate_request_handler
    a4adaa722977f ocfs2: always run deallocs on copy-on-write completion
    ce748ae1181d0 orangefs: skip leading spaces before parsing client debug masks
    9c9eacc47c618 orangefs: fix double-free of trailer_buf on readdir copy failure
    c4c338dcd38b9 regulator: qcom-refgen: correct the regulator type to CURRENT
    c998890091065 regulator: max8998_pmic_dt_parse_pdata: of_node_put on reg_np after ownership transferred to rdata
    eda08b6bd64f0 regulator: as3722_get_regulator_dt_data: fix premature of_node_put leaving dangling of_node pointer
    71dc206f2e2a6 RDMA/ucma: Lock the handler in ucma_set_ib_path()
    3265d558dfafa RDMA/cxgb4: Cancel reg_work before freeing device on remove
    a5e1fdc126ab3 qede: Fix NULL pointer dereference in TPA fragment processing
    6ca338cf2d386 remoteproc: scp: Fix device reference leak on failed lookup
    a2e0e01a7fbf0 arm64: dts: rockchip: Fix rk3399-roc-pc-plus analog audio
    bfc3e5fe778c9 arm64: dts: rockchip: fix eMMC reset polarity on PX30 Ringneck
    28cf91db44ce1 rpmsg: glink: smem: order FIFO read after availability check
    46101fb96aff2 staging: media: tegra-video: vi: fix probe failure on skipped last port
    a3783800c9475 staging: media: tegra-video: fix of_node_put() on VIP parse errors
    6deb4d7a0c3d9 wifi: ath6kl: clamp assoc request/response lengths before subtracting IE offsets
    b77b83f5529a2 udf: reject VAT indexes equal to the entry count
    06d0390c37fa6 svcrdma: Fix pcl_for_each_segment for empty chunks
    cba8543c18cf4 svcrdma: Fix offset arithmetic in read_chunk_range
    fb43997407bc1 SUNRPC: wait for in-flight client TLS handshake callback
    4abb44a29bb51 SUNRPC: Reject krb5 v2 wrap tokens with oversized ec field
    89c8e0733e8c4 sunrpc: init gssp_lock before publishing proc entry
    81fd7654a8429 SUNRPC: harden gss_unwrap_resp_priv length checks
    f2591660e0eb2 SUNRPC: harden gss_krb5_unwrap_v2 against short tokens
    ef948257d1211 SUNRPC: Guard svcauth_gss_release() dispatch on rq_auth_stat
    57ac7d899409b SUNRPC: Check svc pool percpu counter allocation
    6d74ecc2be120 SUNRPC: always drain cache_cleaner before destroying a cache_detail
    edb20e8c03aeb sunrpc: route to a populated pool in svc_pool_for_cpu()
    0ea5b0c7f212c SUNRPC: svcauth_gss: enforce krb5 token minimum length
    56b29d62017c7 SUNRPC: Zero rpc_gss_wire_cred at svcauth_gss_decode_credbody() entry
    4bf59cb0ea5b0 SUNRPC: xdr_buf_trim: clamp buf->len to avoid underflow
    e05c28bd6043d nouveau/gem: reserve the bo in the info ioctl around the vma lookup
    9df36a4846375 mptcp: fix uninitialized local_id in syncookie MP_JOIN reconstruction
    d9640239827d6 mpls: reload header after pskb_may_pull()
    0a03f9541c06f md: do overflow check for sb->bblog_shift in super_1_load()
    792515b2b77cc mailbox: qcom-ipcc: fix duplicate channel allocation across holes
    93967bfb17dab libnvdimm/labels: Prevent integer overflow in __nd_label_validate()
    3665abc3d2ae8 ipv6: use RCU iterator to dump route exceptions
    c3457a5aae5fb ip6_gre: fix hardware header length for NBMA tunnels
    defa0adeff132 ip6_tunnel: use skb_cow_head() in ip6_tnl_xmit()
    c4dc23de4cc75 ipip: fix skb leak in collect_md mode when metadata_dst allocation fails
    7cd164f0e1bab kasan: fix cache shrink race with CPU hotplug
    d90a166ac55c1 Bluetooth: hci_sync: Clear HCI_CMD_PENDING when dropping the last request
    faf331d3f2145 Bluetooth: hci_intel: fix usage_count leak when autosuspend_delay is negative
    7df825df95cf9 Bluetooth: hci_h5: fix usage_count leak when autosuspend_delay is negative
    6ebb6d1756820 Bluetooth: hci_event: clear HCI_LE_ADV only on a created connection
    d5eef07470719 Bluetooth: hci_core: use skb_get() instead of skb_clone() for req_skb
    ff76a63e9524b Bluetooth: hci_conn: re-enable advertising only for peripheral role
    82425b14f0fb2 Bluetooth: RFCOMM: serialize security confirmation handling
    d47b8f8c02a3d Bluetooth: ISO: fix use-after-free of listener socket in iso_conn_ready
    1a7196c4fffb3 Bluetooth: hci_uart: Fix false success return in hci_uart_setup()
    1c4b02a810329 Bluetooth: hci_bcm: fix usage_count leak when autosuspend_delay is negative
    1353679268b3c cxl/pmem: Format the nvdimm serial number as unsigned decimal
    aa436b021e505 cpufreq: schedutil: Fix rate limit overflow
    522fa26da24cc dm array: reject an array block whose value size is not the caller's
    01a0276706c7b dm raid1: reserve space for NUL-terminator in build_constructor_string()
    dc731d7fddfd6 dm-era: fix shadowed superblock leak on take-snap failure
    80551bf8912c4 bpf: Harden bloom filter sizing and indexing on 32-bit kernels
    ac280f6872e75 bnx2x: fix double free in bnx2x_init_firmware() error path
    1a28aae7f1fc8 Bluetooth: eir: Fix OOB read in eir_get_service_data()
    0725f93b395f7 Bluetooth: btusb: Add ASUS USB-BT600 for Realtek 8761CU
    1b5fb9c40e301 Bluetooth: btusb: Add ASUS USB-BT540 for Realtek 8761CU
    958cfdc655f7c block: set QUEUE_FLAG_DYING unconditionally in blk_mark_disk_dead()
    6eaed64a32e55 auxdisplay: charlcd: cancel backlight work on registration failure
    977554ed91b54 ata: libata-scsi: fix DSM TRIM for sector sizes larger than 2048 bytes
    3a6f8d3adbd6f ARM: 9477/1: Disable broken eBPF JIT on the Risc PC
    1712e99ddeb19 alpha: marvel: Fix lock ordering in init_io7_irqs()
    748d3e1dcecf5 alpha: marvel: Fix irq_set_status_flags to use correct IRQ number
    a12408ff9a948 alpha/PCI: Fix I/O port accessor argument order in pci_legacy_write()
    c5a31b4e7e37c ACPI: pfr_update: fix stack buffer overflow in query_capability()
    9963a65be2bef hsi: omap_ssi_core: fix missing DMA mask setup for SSI controller device
    827ded884dbd6 fpga: stratix10-soc: Fix SVC mailbox handling during reconfiguration
    c4d5953582463 forcedeth: fix off-by-one when saving/restoring non-PCI config space
    9eb7b3cbe99c9 fbdev: uvesafb: unregister connector callback on init failure
    237924f5b9afc fbdev: ssd1307fb: defer I2C transfers from damage callbacks
    74de052b4399d fbdev: pvr2fb: correct user pointer annotation and sentinel initializer
    302d19fbc7dc7 fbdev: omapfb: panel-dsi-cm: initialize lock before registering display
    35b3334800103 fat: restore original value when fat_ent_write failed
    3cd611c9f1dbc efivarfs: Rate limit statfs() handler
    a980ac04ada51 ecryptfs: show filename encryption options
    30845ed227475 ecryptfs: release message context on send failure
    414a0f04feb06 ecryptfs: reject too-small tag 70 packets
    33e050cac8414 ecryptfs: reject oversized encrypted_key_size in parse_tag_3_packet
    749fa08d8f1b3 ecryptfs: pass packet set buffer size to parser
    ec1627bcb5b51 ecryptfs: hold msg ctx list lock when cleaning daemon queue
    7abf2992c61e8 ecryptfs: fix tag 11 packet exact-fit size check
    70fa0cf82e435 eCryptfs: bound the packet-length peek to the user buffer
    61ca8cbbf68f7 fs/ntfs3: bound page_lcns[] index by the log record
    77d8efd04745c fs/ntfs3: fix info-leak on partial LZNT decompress in ni_read_frame()
    d23155634a4bc fs/ntfs3: validate dirty page table on log replay
    069729282fbec eventfs: Initialize ei->children and ei->list in init_ei()
    c1c508e892391 HID: mcp2221: validate report size in mcp2221_raw_event()
    85d963499f1fe HID: mcp2221: stop device IO before hid_hw_stop
    2409779f3096f HID: sensor: custom: Fix field sysfs group cleanup on failure
    4cb3ff31d237a HID: roccat: free buffered reports when destroying device
    4daf432c94a42 HID: picolcd: clamp eeprom debugfs read to bytes actually received
    6cb7f9fed8f40 smb: client: harden DFS cache against invalid target hints
    735abe4932355 smb: client: fix copy-paste error in WSL EA length accounting for $LXDEV
    b89d678f9eafc smb: client: fix ALIGN() overflow in symlink_data() error context loop
    3ff9462bb7a06 smb: client: clear ce->tgthint in free_tgts()
    7f62817fe049b cifs: fix loff_t underflow in cifs_remap_file_range() when len == 0
    01b0ec8c397be audit: avoid dropping live tree ref on fsnotify rule autoremove
    61f085cb8976c ceph: bound xattr value length in __build_xattrs()
    eb3e1a1cb1634 ceph: bound num_export_targets array for mds info v2/v3
    a294064e0e0f8 ceph: bound copied dentry name length in NFS export get_name
    c4addccd05bac ceph: reject export_targets ranks >= CEPH_MAX_MDS in mdsmap decode
    19f16f04c2b01 ceph: fix UAF in __kick_flushing_caps() on cf entry freed during unlock
    6e5c6ce252b1e libceph: reject buckets with mismatched CRUSH ids
    94ae5145c5206 libceph: validate OSD extent maps before cursor advance
    1ce74d1b7770e NFSD: Prevent lock owner use-after-free during client teardown
    caddbeffab1ea nfsd: revoke copy-notify stateids before dropping their reference
    70290db6c9802 nfsd: reject reclaim LOCK after RECLAIM_COMPLETE
    1db456ffc22e0 nfsd: reject out-of-range useconds in NFSv2 SETATTR/CREATE
    9caad13b7cfe9 nfsd: initialize copy-notify stateid before publishing it
    3be1d8611dae4 nfsd: gate nfs3 setacl by argp->mask
    8e4422b05f410 nfsd: gate nfs2 setacl by argp->mask
    88bce7e326c36 nfsd: fix XDR padding calculation in ff_encode_getdeviceinfo
    bee826c00ac90 nfsd: fix XDR length calculation in nfsd4_ff_encode_layoutget
    59416992d1f58 nfsd: fix version mismatch loops in nfsd_acl_init_request()
    bfeac42d9074e nfsd: fix cpntf publish race in nfs4_init_cp_state
    75268f6cfe26b nfsd: check client ownership when cancelling a copy-notify stateid
    977e6f006a7a3 nfsd: block non-SAVEFH ops after FOREIGN PUTFH to prevent NULL deref
    9e8924bef5b50 nfsd: add filehandle match check to nfsd4_delegreturn()
    d823bf9285cdf nfsd: add fh_want_write() for early-verified SETATTR in nfsd_proc_setattr()
    3ef5e7a01a4d7 nfsd: validate symlink target length in NFSv4 CREATE
    322422d66d1a0 nfsd: sample writeback error cursor before async COPY loop
    f8914ba102d7e nfsd: return NFS4ERR_NOTSUPP for unsupported netloc4 types
    6b13d26cc21b6 nfsd: Reset write verifier when async COPY writeback fails
    085cfde7c2186 nfsd: release path refs on follow_down() error
    a080bb69d30f1 NFSv4.1: fix layout segment leak on the pnfs_layout_process() forget path
    2ef1313239995 NFSD: remove flawed WARN_ON_ONCE from nfsd_mode_check
    60680ae7243b2 NFSD: restart ssc_expire_umount walk after dropping nfsd_ssc_lock
    bfd1004ab1237 NFSD: Fix off-by-one in DRC bucket pruning limit
    07615c1eb1d00 NFSD: Encode only the status in NFS-ACL v2 GETACL error replies
    37a9d25a563f5 ubifs: fix out-of-bounds read in signature length check
    da7a80ddc610a of: fix out-of-bounds read in of_alias_scan() stem parser
    b313edfbc0c2a nilfs2: fix slab-out-of-bounds in nilfs_direct_propagate after truncation
    e21cccc29b840 media: vicodec: fix out-of-bounds write in FWHT encoder
    1b4fdefd788db media: cec: stm32: prevent out-of-bounds write on RX overflow
    60c74f42f5abd lib/ucs2_string.c: fix out-of-bounds read in ucs2_strnlen()
    c5c60260a07e6 HID: sensor-hub: Fix out-of-bounds write in sensor_hub_get_feature
    8f3365ed2a5db fpga: altera-cvp: Avoid out-of-bounds read in trailing byte write
    b0a6bfac0c3c3 usb: gadget: f_fs: Prevent deadlock during ep0 read loop
    bec7708eb3b52 usb: gadget: uvc: fix dangling pointers in uvc_function_bind() and uvc_function_unbind()
    eef3e62f90d86 usb: gadget: f_tcm: fix deadlock in usbg_make_tpg()
    79dbedf40ad93 usb: gadget: midi2: remove default configfs groups on teardown
    95cf1b50ba6b7 usb: gadget: snps_udc_plat: clean up PHY on probe deferral
    891a8d11f4d5e usb: gadget: u_audio: Fix use-after-free on sound card disconnect
    d82cfb853c5d4 USB: phy: fsl-usb: fix missing static keywords
    f09b3f48ff650 usb: dwc2: gadget: Exit partial power down state when changing USB pull-up
    c881f5b175fdb staging: greybus: hid: fix SET_REPORT return value
    2ac009a65d238 Revert "media: v4l2-dev: fix error handling in __video_register_device()"
    bd8881c24a952 rapidio: mport_cdev: fix use-after-free in dma_req_free()
    261c958b6acb1 powerpc/powermac: fix OF node refcount
    f4ae79b5f0013 device property: fix infinite loop in fwnode_for_each_child_node()
    3a8534664426c tracing: Fix use-after-free with same-name named triggers
    ceb1707aef582 tracing: Fix crash passing ERR_PTR to kthread_stop()
    33ce55b368b64 tracing/user_events: Clear copied tracing state before fork duplication
    3eaf78e6571d2 hwtracing: hisi_ptt: Propagate DMA reset timeout in trace_start()
    f3ed36a608d8b x86/insn-eval: Move assign_register() out of KVM as insn_assign_reg()
    220011fe95fc7 x86/tdx: Fix off-by-one in port I/O handling
    f668affa147a5 tools/compiler: match glibc 2.42 definition of __attribute_const__
    8bf21ad365730 mm: memcg: stop reclaim when a limit update is superseded
    029c9408049f7 mm/vmscan: report RCU-tasks quiescent states in shrink_lruvec()
    4757542649af5 mm/migrate: report RCU-tasks quiescent states in migrate_pages_batch()
    f93f15541f224 include/linux/list.h: mark list_add and __list_add as __always_inline
    bdfda99c57638 timers/itimer: Zero-init old itimerval before copy to userspace
    da268a44d773a powerpc/pseries/iommu: switch to Default DMA window during kdump
    ebba4d0aeba0e clocksource/drivers/timer-sun4i: Advertise a real minimum delta
    7b5771d0bf176 alpha: don't leak hardware-fabricated FP exception bits to user space
    e5038d7f36037 alpha: fix ieee_swcr_to_fpcr setting FPCR_DNOD unconditionally
    184870af0e73f perf/x86/intel/uncore: Fix die ID init and look up bugs
    d258cdce50ff3 ALSA: aloop: Fix peer runtime UAF during format-change stop
    0e6245b2424d1 ALSA: aloop: Fix racy access at PCM trigger
    e150f273cd8ed ipv4: start using dst_dev_rcu()
    40acb0537963f net: dst: introduce dst->dev_rcu
    49b02a9d11c73 ipv4: adopt dst_dev, skb_dst_dev and skb_dst_dev_net[_rcu]
    19ccd78a4e7c0 net: dst: add four helpers to annotate data-races around dst->dev
    73b7a11814838 Revert "arm64: mm: Don't remap pgtables for allocate vs populate"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index e8d1f9da078..8a31bbfd09a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f92c1779022032aac8134ccb9e75365b19f6c596"
-SRCREV_meta ?= "be02dc16fd11e7575782a0e13db080d122a8989a"
+SRCREV_machine ?= "9b87590f4fb1e0d54ae9153f9e4fe84cec61f13e"
+SRCREV_meta ?= "0d175695cbfd92999ee910a0535f01cbcbe7a0f8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.156"
+LINUX_VERSION ?= "6.6.157"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 03889d329ec..3904ba1d1c6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.156"
+LINUX_VERSION ?= "6.6.157"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d9da23dffd2dea6dcfa986e0aad77898a7b373da"
-SRCREV_meta ?= "be02dc16fd11e7575782a0e13db080d122a8989a"
+SRCREV_machine ?= "a56c1dbe33dcd7b71df3b2703ceb95692edd9579"
+SRCREV_meta ?= "0d175695cbfd92999ee910a0535f01cbcbe7a0f8"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 2632a4ef2fc..da3c5dd6ea6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f05eb652ce405932e2f47a78f721d1c2c5859e80"
-SRCREV_machine:qemuarm64 ?= "2f7ef6e4d70eadf8f8b110cd81cfcafb2bb038fb"
-SRCREV_machine:qemuloongarch64 ?= "64e13e9d84c0eb6c16b39081300b49b9862b64f5"
-SRCREV_machine:qemumips ?= "1434d63083252688215ad6f5f6af122ead5865ee"
-SRCREV_machine:qemuppc ?= "fc69e9d8f99c5c151415f6ba9f1e0428bb7e8e84"
-SRCREV_machine:qemuriscv64 ?= "64e13e9d84c0eb6c16b39081300b49b9862b64f5"
-SRCREV_machine:qemuriscv32 ?= "64e13e9d84c0eb6c16b39081300b49b9862b64f5"
-SRCREV_machine:qemux86 ?= "64e13e9d84c0eb6c16b39081300b49b9862b64f5"
-SRCREV_machine:qemux86-64 ?= "64e13e9d84c0eb6c16b39081300b49b9862b64f5"
-SRCREV_machine:qemumips64 ?= "7969f6574cf5b126fa6eb28f33d0f2bcd8e7da5e"
-SRCREV_machine ?= "64e13e9d84c0eb6c16b39081300b49b9862b64f5"
-SRCREV_meta ?= "be02dc16fd11e7575782a0e13db080d122a8989a"
+SRCREV_machine:qemuarm ?= "f762f9a437240aebfb663b9f08166b6978411ad3"
+SRCREV_machine:qemuarm64 ?= "efde6579b1968f396f4718ad939aeb6859f17012"
+SRCREV_machine:qemuloongarch64 ?= "a353a9563cf1625b98d7f33ec845d25cbdef12b6"
+SRCREV_machine:qemumips ?= "d7bc8d3db82714ebe46bde3e69f9dcbef7ae6e48"
+SRCREV_machine:qemuppc ?= "b8bafdf6f040163a1fe0eb91c7b419452e3590b4"
+SRCREV_machine:qemuriscv64 ?= "a353a9563cf1625b98d7f33ec845d25cbdef12b6"
+SRCREV_machine:qemuriscv32 ?= "a353a9563cf1625b98d7f33ec845d25cbdef12b6"
+SRCREV_machine:qemux86 ?= "a353a9563cf1625b98d7f33ec845d25cbdef12b6"
+SRCREV_machine:qemux86-64 ?= "a353a9563cf1625b98d7f33ec845d25cbdef12b6"
+SRCREV_machine:qemumips64 ?= "fa48e020815730c4ff228c0e8d42836d68ac4b4b"
+SRCREV_machine ?= "a353a9563cf1625b98d7f33ec845d25cbdef12b6"
+SRCREV_meta ?= "0d175695cbfd92999ee910a0535f01cbcbe7a0f8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "8b73de7da85fde281a385e0b26eda9bffd3ca477"
+SRCREV_machine:class-devupstream ?= "79643295eba17affbd16ca97f3ef04c90266b28c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.156"
+LINUX_VERSION ?= "6.6.157"
 
 PV = "${LINUX_VERSION}+git"
 
