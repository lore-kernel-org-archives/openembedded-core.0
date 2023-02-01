Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E569CC63797
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 22:16:31 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.105.1675289788003375377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 14:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZeHfRozd;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id q9so1804pgq.5
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONhLMdsgtjVPd/Eb29IyyOzuBDvI3V1ouwjzeRXn5N4=;
        b=ZeHfRozdRQ6elZF4J/AWJEKnOaW4XlYm1RO1NBjBLU5acRXNJgdpGmv4QtbrzwNnI3
         oDsSgidHnz+xk5WGBFz4u0EpQ6HQ9IcMLfMaXrwYVkb3M0R6h5zmtVRZuWjSWi7ubRYB
         uFiEEHVg+lZbXxpO2BNqRG3ue32DA34hv0vIQbvuun2aZ3jUBNu9D607xq7Ia1cbon1s
         e0jLHGcWaJNJ4DelH3bTdzXHLeeMrC1iMHDHejeySVlEjkGRmfCQo1+srFlDz3wKI7Dr
         yuNWFKfnap85fOlF43OIiUeHjsw5d9UyDvCR5LMKV2jAeG/inHjPstd1F9gj+MxY1ybn
         DfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONhLMdsgtjVPd/Eb29IyyOzuBDvI3V1ouwjzeRXn5N4=;
        b=0CPXksl8ZyWNeJHxPvdZNYTnyDMgoLyORHinqsqoZa2q08N9QBgMNYueG6hXgtE87P
         aWhRzWw6rEM+IgPWgN7Wye1bbenj0HSMpmueINh+LkJHtCYjKmrrgtuEmikBoL1AlChD
         bUXwNi5+YJYjK3ZLO0y+TQX04daZTJS04C5vM5fyShWVSRpx1iSEmz8dn/Vyh44qg+im
         Uoweruwgcvtz+NYetP2h5flU7QS6lNdZOp7+t34KeFcCLTAZCK3wNoKKfLbf1+S3yxZe
         o/YNTv4LhvuAmiuYnaX1yeji0YeUh/AoShDiome+FygaVt5S0z+r2HoDRdlFQ4m3HhJ7
         d9uA==
X-Gm-Message-State: AO0yUKUrSr33kBf2mKwQVgkRCxjtVCFn6xS0dmItNuMhmN1Ki/aYurDG
	0rIvFV9CYnx+oVlRp8XPoE9IhCxnbmiURxjNR1g=
X-Google-Smtp-Source: AK7set+IDfbP0fgDbgIUfbkezmwixHQz9nRMLP784QTl+1eUtWibxU1SG0u4BNppBmZ9ceGoGFXvLQ==
X-Received: by 2002:a62:1c88:0:b0:581:1f4b:d1e5 with SMTP id c130-20020a621c88000000b005811f4bd1e5mr3301777pfc.12.1675289785814;
        Wed, 01 Feb 2023 14:16:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a001a4a00b0058df440d51esm11904810pfv.193.2023.02.01.14.16.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 14:16:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/13] linux-yocto/5.15: update to v5.15.87
