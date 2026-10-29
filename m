Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4362.1793244339666681351
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 20:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YYJ5JBbS;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c6ce60697so23571126d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 20:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793244338; x=1793849138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mIWcIxzNJj0Kmm+vqW1OSxdcmcSXDcQYbhm3J6/wT5o=;
        b=YYJ5JBbSLHcqx1dN84yCSjWo/RS6URzGmBDdtXcBZMutJAsifdNEz0qr2FHDRkVh2g
         n4Rp7jqwOlHnrHBQOA0oqh1pvEyG32mjkZ2yQKK5auSJBAVUg0QtBi3Mv09WhUZswRlx
         67+JiHjs8AfZ1IHWnZnyYdjSRPv8IQuzrOarXroSrDefPIAqV26U5uDKL2P9uG+S8XMI
         dx4Xr3Q2W74O1wUVtEd83lFzDmv1ckVwmfzqIBVP7lTKPghlKOnEiUA50x/DX3vLjqoW
         mi3pCKjJMAGYIaX/O2QcnJJZ+hmDl8KaEYPdLr8IQ8IrZwLF46L+zjip01+FV+ZyHYoR
         0ARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244338; x=1793849138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mIWcIxzNJj0Kmm+vqW1OSxdcmcSXDcQYbhm3J6/wT5o=;
        b=A3BSXSH6y3Tw5K39y7LfK9UiBIz5xzINUflNXnaKFJJ3hEzSJdSKz5pajLk4D/Eg5I
         RKsgeD199I5rjH45fXY7rDnX08uSjHCObKwdA2/19XEHzJMA4z/nxJpCbB4272I7JBpv
         KmG1wDcMLSo0pPSTkjFsJY+5ZFLtASD0I8V8PXjdfVQuVokTiX9GE2duvSf/NDpXFrNT
         QbdluozRcKKL52NW0DcEyhXkdv6l0Dia+zzn46uHZTIuk2aNs+C76c87yq9dA4AKXbQE
         QU34LC7P1+uN0QKvDSc7vzb687Cj2x+RjoEiHqIqrv13FEmx5cJmZt9GzvEBfaES7pez
         uETg==
X-Gm-Message-State: AFq9FYLRqLjNV6K3ZpzTzbkryiZVC2Fkso5jiJ2UUCNUS+HyFmnegXA9
	E6Qb0hTfb6mdfdhhuJx3LUZad/H8MneDoZUv0CiZQMC14oa8nOxId7PzvX1jOqEX
X-Gm-Gg: AYBFou2S2YXSKoB32mT68rAXMpEcihxxfrjtSVOIvM1AUoE5KDppWIrewPH9P0JnMm3
	IGNVJRElqRLxN2iTTjJEyZMzB5ulDtC8QcaB7TQgiZ3/8AUQM5INlNGepVsjLqFB8wn3cIJRoby
	KIoybD9ayV/4pMroWlH7FfZOeYXuQY8moBealxaqotwAs7V1fEQx8KXt81bBBNM0IdAeuDIlrxg
	rWc9OtA8rebfR/zdoL0sWIZZ2ujXMsQptreO1C/wj+LgXEwKPJqWxp4tIt8BdcEP9BLHkPh3wad
	1QHiDQ5Odf37m+w71SEkkG+6tiJY1+F47Mh0ocJ2Hink3OV1dpG335nitgsHrxro//TMhIPbhVz
	CSB7tkn8u9cWzsuZZGzqCCeFnteqdeZNZeFnRSAmSr+/4SaE/b9Xr3g+BDYbfuuf2d951hBC4oq
	bsJZZTlFh8MOS3tEbyB3VXAEq6CehlDwVzSuW4bsmdBBDD58GPt7zm486+VKhcDB49d4xyfbiiD
	nJ+/+Xf7jam1md86zO5fPnUKMa+cFzmHL8xB62MZUfM1akxDUKb9cVAksqg7UpgJG1v7iOUpUVg
	+19rHmiB4+PFn2pVXuII9WDkT0zJOT7a4BJrGDZvbrihX0JqBwANa+v0+JzonlKzxeyClxKvhbR
	J/FB3gPEOry9sJvAPb0Z29TT1nf5yWHClkytKJtFD4vbR9k5100Tm/EmgvKaCjnjvFjPbqLApXc
	TbpEu9UlRzsAMH5OgSwTDwNNzWYM/dBSGEcvuHZWdA0had2g==
X-Received: by 2002:a05:6214:48d:b0:91b:5d39:e130 with SMTP id 6a1803df08f44-91c7d247597mr73832456d6.57.1793244337456;
        Wed, 28 Oct 2026 20:25:37 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47bda586sm147529056d6.8.2026.10.28.20.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:25:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 04/11] linux-yocto/7.2: update to v7.2.11
