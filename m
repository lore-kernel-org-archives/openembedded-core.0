Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E670FC48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 22:35:16 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.7216.1708986908314558153
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 14:35:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JGXemsIu;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c1a172e46bso945770b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708986907; x=1709591707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j27l5XXfTRiR/x+Kg4jEdtCv3PZ0mz6d6X5KYnPP05U=;
        b=JGXemsIuuJlEPEahgz6xUZwc2Ykc7EnpQGoye2jDR+eN5lw9iKssE1KojOp5/cVbXL
         Z1CtgfoBdnB44lfbgXdOkj0ZZ/d/2kPEVQvC90rDwQUT9OPQLkefSg5Jx03+aSUGEps6
         7fs92WGgOsjQrch1e9e1lHcYBTMiYcU8ofjRrO4OnOPH3X9lyeccmyrTqlf5+CBkkAYr
         tm9RsPbFNKnHAyATGeXseBJNtW4RNxWdcpmS22BUphnkvxY0slXzREwWiS/UCQl+y7fv
         yXVamvWM6qO7jjYNkJfAhhtB8shAtRo15aLtPnVnwJFVaMcc5CIQPBSD7m4sq3kgIIkG
         8XRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708986907; x=1709591707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j27l5XXfTRiR/x+Kg4jEdtCv3PZ0mz6d6X5KYnPP05U=;
        b=iDY4sQehhXG0/2SDt4nVD8sc0cSr+rM5AOvsW9T8mKnPI4nhxOBxaggad2Ru0zSrUt
         /48isckTnqmzyjK0D5WowWKabbOPcAldsna2DL6VQCJ5DHD1NtGPFM6o4lCM9BQegQ1g
         NdF3LBDCRHcv3kOmjdMB3oBhbJDLdmOGEHG44DAp0GDenXG7FKjhFZ1ffQM92UNPEm0O
         Kdrgcl7i20fGuc8mv+8AacDniwPsfTGtoW8D/SkG7MpLE5+M1peI9Nj7gvJJwEW41ldM
         usi8wYURNKiVA8UOST0uX+d2VnKXPmIKk1p55LIyDWgqijta+TQlxpvTu8vT/HMQObdl
         vicA==
X-Gm-Message-State: AOJu0Yz4SBtWtwCPXlGT2PLJT05LYV/ig2yvYm0j1lrVPrWfoIzDrbRX
	vZiJU7A5ZqUbdHfEu5r13eVOgpsZoChSYpN/sA/G0DnDZH6dFEmjwGGS346+
X-Google-Smtp-Source: AGHT+IFeB5o3XkO9KYeyYW2I4MqxRAOpGlGxVz1IMBRUd8XZl4EqFXfURyofuW6iyIxK5mZgYau/oQ==
X-Received: by 2002:a05:6808:14d0:b0:3c1:a9b5:612f with SMTP id f16-20020a05680814d000b003c1a9b5612fmr603826oiw.10.1708986907252;
        Mon, 26 Feb 2024 14:35:07 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id qj24-20020a056214321800b0068f9fd1d688sm3422091qvb.21.2024.02.26.14.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 14:35:06 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/6.6: update to v6.6.18
