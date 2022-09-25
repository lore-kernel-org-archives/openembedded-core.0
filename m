Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294DCC04A95
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:32 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.20389.1664133502368328360
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=EhbkOQ5y;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id c7so4765570pgt.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=vkccllqIQouBkbLE07NbkePq6Gq+chwUkDimSkla3YY=;
        b=EhbkOQ5yiabCgidVh+zUYwrtDb4T8N0udkLlHQp88GaesDt9bP1WlHeI9/SLXXk+nB
         O/GInAHaZWLJ6z70ppOWr1osvSUE2lxEkJKbSbQbYTbUDR8TrMwvRsaNlHHRBiXKMEEp
         IJ/DNdoD3cwOKGu/WVfRXpRkoEhn1KoZ84wvjA1QXI5Gv6YOtp4gH40AmZvE/3lRpBp/
         GEq+y1wVLXLXjDd068Fkejc62IViTJYX0rN90tTGzvp1o+7SQHlJ8gxwBSEFnve+kHY4
         dUraQ6Iu0Sc7aQxUiFA+qNnx8+jiaYlnBfSzLrT//owxmtRVRBQITeixxthaOlbNWYfU
         Cr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vkccllqIQouBkbLE07NbkePq6Gq+chwUkDimSkla3YY=;
        b=g726dcNOv+hLVaPRZz88iOJLG0Mt5VcdlzkNdGB6xuVzDh0Ab09o6VdGn7JyGHqcxC
         MURFZ6uJhlRrgE+OTdJtSi2xErU8/7VFvV5jcOXjAtUc7mSashVmclMiEk13NCAxbyxG
         V0CjjZ/wHf4QOgfT2NKbLXTVDa/G53i2y4tHTN4woqnQC4oBj+JqkTpZTBJ+9hpuwTE6
         l1nvWiRwSW3AuVcEz8AweV2QhaiNJm2x1WBQzN9FrnXVvR41QK2CZZ2Ou7+EU8wMx1k6
         neRtUyXLQ4HTcZcAgOuGcPfcPRJYmjGN10lWGGJ9hRYnJXq1GnbQwvlisEdXWJ2DDIY9
         xycw==
X-Gm-Message-State: ACrzQf0KWc6SIBJLduqTB7Ob5JZwmn9sgB0Ax0p5i7+a+qybIt4dlqNa
	Kiiia26yMepJHeXfeQW8iGXhjxd2a148WjNq
X-Google-Smtp-Source: 
 AMsMyM5RWZ9TmLB+uf/Z6NaiZ4TSdagjB3T7aa26S3j7IzPXzL8yr75sMVZG4hDtCSqBlnswzsNeWA==
X-Received: by 2002:a62:b504:0:b0:538:20ae:bbf2 with SMTP id
 y4-20020a62b504000000b0053820aebbf2mr20019465pfe.79.1664133501051;
        Sun, 25 Sep 2022 12:18:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/33] linux-yocto/5.15: update to v5.15.65
