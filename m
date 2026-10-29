Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4407.1793244337223114528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 20:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DecD77ZF;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91c79f306e9so17667536d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 20:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793244336; x=1793849136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=axUS4ZW4RdzEnvSWVBs4b3SsmWwe1tf66OYOmYGD4y8=;
        b=DecD77ZFzmZZ2b1T4IDell9GvDcXHsdTr87bJskzy2bNVrFJeMwvWKNVwecDkbyyHo
         qZusfX48dxPU/IvIJEb33aNDQfmUjjfJqSs709qx0jXBaUvSijODoiwawYpUnnxVDLvN
         nWl1rIciZS3MAXLQmEKHtpJGkXksaq8CGdHi9pt269ygwXdImzWIsbtlT0yUM2bqd9fy
         9t3w7B5v3UUFgmiJaZKiA7JWCWONA59w71LMLo7RK/+cvDdvnY8c4yVzBo1vCar84oxM
         TXippZfkkY3TrhFHRKROQyEFQWIPobuU7dcsRqXMUBnPwZmb85WQbSBACiQt+KGrwxrs
         g5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244336; x=1793849136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=axUS4ZW4RdzEnvSWVBs4b3SsmWwe1tf66OYOmYGD4y8=;
        b=20datb4CkpD7cIS25nlIxj80UVZECfRX3KZECYmTWP6dYSX+4a35xrkSAsNrRtBvv2
         yRRvkLIpr9pEw7V4A2Fy485tHw/m3iZK7c+Zrp7oh1fJ3+agdQp6yHzPJ6JmPoTFDoBg
         d+iZqYb+7G4Q1/6L/iPsnUIMFMGrZZECRP7Bz7gNkTkJcW6l4r1f+fbt/NYEaZFTFGC3
         bsAtm3kl2wHde1yukxhllfO6Ots1g7tysKB01vjpdhjQ/eyR5FhuLh7KvJS5ZBXTYLUP
         VLZqnl0NHIYvAPEuLLGK8/v9hQIuBvhYx7+NLv4UyZST4FCJ5DnS8EDD6NN9YtlR5Fc4
         GLGA==
X-Gm-Message-State: AFq9FYLaESEWC8J351oJ+dsvDMKrFX00cqaqq1oe1lvzuM3kLTNj0KwK
	+gRGhn8JnGcCH/AcsUoZgYaMSUPoVOE+7MOrJAn7aIunKBUpGaWrYJv43Zu6VmfU
X-Gm-Gg: AYBFou1H8bv04btfObRlHIEzqIbG3EgDZu26gUA7MXhn3eofrRHflihErPfTx6pJ/Zj
	4K2UcA782qpEUBBo+1LxSgHMSUDCUJXqISSA11PTl31zwX+C4AuXIhHfnNgcaGQQdEwZtWpKUma
	9LQ0E0V+fiiOMMOgzNUQN7rtMSJfgm4GfXgTjQV7mDSTHyNMDMRECLgLI8mOfbO+ozjmz31hiVM
	+sFxRQncgUbEGRXJfcPQ6ESZ2isq2VtRi0Jxbvi4eP3FxSlsG35l8gFliwZoCS2XTR9vPl37pPP
	ZksKv9B/t6txWWi3MF1Sz8+H35tg9HdQlb6eTNDhaVbgLY6aI/yorPzX3GlM0BUUs9WhESoUTH0
	DX9MJXBM3o9akRE1JXE1eKgE+WtwRWcxGw1dIBRzrKR1ntRshHPDT5i8pJrBxLHcSCvnRHuvdoN
	+1lBRYbcloUDmphtQqO6Z81WjuIuEd9zIwEtbHeUIyL8w0J96Sd1Grq6OTrjDZ9OfAv8oUs93tS
	T92QRKIntotU6/hGtzxLab7OZ1mOp8HcirNPKwPm2h5bGM80KnoFYXaP1kHyKPeEcqnGuDiqXZY
	26d880b75q6rkKJW41hDAVcTqDc98j4HE0xO/PUUuRP7pD74vHx/sh6dFPpV+L694NBYS/qGdFu
	voaI4oxCB7bW695ZJbkaz29rH5CNB7Wyk72vpVt8ngoQUM0QUZ7Kn+q6/S9pmR4jZ/yBPzLJeCf
	FNi3xYQOHcr6KBPg13S5VjEUCNCgTceyI50qn/xM2BBoOmpw==
X-Received: by 2002:a0c:e018:0:b0:91c:7daf:6fb0 with SMTP id 6a1803df08f44-91c7daf71e0mr61726326d6.9.1793244335113;
        Wed, 28 Oct 2026 20:25:35 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47bda586sm147529056d6.8.2026.10.28.20.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:25:33 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 03/11] linux-yocto/6.18: update to v6.18.57
