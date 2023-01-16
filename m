Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB81C677F1
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 15:05:48 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.168823.1673881542071377505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 07:05:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZkqCVhQh;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id g10so14153553qvo.6
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 07:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLizNxzLZAyIli/K5VyICKrYUQXfCO8xcV21+pcWUJ0=;
        b=ZkqCVhQhTa1YTN9pxMHmzBUU5yDIe/6+ygUUNqEM3g/OoKo2FhHpDYRbxcaUth5OnH
         VmLD4/koM4iNo+QL4oLDuZlCZm0CtPbrm+MkPWlWkMef3Yky0aeUs/WkQC96hFlc0MJA
         2dBqyTNsrlatwsu3jXDv2b+cc8XsWo+5awbXmI63EzJy2Wcy/OHm9i2y5C/uQXlMWUOn
         SkRMPvzVpZYzS3u/7bNWvaGxjT1aRSOrRvad2icqjVZmQPzzvVTIF9eReNwEq3bPTbVJ
         vzYIuuXR3bGFOxx/EKBJhCdICO+1nq/WxsW8OBP6jg1kyeW1ySDCuKqsKo379xIzkXan
         OG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLizNxzLZAyIli/K5VyICKrYUQXfCO8xcV21+pcWUJ0=;
        b=XmPzOJHVjXMw0lACz+XMVZg/4YTxdN0UpRjTpTy4LlCyklNo8RzlpxcpkkCuQO3vsc
         4LcpwW7rh4sWrSo5pAmk3pT8Vu0Tb1o6QUg8A3TFawXhRtgjhsY9ap2xexPLMKHj1crB
         nCh5AxLwuppoY6Ew7q3WGuQNz0z5c46Fltn8Tx1sHFgrn/ID9nHay+yWYDg9WqDsMLBS
         z1h0QOmDikMV8+2EQz3lmO8gsJXIXCWfzy5ej+I/lwamKVRJbON+yo6ROGyW9nZbn822
         Pl/4gGOgNTGNSaQJzrWEbalYo2w51ZgKOJAHMhoiMRKmpLGRfWBmffS5bqtkvVGKCU7m
         5rGg==
X-Gm-Message-State: AFqh2kp1PUZ0vqZ/RVckEyRnb2wz36FUnArTcz4O6xIVVQ8FHGYF2x3Y
	9e078iFraMW2uMjrrkahbvGPBqmV3uU=
X-Google-Smtp-Source: AMrXdXtI6DwI5M/0n8+PvmS5x8V9nCXN9J4r5TsfJIInrmGiVdClq9n5E0x1oczxOxFb3/uAilBFbQ==
X-Received: by 2002:a0c:f6d0:0:b0:532:30d9:2eb1 with SMTP id d16-20020a0cf6d0000000b0053230d92eb1mr119761qvo.9.1673881540556;
        Mon, 16 Jan 2023 07:05:40 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id q30-20020a37f71e000000b006ec62032d3dsm6794402qkj.30.2023.01.16.07.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 07:05:40 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/6.1: update to v6.1.5