Date: Wed, 28 Oct 2026 23:25:19 -0400
Message-ID: <20261029032527.3150782-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029032527.3150782-1-bruce.ashfield@gmail.com>
References: <20261029032527.3150782-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 03:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248861
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/7.2 to the latest korg -stable release that comprises
the following commits:

    a2de78ee6ed8b Linux 7.2.11
    6c714d6691515 HID: steam: Clean up locking
    c06cf54fe99b8 HID: steam: Refactor registration
    b5ea938ff7763 HID: steam: Rearrange teardown sequence
    7511a6696ba17 HID: steam: Fully unregister controller when hidraw is opened
    2f807570bc045 mm/mremap: fix locked_vm leak from MREMAP_DONTUNMAP self-merge
    1f62b83e94338 io_uring/kbuf: don't charge provided buffer rings to RLIMIT_MEMLOCK
    061c25b5e45d8 io_uring: do not charge the SQ/CQ rings to RLIMIT_MEMLOCK
    0879e115d2e89 io_uring/memmap: account the pages a compound region really uses
    9d7715bf742b8 drm/amd/display: Don't replace a sink mode that shares the native totals
    85653fed87b3f sched_ext: Call ops.dequeue() when a task arrives on a remote local DSQ
    db83b53b580ae sched_ext: Generate qseq from a per-task counter
    bf8940f1c0eb3 drm/vc4: Fix binner slot allocation failing on an idle GPU
    e81402c3d4204 drm/vc4: Disable the V3D interrupt across runtime suspend
    9907db2b8e7ba vsock: Fix memory leak in vmci_transport_recv_dgram_cb()
    6b8897ba0733f net: openvswitch: validate transport header presence in set_ipv6_addr
    59abc1b61026e ptp: ocp: fix PCIe delay estimation calculation
    b1dadf6847bee net/packet: call packet_parse_headers after virtio_net_hdr_to_skb
    4eaf1285b5c1e mlxsw: spectrum_flower: Fix port range register leak in tmplt_create()
    b8171b764a4af net/mlx5e: Order ICOSQ cc update after CQ doorbell
    9d136b7ce24e7 veth: fix peer NETDEV_XDP_ACT_NDO_XMIT after GRO is toggled while down
    784356aa88b82 drm/imagination: Fix reference and vm_bo handling in remap()
    7363e10ad2448 bareudp: set the inner protocol to the protocol of the packet
    61b43a51a5592 flow_dissector: avoid u16 truncation of hlen in bpf_flow_dissect()
    fabecda2b0c17 bnxt_en: Re-write the BARs following any type of PCIe errors
    de8b85ac09707 bnxt_en: Fix driver init in kdump kernel
    c6d6dfda4a52c bnxt_en: Add bnxt_clear_bars() helper
    89fc70d73f4ac riscv: ptrace: Zero-initialize regset buffers before copyin
    fd6898cdd7a8d riscv: fix NR_CPUS range leaking 64-bit default onto 32-bit builds
    bf7a3ce1d563a ASoC: sdw_utils: Switch CS35L56/57/62/63 to use OT25 DAI
    8962696f8dd20 ASoC: sdw_utils: Add codec info for CS35L62
    2fb6d05f706d7 pfcp: make sure the SEID is linear before reading it
    454593bcd6c4a net: bcmgenet: if UMAC was suspended in SW_RESET, restore it to SW_RESET
    88efb0fe529ce Revert "net/mlx5: E-Switch, preserve max tx speed on vport state modification"
    6260143fcc2cf net/sched: cls_route: reject change with no routing attribute
    dc2e787b5fb47 devlink: fix devlink_rel reference leak when notify work is pending
    21cbe0b3a30e5 net: sparx5: start the TOD counters on non-PTP lan969x variants
    5f4dfdf007773 net: always dissect GSO packets in __virtio_net_hdr_to_skb()
    52efce4755a4b flow_dissector: avoid u16 truncation of skb->len when computing thoff
    34a84a76d7837 cgroup/cpuset: Call is_in_v2_mode() after acquiring cpuset_mutex in cpuset_handle_hotplug()
    c1a1338fe01ef spi: sg2044-nor: Honor SPI clock limits
    25bb46843d20c spi: sg2044-nor: Return transfer errors
    a728c12f8bd89 ASoC: samsung: i2s: enable op_clk in probe to balance runtime PM
    eca70d840cbe5 ASoC: adau1372: fix invalid default state of output ASRC and DAC muxes
    65cd0e21746b8 ASoC: adau1372: allow sleepy powerdown GPIOs
    aa5cb877716ba Revert "wifi: ath12k: add panic handler"
    9d40dbf8d45e3 drm/xe/sysctrl: Fix mailbox header handling
    b21596ace95fc wifi: mt76: mt792x: pick the SAR table layout from the table itself
    9208b32b10826 wifi: mt76: mt792x: treat 0xff ACPI SAR entries as no limit
    b07c47a189f7a wifi: mt76: mt7925: don't put the band auto marker in TGID
    7199ee4b47de0 wifi: mt76: mt7915: disable rx napi when removing device
    75b3051db5332 wifi: mt76: mt7996: fix struct mt7996_mcu_wed_rro_ba_delete_event layout
    5ac236af9e036 wifi: mt76: mt7925: restore the legacy BSS after MLO teardown
    eb6d2f82d01ff wifi: mt76: use ALTX queue for packets to disassociated stations
    e0f2ae4a75394 wifi: mt76: account non-AQL frames per peer rather than per link
    2ee38971c0902 wifi: mt76: add PS buffering support for HW-managed TIM drivers
    ee50d5027dba5 wifi: mac80211: add ieee80211_txq_aql_pending()
    b17568ba7ee64 wifi: mac80211: add AQL support for multicast packets
    d9fc220b9b411 wifi: mt76: mt7996: take over connection monitoring
    3c26759269fd4 scsi: ufs: mediatek: Handle mPHY power-on failures
    c428a7f1ea01e Revert "net: stmmac: propagate PTP addend and system time programming errors"
    e2be0d537c158 riscv: vector: Fix output operands in context save
    e1a0f618f986f riscv: vector: Fix data pointer constraints in context save/restore
    50a84d34700d0 net: airoha: Add retry mechanism to airoha_qdma_set_trtcm_param()
    d10437cf17800 net: stmmac: Disable S-Tag processing on dwmac4
    83846f0e0bb41 net: stmmac: Do not advertise S-VLAN stripping when it is disabled
    27747cc19f40e net/mlx5: Lag, split aggregate speed into oper and max helpers
    1365f994de94e net: make dev_xdp_sb_prog_count() see programs attached through a link
    75e2ecc1e9dda drm/xe: Do not emit Wa_16010904313 twice
    7e1a34f648bc7 drm/xe/mmio: Fix xe_mmio_wait32() to honor delay/sleep maximums
    607a6d0be341f btrfs: fix lost error return value in btrfs_listxattr()
    c1803697a60f2 btrfs: fix xattr replace when multiple xattrs are packed in the same item
    4d9c1e0a7fb2c btrfs: don't stash io_uring encoded data across -EAGAIN
    ada1fc725a4db btrfs: unlock inode and extent in caller when io_uring read extent fails
    578ef51714242 btrfs: free iov when btrfs_uring_read_extent() fails
    a449433b0e3d4 btrfs: always return -EIOCBQUEUED after btrfs_uring_read_extent_endio
    a7d6c89f51fd0 zloop: zero out only the unread tail of short reads
    4b572dcb2ad38 spi: spi-nxp-fspi: exit stop mode before waiting for DLL lock
    17aa3eb1fc09f arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
    73bf0f9579633 nvmet: use the local P2P device on metadata allocation failure
    4e01c6e28f1ad nvmet: return Invalid Field for invalid NSIDs feature 82h
    f94ab1fffd009 ice: Restore Ordered MMIO Writes for Tx Doorbells
    bba6b1b086f9f bonding: fix the program leak when XDP is replaced
    5537e902da640 tee: optee: ffa: support shared memory offsets on large-page kernels
    5d3bd67674c86 net: stmmac: propagate PTP addend and system time programming errors
    a9f81c99a0f47 wifi: mt76: mt7996: program a link again if the driver holds it
    bea736a2b8c6d cxgb4/ch_ktls: disable softirqs around tid_list erases
    865eb579b33dc lib/dim: fix 32-bit overflow in dim_calc_stats() rates
    e7ea63b4195a1 amt: send the relay's General Query directly from the receive path
    b627c6ba20be2 net/sched: em_text: reject unterminated algo before autoload
    7ecb0f6be0a74 drm/vc4: Use kvmalloc_objs() for the BO cache size list
    40870a0290cd9 drm/vc4: Free the BO cache size list on teardown
    e281dd69236d3 drm/aspeed: Balance the display clock enable on teardown
    f7ec4dbd2a073 gpio: exar: initialize the ID before registering its cleanup
    d4a6ad9fc6e94 drm/dp: don't mark the AUX backlight enabled when enabling failed
    988bf67a13890 cgroup/cpuset: Don't access cpuset_cgrp_subsys.root in is_in_v2_mode()
    a258d8af2bb88 drm/bridge: Fix unlocked list access in drm_bridge_attach()
    f469d85085410 drm/bridge: Fix unlocked list_del in drm_bridge_add()
    dcf617c90ea69 Bluetooth: btintel_pcie: Add shared HW reset for clean start
    2669567615215 Bluetooth: btintel_pcie: fix TX descriptor bounds check
    ab664eb1ce6e4 scsi: ufs: core: Hold a clock reference across the probe
    24d098f915234 fs: don't let a migrating task hide its reference from do_umount()
    c141e6c5d2a8f mount: refuse MOVE_MOUNT_SET_GROUP on an unbindable mount
    a010ae1a9afca iommu/dma: skip swiotlb bounce for DMA_ATTR_MMIO in iommu_dma_map_phys
    8f86e3a595af0 arm64: dts: lx2160a: fix the iic5 spi3 pinmux offset and value
    a3f8afd546789 arm64: dts: lx2160a: fix IIC1 pinmux submask rejected by pinctrl-single
    9b4a665e53000 arm64: dts: lx2160a: fix incorrect pinmux
    c86077791d779 clk: qcom: gpucc-kaanapali: Mark the GPU CX GDSC as votable
    43fd38cf1441f clk: qcom: gpucc-glymur: Mark the GPU CX GDSC as votable
    836b36b0b2745 clk: qcom: gcc-kaanapali: Fix always-enabling PCIE_RSCC clocks
    4751652e44f41 clk: qcom: gcc-eliza: Fix always-enabling PCIE_RSCC clocks
    952b5c99a840c xfs: fix exchange-range-to-eof file size exchange
    4756c94260e69 xfs: stop exchanging reflink flags when exchanging mappings
    f1f0c24ca701d namespace: keep the lock on a mount that a propagated copy is moved beneath
    6ab37fae14196 namespace: handle mount locking for automounts correctly
    d23265a12e499 namespace: never expire a locked mount
    2d498080c02d1 nullfs: don't update the access time
    776e20e4fdc23 namespace: refuse an automount below a mount that is in no namespace
    aaabd31085506 fcntl: refuse F_SET_RW_HINT on an immutable inode
    b43ff2deef482 namei: don't reveal overmounted entries in refwalk
    8300de4aa5d09 namespace: unhash a dentry before detaching the mounts on it
    00287afa7cd98 namespace: don't let a pseudo dentry become the root of a mount
    56fe03a0c05db unshare: don't drop active namespace references that were never taken
    30a1625022411 dcache: don't put a mountpoint on a dentry that's being removed
    3dad2330c8934 namespace: check the mounts before reading their parents in pivot_root()
    9e820a6becdd9 namespace: remove the fsnotify marks of a mount namespace in process context
    5a1310bd90cdc namespace: don't reconfigure internal superblocks via remount and umount
    87ecd4c6da146 namespace: look at the topmost mount for a mount namespace file
    b8a94a405ddcf namespace: keep covered mounts covered in OPEN_TREE_NAMESPACE
    37a82f400efa4 namespace: check a recursive bind mount for mount namespace loops
    18902a23ef36f namespace: check a submount for references right before unmounting it
    702ff3fe49987 namespace: queue a mount only once for mount notifications
    f8fceeef1e1fe namespace: check the target before walking it in do_mount_setattr()
    fc100afdd0630 fs: refuse fspick() on internal superblocks
    8d3527457e183 namespace: don't copy an unmounted mount tree
    5077b52e9e4d7 namespace: don't inherit MNT_UMOUNT in clone_mnt()
    98fc6c7b6ca67 statmount: read the parent of an unmounted mount under mount_lock
    08d575ee89393 namespace: reset the old parent's ->overmount in mnt_change_mountpoint()
    a210ac218c307 fs: don't silently unmount busy mounts
    da408eb521702 mount: keep a copied mount unbindable
    04ee82fec4891 drm/amd/display: disable self-refresh on tearing flips
    ab13a7b90d8b0 drm/amd/display: Fix direct scanout alpha on some DRM_FORMATs
    1fb745806e9be drm/amdgpu/userq: return the memdup_user() error for the user MQD
    8640b3f961d74 drm/amdgpu/userq: only accept doorbell BOs as queue doorbell
    24285f4eb2686 drm/amdgpu: copy debugfs register data outside the GRBM/SRBM locks
    cb4425e1474f0 drm/amdgpu: make Mac FB workaround generic
    f4a0a1ce147d1 drm/amdgpu: serialize vblank counter reads against GPU reset
    68b9a10821cc2 drm/amdkfd: fix dma_buf reference leak in get_dmabuf_info
    b8809ff3c3846 drm/amdkfd: align SDMA doorbell base for shader doorbell writes
    d7cd43c2f5461 drm/bridge: th1520-dw-hdmi: Fix remove() callback
    7642255eed9a0 drm/bridge: th1520-dw-hdmi: Fix error check on dw_hdmi_probe() return value
    b3eaff982839e drm/xe: Fix stale pinned_link entry when fb-pin performs the final unpin
    ab39bc55cf082 drm/xe: Fix shrinker accounting double-subtraction on nested external pins
    175d654cd4832 drm/xe/i2c: cancel the client work on remove
    fcb137f6e7ed7 drm/vmwgfx: validate pitch coming from userspace
    981eb78f7fa44 drm/vc4: Fix firmware reference leak in vc4_drm_bind()
    ade226dfd28cf drm/vc4: drain the hangcheck timer and works on V3D unbind
    9be126be5f78b drm/panthor: validate userspace queue count against initialized firmware slot count
    7f73da0facf86 drm/imagination: Size page table preallocation by device address
    49d349c42cf5e drm/i915/gt: Unmask interrupts only when ACTIVE is true
    72d5cbb10d491 drm/i915/gem: Prevent overstepping exec array boundary
    ad3cf897bd6b1 drm/gud: don't keep a connector without a CRTC as connector_state
    d510ed2738541 drm/fb-helper: defer setup when fbdev_probe() fails, not just on -EAGAIN
    d0aef0b037467 Bluetooth: RFCOMM: Fix NULL tty_dev dereference in rfcomm_dev_shutdown
    f492de11b3254 Bluetooth: RFCOMM: connect the session socket without rfcomm_mutex
    b8814161b14c6 Bluetooth: RFCOMM: free the skb when the DLC has no owner
    8a98d58f6cfe7 Bluetooth: SCO: serialise sco_conn lifetime against sco_recv_scodata()
    07976405a3c71 Bluetooth: MGMT: Fix status of pending commands flushed on power off
    3728f6b0d5990 Bluetooth: ISO: Serialize concurrent connect calls
    79993e9919a87 Bluetooth: ISO: Reject concurrent BIS listener setup
    762850c203fab Bluetooth: hci_sync: Fix command skb lifetime during scan setup
    e660a22402944 Bluetooth: hci_sock: Serialize dead-device detachment
    3c5d12a2c6f33 Bluetooth: btintel_pcie: use managed IRQ teardown
    8123990c45fec riscv: ptrace: reject CFI regset access when extensions are absent
    f71d6ea3843c8 riscv: patch: fix handling of bpf-jit execmem addresses
    4a62302698c92 riscv: lib: Fix ZBB strnlen wrap-around regression on huge counts
    3a6d3d20ef246 riscv: hwprobe: use _BITULL() rather than BIT() in MIPS vendor uapi header
    8e48d8d51ab37 riscv: futex: untag the user pointer before the atomic access
    958034078c5f6 riscv: fix load_unaligned_zeropad() fixup for RV32
    7fee577a2fa78 riscv: errata: select RISCV_ALTERNATIVE_EARLY for THEAD GHOSTWRITE
    37b4401ee6fa0 riscv: entry: gate shadow call stack reload on sstatus.SPP, not tp
    b84bc3a64d8bf scsi: ufs: core: Decouple CQ sweep from request iterator in MCQ
    96b1ae2c7db19 scsi: ufs: core: Avoid unsafe MMIO reads in ufshcd_mcq_compl_all_cqes_lock()
    991f3527a635a scsi: qedi: Initialize callback state before registration
    1d35a17f1c2ed scsi: ch: Do not keep references to data transfer element devices
    9ff26d26973e2 pmdomain: rockchip: propagate subdomain add errors
    a2f3e21d58f79 pmdomain: rockchip: fix clock leak on domain probe failure
    ca26c42fa30f3 pmdomain: rockchip: don't ignore clock lookup errors on attach
    70db811ddb55d pmdomain: imx8m-blk-ctrl: Serialize power on/off across sibling domains
    f3423b56be122 regulator: tps6594-regulator: Fix n_linear_ranges for TPS65224 BUCK2-4
    a3384ec2516a7 regulator: of: fill in supply names in of_regulator_bulk_get_all()
    ca5d85335a8fa regulator: ltc3676: don't read the write-only HRST and CLIRQ registers
    5cd2354ebfbd3 power: sequencing: pcie-m2: Fix leaking array from of_regulator_bulk_get_all()
    2f7240f0a6fd8 optee: register TEE devices only once fully initialized
    80db24f3c16fd openvswitch: fix soft lockup in the netlink flow dump
    1b472d00b274a nvme: fix swapped ZRASF zone state values for full and read only
    f34b1bcac4581 net: team: free skb when broadcast has no txable port
    bed63353341d2 net: team: stop reusing skb after queue override
    5e5cf3ad7c099 net: xilinx: axienet: Free outstanding DMA buffers on dmaengine stop
    c336fe2a40442 net: usb: ax88179_178a: fix rx frame length for non-last packets
    44efb6d92dd5a net: sparx5: free the matchall entry on destroy
    39d1a6b601831 net: skbuff: don't leave stale bytes in skb_copy_and_csum_bits()
    283caf4406e21 net: dsa: microchip: fix KSZ8765 fiber detection
    7931fb9181421 net: bridge: avoid recursive multicast port cleanup
    c223da71abfae net/smc: protect clcsock lifetime in smc_getname
    00fbf71e74115 net/packet: guard the ll header push in packet_rcv_spkt()
    dbad91a31c482 mmc: sdhci-sprd: disable runtime PM on remove
    edef1355224c0 mmc: mtk-sd: Cancel request timeout work on remove
    56ead289265fe mmc: cavium-thunderx: destroy slot platform devices on remove
    167251cac699f mmc: cavium-octeon: destroy slot platform devices on remove
    301691c32b8ad dm: fix reading free memory in do_resume
    6d8bb768a865b dm-snap: reject the transient exception store for snapshot-merge
    f49cd7820cd0a dm-integrity: fix buffer overflow in inline mode with large tag size
    40ea7dfa8cd5f dm-crypt: reject the lmk IV mode with AEAD ciphers
    df6c704a08bc0 mm: don't schedule deferred kernel page table freeing while booting
    badefd43eca32 mm/mremap: fix locked_vm leak by splitting VMA for MREMAP_DONTUNMAP
    5616da0f92339 memstick: rtsx_usb_ms: complete requests after eject instead of dropping them
    3af81770e2011 memstick: core: wait for request completion before freeing card
    da0b595d8e6e2 KEYS: Fix add_key() race with keyring restriction
    5e6fb00b0c35d keys: finalize persistent keyring timeout after link attempt
    8f27260b989f4 ip6_gre: remove obsolete ERSPAN PMTU update
    596a955d2d01b io_uring/net: populate CONNECT filter fields for 24-byte sockaddr_in6
    f55c240192ded io_uring/register: don't exempt disabled rings from task restrictions
    5e4d20db5179e ice: fix metadata_dst refcount handling on representor teardown
    b98eb58ba2f8f ice: fix use-after-free in dynamic port cleanup
    bca153f1d0754 ibmveth: fix TX LTB and filter unwind on open-fail
    d24fdec1413c6 ibmveth: h_free logical LAN on open-fail after register
    889f763874855 gve: fix XSK buffer leak on error descriptor
    7a7e6bbbf0586 gve: fix XSK buffer leak when rings are stopped
    3d377911ce81f gve: fix napi_disable deadlock when attempting to disable XSK pools
    0bc91eda694a1 iavf: send MAC change request synchronously
    2fd6ecda5d1f4 gpio: xilinx: fix runtime PM leak on request error path
    c0071ee496e12 gpio: mpsse: fix race when arming the IRQ poll worker
    fa84f091a8e7f fsverity: RCU-delay the freeing of struct fsverity_info
    79da5abcac1c8 EDAC/amd64: Mask UMC chip select to the four implemented selects
    31729932c72c3 e1000e: add system to disable K1 list
    fb10c9c606611 selftests/mm: cleanup -Wformat issues in hugetlb-mmap
    c4867092976f6 sctp: copy zeroed stats to user in sctp_getsockopt_pr_streamstatus() when !streamoute
    c997832414f1d selinux: preserve NATIVE_LABELS on already-initialized sb in set_mnt_opts
    36a559b3f40ba selinux: fix data race on AVC latest_notif
    b8d5c678a405e Revert "wifi: libertas: reject short monitor TX frames"
    3c3b308ee6e25 tipc: hold a reference to nodes found by link name
    fb717c536af2a tipc: destroy topsrv workqueues before closing connections
    3aa6f536a95eb tcp: reject net_iov in zerocopy receive mapping hints
    753d4c15d9f85 swiotlb: fix default_swiotlb_limit() for non-growable default pool
    eaa3a29004c06 strparser: make sure __strp_recv isn't running before tearing down the parser
    c2a97703359e2 tee: shm: reject zero-sized allocations in tee_dyn_shm_alloc_helper()
    84e3ea6502b5f xen/netfront: don't leak the skb when xennet_fill_frags() fails
    098d80b04d0fe x86/CPU/AMD: Fix AMD TLBI Erratum #1718
    1a2668682e998 workqueue: Fix NULL current_pwq deref in chained work check
    3bec3d32c2a3a wireguard: noise: reject response consumption after intermediate initiation
    c8b60ba3bc870 wireguard: queueing: preserve tstamp_type when encapsulating packet
    e4ce326b4ce27 wifi: mt76: mt7996: fix uninitialized buf read in mt7996_variant_fem_init()
    19d6fa087dcf2 wifi: mt76: mt7603: initialize global station WCID
    47ca6395a1d91 wifi: brcmfmac: fix P2P device removal race in brcmf_detach()
    dd4b2f88ee517 vsock/virtio: account only unread bytes in read_skb()
    2ae87402e6748 usb: f81604: fix struct f81604_int_data size mismatch
    725b49c689bbb dm ioctl: don't let data_start run past the buffer
    6e49d611a9cfb cipso: adjust cached option offsets when removing CIPSO
    a21c255159bfe cgroup/cpuset: Handle cpu hotplug race in guarantee_active_cpus()
    1c2e571e4caeb can: fix unique skb identifier regression under RPS
    8078375dfd0ba can: dev: init_can_skb(): restore skb header initialization
    a7e5992bc3708 btrfs: scrub: fix local_root reference leak in scrub_print_warning_inode()
    28dd88c4a4c21 ata: libata-scsi: do not lose CHECK CONDITION for failed ATAPI commands
    fda141e41f524 ASoC: amd: yc: Add DMI quirk for Acer Aspire Go 15 (AG15-21P)
    cc5511324044b arm64: irq: exclude the softirq stack switch from KCOV
    c1b708f712f57 ALSA: hda/tas2781: Accept V1 calibration data without CRC
    0919d8dd19f92 ALSA: ctxfi: Fix memory leakage when clearing DAO input mappers
    6c2772fa311fd Input: xpad - add support for Corsair Novablade Pro
    2b0c5671e858e Input: xpad - add support for 8BitDo Pro 2 Wired Controller for Xbox
    2caae9d1977be Input: ati_remote2 - fix type confusion in device attribute handlers
    291fe0bafee78 ipv6: do not warn on route notification size race
    221ef5e1e44a0 ipv4: do not warn on route notification size race
    ad2b3a68b8a7d ipv4: stop route notification sizing when nexthop group shrinks
    b9a30bb7b831e ipv4: stop exception dump when nexthop group shrinks
    f27483f9975b5 ipv4: stop PMTU walk when nexthop group shrinks
    fb0f8dfc5a030 rust_binder: reschedule node refcount update on thread exit
    c3e3346474616 ipv4: validate checksum_start before completing checksum
    8c9b310c958be ipv6: udp: Create exceptions before socket matching
    be4fd05398f2b ipv4: udp: Create exceptions before socket matching
    4446752655c98 ipv6: Fix redirect exception creation for UDP/RAW sockets
    3d73a1164a8c6 net/mlx5e: Prevent stale XSK buffer release on MPWQE refill retry
    655f47477054d net/mlx5e: Prevent stale XSK buffer release on refill retry
    43f830e2bb84b fs: Free any excess xarray nodes in clear_inode()
    5213f65a9667d bnxt_en: fix DMA mapping length for padded small packets
    7b20d05fd38de Linux 7.2.10
    26d4c36d318cf ipv4: free inet_opt and ireq_opt after an RCU grace period
    593ca827e1676 iio: buffer-dmaengine: fix sg entry iteration when building dma_vecs
    e2b721bc30f40 xen/netfront: drop RX packets with a short Ethernet header
    b5c0c7fc55718 net: usb: qmi_wwan: add Quectel EG120K-EA
    4cb916d6060e3 smb: client: only require read lease for size-extending preallocate
    0916566923c98 arm64: errata: Add Cortex-A725 erratum 3821522 workaround
    c1dff02ab4532 arm64: errata: Factor out broken AMU const counter cap
    677d0b51ac1a0 perf: Require kernel access for text poke events
    6e187281f978a perf/core: Check kernel access when kernel callchains are requested
    63501889a8034 drm/amdgpu: reset VI ASIC on MacBookPro14,3
    026b93f7eb799 drm/amdgpu: reset VI ASIC on MacBookPro15,1
    d422a66847a9c drm/amd/display: map PWM brightness through custom backlight curve
    9a7931e847f33 rust: irq: pass RegistrationInner as cookie to request_irq
    719c40d4fb6fe mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages
    44d0619fa4e5a mptcp: fix msk->timer_ival reset
    882d0011c59ff iio: trigger: cancel reenable_work before freeing trigger
    e79dded3084e1 iio: proximity: vl53l0x-i2c: claim direct mode for raw reads
    ecb9bed69f61d iio: proximity: vcnl3020: fix ISR bitmask check in IRQ handler
    ce109a2619ada iio: proximity: sx9324: Correct proximity channel resolution
    e462b47b9637b iio: proximity: pulsedlight: fix iio_device left registered on PM setup failure
    dd5dfd033cc9d iio: proximity: isl29501: Fix return type of isl29501_register_write
    815ae0b73b69a iio: proximity: aw96103: validate firmware data length
    6280d15f08603 iio: pressure: rohm-bm1390: Return error when read fails
    7dbb518f3328e iio: pressure: bmp280: fix out-of-bounds access in sampling frequency lookup
    6a27402a8ff1f iio: light: rohm-bu27034: Fix infinite delay on error
    a1769877ff52a iio: light: gp2ap020a00f: drain irq_work after free_irq
    396b83106f5e7 iio: imu: adis16480: fix unprotected debugfs reads
    f501302ebb9e1 iio: imu: adis16400: fix unprotected debugfs reads
    8d6f98972fe2b iio: health: max30102: fix NULL dereference in interrupt handler
    b05e768420352 iio: gyro: adis16136: fix unprotected debugfs reads
    7e3a09c3a1bcb iio: frequency: admv1013: fix wrong channel field used in admv1013_read_raw()
    6564f394a4a95 iio: frequency: adf4377: Fully initialize clk_init_data and clk_parent_data
    50174e873f897 iio: cdc: ad7150: fix OF matching and publish module aliases
    3a87212b1a09a iio: buffer: Ensure bounce buffer used for unaligned case is zeroed.
    e63188d77e10c iio: buffer: serialize buffer teardown with mode claims
    4aa2f001807cf iio: admv1013: initialize callback mutex before registering notifier
    49ea8a359e362 iio: adc: xilinx-xadc: free IRQ before cancelling the unmask worker on unbind
    4c17cd7cdf9ed iio: adc: sun4i-gpadc-iio: drop underflowing pm_runtime_put() calls
    feae7e0f40d60 iio: adc: sun4i-gpadc-iio: clean up on thermal zone registration failure
    ab4e57adead25 iio: adc: stm32-adc: fix possible division by zero in processed channel
    b92e7e373e8d9 iio: adc: stm32-adc: fix check on internal channel availability
    0695ee7b8febd iio: adc: rohm-bd79124: Fix rising alarm
    bb4a68d3ef19c iio: adc: rohm-bd79124: Fix GPIO mask check
    b2a23b732aaf0 iio: adc: rohm-bd79124: Fix channel initialization
    1a904eb70107f iio: adc: rohm-bd79124: Catch regmap errors at measurement start/stop
    7996557c6b7d3 iio: adc: pac1934: check ACPI label duplication
    efcd55eff289c iio: adc: max1363: sign-extend bipolar differential channel reads
    4d72c397c160b iio: adc: axp288: Add TS bias override for Haier HV103H
    4884f4a5dec83 iio: adc: aspeed: propagate reset deassert errors
    dec6193cef07e iio: adc: adi-axi-adc: Initialize state mutex
    c99350a1ebc6b iio: adc: ade9000: request interrupts after powering the device
    d338af069f086 iio: adc: ade9000: handle Phase C dip events in IRQ1 handler
    7b565e5ac9557 iio: adc: ade9000: fix overlapping scan_index for current and voltage channels
    134aa31a8d4e7 iio: adc: ade9000: fix NULL pointer dereference in clkout registration
    5663c72bf4002 iio: adc: ad_sigma_delta: fix use-after-free on unbind
    e96490d30d040 iio: adc: ad7173: Fix digital filter configuration
    6ca6dcbaa68c5 iio: adc: ad4030: fix invalid oversampling_ratio validation
    28c561b537064 iio: accel: sca3000: fix frequency divider condition check
    aa94a37b5a3e5 iio: accel: kxcjk-1013: reject duplicate event disable
    2ef953f7b54e1 iio: accel: kionix-kx022a: Prevent memory leak and fix state
    d9d23d115610e smb: client: split cifsFileInfo bitfields to avoid shared-byte RMW races
    1b9334c2e0854 smb: client: require stable pages for signed connections
    dc71660f11ef2 smb: client: drain and invalidate before server-side copy/clone
    c33261ffbf525 smb: client: distinguish real EOF from a stale remote_i_size on read
    e8ba21c7e6ef3 smb: client: flush dirty data before zeroing a range
    8f21e4b79507f smb: client: only require read lease for size-extending zero range
    bf84e44ff0ed8 smb: client: flush and commit data before querying allocated ranges
    15bb9f1d3e967 smb: client: discard post-EOF pagecache when extending a file via clone range
    fbbb399f4c7a7 smb: client: discard post-EOF pagecache when extending a file via copy range
    6a8279c98ad28 smb: client: discard post-EOF pagecache when extending a file via zero range
    737a1d2e9642d thunderbolt: Reject oversized XDomain properties responses
    733aba776a5c9 thunderbolt: Disable CL states for the Anker Prime TB5 dock
    2f4cd43faa9d6 thunderbolt: Fix NULL dereference in tb_remove_work()
    2c2fd6a7fd5e1 thunderbolt: Don't access a DP tunnel after its DPRX read was canceled
    7739b02129b22 thunderbolt: Fix domain reference leak when DPRX read is canceled
    cbd2abb85ea32 thunderbolt: Tear down inactive DP tunnels when the domain is stopped
    4cca0a5250ee7 thunderbolt: Mark discovered tunnels as active
    47d60ea801fc3 thunderbolt: Make the DP tunnel activation callback mandatory
    2b5f976119d8f thunderbolt: Hold a router reference for each allocated HopID
    08287212b6220 thunderbolt: Fix KASAN reported use-after-free when request is canceled
    4c4f7cde6a023 USB: serial: option: add Compal EXC-T1 support
    5d34ced50e772 USB: serial: option: add Quectel RG660QB
    83b932375b911 USB: serial: option: add Compal EXM-G1x support
    602a7ea0fb3c3 USB: serial: option: add Quectel EG060W
    63b813fa112f9 USB: serial: option: add support for SIMCom SIM8260C
    7912a95d1345c USB: serial: fix ioctl hangup race
    428d479a0d314 USB: serial: fix driver deregistration order
    380f57cd58e26 USB: serial: fix dynamic id driver deregistration race
    b77880815b9c7 USB: serial: ssu100: fix baud rate overflow
    1600930b81e7a USB: serial: quatech2: fix baud rate overflow
    0917201017b63 USB: serial: cp210x: add Corsair AX1500i Power Supply
    20f939b0c151d wifi: mac80211: handle empty FILS association request payload
    93da3ec938bfd wifi: mac80211: fix mesh fast xmit path deletion UAF
    2d9c5525bbc1a wifi: mac80211: set info->band for 802.3 encap offload frames
    a59eca4557c74 wifi: mac80211: release mesh path quota on failed additions
    79b3ce0d881cd wifi: mac80211: reject invalid 320 MHz CSA bandwidth
    43082d604a993 wifi: mac80211: minstrel_ht: validate fixed rate index
    0878594c5806d wifi: mac80211: keep fallback association elements alive
    5a32409ed34a1 wifi: mac80211: account proxy paths against the mesh path limit
    097460fcdd8ab wifi: mac80211: drain PS delivery work during station teardown
    09b7d5e4f8850 wifi: mac80211: shut down RX BA session timer on teardown
    afd1cdd16a25c wifi: mac80211: keep paired old chanctx alive
    5cc54a000960b wifi: mac80211: count only matching reservations in reserved switch
    89f9d6186dc74 wifi: iwlegacy: 3945: free EEPROM data on remove
    678c8f4ba2856 wifi: cw1200: fix TX padding OOB read leaking heap data to device
    58ddd8e3ed6d3 wifi: cfg80211: fix RTS threshold setting for single-radio PHY
    31c399c94b2e5 KVM: arm64: Use stage-1 leaf size for VM_PFNMAP
    91e28dd8eedb9 KVM: arm64: vgic-its: Fix MOVALL handling of source redistributor
    8b25393d16a5c KVM: arm64: vgic: Take a refcount on IRQs referenced by last_lr_irq
    9ce6c9ebc56a8 KVM: arm64: vgic: Allow last_lr_irq to be NULL when LRs are not overflowing
    af3300b3a6bac KVM: arm64: Apply the fine-grained UNDEFs without FEAT_FGT
    3da3279a44df1 KVM: arm64: Clear HCR_EL2.RW for 32-bit non-protected vCPUs
    8676b29d186fc KVM: SVM: Update control fields on #VMEXIT if and only if VMRUN succeeded
    fd873c3d1b524 KVM: SVM: Preserve TLB control (i.e. pending TLB flush) on failed VMRUN
    55865b3ae0370 KVM: SVM: Use the active VMCB's MSR bitmap when checking if MSR is intercepted
    681e31f03ec92 KVM: x86/mmu: Bail from shadow walks if the root is invalid or a dummy
    de83ff6a4d8f3 KVM: SEV: Do cache maintenance on the source VM *before* clearing SEV state
    0fbc7fec2242d KVM: SEV: Nullify "have run CPUs" mask pointer when freeing it
    1e497e3bdab69 KVM: nVMX: Force MSR bitmap refresh if runtime eVMCS controls are modified
    d1de1703fe36f mtd: spinand: Do not update the QE bit on devices without one
    fc278060f5d6f mtd: spinand: fix zero oobavail when no ECC engine is used
    fc2f651f52039 mtd: spinand: fix NULL pointer dereference with no ECC engine
    ecc0f73dbe83d mtd: spinand: Enable QE on all dies
    d8147cc0c8c2e mtd: spi-nor: core: Fix mutex leak in spi_nor_rww_start_exclusive()
    1ac34039fd394 mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of OOB
    bbd87eca54072 mtd: rawnand: cadence: Initialize IRQ state before requesting IRQ
    a07073946e94b mtd: mtd_intel_dg: reset poll counter for each erase
    21d0f05989bf0 mtd: block2mtd: Fix divide error when erase_size is zero
    23194531595c5 nvmet: copy the hostid into the ctrl before creating PR pc_refs
    472df1d103dbe nvmet: pci-epf: reject too-short SGL segments
    8a9b4c0eef19c nvmet-auth: fix out-of-bounds write in nvmet_auth_challenge()
    02cd0d372b161 nvme-pci: add NVME_QUIRK_DMAPOOL_ALIGN_512 for Micron 4100AT
    e5cdb0c0a51e8 nvme-multipath: fix underflow in ANA log bounds checks
    8b85838c1fdba nvme-multipath: set BLK_FEAT_ZONED only after the zone info is known
    42bb6216b861e tpm: fix off-by-four bounds check in tpm2_get_random()
    f38c57a28ebbd x86/mm: Drop unnecessary PMD page copy when freeing
    b46b2e2de47ca x86/mm: Don't apply va_align to hugetlb mappings on AMD F15h
    9806a748f9ab2 Bluetooth: btintel_pcie: reject oversized TX packets in send_frame()
    b2cb5ea1dc8cf Bluetooth: btintel_pcie: fix plen overflow in btintel_pcie_recv_frame()
    673f707518e8e Bluetooth: btintel: fix buffer over-read in btintel_hw_error()
    a7161730a3ab3 Bluetooth: hci_core: Serialize fragmented ISO packet queueing
    ecdb1c66d8e14 Bluetooth: hci_core: Serialize SCO and ISO scheduling with teardown
    4fda8f0abeea9 Bluetooth: hci_core: Serialize ACL scheduling with channel deletion
    f2e7bd6baf660 Bluetooth: hci_core: Fix inquiry cache timestamps on 64-bit systems
    93a737e4e042f Bluetooth: hci_conn: Lock parent access during enhanced SCO setup
    a642f498f0b08 Bluetooth: hci_sync: Fix inquiry cache use-after-free
    df5162eeb10e6 Bluetooth: Serialize SMP remote OOB data access
    e5aa7fbf7a444 Bluetooth: RFCOMM: Fix initial port reference race
    314a2c63879e0 i2c: xiic: don't clobber msg->len to signal block-read completion
    5d1f0adecdfbe i2c: xiic: preserve PEC byte length in SMBus block read setup
    a68979b6ceb48 EDAC/altera: Fix device node reference leaks in the SDMMC ECC setup
    87364b19b3fe4 EDAC/altera: Fix use-after-free in error paths
    552bb479027e7 EDAC/altera: Fix memory leak on dci allocation failure
    4ec26cb798474 EDAC/altera: Drop __init from ECC setup paths for re-probe safety
    97c1f5b482c31 EDAC/altera: Do not allow driver unbinding
    9f86099af05a4 EDAC/versalnet: Drop remote processor handle refcount on driver removal
    07a97fba1c842 ALSA: hda/realtek: Add micmute LED quirk for Acer Swift SFG16-72
    3e148e498d82f ALSA: hda/realtek: Fix silent speaker on Higole F9B
    25219d1fc75e4 ALSA: hda/realtek: Fix square wave output on ASUS Strix G615LR
    4294fe5704859 ALSA: ua101: reject mismatched capture/playback packet sizes
    702d92f361f65 ALSA: seq: Serialize compat port-info ioctls
    9e3d43a1c6441 ALSA: hda/tegra: Re-enable SDO workaround for Tegra194
    f11336e6d3cd9 ASoC: qcom: lpass-cpu: use DAI table index for playback constraints
    7791ebf56eb4a ASoC: codecs: rt1017-sdca-sdw: fix uninitialized stream_config->type
    f44ba04c7a32b ASoC: codecs: max98363: fix uninitialized stream_config->type
    c374d710a3b76 ASoC: codecs: lpass-wsa-macro: rewrite the interpolator volume after enabling clocks
    4ceb275ce192d arm64: mm: Fix the break-before-make flush range for erratum 2645198
    88c1c611552b2 arm64/fpsimd: signal: Forbid non-streaming SVE payload on SME-only systems
    04a77b14f0b13 serial: sc16is7xx: refill TX FIFO below trigger using fresh TXLVL
    0e0d96bd980d4 serial: sc16is7xx: fix TX gap caused by kfifo circular buffer wrap-around
    16abbcd15adb9 serial: vt8500: Fix clock reference leak in vt8500_serial_probe()
    0c4a277aac263 serial: tegra: don't clear the Tx FIFO on an Rx-only reset
    1b303d383089a serial: ma35d1: Fix clock reference leak in ma35d1serial_probe()
    298b4e3c65d2c serial: fix TIOCMIWAIT race
    cbe4709d4d0c8 serial: revert guards in uart_wait_modem_status()
    54abbb862366d serial: core: fix NULL pointer dereference in serial_core_unregister_port()
    4673adec2c639 serial: 8250_omap: fix wake irq cleared during suspend
    0794ba5332754 serial: 8250_bcm7271: fix use-after-free in brcmuart_remove()
    9acf2e564d3df perf: Replace perf_event_header__init_id with full header init
    247b8f6808763 tty: serial: max3100: shut down timer before freeing port
    dcaf0251f847a tty: fix saved termios reset race
    c8ccd3b2013da tty: abort break signalling on hangup
    ce9fa23576941 tty: serial: qcom_geni_serial: Keep console RX functional after deep idle
    017b18addbe8d tty: port: fix tty_port_tty_vhangup() race
    6388409b711eb tty: tty_port: restore TTY_IO_ERROR on activation failure
    26a885ecfd026 tty: n_gsm: fix missing modem controls after DLCI open in convergence layer type 2
    1a9fb9eaeb69b tty: vcc: hold port lock when clearing tty pointer in vcc_cleanup
    399aa38af1d78 tty: vcc: zero-initialize control packet in vcc_send_ctl()
    7d81a8dc947e5 tty: amiserial: fix broken TIOCMIWAIT
    390b28153a932 tty: vt: fix memory leak in vc_allocate()
    45b606418bae7 usb: cdns3: Fix NULL pointer dereference in cdns3_pci_probe
    159dada48ee2d usb: cdns3: fix use-after-free in cdns3_gadget_exit()
    2c9e8d1527fe3 usb: typec: ucsi: displayport: Current CAM OOB index fixup
    d4fef69d4171f usb: typec: ucsi: Get the connector fwnode based on reg value
    de7b557b25846 usb: typec: ucsi: acpi: Assume UCSI 1.2 on Acer Nitro ANV15-41
    ee8577de01c6b usb: typec: ucsi: glink: fix use-after-free of ucsi on remove
    5414144e202a3 usb: typec: tipd: fix uninitialized typec_partner_desc in cd321x_update_work()
    dac0c073c6ad5 usb: typec: tipd: fix uninitialized typec_partner_desc in tps6598x_connect()
    a2b95607926d5 usb: typec: tipd: don't send GAID when probe fails in APP mode
    d6b0cce612636 usb: typec: tcpm: recover after failure to start the frs ams
    79ba37dd38a32 USB: dwc2: shut down wakeup timer before freeing HCD state
    c50413ecb662e usb: core: clear both ep_in and ep_out for non-ep0 control endpoints
    c0d23c4201bcb usb: chipidea: tegra: disable runtime PM on resume failure
    35ab269602e1f usb: gadget: f_fs: Fix NULL pointer dereference in FUNCTIONFS_ENDPOINT_DESC
    3070806a7bc7b USB: gadget: dummy-hcd: Fix wait for outstanding request completions
    c81504dfd2d93 usb: gadget: aspeed-vhub: cancel wake work on device removal
    f51cadb02b439 usb: dwc3: gadget: fix IRQ storm on invalid event buffer count
    f80ec4a636af5 usb: dwc3: am62: Fix runtime PM usage count leak on probe error path
    5a8809025c43b usb: typec: port-mapper: Only match USB4 port if host interface is available
    cb6bf2c707805 usb: typec: anx7411 - stop the IRQ before destroying the workqueue
    697cfe6e53b66 usb: gadget: f_uac1_legacy: validate bRequest index in generic_{set,get}_cmd
    223c3bd02a582 usb: gadget: midi2: Fix the jack descriptor array sizes
    136bac9724d19 usb: ohci-st: disable controller wakeup on removal
    0f4673de449fe usb: ohci-spear: disable controller wakeup on removal
    af9b5552c80d7 usb: ohci-s3c2410: disable controller wakeup on removal
    523814cea1e33 usb: ohci-da8xx: disable controller wakeup on cleanup
    0cb708e252b8d usb: octeon-hcd: fix the FIFO-flush timeout computation
    d7c4a49b41583 usb: hub: use shorter 120ms post resume hold for SS root hubs
    db9d3be156bac usb: storage: sierra_ms: reject short SWoC info transfers
    e80ee74206f26 USB: serial: fix port tear down use-after-free
    420ca35af891d USB: cdc-acm: skip URB restart in port_shutdown if disconnected
    24e98de44d24b USB: cdc-acm: fix racy TIOCMIWAIT implementation
    0b293e202bfda soc: qcom: geni-se: Correct QUP Core ICC vote constants
    98dc9fababd1b rust_binder: cancel deferred work items in thread exit
    43f78b328f390 nitro_enclaves: fix use-after-free on SLOT_ALLOC failure
    984c35ee7085d Input: synaptics - limit T440p InterTouch quirk to LEN0036
    2449f5c9c8439 Input: synaptics - add LEN205b entry to smbus_pnp_ids for ThinkPad T490
    4cd725b0eaa0b Input: s6sy761 - fix resume ordering and restore sensing
    5042665c52c91 Input: i8042 - add nomux quirk for Fujitsu LIFEBOOK U7410
    35085bb734ead Input: atkbd - skip deactivate for Lenovo IdeaPad Slim 3 15IWC11
    e491fc201d4fb kgdboc: Fix tty driver reference leak in configure_kgdboc()
    52332a61bf47f hrtimer: Use the mask to clear TIF_HRTIMER_REARM from the exit work
    e826e849e00e3 clk: spacemit: k3: add CPU PLL rate tables
    885bbbe52d318 binderfs: fix UAF write in binder_add_device
    6673f4f21e2fd binder: fix leaked fd fixups on TF_UPDATE_TXN supersede
    1ab671b50714a binder: fix is_failure flag for superseded transaction cleanup
    6b28918f2b28c drm/amdgpu: skip the noirq suspend reset for a switcheroo-parked GPU
    abf854513bc19 drm/amdgpu: fix ACP MFD device leak on init failure
    109e0005bd680 drm/amdgpu: drop userq callback assignment for sdma 7.1
    13074da71ad8c drm/amdgpu: implement workaround for sdma dcc corruption
    c05bbcc263d67 drm/amdgpu: fix IP instance memory leak on kobject add failure
    cb3e0244514d1 drm/mediatek: Fix pdev reference leak in mtk_drm_bind()
    8e3a350075b55 drm/mediatek: Fix ovl adaptor platform device leak
    aeef8a8537bcf drm/mediatek: Add missing IS_ERR check for ovl_adaptor platform device
    85d8c3c0ccc1c drm/radeon: Read the VRAM VBIOS signature with readb()
    1c05065255652 drm/i915/vrr: Disable DC balance by default
    67d68622668d6 drm/amdgpu/gmc12: properly pass flush_type to gmc_v12_0_flush_vm_hub()
    7a4e35a054699 drm/amdgpu/gmc12.1: properly pass flush_type to gmc_v12_1_flush_vm_hub()
    4b70c6b34912c drm/amdgpu/gfx6: fix firmware leak on teardown
    7f94a706aa473 drm/amd/pm/si: Fix updating clock limits on AC/DC
    4e0482f7d9d6e drm/amd/pm/si: Check AMD_IS_MOBILITY flag for PPSMC_SYSTEMFLAG_GPIO_DC
    2b383a50e8f63 drm/amd/display: Mark DCE 6.4 as not APU
    8f88350943414 drm/amd/display: Fix stale replay_events after mod_power stream removal
    32059834642c6 drm/amd/display: Fix fast updates on DCE 8.1
    b8cbda33632d2 drm/amd/display: Fix fast updates on DCE 6.x
    7283b78ca07ce drm/amd/display: check dc_state_create_copy() for NULL in dm_suspend
    b1e1884a45639 drm/amd/display: Preserve eDP mode on initial ASSR failure
    daa0437fe5e45 drm/amd/display: guard dc_sink dereferences in MST mode validation
    f7451f59990c4 PCI: Accept AtomicOps already enabled by the hypervisor
    94f41ec5fa578 bpf: Fix missing migration protection in __rhtab_map_lookup_and_delete_batch()
    5d5dc18b3a9ac futex: Fix private hash use-after-free on resize
    fbba0b7a4c9c2 drm/mediatek: Fix runtime PM leak in mtk_hdmi_ddc_v2_probe()
    33d0a5d2fee06 bpf: Fix objects stuck in free_by_rcu_ttrace
    b9818bd1a592d bpf: Factor out __do_call_rcu_ttrace()
    b73c20cd7b870 spi: cs42l43: Workaround for wrong speaker ID on Dell XPS 13 DX13260
    ba6cd9f0b337c ALSA: ice1712: Fix the error handling via auto-cleanup at probe
    f01cfe7e81748 ALSA: core: Define auto-cleanup for snd_card_free()
    81e61e3f8befa perf: Fix race between perf_event_exit_task() and perf_pending_task()
    cee25e14333b6 i2c: at91: release DMA channels when probe defers
    4d6a628c671ca net: mvneta: clear XDP pfmemalloc flag between frames
    086e8acb3a0e5 ipv6: sr: use skb_get_hash_net() in seg6_make_flowlabel()
    63df0ef4c6e31 net/mlx5e: Fix AF_XDP TX timestamp teardown NULL dereference
    b4d6ab56b27d9 net: sparx5: make ports inherit the switch base mac address type
    796f49e745531 of: Put coreboot node after compatibility check
    59cb923a82c38 net: microchip: vcap: stop scanning after deleting key field
    a2cac45848d1c netfilter: flowtable: generalize pending status bit
    58108f05b0502 netfilter: bpf: reject invalid NAT manipulation types
    45a93111835cc ipvs: filter some flags received in the backup server
    ea397f425be14 ipvs: do not create invisible templates
    f9abe0a0befb1 ipvs: fix missing counter decrement in lblc
    07188a3c2baf7 tcp: refresh TS.Recent for accepted old ACKs
    2879b65bfa548 net: sparx5: skip ptp deinit if init was skipped
    8b4a790ef9be3 net: phy: qcom: at803x: Fix IPQ5018 short-cable DAC values
    17eafd74de5a3 net: ethernet: mtk_eth_soc: allocate dummy netdev sooner
    f99de42f5c6f8 net: cap skb->queue_mapping when the tx queue is picked
    d870102b54253 net: bcmgenet: fix NULL dereference in set_coalesce before first open
    a616189d75c74 net: pcs: rzn1-miic: Clear MIIC protection state before unprotect sequence
    f583cfe64bd37 virtio_blk: set the zone write granularity
    c60e775d235b2 ALSA: usb-audio: Apply boot quirk for Behringer models generically
    e2f7470717823 ALSA: usb-audio: Add boot quirk for Behringer CM1A
    269a62e242b84 net/sched: sch_codel: match the no-drop threshold to the packet size
    172dff7703d4a net/sched: fq_codel: match the no-drop threshold to the packet size
    f91817a8d54af gve: DQO: accept TSO packets with non-protocol gso_type bits
    967566ad325b4 bpf: Skip detached progs in trampoline images that are still in use
    40955f6512a03 bpf: Wait for an RCU tasks grace period before freeing trampoline progs
    a467b05b201b5 net: restrict SO_RESERVE_MEM to TCP sockets and cap max value
    dce32bd7d8879 net: ethtool: let tsconfig reach a PHY-only timestamp provider
    e9141fdb7a2ea seg6: ensure packet data is writable before modifying SRH and IPv6 DA
    a7cff44543f66 net: stmmac: fix rx Scatter-Gather support
    0b105f4eb78e5 net: page_pool: fix use-after-free in page_pool_recycle_ring_bulk()
    60e0c2aeaa605 tipc: prevent GCM nonce reuse on peer key changes
    2f21aaec8373f octeontx2-af: mcs: Fix SC resource cleanup loop
    59fbbded05e55 octeontx2-pf: Fix aura BPID assignment when CONFIG_DCB is enabled
    8117cbc504cb0 net/mlx5: Fix slab-out-of-bounds when handling team device events
    df8e7029aea62 net: systemport: Fix RUNT MIB counter register offset calculation
    faba9fdde4803 net: systemport: Fix buffer overflow in bcm_sysport_get_stats()
    d01a52060063b drm/mediatek: mtk_hdmi_v2: fix VID_DOWNSAMPLE_CONFIG register offset
    e8ba8c9c74d10 Bluetooth: hci_sync: don't drain cmd_sync backlog on unregister
    dd6c3da23d54c drm/xe/pf: Keep VF LMEM BAR size low if no VFs enabled
    e7602a7c34ea6 drm/xe/pf: Refactor VF LMEM BAR resize helper function
    6ec39ab6be542 ALSA: hda/realtek - Add headset mode for Dell Pro QC1255
    63e7064b4c1c4 wifi: mac80211: fix slab-out-of-bounds read in ieee80211_monitor_select_queue()
    5ffc2f704d88f netfilter: ipset: do not update comments from kernel-side adds
    0498e7abd9560 ipv6: fix prefix route expiry in modify_prefix_route()
    f4f6340985932 net: bcmgenet: allocate RX buffers as page fragments
    570141625d212 net/sched: cls_api: reclaim an empty proto on the error path
    f37f42e6e039a net/mctp: publish the mctp_dev only after it is initialised
    b506f5699e145 bpf: Hold map BTF for the memory allocator destructor record
    351d1c47e45b2 nvme: fix command effects log lifetime for multipath heads
    45d16ffbc9b65 nvme: work around -Wformat-security warning
    98b09ad793448 nvme: fix cdev lifetime
    3fc78337706a8 nvme: add nvme_get_ns_head()
    9bc8fe8af3797 ARC: arch_cmpxchg_relaxed to use size of pointed type not pointer
    443328237113e bpf: Fix overflow of jump offset in constant blinding
    1107c7e29a0f2 drbd: remove unused drbd_nl_mcgrps[] array
    1f90c62a2412b ASoC: SDCA: Add better pm_runtime error handling in func probe
    1769d8924848d ASoC: SDCA: Set suspended flag after resuming within system suspend
    48eb9ee6f52c6 arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
    46545c86b54ff mm/slab: do not wake up kswapd in __kfree_rcu_sheaf()
    e26322e44c66a mm/slab: handle the !allow_spin case in kfree_rcu_sheaf()
    f3617369fbb30 Bluetooth: btintel: validate DDC record lengths
    4235764580013 Bluetooth: hci_core: free the HCI ID if naming fails
    2c47ebc27fa72 blk-mq: set RQF_USE_SCHED when the operation is known
    dd33c03cefccd block: reject polled dio with user integrity metadata
    64804ed8fad4b ASoC: codecs: rt274: Fix format setting for 44100 rate
    9446cc221e098 ASoC: codecs: rt286: Revert delay value for jack setup
    ad61b9a5febb4 wifi: mac80211: prevent AP VLAN tx from other interfaces
    5f27581c176f8 wifi: cfg80211: preserve hidden-group beacon IE ownership
    b1961a61ab6fb wifi: mac80211: validate TX status rate metadata
    8a03f8422fa08 rtc: mpfs: fix unchecked devm_clk_get() error pointer in probe()
    55ca60ba33663 rtc: ac100: Fix clock provider use-after-free on probe failure
    2838d7bbb5518 rtc: dev: zero-initialize struct rtc_wkalrm to prevent information leak
    e73a619f91b6c wifi: ath9k_htc: bound TX aggregation to MAX_TX_BUF_SIZE
    a3b0137c855a6 wifi: ath9k: reject short WMI command responses
    5fde5e25f5126 wifi: ath9k: Clean up device initialisation guards
    c27779d3679c6 wifi: ath11k: reset ar->num_stations on hardware start
    870b8cb9baa9b wifi: mac80211: drop oversized fragments to avoid extra_len overflow
    f3405fe6e1073 ASoC: tegra: Fix ASRC Stream6 input threshold control
    7acb36fd60a3e wifi: wfx: validate MIB read length before copying to caller
    ce05ab5fb6ec2 ASoC: wm8903: Move the DRC QR threshold to the register that holds it
    4ec22c9b8c0fe of/overlay: don't create "//" paths for fragments targeting the root
    3a23fb158ba51 of/overlay: don't leak fragment references when changeset init fails
    39b9f41496382 random: fix vgetrandom_opaque_params kernel-doc
    9fcf4317384ce blk-cgroup: save IRQ state in blkg_tryget_closest()
    f4274a918bb57 nvmet: preserve device path on allocation failure
    dc482a281a19a mtd: core: call _get_device() with the master MTD
    cecf007418b93 mtd: core: avoid double-free of OTP NVMEM device
    22d377178de28 iio: accel: kionix-kx022a: Fix array boundary check
    43d294b02c88e iio: light: rohm-bu27034: Fix error return
    3781cb06b787e iio: dac: rohm-bd79703: Do not allow writing SCALE
    40554d1221e3d ext4: don't enable large folios on encrypted inodes
    b78748424f29f ALSA: line6: reject oversized playback packets
    1a0a0d881e043 ALSA: ctxfi: Fix silent playback on Titanium HD (SB1270)
    2e5a413cc2a48 ALSA: caiaq: unregister the input device when probe fails
    e45e93538da14 wifi: wlcore: Fix runtime PM leak in wlcore_remove()
    0ee53081425a1 vt: skip screen update for DEC alignment test on backgroup consoles
    619c6d7dd76ff vt: selection: Fix unsigned underflow and slab-out-of-bounds read in paste_selection()
    9dfcadc5e003f vc_screen: reload vc pointer before if (ret) in vcs_write() to avoid UAF
    ebf22e2ac2c8e mm: shmem: ignore sysfs configs for shmem forced collapse
    a0375b5e51d07 mm/vma: predicate setting mmap_prepare VMA fields on new vma alloc
    35104391d566a mm/damon/core: don't skip damos_adjust_quota() while esz is not zero
    8f42954ad8bf9 virt: vmgenid: set driver_data before registering notification handlers
    88752b97fe69b virt: vmgenid: remap memory as decrypted
    bfc721eef5c13 module: fix lost error code from codetag_load_module()
    915be8668c60d netfs: zero the tail of a short DIO/unbuffered read
    2a62fe628a877 netfs: zero gaps in read-gaps folio to avoid writing back stale data
    a7036a73671fc netfs: clear post-EOF pagecache when extending a file via write
    f6599d8830fe7 tpm: Disable TPM on null key name mismatch
    54fd86bb49265 time/jiffies: Saturate in mult_hz() instead of wrapping
    e68ac524e9383 sysctl: Negate before converting in the int read path
    222c41e0f50f1 sctp: check RCV_SHUTDOWN after the sendmsg connect wait
    cb6d6a7fbff04 rtc: spear: initialize IRQ state before requesting alarm IRQ
    ad1bf77039cba rtc: ac100: Assign .num before accessing .hws
    b36052c457079 random: vDSO: avoid call to memset() when zeroing reserved parameter
    c5c096b134450 r8169: disable EEE on RTL8168h/8111h
    2cee3603ec1d9 pfcp: fix socket lifetime on netdevice registration failure
    9fd63d284e251 net/packet: prevent TX_RING byte count overflow
    4cd378423a331 netfilter: nft_flow_offload: drop flowtable reference on init error path
    65812d6a5aee4 net: phy: aquantia: fix system interface type not updated in forced mode
    dd2b3e0a5f968 net: fix checksum offsets in skb_splice_from_iter()
    cabacdf98e09e net: extend IPv6 exthdr detection of tunneled packets
    c949646c900e8 net: gso: limit recursive IP-in-IP segmentation
    c875407c34dad of/overlay: only treat a positive changeset id as registered
    5857035a3b53a of/overlay: put property on deadprops only after changeset add succeeds
    239fa8196b518 of/irq: Fix remaining refcount leaks in of_irq_init()
    b0825e3a52474 octeontx2-pf: Fix RSS indirection table size
    526fac219e8b7 kprobes: Skip disarmed probes when checking optkprobe overlap
    c59b210af84da kasan: unpoison task stack below watermark only in generic mode
    16c83c047ecfa ipvs: bound LBLCR and LBLC cache growth
    395b25968fe85 io_uring: fix task_work add use-after-free with SQPOLL
    5e508d304f2a1 io_uring/zcrx: requeue multishot receives stopped by a local resource
    7cac9ee939e49 io_uring/cmd_net: end TX_TIMESTAMP multishot when the CQ is full
    a0125ca86e405 HID: multitouch: stop the release timer from being rearmed on remove
    f9f808227554b HID: bpf: cast size to ssize_t when checking hid_bpf_hw_request
    dd4a0d4993633 fprobe: Use guard(rcu_sched_notrace) and check rcu_is_watching()
    fa392baf00e66 crypto: x86/aes-gcm - fix always true check for last AAD segment
    f2cc5462b7855 audit: fix exe mark UAF in kill_rules()
    3b0860792282a ALSA: usb-audio: Apply IGNORE_CTL_ERROR quirk to all Audient devices
    0a6d9e67aeaff KVM: x86: Fill kvm_run exit fields in common get_nested_state_pages() error paths
    f7c8620546091 Bluetooth: btusb: Add IMC Networks QCA9377 to quirks table
    ea219e93ca752 ASoC: sdw_utils: Set snd_soc_dai_link_ch_map.codec_ch_mask for capture
    942192dbcd3a0 KVM: x86: Re-pend GET_NESTED_STATE_PAGES if getting said pages fails
    43457bf655004 sched_ext: Wait for SCX_OPSS_DISPATCHING before reenqueueing a task
    fe499ae9da46e sched_ext: Don't run ops.dequeue() with a DSQ lock held
    5f950cfce1ef8 sched_ext: Add a size argument to scx_bpf_cid_topo() so struct scx_cid_topo can grow
    0e1a74369bdbc sched_ext: Build the cid tables privately and publish them with RCU
    08513d9985814 sched/cache: Skip kernel threads for cache aware scheduling to rubustify the code
    9436130e6da72 sched/cache: Introduce task_struct->sched_cache_grp to fix UAF
    d3bb1bfc83f37 sched/cache: Honor migrate_llc_task semantics in active load balance, to fix LLC mis-scheduling bug
    450d1d9e046da sched/cache: Keep nr_pref_llc_running in the runnable domain, to fix LLC mis-scheduling bug
    6f7d978dc7cf4 sched/fair: Avoid creating misfits during cache-aware balancing
    ce4fb8d3e21b8 selftests/cgroup: account for zswap shrinker writeback
    d85a1f2851518 drm/xe/i2c: Keep the i2c controller always enabled
    1044970320007 dm-pcache: bound the logical key offset from persistent memory
    96e2863b1f81e dm-pcache: reject a kset that overruns its segment
    5fce161649b4d Linux 7.2.9
    82339215fc00b i2c: qcom-geni: release DMA channels on probe error
    f0c1fb7e96b3c accel/ivpu: Drop IRQF_ONESHOT to allow IPC IRQ threading on PREEMPT_RT
    bf5266d912c07 KVM: x86: Add static calls for nested virtualization ops
    7f0a727723a0e KVM: x86: Reject nested CAP enablement if nested virtualization is disabled
    ac1dc205accae KVM: move TSS constants from kvm_host.h to tss.h
    42dd578c3c8fb KVM: x86/mmu: Move kvm_mmu_do_page_fault() from mmu_internal.h => mmu.c
    d54c173828ea1 KVM: x86/mmu: Move kvm_arch_async_page_ready() below kvm_tdp_page_fault()
    a0d29482f3ff8 KVM: x86: Move IRQ-related helper declarations from kvm_host.h => irq.h
    5bf1c9175e657 KVM: arm64: nv: Delay freeing of shadow S2 structures until VM destruction
    512c93f4461b9 KVM: arm64: nv: Fix life cycle of the nested_mmus array
    b097d9d7a5b09 net/sched: act_ct: avoid modifying shared unconfirmed ct entry
    8988f4d11f3fb net/sched: act_ct: fix helper UAF due to extensions realloc
    9355bf2b26a65 drm/amd/display: Relax DML frame limit with UBSAN
    93664ce254c78 super: make iterate_supers_type() deletion-safe
    e4c644e2ef8eb super: take lock after last reference count
    499f144ae5d1d super: convert s_count to refcount_t s_passive
    139efdb3ee6e4 i2c: qcom-geni: Fix hardcoded clock index in SE_GENI_CLK_SEL
    6c3420d6ba34d i2c: qcom-geni: Store of_device_id data in driver private struct
    4edab037132b8 i2c: qcom-geni: Move resource initialization to separate function
    fb54df3645d8a i2c: qcom-geni: Isolate serial engine setup
    3aede00c681a9 accel/ivpu: Use separate flag for job timeout
    a19900a0ed08e accel/ivpu: Use threaded IRQ for IPC callback processing
    63fc6312d39d5 landlock: Work around gcc-16 -Wuninitialized warning
    d6efcfd5cd8f8 drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
    961c717e6bf0e xfs: fix cursor and pointer handling when recovering iunlink buckets
    b39ce66ab47cb xfs: fix blockgc group quota scanning when usrquota isn't enforced
    41bc624377f08 xfs: drop dquot flush lock when we can't find a buffer to flush
    f1f7bc739a891 xfs: don't merge different file IO error types
    0e0d3372a8402 xfs: don't let memory failures leak blocks and kill repairs
    f0d8352a39f4a xfs: don't let hidden_space go negative in xfs_metafile_resv_init
    b4b9928ee54f4 xfs: call xfs_dquot_set_prealloc_limits if we installed default rtb limits
    2703b954d306e xfs: fix wild memcpy access when formatting ondisk rtrefcount btree roots
    26ba0c5482d95 xfs: fix rtgroup repair estimations
    0f3f707b5478d xfs: check di_forkoff correctly in scrub
    1fd8a33bbd0ba xfs: use the correct reservations for rtrmap/refcount recovery
    34e600858fc35 xfs: only flag zero padding for dir3 data blocks, not dir3 block blocks
    445cb918169a5 xfs: don't call xfs_exchange_range_finish for a dry run
    dfb84f25e7750 xfs: check padding field in xfs_ioc_commit_range
    fbf850345ff74 xfs: use correct jiffies comparison function in xchk_maybe_relax
    f813aefd9e09c xfs: release orphanage dir inode if chown fails
    4cb89cd1ac1d3 xfs: fix attr fork block count checks in xrep_inode_blockcounts
    da172e10613d0 xfs: don't assert when XFS_SCRUB_TYPE_HEALTHY scans return corruption
    70783946f3b5d smb: client: delete compound mids on send failure before unlock
    253612499ce9b smb: client: close completed creates on compound wait errors
    b01f4f85817c6 smb: client: validate POSIX create context length
    3c07deb262731 smb: client: use finish_no_open() for non-regular inodes
    f09b5f972eca1 smb: client: preserve create-context parsing errors
    7c1509598a4fd smb: client: clean up failed cached directory opens
    cdb36b09fb1f8 smb: client: close handle after create-context parsing failure
    cecc5399987e7 smb: client: fix create context out-of-bounds reads
    005b23d9e324f Bluetooth: RFCOMM: fix NULL dereference of dlc->session in RFCOMM_CONNINFO
    2e8bba0360d13 Bluetooth: mgmt: fix race in read_unconf_index_list()
    f557274af7b94 Bluetooth: L2CAP: validate frame length before control and FCS access
    e5fcca51177f2 Bluetooth: ISO: release unused CIS holds after channel attach
    bbcd723ee7a84 Bluetooth: ISO: balance the parent hold in hci_bind_bis()
    47d67ec424e63 Bluetooth: hci_sock: reject out-of-range OCF values
    1a92763c2ba72 Bluetooth: hci_sock: validate event length before filtering
    947eb2f41f70d Bluetooth: hci_conn: fix CIS hold ownership on reuse
    df59474a0a857 sched/cache: Refresh LLC capacity across CPU hotplug, to fix capacity underestimation bug
    852ecb6bc0bc0 sched/cache: Decouple sched_cache_group from mm to fix UAF
    3fdf2ceb31e8a sched_ext: Derive SCX_RQ_IN_WAKEUP from the core enqueue flags
    c942d0d46049d RISC-V: KVM: Fix HSM hart status error propagation
    e9c89ca5f145c RISC-V: KVM: Propagate interrupted G-stage faults
    f475f4d78def6 RISC-V: KVM: Release unused page after MMU invalidation
    3cc6184bd5920 RISC-V: KVM: Synchronize hrtimer callback during teardown
    71acbea44e786 RISC-V: KVM: Serialize IMSIC attributes with vCPU migration
    22df195bff843 KVM: arm64: Transfer the hyp stack pages out of the host stage-2
    3cefc1ab511fa KVM: arm64: nv: Fix null ptr deref on nested wp/unmap, teardown race
    330346dda3bf5 KVM: arm64: Fix spurious warning for benign stage 2 teardown race
    af6813d16ace2 KVM: arm64: Fix AArch32 DBGBXVR<n> handling
    cc53eb5c6515e KVM: arm64: Don't WARN on an unknown VM ioctl in protected mode
    d4cc2dff12116 KVM: SEV: Do cache maintenance on the source VM during intra-host migration
    9784e5ca91b37 KVM: SEV: Free have_run_cpus during VM destruction even if VM is no longer SEV
    4e4d2ae5ad394 KVM: Don't treat reserved xarray entries as having memory attributes
    9a5eec7bdd3fc KVM: Ensure memory attributes xarray nodes are accounted to the caller's memcg
    3c3433657c82f s390/vfio-ap: fix KVM GISC and page leak when queue removed from host config
    fa0cccea92502 s390/pci: Don't report recovery success on skipped recovery
    d47272ceaab8f s390/pci: Report SCLP status on error events when no pdev is associated
    1b957d5c2f737 s390/pci: Fix missing device lock in zpci_report_status()
    1cd0b7a08dc83 s390/pci: Fix leak of struct pci_dev reference in zpci_report_status()
    7f78226eb743b s390/cmf: Fix virtual vs physical address confusion
    44b16b0260805 s390/cio: Fix NULL pointer dereference in ccw_device_get_util_str()
    7274abc88dda6 pinctrl: sunxi: keep a shadow copy of the data register output latches
    db451df3dc17e pinctrl: single: free the IRQ on domain creation failure
    742be6976ebd6 pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair functions
    ff77310ea0bf7 pinctrl: mpfs-mssio: use correct regmap function to set bank voltage
    897e39973c26a pinctrl: mpfs-mssio: fix width of unused bank voltage setting
    c45b783d57c23 perf/x86/intel: Constrain Panther Cove UOPS_DISPATCHED events to PMCs 0-3
    991113857d31a perf/x86/intel: Remove incorrect Panther Cove PEBS data-source constraints
    6ec90c2a7bd97 perf/x86/intel: Remove incorrect LionCove PEBS data-source constraints
    40f6fd75cc22a perf/x86/intel: Fix Panther Cove PEBS data-source snoop states
    eefb89f251873 perf/x86/intel: Fix DKT PEBS load/store direction for latency events, to fix sample classification
    684a72b20c006 perf/x86/intel: Fix GRT PEBS load/store direction for latency events, to fix sample classification
    d07b3fd6df84e perf/x86/intel: Fix CMT PEBS load/store direction for latency events, to fix sample classification
    f0be081114dae perf/core: Run sched_task() for PMUs with only CPU-wide events
    ec15f6a50183f perf/core: Fix NULL pmu_ctx passed to pmu->sched_task()
    8a20dbb31020d parisc: parse early parameters in setup_arch()
    db45f02b7a5f7 parisc: Increase kernel stack size to 32kb
    b92d5f31d4667 scsi: ufs: pltfrm: Add quirk for R-Car S4 lacking lanes-per-direction
    9f6f4840def93 scsi: ufs: core: Keep internal commands dispatchable during error handling
    24ffc919467d2 scsi: libiscsi_tcp: Check the data direction of a Data-In PDU
    6ef70d790425e nfc: trf7970a: power down on startup RX gain failure
    035056e07ea65 nfc: port100: reject frames whose declared length exceeds the received data
    744e61bd06188 nfc: llcp: drop truncated I/RR/RNR PDUs in nfc_llcp_recv_hdlc()
    9ede11e12f965 nfc: fix use-after-free in nfc_get_local_general_bytes
    4fb8b1ccc4756 netfilter: nf_tables: skip expired catchall elements on insert and delete
    d9cf4ac6f3263 netfilter: ip6t_rt: fix zero-address non-strict match out-of-bounds read
    3a7384bc2e662 netfilter: ip6t_rpfilter: reject routes without inet6_dev
    e27b51822681a net: usb: lan78xx: Fix URB reference leak in lan78xx_submit_deferred_urbs()
    f2379110d05df net: usb: cdc_mbim: add MeiG Smart SRM821 to ZLP whitelist
    b03b8ed983df1 net: txgbe: fix FDIR filter restore for VF rules
    f0105a92289d8 net: phy: micrel: Advance register data pointer in write loop
    a0cb48c6418d1 net: phy: intel-xway: workaround 100BASE-TX Link-Up issue
    47785f9f638b0 net: ena: fix MMIO read buffer leak on probe failure
    e32f6c0e0d626 net: ena: fix PHC cleanup on probe failure
    fe2a42789c12e net: bridge: mdb: restart port group walk after deletion
    3a7d9271b37c8 net: atl1e: fix soft lockup on out-of-range hw_next_to_clean read
    d4ab263e40fcf net: atl1c: fix soft lockup on out-of-range tpd_cons read
    e02a83bb0b7a2 net: openvswitch: conntrack: fix helper UAF due to extensions realloc
    ec8f12f46f07b net: openvswitch: conntrack: remove 'add_helper' dead code
    457e0df1b5711 net: openvswitch: conntrack: avoid modifying shared unconfirmed ct entry
    259e6cbb6a097 net: macb: fix dma_alloc_coherent() leak on macb_alloc() error paths
    cbaad2922bd5d net: ipconfig: bound DHCP option construction
    deed332a8dd6b net: hisilicon: hns_dsaf_mac: fix mdio device leak in hns_mac_register_phy()
    6285919d4c062 net: atl1: fix soft lockup on out-of-range cmb_tpd_next_to_clean read
    35e716a707334 net: arp: terminate device name before lookup
    da9d42531f3a6 net: airoha: npu: cancel wdt_work after releasing the WDT IRQ
    a9551f26287de net/sched: reject IDR error pointers when deleting actions
    e73f832f0a7b2 net/mlx5e: fix swapped IPv6 IPsec policy masks
    2b2a207ef975b net/mlx5e: advertise MACsec offload only when supported
    1f13989a0704b net/mlx5: Fix rev_entry reference leak in mlx5_tc_ct_shared_counter_get()
    4b09b7c84b863 HID: wacom: fix OOB read in wacom_wac_pen_serial_enforce()
    723983a774f14 HID: quirks: add ALWAYS_POLL quirk for SDINNOVATION gaming keyboard
    eed737d89fa36 HID: hid-oxp: use cancel_delayed_work_sync() in remove
    443f6b93442b1 HID: alps: fix use-after-free on input2 registration failure
    978e801750c7b HID: alps: unregister DualPoint Stick input device on remove
    2a0c9afefc0ec packet: use ubuf_info completion for TX_RING packets
    aee774588abd7 PCI: of_property: Omit bus properties without a subordinate bus
    75be9cc462134 PCI: Fix BAR resize for devices on a root bus
    655690f370e2d mm/damon/core: reset invalid quota->charge_target_from
    27adca087f25c mm/damon/core: allow esz to be set to zero
    2ecc56fb6a58a mm/damon/core: fix unconditionally skip last region
    d5208de0799c5 mm/damon/ops-common: use a page-aligned address in damon_ptep_mkold()
    6e74ffc9ecf6e mm/damon/vaddr: avoid hw-driven pte updates during damon_hugetlb_mkold()
    480a39b0a12c9 mm/hugetlb: preserve mremap address delta when skipping page tables
    443628f755b35 mm/hugetlb: do not dissolve gigantic pages without runtime support
    d348a715380bf mm/rmap: fix missing barrier between anon_vma init and vma->anon_vma publish
    fcedc256a1eb7 gpio: tps65219: Fix TPS65214 GPIO direction programming
    d5313d51c6e62 gpio: tps65219: Use the variant-specific direction callback
    eafce3255b271 gpio: tps65219: Fix GPIO input value reads
    ecced0076b700 drm/virtio: fix NULL pointer dereference on fence allocation failure
    ae583668f16d4 drm/virtio: fix memory leak of fence event on execbuffer failure
    9f71d6b6bdb7a drm/xe: Keep walking on SVM eviction failure
    599c17ac1c6ac drm/xe: Limit sg segment size to PAGE_SIZE on Xen PV
    531d4cd031182 drm/xe: harden adjust_idledly() against divide-by-zero and overflow
    bddaa5e4094c1 drm/xe/vm: nuke PTs only after unlinking contested VMAs
    189ffc7b6cad6 drm/nouveau: don't bump pin count on failed re-pin in nouveau_bo_pin_locked()
    cd6e11b6ebe04 drm/nouveau: RCU-free the scheduler-containing nouveau_sched
    780ad8e4df9f7 drm/nouveau: Fix runtime PM leak in nouveau_connector_detect()
    9e13c398a2344 drm/nouveau: Fix gem reference leak in validate_init()
    872a5473c02a2 drm/nouveau: fix double-free in nvif_vmm_dtor
    3e0861ebb9ecf drm/nouveau: Fix bridge reference leak in nv1a_ram_new()
    eed63b6137255 drm/nouveau: fix autosuspend cleanup during teardown
    5b2fffbba290e drm/nouveau/uvmm: fix UAF in nouveau_uvmm_sm when BO is in TTM_PL_SYSTEM
    06c69c64686a3 drm/nouveau/dmem: pin VRAM for the whole registered range
    18f1cb48a7992 drm/amdgpu: move userq fence wait out of signalling section
    8372eea98082e drm/amdgpu: Fix vmid_wait fence leak in amdgpu_ring_init()
    2556dd3a36beb drm/amdgpu: Fix runtime PM leak in amdgpu_debugfs_test_ib_show()
    d9bc9e5a356c6 drm/amdgpu: Fix last_update fence leak in amdgpu_vm_init()
    25901f180bde2 drm/amdgpu: Fix acpi device leak in amdgpu_acpi_enumerate_xcc()
    7963b4d2445af drm/amdgpu/vcn5.0.1: fix video_timeout unit mismatch in jpeg reset wait
    ca51e225a554f drm/amdgpu/vcn4.0.3: fix video_timeout unit mismatch in jpeg reset wait
    545a1c8792893 drm/amdgpu/userq: fix double jiffies conversion in hang detect timeout
    707474d1d8619 drm/amd/display: Bump frame warning limit for clang builds of dml
    d111fde7b12f8 drm/amd/display: Fix dc stream excess put in dm_update_crtc_state()
    02b74891624e0 drm/amdkfd: fix use-after-free and multi-container gap in kfd_dev_mapping
    168e41173a9e6 drm/i915/dp_mst: Fix configuring TUs for a disconnected stream
    67da63b54ced3 drm/i915/dp_mst: Fix configuring FEC for a disconnected stream
    a9047237769cc drm/i915/quirks: Limit eDP rate to HBR2 on HP Pavilion Plus 14-ew1
    2dd0190e397ec drm/i915: fix incorrect RCU teardown order
    eb4af14672870 drm/imagination: Fix page count for page table for map() interface
    d30ea27471649 drm/imagination: Propagate map failures correctly from pvr_mmu_map_sgl()
    a69c4b678db80 drm/client: fix restore of partially initialized client
    b36d32f30c3f1 rds: ib: Clear the sg list when mapping an MR fails
    f178300e2f56c mctp: route: iterate socket tag list in mctp_lookup_prealloc_tag()
    3361c93e41738 llc: reserve device headroom for allocated frames
    6e20dabffbcd7 gpio: zynq: fix runtime PM leak on request error path
    60a466f231905 gpio: cdev: fix kernel stack leak to user-space in error path
    39748357db26b gpio: arizona: Fix runtime PM leak in arizona_gpio_direction_out()
    f05a01fc7d4f7 kprobes: Fix permanent hang when flushing the kprobe optimizer
    94214cf0a08dd ipv6: sr: enforce exact attribute length for SEG6_ATTR_DST
    4254d5878c320 ipv6: do not let ipv6_find_hdr() return an offset past the packet end
    d7c5bd3159235 ipe: protect the dm-verity root hash with RCU
    e9015d32752fa ipe: fix use-after-free when auditing a newly loaded policy
    cb52f9f188c31 fsl/fman: Fix clk reference leak in read_dts_node()
    260f586a80e7f writeback: report a Tasks-RCU quiescent state per cgwb drain pass
    f97e6d0572d1b workqueue: Fix NULL current_pwq deref in flush dependency check
    9dac137bf77e0 writeback: bound cleanup_offline_cgwb() rescans by rotating scanned inodes
    37a2042748bc8 netfs: Fix missing alloc tagging of direct mempool allocations
    1ae2a242c15b0 fs/ntfs3: use d_instantiate_new() in ntfs_create_inode() and murder syzbot's "WARNING in do_new_mount" saga
    b7459fddcb27a fprobe: Terminate the fgraph_data list when the reservation is not filled
    520cf06b8ea0b fou: reject omitted FOU_ATTR_IPPROTO on FOU_ENCAP_DIRECT
    dfacf401f83dc cgroup/pids: Restore pids.events notifications in local mode
    0751ab665cb3d cgroup/cpuset: Return PERR_NOCPUS in remote_partition_enable() on subpartitions_cpus conflict
    9daa00445928d crypto: s390/hmac - Generate intermediate CV for API partial block handling
    640d37fbd34d0 bpf: fs/xattr: don't assume the inode is locked in path_unlink/path_rmdir
    e09d1c6729ee4 bna: prevent IOC timer rearm during teardown
    80fbb0bc4d116 ata: libata-scsi: bound the ATA passthru sense descriptor writes
    590395db53594 arm64: errata: match the target implementation CPU's own MIDR
    ce71865bf43f8 arm64/boot: Disable trapping of PMZR_EL0 writes to EL2
    218a944b9e035 af_packet: fix integer overflow in prb_calc_retire_blk_tmo()
    6df536c5acbc0 sctp: discard the rest of the packet on a stale-cookie error
    08e835f5ec6e2 tcp: prevent collapsing skbs across boundary in rtx queue
    b0e517961f09b tipc: reject invalid and unexpected GRP_ACK_MSG to prevent bc_ackers underflow
    31e3ef800705a virtio_net: copy zerocopy frags in start_xmit without NAPI
    0f035ce43acd3 vsock: ignore empty child namespace mode writes
    64da377e83d75 x86/sev: Make vTPM SVSM calls preemption-safe
    61d4c3b002505 x86/PCI: Disable enhanced atomics on AMD NBIO 7.7 and 7.11
    51c17a944e3f0 x86/mce: Fix hardware debug register corruption on task migration
    59af43ccece4d vlan: require the MAC header to be present in __vlan_insert_inner_tag()
    415f5a755cec5 drm/pagemap: dma-unmap pages before handling migration errors
    283550b74db33 mptcp: return sk_wait_data() errors from recvmsg()
    ee4d5818a9ecc sched/core: Account PSI IRQ time to the execution context, not the scheduling context
    c7de8521947a5 perf/core: Fill branch entries with a single assignment
    5286d4eb5cd7e perf/core: Fix a refcount leak in attach_perf_ctx_data()
    841410754a71c perf/x86/intel: Delete dead NVL PEBS data-source initcall
    074eee0bf0d6d perf/x86/intel: Make @data a mandatory param for intel_guest_get_msrs()
    050c4b962184e perf/x86/intel: Don't pointlessly context switch DS_AREA (and PEBS config) if PEBS is unused
    67f0ef3b5ff6e perf/x86/intel: Don't write PEBS_ENABLED on host<=>guest xfers if CPU has PEBS isolation, to fix stuck PEBS_ENABLED
    23e769520fb8e perf/x86/intel: Ensure KVM guest PEBS path doesn't set unwanted PERF_GLOBAL_CTRL bits
    fc4fd0281ac80 autofs: fix sbi->pipe file reference leak in autofs_kill_sb()
    719bd33ab359c ovl: fix UAF in ovl_do_mkdir() debug print
    90d51095371d9 vlan: ensure sufficient headroom in vlan_dev_hard_header()
    43e3c3773b435 net/sched: sch_teql: fix shadowed err in __teql_resolve()
    39de64a284fe5 bridge: check llc_mac_hdr_init() return value in br_send_bpdu()
    cb3528ad8bb46 llc: fix skb UAF and leaks on llc_mac_hdr_init() failure
    c517e8755960c gve: DQO: reject TSO packets with an out of range MSS
    4de58b27f3ada gve: fix TX drop when GSO MSS is too small for hw
    dc9e8964a21f2 gve: DQO: fix header length used by gve_can_send_tso() for UDP GSO
    c68f415746344 net: flush skb_defer_nodes in dev_cpu_dead()
    1993c8745f852 net: ethernet: stmmac: dwmac-rk: fix bulk clock leak when the PHY clock fails
    24ca932b612b6 tipc: Fix a data race on mon->peer_cnt in mon_timeout()
    a9b968e42690d net/smc: fix UAF on lgr list traversal in smcr_port_err()
    670f303169d2d net/rds: size a connection's path set by the transport it ends up with
    fe6c8ea8bfd5d nfp: hold IPsec RX state under the XArray lock
    e78b95cfd5df2 net: libwx: fix races in Tx timestamp handling
    e461e9e495643 net: wangxun: implement soft quiesce for PCIe error recovery
    671a68654a9d3 net: phylink: record the PHY only once bringup cannot fail
    0f87720c7e4bc tcp: fix use-after-free of retransmit_skb_hint in tcp_send_synack()
    f306e465b5a20 net: dsa: mt7530: leave the MDIO IRQ mappings to regmap-irq
    aae2a1f1e3a0a net: dsa: mt7530: fix NULL dereference on unbind of MT7531 and MT7621
    9173f503c9591 bpf: Zero-fill other CPUs when BPF_F_CPU creates a per-cpu hash element
    c664cca8f622e net: emac: move setting of netops to fix crash
    062b56c0986fd net/sched: act_ife: validate metadata length before decoding
    b07bea42bf590 macsec: initialize SecY before registering the netdevice
    fa1bdd972dd76 bonding: crypto offload enabled, non-offload slave failover, rekey failed
    eabd0ae361176 drm/imagination: clamp freelist reconstruction requests
    930318290d850 net: xps: reject an out of range traffic class
    ff022fd9d0f02 vxlan: use one headroom snapshot for neighbour replies
    63c5e48d6f7f5 ip_gre: Reject enabling collect metadata through changelink
    027d9debeaede net: bcmgenet: mask DMA_TIMEOUT_MASK when reading DMA_RING0_TIMEOUT
    81c38c7426519 net: bcmgenet: validate Ethernet address in bcmgenet_set_mac_addr
    780f373ae5d04 net: bcmgenet: do not skip WoL power up on GENET V1
    006c7cce35e35 net: bcmgenet: initialize u64 stats seq counter for all queues
    eeed00e40e24d net: bcmgenet: fix 64-bit RTNL stats reading in ethtool on 32-bit systems
    36c07127924f1 net: ipv6: keep room for the mac header in dst_dev_overhead()
    298673397ea3f net: stmmac: clear stale buf->page after recycling on skb build failure
    8b7aae8f0e96f tg3: use random MAC address when tg3_get_device_address fails
    b3373c33c7b7d bpf: Fix BSWAP 32 and 16 on MIPS64
    1bd91670966a7 bpf: Fix immediate JMP JEQ/JNE on MIPS32
    ee17e21bc4964 net: mdio: realtek-rtl9300: fix RTL931x C22 extended page selection
    c8dad411b82da net: dsa: mv88e6xxx: 88E6191X and 88E6193X have no PTP
    06f8310798ece vrf: Stop corrupting skb->csum when capturing CHECKSUM_COMPLETE packets
    d7f4742268094 net: skbuff: fix pull-bound underflow in skb_checksum_setup_ipv6()
    43f6b647f2095 veth: manage XDP program pointers during channel resize
    f329d42423089 net: bcmgenet: stop Tx NAPI before disabling the queues
    7cdbc5768b932 net/sched: act_gate: budget the per-entry list in get_fill_size
    2450a38836723 nfc: pn533: fix OOB read in pn533_acr122_is_rx_frame_valid()
    4262b12277a3e nfc: llcp: fix slab-out-of-bounds reads when logging service names
    0a0412745c86a nfc: llcp: fix WKS SAP hijacking via prefix match in nfc_llcp_wks_sap()
    9e51b24f684ff nfc: llcp: fix -ENOMEM on connect with zero-length service name
    a86987d03a4d3 nfc: st21nfca: validate ISO15693 inventory length
    0b01a946b0f23 nfc: llcp: fix sdreq TLV list leak on parse/alloc/send failure
    779e13c0fa7fa nfc: virtual_ncidev: Add missing ioctl compat handler
    6c488ec3e0106 selftests/nci: Fix out-of-bounds store on thread join
    1aefc05d7bcf5 selftests: nci: Fix uninitialized family ID on missing attribute
    d5e1c92d09cae nfc: llcp: Fix race condition in accept_queue lifecycle
    ead3daa724a81 selftests: nci: Correct pthread_create return value check
    320a2ff49bdce nfc: llcp: Fix list corruption / refcount desync in nfc_llcp_recv_dm()
    7b996cc06dda5 nfc: st21nfca: validate received frame size
    6a17a5806e9fc nfc: nfcmrvl: validate helper command length before pull
    bb375f3c5990e bpf: Reject dev-bound-only programs on other devices
    0b160417826d2 net/sched: fix potential stack infoleak in em_text_dump()
    491aa3167ae02 eth: fbnic: Avoid rounding zero ring sizes
    212d21e669212 net: stmmac: selftests: Account for alignment shift on dwmac1000 for Jumbo test
    ec351284780a8 net: stmmac: size the RX buffers from the frame length, not the MTU
    fa47a0487b48d net: stmmac: dwmac4: Use the correct bufzise when the len is exactly 8K
    849cb2ba03418 net: stmmac: selftests: Capture all packets for vlan checks
    adff25039a1f5 net: stmmac: selftests: Check the dev->features for S-TAG offload testing
    ca0f523acf36c net: stmmac: selftests: Validate EEE based on the actual LPI timer value
    2efadd72b95f9 net: stmmac: selftests: Support running selftests on DSA conduits
    35bf3b23c9a87 sctp: hold asoc or transport before mod_timer() in timer handlers
    25e31481f739d net/mlx5: Bridge, don't fail unlink of untracked/unsupported peer ports
    b5b3fcb335e09 net/mlx5: Bridge, don't fail switchdev events of sibling eswitch ports
    ee1df60a0d0e8 firewire: cdev: fix back-transition for iso_resource_auto client resource
    ba7d627dbc67d bpf, sockmap: Reject max_entries > INT_MAX in sock_map_alloc
    0b6b2bb9b90ad bpf: Reject pkt arguments in mutating subprogs
    84ebb991ae985 bpf: Fix bpf_sock context code generation
    39ffceaddb107 bpf: Fix bounds check for skb-backed dynptrs
    37dbcadd7683e thermal: gov_step_wise: Fix stale mitigation vote with non-zero lower bounds
    1aca79e5cda2e PM: hibernate: Freeze kernel threads after image preallocation
    61ee40a3f2c0d net: pcs: xpcs: fix clock reference leak on xpcs_init_clks failure
    45b4701ab2626 genetlink: report the real command id for dump-only ops in policy dumps
    986ec9602ee8c net: ethernet: ti: netcp: fix pm_runtime usage counter leak on error
    3001a103a367c net: spacemit: clear TX descriptor on fragment mapping failure
    c593f38e1cdb9 s390/debug: Fix NULL pointer dereference in debug_info_copy()
    b42ca15649e73 s390/debug: Do not register views for failed static debug areas
    9cb99c37d03a4 drm/i915/psr: Clear stale sel fetch enable bits on sel fetch disable
    b6c0c757c6589 tg3: clean up PHYLIB resources on probe failure
    d1b5fd969cc53 udp: remove a disconnected socket from the 4-tuple hash table
    f7b3d38dd7c47 udp: relocate a connected socket in the 4-tuple hash table on re-connect
    f9722746df13a ipv6: Fix dst leak for uncached routes.
    05b442709bd52 net: usb: sr9700: include receive overhead in the length check
    0ad83979a0fd2 dpll: use exact lookup for reference sync pin id
    3950b9ec5e125 net: don't require the hwtstamp NDOs when a PHY provides timestamping
    e03e77071e75c ipv6: Prevent rt6_insert_exception() for dying fib6_info.
    696baf868e230 octeontx2-af: Fix memory scaling limitation in SR-IOV mode
    89a7241fc7ecc bpf: Reject non-negative offsets in stack_slot_obj_get_spi()
    9240fc1f2cde5 Bluetooth: RFCOMM: Reject short EA=0 frames in rfcomm_recv_frame()
    b29b70bfa1213 Bluetooth: btintel_pcie: validate device-supplied DMA indices
    ad0d2d4ada513 Bluetooth: bnep: fix out-of-bounds reads on short RX/TX frames and control fallthrough
    c777431395a4a drm/xe/gt_throttle: Report power brake as a throttle reason on CRI
    7f9ba0b023876 ovpn: reject invalid peer VPN addresses
    57fd86c10acbd ovpn: reject multipeer peers without VPN addresses
    47dd2b6819118 ovpn: reject duplicate peer VPN addresses
    2b09b0b13a8be ovpn: always unhash old VPN addresses before rehashing
    72bd1bea37ea2 ovpn: replace bind when clearing stale local source
    e283009151d3d ovpn: replace bind when learning local endpoint
    400f3cd8ff053 ovpn: validate peer state before caching UDP dst
    2149f81ffd4c6 ovpn: track UDP socket route key for peer dst cache
    5cdb2076fbe2b ovpn: skip UDP source validation for unspecified addresses
    ae754c2b702a9 ovpn: preserve IPv6 scope id for netlink peer endpoints
    9b796251c3cca drm/bridge: samsung-dsim: fix TE GPIO lifetime for host attach
    8910994f4d12f pinctrl: tegra238: Fix register bank for AON pin groups
    49762b1b881b9 drm/virtio: sync shmem backing on guest-bound transfers
    bed76f2c0f9e4 Revert "drm/virtio: Allow importing prime buffers when 3D is enabled"
    7c8deb77d05bc drm/virtio: release the GEM object on virtio_gpu_vram_create() errors
    02df4e24dc4c0 drm/virtio: fix object leaks in virtio_gpu_resource_create_blob_ioctl()
    749d8bb964b34 drm/virtio: fix object leak in virtio_gpu_resource_create_ioctl()
    f75066c79d1ee drm/virtio: fix object leak when drm_gem_handle_create() fails
    1301a1292c674 net/sched: sch_hfsc: bound the classify inner-filter walk with a drift budget
    86a0e945fb645 bpf: Check params size before reading reserved fields
    9d4be026bdff2 net: usb: catc: bound the RX packet length in catc_rx_done()
    4105870a4b8af bpf: Bound ownership depth through local kptrs and graph roots
    b34ae23eb7818 net: allow IFLA_INET_CONF messages when NLA_F_NESTED unset
    ddc34cc0834c8 sctp: avoid livelock while updating retransmit path
    ce93f8561f87a eth: fbnic: Handle FW mailbox completions flagged with an error
    a969db6548a1b eth: fbnic: Set AW_FLUSH_MODE alongside AW_FLUSH when flushing the mailbox
    4f4b767ffea76 eth: fbnic: reset num_napi when the napi vectors are freed
    1fb569cf3bf97 eth: fbnic: use the Rx queue napi pointer to find the napi vector
    16ff1023213cc eth: fbnic: Handle maximum standalone channels
    4ca1503491f1f net: ethtool: keep rtnl_lock for the ioctl self test
    b0afb7c7ca272 ip6_gre: Call ip6erspan_tunnel_unlink_md() in ip6erspan_changelink().
    0fdb944d4df02 net: ethernet: mtk_eth_soc: unregister net_devices in case of probe failure
    c20f755338ca2 net: gue: reject invalid REMCSUM offsets
    650787233c2fd net/sched: act_ct: don't WARN on benign flow_offload_alloc() failure
    cdf9203b168ab drm/nouveau/disp: don't reject HDMI config on cards without SCDC
    b862c332bfa81 drm/nouveau/clk: don't clobber reclock status when restoring volt/fan
    391517da7fd54 drm/nouveau/clk: fix list cursor use after loop in nvkm_clk_ustate_update
    253a27ae7afee pinctrl: qcom: ipq5210: Publish the OF module alias
    9f80910a87a9e ocfs2: make ocfs2_calc_xattr_init() return void
    9b583795feb51 arm64: io: Reject non-user protection in ioremap_prot()
    0321f3c891f3a netfilter: ctnetlink: fix suspicious RCU usage in expect_iter_name
    5ad109938f0d5 ipvs: revalidate ihl before icmp_send
    70a725baef910 netfilter: nft_synproxy: use the family-aware checksum helper
    8137a39e08e83 netfilter: nfnetlink_queue: hold nfnl mutex in event notifier
    f26652e99f519 netfilter: flowtable: publish HW_DEAD after worker is done
    e2ccbbb270f87 gpiolib: use of_node_name if line-name is missing
    06b78f3c925fe ipv4: fib: fix data-race and stale genid check around nh->nh_saddr
    0d449edab5b17 libbpf: Reject truncated ldimm64 CO-RE relocations
    8e4cbcca1e0a2 bpf: Restrict CO-RE poisoning to relocatable instructions
    091b40845bd3c bpf: Preserve packet pointer class displacement in regsafe()
    56dc616d7a1f7 bpf: Make post-verification instruction rewrites killable
    688fd49e2dfec net/mlx5: LAG, reload IB reps of LAG master before the rest
    efa4cfabced0f net/mlx5: SD, unload reps on shared FDB create error path
    bd4dcb9955746 net/mlx5: devcom, Base component size on linked devices
    5d2f913258ba7 octeontx2-af: use seq_file for rsrc_alloc debugfs
    ab14b5bbb871e net: pcs: rzn1-miic: Fix config array initialization
    2f898f9ec7c73 net/sched: cls_u32: fix manual hash table handle IDR aliasing
    4bab07f7b74e5 eth: fbnic: Fix payload page pool error cleanup
    87ce4b53b7436 bpf: Skip unsettled links in link iterator
    3c1e0a4bc156b xsk: Use a 32-bit compare in xsk_map_gen_lookup
    3cdc6e12ff79f fs: avoid repeated scans in evict_inodes()
    9a86ff5e1bf32 netfs, afs: Fix symlink reading
    71ab3046a73b9 netfs: Fix netfs_read_gaps() to use separate sink folios
    5af61cd2b5958 s390/cio: Guard PMCW field accesses with dnv check
    7b0ae882b8618 s390/cio: Check pmcw.dnv before pmcw.ena in I/O entry points
    1b8e7661d07bd s390/cio: Fix cio_update_schib() to not cache invalid schib
    704f1ce7fe7f4 s390/pci/docs: Fix sriov_numvfs attribute name
    09d610f7a9720 scsi: megaraid_sas: Protect megasas_get_ctrl_info() in megasas_resume()
    2ef65974d0401 selftests: cgroup: give the O_TMPFILE open in get_temp_fd() a mode
    03ced4687fb79 Bluetooth: mgmt: Dequeue pending mesh_send_sync entries on cancel
    edcb84ee607a9 Bluetooth: btnxpuart: Fix skb leak in nxp_process_fw_dump()
    800c28b0c25d0 Bluetooth: SMP: reject Security Request over BR/EDR
    7ed50d2b2fc0a pinctrl: sunxi: A523: fix voltage withstand encoding
    3ddf8383b5445 scsi: sd_zbc: Reject disks with too many zones
    ca688bb207957 scsi: block: Fix zones_cond out-of-bounds write on zone report
    e1ca4e3a380ef squashfs: Add dictionary size range check to prevent shift-out-of-bounds
    bb79f2334ab8d KVM: arm64: Fix FGT mapping for HFGITR_EL2.nGCSEPP
    33135c7653f62 KVM: selftests: fix steal_time for arm64 with host page size > 4K
    7a6b9d829f13a KVM: arm64: Match hyp text by physical address in fix_host_ownership()
    166d27b5908d8 KVM: arm64: Return -EINVAL for an empty SMCCC filter range at base 0
    7b5e99d286747 KVM: arm64: Derive GUEST_HAS_SVE from the SVE feature bit at EL2
    f0cd8ffae092c KVM: arm64: Do not clear VM-wide SVE feature on vCPU init failure
    bae3e4493046d KVM: arm64: Validate the SVE vector length in pkvm_vcpu_init_sve()
    0895f04f763dd KVM: arm64: vgic-its: Skip unreachable devices instead of failing the save
    318354021fea3 KVM: arm64: vgic-its: Free the caches when GITS_BASER changes
    f3514b599eeae RISC-V: KVM: Fix perf-backed counter accounting across stop and read
    ca5f939b49b58 RISC-V: KVM: Report snapshot write failure to the guest
    c4ff5b02120c5 RISC-V: KVM: Preserve firmware counter value across stop/start
    6da4665026213 KVM: riscv: Fix NACL hfence entry update order
    650b2606b1343 RISC-V: KVM: Fix the conversion between vsip and hvip
    0b69a3c24a06c HID: bpf: fix __hid_bpf_hw_check_params report length
    ee25833f037fa HID: amd_sfh: Validate PCI BAR size before mapping
    f3a0ceb68003a pinctrl: generic: serialise pinctrl_generic_dt_node_to_map()
    0602f3e9eebda pinctrl: meson: Fix typo in s4 group name
    d7cd5ebe13989 bpf, arm64: set up the frame pointer for the exception callback
    cb3f6c0c211e9 bpf: Fix u32 overflow issue in map batch operations
    8894205419118 bpf, sockmap: Fix self-redirect copied_seq double-counting
    f101602415fb3 bpf: Fix UAF due to concurrent consumption of ttrace lists in alloc_bulk
    cba54d142c43e bpf: Fix out-of-bounds read of rtt_min in sock_ops
    4e48fe9b1c779 bpf: Avoid soft lockup in __htab_map_lookup_and_delete_batch()
    413f72ce8c829 bpf: Allow terminal gotox instructions
    032d037c42c05 KVM: x86/pmu: Move Intel PMU global MSRs to intel_is_valid_msr()
    45f3f248297c4 HID: elecom: fix bus type for M-XGL20DLBK
    2b25f11ec52ea HID: winwing: fix use-after-free in force feedback teardown
    86ed8ca0bb3db HID: multitouch: Add report ID mismatch quirk for ASUS ROG Z13 Folio
    ee7246bccb9da tcp: Skip cond_resched() in inet_csk_listen_stop() under BPF context
    2534a5e5d360c bpf: Fix out-of-bounds read of sk_protocol in bpf_sock_destroy()
    b8fa56722e9c4 bpf: Fix divide-by-zero in btf_struct_walk()
    ff94a50f1eb14 selftests/ftrace: Fix unique symbol check in kprobe_non_uniq_symbol.tc
    fca71ead7a202 bpf: Disallow bpf_skb_pull_data() for LWT_SEG6LOCAL
    707567d2edf6b bpf: Fix bpf_skb_change_tail wrt csum partial skbs
    116bba758533a s390/uv: Prevent potential out-of-bounds read
    91867f46cfb6c s390/uv: Fix loop condition in uv_find_secrets
    90bd832b2bc36 KVM: s390: Fix race in _destroy_pages_crste()
    c958f04988912 KVM: s390: Fix potential races in dat skey functions
    75867536746ab KVM: s390: Properly handle NULL pointer in dat_cond_set_storage_key()
    7a33007b95c89 KVM: s390: Add missing srcu in kvm_s390_set_irq_state()
    d0e3bf633f058 KVM: s390: Fix IRQ injection with SIGP Stop and Store Status
    94c43c7df4643 KVM: s390: Fix _gaccess_shadow_fault()
    66db037037f67 KVM: s390: Fix dirty marking in adapter_indicators_set*()
    63d2ecad81aa5 remoteproc: qcom_q6v5_adsp: Fix iommu_unmap() usage
    0b1eebd359685 drm/amd/display: Remove sink usage from DPMS
    df064aea8f239 ALSA: hda/realtek: Add StarFighter HDA SSID
    84332282a7ea9 ALSA: hda/realtek: Limit Star Labs internal mic boost
    d55c308af33f9 drm/amd/display: Atomize IRQ register read/modify/write ops

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_7.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_7.2.bb             |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_7.2.bb  | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
index e808315955..49b25c4f7f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e1ac915949f84df75ab979843a0c16c0355d5d60"
-SRCREV_meta ?= "409e37cf5194730ea597a1c18f3475c7e5661f4e"
+SRCREV_machine ?= "df7d59ac69dd0ac9cdf01d6dfe564b93aba28eb2"
+SRCREV_meta ?= "151b1edb05843ae2225eedce202a0cca1419b7b5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "7.2.8"
+LINUX_VERSION ?= "7.2.11"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
index 67580a5aca..b1aee530f3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_7.2.inc
 