Date: Wed, 28 Oct 2026 23:25:18 -0400
Message-ID: <20261029032527.3150782-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029032527.3150782-1-bruce.ashfield@gmail.com>
References: <20261029032527.3150782-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 03:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248860
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    2ff600d29ee47 Linux 6.18.57
    d1e095c75d127 HID: steam: Clean up locking
    cf71a6ee1d4e3 HID: steam: Refactor registration
    86724f4bcf604 HID: steam: Rearrange teardown sequence
    05d39902539a3 HID: steam: Fully unregister controller when hidraw is opened
    3142648c952d6 sched_ext: Generate qseq from a per-task counter
    f94a12ddd3184 drm/amd/display: Don't replace a sink mode that shares the native totals
    82ac8c4939bdb regulator: of: fill in supply names in of_regulator_bulk_get_all()
    32642616a8d73 SUNRPC: Add Kconfig dependency on CRYPTO_KRB5
    69bf8d145ee1b can: fix unique skb identifier regression under RPS
    cf32eb20dfacf xfs: fix exchange-range-to-eof file size exchange
    7d3b9b2c9dc57 xfs: stop exchanging reflink flags when exchanging mappings
    87655adb5ddb1 xfs: remove duplicate INO1_WRITTEN check
    30e08c92118cc ACPI: scan: Use acpi_setup_gpe_for_wake() for buttons
    d0813c7c09dfa ACPI: scan: Do not mark button ACPI devices as wakeup-capable
    5e9c814ee4da9 workqueue: Annotate alloc_workqueue_va() with __printf(1, 0)
    2d2c32b1b9e32 accel/amdxdna: Fix crash when destroying a suspended hardware context
    a82142af837f6 accel/amdxdna: Fix race condition when checking rpm_on
    27f52d4089ade accel/amdxdna: Resume power for creating and destroying hardware context
    44e61f1834831 s390/zcrypt: Pad trailing CCA or EP11 message with zeros
    00a44ff06bcff s390/zcrypt: Improve EP11 CPRB domain handling with ASN.1 parsing
    f463f474773aa s390/zcrypt: Improve EP11 CPRB length and overflow checks
    584400144020f s390/zcrypt: Improve CCA CPRB length and overflow checks
    7673661a8adc0 workqueue: fix devm_alloc_workqueue() va_list misuse
    5c03da7451714 netfs: Fix missing alloc tagging of direct mempool allocations
    22adb6751bcf9 net: fix backlog_unlock_irq_restore() vs CONFIG_PREEMPT_RT
    07861e84b766c media: verisilicon: Fix kernel panic due to __initconst misuse
    a582e7391fe35 netfs, afs: Fix symlink reading
    4719852d14db2 cifs: consolidate time_last_write stamp into _cifsFileInfo_put()
    8f7285d608ed0 btrfs: make sure EXTENT_BUFFER_READING is cleared under refs_lock
    fdee3570b282a drm/panthor: validate userspace queue count against initialized firmware slot count
    e3e6779f77ab6 x86/CPU/AMD: Fix AMD TLBI Erratum #1718
    bf0f3412d5a0d drm/vc4: Fix binner slot allocation failing on an idle GPU
    4835dbcde5cc3 vsock: Fix memory leak in vmci_transport_recv_dgram_cb()
    2594795fd832f net: openvswitch: validate transport header presence in set_ipv6_addr
    0849ecf1c65e8 ptp: ocp: fix PCIe delay estimation calculation
    3938430f0237c mlxsw: spectrum_flower: Fix port range register leak in tmplt_create()
    5b1fb3b105ff6 net/mlx5e: Order ICOSQ cc update after CQ doorbell
    e241465838e26 veth: fix peer NETDEV_XDP_ACT_NDO_XMIT after GRO is toggled while down
    9caa2eca5cc83 drm/imagination: Fix reference and vm_bo handling in remap()
    cc18eb0e99411 flow_dissector: avoid u16 truncation of hlen in bpf_flow_dissect()
    cb0d55754b4f9 bnxt_en: Re-write the BARs following any type of PCIe errors
    fd6a2b055dbc8 bnxt_en: Drop pci_save_state() after pci_restore_state()
    5026c5070b825 bnxt_en: Delay for 5 seconds after AER DPC for all chips
    f41becbee8fc6 bnxt_en: Fix driver init in kdump kernel
    8ef2b3ce6d142 bnxt_en: Add bnxt_clear_bars() helper
    b18a649649549 pfcp: make sure the SEID is linear before reading it
    75e7f850cabd5 net: bcmgenet: if UMAC was suspended in SW_RESET, restore it to SW_RESET
    e378bd8705659 Revert "net/mlx5: E-Switch, preserve max tx speed on vport state modification"
    972b9285ae530 net/sched: cls_route: reject change with no routing attribute
    8de57bfec3825 devlink: fix devlink_rel reference leak when notify work is pending
    27748588c9310 net: sparx5: start the TOD counters on non-PTP lan969x variants
    9993e6a0ac1b5 flow_dissector: avoid u16 truncation of skb->len when computing thoff
    0bcebf2c4305c cgroup/cpuset: Call is_in_v2_mode() after acquiring cpuset_mutex in cpuset_handle_hotplug()
    1194fd4c6dd1d spi: sg2044-nor: Honor SPI clock limits
    f3e80f5132dc4 spi: sg2044-nor: Return transfer errors
    64bb35079dcbc ASoC: samsung: i2s: enable op_clk in probe to balance runtime PM
    ef15a51966ee1 ASoC: adau1372: fix invalid default state of output ASRC and DAC muxes
    47c0c7a051b70 ASoC: adau1372: allow sleepy powerdown GPIOs
    1bee950630df0 Revert "wifi: ath12k: add panic handler"
    e3f7cc4ef04d1 wifi: mt76: mt792x: pick the SAR table layout from the table itself
    83ec70a640fe1 wifi: mt76: mt792x: treat 0xff ACPI SAR entries as no limit
    7fb2d37329c62 wifi: mt76: mt7925: don't put the band auto marker in TGID
    0f9afe238eeb7 wifi: mt76: mt7915: disable rx napi when removing device
    f240282165821 wifi: mt76: mt7996: fix struct mt7996_mcu_wed_rro_ba_delete_event layout
    0ed29ec00eb33 wifi: mt76: mt7925: restore the legacy BSS after MLO teardown
    69aae4146191f wifi: mt76: use ALTX queue for packets to disassociated stations
    a18f68c1e72c8 wifi: mt76: route nullfunc frames to PSD/ALTX queue
    9f28f50465086 wifi: mt76: account non-AQL frames per peer rather than per link
    65b080310077c wifi: mt76: add PS buffering support for HW-managed TIM drivers
    12b467683be5f wifi: mac80211: add ieee80211_txq_aql_pending()
    09c6284b21f2e wifi: mac80211: add AQL support for multicast packets
    aafd1724f65ef wifi: mt76: don't return TXQ when exceeding max non-AQL packets
    0cf84535c031a riscv: vector: Fix output operands in context save
    b56f9e11ac9f1 riscv: vector: Fix data pointer constraints in context save/restore
    2c77af8bb5dc1 net: make dev_xdp_sb_prog_count() see programs attached through a link
    63bc3cf8d7dd9 drm/xe/mmio: Fix xe_mmio_wait32() to honor delay/sleep maximums
    36d7e2da7a873 btrfs: fix lost error return value in btrfs_listxattr()
    a97114b9b00ed btrfs: fix xattr replace when multiple xattrs are packed in the same item
    2797eb38773a9 btrfs: unlock inode and extent in caller when io_uring read extent fails
    7a3addbdc5ad1 btrfs: free iov when btrfs_uring_read_extent() fails
    033dda5b321f0 btrfs: always return -EIOCBQUEUED after btrfs_uring_read_extent_endio
    77de9adf46f5b zloop: zero out only the unread tail of short reads
    7057b683922fc arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
    ce79a6c5cc1b8 nvmet: use the local P2P device on metadata allocation failure
    e76979e27f0c5 nvmet: return Invalid Field for invalid NSIDs feature 82h
    b7725acf9c574 ice: Restore Ordered MMIO Writes for Tx Doorbells
    cbab667ef8b5d tee: optee: ffa: support shared memory offsets on large-page kernels
    c83bf3973da6f tee: optee: fix kernel-doc warnings
    7110c7f70c59e cxgb4/ch_ktls: disable softirqs around tid_list erases
    181cb48c1e9af amt: send the relay's General Query directly from the receive path
    85e5512369d4f net/sched: em_text: reject unterminated algo before autoload
    bea10b84e22ef drm/vc4: Free the BO cache size list on teardown
    742619c8637b9 drm/aspeed: Balance the display clock enable on teardown
    01318927a9055 gpio: exar: initialize the ID before registering its cleanup
    5b26dbb27c0cb drm/dp: don't mark the AUX backlight enabled when enabling failed
    73e8503fac49c Bluetooth: btintel_pcie: Add shared HW reset for clean start
    39ab048cce70d Bluetooth: btintel_pcie: fix TX descriptor bounds check
    62a167e7e6d8c fs: don't let a migrating task hide its reference from do_umount()
    6850385e26bf2 fs: move mntput_no_expire() slowpath into a dedicated routine
    7505f139d8995 mount: refuse MOVE_MOUNT_SET_GROUP on an unbindable mount
    cc21cda4cac5d arm64: dts: lx2160a: fix the iic5 spi3 pinmux offset and value
    5a673697e4a3e arm64: dts: lx2160a: fix IIC1 pinmux submask rejected by pinctrl-single
    ab0f32981ce39 arm64: dts: lx2160a: fix incorrect pinmux
    fea9c705bbc61 smb/server: fix tree connection leak in smb2_tree_connect()
    46a431c0a25a8 ksmbd: convert tree_conns_lock to rw_semaphore
    0af43b52fe4b1 printk: Don't WARN on kthread_run failure.
    9bf96b4347f54 bpf: check_cond_jmp_op(): properly infer if register is null
    8a3257f142ae5 net: stmmac: fix dma mapping leak in stmmac_tso_xmit()
    afca229b39acc ipv6: mcast: use rcu_assign_pointer() for __rcu list updates
    45462e5ba345a ipv6: mcast: annotate data-races around mca_users
    a0cd9e22f8fae bpf: backtrack_insn(): Handle ld_{abs,ind} subprog exit edge
    3a39bc9707fbd bpf: backtracking shouldn't clear outer frame R1-R5 for callbacks
    65f636322ac40 bpf: Mark syscall helpers as sleepable
    364a31052aa9e ring-buffer: Add checking nr_subbufs to persistent ring buffer validation
    5b40198a0c69e ring-buffer: Skip invalid sub-buffers when validating persistent ring buffer
    6bb6ae5ab1bef bpf: zero extend the result of an arena 32-bit cmpxchg
    c4d3bdb3ab211 bpf: don't rewrite bpf_fastcall patterns entered by a jump
    65bea674f43c0 bpf: Don't infer non-NULL from a pointer with an unbounded offset
    8d19e2cdfba9b bpf: Keep refcount_acquire nullable for borrowed RCU kptrs
    bb667eb575c90 bpf: Mark NULL kptr stores precise
    08b534bafdd9d bpf: Preserve inner map identity in callback frames
    3f30b2cd4eba4 tracing: Fix subbuf resize races with trace_pipe_raw readers
    b1fe6379e401b bpf: mark a NULL call argument precise
    787405e9e7bdc iommu/riscv: Serialize command queue publishing
    3e6400e3b8b85 virtio_ring: fix stale descriptor flags after a failed packed add
    831dab9b9bcc1 vduse: validate virtqueue alignment
    7f8ee0b8f6324 vhost: invalidate vring access on IOTLB transitions
    d9232a90c6f7d tracing: Take trace_array reference when opening a tracer options file
    30dacb56f0728 drm/amdgpu: skip the VMID 0 flush for VRAM
    6ac7a29691558 smb: client: honor forceuid/forcegid when mapping SIDs to uid/gid
    2be31f252ade7 smb: client: avoid using uninitialized SIDs in cifs_posix_to_fattr()
    28289d880e6d1 ksmbd: fix maximum allowed access checks
    eb2e3bb27e78c ksmbd: remove redundant DACL check in smb_check_perm_dacl
    2e7e39bb81913 remoteproc: qcom_wcnss: Fix handling the lack of PD regulators in v3
    5c9ab0c9cede9 powerpc/xive: propagate IPI init errors to prevent use-after-free
    e3388edec1fff powerpc/xive: add error return value to xive_smp_probe()
    ebdd932dc24c1 ACPI: bus: Introduce acpi_bus_get_primary_device()
    041cce629a08d drm/xe: don't WARN on kernel job timeout when device already wedged
    40bab0da844c1 nfsd: convert nfsd_net boolean flags to unsigned long flags word
    65aa0a4c4c1bf nfsd: use workqueue enable/disable APIs for v4_end_grace sync
    96d4b275281b4 dm-pcache: validate seg_id fields from persistent memory
    3d8391d3149a1 drm/amd/display: Fix dangling pointer in plane reset function
    3a03827bb3cda drm/amd/display: Fix dangling pointer in CRTC reset function
    f786e7b3adbf3 dmaengine: xilinx_dma: Fix CPU stall in xilinx_dma_poll_timeout
    7abc9b49ad01a uprobes/x86: Move optimized uprobe from nop5 to nop10
    cf08ff2255de9 bpf: Reject MEM_ALLOC BTF accesses past object bounds
    644cf4e77c277 bpf: Reject writes through untrusted BTF pointers
    16a82add1918d platform/x86: dell-wmi-base: Fix handling of ultra performance key
    93a20b14f8627 bpf: Reject rdonly/rdwr_buf_size kfunc arguments that exceed u32 max
    0203146ad4509 usb: gadget: uac: validate rate list length before storing
    8410cd2690d46 platform/x86: asus-wmi: fix resource leaks on probe failure
    1ad6456898f6e esp: do not unref managed frag pages in esp_ssg_unref()
    80968b42d1308 RDMA/rvt: Return NULL after port allocation failure
    6a2e023429a41 fs/resctrl: Fix UAF from worker threads when domains are removed
    c6492e1741204 cxl/features: Serialize multi-part Get/Set Feature transfers
    a60bc2df2d323 firmware: arm_scmi: Fix SCMI device destroy lifetimes
    f85333284fcb6 firmware: arm_scmi: Fix OF node reference handling
    21bc07293ec4f firmware: arm_scmi: Clear SystemPower flag on create failure
    074d062040197 ext4: fix ABBA deadlock in ext4_xattr_inode_cache_find()
    094f0a895cf97 bpf: Fix WARNING in bpf_tracing_link_release
    01b5fcdc30c0a pinctrl: mediatek: use devm_gpiochip_add_data() for GPIO chip
    f3480c59f4ce9 scsi: ufs: core: Validate string descriptors
    9d39f6dda00f6 scsi: ufs: core: Convert string descriptor format macros to enum
    268cbe3a36ae5 iommu/tegra241-cmdqv: Don't fall back to a freed smmu after devm_krealloc()
    c36816feff47f PCI: Fix UAF when probe runs concurrent to dyn ID removal
    5e81d109f2e24 PCI: Fix dyn_id add TOCTOU
    0787e34b894bd PCI: Make pci_match_one_device() match on ID instead of device
    2fcd26f468014 RDMA/cxgb4: Fix dereg_skb leak and double free in write_tpt_entry()
    ffd56ada81f97 nvmet: fix return status of RMI log page on allocation failure
    f2be47fa8e225 drm/panthor: Add vm_bind region with kbo range overlap check
    23bed4ef132c5 wifi: ath12k: fix overreads in ath12k_wmi_process_csa_switch_count_event()
    ffcc9ea4e4d12 md: remove REQ_NOWAIT support from raid1/10/456
    7a1b971b799ea wifi: mt76: fix handling channel context with different bands in mt76_switch_vif_chanctx()
    2aa3d3b9fac91 wifi: mt76: mt792x: fix use-after-free in mt76_rx_poll_complete
    aca0cd273b486 wifi: mt76: cancel reset and rc work on device unregister
    9a9e902bd0556 bpf: Reject >8 byte return values on return-reading trampoline paths
    e512823aabbdc wifi: mt76: mt7996: clear stale link state on full reset
    e9e2854fcff57 arm64: ptrace: Keep 'orig_x0' in-sync with x0 on syscall entry
    0ec1d14cf302a wifi: nl80211: clean up color-change beacon data on errors
    f334b26b884df wifi: brcmfmac: fix P2P action frame handling without device vif
    9260a92ce90e6 serial: core: do fallible allocations before the console can be registered
    ddf51d74ee9f9 serial: core: clear freed pointers on uart_register_driver() failure
    2af4c46b42990 tty: skip cdev_del() when no cdev is registered
    2fd9c8112907c HID: logitech-hidpp: Fix FF device cleanup on init failure
    8397942b67128 ublk: validate auto buf reg before taking uring_cmd
    f81972b235f3e bpf: Invalidate RCU pointers after final spin unlock
    3556caa31a2bf PCI/sysfs: Add lockdown checks to legacy I/O and memory handlers
    9b405b3e7e131 thermal: hwmon: Remove hwmon class device along with its parent
    9d44822ba34d6 ocfs2: o2hb: quiesce negotiate handlers and timeout work
    bf4bd72020f33 ocfs2/heartbeat: fix slot mapping rollback leaks on error paths
    1f0f61573ba4c bpf: Clear buf on error in __bpf_get_task_stack
    35ef785b25ee2 bpf: Remove trace_in argument from __bpf_get_stack
    63669625833c4 bpf: Factor callchain_finalize function from __bpf_get_stack
    8c30d9fd61ebf bpf: Factor callchain_store function from __bpf_get_stack
    562d24ac214ba drm/amd/display: Resize MST HDCP per-connector arrays to 32
    b5896fc269e9f drm/amd/display: disable replay when crc source is enabled
    d5f3dae82705d coresight: etm4x: missing cscfg_csdev_disable_active_config() in perf enable
    e90f746f4ca38 scsi: sd: Fix special_vec mempool leak when scsi_alloc_sgtables() fails
    fcee001f57bdb scsi: sd: Move the sd_config_discard() function definition
    ce8103676f4d4 btrfs: check if root is readonly when setting posix acl
    172f349f2c59b btrfs: apply the AUTO_K(V)FREE macros throughout the code
    58b0ab0340ce0 btrfs: zoned: flush active metadata block group at btree_writepages() start
    243bf1e45e40b iommu/vt-d: Fix iopf_refcount leak on RID domain replacement
    11dfe2896ea23 iommu: Pass in old domain to attach_dev callback functions
    6822ba1ae9b6d NFS: Return a delegation the client fails to record
    e4ab436d5ba61 bpf: Compare iterator types during state pruning
    a25ea67a913f9 clocksource/drivers/samsung_pwm: Switch to raw_spinlock_t type
    6e6f8e3bfc66d nvmet: fix max_qid race between configfs and controller allocation
    5c6593422eb3c blk-iolatency: clear delay state when freeing policy data
    b399a88eb8b16 blk-iocost: clear delay state when freeing policy data
    f4ca62414f4fb blk-cgroup: delay freeing policy data after rcu grace period
    d4ba9d888ac0a bpf: Check pointer type for all atomic RMW paths
    272c05a51285f ksmbd: fix slab-out-of-bounds read in ksmbd_alloc_user()
    dc1e34f78dfab ksmbd: serialize oplock close with pending break ownership
    ff6870cf3b7ec ksmbd: defer publishing granted locks to prevent UAF/double-free race
    52b91bc5253bb ksmbd: safely discard unregistered deferred locks
    f77d2accafca5 ksmbd: detach blocked lock requests before freeing
    1ff0e41afbe73 ksmbd: scope session state changes to bound connections
    d39da3ff8d39c dpll: fix NULL deref in dpll_device_ops() during teardown race
    5235abdb760bb virtio_net: Fix resize of the RX ring
    0887d41abf766 irqchip/gic-v5: Clear per-CPU IRS data on teardown
    f57b0fd1c62e1 ip6mr: do not clone dst in ip6mr_cache_report()
    884cbf15ccd39 net: bridge: arp/nd proxy: fix reading neigh ha
    f43ef9a3f9c12 vxlan: fix reading neigh ha
    f4d23937e1c41 NFSv4.1: zero referring call lists before decoding
    68fb30607169c net/sched: account classifier filter allocations to memcg
    1ca1df82d9248 fuse: Fix the condition to enable over-io-uring
    8460dc49c9756 Bluetooth: L2CAP: access chan->conn safely in get/setsockopt
    8a8585e421d06 Bluetooth: do not leak an hci_conn when a second LE connect is rejected
    7b3e08eea1e8c net: mana: Cap MSI-X vectors to the device MSI-X table size
    c08314f917829 octeontx2-af: fix cn20k mailbox lifetime on repeated rvu_mbox_init()
    c6b56b8d549a0 netfilter: nf_tables: skip double clone set expressions on element insert
    ef4dee4640c6a KVM: SEV: Forcefully invalidate SNP VMSA if its backing gmem page is zapped
    506f03b5f869c LoongArch: KVM: Validate MSI data before routing it to EIOINTC
    34a2a7134fd66 LoongArch: KVM: Get VM PMU capability from HW GCFG register
    56c2c5ad35614 media: chips-media: wave5: Resume device before setting EOS flag
    c26cbd5c33cd7 drm/amdgpu: force complete the KIQ ring fences on reset
    7d722821e2f62 drm/amdgpu: force complete the MES ring fences on reset
    ef073edd7cfd3 zram: fix out-of-bounds access in writeback_store()
    836ce2b99bcce lockd, nfsd: RCU-protect nlmsvc_ops dispatch
    df5500ab85df6 nfsd: restore rq_status_counter to even on all nfsd_dispatch() exit paths
    9646dfee88073 ceph: fix UAF in check_new_map() on session freed during unlock
    e1f692b6da3e6 cifs: call pagecache_isize_extended() in cifs_setsize() when extending
    5481766125041 ext2: Fix lost inode updates for IS_SYNC inodes
    0692a8fdf0222 kho: fix size calculation in kho_preserved_memory_reserve()
    996dd15f60121 SUNRPC: Reject short RFC 4121 MIC tokens in gss_krb5_verify_mic_v2
    5909f8f04e9b7 SUNRPC: Switch MIC token verification to crypto/krb5
    ffb0423b4f4b0 SUNRPC: Switch MIC token generation to crypto/krb5
    1e9125bb7948c SUNRPC: Switch wrap token decryption to crypto/krb5
    5ec781a29eed1 SUNRPC: Switch wrap token encryption to crypto/krb5
    6b4d0c9cf2b10 SUNRPC: Prepare crypto/krb5 encryption and checksum handles
    5cf04fdbbf30e SUNRPC: Add errno-to-GSS status conversion helper
    08efba8d62560 SUNRPC: Add crypto/krb5 enctype lookup to krb5_ctx
    65f0f82f20334 svcrdma: Clear sc_cm_id when ADDR_CHANGE replacement fails
    35d5dd0c2fd1e svcrdma: wake sq waiters when the transport closes
    f35cf68b14422 svcrdma: Add Write chunk WRs to the RPC's Send WR chain
    ddbd71a378094 RISC-V: KVM: Fix PMU event info array size overflow
    0d4316e30efc8 KVM: riscv: Fix Spectre-v1 in PMU counter access
    0f035333e1994 ntb: Store original DMA address for future release
    b8cd3b632a0ce NTB: ntb_transport: Use ntb_get_dma_dev() for DMA buffers
    6a01c4d3a3ae1 NTB: core: Add .get_dma_dev() callback to ntb_dev_ops
    7672973957e3e tipc: avoid busy looping in tipc_exit_net()
    ed7e9715849ab fbdev: Wrap user-invoked calls to fb_set_var() in helper
    69164d6bdad5d drm/amdkfd: Add bounds check for CRAT subtype length
    39841db9322cd drm/amdkfd: Fix infinite loop parsing CRAT with zero subtype length
    22c2169770ad3 bpf: Check sk_state before sk_protocol in bpf_tcp_*_syncookie
    bea1f73ad69ee drm/amd/display: check if dml21_add_phantom_plane() is successful
    63844dc03960b dmaengine: idxd: fix double free of wq, engine, and group structs
    e299b7d1334eb idpf: bound interrupt-vector register fill to the allocated array
    a4de6fc95b2f3 Bluetooth: hci_sync: hold conn in hci_connect_acl/le_sync() callbacks
    e124f7b170337 soc: xilinx: Fix race condition in event registration
    afef4b0de4f3c drivers: firmware: xilinx: Switch to new family code in zynqmp_pm_get_family_info()
    a19c48d9f5a73 drivers: firmware: xilinx: Add unique family code for all platforms
    547ea9f567498 netfilter: flowtable: avoid num_encaps underflow on bridge VLAN untag
    be7fb59512ffc btrfs: lzo: reject compressed segment that overflows the compressed input
    0977a6f234396 optee: ffa: Add NULL check in optee_ffa_lend_protmem
    fdc93f4a80107 scsi: core: pair EH runtime PM get and put
    5cea365559449 ovpn: defer key slot crypto freeing to workqueue
    eb81c8e758f49 ipvs: revalidate ihl to prevent out-of-bounds access
    d10e73572cda4 eth: bnxt: avoid deadlock when canceling IRQ affinity notifier
    21f5381a57a5f eth: bnxt: decrease indent in bnxt_request_irq()
    bf3f37c2d40b5 gpio: pca953x: fix pca953x_irq_bus_sync_unlock regmap lock
    868c478abce85 soc: aspeed: lpc-snoop: Fix usercopy overflow in snoop_file_read
    056876c9db1e9 btrfs: lzo: reject inline extents without valid headers
    618fc8dc219c1 accel/amdxdna: Fix locally exploitable BUG_ON in amdxdna_insert_pages()
    b3d05a335cbd3 accel/amxdna: Fix page-insertion errors in amdxdna_insert_pages()
    4af94462c0ca2 bpf: Fix netns reference imbalance in conntrack kfuncs
    b57164cdddb46 vhost_iotlb: bound map allocation in add_range
    2b80707b9e276 eventfs: Use children field for rcu head and add memory barriers
    969a96479add6 btrfs: skip global block reserve accounting for rescue mounts
    f5427cab06564 btrfs: warn about extent buffer that can not be released
    23b0f4117e970 btrfs: only invalidate btree inode pages after all ebs are released
    a6f972c50552e btrfs: split btrfs_fs_closing() and change return type to bool
    f8e5715a37378 KVM: arm64: vgic: Fix race between LPI release and re-registration
    4b296d176580a nexthop: take nh->lock for f6i_list walks in replace check and notify
    f97fae992155b nexthop: avoid unlocked f6i_list walk in nh_rt_cache_flush
    2c0a8cc97a9d9 xsk: reclaim invalid Tx descriptors in ZC batch path
    1ff789fdfa231 xsk: provide sufficient space in pool->tx_descs
    9990cac513e8b net/sched: cls_u32: validate offshift to prevent shift-out-of-bounds
    15ed8a9b7c63e netfs: Fix folio_queue ENOMEM in writeback by adding a mempool
    ff5625d27415a Bluetooth: hci_sync: hold conn in hci_connect_big_sync() callback
    ff926f3ef6c80 Bluetooth: hci_conn: Fix using conn->le_{tx,rx}_phy as supported PHYs
    946dc5835c8fb net: Convert proto_ops bind() callbacks to use sockaddr_unsized
    f1b4c6aaf7655 hdlc_ppp: fix potential null pointer in ppp_cp_event logging
    68ffe4265775e Bluetooth: hci_sync: hold conn in hci_connect_pa_sync() callback
    a76243488740a octeontx2-af: Block VFs from clobbering special CGX PKIND state
    59adeedebf02a s390/zcrypt: Close speculative mem read possibility
    20b0b0159390f s390/zcrypt: Rework domain processing within zcrypt device driver
    2a25ddf0bf6dd s390/zcrypt: Move inline function rng_type6cprb_msgx from header to code
    23a541c31b45f drm/amd/display: Fix divide-by-zero in calculate_mcache_setting on zero viewport
    029b363c9b690 md/raid1,raid10: fix error-path detection with md_cloned_bio()
    bcf30e14d2bd5 md/raid1,raid10: fix bio accounting for split md cloned bios
    ea2d1d2ebf60b md/raid1,raid10: fix deadlock in read error recovery path
    e4a59511e1abd md: replace wait loop with wait_event() in md_handle_request()
    55c6f05b66772 wifi: ath12k: fix memory leak in ath12k_wifi7_dp_rx_h_verify_tkip_mic()
    c09314b8b4c62 wifi: ath12k: fix inconsistent arvif state in vdev_create error paths
    d94bf50756d7f ocfs2: validate fast symlink target during inode read
    b4059a1f57eff bpf: Reject sleepable BPF_LSM_CGROUP programs at load time
    68cf46755894d wifi: mac80211: bound S1G TIM PVB walk to the TIM element
    0901d2c894426 wifi: ieee80211: split S1G definitions out
    f488b83a38103 ixgbe: do not configure xps for XDP queues
    29e07ec352f0a ext4: validate donor file superblock early in EXT4_IOC_MOVE_EXT
    0bc97a4110e87 ext4: add mext_check_validity() to do basic check
    6166cb1344f16 iommu/dma-iommu: Fix wrong scatterlist length assignment in P2PDMA path
    98c7e206af48b cxl/region: Block region delete during region creation
    53fb46cf933dc netfilter: nf_dup_netdev: add nf_dev_xmit_recursion*() helpers and use them
    fcacd948b10a3 netfilter: nft_fwd_netdev: use recursion counter in neigh egress path
    7d5a0dc8eaab4 netfilter: nft_fwd_netdev: add device and headroom validate with neigh forwarding
    33aed3ba04aa5 RDMA/bnxt_re: Free CQ toggle page after firmware teardown
    2106c337905d7 RDMA/bnxt_re: Add a max slot check for SQ
    b422e3eff0edf net: serialize netif_running() check in enqueue_to_backlog()
    9a6916a934277 net: fully inline backlog_unlock_irq_restore()
    459536b3acf13 net: optimize enqueue_to_backlog() for the fast path
    580896e330038 fs/ntfs3: call _ntfs_bad_inode() when failing to rename
    da6675b393516 fs/ntfs3: Reformat code and update terminology
    308d7951ca221 i3c: mipi-i3c-hci: Fix race in i3c_hci_addr_to_dev()
    7a45046068791 md/raid1: fix writes_pending and barrier reference leaks on write failures
    c642583adc136 md/raid10: fix writes_pending leak on write request failures
    453f4f1e90de5 bpf: Guard conntrack opts error writes
    644b4c05bd1a4 bpf: net: netfilter: drop dead NULL checks
    3827ff67f9fbe tipc: fix UAF in cleanup_bearer() due to premature dst_cache_destroy()
    9de9e8f279de0 drm/panthor: Always use the IRQ-safe variant when acquiring the fence lock
    bc8f2d1c6f7cf xen/pvcalls: bound backend response req_id before indexing rsp[]
    177d22d31a4eb iomap: release pages on atomic dio size mismatch
    0be672071d6e8 net/mlx5: LAG, Fix off-by-one in single-FDB error rollback
    31cc289d5b179 Bluetooth: 6lowpan: avoid untracked enable work
    3dd12422653ad accel/amdxdna: Fix VMA access race
    33819cca7b76d accel/amdxdna: Refactor GEM BO handling and add helper APIs for address retrieval
    bf63433873a06 accel/amdxdna: Fill invalid payload for failed command
    08ff33dce6f91 net/liquidio: drop cached VF pci_dev LUT
    241cf3b7455be accel/amdxdna: reject user command submission without a command BO
    0a2c89d538fd4 ata: libata-core: Add NOLPM quirk for PNY CS900 1TB SSD
    4739b1b833cf2 ata: libata-core: Disable LPM on Silicon Motion MD619{H,G}XCLDE3TC
    1c3d9c6bd5b79 wifi: mac80211: validate extension-frame layout before RX
    9cbad9c8125f5 net/sched: Handle TC_ACT_REDIRECT from qdisc filter chains
    c59a693fbd213 drm/amd/display: use kvzalloc to allocate struct dc
    c2ddd180bbee7 wifi: cfg80211: use wiphy work for socket owner autodisconnect
    01f8a354497ba bpf: Fix UAF in sock clone early bailouts
    0b2c44363432a bpf: Use rcu_read_lock_dont_migrate in bpf_sk_storage.c
    88c38ff74f834 drm/xe/guc: Keep scheduler timeline name alive
    81f70f130eff9 drm/xe/guc: Hold device ref until queue teardown completes
    8549ac21ab503 bnxt_en: Handle partially initialized auxiliary devices
    e611403f30928 fwctl/bnxt_en: Refactor aux bus functions to be more generic
    5d3cea7d41dc7 tipc: serialize udp bearer replicast list updates
    6089f561e2c31 cifs: fix cifsFileInfo leak on kmalloc failure in deferred close drain paths
    984ce52ea0e01 cifs: prevent readdir from changing file size due to stale directory metadata
    0c07e046e6391 drm/xe/vf: Add drm_dev guards when detaching CCS read/write buffers
    16656c3d73469 LoongArch: BPF: Zero-extend signed ALU32 div/mod results
    08fffd2881e28 idpf: fix max_vport related crash on allocation error during init
    c174969f6af6c drm/i915/gt: Fix NULL deref on sched_engine alloc failure
    f7e744bac9a72 drm/amdgpu: Fix kernel panic during driver load failure
    cfb5a56c21888 ksmbd: prevent path traversal bypass by restricting caseless retry
    3eaec47518e12 smb/client: fix chown/chgrp with SMB3 POSIX Extensions
    d16713c060066 wifi: mt76: mt7921/mt7925: fix NULL dereference in CSA beacon
    3f9c0fdefa043 KVM: guest_memfd: Treat memslot binding offset+size as unsigned values
    5afc2d9b86bed netfs: Fix zeropoint update where i_size > remote_i_size
    b76568c672184 drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
    fcb23bb31508b erofs: fix metabuf leak in inode xattr initialization
    48d09dea506de net: hsr: defer node table free until after RCU readers
    a2650f8461cd8 wifi: mac80211: capture fast-RX rate before mesh reuses skb->cb
    3899d6f924925 wifi: mac80211: fix missing RX bitrate update for mesh forwarding path
    f669571a2bf50 netfilter: x_tables: allocate hook ops while under mutex
    a014668cbd95b netfilter: x_tables: allow initial table replace without emitting audit log message
    f048f297d93fd netfs: Fix missing barriers when accessing stream->subrequests locklessly
    93531bca46707 afs: Fix the locking used by afs_get_link()
    86f4c1586418d cachefiles: Fix error return when vfs_mkdir() fails
    b9390aa62fdca nvme-pci: fix dma_vecs leak on p2p memory
    fba32257979dd nvme-pci: fix dma mapping leak on data setup error
    c85f325d9ec31 ACPI: button: Fix ACPI GPE handler leak during removal
    78677084cd090 ACPI: button: Tweak acpi_button_remove()
    38c79dacc8063 ACPI: button: Convert the driver to a platform one
    bad88022f8949 ACPI: button: Adjust event notification routines
    4ec3a8ca97394 net/sched: fix packet loop on netem when duplicate is on
    b050fd0c2063b net: Introduce skb tc depth field to track packet loops
    2090c1a236833 KVM: arm64: Correctly cap ZCR_EL2 provided by a guest hypervisor
    fa34d3e14cb76 drm/amdgpu: fix amdgpu_hmm_range_get_pages
    768daa9f4276b netfilter: nf_tables: add hook transactions for device deletions
    7e4ab3907f44d f2fs: read COW data with the original inode during atomic write
    8363c219d88e7 fbdev: omap2: fix use-after-free in omapfb_mmap
    48ac6bab9999b fbdev: omap2: fix inconsistent lock returns in omapfb_mmap
    4338663dfd21b power: supply: max77705: Free allocated workqueue and fix removal order
    4e1af66d855f5 power: supply: max77705: Drop duplicated IRQ error message
    fa4be2054a3e2 workqueue: devres: Add device-managed allocate workqueue
    5459933a799aa net: phonet: do not BUG_ON() in pn_socket_autobind() on failed bind
    a8c1480bb066c drm/amd/display: Wrap DCN32 phantom-plane allocation in DC_RUN_WITH_PREEMPTION_ENABLED
    afe815a67ec8f wifi: cfg80211: enforce HE/EHT cap/oper consistency
    daacc9d1430b6 ptp: ocp: fix resource freeing order
    9446167bef89b ptp: ocp: Make ptp_ocp_unregister_ext() NULL-aware
    de05e37d02f3f ublk: reset per-IO canceled flag on each fetch
    09207dc57ab4c powerpc/64s: Fix unmap race with PMD migration entries
    e72ffe59e48a7 greybus: raw: fix use-after-free on cdev close
    cb06a07d835ba f2fs: fix data loss caused by incorrect use of nat_entry flag
    910e498613d5b ice: fix double-free of tx_buf skb
    c789649d4334a ice: fix potential NULL pointer deref in error path of ice_set_ringparam()
    e98cea6d5562f ice: fix race condition in TX timestamp ring cleanup
    cbfbc9d446d98 ice: reshuffle and group Rx and Tx queue fields by cachelines
    349499a65b6b5 ceph: put folios not suitable for writeback
    5df268406ef38 libceph: Fix potential out-of-bounds access in __ceph_x_decrypt()
    d0ce7b07dafe4 drm/ttm: Fix ttm_bo_shrink() infinite LRU walk on backup failure
    060f8f3020516 drm/ttm: Fix ttm_bo_swapout() infinite LRU walk on swapout failure
    dc24e03be0e4b Revert "net/smc: Introduce TCP ULP support"
    2da62dbb4169e drm/amdgpu/userq: fix access to stale wptr mapping
    b33d6f5da16e0 pseries/papr-hvpipe: Fix race with interrupt handler
    51a321dec76f7 papr-hvpipe: convert papr_hvpipe_dev_create_handle() to FD_PREPARE()
    1d15503e454bf drm/amd/display: Fix dc_link NULL handling in HPD init
    96889fcdb0988 media: iris: fix use-after-free of fmt_src during MBPF check
    46edfdcf95d2b media: iris: turn platform caps into constants
    b0eb0a8959ac2 KVM: nSVM: Triple fault if restore host CR3 fails on nested #VMEXIT
    73df74544b552 udf: fix partition descriptor append bookkeeping
    4456be93464a5 gfs2: fix memory leaks in gfs2_fill_super error path
    370154a83a835 gfs2: Rename gfs2_{withdrawing_or_ => }withdrawn
    1b6a9f81c4715 gfs2: Get rid of delayed withdraws
    dfd14e14772c6 gfs2: Asynchronous withdraw
    604dca7c20a15 gfs2: Add clean argument to lm_unmount hook
    74b981f0d3b90 gfs2: Clean up quotad timeout handling
    9e0652e243ef4 gfs2/sysfs: Replace sprintf/snprintf with sysfs_emit
    e0e31a7ed1191 ASoC: amd: acp-mach-common: Add missing error check for clock acquisition
    4097a2afe8acc scsi: qla2xxx: Completely fix fcport double free
    57a79c5df057d soc/tegra: pmc: Fix unsafe generic_handle_irq() call
    5133ef7c893c2 media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC
    6c5d98f24f995 media: v4l2-mem2mem: Add a kref to the v4l2_m2m_dev structure
    6ad4caadc6343 btrfs: don't BUG() on unexpected delayed ref type in run_one_delayed_ref()
    6311ee6daa9cc btrfs: remove 'reserved' argument from btrfs_pin_extent()
    81e1ae665004b btrfs: do not ASSERT() when the fs flips RO inside btrfs_repair_io_failure()
    559f856b109c4 hfs: Replace BUG_ON with error handling for CNID count checks
    3a409a64b2d61 ASoC: qcom: q6asm: drop DSP responses for closed data streams
    d9bf525dff80b ASoC: qcom: q6asm: handle the responses after closing
    02b033e18e08a drm/amd/display: Adjust PHY FSM transition to TX_EN-to-PLL_ON for TMDS on DCN35
    203a9241a7384 drm/amd/display: Rename FAMS2 global control lock to DMUB HW control lock
    28768bc7ea0b1 srcu: Use irq_work to start GP in tiny SRCU
    37419fa1b0bc2 irqwork: Move data struct to a types header
    d14847cb7f65d mshv: Fix error handling in mshv_region_pin
    f33de03b47c14 mshv: Move region management to mshv_regions.c
    06c0ce18055a5 mshv: Centralize guest memory region destruction
    93ed80634288d mshv: Refactor and rename memory region handling functions
    a40a75df33267 static_call: allow using STATIC_CALL_TRAMP_STR() from assembly
    5cfa4f537a056 Bluetooth: hci_sync: hci_cmd_sync_queue_once() return -EEXIST if exists
    971854e7b6ddd ALSA: ctxfi: Check the error for index mapping
    88cc09bb70651 ALSA: ctxfi: Refactor resource alloc for sparse mappings
    1422b94887c5c ALSA: ctxfi: Use explicit output flag for DAIO resources
    c0904c424f7da ALSA: ctxfi: Add hw parameter to daio_mgr_dao_init()
    dbc8b8d33c9e1 Bluetooth: hci_event: move wake reason storage into validated event handlers
    c516c2e06fe58 net: ti: icssg-prueth: fix use-after-free of CPPI descriptor in RX path
    2352d719cccfc net: ti: icssg-prueth: Make emac_run_xdp function independent of page
    2157742f5c32f net: ti: icssg-prueth: Add functions to create and destroy Rx/Tx queues
    41f3fa0d14bb8 ti: icssg: convert to ndo_hwtstamp API
    6e5c3ddf17a2c blktrace: fix __this_cpu_read/write in preemptible context
    6b3546e3a8c66 accel/amdxdna: Fix NULL pointer dereference of mgmt_chann
    2f62f8be57882 PCI: endpoint: Add missing NULL check for alloc_workqueue()
    b0d908230b3d8 PCI: Add WQ_PERCPU to alloc_workqueue() users
    b569ff8a1bc1b accel/amdxdna: Fix potential NULL pointer dereference in context cleanup
    09ed30edcfa1f accel/amdxdna: Add hardware specific attributes
    3bdd26582d026 accel/amdxdna: Enhance runtime power management
    5a7d0e2810891 ata: libata-scsi: do not lose CHECK CONDITION for failed ATAPI commands
    e01c79761c7b3 namespace: handle mount locking for automounts correctly
    6b8dc3713a763 namespace: never expire a locked mount
    494c57572d2d5 namespace: refuse an automount below a mount that is in no namespace
    fa75dae156df1 fcntl: refuse F_SET_RW_HINT on an immutable inode
    5f97df8ca7fad namei: don't reveal overmounted entries in refwalk
    d29cd99db3db7 namespace: unhash a dentry before detaching the mounts on it
    7e1c466011ba9 namespace: don't let a pseudo dentry become the root of a mount
    390ddcea2a8ac dcache: don't put a mountpoint on a dentry that's being removed
    e3aba6900483f namespace: check the mounts before reading their parents in pivot_root()
    888363d74c3b5 namespace: remove the fsnotify marks of a mount namespace in process context
    b9c40553f6ceb namespace: look at the topmost mount for a mount namespace file
    a0ba48256f5df namespace: check a recursive bind mount for mount namespace loops
    d73f04e92c1aa namespace: check a submount for references right before unmounting it
    acbe9e4418e2e namespace: queue a mount only once for mount notifications
    33b4344f69013 namespace: check the target before walking it in do_mount_setattr()
    c44f5c30f0a97 fs: refuse fspick() on internal superblocks
    b47b40c4f0584 namespace: don't copy an unmounted mount tree
    eecc9cd0fc07d namespace: don't inherit MNT_UMOUNT in clone_mnt()
    5e0a1f2c753a7 namespace: reset the old parent's ->overmount in mnt_change_mountpoint()
    bf2c8dec26fb7 fs: don't silently unmount busy mounts
    9bd1181b36f2d mount: keep a copied mount unbindable
    c6307228af65a drm/amd/display: Fix direct scanout alpha on some DRM_FORMATs
    d9da2f7bbbffb drm/amdgpu/userq: return the memdup_user() error for the user MQD
    112dbe2b10d6d drm/amdgpu/userq: only accept doorbell BOs as queue doorbell
    21aee7fc9310d drm/amdgpu: copy debugfs register data outside the GRBM/SRBM locks
    1a5c03198ae86 drm/amdgpu: make Mac FB workaround generic
    8d6f773d74790 drm/amdgpu: serialize vblank counter reads against GPU reset
    3d4890b4ab04f drm/amdkfd: fix dma_buf reference leak in get_dmabuf_info
    f009879ed9906 drm/amdkfd: align SDMA doorbell base for shader doorbell writes
    3a11adcfd9a2d drm/xe: Fix stale pinned_link entry when fb-pin performs the final unpin
    993c952e6832a drm/xe: Fix shrinker accounting double-subtraction on nested external pins
    76e5ddd7d9822 drm/vmwgfx: validate pitch coming from userspace
    ea22f8a5d11a4 drm/vc4: Fix firmware reference leak in vc4_drm_bind()
    e61465d3e0292 drm/vc4: drain the hangcheck timer and works on V3D unbind
    f9b215b3e37a5 drm/imagination: Size page table preallocation by device address
    0b4a0fb98b9ff drm/i915/gt: Unmask interrupts only when ACTIVE is true
    152fb5083b933 drm/i915/gem: Prevent overstepping exec array boundary
    cd7bec509c180 drm/gud: don't keep a connector without a CRTC as connector_state
    4e7b508c7c60d drm/fb-helper: defer setup when fbdev_probe() fails, not just on -EAGAIN
    a661f401f83b8 Bluetooth: RFCOMM: Fix NULL tty_dev dereference in rfcomm_dev_shutdown
    4f46de658ce61 Bluetooth: RFCOMM: free the skb when the DLC has no owner
    b108ea7ebba14 Bluetooth: SCO: serialise sco_conn lifetime against sco_recv_scodata()
    ec227cddd13cd Bluetooth: MGMT: Fix status of pending commands flushed on power off
    c6489a3a0ac8c Bluetooth: ISO: Serialize concurrent connect calls
    90b744066ca52 Bluetooth: ISO: Reject concurrent BIS listener setup
    7db33b36213a3 Bluetooth: hci_sync: Fix command skb lifetime during scan setup
    c3d2799877906 Bluetooth: hci_sock: Serialize dead-device detachment
    c9c20d334cd5e Bluetooth: btintel_pcie: use managed IRQ teardown
    71beae6f2e8bc riscv: hwprobe: use _BITULL() rather than BIT() in MIPS vendor uapi header
    2e5c80bbc062a riscv: futex: untag the user pointer before the atomic access
    b86e88a3dc6e1 riscv: fix load_unaligned_zeropad() fixup for RV32
    fa465a7819ecb riscv: errata: select RISCV_ALTERNATIVE_EARLY for THEAD GHOSTWRITE
    7d1367a53137e riscv: entry: gate shadow call stack reload on sstatus.SPP, not tp
    8bfcbd5022818 scsi: qedi: Initialize callback state before registration
    ce2eee635fd3e pmdomain: rockchip: propagate subdomain add errors
    1072890e6c1af pmdomain: rockchip: fix clock leak on domain probe failure
    5874c0e2bd030 pmdomain: rockchip: don't ignore clock lookup errors on attach
    28606d4d4dbe8 pmdomain: imx8m-blk-ctrl: Serialize power on/off across sibling domains
    f6fbe9c6b3996 regulator: tps6594-regulator: Fix n_linear_ranges for TPS65224 BUCK2-4
    199a62d70314d regulator: ltc3676: don't read the write-only HRST and CLIRQ registers
    681adbc9c7a82 optee: register TEE devices only once fully initialized
    55f12552b00a3 openvswitch: fix soft lockup in the netlink flow dump
    558a189ca357d nvme: fix swapped ZRASF zone state values for full and read only
    961563117626f net: team: free skb when broadcast has no txable port
    0c0568c9d35c4 net: team: stop reusing skb after queue override
    5b144f83f2179 net: usb: ax88179_178a: fix rx frame length for non-last packets
    cc7cc5955d22e net: sparx5: free the matchall entry on destroy
    5551399751e2c net: skbuff: don't leave stale bytes in skb_copy_and_csum_bits()
    d7fea7141036f net: dsa: microchip: fix KSZ8765 fiber detection
    d109141ba1465 net: bridge: avoid recursive multicast port cleanup
    6a1833f0d7dc0 net/smc: protect clcsock lifetime in smc_getname
    3efe0e0944157 net/packet: guard the ll header push in packet_rcv_spkt()
    3a1caa886d41d mmc: sdhci-sprd: disable runtime PM on remove
    46e75703ca3f0 mmc: mtk-sd: Cancel request timeout work on remove
    9ac3fd9dc917d mmc: cavium-thunderx: destroy slot platform devices on remove
    8668f432a9bf7 mmc: cavium-octeon: destroy slot platform devices on remove
    e3bf232c913b7 dm: fix reading free memory in do_resume
    c86f80cd246c0 dm-snap: reject the transient exception store for snapshot-merge
    4f0ee735dc68e dm-integrity: fix buffer overflow in inline mode with large tag size
    a1a875614dae4 dm-crypt: reject the lmk IV mode with AEAD ciphers
    7a25ca170c12a mm: don't schedule deferred kernel page table freeing while booting
    d7e811c3a49cd memstick: rtsx_usb_ms: complete requests after eject instead of dropping them
    f2795c50144d5 memstick: core: wait for request completion before freeing card
    11516a0c402a6 KEYS: Fix add_key() race with keyring restriction
    955b1f75c4001 keys: finalize persistent keyring timeout after link attempt
    beb05f484a1e4 ice: fix metadata_dst refcount handling on representor teardown
    ca8a6285b11d0 ice: fix use-after-free in dynamic port cleanup
    bb8f6b89587d0 ibmveth: fix TX LTB and filter unwind on open-fail
    a065bd31ec462 ibmveth: h_free logical LAN on open-fail after register
    06656aaa7e43a gve: fix XSK buffer leak on error descriptor
    506f9de069d07 gve: fix XSK buffer leak when rings are stopped
    42935a6100192 gve: fix napi_disable deadlock when attempting to disable XSK pools
    a027e0d7765d1 gpio: xilinx: fix runtime PM leak on request error path
    76390ac0bca7e gpio: mpsse: fix race when arming the IRQ poll worker
    1eb70d10bbb8a EDAC/amd64: Mask UMC chip select to the four implemented selects
    2d79ddc9a0cc0 sctp: copy zeroed stats to user in sctp_getsockopt_pr_streamstatus() when !streamoute
    5509d498e1b9e selinux: preserve NATIVE_LABELS on already-initialized sb in set_mnt_opts
    5a41bcc5057dc selinux: fix data race on AVC latest_notif
    215c29f7f4606 Revert "wifi: libertas: reject short monitor TX frames"
    1428c5f1d346a tipc: hold a reference to nodes found by link name
    0af8780bdfdfc tipc: destroy topsrv workqueues before closing connections
    1c7463ac0e99c tcp: reject net_iov in zerocopy receive mapping hints
    3d555c31b0d27 swiotlb: fix default_swiotlb_limit() for non-growable default pool
    d2b5f637b9b67 strparser: make sure __strp_recv isn't running before tearing down the parser
    65cb86860a80f tee: shm: reject zero-sized allocations in tee_dyn_shm_alloc_helper()
    086944c1c2cbb xen/netfront: don't leak the skb when xennet_fill_frags() fails
    b12a25fb2b9d5 workqueue: Fix NULL current_pwq deref in chained work check
    4d64a3d6e96aa wireguard: noise: reject response consumption after intermediate initiation
    38da24fd5c9d0 wireguard: queueing: preserve tstamp_type when encapsulating packet
    d730b466496ce wifi: mt76: mt7996: fix uninitialized buf read in mt7996_variant_fem_init()
    dd117d17e8aa2 wifi: mt76: mt7603: initialize global station WCID
    eef16a74ff8ed wifi: brcmfmac: fix P2P device removal race in brcmf_detach()
    38bad3930b118 vsock/virtio: account only unread bytes in read_skb()
    6139c710d8bee usb: f81604: fix struct f81604_int_data size mismatch
    5680b6fb30546 dm ioctl: don't let data_start run past the buffer
    2200fe1d6148b cipso: adjust cached option offsets when removing CIPSO
    8d88d3221204f cgroup/cpuset: Handle cpu hotplug race in guarantee_active_cpus()
    12ba7d8b9cd45 btrfs: scrub: fix local_root reference leak in scrub_print_warning_inode()
    a768b88cd157b ASoC: amd: yc: Add DMI quirk for Acer Aspire Go 15 (AG15-21P)
    13bbcfe755d46 arm64: irq: exclude the softirq stack switch from KCOV
    1ea7241101753 ALSA: hda/tas2781: Accept V1 calibration data without CRC
    f7dc71c1ce885 ALSA: ctxfi: Fix memory leakage when clearing DAO input mappers
    0b0278e760d7b Input: xpad - add support for Corsair Novablade Pro
    2e4f80c023119 Input: xpad - add support for 8BitDo Pro 2 Wired Controller for Xbox
    d738e51bf2c21 Input: ati_remote2 - fix type confusion in device attribute handlers
    4ac7d92a4698e ipv6: do not warn on route notification size race
    7dfa7ca97f3ac ipv4: do not warn on route notification size race
    c1f48d1c2d5e9 ipv4: stop route notification sizing when nexthop group shrinks
    21cba134c30c1 ipv4: stop exception dump when nexthop group shrinks
    c6d670ac656ba ipv4: stop PMTU walk when nexthop group shrinks
    71cbad138969e rust_binder: reschedule node refcount update on thread exit
    f3e835af6226f ipv4: validate checksum_start before completing checksum
    fa1bceba169b1 ipv6: Fix redirect exception creation for UDP/RAW sockets
    61a32face36f7 crypto: drbg - Fix ineffective sanity check
    af98611ad109e net: dsa: mt7530: fix .get_stats64 sleeping in atomic context
    4d8ed219b1921 f2fs: fix to reset all pinned status during fggc
    b2cf17d39dd2c f2fs: fix to shrink gc_lock coverage in f2fs_gc_range()
    3f63f071bf82b accel/amdxdna: Bound the sync_bo flush range to the BO size
    d7b9770a487e1 ynl: fix schema check errors
    3a49853272bd3 doc/netlink: netlink-raw: Add max check
    56760e83aa4e8 netfs: zero the tail of a short DIO/unbuffered read
    61519a5a1d70f net: mana: Skip WQ object destruction for uninitialized RXQ
    b5aa7f1773f80 net: mana: check xdp_rxq registration before unreg in mana_destroy_rxq()
    867119b4b5880 net/mlx5e: Prevent stale XSK buffer release on MPWQE refill retry
    639522e5056ca net/mlx5e: Prevent stale XSK buffer release on refill retry
    50cff3f112d64 fs: Free any excess xarray nodes in clear_inode()
    fbd977e513971 bnxt_en: fix DMA mapping length for padded small packets
    17ad2612c11a7 Linux 6.18.56
    a47406c769f72 ipv4: free inet_opt and ireq_opt after an RCU grace period
    b473ee29aa0d3 iio: adc: adi-axi-adc: Initialize state mutex
    bb29dd90885b4 iio: adc: adi-axi-adc: Make use of dev_err_probe()
    e05c55de819b4 iio: buffer-dmaengine: fix sg entry iteration when building dma_vecs
    845c959178cca net: mana: Sync page pool RX frags for CPU
    55aa2774323e7 net: mana: remove double CQ cleanup in mana_create_rxq error path
    72d2f54367895 xen/netfront: drop RX packets with a short Ethernet header
    626deff23b544 net: usb: qmi_wwan: add Quectel EG120K-EA
    525694a6021ec KVM: x86: Re-pend GET_NESTED_STATE_PAGES if getting said pages fails
    81d7875515906 KVM: x86: Add static calls for nested virtualization ops
    69f1d46341c28 KVM: x86: Reject nested CAP enablement if nested virtualization is disabled
    9a4605ac9045d KVM: move TSS constants from kvm_host.h to tss.h
    318ef696fa3c7 KVM: SVM: Use the active VMCB's MSR bitmap when checking if MSR is intercepted
    267c586a090a4 KVM: arm64: Use stage-1 leaf size for VM_PFNMAP
    1113374a17d7f KVM: arm64: Apply the fine-grained UNDEFs without FEAT_FGT
    e4f086a7d7074 KVM: arm64: Always populate FGT masks at boot time
    a014b1a377e45 KVM: x86: Move IRQ-related helper declarations from kvm_host.h => irq.h
    cf0654248c87f arm64: errata: Add Cortex-A725 erratum 3821522 workaround
    424e851050f47 arm64: errata: Factor out broken AMU const counter cap
    277c4d8eac0ba arm64: mm: Fix the break-before-make flush range for erratum 2645198
    e506333d1b9f4 perf: Require kernel access for text poke events
    2581b43e162cf perf/core: Check kernel access when kernel callchains are requested
    a16986dac7be5 perf: Replace perf_event_header__init_id with full header init
    624370942abd3 unwind: Shorten lines
    08bf919f041af tty: fix saved termios reset race
    9e8595cbd31db usb: typec: ucsi: acpi: Assume UCSI 1.2 on Acer Nitro ANV15-41
    100f92cc90149 tty: n_gsm: fix missing modem controls after DLCI open in convergence layer type 2
    ba927133b3018 usb: dwc3: gadget: fix IRQ storm on invalid event buffer count
    9b995b757a87d drm/amd/display: Fix fast updates on DCE 8.1
    6f36088234647 drm/amdgpu: reset VI ASIC on MacBookPro14,3
    d12b62677fb48 drm/amdgpu: reset VI ASIC on MacBookPro15,1
    0e0fd96b26263 drm/amd/display: Preserve eDP mode on initial ASSR failure
    8786c5bc77375 drm/amd/display: Mark DCE 6.4 as not APU
    6b0cc4e32599f iio: adc: ad4030: fix invalid oversampling_ratio validation
    23222e50948a2 iio: adc: ad4030: Use BIT macro to improve code readability
    9c8158ef4ccce units: Add HZ_PER_GHZ
    a0a1929d66d6b smb: client: only require read lease for size-extending preallocate
    aec958676fb75 iio: adc: aspeed: propagate reset deassert errors
    49c97ba1a3a3f iio: adc: aspeed: Simplify with dev_err_probe
    74d723eee7296 smb: client: distinguish real EOF from a stale remote_i_size on read
    cecf4114069fc smb: client: flush dirty data before zeroing a range
    405a969c0b335 thunderbolt: Don't access a DP tunnel after its DPRX read was canceled
    9cedbfde14500 wifi: mac80211: set info->band for 802.3 encap offload frames
    cbdcf80683f53 wifi: mac80211: Add sta pointer sanity check in ieee80211_8023_xmit()
    03525b632908b wifi: mac80211: count only matching reservations in reserved switch
    80e8b0ea73ba2 mtd: spinand: fix NULL pointer dereference with no ECC engine
    2d86abd280714 nvme-multipath: set BLK_FEAT_ZONED only after the zone info is known
    d3d6d7efdacc0 nvmet: copy the hostid into the ctrl before creating PR pc_refs
    dd053fc01eefa nvmet-tcp: Don't error if TLS is enabed on a reset
    889c61e3d0f10 Bluetooth: Serialize SMP remote OOB data access
    e887e43bd5aa7 fsverity: add dependency on 64K or smaller pages
    b4c0c41b952c2 fs,fsverity: remove check for fsverity being enabled in setattr_prepare()
    2efdeec99ca09 fs,fsverity: reject size changes on fsverity files in setattr_prepare
    8f317daa50fe1 rust: irq: pass RegistrationInner as cookie to request_irq
    333fa4bb5dbbe rust: devres: ensure revocation is complete before device finishes unbinding
    e7930d857cc79 rust: devres: fix race between concurrent revokers
    5017fdcb5ad73 rust: devres: add 'static bound to Devres<T>
    8ae7e5dec4f34 rust: devres: fix race condition due to nesting
    946ae2e1669b6 mm/vma: predicate setting mmap_prepare VMA fields on new vma alloc
    60f3b22d501dd mm/vma: rename __mmap_prepare() function to avoid confusion
    98f6a4589e0f5 netfs: clear post-EOF pagecache when extending a file via write
    4b8ce1686dea1 pfcp: fix socket lifetime on netdevice registration failure
    8bed333470a1b mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages
    0a6c9b3801903 drm/amd/powerplay: fix VoltageObjectInfo zero-stride loop and OOB read
    e68380710fc97 svcrdma: Use svc_xprt_put to free listener on create failure
    d1d9694ae47da mptcp: fix msk->timer_ival reset
    e64703280ce7a iio: trigger: cancel reenable_work before freeing trigger
    e113bac1d5e72 iio: proximity: vl53l0x-i2c: claim direct mode for raw reads
    28e76a775c304 iio: proximity: vcnl3020: fix ISR bitmask check in IRQ handler
    a70d84d2f6c32 iio: proximity: sx9324: Correct proximity channel resolution
    20ebd7f4e35c0 iio: proximity: pulsedlight: fix iio_device left registered on PM setup failure
    58237debc18dd iio: proximity: isl29501: Fix return type of isl29501_register_write
    6501b032be217 iio: proximity: aw96103: validate firmware data length
    493e743ea1b59 iio: pressure: rohm-bm1390: Return error when read fails
    4fd5a61e61d68 iio: pressure: bmp280: fix out-of-bounds access in sampling frequency lookup
    10a958e76c737 iio: light: rohm-bu27034: Fix infinite delay on error
    cc71400bc965c iio: light: gp2ap020a00f: drain irq_work after free_irq
    ce308ce18dedc iio: imu: adis16480: fix unprotected debugfs reads
    50e8d70ba0743 iio: imu: adis16400: fix unprotected debugfs reads
    60699102827fd iio: health: max30102: fix NULL dereference in interrupt handler
    b53dc6e15aead iio: gyro: adis16136: fix unprotected debugfs reads
    786f0162fe6d2 iio: frequency: admv1013: fix wrong channel field used in admv1013_read_raw()
    d6a83a5015071 iio: cdc: ad7150: fix OF matching and publish module aliases
    b134ef820610b iio: buffer: Ensure bounce buffer used for unaligned case is zeroed.
    b466db9e68b47 iio: buffer: serialize buffer teardown with mode claims
    8aef1e8bdd86d iio: admv1013: initialize callback mutex before registering notifier
    a5fe2d1b55fab iio: adc: xilinx-xadc: free IRQ before cancelling the unmask worker on unbind
    f44e2ac2fb114 iio: adc: sun4i-gpadc-iio: drop underflowing pm_runtime_put() calls
    d74c2489acc5f iio: adc: sun4i-gpadc-iio: clean up on thermal zone registration failure
    6dd3bf785d030 iio: adc: stm32-adc: fix possible division by zero in processed channel
    2754d336af34b iio: adc: stm32-adc: fix check on internal channel availability
    56e8e9d9992b4 iio: adc: rohm-bd79124: Fix rising alarm
    2a3fd11fd0e19 iio: adc: rohm-bd79124: Fix GPIO mask check
    02a9e6a95a3bf iio: adc: rohm-bd79124: Fix channel initialization
    1d8beaae5a745 iio: adc: rohm-bd79124: Catch regmap errors at measurement start/stop
    2eb7f097e15dc iio: adc: pac1934: check ACPI label duplication
    fe0ceff995d91 iio: adc: max1363: sign-extend bipolar differential channel reads
    f87d392bb4ebf iio: adc: axp288: Add TS bias override for Haier HV103H
    ed1a6230155fd iio: adc: ade9000: request interrupts after powering the device
    f73b94acc7ec8 iio: adc: ade9000: handle Phase C dip events in IRQ1 handler
    fddb6cc28134b iio: adc: ade9000: fix overlapping scan_index for current and voltage channels
    d2400175228fb iio: adc: ade9000: fix NULL pointer dereference in clkout registration
    f20b94a7dc1ff iio: adc: ad_sigma_delta: fix use-after-free on unbind
    0633f83c4caa9 iio: adc: ad7173: Fix digital filter configuration
    d2261795797bc iio: accel: sca3000: fix frequency divider condition check
    3365209e758c8 iio: accel: kxcjk-1013: reject duplicate event disable
    5c7ca8fe72064 iio: accel: kionix-kx022a: Prevent memory leak and fix state
    4165641d06ef4 smb: client: split cifsFileInfo bitfields to avoid shared-byte RMW races
    f82242fe3109a smb: client: flush and commit data before querying allocated ranges
    dce9bca8afcbd smb: client: discard post-EOF pagecache when extending a file via copy range
    b75dadb50a25e smb: client: discard post-EOF pagecache when extending a file via zero range
    2f97f929dad9e thunderbolt: Reject oversized XDomain properties responses
    58cb2aa1d29f7 thunderbolt: Disable CL states for the Anker Prime TB5 dock
    2f5893172fc61 thunderbolt: Fix domain reference leak when DPRX read is canceled
    34a6e27c954e5 thunderbolt: Tear down inactive DP tunnels when the domain is stopped
    e09cbad4db58a thunderbolt: Mark discovered tunnels as active
    c444d2c17dc23 thunderbolt: Hold a router reference for each allocated HopID
    f18faa3d3b810 thunderbolt: Fix KASAN reported use-after-free when request is canceled
    29664699216c6 USB: serial: option: add Compal EXC-T1 support
    af4224809ea1b USB: serial: option: add Quectel RG660QB
    3ef1b5c9a7194 USB: serial: option: add Compal EXM-G1x support
    8b495843267b9 USB: serial: option: add Quectel EG060W
    02e1112182d8a USB: serial: option: add support for SIMCom SIM8260C
    4597ddd6168ae USB: serial: fix ioctl hangup race
    a1aa474768f69 USB: serial: fix driver deregistration order
    4d6da6867b4ac USB: serial: fix dynamic id driver deregistration race
    02fc7a87f0291 USB: serial: ssu100: fix baud rate overflow
    4e18c175cea26 USB: serial: quatech2: fix baud rate overflow
    25a5f7239a43a USB: serial: cp210x: add Corsair AX1500i Power Supply
    452f1c9b76f7a wifi: mac80211: handle empty FILS association request payload
    128e800a41270 wifi: mac80211: fix mesh fast xmit path deletion UAF
    a613c891906b5 wifi: mac80211: release mesh path quota on failed additions
    1892e71aa2e5e wifi: mac80211: reject invalid 320 MHz CSA bandwidth
    42aa9feb27b60 wifi: mac80211: minstrel_ht: validate fixed rate index
    d0183cd1f6a2d wifi: mac80211: keep fallback association elements alive
    3b75831ceee76 wifi: mac80211: account proxy paths against the mesh path limit
    772bd89304ecf wifi: mac80211: drain PS delivery work during station teardown
    481f9230284c2 wifi: mac80211: shut down RX BA session timer on teardown
    1c82d0c5d5091 wifi: mac80211: keep paired old chanctx alive
    cd8f8f45d81aa wifi: iwlegacy: 3945: free EEPROM data on remove
    b0e97bd40e0c2 wifi: cw1200: fix TX padding OOB read leaking heap data to device
    4c9a32a808104 wifi: cfg80211: fix RTS threshold setting for single-radio PHY
    98abf374e5096 KVM: arm64: vgic-its: Fix MOVALL handling of source redistributor
    b37ae6e65a1dc KVM: arm64: Clear HCR_EL2.RW for 32-bit non-protected vCPUs
    97c1dcce17ef2 KVM: x86/mmu: Bail from shadow walks if the root is invalid or a dummy
    8b7d4f68fef96 KVM: SEV: Do cache maintenance on the source VM *before* clearing SEV state
    b1de3ebf59507 KVM: SEV: Nullify "have run CPUs" mask pointer when freeing it
    f6189e26d0237 KVM: nVMX: Force MSR bitmap refresh if runtime eVMCS controls are modified
    1a62eb293f60a mtd: spinand: Do not update the QE bit on devices without one
    b28120197cc15 mtd: spinand: fix zero oobavail when no ECC engine is used
    23cef33571b19 mtd: spinand: Enable QE on all dies
    2bbaa3f8df83f mtd: spi-nor: core: Fix mutex leak in spi_nor_rww_start_exclusive()
    875c57f2df09f mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of OOB
    1ed0ccd564915 mtd: rawnand: cadence: Initialize IRQ state before requesting IRQ
    cadf42f22438f mtd: mtd_intel_dg: reset poll counter for each erase
    a991c28066e7b mtd: block2mtd: Fix divide error when erase_size is zero
    2423a05dd0f21 nvmet: pci-epf: reject too-short SGL segments
    7fd3c363eba4f nvmet-auth: fix out-of-bounds write in nvmet_auth_challenge()
    21ffcae171d11 nvme-pci: add NVME_QUIRK_DMAPOOL_ALIGN_512 for Micron 4100AT
    49e8a3224c91f nvme-multipath: fix underflow in ANA log bounds checks
    e30a2406408d2 tpm: fix off-by-four bounds check in tpm2_get_random()
    aa480f05aed7a net: extend IPv6 exthdr detection of tunneled packets
    6316d17324bd4 ipvs: bound LBLCR and LBLC cache growth
    891bd8335a0de io_uring: fix task_work add use-after-free with SQPOLL
    a85d0f00671b4 fprobe: Use guard(rcu_sched_notrace) and check rcu_is_watching()
    bdbc8e78aa96d tracing: fprobe: fix suspicious rcu usage in fprobe_entry
    b0f76d4cb9be5 mm/damon/core: do non-safe region walk on kdamond_apply_schemes()
    d3c2d2692bdf4 x86/mm: Drop unnecessary PMD page copy when freeing
    fe23680e6f1d5 x86/mm: Don't apply va_align to hugetlb mappings on AMD F15h
    84df222de86ea Bluetooth: btintel_pcie: reject oversized TX packets in send_frame()
    c3b5e6da4ba64 Bluetooth: btintel_pcie: fix plen overflow in btintel_pcie_recv_frame()
    c42ce5373405c Bluetooth: btintel: fix buffer over-read in btintel_hw_error()
    708cdd203d0bb Bluetooth: hci_core: Serialize fragmented ISO packet queueing
    1681f97afdf92 Bluetooth: hci_core: Serialize SCO and ISO scheduling with teardown
    86e9708f9d19a Bluetooth: hci_core: Serialize ACL scheduling with channel deletion
    dd4db9f808ac2 Bluetooth: hci_core: Fix inquiry cache timestamps on 64-bit systems
    cabd58d9bb66d Bluetooth: hci_conn: Lock parent access during enhanced SCO setup
    333257e6e4a7b Bluetooth: hci_sync: Fix inquiry cache use-after-free
    0a554901bd227 Bluetooth: RFCOMM: Fix initial port reference race
    4230d65032fcf i2c: xiic: don't clobber msg->len to signal block-read completion
    51e1125ff7d63 i2c: xiic: preserve PEC byte length in SMBus block read setup
    ba0632683728e EDAC/altera: Fix device node reference leaks in the SDMMC ECC setup
    865f3bdebbc9b EDAC/altera: Fix use-after-free in error paths
    74eeb95c0478b EDAC/altera: Fix memory leak on dci allocation failure
    9846b85c2eb8b EDAC/altera: Drop __init from ECC setup paths for re-probe safety
    0c03cb91b5698 EDAC/altera: Do not allow driver unbinding
    9d2d3b3dfe897 EDAC/versalnet: Drop remote processor handle refcount on driver removal
    e561c2740b628 ALSA: hda/realtek: Fix silent speaker on Higole F9B
    d8986de05cc6c ALSA: hda/realtek: Fix square wave output on ASUS Strix G615LR
    eb0c7fda59cf6 ALSA: ua101: reject mismatched capture/playback packet sizes
    fc5c52848e405 ALSA: seq: Serialize compat port-info ioctls
    9590d16791625 ALSA: hda/tegra: Re-enable SDO workaround for Tegra194
    69d2b7a4c1151 ASoC: qcom: lpass-cpu: use DAI table index for playback constraints
    d195c8c763fdd ASoC: codecs: rt1017-sdca-sdw: fix uninitialized stream_config->type
    7df8c39a50f36 ASoC: codecs: max98363: fix uninitialized stream_config->type
    2bce6f006cfe0 arm64/fpsimd: signal: Forbid non-streaming SVE payload on SME-only systems
    1c17db14f2c23 serial: sc16is7xx: refill TX FIFO below trigger using fresh TXLVL
    8f9103651d6ab serial: sc16is7xx: fix TX gap caused by kfifo circular buffer wrap-around
    48e09369839fb serial: vt8500: Fix clock reference leak in vt8500_serial_probe()
    f895ed664cb7a serial: tegra: don't clear the Tx FIFO on an Rx-only reset
    d8233d6b391b4 serial: ma35d1: Fix clock reference leak in ma35d1serial_probe()
    7019a84c23c1f serial: fix TIOCMIWAIT race
    3f151c2e86f5d serial: revert guards in uart_wait_modem_status()
    c3ba14c29d55b serial: 8250_omap: fix wake irq cleared during suspend
    e32440fa536af serial: 8250_bcm7271: fix use-after-free in brcmuart_remove()
    2c8614981d3e6 tty: serial: max3100: shut down timer before freeing port
    94af6cd832e9b tty: abort break signalling on hangup
    c110c6eed54fb tty: serial: qcom_geni_serial: Keep console RX functional after deep idle
    6b7be3b9b8579 tty: port: fix tty_port_tty_vhangup() race
    7021acc84c2e0 tty: tty_port: restore TTY_IO_ERROR on activation failure
    821050631750e tty: vcc: hold port lock when clearing tty pointer in vcc_cleanup
    4335278d0e753 tty: vcc: zero-initialize control packet in vcc_send_ctl()
    3551bdf843a1f tty: amiserial: fix broken TIOCMIWAIT
    e8615dfe80cf5 tty: vt: fix memory leak in vc_allocate()
    d16046f1ace26 usb: cdns3: Fix NULL pointer dereference in cdns3_pci_probe
    95160fe606e68 usb: cdns3: fix use-after-free in cdns3_gadget_exit()
    072535f26dc5c usb: typec: ucsi: displayport: Current CAM OOB index fixup
    f5ed186d0cf38 usb: typec: ucsi: Get the connector fwnode based on reg value
    41934f92e7a54 usb: typec: ucsi: glink: fix use-after-free of ucsi on remove
    75dc6cb377efd usb: typec: tipd: fix uninitialized typec_partner_desc in cd321x_update_work()
    282be6ae8be79 usb: typec: tipd: fix uninitialized typec_partner_desc in tps6598x_connect()
    30dbaf3c6696b usb: typec: tipd: don't send GAID when probe fails in APP mode
    b2ed8643face2 usb: typec: tcpm: recover after failure to start the frs ams
    4333174ea52c8 USB: dwc2: shut down wakeup timer before freeing HCD state
    1da16c46b8d71 usb: core: clear both ep_in and ep_out for non-ep0 control endpoints
    bd89c4f42f564 usb: chipidea: tegra: disable runtime PM on resume failure
    7811d8e26c77f usb: gadget: f_fs: Fix NULL pointer dereference in FUNCTIONFS_ENDPOINT_DESC
    5298c96bf0068 USB: gadget: dummy-hcd: Fix wait for outstanding request completions
    474e9e1852fb5 usb: gadget: aspeed-vhub: cancel wake work on device removal
    9f0321e8e9afb usb: dwc3: am62: Fix runtime PM usage count leak on probe error path
    7b5ed2d30ccc6 usb: typec: port-mapper: Only match USB4 port if host interface is available
    50a92c02551c1 usb: typec: anx7411 - stop the IRQ before destroying the workqueue
    8c611876c002d usb: gadget: f_uac1_legacy: validate bRequest index in generic_{set,get}_cmd
    87f2185423e01 usb: gadget: midi2: Fix the jack descriptor array sizes
    772149e7badba usb: ohci-st: disable controller wakeup on removal
    ec69932b45585 usb: ohci-spear: disable controller wakeup on removal
    dc1b196ad5956 usb: ohci-s3c2410: disable controller wakeup on removal
    83e8bd42bd17b usb: ohci-da8xx: disable controller wakeup on cleanup
    a12e803d22551 usb: octeon-hcd: fix the FIFO-flush timeout computation
    e9545dd8bc625 usb: hub: use shorter 120ms post resume hold for SS root hubs
    e2d62928f2666 usb: storage: sierra_ms: reject short SWoC info transfers
    5e8980a81af19 USB: serial: fix port tear down use-after-free
    a0ed07b5bbb2d USB: cdc-acm: skip URB restart in port_shutdown if disconnected
    108af6f585ddc USB: cdc-acm: fix racy TIOCMIWAIT implementation
    9b5b83ca2a668 soc: qcom: geni-se: Correct QUP Core ICC vote constants
    d54df2de22f9a rust_binder: cancel deferred work items in thread exit
    f7fb6c2835ede nitro_enclaves: fix use-after-free on SLOT_ALLOC failure
    c5504e179135d Input: synaptics - limit T440p InterTouch quirk to LEN0036
    fc92d4499f3fa Input: synaptics - add LEN205b entry to smbus_pnp_ids for ThinkPad T490
    95e8d0a7b22fa Input: s6sy761 - fix resume ordering and restore sensing
    d79caaf07875c Input: i8042 - add nomux quirk for Fujitsu LIFEBOOK U7410
    bcfd26841471a Input: atkbd - skip deactivate for Lenovo IdeaPad Slim 3 15IWC11
    0278c68c59b94 kgdboc: Fix tty driver reference leak in configure_kgdboc()
    1299cb3fb0615 binder: fix leaked fd fixups on TF_UPDATE_TXN supersede
    86cdcc87d4ba6 binder: fix is_failure flag for superseded transaction cleanup
    5b113e8ee3268 drm/amdgpu: skip the noirq suspend reset for a switcheroo-parked GPU
    587469076e4ff drm/amdgpu: fix ACP MFD device leak on init failure
    7ca44cb14d024 drm/amdgpu: fix IP instance memory leak on kobject add failure
    b84f1386d84b3 drm/mediatek: Fix pdev reference leak in mtk_drm_bind()
    629458b7e4955 drm/mediatek: Fix ovl adaptor platform device leak
    88f8a92dcb0cb drm/mediatek: Add missing IS_ERR check for ovl_adaptor platform device
    4d12b763c2c55 drm/radeon: Read the VRAM VBIOS signature with readb()
    652f631e2e3a8 drm/amdgpu/gfx6: fix firmware leak on teardown
    36fa4159d0054 drm/amd/pm/si: Fix updating clock limits on AC/DC
    e67aef159f430 drm/amd/pm/si: Check AMD_IS_MOBILITY flag for PPSMC_SYSTEMFLAG_GPIO_DC
    197946faa1b79 drm/amd/display: check dc_state_create_copy() for NULL in dm_suspend
    f3db2853e2a28 PCI: Accept AtomicOps already enabled by the hypervisor
    f3eaf31910087 spi: cs42l43: Workaround for wrong speaker ID on Dell XPS 13 DX13260
    d5a81039adc6a ALSA: ice1712: Fix the error handling via auto-cleanup at probe
    fc34dd95d3baa ALSA: core: Define auto-cleanup for snd_card_free()
    524063fea29f8 perf: Fix race between perf_event_exit_task() and perf_pending_task()
    7648757145aa9 i2c: at91: release DMA channels when probe defers
    efd0d161b0cb7 net: mvneta: clear XDP pfmemalloc flag between frames
    53b21bc2df6e8 ipv6: sr: use skb_get_hash_net() in seg6_make_flowlabel()
    f81d40e2eb695 net/mlx5e: Fix AF_XDP TX timestamp teardown NULL dereference
    9a76ae59fd637 net: sparx5: make ports inherit the switch base mac address type
    e3630ff89b777 of: Put coreboot node after compatibility check
    47c5ac61e6fb6 net: microchip: vcap: stop scanning after deleting key field
    4033e1a9262c5 netfilter: flowtable: generalize pending status bit
    f6143ae109df5 netfilter: bpf: reject invalid NAT manipulation types
    55d033324f67a ipvs: filter some flags received in the backup server
    7151f14d59155 ipvs: do not create invisible templates
    60e9a6e2ba718 ipvs: fix missing counter decrement in lblc
    e5633d81b2daf tcp: refresh TS.Recent for accepted old ACKs
    35c706d6eb196 net: sparx5: skip ptp deinit if init was skipped
    297769d75dc67 net: sparx5: move PTP IRQ handling out of sparx5_start()
    728138dcfc92f net: sparx5: move stats initialization and add deinit function
    387478e9e9861 net: sparx5: move MAC table initialization and add deinit function
    a0a8687eb7878 net: sparx5: move VCAP initialization to probe
    ebb164ae76ad9 net: sparx5: move netdev and notifier block registration to probe
    a01c71ab74ea4 net: phy: qcom: at803x: Fix IPQ5018 short-cable DAC values
    82be3d08de9e1 net: ethernet: mtk_eth_soc: allocate dummy netdev sooner
    2f581814e4e3e net: cap skb->queue_mapping when the tx queue is picked
    2294b62eaec6f net: bcmgenet: fix NULL dereference in set_coalesce before first open
    507c895019a81 net: pcs: rzn1-miic: Clear MIIC protection state before unprotect sequence
    a4b63808f99a5 virtio_blk: set the zone write granularity
    ac4827cf96532 net/sched: sch_codel: match the no-drop threshold to the packet size
    ab6842a1c7bdd net/sched: fq_codel: match the no-drop threshold to the packet size
    e94970076d293 gve: DQO: accept TSO packets with non-protocol gso_type bits
    5069ce898148b net: restrict SO_RESERVE_MEM to TCP sockets and cap max value
    358d5ac5a5d57 net: stmmac: fix rx Scatter-Gather support
    5847b60561a31 net: stmmac: convert priv->sph* to boolean and rename
    f78d45d5f1ac4 net: page_pool: fix use-after-free in page_pool_recycle_ring_bulk()
    f74f100e49588 tipc: prevent GCM nonce reuse on peer key changes
    adad3ff80e50c octeontx2-af: mcs: Fix SC resource cleanup loop
    3a6e67ff267af net/mlx5: Fix slab-out-of-bounds when handling team device events
    8438b4f65a179 net: systemport: Fix RUNT MIB counter register offset calculation
    96d8b26be5bc4 net: systemport: Fix buffer overflow in bcm_sysport_get_stats()
    7f16443a30f4e Bluetooth: hci_sync: don't drain cmd_sync backlog on unregister
    70d2afb554015 netfilter: ipset: do not update comments from kernel-side adds
    e50eaba0b34be ipv6: fix prefix route expiry in modify_prefix_route()
    6598215a1d8e2 net: bcmgenet: allocate RX buffers as page fragments
    ebc9611ab154c net/sched: cls_api: reclaim an empty proto on the error path
    63120572edde8 net/mctp: publish the mctp_dev only after it is initialised
    380acb097059c ARC: arch_cmpxchg_relaxed to use size of pointed type not pointer
    a85823b074f9f arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
    b0fce76873a5e Bluetooth: btintel: validate DDC record lengths
    8ba754621f105 Bluetooth: hci_core: free the HCI ID if naming fails
    790730e4d95de blk-mq: set RQF_USE_SCHED when the operation is known
    2e8f3fdb0825c blk-mq: factor out a helper blk_mq_limit_depth()
    c97ef13ad96be block: reject polled dio with user integrity metadata
    ed389554fe22c ASoC: codecs: rt274: Fix format setting for 44100 rate
    eb04ba7d97809 ASoC: codecs: rt286: Revert delay value for jack setup
    88e96d902efee wifi: mac80211: prevent AP VLAN tx from other interfaces
    227ebe48704be wifi: mac80211: Add 802.3 multicast encapsulation offload support
    9f4e5abe6bf72 wifi: mac80211: Add multicast to unicast support for 802.3 path
    dd7973a4130b0 wifi: cfg80211: preserve hidden-group beacon IE ownership
    cfd70c9b19846 rtc: mpfs: fix unchecked devm_clk_get() error pointer in probe()
    9cff19ddd7f90 rtc: ac100: Fix clock provider use-after-free on probe failure
    00dc50cede967 rtc: dev: zero-initialize struct rtc_wkalrm to prevent information leak
    345ce265cf604 wifi: ath9k_htc: bound TX aggregation to MAX_TX_BUF_SIZE
    e0c21130c1c77 wifi: ath9k: reject short WMI command responses
    9a9467f7cc633 wifi: ath11k: reset ar->num_stations on hardware start
    9338b2dea74cb wifi: mac80211: drop oversized fragments to avoid extra_len overflow
    f9d075fa9fba9 wifi: mac80211: remove RX_DROP
    f41735133943b ASoC: tegra: Fix ASRC Stream6 input threshold control
    71d140099165d wifi: wfx: validate MIB read length before copying to caller
    9091199beced3 ASoC: wm8903: Move the DRC QR threshold to the register that holds it
    b8cbeda043e47 of/overlay: don't create "//" paths for fragments targeting the root
    7a46f1917b320 of/overlay: don't leak fragment references when changeset init fails
    2222a8b7dfeb3 random: fix vgetrandom_opaque_params kernel-doc
    541d61d59f19a nvmet: preserve device path on allocation failure
    f971f1c63cf71 mtd: core: call _get_device() with the master MTD
    4c73c1859fa64 iio: accel: kionix-kx022a: Fix array boundary check
    489e51034910f iio: light: rohm-bu27034: Fix error return
    09a9a2a9548f2 iio: dac: rohm-bd79703: Do not allow writing SCALE
    7899d0530b411 mm/damon/core: don't skip damos_adjust_quota() while esz is not zero
    122b8541f511d random: vDSO: avoid call to memset() when zeroing reserved parameter
    3f75da1e4ee69 ALSA: line6: reject oversized playback packets
    84727facd8506 ALSA: caiaq: unregister the input device when probe fails
    9cec23424c598 wifi: wlcore: Fix runtime PM leak in wlcore_remove()
    ad06f7312d3f6 vt: skip screen update for DEC alignment test on backgroup consoles
    037d7e3ca5c59 vt: selection: Fix unsigned underflow and slab-out-of-bounds read in paste_selection()
    233a2e190b128 vc_screen: reload vc pointer before if (ret) in vcs_write() to avoid UAF
    90c29158159e4 net: dst_metadata: fix false-positive memcpy overflow in tun_dst_unclone
    7d2ff870f0cf1 rds_tcp: close NULL deref window in rds_tcp_set_callbacks
    dc87b56b43c91 mm/huge_memory: initialise workingset state before folio split
    9ebb974773bfa mm: shmem: ignore sysfs configs for shmem forced collapse
    7a1e8daeaa466 virt: vmgenid: set driver_data before registering notification handlers
    0af47cb2575d4 virt: vmgenid: remap memory as decrypted
    258310d59a82e module: fix lost error code from codetag_load_module()
    512eaf01ffabf netfs: zero gaps in read-gaps folio to avoid writing back stale data
    96c46c75b0d47 tpm: Disable TPM on null key name mismatch
    e701345d886e8 sctp: check RCV_SHUTDOWN after the sendmsg connect wait
    e0cabda9b6f4d rtc: spear: initialize IRQ state before requesting alarm IRQ
    160619b387072 rtc: ac100: Assign .num before accessing .hws
    37286a49cc744 r8169: disable EEE on RTL8168h/8111h
    69ca64bbb5288 net/packet: prevent TX_RING byte count overflow
    c5f91098edee9 netfilter: nft_flow_offload: drop flowtable reference on init error path
    ba56d6f9f1a8d net: phy: aquantia: fix system interface type not updated in forced mode
    ed997f875d03d net: fix checksum offsets in skb_splice_from_iter()
    0d1525fdcd335 of/overlay: only treat a positive changeset id as registered
    7dc6a769153c0 of/overlay: put property on deadprops only after changeset add succeeds
    42f6d682e0ab5 of/irq: Fix remaining refcount leaks in of_irq_init()
    f7ea1916e8a80 octeontx2-pf: Fix RSS indirection table size
    6745fa65f4115 kprobes: Skip disarmed probes when checking optkprobe overlap
    c2733ea2c15a1 kasan: unpoison task stack below watermark only in generic mode
    2ebeba4f9e815 io_uring/zcrx: requeue multishot receives stopped by a local resource
    4e9e016c4f498 io_uring/cmd_net: end TX_TIMESTAMP multishot when the CQ is full
    0c19a6c1d25fd HID: multitouch: stop the release timer from being rearmed on remove
    97be6396817bd HID: bpf: cast size to ssize_t when checking hid_bpf_hw_request
    308db93de666a crypto: x86/aes-gcm - fix always true check for last AAD segment
    88633025f20ba audit: fix exe mark UAF in kill_rules()
    745e83328dd69 ALSA: usb-audio: Apply IGNORE_CTL_ERROR quirk to all Audient devices
    224b56b7c02b2 smb: client: close completed creates on compound wait errors
    78e718c5aa146 cifs: Remove the RFC1002 header from smb_hdr
    f09875ff901e9 smb: client: close handle after create-context parsing failure
    080573f419506 smb/client: pass cifs_open_info_data to SMB2_open()
    7bdc4b7d99a82 smb/client: use stack-allocated smb2_file_all_info in smb3_query_mf_symlink()
    605ef5bd74d02 cifs: on replayable errors back-off before replay, not after
    178820984f2cd Bluetooth: btusb: Add IMC Networks QCA9377 to quirks table
    60ba99f910b76 ASoC: sdw_utils: Set snd_soc_dai_link_ch_map.codec_ch_mask for capture
    f44d5d3b7e344 neighbour: Annotate access to neigh_parms fields.
    3b91cdacb16b7 neighbour: Use RCU list helpers for neigh_parms.list writers.
    df057d89e0cc2 RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_has_attr()
    b15c79fca2806 xfs: don't let memory failures leak blocks and kill repairs
    70a7918fda54a smb: client: use finish_no_open() for non-regular inodes
    677aeec9783c8 mm/execmem: make the populate and alloc atomic
    7ad8b185dd7e9 selftests/mm: hugetlb-mremap: add setup of HugeTLB pages
    22e82acec93a6 KVM: arm64: nv: Delay freeing of shadow S2 structures until VM destruction
    81e3f065a6485 KVM: arm64: nv: Fix life cycle of the nested_mmus array
    e18b8236c57fc btrfs: initialize inode mapping flags for cached inodes
    725bd2f3c81d5 Linux 6.18.55
    fa047f2a02500 bpf: Reject key-less BTF for hash maps
    98fd50aaaeb2a rose: don't warn on stray CALL_ACCEPTED/CLEAR_CONFIRMATION in state 3
    5454ea6e22e7d rose: use timer_shutdown_sync() for t0timer teardown
    bcf4c43f797ce rose: guard rose_transmit_link() against a NULL neighbour
    7d10439345e2b rose: keep the route needed for routing loop detection
    6c401ae426e20 sched_ext: Derive SCX_RQ_IN_WAKEUP from the core enqueue flags
    d3c8fb7094c53 hfsplus: avoid double unload_nls() on mount failure
    500c9259f5a66 mm/damon/core: fix unconditionally skip last region
    f6660e9a3e1e6 rust: net: phy: fix off-by-one bit positions in device status accessors
    d50418db3b862 Revert "rust: net: phy: fix off-by-one bit positions in device status accessors"
    c525772c304c9 RISC-V: KVM: Serialize IMSIC attributes with vCPU migration
    5fdc644a4fea4 RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_rw_attr()
    4a04ed9157581 net/sched: act_ct: avoid modifying shared unconfirmed ct entry
    812c16a255e77 net/sched: act_ct: fix helper UAF due to extensions realloc
    9ba16ce8f3faa x86/sev: Make vTPM SVSM calls preemption-safe
    e43d42bd711e7 x86/sev: Remove redundant ghcbs_initialized checks around __sev_{get,put}_ghcb()
    524becfebcd0f x86/sev: Carve out the SVSM code into a separate compilation unit
    b2a9d6ff593b5 x86/sev: Add internal header guards
    1cad4f235e150 x86/sev: Move the internal header
    99607d955be3b perf/x86/intel: Remove incorrect LionCove PEBS data-source constraints
    7ba97aa16778e perf/x86/intel: Update event constraints and cache_extra_regsfor LNL
    edc0309282aab perf/x86/intel: Fix GRT PEBS load/store direction for latency events, to fix sample classification
    51199c793bc05 perf/x86/intel: Update event constraints and cache_extra_regsfor ADL
    24e79508b237d net: ipconfig: bound DHCP option construction
    8fbfa861dfd4f net: ipconfig: Remove outdated comment and indent code block
    bda487567d0b7 net: macb: fix dma_alloc_coherent() leak on macb_alloc() error paths
    aa4845a710ae9 HID: alps: unregister DualPoint Stick input device on remove
    48c5c02bf6fde HID: hid-alps: Use pm_ptr instead of #ifdef CONFIG_PM
    d0f6244f4af44 PCI: Fix BAR resize for devices on a root bus
    85b1112945f21 super: make iterate_supers_type() deletion-safe
    ccf96a4b8626a mm/hugetlb: do not dissolve gigantic pages without runtime support
    2ab4b6815d10e mm/hugetlb: create hstate_is_gigantic_no_runtime helper
    4cef512a955e4 mm/rmap: fix missing barrier between anon_vma init and vma->anon_vma publish
    a56e5bcc43310 mm/rmap: allocate anon_vma_chain objects unlocked when possible
    fcbedba553a9c drm/client: fix restore of partially initialized client
    933145e2bbb4c drm/client: Pass force parameter to client restore
    0589706ace3bd drm/client: Remove holds_console_lock parameter from suspend/resume
    817dd706ee616 drm/amdgpu: Fix acpi device leak in amdgpu_acpi_enumerate_xcc()
    13f299763f6c0 drm/i915/quirks: Limit eDP rate to HBR2 on HP Pavilion Plus 14-ew1
    97e40aa29c10c drm/i915/psr: Disable PSR2 on Xiaomi Book Pro 14 2026 as a quirk
    66f814e8af462 drm/i915/psr: Fixes for Dell XPS DA14260 quirk
    782b5210e89e7 drm/i915/psr: Disable Panel Replay on Dell XPS 14 DA14260 as a quirk
    5815329988acf i2c: qcom-geni: Fix hardcoded clock index in SE_GENI_CLK_SEL
    f42562dd027dc vlan: require the MAC header to be present in __vlan_insert_inner_tag()
    241e67b60308c cgroup/cpuset: Return PERR_NOCPUS in remote_partition_enable() on subpartitions_cpus conflict
    d186e0171c8a4 cgroup/cpuset: Ensure domain isolated CPUs stay in root or isolated partition
    8a64ac9f03fc9 cgroup/cpuset: Move up prstate_housekeeping_conflict() helper
    438bf73ca9775 net: tls: fix silent data drop under pipe back-pressure
    66a2179d02668 xfs: fix cursor and pointer handling when recovering iunlink buckets
    86b17699bd0c2 xfs: fix blockgc group quota scanning when usrquota isn't enforced
    930a9c1c321ef xfs: don't let hidden_space go negative in xfs_metafile_resv_init
    09ebf777ad4e2 xfs: call xfs_dquot_set_prealloc_limits if we installed default rtb limits
    d46492fb8018d xfs: fix wild memcpy access when formatting ondisk rtrefcount btree roots
    543bc5fd7d8ec xfs: fix rtgroup repair estimations
    6aabf4f351cd8 xfs: check di_forkoff correctly in scrub
    f99c672471797 xfs: use the correct reservations for rtrmap/refcount recovery
    adb80d620dabe xfs: don't call xfs_exchange_range_finish for a dry run
    770d21b52c91b xfs: check padding field in xfs_ioc_commit_range
    09b7a63e11c7c xfs: use correct jiffies comparison function in xchk_maybe_relax
    6a65a68097a19 xfs: release orphanage dir inode if chown fails
    ac76f8df55980 xfs: fix attr fork block count checks in xrep_inode_blockcounts
    ef7a56c6630ff xfs: don't assert when XFS_SCRUB_TYPE_HEALTHY scans return corruption
    c2ac475ddd737 smb: client: validate POSIX create context length
    31107f79ad33b smb: client: preserve create-context parsing errors
    abab661eed00f smb: client: clean up failed cached directory opens
    05a7fd80024ff smb: client: fix create context out-of-bounds reads
    8f5b30cc12c40 Bluetooth: RFCOMM: fix NULL dereference of dlc->session in RFCOMM_CONNINFO
    416546cd6a54e Bluetooth: mgmt: fix race in read_unconf_index_list()
    c6a288e6001bc Bluetooth: L2CAP: validate frame length before control and FCS access
    ed4c026cc4094 Bluetooth: ISO: release unused CIS holds after channel attach
    4e49206d9574a Bluetooth: ISO: balance the parent hold in hci_bind_bis()
    173457fa3e99e Bluetooth: hci_sock: reject out-of-range OCF values
    f894f6292d512 Bluetooth: hci_sock: validate event length before filtering
    3ff5a8d949e3a Bluetooth: hci_conn: fix CIS hold ownership on reuse
    57ccaa818307b RISC-V: KVM: Fix HSM hart status error propagation
    5567ce11304db RISC-V: KVM: Propagate interrupted G-stage faults
    ea91f05a55b80 RISC-V: KVM: Synchronize hrtimer callback during teardown
    e5dd2a91a7ae3 KVM: arm64: Transfer the hyp stack pages out of the host stage-2
    970de111c0874 KVM: arm64: nv: Fix null ptr deref on nested wp/unmap, teardown race
    c23ed110d27ba KVM: arm64: Fix spurious warning for benign stage 2 teardown race
    8530a05b304d3 KVM: arm64: Fix AArch32 DBGBXVR<n> handling
    37dfb676fafd1 KVM: SEV: Do cache maintenance on the source VM during intra-host migration
    6aef7cf800098 KVM: SEV: Free have_run_cpus during VM destruction even if VM is no longer SEV
    066a53a0bc19e KVM: Don't treat reserved xarray entries as having memory attributes
    7dcaf0107523f KVM: Ensure memory attributes xarray nodes are accounted to the caller's memcg
    cf441a0db681d s390/vfio-ap: fix KVM GISC and page leak when queue removed from host config
    af295f0eab683 s390/pci: Don't report recovery success on skipped recovery
    eef5c8e1cca6f s390/pci: Report SCLP status on error events when no pdev is associated
    743a8458978d1 s390/pci: Fix missing device lock in zpci_report_status()
    dd5ed64dadb07 s390/pci: Fix leak of struct pci_dev reference in zpci_report_status()
    748ec2f7f5df9 s390/cmf: Fix virtual vs physical address confusion
    c3bbcb32deecc s390/cio: Fix NULL pointer dereference in ccw_device_get_util_str()
    02664a8d8d592 pinctrl: sunxi: keep a shadow copy of the data register output latches
    1deeeca89ea12 pinctrl: single: free the IRQ on domain creation failure
    a23f9f9b56b79 perf/core: Run sched_task() for PMUs with only CPU-wide events
    249a2bd87a0e5 perf/core: Fix NULL pmu_ctx passed to pmu->sched_task()
    5023c70853ad9 parisc: Increase kernel stack size to 32kb
    ee56b5e18f566 scsi: libiscsi_tcp: Check the data direction of a Data-In PDU
    cc444e4ad4346 nfc: trf7970a: power down on startup RX gain failure
    14b1467cfc663 nfc: port100: reject frames whose declared length exceeds the received data
    810f204ef8f61 nfc: llcp: drop truncated I/RR/RNR PDUs in nfc_llcp_recv_hdlc()
    841af260ff477 nfc: fix use-after-free in nfc_get_local_general_bytes
    12cf803edfffe netfilter: nf_tables: skip expired catchall elements on insert and delete
    191239b093969 netfilter: ip6t_rt: fix zero-address non-strict match out-of-bounds read
    eafe081ea77d2 netfilter: ip6t_rpfilter: reject routes without inet6_dev
    8a611f33216f4 net: usb: lan78xx: Fix URB reference leak in lan78xx_submit_deferred_urbs()
    7d2377868feb7 net: usb: cdc_mbim: add MeiG Smart SRM821 to ZLP whitelist
    43ff11501ea6a net: txgbe: fix FDIR filter restore for VF rules
    9447ddd8b9242 net: phy: micrel: Advance register data pointer in write loop
    30ff01b4c7e41 net: ena: fix MMIO read buffer leak on probe failure
    e8a2f48bbff1f net: ena: fix PHC cleanup on probe failure
    ab3c4a4c85f2e net: bridge: mdb: restart port group walk after deletion
    4b7161804d8f3 net: atl1e: fix soft lockup on out-of-range hw_next_to_clean read
    586847400b116 net: atl1c: fix soft lockup on out-of-range tpd_cons read
    5f23080a625dd net: openvswitch: conntrack: fix helper UAF due to extensions realloc
    caefcd433ecb2 net: openvswitch: conntrack: remove 'add_helper' dead code
    e2829ae5459dd net: openvswitch: conntrack: avoid modifying shared unconfirmed ct entry
    729737267e7c1 net: hisilicon: hns_dsaf_mac: fix mdio device leak in hns_mac_register_phy()
    0f573b0576252 net: atl1: fix soft lockup on out-of-range cmb_tpd_next_to_clean read
    ba664d8363864 net: arp: terminate device name before lookup
    aca91d8fa0ecb net: airoha: npu: cancel wdt_work after releasing the WDT IRQ
    968550a439f64 net/sched: reject IDR error pointers when deleting actions
    3803dc8477f08 net/mlx5e: fix swapped IPv6 IPsec policy masks
    0c336ecabaf9d net/mlx5e: advertise MACsec offload only when supported
    99d8dc5166374 net/mlx5: Fix rev_entry reference leak in mlx5_tc_ct_shared_counter_get()
    c3129e6f26e18 HID: wacom: fix OOB read in wacom_wac_pen_serial_enforce()
    5695ec5339d4d HID: quirks: add ALWAYS_POLL quirk for SDINNOVATION gaming keyboard
    925da1d2a2478 HID: alps: fix use-after-free on input2 registration failure
    eda9bcb721f15 packet: use ubuf_info completion for TX_RING packets
    879c911f77b8a PCI: of_property: Omit bus properties without a subordinate bus
    e59cb7eda7c06 mm/damon/vaddr: avoid hw-driven pte updates during damon_hugetlb_mkold()
    850cc4a84b36a mm/hugetlb: preserve mremap address delta when skipping page tables
    b1db1ec5c8941 gpio: tps65219: Fix TPS65214 GPIO direction programming
    ac3c7eb6a44ba gpio: tps65219: Use the variant-specific direction callback
    fabe897e61e45 gpio: tps65219: Fix GPIO input value reads
    f2f1683955b95 drm/virtio: fix NULL pointer dereference on fence allocation failure
    8fa78900fd242 drm/virtio: fix memory leak of fence event on execbuffer failure
    c2d4689c3ea92 drm/xe: Keep walking on SVM eviction failure
    c306b6419fd00 drm/xe: Limit sg segment size to PAGE_SIZE on Xen PV
    2bcbfc5e7bfa9 drm/xe: harden adjust_idledly() against divide-by-zero and overflow
    ba678c2b02e0d drm/xe/vm: nuke PTs only after unlinking contested VMAs
    19f5a5839b308 drm/nouveau: don't bump pin count on failed re-pin in nouveau_bo_pin_locked()
    35151e9a82741 drm/nouveau: RCU-free the scheduler-containing nouveau_sched
    59aa1f8c95941 drm/nouveau: Fix runtime PM leak in nouveau_connector_detect()
    030e93fc91d55 drm/nouveau: Fix gem reference leak in validate_init()
    109a8d2d5b7d2 drm/nouveau: fix double-free in nvif_vmm_dtor
    6d497216c10af drm/nouveau: Fix bridge reference leak in nv1a_ram_new()
    9132215d2c90e drm/nouveau: fix autosuspend cleanup during teardown
    0d29bf51f8ddd drm/nouveau/uvmm: fix UAF in nouveau_uvmm_sm when BO is in TTM_PL_SYSTEM
    c83261854e19a drm/amdgpu: Fix vmid_wait fence leak in amdgpu_ring_init()
    c28e74395ab09 drm/amdgpu: Fix runtime PM leak in amdgpu_debugfs_test_ib_show()
    0bfb0419a1480 drm/amdgpu: Fix last_update fence leak in amdgpu_vm_init()
    d197b15d4beb9 drm/amd/display: Bump frame warning limit for clang builds of dml
    89a11c7efe387 drm/amd/display: Fix dc stream excess put in dm_update_crtc_state()
    fe933dda0bb18 drm/i915/dp_mst: Fix configuring TUs for a disconnected stream
    369f4e3264374 drm/i915/dp_mst: Fix configuring FEC for a disconnected stream
    cc890d3f1b15b drm/i915: fix incorrect RCU teardown order
    bbef7450e2b42 drm/imagination: Fix page count for page table for map() interface
    afe5b4d66d45b drm/imagination: Propagate map failures correctly from pvr_mmu_map_sgl()
    e2ee061626008 rds: ib: Clear the sg list when mapping an MR fails
    e35cb500dd148 mctp: route: iterate socket tag list in mctp_lookup_prealloc_tag()
    e06f8b6e27cc6 llc: reserve device headroom for allocated frames
    58a417a19d801 gpio: zynq: fix runtime PM leak on request error path
    cf3d043582e10 gpio: cdev: fix kernel stack leak to user-space in error path
    a9f738487c11f gpio: arizona: Fix runtime PM leak in arizona_gpio_direction_out()
    6fcfc362344ed ipv6: sr: enforce exact attribute length for SEG6_ATTR_DST
    1d42828565889 ipv6: do not let ipv6_find_hdr() return an offset past the packet end
    599d0498a3931 ipe: protect the dm-verity root hash with RCU
    48f7d0233c3cc ipe: fix use-after-free when auditing a newly loaded policy
    c2a5e59185862 fsl/fman: Fix clk reference leak in read_dts_node()
    fd3bf32279df9 writeback: report a Tasks-RCU quiescent state per cgwb drain pass
    1dccf5dc2f8fe workqueue: Fix NULL current_pwq deref in flush dependency check
    dd4b920672387 writeback: bound cleanup_offline_cgwb() rescans by rotating scanned inodes
    37ec7353f4ac4 fs/ntfs3: use d_instantiate_new() in ntfs_create_inode() and murder syzbot's "WARNING in do_new_mount" saga
    b1229b210ef5a fou: reject omitted FOU_ATTR_IPPROTO on FOU_ENCAP_DIRECT
    2f7042429a8e9 cgroup/pids: Restore pids.events notifications in local mode
    caf8b2d9b30c3 crypto: s390/hmac - Generate intermediate CV for API partial block handling
    7504b677c4370 bpf: fs/xattr: don't assume the inode is locked in path_unlink/path_rmdir
    4d97a141e85a0 bna: prevent IOC timer rearm during teardown
    1603abb0c5042 ata: libata-scsi: bound the ATA passthru sense descriptor writes
    cdccb760be1f1 arm64: errata: match the target implementation CPU's own MIDR
    071f51188a5d8 arm64/boot: Disable trapping of PMZR_EL0 writes to EL2
    6279211e7d245 af_packet: fix integer overflow in prb_calc_retire_blk_tmo()
    ec23855274a73 sctp: discard the rest of the packet on a stale-cookie error
    7ba87509c54cd tcp: prevent collapsing skbs across boundary in rtx queue
    12cc3a1eac5a2 tipc: reject invalid and unexpected GRP_ACK_MSG to prevent bc_ackers underflow
    ca40f4df4ab2f virtio_net: copy zerocopy frags in start_xmit without NAPI
    33da1ff56f955 x86/PCI: Disable enhanced atomics on AMD NBIO 7.7 and 7.11
    f50d2e8cc1f1d x86/mce: Fix hardware debug register corruption on task migration
    a557816c6e38e netfilter: nf_tables: join hook list via splice_list_rcu() in commit phase
    7b32eba3fad84 rculist: add list_splice_rcu() for private lists
    162bf5f73f1b4 mptcp: return sk_wait_data() errors from recvmsg()
    9fe317b999aa8 sched/core: Account PSI IRQ time to the execution context, not the scheduling context
    23250517cd475 perf/core: Fix a refcount leak in attach_perf_ctx_data()
    654fc8445ca8d perf/x86/intel: Make @data a mandatory param for intel_guest_get_msrs()
    0688289753450 perf/x86/intel: Don't pointlessly context switch DS_AREA (and PEBS config) if PEBS is unused
    8cb5a01cb5f12 perf/x86/intel: Don't write PEBS_ENABLED on host<=>guest xfers if CPU has PEBS isolation, to fix stuck PEBS_ENABLED
    c205e3fc9962c perf/x86/intel: Ensure KVM guest PEBS path doesn't set unwanted PERF_GLOBAL_CTRL bits
    4bcb371019097 autofs: fix sbi->pipe file reference leak in autofs_kill_sb()
    c7ee4bea64f55 vlan: ensure sufficient headroom in vlan_dev_hard_header()
    7f8b56c82919c net/sched: sch_teql: fix shadowed err in __teql_resolve()
    15d00994a1bd2 bridge: check llc_mac_hdr_init() return value in br_send_bpdu()
    41dcae82bece9 llc: fix skb UAF and leaks on llc_mac_hdr_init() failure
    2dc3ae3942e15 gve: DQO: reject TSO packets with an out of range MSS
    089e04db44754 gve: fix TX drop when GSO MSS is too small for hw
    feab3880a72b4 gve: DQO: fix header length used by gve_can_send_tso() for UDP GSO
    2f855c52a2e1d gve: add support for UDP GSO for DQO format
    6d4a5ce75b6e3 gve: Enable hw-gro by default if device supported
    adbfc707ff6b9 gve: Advertise NETIF_F_GRO_HW instead of NETIF_F_LRO
    6c7937db1d561 gve: Allow ethtool to configure rx_buf_len
    bcaedb514a5d2 gve: Use extack to log xdp config verification errors
    a0d644b8ff883 gve: Consolidate and persist ethtool ring changes
    5f86408eba31b net: ethernet: stmmac: dwmac-rk: fix bulk clock leak when the PHY clock fails
    d990b786abfd6 tipc: Fix a data race on mon->peer_cnt in mon_timeout()
    3d65a2eb4449f net/smc: fix UAF on lgr list traversal in smcr_port_err()
    8468d05aa08dc nfp: hold IPsec RX state under the XArray lock
    4e7a4af364c20 net: phylink: record the PHY only once bringup cannot fail
    631aa4cb45099 tcp: fix use-after-free of retransmit_skb_hint in tcp_send_synack()
    2357c682f6eaf net: dsa: mt7530: leave the MDIO IRQ mappings to regmap-irq
    62c0e38b2e503 net: dsa: mt7530: fix NULL dereference on unbind of MT7531 and MT7621
    2b42adf3b8ee9 macsec: initialize SecY before registering the netdevice
    dc106fe25e9a8 bonding: crypto offload enabled, non-offload slave failover, rekey failed
    e0560db0ea6e1 drm/imagination: clamp freelist reconstruction requests
    2cc1c3977acbf net: xps: reject an out of range traffic class
    a3c5eb6e382dd vxlan: use one headroom snapshot for neighbour replies
    bdd41b96e8143 ip_gre: Reject enabling collect metadata through changelink
    c3fab2f1d8a6e net: bcmgenet: mask DMA_TIMEOUT_MASK when reading DMA_RING0_TIMEOUT
    d68899b50caf8 net: bcmgenet: validate Ethernet address in bcmgenet_set_mac_addr
    b3ebe8983d86f net: bcmgenet: do not skip WoL power up on GENET V1
    21a0de4858779 net: bcmgenet: initialize u64 stats seq counter for all queues
    aefa837c26674 net: bcmgenet: fix 64-bit RTNL stats reading in ethtool on 32-bit systems
    501baaeca7d12 net: stmmac: clear stale buf->page after recycling on skb build failure
    0f7ed27586acf tg3: use random MAC address when tg3_get_device_address fails
    e40990861074a bpf: Fix BSWAP 32 and 16 on MIPS64
    876ef04c75c27 bpf: Fix immediate JMP JEQ/JNE on MIPS32
    6d76ddce4f1ba vrf: Stop corrupting skb->csum when capturing CHECKSUM_COMPLETE packets
    cfa643f2ca36c net: skbuff: fix pull-bound underflow in skb_checksum_setup_ipv6()
    25bb7c3622522 veth: manage XDP program pointers during channel resize
    63bcc2fee6419 net: bcmgenet: stop Tx NAPI before disabling the queues
    284166f34b8fb net/sched: act_gate: budget the per-entry list in get_fill_size
    e72cbedc4596e nfc: pn533: fix OOB read in pn533_acr122_is_rx_frame_valid()
    8978dff632519 nfc: llcp: fix slab-out-of-bounds reads when logging service names
    f234197f3bda3 nfc: llcp: fix WKS SAP hijacking via prefix match in nfc_llcp_wks_sap()
    2386d107df6d2 nfc: llcp: fix -ENOMEM on connect with zero-length service name
    fdd95e819d828 nfc: st21nfca: validate ISO15693 inventory length
    cbde7f5d32617 nfc: llcp: fix sdreq TLV list leak on parse/alloc/send failure
    0b32dcc8a3f94 nfc: virtual_ncidev: Add missing ioctl compat handler
    27cf04ba4e7ef selftests/nci: Fix out-of-bounds store on thread join
    f9cbe5c68d93a selftests: nci: Fix uninitialized family ID on missing attribute
    da8a077573836 nfc: llcp: Fix race condition in accept_queue lifecycle
    3316903fdc3a3 selftests: nci: Correct pthread_create return value check
    b94cf09720543 nfc: llcp: Fix list corruption / refcount desync in nfc_llcp_recv_dm()
    57919d0662d88 nfc: st21nfca: validate received frame size
    ed2e00bb22c73 nfc: nfcmrvl: validate helper command length before pull
    940b626854de2 bpf: Reject dev-bound-only programs on other devices
    9923e1c537f91 net/sched: fix potential stack infoleak in em_text_dump()
    92c9f2ea634d9 eth: fbnic: Avoid rounding zero ring sizes
    3ea177bdba25f net: stmmac: selftests: Account for alignment shift on dwmac1000 for Jumbo test
    b17959fb4d55f net: stmmac: dwmac4: Use the correct bufzise when the len is exactly 8K
    4c4217aaa5e4b net: stmmac: selftests: Capture all packets for vlan checks
    e7a8bbb6149b4 net: stmmac: selftests: Check the dev->features for S-TAG offload testing
    74da0c1cede8a net: stmmac: selftests: Support running selftests on DSA conduits
    d18cb8fd1b6ba sctp: hold asoc or transport before mod_timer() in timer handlers
    650dcd938e563 net/mlx5: Bridge, don't fail unlink of untracked/unsupported peer ports
    cdeca5de4e186 net/mlx5: Bridge, don't fail switchdev events of sibling eswitch ports
    cea597519b9ca bpf, sockmap: Reject max_entries > INT_MAX in sock_map_alloc
    d95dd5a6c6cd0 bpf: Fix bpf_sock context code generation
    1196903a27cac bpf: Fix bounds check for skb-backed dynptrs
    fb1e2df8e2e28 thermal: gov_step_wise: Fix stale mitigation vote with non-zero lower bounds
    0f5d8953cb63a net: pcs: xpcs: fix clock reference leak on xpcs_init_clks failure
    54e98316ce5c1 genetlink: report the real command id for dump-only ops in policy dumps
    41e444535c60f net: ethernet: ti: netcp: fix pm_runtime usage counter leak on error
    ca9986cc824f2 net: spacemit: clear TX descriptor on fragment mapping failure
    9c6af88fbefbe s390/debug: Fix NULL pointer dereference in debug_info_copy()
    36831afe8eba0 s390/debug: Do not register views for failed static debug areas
    8b661a045082c drm/i915/psr: Clear stale sel fetch enable bits on sel fetch disable
    6515c41503eef tg3: clean up PHYLIB resources on probe failure
    c21daf37d5ce9 udp: remove a disconnected socket from the 4-tuple hash table
    7a0bbe5654ecb udp: relocate a connected socket in the 4-tuple hash table on re-connect
    ed902d5546fb9 ipv6: Fix dst leak for uncached routes.
    6ab6c9d120b30 net: usb: sr9700: include receive overhead in the length check
    e3c21e8b53906 dpll: use exact lookup for reference sync pin id
    649ffc76ed548 ipv6: Prevent rt6_insert_exception() for dying fib6_info.
    ff8cff3aff673 octeontx2-af: Fix memory scaling limitation in SR-IOV mode
    be00deee60044 Bluetooth: RFCOMM: Reject short EA=0 frames in rfcomm_recv_frame()
    8ec5838a35b03 Bluetooth: btintel_pcie: validate device-supplied DMA indices
    8f31031326994 Bluetooth: bnep: fix out-of-bounds reads on short RX/TX frames and control fallthrough
    a8f3a829f3a53 ovpn: reject invalid peer VPN addresses
    7efbc134253c1 ovpn: reject multipeer peers without VPN addresses
    daab972893aec ovpn: reject duplicate peer VPN addresses
    12ee72319805a ovpn: always unhash old VPN addresses before rehashing
    c44a04722f7da ovpn: replace bind when clearing stale local source
    21dbc9f4d0bdd ovpn: replace bind when learning local endpoint
    324ebbde06cd5 ovpn: validate peer state before caching UDP dst
    db97cfe9a5070 ovpn: track UDP socket route key for peer dst cache
    ba3877bdcc9aa ovpn: skip UDP source validation for unspecified addresses
    8c1d7994a18ec ovpn: preserve IPv6 scope id for netlink peer endpoints
    ebffd70e4877b drm/bridge: samsung-dsim: fix TE GPIO lifetime for host attach
    d6b59a9fece4d drm/virtio: sync shmem backing on guest-bound transfers
    e7df00bb036e0 Revert "drm/virtio: Allow importing prime buffers when 3D is enabled"
    5c2cb3dd14477 drm/virtio: release the GEM object on virtio_gpu_vram_create() errors
    81c6769e069d7 drm/virtio: fix object leaks in virtio_gpu_resource_create_blob_ioctl()
    b516446a25bf3 drm/virtio: fix object leak in virtio_gpu_resource_create_ioctl()
    a93dce15dfef2 drm/virtio: fix object leak when drm_gem_handle_create() fails
    0fa25ba50a382 net/sched: sch_hfsc: bound the classify inner-filter walk with a drift budget
    cd12d3e086202 bpf: Check params size before reading reserved fields
    dd9c6f8f05170 net: usb: catc: bound the RX packet length in catc_rx_done()
    9c11e543fec32 bpf: Bound ownership depth through local kptrs and graph roots
    c9338057df102 sctp: avoid livelock while updating retransmit path
    c7a254c16c6fb eth: fbnic: Handle FW mailbox completions flagged with an error
    a85a019b3011a eth fbnic: Add debugfs hooks for firmware mailbox
    6a112552d3055 eth: fbnic: Reuse RX mailbox pages
    8a052cd4b2cae eth: fbnic: Set AW_FLUSH_MODE alongside AW_FLUSH when flushing the mailbox
    c5b5aee41b9f5 eth: fbnic: reset num_napi when the napi vectors are freed
    6c903188b6761 eth: fbnic: Handle maximum standalone channels
    8dc5667770912 ip6_gre: Call ip6erspan_tunnel_unlink_md() in ip6erspan_changelink().
    7254b702e5561 net: ethernet: mtk_eth_soc: unregister net_devices in case of probe failure
    40aeafbcbc7bc net: gue: reject invalid REMCSUM offsets
    00734f3684fce net/sched: act_ct: don't WARN on benign flow_offload_alloc() failure
    ca29834c8c146 drm/nouveau/disp: don't reject HDMI config on cards without SCDC
    40afa1f7a5c77 drm/nouveau/clk: don't clobber reclock status when restoring volt/fan
    0d096a7f7d792 drm/nouveau/clk: fix list cursor use after loop in nvkm_clk_ustate_update
    f2e9005aadb67 ocfs2: make ocfs2_calc_xattr_init() return void
    b17aa4955e3a6 arm64: io: Reject non-user protection in ioremap_prot()
    0994c3e3b4e3e netfilter: ctnetlink: fix suspicious RCU usage in expect_iter_name
    f100578039b31 ipvs: revalidate ihl before icmp_send
    302477c9ffefa netfilter: nft_synproxy: use the family-aware checksum helper
    07a3ec8fdc5a1 netfilter: nfnetlink_queue: hold nfnl mutex in event notifier
    b0ef9450e93f2 netfilter: flowtable: publish HW_DEAD after worker is done
    1363c71be27a7 ipv4: fib: fix data-race and stale genid check around nh->nh_saddr
    5be5ccd3a5563 libbpf: Reject truncated ldimm64 CO-RE relocations
    2d7d04357c41a bpf: Restrict CO-RE poisoning to relocatable instructions
    2fe1569e32ddf net/mlx5: devcom, Base component size on linked devices
    8ebfd34fef750 octeontx2-af: use seq_file for rsrc_alloc debugfs
    6127164efa94e net: pcs: rzn1-miic: Fix config array initialization
    f6696481eedfd net/sched: cls_u32: fix manual hash table handle IDR aliasing
    f4277b19edbc6 eth: fbnic: Fix payload page pool error cleanup
    6e271f093d15d bpf: Skip unsettled links in link iterator
    b5c0cff0c5331 xsk: Use a 32-bit compare in xsk_map_gen_lookup
    e4f3e476cd406 fs: avoid repeated scans in evict_inodes()
    22225cd612b26 s390/cio: Guard PMCW field accesses with dnv check
    5eae708cca8f4 s390/cio: Check pmcw.dnv before pmcw.ena in I/O entry points
    591ba131193ee s390/cio: Fix cio_update_schib() to not cache invalid schib
    8bd9905dfbd97 s390/pci/docs: Fix sriov_numvfs attribute name
    e163f1dccede7 docs: s390/pci: Improve and update PCI documentation
    6675f801b0d60 scsi: megaraid_sas: Protect megasas_get_ctrl_info() in megasas_resume()
    0117e731435bd selftests: cgroup: give the O_TMPFILE open in get_temp_fd() a mode
    2189a219397d8 Bluetooth: mgmt: Dequeue pending mesh_send_sync entries on cancel
    8a36598050cd1 Bluetooth: btnxpuart: Fix skb leak in nxp_process_fw_dump()
    6fdabd654578e Bluetooth: SMP: reject Security Request over BR/EDR
    9c051b12ca106 pinctrl: sunxi: A523: fix voltage withstand encoding
    0af16d8be3ec7 scsi: sd_zbc: Reject disks with too many zones
    0cb85377daaef squashfs: Add dictionary size range check to prevent shift-out-of-bounds
    5d54693bc457c KVM: arm64: Fix FGT mapping for HFGITR_EL2.nGCSEPP
    cb68b5589318f KVM: arm64: Return -EINVAL for an empty SMCCC filter range at base 0
    4efda20408714 KVM: arm64: Derive GUEST_HAS_SVE from the SVE feature bit at EL2
    f126952167146 KVM: arm64: Include VM type when checking VM capabilities in pKVM
    bbcd7e851d57d KVM: arm64: Fix MTE flag initialization for protected VMs
    c142034ad3a84 KVM: arm64: vgic-v3: Fix GICv3 trapping in protected mode
    bd46b41f412fb KVM: arm64: Do not clear VM-wide SVE feature on vCPU init failure
    faf66e55e8749 KVM: arm64: Validate the SVE vector length in pkvm_vcpu_init_sve()
    65bffaf100df8 KVM: arm64: vgic-its: Skip unreachable devices instead of failing the save
    80a6b712dc193 KVM: arm64: vgic-its: Free the caches when GITS_BASER changes
    c2230cd149507 RISC-V: KVM: Fix perf-backed counter accounting across stop and read
    f6f1d27e0c893 RISC-V: KVM: Report snapshot write failure to the guest
    f4363eede3e74 RISC-V: KVM: Preserve firmware counter value across stop/start
    d6de766d8d26d KVM: riscv: Fix NACL hfence entry update order
    5c221f33a5183 HID: bpf: fix __hid_bpf_hw_check_params report length
    5f9e2ecb725ad HID: amd_sfh: Validate PCI BAR size before mapping
    905d1a40f34f7 pinctrl: meson: Fix typo in s4 group name
    b67b4c763f211 bpf, arm64: set up the frame pointer for the exception callback
    ae1ffd04e98be bpf, sockmap: Fix self-redirect copied_seq double-counting
    1d6581b544a88 bpf: Fix UAF due to concurrent consumption of ttrace lists in alloc_bulk
    51a17f0ce19c4 bpf: Register dtor for freeing special fields
    6785313d4fac9 bpf: Fix out-of-bounds read of rtt_min in sock_ops
    44f9bcb5ab2b2 bpf: Avoid soft lockup in __htab_map_lookup_and_delete_batch()
    5ad116c23f149 KVM: x86/pmu: Move Intel PMU global MSRs to intel_is_valid_msr()
    08a4d55b26724 HID: elecom: fix bus type for M-XGL20DLBK
    49688a0d1ac69 HID: multitouch: Add report ID mismatch quirk for ASUS ROG Z13 Folio
    55bbebf2829c3 tcp: Skip cond_resched() in inet_csk_listen_stop() under BPF context
    91a482a81eabd bpf: Fix out-of-bounds read of sk_protocol in bpf_sock_destroy()
    8eb4cd72daad3 bpf: Fix divide-by-zero in btf_struct_walk()
    5334c609bf927 selftests/ftrace: Fix unique symbol check in kprobe_non_uniq_symbol.tc
    37b18688cd18f bpf: Disallow bpf_skb_pull_data() for LWT_SEG6LOCAL
    69fe51a3bd78d bpf: Fix bpf_skb_change_tail wrt csum partial skbs
    04bb5b2eb9f1d s390/uv: Prevent potential out-of-bounds read
    018e137ac1da2 s390/uv: Fix loop condition in uv_find_secrets
    a379ac504fcb8 KVM: s390: Fix IRQ injection with SIGP Stop and Store Status
    7c7a6ba6128f2 remoteproc: qcom_q6v5_adsp: Fix iommu_unmap() usage
    50d844aead62c ALSA: hda/realtek: Add StarFighter HDA SSID
    56b321df2863d ALSA: hda/realtek: Limit Star Labs internal mic boost
    2945d3eb73d61 drm/amd/display: Atomize IRQ register read/modify/write ops
    d1079deec828d erofs: fix large folio race in erofs_fscache_req_complete
    14ae74db795ab xfs: don't stash removename operations with unknown ftype

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index ac97f340da..9690d312b8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "64ebedd888ed53620df352f568a8b55c5620d169"
-SRCREV_meta ?= "b505aeae4f62715ec4801e292b32ad68593b3341"
+SRCREV_machine ?= "f87ce4ad0a7f6290a8fd961a63fd1653c7308a14"
+SRCREV_meta ?= "5978c5f530b91cfb62213506ee6f157897432ba3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.54"
+LINUX_VERSION ?= "6.18.57"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 4cbcfc0084..939ca9c5b8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.54"
+LINUX_VERSION ?= "6.18.57"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
-SRCREV_meta ?= "b505aeae4f62715ec4801e292b32ad68593b3341"
+SRCREV_machine ?= "cbba43337e083c0ace9a6cf998850eb1d3f4a0b0"
+SRCREV_meta ?= "5978c5f530b91cfb62213506ee6f157897432ba3"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 95cae43557..ce4878d0f2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "f271f5b5cce5f2c67c00ccb5b4bf60502d4ddc0b"
-SRCREV_machine:qemuarm64 ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
-SRCREV_machine:qemuloongarch64 ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
+SRCREV_machine:qemuarm ?= "3881e81dea81f6aea84ea28b22899708f3fef903"
+SRCREV_machine:qemuarm64 ?= "cbba43337e083c0ace9a6cf998850eb1d3f4a0b0"
+SRCREV_machine:qemuloongarch64 ?= "cbba43337e083c0ace9a6cf998850eb1d3f4a0b0"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
-SRCREV_machine:qemuriscv64 ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
-SRCREV_machine:qemuriscv32 ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
-SRCREV_machine:qemux86 ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
-SRCREV_machine:qemux86-64 ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
+SRCREV_machine:qemuppc ?= "cbba43337e083c0ace9a6cf998850eb1d3f4a0b0"
+SRCREV_machine:qemuriscv64 ?= "cbba43337e083c0ace9a6cf998850eb1d3f4a0b0"
+SRCREV_machine:qemuriscv32 ?= "cbba43337e083c0ace9a6cf998850eb1d3f4a0b0"
+SRCREV_machine:qemux86 ?= "cbba43337e083c0ace9a6cf998850eb1d3f4a0b0"
+SRCREV_machine:qemux86-64 ?= "cbba43337e083c0ace9a6cf998850eb1d3f4a0b0"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
-SRCREV_meta ?= "b505aeae4f62715ec4801e292b32ad68593b3341"
+SRCREV_machine ?= "cbba43337e083c0ace9a6cf998850eb1d3f4a0b0"
+SRCREV_meta ?= "5978c5f530b91cfb62213506ee6f157897432ba3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "1b357ecb321392158d507b04672ffee57bfa071d"
+SRCREV_machine:class-devupstream ?= "2ff600d29ee478d0a8d46ef8a58afb5e038fe692"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.54"
+LINUX_VERSION ?= "6.18.57"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0

