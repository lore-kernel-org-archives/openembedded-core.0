Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3757.1793405772799195716
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=DzmLntcR;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so13645585e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405771; x=1794010571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ES7DuhmYunrwlQhy01OKFeCADL3vUjnyusRBaFS48Jw=;
        b=DzmLntcR/OApyJnlKnTt6blRwzvPKYP1jJFNdHbnlhO8LrIi1f8EwVxlF7w8u9oOGd
         wdUPWc45VEau9oQSg26ntFPufKfsdBCjTR41bmcluNlhCwNrWbweJP3SRiT7pIQ++TP8
         dnG2XWiHz41C/8IDcJhkGedF0wA+d9B9uM1L8673BhhLzyL4/G9NgiUqRl5FTpQ40c/V
         nZ7UpjrzPkRXt8Kn+5Bsz8s3cplVJ5d2QBCvXCdJpUwUbjcimXa8QodKJzquWKzUma29
         NOUrba2AnmqMBFhJRQZRSMGCzg3senrslxC2Nztu7qEaGB7fEYupAo45CC0LFnsEVKZO
         FnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405771; x=1794010571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ES7DuhmYunrwlQhy01OKFeCADL3vUjnyusRBaFS48Jw=;
        b=v5lfe+IxnSszIbdLOKODnnJWbkCRRfeJ0wSAzfWG4Vx+DmwzEF2st6wmvj0P4CJ4Tb
         6mLRT6NJqJhxXmV1Wkh3w8Hoe2B0TuRDNnk84o7Dt+byqy/9976KddLXJvCcMSrGK+n/
         +JMsGd/pdHUEHShu9WkaZbtNABH/Q6PbgRcIQIBSEWk3klgu9ilCgN3uLw4zb4wN79Qj
         UQ2TglzO/9edgof2v3D9URWJk3INZIyfnllzjCqkcCBHMs5CdhABKgb6Welr6UPk1eD8
         cR1TW0qKUvQWqj/zOMPVE4iebBva9Rd7CYErXilQwUZcqSBT11Mm0WF618Du1d/KEhWv
         nUVw==
X-Gm-Message-State: AFq9FYLVoJPiB9SyQLpt68vERoN8VH+sbKubdq8Piq7Bj7opArOkfCby
	u4v5rauNskvBXXMObpsKDTdkI/4qdegfXOD1ssV63S3Bu38abJc4YgCPQKDDIwb4HLl6u1zwjq5
	VnJV/bak=
X-Gm-Gg: AYBFou3s51Zf6vcNzhk7fyqyIabHfBrCzMzSimH7TaEN5gMEOR2/oHHop7iUZvnl1DF
	3dMOe0YX77SQKAT0tO/Xhs/oKPBqw25ge3OWLQ9/jgyUIcu06YonO8VNKVOxhKocSgOwSX1PlMc
	rxqrydzqtP+oT74S7nkNft9cR0D7fC3WJRDA/PYCDdKjvqTVSC7/40ScQ3iAe+n9skR+klkD6Xr
	njd9tprpSxkjKPjx0oiEVL1U0W+9mQFZOP/Y2iO1FrVR5Y+0m0jQcLD25nQSco+9Bebp+HnJ8BP
	Cy6EG+878vpKaHFkTYW6mek8qpDapnmQZd/BdsIDEV+Xgh5AmiZtsetRQTUVMvZYF3YocD5GVvn
	MJ58uPllALLitM3k3378Ls9e6/XckC0sQu0AN8vq0ic8QR0RlPfn/QKnh0vPGWNHfLNAzRUun5a
	oTihcxtfs5csXpCsjumW6kXpSZyb2st/tcniMriPlBaTX2BZuFgX+YvwfuD7snz1b3b5+uZ+3V2
	jtG74kMc1GgvhGUST+IxPsi5VyAsovJ63JT0JmmOjnBYkJ22M5uVeYdcUYo9YtZn8Ptyjgrr/QI
	ztN0XuUo6Njte1Wcw2fX8s9+TX1IlRP/170sSTHMIZ/yvC8cWZRx2Ksg4SokOUnPKTXk1W0WlAZ
	DZqWbdH5VvOQq4CNZ1iywlQQCjHZQcpvHZS8kzHUdescl6vtwTQ==
X-Received: by 2002:a05:600c:19c9:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4ac18a8911amr86825445e9.34.1793405769562;
        Fri, 30 Oct 2026 17:16:09 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 44/55] linux-yocto/6.6: update to v6.6.160