Date: Mon, 16 Jan 2023 10:05:34 -0500
Message-Id: <f43f83715786cacd747fbc1ed5a079436727b7ff.1673881447.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673881447.git.bruce.ashfield@gmail.com>
References: <cover.1673881447.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 15:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175993

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    90ca7a874a90 Linux 6.1.5
    177055b94fb5 wifi: ath11k: Send PME message during wakeup from D3cold
    15f818d4b682 efi: random: combine bootloader provided RNG seed with RNG protocol output
    0c84b7de2658 drm/i915/dsi: fix MIPI_BKLT_EN_1 native GPIO index
    c7229577d93d drm/i915/dsi: add support for ICL+ native MIPI GPIO sequence
    5e7d97dbae25 ksmbd: check nt_len to be at least CIFS_ENCPWD_SIZE in ksmbd_decode_ntlmssp_auth_blob
    ad678f30ac0d ksmbd: send proper error response in smb2_tree_connect()
    4cd431722018 ksmbd: fix infinite loop in ksmbd_conn_handler_loop()
    53e9d6851b56 btrfs: handle case when repair happens with dev-replace
    d179f9d27f1e drm/amd/display: Uninitialized variables causing 4k60 UCLK to stay at DPM1 and not DPM0
    4ac1437d64ef drm/amd/display: Add check for DET fetch latency hiding for dcn32
    bff553de2c37 virtio_blk: Fix signedness bug in virtblk_prep_rq()
    569b4f8fb02e virtio-blk: use a helper to handle request queuing errors
    44c0e07e3972 drm/i915/gvt: fix vgpu debugfs clean in remove
    fe340500baf8 drm/i915/gvt: fix gvt debugfs destroy
    306888b1246b drm/amdkfd: Fix kernel warning during topology setup
    c7041ec41036 drm/plane-helper: Add the missing declaration of drm_atomic_state
    c4849f18185f of/fdt: run soc memory setup when early_init_dt_scan_memory fails
    a33220faead6 riscv, kprobes: Stricter c.jr/c.jalr decoding
    36fd385ae2ca riscv: uaccess: fix type of 0 variable on error in get_user()
    7f56c4fa299a thermal: int340x: Add missing attribute for data rate base
    8b258a31c2e8 vhost_vdpa: fix the crash in unmap a large memory
    ed2d0e160ce4 tpm: Allow system suspend to continue when TPM suspend fails
    e595dcd987d0 io_uring: fix CQ waiting timeout handling
    91d129519985 io_uring: pin context while queueing deferred tw
    6d47e0f6a535 block: don't allow splitting of a REQ_NOWAIT bio
    39a20c4354be net: dsa: tag_qca: fix wrong MGMT_DATA2 size
    ec6022235670 net: dsa: qca8k: fix wrong length value for mgmt eth packet
    49d901dce4b9 Revert "net: dsa: qca8k: cache lo and hi for mdio write"
    d54f66bc9c37 Revert "drm/amd/display: Enable Freesync Video Mode by default"
    7f656fff955c bpf: Fix panic due to wrong pageattr of im->image
    a3fb152c2f17 fbdev: matroxfb: G200eW: Increase max memory from 1 MB to 16 MB
    421fd5c9e0ae nfsd: fix handling of readdir in v4root vs. mount upcall timeout
    e8377f0456fb x86/bugs: Flush IBP in ib_prctl_set()
    5bd3c7abeb69 x86/kexec: Fix double-free of elf header buffer
    2dfc2347776e ASoC: SOF: Intel: pci-tgl: unblock S5 entry if DMA stop has failed"
    f6631b9b4f91 nvme: also return I/O command effects from nvme_command_effects
    27eab31ed71f nvmet: use NVME_CMD_EFFECTS_CSUPP instead of open coding it
    84cc257e1888 kunit: alloc_string_stream_fragment error handling bug fix
    8b2de5212661 io_uring: check for valid register opcode earlier
    9c152189a7e8 ACPI: video: Don't enable fallback path for creating ACPI backlight by default
    adaf41b56803 drm/amd/display: Report to ACPI video if no panels were found
    0ba8892d86ad ACPI: video: Allow GPU drivers to report no panels
    183c2aaef40a nvme: fix multipath crash caused by flush request when blktrace is enabled
    a288e98adc02 io_uring/cancel: re-grab ctx mutex after finishing wait
    a02c07b61989 drm/amdkfd: Fix double release compute pasid
    9d74d1f52e16 drm/amdkfd: Fix kfd_process_device_init_vm error handling
    8ba7c55e112f drm/amdgpu: Fix size validation for non-exclusive domains (v4)
    b48f8c9a81be ASoC: SOF: mediatek: initialize panic_info to zero
    ee887708e25e ASoC: Intel: bytcr_rt5640: Add quirk for the Advantech MICA-071 tablet
    30f3e4afe09a 9p/client: fix data race on req->status
    f6e548529bb9 ASoC: SOF: Revert: "core: unregister clients and machine drivers in .shutdown"
    45917be9f0af hfs/hfsplus: avoid WARN_ON() for sanity check, use proper error handling
    f190519b07c7 usb: dwc3: xilinx: include linux/gpio/consumer.h
    2d1dbb030ca8 udf: Fix extension of the last extent in the file
    3ad47c8aa564 caif: fix memory leak in cfctrl_linkup_request()
    7d242f4a0c83 net/ulp: prevent ULP without clone op from entering the LISTEN status
    50c81b35df01 qed: allow sleep in qed_mcp_trace_dump()
    4e0c2961e53d ublk: honor IO_URING_F_NONBLOCK for handling control command
    1022519da69d drm/i915/gvt: fix double free bug in split_2MB_gtt_entry
    20a07570c166 drm/i915: unpin on error in intel_vgpu_shadow_mm_pin()
    c776df09f469 perf stat: Fix handling of --for-each-cgroup with --bpf-counters to match non BPF mode
    36caf0281b91 perf stat: Fix handling of unsupported cgroup events when using BPF counters
    75b9086028ce perf lock contention: Fix core dump related to not finding the "__sched_text_end" symbol on s/390
    a713602807f3 usb: rndis_host: Secure rndis_query check against int overflow
    667ce030bdfb octeontx2-pf: Fix lmtst ID used in aura free
    faecbaf1ffcd drivers/net/bonding/bond_3ad: return when there's no aggregator
    73fee7e1e5ea fs/ntfs3: don't hold ni_lock when calling truncate_setsize()
    71f9fd5bcf09 drm/imx: ipuv3-plane: Fix overlay plane width
    2bb8016d4bb0 perf tools: Fix resources leak in perf_data__open_dir()
    466655ddac0c drm/virtio: Fix memory leak in virtio_gpu_object_create()
    8964cc36ba01 netfilter: ipset: Rework long task execution when adding/deleting entries
    080b56c66aca netfilter: ipset: fix hash:net,port,net hang with /0 subnet
    2bab138b44f0 net: sparx5: Fix reading of the MAC address
    5896f5581068 vxlan: Fix memory leaks in error path
    dc46e39b727f net: sched: cbq: dont intepret cls results when asked to drop
    85655c63877a net: sched: atm: dont intepret cls results when asked to drop
    9a402a210798 gpio: sifive: Fix refcount leak in sifive_gpio_probe
    589886147edf ceph: switch to vfs_inode_has_locks() to fix file lock bug
    516fac1e0749 filelock: new helper: vfs_inode_has_locks
    b8e3dd2eba02 drm/meson: Reduce the FIFO lines held when AFBC is not used
    718d28ce581e selftests: net: return non-zero for failures reported in arp_ndisc_evict_nocarrier
    d87357c82ce3 selftests: net: fix cleanup_v6() for arp_ndisc_evict_nocarrier
    5f87d4dc581e RDMA/mlx5: Fix validation of max_rd_atomic caps for DC
    e597b003c736 RDMA/mlx5: Fix mlx5_ib_get_hw_stats when used for device
    2892b358c896 gpio: pca953x: avoid to use uninitialized value pinctrl
    ee84d37a5f08 net: phy: xgmiitorgmii: Fix refcount leak in xgmiitorgmii_probe
    191c4b94c18b net: ena: Update NUMA TPH hint register upon NUMA node update
    eff3be564b50 net: ena: Set default value for RX interrupt moderation
    2474a8ed1ef3 net: ena: Fix rx_copybreak value update
    5a5084e947b1 net: ena: Use bitmask to indicate packet redirection
    7d82fbedaecb net: ena: Account for the number of processed bytes in XDP
    c7304c752a20 net: ena: Don't register memory info on XDP exchange
    1ee3d84b0d6b net: ena: Fix toeplitz initial hash value
    aafd7d5ecc14 net: amd-xgbe: add missed tasklet_kill
    1f7331675545 net: hns3: refine the handling for VF heartbeat
    01ca3695f19a tcp: Add TIME_WAIT sockets in bhash2.
    a1f2920a051f bpf: Always use maximal size for copy_array()
    8f1b8b313350 net/mlx5: Lag, fix failure to cancel delayed bond work
    c1103a607134 net/mlx5e: Set geneve_tlv_option_0_exist when matching on geneve option
    cacda6f9757f net/mlx5e: Fix hw mtu initializing at XDP SQ allocation
    c6e6fb424031 net/mlx5e: Always clear dest encap in neigh-update-del
    7d88b67d6bec net/mlx5e: CT: Fix ct debugfs folder name
    38e1a340f741 net/mlx5e: Fix RX reporter for XSK RQs
    53d051e2a235 net/mlx5e: IPoIB, Don't allow CQE compression to be turned on by default
    2799cbdedb60 net/mlx5: Fix RoCE setting at HCA level
    e639bc695f05 net/mlx5: Avoid recovery in probe flows
    95a327eaebe2 net/mlx5: Fix io_eq_size and event_eq_size params validation
    3c29ad4f2cc5 net/mlx5: Add forgotten cleanup calls into mlx5_init_once() error path
    8aa897595bab net/mlx5: E-Switch, properly handle ingress tagged packets on VST
    16b22e27fba6 vdpasim: fix memory leak when freeing IOTLBs
    6ccc891f36d0 vdpa/vp_vdpa: fix kfree a wrong pointer in vp_vdpa_remove
    0871df190fe6 virtio-crypto: fix memory leak in virtio_crypto_alg_skcipher_close_session()
    c72123cd79dd vdpa_sim: fix vringh initialization in vdpasim_queue_ready()
    a2907867e2c8 vhost-vdpa: fix an iotlb memory leak
    8b31aa969a2d vhost: fix range used in translate_desc()
    909fb8fbd46b vringh: fix range used in iotlb_translate()
    9bc360aa816f vhost/vsock: Fix error handling in vhost_vsock_init()
    337c24d817e2 vdpa_sim: fix possible memory leak in vdpasim_net_init() and vdpasim_blk_init()
    adc6cd16b418 vdpa/mlx5: Fix wrong mac address deletion
    392814d4cf9a vdpa/mlx5: Fix rule forwarding VLAN to TIR
    179e6d7213f1 bnxt_en: Fix HDS and jumbo thresholds for RX packets
    c9542e0d3ec1 bnxt_en: Fix first buffer size calculations for XDP multi-buffer
    57e2176bac59 bnxt_en: Fix XDP RX path
    9bf7939f91af bnxt_en: Simplify bnxt_xdp_buff_init()
    b32f6bef2485 nfc: Fix potential resource leaks
    bb50c43f7789 net: dsa: mv88e6xxx: depend on PTP conditionally
    a2a694e6edbd qlcnic: prevent ->dcb use-after-free on qlcnic_dcb_enable() failure
    facc4405e8b7 net: sched: fix memory leak in tcindex_set_parms
    e0b6178773cf net: hns3: fix VF promisc mode not update when mac table full
    fc7f6dca10b2 net: hns3: fix miss L3E checking for rx packet
    55d10ed4b507 net: hns3: add interrupts re-initialization while doing VF FLR
    d91be3d42c4a nfsd: shut down the NFSv4 state objects before the filecache
    6003a74bd473 veth: Fix race with AF_XDP exposing old or uninitialized descriptors
    62c84d0abe6f net: lan966x: Fix configuration of the PCS
    a96c5c6e67f8 bonding: fix lockdep splat in bond_miimon_commit()
    f03ecaeca499 netfilter: nf_tables: honor set timeout and garbage collection updates
    dda2d04863b5 mptcp: fix lockdep false positive
    dfe522e4cdfb mptcp: fix deadlock in fastopen error path
    c312bcd28254 vmxnet3: correctly report csum_level for encapsulated packet
    acce57c9b6a2 net: vrf: determine the dst using the original ifindex for multicast
    3dfffe6214fa ice: xsk: do not use xdp_return_frame() on tx_buf->raw_buf
    4052919880db netfilter: nf_tables: perform type checking for existing sets
    59c8f9a23614 netfilter: nf_tables: add function to create set stateful expressions
    4fba3958a9b9 netfilter: nf_tables: consolidate set description
    ba3d2c2380e7 drm/panfrost: Fix GEM handle creation ref-counting
    321635c70352 bpf: pull before calling skb_postpull_rcsum()
    35dab092c295 wifi: ath9k: use proper statements in conditionals
    3e8dee13f3d1 SUNRPC: ensure the matching upcall is in-flight upon downcall
    e92536de04e4 btrfs: fix an error handling path in btrfs_defrag_leaves()
    667347e338cb phy: qcom-qmp-combo: fix broken power on
    53be6d939bf2 perf probe: Fix to get the DW_AT_decl_file and DW_AT_call_file as unsinged data
    8dba3cdb3d5f perf probe: Use dwarf_attr_integrate as generic DWARF attr accessor
    def94d5966f6 btrfs: fix compat_ro checks against remount
    427a36cf819b btrfs: fix off-by-one in delalloc search during lseek
    acbf70d7f9cd usb: dwc3: gadget: Ignore End Transfer delay on teardown
    94d0e33c5f52 cifs: refcount only the selected iface during interface update
    76f1ff02e23e cifs: fix interface count calculation during refresh
    0af9640736a6 btrfs: replace strncpy() with strscpy()
    7578a7c0f296 ARM: renumber bits related to _TIF_WORK_MASK
    2cb8e624295f Linux 6.1.4
    54b6a040f380 drm/amd/pm: correct the fan speed retrieving in PWM for some SMU13 asics
    0b865bcd7a08 drm/amd/pm: bump SMU13.0.0 driver_if header to version 0x34
    789c4804d7ae drm/amd/pm: add missing SMU13.0.7 mm_dpm feature mapping
    1cfd678e2f07 drm/amd/pm: add missing SMU13.0.0 mm_dpm feature mapping
    6e6d577cd90b drm/i915/migrate: Account for the reserved_space
    ea62bd769994 drm/i915: improve the catch-all evict to handle lock contention
    52beaa0938ad drm/amdgpu: make display pinning more flexible (v2)
    9724e6950ef9 drm/amdgpu: handle polaris10/11 overlap asics (v2)
    3038224f5617 drm/amd/display: Add DCN314 display SG Support
    218f8fe66824 drm/i915/ttm: consider CCS for backup objects
    f06a3cff1b4e ext4: allocate extended attribute value in vmalloc area
    56ecd5509fdc ext4: avoid unaccounted block allocation when expanding inode
    0f860f71b617 ext4: initialize quota before expanding inode in setproject ioctl
    70e5b46beba6 ext4: fix inode leak in ext4_xattr_inode_create() on an error path
    74ba28197161 ext4: fix kernel BUG in 'ext4_write_inline_data_end()'
    cc1538c693d2 ext4: fix deadlock due to mbcache entry corruption
    52cdfab923db ext4: avoid BUG_ON when creating xattrs
    1008bbaadca6 ext4: fix corrupt backup group descriptors after online resize
    627dd452889d ext4: dont return EINVAL from GETFSUUID when reporting UUID length
    a77f3bdb03d0 ext4: fix bad checksum after online resize
    dad6a26adb5a ext4: fix error code return to user-space in ext4_get_branch()
    c99932c83074 ext4: fix corruption when online resizing a 1K bigalloc fs
    81b915181c63 ext4: fix delayed allocation bug in ext4_clu_mapped for bigalloc + inline
    b753b0be45ae ext4: don't fail GETFSUUID when the caller provides a long buffer
    13271fbbe85d ext4: init quota for 'old.inode' in 'ext4_rename'
    9f966e021c20 ext4: fix uninititialized value in 'ext4_evict_inode'
    5439ad45c0d0 ext4: fix off-by-one errors in fast-commit block filling
    18e66ed75d87 ext4: fix unaligned memory access in ext4_fc_reserve_space()
    d1c97077fa60 ext4: add missing validation of fast-commit record lengths
    1ba993208bcf ext4: don't set up encryption key during jbd2 transaction
    7c1fb65e8ce8 ext4: fix leaking uninitialized memory in fast-commit journal
    08d5c8445d15 ext4: disable fast-commit of encrypted dir operations
    bcc5057e1781 ext4: don't allow journal inode to have encrypt flag
    a125c8806b7d ext4: fix bug_on in __es_tree_search caused by bad boot loader inode
    f1ec687ebd1b ext4: check and assert if marking an no_delete evicting inode dirty
    15adfbb2d161 ext4: journal_path mount options should follow links
    5e1d519af52f ext4: fix reserved cluster accounting in __es_remove_extent()
    1daff79463d7 ext4: fix bug_on in __es_tree_search caused by bad quota inode
    7720e1e43315 ext4: add helper to check quota inums
    488a5c2bf754 ext4: add EXT4_IGET_BAD flag to prevent unexpected bad inode
    7753d6657873 ext4: fix undefined behavior in bit shift for ext4_check_flag_values
    7908b8a541b1 ext4: fix use-after-free in ext4_orphan_cleanup
    a73f2b2e3853 fs: ext4: initialize fsdata in pagecache_write()
    35840a486cff ext4: correct inconsistent error msg in nojournal mode
    39364b354f0e ext4: remove trailing newline from ext4_msg() message
    248feff7deda ext4: add inode table check in __ext4_get_inode_loc to aovid possible infinite loop
    b085fb43feed ext4: silence the warning when evicting inode with dioread_nolock
    12cfb0c1c27e drm/etnaviv: reap idle mapping if it doesn't match the softpin address
    babd82f10749 drm/ingenic: Fix missing platform_driver_unregister() call in ingenic_drm_init()
    556a7e74af59 drm/i915/dsi: fix VBT send packet port selection for dual link DSI
    84bcb7d09aaa drm/etnaviv: move idle mapping reaping into separate function
    3650c063f22d drm/mgag200: Fix PLL setup for G200_SE_A rev >=4
    622d527decaa drm/vmwgfx: Validate the box size for the snooped cursor
    d988f0bcf579 drm/connector: send hotplug uevent on connector cleanup
    35fe1c238437 device_cgroup: Roll back to original exceptions after copy failure
    4def68cc15f3 parisc: Drop PMD_SHIFT from calculation in pgtable.h
    790aba4492d6 parisc: Drop duplicate kgdb_pdc console
    d97a584e350d parisc: Add missing FORCE prerequisites in Makefile
    553bc5890ed9 parisc: Fix locking in pdc_iodc_print() firmware call
    6bbba171235e parisc: Drop locking in pdc console code
    67c98fec87ed parisc: led: Fix potential null-ptr-deref in start_task()
    dc88a50bc339 remoteproc: imx_rproc: Correct i.MX93 DRAM mapping
    e2e8d55f044e remoteproc: core: Do pm_relax when in RPROC_OFFLINE state
    b9693304b713 remoteproc: imx_dsp_rproc: Add mutex protection for workqueue
    17183187dc86 hugetlb: really allocate vma lock for all sharable vmas
    ee29001a637f test_kprobes: Fix implicit declaration error of test_kprobes
    7e8834776c37 iommu/amd: Fix ill-formed ivrs_ioapic, ivrs_hpet and ivrs_acpihid options
    808948f4922f iommu/amd: Fix ivrs_acpihid cmdline parsing code
    fdbbb4058319 phy: qcom-qmp-combo: fix sc8180x reset
    1066b58cc02d phy: qcom-qmp-combo: fix sdm845 reset
    0a1129c4b445 bus: mhi: host: Fix race between channel preparation and M0 event
    878d15dd43bc driver core: Fix bus_type.match() error handling in __driver_attach()
    cced6678325b crypto: ccp - Add support for TEE for PCI ID 0x14CA
    b70acb182f45 crypto: n2 - add missing hash statesize
    85292a29689a riscv: mm: notify remote harts about mmu cache updates
    00777a099574 riscv: stacktrace: Fixup ftrace_graph_ret_addr retp argument
    cdea2da67875 RISC-V: kexec: Fix memory leak of elf header buffer
    abbb887da774 riscv: Fixup compile error with !MMU
    dc387c34d8dd RISC-V: kexec: Fix memory leak of fdt buffer
    b33528863d07 PCI/sysfs: Fix double free in error path
    518573988a2f PCI: Fix pci_device_is_present() for VFs by checking PF
    06bc122d9b5f crypto: ccree,hisilicon - Fix dependencies to correct algorithm
    d93b6a8a34e1 um: virt-pci: Avoid GCC non-NULL warning
    f375bcf69f58 ima: Fix memory leak in __ima_inode_hash()
    59b6c0ea1a8d mtd: spi-nor: gigadevice: gd25q256: replace gd25q256_default_init with gd25q256_post_bfpt
    1fc9b20a7688 ipmi: fix use after free in _ipmi_destroy_user()
    3ac71fd8ffa1 ima: Fix a potential NULL pointer access in ima_restore_measurement_list
    9944a141e5ea mtd: spi-nor: Check for zero erase size in spi_nor_find_best_erase_type()
    9c476590feff ipmi: fix long wait in unload when IPMI disconnect
    5038ee677606 ipu3-imgu: Fix NULL pointer dereference in imgu_subdev_set_selection()
    9526c179b9cb ASoC: jz4740-i2s: Handle independent FIFO flush bits
    360ef3bcf730 wifi: wilc1000: sdio: fix module autoloading
    19d5b47b0e09 efi: Add iMac Pro 2017 to uefi skip cert quirk
    aa4c785566ef md/bitmap: Fix bitmap chunk size overflow issues
    ab87d6f26e40 block: mq-deadline: Do not break sequential write streams to zoned HDDs
    b0544dd860b3 block: mq-deadline: Fix dd_finish_request() for zoned devices
    51c107f91bf1 drm/amdgpu: fix mmhub register base coding error
    08c83264e690 rtc: ds1347: fix value written to century register
    135b9ed45347 ravb: Fix "failed to switch device to config mode" message during unbind
    f22532d6bbaf cifs: set correct status of tcon ipc when reconnecting
    a37d718a0e0b cifs: set correct ipc status after initial tree connect
    2d8cbc14707a cifs: set correct tcon status after initial tree connect
    66d65a6fba33 cifs: fix missing display of three mount options
    e9f7a3bbaa5c cifs: fix confusing debug message
    530ca64b4462 media: dvb-core: Fix UAF due to refcount races at releasing
    123eddf92a11 media: dvb-core: Fix double free in dvb_register_device()
    94d23f8b7840 ARM: 9256/1: NWFPE: avoid compiler-generated __aeabi_uldivmod
    2833221e0b0f arm64: dts: mediatek: mt8195-demo: fix the memory size of node secmon
    0fd003d3c708 staging: media: tegra-video: fix device_node use after free
    1fae2197adbe staging: media: tegra-video: fix chan->mipi value on error
    26c57afef2b6 tracing: Fix infinite loop in tracing_read_pipe on overflowed print_trace_line
    2d31d84d4eb8 tracing: Fix issue of missing one synthetic field
    5d067ad7e2e2 tracing/probes: Handle system names with hyphens
    eac893885695 tracing/hist: Fix wrong return value in parse_action_params()
    cb8dce806598 tracing: Fix complicated dependency of CONFIG_TRACER_MAX_TRACE
    938791ad58a3 powerpc/ftrace: fix syscall tracing on PPC64_ELF_ABI_V1
    43f7cd89b584 tracing: Fix race where eprobes can be called before the event
    c9449d762f0e x86/kprobes: Fix optprobe optimization check with CONFIG_RETHUNK
    85932e3882e2 x86/kprobes: Fix kprobes instruction boudary check with CONFIG_RETHUNK
    3dabe6c5f3e9 ftrace/x86: Add back ftrace_expected for ftrace bug reports
    db10ca17bbe2 x86/microcode/intel: Do not retry microcode reloading on the APs
    891a644b0cbd KVM: nVMX: Properly expose ENABLE_USR_WAIT_PAUSE control to L1
    59cc9627be25 KVM: x86: fix APICv/x2AVIC disabled when vm reboot by itself
    04066fcbf18e KVM: nVMX: Inject #GP, not #UD, if "generic" VMXON CR0/CR4 check fails
    c877c99ee5c0 KVM: VMX: Resume guest immediately when injecting #GP on ECREATE
    2d627fbb5026 ima: Fix hash dependency to correct algorithm
    8a6cd16af71e of/kexec: Fix reading 32-bit "linux,initrd-{start,end}" values
    aa3e7a48e921 xtensa: add __umulsidi3 helper
    9dd6b35e2bcd perf/core: Call LSM hook after copying perf_event_attr
    04241956ce88 tracing/hist: Fix out-of-bound write on 'action_data.var_ref_idx'
    1d408dabdba9 PCI/DOE: Fix maximum data object length miscalculation
    97e28deab8bf ata: ahci: fix enum constants for gcc-13
    a7e060c3ea34 dm cache: set needs_check flag after aborting metadata
    6a3e412c2ab1 dm cache: Fix UAF in destroy()
    9e113cd4f61f dm clone: Fix UAF in clone_dtr()
    b6c93cd61afa dm integrity: Fix UAF in dm_integrity_dtr()
    d9971fa4d8bd dm thin: Fix UAF in run_timer_softirq()
    82976ba6deb1 dm thin: resume even if in FAIL mode
    b91f481300e3 dm thin: Use last transaction's pmd->root when commit failed
    cdf7a39bcc42 dm thin: Fix ABBA deadlock between shrink_slab and dm_pool_abort_metadata
    f74b7c5a85e2 dm cache: Fix ABBA deadlock between shrink_slab and dm_cache_metadata_abort
    1922ea6b0ae2 mptcp: use proper req destructor for IPv6
    d3901b9004a0 mptcp: dedicated request sock for subflow in v6
    01a301520685 mptcp: remove MPTCP 'ifdef' in TCP SYN cookies
    993aad51b6ce mptcp: netlink: fix some error return code
    5a52012ff8b0 fs: dlm: retry accept() until -EAGAIN or error returns
    9e72fec62f31 fs: dlm: fix sock release if listen fails
    bb641476f581 ALSA: usb-audio: Add new quirk FIXED_RATE for JBL Quantum810 Wireless
    9e456d460f1b HID: Ignore HP Envy x360 eu0009nv stylus battery
    ca4c62ec488b platform/x86: x86-android-tablets: Add Advantech MICA-071 extra button
    c693355b9735 platform/x86: x86-android-tablets: Add Lenovo Yoga Tab 3 (YT3-X90F) charger + fuel-gauge data
    5a2798eda1a8 platform/x86: x86-android-tablets: Add Medion Lifetab S10346 data
    838e48fa1b1b ALSA: hda/cirrus: Add extra 10 ms delay to allow PLL settle and lock.
    c455aa7cc9cf platform/x86: intel-uncore-freq: add Emerald Rapids support
    009ac0049dc3 platform/x86: ideapad-laptop: Stop writing VPCCMD_W_TOUCHPAD at probe time
    bda3399b5abb platform/x86: ideapad-laptop: Send KEY_TOUCHPAD_TOGGLE on some models
    f5820b413962 platform/x86: ideapad-laptop: Only toggle ps2 aux port on/off on select models
    2380e9493538 platform/x86: ideapad-laptop: Do not send KEY_TOUCHPAD* events on probe / resume
    c234ccc68afe platform/x86: ideapad-laptop: Refactor ideapad_sync_touchpad_state()
    8af3d02aae3e ACPI: video: Prefer native over vendor
    923c1922bdbe ACPI: video: Simplify __acpi_video_get_backlight_type()
    33c25c314683 platform/x86: ideapad-laptop: support for more special keys in WMI
    32755a5da122 platform/x86: ideapad-laptop: Add new _CFG bit numbers for future use
    317499df9d70 platform/x86: ideapad-laptop: Revert "check for touchpad support in _CFG"
    f48a74ccb519 platform/x86: thinkpad_acpi: Fix max_brightness of thinklight
    3ff594fb490f ALSA: hda/realtek: Apply dual codec fixup for Dell Latitude laptops
    ed32831a17e5 ALSA: patch_realtek: Fix Dell Inspiron Plus 16
    7ac7830af689 bpf: Resolve fext program type when checking map compatibility
    f845a9d33b4e media: s5p-mfc: Fix in register read and write for H264
    bd1b72f0c39a media: s5p-mfc: Clear workbit to handle error condition
    bff2698aab6f media: s5p-mfc: Fix to handle reference queue during finishing
    67ffc6dc3002 ext2: unbugger ext2_empty_dir()
    e7c0c943ed67 cpufreq: Init completion before kobject_init_and_add()
    5052a96b2104 PM/devfreq: governor: Add a private governor_data for governor
    6088d8783f7b random: add helpers for random numbers with given floor or range
    ef3ad7f447a2 x86/MCE/AMD: Clear DFR errors found in THR handler
    9edfbb64ca2b selftests: Use optional USERCFLAGS and USERLDFLAGS
    ea27cc32450e EDAC/mc_sysfs: Increase legacy channel support to 12
    b8b9b0b857b9 cxl/region: Fix missing probe failure
    833cdf903d2e arm64: dts: qcom: sdm850-lenovo-yoga-c630: correct I2C12 pins drive strength
    38f99d0b0284 x86/fpu/xstate: Fix XSTATE_WARN_ON() to emit relevant diagnostics
    346ac4a116cb random: use rejection sampling for uniform bounded random integers
    0f9327484c6f arm64: dts: qcom: sdm850-samsung-w737: correct I2C12 pins drive strength
    bacb7e1d42f4 ARM: ux500: do not directly dereference __iomem
    a94b90ac1f25 btrfs: fix resolving backrefs for inline extent followed by prealloc
    169a4cf46882 btrfs: fix extent map use-after-free when handling missing device in read_one_chunk
    712b0938166a btrfs: fix uninitialized parent in insert_state
    ed00567b170f drm/amd/pm: correct SMU13.0.0 pstate profiling clock settings
    9d455cb89dc5 drm/amd/pm: update SMU13.0.0 reported maximum shader clock
    9ebb4f4eab19 phy: qcom-qmp-combo: fix out-of-bounds clock access
    39eeec3130a1 mmc: sdhci-sprd: Disable CLK_AUTO when the clock is less than 400K
    51b84cfd24ee arm64: dts: qcom: sc8280xp: fix UFS reference clocks
    b70d118a6cdc arm64: dts: qcom: sdm845-db845c: correct SPI2 pins drive strength
    f42462b9cabf perf/x86/intel/uncore: Clear attr_update properly
    254f17db4352 perf/x86/intel/uncore: Disable I/O stacks to PMU mapping on ICX-D
    192db0943fad jbd2: use the correct print format
    14a6e5330a96 ktest.pl minconfig: Unset configs instead of just removing them
    178d7cf89191 kest.pl: Fix grub2 menu handling for rebooting
    ca6536972ea5 soc: qcom: Select REMAP_MMIO for ICC_BWMON driver
    70e71f0dc86f soc: qcom: Select REMAP_MMIO for LLCC driver
    50950c0176f6 arm64: Prohibit instrumentation on arch_stack_walk()
    15e7433e1dc2 arm64: dts: qcom: sc8280xp: fix UFS DMA coherency
    189c499376d5 cxl/region: Fix memdev reuse check
    fab465599001 media: stv0288: use explicitly signed char
    a354a9e3fc3b drm/amdgpu: skip mes self test after s0i3 resume for MES IP v11.0
    33a3b7fad827 drm/amdgpu: skip MES for S0ix as well since it's part of GFX

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++---
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index fb68c7ba78..cced203781 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "fd78a53858b7f9195ab53fd98c27736d05bbaf7c"
-SRCREV_meta ?= "30825f431703621e2b659b8e49effbdb3461f2d9"
+SRCREV_machine ?= "2da2dd7ee0de35291a179566ce8e5b85d6982762"
+SRCREV_meta ?= "142fcf0b8fcf1643d80e39e2c2f9c4a3bb528fcc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "6.1.3"
+LINUX_VERSION ?= "6.1.5"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 0d8fc236f6..15ee6abdbc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "6.1.3"
+LINUX_VERSION ?= "6.1.5"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "872afe79c5e568acf5f971952e78caada8424df7"
-SRCREV_meta ?= "30825f431703621e2b659b8e49effbdb3461f2d9"
+SRCREV_machine ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
+SRCREV_meta ?= "142fcf0b8fcf1643d80e39e2c2f9c4a3bb528fcc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 2caedf78ac..f543240cd8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v6.1/standard/base"
 KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f3fae08180e0e42fe1d84bc27fadfbe712486e7d"
