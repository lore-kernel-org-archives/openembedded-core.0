Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0180C6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 21:48:18 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web08.1052.1663883290688459195
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 14:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=a3ajg1eW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id y11so11116837pjv.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 14:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=vKV55bUP6G5XQ6HG1rOSxjntsogIp1WWULGSJTeRyYs=;
        b=a3ajg1eWumZGkUz0ES2dq/cm4aAFDlUf+EgG9Pjg8TO8jWKOD/ajp1BQpWH7S4V+m3
         M2CAeM8hSQtOk2mUZ5cEA27tk/4NRIBQzf6jvtO21nCC1iQWZT5jduhJ6RUmxKtMwNQK
         fonq/hi0pv1q4W/YNZgR8Hj9zPsaHFiNWeTRE4HYZujwKRwCDI0jzxCoGap8b0cQY5Rg
         dOnLuO3ZXZ7SI9g9aVZSnVsRxq2hD90FR9CuYWuajR+SDj8TleJvRiNvBik0SY1n8KP+
         DqEHw6AEV+oSS7l4QnMeo+2e7yUYwj5+SuMF/63aQ/2Kcg4TKwnqEEusogQgeOMl7wxf
         2Xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vKV55bUP6G5XQ6HG1rOSxjntsogIp1WWULGSJTeRyYs=;
        b=LsgM40gVVck0SMMQBJ9/+YujHBQKaoMsrQp+LErZJB8ixxQu+nE46g8cX+nKrInY7T
         oIjM8s/fu965eiP3Q7ef7lssNlIVc7sb8YH4+21atis2konl290sBBLa66tBetm7hl1j
         PHNKB8ZeCuzjgs5y9cv0uXrx39t+jXERP75RNK36wVhD9QWeZd8bQlzHaKp4yPBwfUwf
         Cd60y1UZVzFsHIG3kk0vnHk2YcP/7Hk8HCPZpiBEwW6xOZUsjE/yMQ4sFfQ79ZXp1wRS
         qHI7kHr2fUf+2RXmN1zMLYSeYQjvhzRL57TrapuuIJfkaSxv6Yj5J7awjKa8b/Oy46ww
         HTIA==
X-Gm-Message-State: ACrzQf2mUhoHd46offK3DSBOoqywe1GxKg7ztXCE6OlWncxCf5t9Db5E
	fkuVh3MqTy/e7BA1O4qqHInNB8ThS/7DCiBQ
X-Google-Smtp-Source: 
 AMsMyM41vr1b5hWM7v9pB9aui5BRriX26B92d32hbfcJV6pvOCSK7LpItP+wZrMmVDNy1F0ui5XP2g==
X-Received: by 2002:a17:902:7ed6:b0:178:378a:ebbf with SMTP id
 p22-20020a1709027ed600b00178378aebbfmr5386985plb.117.1663883289152;
        Thu, 22 Sep 2022 14:48:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u4-20020a170902714400b0016ee4b0bd60sm4574813plm.166.2022.09.22.14.48.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 14:48:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/5] linux-yocto/5.4: update to v5.4.212
Date: Thu, 22 Sep 2022 11:47:49 -1000
Message-Id: 
 <ddfc3eebd96197fec56ac781fcf9d7da0c9eca27.1663883154.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663883154.git.steve@sakoman.com>