Date: Mon, 26 Feb 2024 17:34:52 -0500
Message-Id: <7478453d2b9a26819cf5e6a3ad673f408a8d4d21.1708986570.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708986570.git.bruce.ashfield@gmail.com>
References: <cover.1708986570.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 22:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196229

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    d8a27ea2c986 Linux 6.6.18
    9e083726d5e3 tracing: Fix a NULL vs IS_ERR() bug in event_subsystem_dir()
    9389eaaca7b9 tracing: Make system_callback() function static
    cec85aa54b12 Documentation/arch/ia64/features.rst: fix kernel-feat directive
    ccce12ecf2a7 x86/barrier: Do not serialize MSR accesses on AMD
    438d19492b7f dm: limit the number of targets and parameter size area
    2c3bdba00283 nilfs2: fix potential bug in end_buffer_async_write
    c20fc13082d1 of: property: Add in-ports/out-ports support to of_graph_get_port_parent()
    b6a2a9cbb675 sched/membarrier: reduce the ability to hammer on sys_membarrier
    0a962f2fbaa9 x86/efistub: Use 1:1 file:memory mapping for PE/COFF .compat section
    686b58ce5052 x86/boot: Increase section and file alignment to 4k/512
    f7eedad78068 x86/boot: Split off PE/COFF .data section
    476316bb48c1 x86/boot: Drop PE/COFF .reloc section
    0db81e8e20f6 x86/boot: Construct PE/COFF .text section from assembler
    0cf3d613a141 x86/boot: Derive file size from _edata symbol
    c731fbcfdbb6 x86/boot: Define setup size in linker script
    431b39e62594 x86/boot: Set EFI handover offset directly in header asm
    8e102324e743 x86/boot: Grab kernel_info offset from zoffset header directly
    a38801ba1875 x86/boot: Drop references to startup_64
    08796fc9bfe2 x86/boot: Drop redundant code setting the root device
    4bac079dba04 x86/boot: Omit compression buffer from PE/COFF image memory footprint
    d9b6b6e8d871 x86/boot: Remove the 'bugger off' message
    e17a8bf1fb5d x86/efi: Drop alignment flags from PE section headers
    8117961d98fb x86/efi: Disregard setup header of loaded image
    fa244085025f x86/efi: Drop EFI stub .bss from .data section
    940c919be813 nfsd: don't take fi_lock in nfsd_break_deleg_cb()
    a49e9c7267d0 eventfs: Keep all directory links at 1
    9bb8131a9ff9 eventfs: Remove fsnotify*() functions from lookup()
    ed823ca4bcf3 eventfs: Restructure eventfs_inode structure to be more condensed
    5c3ea7dfef17 eventfs: Warn if an eventfs_inode is freed without is_freed being set
    5dfb04100326 eventfs: Get rid of dentry pointers without refcounts
    c46192051c20 eventfs: Clean up dentry ops and add revalidate function
    ca2d3b2c260d eventfs: Remove unused d_parent pointer field
    21faa3de640d tracefs: dentry lookup crapectomy
    4928d0e32228 tracefs: Avoid using the ei->dentry pointer unnecessarily
    d1bcde94223e eventfs: Initialize the tracefs inode properly
    f0686a194549 tracefs: Zero out the tracefs_inode when allocating it
    35e219f7cd36 tracefs: remove stale update_gid code
    9a187657d681 eventfs: Save directory inodes in the eventfs_inode structure
    1f20155a724c eventfs: Use kcalloc() instead of kzalloc()
    c55d11ea8e07 eventfs: Do not create dentries nor inodes in iterate_shared
    4e8731d20fba eventfs: Have the inodes all for files and directories all be the same
    e638899f9963 eventfs: Shortcut eventfs_iterate() by skipping entries already read
    f3f41f444b32 eventfs: Read ei->entries before ei->children in eventfs_iterate()
    82820a2d76cc eventfs: Do ctx->pos update for all iterations in eventfs_iterate()
    98102764cca9 eventfs: Have eventfs_iterate() stop immediately if ei->is_freed is set
    628adb842bd5 tracefs/eventfs: Use root and instance inodes as default ownership
    1bfdd54adbb8 eventfs: Stop using dcache_readdir() for getdents()
    ee699b547b63 eventfs: Remove "lookup" parameter from create_dir/file_dentry()
    ee3bde693ee8 eventfs: Fix bitwise fields for "is_events"
    f6bf29570034 tracefs: Check for dentry->d_inode exists in set_gid()
    1b4dfdb3274a eventfs: Fix file and directory uid and gid ownership
    4d12a83ecdb6 eventfs: Have event files and directories default to parent uid and gid
    53cd8c57cc73 eventfs: Fix events beyond NAME_MAX blocking tasks
    6eee5c670861 eventfs: Make sure that parent->d_inode is locked in creating files/dirs
    29bb70cad668 eventfs: Do not allow NULL parent to eventfs_start_creating()
    43fbddf34c3c eventfs: Move taking of inode_lock into dcache_dir_open_wrapper()
    6586a12d3f02 eventfs: Use GFP_NOFS for allocation when eventfs_mutex is held
    7b4cb5d59f3e eventfs: Do not invalidate dentry in create_file/dir_dentry()
    b1391e3653f5 eventfs: Remove expectation that ei->is_freed means ei->dentry == NULL
    74a9e56b682f eventfs: Use simple_recursive_removal() to clean up dentries
    fb9b8eea5d21 eventfs: Remove special processing of dput() of events directory
    c58673cad4e9 eventfs: Delete eventfs_inode when the last dentry is freed
    1a6edfc7be2f eventfs: Hold eventfs_mutex when calling callback functions
    32f4c167cbef eventfs: Save ownership and mode
    d2a632aeecc4 eventfs: Test for ei->is_freed when accessing ei->dentry
    6e2a33522ee7 eventfs: Have a free_ei() that just frees the eventfs_inode
    4bb123ce29cd eventfs: Remove "is_freed" union with rcu head
    773cd7dfd092 eventfs: Fix kerneldoc of eventfs_remove_rec()
    810a957e343b eventfs: Remove extra dget() in eventfs_create_events_dir()
    7cac392f5640 eventfs: Fix typo in eventfs_inode union comment
    f7842e0617ff eventfs: Fix WARN_ON() in create_file_dentry()
    843879a6ddd9 tracefs/eventfs: Modify mismatched function name
    c99e5cfe77e5 eventfs: Fix failure path in eventfs_create_events_dir()
    17e4e4d2335c eventfs: Use ERR_CAST() in eventfs_create_events_dir()
    bceba0d35b43 eventfs: Use eventfs_remove_events_dir()
    35ee34c0f6d5 eventfs: Remove eventfs_file and just use eventfs_inode
    4015fc492774 Revert "eventfs: Remove "is_freed" union with rcu head"
    dc9ee9a8aef8 Revert "eventfs: Save ownership and mode"
    65a54d6dbf3b Revert "eventfs: Delete eventfs_inode when the last dentry is freed"
    601daf7e31d8 Revert "eventfs: Use simple_recursive_removal() to clean up dentries"
    5e9fb476196d Revert "eventfs: Check for NULL ef in eventfs_set_attr()"
    6fdc0bcd066d Revert "eventfs: Do not allow NULL parent to eventfs_start_creating()"
    fa69a8063f8b parisc: Fix random data corruption from exception handler
    4480ead69a3a netfilter: ipset: Missing gc cancellations fixed
    b93a6756a01f netfilter: ipset: fix performance regression in swap operation
    b2261c2e763e block: fix partial zone append completion handling in req_bio_endio()
    56f98598ddf0 md: bypass block throttle for superblock update
    49bca0710ebe tracing: Inform kmemleak of saved_cmdlines allocation
    ab94509051ea tracing: Fix HAVE_DYNAMIC_FTRACE_WITH_REGS ifdef
    5d858e2d3eca fs/proc: do_task_stat: move thread_group_cputime_adjusted() outside of lock_task_sighand()
    63e2bd10a89a pmdomain: core: Move the unused cleanup to a _sync initcall
    f84e7534457d can: j1939: Fix UAF in j1939_sk_match_filter during setsockopt(SO_J1939_FILTER)
    26dfe112ec2e can: j1939: prevent deadlock by changing j1939_socks_lock to rwlock
    6019c77391a6 can: netlink: Fix TDCO calculation using the old data bittiming
    23429e2c33dd of: property: fix typo in io-channels
    7366ff7ca1c7 docs: kernel_feat.py: fix build error for missing files
    601b5540c154 blk-wbt: Fix detection of dirty-throttled tasks
    496273439b3c LoongArch: Fix earlycon parameter if KASAN enabled
    4d850ed74740 mm: hugetlb pages should not be reserved by shmat() if SHM_NORESERVE
    13c5a9fb0710 fs,hugetlb: fix NULL pointer dereference in hugetlbs_fill_super
    ae20db45e482 ceph: prevent use-after-free in encode_cap_msg()
    a71302c86389 hv_netvsc: Register VF in netvsc_probe if NET_DEVICE_REGISTER missed
    9680b2ab54ba net: stmmac: protect updates of 64-bit statistics counters
    1b1631895e40 pmdomain: renesas: r8a77980-sysc: CR7 must be always on
    3dbf262ab0c1 net: ethernet: ti: cpsw_new: enable mac_managed_pm to fix mdio
    a1b4ed4125ca s390/qeth: Fix potential loss of L3-IP@ in case of network issues
    d59e1c2fbd76 net: ethernet: ti: cpsw: enable mac_managed_pm to fix mdio
    31f71f2d7a08 fs: relax mount_setattr() permission checks
    02afaeb6c52b tools/rtla: Fix Makefile compiler options for clang
    f0542eb7122e tools/rtla: Fix uninitialized bucket/data->bucket_size warning
    7c3611ca86f1 tools/rtla: Exit with EXIT_SUCCESS when help is invoked
    8a585914c266 tools/rtla: Fix clang warning about mount_point var size
    daa5e6a4a8b4 tools/rtla: Replace setting prio with nice for SCHED_OTHER
    a71597b4e5c7 tools/rtla: Remove unused sched_getattr() function
    828be9ff1770 tools/rv: Fix Makefile compiler options for clang
    2863f8cf9f56 tools/rv: Fix curr_reactor uninitialized variable
    62a1b9b6343e ASoC: amd: yc: Add DMI quirk for Lenovo Ideapad Pro 5 16ARP8
    eb06fca2c740 ASoC: tas2781: add module parameter to tascodec_init()
    1be2669565b3 ASoC: SOF: IPC3: fix message bounds on ipc ops
    19758688bd05 arm64: Subscribe Microsoft Azure Cobalt 100 to ARM Neoverse N2 errata
    60480c6bc160 arm64/signal: Don't assume that TIF_SVE means we saved SVE state
    4796a1a41300 mmc: sdhci-pci-o2micro: Fix a warm reboot issue that disk can't be detected by BIOS
    6d5eae9a95fe zonefs: Improve error handling
    3d16cebf0112 KVM: arm64: Fix circular locking dependency
    4145ccff546e smb: Fix regression in writes when non-standard maximum write size negotiated
    c2aa2718cda2 smb: client: set correct id, uid and cruid for multiuser automounts
    e5643b23cbb0 thunderbolt: Fix setting the CNS bit in ROUTER_CS_5
    65ac3a4fee03 irqchip/gic-v3-its: Fix GICv4.1 VPE affinity update
    91a80fff3eee irqchip/gic-v3-its: Restore quirk probing for ACPI-based systems
    5fcc75e44de5 irqchip/irq-brcmstb-l2: Add write memory barrier before exit
    00f4eb31b819 wifi: iwlwifi: mvm: fix a crash when we run out of stations
    e700e44fd2cc wifi: mac80211: reload info pointer in ieee80211_tx_dequeue()
    6585c74b4faa wifi: cfg80211: fix wiphy delayed work queueing
    ab9d4bb9a189 wifi: iwlwifi: fix double-free bug
    080da821b2c5 nfp: flower: prevent re-adding mac index for bonded port
    d194f1c73160 nfp: enable NETDEV_XDP_ACT_REDIRECT feature flag
    0bb84600c23c nfp: use correct macro for LengthSelect in BAR config
    9c82920359b7 crypto: algif_hash - Remove bogus SGL free on zero-length error path
    88aa493f393d crypto: ccp - Fix null pointer dereference in __sev_platform_shutdown_locked
    ea5ddbc11613 nilfs2: fix hang in nilfs_lookup_dirty_data_buffers()
    2e1480538ef6 nilfs2: fix data corruption in dsync block recovery for small block sizes
    af8625f713a4 ALSA: hda/realtek: add IDs for Dell dual spk platform
    53447b46a64e ALSA: hda/conexant: Add quirk for SWS JS201D
    027df06c2915 ALSA: hda/realtek: fix mute/micmute LED For HP mt645
    224378140269 mmc: slot-gpio: Allow non-sleeping GPIO ro
    13b01aedb585 io_uring/net: fix multishot accept overflow handling
    1dc09ca85871 x86/mm/ident_map: Use gbpages only where full GB page should be mapped.
    b8525dced380 KVM: x86/pmu: Fix type length error when reading pmu->fixed_ctr_ctrl
    eea9b2e0d222 KVM: x86: make KVM_REQ_NMI request iff NMI pending for vcpu
    b2479ab426ce x86/fpu: Stop relying on userspace for info to fault in xsave buffer
    97b37ffbcebe x86/Kconfig: Transmeta Crusoe is CPU family 5, not 6
    536006966678 serial: mxs-auart: fix tx
    ab288bbaedcc serial: core: introduce uart_port_tx_flags()
    760f0f9d85fe powerpc/pseries: fix accuracy of stolen time
    7fec35ffce05 powerpc/cputable: Add missing PPC_FEATURE_BOOKE on PPC64 Book-E
    1b5181cb4b30 powerpc/64: Set task pt_regs->link to the LR value on scv entry
    b1ac5b885cf3 ftrace: Fix DIRECT_CALLS to use SAVE_REGS by default
    24ea2c4d4864 serial: max310x: prevent infinite while() loop in port startup
    89992713f364 serial: max310x: fail probe if clock crystal is unstable
    2655f0892c04 serial: max310x: improve crystal stable clock detection
    8c6df38c7033 serial: max310x: set default value when reading clock ready bit
    8663564114d1 nfp: flower: fix hardware offload for the transfer layer port
    15392de705e7 nfp: flower: add hardware offload check for post ct entry
    0dc6bc63d9ec net: dsa: mv88e6xxx: Fix failed probe due to unsupported C45 reads
    f5f6332f1870 ring-buffer: Clean ring_buffer_poll_wait() error return
    22a77c0f5b82 hv_netvsc: Fix race condition between netvsc_probe and netvsc_remove
    482cda9e50de drm/amd/display: Preserve original aspect ratio in create stream
    7fc395f0f562 drm/amd/display: Increase frame-larger-than for all display_mode_vba files
    7407c61f43b6 drm/amd/display: Fix MST Null Ptr for RV
    b476ae1da136 drm/amdgpu/soc21: update VCN 4 max HEVC encoding resolution
    4ff8ec01a865 drm/prime: Support page array >= 4GB
    b9e373ed8d9c drm/amd/display: Add align done check
    c96a494c9b0f drm/msm: Wire up tlb ops
    6cef4e68777b ksmbd: free aux buffer if ksmbd_iov_pin_rsp_read fails
    93136132d1b5 media: rc: bpf attach/detach requires write permission
    f83b9abee9fa pmdomain: mediatek: fix race conditions with genpd
    5894212f3abf iio: pressure: bmp280: Add missing bmp085 to SPI id table
    28639eea710c iio: imu: bno055: serdev requires REGMAP
    68f2bdcbd7db iio: imu: adis: ensure proper DMA alignment
    c0f2ab954b02 iio: adc: ad_sigma_delta: ensure proper DMA alignment
    54e67b77be3a iio: accel: bma400: Fix a compilation problem
    e0cb5cc558f0 iio: commom: st_sensors: ensure proper DMA alignment
    b90126c86d83 iio: core: fix memleak in iio_device_register_sysfs
    1d8c67e94e9e iio: magnetometer: rm3100: add boundary check for the value read from RM3100_REG_TMRC
    f83ec2ee91d0 staging: iio: ad5933: fix type mismatch regression
    5ad73e1056a6 Revert "workqueue: Override implicit ordered attribute in workqueue_apply_unbound_cpumask()"
    d76792931185 tracing/probes: Fix to search structure fields correctly
    ebc1972c2c89 tracing/probes: Fix to set arg size and fmt after setting type from BTF
    d5889a68522c tracing/probes: Fix to show a parse error for bad type for $comm
    ac9a1c3bcd45 tracing/synthetic: Fix trace_string() return value
    6e48f4c61673 tracing: Fix wasted memory in saved_cmdlines logic
    5f703935fdb5 tracing/timerlat: Move hrtimer_init to timerlat_fd open()
    aafdc920d70d ext4: avoid bb_free and bb_fragments inconsistency in mb_free_blocks()
    2883940b19c3 ext4: fix double-free of blocks due to wrong extents moved_len
    e3c4e10e3a79 misc: fastrpc: Mark all sessions as invalid in cb_remove
    a7ae586f6f60 binder: signal epoll threads of self-work
    53953faf9180 ALSA: hda/realtek: fix mute/micmute LEDs for HP ZBook Power
    39ca594f8098 ALSA: hda/cs8409: Suppress vmaster control for Dolphin models
    4629bf52d952 ASoC: codecs: wcd938x: handle deferred probe
    ea102272ffa2 ALSA: hda/realtek - Add speaker pin verbtable for Dell dual speaker platform
    24a98774dc8d ALSA: hda/realtek: Enable headset mic on Vaio VJFE-ADL
    d83d6f66bb3a usb: typec: tpcm: Fix issues with power being removed during reset
    32bfb13db982 modpost: Add '.ltext' and '.ltext.*' to TEXT_SECTIONS
    6cddb7a4d78c linux/init: remove __memexit* annotations
    fd06e32ea464 um: Fix adding '-no-pie' for clang
    2dc2b0a42aaf xen-netback: properly sync TX responses
    54944f45470a parisc: BTLB: Fix crash when setting up BTLB at CPU bringup
    2524299b6106 net: stmmac: do not clear TBS enable bit on link up/down
    923dea2a7ea9 net: hsr: remove WARN_ONCE() in send_hsr_supervision_frame()
    16d3f507b0fa nfc: nci: free rx_data_reassembly skb on NCI device cleanup
    04c0dbdba3b0 kbuild: Fix changing ELF file type for output of gen_btf for big endian
    0f48dea0926d ALSA: hda/realtek: Apply headset jack quirk for non-bass alc287 thinkpads
    1a2f08576e30 firewire: core: correct documentation of fw_csr_string() kernel API
    6d2a97b7b6f2 lsm: fix the logic in security_inode_getsecctx()
    8df43e53f2f7 lsm: fix default return value of the socket_getpeersec_*() hooks
    38fd4dfa2764 drm/amd: Don't init MEC2 firmware when it fails to load
    8983397951b4 drm/amdgpu: Reset IH OVERFLOW_CLEAR bit
    0b1d4187c2df drm/virtio: Set segment size for virtio_gpu device
    c99d215c0c0f connector/cn_proc: revert "connector: Fix proc_event_num_listeners count not cleared"
    56a19b790f57 Revert "drm/msm/gpu: Push gpu lock down past runpm"
    caa2565a2e13 Revert "drm/amd: flush any delayed gfxoff on suspend entry"
    2996c7e97ea7 scsi: Revert "scsi: fcoe: Fix potential deadlock on &fip->ctlr_lock"
    889a5f329e47 media: Revert "media: rkisp1: Drop IRQF_SHARED"
    9978d5b744e0 Revert "powerpc/pseries/iommu: Fix iommu initialisation during DLPAR add"
    4bfe217e075d mptcp: really cope with fastopen race
    ed34dfa19ddb mptcp: check addrs list in userspace_pm_get_local_id
    a2d743747e9e mptcp: fix rcv space initialization
    877a72e3b66c mptcp: drop the push_pending field
    1fdb37a673d2 selftests: mptcp: add mptcp_lib_kill_wait
    2decb7d94d34 selftests: mptcp: allow changing subtests prefix
    a4887b7aa676 selftests: mptcp: increase timeout to 30 min
    969afb521f6f selftests: mptcp: add missing kconfig for NF Mangle
    ecdb48c5f538 selftests: mptcp: add missing kconfig for NF Filter in v6
    2d60c017e448 selftests: mptcp: add missing kconfig for NF Filter
    b609c783c535 mptcp: fix data re-injection from stale subflow
    fa3866b67d5e kallsyms: ignore ARMv4 thunks along with others
    3a9d624593c5 modpost: trim leading spaces when processing source files list
    6be99c51829b i2c: i801: Fix block process call transactions
    a99ba46e8a20 i2c: pasemi: split driver into two separate modules
    4cc31fa07445 powerpc/kasan: Limit KASAN thread size increase to 32KB
    f7e84c8e196b irqchip/gic-v3-its: Handle non-coherent GICv4 redistributors
    fcb82e9739f2 irqchip/loongson-eiointc: Use correct struct type in eiointc_domain_alloc()
    0589dff4fbf4 i2c: qcom-geni: Correct I2C TRE sequence
    f7ff1c89fb6e cifs: fix underflow in parse_server_interfaces()
    e7f744f6f420 iio: adc: ad4130: only set GPIO_CTRL if pin is unused
    0e0dab377509 iio: adc: ad4130: zero-initialize clock init data
    63b1a3d9dd3b PCI: Fix active state requirement in PME polling
    7f414d306320 Revert "kobject: Remove redundant checks for whether ktype is NULL"
    0516c06b19dc powerpc/kasan: Fix addr error caused by page alignment
    8631837dbf8b powerpc/6xx: set High BAT Enable flag on G2_LE cores
    0040386b0b71 powerpc/pseries/iommu: Fix iommu initialisation during DLPAR add
    22920e410234 driver core: fw_devlink: Improve detection of overlapping cycles
    7219a692ffc0 media: ir_toy: fix a memleak in irtoy_tx
    008cf5d1da7f interconnect: qcom: sm8550: Enable sync_state
    d8e36ff40cf9 interconnect: qcom: sc8180x: Mark CO0 BCM keepalive
    c7ebd8149ee5 usb: dwc3: gadget: Fix NULL pointer dereference in dwc3_gadget_suspend
    ed85777c640c usb: core: Prevent null pointer dereference in update_port_device_state
    84a13b97e8e2 usb: chipidea: core: handle power lost in workqueue
    0d179c570486 usb: f_mass_storage: forbid async queue when shutdown happen
    eafeda9ee9c0 USB: hub: check for alternate port before enabling A_ALT_HNP_SUPPORT
    ec68d8d25b84 usb: ucsi_acpi: Fix command completion handling
    330d22aba17a usb: ulpi: Fix debugfs directory leak
    d25f43a25794 usb: ucsi: Add missing ppm_lock
    ad42f8087146 iio: hid-sensor-als: Return 0 for HID_USAGE_SENSOR_TIME_TIMESTAMP
    fc41101a94b1 HID: wacom: Do not register input devices until after hid_hw_start
    04fa3e1387bf HID: wacom: generic: Avoid reporting a serial of '0' to userspace
    4cad91344a62 HID: i2c-hid-of: fix NULL-deref on failed power up
    467fce636a3a HID: bpf: actually free hdev memory after attaching a HID-BPF program
    d83a7e591d26 HID: bpf: remove double fdget()
    c34c01fba0f0 ALSA: hda/realtek: Enable Mute LED on HP Laptop 14-fq0xxx
    134c9f699c16 ALSA: hda/realtek: Fix the external mic not being recognised for Acer Swift 1 SF114-32
    63bc8a394083 parisc: Prevent hung tasks when printing inventory on serial console
    7f5375875e84 ASoC: amd: yc: Add DMI quirk for MSI Bravo 15 C7VF
    5735a2671ffb dm-crypt, dm-verity: disable tasklets
    cc0037fa592d nouveau: offload fence uevents work to workqueue
    acd2eda2b28f scsi: storvsc: Fix ring buffer size calculation
    2f61cb94def1 selftests: mm: fix map_hugetlb failure on 64K page size systems
    8f02931edb7d selftests/mm: Update va_high_addr_switch.sh to check CPU for la57 flag
    ec18ec230301 mm/writeback: fix possible divide-by-zero in wb_dirty_limits(), again
    85f052b55ce2 selftests/mm: switch to bash from sh
    6022c065c9ec tracing/trigger: Fix to return error if failed to alloc snapshot
    8b5a4fe34279 scs: add CONFIG_MMU dependency for vfree_atomic()
    d6a14d9ddbed selftests/mm: ksm_tests should only MADV_HUGEPAGE valid memory
    ee35363764d8 userfaultfd: fix mmap_changing checking in mfill_atomic_hugetlb
    38e6fede36bb i40e: Fix waiting for queues of all VSIs to be disabled
    be147926140a i40e: Do not allow untrusted VF to remove administratively set MAC
    94d34a6861a2 mm/memory: Use exception ip to search exception tables
    fdd12a80f64f ptrace: Introduce exception_ip arch hook
    2252913f156f MIPS: Add 'memory' clobber to csum_ipv6_magic() inline assembler
    61e1c101bacb nouveau/svm: fix kvcalloc() argument order
    d4053005d55a net: sysfs: Fix /sys/class/net/<iface> path for statistics
    050ad2ca0ac1 ASoC: rt5645: Fix deadlock in rt5645_jack_detect_work()
    211db3da3f61 spi: ppc4xx: Drop write-only variable
    6a67bf10934c net: tls: fix returned read length with async decrypt
    d684763534b9 net: tls: fix use-after-free with partial reads and async decrypt
    13eca403876b net: tls: handle backlogging of crypto requests
    6db22d6c7a6d tls: fix race between tx work scheduling and socket close
    86dc27ee36f5 tls: fix race between async notify and socket close
    de31df6f8720 net: tls: factor out tls_*crypt_async_wait()
    5e01c54ebcaf tls: extract context alloc/initialization out of tls_set_sw_offload
    48fae67d8374 lan966x: Fix crash when adding interface under a lag
    5eeb2a9eaa5b net: openvswitch: limit the number of recursions from action sets
    65095912b0f3 selftests: forwarding: Fix bridge locked port test flakiness
    d8893ac849ba selftests: forwarding: Suppress grep warnings
    925fd1a0fb41 selftests: bridge_mdb: Use MDB get instead of dump
    c3e0cfe7d7cb selftests: forwarding: Fix bridge MDB test flakiness
    2fc52eb6369c selftests: forwarding: Fix layer 2 miss test flakiness
    dcaf06afaad8 selftests: net: Fix bridge backup port test flakiness
    30c59775a292 selftests/net: convert test_bridge_backup_port.sh to run it in unique namespace
    7512d7866640 perf: CXL: fix mismatched cpmu event opcode
    6e00027aef47 ALSA: hda/cs35l56: select intended config FW_CS_DSP
    c3dc7cb88815 of: property: Improve finding the supplier of a remote-endpoint property
    e0dce2c981ff of: property: Improve finding the consumer of a remote-endpoint property
    c1c50ca73e41 devlink: Fix command annotation documentation
    59d440ae52b5 bonding: do not report NETDEV_XDP_ACT_XSK_ZEROCOPY
    d74226e03df1 net/handshake: Fix handshake_req_destroy_test1
    cd16ed2e9417 ASoC: SOF: ipc3-topology: Fix pipeline tear down logic
    8723db10f063 wifi: iwlwifi: uninitialized variable in iwl_acpi_get_ppag_table()
    83f4bf711f30 wifi: iwlwifi: Fix some error codes
    9f9aff002a4d KVM: selftests: Fix a semaphore imbalance in the dirty ring logging test
    04e01dc1fce1 spi: imx: fix the burst length at DMA mode and CPU mode
    52fe802f95f2 drm/msm/gem: Fix double resv lock aquire
    3b23d6512d49 of: unittest: Fix compile in the non-dynamic case
    267f7b04effa KVM: selftests: Avoid infinite loop in hyperv_features when invtsc is missing
    03aee9284d9b KVM: selftests: Delete superfluous, unused "stage" variable in AMX test
    854357db2f93 selftests/landlock: Fix fs_test build with old libc
    8f1903863219 driver core: Fix device_link_flag_is_sync_state_only()
    7bddf18f474f btrfs: don't drop extent_map for free space inode on write error
    2f2d90376924 btrfs: reject encoded write if inode has nodatasum flag set
    2dc6dbbddc18 btrfs: don't reserve space for checksums when writing to nocow files
    7efadbcb3200 btrfs: send: return EOPNOTSUPP on unknown flags
    92182dc179ec btrfs: forbid deleting live subvol qgroup
    833775656d44 btrfs: do not ASSERT() if the newly created subvolume already got read
    4f48ef7d97d5 btrfs: forbid creating subvol qgroups
    505a948d0555 btrfs: do not delete unused block group if it may be used soon
    e97ebc2a8c8e btrfs: add and use helper to check if block group is used
    f328d96d6b38 update workarounds for gcc "asm goto" issue
    aaff74d886d0 work around gcc bugs with 'asm goto' with outputs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 21f47cb7c0..6eca6de5da 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f0a5daf40acf2b457445f9b4f97f9eb2a3d1508a"