-SRCREV_machine:qemuarm64 ?= "872afe79c5e568acf5f971952e78caada8424df7"
-SRCREV_machine:qemumips ?= "f33d80dcd64dbdf265f8501370595c9b7672b402"
-SRCREV_machine:qemuppc ?= "872afe79c5e568acf5f971952e78caada8424df7"
-SRCREV_machine:qemuriscv64 ?= "872afe79c5e568acf5f971952e78caada8424df7"
-SRCREV_machine:qemuriscv32 ?= "872afe79c5e568acf5f971952e78caada8424df7"
-SRCREV_machine:qemux86 ?= "872afe79c5e568acf5f971952e78caada8424df7"
-SRCREV_machine:qemux86-64 ?= "872afe79c5e568acf5f971952e78caada8424df7"
-SRCREV_machine:qemumips64 ?= "e01e486b21db695c46c12253b92adc7aa0da6d38"
-SRCREV_machine ?= "872afe79c5e568acf5f971952e78caada8424df7"
-SRCREV_meta ?= "30825f431703621e2b659b8e49effbdb3461f2d9"
+SRCREV_machine:qemuarm ?= "45f7cca5081d3cb4ad4fae8e158cd58ea4db6c1f"
+SRCREV_machine:qemuarm64 ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
+SRCREV_machine:qemumips ?= "eb204027dbb98317d002250cc594de30ecc62b90"
+SRCREV_machine:qemuppc ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
+SRCREV_machine:qemuriscv64 ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
+SRCREV_machine:qemuriscv32 ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
+SRCREV_machine:qemux86 ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
+SRCREV_machine:qemux86-64 ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
+SRCREV_machine:qemumips64 ?= "2b51d6b44e4dc0e5a87f820d8ebc5cc49feea14a"
+SRCREV_machine ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
+SRCREV_meta ?= "142fcf0b8fcf1643d80e39e2c2f9c4a3bb528fcc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4adc0fbe03a69d3189607bf74e82a79c29c08b4a"
+SRCREV_machine:class-devupstream ?= "90ca7a874a9093e500cc6147cecd85ad2e6a2852"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.3"
+LINUX_VERSION ?= "6.1.5"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