References: <cover.1663883154.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 21:48:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170993

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    d6deb370b5a5 Linux 5.4.212
    0052348329c9 net: neigh: don't call kfree_skb() under spin_lock_irqsave()
    25a80e728412 net/af_packet: check len when min_header_len equals to 0
    fc78b2fc21f1 io_uring: disable polling pollfree files
    b474ff1b2095 kprobes: don't call disarm_kprobe() for disabled kprobes
    6fbc49b7f007 lib/vdso: Mark do_hres() and do_coarse() as __always_inline
    2161d3c12c74 lib/vdso: Let do_coarse() return 0 to simplify the callsite
    06ebb40b8720 btrfs: tree-checker: check for overlapping extent items
    63c790584031 netfilter: conntrack: NF_CONNTRACK_PROCFS should no longer default to y
    5c5cd52ab09d drm/amd/display: Fix pixel clock programming
    c570198c3d9e s390/hypfs: avoid error message under KVM
    51be9dd391fd neigh: fix possible DoS due to net iface start/stop loop
    814b756d4ec3 drm/amd/display: clear optc underflow before turn off odm clock
    a06e4eb65169 drm/amd/display: Avoid MPC infinite loop
    2608885a4f7e btrfs: unify lookup return value when dir entry is missing
    1fe3375cf2be btrfs: do not pin logs too early during renames
    e9b4baabf852 btrfs: introduce btrfs_lookup_match_dir
    2fe3eee48899 mm/rmap: Fix anon_vma->degree ambiguity leading to double-reuse
    8b68e53d5669 bpf: Don't redirect packets with invalid pkt_len
    934e49f7d696 ftrace: Fix NULL pointer dereference in is_ftrace_trampoline when ftrace is dead
    7d9591b32a90 fbdev: fb_pm2fb: Avoid potential divide by zero error
    53c7c4d5d40b HID: hidraw: fix memory leak in hidraw_release()
    466b67c0543b media: pvrusb2: fix memory leak in pvr_probe
    63d8c1933ed2 udmabuf: Set the DMA mask for the udmabuf device (v2)
    fa2b822d86be HID: steam: Prevent NULL pointer dereference in steam_{recv,send}_report
    6551fbe25853 Bluetooth: L2CAP: Fix build errors in some archs
    adc7640e1931 kbuild: Fix include path in scripts/Makefile.modpost
    80a7fe2b7012 x86/bugs: Add "unknown" reporting for MMIO Stale Data
    09602177d80c s390/mm: do not trigger write fault when vma does not allow VM_WRITE
    c9c5501e8151 mm: Force TLB flush for PFNMAP mappings before unlink_file_vma()
    b4c928ace9a1 scsi: storvsc: Remove WQ_MEM_RECLAIM from storvsc_error_wq
    2045b9d30619 perf/x86/intel/uncore: Fix broken read_counter() for SNB IMC PMU
    8e7fb19f1a74 md: call __md_stop_writes in md_stop
    f35c4fec07a2 mm/hugetlb: fix hugetlb not supporting softdirty tracking
    f09c1b80df55 ACPI: processor: Remove freq Qos request for all CPUs
    cacd522e6652 s390: fix double free of GS and RI CBs on fork() failure
    c3862f559265 asm-generic: sections: refactor memory_intersects
    13b2856037a6 loop: Check for overflow while configuring loop
    2668aeac01ac x86/unwind/orc: Unwind ftrace trampolines with correct ORC entry
    dd3365d3b496 btrfs: check if root is readonly while setting security xattr
    5b44dcf8b79b btrfs: add info when mount fails due to stale replace target
    40554fa41a78 btrfs: replace: drop assert for suspended replace
    201bb5d745ae btrfs: fix silent failure when deleting root reference
    571a13b35005 ixgbe: stop resetting SYSTIME in ixgbe_ptp_start_cyclecounter
    aa0a3f72c6da net: Fix a data-race around sysctl_somaxconn.
    923fa41adebd net: Fix a data-race around netdev_budget_usecs.
    adeb24afd2fd net: Fix a data-race around netdev_budget.
    575c57e9e00c net: Fix a data-race around sysctl_net_busy_read.
    6e8f9df62dbe net: Fix a data-race around sysctl_net_busy_poll.
    5da0632c07d4 net: Fix a data-race around sysctl_tstamp_allow_data.
    4482215f93d2 ratelimit: Fix data-races in ___ratelimit().
    a90afeab21ae net: Fix data-races around netdev_tstamp_prequeue.
    c1d0ef0e6f11 net: Fix data-races around weight_p and dev_weight_[rt]x_bias.
    dbd0f1991adf netfilter: nft_tunnel: restrict it to netdev family
    fba05d250256 netfilter: nft_osf: restrict osf to ipv4, ipv6 and inet families
    a2ce367ae743 netfilter: nft_payload: do not truncate csum_offset and csum_type
    870015352911 netfilter: nft_payload: report ERANGE for too long offset and length
    bc7ba4cd0bc3 bnxt_en: fix NQ resource accounting during vf creation on 57500 chips
    160c4eb47db0 netfilter: ebtables: reject blobs that don't provide all entry points
    8b9155eae85d net: ipvtap - add __init/__exit annotations to module init/exit funcs
    1498077d562f bonding: 802.3ad: fix no transmission of LACPDUs
    ac3541b11e5b net: moxa: get rid of asymmetry in DMA mapping/unmapping
    eb8236dff703 net/mlx5e: Properly disable vlan strip on non-UL reps
    6e4b20d548fc rose: check NULL rose_loopback_neigh->loopback
    4c14faf16632 SUNRPC: RPC level errors should set task->tk_rpc_status
    8ee27a4f0f1a af_key: Do not call xfrm_probe_algs in parallel
    63da7a2bbf3f xfrm: fix refcount leak in __xfrm_policy_check()
    a9f94dc4ddee kernel/sched: Remove dl_boosted flag comment
    d2b65976bf1a sched/deadline: Fix priority inheritance with multiple scheduling classes
    c498c8cbc271 sched/deadline: Fix stale throttling on de-/boosted tasks
    184c8ab53424 sched/deadline: Unthrottle PI boosted threads while enqueuing
    71b7edfc76d2 pinctrl: amd: Don't save/restore interrupt status and wake status bits
    8e52d0c57d5f Revert "selftests/bpf: Fix test_align verifier log patterns"
    2b13ddc9e0e3 Revert "selftests/bpf: Fix "dubious pointer arithmetic" test"
    a89c4b5868cb usb: cdns3: Fix issue for clear halt endpoint
    87b41b041cd4 kernel/sys_ni: add compat entry for fadvise64_64
    945dc19778f6 parisc: Fix exception handler for fldw and fstw instructions
    bb415d2687ac audit: fix potential double free on error path from fsnotify_add_inode_mark
    684cc17be897 Linux 5.4.211
    473f43725bb7 btrfs: raid56: don't trust any cached sector in __raid56_parity_recover()
    6fd4cea04400 btrfs: only write the sectors in the vertical stripe which has data stripes
    04e41b6bacf4 can: j1939: j1939_session_destroy(): fix memory leak of skbs
    18e0ab31b028 can: j1939: j1939_sk_queue_activate_next_locked(): replace WARN_ON_ONCE with netdev_warn_once()
    5c9637279f65 tracing/probes: Have kprobes and uprobes use $COMM too
    5d8244d42d34 MIPS: tlbex: Explicitly compare _PAGE_NO_EXEC against 0
    2b7f559152a3 video: fbdev: i740fb: Check the argument of i740_calc_vclk()
    5e14b04c8459 powerpc/64: Init jump labels before parse_early_param()
    720f6112c393 smb3: check xattr value length earlier
    29e734ec33ae f2fs: fix to avoid use f2fs_bug_on() in f2fs_new_node_page()
    dd9d894b4163 ALSA: timer: Use deferred fasync helper
    76f87b11a4b2 ALSA: core: Add async signal helpers
    f4159834d17f powerpc/32: Don't always pass -mcpu=powerpc to the compiler
    d78d0ee79bb8 watchdog: export lockup_detector_reconfigure
    814d83c5e127 RISC-V: Add fast call path of crash_kexec()
    812cb21259ad riscv: mmap with PROT_WRITE but no PROT_READ is invalid
    1b49707df679 mips: cavium-octeon: Fix missing of_node_put() in octeon2_usb_clocks_start
    3e6994735c1c vfio: Clear the caps->buf to NULL after free
    ca3fc1c38e42 tty: serial: Fix refcount leak bug in ucc_uart.c
    3c0efcd608f1 lib/list_debug.c: Detect uninitialized lists
    a6805b3dcf5c ext4: avoid resizing to a partial cluster size
    5bebfd607726 ext4: avoid remove directory when directory is corrupted
    f5d46f1b47f6 drivers:md:fix a potential use-after-free bug
    7a2fe1594689 nvmet-tcp: fix lockdep complaint on nvmet_tcp_wq flush during queue teardown
    0bf3dcfb0396 dmaengine: sprd: Cleanup in .remove() after pm_runtime_get_sync() failed
    d13b990d4fbe selftests/kprobe: Do not test for GRP/ without event failures
    082da6a9c30f um: add "noreboot" command line option for PANIC_TIMEOUT=-1 setups
    c3ce788be376 PCI/ACPI: Guard ARM64-specific mcfg_quirks
    695af60af755 cxl: Fix a memory leak in an error handling path
    ca06b4cde54f gadgetfs: ep_io - wait until IRQ finishes
    927907f1cbb3 scsi: lpfc: Prevent buffer overflow crashes in debugfs with malformed user input
    d401611a93b3 clk: qcom: ipq8074: dont disable gcc_sleep_clk_src
    f78ac62e6b9d vboxguest: Do not use devm for irq
    cfa8f707a58d usb: renesas: Fix refcount leak bug
    0334d23c56ec usb: host: ohci-ppc-of: Fix refcount leak bug
    b743d6cef4f1 drm/meson: Fix overflow implicit truncation warnings
    29b30e041376 irqchip/tegra: Fix overflow implicit truncation warnings
    e2d531806569 usb: gadget: uvc: call uvc uvcg_warn on completed status instead of uvcg_info
    e65d9b7147d7 usb: cdns3 fix use-after-free at workaround 2
    e7170b5a2826 PCI: Add ACS quirk for Broadcom BCM5750x NICs
    d58ef2567813 drm/meson: Fix refcount bugs in meson_vpu_has_available_connectors()
    d0c4307aeae5 locking/atomic: Make test_and_*_bit() ordered on failure
    90fb514a1656 gcc-plugins: Undefine LATENT_ENTROPY_PLUGIN when plugin disabled for a file
    55197ba6d64d igb: Add lock to avoid data race
    44b406aab057 fec: Fix timer capture timing in `fec_ptp_enable_pps()`
    f861285de84b i40e: Fix to stop tx_timeout recovery if GLOBR fails
    781212b34447 ice: Ignore EEXIST when setting promisc mode
    545ec873f16e net: dsa: microchip: ksz9477: fix fdb_dump last invalid entry
    b360ce159cb1 net: moxa: pass pdev instead of ndev to DMA functions
    cb1753bc689c net: dsa: mv88e6060: prevent crash on an unused port
    ccb0a42d3f40 powerpc/pci: Fix get_phb_number() locking
    b5dd26e07397 netfilter: nf_tables: really skip inactive sets when allocating name
    f415fda65931 clk: rockchip: add sclk_mac_lbtest to rk3188_critical_clocks
    ff289f2be589 iavf: Fix adminq error handling
    2b4daaed4f57 nios2: add force_successful_syscall_return()
    d6d9dd2cc325 nios2: restarts apply only to the first sigframe we build...
    01e783b45e3b nios2: fix syscall restart checks
    9e9151768bde nios2: traced syscall does need to check the syscall number
    73c088373234 nios2: don't leave NULLs in sys_call_table[]
    86a89da5cdbd nios2: page fault et.al. are *not* restartable syscalls...
    965333345fe9 tee: add overflow check in register_shm_helper()
    cfa215a76a40 dpaa2-eth: trace the allocated address instead of page struct
    9a6cbaa50f26 atm: idt77252: fix use-after-free bugs caused by tst_timer
    2f14656fe1a8 xen/xenbus: fix return type in xenbus_file_read()
    c61d3b92f56a nfp: ethtool: fix the display error of `ethtool -m DEVNAME`
    a1d13886fd2e NTB: ntb_tool: uninitialized heap data in tool_fn_write()
    215cbd3c0d40 tools build: Switch to new openssl API for test-libcrypto
    a91204264ebd tools/vm/slabinfo: use alphabetic order when two values are equal
    12f777a957be dt-bindings: arm: qcom: fix MSM8916 MTP compatibles
    0ecc55feceb1 vsock: Set socket state back to SS_UNCONNECTED in vsock_connect_timeout()
    f82f1e2042b3 vsock: Fix memory leak in vsock_connect()
    f4f2acf01298 plip: avoid rcu debug splat
    85b5747321ed geneve: do not use RT_TOS for IPv6 flowlabel
    760a01c36b83 ACPI: property: Return type of acpi_add_nondev_subnodes() should be bool
    49c1ae5fc8dd pinctrl: sunxi: Add I/O bias setting for H6 R-PIO
    b0de3436ca57 pinctrl: qcom: msm8916: Allow CAMSS GP clocks to be muxed
    c26012a1e61c pinctrl: nomadik: Fix refcount leak in nmk_pinctrl_dt_subnode_to_map
    ac6d4482f29a net: bgmac: Fix a BUG triggered by wrong bytes_compl
    1ad4ba9341f1 devlink: Fix use-after-free after a failed reload
    c1bdc6de5178 SUNRPC: Reinitialise the backchannel request buffers before reuse
    b0e283987358 sunrpc: fix expiry of auth creds
    0a901c2f7fa7 can: mcp251x: Fix race condition on receive interrupt
    f7ee3b772d9d NFSv4/pnfs: Fix a use-after-free bug in open
    14b5a92e3398 NFSv4.1: RECLAIM_COMPLETE must handle EACCES
    89dd9bec6630 NFSv4: Fix races in the legacy idmapper upcall
    e7eba28ba774 NFSv4.1: Handle NFS4ERR_DELAY replies to OP_SEQUENCE correctly
    68a84001f7a2 NFSv4.1: Don't decrease the value of seq_nr_highest_sent
    2c8477600cd6 Documentation: ACPI: EINJ: Fix obsolete example
    7db182a2ebee apparmor: Fix memleak in aa_simple_write_to_buffer()
    ef6fb6f0d0d8 apparmor: fix reference count leak in aa_pivotroot()
    7f6092dc8f7a apparmor: fix overlapping attachment computation
    98ab8dfa048b apparmor: fix aa_label_asxprint return check
    1b4c44823a13 apparmor: Fix failed mount permission check error message
    825b0f6bb035 apparmor: fix absroot causing audited secids to begin with =
    dd78c35a27d4 apparmor: fix quiet_denied for file rules
    45be56968d6e can: ems_usb: fix clang's -Wunaligned-access warning
    f67c43e4b131 tracing: Have filter accept "common_cpu" to be consistent
    90b0526dd82a btrfs: fix lost error handling when looking up extended ref on log replay
    d33e770f0a56 mmc: pxamci: Fix an error handling path in pxamci_probe()
    6db5285844c4 mmc: pxamci: Fix another error handling path in pxamci_probe()
    b1b2b8adb0eb ata: libata-eh: Add missing command name
    70e0c8a454e2 rds: add missing barrier to release_refill
    d040e85ae959 ALSA: info: Fix llseek return value when using callback
    992480132ed3 net_sched: cls_route: disallow handle of 0
    7d9d0ba99c47 net/9p: Initialize the iounit field during fid creation
    13e17a18a46b Bluetooth: L2CAP: Fix l2cap_global_chan_by_psm regression
    4d5e45fdf048 Revert "net: usb: ax88179_178a needs FLAG_SEND_ZLP"
    f135c65085ee scsi: sg: Allow waiting for commands to complete on removed device
    cf218ff991ce tcp: fix over estimation in sk_forced_mem_schedule()
    8cdba919acef KVM: x86: Avoid theoretical NULL pointer dereference in kvm_irq_delivery_to_apic_fast()
    8fb5e7760444 KVM: x86: Check lapic_in_kernel() before attempting to set a SynIC irq
    4c08dd3fbdc5 KVM: Add infrastructure and macro to mark VM as bugged
    8659026858e0 btrfs: reject log replay if there is unsupported RO compat flag
    1fcd691cc2e7 net_sched: cls_route: remove from list when handle is 0
    b12304984654 iommu/vt-d: avoid invalid memory access via node_online(NUMA_NO_NODE)
    18048cba444a firmware: arm_scpi: Ensure scpi_info is not assigned if the probe fails
    7c77d1f9ba11 timekeeping: contribute wall clock to rng on time change
    5e0fcc5ad3e0 ACPI: CPPC: Do not prevent CPPC from working in the future
    2c7e93e33832 dm writecache: set a default MAX_WRITEBACK_JOBS
    05cef0999b32 dm thin: fix use-after-free crash in dm_sm_register_threshold_callback
    cb583ca6125a dm raid: fix address sanitizer warning in raid_status
    71f601c779b3 dm raid: fix address sanitizer warning in raid_resume
    2f2fa48c9f98 intel_th: pci: Add Meteor Lake-P support
    ab1f9cb5001c intel_th: pci: Add Raptor Lake-S PCH support
    0d8fd1fa178f intel_th: pci: Add Raptor Lake-S CPU support
    8887ef07ff55 ext4: correct the misjudgment in ext4_iget_extra_inode
    be9614e15eec ext4: correct max_inline_xattr_value_size computing
    b9a2dfd1a0c8 ext4: fix extent status tree race in writeback error recovery path
    b10b2122d709 ext4: update s_overhead_clusters in the superblock during an on-line resize
    9d1468732118 ext4: fix use-after-free in ext4_xattr_set_entry
    41ff115b14b6 ext4: make sure ext4_append() always allocates new block
    748d17d47687 ext4: add EXT4_INODE_HAS_XATTR_SPACE macro in xattr.h
    025604c7023b btrfs: reset block group chunk force if we have to wait
    cf8927ce6619 tpm: eventlog: Fix section mismatch for DEBUG_SECTION_MISMATCH
    61a1793b058a kexec, KEYS, s390: Make use of built-in and secondary keyring for signature verification
    37690cb8662c spmi: trace: fix stack-out-of-bound access in SPMI tracing functions
    91d11a3376e0 x86/olpc: fix 'logical not is only applied to the left hand side'
    42afeecce25e scsi: qla2xxx: Fix erroneous mailbox timeout after PCI error injection
    d2e82c78e352 scsi: qla2xxx: Turn off multi-queue for 8G adapters
    83cb0fb8482b scsi: qla2xxx: Fix discovery issues in FC-AL topology
    bc98764d80ee scsi: zfcp: Fix missing auto port scan and thus missing target ports
    eacb50f17336 video: fbdev: s3fb: Check the size of screen before memset_io()
    53198b81930e video: fbdev: arkfb: Check the size of screen before memset_io()
    d71528ccdc7a video: fbdev: vt8623fb: Check the size of screen before memset_io()
    09777c16a0f4 tools/thermal: Fix possible path truncations
    a249e1b89ca2 video: fbdev: arkfb: Fix a divide-by-zero bug in ark_set_pixclock()
    46513b4a8038 x86/numa: Use cpumask_available instead of hardcoded NULL check
    26d2d13d9fc3 scripts/faddr2line: Fix vmlinux detection on arm64
    563ffb782da7 genelf: Use HAVE_LIBCRYPTO_SUPPORT, not the never defined HAVE_LIBCRYPTO
    9813d27d596b powerpc/pci: Fix PHB numbering when using opal-phbid
    6a119c1a584a kprobes: Forbid probing on trampoline and BPF code areas
    cc53477d8926 perf symbol: Fail to read phdr workaround
    f388643657cd powerpc/cell/axon_msi: Fix refcount leak in setup_msi_msg_address
    d99733ad47a6 powerpc/xive: Fix refcount leak in xive_get_max_prio
    14329d29a048 powerpc/spufs: Fix refcount leak in spufs_init_isolated_loader
    3ec50b8a0128 powerpc/pci: Prefer PCI domain assignment via DT 'linux,pci-domain' and alias
    44a43b65d7e1 powerpc/32: Do not allow selection of e5500 or e6500 CPUs on PPC32
    ddaa8cc5a6bb video: fbdev: sis: fix typos in SiS_GetModeID()
    49a4c1a87ef8 video: fbdev: amba-clcd: Fix refcount leak bugs
    a9286ff4c19f watchdog: armada_37xx_wdt: check the return value of devm_ioremap() in armada_37xx_wdt_probe()
    ba406e310041 ASoC: audio-graph-card: Add of_node_put() in fail path
    bb1cc434df08 fuse: Remove the control interface for virtio-fs
    083984627411 ASoC: qcom: q6dsp: Fix an off-by-one in q6adm_alloc_copp()
    3edcd1348ba7 s390/zcore: fix race when reading from hardware system area
    50be644f7ddd iommu/arm-smmu: qcom_iommu: Add of_node_put() when breaking out of loop
    b948ff8a9e9a mfd: max77620: Fix refcount leak in max77620_initialise_fps
    8d01edaf9eea mfd: t7l66xb: Drop platform disable callback
    b45bcdf627a9 kfifo: fix kfifo_to_user() return type
    8ee5d40ae29e rpmsg: qcom_smd: Fix refcount leak in qcom_smd_parse_edge
    9a87a532848a iommu/exynos: Handle failed IOMMU device registration properly
    44913ccfa1d5 tty: n_gsm: fix missing corner cases in gsmld_poll()
    ae9bfcbfd76a tty: n_gsm: fix DM command
    b625b745497f tty: n_gsm: fix wrong T1 retry count handling
    373343d8a796 vfio/ccw: Do not change FSM state in subchannel event
    51642e132859 remoteproc: qcom: wcnss: Fix handling of IRQs
    fbf979564682 tty: n_gsm: fix race condition in gsmld_write()
    597bec4a4cc0 tty: n_gsm: fix packet re-transmission without open control channel
    ba10f6c2f079 tty: n_gsm: fix non flow control frames during mux flow off
    8b355d6b1fcf profiling: fix shift too large makes kernel panic
    8791703eddf4 ASoC: codecs: wcd9335: move gains from SX_TLV to S8_TLV
    ba4d971fe11a ASoC: codecs: msm8916-wcd-digital: move gains from SX_TLV to S8_TLV
    34734e4c526a serial: 8250_dw: Store LSR into lsr_saved_flags in dw8250_tx_wait_empty()
    79f566907d27 ASoC: mediatek: mt8173-rt5650: Fix refcount leak in mt8173_rt5650_dev_probe
    4f97b5bb81be ASoC: codecs: da7210: add check for i2c_add_driver
    b488ceb23369 ASoC: mt6797-mt6351: Fix refcount leak in mt6797_mt6351_dev_probe
    d6d41f04640d ASoC: mediatek: mt8173: Fix refcount leak in mt8173_rt5650_rt5676_dev_probe
    d3f15a4be209 opp: Fix error check in dev_pm_opp_attach_genpd()
    fa5b65d39332 jbd2: fix assertion 'jh->b_frozen_data == NULL' failure when journal aborted
    fc1ec67ba503 ext4: recover csum seed of tmp_inode after migrating to extents
    36a88efe8747 jbd2: fix outstanding credits assert in jbd2_journal_commit_transaction()
    242303bf7fe0 null_blk: fix ida error handling in null_add_dev()
    b348e204a531 RDMA/rxe: Fix error unwind in rxe_create_qp()
    38403d143d1f mm/mmap.c: fix missing call to vm_unacct_memory in mmap_region
    d3beb91c99d1 platform/olpc: Fix uninitialized data in debugfs write
    358db0ebec41 USB: serial: fix tty-port initialized comments
    06f56d9e7470 PCI: tegra194: Fix link up retry sequence
    f916f6e03955 PCI: tegra194: Fix Root Port interrupt handling
    ed44d9ce8c37 HID: alps: Declare U1_UNICORN_LEGACY support
    46f545821144 mmc: cavium-thunderx: Add of_node_put() when breaking out of loop
    d0cc1ba2be1c mmc: cavium-octeon: Add of_node_put() when breaking out of loop
    b100b0b0026a gpio: gpiolib-of: Fix refcount bugs in of_mm_gpiochip_add_data()
    2f90813f1c21 RDMA/hfi1: fix potential memory leak in setup_base_ctxt()
    11edf0bba15e RDMA/siw: Fix duplicated reported IW_CM_EVENT_CONNECT_REPLY event
    fb9193af53a3 RDMA/hns: Fix incorrect clearing of interrupt status register
    414849317b36 usb: gadget: udc: amd5536 depends on HAS_DMA
    bc6f609401c4 scsi: smartpqi: Fix DMA direction for RAID requests
    b1b803495374 mmc: sdhci-of-at91: fix set_uhs_signaling rewriting of MC1R
    9d8b911fe3c3 memstick/ms_block: Fix a memory leak
    830c38ec9aca memstick/ms_block: Fix some incorrect memory allocation
    4c472a2c9ed6 mmc: sdhci-of-esdhc: Fix refcount leak in esdhc_signal_voltage_switch
    6bb0f109660a staging: rtl8192u: Fix sleep in atomic context bug in dm_fsync_timer_callback
    b5d924cb4c7b intel_th: msu: Fix vmalloced buffers
    d81195c47465 intel_th: msu-sink: Potential dereference of null pointer
    859342220acc intel_th: Fix a resource leak in an error handling path
    3771ee6c46ad soundwire: bus_type: fix remove and shutdown support
    2fcb7182dee9 clk: qcom: camcc-sdm845: Fix topology around titan_top power domain
    7dc9eb967a47 clk: qcom: ipq8074: set BRANCH_HALT_DELAY flag for UBI clocks
    5780dde5104f clk: qcom: ipq8074: fix NSS port frequency tables
    15f4d52835b7 usb: host: xhci: use snprintf() in xhci_decode_trb()
    7cfb3120ecf2 clk: qcom: clk-krait: unlock spin after mux completion
    8191b6cd9ada driver core: fix potential deadlock in __driver_attach
    be8f7c44d5af misc: rtsx: Fix an error handling path in rtsx_pci_probe()
    507cabdb3692 clk: mediatek: reset: Fix written reset bit offset
    9ecabd76bfc7 usb: xhci: tegra: Fix error check
    65d36ec409b6 usb: ohci-nxp: Fix refcount leak in ohci_hcd_nxp_probe
    8cbc3870ff35 usb: host: Fix refcount leak in ehci_hcd_ppc_of_probe
    8e88b4257532 fpga: altera-pr-ip: fix unsigned comparison with less than zero
    44ffee3979d6 mtd: st_spi_fsm: Add a clk_disable_unprepare() in .probe()'s error path
    f3cc27198c5d mtd: partitions: Fix refcount leak in parse_redboot_of
    a1cdbd344f86 mtd: sm_ftl: Fix deadlock caused by cancel_work_sync in sm_release
    519ff31a6ddd HID: cp2112: prevent a buffer overflow in cp2112_xfer()
    1367f4a3e6b5 mtd: rawnand: meson: Fix a potential double free issue
    80b1465b2ae8 mtd: maps: Fix refcount leak in ap_flash_init
    9124d51e0123 mtd: maps: Fix refcount leak in of_flash_probe_versatile
    e0012773af09 clk: renesas: r9a06g032: Fix UART clkgrp bitsel
    51fb8c2c106b dccp: put dccp_qpolicy_full() and dccp_qpolicy_push() in the same lock
    d3b292263731 net: rose: fix netdev reference changes
    34b88491b4de netdevsim: Avoid allocation warnings triggered from user space
    9d9e0d55601d iavf: Fix max_rate limiting
    50a7949fd9ea crypto: inside-secure - Add missing MODULE_DEVICE_TABLE for of
    439297ec5c05 net/mlx5e: Fix the value of MLX5E_MAX_RQ_NUM_MTTS
    878e7f39803a wifi: libertas: Fix possible refcount leak in if_usb_probe()
    5cca5f714fe6 wifi: iwlwifi: mvm: fix double list_add at iwl_mvm_mac_wake_tx_queue
    52b11a48cf07 wifi: wil6210: debugfs: fix uninitialized variable use in `wil_write_file_wmi()`
    becbc82919bc i2c: mux-gpmux: Add of_node_put() when breaking out of loop
    6d9f3128c0ee i2c: cadence: Support PEC for SMBus block read
    80df14022cec Bluetooth: hci_intel: Add check for platform_driver_register
    26168f0656a3 can: pch_can: pch_can_error(): initialize errc before using it
    a025f6ca15b2 can: error: specify the values of data[5..7] of CAN error frames
    61bcc556ff8c can: usb_8dev: do not report txerr and rxerr during bus-off
    d8833eaa5f37 can: kvaser_usb_leaf: do not report txerr and rxerr during bus-off
    a37e2bad7635 can: kvaser_usb_hydra: do not report txerr and rxerr during bus-off
    80b135a02389 can: sun4i_can: do not report txerr and rxerr during bus-off
    d20bf7e76136 can: hi311x: do not report txerr and rxerr during bus-off
    e94369cdc038 can: sja1000: do not report txerr and rxerr during bus-off
    5b9d4919a7d7 can: rcar_can: do not report txerr and rxerr during bus-off
    4cb29f25b215 can: pch_can: do not report txerr and rxerr during bus-off
    ecbdb2985e08 selftests/bpf: fix a test for snprintf() overflow
    e134d998a98c wifi: p54: add missing parentheses in p54_flush()
    6942c45a2270 wifi: p54: Fix an error handling path in p54spi_probe()
    60c998342516 wifi: wil6210: debugfs: fix info leak in wil_write_file_wmi()
    72d9ce5b085a fs: check FMODE_LSEEK to control internal pipe splicing
    8cf6e837dcfc selftests: timers: clocksource-switch: fix passing errors from child
    2f243fe8db21 selftests: timers: valid-adjtimex: build fix for newer toolchains
    8ebe6121e7cc libbpf: Fix the name of a reused map
    fd35e34ece33 tcp: make retransmitted SKB fit into the send window
    6296d09d2b21 drm/exynos/exynos7_drm_decon: free resources when clk_set_parent() failed.
    1ae9edf7e875 mediatek: mt76: mac80211: Fix missing of_node_put() in mt76_led_init()
    e86a88d39cc7 media: platform: mtk-mdp: Fix mdp_ipi_comm structure alignment
    cf411bcc657b crypto: hisilicon - Kunpeng916 crypto driver don't sleep when in softirq
    2e34d6c8180a drm/msm/mdp5: Fix global state lock backoff
    5d4128a163a9 drm: bridge: sii8620: fix possible off-by-one
    3a7ebe131ca9 drm/mediatek: dpi: Only enable dpi after the bridge is enabled
    42c8e38e8620 drm/mediatek: dpi: Remove output format of YUV
    0f214563ab6d drm/rockchip: Fix an error handling path rockchip_dp_probe()
    3345fd35335f drm/rockchip: vop: Don't crash for invalid duplicate_state()
    9f64fb45514a crypto: arm64/gcm - Select AEAD for GHASH_ARM64_CE
    b53cbaf9b3b3 drm/vc4: dsi: Correct DSI divider calculations
    120161c12731 drm/vc4: plane: Fix margin calculations for the right/bottom edges
    84f638fbf83c drm/vc4: plane: Remove subpixel positioning check
    59340f399c0a media: hdpvr: fix error value returns in hdpvr_read
    87c35bbefdfa drm/mcde: Fix refcount leak in mcde_dsi_bind
    289079d6c5f0 drm: bridge: adv7511: Add check for mipi_dsi_driver_register
    73304c759408 wifi: iwlegacy: 4965: fix potential off-by-one overflow in il4965_rs_fill_link_cmd()
    e9e21206b8ea ath9k: fix use-after-free in ath9k_hif_usb_rx_cb
    fef3261630eb media: tw686x: Register the irq at the end of probe
    871a1e94929a i2c: Fix a potential use after free
    127ecd6b1f17 drm: adv7511: override i2c address of cec before accessing it
    8cdf42c7baa6 drm/mediatek: Add pull-down MIPI operation in mtk_dsi_poweroff function
    db1a9add3f90 drm/radeon: fix potential buffer overflow in ni_set_mc_special_registers()
    6a5ade10a38e drm/mipi-dbi: align max_chunk to 2 in spi_transfer
    f52b31ecaf59 wifi: rtlwifi: fix error codes in rtl_debugfs_set_write_h2c()
    c59876f8c982 ath10k: do not enforce interrupt trigger type
    08cc3995fb6b dm: return early from dm_pr_call() if DM device is suspended
    bc4e8b95c407 thermal/tools/tmon: Include pthread and time headers in tmon.h
    91732a2794bb nohz/full, sched/rt: Fix missed tick-reenabling bug in dequeue_task_rt()
    35f9e861d9b9 regulator: of: Fix refcount leak bug in of_get_regulation_constraints()
    52e1f85bf7de blk-mq: don't create hctx debugfs dir until q->debugfs_dir is created
    bee4d2ab4db5 erofs: avoid consecutive detection for Highmem memory
    62060951ccb9 arm64: dts: mt7622: fix BPI-R64 WPS button
    850167439429 bus: hisi_lpc: fix missing platform_device_put() in hisi_lpc_acpi_probe()
    3d698238584c ARM: dts: qcom: pm8841: add required thermal-sensor-cells
    bc73c72a856c soc: qcom: aoss: Fix refcount leak in qmp_cooling_devices_register
    a530fa52d4fd cpufreq: zynq: Fix refcount leak in zynq_get_revision
    c4f92af7fc8c ARM: OMAP2+: Fix refcount leak in omap3xxx_prm_late_init
    935035cf97c8 ARM: OMAP2+: Fix refcount leak in omapdss_init_of
    b95e19f1ec73 ARM: dts: qcom: mdm9615: add missing PMIC GPIO reg
    1f0448cb8a44 soc: fsl: guts: machine variable might be unset
    1e9cc69eae6d ARM: dts: ast2600-evb: fix board compatible
    4a4bb53e635b ARM: dts: ast2500-evb: fix board compatible
    0b7f674c12c0 x86/pmem: Fix platform-device leak in error path
    5afe042c8894 ARM: bcm: Fix refcount leak in bcm_kona_smc_init
    6b28bf3e044f meson-mx-socinfo: Fix refcount leak in meson_mx_socinfo_init
    ef5102a0a724 ARM: findbit: fix overflowing offset
    c7835f93db67 spi: spi-rspi: Fix PIO fallback on RZ platforms
    90bdf50ae70c selinux: Add boundary check in put_entry()
    3c48d3067eaf PM: hibernate: defer device probing when resuming from hibernation
    930e7b260e6a ARM: shmobile: rcar-gen2: Increase refcount for new reference
    a770da1866ac arm64: dts: allwinner: a64: orangepi-win: Fix LED node name
    5f1510dd2fc9 arm64: dts: qcom: ipq8074: fix NAND node name
    308bb82c61b7 ACPI: LPSS: Fix missing check in register_device_clock()
    b61119d0850e ACPI: PM: save NVS memory for Lenovo G40-45
    81abef841f32 ACPI: EC: Remove duplicate ThinkPad X1 Carbon 6th entry from DMI quirks
    3e505298a75f ARM: OMAP2+: display: Fix refcount leak bug
    749ee1c4c35a spi: synquacer: Add missing clk_disable_unprepare()
    f7e6740e1e45 ARM: dts: imx6ul: fix qspi node compatible
    5db7e1796d41 ARM: dts: imx6ul: fix lcdif node compatible
    82cff0cf7141 ARM: dts: imx6ul: fix csi node compatible
    667023a28419 ARM: dts: imx6ul: change operating-points to uint32-matrix
    a6e620361617 ARM: dts: imx6ul: add missing properties for sram
    bd80dd86f9bf wait: Fix __wait_event_hrtimeout for RT/DL tasks
    3fb368c0ae39 genirq: Don't return error on missing optional irq_request_resources()
    b3f423683818 ext2: Add more validity checks for inode counts
    04549063d570 arm64: fix oops in concurrently setting insn_emulation sysctls
    fa09c3926583 arm64: Do not forget syscall when starting a new thread.
    c5940c082185 x86: Handle idle=nomwait cmdline properly for x86_idle
    cf2db24ec4b8 epoll: autoremove wakers even more aggressively
    a452bc3deb23 netfilter: nf_tables: fix null deref due to zeroed list head
    4dad1c820771 netfilter: nf_tables: do not allow RULE_ID to refer to another chain
    fab2f61cc3b0 netfilter: nf_tables: do not allow SET_ID to refer to another table
    cc525d667b3f arm64: dts: uniphier: Fix USB interrupts for PXs3 SoC
    57e2c8444529 ARM: dts: uniphier: Fix USB interrupts for PXs2 SoC
    5d952c7ae339 USB: HCD: Fix URB giveback issue in tasklet function
    e9205d8dd1ca coresight: Clear the connection field properly
    274e44e21234 MIPS: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
    dbd005901840 powerpc/powernv: Avoid crashing if rng is NULL
    5b8f55bc0526 powerpc/ptdump: Fix display of RW pages on FSL_BOOK3E
    28a6d14ba60a powerpc/fsl-pci: Fix Class Code of PCIe Root Port
    9293b7ee5297 PCI: Add defines for normal and subtractive PCI bridges
    8c3ae6b1d76c ia64, processor: fix -Wincompatible-pointer-types in ia64_get_irr()
    ce839b9331c1 md-raid10: fix KASAN warning
    ecd489683a74 serial: mvebu-uart: uart2 error bits clearing
    d11e3f4fdc90 fuse: limit nsec
    ed43fb20d3d1 iio: light: isl29028: Fix the warning in isl29028_remove()
    a5b8aad54824 drm/amdgpu: Check BO's requested pinning domains against its preferred_domains
    8afbf206aa3d drm/nouveau: fix another off-by-one in nvbios_addr
    5557e9469b8e drm/gem: Properly annotate WW context on drm_gem_lock_reservations() error
    b8f3830cd905 parisc: io_pgetevents_time64() needs compat syscall in 32-bit compat mode
    d7ba24d3a893 parisc: Fix device names in /proc/iomem
    a7573260ad0d ovl: drop WARN_ON() dentry is NULL in ovl_encode_fh()
    8b4588b8b00b usbnet: Fix linkwatch use-after-free on disconnect
    2afb553d6825 fbcon: Fix boundary checks for fbcon=vc:n1-n2 parameters
    6f9cd356eb27 thermal: sysfs: Fix cooling_device_stats_setup() error code path
    a698d2fa85be fs: Add missing umask strip in vfs_tmpfile
    e2a231454e2b vfs: Check the truncate maximum size in inode_newsize_ok()
    cc9e874dace0 tty: vt: initialize unicode screen buffer
    9e274a4f6029 ALSA: hda/realtek: Add quirk for another Asus K42JZ model
    495f153c1587 ALSA: hda/cirrus - support for iMac 12,1 model
    f4f2d3742b97 ALSA: hda/conexant: Add quirk for LENOVO 20149 Notebook model
    79e522101cf4 mm/mremap: hold the rmap lock in write mode when moving page table entries.
    731436e1eee2 KVM: x86: Set error code to segment selector on LLDT/LTR non-canonical #GP
    914a274320e5 KVM: x86: Mark TSS busy during LTR emulation _after_ all fault checks
    78359865870d KVM: nVMX: Let userspace set nVMX MSR to any _host_ supported value
    68e1313bb880 KVM: SVM: Don't BUG if userspace injects an interrupt with GIF=0
    e40bde8a28ed KVM: nVMX: Snapshot pre-VM-Enter DEBUGCTL for !nested_run_pending case
    c841dfce0b0d KVM: nVMX: Snapshot pre-VM-Enter BNDCFGS for !nested_run_pending case
    717c93c7f6c4 HID: wacom: Don't register pad_input for touch switch
    0ca140b28425 HID: wacom: Only report rotation for art pen
    d14b6fe91149 add barriers to buffer_uptodate and set_buffer_uptodate
    6f3342a5e83c wifi: mac80211_hwsim: use 32-bit skb cookie
    4f4bf4e52b5a wifi: mac80211_hwsim: add back erroneously removed cast
    84014008bc7f wifi: mac80211_hwsim: fix race condition in pending packet
    ae52cf801a14 igc: Remove _I_PHY_ID checking
    05e0bb8c3c4d ALSA: bcd2000: Fix a UAF bug on the error path of probing
    58e337d27f8a scsi: Revert "scsi: qla2xxx: Fix disk failure to rediscover"
    013acaa59752 x86: link vdso and boot with -z noexecstack --no-warn-rwx-segments
    635e8e6f6837 Makefile: link with -z noexecstack --no-warn-rwx-segments

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 7f766090fb..e87dd0d1b3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c3d41d0285529bdd90b4625dc5caaa9dcecf7c64"
-SRCREV_meta ?= "e1682f82a101d7b4561a9246010f1535fc6cf583"
+SRCREV_machine ?= "c556c2548cdba599081f205c0d348ef9cdfbfb2b"
+SRCREV_meta ?= "742e90e101505d9ef997208bad6f615afe2667e8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.210"
+LINUX_VERSION ?= "5.4.212"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 81e10b240c..fc2c9c17e3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.210"
+LINUX_VERSION ?= "5.4.212"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "caaa7fd55f05c104ef33d0d01d8fb64c72de3f9b"
-SRCREV_machine ?= "d9ba497c67cb9905a8947d92c8b4a469309b354e"
-SRCREV_meta ?= "e1682f82a101d7b4561a9246010f1535fc6cf583"
+SRCREV_machine_qemuarm ?= "51e50e76cfccbfb39009601a7c89e7052072c99f"
+SRCREV_machine ?= "391047ed21fe4ffac33e43cb92fa12e92e5d8295"
+SRCREV_meta ?= "742e90e101505d9ef997208bad6f615afe2667e8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 876aa2f16d..337f88ebc4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "bccceefd95fc53e9b7c84f92401e5a660ded553c"
-SRCREV_machine_qemuarm64 ?= "4377f280ff917c050be6cf135fd3e371fdf5b2f2"
-SRCREV_machine_qemumips ?= "6ec4e71fdc85eab33422225750ad0eb3767e84a9"
-SRCREV_machine_qemuppc ?= "d03ef50c2e8d8508dc57369c7943bce6ddf1cfdf"
-SRCREV_machine_qemuriscv64 ?= "588ad034d1610fd31e575fff588e386cc672f972"
-SRCREV_machine_qemux86 ?= "588ad034d1610fd31e575fff588e386cc672f972"
-SRCREV_machine_qemux86-64 ?= "588ad034d1610fd31e575fff588e386cc672f972"
-SRCREV_machine_qemumips64 ?= "4a033c21edd6d4f5e1e9675cdde70e29f6346dbd"
-SRCREV_machine ?= "588ad034d1610fd31e575fff588e386cc672f972"
-SRCREV_meta ?= "e1682f82a101d7b4561a9246010f1535fc6cf583"
+SRCREV_machine_qemuarm ?= "84a3c56b36218e845c993852034ea4e4c6d42db3"
+SRCREV_machine_qemuarm64 ?= "5d810784589f1ea9ad5ef6ff691416554ffee602"
+SRCREV_machine_qemumips ?= "06badf213e521b91b2dcf20a2bad9fbe473d7c97"
+SRCREV_machine_qemuppc ?= "2d5004f2508564b86f4ebf7016dce08db9d53a8c"
+SRCREV_machine_qemuriscv64 ?= "56c4c8f337cc40e9c04acd03169ab89b260a1899"
+SRCREV_machine_qemux86 ?= "56c4c8f337cc40e9c04acd03169ab89b260a1899"
+SRCREV_machine_qemux86-64 ?= "56c4c8f337cc40e9c04acd03169ab89b260a1899"
+SRCREV_machine_qemumips64 ?= "3219060186d590af2bcb0b65fc0e448fdcbde2cb"
+SRCREV_machine ?= "56c4c8f337cc40e9c04acd03169ab89b260a1899"
+SRCREV_meta ?= "742e90e101505d9ef997208bad6f615afe2667e8"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.210"
+LINUX_VERSION ?= "5.4.212"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