Date: Sat, 31 Oct 2026 01:15:05 +0100
Message-ID: <655c414b1a6ed90886025a17c9b75bb7fcf78c40.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249120
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    0aebf2870d53a Linux 6.6.160
    a63f79d9da946 KVM: x86: Use active memslots for the per-vCPU MMIO cache
    59c6dcc5dd9da ksmbd: fix heap out-of-bounds write in krb5_authenticate()
    db00b8cc243f1 bpf, sockmap: Account for receive queue in FIONREAD without a verdict program
    cec182231e528 xfs: fix unmount hang with unflushable inodes stuck in the AIL
    a72b0af5610ce xfs: factor out stale buffer item completion
    be1999582bd10 xfs: rearrange code in xfs_buf_item.c
    67f0af99e2905 xfs: catch stale AGF/AGF metadata
    dda32083f6393 xfs: xfs_ifree_cluster vs xfs_iflush_shutdown_abort deadlock
    fb2cc53273997 bpf: abort verification if env->cur_state->loop_entry != NULL
    8010212197d4a Bluetooth: hci_core: Fix queuing tx_work after workqueue is drained
    dbea82c4c81db Revert "mm/filemap: avoid buffered read/write race to read inconsistent data"
    791f7e65d6299 Revert "ksmbd: fix missing RDMA-capable flag for IPoIB device in ksmbd_rdma_capable_netdev()"
    a102a92462b97 ALSA: hda/realtek: Fix headset mic on ASUS Zenbook 14
    f2d8e2e64fb2b r8169: remove original workaround for RTL8125 broken rx issue
    fa0c45986fc60 smb/server: fix tree connection leak in smb2_tree_connect()
    22d1f4dcdc9c6 nvdimm: pmem: keep PREFLUSH before data writes
    32e999ccf5f64 drm/virtio: use the DMA API for resource backing on Xen
    ce7da178f1af4 drm/gud: validate GUD_ROTATION_0 is present in supported rotations
    d51cd486930f5 bpf: check_cond_jmp_op(): properly infer if register is null
    b7f2e33d9f5db smb/client: validate new EOF for insert range
    5fbd8848f2e25 smb/client: validate new EOF for zero range
    52dd721b3de57 smb/client: fix stale page cache in insert/collapse range
    cc7202a51b877 smb/client: invalidate fscache for fallocate range operations
    99ae165acf633 ksmbd: propagate DACL parsing errors
    fabc5e04f1232 Bluetooth: L2CAP: fix out-of-bounds write in l2cap_ecred_connect
    01131daffc4b6 igmp: convert struct ip_sf_list to RCU
    0e3e3cec28c4d ipv6: mcast: use rcu_assign_pointer() for __rcu list updates
    3dbb628cfc592 tipc: Dont send random pad bytes in RESET/ACTIVATE messages
    19cca7c360559 bpf: backtrack_insn(): Handle ld_{abs,ind} subprog exit edge
    1ac58dab0a83d bpf: backtracking shouldn't clear outer frame R1-R5 for callbacks
    433d52b196a68 btrfs: zoned: finish active block group cleanup if call_zone_finish() fails
    14d982762945d btrfs: zstd: fix lost wakeup when waiting for a workspace
    54772bf503dd0 net: Remove conflicting altnames for dying netns in __dev_change_net_namespace().
    4c85e4a0e8b07 net: plumb extack in __dev_change_net_namespace()
    dcc5e6c9e4d06 erofs: disable LZ4 rolling decompression for now
    9496d857205e6 bpf: Mark syscall helpers as sleepable
    e6a94b2c4c80a nvme: remove stale namespaces by NSID range during scan
    c57506918b078 nvme_core: scan namespaces asynchronously
    8b414dbe97fce bpf: Don't infer non-NULL from a pointer with an unbounded offset
    6e15449865367 bpf: Don't predict JMP32 pointer vs zero comparisons
    53ab1d12e52aa bpf: generalize is_scalar_branch_taken() logic
    ca7ade93a622c bpf: unify 32-bit and 64-bit is_branch_taken logic
    4ea5273a22e47 bpf: generalize is_branch_taken to handle all conditional jumps in one place
    e3991f2c54e7f bpf: move is_branch_taken() down
    82798ed5889f0 bpf: generalize is_branch_taken() to work with two registers
    e97cb20239d10 bpf: rename is_branch_taken reg arguments to prepare for the second one
    f5b2c23341b79 bpf: Improve JEQ/JNE branch taken logic
    86a3171c90bfc bpf: Mark NULL kptr stores precise
    cf85e4f94d7fe bpf: Preserve inner map identity in callback frames
    26ee5f99ffe7a net: reject oversized tx_queue_len at netlink parse time
    febbb66e682d8 bpf: mark a NULL call argument precise
    8b95269d7a43b iommu/amd: Do not reallocate GA log buffers on resume
    5ad081761a1f0 virtio_ring: fix stale descriptor flags after a failed packed add
    914c7cc2e3d10 vhost-vdpa: protect config_ctx from being freed under the config callback
    582fec8ebce99 eventfd: simplify eventfd_signal()
    650bac9c73d3b vduse: validate virtqueue alignment
    021bf73731f7a vhost: invalidate vring access on IOTLB transitions
    bd91dc313afe2 af_unix: Update last skb marker in manage_oob().
    385aa7dbc6af1 eth: ice: don't dereference pointers from TP_printk()
    55b76500546e5 Bluetooth: hci_sysfs: Fix NULL pointer dereference in device_del()
    fb78beb64e0e7 vxlan: initialize _md in vxlan_xmit_one()
    d552beb9d278a net/mlx5e: Move representor vnic reporter to eswitch devlink port
    9882068ed242f perf/x86/intel: Prevent drain_pebs() reentry
    09c30547da2c4 net: stmmac: fix TX descriptor availability check for TSO traffic
    a44744454eafb configfs: pin the symlink target's dirent instead of chasing ->ci_dentry
    bc5f32f36724b configfs:get_target() - release path as soon as we grab configfs_item reference
    db6d0b2f307f0 path: add cleanup helper
    b315d86566076 configfs: unhash the dentry before dropping the item in rmdir
    0c1a966bc047a reboot: fix cad_pid use-after-free race
    61894ea0d2a1a tracing: Take trace_array reference when opening a tracer options file
    c3576cb77b527 ALSA: usbusx2y: validate URB actual_length in interrupt callback
    4d87cf94eba53 ALSA: usx2y: Use standard print API
    e5c5dad169fb5 tracing: Take the reference before publishing the named histogram trigger
    880712b6f4810 tracing: Undo the registration when enabling the histogram trigger fails
    962e565f45dbe accel/ivpu: Validate full buffer range in ivpu_to_cpu_addr
    07d4190d75021 accel/ivpu: Validate firmware log buffer metadata
    3d9365093f16b accel/ivpu: Limit firmware log name prints to field size
    97be05f33f793 bootconfig: Fix integer overflow in initrd size check
    f664e06699829 netfilter: cttimeout: prevent UAF during module unload
    0159f716d8adb ipv6: flowlabel: cap duplicate leases per socket
    5a1b6379eed5b perf: RISC-V: store available counter mask as bitmap
    189d60057e5f3 mptcp: pm: kernel: drop pending ADD_ADDR when removing ID0
    be6eccccec867 smb: client: honor forceuid/forcegid when mapping SIDs to uid/gid
    284877c6189fd smb: client: fail DACL rewrite when the new DACL exceeds 64K
    604feb3e8141b smb: client: avoid using uninitialized SIDs in cifs_posix_to_fattr()
    674d783f2e80d scsi: qla2xxx: Bound VP index against VP_CTRL IOCB bitmap size
    64a7ed42e9766 f2fs: accurately adjust free_sections during free_segment_range
    40dcd4a71a524 scsi: qla2xxx: Skip vport under deletion in report ID acquisition
    6c71726cdfda9 scsi: qla2xxx: Serialize NVMe unsol ctx list with a per-fcport lock
    925a9129a514b scsi: qla2xxx: Unlink NVMe unsol ctx before freeing on LS reject error
    d12e92e72db91 wifi: cfg80211: reject duplicate wiphy cipher suite entries
    971b40e3ca127 fs/resctrl: Prevent use-after-free in rdtgroup_kn_put()
    493a029c205a9 wifi: mt76: mt7996: validate RX band_idx before dereferencing phys[]
    dc5778dbd0b6c ocfs2: validate external xattr entries when reading metadata
    45c534c5bf43a firewire: core: fix memory leak in error path of build_tree()
    e6c3a43d0a41f nfsd: fix fcache_disposal UAF by inlining dispose state into nfsd_net
    3861eeabaebe2 svcrdma: Validate Read chunk positions before reconstruction
    c4c71368bc5c5 iommu/sva: Set handle->dev before the SVA handle is visible
    6e5333ec3bd8f iommu: Pass domain to remove_dev_pasid() op
    80eaeae0e4b1e md/raid1,raid10: fix error-path detection with md_cloned_bio()
    91d0fc000d8cc md/raid1,raid10: fix bio accounting for split md cloned bios
    50d1a47fb3c4f btrfs: fix deadlock cloning inline extent when using flushoncommit
    bce2eec05bce5 Bluetooth: hci_core: Fix UAF in hci_unregister_dev()
    441250eea8460 cxl/region: Resolve region deletion races
    b869e3e4ce199 net/handshake: hand off the pinned file reference to accept_doit
    59db5d8bcc65e erofs: fix use-after-free on sbi->sync_decompress
    98cc0403f546c netfilter: revalidate bridge ports
    966b941ca469f greybus: raw: fix use-after-free if write is called after disconnect
    f65a96fe2467a ceph: fix num_ops off-by-one when crypto allocation fails
    bca0597272f97 KVM: SVM: Add missing save/restore handling of LBR MSRs
    1cde96d5d53b9 hwrng: core - use RCU and work_struct to fix race condition
    aead84bdacd77 netfilter: nfnetlink_queue: do shared-unconfirmed check before segmentation
    f988fbf0536b4 media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC
    690145822dd73 media: v4l2-mem2mem: Add a kref to the v4l2_m2m_dev structure
    0870f10cbdaa7 media: hantro: Disable multicore support
    414396c42ef20 ASoC: qcom: q6asm: drop DSP responses for closed data streams
    253523cd4dd7d ASoC: qcom: q6asm: handle the responses after closing
    8c24b5179af26 RDMA/efa: Fix use of completion ctx after free
    127c5e6e2d6fa ip_tunnel: adapt iptunnel_xmit_stats() to NETDEV_PCPU_STAT_DSTATS
    d4bee74b7cb93 drm/msm: Recover HW before retire hung submit
    a75e5de593ef1 ACPI: platform: Use acpi_bus_get_primary_device()
    c4672bdc4730d net: mscc: ocelot: Fix use-after-free caused by cyclic delayed work
    ba8bc644f1685 xen: fix UAF in dmabuf_exp_from_pages()
    d3c8519f85b78 HID: nintendo: avoid bluetooth suspend/resume stalls
    155bc8f94d52c net: dsa: b53: do not enable EEE on bcm63xx
    b101fc9ac18d1 scsi: ufs: exynos: Disable iocc if dma-coherent property isn't set
    41168ed90f98e bpf: Mark raw_tp arguments with PTR_MAYBE_NULL
    d02dd7ce8e52b PCI/sysfs: Add CAP_SYS_ADMIN check to __resource_resize_store()
    bb2b3e6047163 PCI/sysfs: Demacrofy pci_dev_resource_resize_attr(n) functions
    a8adf64fe7fd5 genirq/proc: Size interrupt directory names for 10-digit interrupt numbers
    482ba972f9638 pinctrl: mediatek: paris: bypass pinctrl GPIO layer in set GPIO direction
    8ddda06ae356f drm/amdgpu: validate and share PSP fw_pri_buf copies via psp_copy_fw
    0786b38af822f drm/amdgpu: Bound GPIO I2C table entry count from VBIOS
    445835710fd0e drm/amdgpu: rework i2c init and fini
    5db7d4e7c980f drm/amdgpu/atombios: drop empty function
    079ec13f481cc drm/amdgpu: Remove unused amdgpu_i2c functions
    d2ea99884793c wifi: mac80211: don't call ieee80211_handle_reconfig_failure when not needed
    68059b6e9f729 tty: serial: 8250: protect against NULL uart->port.dev in register
    59442ba701d3a serial: 8250: invert serial8250_register_8250_port() CIR condition
    d5eb39d6178ca driver core: Avoid warning when removing a device while its supplier is unbinding
    6e9e007ee1dfb virt: acrn: Fix irqfd use-after-free during eventfd shutdown
    7c9fee40fc8d8 RDMA/counter: Fix num_counters leak on bind_qp failure in alloc_and_bind()
    50bf37362362c wifi: iwlwifi: mvm: fix P2P-Device binding handling
    567d7c3f93f8d drm/amdgpu: harden FRU PIA parsing with bounded helpers
    cf1dadc5d24ee drm/amdgpu: Refactor FRU product information
    c1f2f34d681a0 drm/amdgpu/ras: add ras_suspend callback and use it for cp_ecc_error_irq
    6fc7ab7fcd7ee drm/amdkfd: fix SMI event cross-process information leak
    84fc3f30b87e0 pds_core: quiesce DMA before freeing resources
    29723256fccf4 exfat: fix handling of damaged volume in exfat_create_upcase_table()
    af3c9c0bf8542 exfat: resolve memory leak from exfat_create_upcase_table()
    1d8e1e99b063d perf: Fix addr_filter_ranges lifetime
    8e4a07ed82bae wifi: mac80211: ibss: wait for in-flight TX on disconnect
    2c5db82778f56 smb/client: zero-initialize stack-allocated cifs_open_info_data
    c422d5d53f135 wifi: iwlwifi: pcie: null RX pointers after free
    5e871c03506c5 wifi: iwlwifi: mvm: validate TX_CMD response layout
    88767bf9fd2e7 wifi: iwlwifi: mvm: remove mvm prefix from iwl_mvm_tx_resp*
    7c293e83d86cf ksmbd: fix maximum allowed access checks
    d46b67c245229 ksmbd: remove redundant DACL check in smb_check_perm_dacl
    190f3bdfaef8d perf/x86/intel/pt: Fix stop/start with no update
    7abab59d6c99b remoteproc: qcom_wcnss: Fix handling the lack of PD regulators in v3
    e36b1c2eafcaa powerpc/xive: propagate IPI init errors to prevent use-after-free
    d929980d771f8 powerpc/xive: add error return value to xive_smp_probe()
    50ddd82b88b1d ACPI: bus: Introduce acpi_bus_get_primary_device()
    bf75f14d755f9 memcg: make the v1 soft limit knob inert
    28c5a3a572f6c svcrdma: Reject Write/Reply chunks with segcount 0
    94b450977c602 nfsd: convert nfsd_net boolean flags to unsigned long flags word
    e7c1923c5f30a mm/page_owner: use memcg_data snapshot to avoid TOCTOU in print_page_owner_memcg()
    64b1a9384db9c iommu/arm-smmu-v3: Manage teardown with devm
    6640f778aa3d4 i3c: master: Fix recursive locking during device registration
    41b2025709ec1 nvdimm: virtio_pmem: refcount requests for token lifetime
    1f661f42beb55 drm/v3d: Clear queue->active_job when v3d_fence_create() fails
    d2d40574b9b27 cxl/mbox: Clamp mailbox output allocation to the payload size
    cda8af27b787d drm/amd/display: Fix dangling pointer in plane reset function
    ef3293c87a79f drm/amd/display: Fix dangling pointer in CRTC reset function
    4dda09e7ca0bf mm/mm_init: handle alloc_percpu failure in free_area_init_core_hotplug
    06bdccd50bb9a mm: name the anonymous MMOP enum as enum mmop
    5b1ebdc12131e mm: change type of state in struct memory_block
    2ba67aa183a3c dmaengine: xilinx_dma: Fix CPU stall in xilinx_dma_poll_timeout
    e37c67f768234 hwrng: core - fix rng list on registration error
    642648fa75952 cgroup/cpuset: Make nr_deadline_tasks an atomic_t
    f048044ad2e5f cgroup/cpuset: move common code to cpuset-internal.h
    2294a8302bacb cgroup/cpuset: introduce cpuset-v1.c
    94033c193bc38 bpf: Reject MEM_ALLOC BTF accesses past object bounds
    5b8a40de738b7 time/namespace: Validate nanosecond field in proc_timens_set_offset()
    56f92fecd8041 bpf: Reject writes through untrusted BTF pointers
    30674a7bbf203 platform/x86: dell-wmi-base: Fix handling of ultra performance key
    fc45f6e4b86c2 platform/x86: lg-laptop: Fix LED resource handling
    2147065d3a4e1 bpf: Reject rdonly/rdwr_buf_size kfunc arguments that exceed u32 max
    72888d54bae36 usb: gadget: uac: validate rate list length before storing
    959ed35f8c8f0 platform/x86: asus-wmi: fix resource leaks on probe failure
    0c57c1aede122 platform/x86: asus-wmi: disable USB0 hub on ROG Ally before suspend
    201bdf10ae92e esp: do not unref managed frag pages in esp_ssg_unref()
    b7129930d1ec4 RDMA/rvt: Return NULL after port allocation failure
    e835bd88ce9dd firmware: arm_scmi: Clean up channels on setup failure
    d8ecdceeb90cd firmware: arm_scmi: Fix SCMI device destroy lifetimes
    bd2a5a876904e drm/msm: Only fini scheduler after successful init
    f3eddc7913e14 drm/sched: Use struct for drm_sched_init() params
    a6090eeb289c5 bpf: Zero queue and stack outputs on lock failure
    7285f004293e7 riscv, bpf: Fix memory leak in bpf_jit_free
    28dbc73272283 bpf: remove unused parameter in bpf_jit_binary_pack_finalize
    0ee638956cc08 powerpc/bpf: rename powerpc64_jit_data to powerpc_jit_data
    29a2a166450a3 ext4: fix ABBA deadlock in ext4_xattr_inode_cache_find()
    3886d944b506e RDMA/erdma: complete object teardown when the destroy command fails
    a5c6316052f0f bpf: Fix WARNING in bpf_tracing_link_release
    dc6e5d802c884 pinctrl: mediatek: use devm_gpiochip_add_data() for GPIO chip
    566109f1ee4e3 scsi: ufs: core: Validate string descriptors
    dc884df788e60 scsi: ufs: core: Convert string descriptor format macros to enum
    9265fa8190312 spi: oc-tiny: switch to managed controller allocation
    6e3e93bc718c4 clk: mediatek: pllfh: Fix IO remapping leak in register_pllfhs error path
    d867db0a26029 PCI: Fix UAF when probe runs concurrent to dyn ID removal
    ec023f18ace20 PCI: Fix dyn_id add TOCTOU
    65b1fb5670e46 PCI: Make pci_match_one_device() match on ID instead of device
    e1b23f264f360 PCI: Initialize temporary device in new_id_store()
    68c1d2c085f20 RDMA/cxgb4: Fix dereg_skb leak and double free in write_tpt_entry()
    d4aec20f3a846 wifi: ath12k: fix overreads in ath12k_wmi_process_csa_switch_count_event()
    79c6f4f7d16ee wifi: ath12k: fix stride mismatch in mac_phy_caps_parse()
    b2ecd548f89a4 wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()
    c9c1e3da0a206 firmware: qcom: scm: Fix NULL dereference in IRQ handler before __scm is published
    0b187e14dab45 md/raid1: create serial pool adding rdev to array with serialize_policy=1
    5a540ced720b4 misc: sgi-gru: remove interrupt-context page-table walks
    e086ef5a0e310 mm/treewide: replace pmd_large() with pmd_leaf()
    2c321f86846ea wifi: mt76: fix non-AQL packet accounting for MLO stations
    7198d8fcfdd3e wifi: mt76: mt7915: unwind state on add_interface failure
    3d079589add6e wifi: mt76: mt7915: Fix an error handling path in mt7915_add_interface()
    a582b1d54313d wifi: mt76: mt7915: allocate vif wcid in the same range as stations
    bc4f4389f439e wifi: mt76: mt7996: hold dev->mt76.mutex while disabling tx worker in SER
    5dd845c6388c6 wifi: mt76: cancel reset and rc work on device unregister
    7f96bf0d24b2a bpf, x86: Fix trampoline stack size for 128-bit arguments
    332c9c1a148d0 arm64: ptrace: Keep 'orig_x0' in-sync with x0 on syscall entry
    5f47c9bc4a62e wifi: nl80211: clean up color-change beacon data on errors
    51423d370739a wifi: nl80211: check link is beaconing for color change
    66b89c6a7da47 wifi: brcmfmac: fix P2P action frame handling without device vif
    9374943fc5a45 wifi: cfg80211: stop PMSR before P2P and NAN teardown
    e2ddbfd826836 serial: core: do fallible allocations before the console can be registered
    a9c0ffe5930c9 serial: core: clear freed pointers on uart_register_driver() failure
    ea3d2fae7c1d6 tty: skip cdev_del() when no cdev is registered
    360a49fc53acd HID: logitech-hidpp: Fix FF device cleanup on init failure
    37cb84b992718 HID: steam: Reject short reads
    17c18a0df70c2 blk-cgroup: fix race between policy activation and blkg destruction
    7f97c762b5f6e ublk: check import_ubuf() return value
    7dec19f6bafe4 ocfs2: validate inline xattrs during inode block validation
    df002834cfd88 thermal: hwmon: Remove hwmon class device along with its parent
    233f1b7fe2980 RDMA/erdma: Hold QP references for AE and CM processing
    b672d4de13247 ocfs2: o2hb: quiesce negotiate handlers and timeout work
    d64708cc119db ocfs2/cluster: keep heartbeat local node stable
    c0da108b346db ocfs2/heartbeat: fix slot mapping rollback leaks on error paths
    4acc761b4e3fe bpf: Clear buf on error in __bpf_get_task_stack
    a3205bd1f2180 module/dups: Fix use-after-free in kmod_dup_req lifetime handling
    decea8279bec5 drm/amd/display: Resize MST HDCP per-connector arrays to 32
    ba63c62d4252f coresight: etm4x: missing cscfg_csdev_disable_active_config() in perf enable
    710a2448a06a8 scsi: sd: Fix special_vec mempool leak when scsi_alloc_sgtables() fails
    c97277aa6ce8a btrfs: defrag: fix deadlock between defrag and delalloc space reservation
    043b6fd9706e4 btrfs: always wait for ordered extents to avoid OE races
    20b2c2f3316e8 btrfs: check if root is readonly when setting posix acl
    202ac9e469b78 btrfs: qgroup: fix a wrong length calculation in qgroup_free_reserved_data()
    0fa448369c87e Bluetooth: L2CAP: use proto_lock for l2cap_data to fix l2cap_disconn_ind
    98666d8feb514 Bluetooth: ISO: fix race of kfree vs kref_get_unless_zero
    16c8321ee40c4 bpf, cgroup: Fix storage null-ptr-deref after replacing prog
    b6c9daf6097f9 bpf: Fix mmap_lock leak in irq_work path
    9e71e332fa2c7 NFS: Return a delegation the client fails to record
    a457ff1189f22 amt: Don't support cross-netns setup.
    8f823b47eb889 clocksource/drivers/samsung_pwm: Switch to raw_spinlock_t type
    af811970da4f0 nvmet: fix max_qid race between configfs and controller allocation
    f535a34831f83 ocfs2: validate orphan slot during inode read
    eacdd27ca8297 ocfs2: validate DIO orphan slot during inode read
    08a31a2cc3d1c null_blk: free zones array on device power-off
    53ccb4b967edc blk-iolatency: clear delay state when freeing policy data
    6b59f976db5de blk-iocost: clear delay state when freeing policy data
    7166d3d60606e blk-cgroup: delay freeing policy data after rcu grace period
    5f1fedccf3f7a apparmor: fix deadlock in complain-mode change_hat
    67223b1150a9e ksmbd: fix slab-out-of-bounds read in ksmbd_alloc_user()
    7148a6c06ddf1 ksmbd: serialize oplock close with pending break ownership
    5ffd180307a5e smb/server: fix null-ptr-deref in ksmbd_ipc_tree_connect_request()
    b68d4bb6b03a6 ksmbd: defer publishing granted locks to prevent UAF/double-free race
    795dca34a4154 erofs: fix interlaced ztailpacking pclusters
    ecdcfa15b3d79 ksmbd: safely discard unregistered deferred locks
    d20d3f6ad8b0b ksmbd: detach blocked lock requests before freeing
    3deefd5fb1368 ksmbd: scope session state changes to bound connections
    988f99bfddda4 smb/server: fix session leak in ksmbd_session_register()
    51d162dfb618f pnfs/blocklayout: Fix device leaks on parse failure
    336b6da10021c NFSv4/flexfiles: fix NULL dereference for NFSv4.0 data servers
    e25e5b4a76463 NFSv4: Fix incorrect argument passed to nfs4_delete_lease() in nfs4_add_lease()
    742d0884a1c95 filelock: add some new helper functions
    64348c55dd759 vsock: don't check the listener's sk_err in vsock_accept()
    45be87c5195f3 net: add missing ref_tracker_dir_exit() to alloc_netdev_mqs()
    793163e134028 ALSA: mtpav: shut down output timer before card teardown
    43451ec94fb67 net: qlcnic: validate unified ROM sections before loading
    7f8287f606c8c ip6mr: do not clone dst in ip6mr_cache_report()
    c5ca770248125 net: sched: fix 32-bit backlog wrap in gred, bfifo and plug enqueue
    a23a464fb58eb net_sched: sch_fifo: implement lockless __fifo_dump()
    490c72868443f net: bridge: arp/nd proxy: fix reading neigh ha
    6093baf2b2c57 vxlan: fix reading neigh ha
    ed54460caf5b5 NFSv4.1: zero referring call lists before decoding
    5fbb06d4f3d4c net/sched: account classifier filter allocations to memcg
    4cc1ba2b31065 Drivers: hv: vmbus: Skip VMBus module cleanup for non-nested root partition
    19e154d794eb4 Bluetooth: L2CAP: access chan->conn safely in get/setsockopt
    a78d16530c153 Bluetooth: do not leak an hci_conn when a second LE connect is rejected
    bdc530baf079e octeontx2-vf: fix workqueue and netdev race in probe/remove
    b951dd2fd5ede net/sched: act_ife: Only operate on Ethernet frames
    fd63409b669f9 net/sched: fq: add overflow bounds to quantum and initial quantum
    e85f039cf271c net_sched: export pfifo_fast prio2band[]
    87ec1c55104a1 net_sched: sch_fq: change how @inactive is tracked
    3e613afdc2c0c net_sched: sch_fq: struct sched_data reorg
    9cbf6da967ec8 netfilter: nf_tables: skip double clone set expressions on element insert
    7ee50d42a6d5c HID: sony: clean up device list on probe failure
    adc34b5df5c5d NFSD: Prevent client use-after-free during close_lru reaping
    0d53a47c913d0 NFSD: Prevent client use-after-free during blocked-lock reaping
    7a50e138fa28e usb: dwc3: clear forceRM when issuing EndTransfer
    5212f8f452b87 usb: dwc3: gadget: Reinitiate stream for all host NoStream behavior
    13e9f5a913609 usb: gadget: f_midi: initialize work in f_midi_alloc()
    0729ac4976410 usb: gadget: f_midi: Annotate struct f_midi with __counted_by
    8cc9c5a8c559d tracing: Take trace_array reference when opening options file
    ad61defb3e66a dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds
    6e904f9e8cb0e mm/huge_memory: transfer the pmd dirty bit to the folio on zap
    ffbdc2a3834a3 powerpc/kexec_file: Prevent kexec range truncation
    22dc712c170ef s390/vfio-ap: Fix missing lock required to access list of ap_matrix_mdev objects
    4bf5525c6ff4a iio: light: ltrf216a: fix runtime PM reference leak in error path
    49ab1dd9051d4 iio: light: ltrf216a: Return floating point values
    1759a565a25c8 KVM: nVM: Ensure INVVPID is emulated on the correct physical CPU
    5c63e2ed840c8 KVM: s390: Fix memory corruption by not reinjecting CK machine checks
    50fbc294e4e96 LoongArch: BPF: Refactor jump offset calculation in tail call
    22760e3e9cecb f2fs: avoid NULL checkpoint thread access in sysfs
    ac1284f16d560 f2fs: use new ioprio Macro to get ckpt thread ioprio level
    d358d2fc6be11 f2fs: fix to migrate all curseg types during free_segment_range
    58ca9f0648045 f2fs: fix to avoid potential deadloop in f2fs_fsync_node_pages()
    21b7f66716b4f f2fs: fix to clear dirty flag on folio in error path
    668cfb8ab3e22 drm/amdgpu: avoid force-completing uninitialized UVD rings
    11adb2bae30a3 drm/amdgpu: force complete the KIQ ring fences on reset
    5bbd7f283312d drm/amdkfd: Add TLB flush after MES queue eviction/suspension
    44cad7ea3532f drm/amdkfd: Fix error path at svm_migrate_copy_to_ram
    6e1a6f3ddb87d drm/amdkfd: Fix the case that vm range is hole at svm_migrate_copy_to_vram
    5db663fbff7b8 drm/nouveau: unsubscribe the channel-kill event before the fence context
    42085d8ff5bbf drm/nouveau: remove chan->drm
    5362be1dc65e4 drm/nouveau: remove nouveau_chan.device
    2549b61ea1a32 drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm
    e79a70c2e97ae bpf: Disable preemption in bpf_get_stackid
    b4a80e9e639cf PCI: Allow per function PCI slots to fix slot reset on s390
    76ca11e31884b PCI: Introduce PCI_SLOT_PLACEHOLDER constant for slot_nr placeholder value
    134d980491b43 ksmbd: zero pipe read compound padding
    ca3a3984bf445 ksmbd: fix tree connection use-after-free in smb2_tree_connect()
    f1cd6c4c35243 mm/kmemleak: avoid soft lockup when scanning task stacks
    b1d7c69e6c7d3 mm/mglru: fix and remove redundant unevictable folio handling
    92db780dd6445 mm/migrate_device: clear stale mapping after freeing swapcache
    c2745e657f097 zram: fix out-of-bounds access in writeback_store()
    a5fda7def04d9 zram: set default primary compressor in zram_destroy_comps()
    52d0c5bdfe232 NFSD: check truncate permission under inode lock
    64b3baebaf945 nfsd: Pass 'cred' instead of 'rqstp' to some functions.
    43943532c105e lockd, nfsd: RCU-protect nlmsvc_ops dispatch
    d12af460df278 nfsd: fix BUG_ON in nfsd4_alloc_layout_stateid on racing delegation revoke
    172d038b7c4d3 nfsd: split sc_status out of sc_type
    02b0532d4e5a6 NFSD: Clean up nfsd4_encode_layoutreturn()
    ec55ebe19a4b1 NFSD: Clean up nfsd4_encode_stateid()
    2d4f845dffca7 NFSD: Add simple u32, u64, and bool encoders
    bdce362f49410 nfsd: fix stale s2s_cp_stateids IDR entry for async COPY
    98fc1d21a7b80 nfsd: reject out-of-range nseconds in NFSv3 SETATTR and create ops
    94f0c73797c30 NFSD: Prevent client use-after-free during delegation revoke
    352a278d5a196 ceph: fix UAF in check_new_map() on session freed during unlock
    8194d8e61ef0b ceph: cap delegated inode count in ceph_parse_deleg_inos()
    dd2e9824e5e7d ceph: do not repeat ceph_trim_dentries() if no progress possible
    7b8c6af172878 btrfs: drop recovered reloc root refs on recovery failure
    772d39c658543 btrfs: rename err to ret in btrfs_recover_relocation()
    152610f284de4 btrfs: rename ret to ret2 in btrfs_recover_relocation()
    64b870dff9fed btrfs: rename ret to err in btrfs_recover_relocation()
    cb732d302245b btrfs: fix extent map leak in NOCOW direct I/O write
    5463d96cd2e46 cifs: call pagecache_isize_extended() in cifs_setsize() when extending
    b70bc592afd19 smb: client: fix use-before-check of ReparseDataLength in reparse_buf_ptr()
    d837645a71915 smb: client: reject a tree connect response whose byte count is too small
    bd146a8ff107c HID: mcp2221: clear rxbuf after I2C/SMBus transfer completes
    61f7f4fdc0a83 HID: mcp2221: fix OOB write in mcp2221_raw_event()
    b879565effd88 ext2: Fix lost inode updates for IS_SYNC inodes
    719e69421de28 bpf: Disable preemption in __bpf_get_stack
    0e3b8f371c385 dm array: validate array block headers on read
    de932ab28a17c jbd2: use shrink_type type instead of bool type for __jbd2_journal_clean_checkpoint_list()
    882212d317a7c ip: orphan prefetched skbs before multicast forwarding
    62b63a505c10e ipv6: rpl: fix NULL dereference of idev in ipv6_rpl_srh_rcv()
    fe3746b41d491 ipv6: annotate data-races around devconf->rpl_seg_enabled
    f99fedfd1dbff sunrpc: fix use-after-free in __rpc_clnt_handle_event and __rpc_clnt_remove_pipedir
    b2e9e10f5a536 SUNRPC: Reject short RFC 4121 MIC tokens in gss_krb5_verify_mic_v2
    5bf47bbea3c22 svcrdma: Reject connection when transport allocation fails
    5cd069ad1cf7f svcrdma: Handle ADDR_CHANGE CM event properly
    8068358f445a1 svcrdma: Reject inline replies that overflow the pull-up buffer
    beb4e9801f636 svcrdma: Reject Read lists that exceed the page budget
    2e35ec558b8ce svcrdma: Use svc_xprt_put to free listener on create failure
    38bd18764b766 sunrpc: xprtrdma: Use ERR_CAST() to return
    45746d4536ce1 svcrdma: Refactor the creation of listener CMA ID
    a2a16896ed530 sched/core: Make core-sched flips wait for in-flight selections
    6db5af172ccc3 lockd: fix NULL dereference on lockowner allocation failure
    e5e213ddd69e3 lockd: adapt to breakup of struct file_lock
    977ab74712aec filelock: split common fields into struct file_lock_core
    6e1645a6ee85d power: supply: charger-manager: register regulators before exposing sysfs
    3cda6fe44ec6a power: supply: charger-manager: Convert to platform remove callback returning void
    4e3d3923976a9 power: supply: lp8788-charger: fix use-after-free on remove
    5625c186f4088 power: supply: lp8788: Use devm_power_supply_register() helper
    fee7e9a801d1d power: supply: lp8788-charger: Convert to platform remove callback returning void
    bcdcbef9c5e69 power: supply: max17040: propagate register read errors
    6a1ae47211376 iommu/msm: Unwind probe state on registration failure
    f7c9370dd1d3c platform/x86: ISST: Add a NULL check for sst_inst[]
    d680ce2b39f9a platform/x86: int1092: Fix potential memory leak in sar_probe()
    380b305ad7e34 platform/x86: intel_sar: Check ACPI_HANDLE() against NULL
    85ef9d4c384c1 platform/x86/amd/pmc: Propagate SMU errors and validate S2D address
    7efe1c31e0903 net: l2tp: do not propagate multicast notification errors
    b917f37bfcce9 net: ravb: serialize PTP clock teardown
    297e96f38d3e4 net/smc: stop killed, freed and out_of_sync sharing a byte
    5fa0e71d66636 net/smc: Address spelling errors
    b78e34ed7e977 mfd: sm501: Fix potential memory leaks during remove
    b0b8ddaf15110 mfd: sm501: Convert to platform remove callback returning void
    7be73911d979b wifi: iwlwifi: dvm: fix memory leak in iwl_op_mode_dvm_start()
    ab403b9db6f71 wifi: iwlwifi: dvm: pair transport op-mode enter/leave
    d6774f6af3711 wifi: mt76: mt7915: bound the device EEPROM address before the EFUSE copy
    3a2d2115ed890 wifi: mt76: mt7915: set correct background radar capability
    d0c240f25e654 io_uring: defer eventfd signaling when queued from a wakeup handler
    c0376820922d2 net: tap: fix wrong transport_header when sending VLAN-tagged frame
    11ff7642740e6 tap: Keep hdr_len in tap_get_user()
    2b9ddb7311c79 ntb: Store original DMA address for future release
    4a62c07dd7c15 NTB: ntb_transport: Use ntb_get_dma_dev() for DMA buffers
    e85074045bab5 NTB: core: Add .get_dma_dev() callback to ntb_dev_ops
    99b82c8452887 tipc: avoid busy looping in tipc_exit_net()
    82257379061c0 RDMA/rxe: Fix responder UAF on IB_QP_MAX_DEST_RD_ATOMIC modify_qp
    0464d55734f85 RDMA/rxe: Merge request and complete tasks
    603e0ae0bea60 RDMA/rxe: Remove redundant scheduling of rxe_completer
    788fbbf7d61f9 tcp: clamp route advmss to TCP_MIN_MSS
    3130e7bf43ecf fbdev: Wrap user-invoked calls to fb_set_var() in helper
    90be10604936c Bluetooth: ISO: zero the sockaddr before returning it in getname
    9a1bd9fd13266 selinux: reject a permission value exceeding the class permission count
    fef8c8afcb85d drm/amdkfd: Add bounds check for CRAT subtype length
    2cbc1fbfc57b1 drm/amdkfd: Fix infinite loop parsing CRAT with zero subtype length
    5702e4c259809 bpf: Check sk_state before sk_protocol in bpf_tcp_*_syncookie
    07b52a4176572 drm/amd/display: use proper context for logging
    84cf00b1376c7 dmaengine: idxd: fix double free of wq, engine, and group structs
    c41fa44be44e4 hwmon: (sht3x) Fix unaligned accesses
    a9133c4d335e4 net: ethernet: mtk_eth_soc: pass eth to mtk_handle_irq_rx in poll_controller
    f0a544ef6e38e Bluetooth: hci_sync: hold conn in hci_connect_acl/le_sync() callbacks
    a1656234a4a2d Drivers: hv: vmbus: use generic driver_override infrastructure
    3d7b808ec3529 netfilter: nf_conntrack_expect: use conntrack GC to reap expectations
    d031617045dc7 cxl: Fix CXL_HEADERLOG_SIZE to match RAS Capability size
    75ed49f973d79 soc: xilinx: Shutdown and free rx mailbox channel
    b447688f492b8 soc/xilinx: zynqmp_power: Convert to platform remove callback returning void
    c305853027c04 scsi: hisi_sas: Add slave_destroy interface for v3 hw
    592a0e78ab08f media: atomisp: gc2235: fix UAF and memory leak
    fa9560b6d3f66 EDAC/igen6: Fix call trace due to missing release()
    95cda0446f510 netfilter: synproxy: fix unaligned memory access in timestamp adjustment
    370c79e93f0f0 netfilter: synproxy: adjust duplicate timestamp options
    1c6cb2838f82e netfilter: synproxy: drop packets if timestamp adjustment fails
    f03312dad6abe netfilter: make nftables drops visible in net dropmonitor
    1b52aeb40c9f0 netfilter: flowtable: avoid num_encaps underflow on bridge VLAN untag
    d9b17f9ce67d0 btrfs: lzo: reject compressed segment that overflows the compressed input
    30e5ee98e86ad octeontx2-af: npc: Fix size of entry2cntr_map
    bf862fdee4831 ALSA: seq: oss: Serialize readq reset state with q->lock
    31633ba13cc49 coresight: ete: Always save state on power down
    c67e70202cfd6 ieee802154: Avoid calling WARN_ON() on -ENOMEM in cfg802154_switch_netns()
    24a753a49d068 tracing/probes: Remove WARN_ON_ONCE from parse_btf_arg
    67a5d905c17a5 drm/amdgpu: reject oversized IBs with per-ring packet limits
    1ec5f6aa38ea9 scsi: core: pair EH runtime PM get and put
    4a4410de8dc69 sctp: validate cookie AUTH state before use
    2512289cbf587 ipvs: revalidate ihl to prevent out-of-bounds access
    bd897e414451f l2tp: fix tunnel and session refcount leak on seq_file release
    3770a4794a143 firewire: ohci: fix NULL pointer dereference in ar_context_release
    5d05c4252c09c gpio: pca953x: fix pca953x_irq_bus_sync_unlock regmap lock
    b87c0d24386ed soc: aspeed: lpc-snoop: Fix usercopy overflow in snoop_file_read
    5d00c9c1c951a btrfs: lzo: reject inline extents without valid headers
    fb22bedf0c4f4 bpf: Fix netns reference imbalance in conntrack kfuncs
    96da3e1439e7d vhost_iotlb: bound map allocation in add_range
    ce443f6827b97 hwmon: (pmbus) Fix type confusion in notification logic
    4db3b48a966ed netfilter: nf_flow_table: drop existing skb dst before skb_dst_set_noref()
    950dac9e8c4e3 s390/ism: Fix UAF of sba and ieq during ism_dev_exit()
    a9e0efcb1125e watchdog: at91sam9_wdt: prevent timer rearm during teardown
    61dd022c55c73 net: tap: set skb->dev before parsing virtio net header in tap_get_user_xdp()
    cc325ce1c40a1 serial: 8250_of: clear stuck empty-FIFO RX-timeout on LPC32xx
    c71bacacd5916 tls: rx: restore msg_iter before TLS 1.3 optimistic retry
    e3738530ad9c9 selftests: tls: add rekey tests
    bea345a8d2f02 selftests: tls: add test with a partially invalid iov
    25d27d5fa8645 eventfs: Use children field for rcu head and add memory barriers
    f6cf9832e677e mm/page_table_check: skip special zero mappings
    ca05d9abde219 btrfs: skip global block reserve accounting for rescue mounts
    71714a2cec6c6 netfilter: nf_tables: make nft_object rhltable per table
    c24b3379c0ff0 xsk: fix buffer leak in xsk_drop_skb() for AF_XDP multi-buffer Tx
    724c8edbacf12 net/sched: cls_u32: validate offshift to prevent shift-out-of-bounds
    52c753b462652 net: udp_tunnel: fix memory leak in udp_tunnel_nic_unregister()
    44590dc53c9e9 Bluetooth: ISO: hold sk properly in iso_conn_ready
    1106b26e86ac1 octeontx2-af: Block VFs from clobbering special CGX PKIND state
    dd1a334523ba5 s390/zcrypt: Close speculative mem read possibility
    f82d42577ee4a wifi: ath11k: cancel SSR work items during PCI shutdown
    932ebfad767be OPP: Fix race between OPP addition and lookup
    a6c5f5d98719e RDMA/hns: Fix log flood after cmd_mbox failure
    bc963e193b314 ALSA: seq: oss: Fix UAF at handling events with embedded SysEx data
    fc11e3f0daaad nvmet-tcp: fix page fragment cache leak in error path
    3f5e8fa9ae290 net: introduce page_frag_cache_drain()
    bc53b85adb103 nvmet-tcp: allocate socket file
    cc1c1682fa593 nvmet-tcp: make nvmet_tcp_alloc_queue() a void function
    923a6f3172a36 md/raid1,raid10: fix deadlock in read error recovery path
    d960cd5dbcc6a wifi: ath12k: fix memory leak in ath12k_wifi7_dp_rx_h_verify_tkip_mic()
    0fe5ca2d56f01 vhost: fix vhost_get_avail_idx for a non empty ring
    578a4ee936b40 vhost: move smp_rmb() into vhost_get_avail_idx()
    9cb2db3791df9 vhost: correct misleading printing information
    dcabbf7da4382 ocfs2: validate fast symlink target during inode read
    394317e96702a ocfs2: add extra consistency checks for chain allocator dinodes
    1241e459a1bd1 netfilter: cttimeout: detach dataplane timeout policy and repurpose refcount
    ff584d3735b13 RDMA/siw: Fix endpoint/socket association handling
    7b17fdbfb5c9e RDMA/siw: Introduce siw_destroy_cep_sock
    628a469d2a73e bpf: Clear rb node linkage when freeing bpf_rb_root
    f0a49d16804d3 bpf: Reject sleepable BPF_LSM_CGROUP programs at load time
    ec485257ccbc7 ixgbe: do not configure xps for XDP queues
    663f184b51492 ext4: validate donor file superblock early in EXT4_IOC_MOVE_EXT
    eae296065ede4 ALSA: seq: Fix kernel heap address leak in bounce_error_event()
    7d07df8a200ca ALSA: seq: Drop superfluous filter argument of get_event_dest_client()
    8efa9fcc1d31b cxl/region: Block region delete during region creation
    3e8f3959a7fd2 bnxt: fix head underflow on XDP head-grow
    2fc2c92320272 net: watchdog: fix refcount tracking races
    ae429220c7f97 ALSA: seq: avoid stale FIFO cells during resize
    348a52e50a462 ALSA: seq: Clean up fifo locking with guard
    a0024ab97592a ALSA: seq: fifo: Use guard() for locking
    6b59007d95aee sockmap: Fix use-after-free in udp_bpf_recvmsg()
    88baaa8ca3731 RDMA/bnxt_re: Initialize dpi variable to zero
    8e59bd37d6d63 RDMA/bnxt_re: Avoid repeated requests to allocate WC pages
    7d89bff21c12e RDMA/irdma: Replace waitqueue and flag with completion
    a2275dce05e6d soundwire: fix bug in sdw_add_element_group_count found by syzkaller
    a562485c359d0 xprtrdma: Fix ep kref imbalance on ADDR_CHANGE
    921e2baa626d1 md/raid1: fix writes_pending and barrier reference leaks on write failures
    f076460c5205c md/raid10: fix writes_pending leak on write request failures
    6d21a3fed9be4 md/raid10: Handle bio_split() errors
    80ac31cce5543 md/raid10: fix writes_pending and barrier reference leaks on discard failures
    669bc3b345712 bpf: Guard conntrack opts error writes
    d0282a1546e75 bpf: net: netfilter: drop dead NULL checks
    158a5480d5196 md/raid5: avoid R5_Overlap races while breaking stripe batches
    f49ed02fd8c98 net: udp_tunnel: prevent double queueing in udp_tunnel_nic_device_sync
    6aeb4ba4fb098 tipc: fix UAF in cleanup_bearer() due to premature dst_cache_destroy()
    81892d83cc897 sctp: add INIT verification after cookie unpacking
    cd0e037130806 hwmon: (pmbus/core) honor vrm_version in pmbus_data2reg_vid()
    5098308ad72f8 sctp: fix addr_wq_timer race in sctp_free_addr_wq()
    72e27ef70a202 xen/pvcalls: bound backend response req_id before indexing rsp[]
    2e7888bb635d9 afs: Fix reinitialisation of the inode, in particular ->lock_work
    f72176bde0cc0 HID: bpf: Fix hid_bpf_get_data() range check
    268869794170a net/mlx5e: Fix publication race for priv->channel_stats[]
    333a39f134dd0 Bluetooth: 6lowpan: avoid untracked enable work
    e3b20de8d7c06 net/liquidio: drop cached VF pci_dev LUT
    3b0aa139ba09a perf/x86/amd/core: Avoid enabling BRS from the SVM reload path
    db2b40dc12cd6 gpio: mvebu: free generic chips on unbind
    2d0effadf8d2c ipv4: igmp: Fix potential memory leaks in igmp_mod_timer() and igmp_stop_timer()
    65d35cb555f40 netfilter: nft_lookup: fix catchall element handling with inverted lookups
    eb74f3feb68e6 KVM: arm64: vgic: Handle race between interrupt affinity change and LPI disabling
    043c509f24880 mm/hugetlb: fix hugetlb cgroup rsvd charge/uncharge mismatch
    6626fb859f4c4 fs: Remove NTFS classic
    1dc6653c47147 mtd: maps: vmu-flash: fix fault in unaligned fixup
    c286319746cef ocfs2: fix UBSAN array-index-out-of-bounds in ocfs2_sum_rightmost_rec
    df99ca9b5b8e2 ocfs2: validate i_refcount_loc when refcount flag is set
    b8fa4d063e3b0 ocfs2: add suballoc slot check in ocfs2_validate_inode_block()
    f4cd214883d77 ocfs2: correct l_next_free_rec in online check
    584d7d14d9b40 nvmet-auth: reject short AUTH_RECEIVE buffers
    0bdb510cd7c4b nvmet: Introduce nvmet_req_transfer_len()
    374775626c327 dm-verity: fix buffer overflow in FEC calculation
    face65f80c694 mmc: vub300: fix use-after-free on probe failure
    181b46e76a218 wifi: ieee80211: validate MLE common info length
    d0951ed366710 s390/zcrypt: Fix buffer over-read in cca_cipher2protkey
    7e13e5b087375 ovl: check access to copy_file_range source with src mounter creds
    98ca831065c4d net/sched: Handle TC_ACT_REDIRECT from qdisc filter chains
    3b71f51fa3a24 LoongArch: Fix address space mismatch in kexec command line lookup
    aa24049ce2fc9 loongarch, kexec: change dependency of object files
    4927ab8a8acc8 xfrm: fix stale skb->prev after async crypto steals a GSO segment
    d52ff592abfcd RDMA/irdma: Prevent user-triggered null deref on QP create
    a5afc00280986 wifi: mac80211: defer link RX stats percpu free to RCU
    88f31eac74b9d wifi: cfg80211: add link_station_info structure to support MLO statistics
    0246df249c04e wifi: mac80211: refactor populating mesh related fields in sinfo
    30c67926d41c4 wifi: cfg80211: convert pmsr_free_wk to wiphy_work to fix deadlock
    c55590e4c69e0 wifi: cfg80211: use wiphy work for socket owner autodisconnect
    d312a71b19bb8 firmware: arm_ffa: Fix out-of-bound writes in ffa_setup_and_transmit()
    f6814814b3bdd bpf: Fix UAF in sock clone early bailouts
    95ddf04135a78 bpf: Use rcu_read_lock_dont_migrate in bpf_sk_storage.c
    8faa3deda8d06 rcu: add rcu_read_lock_dont_migrate()
    c0131f007dd29 bpf: Disable migration when cloning sock storage
    bba24ce0e5299 bpf: Disable migration when destroying sock storage
    4827c824a203e scsi: core: wake eh reliably when using scsi_schedule_eh
    3ff6b534d2082 tipc: serialize udp bearer replicast list updates
    bac237c2aedb8 pds_core: fix use-after-free on workqueue during remove
    895b3f83f030c pds_core: Clean up init/uninit flows to be more readable
    c004f1985c570 pds_core: Don't assign interrupt index/bound_intr to notifyq
    c968b2417f6a1 cifs: fix cifsFileInfo leak on kmalloc failure in deferred close drain paths
    9e904b3608444 cifs: prevent readdir from changing file size due to stale directory metadata
    3be8dcc1a5854 drm/vc4: hvs/v3d: Fix null dereference in unbind
    c8a4acc19dcdc net/mlx5: Fix MCIA register buffer overflow on 32 dword reads
    3531910845165 drm/amdgpu: Fix context pstate override handling
    2b817c0dfc653 drm/amdkfd: Check bounds on CRIU restore queue type and mqd size
    dc30139679354 drm/i915/bios: range check LFP Data Block panel_type2
    bedeee4612afc drm/i915/gt: Fix NULL deref on sched_engine alloc failure
    fae63319ad397 drm/i915/mst: limit DP MST ESI service loop
    1748043b5114c drm/amdgpu: Release VFCT ACPI table reference
    8151bfd641384 drm/amdgpu: Add wrapper for freeing vbios memory
    9ed82f9cb1d6c drm/amdgpu: Use dbg level for VBIOS check messages
    cf55c6f1b62a8 drm/vc4: Shut down BO cache timer before teardown
    ae6ccae32f51f media: vivid: fix cleanup bugs in vivid_init()
    1d0b99ef7fcb6 LoongArch: Move jump_label_init() before parse_early_param()
    a2516be690488 ksmbd: fix path resolution in ksmbd_vfs_kern_path_create
    3350acfa72b2e vfs: make LAST_XXX private to fs/namei.c
    3100f7fc873bb ksmbd_vfs_rename(): vfs_path_parent_lookup() accepts ERR_PTR() as name
    a7bf4f5b19965 KVM: nVMX: Put vmcs12 pages if nested VM-Enter fails due to invalid guest state
    9174992ee1045 Bluetooth: eir: Fix stack OOB write when prepending the Flags AD
    22e371a93563c net/handshake: Take a long-lived file reference at submit
    3e339c88b8c30 ALSA: hda/cs35l41: Fix firmware load work teardown
    eec1dd2586c40 ksmbd: prevent path traversal bypass by restricting caseless retry
    2ad5509dd576a ksmbd: use opener credentials for ADS I/O
    a6a951416b55e ksmbd: validate NTLMv2 response before updating session key
    6825a45f6b8ef smb/client: fix chown/chgrp with SMB3 POSIX Extensions
    0f012938f2130 cpufreq: qcom-cpufreq-hw: Fix possible double free
    203016396f00b cpufreq: Make cpufreq_driver->exit() return void
    41401e2f4c175 cpufreq: pcc: Remove empty exit() callback
    4e7d3c98fed73 USB: iowarrior: fix use-after-free on disconnect race
    8ae9bb92fc9a7 nvmet: fix pre-auth out-of-bounds heap read in Discovery Get Log Page
    11d48f777cf8f crypto: qat - protect service table iterations with service_lock
    02b88fa993582 hwmon: (lm90) Add lock protection to lm90_alert
    bdad77438cc2b drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
    3812cfe6cb0a5 erofs: fix metabuf leak in inode xattr initialization
    8efbea0253b7f ksmbd: validate SID in parent security descriptor during ACL inheritance
    5fe97797412aa wifi: mac80211: capture fast-RX rate before mesh reuses skb->cb
    55b170713aa54 wifi: mac80211: fix missing RX bitrate update for mesh forwarding path
    5ea15e7823225 netfilter: x_tables: allocate hook ops while under mutex
    2a5defedd154a netfilter: x_tables: allow initial table replace without emitting audit log message
    124f5187c3dd5 netfilter: Use kmemdup_array instead of kmemdup for multiple allocation
    ff9ecefd488a4 mm/util: Introduce kmemdup_array()
    6fe4c808b6cdb netfilter: ebtables: move to two-stage removal scheme
    5fc488f46086d netfilter: bridge: eb_tables: close module init race
    1fe96176636cb hwmon: (lm90) Stop work before releasing hwmon device
    b28b862b07257 cgroup/rstat: validate cpu before css_rstat_cpu() access
    14dbf22c397b7 ethtool: rss: fix indir_table and hkey leak on get_rxfh failure
    ee4b2ba9d3015 net/handshake: Drain pending requests at net namespace exit
    7b81c1378b79c Bluetooth: hci_sync: Set HCI_CMD_DRAIN_WORKQUEUE during device close
    6bacd22e1eae7 usb: typec: tcpm: validate VDO count in Discover Identity ACK handlers
    816c6251409db usb: typec: tcpm: bound altmode_desc[] per iteration in svdm_consume_modes()
    bbd3a27e4f99f KVM: SEV: Ignore Port I/O requests of length '0'
    e35cf322897dd drm/amdgpu: fix amdgpu_hmm_range_get_pages
    525cc9df65436 drm/amdgpu/vcn: set no_user_fence for VCN v4.0 enc ring
    b0f7bd5eeb903 gcov: use atomic counter updates to fix concurrent access crashes
    bcc9df992f3cb f2fs: read COW data with the original inode during atomic write
    5e10b1747547c fbdev: omap2: fix use-after-free in omapfb_mmap
    2d60e3b176a4b fbdev: omap2: fix inconsistent lock returns in omapfb_mmap
    01930f94b8b13 drm/msm: always recover the gpu
    a632474c793b7 drm/amd/display: Fix out-of-bounds read in dp_get_eq_aux_rd_interval()
    9d63dd026644f wifi: mt76: mt7921: Place upper limit on station AID
    1cad9afbb2d55 drm/amd/display: Avoid NULL dereference in dc_dmub_srv error paths
    793bf1f4e469c net: mana: Guard mana_remove against double invocation
    4255c8f756b78 net: phonet: do not BUG_ON() in pn_socket_autobind() on failed bind
    7107b047e709a btrfs: only release the dirty pages io tree after successful writes
    312ecea13b677 l2tp: pppol2tp: hold reference to session in pppol2tp_ioctl()
    87484866cae91 wifi: fix leak if split 6 GHz scanning fails
    3bad189a31eb7 net/mlx5e: xsk: Fix DMA and xdp_frame leak on XDP_TX xmit failure
    f51a7b611bd97 tools: ynl: extend netdev sample to dump xdp-rx-metadata-features
    8cb3a5ecef999 bpf: make it easier to add new metadata kfunc
    dd75066882ecc sctp: validate embedded INIT chunk and address list lengths in cookie
    d95edbbf7830d staging: rtl8723bs: fix buffer over-read in rtw_update_protection
    94ea9dc65fae4 staging: rtl8723bs: clean up redundant & parentheses
    f90cda7f7ae75 Staging: rtl8723bs: Delete dead code from update_current_network()
    890083673a623 Staging: rtl8723bs: Remove dead code from _rtw_free_network()
    18143799ad51a staging: rtl8723bs: rtw_mlme: add bounds checks before ie_length subtraction
    6cdcf0d16c809 nvmem: core: fix use-after-free bugs in error paths
    38434334a32c6 nvmem: core: Rework layouts to become regular devices
    cc7ce6736b237 nvmem: Move of_nvmem_layout_get_container() in another header
    18ca42f07ad00 of: device: Export of_device_make_bus_id()
    cbdd6f0fb19a0 fs/mbcache: cancel shrink work before destroying the cache
    1034251715a34 btrfs: fix deadlock between reflink and transaction commit when using flushoncommit
    fdfa287956d00 PCI: use generic driver_override infrastructure
    4005cb89139f7 vdpa: use generic driver_override infrastructure
    dbba371b19129 bus: fsl-mc: use generic driver_override infrastructure
    7bedc489611f0 wifi: ath11k: fix memory leaks in beacon template setup
    e9d197c248e70 powerpc/pgtable-frag: Fix bad page state in pte_frag_destroy
    6f571bf37da84 powerpc/64s: Fix unmap race with PMD migration entries
    a2af91af95369 wifi: mt76: Fix memory leak after mt76_connac_mcu_alloc_sta_req()
    533b1a9fa0128 wifi: mt76: mt7996: fix use-after-free bugs in mt7996_mac_dump_work()
    5895cfc76924a net: pull headers in qdisc_pkt_len_segs_init()
    7f0062c40781f sctp: disable BH before calling udp_tunnel_xmit_skb()
    166a08644aa50 iommu/amd: Fix clone_alias() to use the original device's devid
    e4d07fd4e3002 greybus: raw: fix use-after-free on cdev close
    c260c874a6d57 f2fs: avoid reading already updated pages during GC
    0645fa4d48e9b f2fs: fix data loss caused by incorrect use of nat_entry flag
    359906450690a ice: fix double-free of tx_buf skb
    ede973d62d26d netfilter: nat: use kfree_rcu to release ops
    d8ddbc3330fa6 sched/psi: fix race between file release and pressure write
    926ec3937b28d fsnotify: fix inode reference leak in fsnotify_recalc_mask()
    759053333a40c libceph: Fix potential out-of-bounds access in __ceph_x_decrypt()
    37d028a473b08 tap: fix stack info leak in tap_ioctl() SIOCGIFHWADDR
    74d33525db50d Revert "net/smc: Introduce TCP ULP support"
    e327021bd73b1 RDMA/rxe: Fix iova-to-va conversion for MR page sizes != PAGE_SIZE
    2405730fde96f netfilter: nf_tables: use list_del_rcu for netlink hooks
    d8cafd0226d5d selinux: allow multiple opens of /sys/fs/selinux/policy
    ef8b71a0fc692 iio: frequency: admv1013: fix NULL pointer dereference on str
    7afabc08721ec iio: frequency: admv1013: add dev variable
    f1f4cac657f86 iio: frequency: admv1013: Use devm_regulator_get_enable_read_voltage()
    58f9d54a8109f device property: Add fwnode_property_match_property_string()
    3e8cdf184646c coresight: tmc-etr: Fix race condition between sysfs and perf mode
    d772e8570f19a drm/amd/display: Fix dc_link NULL handling in HPD init
    dd74a790818eb spi: mpc52xx: fix use-after-free on registration failure
    c6e3b9f5dcb80 spi: mpc52xx: fix controller deregistration
    125a7eb177a94 spi: mpc52xx: switch to use modern name
    2d8b30b496bc5 RDMA/mlx4: Fix mis-use of RCU in mlx4_srq_event()
    d1820a5814ead f2fs: fix fsck inconsistency caused by FGGC of node block
    8f3a5dc4055e1 riscv: kvm: fix vector context allocation leak
    783dc000b8be6 spi: microchip-core-qspi: control built-in cs manually
    03348b440f694 dm-verity-fec: fix reading parity bytes split across blocks (take 3)
    fcef67506c023 KVM: nSVM: Raise #UD if unhandled VMMCALL isn't intercepted by L1
    165b08d2d1346 KVM: nSVM: Avoid clearing VMCB_LBR in vmcb12
    b1a45e8a59bcf KVM: nSVM: Always use NextRIP as vmcb02's NextRIP after first L2 VMRUN
    2e661773890e6 KVM: nSVM: Triple fault if restore host CR3 fails on nested #VMEXIT
    33deba9bf5c34 RDMA/mlx5: Fix UMR hang in LAG error state unload
    4db5e4c8f1103 gfs2: fix memory leaks in gfs2_fill_super error path
    ab4aeab2d630e iommu/vt-d: Clear Present bit before tearing down context entry
    237e0524a5381 erofs: fix inline data read failure for ztailpacking pclusters
    107e169f96392 net: stmmac: fix oops when split header is enabled
    12addb8ab5eec btrfs: fix EEXIST abort due to non-consecutive gaps in chunk allocation
    8e1623e7d61fa bpf: Fix tcx/netkit detach permissions when prog fd isn't given
    11d35b1101344 ipvs: do not keep dest_dst if dev is going down
    b0dd8637fbaae netfilter: nf_tables: revert commit_mutex usage in reset path
    c36b0515c6445 iommu/vt-d: Clear Present bit before tearing down PASID entry
    cde7f709d1025 HID: intel-ish-hid: fix NULL-ptr-deref in ishtp_bus_remove_all_clients
    63f67e525be21 HID: Intel-ish-hid: Ishtp: Fix sensor reads after ACPI S3 suspend
    53aaf083de197 gfs2: Fix slab-use-after-free in qd_put
    32d7120a499d4 list_lru: allow explicit memcg and NUMA node selection
    60310ed5d3d3a mm: list_lru: Update kernel documentation to follow the requirements
    6451ea47d60a8 net/mlx5e: RX, Fix XDP multi-buf frag counting for striding RQ
    1106412414dc3 net/mlx5e: RX, Fix XDP multi-buf frag counting for legacy RQ
    a71ce398347fe ASoC: amd: acp-mach-common: Add missing error check for clock acquisition
    baabbd2919151 scsi: qla2xxx: Completely fix fcport double free
    73bb6b15f1fd7 i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
    04b2853fdbb2e i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT handling in DMA dequeue
    320942ce316a1 btrfs: reserve enough transaction items for qgroup ioctls
    0e77f1c8ebf5b btrfs: don't BUG() on unexpected delayed ref type in run_one_delayed_ref()
    a35b38cb4b0dd btrfs: do not ASSERT() when the fs flips RO inside btrfs_repair_io_failure()
    87fc584a72bc4 drm/amdgpu: Skip vcn poison irq release on VF
    3cd7a71958c9f drm: renesas: rz-du: mipi_dsi: fix kernel panic when rebooting for some panels
    5593c9b255ae7 alpha: fix user-space corruption during memory compaction
    a91476c7b4091 arch: turn off -Werror for architectures with known warnings
    aad97c92119cb usb: chipidea: udc: fix DMA and SG cleanup in _ep_nuke()
    480aa6ffd4ac7 9p/xen: protect xen_9pfs_front_free against concurrent calls
    566899af05324 vhost: move vdpa group bound check to vhost_vdpa
    6f129a251c279 kcm: fix zero-frag skb in frag_list on partial sendmsg error
    1cf0ef7399188 team: avoid NETDEV_CHANGEMTU event when unregistering slave
    c0da84e308a0b wifi: rtw89: pci: validate sequence number of TX release report
    5efde07521309 net/mlx5e: Fix "scheduling while atomic" in IPsec MAC address query
    68fe91df6ea82 netconsole: avoid OOB reads, msg is not nul-terminated
    56eab82fa6fb5 ksmbd: fix signededness bug in smb_direct_prepare_negotiation()
    5cc021586420c wifi: iwlwifi: fix 22000 series SMEM parsing
    759e44a6cba8e xfs: remove xfs_attr_leaf_hasname
    d60f09d2d16c4 ntfs3: fix circular locking dependency in run_unpack_ex
    bd5e7ba28a49b fs/ntfs3: Accumulated refactoring changes
    c939bfa67d221 btrfs: fix zero size inode with non-zero size after log replay
    cff22dd364b24 btrfs: tree-log: don't use token set/get accessors in fill_inode_item()
    f03cd10a3513e btrfs: convert to new timestamp accessors
    20b98d9ffb097 srcu: Use irq_work to start GP in tiny SRCU
    3ff29beb3b82e irqwork: Move data struct to a types header
    94ad192f7b9b5 types: move struct rcuwait into types.h
    f8f3bb89ab677 xfrm: account XFRMA_IF_ID in aevent size calculation
    34b8390ac0ba5 ipv6: ioam: fix potential NULL dereferences in __ioam6_fill_trace_data()
    a05a85779c257 net: ioam6: fix OOB and missing lock
    73c2dc2c14d6a x86-64: rename misleadingly named '__copy_user_nocache()' function
    3d6de8467236c Bluetooth: MGMT: Fix list corruption and UAF in command complete handlers
    df966f0def875 HID: logitech-hidpp: Prevent use-after-free on force feedback initialisation failure
    218b93b7e284d HID: core: Mitigate potential OOB by removing bogus memset()
    ca27733152dbd HID: rate-limit hid_warn to prevent log flooding
    556a757847aed HID: core: Add reserved item tag for main items
    0d377825548fe mpls: add seqcount to protect the platform_label{,s} pair
    5057502630fbc net: use skb_header_pointer() for TCPv4 GSO frag_off check
    dfee8da127baf Bluetooth: hci_sync: hci_cmd_sync_queue_once() return -EEXIST if exists
    1aac6b271e0a8 bpf: Fix incorrect pruning due to atomic fetch precision tracking
    1e4b738dd0d0f Bluetooth: hci_event: move wake reason storage into validated event handlers
    481f7a463ae4b drm/i915/dsi: Don't do DSC horizontal timing adjustments in command mode
    fdc3aa4c23d3e usb: gadget: f_ecm: Fix net_device lifecycle with device_move
    b1d854462510f usb: gadget: f_eem: Fix net_device lifecycle with device_move
    edb0804705188 usb: gadget: f_subset: Fix net_device lifecycle with device_move
    9701a98f4459b usb: gadget: f_rndis: Fix net_device lifecycle with device_move
    ad7d18df7423c ksmbd: validate num_aces and harden ACE walk in smb_inherit_dacl()
    7e345de2e6947 crypto: af_alg - limit RX SG extraction by receive buffer budget
    94439cbe478b5 xfrm: hold dev ref until after transport_finish NF_HOOK
    adc2fe90827e0 xfrm: hold device only for the asynchronous decryption
    a516594c502fd net: adopt skb_network_offset() and similar helpers
    a229a4dc87302 net: lan966x: fix page pool leak in error paths
    808a34cdbe8ce rxrpc: proc: size address buffers for %pISpc output
    3aa77f5da0ecb usb: gadget: f_hid: don't call cdev_init while cdev in use
    777a8ebd2da35 KVM: SEV: Protect *all* of sev_mem_enc_register_region() with kvm->lock
    f554953cf4fab KVM: SEV: Use long-term pin when registering encrypted memory regions
    1eb35c54cd81c s390/mm: Add missing secure storage access fixups for donated memory
    bac13309339b6 spi: spi-dw-dma: fix print error log when wait finish transaction
    a8a3fb2888e2c nvmet: move async event work off nvmet-wq
    18a4543c1750f ipv4: nexthop: allocate skb dynamically in rtm_get_nexthop()
    b1f62588ab1be cxl/port: Fix use after free of parent_port in cxl_detach_ep()
    c5e2de193831a net: bcmasp: fix double free of WoL irq
    d5dcca707f56c iavf: fix out-of-bounds writes in iavf_get_ethtool_stats()
    6e8eb467bed6a spi: use generic driver_override infrastructure
    f69491478e3de drm/amdgpu: prevent immediate PASID reuse case
    6ea2a79faed97 drm/amdgpu: Remove usage of the deprecated ida_simple_xx() API
    1df0123f96f37 ksmbd: use volume UUID in FS_OBJECT_ID_INFORMATION
    3bba71395ad45 fs: super_set_uuid()
    c9e845014723d serial: core: fix infinite loop in handle_tx() for PORT_UNKNOWN
    f5a41b61b5faa bpf, arm64: Force 8-byte alignment for JIT buffer to prevent atomic tearing
    44f6b01693b87 bpf, arm64: Enable the inline of bpf_kptr_xchg()
    f2b29bbe35522 ice: change XDP RxQ frag_size from DMA write length to xdp.frame_sz
    ce6253fe71881 sched/deadline: Fix missing ENQUEUE_REPLENISH during PI de-boosting
    5e2fc90018635 PCI: dwc: ep: Flush MSI-X write before unmapping its ATU entry
    3555e41737c0f cxl/mbox: validate payload size before accessing contents in cxl_payload_from_user_allowed()
    da5f0166cef3d net: add xmit recursion limit to tunnel xmit functions
    e873e8c16b2fb tcp: secure_seq: add back ports to TS offset
    43ad494ac6e94 ksmbd: add chann_lock to protect ksmbd_chann_list xarray
    34614f5dd26c8 btrfs: reject new transactions if the fs is fully read-only
    b2b9ac2bb2c5b drm/amd/pm: Disable MMIO access during SMU Mode 1 reset
    152fc4f7b4a8a ALSA: usb-audio: Prevent excessive number of frames
    513587caec66b spi: tegra210-quad: Protect curr_xfer check in IRQ handler
    4c7ad40c285ab of: unittest: Fix memory leak in unittest_data_add()
    17260b5215d4c staging: rtl8723bs: fix xmit_frame/xmit_buf leaks on mgnt-frame error paths
    015f9fbcf3382 bpf: Mark bpf_refcount field as unique
    11e78304b0113 PCI: endpoint: Add missing NULL check for alloc_workqueue()
    ab0bdaf7a7f4f net: qrtr: Drop the MHI auto_queue feature for IPCR DL channels
    d57e31c8df7b8 wifi: rtw88: Use devm_kmemdup() in rtw_set_supported_band()
    13f96c3b73a84 wifi: rtw88: debugfs: support multiple adapters debugging
    c02b1d244a5d7 wifi: mac80211: don't WARN for connections on invalid channels
    863b9b7be824a md: suspend array while updating raid_disks via sysfs
    2ad6c244d65a8 md: add new helpers to suspend/resume and lock/unlock array
    2284eab166f2d md: add new helpers to suspend/resume array
    f150854e9a0bc mips: unhide uasm_in_compat_space_p() declaration
    9cfda98cf02ea MIPS: ftrace: Fix memory corruption when kernel is located beyond 32 bits
    585a656283c95 functionfs: fix the open/removal races
    f68515eb8f3cf functionfs, gadgetfs: use simple_recursive_removal()
    9aa31e353d9f4 usb: gadget: functionfs: Factorize wait-for-endpoint code
    61c3f32b425ab usb: gadget: Support already-mapped DMA SGs
    8cf889d45bbc8 Input: lkkbd - disable pending work before freeing device
    8fdbc6f9a994e shmem: fix recovery on rename failures
    b9d8cfd6d77f5 Input: alps - fix use-after-free bugs caused by dev3_register_work
    0d0a1a267c1ee scsi: qla2xxx: Clear cmds after chip reset
    abfbceda0d239 wifi: ath12k: Fix MSDU buffer types handling in RX error path
    d6028caa0ee39 bpf: Fix stackmap overflow check in __bpf_get_stackid()
    5d5d130835b41 coresight: ETR: Fix ETR buffer use-after-free issue
    dc6d1249ee35c md: fix rcu protection in md_wakeup_thread
    a17d1bca5aba1 md: fix stopping sync thread
    66eb53cecc5f8 gfs2: Prevent recursive memory reclaim
    9a8e531543535 scsi: imm: Fix use-after-free bug caused by unfinished delayed work
    2eb6a5f6adb7d tty: serial: ip22zilog: Use platform device for probing
    79693f738680d serial: ip22zilog: Use port lock wrappers
    1c963811b0824 scsi: ufs: ufs-qcom: Fix UFS OCP issue during UFS power down (PC=3)
    51713b285096a scsi: ufs: qcom : Refactor phy_power_on/off calls
    f0ee42f47cc1b drm/amdgpu: fix gpu page fault after hibernation on PF passthrough
    1e00721013ff9 drm/amdgpu: Restore partition mode after reset
    1a7865e3e4de2 mlx5: Fix default values in create CQ
    b68d1f321119b drm/amdgpu: remove two invalid BUG_ON()s
    e61dfd906ad02 tcp: use dst_dev_rcu() in tcp_fastopen_active_disable_ofo_check()
    6776866cffbc2 media: nxp: imx8-isi: Fix streaming cleanup on release
    0a187ea7a5b4e ASoC: Intel: avs: Do not share the name pointer between components
    29c742ff222dd md/raid10: wait barrier before returning discard request with REQ_NOWAIT
    3d608e67b966c drm/amdgpu: hide VRAM sysfs attributes on GPUs without VRAM
    8a0fc82502321 drm/amdgpu: Show vram vendor only if available
    31d6c9216aa1b Bluetooth: MGMT: fix crash in set_mesh_sync and set_mesh_complete
    47a92030422d0 mailbox: zynqmp-ipi: Fix out-of-bounds access in mailbox cleanup loop
    69f35d8d17b31 mailbox: zynqmp: Move buffered IPI setup to of_match selected routine
    5db5e21b6cd58 mailbox: zynqmp: Move of_match structure closer to usage
    daa680de4eb91 mailbox: zynqmp-ipi: fix an Excess struct member kernel-doc warning
    9f22b5f7f1a32 net: use dst_dev_rcu() in sk_setup_caps()
    423895685f367 ipv6: use RCU in ip6_output()
    5f75857ed634d crypto: hisilicon/qm - request reserved interrupt for virtual function
    7012bea562239 tcp_metrics: use dst_dev_net_rcu()
    8b6e327736db0 RISC-V: KVM: Write hgatp register with valid mode bits
    da513f2ad1b1b ptp: Add a upper bound on max_vclocks
    dfbff47f120e4 bpf: Check the helper function is valid in get_helper_proto
    145b8f1776e5b bpf: add a get_helper_proto() utility function
    b467ebabf16c9 bpf: improve error message for unsupported helper
    3b32cf6e27959 iommu/s390: Make attach succeed when the device was surprise removed
    8729dc4eeb502 ice: fix Rx page leak on multi-buffer frames
    891ab8c695419 dm-stripe: fix a possible integer overflow
    53707bc68fdc7 dm-stripe: limit chunk_sectors to the stripe size
    fd677c1f51c57 dm: stop using blk_limits_io_{min,opt}
    fea5d52f89f4f dm-verity: provide dma_alignment limit in io_hints
    f23d5c6b7540e smb: client: let recv_done verify data_offset, data_length and remaining_data_length
    dc5aad078abc4 ceph: fix race condition validating r_parent before applying state
    9598c83a50a5f mm/vmalloc, mm/kasan: respect gfp mask in kasan_populate_vmalloc()
    6d40c15d70c2d wifi: mt76: mt7915: fix list corruption after hardware restart
    e2a6eabe5304a ptp: ocp: fix use-after-free bugs causing by ptp_ocp_watchdog
    18e4b315e359f vxlan: Fix NPD when refreshing an FDB entry with a nexthop object
    8ba034c41b20d vxlan: Fix NPD in {arp,neigh}_reduce() when using nexthop objects
    aa977309397fe trace/fgraph: Fix the warning caused by missing unregister notifier
    dc797a4bbbcac bnxt_en: Fix memory corruption when FW resources change during ifdown
    74d3b91f1598e crypto: x86/aegis - Add missing error checks
    6758b816ffed5 crypto: x86/aegis - Fix sleeping when disallowed on PREEMPT_RT
    cbab09ae85675 crypto: x86/aegis128 - improve assembly function prototypes
    3223bb62918e5 crypto: x86/aegis128 - optimize length block preparation using SSE4.1
    67ddb169e1528 crypto: x86/aegis128 - eliminate some indirect calls
    f76089018b34d mm/smaps: fix race between smaps_hugetlb_range and migration
    1f45a710c82b2 wifi: ath11k: fix sleeping-in-atomic in ath11k_mac_op_set_bitrate_mask()
    f6510c2eae93e wifi: ath11k: mac: fix struct ieee80211_sband_iftype_data handling
    0d9f4f202de15 drm/amd/display: fix a Null pointer dereference vulnerability
    7874179a229af drm/amd/display: switch DC over to the new DRM logging macros
    dcfed7251e23c net/sched: Fix backlog accounting in qdisc_dequeue_internal
    d26058c2349d7 habanalabs: fix UAF in export_dmabuf()
    29a15e06a3d41 drm/amd/pm: fix null pointer access
    5c432da1ee191 wifi: iwlwifi: Fix error code in iwl_op_mode_dvm_start()
    3bf99140d7b77 wifi: iwlwifi: return ERR_PTR from opmode start()
    dcae71222c8b9 rv: Use strings in da monitors tracepoints
    be27a11a42b21 wifi: ath12k: Pass ab pointer directly to ath12k_dp_tx_get_encap_type()
    45be183b9944f drm/rockchip: vop2: fail cleanly if missing a primary plane for a video-port
    067ca15be8b83 RDMA/hns: Fix double destruction of rsv_qp
    ea2e6c1503800 wifi: ath12k: fix GCC_GCC_PCIE_HOT_RST definition for WCN7850
    9bcfbd58fc5a0 s390/mm: Fix in_atomic() handling in do_secure_storage_access()
    e98ce4b70beab Bluetooth: eir: Fix possible crashes on eir_create_adv_data
    920c2db46ca44 wifi: ath12k: fix invalid access to memory
    2d9a8022009d2 bpf: Do not include stack ptr register in precision backtracking bookkeeping
    1b63cdc0d63ae riscv: save the SR_SUM status over switches
    1cd09aaf47a57 coresight: holding cscfg_csdev_lock while removing cscfg from csdev
    20d00e9b53091 wifi: iwlwifi: don't warn when if there is a FW error
    761db4ca3a469 PCI: endpoint: pci-epf-test: Fix double free that causes kernel to oops
    acdfe206be6c7 virtio: break and reset virtio devices on device_shutdown()
    3dfbbf72de6b6 virtio: hookup irq_get_affinity callback
    9f71fb768d55e driver core: bus: add irq_get_affinity callback to bus_type
    fc3f1cbf8b1ec virtio: make virtio_bus const
    b7867e55cbcba bpf: copy_verifier_state() should copy 'loop_entry' field
    40d66e0adde4b dmaengine: ti: k3-udma-glue: Drop skip_fdq argument from k3_udma_glue_reset_rx_chn
    47a0da0c80749 clk: sunxi-ng: h616: Reparent GPU clock during frequency changes
    8f1b0a4f1ad15 clk: sunxi-ng: h616: Reparent CPU clock during frequency changes
    c33a7fe6dda59 kasan: avoid sleepable page allocation from atomic context
    1c320f6ccc884 um: fix time-travel syscall scheduling hack
    52cdc47cf6519 drm/amd/display: prevent hang on link training fail
    31dad8d385953 scsi: mpi3mr: Synchronous access b/w reset and tm thread for reply queue
    cf3bf87aba2a2 scsi: mpi3mr: Debug ability improvements
    ae9909d12735b scsi: mpi3mr: Split off bus_reset function from host_reset
    a9703b006a475 sfc: fix NULL dereferences in ef100_process_design_param()
    455a0ba90d0d9 sfc: rip out MDIO support
    df8a35e8bcea2 sfc: Implement ndo_hwtstamp_(get|set)
    9039afe6240ae btrfs: harden block_group::bg_list against list_del() races
    53ac3b8ac1d88 btrfs: stop reserving excessive space for block group item insertions
    716e065e74f8b btrfs: stop reserving excessive space for block group item updates
    9e025844756fd btrfs: remove pointless loop from btrfs_update_block_group()
    f8f0873dd8975 btrfs: stop doing excessive space reservation for csum deletion
    210493962d0ae btrfs: remove pointless initialization at btrfs_delayed_refs_rsv_release()
    3e8a465bf1ae4 btrfs: reserve space for delayed refs on a per ref basis
    85abb0e726cc0 btrfs: allow to run delayed refs by bytes to be released instead of count
    25014e3dfa6d2 bpf: Fix kmemleak warning for percpu hashmap
    7af81befc0428 fs/ntfs3: Keep write operations atomic
    457a034fcb04b fs/ntfs3: Separete common code for file_read/write iter/splice
    2bb0e21c84f20 fs/ntfs3: Use function file_inode to get inode from file
    ab41bf5a211fb ublk: fix handling recovery & reissue in ublk_abort_queue()
    08160de2a6522 smb: client: fix UAF in decryption with multichannel
    c8c6af46286a5 smb: client: allocate crypto only for primary server
    aae58a39ac4c6 perf: Fix hang while freeing sigtrap event
    0554373bc9acc wifi: ath12k: Avoid memory leak while enabling statistics
    47297d133eea9 wifi: ath12k: Avoid explicit type cast in monitor status parse handler
    2f129230ac7d6 wifi: ath12k: fix incorrect TID updation in DP monitor status path
    90c782bc9e8d0 wifi: ath12k: fix struct hal_rx_phyrx_rssi_legacy_info
    ccb4eaf078697 wifi: ath12k: refactor DP Rxdma ring structure
    731e0d5dcbafd wifi: ath12k: avoid explicit HW conversion argument in Rxdma replenish
    e976114d81746 wifi: ath12k: avoid explicit RBM id argument in Rxdma replenish
    27d472b86c19b wifi: ath12k: avoid explicit mac id argument in Rxdma replenish
    e762406e13446 wifi: ath12k: Remove unnecessary (void*) conversions
    ce906c4ae5725 RISC-V: KVM: Teardown riscv specific bits after kvm_exit
    ddfb25dfb16d8 RISC-V: KVM: Add kvm_vcpu_config
    ec97bd5378c59 wifi: ath11k: update channel list in reg notifier instead reg worker
    e2f45bfeef5ff wifi: ath11k: fix misspelling of "dma" in num_rxmda_per_pdev
    8b7c9c5fec37c wifi: ath11k: add support to select 6 GHz regulatory type
    4513843d58d8f f2fs: fix potential deadloop in prepare_compress_overwrite()
    9b5e2f1ade251 f2fs: convert f2fs_handle_page_eio() to use folio
    77fd40b7ed0c3 btrfs: fix block group refcount race in btrfs_create_pending_block_groups()
    b6d27f4869c9c ext4: avoid journaling sb update on error if journal is destroying
    735c0e603cf25 ext4: define ext4_journal_destroy wrapper
    f364eb60987a5 ax25: Remove broken autobind
    b17edabd91714 fs/9p: fix NULL pointer dereference on mkdir
    616b4f2d1556c fs/9p: convert mkdir to use get_new_inode
    3d0281d071395 net: mctp: unshare packets when reassembling
    924ef5959b7cf eth: bnxt: fix truesize for mb-xdp-pass case
    9d22cf5cc94cd nvme-tcp: fix potential memory corruption in nvme_tcp_recv_pdu()
    6088e11c9aed1 RDMA/mlx5: Fix the recovery flow of the UMR QP
    6e59f56161ccc RDMA/mlx5: Fix a WARN during dereg_mr for DM type
    d63d73d045e48 RDMA/bnxt_re: Fix the page details for the srq created by kernel consumers
    50e44aa5f9905 bpf: Cancel the running bpf_timer through kworker for PREEMPT_RT
    4ace6fb49c8be btrfs: do proper folio cleanup when cow_file_range() failed
    545d6893d3a34 btrfs: do proper folio cleanup when run_delalloc_nocow() failed
    6105f0d9cc7be net: ravb: Fix missing rtnl lock in suspend/resume path
    e2ef3fa31353b net: ipv6: fix dst ref loops in rpl, seg6 and ioam6 lwtunnels
    7368f88b2e62d wifi: rtw89: fix race between cancel_hw_scan and hw_scan completion
    bf66ec718e687 scsi: mpi3mr: Fix possible crash when setting up bsg fails
    8458c686d50a8 nilfs2: do not force clear folio if buffer is referenced
    a306dfff6b76a RDMA/mlx5: Fix implicit ODP use after free
    8e2f6ba256dd1 mm: clear uffd-wp PTE/PMD state on mremap()
    a852466354667 net: hns3: fixed hclge_fetch_pf_reg accesses bar space out of bounds issue
    33b3e09a489a3 rds: sysctl: rds_tcp_{rcv,snd}buf: avoid using current->nsproxy
    01aaa7935af30 PCI: dwc: ep: Prevent changing BAR size/flags in pci_epc_set_bar()
    57d90fe7aab16 powerpc/pseries/iommu: IOMMU incorrectly marks MMIO range in DDW
    1e9dfe15404dd powerpc/iommu: Move pSeries specific functions to pseries/iommu.c
    2855445a1870b udp: Deal with race between UDP socket address change and rehash
    6a97bfc0293db RDMA/siw: Remove direct link to net_device
    30fc8f6d33bb2 PCI: imx6: Fix suspend/resume support on i.MX6QDL
    d7dade716905b scsi: mpi3mr: Fix corrupt config pages PHY state is switched in sysfs
    465e06ffbb681 vfio/mlx5: Fix an unwind issue in mlx5vf_add_migration_pages()
    e469922fbdf6a udmabuf: fix memory leak on last export_udmabuf() error path
    2384a29db79bd udmabuf: change folios array from kmalloc to kvmalloc
    0015d54a47995 virtiofs: use pages instead of pointer for kernel direct IO
    f9f621c5a26e0 fuse: Fix missing FOLL_PIN for direct-io
    0335fb698ab04 drm/amd/display: Fix null check for pipe_ctx->plane_state in dcn20_program_pipe
    1a0aecabff72a io_uring: check for overflows in io_pin_pages
    82dc96f0f4eec exfat: fix out-of-bounds access of directory entries
    41d73ca1fe161 exfat: convert to new timestamp accessors
    9ada9ff6339d4 afs: Fix lock recursion
    00872dcc2a3e4 drm/amd/display: Implement bounds check for stream encoder creation in DCN401
    64704f231d5de net/ncsi: Disable the ncsi work before freeing the associated structure
    98691b2e28a6c l2tp: prevent possible tunnel refcount underflow
    692e9a20018da drm/amd/display: Check null pointers before used
    4f51f6d23c585 drm/amd/display: Check null pointers before multiple uses
    180280f3c4621 drm/amd/display: Add null check for head_pipe in dcn32_acquire_idle_pipe_for_head_pipe_in_layer
    45f2bbe7bc08d bpf: Fix a sdiv overflow issue
    7299868253c0e mm, slub: avoid zeroing kmalloc redzone
    694eea36e3e16 mm/slub: avoid zeroing outside-object freepointer for single free
    6158dbcba6986 slub, kasan: improve interaction of KASAN and slub_debug poisoning
    f8ba0d22afa61 bpf: Prevent tailcall infinite loop caused by freplace
    6fc6ef4cd858a drm/amd/display: Avoid overflow from uint32_t to uint8_t
    29ec422b32c69 scsi: lpfc: Change lpfc_vport fc_flag member into a bitmask
    6a80b818c63e0 scsi: lpfc: Protect vport fc_nodes list with an explicit spin lock
    3543cdaf0185b scsi: lpfc: Change nlp state statistic counters into atomic_t
    148b39768ff2b scsi: lpfc: Remove shost_lock protection for fc_host_port shost APIs
    2d0dfb1f2fad2 scsi: lpfc: Fix failure to delete vports when discovery is in progress
    117df33ecfd8a drm/amd/display: Add missing NULL pointer check within dpcd_extend_address_range
    0c1e8a6f7ce9b drm/amd/display: Use kcalloc() instead of kzalloc()
    7eed5b3115ce9 pktgen: use cpus_read_lock() in pg_net_init()
    2a0ba376cdf72 serial: sc16is7xx: fix TX fifo corruption
    97cee643a8258 PCI: endpoint: pci-epf-test: Make use of cached 'epc_features' in pci_epf_test_core_init()
    2011c0ebaf710 mm/huge_memory: avoid PMD-size page cache if needed
    6d1f6dd02a2d7 mm: simplify thp_vma_allowable_order
    88f520120f999 mm/thp: fix "mm: thp: kill __transhuge_page_enabled()"
    acf609843a848 gve: Account for stopped queues when reading NIC stats
    7d5711e03cefd s390/pkey: Wipe copies of protected- and secure-keys
    3732398dcf65d s390/pkey: harmonize pkey s390 debug feature calls
    1f7f63f7165d1 ice: Fix improper extts handling
    1eb6c4a0d83d1 drm/amdgpu: fix double free err_addr pointer warnings
    9aa83a5eb013f ice: Don't process extts if PTP is disabled
    2bbfffa802adc bpf: Take return from set_memory_ro() into account with bpf_prog_lock_ro()
    c20d0fa873039 bpf: Take return from set_memory_rox() into account with bpf_jit_binary_lock_ro()
    d35130036d327 sched: fix warning in sched_setaffinity
    f8005214946fd sched/deadline: Fix task_struct reference leak
    251840f22eff3 drm/amdgpu: change vm->task_info handling
    2860d59e4ce2b net: nexthop: Increase weight to u16
    942ae3d64c3ce net: nexthop: Have all NH notifiers carry NH ID
    f6dd625053726 drm/msm/dpu: Add mutex lock in control vblank irq
    fee05f14bf747 drm/msm/dpu: shift IRQ indices by 1
    ec2e11c1d36db tty: add break_wait kernel-doc
    5e8f3ac8fa3d4 namespace: handle mount locking for automounts correctly
    55d7433e26c79 fcntl: refuse F_SET_RW_HINT on an immutable inode
    b98dd4af91ade namespace: check the target before walking it in do_mount_setattr()
    86a2d56b19607 namespace: don't copy an unmounted mount tree
    db90eecbde319 namespace: unhash a dentry before detaching the mounts on it
    013c060b2f122 drm/vc4: Fix firmware reference leak in vc4_drm_bind()
    45f2d1a6edf1c scsi: ufs: core: Avoid unsafe MMIO reads in ufshcd_mcq_compl_all_cqes_lock()
    49dd29ce73653 scsi: ufs: core: Add a comment block above ufshcd_mcq_compl_all_cqes_lock()
    cce865a62cec3 scsi: ufs: core: Add debug log for MCQ command timeout
    4813a6624ce48 scsi: ufs: core: Move an assignment in ufshcd_mcq_process_cqe()
    40589a91c7b9b scsi: ufs: mcq: Remove unused parameters
    ec6ecab1b7577 scsi: ch: Do not keep references to data transfer element devices
    37a0d6e81a42e scsi: ufs: core: Decouple CQ sweep from request iterator in MCQ
    262062c01f5a8 optee: register TEE devices only once fully initialized
    cf59abb49e91f wifi: ath12k: copy M3 firmware when reusing the buffer
    4af250fc84828 wifi: ath12k: fix reusing m3 memory
    2be324c89993c ASoC: SOF: Intel: hda-dai: Ensure DAI widget is valid during params
    60b5824ae259a ASoC: hdac_hda: Fix hlink refcount leak on component registration failure
    3b8a540b36aa0 ALSA: control: Don't add invalid kcontrols to LED layer
    c17fe25dcb55a ACPI: processor_idle: Mark LPI enter functions as __cpuidle
    444b0e44aa430 net/mlx5e: Pass netdev to mlx5e_destroy_netdev instead of priv
    7b3b902320214 net/mlx5e: Don't store mlx5e_priv in mlx5e_dev devlink priv
    04474009a2ea7 most: core: fix leak on early registration failure
    82f42a13e3d7a most: core: fix resource leak in most_register_interface error paths
    a56d4f8f8f4c5 namespace: check the mounts before reading their parents in pivot_root()
    99698cfa34e49 namespace: don't inherit MNT_UMOUNT in clone_mnt()
    9b6ed57eb8c89 Bluetooth: ISO: Serialize concurrent connect calls
    db6fbc2b77849 drm/vmwgfx: validate pitch coming from userspace
    4dc3d5a004b8f Bluetooth: RFCOMM: connect the session socket without rfcomm_mutex
    f01cbddfb4273 Bluetooth: hci_sync: Fix command skb lifetime during scan setup
    b21f20320fa2f net: team: stop reusing skb after queue override
    9486377e5e971 net: team: fix NULL pointer dereference in team_xmit during mode change
    84600e7b30fc1 net: team: Rename port_disabled team mode op to port_tx_disabled
    85cf6665154de net: team: Remove unused team_mode_op, port_enabled
    4f46ac83d87a4 netfilter: nf_tables: fix bidirectional offload regression
    089f10b47843a apparmor: fix cred UAF caused by begin_current_label_crit_section()
    20c52a7041409 ALSA: mixer: oss: Add card disconnect checkpoints
    c937a494901df ALSA: pcm: oss: Fix data race at accessing runtime.oss.trigger
    d9df965284abd ALSA: pcm: oss: Fix setup list UAF on proc write error
    8f27d152b2a59 nvme-tcp: sanitize request list handling
    604cf76a6a7e8 llist: add interface to check if a node is on a list.
    24120e90d4638 mm/mremap: fix locked_vm leak from MREMAP_DONTUNMAP self-merge
    522fd1a6efd0a mm/mremap: fix locked_vm leak by splitting VMA for MREMAP_DONTUNMAP
    1f26323565177 ice: fix metadata_dst refcount handling on representor teardown
    b14a682ad7d45 ip6_gre: remove obsolete ERSPAN PMTU update
    578d39ab420b1 tracing: Set the trace clock before registering the histogram trigger
    cbf9961602ffb HID: steam: Clean up locking
    3c2f97343d4df HID: steam: Refactor registration
    d2587923d50c8 HID: steam: Rearrange teardown sequence
    5f135cfc1d68c HID: steam: Fully unregister controller when hidraw is opened
    0aa096eec8d87 HID: hid-steam: Make client_opened a counter
    dd7a39f644373 drm/amd/display: Don't replace a sink mode that shares the native totals
    8ed6cf7f77915 can: fix unique skb identifier regression under RPS
    2deafd015ea9a dlm: validate length in dlm_search_rsb_tree
    99b8bd6323e6f wifi: mt76: mt7603: initialize global station WCID
    63ec518b737c4 netfilter: flowtable: fix offloaded ct timeout never being extended
    5d3ee9fc5fb08 netfilter: conntrack: fix erronous removal of offload bit
    b7b80d204abdc net: openvswitch: validate transport header presence in set_ipv6_addr
    41ad5bcf0219a mlxsw: spectrum_flower: Fix port range register leak in tmplt_create()
    3e531d85b7823 net/mlx5e: Order ICOSQ cc update after CQ doorbell
    194685b13dc9e veth: fix peer NETDEV_XDP_ACT_NDO_XMIT after GRO is toggled while down
    c44c02c930c65 flow_dissector: avoid u16 truncation of hlen in bpf_flow_dissect()
    774856241e7dc net/sched: cls_route: reject change with no routing attribute
    d9e08836d06c8 flow_dissector: avoid u16 truncation of skb->len when computing thoff
    2c64c30d493d8 ASoC: samsung: i2s: enable op_clk in probe to balance runtime PM
    2cb098262ce2f ASoC: adau1372: fix invalid default state of output ASRC and DAC muxes
    58905982b0d91 ASoC: adau1372: allow sleepy powerdown GPIOs
    50deef6dc4dd4 wifi: mt76: mt792x: pick the SAR table layout from the table itself
    26f0504432add wifi: mt76: mt792x: treat 0xff ACPI SAR entries as no limit
    7a53bb4668b31 btrfs: fix xattr replace when multiple xattrs are packed in the same item
    3c231142c4f4b nvmet: use the local P2P device on metadata allocation failure
    8739f06e3f82c cxgb4/ch_ktls: disable softirqs around tid_list erases
    95114e4211962 amt: send the relay's General Query directly from the receive path
    00bcc303000ba net/sched: em_text: reject unterminated algo before autoload
    bf2848e50bd73 drm/vc4: Free the BO cache size list on teardown
    ad8a96a9e0fee drm/aspeed: Balance the display clock enable on teardown
    bf3d841ef12fc gpio: exar: initialize the ID before registering its cleanup
    f424fc191ec2b drm/dp: don't mark the AUX backlight enabled when enabling failed
    95fb7c259b86f namespace: refuse an automount below a mount that is in no namespace
    5e6bfd9f249f2 dcache: don't put a mountpoint on a dentry that's being removed
    f639428183449 namespace: check a submount for references right before unmounting it
    cae49d34f0cd1 fs: refuse fspick() on internal superblocks
    d63df57e738a3 drm/amd/display: Fix direct scanout alpha on some DRM_FORMATs
    b5f813f500c44 drm/amdgpu: copy debugfs register data outside the GRBM/SRBM locks
    067c88010df80 drm/amdgpu: make Mac FB workaround generic
    037796d9ca1da drm/amdgpu: serialize vblank counter reads against GPU reset
    8a2b420ee227a drm/amdkfd: fix dma_buf reference leak in get_dmabuf_info
    4a86f0a696f48 drm/amdkfd: align SDMA doorbell base for shader doorbell writes
    17c5fa371de2d drm/vc4: drain the hangcheck timer and works on V3D unbind
    77abc1837c965 drm/i915/gt: Unmask interrupts only when ACTIVE is true
    24c04e80c35ff drm/i915/gem: Prevent overstepping exec array boundary
    a5ce29550386f drm/gud: don't keep a connector without a CRTC as connector_state
    4a2006c675758 drm/fb-helper: defer setup when fbdev_probe() fails, not just on -EAGAIN
    d5c372ad03330 Bluetooth: RFCOMM: Fix NULL tty_dev dereference in rfcomm_dev_shutdown
    a54ce160e3ef7 Bluetooth: RFCOMM: free the skb when the DLC has no owner
    44ce36c5789ac Bluetooth: MGMT: Fix status of pending commands flushed on power off
    37cef0c8fb537 Bluetooth: hci_sock: Serialize dead-device detachment
    8181a1a45c706 scsi: qedi: Initialize callback state before registration
    a613e4fafb47c iio: light: Drop ROHM BU27034
    7e90b11a4f699 pmdomain: rockchip: propagate subdomain add errors
    1b476b9a90ac9 pmdomain: rockchip: fix clock leak on domain probe failure
    b94c6104c4949 pmdomain: rockchip: don't ignore clock lookup errors on attach
    3601dd1cdc97c pmdomain: imx8m-blk-ctrl: Serialize power on/off across sibling domains
    1ea151615a82f regulator: tps6594-regulator: Fix n_linear_ranges for TPS65224 BUCK2-4
    fd376d8374111 regulator: ltc3676: don't read the write-only HRST and CLIRQ registers
    c995c52eba192 openvswitch: fix soft lockup in the netlink flow dump
    ab0d2a6fe87e8 nvme: fix swapped ZRASF zone state values for full and read only
    c128173919a65 net: usb: ax88179_178a: fix rx frame length for non-last packets
    1e4d51d903ecf net: dsa: microchip: fix KSZ8765 fiber detection
    695a5a4c69c92 net: bridge: avoid recursive multicast port cleanup
    e607017a553d2 net/smc: protect clcsock lifetime in smc_getname
    d8a24b9e1774a net/packet: guard the ll header push in packet_rcv_spkt()
    605a59639abb9 mmc: sdhci-sprd: disable runtime PM on remove
    9e799f25c420e mmc: mtk-sd: Cancel request timeout work on remove
    5d4cdd4a15075 mmc: cavium-thunderx: destroy slot platform devices on remove
    a1019e0722049 mmc: cavium-octeon: destroy slot platform devices on remove
    281f68d6cf8ac dm: fix reading free memory in do_resume
    bcfb26658e0fa dm-snap: reject the transient exception store for snapshot-merge
    9a0dab8a9d997 dm-crypt: reject the lmk IV mode with AEAD ciphers
    f2c181e1d58e9 memstick: rtsx_usb_ms: complete requests after eject instead of dropping them
    c3ab92542475d memstick: core: wait for request completion before freeing card
    305f1828b871d KEYS: Fix add_key() race with keyring restriction
    f7bff12d5de4b keys: finalize persistent keyring timeout after link attempt
    c2e0cbb587a8a ibmveth: fix TX LTB and filter unwind on open-fail
    decb4d4ead2c7 ibmveth: h_free logical LAN on open-fail after register
    b07b3925f6766 gpio: xilinx: fix runtime PM leak on request error path
    ce45166daf6bd EDAC/amd64: Mask UMC chip select to the four implemented selects
    be0167091542e sctp: copy zeroed stats to user in sctp_getsockopt_pr_streamstatus() when !streamoute
    a545def625860 selinux: preserve NATIVE_LABELS on already-initialized sb in set_mnt_opts
    a07d325ebb37a selinux: fix data race on AVC latest_notif
    af4b3d33f2ff5 Revert "wifi: libertas: reject short monitor TX frames"
    b60259d4047fb tipc: hold a reference to nodes found by link name
    7f796bb3b440d tipc: destroy topsrv workqueues before closing connections
    dbee987ecf312 swiotlb: fix default_swiotlb_limit() for non-growable default pool
    a18dd388045dc strparser: make sure __strp_recv isn't running before tearing down the parser
    5051df0311447 xen/netfront: don't leak the skb when xennet_fill_frags() fails
    3dc61af2998cf workqueue: Fix NULL current_pwq deref in chained work check
    fb5ce4c7790c3 wireguard: noise: reject response consumption after intermediate initiation
    b261dbed0c538 wireguard: queueing: preserve tstamp_type when encapsulating packet
    7b79131e357c4 wifi: brcmfmac: fix P2P device removal race in brcmf_detach()
    3ad7606400f38 usb: f81604: fix struct f81604_int_data size mismatch
    98195e822343a dm ioctl: don't let data_start run past the buffer
    41cabfbf3532e btrfs: scrub: fix local_root reference leak in scrub_print_warning_inode()
    496a45b7c6705 ASoC: amd: yc: Add DMI quirk for Acer Aspire Go 15 (AG15-21P)
    e35becbd03191 arm64: irq: exclude the softirq stack switch from KCOV
    1eeeb4d315401 Input: xpad - add support for Corsair Novablade Pro
    8a3b935b6b603 ipv6: do not warn on route notification size race
    088ba80eef85f ipv4: do not warn on route notification size race
    72d9d17092bb3 ipv4: stop route notification sizing when nexthop group shrinks
    7fd60d3c9a1e1 ipv4: stop PMTU walk when nexthop group shrinks
    408c78e50feab crypto: drbg - Fix ineffective sanity check
    8f1215a370e89 netfilter: nft_set_pipapo: restore cloned mapping table memcg accounting
    80861f424fe5c Bluetooth: hci_event: fix simultaneous discovery stuck in FINDING
    45adb04a8ad0c mm/damon/core: fix unconditionally skip last region
    e3c206de1fcba mm/damon/core: do non-safe region walk on kdamond_apply_schemes()
    82ecc6b5af65d f2fs: fix to reset all pinned status during fggc
    9f5510b0452ba f2fs: fix to shrink gc_lock coverage in f2fs_gc_range()
    f4ee42c35022a f2fs: fix to reclaim space in f2fs_allocate_pinning_section()
    7d7ad2bea4eed HID: uhid: convert to hid_safe_input_report()
    b9d2deecddae7 HID: core: introduce hid_safe_input_report()
    f1dc59675d542 wifi: cfg80211: release locks on error in cfg80211_wext_siwgenie()
    909b31661be70 iio: cdc: ad7150: fix OF matching and publish module aliases
    a2df3f13f00b3 smb: client: only require read lease for size-extending preallocate
    55f1cebee909c iio: adc: stm32-adc: fix possible division by zero in processed channel
    b950ad53ca6ea iio: adc: axp288: Add TS bias override for Haier HV103H
    f66a164ea6bd4 iio: adc: max1363: sign-extend bipolar differential channel reads
    9f503cda04f2c iio: adc: aspeed: propagate reset deassert errors
    3d8019516f028 iio: adc: aspeed: Simplify with dev_err_probe
    975b09bc680ac iio: adc: ad_sigma_delta: fix use-after-free on unbind
    3df27277f8f95 smb: client: discard post-EOF pagecache when extending a file via zero range
    6535f7084d958 wifi: mac80211: set info->band for 802.3 encap offload frames
    40d7e969b6f15 wifi: mac80211: Add sta pointer sanity check in ieee80211_8023_xmit()
    84da7a0e92207 KVM: SVM: Use the active VMCB's MSR bitmap when checking if MSR is intercepted
    b1ac8181a59ab mm/hugetlb: fix avoid_reserve to allow taking folio from subpool
    6a2baff6fecae net: mana: remove double CQ cleanup in mana_create_rxq error path
    cd9c62753becf net: mana: Skip WQ object destruction for uninitialized RXQ
    263d45141069a net: mana: check xdp_rxq registration before unreg in mana_destroy_rxq()
    f3a52e2ec2788 net/mlx5e: Prevent stale XSK buffer release on MPWQE refill retry
    32bbb870078d4 net/mlx5e: Prevent stale XSK buffer release on refill retry
    f1c966eb6ed5e fs: Free any excess xarray nodes in clear_inode()
    2a74f30a7bb30 iio: health: max30102: fix NULL dereference in interrupt handler
    b76f068b2d3d0 iio: core: add accessors 'masklength'
    4ae6ed5b6074d wifi: mac80211: count only matching reservations in reserved switch
    47864a9092fd6 wifi: mac80211: keep paired old chanctx alive
    6b5366ba63a58 jbd2: bound shrinker scans by examined checkpoint buffers
    dc7ece0b827fe jbd2: check need_resched() when skipping busy checkpoint buffers
    6198123cac2ff gpio: rockchip: fix generic IRQ chip leak on remove
    77b6ff33c8f56 gpio: rockchip: teardown bugs and resource leaks
    d4cf99c7ea95a firmware: arm_scmi: Unwind TX receiver mailbox setup failure
    50e38091a657a firmware: arm_scmi: Publish channel state before callbacks
    b1a86a5ab0d44 fbdev: hyperv_fb: Allow graceful removal of framebuffer
    3a489c3bbf5ed fbdev: hyperv_fb: Simplify hvfb_putmem
    18f9f3ddbf2ed erofs: unify lcn as u64 for 32-bit platforms
    b18a82503a67a erofs: avoid infinite loops due to corrupted subpage compact indexes
    6b6b47c1aa717 ASoC: SOF: ipc4-topology: Harden loops for looking up ALH copiers
    796207e63c51f ASoC: SOF: topology: Parse DAI type token for dspless mode
    ce220b4cdf62f tty: port: fix tty_port_tty_vhangup() race
    cf8530a25ae92 bnxt_en: fix DMA mapping length for padded small packets
    b4f2a7ae80ed4 mtd: spinand: Enable QE on all dies
    bff83b723e93a mtd: block2mtd: Fix divide error when erase_size is zero
    057320c36c5a2 block2mtd: prevent direct access of bd_inode
    8736c49d6ff27 mtd: block2mtd: Convert to bdev_open_by_dev/path()
    de77b0f681421 wifi: mac80211: keep fallback association elements alive
    d0da6ab1fc53a wifi: mac80211: shut down RX BA session timer on teardown
    77c449c9c946f mtd: spinand: fix NULL pointer dereference with no ECC engine
    1fbc4b24c7443 apparmor: Fix & Optimize table creation from possibly unaligned memory
    bd00629b52788 AppArmor: Allow apparmor to handle unaligned dfa tables
    122b1fdcd26b5 drm/amd/display: Mark DCE 6.4 as not APU
    04c259eaceba4 i2c: xiic: preserve PEC byte length in SMBus block read setup
    7b42e4a70f8c4 i2c: xiic: Relocate xiic_i2c_runtime_suspend and xiic_i2c_runtime_resume to facilitate atomic mode
    4ae00993e6d92 ALSA: hda/tegra: Re-enable SDO workaround for Tegra194
    3cdad0c541f89 serial: ma35d1: Fix clock reference leak in ma35d1serial_probe()
    0af044c47a957 serial: ma35d1: Convert to platform remove callback returning void
    2f973fe58d70e serial: fix TIOCMIWAIT race
    158a07da2da72 tty: serial: max3100: shut down timer before freeing port
    b71f75408c466 tty: n_gsm: fix missing modem controls after DLCI open in convergence layer type 2
    16032c980d8f7 tty: tty_port: restore TTY_IO_ERROR on activation failure
    402b1aceabfb4 usb: typec: ucsi: acpi: Assume UCSI 1.2 on Acer Nitro ANV15-41
    5a206e64ae8ab drm/amd/display: Preserve eDP mode on initial ASSR failure
    82cc242da6d62 USB: dwc2: shut down wakeup timer before freeing HCD state
    4f35e6be2f86b usb: ohci-spear: disable controller wakeup on removal
    7037a6a567223 usb: ohci-spear: Remove unnecessary NULL check before clk_disable_unprepare()
    c1e3aed32da03 drm/amdgpu: reset VI ASIC on MacBookPro14,3
    79c4721c17fbc drm/amdgpu: reset VI ASIC on MacBookPro15,1
    29302964ef583 drm/amd/display: check dc_state_create_copy() for NULL in dm_suspend
    12dace1387d3c fsverity: add dependency on 64K or smaller pages
    0a5c76eb3950a KVM: arm64: Don't use the VMA to size stage-2 block mappings for VM_PFNMAP
    e786386c882d5 arm64: errata: Add Cortex-A725 erratum 3821522 workaround
    fb8b57d0321f6 arm64: errata: Factor out broken AMU const counter cap
    94afa17d6bfd5 Bluetooth: Serialize SMP remote OOB data access
    f997e03e2ef58 Bluetooth: hci_core: Serialize SCO and ISO scheduling with teardown
    052acee988011 arm64/fpsimd: signal: Forbid non-streaming SVE payload on SME-only systems
    8c38cb055f6a9 perf: Require kernel access for text poke events
    6b4e15cccfbe0 tty: fix saved termios reset race
    6cd82563bb270 usb: dwc3: gadget: fix IRQ storm on invalid event buffer count
    bc992b73f7af6 drm/amd/display: Fix fast updates on DCE 8.1
    3f3b0898557a9 fs,fsverity: remove check for fsverity being enabled in setattr_prepare()
    a4ca8102e70e1 fs,fsverity: reject size changes on fsverity files in setattr_prepare
    0542d213253ee xen/netfront: drop RX packets with a short Ethernet header
    5ea733af79616 usb: typec: tcpm: constrain TCPM_SOURCING_VBUS event handling
    424e4d0bc47f0 usb: typec: tcpm: fix debug accessory mode detection for sink ports
    0a2f71ccf9c20 usb: gadget: f_fs: Fix Use-After-Free in AIO error path
    aee2fde0f39e2 USB: gadget: ffs: fix mm lifetime handling
    723d73b245843 usb: gadget: at91_udc: drain polled-VBUS timer/work before udc is freed
    09ddd44db0a84 usb: gadget: at91_udc: Convert to platform remove callback returning void
    abc17fd508a51 serial: imx: serialize imx_uart_ports[] lifetime
    4663bded2e49a serial: imx: Convert to platform remove callback returning void
    dd34630226211 net: usb: qmi_wwan: add Quectel EG120K-EA
    ffac3399bf627 wifi: wlcore: Fix runtime PM leak in wlcore_remove()
    8435103a82aa7 wifi: wlcore: Convert to platform remove callback returning void
    75b3b30ae4ee6 mptcp: prevent race between disconnect() and rtx
    0f7668bcf6685 tcp: introduce icsk->icsk_keepalive_timer
    9116b5ef5a5b3 mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages
    c073d01f6f536 vc_screen: reload vc pointer before if (ret) in vcs_write() to avoid UAF
    4b5ebb4f91a61 SUNRPC: reject duplicate CREDS_VALUE options
    8c56a46db3b75 SUNRPC: fix gssx_dec_option_array error path bugs
    574af7c61f2be drm/amd/powerplay: fix VoltageObjectInfo zero-stride loop and OOB read
    dd0c3e6c03e3b KVM: arm64: vgic-its: Don't dereference a NULL collection on ITT save
    c873363497808 jfs: fix array-index-out-of-bounds read in add_missing_indices
    ac5d26a46c90f iio: trigger: cancel reenable_work before freeing trigger
    42eb8c2cf1744 iio: proximity: vcnl3020: fix ISR bitmask check in IRQ handler
    2272efb10096e iio: proximity: sx9324: Correct proximity channel resolution
    2c8211eef9892 iio: proximity: pulsedlight: fix iio_device left registered on PM setup failure
    59ab2f302548d iio: proximity: isl29501: Fix return type of isl29501_register_write
    05ef1af381a0f iio: pressure: bmp280: fix out-of-bounds access in sampling frequency lookup
    85c20d1cf3f01 iio: light: gp2ap020a00f: drain irq_work after free_irq
    8a78224497271 iio: imu: adis16480: fix unprotected debugfs reads
    d3078aaef8af4 iio: imu: adis16400: fix unprotected debugfs reads
    b62c3944c006c iio: gyro: adis16136: fix unprotected debugfs reads
    2bde96b2857aa iio: frequency: admv1013: fix wrong channel field used in admv1013_read_raw()
    b4f53cec8cc94 iio: buffer: Ensure bounce buffer used for unaligned case is zeroed.
    6a728408ff522 iio: buffer: serialize buffer teardown with mode claims
    012451d72c122 iio: adc: xilinx-xadc: free IRQ before cancelling the unmask worker on unbind
    d94d2ec25ff26 iio: adc: sun4i-gpadc-iio: drop underflowing pm_runtime_put() calls
    53473b0556296 iio: adc: sun4i-gpadc-iio: clean up on thermal zone registration failure
    01d20048ab0e2 iio: adc: stm32-adc: fix check on internal channel availability
    57628402e9cbf iio: accel: sca3000: fix frequency divider condition check
    137c35cff4d4d iio: accel: kxcjk-1013: reject duplicate event disable
    3b8e7928cf192 smb: client: split cifsFileInfo bitfields to avoid shared-byte RMW races
    b270c1074860d thunderbolt: Reject oversized XDomain properties responses
    7bca83bf8ba00 thunderbolt: Disable CL states for the Anker Prime TB5 dock
    b70b9c41f240c thunderbolt: Fix KASAN reported use-after-free when request is canceled
    4375b5d91db4d USB: serial: option: add Compal EXC-T1 support
    992a471458f96 USB: serial: option: add Quectel RG660QB
    85750b58e8d4f USB: serial: option: add Compal EXM-G1x support
    9c910016df78c USB: serial: option: add Quectel EG060W
    bb5487f3aadbe USB: serial: option: add support for SIMCom SIM8260C
    24d6edb6bd7f7 USB: serial: fix ioctl hangup race
    e7ad832b1144d USB: serial: fix driver deregistration order
    2917216123615 USB: serial: fix dynamic id driver deregistration race
    f8e290609546a USB: serial: ssu100: fix baud rate overflow
    7ee47aea0baca USB: serial: quatech2: fix baud rate overflow
    e7fa5128bcc4f USB: serial: cp210x: add Corsair AX1500i Power Supply
    0b1e4a7eeb6a3 wifi: mac80211: handle empty FILS association request payload
    ebb7cba623d38 wifi: mac80211: fix mesh fast xmit path deletion UAF
    57bfaa8b28534 wifi: mac80211: release mesh path quota on failed additions
    eebc70f132041 wifi: mac80211: minstrel_ht: validate fixed rate index
    c66ab4b94bb04 wifi: mac80211: account proxy paths against the mesh path limit
    cbff71fe689f3 wifi: mac80211: drain PS delivery work during station teardown
    3ebc529726c0c wifi: iwlegacy: 3945: free EEPROM data on remove
    b66539a4dab12 wifi: cw1200: fix TX padding OOB read leaking heap data to device
    951fce1510645 KVM: x86/mmu: Bail from shadow walks if the root is invalid or a dummy
    40d855d6ad463 mtd: spinand: fix zero oobavail when no ECC engine is used
    e238c19826cc9 mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of OOB
    c69d8aceda362 mtd: rawnand: cadence: Initialize IRQ state before requesting IRQ
    ef4dfad231a78 nvmet-auth: fix out-of-bounds write in nvmet_auth_challenge()
    e7188a268c356 nvme-pci: add NVME_QUIRK_DMAPOOL_ALIGN_512 for Micron 4100AT
    3045128294d34 nvme-multipath: fix underflow in ANA log bounds checks
    5a2b9cc53719b net: sfp: add quirks for Hisense and HSGQ GPON ONT SFP modules
    fdbd83c2d929e net: extend IPv6 exthdr detection of tunneled packets
    3776f34fbce99 HID: multitouch: stop the release timer from being rearmed on remove
    bc9ff8e64771c ipvs: bound LBLCR and LBLC cache growth
    be58b239d2be5 Bluetooth: btintel: fix buffer over-read in btintel_hw_error()
    545fa70f730eb Bluetooth: hci_core: Serialize fragmented ISO packet queueing
    780affacd9297 Bluetooth: hci_core: Serialize ACL scheduling with channel deletion
    b208818492cde Bluetooth: hci_core: Fix inquiry cache timestamps on 64-bit systems
    70b55855eecb4 Bluetooth: hci_conn: Lock parent access during enhanced SCO setup
    ddc9edb244cc8 Bluetooth: hci_sync: Fix inquiry cache use-after-free
    55d162aa00d1e Bluetooth: RFCOMM: Fix initial port reference race
    48f0e0bcf683f i2c: xiic: don't clobber msg->len to signal block-read completion
    ada5ded765f05 ALSA: ua101: reject mismatched capture/playback packet sizes
    2db234e163f0d ALSA: seq: Serialize compat port-info ioctls
    775df6a27e843 ASoC: qcom: lpass-cpu: use DAI table index for playback constraints
    30a60e74ee71d ASoC: codecs: rt1017-sdca-sdw: fix uninitialized stream_config->type
    a756c93fae312 ASoC: codecs: max98363: fix uninitialized stream_config->type
    3d9faec1da7e8 serial: vt8500: Fix clock reference leak in vt8500_serial_probe()
    2c4ddc8ed0d87 serial: tegra: don't clear the Tx FIFO on an Rx-only reset
    dd81650bec58a serial: 8250_bcm7271: fix use-after-free in brcmuart_remove()
    6c9c9367351a4 tty: abort break signalling on hangup
    a42d96e8101ca tty: serial: qcom_geni_serial: Keep console RX functional after deep idle
    57753441ef84b tty: vcc: hold port lock when clearing tty pointer in vcc_cleanup
    4b59afc8af314 tty: vcc: zero-initialize control packet in vcc_send_ctl()
    674b1c890322f tty: amiserial: fix broken TIOCMIWAIT
    bdda8d889accc tty: vt: fix memory leak in vc_allocate()
    dbdd0ca9a7eac usb: cdns3: Fix NULL pointer dereference in cdns3_pci_probe
    efdf0ddaed011 usb: cdns3: fix use-after-free in cdns3_gadget_exit()
    9a86cdb675949 usb: typec: ucsi: displayport: Current CAM OOB index fixup
    abe93f73639da usb: typec: ucsi: Get the connector fwnode based on reg value
    a39d53f70e637 usb: typec: tipd: fix uninitialized typec_partner_desc in tps6598x_connect()
    ae8aae45a39fc usb: typec: tcpm: recover after failure to start the frs ams
    198d74dcfa129 usb: core: clear both ep_in and ep_out for non-ep0 control endpoints
    40fef138eb6c1 usb: chipidea: tegra: disable runtime PM on resume failure
    06ac8609d6d18 usb: gadget: f_fs: Fix NULL pointer dereference in FUNCTIONFS_ENDPOINT_DESC
    6849e51b89de5 USB: gadget: dummy-hcd: Fix wait for outstanding request completions
    0d39ac4f65f93 usb: gadget: aspeed-vhub: cancel wake work on device removal
    be347590e188d usb: dwc3: am62: Fix runtime PM usage count leak on probe error path
    a789838675afa usb: typec: anx7411 - stop the IRQ before destroying the workqueue
    da841c1511a61 usb: gadget: f_uac1_legacy: validate bRequest index in generic_{set,get}_cmd
    18138d9f19cf6 usb: gadget: midi2: Fix the jack descriptor array sizes
    61db743284896 usb: ohci-st: disable controller wakeup on removal
    203094415f85c usb: ohci-s3c2410: disable controller wakeup on removal
    2cf192041c00b usb: ohci-da8xx: disable controller wakeup on cleanup
    ba0f023cee31c usb: octeon-hcd: fix the FIFO-flush timeout computation
    e4df763ba3c4f usb: hub: use shorter 120ms post resume hold for SS root hubs
    4faaad69f1833 usb: storage: sierra_ms: reject short SWoC info transfers
    e4a6883ad9b46 USB: serial: fix port tear down use-after-free
    d86775e79838d USB: cdc-acm: skip URB restart in port_shutdown if disconnected
    451ded3b33bef USB: cdc-acm: fix racy TIOCMIWAIT implementation
    4cea8e5b6c593 soc: qcom: geni-se: Correct QUP Core ICC vote constants
    8bde6f643ab6f nitro_enclaves: fix use-after-free on SLOT_ALLOC failure
    d74220bb59af0 Input: synaptics - limit T440p InterTouch quirk to LEN0036
    a2300ca8797eb Input: synaptics - add LEN205b entry to smbus_pnp_ids for ThinkPad T490
    9ef8a8de8717d Input: s6sy761 - fix resume ordering and restore sensing
    dee75ece52b6a Input: i8042 - add nomux quirk for Fujitsu LIFEBOOK U7410
    a71adc66e8401 Input: atkbd - skip deactivate for Lenovo IdeaPad Slim 3 15IWC11
    69b1ed4acc56c kgdboc: Fix tty driver reference leak in configure_kgdboc()
    a7329ea53d04f binder: fix leaked fd fixups on TF_UPDATE_TXN supersede
    e9b364e46d594 binder: fix is_failure flag for superseded transaction cleanup
    d700c26ed64bd drm/amdgpu: fix ACP MFD device leak on init failure
    f6364e7284a13 drm/amdgpu: fix IP instance memory leak on kobject add failure
    4a0ae61067671 drm/mediatek: Fix pdev reference leak in mtk_drm_bind()
    03fb1c657028c drm/mediatek: Fix ovl adaptor platform device leak
    f0ffb09cf1bf2 drm/mediatek: Add missing IS_ERR check for ovl_adaptor platform device
    bc7255b8623de drm/radeon: Read the VRAM VBIOS signature with readb()
    2aee72150b0ea drm/amdgpu/gfx6: fix firmware leak on teardown
    e28008f8d5020 drm/amd/pm/si: Fix updating clock limits on AC/DC
    48ab11f054267 drm/amd/pm/si: Check AMD_IS_MOBILITY flag for PPSMC_SYSTEMFLAG_GPIO_DC
    e0c2f42f7c608 PCI: Accept AtomicOps already enabled by the hypervisor
    a2047aff72ce5 ALSA: ice1712: Fix the error handling via auto-cleanup at probe
    80c7c10debd3a ALSA: core: Define auto-cleanup for snd_card_free()
    655acfa713bce perf: Fix race between perf_event_exit_task() and perf_pending_task()
    22efeebe688fe i2c: at91: release DMA channels when probe defers
    4ab37e4f4a33c ipv6: sr: use skb_get_hash_net() in seg6_make_flowlabel()
    963e11f65c1be net: add and use skb_get_hash_net
    68f35f8ffa803 net: sparx5: make ports inherit the switch base mac address type
    ef82f57fc999e net: microchip: vcap: stop scanning after deleting key field
    f7e292f3c8c85 netfilter: flowtable: generalize pending status bit
    28c2a0ed2657b netfilter: conntrack: rework offload nf_conn timeout extension logic
    b6aefccb76489 netfilter: conntrack: remove skb argument from nf_ct_refresh
    752492947be31 netfilter: bpf: reject invalid NAT manipulation types
    d7d33c9efa9d1 ipvs: filter some flags received in the backup server
    1c68bfde05276 ipvs: do not create invisible templates
    0632541dbfa43 ipvs: fix missing counter decrement in lblc
    0c52040a3f69f tcp: refresh TS.Recent for accepted old ACKs
    efc91ab1d97bd net: ethernet: mtk_eth_soc: allocate dummy netdev sooner
    213ff02ab26a4 net: bcmgenet: fix NULL dereference in set_coalesce before first open
    41583c7d80ea6 net/sched: sch_codel: match the no-drop threshold to the packet size
    5172124684e12 net/sched: fq_codel: match the no-drop threshold to the packet size
    a85a3dce4b6c7 tipc: prevent GCM nonce reuse on peer key changes
    f9531e8331790 octeontx2-af: mcs: Fix SC resource cleanup loop
    5b353908e3be9 net: systemport: Fix RUNT MIB counter register offset calculation
    96a2b04205155 net: systemport: Fix buffer overflow in bcm_sysport_get_stats()
    b11acfcb5925e Bluetooth: hci_sync: don't drain cmd_sync backlog on unregister
    71d660ec3c5d4 netfilter: ipset: do not update comments from kernel-side adds
    44b6c6a3d10ac ipv6: fix prefix route expiry in modify_prefix_route()
    0fc74e7d97d23 net/sched: cls_api: reclaim an empty proto on the error path
    288ef37e0c463 net/mctp: publish the mctp_dev only after it is initialised
    7df748aa9f9ec Bluetooth: btintel: validate DDC record lengths
    bb5d897e1c5e8 Bluetooth: hci_core: free the HCI ID if naming fails
    0edda2d686666 ASoC: codecs: rt274: Fix format setting for 44100 rate
    d7b0b90517d23 ASoC: codecs: rt286: Revert delay value for jack setup
    2fe08c8ff2684 wifi: mac80211: prevent AP VLAN tx from other interfaces
    8c01127f8940e wifi: mac80211: Add 802.3 multicast encapsulation offload support
    2d822b7b09828 wifi: mac80211: Add multicast to unicast support for 802.3 path
    5617d53288390 wifi: cfg80211: preserve hidden-group beacon IE ownership
    ab741d1b714b4 rtc: mpfs: fix unchecked devm_clk_get() error pointer in probe()
    a2215eb3cbbd3 rtc: dev: zero-initialize struct rtc_wkalrm to prevent information leak
    60142eb2afda3 wifi: ath11k: reset ar->num_stations on hardware start
    a7223b725905d ASoC: tegra: Fix ASRC Stream6 input threshold control
    819d4c1323e2a wifi: wfx: validate MIB read length before copying to caller
    c881b1e4e9249 ASoC: wm8903: Move the DRC QR threshold to the register that holds it
    cd68146459b10 of/overlay: don't create "//" paths for fragments targeting the root
    702b5db6e7b38 of/overlay: don't leak fragment references when changeset init fails
    287a399310045 nvmet: preserve device path on allocation failure
    d94731cafa57e mtd: core: call _get_device() with the master MTD
    714d8f0b1c616 iio: accel: kionix-kx022a: Fix array boundary check
    84f8401d9bc5b mm/damon/core: don't skip damos_adjust_quota() while esz is not zero
    4cea59e43e3cc perf/core: Fix WARN in perf_sigtrap()
    51fba083e454f mm/secretmem: properly account locked pages
    933d8ac23388e ALSA: line6: reject oversized playback packets
    df2787819bd13 ALSA: caiaq: unregister the input device when probe fails
    2fc4e71aefab5 vt: skip screen update for DEC alignment test on backgroup consoles
    786b74335c219 rds_tcp: close NULL deref window in rds_tcp_set_callbacks
    1130350c8975a wifi: cfg80211: avoid double free if updating BSS fails
    c6d8cce685d60 scsi: lpfc: Handle mailbox timeouts in lpfc_get_sfp_info
    8ec545537c110 scsi: lpfc: Define lpfc_dmabuf type for ctx_buf ptr
    7ceb6f7cb8f8f smb: client: clear setuid/setgid bit on write with cifsacl/modefromsid/posix extensions
    1bef1944ef15a sctp: check RCV_SHUTDOWN after the sendmsg connect wait
    aeda50d645bbb rtc: spear: initialize IRQ state before requesting alarm IRQ
    e77c5fc1f39fd rtc: ac100: Assign .num before accessing .hws
    ae169d318d5d2 net/packet: prevent TX_RING byte count overflow
    1d27214fd9a4d netfilter: nft_flow_offload: drop flowtable reference on init error path
    ec96aa3ade2eb net: fix checksum offsets in skb_splice_from_iter()
    cc688475c56d3 of/overlay: only treat a positive changeset id as registered
    936f1ffcb87a1 of/overlay: put property on deadprops only after changeset add succeeds
    b5f488c2a9ed3 of/irq: Fix remaining refcount leaks in of_irq_init()
    3f968dcdf0188 kprobes: Skip disarmed probes when checking optkprobe overlap
    9aee3caeff4dd audit: fix exe mark UAF in kill_rules()
    8b417c887ac82 ALSA: usb-audio: Apply IGNORE_CTL_ERROR quirk to all Audient devices
    7ed1062d154ec mm/damon/vaddr: avoid hw-driven pte updates during damon_hugetlb_mkold()
    47a948ba653a4 xfs: fix cursor and pointer handling when recovering iunlink buckets
    8afc80156b1d9 smb: client: close completed creates on compound wait errors
    eaa97a196a107 smb: client: close handle after create-context parsing failure
    2f8118f4c4313 smb/client: pass cifs_open_info_data to SMB2_open()
    b63f09fdcb523 smb/client: use stack-allocated smb2_file_all_info in smb3_query_mf_symlink()
    bd9571812d022 HID: alps: unregister DualPoint Stick input device on remove
    37dc19c454191 HID: hid-alps: Use pm_ptr instead of #ifdef CONFIG_PM
    74cbf0acf9de5 HID: core: remove #ifdef CONFIG_PM from hid_driver
    a35160b2c75bf Bluetooth: btusb: Add IMC Networks QCA9377 to quirks table
    bd06033625ec2 bpf, xdp: move offload check into dev_xdp_install()
    43d61b442a0a1 RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_has_attr()
    d8ec34618e710 drm/nouveau/uvmm: fix NULL deref unwinding an OP_MAP_SPARSE op
    045532f920d86 smb: client: use finish_no_open() for non-regular inodes
    fbe8c7c940a7c perf/x86/intel: Fix GRT PEBS load/store direction for latency events, to fix sample classification
    2e4c5400f489e perf/x86/intel: Update event constraints and cache_extra_regsfor ADL
    5e20b39aa7844 netfilter: nf_tables: skip expired catchall elements on insert and delete
    ab8dfb330c907 netfilter: nf_tables: set->ops->insert returns opaque set element in case of EEXIST
    a0f5fd7a285f4 net: ena: fix MMIO read buffer leak on probe failure
    33b32efafb729 net: ena: Remove autopolling mode
    d4bd24339b505 perf/core: Run sched_task() for PMUs with only CPU-wide events
    fa360a018369f perf/core: Allow list_del during perf_event_overflow()
    98181f9721f75 perf/core: Fix NULL pmu_ctx passed to pmu->sched_task()
    403d8e4d52f5f perf: Supply task information to sched_task()
    38a6a118260eb net: ipconfig: bound DHCP option construction
    f770bd77c6e15 net: ipconfig: Remove outdated comment and indent code block
    a9d9819a7d239 PCI: Fix BAR resize for devices on a root bus
    bf58ea4958118 PCI: Fix Resizable BAR restore order
    4ab3655384e1d super: make iterate_supers_type() deletion-safe
    6c2bcf6b173d4 RISC-V: KVM: Serialize IMSIC attributes with vCPU migration
    3486ce08c383e RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_rw_attr()
    18866dc1f525f net: openvswitch: conntrack: fix helper UAF due to extensions realloc
    7ecaa9628b05a net: openvswitch: conntrack: remove 'add_helper' dead code
    7ce66bca55e37 openvswitch: prepare for stolen verdict coming from conntrack and nat engine
    c812bb4aea13d net/sched: act_ct: avoid modifying shared unconfirmed ct entry
    31f5fe29a5720 net/sched: act_ct: fix helper UAF due to extensions realloc
    cf73ef2a761df mm/hugetlb: preserve mremap address delta when skipping page tables
    465e222815c88 mm/rmap: fix missing barrier between anon_vma init and vma->anon_vma publish
    34d9dffaf0ff4 drm/nouveau/uvmm: fix UAF in nouveau_uvmm_sm when BO is in TTM_PL_SYSTEM
    8a8d16d19207d drm/amdgpu: Fix acpi device leak in amdgpu_acpi_enumerate_xcc()
    070a004d9d752 perf/x86/intel: Remove anythread_deprecated bit from perf_capabilities
    9e2a2f98e8c01 tcp: prevent collapsing skbs across boundary in rtx queue
    f04cbdfac9b82 bna: prevent IOC timer rearm during teardown
    aa00eead258e4 smb: client: fix reparse buffer bounds in cifs_query_reparse_point()
    ffc88169f4fac smb/client: send lease break ACKs thru correct session for multiuser mounts
    15e59e377facc wifi: wcn36xx: Fix potential use-after-free in TX ack timer teardown
    d073d306e587c hwmon: (pwm-fan) Stop RPM timer before freeing tach data
    93a025166495c btrfs: take commit root semaphore when iterating in mark_block_group_to_copy()
    525c225e23d61 smb: client: fix cifsFileInfo reference leak in deferred close
    11cff5518f798 mptcp: do not reschedule the RTX timer for fallback sockets
    3fe0b4b1aed10 mptcp: pm: reset retrans_time when ADD_ADDR entry is reused
    518fb6a834258 mptcp: pm: userspace: fix address ID overflow
    c003c9ab21406 mptcp: use sock_kmemdup for address entry
    f116f8462c8c2 sock: add sock_kmemdup helper
    48bf542f03cf0 mptcp: pm: drop match in userspace_pm_append_new_local_addr
    a92e0910f5fb8 erofs: add sysfs feature entry for xattr prefixes
    db0c3465b54a1 erofs: preserve LZMA decoders on resize failure
    1b5730a1c7def net/sched: act_api: release all action references on NEWACTION failure
    b2eb38377671a virtio_mmio: disable IRQ wake before free_irq
    cbfd5d11311bb virtio-mmio: Remove virtqueue list from mmio device
    21e0749e8ef27 ipmr: account multicast table and route memory
    8ca55a476af2d drm/sysfb: ofdrm: Fix is_avivo() constant comparison bug
    0cec951667a62 drm/sysfb: ofdrm: Fix integer overflow in fb_size calculation
    110dd054fd4af drm/sysfb: simpledrm: Improve stride validation
    52f36434159e4 drm/sysfb: simpledrm: Improve panel-size validation
    b6c0e77d950bf f2fs: fix dentry folio leak in find_in_level
    e754120f8ede5 f2fs: limit recovery filename logging to stored length
    428e244dd4066 scsi: qla2xxx: Fix soft lockup polling continuation IOCB signature
    2df8c86309047 scsi: qla2xxx: Use memset_io() to clear QLAFX00 request ring slot
    8b6565f19423a scsi: qla2xxx: Use ring-slot helpers in __qla2x00_alloc_iocbs
    9d69eed95b841 scsi: qla2xxx: Fix 64G link speed reporting in get_data_rate
    5e0d6ffabbbd8 scsi: qla2xxx: Null out freed pointers in qla2x00_mem_alloc() error path
    bbe692466399a media: rkvdec: Propagate platform_get_irq() errors
    7cdb1e2d3b0e5 media: platform: mtk-mdp3: fix NULL deref on failed SCP lookup
    d20ef2b13a2e0 mm/mremap: reset unfaulted VMA page offset for MREMAP_DONTUNMAP
    461dbac2056bb clk: qcom: Fix test_ctl_hi field for DEFAULT_EVO PLLs
    3ce0e9b43f355 nvme-fabrics: fix DHCHAP secret leak on parse failure
    68cb1f5d4aa50 rtc: rzn1: Handle unset alarm weekday in rzn1_rtc_read_alarm
    16dbe1300ebad ftrace: Synchronize the initialization of ftrace_ops
    abdc98e67d7db tracing/probes: Fix anon_stack check for unnamed bitfields in btf_find_struct_member
    aa4e177ae7108 staging: sm750fb: fix mono image source stride mismatch in lynxfb_ops_imageblit()
    f4f0fe3ab47ed usb: gadget: f_mass_storage: fix null pointer dereference in fsg_common_set_num_buffers()
    4892be1ef0bbe wifi: mt76: mt7996: bound the device EEPROM address before the EFUSE copy
    027679d613ea7 i3c: master: Fix use-after-free of master->this
    7b25b755d5907 i3c: master: Do not treat master device as a duplicate target
    73f3697a7b1c1 hwrng: stm32 - Fix runtime PM cleanup on registration failure
    35964ed01e10b power: supply: qcom_battmgr: fix use-after-free
    98d0b8a1bfd9a platform/x86: ISST: Validate max level for set feature
    8bae4ab7a4c84 platform/x86: ISST: Validate parameter for core power state
    55d71c70f11d9 mmc: via-sdmmc: cancel card-detect work on remove
    4fe2db296c9cd lockd: fix swapped arguments in nlmsvc_match_ip()
    730bb75ed5f66 i2c: mxs: fix DMA channel leak on probe error
    6c6ec0f6be517 dmaengine: Add devm_dma_request_chan()
    2064fdbec82ec ASoC: codecs: aw88261: only check PLL and clock state at power-up
    c45851fc674be ASoC: codecs: aw88261: reduce log spam
    31b41ea8383d5 params: fix charp corruption on allocation failure
    29144aa486899 params: Fix multi-line comment style
    75f9f1e0b4082 params: Sort headers
    641d864ba4d0d params: Use size_add() for kmalloc()
    710c30766efd8 params: Do not go over the limit when getting the string length
    88b11059bb23f ACPI: TAD: Add locking around AML evaluations
    d4a76ed0d9b4c ACPI: TAD: Split three functions to untangle runtime PM handling
    156fbd020ae36 ACPI: TAD: Rearrange RT data validation checking
    12b54e5aab7c0 cpufreq: apple-soc: Fix OPP table cleanup
    6b1c1130fcbfa coresight: etm3x: Fix cntr_val_show() to match cntr_val_store() behavior
    04c3e4456fe76 nfsd: fix clock domain mismatch in clients_still_reclaiming()
    2d8a8ed4f9d86 nfsd: check nfsd4_acl_to_attr() return value in nfsd4_create()
    1c6a4d6c20fd4 nfsd: size fh_verify server sockaddr slot by xpt_locallen
    f5e9f3a75efc7 zram: fix out-of-bounds access in read_block_state()
    a5dda540c113c zram: fixup read_block_state()
    81dfc6c665547 KEYS: trusted: Fix TPM teardown ordering
    7e6ff8c58985f ethtool: fail closed if we can't get max channel used in indirection tables
    0e58d7070eef1 media: av7110: fix a spectre vulnerability
    705a8b8cc5a44 kvm: s390: Reject memory region operations for ucontrol VMs
    d233c8da8b70f drm/i915/hdcp: Add encoder check in hdcp2_get_capability
    df17aa6038f96 drm/i915/hdcp: Add encoder check in intel_hdcp_get_capability
    017bea876eca3 pinctrl: sunxi: keep a shadow copy of the data register output latches
    3d531429524df vlan: require the MAC header to be present in __vlan_insert_inner_tag()
    61812323c037a smb: client: fix OOB struct field reads in move_smb2_ea_to_cifs()
    ee0d8f83d68f6 smb: client: fix use-after-free of iface in cifs_try_adding_channels()
    d8bc505cabfba smb: mark the new channel addition log as informational log with cifs_info
    f448b267968d0 wifi: libipw: reject TKIP frames without a full MIC
    8b637ab10e40e ALSA: usb-audio: Clamp implicit feedback packet count to URB capacity
    72399eb8bfaa2 ALSA: usb-audio: Optimize the copy of packet sizes for implicit fb handling
    48fc1c74052c9 landlock: Fix use-after-free of the source's parent directory
    4a1ba62a486a4 ieee802154: cc2520: fix FIFOP work use-after-free
    260f99b355a44 net: bridge: use option bits for CFM/MRP frame handlers
    ed1cead97afb9 io_uring/rw: end write accounting from ->ki_complete
    1a345d95e59a9 genetlink: pin family module during policy dump
    aaa7f676418e1 Bluetooth: btqcomsmd: destroy RPMsg endpoints before freeing hci_dev
    b88e69064588e Bluetooth: btqcomsmd: Convert to platform remove callback returning void
    c94985e4fd77e tracing: Fix memory corruption from a "STACKTRACE" histogram key
    cc004a1107e2c f2fs: embed f2fs_gc_kthread in f2fs_sb_info
    54c587f3f95ce f2fs: validate MOVE_RANGE destination size
    5f33efe046589 scsi: qla2xxx: Validate BSG request_len before reading vendor_cmd[]
    9bd063c082ef0 scsi: qla2xxx: Fix use-after-free of qpair work on queue teardown
    2e6f60adf609c scsi: qla2xxx: Fix queue teardown NULL dma_free and bitmap locking
    2ecc30066c228 scsi: qla2xxx: Zero dport diagnostics buffer to avoid info leak
    ab1a8a3c99712 KVM: s390: Zero initialize data structures for inject_pfault_token
    3868476cd3916 nvme: add missing SRCU grace period in error path
    29266da8ee1d9 ftrace: Take trace_array reference before accessing its ftrace_ops
    716850842d2f1 staging: rtl8723bs: fix OOB read in rtw_restruct_wmm_ie()
    5a55352d30ad3 staging: rtl8723bs: fix spacing around operators
    c1e7e35100eff usb: storage: realtek_cr: fix use-after-free on disconnect
    5aade99d72ede udf: Fix data loss when converting inline inodes to out of line
    17d5ae5897312 wifi: rtl8xxxu: fix use-after-free from rx_urb_wq on stop
    aad3129b8e915 ocfs2: validate directory-index entry counts when reading metadata
    1ecc0a9f100a7 ocfs2: validate dx_root extent list fields during block read
    66358f5789c9a HID: universal-pidff: stop the device when force-feedback init fails
    56ef23198bdd5 HID: sony: fix UAF of ghl_poke_timer / ghl_urb at driver unbind
    6eb70b78e48b0 smb: client: fix OOB read/write from unvalidated DataOffset in coalesce_t2()
    23c5cc9652c6e ceph: properly decrypt filenames in vmalloc() buffers
    ab949252fdf10 nfsd: fix nfsd_file leak on inter-server COPY setup failure
    b9f5bde07c0f9 x86/xen: fix init of balloon stats again
    4a138cd221545 xen/balloon: improve accuracy of initial balloon target for dom0
    b17c8f5dcb36a apparmor: fix out-of-bounds write when null terminating a label vec
    cf79df1770660 x86/CPU/AMD: Clear virtualized VMLOAD/VMSAVE on Zen4 client
    edb9a302cc938 net: ena: Add validation for completion descriptors consistency
    70eca80d98a44 net/mlx5e: Fix netif state handling
    1743d5a678048 ocfs2: Avoid touching renamed directory if parent does not change
    08f3e29665c31 xfrm: prevent policy_hthresh.work from racing with netns teardown
    7801e616fbe36 dma-direct: return struct page from dma_direct_alloc_from_pool()
    9f1262802008b dma-direct: simplify the use atomic pool logic in dma_direct_alloc

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 3c91a4ba7a5..dbd7894eaba 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "aafd2f2dba2b549d89a66f79826d770742d968ab"
-SRCREV_meta ?= "3254590036234c69bdd4cbc92af14a8178fc64ef"
+SRCREV_machine ?= "5d98280cab593fe037ee0dc56c451b48fa549507"
+SRCREV_meta ?= "d601e00cf0670dade657151698a6e1bfc431833e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.159"
+LINUX_VERSION ?= "6.6.160"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 1b06d1e35fb..ba598063efa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.159"
+LINUX_VERSION ?= "6.6.160"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7d022d231f699d2c767d88bb1fa305550ca68e01"
-SRCREV_meta ?= "3254590036234c69bdd4cbc92af14a8178fc64ef"
+SRCREV_machine ?= "67b2cec31617d8d448fdb6b9786a0bf90bb49bcb"
+SRCREV_meta ?= "d601e00cf0670dade657151698a6e1bfc431833e"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 601eb925955..ac5c593f1b0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9d17d5c9ac32b38ca5186199ed824b43f3d4308b"
-SRCREV_machine:qemuarm64 ?= "857114866d2445d49024c9ef1ec710a7ef291a5b"
-SRCREV_machine:qemuloongarch64 ?= "f175bcee52358aef9b53e1ddc5300e65735226ac"
-SRCREV_machine:qemumips ?= "2349f4c462400a8fb6f95c6bc0fbbdf959b2cb18"
-SRCREV_machine:qemuppc ?= "47e791b3b9f786f926e66a672c524c1e858c76c1"
-SRCREV_machine:qemuriscv64 ?= "f175bcee52358aef9b53e1ddc5300e65735226ac"
-SRCREV_machine:qemuriscv32 ?= "f175bcee52358aef9b53e1ddc5300e65735226ac"
-SRCREV_machine:qemux86 ?= "f175bcee52358aef9b53e1ddc5300e65735226ac"
-SRCREV_machine:qemux86-64 ?= "f175bcee52358aef9b53e1ddc5300e65735226ac"
-SRCREV_machine:qemumips64 ?= "a77a45b7cea3e691d2dafca4d9bdbaa60d134617"
-SRCREV_machine ?= "f175bcee52358aef9b53e1ddc5300e65735226ac"
-SRCREV_meta ?= "3254590036234c69bdd4cbc92af14a8178fc64ef"
+SRCREV_machine:qemuarm ?= "6f024f9863d3f9bd5a3e40b24e65b355e0ff57f6"
+SRCREV_machine:qemuarm64 ?= "edbaaeea3aa5ea133a35962f75ba32fab5ffaa25"
+SRCREV_machine:qemuloongarch64 ?= "8f55e2a3b837190130b37f52b906396739b6ac24"
+SRCREV_machine:qemumips ?= "657fdce3e983f75a5a21e0399651a2bbdc034c12"
+SRCREV_machine:qemuppc ?= "75f8fea793b8611a220cfaba666a59a9aecc8f3c"
+SRCREV_machine:qemuriscv64 ?= "8f55e2a3b837190130b37f52b906396739b6ac24"
+SRCREV_machine:qemuriscv32 ?= "8f55e2a3b837190130b37f52b906396739b6ac24"
+SRCREV_machine:qemux86 ?= "8f55e2a3b837190130b37f52b906396739b6ac24"
+SRCREV_machine:qemux86-64 ?= "8f55e2a3b837190130b37f52b906396739b6ac24"
+SRCREV_machine:qemumips64 ?= "cfed5cc4b70b7c7d59f45b1bc8d58b4f4e4c1a95"
+SRCREV_machine ?= "8f55e2a3b837190130b37f52b906396739b6ac24"
+SRCREV_meta ?= "d601e00cf0670dade657151698a6e1bfc431833e"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "cecd39af8a1ab81373fd9fa765b2f7ab73becaad"
+SRCREV_machine:class-devupstream ?= "0aebf2870d53a8d97e02a99e2103ea0b38950c1b"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.159"
+LINUX_VERSION ?= "6.6.160"
 
 PV = "${LINUX_VERSION}+git"
 