-LINUX_VERSION ?= "7.2.8"
+LINUX_VERSION ?= "7.2.11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "48b9e9647133d8d71348e0ec1f9da415abd14b8a"
-SRCREV_meta ?= "409e37cf5194730ea597a1c18f3475c7e5661f4e"
+SRCREV_machine ?= "7684a4089e8abbbee88c7692655575402c59a80a"
+SRCREV_meta ?= "151b1edb05843ae2225eedce202a0cca1419b7b5"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_7.2.bb b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
index eb14bdc17f..0fd97a3fdb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v7.2/standard/base"
 KBRANCH:qemuloongarch64  ?= "v7.2/standard/base"
 KBRANCH:qemumips64 ?= "v7.2/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "8d67eedc20fc5238eb546ececf7eef7f5dce22db"
-SRCREV_machine:qemuarm64 ?= "48b9e9647133d8d71348e0ec1f9da415abd14b8a"
-SRCREV_machine:qemuloongarch64 ?= "48b9e9647133d8d71348e0ec1f9da415abd14b8a"
+SRCREV_machine:qemuarm ?= "70fb9bc7222f957d2f1ae2287af7bd2e24a9b05c"
+SRCREV_machine:qemuarm64 ?= "7684a4089e8abbbee88c7692655575402c59a80a"
+SRCREV_machine:qemuloongarch64 ?= "7684a4089e8abbbee88c7692655575402c59a80a"
 SRCREV_machine:qemumips ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine:qemuppc ?= "48b9e9647133d8d71348e0ec1f9da415abd14b8a"