-SRCREV_meta ?= "9141b18f231628a8605b899e836ba4abc7c43f09"
+SRCREV_machine ?= "3c1e1f6195b25babe903679416ed839a53c8b3e8"
+SRCREV_meta ?= "c97276cdc9d89cceef61184e296e5c837a265ed1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.17"
+LINUX_VERSION ?= "6.6.18"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index ef81caaa9d..c6ba2a8d59 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.17"
+LINUX_VERSION ?= "6.6.18"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
-SRCREV_meta ?= "9141b18f231628a8605b899e836ba4abc7c43f09"
+SRCREV_machine ?= "e064a7d658a30b027b999183e21cd37305caff2a"
+SRCREV_meta ?= "c97276cdc9d89cceef61184e296e5c837a265ed1"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index c89f99787c..2d218692e2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6e5be8c946e8577bcc1ab052ec174ff930590c29"
-SRCREV_machine:qemuarm64 ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
-SRCREV_machine:qemuloongarch64 ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
-SRCREV_machine:qemumips ?= "898347dbb9a2538f0140e56871fc22509ba1126c"
-SRCREV_machine:qemuppc ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
-SRCREV_machine:qemuriscv64 ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
-SRCREV_machine:qemuriscv32 ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
-SRCREV_machine:qemux86 ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
-SRCREV_machine:qemux86-64 ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
-SRCREV_machine:qemumips64 ?= "7c478488b642339d97ac55fd8b1acfd086e95c5c"
-SRCREV_machine ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
-SRCREV_meta ?= "9141b18f231628a8605b899e836ba4abc7c43f09"
+SRCREV_machine:qemuarm ?= "ea82a603d36f829f4267018d4c425f5f921074ea"
+SRCREV_machine:qemuarm64 ?= "e064a7d658a30b027b999183e21cd37305caff2a"
+SRCREV_machine:qemuloongarch64 ?= "e064a7d658a30b027b999183e21cd37305caff2a"
+SRCREV_machine:qemumips ?= "cf67a27829c10d065e0447af29ee330e385bcafb"
+SRCREV_machine:qemuppc ?= "e064a7d658a30b027b999183e21cd37305caff2a"
+SRCREV_machine:qemuriscv64 ?= "e064a7d658a30b027b999183e21cd37305caff2a"
+SRCREV_machine:qemuriscv32 ?= "e064a7d658a30b027b999183e21cd37305caff2a"
+SRCREV_machine:qemux86 ?= "e064a7d658a30b027b999183e21cd37305caff2a"
+SRCREV_machine:qemux86-64 ?= "e064a7d658a30b027b999183e21cd37305caff2a"
+SRCREV_machine:qemumips64 ?= "52456b6cb3393c1848da3ccdae37727c31896f1c"
+SRCREV_machine ?= "e064a7d658a30b027b999183e21cd37305caff2a"
+SRCREV_meta ?= "c97276cdc9d89cceef61184e296e5c837a265ed1"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "b2c9bf06474ea12eaca7d5f007e9280e057e960b"
+SRCREV_machine:class-devupstream ?= "d8a27ea2c98685cdaa5fa66c809c7069a4ff394b"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.17"
+LINUX_VERSION ?= "6.6.18"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