Date: Wed,  1 Feb 2023 12:15:58 -1000
Message-Id: <4d05613d34e590a1382fe0581cd25352890e899e.1675289652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675289652.git.steve@sakoman.com>
References: <cover.1675289652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 22:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176664

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    d57287729e22 Linux 5.15.87
    24186c682288 drm/mgag200: Fix PLL setup for G200_SE_A rev >=4
    e326ee018a24 io_uring: Fix unsigned 'res' comparison with zero in io_fixup_rw_res()
    b2b6eefab43d efi: random: combine bootloader provided RNG seed with RNG protocol output
    99c0759495a0 mbcache: Avoid nesting of cache->c_list_lock under bit locks
    d50d6c193adb net: hns3: fix return value check bug of rx copybreak
    d4e6a13eb9a3 btrfs: make thaw time super block check to also verify checksum
    70a1dccd0e58 selftests: set the BUILD variable to absolute path
    58fef3ebc83c ext4: don't allow journal inode to have encrypt flag
    bd5dc96fea4e mptcp: use proper req destructor for IPv6
    78bd6ab52c03 mptcp: dedicated request sock for subflow in v6
    6e9c1aef3e32 Revert "ACPI: PM: Add support for upcoming AMD uPEP HID AMDI007"
    e32f867b37da ksmbd: check nt_len to be at least CIFS_ENCPWD_SIZE in ksmbd_decode_ntlmssp_auth_blob
    4136f1ac1ecd ksmbd: fix infinite loop in ksmbd_conn_handler_loop()
    f10defb0be6a hfs/hfsplus: avoid WARN_ON() for sanity check, use proper error handling
    48d9e2e6de01 hfs/hfsplus: use WARN_ON for sanity check
    f5a9bbf962e2 drm/i915/gvt: fix vgpu debugfs clean in remove
    ae9a61511736 drm/i915/gvt: fix gvt debugfs destroy
    eb3e943a3243 riscv, kprobes: Stricter c.jr/c.jalr decoding
    620a229f576a riscv: uaccess: fix type of 0 variable on error in get_user()
    8e05a993f8aa thermal: int340x: Add missing attribute for data rate base
    c3222fd28225 io_uring: fix CQ waiting timeout handling
    b7b9bc93055d block: don't allow splitting of a REQ_NOWAIT bio
    e1358c878711 fbdev: matroxfb: G200eW: Increase max memory from 1 MB to 16 MB
    682a7d064f35 nfsd: fix handling of readdir in v4root vs. mount upcall timeout
    cb42aa7b5f72 x86/bugs: Flush IBP in ib_prctl_set()
    554a880a1fff x86/kexec: Fix double-free of elf header buffer
    264241a61045 btrfs: check superblock to ensure the fs was not modified at thaw time
    69f4bda5f4e6 nvme: also return I/O command effects from nvme_command_effects
    a6a4b057cd47 nvmet: use NVME_CMD_EFFECTS_CSUPP instead of open coding it
    f9309dcaa9c0 io_uring: check for valid register opcode earlier
    4df413d46960 nvme: fix multipath crash caused by flush request when blktrace is enabled
    03ce7921285e ASoC: Intel: bytcr_rt5640: Add quirk for the Advantech MICA-071 tablet
    0dca7375e2b9 udf: Fix extension of the last extent in the file
    dc1bc903970b caif: fix memory leak in cfctrl_linkup_request()
    bce3680b48d2 drm/i915: unpin on error in intel_vgpu_shadow_mm_pin()
    da6a3653b82c perf stat: Fix handling of --for-each-cgroup with --bpf-counters to match non BPF mode
    11cd4ec6359d usb: rndis_host: Secure rndis_query check against int overflow
    6ea5273c71dd octeontx2-pf: Fix lmtst ID used in aura free
    4e5f2c74cbbf drivers/net/bonding/bond_3ad: return when there's no aggregator
    8414983c2e64 fs/ntfs3: don't hold ni_lock when calling truncate_setsize()
    a23e8376e613 drm/imx: ipuv3-plane: Fix overlay plane width
    a8f7fd322f56 perf tools: Fix resources leak in perf_data__open_dir()
    a1e1521b4639 netfilter: ipset: Rework long task execution when adding/deleting entries
    6f19a3848367 netfilter: ipset: fix hash:net,port,net hang with /0 subnet
    774d259749d7 net: sparx5: Fix reading of the MAC address
    04dc4003e5df net: sched: cbq: dont intepret cls results when asked to drop
    f02327a4877a net: sched: atm: dont intepret cls results when asked to drop
    95da1882ce93 gpio: sifive: Fix refcount leak in sifive_gpio_probe
    da9c9883ec96 ceph: switch to vfs_inode_has_locks() to fix file lock bug
    54e72ce5f1d7 filelock: new helper: vfs_inode_has_locks
    f34b03ce3a86 drm/meson: Reduce the FIFO lines held when AFBC is not used
    05a8410b0fce RDMA/mlx5: Fix validation of max_rd_atomic caps for DC
    8d89870d6375 RDMA/mlx5: Fix mlx5_ib_get_hw_stats when used for device
    4d112f001612 net: phy: xgmiitorgmii: Fix refcount leak in xgmiitorgmii_probe
    e5fbeb3d16b4 net: ena: Update NUMA TPH hint register upon NUMA node update
    7840b93cfd4c net: ena: Set default value for RX interrupt moderation
    d09b7a9d2f34 net: ena: Fix rx_copybreak value update
    0e7ad9b006d7 net: ena: Use bitmask to indicate packet redirection
    5d4964984b99 net: ena: Account for the number of processed bytes in XDP
    f17d9aec07de net: ena: Don't register memory info on XDP exchange
    a4aa727ad0b2 net: ena: Fix toeplitz initial hash value
    0bec17f1ce31 net: amd-xgbe: add missed tasklet_kill
    cb2f74685f76 net/mlx5e: Fix hw mtu initializing at XDP SQ allocation
    6c72abb78b01 net/mlx5e: Always clear dest encap in neigh-update-del
    b36783bc11d1 net/mlx5e: TC, Refactor mlx5e_tc_add_flow_mod_hdr() to get flow attr
    f8c10eeba31b net/mlx5e: IPoIB, Don't allow CQE compression to be turned on by default
    7227bbb7c140 net/mlx5: Avoid recovery in probe flows
    9369b9afa8b0 net/mlx5: Add forgotten cleanup calls into mlx5_init_once() error path
    d966f2ee4b8e net/mlx5: E-Switch, properly handle ingress tagged packets on VST
    6a37a01aba5d vdpa_sim: fix vringh initialization in vdpasim_queue_ready()
    e3462410c36d vhost: fix range used in translate_desc()
    13871f60ec2f vringh: fix range used in iotlb_translate()
    e05d4c8c287a vhost/vsock: Fix error handling in vhost_vsock_init()
    586e6fd7d581 vdpa_sim: fix possible memory leak in vdpasim_net_init() and vdpasim_blk_init()
    b63bc2db244c nfc: Fix potential resource leaks
    945e58bdaf6f net: dsa: mv88e6xxx: depend on PTP conditionally
    95df720e64a6 qlcnic: prevent ->dcb use-after-free on qlcnic_dcb_enable() failure
    6c55953e232e net: sched: fix memory leak in tcindex_set_parms
    d14a4b24d58e net: hns3: fix VF promisc mode not update when mac table full
    7ed205b9478d net: hns3: fix miss L3E checking for rx packet
    47868cb77f8f net: hns3: extract macro to simplify ring stats update code
    7457c5a7761a net: hns3: refactor hns3_nic_reuse_page()
    4a6e9fb534c5 net: hns3: add interrupts re-initialization while doing VF FLR
    5e48ed805c4f nfsd: shut down the NFSv4 state objects before the filecache
    7e2825f5fb84 veth: Fix race with AF_XDP exposing old or uninitialized descriptors
    ac95cdafaca8 netfilter: nf_tables: honor set timeout and garbage collection updates
    49677ea1513e vmxnet3: correctly report csum_level for encapsulated packet
    9d30cb442156 netfilter: nf_tables: perform type checking for existing sets
    c3bfb7784a09 netfilter: nf_tables: add function to create set stateful expressions
    996cd779c2a4 netfilter: nf_tables: consolidate set description
    4f1105ee72d8 drm/panfrost: Fix GEM handle creation ref-counting
    df493f676fb0 bpf: pull before calling skb_postpull_rcsum()
    d7e817e689b1 btrfs: fix an error handling path in btrfs_defrag_leaves()
    4d69cdba2c27 SUNRPC: ensure the matching upcall is in-flight upon downcall
    af0265dfeffa drm/i915/migrate: fix length calculation
    8b25a526a5e9 drm/i915/migrate: fix offset calculation
    a3d1e6f9b678 drm/i915/migrate: don't check the scratch page
    5bc0b2fda4b4 ext4: fix deadlock due to mbcache entry corruption
    a6e4094faf3c mbcache: automatically delete entries from cache on freeing
    187254912971 ext4: correct inconsistent error msg in nojournal mode
    761f88f82e0f ext4: goto right label 'failed_mount3a'
    eb16602140f0 ravb: Fix "failed to switch device to config mode" message during unbind
    4216995dbd93 perf probe: Fix to get the DW_AT_decl_file and DW_AT_call_file as unsinged data
    d8bbbf2b52b2 perf probe: Use dwarf_attr_integrate as generic DWARF attr accessor
    b131b5f1361e media: s5p-mfc: Fix in register read and write for H264
    ff27800c0a6d media: s5p-mfc: Clear workbit to handle error condition
    4653ba32adcd media: s5p-mfc: Fix to handle reference queue during finishing
    1bd7283dc0be x86/MCE/AMD: Clear DFR errors found in THR handler
    5ddcd349d9af x86/mce: Get rid of msr_ops
    b8e7ed42bc3c btrfs: fix extent map use-after-free when handling missing device in read_one_chunk
    9c3beebd21f3 btrfs: move missing device handling in a dedicate function
    7528b21cebe0 btrfs: replace strncpy() with strscpy()
    4cef44525f4f phy: qcom-qmp-combo: fix out-of-bounds clock access
    855edc4ec64c ARM: renumber bits related to _TIF_WORK_MASK
    18f28f13301d ext4: fix off-by-one errors in fast-commit block filling
    b205332b6b87 ext4: fix unaligned memory access in ext4_fc_reserve_space()
    9c197dcbacc4 ext4: add missing validation of fast-commit record lengths
    6220ec405571 ext4: don't set up encryption key during jbd2 transaction
    6482d42baff5 ext4: disable fast-commit of encrypted dir operations
    6969367c1500 ext4: fix potential out of bound read in ext4_fc_replay_scan()
    818175ae3bd2 ext4: factor out ext4_fc_get_tl()
    ffd84d0bc5dc ext4: introduce EXT4_FC_TAG_BASE_LEN helper
    37914e029bec ext4: use ext4_debug() instead of jbd_debug()
    b0ed9a032e52 ext4: remove unused enum EXT4_FC_COMMIT_FAILED
    394514ddf90e tracing: Fix issue of missing one synthetic field
    5234dd5d205b block: mq-deadline: Fix dd_finish_request() for zoned devices
    78623b10fc9f drm/amdgpu: make display pinning more flexible (v2)
    6363da2c854a drm/amdgpu: handle polaris10/11 overlap asics (v2)
    2771c7a0eedc ext4: allocate extended attribute value in vmalloc area
    e995ff918e66 ext4: avoid unaccounted block allocation when expanding inode
    877247222a0c ext4: initialize quota before expanding inode in setproject ioctl
    322cf639b0b7 ext4: fix inode leak in ext4_xattr_inode_create() on an error path
    6380a93b57db ext4: fix kernel BUG in 'ext4_write_inline_data_end()'
    dc3bbc9753f4 ext4: avoid BUG_ON when creating xattrs
    844c40555297 ext4: fix error code return to user-space in ext4_get_branch()
    b870b28e29f6 ext4: fix corruption when online resizing a 1K bigalloc fs
    d440d6427a5e ext4: fix delayed allocation bug in ext4_clu_mapped for bigalloc + inline
    def7a39091e6 ext4: init quota for 'old.inode' in 'ext4_rename'
    3c31d8d3ad95 ext4: fix uninititialized value in 'ext4_evict_inode'
    871800770d7f ext4: fix leaking uninitialized memory in fast-commit journal
    d480a49c15c4 ext4: fix bug_on in __es_tree_search caused by bad boot loader inode
    91009e361e8c ext4: check and assert if marking an no_delete evicting inode dirty
    820eacbc4e4f ext4: fix reserved cluster accounting in __es_remove_extent()
    0dcbf4dc3d54 ext4: fix bug_on in __es_tree_search caused by bad quota inode
    06a20a68bb6d ext4: add helper to check quota inums
    f7e6b5548f91 ext4: add EXT4_IGET_BAD flag to prevent unexpected bad inode
    205ac16628ac ext4: fix undefined behavior in bit shift for ext4_check_flag_values
    cf0e0817b0f9 ext4: fix use-after-free in ext4_orphan_cleanup
    970bfd7a4188 fs: ext4: initialize fsdata in pagecache_write()
    744bbde378a5 ext4: remove trailing newline from ext4_msg() message
    7192afa5e4bf ext4: add inode table check in __ext4_get_inode_loc to aovid possible infinite loop
    0d041b7251c1 ext4: silence the warning when evicting inode with dioread_nolock
    af4ceb00ebea drm/ingenic: Fix missing platform_driver_unregister() call in ingenic_drm_init()
    c919e1154b8c drm/i915/dsi: fix VBT send packet port selection for dual link DSI
    6948e570f54f drm/vmwgfx: Validate the box size for the snooped cursor
    5594fde1ef53 drm/connector: send hotplug uevent on connector cleanup
    317ebe61a6d4 device_cgroup: Roll back to original exceptions after copy failure
    ac838c663ba1 parisc: led: Fix potential null-ptr-deref in start_task()
    2c1881f0816a remoteproc: core: Do pm_relax when in RPROC_OFFLINE state
    9b615f957ca7 iommu/amd: Fix ivrs_acpihid cmdline parsing code
    35b792179b10 phy: qcom-qmp-combo: fix sc8180x reset
    dfd05a133556 driver core: Fix bus_type.match() error handling in __driver_attach()
    44618a339741 crypto: ccp - Add support for TEE for PCI ID 0x14CA
    c55507a94bc6 crypto: n2 - add missing hash statesize
    48307506964e riscv: mm: notify remote harts about mmu cache updates
    16b6d9525da6 riscv: stacktrace: Fixup ftrace_graph_ret_addr retp argument
    657b440a270c PCI/sysfs: Fix double free in error path
    67fd41bbb0f5 PCI: Fix pci_device_is_present() for VFs by checking PF
    bfce073089cb ipmi: fix use after free in _ipmi_destroy_user()
    3b4984035c40 ima: Fix a potential NULL pointer access in ima_restore_measurement_list
    a843699f1665 mtd: spi-nor: Check for zero erase size in spi_nor_find_best_erase_type()
    24f4649cd8fc ipmi: fix long wait in unload when IPMI disconnect
    fa6bbb4894b9 ipu3-imgu: Fix NULL pointer dereference in imgu_subdev_set_selection()
    cdb208b090f3 ASoC: jz4740-i2s: Handle independent FIFO flush bits
    2d0d083d8ae6 wifi: wilc1000: sdio: fix module autoloading
    2e4a088804c1 efi: Add iMac Pro 2017 to uefi skip cert quirk
    c49fb9b760d3 md/bitmap: Fix bitmap chunk size overflow issues
    94fe975d54ab block: mq-deadline: Do not break sequential write streams to zoned HDDs
    8e91679f7bd2 rtc: ds1347: fix value written to century register
    5eb8296d73da cifs: fix missing display of three mount options
    cfa9f66f9172 cifs: fix confusing debug message
    8b45a3b19a2e media: dvb-core: Fix UAF due to refcount races at releasing
    acf984a3718c media: dvb-core: Fix double free in dvb_register_device()
    5fac317bee18 ARM: 9256/1: NWFPE: avoid compiler-generated __aeabi_uldivmod
    ce50c6124580 staging: media: tegra-video: fix device_node use after free
    6b16758215f6 staging: media: tegra-video: fix chan->mipi value on error
    4f5de49d8c52 tracing: Fix infinite loop in tracing_read_pipe on overflowed print_trace_line
    17becbc4dd67 tracing/probes: Handle system names with hyphens
    2442e655a693 tracing/hist: Fix wrong return value in parse_action_params()
    2a81ff5ce893 tracing: Fix complicated dependency of CONFIG_TRACER_MAX_TRACE
    fe8c35c6ffa2 tracing: Fix race where eprobes can be called before the event
    eb20f6ed3733 x86/kprobes: Fix optprobe optimization check with CONFIG_RETHUNK
    3e0fbc06db12 x86/kprobes: Fix kprobes instruction boudary check with CONFIG_RETHUNK
    6268a0704b97 ftrace/x86: Add back ftrace_expected for ftrace bug reports
    c95cf30dd447 x86/microcode/intel: Do not retry microcode reloading on the APs
    f8fe2f41784b KVM: nVMX: Properly expose ENABLE_USR_WAIT_PAUSE control to L1
    ca3483d71bd5 KVM: nVMX: Inject #GP, not #UD, if "generic" VMXON CR0/CR4 check fails
    2c73b349fd78 KVM: VMX: Resume guest immediately when injecting #GP on ECREATE
    4a19f48bee09 of/kexec: Fix reading 32-bit "linux,initrd-{start,end}" values
    7eddcdb09f62 perf/core: Call LSM hook after copying perf_event_attr
    15697f653399 tracing/hist: Fix out-of-bound write on 'action_data.var_ref_idx'
    fd52b86a7248 dm cache: set needs_check flag after aborting metadata
    d2a0b298ebf8 dm cache: Fix UAF in destroy()
    856edd0e92f3 dm clone: Fix UAF in clone_dtr()
    9215b25f2e10 dm integrity: Fix UAF in dm_integrity_dtr()
    34cd15d83b72 dm thin: Fix UAF in run_timer_softirq()
    ac362c40e3e9 dm thin: resume even if in FAIL mode
    4b710e8481ad dm thin: Use last transaction's pmd->root when commit failed
    f8c26c33fef5 dm thin: Fix ABBA deadlock between shrink_slab and dm_pool_abort_metadata
    28d307f380df dm cache: Fix ABBA deadlock between shrink_slab and dm_cache_metadata_abort
    a9e89a567f48 mptcp: remove MPTCP 'ifdef' in TCP SYN cookies
    13b9fd0dee93 mptcp: mark ops structures as ro_after_init
    b2120ed7fd75 fs: dlm: retry accept() until -EAGAIN or error returns
    5b4478615f70 fs: dlm: fix sock release if listen fails
    b7ede8a63dd9 ALSA: hda/realtek: Apply dual codec fixup for Dell Latitude laptops
    dbd1f301915f ALSA: patch_realtek: Fix Dell Inspiron Plus 16
    8fb4c98f20df cpufreq: Init completion before kobject_init_and_add()
    876c6ab96782 PM/devfreq: governor: Add a private governor_data for governor
    0e945ea733ea selftests: Use optional USERCFLAGS and USERLDFLAGS
    31697c5953ff arm64: dts: qcom: sdm850-lenovo-yoga-c630: correct I2C12 pins drive strength
    163049866030 ARM: ux500: do not directly dereference __iomem
    99590f29b2b7 btrfs: fix resolving backrefs for inline extent followed by prealloc
    1f9cf4daf2d3 mmc: sdhci-sprd: Disable CLK_AUTO when the clock is less than 400K
    58d53ff30a00 arm64: dts: qcom: sdm845-db845c: correct SPI2 pins drive strength
    a777b90a0575 perf/x86/intel/uncore: Clear attr_update properly
    ca77ac238c1e perf/x86/intel/uncore: Disable I/O stacks to PMU mapping on ICX-D
    df06e7777cf9 jbd2: use the correct print format
    8e75b1dd4b16 ktest.pl minconfig: Unset configs instead of just removing them
    55e5e8b44561 kest.pl: Fix grub2 menu handling for rebooting
    823fed7c400f soc: qcom: Select REMAP_MMIO for LLCC driver
    8dabeeb1ff89 media: stv0288: use explicitly signed char
    d167ebea9086 net/af_packet: make sure to pull mac header
    9ff46c36df2e net/af_packet: add VLAN support for AF_PACKET SOCK_RAW GSO
    cd0f597c8aa8 rcu-tasks: Simplify trc_read_check_handler() atomic operations
    593ca696687c ASoC/SoundWire: dai: expand 'stream' concept beyond SoundWire
    a7874dac6ba6 ASoC: Intel/SOF: use set_stream() instead of set_tdm_slots() for HDAudio
    ae4f70b2fed4 kcsan: Instrument memcpy/memset/memmove with newer Clang
    d01fa993eb7f SUNRPC: Don't leak netobj memory when gss_read_proxy_verf() fails
    43135fb09812 tpm: tpm_tis: Add the missed acpi_put_table() to fix memory leak
    986cd9a9b954 tpm: tpm_crb: Add the missed acpi_put_table() to fix memory leak
    638cd298dfeb tpm: acpi: Call acpi_put_table() to fix memory leak
    d58289fc77f8 mmc: vub300: fix warning - do not call blocking ops when !TASK_RUNNING
    7eb57bc92f1b f2fs: allow to read node block after shutdown
    acc13987fdea f2fs: should put a page when checking the summary info
    35d8a89862e6 mm, compaction: fix fast_isolate_around() to stay within boundaries
    91bd504128a5 md: fix a crash in mempool_free
    29328fbce56c mfd: mt6360: Add bounds checking in Regmap read/write call-backs
    c24cc476acd8 pnode: terminate at peers of source
    0c9118e381ff ALSA: line6: fix stack overflow in line6_midi_transmit
    ac4b4fdf3262 ALSA: line6: correct midi status byte when receiving data from podxt
    83c44f0ebfd0 ovl: Use ovl mounter's fsuid and fsgid in ovl_link()
    fcb94283e014 binfmt: Fix error return code in load_elf_fdpic_binary()
    ed9947277b2d hfsplus: fix bug causing custom uid and gid being unable to be assigned with mount
    76d52b54127c pstore/zone: Use GFP_ATOMIC to allocate zone buffer
    74b0a2fcc31a pstore: Properly assign mem_type property
    d25aac3489af HID: plantronics: Additional PIDs for double volume key presses quirk
    9d4294545c1d HID: multitouch: fix Asus ExpertBook P2 P2451FA trackpoint
    7280fdb80bf0 powerpc/rtas: avoid scheduling in rtas_os_term()
    d8939315b734 powerpc/rtas: avoid device tree lookups in rtas_os_term()
    23a249b1185c objtool: Fix SEGFAULT
    ed686e7a26dd fs/ntfs3: Fix slab-out-of-bounds in r_page
    dd34665cb004 fs/ntfs3: Delete duplicate condition in ntfs_read_mft()
    a9847a11b683 fs/ntfs3: Use __GFP_NOWARN allocation at ntfs_fill_super()
    abd2ee2cf42f fs/ntfs3: Use __GFP_NOWARN allocation at wnd_init()
    d7ce7bb6881a fs/ntfs3: Validate index root when initialize NTFS security
    f29676cc3a46 soundwire: dmi-quirks: add quirk variant for LAPBC710 NUC15
    9c8471a17f1f fs/ntfs3: Fix slab-out-of-bounds read in run_unpack
    3a52f1786772 fs/ntfs3: Validate resident attribute name
    3cd9e5b41b83 fs/ntfs3: Validate buffer length while parsing index
    c878a915bcb9 fs/ntfs3: Validate attribute name offset
    f62506f5e45a fs/ntfs3: Add null pointer check for inode operations
    2dd9ccfb06bc fs/ntfs3: Fix memory leak on ntfs_fill_super() error path
    ea6b3598406c fs/ntfs3: Add null pointer check to attr_load_runs_vcn
    de5e0955248f fs/ntfs3: Validate data run offset
    d4489ba8fb80 fs/ntfs3: Add overflow check for attribute size
    af7a195deae3 fs/ntfs3: Validate BOOT record_size
    8e228ac90c39 nvmet: don't defer passthrough commands with trivial effects to the workqueue
    f068a7315a9e nvme: fix the NVME_CMD_EFFECTS_CSE_MASK definition
    576502f25f79 ata: ahci: Fix PCS quirk application for suspend
    7949b0df3dd9 block, bfq: fix uaf for bfqq in bfq_exit_icq_bfqq
    ff3d9ab51cd5 ACPI: resource: do IRQ override on Lenovo 14ALC7
    698a0813ce69 ACPI: resource: do IRQ override on XMG Core 15
    a9ac7633bbe5 ACPI: resource: do IRQ override on LENOVO IdeaPad
    5fe31f29501c ACPI: resource: Skip IRQ override on Asus Vivobook K3402ZA/K3502ZA
    4c5fee0d883a nvme-pci: fix page size checks
    9141144b37f3 nvme-pci: fix mempool alloc size
    f17cf8fa2c9d nvme-pci: fix doorbell buffer value endianness
    ead99ec669b5 Revert "selftests/bpf: Add test for unstable CT lookup API"
    bf0543b93740 cifs: fix oops during encryption
    56f6de394f0f usb: dwc3: qcom: Fix memory leak in dwc3_qcom_interconnect_init
    90ffbb727c51 Linux 5.15.86
    3082f8705e82 pwm: tegra: Fix 32 bit build
    caa40d1f8524 mfd: qcom_rpm: Use devm_of_platform_populate() to simplify code
    408dbaa06578 extcon: usbc-tusb320: Call the Type-C IRQ handler only if a port is registered
    2471a44769b5 media: dvbdev: fix refcnt bug
    579fb0a3320b media: dvbdev: fix build warning due to comments
    1115e77c4fdd net: stmmac: fix errno when create_singlethread_workqueue() fails
    d3871af13aa0 scsi: qla2xxx: Fix crash when I/O abort times out
    50f993da9450 btrfs: do not BUG_ON() on ENOMEM when dropping extent items for a range
    1c65d50315db ovl: fix use inode directly in rcu-walk mode
    88ec6d11052d fbdev: fbcon: release buffer when fbcon_do_set_font() failed
    ca8bcb348aa8 gcov: add support for checksum field
    f36d8c865150 floppy: Fix memory leak in do_floppy_init()
    4193a6745b83 regulator: core: fix deadlock on regulator enable
    ce5d0ef1cf56 iio: adc128s052: add proper .data members in adc128_of_match table
    aec1058f2a92 iio: adc: ad_sigma_delta: do not use internal iio_dev lock
    dc6afd6070f3 iio: fix memory leak in iio_device_register_eventset()
    38c257ee6a5a reiserfs: Add missing calls to reiserfs_security_free()
    8a4236456a3a security: Restrict CONFIG_ZERO_CALL_USED_REGS to gcc or clang > 15.0.6
    1cabce56626a 9p: set req refcount to zero to avoid uninitialized usage
    dd2157a98f92 loop: Fix the max_loop commandline argument treatment when it is set to 0
    fd03bd4c7b0a HID: mcp2221: don't connect hidraw
    6c886be1ff76 HID: wacom: Ensure bootloader PID is usable in hidraw mode
    4d640eb1129d xhci: Prevent infinite loop in transaction errors recovery for streams
    936c5f96c896 usb: dwc3: core: defer probe on ulpi_read_id timeout
    e6bf6c40225a usb: dwc3: Fix race between dwc3_set_mode and __dwc3_set_mode
    0e883f3bc897 arm64: dts: qcom: sm8250: fix USB-DP PHY registers
    ffb14aac2658 usb: xhci-mtk: fix leakage of shared hcd when fail to set wakeup irq
    fcacd970e011 usb: cdnsp: fix lack of ZLP for ep0
    bcac79df0838 ALSA: hda/hdmi: Add HP Device 0x8711 to force connect list
    50c23a110779 ALSA: hda/realtek: Add quirk for Lenovo TianYi510Pro-14IOB
    76574b34657e ALSA: usb-audio: add the quirk for KT0206 device
    9e787dab98b6 ima: Simplify ima_lsm_copy_rule
    2cd365029c23 pstore: Make sure CONFIG_PSTORE_PMSG selects CONFIG_RT_MUTEXES
    2068d41a3de9 afs: Fix lost servers_outstanding count
    0def8af038c1 perf debug: Set debug_peo_args and redirect_to_stderr variable to correct values in perf_quiet_option()
    41cccae10e10 pstore: Switch pmsg_lock to an rt_mutex to avoid priority inversion
    8877df8135b7 LoadPin: Ignore the "contents" argument of the LSM hooks
    584202b0f1a1 drm/i915/display: Don't disable DDI/Transcoder when setting phy test pattern
    b253e075b13d ASoC: rt5670: Remove unbalanced pm_runtime_put()
    59f797a913dc ASoC: rockchip: spdif: Add missing clk_disable_unprepare() in rk_spdif_runtime_resume()
    132844d92fed ASoC: wm8994: Fix potential deadlock
    82f7c814edda ASoC: mediatek: mt8183: fix refcount leak in mt8183_mt6358_ts3a227_max98357_dev_probe()
    e5d6bf3e5ad0 ASoC: rockchip: pdm: Add missing clk_disable_unprepare() in rockchip_pdm_runtime_resume()
    85eb5c952b7f ASoC: audio-graph-card: fix refcount leak of cpu_ep in __graph_for_each_link()
    9ff07316cad2 ASoC: mediatek: mt8173-rt5650-rt5514: fix refcount leak in mt8173_rt5650_rt5514_dev_probe()
    7643909cf06d ASoC: Intel: Skylake: Fix driver hang during shutdown
    33ff0f9f9cb5 ALSA: hda: add snd_hdac_stop_streams() helper
    78649a624dfa ALSA/ASoC: hda: move/rename snd_hdac_ext_stop_streams to hdac_stream.c
    98b0f50fec38 hwmon: (jc42) Fix missing unlock on error in jc42_write()
    5e6923350830 KVM: selftests: Fix build regression by using accessor function
    6215904fe295 tools/include: Add _RET_IP_ and math definitions to kernel.h
    c8853267289c orangefs: Fix kmemleak in orangefs_{kernel,client}_debug_init()
    39529b79b023 orangefs: Fix kmemleak in orangefs_prepare_debugfs_help_string()
    a075c21ee026 drm/sti: Fix return type of sti_{dvo,hda,hdmi}_connector_mode_valid()
    f3c14b99f33a drm/fsl-dcu: Fix return type of fsl_dcu_drm_connector_mode_valid()
    9a8862820cbf hugetlbfs: fix null-ptr-deref in hugetlbfs_parse_param()
    4f6b206998c5 scsi: elx: libefc: Fix second parameter type in state callbacks
    23f0e9f86303 scsi: ufs: Reduce the START STOP UNIT timeout
    2cf66428a254 scsi: lpfc: Fix hard lockup when reading the rx_monitor from debugfs
    2b3e3ecdb402 crypto: hisilicon/hpre - fix resource leak in remove process
    adf6a00859d0 clk: st: Fix memory leak in st_of_quadfs_setup()
    6c8aee0c8fcc media: si470x: Fix use-after-free in si470x_int_in_callback()
    58b6496a745f mmc: renesas_sdhi: better reset from HS400 mode
    c33c904124c4 mmc: f-sdh30: Add quirks for broken timeout clock capability
    69346de0eb95 wifi: mt76: do not run mt76u_status_worker if the device is not running
    feb847e6591e regulator: core: fix use_count leakage when handling boot-on
    474e70bd90cf libbpf: Avoid enum forward-declarations in public API in C++ mode
    62095428690c drm/amd/display: Use the largest vready_offset in pipe group
    eff45bfbc25a blk-mq: fix possible memleak when register 'hctx' failed
    d0af6220bb1e media: dvb-usb: fix memory leak in dvb_usb_adapter_init()
    88a6f8a72d16 media: dvbdev: adopts refcnt to avoid UAF
    438cd29fec3e media: dvb-frontends: fix leak of memory fw
    a96841f5aa45 ethtool: avoiding integer overflow in ethtool_phys_id()
    b327c68ace71 bpf: Prevent decl_tag from being referenced in func_proto arg
    4b8f3b939266 ppp: associate skb with a device at tx
    5d5a481a7fd0 mrp: introduce active flags to prevent UAF when applicant uninit
    222cc0435698 ipv6/sit: use DEV_STATS_INC() to avoid data-races
    8a3b0237107a net: add atomic_long_t to net_device_stats fields
    58dd11f62427 drm/amd/display: fix array index out of bound error in bios parser
    a3cc41e05e8a md/raid1: stop mdx_raid1 thread when raid1 array run failed
    b621d17fe8b0 drivers/md/md-bitmap: check the return value of md_bitmap_get_counter()
    5afac74f153b drm/mediatek: Fix return type of mtk_hdmi_bridge_mode_valid()
    072508e99dad drm/sti: Use drm_mode_copy()
    673a3e019908 drm/rockchip: Use drm_mode_copy()
    b9b07900d249 drm/msm: Use drm_mode_copy()
    5ad774fb823c s390/lcs: Fix return type of lcs_start_xmit()
    dfbf0122ea1b s390/netiucv: Fix return type of netiucv_tx()
    8131d1880c09 s390/ctcm: Fix return type of ctc{mp,}m_tx()
    f9084e9930db drm/amdgpu: Fix type of second parameter in odn_edit_dpm_table() callback
    b74580d6184e drm/amdgpu: Fix type of second parameter in trans_msg() callback
    314f7092b277 igb: Do not free q_vector unless new one was allocated
    0b12d2aa264b wifi: brcmfmac: Fix potential shift-out-of-bounds in brcmf_fw_alloc_request()
    19bb9e98e103 hamradio: baycom_epp: Fix return type of baycom_send_packet()
    a413ebb6049e net: ethernet: ti: Fix return type of netcp_ndo_start_xmit()
    5d3f4478d22b bpf: make sure skb->len != 0 when redirecting to a tunneling device
    be2803dd29bd qed (gcc13): use u16 for fid to be big enough
    a8bc0ac43833 Revert "drm/amd/display: Limit max DSC target bpp for specific monitors"
    cc8deb82cca5 drm/amd/display: prevent memory leak
    49dd0e8029e8 ipmi: fix memleak when unload ipmi driver
    68871c005f3c ASoC: codecs: rt298: Add quirk for KBL-R RVP platform
    3eca9697c2f3 wifi: ar5523: Fix use-after-free on ar5523_cmd() timed out
    c319196a0e34 wifi: ath9k: verify the expected usb_endpoints are present
    10c4b63d09a5 brcmfmac: return error when getting invalid max_flowrings from dongle
    ad31bc146f0e media: imx-jpeg: Disable useless interrupt to avoid kernel panic
    6e1a6880e1e9 drm/etnaviv: add missing quirks for GC300
    367296925c76 hfs: fix OOB Read in __hfs_brec_find
    ebe16676e1dc acct: fix potential integer overflow in encode_comp_t()
    8b6ef451b570 nilfs2: fix shift-out-of-bounds due to too large exponent of block size
    b47f5c579c81 nilfs2: fix shift-out-of-bounds/overflow in nilfs_sb2_bad_offset()
    5777432ebaaf ACPICA: Fix error code path in acpi_ds_call_control_method()
    10b87da8fae7 fs: jfs: fix shift-out-of-bounds in dbDiscardAG
    5059ea84a8a8 jfs: Fix fortify moan in symlink
    e7a6a53c8714 udf: Avoid double brelse() in udf_rename()
    0536f76a2bca fs: jfs: fix shift-out-of-bounds in dbAllocAG
    88cea1676a09 binfmt_misc: fix shift-out-of-bounds in check_special_flags
    cadb938a5e50 x86/hyperv: Remove unregister syscore call from Hyper-V cleanup
    659747f6f610 video: hyperv_fb: Avoid taking busy spinlock on panic path
    9d05c20b0ac9 arm64: make is_ttbrX_addr() noinstr-safe
    98a5b1265a36 rcu: Fix __this_cpu_read() lockdep warning in rcu_force_quiescent_state()
    d238f94b2b61 HID: amd_sfh: Add missing check for dma_alloc_coherent
    9da204cd67c4 net: stream: purge sk_error_queue in sk_stream_kill_queues()
    f47426250fc0 myri10ge: Fix an error handling path in myri10ge_probe()
    1ec0a7d5b020 rxrpc: Fix missing unlock in rxrpc_do_sendmsg()
    5478eb7adcc5 net_sched: reject TCF_EM_SIMPLE case for complex ematch module
    4f05d8e2fb3a mailbox: zynq-ipi: fix error handling while device_register() fails
    550f403e4604 mailbox: arm_mhuv2: Fix return value check in mhuv2_probe()
    28604a960c90 mailbox: mpfs: read the system controller's status
    8fb773eed490 skbuff: Account for tail adjustment during pull operations
    dc0f38957aa2 arm64: dts: mt8183: Fix Mali GPU clock
    790b396f6bde soc: mediatek: pm-domains: Fix the power glitch issue
    0133615a0600 openvswitch: Fix flow lookup to use unmasked key
    04e454bd97e2 selftests: devlink: fix the fd redirect in dummy_reporter_test
    d52646a46c4d rtc: mxc_v2: Add missing clk_disable_unprepare()
    ac95c4e35fb2 igc: Set Qbv start_time and end_time to end_time if not being configured in GCL
    af599851388e igc: Lift TAPRIO schedule restriction
    4d50d640eda4 igc: recalculate Qbv end_time by considering cycle time
    1ef941695715 igc: allow BaseTime 0 enrollment for Qbv
    c0df8e7ba6aa igc: Add checking for basetime less than zero
    5b46b53f45f9 igc: Use strict cycles for Qbv scheduling
    fd7d02943659 igc: Enhance Qbv scheduling by using first flag bit
    9b5b50329e2e r6040: Fix kmemleak in probe and remove
    1b428ba31b91 unix: Fix race in SOCK_SEQPACKET's unix_dgram_sendmsg()
    aae9c24ebd90 nfc: pn533: Clear nfc_target before being used
    bcf2c1dc5358 net: enetc: avoid buffer leaks on xdp_do_redirect() failure
    f463a1295c4f selftests/bpf: Add test for unstable CT lookup API
    094f3d9314d6 block, bfq: fix possible uaf for 'bfqq->bic'
    cf48cb8debb2 mISDN: hfcmulti: don't call dev_kfree_skb/kfree_skb() under spin_lock_irqsave()
    560735375165 mISDN: hfcpci: don't call dev_kfree_skb/kfree_skb() under spin_lock_irqsave()
    ada4022f4891 mISDN: hfcsusb: don't call dev_kfree_skb/kfree_skb() under spin_lock_irqsave()
    0578f9929fd3 net: macsec: fix net device access prior to holding a lock
    a472f069ced8 nfsd: under NFSv4.1, fix double svc_xprt_put on rpc_create failure
    f8f1d037d63d rtc: pcf85063: fix pcf85063_clkout_control
    35a174552bde rtc: pic32: Move devm_rtc_allocate_device earlier in pic32_rtc_probe()
    eea105c4e4b6 rtc: st-lpc: Add missing clk_disable_unprepare in st_rtc_probe()
    74248b556006 netfilter: flowtable: really fix NAT IPv6 offload
    5c940632cabf mfd: pm8008: Fix return value check in pm8008_probe()
    ec10848e2638 mfd: pm8008: Remove driver data structure pm8008_data
    38959417d350 mfd: qcom_rpm: Fix an error handling path in qcom_rpm_probe()
    b95ae3543e51 mfd: bd957x: Fix Kconfig dependency on REGMAP_IRQ
    615d3c8a469d powerpc/pseries/eeh: use correct API for error log size
    68de42e00821 powerpc/eeh: Drop redundant spinlock initialization
    2b157b4b13b4 remoteproc: qcom: q6v5: Fix missing clk_disable_unprepare() in q6v5_wcss_qcs404_power_on()
    4b191533f57f remoteproc: qcom_q6v5_pas: Fix missing of_node_put() in adsp_alloc_memory_region()
    d7628ebca817 remoteproc: qcom_q6v5_pas: detach power domains on remove
    fdf47f462ad0 remoteproc: qcom_q6v5_pas: disable wakeup on probe fail or remove
    098ebb9089c4 remoteproc: qcom: q6v5: Fix potential null-ptr-deref in q6v5_wcss_init_mmio()
    131c0a3ead78 remoteproc: sysmon: fix memory leak in qcom_add_sysmon_subdev()
    4507c6a67234 pwm: mediatek: always use bus clock for PWM on MT7622
    4fbbb14f0ea4 pwm: mtk-disp: Fix the parameters calculated by the enabled flag of disp_pwm
    eec59807a26b pwm: sifive: Call pwm_sifive_update_clock() while mutex is held
    37ea9a6c417f iommu/sun50i: Remove IOMMU_DOMAIN_IDENTITY
    8de2c29db68b selftests/powerpc: Fix resource leaks
    dd49c5031e85 powerpc/hv-gpci: Fix hv_gpci event list
    65d3469f3b91 powerpc/83xx/mpc832x_rdb: call platform_device_put() in error case in of_fsl_spi_probe()
    cf03db289640 powerpc/perf: callchain validate kernel stack pointer bounds
    5de190224445 powerpc/xive: add missing iounmap() in error path in xive_spapr_populate_irq_data()
    b31e9647f1a2 powerpc/xmon: Fix -Wswitch-unreachable warning in bpt_cmds
    6a310e8db540 cxl: Fix refcount leak in cxl_calc_capp_routing
    0accd460dc7b powerpc/52xx: Fix a resource leak in an error handling path
    be2b9b1a60b7 macintosh/macio-adb: check the return value of ioremap()
    19ded60b40e8 macintosh: fix possible memory leak in macio_add_one_device()
    e42b543d0805 iommu/fsl_pamu: Fix resource leak in fsl_pamu_probe()
    6e501b3fd7a2 iommu/amd: Fix pci device refcount leak in ppr_notifier()
    9383921e8b21 rtc: pcf85063: Fix reading alarm
    b66aa7b30608 rtc: snvs: Allow a time difference on clock register read
    7a6cc22eab18 rtc: cmos: Disable ACPI RTC event on removal
    689f757f0ab0 rtc: cmos: Rename ACPI-related functions
    1c74bbecdabc rtc: cmos: Eliminate forward declarations of some functions
    3a439a2cab30 rtc: cmos: Call rtc_wake_setup() from cmos_do_probe()
    9febdff75cef rtc: cmos: Call cmos_wake_setup() from cmos_do_probe()
    d9324fb3eed7 rtc: cmos: fix build on non-ACPI platforms
    fe46b9303e32 rtc: cmos: Fix wake alarm breakage
    60c6e563a843 rtc: cmos: Fix event handler registration ordering issue
    d3aa0834691f rtc: rtc-cmos: Do not check ACPI_FADT_LOW_POWER_S0
    6e98a93c7500 dmaengine: idxd: Fix crc_val field for completion record
    ab53749c32db fs/ntfs3: Fix slab-out-of-bounds read in ntfs_trim_fs
    1ba0968b3341 pwm: tegra: Improve required rate calculation
    c160505c9b57 include/uapi/linux/swab: Fix potentially missing __always_inline
    59463193b0dc phy: usb: s2 WoL wakeup_count not incremented for USB->Eth devices
    ae00848e5569 iommu/rockchip: fix permission bits in page table entries v2
    a7f6ad2c4251 iommu/sun50i: Fix flush size
    38ccb9b469c2 iommu/sun50i: Fix R/W permission check
    ae4ab47a0bcd iommu/sun50i: Consider all fault sources for reset
    84fee3ce8216 iommu/sun50i: Fix reset release
    6f9fe31a4823 fs/ntfs3: Harden against integer overflows
    30f20ceb87f7 overflow: Implement size_t saturating arithmetic helpers
    4b51f27d4448 fs/ntfs3: Avoid UBSAN error on true_sectors_per_clst()
    28f345bec785 RDMA/siw: Fix pointer cast warning
    01d925e2a556 perf stat: Do not delay the workload with --delay
    a273f1dd5d97 perf stat: Refactor __run_perf_stat() common code
    d21534ab4fd7 power: supply: fix null pointer dereferencing in power_supply_get_battery_info
    d4898d8de620 power: supply: ab8500: Fix error handling in ab8500_charger_init()
    30b191798fda HSI: omap_ssi_core: Fix error handling in ssi_init()
    a72fe8eb5555 power: supply: z2_battery: Fix possible memleak in z2_batt_probe()
    5ba0e8fa150c perf symbol: correction while adjusting symbol
    a34027b63d8c perf trace: Handle failure when trace point folder is missed
    60aeacce64a9 perf trace: Use macro RAW_SYSCALL_ARGS_NUM to replace number
    e4700f62dc83 perf trace: Return error if a system call doesn't exist
    870ad0917d83 power: supply: fix residue sysfs file in error handle route of __power_supply_register()
    1c2b9c810076 HSI: omap_ssi_core: fix possible memory leak in ssi_probe()
    c5f729d3d61d HSI: omap_ssi_core: fix unbalanced pm_runtime_disable()
    ea37831f8332 fbdev: uvesafb: Fixes an error handling path in uvesafb_probe()
    5bcae36b58f6 fbdev: uvesafb: don't build on UML
    07c1a3c2df5e fbdev: geode: don't build on UML
    ace8312b5d7d fbdev: ep93xx-fb: Add missing clk_disable_unprepare in ep93xxfb_probe()
    04946113fb57 fbdev: vermilion: decrease reference count in error path
    fc0d5034fa9b fbdev: via: Fix error in via_core_init()
    98272463338c fbdev: pm2fb: fix missing pci_disable_device()
    3aa4205134ac fbdev: ssd1307fb: Drop optional dependency
    4958316a6d19 thermal/drivers/qcom/lmh: Fix irq handler return value
    ad72205ac6d2 thermal/drivers/qcom/temp-alarm: Fix inaccurate warning for gen2
    37fb4e13d221 thermal/drivers/imx8mm_thermal: Validate temperature range
    95c18f4a3c99 samples: vfio-mdev: Fix missing pci_disable_device() in mdpy_fb_probe()
    31c1b5d3000c ksmbd: Fix resource leak in ksmbd_session_rpc_open()
    a44102d36a7a tracing/hist: Fix issue of losting command info in error_log
    8308ccfcbd2b usb: storage: Add check for kcalloc
    96c12fd0ec74 i2c: ismt: Fix an out-of-bounds bug in ismt_access()
    821280094399 i2c: mux: reg: check return value after calling platform_get_resource()
    46d8f63bb815 gpiolib: protect the GPIO device against being dropped while in use by user-space
    333a271dfd6b gpiolib: make struct comments into real kernel docs
    7c755a2d6df5 gpiolib: cdev: fix NULL-pointer dereferences
    b0a26e199964 gpiolib: Get rid of redundant 'else'
    4bc217b25ea8 vme: Fix error not catched in fake_init()
    31bfe024a957 staging: rtl8192e: Fix potential use-after-free in rtllib_rx_Monitor()
    b0aaec894a90 staging: rtl8192u: Fix use after free in ieee80211_rx()
    ed4580c3f8e4 i2c: pxa-pci: fix missing pci_disable_device() on error in ce4100_i2c_probe
    28dc61cc49c6 chardev: fix error handling in cdev_device_add()
    43bfc7c2402a mcb: mcb-parse: fix error handing in chameleon_parse_gdd()
    f3686e5e8de0 drivers: mcb: fix resource leak in mcb_probe()
    9d4a0aca8a75 usb: gadget: f_hid: fix refcount leak on error path
    d3136b79705c usb: gadget: f_hid: fix f_hidg lifetime vs cdev
    a41c2bba7f28 usb: roles: fix of node refcount leak in usb_role_switch_is_parent()
    18b9202188a4 coresight: trbe: remove cpuhp instance node before remove cpuhp state
    e854a4ab388a counter: stm32-lptimer-cnt: fix the check on arr and cmp registers update
    39a156715fb7 iio: adis: add '__adis_enable_irq()' implementation
    3a2dde8e5d6f iio:imu:adis: Move exports into IIO_ADISLIB namespace
    3c2e13025b54 iio: adis: stylistic changes
    de3e358912ec iio: adis: handle devices that cannot unmask the drdy pin
    994243de7a61 iio: temperature: ltc2983: make bulk write buffer DMA-safe
    22511eefa61d cxl: fix possible null-ptr-deref in cxl_pci_init_afu|adapter()
    e5021bbf11b0 cxl: fix possible null-ptr-deref in cxl_guest_init_afu|adapter()
    b308fdedef09 firmware: raspberrypi: fix possible memory leak in rpi_firmware_probe()
    d5c8f9003a28 misc: sgi-gru: fix use-after-free error in gru_set_context_option, gru_fault and gru_handle_user_call_os
    848c45964ded misc: tifm: fix possible memory leak in tifm_7xx1_switch_media()
    37a13b274e45 ocxl: fix pci device refcount leak when calling get_function_0()
    3299983a6bf6 misc: ocxl: fix possible name leak in ocxl_file_register_afu()
    357379d504c0 test_firmware: fix memory leak in test_firmware_init()
    07d547d74244 serial: sunsab: Fix error handling in sunsab_init()
    919e745fdd0d serial: altera_uart: fix locking in polling mode
    e1c4f18214e3 tty: serial: altera_uart_{r,t}x_chars() need only uart_port
    b133b45ba607 tty: serial: clean up stop-tx part in altera_uart_tx_chars()
    6f7d82380fbe serial: pch: Fix PCI device refcount leak in pch_request_dma()
    0dfc7dfe5b6e serial: stm32: move dma_request_chan() before clk_prepare_enable()
    926b0967f781 serial: pl011: Do not clear RX FIFO & RX interrupt in unthrottle.
    d71a611fca19 serial: amba-pl011: avoid SBSA UART accessing DMACR register
    f46f9d2e1664 extcon: usbc-tusb320: Update state on probe even if no IRQ pending
    ac067e75c4c2 extcon: usbc-tusb320: Add USB TYPE-C support
    9280761167f0 extcon: usbc-tusb320: Factor out extcon into dedicated functions
    05aa8ff22d4a usb: typec: Factor out non-PD fwnode properties
    31e9c2751035 extcon: usbc-tusb320: Add support for TUSB320L
    b9c8820d91e9 extcon: usbc-tusb320: Add support for mode setting and reset
    4524599a6a29 usb: typec: tipd: Fix spurious fwnode_handle_put in error path
    b0d86eacc849 usb: typec: tipd: Cleanup resources if devm_tps6598_psy_register fails
    ba75be6f0d9d usb: typec: tcpci: fix of node refcount leak in tcpci_register_port()
    154d5713a241 usb: typec: Check for ops->exit instead of ops->enter in altmode_exit
    1f5661388f43 staging: vme_user: Fix possible UAF in tsi148_dma_list_add
    a3c4bc261605 usb: fotg210-udc: Fix ages old endianness issues
    5e87d412219e uio: uio_dmem_genirq: Fix deadlock between irq config and handling
    79a4bdb6b992 uio: uio_dmem_genirq: Fix missing unlock in irq configuration
    3f22a273ef7c vfio: platform: Do not pass return buffer to ACPI _RST method
    417ef049e3fd class: fix possible memory leak in __class_register()
    f76824ab2bac serial: 8250_bcm7271: Fix error handling in brcmuart_init()
    6b4424efcfaa serial: tegra: Read DMA status before terminating
    a0ead7e8da84 drivers: dio: fix possible memory leak in dio_init()
    e8985caf0589 RISC-V: Align the shadow stack
    ca48174a7643 IB/IPoIB: Fix queue count inconsistency for PKEY child interfaces
    82bd423ed977 hwrng: geode - Fix PCI device refcount leak
    2b79a5e56077 hwrng: amd - Fix PCI device refcount leak
    42cbff35f475 crypto: img-hash - Fix variable dereferenced before check 'hdev->req'
    b9634f99b6d4 RDMA/hns: Fix error code of CMD
    b06bb747ce1f RDMA/hns: Fix page size cap from firmware
    4c05c7cf2581 RDMA/hns: Fix PBL page MTR find
    fa267c419216 RDMA/hns: Fix AH attr queried by query_qp
    e27fb26e75cf orangefs: Fix sysfs not cleanup when dev init failed
    3e9c395ef2d5 PCI: mt7621: Add sentinel to quirks table
    bcc65c2e2a06 PCI: mt7621: Rename mt7621_pci_ to mt7621_pcie_
    0a7eab1cc436 RDMA/srp: Fix error return code in srp_parse_options()
    63011001792c RDMA/hfi1: Fix error return code in parse_platform_config()
    339ca035af43 riscv/mm: add arch hook arch_clear_hugepage_flags
    20d363dcd6dc crypto: omap-sham - Use pm_runtime_resume_and_get() in omap_sham_probe()
    815b65d714f8 crypto: amlogic - Remove kcalloc without check
    af71199291db RDMA/nldev: Fix failure to send large messages
    bb895786a49d f2fs: avoid victim selection from previous victim section
    655e955debde RDMA/nldev: Add checks for nla_nest_start() in fill_stat_counter_qps()
    1895e908b3ae scsi: snic: Fix possible UAF in snic_tgt_create()
    09a60f908d8b scsi: fcoe: Fix transport not deattached when fcoe_if_init() fails
    e59da172059f scsi: ipr: Fix WARNING in ipr_init()
    c444f58fdad6 scsi: scsi_debug: Fix possible name leak in sdebug_add_host_helper()
    4e4968dfb5fa scsi: fcoe: Fix possible name leak when device_register() fails
    0f5006d7d13b scsi: scsi_debug: Fix a warning in resp_report_zones()
    2432719b1afc scsi: scsi_debug: Fix a warning in resp_verify()
    038359eeccff scsi: efct: Fix possible memleak in efct_device_init()
    23053a792647 scsi: hpsa: Fix possible memory leak in hpsa_add_sas_device()
    2ab6d5927c7b scsi: hpsa: Fix error handling in hpsa_add_sas_host()
    6a92129c8f99 scsi: mpt3sas: Fix possible resource leaks in mpt3sas_transport_port_add()
    26c0f7e1ac92 padata: Fix list iterator in padata_do_serial()
    17afa98bccec padata: Always leave BHs disabled when running ->parallel()
    221afb2a1b8d crypto: tcrypt - Fix multibuffer skcipher speed test mem leak
    bfe10a1d9fbc scsi: hpsa: Fix possible memory leak in hpsa_init_one()
    38ef0c0b0973 dt-bindings: visconti-pcie: Fix interrupts array max constraints
    83aad8111bcf dt-bindings: imx6q-pcie: Fix clock names for imx6sx and imx8mq
    f64f08b9e6fb RDMA/rxe: Fix NULL-ptr-deref in rxe_qp_do_cleanup() when socket create failed
    35f9cd060e68 RDMA/hns: fix memory leak in hns_roce_alloc_mr()
    6d5220a553de crypto: ccree - Make cc_debugfs_global_fini() available for module init function
    2e9cf3e78311 RDMA/hfi: Decrease PCI device reference count in error path
    7f476d639c89 PCI: Check for alloc failure in pci_request_irq()
    49bc2be89759 RDMA/hns: Fix ext_sge num error when post send
    0e6160d79db7 RDMA/hns: Repacing 'dseg_len' by macros in fill_ext_sge_inl_data()
    e5ea48788ed6 crypto: hisilicon/qm - add missing pci_dev_put() in q_num_set()
    442caec12f4f crypto: cryptd - Use request context instead of stack for sub-request
    ab677729fc5c crypto: ccree - Remove debugfs when platform_driver_register failed
    0328ca389a80 scsi: scsi_debug: Fix a warning in resp_write_scat()
    1ba8ecb66432 RDMA/siw: Set defined status for work completion with undefined status
    6e757005ba49 RDMA/nldev: Return "-EAGAIN" if the cm_id isn't from expected port
    f981c697b2f9 RDMA/core: Make sure "ib_port" is valid when access sysfs node
    13586753ae55 RDMA/restrack: Release MR restrack when delete
    6e78ca677fa2 PCI: vmd: Disable MSI remapping after suspend
    47e31b86edff IB/mad: Don't call to function that might sleep while in atomic context
    f8d8fbd3b6d6 RDMA/siw: Fix immediate work request flush to completion queue
    2a26849d793b scsi: qla2xxx: Fix set-but-not-used variable warnings
    799ed3755951 RDMA/irdma: Report the correct link speed
    d40d1b1c61a4 f2fs: fix to destroy sbi->post_read_wq in error path of f2fs_fill_super()
    847f725006e3 f2fs: fix normal discard process
    865bb7b5a7de f2fs: fix to invalidate dcc->f2fs_issue_discard in error path
    5f509fa740b1 apparmor: Fix memleak in alloc_ns()
    46f3cb83e480 crypto: rockchip - rework by using crypto_engine
    3ed0548d395f crypto: rockchip - remove non-aligned handling
    5562009f5f88 crypto: rockchip - better handle cipher key
    26f397135606 crypto: rockchip - add fallback for ahash
    34fe54af3cf5 crypto: rockchip - add fallback for cipher
    314217591ec6 crypto: rockchip - do not store mode globally
    853cd97d2bc1 crypto: rockchip - do not do custom power management
    d5100272e478 f2fs: Fix the race condition of resize flag between resizefs
    db72c5dffcba PCI: pci-epf-test: Register notifier if only core_init_notifier is enabled
    26ffeff67b9a RDMA/core: Fix order of nldev_exit call
    a00a7ac25114 PCI: dwc: Fix n_fts[] array overrun
    10ae636115b5 apparmor: Use pointer to struct aa_label for lbs_cred
    8d50ccfbe27b scsi: core: Fix a race between scsi_done() and scsi_timeout()
    9bdf3a59b3dd crypto: nitrox - avoid double free on error path in nitrox_sriov_init()
    7efc0d39ee06 crypto: sun8i-ss - use dma_addr instead u32
    aaef0bdd7ad2 crypto: hisilicon/qm - fix missing destroy qp_idr
    d567776ae289 apparmor: Fix abi check to include v8 abi
    bc9d2cbbdcd3 apparmor: fix lockdep warning when removing a namespace
    775a37ffa9f4 apparmor: fix a memleak in multi_transaction_new()
    09f30f394e83 net: dsa: tag_8021q: avoid leaking ctx on dsa_tag_8021q_register() error path
    86664b865239 i40e: Fix the inability to attach XDP program on downed interface
    0abd337acdd2 stmmac: fix potential division by 0
    93a4a0455871 Bluetooth: RFCOMM: don't call kfree_skb() under spin_lock_irqsave()
    8d6bbe5241e7 Bluetooth: hci_core: don't call kfree_skb() under spin_lock_irqsave()
    804de4e24a5a Bluetooth: hci_bcsp: don't call kfree_skb() under spin_lock_irqsave()
    1030c3aeeef9 Bluetooth: hci_h5: don't call kfree_skb() under spin_lock_irqsave()
    9fcb5b367e6c Bluetooth: hci_ll: don't call kfree_skb() under spin_lock_irqsave()
    14cc94a59852 Bluetooth: hci_qca: don't call kfree_skb() under spin_lock_irqsave()
    06467130d521 Bluetooth: btusb: don't call kfree_skb() under spin_lock_irqsave()
    e52b7d460a30 Bluetooth: btintel: Fix missing free skb in btintel_setup_combined()
    f7c9de3bcfcd Bluetooth: MGMT: Fix error report for ADD_EXT_ADV_PARAMS
    2addf3cb6381 sctp: sysctl: make extra pointers netns aware
    21296a52caa6 ntb_netdev: Use dev_kfree_skb_any() in interrupt context
    0fff763f110f net: lan9303: Fix read error execution path
    882bad40a008 can: tcan4x5x: Fix use of register error status mask
    d50092f662ec can: m_can: Call the RAM init directly from m_can_chip_config
    55064642aac1 can: tcan4x5x: Remove invalid write in clear_interrupts
    641eef876657 net: amd-xgbe: Check only the minimum speed for active/passive cables
    60b35e28dc2a net: amd-xgbe: Fix logic around active and passive cables
    d436bf39f47b af_unix: call proto_unregister() in the error path in af_unix_init()
    ee9d03bf8907 net: amd: lance: don't call dev_kfree_skb() under spin_lock_irqsave()
    6f1c4c01cc9b hamradio: don't call dev_kfree_skb() under spin_lock_irqsave()
    eb2c6a6e8f75 net: ethernet: dnet: don't call dev_kfree_skb() under spin_lock_irqsave()
    ef08e1082c45 net: emaclite: don't call dev_kfree_skb() under spin_lock_irqsave()
    2786ef4066d9 net: apple: bmac: don't call dev_kfree_skb() under spin_lock_irqsave()
    d81314e2dded net: apple: mace: don't call dev_kfree_skb() under spin_lock_irqsave()
    9a6544343bba net/tunnel: wait until all sk_user_data reader finish before releasing the sock
    998b4e54f517 net: farsync: Fix kmemleak when rmmods farsync
    71605c690621 ethernet: s2io: don't call dev_kfree_skb() under spin_lock_irqsave()
    ce1b3a41e796 of: overlay: fix null pointer dereferencing in find_dup_cset_node_entry() and find_dup_cset_prop()
    8399b9893548 drivers: net: qlcnic: Fix potential memory leak in qlcnic_sriov_init()
    96e50897029f net: stmmac: fix possible memory leak in stmmac_dvr_probe()
    ecaf934e4412 net: stmmac: selftests: fix potential memleak in stmmac_test_arpoffload()
    e1359bc90a49 net: defxx: Fix missing err handling in dfx_init()
    c65603abc389 net: vmw_vsock: vmci: Check memcpy_from_msg()
    9de42116fc45 clk: socfpga: Fix memory leak in socfpga_gate_init()
    e515881adeb1 bpf: Do not zero-extend kfunc return values
    ce61a877c79f blktrace: Fix output non-blktrace event when blk_classic option enabled
    f2ae56fa0b61 wifi: brcmfmac: Fix error return code in brcmf_sdio_download_firmware()
    23060daf3759 wifi: rtl8xxxu: Fix the channel width reporting
    6d0e00334e31 wifi: rtl8xxxu: Add __packed to struct rtl8723bu_c2h
    e69d38065080 spi: spi-gpio: Don't set MOSI as an input if not 3WIRE mode
    4e501a31af8e clk: samsung: Fix memory leak in _samsung_clk_register_pll()
    441c05485cf1 media: coda: Add check for kmalloc
    b99872178e74 media: coda: Add check for dcoda_iram_alloc
    fbf081ebe268 media: c8sectpfe: Add of_node_put() when breaking out of loop
    2a7330d8200e regulator: qcom-labibb: Fix missing of_node_put() in qcom_labibb_regulator_probe()
    ecf1b317a86b mmc: core: Normalize the error handling branch in sd_read_ext_regs()
    7fecca429e6e memstick/ms_block: Add check for alloc_ordered_workqueue
    b77ced3fce5c memstick: ms_block: Add error handling support for add_disk()
    ae00eb67792b mmc: renesas_sdhi: alway populate SCC pointer
    88fa6a4e39c1 mmc: mmci: fix return value check of mmc_add_host()
    29c3690969e7 mmc: wbsd: fix return value check of mmc_add_host()
    0959cc1685eb mmc: via-sdmmc: fix return value check of mmc_add_host()
    e0cfe7aa41f3 mmc: meson-gx: fix return value check of mmc_add_host()
    62005dfcc396 mmc: omap_hsmmc: fix return value check of mmc_add_host()
    1925472dec31 mmc: atmel-mci: fix return value check of mmc_add_host()
    58c3a8d0f1ab mmc: wmt-sdmmc: fix return value check of mmc_add_host()
    afc898019e7b mmc: vub300: fix return value check of mmc_add_host()
    6444079767b6 mmc: toshsd: fix return value check of mmc_add_host()
    df683201c7ff mmc: rtsx_usb_sdmmc: fix return value check of mmc_add_host()
    30dc645461df mmc: rtsx_pci: fix return value check of mmc_add_host()
    bc7e8744f581 mmc: pxamci: fix return value check of mmc_add_host()
    2d496050ded8 mmc: mxcmmc: fix return value check of mmc_add_host()
    f0502fe86a2d mmc: moxart: fix return value check of mmc_add_host()
    29c5b4da41f3 mmc: alcor: fix return value check of mmc_add_host()
    52e0d8a8dda3 riscv, bpf: Emit fixed-length instructions for BPF_PSEUDO_FUNC
    0de70ed675fa NFSv4.x: Fail client initialisation if state manager thread can't run
    7055c878a0ec SUNRPC: Fix missing release socket in rpc_sockname()
    79d4cd40da5a xprtrdma: Fix regbuf data not freed in rpcrdma_req_create()
    cba633b24a98 ALSA: mts64: fix possible null-ptr-defer in snd_mts64_interrupt
    9018550d96df media: saa7164: fix missing pci_disable_device()
    2df1e2a6ec52 ALSA: pcm: Set missing stop_operating flag at undoing trigger start
    a443c55d96de bpf, sockmap: fix race in sock_map_free()
    5229b9033713 hwmon: (jc42) Restore the min/max/critical temperatures on resume
    785f5c732ab8 hwmon: (jc42) Convert register access and caching to regmap/regcache
    c4c64d8abd65 regulator: core: fix resource leak in regulator_register()
    07f82dca1122 configfs: fix possible memory leak in configfs_create_dir()
    21a061772b08 hsr: Synchronize sequence number updates.
    a82f5b2e0864 hsr: Synchronize sending frames to have always incremented outgoing seq nr.
    bb3b40cd6ae5 hsr: Disable netpoll.
    8e148d981bcc hsr: Avoid double remove of a node.
    9387cbf7f7fd hsr: Add a rcu-read lock to hsr_forward_skb().
    a051e10bfc69 clk: qcom: clk-krait: fix wrong div2 functions
    8275c7465d9e clk: qcom: lpass-sc7180: Fix pm_runtime usage
    91657ec4d0e5 regulator: core: fix module refcount leak in set_supply()
    66976a3be9bc wifi: mt76: fix coverity overrun-call in mt76_get_txpower()
    a21e3f6f414b wifi: mt76: mt7921: fix reporting of TX AGGR histogram
    c8659018b630 mt76: stop the radar detector after leaving dfs channel
    ae19622e7ff8 wifi: cfg80211: Fix not unregister reg_pdev when load_builtin_regdb_keys() fails
    2e32f1299814 wifi: mac80211: fix memory leak in ieee80211_if_add()
    f58888434d75 spi: spidev: mask SPI_CS_HIGH in SPI_IOC_RD_MODE
    b6d27d9250e7 bonding: uninitialized variable in bond_miimon_inspect()
    7201e4f4f52e bpf, sockmap: Fix data loss caused by using apply_bytes on ingress redirect
    6105ed3598e1 bpf, sockmap: Fix missing BPF_F_INGRESS flag when using apply_bytes
    8786bde11a4f bpf, sockmap: Fix repeated calls to sock_put() when msg has more_data
    a222f992ce5b Input: wistron_btns - disable on UML
    d78649c21bbb netfilter: conntrack: set icmpv6 redirects as RELATED
    09fe3b139268 ASoC: pcm512x: Fix PM disable depth imbalance in pcm512x_probe
    8876793e56ec drm/amdkfd: Fix memory leakage
    8f2d2badf8ca drm/amdgpu: Fix PCI device refcount leak in amdgpu_atrm_get_bios()
    88c6e0995c04 drm/radeon: Fix PCI device refcount leak in radeon_atrm_get_bios()
    0af0ff9fc00d drm/amd/pm/smu11: BACO is supported when it's in BACO state
    27e7cf595d4a ASoC: mediatek: mt8173: Enable IRQ when pdata is ready
    905e5653756a ASoC: mediatek: mt8173: Fix debugfs registration for components
    d8e32f1bf1a9 wifi: iwlwifi: mvm: fix double free on tx path.
    d0bb44775c44 ALSA: asihpi: fix missing pci_disable_device()
    f12377abac15 NFS: Fix an Oops in nfs_d_automount()
    9a96aff53c21 NFSv4: Fix a deadlock between nfs4_open_recover_helper() and delegreturn
    c6aca4c7ba8f NFSv4: Fix a credential leak in _nfs4_discover_trunking()
    7f6607c88426 NFSv4.2: Fix initialisation of struct nfs4_label
    51899eefd1a6 NFSv4.2: Fix a memory stomp in decode_attr_security_label
    34dffc77ddf6 NFSv4.2: Clear FATTR4_WORD2_SECURITY_LABEL when done decoding
    d926611c89ac ASoC: mediatek: mtk-btcvsd: Add checks for write and read of mtk_btcvsd_snd
    f243ff92d6d3 ASoC: dt-bindings: wcd9335: fix reset line polarity in example
    41d7b8291c6d drm/tegra: Add missing clk_disable_unprepare() in tegra_dc_probe()
    2376d7fa08bb media: s5p-mfc: Add variant data for MFC v7 hardware for Exynos 3250 SoC
    210fcf64be4d media: dvb-usb: az6027: fix null-ptr-deref in az6027_i2c_xfer()
    b223cc15f922 media: dvb-core: Fix ignored return value in dvb_register_frontend()
    825a8af31d6b pinctrl: pinconf-generic: add missing of_node_put()
    eedc698d6610 clk: imx8mn: fix imx8mn_enet_phy_sels clocks list
    f86a432604c3 clk: imx8mn: fix imx8mn_sai2_sels clocks list
    5e98c3a34503 clk: imx: replace osc_hdmi with dummy
    9453e097b862 clk: imx8mn: rename vpu_pll to m7_alt_pll
    bffc80bac8c5 media: imon: fix a race condition in send_packet()
    9c9ff35d6869 media: vimc: Fix wrong function called when vimc_init() fails
    f849c116d320 ASoC: qcom: Add checks for devm_kcalloc
    16437645dd97 drbd: destroy workqueue when drbd device was freed
    cdaf45415c1e drbd: remove call to memset before free device/resource/connection
    f35981083cb3 mtd: maps: pxa2xx-flash: fix memory leak in probe
    87c750affd88 bonding: fix link recovery in mode 2 when updelay is nonzero
    02105f0b3021 drm/amdgpu: fix pci device refcount leak
    5b0a1f1247cd clk: rockchip: Fix memory leak in rockchip_clk_register_pll()
    27aac5c01246 regulator: core: use kfree_const() to free space conditionally
    a69b1faa9b14 ALSA: seq: fix undefined behavior in bit shift for SNDRV_SEQ_FILTER_USE_EVENT
    9c0f3617ba31 ALSA: pcm: fix undefined behavior in bit shift for SNDRV_PCM_RATE_KNOT
    6159424e2dd9 pinctrl: k210: call of_node_put()
    18a973fcb190 HID: hid-sensor-custom: set fixed size for custom attributes
    0fc4280dbec3 bpf: Move skb->len == 0 checks into __bpf_redirect
    8dbcb4c284bc mtd: spi-nor: Fix the number of bytes for the dummy cycles
    58e1a0ef5255 mtd: spi-nor: hide jedec_id sysfs attribute if not present
    348d95e39fec inet: add READ_ONCE(sk->sk_bound_dev_if) in inet_csk_bind_conflict()
    4451bef1a3dd media: videobuf-dma-contig: use dma_mmap_coherent
    b2781a862608 media: platform: exynos4-is: Fix error handling in fimc_md_init()
    7cf71bbe5d2e media: solo6x10: fix possible memory leak in solo_sysfs_init()
    c290aa527fd8 media: vidtv: Fix use-after-free in vidtv_bridge_dvb_init()
    648f3031025a Input: elants_i2c - properly handle the reset GPIO when power is off
    e0d3e46ac666 mtd: lpddr2_nvm: Fix possible null-ptr-deref
    ab4e42f51931 drm/msm/a6xx: Fix speed-bin detection vs probe-defer
    fea795f7c7cf wifi: ath10k: Fix return value in ath10k_pci_init()
    77482c4dd4a0 block: clear ->slave_dir when dropping the main slave_dir reference
    62251948e2e7 ima: Fix misuse of dereference of pointer in template_desc_init_fields()
    29d6c69ba4b9 integrity: Fix memory leakage in keyring allocation error path
    8e6df9571744 drm/fourcc: Fix vsub/hsub for Q410 and Q401
    ec1727f89ecd drm/fourcc: Add packed 10bit YUV 4:2:0 format
    f72608b8dd08 regulator: qcom-rpmh: Fix PMR735a S3 regulator spec
    63d011ad0505 nvme: return err on nvme_init_non_mdts_limits fail
    f289a38df0da amdgpu/pm: prevent array underflow in vega20_odn_edit_dpm_table()
    cda1895f3b7f regulator: core: fix unbalanced of node refcount in regulator_dev_lookup()
    1a5aaa5736eb nvmet: only allocate a single slab for bvecs
    cb3033a43263 libbpf: Fix uninitialized warning in btf_dump_dump_type_data
    83baa509396a ASoC: pxa: fix null-pointer dereference in filter()
    a06ba0f7f859 drm/mediatek: Modify dpi power on/off sequence.
    6d25bc637081 drm/radeon: Add the missed acpi_put_table() to fix memory leak
    4cf11e9d3144 bfq: fix waker_bfqq inconsistency crash
    55e822212e78 rxrpc: Fix ack.bufferSize to be 0 when generating an ack
    5ef8bf0df14d net, proc: Provide PROC_FS=n fallback for proc_create_net_single_write()
    d1c44928bb3c media: camss: Clean up received buffers on failed start of streaming
    3b4b4df3f8d8 wifi: rsi: Fix handling of 802.3 EAPOL frames sent via control port
    9e1440c858e6 Input: joystick - fix Kconfig warning for JOYSTICK_ADC
    71212d731848 mtd: Fix device name leak when register device failed in add_mtd_device()
    106311677b27 clk: qcom: gcc-sm8250: Use retention mode for USB GDSCs
    322c7415e77e bpf: propagate precision across all frames, not just the last one
    07c286c10a9c bpf: Check the other end of slot_type for STACK_SPILL
    fdbc363bc1d0 bpf: propagate precision in ALU/ALU64 operations
    b29e46610cfe media: platform: exynos4-is: fix return value check in fimc_md_probe()
    ab54081a2843 media: vivid: fix compose size exceed boundary
    3c58c83c6fc8 bpf: Fix slot type check in check_stack_write_var_off
    cffa75198ca1 drm/msm/hdmi: use devres helper for runtime PM management
    58d002b72e0a drm/msm/hdmi: drop unused GPIO support
    2d4bc60693c4 ima: Handle -ESTALE returned by ima_filter_rule_match()
    13fc167e1645 drm/panel/panel-sitronix-st7701: Remove panel on DSI attach failure
    c20672cfa097 spi: Update reference to struct spi_controller
    2858d038c5d3 clk: renesas: r9a06g032: Repair grave increment error
    f6ed73db3903 drm/rockchip: lvds: fix PM usage counter unbalance in poweron
    13fab6322b9f can: kvaser_usb: Compare requested bittiming parameters with actual parameters in do_set_{,data}_bittiming
    4e55d61e87f2 can: kvaser_usb: Add struct kvaser_usb_busparams
    fcfd4df200ff can: kvaser_usb_leaf: Fix bogus restart events
    51f07da38bae can: kvaser_usb_leaf: Fix wrong CAN state after stopping
    647c26887b5b can: kvaser_usb_leaf: Fix improved state not being reported
    9676d65a4ad3 can: kvaser_usb: make use of units.h in assignment of frequency
    c76110856281 can: kvaser_usb_leaf: Set Warning state even without bus errors
    a60bf9d81473 can: kvaser_usb: kvaser_usb_leaf: Handle CMD_ERROR_EVENT
    8aae6bddc1d3 can: kvaser_usb: kvaser_usb_leaf: Rename {leaf,usbcan}_cmd_error_event to {leaf,usbcan}_cmd_can_error_event
    972270be2452 can: kvaser_usb: kvaser_usb_leaf: Get capabilities from device
    e9e0d9945fd1 can: kvaser_usb: do not increase tx statistics when sending error message frames
    e39bce64e58e libbpf: Btf dedup identical struct test needs check for nested structs/arrays
    d4419f93e214 media: exynos4-is: don't rely on the v4l2_async_subdev internals
    8741792d8274 soreuseport: Fix socket selection for SO_INCOMING_CPU.
    094f56192c56 venus: pm_helpers: Fix error check in vcodec_domains_get()
    3c793a9ad9d3 media: i2c: ad5820: Fix error path
    07611f9e44e1 media: adv748x: afe: Select input port when initializing AFE
    aa81257dbf3b media: coda: jpeg: Add check for kmalloc
    9a402adc9f5e media: v4l2-ctrls: Fix off-by-one error in integer menu control check
    1caed03305b5 drm/amdgpu/powerplay/psm: Fix memory leak in power state init
    f66a8770832e ipmi: kcs: Poll OBF briefly to reduce OBE latency
    983320199e33 ata: libata: fix NCQ autosense logic
    a9caf71aeb48 ata: add/use ata_taskfile::{error|status} fields
    3483c3fb4877 ata: libata: move ata_{port,link,dev}_dbg to standard pr_XXX() macros
    67061355776e libbpf: Fix null-pointer dereference in find_prog_by_sec_insn()
    a733bf10198e libbpf: Fix use-after-free in btf_dump_name_dups
    b5ec2a04fed3 drm/bridge: adv7533: remove dynamic lane switching from adv7533 bridge
    6d40a49d0559 wifi: rtl8xxxu: Fix reading the vendor of combo chips
    355f16f756aa wifi: ath9k: hif_usb: Fix use-after-free in ath9k_hif_usb_reg_in_cb()
    d856f7574bcc wifi: ath9k: hif_usb: fix memory leak of urbs in ath9k_hif_usb_dealloc_tx_urbs()
    12229a2523f0 platform/mellanox: mlxbf-pmc: Fix event typo
    a0d93aac54ce rapidio: devices: fix missing put_device in mport_cdev_open
    7af9cb8cbb81 hfs: Fix OOB Write in hfs_asc2mac
    90962b3b1c3b relay: fix type mismatch when allocating memory in relay_create_buf()
    0d60b11f8fce eventfd: change int to __u64 in eventfd_signal() ifndef CONFIG_EVENTFD
    2f5cc7fd73fd rapidio: fix possible UAF when kfifo_alloc() fails
    337b68da6856 fs: sysv: Fix sysv_nblocks() returns wrong value
    95d42a8d3d4a lockd: set other missing fields when unlocking files
    318229b4d35b MIPS: OCTEON: warn only once if deprecated link status is being used
    5e6d37a93a38 MIPS: BCM63xx: Add check for NULL for clk in clk_enable
    50af0ba3e163 platform/x86: intel_scu_ipc: fix possible name leak in __intel_scu_ipc_register()
    3cf81501356c platform/x86: mxm-wmi: fix memleak in mxm_wmi_call_mx[ds|mx]()
    0ceadb5a3e45 platform/chrome: cros_ec_typec: zero out stale pointers
    49c98b568881 platform/chrome: cros_ec_typec: Cleanup switch handle return paths
    b55ef8508ac4 PM: runtime: Do not call __rpm_callback() from rpm_idle()
    0bf874183b32 xen/privcmd: Fix a possible warning in privcmd_ioctl_mmap_resource()
    70966d6b0f59 x86/xen: Fix memory leak in xen_init_lock_cpu()
    23aef94eea71 x86/xen: Fix memory leak in xen_smp_intr_init{_pv}()
    03ab1c5c2f0b uprobes/x86: Allow to probe a NOP instruction with 0x66 prefix
    6fde666278f9 ACPICA: Fix use-after-free in acpi_ut_copy_ipackage_to_ipackage()
    9cabd5f4f1ba clocksource/drivers/timer-ti-dm: Fix missing clk_disable_unprepare in dmtimer_systimer_init_clock()
    b73c76c3c445 cpu/hotplug: Do not bail-out in DYING/STARTING sections
    6eb1802184df cpu/hotplug: Make target_store() a nop when target == state
    cd130e2676dd futex: Resend potentially swallowed owner death notification
    fd8a10d44c11 futex: Move to kernel/futex/
    156144bd18c3 mips: ralink: mt7621: do not use kzalloc too early
    186d59bb6a54 mips: ralink: mt7621: soc queries and tests as functions
    8348da01e5c6 mips: ralink: mt7621: define MT7621_SYSC_BASE with __iomem
    0f8e6fe09cfa clocksource/drivers/sh_cmt: Access registers according to spec
    a47de2fd3f88 rapidio: rio: fix possible name leak in rio_register_mport()
    ec3f04f74f50 rapidio: fix possible name leaks when rio_add_device() fails
    4662d8e6ab20 debugfs: fix error when writing negative value to atomic_t debugfs file
    7e8e8cc13625 lib/notifier-error-inject: fix error when writing -errno to debugfs file
    39b5e6130b73 libfs: add DEFINE_SIMPLE_ATTRIBUTE_SIGNED for signed value
    19c202e6e55c cpufreq: amd_freq_sensitivity: Add missing pci_dev_put()
    93e3c803383a genirq/irqdesc: Don't try to remove non-existing sysfs files
    435cc7d18c96 nfsd: don't call nfsd_file_put from client states seqfile display
    5030d4d2bf8b NFSD: Finish converting the NFSv2 GETACL result encoder
    e498675e0684 SUNRPC: Return true/false (not 1/0) from bool functions
    3e255dc21031 EDAC/i10nm: fix refcount leak in pci_get_dev_wrapper()
    740efb64ca5e irqchip/wpcm450: Fix memory leak in wpcm450_aic_of_init()
    77b99b483f82 irqchip: gic-pm: Use pm_runtime_resume_and_get() in gic_probe()
    5139cbc0c6e4 thermal: core: fix some possible name leaks in error paths
    cab345f9d519 platform/chrome: cros_usbpd_notify: Fix error handling in cros_usbpd_notify_init()
    0358bc7cc21a perf/x86/intel/uncore: Fix reference count leak in __uncore_imc_init_box()
    433bd587dca5 perf/x86/intel/uncore: Fix reference count leak in snr_uncore_mmio_map()
    3485f1975180 perf/x86/intel/uncore: Fix reference count leak in hswep_has_limit_sbox()
    0021ef7dc612 perf/x86/intel/uncore: Fix reference count leak in sad_cfg_iio_topology()
    c12b314bb23d PNP: fix name memory leak in pnp_alloc_dev()
    f1c7a6af710c selftests/efivarfs: Add checking of the test return value
    46be3ee1cab9 MIPS: vpe-cmp: fix possible memory leak while module exiting
    e820a8192ff6 MIPS: vpe-mt: fix possible memory leak while module exiting
    61d68cf2ba79 ocfs2: fix memory leak in ocfs2_stack_glue_init()
    e83b47580a07 lib/fonts: fix undefined behavior in bit shift for get_default_font
    0df7d9ab6bce proc: fixup uptime selftest
    07b8659b8e5b timerqueue: Use rb_entry_safe() in timerqueue_getnext()
    413b18866b40 platform/x86: huawei-wmi: fix return value calculation
    4b469322830d lib/debugobjects: fix stat count and optimize debug_objects_mem_init
    f790dfe81629 perf: Fix possible memleak in pmu_dev_alloc()
    418d21c0df5b selftests/ftrace: event_triggers: wait longer for test_event_enable
    4ea765b10624 cpufreq: qcom-hw: Fix memory leak in qcom_cpufreq_hw_read_lut()
    c52d9c25d95c fs: don't audit the capability check in simple_xattr_list()
    e4d0d13b46c6 PM: hibernate: Fix mistake in kerneldoc comment
    1f62b8e50dd2 x86/sgx: Reduce delay and interference of enclave release
    f5b88170f09c alpha: fix syscall entry in !AUDUT_SYSCALL case
    a819ba80b99c alpha: fix TIF_NOTIFY_SIGNAL handling
    eb2a732ef451 cpuidle: dt: Return the correct numbers of parsed idle states
    3af4f5cb8ae7 sched/uclamp: Make asym_fits_capacity() use util_fits_cpu()
    23cb580e0c6b sched/core: Introduce sched_asym_cpucap_active()
    41c2dba3885e sched/fair: Removed useless update of p->recent_used_cpu
    55ffeab089aa sched/uclamp: Make select_idle_capacity() use util_fits_cpu()
    4639bfbb83bd sched/uclamp: Make task_fits_capacity() use util_fits_cpu()
    309e50cbfefc sched/uclamp: Fix relationship between uclamp and migration margin
    54a766e19681 sched/fair: Cleanup task_util and capacity type
    26bffaf6784a ovl: remove privs in ovl_fallocate()
    5dc34f9aaaf4 ovl: remove privs in ovl_copyfile()
    9636e70ee2d3 ovl: use ovl_copy_{real,upper}attr() wrappers
    a54843833caf ovl: store lower path in ovl_inode
    163c5bbe7d2f tpm/tpm_crb: Fix error message in __crb_relinquish_locality()
    fe880e9df97a tpm/tpm_ftpm_tee: Fix error handling in ftpm_mod_init()
    ebc73c4f2662 pstore: Avoid kcore oops by vmap()ing with VM_IOREMAP
    d4dcde11bff2 ARM: mmp: fix timer_read delay
    95916147dcc7 pstore/ram: Fix error return code in ramoops_probe()
    a31a647a3d10 seccomp: Move copy_seccomp() to no failure path.
    b8b76b8da66d arm64: dts: armada-3720-turris-mox: Add missing interrupt for RTC
    820a5ccca7c3 ARM: dts: turris-omnia: Add switch port 6 node
    b311f8e9f503 ARM: dts: turris-omnia: Add ethernet aliases
    48ebdd06c93c ARM: dts: armada-39x: Fix assigned-addresses for every PCIe Root Port
    f27dd04e44d8 ARM: dts: armada-38x: Fix assigned-addresses for every PCIe Root Port
    1e53c63da8df ARM: dts: armada-375: Fix assigned-addresses for every PCIe Root Port
    3af1a73e9e30 ARM: dts: armada-xp: Fix assigned-addresses for every PCIe Root Port
    e4ed8133c46d ARM: dts: armada-370: Fix assigned-addresses for every PCIe Root Port
    b335b6344ee1 ARM: dts: dove: Fix assigned-addresses for every PCIe Root Port
    5b3415e68336 arm64: dts: mediatek: mt6797: Fix 26M oscillator unit name
    93f5e6649619 arm64: dts: mediatek: pumpkin-common: Fix devicetree warnings
    debd938e21cd arm64: dts: mt2712-evb: Fix usb vbus regulators unit names
    b2c6397754f1 arm64: dts: mt2712-evb: Fix vproc fixed regulators unit names
    96c972f83593 arm64: dts: mt2712e: Fix unit address for pinctrl node
    2cd1391c28e8 arm64: dts: mt2712e: Fix unit_address_vs_reg warning for oscillators
    39877a3636cd arm64: dts: mt6779: Fix devicetree build warnings
    af431ce47ef0 ARM: dts: nuvoton: Remove bogus unit addresses from fixed-partition nodes
    0a616049ec03 arm64: dts: ti: k3-j721e-main: Drop dma-coherent in crypto node
    22a740824af8 arm64: dts: ti: k3-am65-main: Drop dma-coherent in crypto node
    b131304fe722 perf/smmuv3: Fix hotplug callback leak in arm_smmu_pmu_init()
    b99fbe8d949a perf/arm_dmc620: Fix hotplug callback leak in dmc620_pmu_init()
    9285b623bbe1 perf: arm_dsu: Fix hotplug callback leak in dsu_pmu_init()
    e6318a7e19f5 arm64: mm: kfence: only handle translation faults
    46ddfb9d1e46 arm64: Treat ESR_ELx as a 64-bit register
    681e3401286b soc: ti: smartreflex: Fix PM disable depth imbalance in omap_sr_probe
    6eca7a2535eb soc: ti: knav_qmss_queue: Fix PM disable depth imbalance in knav_queue_probe
    972f8fc0651e soc: ti: knav_qmss_queue: Use pm_runtime_resume_and_get instead of pm_runtime_get_sync
    fe53048f2adb arm: dts: spear600: Fix clcd interrupt
    75baeec4642f arm64: dts: qcom: sm6125: fix SDHCI CQE reg names
    0f9ac041911d soc: qcom: apr: Add check for idr_alloc and of_property_read_string_index
    6855dd02c55d soc: qcom: apr: make code more reuseable
    c9fb81a8355c arm64: dts: qcom: sm8250: drop bogus DP PHY clock
    53ffa5746415 arm64: dts: qcom: sm8350: fix UFS PHY registers
    d5a6bbd7a231 arm64: dts: qcom: sm8250: fix UFS PHY registers
    3a52ff845f12 arm64: dts: qcom: sm8150: fix UFS PHY registers
    800f8165e0ca arm64: dts: qcom: Correct QMP PHY child node name
    ee136f275bad soc: qcom: llcc: make irq truly optional
    aa7ffd41749b arm64: dts: qcom: sm8250: correct LPASS pin pull down
    f94bacc616f2 arm64: dts: qcom: pm660: Use unique ADC5_VCOIN address in node name
    d5bf1197817d drivers: soc: ti: knav_qmss_queue: Mark knav_acc_firmwares as static
    4707d5daf842 ARM: dts: stm32: Fix AV96 WLAN regulator gpio property
    33647d7a467d ARM: dts: stm32: Drop stm32mp15xc.dtsi from Avenger96
    9f271a866071 objtool, kcsan: Add volatile read/write instrumentation to whitelist
    51fe2dcba805 arm64: dts: qcom: msm8916: Drop MSS fallback compatible
    a9fff3524f2a arm64: dts: qcom: sdm845-cheza: fix AP suspend pin bias
    6487f48ea359 arm64: dts: qcom: sdm630: fix UART1 pin bias
    6c0c9c545857 ARM: dts: qcom: apq8064: fix coresight compatible
    0f9b088d68ba arm64: dts: qcom: msm8996: fix GPU OPP table
    270683fc7b3c arm64: dts: qcom: msm8996: fix supported-hw in cpufreq OPP tables
    5c5a62891434 arm64: dts: qcom: msm8996: Add MSM8996 Pro support
    3f14048ee419 arm64: dts: qcom: sm8250-sony-xperia-edo: fix touchscreen bias-disable
    89f79f8d7f30 arm64: dts: qcom: ipq6018-cp01-c1: use BLSPI1 pins
    9db5992e72ed usb: musb: remove extra check in musb_gadget_vbus_draw
    adc063a491a7 drm/amd/display: Manually adjust strobe for DCN303
    5827ddaf4534 Linux 5.15.85
    e22dbadac8d4 net: loopback: use NET_NAME_PREDICTABLE for name_assign_type
    314e7a7836c7 selftests: net: Use "grep -E" instead of "egrep"
    19a78143961a Bluetooth: L2CAP: Fix u8 overflow
    f692abf13940 HID: uclogic: Add HID_QUIRK_HIDINPUT_FORCE quirk
    5325a884e2c3 usb: dwc3: pci: Update PCIe device ID for USB3 controller on CPU sub-system for Raptor Lake
    367e1e3399db igb: Initialize mailbox message for VF reset
    a301742b35bc xhci: Apply XHCI_RESET_TO_DEFAULT quirk to ADL-N
    5e959f0c4c57 USB: serial: f81534: fix division by zero on line-speed change
    68fbe268d2cb USB: serial: f81232: fix division by zero on line-speed change
    3ec7f24b8bb8 USB: serial: cp210x: add Kamstrup RF sniffer PIDs
    2b092fab2340 USB: serial: option: add Quectel EM05-G modem
    6b41a35b41f7 usb: gadget: uvc: Prevent buffer overflow in setup handler
    828112571c92 udf: Fix extending file within last block
    df1a2596c775 udf: Do not bother looking for prealloc extents if i_lenExtents matches i_size
    63dbbd8f1499 udf: Fix preallocation discarding at indirect extent boundary
    79a97f08ae5d udf: Discard preallocation before extending file with a hole

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 716a30060d8c1be02d9711204b5b001e71d7d890)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 122fc0feac..d4f5b1cb20 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e53e73b907707b92b3433de7c9c776aa504b2d0b"
-SRCREV_meta ?= "e77e5259a3d11efe417b164a0f3341c07ba2bc46"
+SRCREV_machine ?= "62705725902924fafa34c7bcb4c18f2e3b7d473c"
+SRCREV_meta ?= "ed03f6685c020866c2f32c4b14c4f343792146d5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.84"
+LINUX_VERSION ?= "5.15.87"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index f060e22e84..a0af388e73 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.84"
+LINUX_VERSION ?= "5.15.87"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ae2415ee19511e205a983bc8024700c1f794076a"
-SRCREV_meta ?= "e77e5259a3d11efe417b164a0f3341c07ba2bc46"
+SRCREV_machine ?= "6d10c8fe87e2037c751157ca8677588fa6e0f214"
+SRCREV_meta ?= "ed03f6685c020866c2f32c4b14c4f343792146d5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index bb48e158ab..a3895dde78 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8c0f02ba7db6a463ca3aef969441906706edb350"
-SRCREV_machine:qemuarm64 ?= "42a14881ba8145b2d1bdfc019c603abe79aeafd4"
-SRCREV_machine:qemumips ?= "1ea321a5c9c66edba818ddffcef2aa9910de552e"
-SRCREV_machine:qemuppc ?= "14da484e7f2fc95e10abb4db96bc5fd6b444cb60"
-SRCREV_machine:qemuriscv64 ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
-SRCREV_machine:qemuriscv32 ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
-SRCREV_machine:qemux86 ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
-SRCREV_machine:qemux86-64 ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
-SRCREV_machine:qemumips64 ?= "8db5fd5c032f44486ef52f34724d0452aa3a6fea"
-SRCREV_machine ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
-SRCREV_meta ?= "e77e5259a3d11efe417b164a0f3341c07ba2bc46"
+SRCREV_machine:qemuarm ?= "7463f1ff9674e97fa6bed05983d4828a219994d9"
+SRCREV_machine:qemuarm64 ?= "09ebb2096efb9e23a1e2c47bf1926dbae0e3f051"
+SRCREV_machine:qemumips ?= "a7058de4f88d9a7a3b3253a31bba703eaf6f78ea"
+SRCREV_machine:qemuppc ?= "e43b0b8b142f689bc2e2297a5ca221fb0f802eb5"
+SRCREV_machine:qemuriscv64 ?= "9768cdc48a9d6cdd9ce0aedc0037d45cfb3f1665"
+SRCREV_machine:qemuriscv32 ?= "9768cdc48a9d6cdd9ce0aedc0037d45cfb3f1665"
+SRCREV_machine:qemux86 ?= "9768cdc48a9d6cdd9ce0aedc0037d45cfb3f1665"
+SRCREV_machine:qemux86-64 ?= "9768cdc48a9d6cdd9ce0aedc0037d45cfb3f1665"
+SRCREV_machine:qemumips64 ?= "75a87ddede429ee1070118f54d38183ee4c81b59"
+SRCREV_machine ?= "9768cdc48a9d6cdd9ce0aedc0037d45cfb3f1665"
+SRCREV_meta ?= "ed03f6685c020866c2f32c4b14c4f343792146d5"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d68f50bfb00f6288e812be895ea5c77932a4b9dd"
+SRCREV_machine:class-devupstream ?= "d57287729e229188e7d07ef0117fe927664e08cb"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.84"
+LINUX_VERSION ?= "5.15.87"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