Date: Sun, 25 Sep 2022 09:17:23 -1000
Message-Id: 
 <28d1483d33797404deee4cbc28b19b1b52b822ad.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171026

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    633c3b4c71bb Linux 5.15.65
    572b646c8d93 net: neigh: don't call kfree_skb() under spin_lock_irqsave()
    facf99bc3a95 net/af_packet: check len when min_header_len equals to 0
    591a98b823fb android: binder: fix lockdep check on clearing vma
    92dc4c1a8e58 btrfs: fix space cache corruption and potential double allocations
    55c7a9152734 kprobes: don't call disarm_kprobe() for disabled kprobes
    6a27997cf44e btrfs: tree-checker: check for overlapping extent items
    1b2a7ddeaa77 btrfs: fix lockdep splat with reloc root extent buffers
    98dfad7fb688 btrfs: move lockdep class helpers to locking.c
    a74fc94fb1a9 testing: selftests: nft_flowtable.sh: use random netns names
    1d8b5d251994 netfilter: conntrack: NF_CONNTRACK_PROCFS should no longer default to y
    85dd24ff77c1 drm/amd/display: avoid doing vm_init multiple time
    898467ac9bcb drm/amdgpu: Increase tlb flush timeout for sriov
    4df54c493e76 drm/amd/display: Fix pixel clock programming
    a89e753d5a9f drm/amd/pm: add missing ->fini_microcode interface for Sienna Cichlid
    a2ede313fbf0 ksmbd: don't remove dos attribute xattr on O_TRUNC open
    a7ada939712a s390/hypfs: avoid error message under KVM
    db6fa03d80ab neigh: fix possible DoS due to net iface start/stop loop
    857048ea1d28 ksmbd: return STATUS_BAD_NETWORK_NAME error status if share is not configured
    5ee30bcfdb32 drm/amd/display: clear optc underflow before turn off odm clock
    e407e04a93d7 drm/amd/display: For stereo keep "FLIP_ANY_FRAME"
    2cddd3d0b049 drm/amd/display: Fix HDMI VSIF V3 incorrect issue
    0c8abeceee0f drm/amd/display: Avoid MPC infinite loop
    061ffb1e419b ASoC: sh: rz-ssi: Improve error handling in rz_ssi_probe() error path
    d347d66b1972 fs/ntfs3: Fix work with fragmented xattr
    bf216c168f9e btrfs: fix warning during log replay when bumping inode link count
    985bbad18408 btrfs: add and use helper for unlinking inode during log replay
    968815211212 btrfs: remove no longer needed logic for replaying directory deletes
    7697ca60db06 btrfs: remove root argument from btrfs_unlink_inode()
    71beead997f5 mmc: sdhci-of-dwcmshc: Re-enable support for the BlueField-3 SoC
    68b6cbaa318e mmc: sdhci-of-dwcmshc: rename rk3568 to rk35xx
    c038e4094ba2 mmc: sdhci-of-dwcmshc: add reset call back for rockchip Socs
    d6a74ee2a7b2 mmc: mtk-sd: Clear interrupts when cqe off/disable
    4676773ea117 drm/i915/gt: Skip TLB invalidations once wedged
    f0582f5ac1ea HID: thrustmaster: Add sparco wheel and fix array length
    77f8e40a3cbb HID: asus: ROG NKey: Ignore portion of 0x5a report
    d74ce3ece402 HID: AMD_SFH: Add a DMI quirk entry for Chromebooks
    a569d41c5aba HID: add Lenovo Yoga C630 battery quirk
    b08469874a16 ALSA: usb-audio: Add quirk for LH Labs Geek Out HD Audio 1V5
    c18a209b56e3 mm/rmap: Fix anon_vma->degree ambiguity leading to double-reuse
    a75987714bd2 bpf: Don't redirect packets with invalid pkt_len
    e4ae97295984 ftrace: Fix NULL pointer dereference in is_ftrace_trampoline when ftrace is dead
    34c3dea11895 fbdev: fb_pm2fb: Avoid potential divide by zero error
    a5d1cb908131 net: fix refcount bug in sk_psock_get (2)
    dfd27a737283 HID: hidraw: fix memory leak in hidraw_release()
    f2f6e6752291 media: pvrusb2: fix memory leak in pvr_probe
    e658538c610c udmabuf: Set the DMA mask for the udmabuf device (v2)
    989560b6d9e0 HID: steam: Prevent NULL pointer dereference in steam_{recv,send}_report
    67216f47922d Revert "PCI/portdrv: Don't disable AER reporting in get_port_device_capability()"
    9e38a363dc63 Bluetooth: L2CAP: Fix build errors in some archs
    2e0ffef17308 kbuild: Fix include path in scripts/Makefile.modpost
    e9d7ca0c4640 io_uring: fix UAF due to missing POLLFREE handling
    182dc3aa5ae2 io_uring: fix wrong arm_poll error handling
    6c7259c83773 io_uring: fail links when poll fails
    c41e79a0c464 io_uring: bump poll refs to full 31-bits
    7524ec52caa8 io_uring: remove poll entry from list when canceling all
    95a004a223f8 io_uring: Remove unused function req_ref_put
    f770fba096a6 io_uring: poll rework
    8dc669632f0d io_uring: inline io_poll_complete
    20bbcc316314 io_uring: kill poll linking optimisation
    a85d7ac14f22 io_uring: move common poll bits
    040e58f51c0b io_uring: refactor poll update
    b850d6ddc788 io_uring: clean cqe filling functions
    5c0ea4c8e54b io_uring: correct fill events helpers types
    285e77dbb36f arm64: errata: Add Cortex-A510 to the repeat tlbi list
    da60ddd80d09 mm/hugetlb: avoid corrupting page->mapping in hugetlb_mcopy_atomic_pte
    e7a792dcd6a7 Drivers: hv: balloon: Support status report for larger page sizes
    2edbdfc89d9f crypto: lib - remove unneeded selection of XOR_BLOCKS
    6db913f5e449 firmware: tegra: bpmp: Do only aligned access to IPC memory area
    80d46e73e8d3 drm/vc4: hdmi: Depends on CONFIG_PM
    3d2d12fb7815 drm/vc4: hdmi: Rework power up
    8468ccbf4c44 ACPI: thermal: drop an always true check
    f8b07c05b699 drm/bridge: Add stubs for devm_drm_of_get_bridge when OF is disabled
    3ffb97fce282 mm: Force TLB flush for PFNMAP mappings before unlink_file_vma()
    1ded0ef2419e Linux 5.15.64
    4f672112f866 bpf: Don't use tnum_range on array range checking for poke descriptors
    cd2a50d0a097 scsi: storvsc: Remove WQ_MEM_RECLAIM from storvsc_error_wq
    2c72bead9bc6 scsi: ufs: core: Enable link lost interrupt
    da86f80da31a perf stat: Clear evsel->reset_group for each stat run
    b5f5fee03d17 perf/x86/intel/ds: Fix precise store latency handling
    83bd6d121245 perf/x86/intel/uncore: Fix broken read_counter() for SNB IMC PMU
    a38e7ab46740 perf python: Fix build when PYTHON_CONFIG is user supplied
    77864ed6c6ce blk-mq: fix io hung due to missing commit_rqs
    4428d15cddd5 Documentation/ABI: Mention retbleed vulnerability info file for sysfs
    992d2fc2fe7f x86/nospec: Fix i386 RSB stuffing
    577d9c05cc48 binder_alloc: add missing mmap_lock calls when using the VMA
    1ed630bc530a arm64: Fix match_list for erratum 1286807 on Arm Cortex-A76
    af61a8f76039 mptcp: Fix crash due to tcp_tsorted_anchor was initialized before release skb
    661c01b2181d md: call __md_stop_writes in md_stop
    ee0c613bfe83 Revert "md-raid: destroy the bitmap after destroying the thread"
    0038f8593325 mm/hugetlb: fix hugetlb not supporting softdirty tracking
    6ee82524b0aa Revert "usbnet: smsc95xx: Forward PHY interrupts to PHY driver to avoid polling"
    7ae43647f499 Revert "usbnet: smsc95xx: Fix deadlock on runtime resume"
    295219ab7d62 io_uring: fix issue with io_write() not always undoing sb_start_write()
    f8aafb25ec38 riscv: traps: add missing prototype
    c2b7bae7c900 xen/privcmd: fix error exit of privcmd_ioctl_dm_op()
    0351fdbd8cb4 smb3: missing inode locks in punch hole
    3640cdccbe75 nouveau: explicitly wait on the fence in nouveau_bo_move_m2mf
    b490dfcbb921 ACPI: processor: Remove freq Qos request for all CPUs
    f1aedd2ffead Revert "memcg: cleanup racy sum avoidance code"
    ebd6f886aa24 fbdev: fbcon: Properly revert changes when vc_resize() failed
    8195e065abf3 s390: fix double free of GS and RI CBs on fork() failure
    16a12ee619e3 bootmem: remove the vmemmap pages from kmemleak in put_page_bootmem
    9227599cd987 s390/mm: do not trigger write fault when vma does not allow VM_WRITE
    ddcb0696136b mm/damon/dbgfs: avoid duplicate context directory creation
    95587037ea58 asm-generic: sections: refactor memory_intersects
    f96b9f7c1676 writeback: avoid use-after-free after removing device
    0455bef69028 loop: Check for overflow while configuring loop
    500195a109bc x86/nospec: Unwreck the RSB stuffing
    75fa6c733b85 x86/bugs: Add "unknown" reporting for MMIO Stale Data
    a7484eb9f3e0 x86/unwind/orc: Unwind ftrace trampolines with correct ORC entry
    1cdfef6cd296 perf/x86/lbr: Enable the branch type for the Arch LBR by default
    5f52402c7701 btrfs: fix possible memory leak in btrfs_get_dev_args_from_path()
    793505888d60 btrfs: check if root is readonly while setting security xattr
    2aa1a1cff81d btrfs: add info when mount fails due to stale replace target
    17343a515fa5 btrfs: replace: drop assert for suspended replace
    34cab3bba8ca btrfs: fix silent failure when deleting root reference
    50396e19d9d8 net: stmmac: work around sporadic tx issue on link-up
    48f4d54ccc4d ionic: VF initial random MAC address if no assigned mac
    bcbf1d959933 ionic: fix up issues with handling EAGAIN on FW cmds
    9a41433cc73b ionic: clear broken state on generation change
    8d2761dbfcb9 ionic: widen queue_lock use around lif init and deinit
    2bc769b8edb1 rxrpc: Fix locking in rxrpc's sendmsg
    0c3fd13b9c6d i40e: Fix incorrect address type for IPv6 flow rules
    bda3e3892434 ixgbe: stop resetting SYSTIME in ixgbe_ptp_start_cyclecounter
    cb9eaedd9fc0 net: Fix a data-race around sysctl_somaxconn.
    b340f83dafba net: Fix data-races around sysctl_devconf_inherit_init_net.
    181bae6dff66 net: Fix data-races around sysctl_fb_tunnels_only_for_init_net.
    ed14f10e13f6 net: Fix a data-race around netdev_budget_usecs.
    70564ad8d190 net: Fix data-races around sysctl_max_skb_frags.
    289f2f582667 mptcp: stop relying on tcp_tx_skb_cache
    a07f3af6393a tcp: expose the tcp_mark_push() and tcp_skb_entail() helpers
    2baeaef4dd73 net: Fix a data-race around netdev_budget.
    8e9e124aeb9c net: Fix a data-race around sysctl_net_busy_read.
    4e12829fd3b9 net: Fix a data-race around sysctl_net_busy_poll.
    f6b5be42ce4b net: Fix a data-race around sysctl_tstamp_allow_data.
    d39a02760bf2 net: Fix data-races around sysctl_optmem_max.
    0db9ce822f13 ratelimit: Fix data-races in ___ratelimit().
    cd755a7e4062 net: Fix data-races around netdev_tstamp_prequeue.
    4d2c808d0983 net: Fix data-races around netdev_max_backlog.
    572d4cdf907f net: Fix data-races around weight_p and dev_weight_[rt]x_bias.
    33372f2b6c6d net: Fix data-races around sysctl_[rw]mem_(max|default).
    8fbdec08dbf7 netfilter: flowtable: fix stuck flows on cleanup due to pending work
    eb6645a0f2ca netfilter: flowtable: add function to invoke garbage collection immediately
    51f192ae71c3 netfilter: nf_tables: disallow binding to already bound chain
    7196f4577f1c netfilter: nf_tables: disallow jump to implicit chain from set element
    4097749aec54 netfilter: nf_tables: upfront validation of data via nft_data_init()
    cc311eae1f30 netfilter: bitwise: improve error goto labels
    9bf98120a943 netfilter: nft_cmp: optimize comparison for 16-bytes
    c5ba86cde6bb netfilter: nf_tables: consolidate rule verdict trace call
    b6d601211ce4 netfilter: nft_tunnel: restrict it to netdev family
    530f4bb9ed58 netfilter: nft_osf: restrict osf to ipv4, ipv6 and inet families
    6d7ddee50395 netfilter: nf_tables: do not leave chain stats enabled on error
    cafe94e8d685 netfilter: nft_payload: do not truncate csum_offset and csum_type
    fbbecf068a3f netfilter: nft_payload: report ERANGE for too long offset and length
    fbaeb8046e7d netfilter: nf_tables: make table handle allocation per-netns friendly
    9f4b32890768 netfilter: nf_tables: disallow updates of implicit chain
    acca44ec232a bnxt_en: fix NQ resource accounting during vf creation on 57500 chips
    1b2c5428f773 netfilter: ebtables: reject blobs that don't provide all entry points
    7a5d10afeb1b net: ipvtap - add __init/__exit annotations to module init/exit funcs
    fec37fe2f278 bonding: 802.3ad: fix no transmission of LACPDUs
    aa108c97acf1 net: moxa: get rid of asymmetry in DMA mapping/unmapping
    c9dabd1f0410 net: phy: Don't WARN for PHY_READY state in mdio_bus_phy_resume()
    c4b38473b18e net: ipa: don't assume SMEM is page-aligned
    f7de12f247bb net/mlx5e: Fix wrong tc flag used when set hw-tc-offload off
    3f8608199640 net/mlx5e: Fix wrong application of the LRO state
    e161c24a92ef net/mlx5: Avoid false positive lockdep warning by adding lock_class_key
    0782959b92eb net/mlx5e: Properly disable vlan strip on non-UL reps
    fe76b3e67466 ice: xsk: prohibit usage of non-balanced queue id
    141b795ee39e ice: xsk: Force rings to be sized to power of 2
    9c34c33893db nfc: pn533: Fix use-after-free bugs caused by pn532_cmd_timeout
    2e8b65fda933 r8152: fix the RX FIFO settings when suspending
    59cfae681ffb r8152: fix the units of some registers for RTL8156A
    9cf85759e104 rose: check NULL rose_loopback_neigh->loopback
    e1ae035a5663 ntfs: fix acl handling
    d28f319043f0 mm/smaps: don't access young/dirty bit if pte unpresent
    28dccc4eaf98 SUNRPC: RPC level errors should set task->tk_rpc_status
    5626f9535611 NFSv4.2 fix problems with __nfs42_ssc_open
    519543a64650 NFS: Don't allocate nfs_fattr on the stack in __nfs42_ssc_open()
    84dc68c6140c Revert "net: macsec: update SCI upon MAC address change."
    c3f4f07a9eb1 net: use eth_hw_addr_set() instead of ether_addr_copy()
    770afc6e262b fs: require CAP_SYS_ADMIN in target namespace for idmapped mounts
    96f2758a6d02 xfrm: policy: fix metadata dst->dev xmit null pointer dereference
    103bd319c0fc af_key: Do not call xfrm_probe_algs in parallel
    4edd868acd23 xfrm: clone missing x->lastused in xfrm_do_migrate
    26ad2398fe49 xfrm: fix refcount leak in __xfrm_policy_check()
    044f8ff30e62 riscv: lib: uaccess: fix CSR_STATUS SR_SUM bit
    093cb743dcad riscv: lib: uaccess: fold fixups into body
    9de35edff035 btrfs: remove unnecessary parameter delalloc_start for writepage_delalloc()
    da7ad2ec580b btrfs: pass the dentry to btrfs_log_new_name() instead of the inode
    90b9e4892704 btrfs: put initial index value of a directory in a constant
    4438d54ce7a8 scsi: qla2xxx: edif: Fix dropped IKE message
    bcfe37c78854 scsi: qla2xxx: Fix response queue handler reading stale packets
    799e39edb0a8 drivers/base: fix userspace break from using bin_attributes for cpumap and cpulist
    75260fa268e1 Input: i8042 - add additional TUXEDO devices to i8042 quirk tables
    d6351dfe846c Input: i8042 - add TUXEDO devices to i8042 quirk tables
    e7d46453410d Input: i8042 - merge quirk tables
    0b0ee46bf65e Input: i8042 - move __initconst to fix code styling warning
    057238cdce45 btrfs: convert count_max_extents() to use fs_info->max_extent_size
    1aa262c1d056 btrfs: replace BTRFS_MAX_EXTENT_SIZE with fs_info->max_extent_size
    f675e3ae67e4 btrfs: zoned: revive max_zone_append_bytes
    1815305d8199 block: add bdev_max_segments() helper
    dd2ee2fd1fcb block: add a bdev_max_zone_append_sectors helper
    a50d9fde4616 x86/entry: Move CLD to the start of the idtentry macro
    108fb7e99bbf kernel/sys_ni: add compat entry for fadvise64_64
    7c83923031cd parisc: Fix exception handler for fldw and fstw instructions
    6efe7754e05d parisc: Make CONFIG_64BIT available for ARCH=parisc64 only
    f49fd5fe2399 cgroup: Fix race condition at rebind_subsystems()
    5c192867ae57 audit: fix potential double free on error path from fsnotify_add_inode_mark
    edd6e98a752c eth: sun: cassini: remove dead code
    b51ca7326d16 wifi: rtlwifi: remove always-true condition pointed out by GCC 12

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 104217e05ea494d46e3cc22bb4b3bf2379004882)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 491ad581eb..1144cf1bfd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bd0d026c3b3f16f17e7cce662d0f3445bf2e0ff3"
-SRCREV_meta ?= "8fa8d5e477034473ed7532fe20006b5f2bc87aa0"
+SRCREV_machine ?= "4c435c4647d58aa41f423efb1fc461dafc70b619"
+SRCREV_meta ?= "cbf9741b1cbc3e22bbe17f4e20920df4f46eb4d3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.63"
+LINUX_VERSION ?= "5.15.65"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index daa9a5da1e..a9f32bd5d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.63"
+LINUX_VERSION ?= "5.15.65"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8c746c932d6fea7adb9ca3cb26e0ada2bc07692d"
-SRCREV_meta ?= "8fa8d5e477034473ed7532fe20006b5f2bc87aa0"
+SRCREV_machine ?= "27747392d509aa1562545466cfecb627557676b2"
+SRCREV_meta ?= "cbf9741b1cbc3e22bbe17f4e20920df4f46eb4d3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index ad5998f9b1..cbe3f0b0dc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "56410660d15b6bb785a6569bfbb6bdd2de3fd490"
-SRCREV_machine:qemuarm64 ?= "495078c5c3b85396123957716d27e3c6e76e55bc"
-SRCREV_machine:qemumips ?= "91cbf6ccca019d98f15fa742c0ee043f82023499"
-SRCREV_machine:qemuppc ?= "8a5e533a94fe71a62ba5149ba8e9600992178715"
-SRCREV_machine:qemuriscv64 ?= "5b83bd12dfbee299506e0c39aea3343f47a6f8c7"
-SRCREV_machine:qemuriscv32 ?= "5b83bd12dfbee299506e0c39aea3343f47a6f8c7"
-SRCREV_machine:qemux86 ?= "5b83bd12dfbee299506e0c39aea3343f47a6f8c7"
-SRCREV_machine:qemux86-64 ?= "5b83bd12dfbee299506e0c39aea3343f47a6f8c7"
-SRCREV_machine:qemumips64 ?= "06a0a76ce428c1d13a680dd9a58dc123714d164c"
-SRCREV_machine ?= "5b83bd12dfbee299506e0c39aea3343f47a6f8c7"
-SRCREV_meta ?= "8fa8d5e477034473ed7532fe20006b5f2bc87aa0"
+SRCREV_machine:qemuarm ?= "86cc7ffeba75d76077270ba98ff84cb48b7134ca"
+SRCREV_machine:qemuarm64 ?= "9ce45e4f8bd9fcccbee7e97873753a8a9ea49ba6"
+SRCREV_machine:qemumips ?= "c82ae040723f1c19c76d1ae263945b46af2a58fb"
+SRCREV_machine:qemuppc ?= "4b4bfed43fcd28ddaa55d518f56dd35dc66286d3"
+SRCREV_machine:qemuriscv64 ?= "9399d814f017335d9b8e310bcd4000c0722619fc"
+SRCREV_machine:qemuriscv32 ?= "9399d814f017335d9b8e310bcd4000c0722619fc"
+SRCREV_machine:qemux86 ?= "9399d814f017335d9b8e310bcd4000c0722619fc"
+SRCREV_machine:qemux86-64 ?= "9399d814f017335d9b8e310bcd4000c0722619fc"
+SRCREV_machine:qemumips64 ?= "f165a8d9cead8022974a88435c9ca4e69c697be9"
+SRCREV_machine ?= "9399d814f017335d9b8e310bcd4000c0722619fc"
+SRCREV_meta ?= "cbf9741b1cbc3e22bbe17f4e20920df4f46eb4d3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "addc9003c2e895fe8a068a66de1de6fdb4c6ac60"
+SRCREV_machine:class-devupstream ?= "633c3b4c71bb949de771388de213d331c1ebd270"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.63"
+LINUX_VERSION ?= "5.15.65"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