-SRCREV_machine:qemuriscv64 ?= "48b9e9647133d8d71348e0ec1f9da415abd14b8a"
-SRCREV_machine:qemuriscv32 ?= "48b9e9647133d8d71348e0ec1f9da415abd14b8a"
-SRCREV_machine:qemux86 ?= "48b9e9647133d8d71348e0ec1f9da415abd14b8a"
-SRCREV_machine:qemux86-64 ?= "48b9e9647133d8d71348e0ec1f9da415abd14b8a"
+SRCREV_machine:qemuppc ?= "7684a4089e8abbbee88c7692655575402c59a80a"
+SRCREV_machine:qemuriscv64 ?= "7684a4089e8abbbee88c7692655575402c59a80a"
+SRCREV_machine:qemuriscv32 ?= "7684a4089e8abbbee88c7692655575402c59a80a"
+SRCREV_machine:qemux86 ?= "7684a4089e8abbbee88c7692655575402c59a80a"
+SRCREV_machine:qemux86-64 ?= "7684a4089e8abbbee88c7692655575402c59a80a"
 SRCREV_machine:qemumips64 ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine ?= "48b9e9647133d8d71348e0ec1f9da415abd14b8a"
-SRCREV_meta ?= "409e37cf5194730ea597a1c18f3475c7e5661f4e"
+SRCREV_machine ?= "7684a4089e8abbbee88c7692655575402c59a80a"
+SRCREV_meta ?= "151b1edb05843ae2225eedce202a0cca1419b7b5"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "9a66fdc0d7fd55f54235524a73435af99051e46f"
+SRCREV_machine:class-devupstream ?= "a2de78ee6ed8bf8cd99d177c74865a6e8c3cb6ea"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v7.2/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "7.2.8"
+LINUX_VERSION ?= "7.2.11"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0

