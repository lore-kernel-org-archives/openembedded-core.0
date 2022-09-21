Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 522F0C6FA8B
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 20:25:24 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.11437.1663791914040114439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 13:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PYc/yeOe;
 spf=pass (domain: gmail.com, ip: 209.85.222.193,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id d15so4820472qka.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 13:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=9Tk5CrTa6odezDRkNa2qhWI/FJDRIIiN7fWVcAsWA50=;
        b=PYc/yeOeysuVM4vkjLBueD1wps+80sEAE6LHlkF5/Tx60uVPe6ORYGuPiZGsl0q6L7
         /IQFs3Ik30HnDzaN6fm3UJ4DAw6L6HsF2OzSNPn4CUYx3DqzItIZMD3WihjvbMHgsGKu
         q1oTa31ZDuf355LHZLGszvBsgMn7Dn/WGL2cDrBwK9cc74UKWJW09nZyLwUfTtOIOlV/
         +8Us9OQknrYfiw4nrJlS9aIPIv5JE3eufeREFmgcf2Qm0dUCFePet7os+O6uIyqNpXgi
         gWZzSkOLsGkBaDkgnOR4u9DMCzcABHxbGv702ilLSUKLuqlwpcQyq/8KtHqZ5LPvNJyg
         A2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=9Tk5CrTa6odezDRkNa2qhWI/FJDRIIiN7fWVcAsWA50=;
        b=npd8+uca5p/keC+rjEiEXMntXZ60wcBjmDaMOGyKjAeZu2dEi1KgB+ApnlmkxTNGD5
         NRaeoawkwFjL55otU2c4YNkhah+Jm4Y/H6BsDCUanU+u5maNacxs1vtcy0Qf/vZNKDMV
         PtS8xb1V5/aRwEdHgRcmDtvx4C2ldD8pqiWGuML8KNIryBVSYxsOCjOcPwf0ZauwiHi1
         /5ehcdZl76uttbDqPsCsRdholSBRwqVTIMD/l/Ciut7qSEwyzb2yJ1mT6cnBSpaU1uOA
         RnjstNe72qPWIMYDOPlXU/2DderFoieqHBcJRThBHrTe3RNmvFhJFh0Ausasje7dRJmB
         6CYA==
X-Gm-Message-State: ACrzQf2D4ni4UReRthCqN9jFPQEd1p1HsZQbmSEKDtraaDZhygvEyQOg
	8GEWdawpyA6uExuX51NAOgP9anpV0Wo=
X-Google-Smtp-Source: 
 AMsMyM5sstHCR5Z96lmoEZAbDIblvH6MYqE0k0B9sHQrmBuFGgnSDR2nGhK3yHi7QGx/XdKgBhMhiA==
X-Received: by 2002:a37:897:0:b0:6cd:f5da:f1bc with SMTP id
 145-20020a370897000000b006cdf5daf1bcmr21039090qki.491.1663791912824;
        Wed, 21 Sep 2022 13:25:12 -0700 (PDT)
Received: from build.lan
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 bi10-20020a05620a318a00b006b953a7929csm2623072qkb.73.2022.09.21.13.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 13:25:12 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2][kirkstone] linux-yocto/5.10: update to v5.10.141
Date: Wed, 21 Sep 2022 16:25:10 -0400
Message-Id: <20220921202511.28887-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 20:25:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170960

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    0b8e37cbaa76 Linux 5.10.141
    bdc786d737ec net: neigh: don't call kfree_skb() under spin_lock_irqsave()
    4931af31c402 net/af_packet: check len when min_header_len equals to 0
    64f6da455b66 xfs: revert "xfs: actually bump warning counts when we send warnings"
    d34798d846d7 xfs: fix soft lockup via spinning in filestream ag selection loop
    f168801da95f xfs: fix overfilling of reserve pool
    72a259bdd50d xfs: always succeed at setting the reserve pool size
    cb41f22df3ec xfs: remove infinite loop when reserving free block pool
    28d8d2737e82 io_uring: disable polling pollfree files
    744b0d308070 kprobes: don't call disarm_kprobe() for disabled kprobes
    8c70cce89231 lib/vdso: Mark do_hres_timens() and do_coarse_timens() __always_inline()
    6ba9e8fb47f6 netfilter: conntrack: NF_CONNTRACK_PROCFS should no longer default to y
    afa169f79d47 drm/amdgpu: Increase tlb flush timeout for sriov
    f08a3712bac8 drm/amd/display: Fix pixel clock programming
    60d522f31707 drm/amd/pm: add missing ->fini_microcode interface for Sienna Cichlid
    f2b7b8b1c413 s390/hypfs: avoid error message under KVM
    c35adafe42bd neigh: fix possible DoS due to net iface start/stop loop
    3c1dfeaeb3b4 drm/amd/display: clear optc underflow before turn off odm clock
    4e5e67b13a04 drm/amd/display: For stereo keep "FLIP_ANY_FRAME"
    828b2a5399aa drm/amd/display: Avoid MPC infinite loop
    9d36e2c264f7 mmc: mtk-sd: Clear interrupts when cqe off/disable
    98f401d36396 mm/rmap: Fix anon_vma->degree ambiguity leading to double-reuse
    6204bf78b2a9 bpf: Don't redirect packets with invalid pkt_len
    dbd8c8fc6048 ftrace: Fix NULL pointer dereference in is_ftrace_trampoline when ftrace is dead
    8fc778ee2fb2 fbdev: fb_pm2fb: Avoid potential divide by zero error
    61cc798591a3 net: fix refcount bug in sk_psock_get (2)
    7e2fa7922658 HID: hidraw: fix memory leak in hidraw_release()
    bacb37bdc2a2 media: pvrusb2: fix memory leak in pvr_probe
    872875c9ecf8 udmabuf: Set the DMA mask for the udmabuf device (v2)
    dc815761948a HID: steam: Prevent NULL pointer dereference in steam_{recv,send}_report
    412b844143e3 Revert "PCI/portdrv: Don't disable AER reporting in get_port_device_capability()"
    38267d266336 Bluetooth: L2CAP: Fix build errors in some archs
    ad697ade5939 kbuild: Fix include path in scripts/Makefile.modpost
    b9feeb610099 s390/mm: do not trigger write fault when vma does not allow VM_WRITE
    0dea6b3e22c6 crypto: lib - remove unneeded selection of XOR_BLOCKS
    e5796ff9acc5 x86/nospec: Fix i386 RSB stuffing
    adee8f3082b0 x86/nospec: Unwreck the RSB stuffing
    895428ee124a mm: Force TLB flush for PFNMAP mappings before unlink_file_vma()
    18ed766f3642 Linux 5.10.140
    e89798071784 bpf: Don't use tnum_range on array range checking for poke descriptors
    46fcb0fc884d scsi: storvsc: Remove WQ_MEM_RECLAIM from storvsc_error_wq
    8d5c106fe216 scsi: ufs: core: Enable link lost interrupt
    c0ba9aa95bf7 perf/x86/intel/uncore: Fix broken read_counter() for SNB IMC PMU
    5a768c977085 perf python: Fix build when PYTHON_CONFIG is user supplied
    3ddbd0907f6d blk-mq: fix io hung due to missing commit_rqs
    7ca73d0a16e3 Documentation/ABI: Mention retbleed vulnerability info file for sysfs
    189623261994 arm64: Fix match_list for erratum 1286807 on Arm Cortex-A76
    a5a58fab556b md: call __md_stop_writes in md_stop
    f68f025c7e69 Revert "md-raid: destroy the bitmap after destroying the thread"
    62af37c5cd7f mm/hugetlb: fix hugetlb not supporting softdirty tracking
    6de50db104af xen/privcmd: fix error exit of privcmd_ioctl_dm_op()
    8d5f8a4f25b1 ACPI: processor: Remove freq Qos request for all CPUs
    297ae7e87a87 s390: fix double free of GS and RI CBs on fork() failure
    c60ae878782d asm-generic: sections: refactor memory_intersects
    6858933131d0 loop: Check for overflow while configuring loop
    14cbbb9c9914 x86/bugs: Add "unknown" reporting for MMIO Stale Data
    e3e0d117294d x86/unwind/orc: Unwind ftrace trampolines with correct ORC entry
    090f0ac167a0 perf/x86/lbr: Enable the branch type for the Arch LBR by default
    d2bd18d50c1e btrfs: check if root is readonly while setting security xattr
    dcac6293f571 btrfs: add info when mount fails due to stale replace target
    b2d352ed4d48 btrfs: replace: drop assert for suspended replace
    2fc3c168d5b6 btrfs: fix silent failure when deleting root reference
    3a351b567e20 ionic: fix up issues with handling EAGAIN on FW cmds
    79e2ca7aa96e rxrpc: Fix locking in rxrpc's sendmsg
    c3a6e863d51b ixgbe: stop resetting SYSTIME in ixgbe_ptp_start_cyclecounter
    23cf93bb32e5 net: Fix a data-race around sysctl_somaxconn.
    9fcc4f406620 net: Fix data-races around sysctl_devconf_inherit_init_net.
    371a3bcf3144 net: Fix data-races around sysctl_fb_tunnels_only_for_init_net.
    c3bda708e9c4 net: Fix a data-race around netdev_budget_usecs.
    12a34d7f0463 net: Fix a data-race around netdev_budget.
    410c88314ce3 net: Fix a data-race around sysctl_net_busy_read.
    2c7dae6c4511 net: Fix a data-race around sysctl_net_busy_poll.
    8db070463e3e net: Fix a data-race around sysctl_tstamp_allow_data.
    ed48223f87c5 net: Fix data-races around sysctl_optmem_max.
    27e8ade79265 bpf: Folding omem_charge() into sk_storage_charge()
    4d4e39245dd5 ratelimit: Fix data-races in ___ratelimit().
    e73009ebc123 net: Fix data-races around netdev_tstamp_prequeue.
    3850060352f4 net: Fix data-races around netdev_max_backlog.
    b498a1b0171e net: Fix data-races around weight_p and dev_weight_[rt]x_bias.
    fb442c72db38 net: Fix data-races around sysctl_[rw]mem_(max|default).
    613fd026209e net: Fix data-races around sysctl_[rw]mem(_offset)?.
    e73a29554f0b tcp: tweak len/truesize ratio for coalesce candidates
    c08a104a8bce netfilter: nf_tables: disallow binding to already bound chain
    6301a73bd83d netfilter: nf_tables: disallow jump to implicit chain from set element
    98827687593b netfilter: nf_tables: upfront validation of data via nft_data_init()
    8790eecdea01 netfilter: bitwise: improve error goto labels
    2267d38520c4 netfilter: nft_cmp: optimize comparison for 16-bytes
    1d7d74a8240e netfilter: nf_tables: consolidate rule verdict trace call
    cd962806c449 netfilter: nftables: remove redundant assignment of variable err
    35519ce7bac9 netfilter: nft_tunnel: restrict it to netdev family
    9a67c2c89c32 netfilter: nft_osf: restrict osf to ipv4, ipv6 and inet families
    c907dfe4eaca netfilter: nf_tables: do not leave chain stats enabled on error
    ea358cfc8e25 netfilter: nft_payload: do not truncate csum_offset and csum_type
    93a46d6c72b1 netfilter: nft_payload: report ERANGE for too long offset and length
    e0f8cf01927d bnxt_en: fix NQ resource accounting during vf creation on 57500 chips
    624c30521233 netfilter: ebtables: reject blobs that don't provide all entry points
    f82a6b85e0ae net: ipvtap - add __init/__exit annotations to module init/exit funcs
    7e7e88e8b5b4 bonding: 802.3ad: fix no transmission of LACPDUs
    14ef913a9582 net: moxa: get rid of asymmetry in DMA mapping/unmapping
    faa8bf845106 net: ipa: don't assume SMEM is page-aligned
    29accb2d96e6 net/mlx5e: Properly disable vlan strip on non-UL reps
    1bfdcde723d8 ice: xsk: prohibit usage of non-balanced queue id
    d29d7108e19e ice: xsk: Force rings to be sized to power of 2
    50403ee6dadd nfc: pn533: Fix use-after-free bugs caused by pn532_cmd_timeout
    de3deadd1198 rose: check NULL rose_loopback_neigh->loopback
    e9fe1283a88c mm/smaps: don't access young/dirty bit if pte unpresent
    c7c77185fa3e mm/huge_memory.c: use helper function migration_entry_to_page()
    8be096f018e4 SUNRPC: RPC level errors should set task->tk_rpc_status
    5e49ea099850 NFSv4.2 fix problems with __nfs42_ssc_open
    23c6f25a6043 NFS: Don't allocate nfs_fattr on the stack in __nfs42_ssc_open()
    2761612bcde9 xfrm: policy: fix metadata dst->dev xmit null pointer dereference
    c5c4d4c9806d af_key: Do not call xfrm_probe_algs in parallel
    4379a10c1db7 xfrm: clone missing x->lastused in xfrm_do_migrate
    1305d7d4f35c xfrm: fix refcount leak in __xfrm_policy_check()
    c30c0f720533 kernel/sched: Remove dl_boosted flag comment
    70d560e2fb5e xfs: only bother with sync_filesystem during readonly remount
    37837bc3ef31 xfs: return errors in xfs_fs_sync_fs
    76a51e49da9c vfs: make sync_filesystem return errors from ->sync_fs
    9255a42fe7ab fs: remove __sync_filesystem
    1b9b4139d794 xfs: reject crazy array sizes being fed to XFS_IOC_GETBMAP*
    6a564bad3a64 xfs: prevent a WARN_ONCE() in xfs_ioc_attr_list()
    a5757df6128b pinctrl: amd: Don't save/restore interrupt status and wake status bits
    665433b5ddc2 kernel/sys_ni: add compat entry for fadvise64_64
    df1d445e7fcf parisc: Fix exception handler for fldw and fstw instructions
    e10bb2f2e99b audit: fix potential double free on error path from fsnotify_add_inode_mark
    665ee746071b Linux 5.10.139
    37c7f25fe2b7 kbuild: dummy-tools: avoid tmpdir leak in dummy gcc
    fa3303d70b42 Linux 5.10.138
    606fe84a4185 tee: fix memory leak in tee_shm_register()
    3527e3cbb84d bpf: Fix KASAN use-after-free Read in compute_effective_progs
    4f7286422a78 qrtr: Convert qrtr_ports from IDR to XArray
    1daa7629d2a2 PCI/ERR: Retain status from error notification
    a220ff343396 can: j1939: j1939_session_destroy(): fix memory leak of skbs
    05b9b0a7a7cd can: j1939: j1939_sk_queue_activate_next_locked(): replace WARN_ON_ONCE with netdev_warn_once()
    184e73f12cba tracing/probes: Have kprobes and uprobes use $COMM too
    3debec96cae1 netfilter: nf_tables: fix audit memory leak in nf_tables_commit
    f3d0db3b435a netfilter: nftables: fix a warning message in nf_tables_commit_audit_collect()
    059f47b3a433 MIPS: tlbex: Explicitly compare _PAGE_NO_EXEC against 0
    4b20c6136514 video: fbdev: i740fb: Check the argument of i740_calc_vclk()
    dac28dff9084 powerpc/64: Init jump labels before parse_early_param()
    52a408548ab3 smb3: check xattr value length earlier
    336936f72ab3 f2fs: fix to do sanity check on segment type in build_sit_entries()
    800ba8979111 f2fs: fix to avoid use f2fs_bug_on() in f2fs_new_node_page()
    857ccedcf569 ALSA: control: Use deferred fasync helper
    658bc550a4ec ALSA: timer: Use deferred fasync helper
    be094c417a0e ALSA: core: Add async signal helpers
    6ed3e280c7a1 powerpc/32: Don't always pass -mcpu=powerpc to the compiler
    63671b2bdf5f watchdog: export lockup_detector_reconfigure
    399d24577567 RISC-V: Add fast call path of crash_kexec()
    d881c98d0a49 riscv: mmap with PROT_WRITE but no PROT_READ is invalid
    333bdb72be13 modules: Ensure natural alignment for .altinstructions and __bug_table sections
    1e39037e44d7 mips: cavium-octeon: Fix missing of_node_put() in octeon2_usb_clocks_start
    5e034e03f416 vfio: Clear the caps->buf to NULL after free
    81939c4fbc2d tty: serial: Fix refcount leak bug in ucc_uart.c
    58275db3c7d2 lib/list_debug.c: Detect uninitialized lists
    80288883294c ext4: avoid resizing to a partial cluster size
    285447b81925 ext4: avoid remove directory when directory is corrupted
    5d8325fd1589 drivers:md:fix a potential use-after-free bug
    534e96302ad2 nvmet-tcp: fix lockdep complaint on nvmet_tcp_wq flush during queue teardown
    6d7aabdba60c md: Notify sysfs sync_completed in md_reap_sync_thread()
    f43a72d4da91 dmaengine: sprd: Cleanup in .remove() after pm_runtime_get_sync() failed
    b30aa4ff11a1 selftests/kprobe: Do not test for GRP/ without event failures
    fa45327d8c52 csky/kprobe: reclaim insn_slot on kprobe unregistration
    18f62a453b72 RDMA/rxe: Limit the number of calls to each tasklet
    9a6178c225e9 um: add "noreboot" command line option for PANIC_TIMEOUT=-1 setups
    e4c9f162193a PCI/ACPI: Guard ARM64-specific mcfg_quirks
    4be138bcd6d6 cxl: Fix a memory leak in an error handling path
    84d94619c7cf pinctrl: intel: Check against matching data instead of ACPI companion
    9ac14f973cb9 gadgetfs: ep_io - wait until IRQ finishes
    c29a4baaad38 scsi: lpfc: Prevent buffer overflow crashes in debugfs with malformed user input
    eb01065fd337 clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
    56a4bccab9c8 zram: do not lookup algorithm in backends table
    09c90f89b2e6 uacce: Handle parent device removal or parent driver module rmmod
    6b90ab952401 clk: qcom: ipq8074: dont disable gcc_sleep_clk_src
    eddb352a807d vboxguest: Do not use devm for irq
    9a87f33f1dd0 usb: dwc2: gadget: remove D+ pull-up while no vbus with usb-role-switch
    9790a5a4f07f usb: renesas: Fix refcount leak bug
    cb5dd65e8891 usb: host: ohci-ppc-of: Fix refcount leak bug
    d86c6447ee25 clk: ti: Stop using legacy clkctrl names for omap4 and 5
    152c94c10bc4 drm/meson: Fix overflow implicit truncation warnings
    da6b37983a39 irqchip/tegra: Fix overflow implicit truncation warnings
    24304c6f9c11 usb: gadget: uvc: call uvc uvcg_warn on completed status instead of uvcg_info
    6d7ac60098b2 usb: cdns3 fix use-after-free at workaround 2
    0a0da5ef5b4e platform/chrome: cros_ec_proto: don't show MKBP version if unsupported
    e2ab7afe6665 PCI: Add ACS quirk for Broadcom BCM5750x NICs
    a1e7908f78f5 drm/sun4i: dsi: Prevent underflow when computing packet sizes
    bd6165b80232 netfilter: add helper function to set up the nfnetlink header and use it
    06fde3cd0b53 netfilter: nftables: add helper function to set the base sequence number
    e2a49009ba03 audit: log nftables configuration change events once per table
    3aa710e96747 drm/meson: Fix refcount bugs in meson_vpu_has_available_connectors()
    1bfdb1912cb3 ASoC: SOF: intel: move sof_intel_dsp_desc() forward
    823280a8fba3 locking/atomic: Make test_and_*_bit() ordered on failure
    0bd35968bcd0 gcc-plugins: Undefine LATENT_ENTROPY_PLUGIN when plugin disabled for a file
    9112826f28ee kbuild: fix the modules order between drivers and libs
    0f516dcd1456 igb: Add lock to avoid data race
    02f3642d8e65 stmmac: intel: Add a missing clk_disable_unprepare() call in intel_eth_pci_remove()
    efae1735ff15 fec: Fix timer capture timing in `fec_ptp_enable_pps()`
    668f38fb9a8c i40e: Fix to stop tx_timeout recovery if GLOBR fails
    bbd6723d7584 regulator: pca9450: Remove restrictions for regulator-name
    b5ba5c36694d i2c: imx: Make sure to unregister adapter on remove()
    19cb691faf47 ice: Ignore EEXIST when setting promisc mode
    7983e1e44cb3 net: dsa: sja1105: fix buffer overflow in sja1105_setup_devlink_regions()
    83411c9f05d5 net: genl: fix error path memory leak in policy dumping
    af1748ee51b3 net: dsa: felix: fix ethtool 256-511 and 512-1023 TX packet counters
    9900af65f2d1 net: dsa: microchip: ksz9477: fix fdb_dump last invalid entry
    7d51385ae019 net: moxa: pass pdev instead of ndev to DMA functions
    92dc64e8f591 net: dsa: mv88e6060: prevent crash on an unused port
    aa16c8c4e830 spi: meson-spicc: add local pow2 clock ops to preserve rate between messages
    a868f771ee41 powerpc/pci: Fix get_phb_number() locking
    3561f4d12fb9 netfilter: nf_tables: check NFT_SET_CONCAT flag if field_count is specified
    01b0cae6b74f netfilter: nf_tables: validate NFTA_SET_ELEM_OBJREF based on NFT_SET_OBJECT flag
    8d2fe4b9ed4e netfilter: nf_tables: really skip inactive sets when allocating name
    330f0a552bcf ASoC: tas2770: Fix handling of mute/unmute
    353cc4cb97d9 ASoC: tas2770: Drop conflicting set_bias_level power setting
    dffe1c4780e0 ASoC: tas2770: Allow mono streams
    fc57e3fde219 ASoC: tas2770: Set correct FSYNC polarity
    4fe80492d539 iavf: Fix adminq error handling
    63684e467b19 nios2: add force_successful_syscall_return()
    600ff4b13b0e nios2: restarts apply only to the first sigframe we build...
    f20bc59ccf9e nios2: fix syscall restart checks
    8d0118a027e3 nios2: traced syscall does need to check the syscall number
    1d2c89dc4837 nios2: don't leave NULLs in sys_call_table[]
    d29cdf865ae1 nios2: page fault et.al. are *not* restartable syscalls...
    76be98188203 dpaa2-eth: trace the allocated address instead of page struct
    787511c768b5 perf probe: Fix an error handling path in 'parse_perf_probe_command()'
    2c746ec91de7 geneve: fix TOS inheriting for ipv4
    a0ae122e9aec atm: idt77252: fix use-after-free bugs caused by tst_timer
    291cba960bb8 xen/xenbus: fix return type in xenbus_file_read()
    3c555a0599bf nfp: ethtool: fix the display error of `ethtool -m DEVNAME`
    76f3b97e56c6 NTB: ntb_tool: uninitialized heap data in tool_fn_write()
    7ef9f0efbeb1 tools build: Switch to new openssl API for test-libcrypto
    7ef0645ebecf kbuild: dummy-tools: avoid tmpdir leak in dummy gcc
    aee18421bda6 ceph: don't leak snap_rwsem in handle_cap_grant
    eea0d84a4fc7 tools/vm/slabinfo: use alphabetic order when two values are equal
    97cea2cb7c86 ceph: use correct index when encoding client supported features
    7a327285a7b0 dt-bindings: clock: qcom,gcc-msm8996: add more GCC clock sources
    87c4b359e343 dt-bindings: arm: qcom: fix MSM8916 MTP compatibles
    55fdefcb52c5 vsock: Set socket state back to SS_UNCONNECTED in vsock_connect_timeout()
    38ddccbda5e8 vsock: Fix memory leak in vsock_connect()
    549822e0dc9e plip: avoid rcu debug splat
    0c4542cb6ac8 ipv6: do not use RT_TOS for IPv6 flowlabel
    38b83883ce4e geneve: do not use RT_TOS for IPv6 flowlabel
    b0c3eec4ac69 ACPI: property: Return type of acpi_add_nondev_subnodes() should be bool
    cc0bfd933c81 pinctrl: qcom: sm8250: Fix PDC map
    d35d9bba2940 pinctrl: sunxi: Add I/O bias setting for H6 R-PIO
    e8f5699a82f2 pinctrl: qcom: msm8916: Allow CAMSS GP clocks to be muxed
    78d05103891d pinctrl: nomadik: Fix refcount leak in nmk_pinctrl_dt_subnode_to_map
    ab2b55bb25db net: bgmac: Fix a BUG triggered by wrong bytes_compl
    0e28678a770d devlink: Fix use-after-free after a failed reload
    faafa2a87f69 virtio_net: fix memory leak inside XPD_TX with mergeable
    fd70ebf2999b SUNRPC: Reinitialise the backchannel request buffers before reuse
    59d2e8fa4127 sunrpc: fix expiry of auth creds
    df60c534d4c5 net: atlantic: fix aq_vec index out of range error
    cc25abcec82c can: mcp251x: Fix race condition on receive interrupt
    b9d9cf88c828 bpf: Check the validity of max_rdwr_access for sock local storage map iterator
    f7d844df5e20 bpf: Acquire map uref in .init_seq_private for sock{map,hash} iterator
    d7ad7e65aa2f bpf: Acquire map uref in .init_seq_private for sock local storage map iterator
    bda6fe3ea893 bpf: Acquire map uref in .init_seq_private for hash map iterator
    30d7198da84f bpf: Acquire map uref in .init_seq_private for array map iterator
    76ffd2042438 NFSv4/pnfs: Fix a use-after-free bug in open
    f2bd1cc1fe7a NFSv4.1: RECLAIM_COMPLETE must handle EACCES
    cfde64bd315d NFSv4: Fix races in the legacy idmapper upcall
    060c111373ee NFSv4.1: Handle NFS4ERR_DELAY replies to OP_SEQUENCE correctly
    a351a73d9064 NFSv4.1: Don't decrease the value of seq_nr_highest_sent
    a408f135c4c2 Documentation: ACPI: EINJ: Fix obsolete example
    8aab4295582e apparmor: Fix memleak in aa_simple_write_to_buffer()
    2ceeb3296e9d apparmor: fix reference count leak in aa_pivotroot()
    2672f3eb7a7f apparmor: fix overlapping attachment computation
    1ac89741a2e7 apparmor: fix setting unconfined mode on a loaded profile
    4188f91c82e3 apparmor: fix aa_label_asxprint return check
    e0ca0156a786 apparmor: Fix failed mount permission check error message
    08f8128bc9f2 apparmor: fix absroot causing audited secids to begin with =
    bca03f0bbc3b apparmor: fix quiet_denied for file rules
    2b74344135fc can: ems_usb: fix clang's -Wunaligned-access warning
    7f06c7821187 ALSA: usb-audio: More comprehensive mixer map for ASUS ROG Zenith II
    5d3b02b80d93 tracing: Have filter accept "common_cpu" to be consistent
    6359850f9d8f btrfs: fix lost error handling when looking up extended ref on log replay
    79895cefa4c6 mmc: meson-gx: Fix an error handling path in meson_mmc_probe()
    13a497c3c598 mmc: pxamci: Fix an error handling path in pxamci_probe()
    4a211dd4856e mmc: pxamci: Fix another error handling path in pxamci_probe()
    a785d8417812 ata: libata-eh: Add missing command name
    fb1857c2e41a rds: add missing barrier to release_refill
    6876b4804b04 x86/mm: Use proper mask when setting PUD mapping
    b68e40b52f17 ALSA: hda/realtek: Add quirk for Clevo NS50PU, NS70PU
    e14e2fec35d3 ALSA: info: Fix llseek return value when using callback

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 8e159e4eed..6fa7b01734 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f32be1e4f2fc4ce856e2474ba9594830d61635c6"
-SRCREV_meta ?= "e462ebf62581138ef03de1783e93c49c2f0b1051"
+SRCREV_machine ?= "ce806c7f59d429249dba0975608a48ef91bccb75"
+SRCREV_meta ?= "dcf3fae266930708f432bf37ed4668a1ea9c5ac4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.137"
+LINUX_VERSION ?= "5.10.141"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 0920f108b1..e4eabacccf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.137"
+LINUX_VERSION ?= "5.10.141"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "44dc7fc9b0ab8f14f4ebe4dea9aaec050c80fa57"
-SRCREV_machine ?= "fa23e23c26057013e592f767f3e515d6abb58b87"
-SRCREV_meta ?= "e462ebf62581138ef03de1783e93c49c2f0b1051"
+SRCREV_machine:qemuarm ?= "8f8accaa8ef91657c3075e9ddd7b17afce6582d6"
+SRCREV_machine ?= "8bc9a9b0b0925e2c1f293742788dd7ab24f37454"
+SRCREV_meta ?= "dcf3fae266930708f432bf37ed4668a1ea9c5ac4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 38967203f0..898ed7f6fd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5666799db3b45abc8e17389d03abf495acf3cf32"
-SRCREV_machine:qemuarm64 ?= "170f32d0f616bead995cfa8aadb925e6996ab96b"
-SRCREV_machine:qemumips ?= "598bb1c14a82d24332f5c594faf5b7ca4090f3f3"
-SRCREV_machine:qemuppc ?= "c9942a6b847adae4e4249b4f7d6340c4fbef793b"
-SRCREV_machine:qemuriscv64 ?= "83cf01cdac584f986d67519c48c55e6925fb417f"
-SRCREV_machine:qemuriscv32 ?= "83cf01cdac584f986d67519c48c55e6925fb417f"
-SRCREV_machine:qemux86 ?= "83cf01cdac584f986d67519c48c55e6925fb417f"
-SRCREV_machine:qemux86-64 ?= "83cf01cdac584f986d67519c48c55e6925fb417f"
-SRCREV_machine:qemumips64 ?= "81761f090ebe75106ecd0d16fe44b59d395a2acc"
-SRCREV_machine ?= "83cf01cdac584f986d67519c48c55e6925fb417f"
-SRCREV_meta ?= "e462ebf62581138ef03de1783e93c49c2f0b1051"
+SRCREV_machine:qemuarm ?= "42deeeee78c60a4fd3f3bf1f9b6f949e83a2c914"
+SRCREV_machine:qemuarm64 ?= "5ee7be1502e787929426cbe2ac15258605121400"
+SRCREV_machine:qemumips ?= "ba39ab3e8a264860360cbe88db7c8689f5cbbb4f"
+SRCREV_machine:qemuppc ?= "3b2073418a5b24809440a8f9501c722ebbfc7bbe"
+SRCREV_machine:qemuriscv64 ?= "e135e50901ef56b6edeef2bfcf5d173583aa9189"
+SRCREV_machine:qemuriscv32 ?= "e135e50901ef56b6edeef2bfcf5d173583aa9189"
+SRCREV_machine:qemux86 ?= "e135e50901ef56b6edeef2bfcf5d173583aa9189"
+SRCREV_machine:qemux86-64 ?= "e135e50901ef56b6edeef2bfcf5d173583aa9189"
+SRCREV_machine:qemumips64 ?= "8ef5e337eb3db82d4f25285fb240c316f4506805"
+SRCREV_machine ?= "e135e50901ef56b6edeef2bfcf5d173583aa9189"
+SRCREV_meta ?= "dcf3fae266930708f432bf37ed4668a1ea9c5ac4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.137"
+LINUX_VERSION ?= "5.10.141"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


