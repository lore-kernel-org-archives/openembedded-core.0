Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3751.1794864141177416862
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 13:22:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UVA8NiNV;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-990703f817fso3168238241.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 13:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864140; x=1795468940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXY6bM2dhvmjtfAbhAPZ+tJ2NYdcrnVbjM5szE8cZOA=;
        b=UVA8NiNV7izSDi+pmzrSglDuVtsfyUUd2jOh/b4jVT84hxUvV/2gP7yVloBhbpKuxY
         bn0QZsIBCwRAXRARsTFZqIcNpprncNIOqCE59Zpt34YTTJ8qXgXNxHAA66LFBjw3JFu3
         qA+J5WT2M9X0O33+THt3Cstq3qkuRE03PSz6jjLP/04D37BLsLH7MSyLDBlEkzljhL+7
         YX+K+RluPEuUlYqDhJ4MBSSDMguPVl69J6zFY1enZLMuxD+1KiFkyvMMH4Qtu3MDvqFm
         R5+RUduW9EWsz6hsMtXM+fpcIPLOHjuK0fDes6aXWJnmmupU9c4/N9BzSrgglQuhW8Aq
         JZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864140; x=1795468940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GXY6bM2dhvmjtfAbhAPZ+tJ2NYdcrnVbjM5szE8cZOA=;
        b=tbDw3xEL0eMSccTrZRDG0NymYyC9v3aqxv8eGnLDMPHdDWk/K1KxWo5dLilL28Jjtc
         YGa7+MGqx1Z4SEpL3f+rOdWp2VTf5DkAs5ssLaaQClwOgXMMINJ8Eni9J7tZgMWDSO80
         yx1Iaa7QQ+rTNKKG/1Z+5Z3gcuG4/7EFF+eiEYyML5HQgcErkMUAolhPmkyhmHFrHuj0
         Pb/zsUaTzeNVvjJl6Ar9oYymocFFIGRE4fTEIKczD7u0BmcGKQRvUu+Z5acPD8Ve2RBg
         0Cw9lmQDBhaZIkqLzgDrdI+2wz+wdSLpoKXOZSXZK3pFEj/LjxrP8YKbzzTRliMGMMN1
         OJVg==
X-Gm-Message-State: APuU4Z/twAAuhoFdSoxi2zkEQhAJ0xtSI32u1ZcbERDOYQ5vA4P+luEw
	AnDUpqmLRsZVHevy7q91vJpu4ksdvOVqSB09/jxFgx4oIHgeDiS/W4zSbAR4jQGkrT0ZpQ==
X-Gm-Gg: AYBFou1zL16ceuO9jF3MKjJfBvSW2b4iZRtTZSEm8rYzv+SpxD3uNHtfk9M2Qs89YDQ
	P5/xx6BmObpRaNPDgtzwvP5RnVkNhSyxzdD/IOQEl4pv7pI2EfQHlf+VOVUZgKkm2QROCbQkXJZ
	6M+pqKTUt3cGeBJAJrsmCevo1vIhq5NrhcLsFJud9Ed5cL/utXHjkDaW7gdloT7uZQrBxtVZtno
	Xt/wN3dFwaOrOczSDSAQV9mXRQmEKb+F7JLLGAShUf76advkpJmMWG+qQwUJ+A5hqJEH6yQXv44
	RobZtLwfQqA2IWHsasHHTl7zkresJ31VNXOe31UYLnOCrTuxQaZpxPmM2FrJ4+t/W8g3rUVgh+8
	HPYItnA+9ZrpVkabcjKn5pBiAACMVi467IcHNPABqWCZJET/ZIyk/mzW38K2TCotI7KXi8mplFd
	T4zSC/L8eIxpX7cUo8AXMmxPHpFFn7+j0b5dMdOdGZ3PMzszM7NJ8JemEhSfTMDWcI7Cldb9x+H
	FVcDJaH/S3WulPZ49HkK9riYp2LMDIoCqQqPBFGYS47/k6iOXk0dIaPzUNgnXBshcVtuuy4MR8N
	39QNsWX6+xOwDvOyTgltNDTy54PdDnswaPQnmLMAa+63bbEFvfOW1GhOhTdGeWeiz10YzwBW9NW
	6JCNUnlYreaLUPh2RC1sVI5z5KBMFgvGuuMgFWShdr2AjU5vs92zBTr/8STogymrf26FW3rsv9u
	QK7Q7wr8p38DhgY1/2SRuCeLs47Lo1bvdJqVm42NlAmIk=
X-Received: by 2002:a05:6102:f0e:b0:7d2:c786:5a98 with SMTP id ada2fe7eead31-7d64d69e15cmr3999966137.8.1794864138556;
        Mon, 16 Nov 2026 13:22:18 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-34-35.cpe.net.cable.rogers.com. [174.112.34.35])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69e0c53a8sm896282137.11.2026.11.16.13.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:22:17 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto][PATCH 04/05] yocto-bsps: update to v6.18.63
Date: Mon, 16 Nov 2026 16:22:10 -0500
Message-ID: <20261116212211.4068570-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116212211.4068570-1-bruce.ashfield@gmail.com>
References: <20261116212211.4068570-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 21:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250387
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    1cdda838e8475 Linux 6.18.63
    c5f54af611ff6 xen-netback: Zero out sring pointers on unmap
    a97aa838903d1 xen-netback: Fix XenBus connection failure cleanup
    5d68f3fd958b9 apparmor: on failed load ensure profile files are removed before parent
    26d2534b6f1e7 apparmor: fix uninitialized variable warning in aa_inherit_files
    99c09b6a5ebed ocfs2: read the xattr entry hash before defragmenting the bucket
    337783277c0b0 init/bootconfig: pass init arguments in documented order
    662ac91c9ffd4 fs: don't fail __d_obtain_alias() for unlinked inodes
    f4acf474e4dc4 fs: skip copy_file_range write limits when there is no data
    0da582bda88a6 fs: let backing files inherit FMODE_NONOTIFY from the user file
    8bceb60345446 splice: avoid stale f_pos writeback on error
    325b62c958229 iov_iter: fix NULL deref in iov_iter_alignment()
    4a70894450cb4 backing-file: enforce append-only and immutable backing inodes
    7d0e4a0f1aeda aio: fix NULL deref when a fault races ring truncation
    a08cef6d1aead apparmor: remove fs entries created by a failed policy load
    464df36ba29d6 tcp: fix reordering addition overflow in MTU probing
    7d6eccadf776e net/packet: check TX_RING fragments before memory accounting
    e5b1fefc2dcd8 apparmor: check accept index + 1 is in bounds
    4971c6f821ff0 apparmor: avoid potential double free when remapping DFA tables
    8c054c71d47d1 apparmor: fix refcount leak in aa_get_newest_profile()
    f021ba9c6f5e6 tcp: check congestion control restriction first
    594a389f90686 proc: don't let an entry below /proc/<pid>/net be a mountpoint
    bf04f8bdd6f00 blk-iocost: abort weight transfer on invalid donation weights
    24705093eeb28 userns: don't drop the exec securebits
    0aba8e759cfcd mount: refuse setns() with a shared fs_struct again
    f8cd83f7b7ea7 r8152: Use BMSR to detect the link state
    a20f98ffe158e apparmor: don't revalidate inherited files under files->file_lock
    084a9234681ed apparmor: fix NULL ctx->peer derefs in unix socket ctx updates
    6ad9711f4fec3 Revert "net: advertise TCP MSS from the configured MTU, not the learned PMTU"
    4d4bd7bcc14e8 irqchip/irq-msi-lib: Free wired MSI descriptors
    74cc51e2f1bf6 irqchip/riscv-imsic: Report successful hardware retrigger
    b80b417d864b3 fsverity: Be more careful with return value of ->get_verity_descriptor()
    61e7228c53295 kgdb: Fix buffer overflow in the qRcmd packet handler
    009c3d488595e kgdb: Fix buffer overflow in the 'M' and 'X' packet handlers
    129119bb1c3db kgdb: Fix buffer overflow in the 'm' packet handler
    1890437496271 nvmet: Free the old negotiation state when restarting authentication
    13ebf8ef96ac6 nvmet: Finish the blk plug when integrity allocation fails
    32bfe3eddb186 nvme-tcp: fix io_work priority inversion when send_mutex is held
    80b1428dbf81f nvme-tcp: start error recovery when read_sock fails
    5e4325c515dc5 nvmet-fc: Tear down the association when the admin queue allocation fails
    d6792894711a1 nvmet-auth: fix error handling on CHALLENGE failure
    868a29f30f15e nvmet: pci-epf: require SGLs to match the command data length
    5dc1fa00e67e8 nvmet: pci-epf: report transport errors in command completions
    224aa110632ea nvmet-fc: only send read data for successful commands
    36c3af0e94b6c nvmet-rdma: reject short connection requests
    63c2733ed1fc1 ppp: fix stale pointer access after pskb_may_pull in ppp_ccp_peek
    9a048334a7dce ASoC: hdac_hda: Keep runtime PM state in sync across codec remove/probe
    241fed9fa149e ntfs3: fix mapping pairs bounds check for alignment
    61329755f2818 fs/ntfs3: bound DeleteAttribute asize against rec->used in do_action
    2ebe4f0736129 fs/ntfs3: bound CreateAttribute asize against record_size in do_action
    5e3cdfc8554df net: hisilicon: hisi_femac: Stop the receiver before releasing the RX ring
    33e747a4822b7 macvlan: fix passthru promiscuity accounting while down
    3646b7c047170 net: limit priority VLAN untag depth
    7f695fb47b407 drm/amdkfd: evict the queues only once for CRIU PROCESS_INFO
    7f1ed723c1984 drm/amdkfd: validate SRAT subtables before parsing
    48f413a3999ac drm/amd/display: Initialize missing TD-LUT programming inputs
    08a3f27f91a91 drm/amdkfd: split vram_pages of SVM ranges prefetched without a GPU mapping
    cfa7fd53ed06c drm/amdgpu: reject CS chunks too large for kvmalloc()
    ec01397e6c408 drm/amd/display: take a runtime PM reference only when a CRTC turns on
    03bb7b94d6e40 drm/amdkfd: stop restore retries on device unplug
    1916c2f2d1bdb perf machine: Fix NULL deref in thread__resolve_callchain_sample()
    1e70a9c88381b arm64/mm: restrict transparent contpte mappings to valid PTEs
    f5841241474fa cpufreq: stats: Fix potential out-of-bounds access in deferred reset
    4e4c9733886db LoongArch: Fix perf hardware breakpoint failure via installation
    815c31e67f3fe LoongArch: Only send SIGTRAP signal if necessary in do_watch()
    eef4bbc5174dc LoongArch: Fix architectural naming typo for CSR_FWPS_SKIP
    18de2985eb99f LoongArch: Fix bitmask corruption in update_bp_registers()
    53e0ad94f3da1 LoongArch: Remove redundant call in update_bp_registers()
    a307ab34e323b LoongArch: Remove arch-specific __smp_mb__{before,after}_atomic()
    45d58b3dcb3d2 LoongArch: Use pa_to_nid()/nid_to_addrbase() rather than hard-code
    a6a76018c2d66 LoongArch: Call cpu_final_simd() with pure_initcall()
    66995f75c5926 ASoC: hdac_hda: Balance the runtime PM disable in codec remove
    4d81692264062 ixgbe: reserve TX timestamp after skb preparation
    db13dbefa22ee ALSA: hda: Reject codec reset on ASoC (ext_ops) buses
    834ca8b916c76 ALSA: usb-audio: Bound packet copies by the PCM buffer size
    9e48dbf6841e6 loop: check for read-write open mode on LOOP_SET_STATUS in lo_compat_ioctl()
    a6814a094d3bf xsk: restore UMEM flags after failed pool assignment
    a3d1e34ce1284 tcp: limit tcp_tso_rtt_log to a valid shift count
    01c9e3038a39a dt-bindings: clock: ma35d1: Document the missing crystal inputs
    0cc5459983d1e ipmr: fully initialize the synthetic IP header in ipmr_get_route()
    b124b5a2d82f8 bonding: fix out-of-bounds read of arp_ip_target
    1179a864db9df net: usb: pegasus: check rx pkt_len against the received length
    9189524229c35 ASoC: codecs: wsa883x: Accept temperatures across the full trim range
    e4ab85f273f41 ASoC: codecs: wsa884x: Accept temperatures across the full trim range
    a55460a33402c ASoC: qcom: qdsp6: q6afe: fix clk vote response type mismatch
    2431c46f95a35 f2fs: fix to update superblock crc in sanity_check_area_boundary()
    c94e08ae4ad38 ceph: fix uninitialized err in ceph_netfs_issue_read()
    6f8082c1fb88f ceph: validate encoded xattr name lengths
    fa6e5325278c6 ceph: validate MDS reply fragtree split array length
    ff6e8ae28b522 ceph: bound name skips in ceph_mdsmap_decode() by the message end
    512b5cf725d57 ceph: validate fscrypt auth blob length
    32da9f494080b ceph: don't fail write_begin with -EAGAIN after flushing old snapc
    5f4eda68e3188 ceph: clamp MDS reply result code to the errno range
    e1cf4b41bfbe8 libceph: fix out-of-bounds reads from repeated CRUSH bucket entries
    813221c8bbc9c ceph: fix 32-bit overflow in readdir reply count check
    410855d5e5b63 ceph: Fix mds session leak in __open_export_target_session()
    112f3dba7af4d ceph: Fix xattr buffer leak in __send_cap()
    f0dbd6b9b05e9 ceph: fix integer overflow in the snap trace bounds check
    de314d21f7adb libceph: reject an initial monmap with no monitors
    23e0bbd385b17 libceph: reject mismatched CRUSH weight-set sizes
    ab62a3677aadb libceph: Fix multiple unsafe decodes in ceph_oloc_decode()
    7f4f3e6fe58c2 libceph: Fix unsafe decode in ceph_redirect_decode()
    046d542cd77b3 libceph: only set read_from_replica on read requests
    5ab17ed54e8b7 ceph: require the dentry lease record to cover struct ceph_mds_reply_lease
    e9d72cf5d1bf5 ceph: reject mdsmaps that claim more than CEPH_MAX_MDS ranks
    acaec29310a63 ceph: fix out-of-bounds read in ceph_netfs_issue_op_inline()
    5c4d3a1f50545 ceph: avoid pending truncate during nonblocking cap acquire
    2da8a5e6c0abb KVM: arm64: Set HCR_EL2.BSU to Inner Shareable for guests
    4c4c4a69cc2dc time/namespace: Fix overflow when converting absolute deadlines
    035b7372117f1 timers/itimer: Keep a nonzero value at CPU timer expiry
    fa12106f99280 fbdev: atmel_lcdfb: fix list_first_entry() on possibly empty modelist in probe
    e87cd6f7507f6 fscrypt: Fix missing barrier in fscrypt_find_mode_key()
    482a6e8ab6ae8 mm: multi-gen LRU: fix NULL lruvec->pgdat deref with memcg disabled on cmdline
    cb24274f7d304 riscv: mm: exclude invalid THP PMDs from page table check
    41a885c81a18d mm/mempolicy: apply bind policies against the scoped allocation zone
    a402a7a7dea71 mm/vmscan: reclaim every zone in per-node proactive reclaim
    e251079d676c4 mm/mremap: correctly uncharge accountable VMAs in error path
    38efa986446b8 mm/mremap: populate calculated fields in vrm state correctly
    5b040ba4b592f mm/truncate: fix the zeroing end of pagecache_isize_extended()
    abdf941e56626 mm/page_alloc: count guard pages as free again when their buddy merges
    98e52d6946a95 mm/swap: fix swap_cache_get_folio() returning a folio that left the swap cache
    f48ad207e5b61 mm: vmscan: don't count per-node proactive reclaim as memory pressure
    1900cb4401985 ipc/shm: fix RSS accounting for hugetlb shared memory
    be6be6707c295 mm/madvise: atomically clear the young bit on THP MADV_COLD
    695d0c95c13f6 mm/percpu: account full object size for percpu memory allocations
    87f6bb4b82ac4 userfaultfd: fix UFFDIO_MOVE livelock on large folio with extra references
    fe6e101744912 mm/mlock: use a long for the page count in mlock_fixup()
    6dddcb5b8bf84 mm/madvise: add cond_resched() in THP branch of madvise_cold_or_pageout_pte_range()
    e9d4d0f7d9ca5 mm: disallow ioremap'ing ordinary RAM in generic_access_phys()
    7ea08a7ca9e16 mm/hugetlb: account migration target folio in per-node NR_HUGETLB vmstat
    fb307eadea569 mm/mremap: fix calling fixup_hugetlb_reservations() on the wrong VMA
    1b6f6cf3a78df mm/hugetlb: don't clear the resv_map of a VMA whose lock is held
    fa5ee143d0e6f ocfs2/cluster: remove zero-address nodes from IP tree on teardown
    03ea1f756ecf8 ocfs2: snapshot the dentry name while tracing file release
    4dd4043fcfa06 stackdepot: stop preallocating after the final pool
    e93fbad317c8c compat: avoid double rounding in times()
    5e208e3883fd7 scsi: ufs: core: Remove completed-without-interrupt path in ufshcd_abort()
    3c9620afa6086 scsi: ufs: core: Remove an always-false WARN_ONCE()
    e89d8e7c00ec5 scsi: libiscsi_tcp: Prevent R2T range check overflow
    657a3f18227d3 scsi: ufs: core: Clear stale UIC result byte before peer DME retries
    a3e6b9d63f454 scsi: ufs: bsg: Clear the reply buffer before use
    6252388f4ee90 scsi: ufs: bsg: Complete the job on error
    9a62816f8891b veth: fix stale peer max_mtu on XDP program replacement
    57492dac0edfd genirq/kexec: Do not take the bus lock of an interrupt chip on the crash path
    ca59f6aa7c29c gve: fix out-of-bounds read in gve_get_flow_rule_entry()
    5244ac2547e5d cgroup: don't kill migrated processes through their exiting threads
    5ba40b5a2d622 timekeeping: Update offsets on sequence counter retry in ktime_get_update_offsets_now()
    a1028ed2d71d2 posix-cpu-timers: Fix pid refcount leak in do_cpu_nanosleep() signal path
    2e98c0261fc6b spi: zynq-qspi: fix address buffer corruption and support 4-byte address
    20661adcee878 i2c: mt7621: fix copying uninitialized kernel stack with reduced page_len
    0a71f66c8f3ee ASoC: tlv320aic32x4: Prevent division by zero in divider callbacks
    d9c558a9a047c parisc: eisa_enumerator: Fix out-of-bounds reads of the EEPROM buffer
    930132f707c7e gpiolib: don't report -ENOMEM for a requested line without a label
    532570df1ea04 tpm: fix zero-length read discarding the pending response
    160acc23dea8d tpm: tpm_nsc: stop using the cleanup callback as dev.release
    5ce06b8a03a7d tpm: tpm_nsc: fix NULL pointer dereference on init failure
    25a82a5973857 i2c: designware: queue only one read command for block reads
    2fec4e4547ee2 i2c: acpi: Fix adapter reference leak in i2c_acpi_new_device_by_fwnode()
    55441fd252579 cpufreq: intel_pstate: cancel HWP notify work in driver cleanup
    4429d405124e6 ucount: take the rlimit reference before checking the limit
    848ca02a4a39f listmount: don't wrap around with a U64_MAX cursor
    0be8ba845e49a statmount: don't copy the reserved empty string past the buffer
    d14b8b4bad5c4 exportfs: Release the get_name() directory file synchronously
    3402ea1ee81cb tipc: fix broadcast sender hang on last acker departure
    7511c1c4baa94 net: wwan: iosm: validate msg_head before indexing msg_ring
    62518ed062b5a nvmet: take subsys->lock while force-reconnecting in nvmet_subsys_attr_qid_max_store()
    e204d8b84f97b sh: maple: Use the matching IRQ cookie when invoking free_irq()
    5ec6159e99f1d ALSA: aloop: Update the PCM Slave controls for a matching playback
    0a4c515925cc1 writeback: clear old wb dirty state after inode switches
    7ad9304dbef13 writeback: reset dirtied_when when switching wbs
    d84a3fde13fb8 platform/x86: asus-wmi: fix TUF keyboard power state shutdown naming
    ade5975527b7f Documentation: hyperv: Update documentation for sending VMBus packets
    ff7cf939ebe93 ocfs2/cluster: initialize heartbeat regions before publishing them
    9d74fa5c7b7db ocfs2: deal with legacy signed xattr name hash values
    bd188a034bb18 ocfs2: use the stored hash when checking xattr bucket collision
    be9f947632398 ocfs2: deal with legacy signed dir index name hash values
    aea3d821519b5 ocfs2: reserve value tree metadata when moving an xattr into the inode
    16452d2c14525 ocfs2: reserve metadata for a new xattr block and its value tree
    6d1ca6232ed36 alpha: determine tininess after rounding in the FP emulation
    ea1c50e9f1362 net/smc: queue the copied chunk when smc_tx_sendmsg() faults
    bea16873a071b net: unix: reject negative max_dgram_qlen values
    80ee045485b98 net/rds: ib: don't enable IRQs in rds_ib_conn_free()
    fbeb004b09658 PCI: qcom-ep: Deinitialize endpoint on remove
    83babb4004865 fbdev: bitblit: Fix glyph clipping when fbcon pans
    9e93f41a34839 ipv6: do not restart DAD for a dead ifaddr
    1ca1ed1e5752c ipv6: initialize temporary ifaddr before publication
    ff386540eef6f ipv6: serialize address publication with device teardown
    ac01bab1bff8f ipv6: remove ifaddr from hash during ifdown list cleanup
    58d07ddaa5f33 drm/amdkfd: correct vram_available calculation
    c2a3bef88fe10 amdkfd: Fix memory availability double accounting of kfd pinned objects
    2368f9aed09cb drm/amdgpu: wait for pending page table updates before switching a VM to CPU updates
    2cbdce3fdf929 drm/amdkfd: wait for a GPU reset before freeing a BO
    38bb73854a4a0 drm/amd/display: Fix swap in median3() for DSC rate control
    b260effe83a65 drm/amdgpu/gmc9: add extra type-2 TLB flush for gfx942/gfx950
    1436e441ad19a drm/amdkfd: don't drop an SVM CWSR reference that was never taken
    01d08b4de4b1f drm/amd/pm: reapply umd profile state after recovery
    b900cb2316ff7 drm/amdgpu: reject ANONONLY userptrs that span multiple VMAs
    87a531b56f2b8 drm/amd/display: don't WARN when removing an unallocated MST payload
    2081dc2912470 drm/amdkfd: fix doorbell allocation race creating duplicate allocations
    7c43b9c2e9f80 drm/amdgpu: reset VI ASIC on Apple boards with VRAM at 0
    6130c38c3e735 drm/amdgpu: reset CIK ASIC on Apple boards with VRAM at 0
    94b703ea1438c drm/amdgpu: reset SI ASIC on MacBookPros with VRAM at 0
    d72ea8b655133 drm/amdgpu: require _PR3 for BOCO
    1c2c129c4e7fc blk-mq: clear stale inactive flag on hctx reuse
    2d12e5db33175 gpio: pca953x: Handle direction register read errors in IRQ paths
    e27d2775f9dbf gpio: davinci: Clear interrupt status in every bank on suspend
    0f3f389215cb8 ALSA: line6: Handle period elapsed calls outside the locks
    0fad7fba30c8b gpiolib: Free chip resources when allocating the label fails
    7dff4e2578fee ALSA: emux: Stop voices before freeing zones in all cases
    7986ac275e14f ALSA: mtpav: restore negation dropped in guard() conversion
    6d379def894e2 ALSA: compress: reject restarting an ACTIVE task via origin_seqno
    50eb0b68ff644 ALSA: compress: add missing OPEN-state gate to SET_METADATA
    bda1fb7c15d9c ALSA: compress: reject buffer geometry change on gapless next_track
    f82eafe282ea3 ALSA: compress: fix buffer leak on failed SET_PARAMS
    d43792f4263a3 net: gro: don't chain linear parts larger than gso_size into frag_list
    c59b5fcbc7b77 netdevsim: reject cls_bpf programs bound to another device
    dba8661486021 cgroup: fix cgroup.kill for exited thread group leader
    8126595cc9ab1 Revert "Input: matrix_keypad - force switch rows to input mode"
    8803593347710 Input: always accept EV_SYN in input_event()
    fdb8628449f31 hwmon: (acpi_power_meter) Fix 18.45 TW bug
    6ffb37e91e6bb hwmon: (sht3x) Return the consumed count for heater writes
    5cc7fddfce17f rtc: pcf8563: pass the driver data to the alarm interrupt handler
    45e57ee17b8a5 platform/x86/amd/pmc: Fix RTC reference leak in amd_pmc_verify_czn_rtc()
    5e2b198a23842 rtc: cmos: Disable ACPI RTC event before handling it
    4b6177c53f05c dax: fix wrong error code returned from dax_dedupe_file_range_compare()
    f78eff4218be3 f2fs: fix submit accounting for IPU writeback
    9738228aeaf27 f2fs: flush SIT journal during filesystem resize
    e1db6d1f020ea hwmon: (gigabyte_waterforce) reject short input reports
    9e4af1fa6eb13 hwmon: (coretemp) Fix handling of isolated SMT siblings
    306a7db6aaa19 netfilter: nf_reject: initialize IPCB at inet ingress
    c2b9c053512ea ALSA: hda/realtek: Fix headset mic on ASUS Zenbook 14 UX3402VA
    1677727695475 gpiolib: cdev: don't set GPIOD_FLAG_IS_OUT
    78b8738d6656a lib/buildid: reject file offsets that do not fit in pgoff_t
    2affbfaa1db57 hwmon: (corsair-cpro) Make wait_input_report_lock IRQ safe
    6ad77a47904e8 hwmon: (sht4x) Reject incomplete heater command transfers
    580203eaebaa6 hwmon: (sht4x) Fix jiffies wraparound in heater-ready check
    90cc16ecf4a70 spi: ch341: handle transfers without a TX or RX buffer
    ccda4439445c0 ALSA: hda/via: Apply runtime PM workaround for ASUS X55A
    1ded6b545bade alpha: do not skip TLB shootdown IPIs for kthread-borrowed mms
    7e2ff6da9ecf1 alpha: do not clear remote MMU contexts in migrate_flush_tlb_page()
    42c4ea2255214 alpha: invalidate the local context in flush_icache_user_page()
    4f2aa02c88658 alpha: invalidate the local context in flush_tlb_mm()
    8002dacea4708 alpha: fix the local TLB invalidate in the UP flush_tlb_page()
    be818ec671dba alpha: fix the local TLB invalidate in flush_tlb_page()
    5aa85f90a825b alpha: invalidate the local context in flush_tlb_page()
    a26392e2fde8c alpha: only use a targeted tbi() when the target mm is really current
    07b4cbae20607 alpha: run check_mmu_context() from finish_arch_post_lock_switch()
    bc958129a5739 alpha: load the MMU context when switch_mm() switches the current task
    11452dc2e6bb4 alpha: handle VM_FAULT_HWPOISON in do_page_fault()
    935f03f988830 power: supply: qcom_battmgr: Notify charger supplies of online changes
    7ba7ddbf458cb power: supply: generic-adc-battery: fix status with no supplier
    b66d83f861839 power: supply: cros_charge-control: restore EC state on resume
    69c4e9c13afa2 power: supply: qcom_smbx: set the charge enable after software control
    6c8413f5412d2 ALSA: hda/realtek: Fix internal speakers on Acer Aspire AL16-31P
    3c4c6b318e7f5 ALSA: seq: oss: Skip events until fully initialized
    8975faca8c9d3 mptcp: fix subflow bitfield misuse
    e07db95b63a17 mptcp: reset msk state on early connect failure
    ab36779bedcf1 ipc, msg: Account msg_msg allocations with GFP_KERNEL_ACCOUNT again
    448dba9b2af31 ublk: pin module while release work is pending
    0e49fbd593ed3 fuse: fix copy_file_range reply handling race
    6bbdb8bf46ef3 virtio_fs: read the vring size under virtio_fs_mutex in ->get_tree
    d75a44d360b64 fuse: don't launder folios of a bad inode
    c51d1779ff5ab cpufreq: loongson3: Replace IOCSR read/write with MMIO ones
    24288c516442f cpufreq: loongson3: Use global physical CPU ID in get/target callbacks
    e22aba38a54f1 cpufreq: loongson3: Replace per-package mutex with per-node
    e4d2571effd19 cpufreq: loongson3: Adjust the width of id and val in smc_message
    409efb4f12b95 cpufreq: loongson3: Make this driver depend on MACH_LOONGSON64
    4980879032bbc RDS/IB: validate receive fragment completions
    a3203fbd9bf6e sctp: hold transport reference across connect wait
    6f511bbaa33b9 ipv6: defrag: orphan skb before queuing
    818fb17d609ba net: skbuff: don't BUG() on a bad csum_start in skb_copy_and_csum_dev()
    dfa1499fdca9a ublk: reset the FETCH round under ub->mutex
    44322a7293f15 ublk: reset the FETCH round in release also without a disk
    50e8c09605b42 dax: fix dax_range_compare_iter() to use correct size and address offset
    faef48ba42866 dax: Return errors from dax_core_init()
    2c5a807800b5f ring-buffer: Take cpus_read_lock() when changing the subbuf order
    7fe49d46b305c erofs: use on-disk blkszbits for lz4 max pcluster bound
    01c73963d83b3 spi: amd: validate FIFO usage before executing message
    bf56e0e3cd678 spi: amd: fix len==0 underflow and FIFO overflow
    95b03c926dcce PCI/PM: Restore BARs after powering up during enumeration
    67221e6133a92 spi: bcm-qspi: reject oversized dummy bytes in mspi exec_mem_op
    258d92898ea30 ASoC: qcom: q6apm: reset the hw pointer with the fragment queue
    42e39e25b62e2 mfd: tps65217: Use devres for IRQ domain and wake teardown
    081e702e1a4aa mfd: tps65217: Check return value when masking interrupt sources
    c4ac68d07c812 mfd: tps65217: Fix NULL pointer dereference on IRQ init failure
    4a8f333446c10 spi: npcm-fiu: limit UMA data_size to the 16-byte staging buffer
    a2045078fe859 KVM: arm64: Turn vcpu->arch.pause into a counter
    cbf52d6ce1d98 KVM: arm64: Move IN_GUEST_MODE ahead of state being loaded
    4c5b129a54498 KVM: arm64: Move OUTSIDE_GUEST_MODE publication past context being saved
    d93e70dca09ab efi/libstub: Don't replace an existing LINUX_EFI_MEMRESERVE table
    e9c140e506617 efi/libstub: arm64: Don't use the platform register x18
    9c9bbb6a87805 spi: jcore: fix divide-by-zero when speed_hz is zero
    a59760cefb24e gfs2: fix the escaped block copy in gfs2_before_commit()
    443730e39b1b7 ALSA: ump: Correct return size of fill_rpn()
    ce6abad3ea47d irqchip/atmel-aic[5]: Disable interrupts in the irq_pm_shutdown() callbacks
    537b8eabc1c39 irqchip/mchp-eic: Fix clock reference leak in mchp_eic_probe()
    aa309d71afdfb irqchip/imx-intmux: Fix runtime PM teardown on remove
    d7c633ef35278 irqchip/gic-v3-its: Don't clamp nvecs to zero when id_bits is 32
    335a0eaaa0d72 crypto: qat - fix use of destroyed vf2pf_lock on VF restart
    741ac7c9673e6 crypto: qat - initialise state_lock on every path in adf_devmgr_add_dev()
    db48290405485 iommufd: Reject a zero-length dirty bitmap request
    72e298e41885b kbuild: AutoFDO: Update split machine function argument for upstream rename
    9e9554d3906ce PCI: xilinx-xdma: Fix device node reference leak in xilinx_pl_dma_pcie_init_irq_domain()
    c48802c7cc667 cpufreq: schedutil: Serialize sugov_start() against rate limit updates
    eb86688484688 Bluetooth: L2CAP: Use default TxWindow for zero socket option
    c00719deed5b6 Bluetooth: L2CAP: Reject invalid TxWindow in configuration requests
    ef5743bd6ede0 Bluetooth: L2CAP: Reject mode changes on connected channels
    967b028e2d39d Bluetooth: hci_debugfs: Pin module for debugfs file operations
    658da2402f4bb Bluetooth: 6lowpan: Pin module for 6lowpan_control debugfs file
    c63c5e1d19ad0 Bluetooth: btusb: Add device ID for Realtek RTL8761BUE (StarTech AV53C1)
    b60a589783eb9 Input: xpad - add GameSir Nova Lite support
    8073652f5c220 PCI: Set supported_speeds in set_pcie_port_type()
    9d71a347dcee1 ARM: 9523/1: topology: allocate the cacheinfo early on the boot CPU
    9c6cd241d67f9 ARM: 9522/1: cacheinfo: guard the CLIDR read in populate_cache_leaves()
    d75ac6be6915c ARM: 9521/1: cacheinfo: count external caches in early_cache_level()
    e9eb621dc62b5 ARM: 9520/1: cacheinfo: avoid out-of-bounds write in populate_cache_leaves()
    06d167658ab53 ARM: 9491/1: alignment: restore uaccess state on emulation fault
    014e83749f5e3 ARM: 9488/1: smp: set current pointer in assembly before jumping into C
    874ed54f09c60 spi: cadence-xspi: fix stack buffer overflow in the Marvell b0 path
    1927f66f8ca6f nvme: make the DH-HMAC-CHAP secret attributes readable by root only
    5819b86e06240 iommu/amd: Don't allocate kdump device table from DMA32
    c043a0aa81253 iommu/amd: Program device table when kdump reuse fails
    f69cfb5188bf3 serial: pmac_zilog: push received data to the port that received it
    b0c1eed0e69dd serial: amba-pl011: keep transmitter enabled when disabling RS485
    57c22a5b141d9 serial: amba-pl011: honour delay_rts_before_send for every write
    0517d5fa233b1 serial: 8250_omap: set priv->line before enabling the IRQ
    fb0e78bacda6b serial: 8250_lpss: do not touch uninitialized line in ehl_serial_exit()
    c04cd1d081822 platform/x86: hp-bioscfg: NUL-terminate the SPM auth token
    b4b1bd4e0c1e7 platform/x86: hp-bioscfg: allow clearing current_password
    3da998f09826f platform/x86: hp-bioscfg: return -E2BIG from validate_password_input()
    341ec94586d09 platform/x86: hp-bioscfg: fix non-ASCII truncation in hp_get_string_from_buffer()
    e7e97446125b7 platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
    15e36dc9be7b6 ALSA: cs46xx: fix unit mismatch in DSP code area bounds check
    1490243650926 platform/x86/tuxedo: Fix keyboard LED map ordering
    3648e9257696c ALSA: hda/tas2781: Skip invalid TAS2563 UEFI calibration data
    075a08d5160c1 tmpfs: fix unicode_map leaks in casefold option handling
    664ef42230020 lib: decompress_bunzip2: fix integer overflow in run-length decoding
    0c30c5acdfd98 panic: flatten nmi_panic control flow
    da262f1e8a4dc lib/decompress_bunzip2: fix off-by-one in run-length bounds check
    58e931c3b18e7 pinctrl: stm32: Fix fwnode reference leak in stm32_gpiolib_register_bank()
    91ff04f521386 spi: ljca: Don't require data in write replies
    3c50eeaf05d50 spi: ljca: validate the response length before copying the data
    5e93214d8ccbf f2fs: disallow mmap write and data-modifying fallocate on atomic files
    16cb21f3f9929 f2fs: fix defragment writeback range truncation on 32-bit
    7f05045920629 f2fs: check every cur_*_segno[] entry on readonly images
    eb87db3cdf260 f2fs: read i_size once in f2fs_vm_page_mkwrite
    eb9b8c03d260a f2fs: allow pinning empty compressed files
    d16d2bb0141cd f2fs: remove mappedtodisk flag usage in mmap write path
    35acdbaaddd2e sh: intc: Sort the prio and sense lists after filling them
    6a590ce873e05 PCI: rockchip: Drive at 2.5 GT/s, error other speeds
    2e7f6ad5e0c24 PCI: rockchip-host: Do not attempt 5.0 GT/s retraining
    6112018146016 PCI: rockchip-ep: Do not attempt 5.0 GT/s retraining
    1f49d6a95e959 f2fs: convert inline quota files when turning quota on
    124db30f332f6 nvmet: zns: don't leak stale memory in zone management receive
    88d7fce496e65 nvme: bound FDP config log reads to the received buffer
    b0c652a11e536 nvmet: require authentication before property set
    ef062530729f0 nvmet: free the bvec on file namespace range errors
    81b9f59167067 nvme-auth: fail when the controller does not authenticate itself
    7a4ee76f0e8f4 nvmet: fix preempt of another registrant by the reservation holder
    5564d7a654a7b nvme-rdma: don't complete a request after a bogus remote invalidation
    d6c4a5d2cc6ad iomap: don't lose a fiemap iteration error when emitting the last extent
    d8e8a00721a21 clk: qcom: ipq5332: add 24MHz rate for USB UTMI clock
    deea3afb1aca2 clk: qcom: ipq5018: add 24MHz rate for USB UTMI clock
    29d810702de08 clk: qcom: ipq-cmn-pll: Assign .num before accessing .hws
    1a40cbb9d83ad speakup: Fix NULL pointer dereference on VT switch + selection
    4180ff5884387 mei: vsc: Fix packet CRC computed over pointer size
    ac188323d3333 dm-bufio: fix a race leading to an unsigned integer underflow
    0f39d51bd5f3d dm-bufio: fix non-working memory limit
    55265c0f41ebe serial: 8250_exar: store the GPIO platform device in struct exar8250
    df083198ddca2 fbdev: kyro: Release WC setup on registration failure
    8e21bbb7c2ce7 fbdev: sh_mobile_lcdc: check for fb_deferred_io_init() error
    db62efc3ecbd4 fbdev: smscufx: check for fb_deferred_io_init() error
    b4165e730e780 fbdev: udlfb: check for fb_deferred_io_init() error
    99059dc7ee7bd fbdev: xen-fbfront: check for fb_deferred_io_init() error
    51d8437aff718 fbdev: ssd1307fb: check for fb_deferred_io_init() error
    2e4f453c3c191 platform/x86/intel/vsec: Fix inverted walk_header() test in get_features()
    74eee7cc1aea3 platform/x86/intel-uncore-freq: Continue restoring limits on resume
    70ef07bf84276 platform/x86/amd: hfi: Fix out-of-bounds reads when parsing ranking data
    4a5b0194b8d8c platform/x86: simatic-ipc: fix platform device leak on registration failure
    5d82777974b15 platform/x86: oxpec: Fix Apex charge limit control
    3857d41c7d4db platform/x86/amd/pmf: Fix power_supply refcount leak in amd_pmf_get_battery_prop()
    d904db0a4d32b platform/x86: hp-wmi: fix heap OOB read and memory corruption in hp_wmi_perform_query()
    b34024fae1d6f platform/x86: hp-bioscfg: fix 16-byte heap overflow for empty auth token
    16114eb40778e platform/x86: asus-wmi: fix screenpad power state detection
    4b003a2ab6775 platform/x86: asus-wmi: fix unclear usage of bd->props.power
    d43e5fc381a9c platform/x86/amd: Stop counting intermediate cycles with metrics table
    0beb6ba8c6b5b platform/x86/amd/pmf: Validate the APTS state index
    42d4192fa9045 mm/damon/core: charge only the part of a region the filter left
    528d332bb864a mm/alloc_tag: account for reserved tag ids in the kernel tag check
    b5b95b5176045 mm/shmem: report RCU-tasks quiescent states while undoing a range
    08ff60709252d mm/hugetlb_cgroup: move per-node usage on cgroup reparenting
    42dd1e6f1b090 mm/hugetlb_cgroup: move per-node usage on cross node migration
    a4bd35798a342 mm/page_alloc: do not boost watermarks in kdump capture kernels
    45555f91acf8a mm/madvise: use folio_trylock() in the cold/pageout PMD split
    06eebc1800082 mm/madvise: reclaim isolated folios if PTE restart fails
    ebc5521bed887 mm/damon/sysfs-schemes: read sysfs_filter->addr_range only once
    a1aaab4ae87a7 PCI: Avoid D3 on PLX PEX 8532/8533/8548 downstream ports
    85eaf47588492 xprtrdma: trim head iovec when the payload arrives via a Write chunk
    aa7065b8c699d xprtrdma: prevent disconnect feedback during endpoint teardown
    d05766991f871 mtd: parsers: qcom: fix offset/size overflow on large partitions
    caacd77e93d92 mtd: rawnand: qcom: fix read location register usage in config_nand_cw_read()
    acc0ad90eefb7 btrfs: return -ENOTTY for unknown ioctls on the control device
    3c61ac2bec9c9 btrfs: zoned: fix block group reference leak in btrfs_repair_one_zone()
    36e0970b8217d arm64/efi: Clear PTE_WRITE when applying EFI_MEMORY_RO
    6b84be6acf4a1 dm-snapshot: fix crash if dm_io_client_create fails
    f5a35fc0dcac6 USB: serial: sierra: fix urb leak on write completion
    f1f969a190357 mailbox: qcom-ipcc: Guard against NULL con_priv in send_data()
    35ee206bdab6c mailbox: mtk-cmdq: Fix runtime PM leak in cmdq_mbox_flush()
    9db206e80d084 mailbox: bcm74110: Cap rx_svc_init_list growth to prevent PMC-induced OOM
    e763f02317760 mailbox: altera: shut down RX polling timer on channel teardown
    dfe2627f25b1f usb: typec: ucsi_ccg: Add retry mechanism in ccg_read
    857ba63871a01 xhci: Prevent invalid vdev dereference during sideband unregister
    d0d15d7a11f2a usb: xhci: Fix bounce buffer overflow
    5d254d1e59da5 usb: typec: ucsi: ccg: Validate altmode index in GET_CURRENT_CAM response
    a0234e0c052c3 USB: quirks: add USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE for GameSir G7 SE
    d585cf76296c9 USB: cdc-acm: add VeriFone VX820 device ID
    6c3de683d73d7 lib/plist: fix plist_requeue() corrupting order in the last bucket
    97c37dff8da73 cxl/acpi: Convert QTG _DSM latencies to picoseconds
    e5ab68567bcf6 cxl: Account for link width in latency calculation
    f4b79f221d623 cxl/port: Convert PCIe link latency to nanoseconds
    93658e949bcaa cxl/pci: Program the Port GPF timeouts before caching the DVSEC
    03c8debe85948 vfio/mlx5: Fix boundary check in set_report_output()
    bb8ff1e7c85a7 RISC-V: KVM: Fix IPI delivery for out-of-order vcpu_id
    24f7f97d30512 xen-blkfront: Fix IO race during unplug
    f307ab1738e77 slimbus: messaging: fix leaked PM vote on tid allocation failure
    778aa24d400ea USB: serial: usb_wwan: fix urb leak on disconnect
    1a95eef28e3a0 USB: serial: option: add support for ASR 1286:4e3c modem
    f8b51537bad34 USB: serial: option: add Rolling Wireless RN947R
    6a206ea1cfce6 USB: cdc-acm: fix urb leak on disconnect
    ada2a9bcb9c49 wifi: ath12k: validate MAC/PHY capability count before saving
    c2cbf1f5c5350 ALSA: usb-audio: Add mic resolution quirk for Logitech Webcam C200
    428eeed252ba1 drm/ttm: return an error when kmapping a BO without pages
    0ec1d83baa7b3 iommu/dma: Catch scatterlist length overflows
    8ddf9f17929de xen-pciback: Fix pcistub_device ref leak in pcistub_get_gsi_from_sbdf()
    01ed474a52876 xen/pcifront: check that an AER callback exists before calling it
    b766cd114640a xen/privcmd: Only claim ioreqs matching an ioeventfd
    c3575058ef57d soc: fsl: dpio: Free the IRQ before releasing the I/O object
    e3b8930696727 soc: fsl: dpio: Fix cleanup on IRQ registration failure
    7bc4323b464d1 soc: fsl: cpm1: tsa: Fix clock leak in tsa_of_parse_tdms()
    a0e83ac1d99e9 xen/gntdev: prevent private mappings from becoming writable
    2b637d3f1d223 clk: imx: Fix clock reference leak in imx_obtain_fixed_clock_hw()
    e5a02a186b461 clk: imx: Fix clock reference leak in imx_get_clk_hw_by_name()
    fac98d283c77a mm/zswap: enable zswap_ever_enabled in zswap_pool_create()
    18223e4783fe0 mm/zswap: publish the initial pool with list_add_rcu()
    4b10d04a68b8e mm/hugetlb: fix subpool minimum reservation rollback
    67c5a7bef45e1 mm/nommu: reject wrapping ranges in access_remote_vm()
    e4dcde9709a25 mm/execmem: free ROX cache chunks only when they span an entire vm area
    61b405ef3e35b mm/memory: constrain generic_access_phys() to page boundary
    49f6bd347a7b7 md: don't hand out the array before md_alloc() has added mddev->kobj
    7bcffd24502d6 nilfs2: validate directory position after llseek in readdir
    02eea74948bda ext4: fix out-of-bounds read in ext4_get_group_info()
    eb69dba4610f6 ext4: fix ABBA deadlock in ext4_rmdir()
    16c511466a87d ext4: don't report delalloc data as a hole on indirect-mapped inodes
    2de6fe2980963 ext4: skip extra isize expansion while unmounting
    ab41325c105db jbd2: don't advance j_fc_off before the buffer is recorded
    d8c47fba16b98 ext4: reject delalloc to nodelalloc before applying remount options
    9e7b9a6cb7448 ext4: fix fast commit replay failing on a read-only mount
    c8835d955dc6b ext4: only update tune mount options when requested
    82c9bc868b49d fanotify: report names longer than NAME_MAX
    4bc8cef2303f0 ALSA: hda/hdmi: clamp sad_count in ELD proc write handler
    d37861288c5de ALSA: hda/hdmi: clamp num_cvts against cvt_nids[] in hdmi_read_pin_conn
    ca4d514d32a9c crypto: algif_skcipher - rewind rounded output bytes
    92eb10d78d07b wifi: rtw89: fix IE length passed to cfg80211_find_ie() in WoW AKM
    3d1e0085b5d24 PCI/sysfs: Pass the device name length in UTF-16 code units
    deea0b755ccba aoe: pull in the headers each received packet type reads
    66cb7a60e0aa8 spi: stm32: fix double free of SRAM buffer on MDMA fallback
    5dc170af53674 clocksource/drivers/digicolor: Fix clk reference leak on request_irq failure
    61cde0b5c1274 clocksource/drivers/fttmr010: Fix clk reference leak in error paths
    b63fac9e76caf wifi: mt76: mt7996: fix PCI device reference leak in mt7996_pci_init_hif2()
    79bebd5637d4a wifi: mt76: Fix of_node reference leak in mt76_get_rate_power_limits()
    de7a5fdb25861 wifi: mt76: mt7615: cancel reset work during unregister
    ff57cd58c75d7 wifi: mt76: mt7925: cancel mlo_pm_work on the USB stop path
    09c14715c6c22 wifi: mt76: mt7615: restore DBDC state after ext PHY failure
    001c88ed4a17e wifi: mt76: fix memory leak in USB TX path
    2fff1ca283f1e wifi: mt76: mt792x: fix UAF in SDIO TX path when out of memory
    9d67b9bf659ff wifi: mt76: mt7615: do not tear down BSS/STA state for monitor vifs
    ffbb00ff33fe7 wifi: mt76: mt76x02: validate TX-status rate index before mac80211 handoff
    8463ea8d471ed ocfs2: skip uninitialized lockres in ocfs2_mark_lockres_freeing()
    de648cd4c54e6 ocfs2: restrict OCFS2_INVALID_SLOT suballoc slot to system inodes
    68bcb60fcbba3 fork: honor task_struct's declared alignment
    70ba414a149b7 selftests/core: fix unshare_test with large fs.nr_open
    407e148354ac9 ocfs2: free replay slots in ocfs2_recovery_exit()
    4db8432061545 ocfs2: exit recovery thread on mount error path
    46e0c9c62927b init: fix early boot crash with bare hostname parameter
    afc4b63805254 USB: gadgetfs: do not WARN about excessively large memory allocations
    de69081c154e8 fault-inject: fix dentry leak
    50f237e8fcf93 fat: fix fat_ent_write() for reverting the value
    a1b937d0e196b resource: fix lost wakeup when waiting for a muxed region
    4a73bd9f0b78a mm/damon/sysfs: set next refresh jiffies per sysfs context
    34902f2cbcc8d mm/damon/core: handle extreme memory state in damon_get_node_mem_bp()
    eea4e41924e88 mm/damon/vaddr: respect folio end for DAMOS_STAT
    9511b63a1f0df mm/damon/paddr: respect folio end for DAMOS actions except STAT
    3f70cd14b0aa2 mm/damon/paddr: respect folio end for DAMOS_STAT
    5025b3035b74c mm/page_table_check: skip zero pages
    da32aae509221 mm: memcontrol: raise MEMCG_MAX for charges that fail without reclaiming
    1140b3a60d9d8 mm/mempolicy: take a cpuset cookie for the interleave node count
    21550a58fa026 mm/page_isolation: guard compound_order() against racing
    a793ea58f4a0f mm/page_isolation: fix UBSAN shift-out-of-bounds warning
    ad72cc6babdd6 mm/ksm: mark migration stores with WRITE_ONCE()
    9c925a7c4dcda wifi: brcmsmac: Adjust txpwrindex value in nphy_ipa_rxcal_gaintbl_2GHz
    bbcd20a342158 PCI/AER: Fix memory leak in aer_recover_queue() on kfifo buffer overflow
    5ed7a6aed407e PCI/DOE: Fix double free of a duplicate feature's sysfs name
    dabc4681985f5 dlm: fix send buffer backpressure handling
    6bf6bf2db6e29 floppy: return the drive state flags from the 32-bit FDGETDRVSTAT
    79c9a5bb4b3c5 floppy: don't store a stack buffer in timeout_message
    097a336a2dcd0 ASoC: codecs: rt5682s: disable jack detection work on shutdown
    8e7e5b7b10da2 svcrdma: Grant credits from the clamped sc_max_requests
    59ab22bedd527 perf: xgene: initialize lock before requesting IRQ
    3eeae9c6d55ed power: supply: ab8500_fg: Report sub-percent charge changes
    8bc833472436a power: supply: ab8500_fg: Accept status from supplied power
    c1c3af4603375 ALSA: aloop: Don't constrain playback params in notify mode
    35af27e6cdefe fsverity: hoist statx reporting of fs-verity flag
    a99338df4ab9c power: supply: core: Honor supplied-from with CONFIG_OF=y
    6c01b58b23f95 media: hantro: disable runtime PM before hardware teardown
    48969667d0042 media: amphion: fix runtime PM imbalance on probe failure
    b7dcd99be024c media: hantro: Harden MPEG-2 control access against NULL
    855012e5e1bb6 media: vicodec: fix NULL deref on oversized frame
    b747b30491bf4 media: mediatek: jpeg: retry HW selection after successful wait
    1c1507214f15d media: verisilicon: rockchip: Fix leaks in init
    7251a4a129f3a media: mediatek: vpu: release reserved memory on remove
    2ebeb7f74276b media: mediatek: vcodec: destroy core workqueue on remove
    f3cef7132743d media: mtk-jpeg: Fix runtime PM leak in mtk_jpegenc_worker()
    a210840ed7092 media: mtk-jpeg: Fix runtime PM leak in mtk_jpegdec_worker()
    5a603c6e1a873 media: platform: mtk-mdp3: Fix device reference leak in mdp_comp_init()
    bf8913279f3ea media: mediatek: vpu: free IRQ before destroying watchdog workqueue
    eb0a592ae6629 media: amphion: prevent unbind while video instances are open
    4fc56ebae1e1f media: amphion: drain message work before releasing core state
    b186accb1d7d8 media: meson: vdec: size capture planes from the aligned canvas
    bdc3f5859be5a media: chips-media: wave5: Check decoder qbuf runtime resume
    df569382cf48e media: chips-media: wave5: Balance runtime PM on encoder close errors
    b683d0501f8b7 media: chips-media: wave5: Handle polling IRQ thread failure
    11b788b55f924 media: sti: delta: use unaligned accessors for MJPEG SOF fields
    aaa44163b04f0 media: v4l2-common: Fix P010 format info
    22f5872567c51 media: imagination: Fix value clamping in calculate_qp_tables
    6d8da67c1c0e6 KVM: arm64: vgic-v3: Roll back assignments from the new region
    513f62c104189 soc: samsung: exynos-pmu: fix error paths in cpuhotplug/idle states setup
    94829b1235137 KVM: arm64: vgic-v3: Undo assignment on iodev registration failure
    8f8319e45493f x86/bugs: Fix CONFIG_MITIGATION_RETPOLINE=n mitigation reporting
    21b1af61dafd5 KVM: arm64: Validate the host vCPU's VM before reading it under pKVM
    8e9628f42c7c9 crypto: ecc - Handle exceptional points in Shamir multiplication
    5ecd94581c322 crypto: nx - validate 'ignore' before subtracting in decompress
    5393887ab975d hwrng: core - reject unknown RNG names
    99cfdc3715846 hwrng: ba431 - fix reported byte count
    987b7053bde17 hwrng: amd - report partial reads in non-blocking mode
    f3e503a31d3cf crypto: caam - fix double-free in caam_rsa_set_priv_key_form()
    72af96b39afd6 media: uvcvideo: Fix NULL deref on events for uninitialized controls
    3c379310c8b80 PCI: Disable MSI for ULi M1575 EHCI controller
    59e69a73f9b2a block: amiflop: synchronize flush timer before track flush
    9a3288b2380d5 block: drop the cached plug time when blk_add_rq_to_plug() flushes
    aaed8f7c2a653 pps: generators: stop the generator on unregister
    2ea73c70014ff KVM: arm64: Fix MMFR0 TGRAN advertisement for pVMs
    bfef7c3b8be1f dm-writecache: fix REQ_FUA processing
    33fedef97da96 dm-writecache: fix uncommitted_blocks underflow
    6f3e29d421deb dm-writecache: fix a crash if we attempt to use non-dax device
    8b8734f39f524 dm-writecache: fix a quirk in statistics
    a05de3e14079f dm-writecache: report I/O error if flush failed
    affc1ebd65f51 dm: fix a bug in dm_accept_partial_bio
    ecf511b8157e0 media: em28xx: fix double free in em28xx_alloc_urbs
    84ec201511634 media: exynos4-is: Fix a race between s_stream(0) and the interrupt handler
    e4686b15bb97f media: rtl28xxu: fix SDR platform device leak
    f8f37e179859d media: pvrusb2: Fix USB parent device leak in class_dev_create()
    c1b1e81ed8b2b media: tw686x: fix V4L2 device lifetime on probe failure
    07a1b080c5a51 staging: rtl8723bs: fix RX buffer OOB write from device-reported length
    d28f100d9975e staging: greybus: uart: fix racy TIOCMIWAIT implementation
    c4a692585615f drm/msm/dsi: Fix VM leak in dsi_tx_buf_alloc_6g()
    fd021c57e2c6a drm/msm/hdmi_bridge: Correct poweroff/audio cleanup order in post_disable
    96c66a1ef8238 drm/msm/hdmi: Handle msm_hdmi_power_on() errors during .atomic_pre_enable()
    41f7b9cd503eb drm/msm/hdmi_phy: Cleanup after msm_hdmi_phy_resource_enable() failure
    d4e9b82ddc6fd i3c: master: adi: free the IRQ before unregistering the master
    6266517f52b61 IB/hfi1: Shutdown self-rearming timers before freeing
    9313727ad7f02 pwm: tiehrpwm: Clear period on disable to allow reconfiguration
    5906e880cdf55 nilfs2: ignore non-fatal signals during synchronous log write wait
    1a84e432d4426 nilfs2: clear dirty flag on bdev buffers on log write failure
    be094322526a4 ASoC: pcm6240: do not free an unrequested IRQ
    19f0f175168ef pseries/plpks: clear SED key data after use
    7e149d7105694 pseries/plpks: clear signed update authentication buffer
    7a7140990a004 pseries/plpks: clear sensitive PLPKS buffers
    3cc77e135802a pseries/plpks: validate input to plpks_signed_update_var()
    4e535f8952754 pseries/plpks: fix error handling in plpks_read_var()
    77f1aeef96b91 clk: starfive: jh7110-isp: fix refcount leak in jh7110_ispcrg_probe()
    35530d26230b1 ALSA: core: Check shutdown flag at D0 power-state, too
    a14c5fffca888 m68k: dmasound: Keep the Q40 IRQ handler registered
    e6bceb2fb629d ALSA: sgio2audio: Only free successfully requested IRQs
    6aa325b8aea61 media: iris: Fix frame interval enumeration for non-divisor framerates
    4b1e1db849f75 media: iris: Fix bus_info prefix in VIDIOC_QUERYCAP
    5880a91e81194 media: venus: Fix iova allocation from restrict region
    8e1efcccc8284 media: qcom: camss: Add "gcc_axi_hf" to 8775p VFE lite clock lists
    f73b13bd811b8 media: qcom: camss: vfe: Fix VFE reset while another line is streaming
    eef4734a50d6c media: qcom: camss: vfe-17x: Fix write master selection for RDI lines
    01cc89543a136 media: qcom: camss: vfe-17x: Fix write master buffer done being dropped
    b0f54c804cc0f cxl/acpi: Check ACPI companion before use
    5352e7447219b fs/ntfs3: fix integer overflow in find_log_rec() causing OOB read
    6cea6cc1731b0 spi: bcm2835: fix device_node reference leak in bcm2835_spi_setup()
    621cb2fe38d5a iio: adc: stm32: fix minimum sampling time values
    f5977b1359625 iio: accel: adxl380: reject devices without match data
    5381f1c9be61b iio: accel: adxl313: reject devices without match data
    8953416b62184 iio: adc: ti-adc128s052: validate SPI match data
    e5290017ad1c0 iio: adc: mcp3911: reject devices without match data
    3c35aa8d9ead9 iio: adc: max11205: reject devices without match data
    f4ca846273cfe iio: adc: ad7606: reject devices without match data
    2d3d960463e0c iio: pressure: bmp280: validate SPI match data
    b46ccd625f991 iio: potentiometer: x9250: reject devices without match data
    aafccd547ea2a iio: imu: adis16400: validate SPI match data
    a397881895664 iio: frequency: adf4377: reject devices without match data
    1b8bf08712052 iio: dac: ad5755: validate SPI match data
    757e0634790ea ASoC: codecs: wcd9335: Fix SLIM interface device leak in wcd9335_slim_status()
    ef6d993762b21 ALSA: mpu401: shut down timer before freeing MPU
    e8168221d3c7d iommu/vt-d: Avoid out-of-range shift in qi_desc_dev_iotlb_pasid()
    ae75a827b6fda arm64: dts: qcom: ipq9574: Wire up USB3 PHY PIPE clock to GCC
    2597827c1f9b2 arm64: dts: qcom: sdm845-xiaomi-polaris: Extend the xbl_mem region
    36c5520124515 arm64: dts: qcom: sdm845-xiaomi-beryllium: Extend the xbl_mem region
    f373581d54225 netfilter: ctnetlink: fix inverted IPv6 address match in dump filter
    6407390b5aa13 MIPS: mm: do not write a huge TLB entry when the probe misses
    b37f9d7dbb25d MIPS: mm: align hugetlb mappings in arch_get_unmapped_area()
    22ab752854666 peci: npcm: Initialize state before requesting IRQ
    730424642a171 peci: aspeed: Initialize state before requesting IRQ
    10867cbc902e6 ASoC: wcd9335: Fix device reference leak in wcd9335_slim_status()
    e2f717de9bf36 ASoC: sdw_utils: clear stale RT711 device reference on exit
    07d54cfeba41d dcache: report a Tasks-RCU quiescent state in dentry_kill()
    08e9f9476a805 hwmon: (coretemp) Refresh the temperature on the first read
    2b8b388320fa3 mtd: Call get_wunit() on the master partition
    23852ad0f72a6 mtd: mtdsuper: Fix MTD device reference leak in mtd_get_sb()
    9544576610d5d mtd: maps: l440gx: Fix double put of the PM device in init_l440gx()
    433fe9882befb mtd: maps: l440gx: Fix double put of the ISA bridge in init_l440gx()
    9975c8d2d03e1 mtd: amd76xrom: Fix PCI device reference leak in amd76xrom_init_one()
    b0d4ff46a2195 mtd: cfi_cmdset_0002: cap the write-buffer chunk at 256 bytes on an x8 device
    d977046bcfbfa mtd: maps: pci: balance PCI enable on cleanup
    42e84c6ec7a1c mtd: rawnand: atmel: Fix MCK clock leak in atmel_nand_controller_init()
    b93e351abe15e mtd: rawnand: nuvoton: fix clock cleanup on probe failure
    1cf4c1c5ab6ea platform/x86/intel/pmt: Block mmap when callback is present
    81f311ccfd77d fuse: don't drop destination page cache on a zero byte copy reply
    7350d86fe1987 hwmon: (lm95245) Fix negative temperature conversion
    07909b53a81ea regulator: core: Fix coupled regulators reference leak on removal
    aba82b403719f clk: mvebu: ap-cpu-clk: Assign .num before accessing .hws
    e043acd7535f5 ASoC: rt712-sdca-dmic: fix drvdata type in the gain controls
    9ce18befc8944 ASoC: Intel: atom: Fix platform device leak on probe failure
    f622c427fab09 kobject: fix out-of-bounds access in kobject_action_type()
    582a0631a00df nilfs2: fix deadlock between nilfs_evict_inode() and find_inode()
    239d333dedc26 perf loongarch: Fix discarded const qualifier in _get_field()
    f2a360ec9f6c3 mfd: wcd934x: Fix NULL pointer dereference on IRQ probe deferral
    845d3107c2fa1 mfd: wcd934x: set DMA mask on parent to silence "DMA mask not set"
    95e47d590f04a mfd: Fix MAX77705 dependency on regmap
    7990fad78c398 mfd: da903x: Cancel IRQ work during teardown
    eea47a6e5b849 drm/panel: ebbg-ft8719: Set prepare_prev_first
    23091956b9697 clk: qcom: gcc-ipq5018: mark 'gpll0_main' clock as critical
    bdd8930eb7414 arm64: dts: freescale: imx8mp-verdin-yavia: fix external GPIOs
    0d1d31a3e35cb arm64: dts: freescale: imx8mp-toradex-smarc: fix SMARC_SLEEP# gpio-line-names typo
    f2c6b74e201d3 arm64: dts: freescale: imx8mp-verdin-ivy: fix DIGI_1/DIGI_2 gpio-line-names
    f9077408c7653 arm64: dts: freescale: imx8mm-verdin-ivy: fix DIGI_1/DIGI_2 gpio-line-names
    423c585471798 memory: stm32_omm: fix child clock leak on set_amcr() error path
    d0e4425481132 ASoC: fsl_xcvr: free IRQ before canceling reset work
    4f52198430988 media: atmel-isi: release unregistered video device on remove
    76e42a29a8b52 media: synopsys: hdmirx: fetch colordepth before calculating pixelclock
    38a49d04e16f9 media: vpif_display: Fix i2c adapter reference leak in vpif_probe()
    163306dbd27e1 media: vpif_capture: Fix i2c adapter reference leak in vpif_probe()
    638d1d3b9d619 media: au0828: Fix media device leak in au0828_usb_probe()
    fe100b9f57a6a media: adv7180: Initialize mutex before ancillary clients
    dafdecfc883d4 media: tw68: balance PCI enable on cleanup
    3f87db958c388 media: cx18: Disable PCI device on probe failure
    50983f1424034 media: go7007: unregister the I2C adapter on USB probe failure
    d7a14af8ba0f5 media: marvell: manage the MMP camera clock provider
    90379d750ee61 media: v4l2-ctrls: do nothing if controls[0] == NULL in cluster functions
    5c474f8dea049 media: cec: extron: clear response tail before dispatch
    dd443f07c3fdf crypto: qat - zero the VF migration state buffer on save
    97be63f3e99e5 crypto: hisilicon/hpre - fix GFP flags for dma_alloc_coherent
    ccfb1d79e90d5 crypto: hisilicon/hpre - fix ECDH destination DMA mapping
    d6612d2b94c49 crypto: hisilicon/hpre - return -EOVERFLOW for small ECDH output buffer
    2ea0ae7e51226 crypto: hisilicon/hpre - fix pointer dereference before length check
    4b13c56f78969 crypto: amlogic - Fix IRQ handler return value and fallthrough logic
    15357a5ca0723 crypto: qat - fix error source for QAT GEN6 transmit interface faults
    750960f85f546 md: validate bblog_size when loading v1.x badblocks metadata
    91559a37ab89a EDAC/i10nm: Fix mdev reference leak in i10nm_get_ddr_munits()
    435a2d476c0f1 nilfs2: fix checkpoint root lifetime on sysfs errors
    e35f9b354d97c cpufreq/amd-pstate: Skip auto_sel write when it already matches the mode
    f49376986b09d drm/mali-dp: Fix runtime PM leak in malidp_crtc_atomic_enable()
    2014f2ee032b5 arm64: dts: ti: k3-am62x-phyboard-lyra: Set SD clock pin as OUTPUT
    2b7e78230f320 arm64: dts: ti: k3-am62-phycore-som: Set eMMC clock pin as OUTPUT
    87b48de7876bf arm64: dts: ti: k3-am625-sk-common: Set eMMC clock pin as OUTPUT
    7a78d631d33af arm64: dts: ti: k3-am62x-sk-common: Set SD clock pin as OUTPUT
    8f4c662782775 arm64: dts: ti: k3-am625-beagleplay: Set MMC clock pins as OUTPUT
    a4506f5cdcaf5 arm64: dts: ti: k3-am62-pocketbeagle2: Set SD clock pin as OUTPUT
    76d64e229e8d4 arm64: dts: ti: k3-am62-lp-sk: Set eMMC clock pins as OUTPUT
    a1af1d48b4e8f arm64: dts: ti: k3-am62a-phycore-som: Set eMMC clock pin as OUTPUT
    91b895087d4f5 arm64: dts: ti: k3-am62a7-sk: Set SD clock pin as OUTPUT
    9fec0d09d72ca arm64: dts: ti: k3-am62a7-sk: Set eMMC clock pin as OUTPUT
    2cd49b55c4a58 arm64: dts: ti: k3-am62a: Fix MMC0_CLK register address
    a8c3c92d4ad45 ASoC: ti: davinci-mcasp: Fix runtime PM imbalance in __davinci_mcasp_set_clkdiv()
    979378aa62727 media: meson-ir-tx: Prevent divide by zero in meson_irtx_prepare_pulse()
    ea6f38bc01df0 media: ir_toy: Validate the maximum tx carrier
    2c10ecb1205c1 media: serial_ir: Fix race condition where timer can be re-armed
    dee5160991876 media: ene_ir: Ensure teardown is done in the correct order
    63e6c760dab0a leds: ktd2692: Pass context to regulator cleanup
    cf46d521bcb9d staging: media: imx: csc-scaler: fix ipu_image_convert_run leak on queue error
    872bd917485f9 seccomp: restore knotif->state when SECCOMP_ADDFD_FLAG_SEND is interrupted
    c94b8c634a50b signalfd: don't dequeue the forced fatal signals
    8c5f9461559f5 i3c: mipi-i3c-hci: Bounce short reads irrespective of the IOMMU
    2f6a32c7a313e i3c: master: Fix out-of-bounds read in DMA bounce buffer setup
    97bc751cfc38f PCI: pciehp: Make 'pciehp_poll_mode' parameter read-only
    2c4be2b6248f9 ata: libata-scsi: abort multi-sector pass-through commands when multi_count is 0
    7cec392ed369c iio: light: apds9306: fix default sampling frequency definition
    dbdd30ac4a417 iio: imu: inv_icm42600: force accel odr change when switching power mode
    00080c627a741 iio: accel: adis16201: fix channel order for buffer mode
    5f3092b2fa082 regulator: rt6190: Fix runtime PM imbalance in rt6190_out_enable()
    af9a4f6f57917 fpga: Fix of_fpga_mgr_get() reference in fpga_mgr_lock() docs
    a8d2a980f12a6 ASoC: codecs: wm8994: Fix runtime PM leak in wm8994_mic_detect()
    dc6d28fd849c9 crypto: omap-des - fix crypto engine cleanup
    27c110a6bed20 crypto: zynqmp-sha - fix NULL pointer dereference in init_tfm
    a3048a0145db4 PCI: Skip Target Speed quirk on clamped ports with no link
    973f2d4bc9bef regulator: core: Fix rdev reference leak in regulator_resolve_supply()
    48381e8b82b71 regulator: core: Fix c_rdev reference leak in regulator_resolve_coupling()
    4811e90d8e25b nilfs2: force clear dirty state when restoring from the shadow map
    2c2b173c873b8 cpufreq: conservative: Restrict deferred downscaling to low load
    fc00ea2413ee6 spi: spi-qpic-snand: publish the ECC context to snandc->qspi
    c7683b4db5a2c drm/panic: Test address from kmap op for NULL
    1bf651ae05d02 drm/panic: Do not use un-escaped URL as format string
    9e2913245294f md/raid5: validate payload size before calculating payload_len
    45ceac48961d9 md/raid5: fix NULL pointer dereference in raid5_free_percpu
    e4e9104f9ce46 md/raid5: track disks array size to fix extra_page leak on error paths
    ca766a199f45d iio: adc: at91-sama5d2: disable autosuspend on remove
    de73e70146b16 iio: accel: mma9553: disable autosuspend on remove
    615dfc9c1094c iio: accel: mma9551: disable autosuspend on remove
    da2591872e9a6 iio: accel: kxcjk-1013: Disable autosuspend on remove
    4b67a0a7615b0 ASoC: arizona-jack: Fix runtime PM imbalance in arizona_start_hpdet_acc_id()
    9e1878d7f4c66 ASoC: wm8994: Fix runtime PM imbalance in wm8994_component_probe()
    0d9e9643b93d6 usb: fotg210: validate endpoint index in ep0 handlers
    800e6b3394f54 crypto: atmel-tdes - sync output bounce buffer before DMA
    c51c7e46b98c0 ntfs3: bound index head insertions by buffer capacity
    a7e2d7c8aef36 platform/x86: hp-bioscfg: fix slab-out-of-bounds write in hp_convert_hexstr_to_str()
    daa8a3cde7c85 media: i2c: ov2735: fix power cleanup on remove
    1f5409c10ffa5 media: i2c: alvium-csi2: balance runtime PM usage count on remove
    1b2d819c09f0b ata: libata: Do not leave ata_host_stop() registered when activation fails
    6fe2e3756522e ata: libahci: Free the IRQs when activating a multi-IRQ host fails
    9135a4ba98db1 ata: ahci_st: Assert the power down reset in the probe() error path
    225230b906982 ata: ahci_st: Do not ignore errors when getting the reset controls
    c0d77acef537d f2fs: compress: fix to handle race between truncate and writeback
    241fcc1d7f986 f2fs: force out-place update for all writes on compressed file
    9e6fc70c7ad4f dm vdo indexer: validate record page numbers better
    1af45c0daaff6 dm vdo indexer: prevent delta list overflow on load
    dc4724be77c93 affs: validate blocks before freeing them
    58492634b0438 PM: CPU: Restore synchronize_rcu() to cpu_pm_unregister_notifier()
    a1bcadec1debd crypto: ccp - Initialize DBC ioctl mutex before registering device
    ec3bb0b9bb797 lib/842: require a complete history block for repeat templates
    a7c9d73df0489 lib/842: reject output overflows from index and short data
    05c0ae1f3d3cd crypto: atmel-aes - fix AADLENR for standalone GHASH
    f3e35f116d698 crypto: atmel-tdes - zero-initialize device state
    f82d80f7b6f7c media: vicodec: zero-initialize stateful decoder heap buffers
    f16b697c94756 media: vivid: cancel svid ctrl work on release
    876ba0c136714 media: cx231xx: preserve I2C transfer length
    00dd4a5c2b8c7 media: vivid: round the height down to the vertical subsampling factor
    946aa222b49d7 sched/fair: Reset NUMA fault locality after scan period update
    90093af6a0b4a iio: imu: inv_icm42600: fix odr change not caught in certain cases
    63181ae0a49b5 power: supply: bq27xxx: Ensure poll work is cancelled on remove
    4f2e159190dd5 power: supply: bq27xxx: synchronize work cancellation on suspend
    29601cf266cac power: supply: qcom_smbx: notify battery overvoltage recovery
    3a476ea9a2f42 power: supply: qcom_smbx: validate battery float voltage
    29aeb5ac79901 power: supply: qcom_smbx: fix float voltage selector
    287619a6cd07d power: supply: qcom_smbx: test battery health status bits
    8e91b6b73f18c power: supply: qcom_smbx: include base when petting watchdog
    9b26d77f89cab hte: tegra194-test: shut down timer before GPIO release
    2cb1b55431ae5 ACPI: pfr_update: zero-initialize capability query result
    d56c604bae3a9 dmaengine: altera-msgdma: initialize state before requesting IRQ
    0b39ce62d9226 drm/bridge: analogix_dp: Restore mandatory samsung DP DT properties
    79800ff17a5f4 media: nuvoton: npcm-video: quiesce VCD IRQ before teardown
    8b25a49e4bd7d media: synopsys: hdmirx: use request_any_context_irq() for 5V detection IRQ
    8018d370be35e media: stv0900: bound DiSEqC reply length to msg[] size
    de92aa70a36a4 media: stv090x: bound DiSEqC reply length to msg[] size
    486eccf2f4bed media: adv7604: avoid negative array index in log_status when cp_read fails
    d2606c2c6d490 mtd: rawnand: sunxi: reject ECC maximization on small pages
    ea3a418d73b0c media: stm32: csi: unregister async notifier on cleanup
    de26b77e6e3ac media: stm32: csi: correct remote pad retrieval
    79058f6929412 media: microchip-isc: don't sleep in the clk .is_enabled callback
    da7a07ad6fe00 media: microchip-isc: fix PM runtime leak in AWB work handler
    a517178cce67b media: microchip-isc: do not touch WB registers when not streaming
    6dc8e17c26a90 media: microchip-isc: disable histogram and flush AWB work on teardown
    d1d04f10ad77f media: microchip-isc: synchronize the IRQ before disabling clocks on stop
    bd676daa63715 media: microchip-isc: fix awb_mutex and lock lifecycle
    d1dbcb4346875 perf powerpc-vpadtl: Fix off-by-one in auxtrace_info minimum size check
    82cbf1a3e91ae ASoC: codecs: lpass-wsa-macro: use v2.5 Compander1 addresses on v2.5+
    02b1ca9a3793b media: m2m-deinterlace: fix default capture field
    17de34822aeb2 staging: media: av7110: fix sp8870 initialization failure state
    228b1b7be79d1 staging: media: av7110: fix corrupted BER reporting in sp8870
    f01bdf7f3fc23 media: marvell-cam: fix unmet dependency for VIDEO_MMP_CAMERA
    b60a01c639707 media: vidtv: fix uaf in vidtv_bridge_on_new_pkts_avail
    b0f8a0f8058e2 media: vidtv: fix frontend reference leak on unbind
    72b9c63beb015 media: vicodec: make encoder CAPTURE dimensions read-only
    1b317507238bb media: vicodec: fix out-of-bounds write on under-rounded coded dimensions
    b64ea8c8e0085 media: vim2m: keep transaction buffer count stable while streaming
    0b0fbacea9a0e media: saa7146: Initialize interrupt lock before requesting IRQ
    d208c267148f6 media: go7007: bound EZ-USB I2C transfers to the usb_buf size
    2cdba0da8c13d media: i2c: tc358743: add missing color-space strings
    5bb8c5b1727ca media: au0828: Free URBs when starting DVB streaming fails
    3fcfab4339c8e firewire: core: fix source bus ID detection for AT context in big-endian systems
    c7091528ab213 media: cx231xx: Fix cleanup path on failure
    5c8ecd9ebc955 media: cx231xx-audio: drain wq_trigger before audio fini
    ced0704d1e0cb arm64: dts: mediatek: mt7986: correct timer frequency
    ec0ec28012816 isofs: fix Rock Ridge CE extent validation on multisession media
    0a0fef460f207 thermal: intel: int340x: Fix temperature selection around 0 C
    cb93d82e206c0 thermal: intel: powerclamp: Reject invalid window_size values
    781364a1fb9dd arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as OUTPUT
    ced6f89824f84 fs: make sure to call fsnotify_inoderemove() only once when inode is dead
    3c21a1feaf89c fs_pin: publish pins with RCU list helpers
    1545217ceadc6 mtd: spi-nor: Unprepare legacy controllers upon RWW wait interruption
    7317c31a54bb8 mtd: spi-nor: sfdp: check the length of the SCCR map
    8cbeaea4d325f mtd: spi-nor: sfdp: check the length of the xSPI Profile 1.0 table
    06b4dabdc67a0 media: i2c: ov8856: fix debug message to report actual CSI-2 lane count
    c42a610d57426 media: i2c: ov8856 : remove ACPI node bypass mechanism
    c99e574764c33 wifi: ath11k: Fix possible memory leak in ath11k_dp_srng_setup()
    bef63213e2082 hte: tegra194: Initialize slice locks before registering chip
    f1f18007989bb bpf: Fix queue/stack map u32 index overflow
    6922b35cb2bbb ARM: imx: Fix suspend/resume crash with Clang CFI
    cfe382cbabf6d clk: mstar: msc313-mpll: fix off-by-one in clock array allocation
    2c1fdcbb95bd6 platform/x86: int3472: Fix uninitialised variable warning
    2bab8fa4826bd wifi: rtw89: cap firmware section_num before parsing
    a83e3e33b781c wifi: rtw89: 8851b: fix swapped DPK channel/bandwidth backup fields
    aa26d4a75f2c8 wifi: rtw88: fix out-of-bounds CAM write when key table is full
    c408ff204a86f memory: renesas-rpc-if: Mark XSPI_CDD1BUF0 as volatile
    77b641503dddf memory: brcmstb_dpfe: Bounds check DCPU-supplied MSG_ARG_COUNT
    5aca21d188570 memory: brcmstb_dpfe: Fix out-of-bounds access due to DCPU offset
    1f8722a7053ff microblaze: preserve the MSR carry flags across signals
    8237cd3e2fc24 microblaze: restore the ABI argument home area below pt_regs (PTO)
    87f78edf4b3de microblaze: don't clobber r3/r4 restored by rt_sigreturn
    ba4121a804ada microblaze: reserve the ABI argument-home area in the signal frame
    ed48f8b0ec58d soc: qcom: geni-se: Fix write to read-only firmware buffer
    bb6277d4f59e2 soc: qcom: geni-se: Fix fw_end computed before round-up; propagate size to caller
    73c7e00cea7bd soc: qcom: geni-se: Widen fw_size to u32 to prevent wrap-around
    211532d38f7b5 soc: qcom: geni-se: Fix endian conversion for serial_protocol comparison
    078cbede4db36 remoteproc: elf_loader: Bound the section header table
    58291947b70a1 ipc/mqueue: release notification resources during inode eviction
    96540793dd7e5 aio: prevent eventfd/epoll recursion on poll
    7b6d1a6763e6a udf: Make sure there's enough space for LVID implementation use field
    ae3bdd1941d76 microblaze: Fix MB_MANAGER build with older binutils
    52f216b8784f8 media: imx-jpeg: finish the job on device_run() error paths
    eae391f382100 media: ir-hix5hd2: Ensure rdev is setup before interrupts are enabled
    7f8cd3cfcba75 media: meson-ir-tx: Ensure probe error is propagated
    36c95ef77d434 media: meson-ir-tx: Ensure rc_free_device() is called on unbind
    a842af958b4e8 media: meson-ir-tx: Ensure clock is disabled on unbind
    ddaf428a0f8a1 media: sunxi-cir: Ensure no more interrupts can occur before free
    7d7521a954adb media: redrat3: Ensure all urbs are suspended
    4c443c088a37a media: redrat3: Ensure we don't read beyond the end of the packet
    5f475e1c007bd media: streamzap: Add missing rc_unregister_device()
    fc075bead2706 cpufreq: airoha: fix probe failure with correct error check
    b59e31d1145d1 iio: adc: ti-ads1100: Fix incorrect reading when datarate changed in single mode
    57a52158ca8cc drm/amd/display: Force GAMCOR for subsampled surfaces with PQ/Gamma22/HLG
    dc715d660d925 drm/amdgpu: recompute the dw estimate after allocating a new VM update job
    ddae760f39970 drm/nouveau: don't dereference outp before checking it in nouveau_dp_irq
    3ea6031d2625f drm/nouveau: cancel the DP IRQ work before freeing the connector
    f688ffe4a23ae drm/nouveau: disable the fence uevent work instead of just cancelling it
    e8c6be50fcae4 drm/nouveau/pci: use config-space MSI rearm on MCP79/MCP7A (NVAC)
    812500ab5bb81 drm/nouveau/svm: drain fault handler before freeing svmm
    c518337e597df drm/nouveau: reject zero-size notifier object allocation
    c04b888b39551 rust: bitmap: fix intra-doc link
    c4252273ead98 mm: khugepaged: fix swap entry value to folio_pfn()
    a3dc612f05f40 rust: dma: declare cfi_encoding for dma_data_direction
    5a13e8528e0b1 rust: hrtimer: declare cfi_encoding for hrtimer_restart
    3809bde861d7a rust: irq: declare cfi_encoding for irqreturn
    edb4f7bcffdb7 nvmet-auth: serialize access to DH-HMAC-CHAP state to fix UAF
    10dc8299d1ff5 nvmet: replace use of system_wq with system_percpu_wq
    a7ba1a5a0c16d pps: generators: don't use the driver's info after unregister
    c05c367e7a995 virtio_net: atomically disable rx mode work
    c290f8641e41c mptcp: hold MP_JOIN msk ref when cloning reqsk
    fb3f7101fec5c tcp: accecn: unset ECT if receive or send ACE=0 in AccECN negotiaion
    6cc288d84ef28 tcp: Remove timeout arg from reqsk_timeout().
    33e8f57403199 staging: rtl8723bs: fix protected RX frame validation in decrypt path
    aaaf89f4bca97 staging: rtl8723bs: fix spacing around operators in rtw_recv.c
    0fab93d241cfb mm/truncate: look up the end-edge straddler by index
    1706461eb1af8 KVM: guest_memfd: Gracefully handle xarray errors when binding a memslot
    e8660dc5713f8 drm/amdgpu: drop retry loop in amdgpu_hmm_range_get_pages
    8e5172cbd227f inet: reject unhashed sockets during established lookups
    a37727a99d009 x86/mm/pat: Use pr_warn() for early W^X warnings
    f960356fa9eea KVM: VMX: Formally define KVM's "0xdead" exit reason used for failed VM-Enter
    de5b233cfc33e x86/bugs: Mitigate TSA on AMD Zen5
    c3f63d70f236b Linux 6.18.62
    c49934da934cf xen-blkback: Avoid UAF when reading I/O statistics
    34f0f63dc6dc1 xen-netback: defer xenvif_mcast_addr_list_free()
    37d5a73170579 xen-netback: Fix UAF when reading statistics data
    7ab573237315f Linux 6.18.61
    4d14072b93fa7 rust: bitmap: add MAX_LEN and MAX_INLINE_LEN constants
    2f92c0286cfd5 tun: Require CAP_NET_ADMIN to attach to an ownerless device
    3c5bfeef8f711 ALSA: hda/realtek: Fix audio after Windows reboot on ASUS Q423SA
    9ec1c52ba989b opp: fix use after free in _update_opp_table_clk()
    4225b4944f9d1 netfilter: conntrack: always lower timeout for non-closing RST packets
    34bdda87c1890 drm/amdgpu/powerplay: Align get_tonga_state_array() header with prototype
    27f2fdcb6be2e selftests: ublk: add missing gitignore for metadata_size binary
    7dc33618ae473 media: rc: Fix build failure with CONFIG_LIRC disabled
    3594027c292b0 mm/rmap: don't discard lazyfree THPs at PMD level
    63dc56500a915 pps: generators: fix use-after-free when closing a removed device
    2b2a1d370f16f pps: change pps_gen_class to a const struct
    d1df2ec20a6dd media: ipu-bridge: Fix use-after-free in IVSC error path
    bd47ee501b6ac ksmbd: fix use-after-free after a failed durable reconnect
    7f30b886c5a1a ksmbd: verify transform SessionId matches the decrypted header
    c81681bcb7f08 ksmbd: fix named stream write and EOF handling
    3092d8a596efa ksmbd: fix out-of-bounds read when padding the final compound response
    52a8eb87416e7 ksmbd: use the existing xattr name for a named stream
    4a7f332fd43ee ksmbd: fix invalid pointer dereference when get_inode_acl() fails
    fbe9fcda7ae88 ksmbd: prevent stale data from being written by SMB2 WRITE requests
    2756a41a82d61 ksmbd: prevent share root removal through empty paths
    38cddb9f7c910 ksmbd: fix session reference leak on compounded SESSION_SETUP
    28db998d396a9 ksmbd: deny access for an empty DACL instead of granting the request
    1f1a7cdcc7a9a driver core: take parent lock in async device attach
    2af51c1d68e6f driver core: Check drivers_autoprobe for all added devices
    4d6e1b44d1fbf smb: client: fix early procfs exposure race
    ee793cc8dcd58 smb: client: do not pass a NULL buf to is_oplock_break()
    0eec7b84e83ff io_uring/net: fix multishot recv length limit accounting
    b5e22247346f6 io_uring/timeout: count cancelled timeouts in cq_timeouts
    0ac8f069a8bd7 io_uring: defer foreign io-wq enqueues to task_work
    8bfd0b6319261 io_uring/sqpoll: don't wait for the thread to exit
    9063d0bcba959 io_uring: free XArray nodes left by a failed store
    9089fd4d2ad6e io_uring: charge tctx nodes and personalities
    963c6e849b702 io_uring/rsrc: charge buffer arrays and nodes to memcg
    2b8f16724d510 io_uring/io-wq: no new workers once the exit has begun
    6621b094bc684 io_uring/net: don't retry a non-blocking connect() that fails with -EAGAIN
    87160b45abf0e io_uring/net: keep recvmsg buffer select length within MAX_RW_COUNT
    4b3c285f9c5ac io_uring/kbuf: advance head when a pickup empties the buffer ring
    1f5c774488fa2 smb: smbdirect: fix buffer length underflow in RDMA transfers
    224e9856b8aab ovl: fix mount setup failing when override_creds drops CAP_SYS_ADMIN
    1d9706fb79a94 ovl: do not copy up a dentry that was removed
    0759376aa0116 ovl: hold a reference on the parent in readdir
    68439a05ed529 ovl: check that the parents of volatile/dirty are dirs
    ae8c2228af6b7 HID: roccat: savu: reject short special reports
    c2e90164acb61 HID: roccat: ryos: reject short special reports
    08a4c26838f18 HID: roccat: pyra: reject short button reports
    196fff636bf4f HID: roccat: kovaplus: reject short button reports
    49360ac9b47ff HID: roccat: konepure: reject short button reports
    6d1f22a552594 HID: roccat: koneplus: reject short button reports
    664627e3be18f HID: roccat: isku: reject short button reports
    6ebe75dbb9cf4 HID: quirks: Always poll the Anne Pro 2 with product ID a292
    d4cb80ade5f4c HID: pxrc: reject short input reports
    ac0e2a0fbe429 HID: prodikeys: validate fixed-format MIDI reports
    14acfdfca5151 HID: picoLCD: check for fb_deferred_io_init() error
    ee55408b95bdc HID: mcp2221: validate response report length
    47f50fbfd664c HID: mcp2200: validate READ_ALL response length
    bf3e9e06e850c HID: logitech-dj: validate unnumbered keyboard reports
    6a0a7d6418261 HID: elo: reject short touchscreen reports
    94d0e789d8b0d HID: cp2112: validate response report lengths
    d618e93e9cf56 HID: cougar: reject short special-key reports
    076bea989f998 HID: core: Fix out-of-bounds left shift by 32 in s32ton()
    5652b50db002f HID: amd_sfh: Use report type from request node
    292e9c446a7c3 HID: amd_sfh: Remove unsupported motion-state field from accelerometer report
    30e55a93cdc6b HID: zydacron: validate key report length
    d4de3f8bd5285 KVM: PPC: Fix get_d_signext() 12-bit displacement for paired-single D-form
    7a02dfbd2f4a7 KVM: PPC: Book3S HV: Add preempt_disable() around virtual-mode HPTE bit-lock users
    216729d9780df KVM: TDX: Enable Notify VM exit
    c16bdb1a49985 KVM: TDX: Check if there is valid exit infos based on vp_enter_ret
    ab15e4093e2af KVM: x86: Zero reserved synic flags when delivering message to avoid stack leak
    ec9df57c8e00f KVM: x86: Take SRCU in kvm_zap_gfn_range()
    a92a07205e010 KVM: x86: Request event processing for exception VM-Exits
    a58917a271cb4 KVM: x86: Preserve DR6.BLD (Bus Lock Detect) when delivering #DB payload
    8239d357a9373 KVM: x86: Clear hardware HLT state when userspace makes a vCPU not-halted
    46f5df89f55cc KVM: x86/xen: Take kvm->srcu in __kvm_xen_has_interrupt()
    b7af8dc92af17 KVM: x86/xen: Enforce 4-byte alignment of vcpu_info registration
    fea3d34022630 KVM: x86/mmu: Bug the VM if KVM calcs a CPU role with EFER.LMA=1 && CR4.PAE=0
    54afd548602bb KVM: x86/mmu: Bug the VM if KVM attempts to walk more levels than the MMU has
    87152138116af KVM: VMX: Preserve negative return value in vmx_handle_exit() with bus lock detected
    4ef5e623d2fe2 KVM: VMX: Make handle_bus_lock_vmexit() a shared helper
    196450c52f351 KVM: VMX: Disallow using to_vmx() in common VT code
    a12e105e9753b KVM: Use goto to handle errors during memslot preparation
    a4c2d0a9a9019 KVM: nSVM: Ignore EFER.LMA if EFER.LME=0 when preparing L2 state
    058173bce103b KVM: SVM: Trigger new ASID allocation in both VMCBs on pCPU switch
    da31978b9ccbe x86/mm/pat: Fix effective RW computation in lookup_address_in_pgd_attr()
    ff30731bbce18 x86/cpuid: Mark CPUID function 0x23 as being indexed
    7ace4531de8a7 rxrpc: Fix return in rxrpc_recvmsg_data() for service calls
    7ea62525912d5 rxrpc: Fix double IRQ enablement
    ff518f5f7adc0 afs: Fix afs to abort the rxrpc call on send error
    8b9efc7b27bf7 rxrpc: Fix lack of short-send handling in rxrpc_kernel_send_data()
    965456110cf69 rxrpc: Fix update of call->tx_pending without holding lock
    e77fe4052e155 SUNRPC: Treat every TLS error alert as fatal
    8067c654ae8c6 sunrpc: treat empty auth.unix.gid replies as negative entries
    fd7b12865b207 SUNRPC: trace an accepted transport before publishing it
    03bfe7879fa8a SUNRPC: Resume receiving after a TLS control record
    560956c8d2479 SUNRPC: Reject a TLS alert record that is not two octets
    f44daa50489fe SUNRPC: Reject a socket that already has an svc_sock attached
    f735700c06303 sunrpc: pin gss module across auth_domain RCU free
    c5862ac50d8d0 SUNRPC: keep the first error in svc_register()
    1cc4b3089eabe SUNRPC: fix oversized GSS proxy token copy
    67d36b376f76a SUNRPC: Do not credit control-record octets to the RPC stream
    d514dd81771af SUNRPC: Copy the deferred RPC Call from the head buffer
    c1e38828c93e5 nfsd: zero NFSv4 COMPOUND tag padding
    f5a336ad931af NFSD: validate transport name in listener_set before serv creation
    c12f04f29dac2 NFSD: Set nn->cld_net before registering the cld pipe
    f4d884c878991 NFSD: Return NFSERR_ISDIR for NFSv2 READ and WRITE on a non-regular file
    ea993a4e9ad93 NFSD: Resolve the recall-any mask names in the trace format
    af501c516757b NFSD: Reject an oversized principal hash from nfsdcld
    7d464c3e93214 nfsd: propagate SETXATTR value decode errors
    37fc2ec211630 nfsd: preflight SEQUENCE replies before accepting a slot
    76bb89e8155fe NFSD: Map flex file layout IDs through the request's user namespace
    16ee8e3e0615c NFSD: map fh_verify() status codes for NFS_ACLv3 replies
    5733621eee9f2 nfsd: honour client-provided attributes for NFS4_CREATE_EXCLUSIVE4_1
    540649cb85434 nfsd: hold cl_lock in client_has_openowners()
    676b048197cd4 NFSD: Fix out-of-bounds read in the rpc_status dump
    e48996466d786 nfsd: Fix id-to-name cache entry leak in idtoname_parse()
    fa5fbc8f5fbd5 nfsd: fetch direct I/O alignment for files handed to the filecache
    36fcebcb656ac NFSD: Fail a pool_threads read whose reply does not fit
    0b5149b7ad8cc nfsd: don't modify a session slot when replaying its cached reply
    f6d1f1072243a NFSD: Don't complete a cld upcall the daemon has not read
    b202a337fddfb NFSD: Do not send CB_RECALL_ANY to NFSv4.0 clients
    20b76bdbd0293 NFSD: copy SETXATTR data from all XDR buffer segments
    624531ecd48b9 nfsd: clear XDR padding in GETXATTR replies
    f256b39c64e95 NFSD: cap the number of listeners accepted in listener_set
    7c4846faba43c NFS/localio: report the stability a DIO WRITE actually has
    c4faa631e9e12 NFS/localio: fix nfs_local_dio_misaligned tracepoint
    209ad0993faea NFS: Fix stale negative cache on failed nfs_mkdir()
    d2609b2db66a1 NFSv4/flexfiles: Bound page coalescing on the absolute stripe offset
    43b9e0c39eed6 NFSv4/flexfiles: Use the full 64-bit stripe_unit
    12326bd73a616 NFSv4/flexfiles: Use the full 64-bit offset for read DS selection
    938f374ec8391 NFSv4/flexfiles: fail I/O to the data server once a lock is lost
    8581c8ea5fd2b NFSv4/filelayout: Anchor page coalescing on pattern_offset
    bfa512d906cdb NFSv4.1/pnfs: suspend pNFS on NFS4ERR_TOOSMALL from LAYOUTGET
    cf4c0b3acb1d0 NFSv4/pnfs: Free the netid when draining a data-server address list
    9b89bd1611832 pnfs/blocklayout: Complete a device upcall when the pipe is closed
    7b757e120aaff pnfs/blocklayout: Complete a device upcall only on its own reply
    bed2aa2307e42 pNFS: Fix CB_NOTIFY_DEVICEID CHANGE to consume ndc_immediate
    520b48753e3c5 smb: client: validate NT transaction response layout and offsets
    ba57bfe1a9fa1 smb: client: fix slab-out-of-bounds write in id_mode_to_cifs_acl()
    4a426ca5be7e3 smb: client: fix fiemap wild read on empty truncated response
    acf25a7be39dc smb: client: fix buffer overflow in SMB2_tcon()
    b304a9268f7d5 smb: client: don't resurrect an exiting tcon from cached dir workers
    93d1fbe38f0c1 smb: server: size directory name conversion buffer correctly
    70daf37bef86e x86/bugs: Adapt SRSO mitigation to Zen6
    30fb9f2ad94a8 xfs: reattach dquots after changing inode ids
    e6338cdc1003b xfs: range-check bc_levels array access in scrub tracepoints
    a312988016bd0 xfs: propagate errors while checking null siblings
    27b6057c98847 xfs: opportunistically skip btree block checks
    05fd50e646ea0 xfs: only written file data blocks can be shared
    a20e7217f6946 xfs: never reset the default quota timer
    9ee0b919b7df6 xfs: init inode number for tracepoint
    55a29b3306179 xfs: fix data fork block count check in xrep_inode_blockcounts
    9702d68ad6264 xfs: fix correction of unwritten extents in quota file data fork
    1bde9463d7524 xfs: don't try to scrub self-referential dirent in metapath checker
    f12cbd5e20294 xfs: don't try to repair rtsummary if the summary file isn't computed
    3e8c3ed178c1e xfs: don't subtract excess usage twice when computing agf_btreeblks
    32b3e288e22c5 xfs: don't set a metadata directory's parent to sb_rootino
    fb6d5c9a2edff xfs: don't scan across metadata/regular directory trees for dirents
    1a5bcf87b6110 xfs: don't rescan ifree and icount when frozen
    83b5bfa2400c5 xfs: don't queue rmap update twice when reaping a fork
    6b93f0aeb8815 xfs: don't overrun incore inode when cleaning attr forks
    8310008293296 xfs: don't clear COWEXTSIZE on directories on reflink filesystems
    7ba6cf053eaf1 xfs: don't allow sm_agno for non-group metadir path checking
    b5eb4ffd63fd2 xfs: complain loudly when dirtree checker finds broken links
    85975166223d1 xfs: clear set[ug]id mode bits when zapping attr fork
    c73ee3683ab45 xfs: clarify various parts of the bitmap API
    27d1f450dec6e xfs: check for termination during rmap btree walk
    821a9d99caf16 xfs: check for fragments when full-extent sharing matches
    f2cc5001ffcc1 xfs: bound inode fork length against the fork size during log recovery
    5909f2935ca28 xfs: bound da-node entry count against the correct geometry
    bd805c0a79143 xfs: always zero the whole shortform header when zeroing attr fork
    e1903c3144d8c xfs: always report scrub errors in tracepoints
    782bcf8c6d368 xfs: always report inode repair setup failures
    8cce27911eb3f xfs: always forget cached ACLs if the attr fork swap succeeds
    4b4979ebf9387 xfs: abort directory tree repair whenever dl->aborted is set
    c548d0de41b0f xfs: update quota flags on secondary supers when metadir enabled
    96a80a3312b43 xfs: rescan the AGs if incore delalloc counter is negative
    741d01a5f4902 xfs: release ip after unlinked list store failure
    97b85a593188f xfs: reject remote xattr entries with an out-of-range value length
    c2cd6b3b480ef xfs: reject out-of-range attribute value lengths in xfs_attr_copy_value
    5e730e4a26c42 xfs: reject absurdly large xattr value lengths in xchk_xattr_actor
    de55e799f549e xfs: reduce new btree slack factor if free space is negative
    42451fefb0762 media: usbtv: fix null-pointer dereference on disconnect
    f9362852c8b91 media: usbtv: drop redundant device reference
    9d275d40b6ece Revert "net: Convert proto_ops bind() callbacks to use sockaddr_unsized"
    47c6544317308 EDAC/mc: Really fix error path ordering in edac_mc_alloc()
    9e3a6b707681a rtnetlink: wait for RCU readers in rtnl_link_unregister()
    0bc2d40b9c01b ksmbd: fix breaking_cnt leak on early return in oplock_break()
    818a9fd779443 ksmbd: serialize directory emptiness checks with readdir
    8fd7a71a70955 netfilter: nf_tables: fix netdev hook allocation memleak with dormant tables
    d1f2c892c6cb5 netfilter: nft_payload: restrict checksum offsets to known values
    3199bbed3a0bd netfilter: validate L4 headers after userspace packet writes
    593971fdc06d6 netfilter: nftables: restrict checkum update offset
    fe189691a7938 netfilter: nftables: restrict linklayer and network header writes
    9b02841c69dc5 netfilter: nft_meta: add double-tagged vlan and pppoe support
    40089f2f78aa9 netfilter: nfnetlink_queue: restrict writes to network header
    819b2241c43e6 ipv6: Implement limits on extension header parsing
    65367b0545955 netfilter: disable payload mangling in userns
    03c67f33c3d9e sched_ext: Fix scx_flush_disable_work() UAF race
    92c9bc8561a7c sched_ext: sync disable_irq_work in bpf_scx_unreg()
    f799665b9c8dc xfs: fix xchk_stats_estimate_bufsize to allow for the trailing null
    7f25f443a4a61 xfs: actually check XFS_DIFLAG2_METADATA for metadata btree data forks
    38a595275d276 xfs: adjust checks for cross-AG reaping issues
    2b33121ec2a85 xfs: jump out of xchk_bmap_check_rmap if fatal signals
    44cc66d047efa xfs: mark overfull dabtree node blocks as corrupt
    c67017f673bc4 xfs: check fork type against dabtree block magic number
    31f79a0919e3f xfs: abort dirtree repair if the live update hook dies
    50dd205bf3c00 xfs: fix revalidation of xchk_dquot_iter cached mappings
    1f5def7e91a6e xfs: bail out of directory tree repairs on error
    006556968a49b xfs: assign an owner to scrub_stats_fops
    09b787d595590 xfs: allow softlimit with no hardlimit in quota scrub
    5cdd8d436feba xfs: fix lost errno returned from xfarray_foliosort
    1fc1a5a2419a5 xfs: don't repair fs summary counters with garbage
    b5891acd62d82 xfs: fix skipped inode mask handling in iscan
    0c5802d7be2bd xfs: don't proceed with xattr repair if the live update fails
    8edb7edb9d337 xfs: validate rc_domain in xchk_rtrefcount_mergeable
    18773e41e92b2 xfs: don't fix the directory tree if live update fails
    6b7f9ab7610b4 xfs: flag excessive delalloc rt extents as corruption
    e065e5f8dfa4a xfs: zero out di_metatype when removing the metadir file iflag
    56192355a67e9 xfs: don't pass iget failures up when marking ondisk inodes
    a9e94a4cd5a0e xfs: always reset incore attr fork buffer when resetting fork
    3b7198678a3a9 xfs: fix inode btree repair when a cluster is larger than a chunk
    b50c563a99cb3 xfs: actually report corrupt xattrs as XFAIL during cross-referencing
    779f9d180b4b1 xfs: fix buffer overflow in corrupt inline attr structure
    1519f7a63f663 xfs: fix unnecessary dapos truncation in xchk_dir_walk
    83f274a69ba63 xfs: actually lock the metafile reservation when adjusting after repair
    84c0abd7e70fd xfs: avoid cross-rtgroup reaping after a repair
    c937966701c23 xfs: online quotacheck must dirty dquot if enforcement adjustments needed
    173eb03891f4c xfs: fix buffer overruns in xfs_ioc_attr_list
    83c2efaba8665 xfs: fix missing xfs_qm_adjust_dqlimits call in quotacheck repair
    6afaf9a32817c xfs: fix xfs_rename_space_res for non-pptr filesystems
    95941108be83d xfs: fix ondisk symlink target validation in xrep_dinode_check_dfork
    af6d2f0a32325 xfs: compute the correct fdblocks/frextents for repair when they're negative
    9c16395459335 xfs: mark cow extents bad if there's no rmap mapping for them
    fa21d1f4f6176 xfs: clear the symlink zapped flag if inline symlink is ok
    5c6a8b2f2f4dc ovl: skip copy up of empty security.capability
    7ecbeb1a84f2d ovl: set the revalidate flags after d_instantiate()
    8cd9ec121a63c ovl: reserve space for the casefolded name terminator
    9b50f28c22c94 ovl: read the nlink xattr of every indexed non-dir
    37537892ca404 ovl: fortify ovl_copy_xattr() against underlying layer modifications
    b9f57bb52124a ovl: fix a torn path in ovl_get_redirect()
    628260a720431 ovl: do not copy up an xattr value that was never read
    6a49ab7c9a68a ovl: check the casefold flag of directories only
    b050952bc4e34 ovl: always encode the origin fh when index is enabled
    b219cdaea16b2 ovl: use the pinned upper dir in ovl_fix_origin()
    c7e2808209899 ovl: take a snapshot of the name for copy up
    7805739ce4577 ovl: set OVL_WHITEOUTS before publishing the upper dir
    ecc327edd96a6 smb: client: stop processing a read response after a receive error
    daee49d7a51f1 smb: client: fix OOB last_entry pointer from unbounded LastNameOffset
    f976692490bbd ocfs2: snapshot dentry names in file and setattr traces
    7ff4f020f7b03 ocfs2: pin refcount trees before dropping the lookup lock
    59d336153d406 ocfs2: fix chunk number of the first chunk in a local quota file
    5ff0f92064ab9 ocfs2: cancel quota sync work before freeing quota info
    a3dd8d3af0238 ocfs2/dlm: hold the lookup reference across convert AST enqueue
    f4ae0b96a4abc ocfs2/dlm: hold a lock reference across grant AST enqueue
    3e05df6bd33a9 ocfs2/heartbeat: unlink live slots when their node is missing
    f185fc81aee9e media: rc: Fix ABBA deadlock by making locks more fine grained
    4528f92222e7b media: rc: Fix use after free in bpf progs
    e6ed118d14267 media: rc: After rc_unregister_device() timers can be re-armed
    6d1be288650bb media: rc: Use after free in ir_raw_event_handle()
    0e18282783cc4 media: rc: mce_kbd: Fix inconsistent locking of keylock
    87a2d2c15f1f7 media: rc: Fix race between bpf(BPG_PROG_ATTACH) and device unregister
    d5e446e0a0541 media: rc: fintek-cir: process a full RX buffer instead of overflowing it
    63644a8b70dab media: rc: Ensure registered is cleared in error path
    144ce635f8cc0 media: rc: Ensure that rc_unregister_device() does not free input device
    006ad1a97ab79 nvmem: core: Fix OOB read for bit offsets of more than one byte
    fce1dd31b185c power: supply: sbs-battery: disable polling before supply teardown
    2ea5385758a7c phy: core: Fix race-condition between _of_phy_get() and try_module_get()
    b3d771544f7d7 resource: report a devm_request_resource() conflict under the lock
    733552f8c5f5f spi: spi-pci1xxxx: quiesce DMA engines on transfer timeout
    c792858491ee3 ufs: use u64 for directory size in ufs_last_byte
    e7e89759445e9 usb: gadget: fix refcount underflow in gadgetfs_bind() error path
    26dc15da08f15 wifi: mt76: mt7996: unlink TWT flow if the MCU rejects the agreement
    49e05c8d3d8f5 wifi: ath9k: delete channel-context timers on deinit
    e64707d07fcda xen-blkfront: unbind irq before tearing down ring and shadow requests
    0f332cce4d592 serial: core: shut down initialized port on removal
    a79de0e5e66bd scsi: dc395x: sync the waiting_timer before freeing the host
    325da0365ffa4 mm: khugepaged: fix folio is used after folio_put/unlock()
    590f48b564431 mm/slab: sample slab_state once in kmem_cache_destroy()
    e848c0bd189bd media: s5p-mfc: use timer_shutdown_sync() for the self-rearming watchdog
    98e3df13c9fd5 media: redrat3: fix UAF in probe error path leaving rc device registered
    1711d758ede7a media: microchip-isc: take a reference on the parsed endpoints
    9fa70d75ab03f media: microchip-csi2dc: fix async notifier leak on probe error path
    12d0222809f94 media: marvell: mcam: stop DMA and cancel s_bh_work before freeing DMA buffers
    49a0623994a10 media: imx-jpeg: cancel timeout worker when streaming stops
    d02a2ed057372 media: gspca: use vb2_video_unregister_device() on disconnect
    cbe537c64b8fb media: cx23885: unregister DVB bus when SP2 CI setup fails
    4ab2c987fd15a KVM: PPC: Book3S HV: Add SRCU protection for virtual-mode HPT hcalls
    881ec3e0d29aa iommu/arm-smmu-v3: Disable the impl before disabling the SMMU on shutdown
    35096f62ca37e iomap: don't resubmit an ioend after ->writeback_submit() failed
    2efcf743664ab io_uring/io-wq: save worker type before dropping its reference
    1b7b31f0d4bbf HID: hiddev: keep state alive through disconnect unlock
    e1b124226d55b genirq: Move interrupt thread exit_work object to irqaction
    a6deaadd460a3 genirq: Defer kfree(irqaction) until irq_thread_dtor() finishes
    abc9c0f4f850d fs/proc/task_mmu: pin mm_users in do_pagemap_scan()
    1e13b8957510c fbdev: udlfb: don't rebuild the mode list while the framebuffer is in use
    3b0be34d9d1e7 fbdev: atmel_lcdfb: Prevent FIFO work after removal
    aa0be226ff227 drm/panthor: Fix TOCTOU race between GROUP_REGISTERED check and erase
    d5cc1f1333d47 Bluetooth: hci_vhci: Pin module for debugfs file operations
    2ff55599528d7 ASoC: amd: ps: fix snd_acp63_remove() teardown ordering
    5cb07a5941b1e ALSA: pcmtest: handle multiple wraps in random capture fill
    af2b590be8feb ALSA: emux: Fix UAF of soundfont zones at note-on
    04d11c4db269e ALSA: control: Fix UAF in snd_ctl_elem_add() on card disconnect
    b33aedc99e3cd rust: rcpufreq_dt: add module alias
    822d6761cdea1 rust: cpufreq: reject NULL from cpufreq_cpu_get()
    dc1744584b2b9 rust: configfs: fix data offset calculation for subsystem callbacks
    c6112b0a1627f rust: block: require `Sync` for `Operations::QueueData`
    11c13964153df rust: block: fix `Send` bound for `GenDisk`
    964002cb55d9f rust: bitmap: restrict bitmap length to at most i32::MAX
    d2af35f84f51c objtool/rust: add one more `noreturn` Rust function for Rust 1.101.0
    d655ef1740564 klist: avoid accesses after waking klist_remove()
    9250253c0ad52 HID: wacom: Write shared touch initial status only once
    c93698167e8d0 HID: wacom: Setup SW_MUTE_DEVICE according to the order of input registration
    321da540c4a20 HID: wacom: Redesign shared sibling data lifecycle
    ac81120321a90 HID: wacom: Fix Use-After-Free in wacom_bamboo_pad
    ef74a8a685e27 HID: wacom: Fix Use-After-Free in wacom_intuos_pad
    1df501b62a2fa HID: wacom: Advertise SW_MUTE_DEVICE capability prior to registration
    24d9994e439fe HID: wacom: Use hdev->product in wacom_setup_touch_input_capabilities
    bd30e2b60e811 s390/zcrypt: Fix out-of-bounds ptr advance in cca_query_crypto_facility()
    043da311673cd s390/signal: Fix incorrect return address in signal frame
    0917637564e95 s390/probes: Fix wrong opcode for cgrb fixup
    3a4da93473715 s390/kprobes: Prevent kprobes on instructions with exception table entry
    333a1435802c5 s390/extable: Fix mvcos instruction decoding
    ca06a46b6289e s390/cpum_cf: Check session mask before cpu offline
    3bcce6db59400 drm/msm: Fix vm_bo use-after-free in with_vm_locks()
    59eac6863eede ata: sata_fsl: Fix use-after-free of host_priv on probe() failure
    fd0dd0ee82ef6 ASoC: audio-graph-card2: Fix use-after-free in audio_graph2_link_c2c()
    174b4b90ec673 apparmor: fix a use-after-free in aa_lookupn_ns()
    1108d9a51c91b mm/hugetlb: fix use-after-free of a new anon folio
    8b87fd23be5a8 mm/hugetlb: fix use-after-free in hugetlb_mfill_atomic_pte()
    c33165bb785cb media: imon: fix use-after-free in display_close via dev_dbg
    e9deece850628 media: hackrf: fix use-after-free in hackrf_alloc_urbs() error path
    2344922abe2ad media: cx23885: Fix use-after-free in cx23885_finidev due to race condition
    95a1f45a82e51 media: au0828: fix use-after-free in bulk_timeout timer on disconnect
    70825b251e5f7 lockd: Fix use-after-free in nlmsvc_retry_blocked
    2b61008c9f884 landlock: Fix superblock use-after-free in release_inode()
    439c23b897c87 iommufd: Fix event queue release use-after-free
    6324f087caf81 nvmet-fc: fix use-after-free in nvmet_fc_ls_create_connection()
    506c066da8fb2 nvmet: fix use-after-free of the old registrant in nvmet_pr_preempt()
    ff2c27583cf9f platform/x86/amd: hfi: Fix a use-after-free when unloading the driver
    48157350b24ac rapidio: mport_cdev: fix use-after-free in mport_mm_close()
    e5388f15d595d RDMA/irdma: avoid use-after-free in icrdma_remove
    8069935474b15 smb: client: fix use-after-free in cifs_ses_add_channel()
    6c4c12b0fadcb smb: client: fix use-after-free infoleak via the readdir resume name
    b5e5d035abd1b spmi: Fix potential use-after-free by grabbing of_node reference
    3c3b401650227 SUNRPC: fix netns use-after-free in write_gssp()
    ac7558126767d wifi: b43: fix use-after-free in b43_bcma_remove()
    41f968434a72f x86/ioperm: Prevent NULL dereference on theoretical missing IO bitmap
    8519fc07a486e KVM: VMX: Synthesize nested EPT violation GVA_IS_VALID/GVA_TRANSLATED bits
    3b4df5414b99a KVM: x86: Tell ->inject_page_fault() whether or a fault came from hardware
    8a803deb2c7fb KVM: x86/mmu: pass PFERR_GUEST_PAGE/FINAL_MASK to kvm_translate_gpa
    42a44fe738f67 Revert "Bluetooth: btusb: Add ASUS USB-BT540 for Realtek 8761CU"
    eff110e062a51 Revert "Bluetooth: btusb: Add ASUS USB-BT600 for Realtek 8761CU"
    d3d5560fb7550 cgroup: serialize migrations of newly forked processes
    3d0d2b4ad54fc vlan: restore HW VLAN tag insertion with reorder_hdr off
    b3b56e95f6fad tcp: Fix potential UAF in reqsk_timer_handler().
    e8aa0ac634f0d ksmbd: validate security descriptor offsets before pointer arithmetic
    fb743d9cb66e8 ksmbd: use u8 for SMB2 oplock level values
    4f5ec4b0e9a89 ksmbd: return end of file for reads past a named stream's data
    06a751809ebd3 ksmbd: reserve space for the UTF-16 terminator in stream info
    22464634d240f ksmbd: preserve unreadable named streams on open
    9582dc3a31784 ksmbd: ignore network devices of other namespaces
    93566781118cd ksmbd: fix parent dentry lifetime in directory enumeration
    4f238380ea380 ksmbd: fix overflow in dacloffset bounds check in build_sec_desc()
    93cb902b0ca04 ksmbd: fix OOB read and cross-share confusion in ksmbd_validate_name_reconnect()
    24455d79b91b9 ksmbd: fix extended session security negotiation for raw NTLMSSP
    99a9db401d16f ksmbd: avoid restoring only in-memory EOF after allocation change
    be28566c8264b ksmbd: accept share config responses from ksmbd-tools before 3.5.3
    d85edc8f06eef backlight: qcom-wled: Fix WLED3 brightness register stride
    e9bff555cc77e backlight: qcom-wled: Fix unbalanced OVP IRQ enable at probe
    8eee3226bccd3 backlight: qcom-wled: Fix NULL pointer dereference in wled_remove()
    cf41ae5149f1e backlight: lm3630a: Cancel delayed work before destroying workqueue
    f204bb7c5d104 Drivers: hv: vmbus: Bounds check the shared ring buffer indices
    d4bded35edf8d driver core: fix parent lock use-after-free on USB disconnect
    890096a9e7c26 driver core: Limit the messages on a refused uevent
    4a9a39ef6da4a driver core: take parent lock on deferred probe
    2f1111eb40d7c net/sched: act_ife: do not consume the inner header on egress
    a3486bfb9d098 net/sched: fix packet reordering on requeue
    fc55d92ae6a4b net/sched: sch_teql: fix use-after-free on lower qdisc drop
    87d636b302886 net/sched: sch_teql: fix slaves_lock IRQ deadlock
    cdffcb89d8445 net/sched: cls_flower: avoid stale mask references after delete
    5d3e01de31209 net/sched: cls_bpf: accept dev-bound programs on shared blocks
    6cf00e646dc3f RISC-V: KVM: Fix double-free of sdata in kvm_pmu_clear_snapshot_area()
    b97686f158517 drm/amdgpu/uvd3.1: Fix checking whether UVD firmware keyselect was already set
    b20c4193a4250 tracing: Fix NULL dereference when copying keys for a field variable
    9876738cd08eb tracing: Bound histogram expression strings with seq_buf
    69c4a13c65873 tracing: Return ERR_PTR() from expr_str()
    4cb2b85da2bdd tracing: Use __free() for expr_str() buffer
    232c6e8486c7c tracing: Fix fully-qualified variable reference printing in histograms
    febee5fb91647 ntfs3: free replaced mount options after a grace period
    4aef6ceb4d6ac ipc: drop the mqueue mount with kern_unmount() on setup failure
    73309ca08e71b ipc: create_ipc_ns: drop mqueue mount on sysctl setup failure
    16c95870c95f2 accel/rocket: search every core slot when looking up a scheduler
    5684a6c24c0d7 drm/amd/display: guard dc_sink dereferences in MST mode validation
    81a1c7eba3347 drm/amdgpu/gmc12: properly pass flush_type to gmc_v12_0_flush_vm_hub()
    84cc155bf4cd4 drm/amdgpu: remove gart_window_lock usage from gmc v12
    bdb5784531b21 drm/amd/display: Fix fast updates on DCE 6.x
    352c5f5b995eb tools/power turbostat: Read complete CPU lists
    850d8d4b27151 smb: client: require stable pages for signed connections
    7448dcaaf747e smb: client: only require read lease for size-extending zero range
    e97dac26ed2cc smb: client: drain and invalidate before server-side copy/clone
    7beb2f2a58023 smb: client: discard post-EOF pagecache when extending a file via clone range
    0f79506b36735 smb: client: clear post-EOF pagecache when extending a file via truncate
    2fc1ffb15efd4 ALSA: hda/realtek: Add micmute LED quirk for Acer Swift SFG16-72
    6faf87bc73316 ALSA: hda/realtek: add quirk for Acer Nitro ANV15-51
    5d06e2f861d61 KVM: SVM: Update control fields on #VMEXIT if and only if VMRUN succeeded
    f2bd7cf6a83e4 KVM: SVM: Preserve TLB control (i.e. pending TLB flush) on failed VMRUN
    d4f2168ee9104 net/sched: act_ct: remove 'add_helper' dead code
    908bc440a285d KVM: x86: Fill kvm_run exit fields in common get_nested_state_pages() error paths
    59d30bdc3dd6f smb: client: delete compound mids on send failure before unlock
    3c97f7cb6c488 drm/amdkfd: Avoid integer underflow in EOP ring size calculation.
    9e8f43579f849 drm/amdkfd: Avoid integer underflow with ffs in EOP ring size calc
    2f16636913db4 drm/amdkfd: Guard m->cp_hqd_eop_control setting by q->eop_ring_buffer_size
    2548c31f3a194 xfs: don't cross reference rmapbt with bitmaps if they're incomplete
    9044683dfdc40 RISC-V: KVM: Fix sdata leak and stale snapshot_addr in snapshot_set_shmem
    969825a50f58b RISC-V: KVM: Release unused page after MMU invalidation
    19b0188d02630 smb: client: fix fattr leaking on wsl_to_fattr() failure
    b057eb6ab8005 selftests: ublk: install test_common.sh and trace/ scripts
    59d9b928e7a9f selftests: ublk: increase timeout to 150 seconds
    5531d09ec91c7 selftests: ublk: add utility to get block device metadata size
    c70f93046f59c selftests/ublk: fix Makefile to rebuild on header changes
    6ba19e15b3e17 drm/amd/pm: fix gpu metrics energy accumulator for smu 13.0.0/13.0.7
    d521b90533d08 hwmon: (asus_rog_ryujin) Synchronize HID command and report handling
    49cc6d5c00a7f hwmon: (asus_rog_ryujin) Validate HID report lengths
    e32756e2f58ab hwmon: (asus_rog_ryujin) Add per-device configuration
    ac3f7cc232653 hwmon: (asus_rog_ryujin) Rely on subsystem locking
    2f0a57ff8467f smb: client: fix WSL reparse point uid/gid override
    bd958a567974a smb: client: fix uid/gid override in getattr with posix extensions
    5802a9fda4ced mips: select CONFIG_WEAK_REORDERING_BEYOND_LLSC from CONFIG_EYEQ
    949748d827949 MIPS: Fix HOTPLUG_PARALLEL dependency
    4b24a1cbb1077 s390/crypto: Fix handling of EBUSY in PAES when req is pushed to crypto engine
    6c3e51e44834b s390/crypto: Fix use of mutex in atomic context in PAES
    e97fcd8b6598a s390/crypto: Fix return code handling at skcipher_walk_done in PAES algorithms
    06a76084f3e56 s390/crypto: Replace cond_resched() with msleep(1)
    46345b99ee5d4 LoongArch: KVM: Fix resource leak in kvm_loongarch_env_init() error path
    b46e041ff5166 LoongArch: KVM: Add unregister helpers for the KVM interrupt devices
    18c77e2bd13c3 drm/amd/display: Remove const Qualifier From Non-Pointer Fields
    ebc73f622313f drm/amd/display: add const qualifiers to watermark params struct
    04a1c2898d471 drm/amd/display: Update P-state naming for clarity.
    dab4a7fc7be2d drm/amd/display: DML2.1 Reintegration
    39a2c4e5e606c thunderbolt: Make the DP tunnel activation callback mandatory
    fc1fc874ceed4 ipv6: udp: Create exceptions before socket matching
    d269ed9fff521 riscv: hwprobe: initialize pair->value in hwprobe_one_pair()
    79345a5d14b85 smb: client: reject SetEA requests that do not fit the request buffer
    c9c29481d5d4a mm/migrate_device: clear stale mapping after freeing swapcache
    fa75d22453e52 mm/kmemleak: report RCU-tasks quiescent states during the scan
    8eaaabd4e9355 mm/kmemleak: stop the task stack scan early when interrupted
    b396167a7e214 rust: cfi: disable function merging if CFI is enabled
    81648c2440fd9 LoongArch: Expand module virtual address space to 2GB
    79d5f84e63a5d nfsd: use test_and_clear_bit for somebody_reclaimed to prevent lost update
    5f8e8c06c53f1 nfsd: dedup nfs4_client_to_reclaim inserts
    c7427dc319d3a LoongArch: KVM: Set vcpu->cpu before IN_GUEST_MODE is set
    f26957f88034c LoongArch: KVM: Deliver interrupt after IN_GUEST_MODE is set
    01a4c00041bea LoongArch: KVM: Check kvm_request_pending() in kvm_late_check_requests()
    bbac028f2e9cf i3c: master: Fix potential UAF in i3c_device_uevent()
    215bf2a69844e mm/page_alloc: don't spin_trylock() when disallowed in free_one_page()
    d7e0602fe5a4a HID: input: read battery capacity from its actual report offset
    fb59d3c60513f mm/migrate: use huge_ptep_get() in remove_migration_pte()
    be58823c0e2cf KVM: x86: Always initialize EFER reserved bits on vendor initialization
    59c7c68ec4dec drm/xe/display: skip FORCE_WC and vm_bound check for external dma-bufs
    7d38a96a93270 irqchip/gic-v5: Fix standalone IRSes OF probe
    59a6d8eda1c5d dt-bindings: interrupt-controller: gicv5: Relax IRS properties constraints
    db0f1d03fbd1b sctp: auth: discard auth_chunk when skb_clone fails
    8ced68fe293a5 netfilter: ctnetlink: do not expose expectation DEAD flag
    f540bf1291a97 netfilter: nf_conntrack_expect: add and use nf_ct_expect_related_pair()
    bc6b1da681abe netfilter: nf_conntrack_expect: use conntrack GC to reap expectations
    af17c2ffde0b1 xfs: fix integer overflow problem when setting large free areas
    66b8f5bfc592e wwan: wwan_hwsim: Pin module for debugfs file operations
    df713b82b4b96 udf: fix return value for non-recorded-allocated extents in udf_map_block()
    85a8777c7ec5e thunderbolt: Do not RPM complete unrelated subtrees on unplug
    d764d3f28a38d ocfs2: publish the filecheck owner before adding sysfs attributes
    f5e973e238ba6 ocfs2: pin owning modules for open debugfs files
    1c77b387fc305 ocfs2: drain quorum work before removing the cluster
    912327bb4cfdc ocfs2/dlm: drain join handlers before releasing module text
    f43a5d7b665cf nfsd: fix race between client_info_show() and free_client()
    00c0c940c1c89 net: usb: pegasus: do not advance rx_skb->data on dropped frames
    f9af5772ff0ef net: ipv4: add zero check for snd_cwnd_clamp
    8e2fc3941b400 media: go7007: only set audio_enabled if go7007_snd_init() succeeded
    dc0072c1b40fc media: em28xx: reject audio endpoint with zero packet size
    324d30da90f26 media: cx88: Disable PCI device on MPEG initialization failure
    04a04953b4828 libceph: bound mon_command ack decode to front len
    c93505aa0b292 kcsan: Avoid division by zero in kcsan_prandom_u32_max()
    068d3950e7180 kcov: ignore an out-of-range comparison count in write_comp_data()
    61adcab593ff6 fuse: don't BUG when the copy buffer is exhausted
    49d7c1beac381 ceph: fail readdir when the MDS reply carries no dirfrag
    37c957fbc8ac0 blk-crypto: fix NULL deref and UAF in __blk_crypto_evict_key()
    277157864856d ARM: 9524/1: mm: align hugetlb mappings to the huge page size
    5259a82b1ac10 media: em28xx: use video_unregister_device for radio_dev
    5712414af2393 Revert "namei: don't reveal overmounted entries in refwalk"
    ebb9d776e297f nbcon/reboot: Switch NBCON consoles into the emergency mode in emergency_restart()
    781ced4acf432 regmap: Remove debugfs before cache teardown
    4c6e3d81f8d49 RISC-V: errata: Add SiFive MAL-9092 workaround
    b213051fc40b1 drm/amdgpu/gfx11: set KMD_QUEUE for kernel gfx queues
    771bdf5dd8b11 drm/amdgpu/gfx12: set KMD_QUEUE for kernel gfx queues
    4de130f28ae8c ALSA: usb-audio: Add native DSD support for Cambridge Audio streamers
    c1e50fa372a8b ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 15-eg3xxx (103c:8bfd)
    ba06038fba12f spi: cadence-qspi: Fix status polling with octal DTR chips
    60f0adc41d886 ALSA: hda/realtek: Add ALC235 support for headset mode
    13c12f98618d8 ALSA: hda/realtek: Add quirk for ASRock NUC BOX-358H
    96e38c6a49f58 net: usb: qmi_wwan: add Rolling Wireless RN947R
    0ec1ea7f38d6d usb: mtu3: Fix double dereference in TP_printk
    a6c911aa993bf ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 14-dv1001TU
    b639fb18ad690 ALSA: hda/realtek: Fix speakers on ASUS PM3406CHA
    022127b8df549 ALSA: hda/realtek: Add quirk for Acer Nitro AN515-45
    3b75fa0871d32 ALSA: hda/realtek: Add mute LED quirk for HP Victus 15-fb2xxx
    14d1a67641d35 ALSA: hda/realtek: Add quirk for HP ENVY 13-aq1xxx
    634410e636357 ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 15-ec1xxx
    359096b8ff07f ALSA: hda/realtek: Add quirk for Lenovo ThinkBook G8+
    1e2dd3f061e0d ALSA: hda/realtek: Add quirk for Lenovo ThinkBook 16p Gen 3 ARH (21EK)
    888a43640be37 ALSA: usb-audio: Add mixer mapping for MSI MAG B850M MORTAR WIFI
    654906c34da2b ALSA: hda/realtek: Limit internal mic boost on HP Pavilion 15 (103c:2164)
    0ce65d3accd68 docs: update the unmount propagation rule
    bf4fde54d928d nvme-tcp: delay nvme_tcp_reclassify_socket()
    93449e64cdee8 ASoC: Intel: bytcr_rt5651: Add quirk for Chuwi Hi8 with generic DMI strings
    2a6254baab5cb HID: Intel-thc-hid: Intel-quicki2c: Fix buffer overflow
    c6e94c4f31025 HID: Intel-thc-hid: Intel-quickspi: Fix buffer overflow
    874ef161d9684 HID: universal-pidff: Add support for Turtle Beach VelocityOne Race
    a66633b2171ac ASoC: amd: yc: Add DMI quirk for Lenovo V15 G6 ARP
    43d6e9c812edc sfc: add X4D PF support
    257610f2b6d8b gpio: mvebu: keep resume masks within the irqchip cache
    88b0f77c61265 ASoC: amd: yc: Add Lenovo ThinkPad E16 Gen 2 (21JN) to quirks
    2c7a144e9e077 scsi: devinfo: Add BLIST_SKIP_IO_HINTS for EMC Symmetrix
    7e2fa3109c1fb HID: roccat: fix locking in roccat_connect() and roccat_disconnect()
    7076e590e98f7 nvme-fc: do not warn on controller removal race
    bd351a4366905 HID: elecom: Add support for ELECOM M-XT4DRBK (018E)
    0b034e308564c HID: i2c-hid: add reset quirk for Lenovo Yoga Slim 7x Gen 11 keyboard
    aac2603cd8297 HID: i2c-hid: Add i2c-hid-quirk-bad-input-size quirk for 0911:5288 device
    3f89968d6aee3 regmap: irq: Free the irqdomain we create
    aa8d2e53bee52 ksmbd: handle allocated range queries on dense files
    6938950bd00aa netfilter: tproxy: use DEBUG_NET_WARN_ON_ONCE for protocol fallbacks
    f08a043321aa8 ceph: fix use-after-dereference of NULL ci in __ceph_remove_cap()
    e3b41c907cb33 ASoC: amd: acp-config: Add HVY-WXX9/M1060 DMI quirk
    2aeb9dce7d76c ALSA: hda/conexant: Always enable the headset-mic pin on plugin
    1fa62b20936a9 ceph: do not cache negative dentries for snapped directories
    d2176dd74e28f ASoC: amd: acp3x-es83xx: Add HVY-WXX9/M1060 DMI quirk
    498f2b22fb4a8 ALSA: usb-audio: Skip mixer creation on M-Audio Venom
    f71c9aa7c0d07 tpm: atmel: depend on X86
    115270245d39b tpm: tpm_tis_spi: fix nodef CR50 tpm_tis_spi_resume is null
    a9b39298d6db7 HID: multitouch: Fix stale MT slots when contact count drops to zero
    cd95f97f3cd2c HID: i2c-hid: Add a quirk for a Cirque I2C device.
    18f4f406663b4 ASoC: amd: yc: Add DMI entry for Alienware m18 R1 AMD
    ce5368025a427 fuse: zero the partial EOF page when extending a file
    74460c60c40e9 ALSA: hda/realtek: Add quirk for Lenovo IdeaPad Slim 3 15ABR8
    d1687e52368c5 net: stmmac: fix device node reference leaks in stmmac_mtl_setup()
    14222a8d56295 powercap: intel_rapl: Fix kernel panic during PMU unbind
    582a89109ad98 fbcon: Fix KASAN slab-out-of-bounds Read in fbcon_prepare_logo
    855236abde297 net: ethernet: mtk_wed: increase WED v2 WDMA RESV_BUFF to 0x80
    c3d7738b2665a docs: block: fix dead http link in blk-mq.rst
    0337af8a6c39d scsi: snic: Fix SCSI host leak on workqueue allocation failure
    15f26d38bcf58 ALSA: usb-audio: Add iD14 MkI to monitor-mix volume quirk
    75e1a1c2738a2 ALSA: hda/realtek: Fix ALC700 audio on Intel Hades Canyon
    e0414672a6878 f2fs: avoid setting SBI_NEED_FSCK on transient resize failure
    167b5e23acf63 ACPI: button: Add DMI quirk for Razer Blade Pro 17 early 2020 lid switch
    59f9c4989e6ac sched_ext/scx_flatcg: expire cached hweights on weight changes
    b78a4334a8927 ksmbd: enable TCP keepalive for accepted connections
    890a3b249d461 fbdev: platinumfb: add error checking for ioremap calls
    a4467fbe41147 fbdev: maxine: fix 64-bit build error
    c63885314e5b1 i2c: imx-lpi2c: properly unwind resources on probe failure
    5c54d87cbe634 spi: loongson: pm: add .freeze .poweroff .thaw .restore
    48e991d80a205 rtc: brcmstb-waketimer: add missing MODULE_DEVICE_TABLE()
    889c7d21115ac rtc: ds1307: fix RX8130 wakeup alarm WADA bit for day-of-month mode
    c6e3c175c3ffc ASoC: rt712-sdca: Pull high JD2 to prevent from entering TV mode
    c4726cf942f00 virtio_ring: fix infinite loop in virtnet_poll_cleantx when device is broken
    60ae1e266f40a PCI: vmd: Add Nova Lake (NVL) and Dunlow (DNL) Device IDs
    b330ab215f281 rtc: ab-eoz9: add missing MODULE_DEVICE_TABLE()
    cfc695ac470db virtio_balloon: warn on failed buffer add in tell_host()
    085c485d49524 ALSA: usb-audio: Add MIN_MUTE quirk for Creative Sound Blaster Play! 3
    b34f1cc7838e7 vdpa/mlx5: roll back MR update after VQ setup failure
    ad008eeee1e9b drm/radeon: fix internal display on iMac11, 1 (RV770/DCE3.1)
    848b8e33af218 vdpa_sim: hold iommu_lock across dma_unmap passthrough transition
    f65a37638f236 ASoC: codec: max98926: fixup invert setup mask
    2c6395235c3cd platform/x86: thinkpad_acpi: Fix fan speed reporting on Edge E330
    504309a6d9341 platform/x86: msi-ec: Add MSI Katana GF76 11UEK EC firmware
    6a5808b621035 NFSv4/flexfiles: report cancelled I/O as a layout error
    b486934bcabda net: stmmac: use dma_addr_t for DMA addresses
    628874afc85eb NFSv4: pin the superblock for active state owners
    eb8a4524d32e1 ALSA: hda: Add Lisuan HDMI controller and codec support
    d44771126e549 NFS: Verify symlink inode before caching target
    085a1eb885f17 smb: server: Free session data in user_session.c with kfree_sensitive()
    7b3f00649f044 ksmbd: notify parent directory leases on child create
    290e5d72744c8 pNFS: honor clora_changed when recalling a layout
    b6534d1bd7dea smb: server: Make sure that passkey is not leaked on the heap in user_config.c
    2b24e1a49f979 ksmbd: honor client signing-required in all modes
    3a728c25f7142 ksmbd: reject blocking compound lock requests
    010ebd24940f1 ksmbd: fix AsyncId zeroed before use in smb2_lock() cancel response
    394898ff40cd1 ksmbd: fix SMB2 byte-range lock end offset
    6cdc0ac0c455b ALSA: hda/realtek: Fix mute LED for HP Victus 15-fa1xxx (MB 8C3F)
    bbcfc51648fbf smb/server: cancel async requests when closing connection
    d5eaa5dc2d91e ksmbd: report actual xattr value length in stream enumeration
    1ffa534cbaa0c ksmbd: skip fallocate for SMB2_CREATE_ALLOCATION_SIZE on a stream handle
    1373a9aba9ee5 ksmbd: allow FSCTL_SET_SPARSE without input buffer
    752103a26dc13 ksmbd: honor byte-range locks for zero data
    d4b647621230f ksmbd: handle empty QUERY_ALLOCATED_RANGES output
    ca4bc2ab7e747 ksmbd: return buffer too small for short security queries
    0adca6c5265c6 ksmbd: fix off-by-one rejecting minimal COPYCHUNK query-limits request
    b0b3a3f35df6c ksmbd: reject SMB3.1.1 binding with mismatched cipher
    a5f2f27799997 ksmbd: fix durable handle v2 default timeout units (60 -> 60000)
    ea8bcc9168920 ksmbd: allow I/O on directory named streams
    8b47ffa047620 ksmbd: preserve access denied status for copychunk
    8db0eab85a89c ksmbd: protect private extended attributes
    220e3f51071bd crypto: keembay - use crypto_memneq() to compare CCM AEAD tags
    567499907e178 libbpf: Fix ring buffer consumer loop on 32-bit position wrap
    80cb14cc834a2 crypto: sa2ul - use crypto_memneq() to compare AEAD tag
    9bfa6187948e2 crypto: keembay - use crypto_memneq() to compare GCM AEAD tags
    fa2697301e7ef gre: fix ERSPAN o_flags race/corruption in xmit and fill_info
    edff0fa7834ab exfat: keep FITRIM within the requested range
    524a770828a39 drm/virtio: reclaim pending vbufs before tearing down vqs
    72e4aeb3b6e70 HID: amd_sfh: Serialize access to the shared emp2 pointer
    9f38adcea4f3b ALSA: usb-audio: Rename the Audient iD14 monitor mix volume control
    89e76d0fc8d25 xhci: include all root port children in recovery prevention on link error
    d80451f7f980f ALSA: hda/intel: Add sanity check for BAR0 size
    9409d38fdde0b PCI: Avoid saving config space state if inaccessible
    6def7dd96f040 ipmi: Fix leak in __ipmi_bmc_register
    c2d18aa648163 soundwire: dmi-quirks: Disable ghost Realtek on Asus ROG Zephyrus Duo
    14ecf77177cb1 regulator: fan53555: Add support for FAN53555BUC23X type
    fe976b0e3c8a4 hfsplus: validate extent record length before writing it back
    2ed996cb5d14d ALSA: hda/conexant: Add mute LED quirk for HP ProBook 440 G5
    340894cf93328 alpha: run the remote RTC access in a worker, not an IPI callback
    f360874df64b9 nvme: ratelimit the completion-path messages driven by device data
    9c5a037acdec4 nfc: nxp-nci: Add remove on IRQ error
    d72106a40a554 nfc: mrvl: spi: Unregister dev on allocation fail
    8f22f2b887fcf iommu/amd: Fix missing CMD_COMPLETE_PPR response for invalid PPR requests
    7c42cf55b15fe selftests: net: reuseport_bpf_numa: consider cpuless numa node
    0929249787896 apparmor: fix auditing of mount binary data
    2f99cf389f720 tap: fix incorrect variable used for USO check in set_offload()
    852e06e77d7ec nvme-tcp: look up host_iface in the current netns
    42a29688f693b docs: cgroup-v2: fix stale "io" controller introduction
    9407cfd34fe29 selftests/net: fin_ack_lat: fix latency threshold typo
    def617fb61508 nvmet: passthru: fix OOB reads when parsing ns id descriptor list
    1f8ddae246332 perf/x86: Free hybrid state on PMU init failure
    5db10037b9c12 perf/x86: Unregister PMI handler on PMU init failure
    ad47c1a094740 ALSA: usx2y: Stop clearing urb->hcpriv before submission
    1b8a5b21ef8d9 iommu/vt-d: Fix CACHE_TAG_NESTING_DEVTLB polluting shared variables in flush loop
    01f4a7eeedac8 fbdev: udlfb: validate vendor descriptor items
    8b9b1c171bafe fbdev: omap2: dsi: do not copy isr table
    8020e4ad1c59f RISC-V: perf: fix resource cleanup on driver probe failure
    38c960fb5b83a riscv: kprobes: Prevent probes in breakpoint handlers
    2c6e0e5622590 net: dsa: mt7530: check CORE_PLL_GROUP4 access in mt7531_setup()
    77eed1651eb6f net: pcs: mtk-lynxi: check regmap reads in mtk_pcs_lynxi_get_state()
    f3cd9a1d3828d net: dsa: mt7530: check bus->read() error in core_rmw()
    851a01505ed71 Bluetooth: hci_event: fix out-of-bounds read in LE PA report reassembly
    7723752655f25 net: dsa: mt7530: error out on failed PHY_IAC command writes
    9f8852db6036a Bluetooth: hci_sync: Disable legacy instance's ext adv before setup snapshot
    cb2e195752677 Bluetooth: fix BT dependency for submodules
    3fb4a0376b4ee Bluetooth: hci_bcsp: validate received packet lengths
    6594a73c6b1b0 Bluetooth: btrsi: Move set_bt_context after successful HCI registration
    ea138f7a5a69c ALSA: hda/realtek: Add quirk for Acer Nitro ANV16-42 headset mic
    1e475880c031b ALSA: hda/conexant: Add pin config quirk for Huawei Matebook
    5af0fb2f2579e ALSA: hda/realtek: Fix speakers on ASUS ROG Zephyrus G14 GA403UM
    5c462ae712133 ALSA: hda/realtek: Fix headset mic on ASUS Vivobook S14 S5406SA
    bb3502307a71d ACPI: APEI: Handle repeated SEA error storms
    9bf8e55664306 drm/amd: Add DCN6 register headers
    d9ce845629cfb btrfs: fix memory barrier order in reloc_root_is_dead()
    ada5c75dd93ff Bluetooth: bfusb: validate received block boundaries
    ef01d3ea451a8 Bluetooth: btnxpuart: Fix use-after-free in probe error path
    3e4e7a9907a16 Bluetooth: hci_nokia: validate firmware packet bounds
    8a184070477c5 Bluetooth: btusb: Add support for 1357:c123 Realtek 8852BE device
    f8b6ea70abc05 Bluetooth: btusb: Add USB ID 13d3:3625 for MediaTek MT7922
    147d899c7b988 selftests/ftrace: Force C locale in ftracetest
    7f8a0b0265139 tools/lib/thermal: Fix misplaced extern "C" closing brace
    7419a8dfa09f0 md: add cond_resched() to md_do_sync()'s skip path
    2c2a8cf8dd4b2 md: skip bitmap accounting for empty write ranges
    ae07a0c355447 md/raid5: reject zero-sector reshape chunks
    2f7ad98de370d ALSA: hda/realtek: Enable mute LEDs on HP Spectre x360 16-aa0xxx
    bb8625b38c5c1 ext4: guard against NULL s_group_info in ext4_get_group_info
    28332e8aae84a HID: rmi: check report length before trimming sentinel bytes
    db1e5bd4ee8ef drm/amd/pm: derive stable PPT limits from PPTable
    b6d0b00a29636 arm64: mm: fix accidental linear mapping of no-map reserved memory
    dab4eb4a21353 wifi: rsi: Fix types to appease CFI
    31b92853b9b30 soundwire: dmi-quirks: Disable ghost Realtek on Asus Zenbook Duo
    de8256a63ba22 opp: Use clk_get_optional() to avoid leaving opp_table->clk as an error pointer
    a5da12211b986 ALSA: hda/realtek: Limit mic boost on Positivo N15RPE-S
    bc32b9880d1b7 ALSA: hda/realtek: Enable mute LED on HP Laptop 15-dy0xxx
    ee78a5c533afb xsk: account ring allocations to memcg
    24dd15e91fa6c net: usb: cdc_ether: add quirk for AMI BMC stale link events
    3b34ca885168c net: stmmac: raise TX completion interrupt at the end of an xmit burst
    eb5702c3a407c wifi: mt76: mt7603: file buffered frames under the TID reported to mac80211
    f02d25d753df9 ACPI: video: force native backlight on Acer Nitro AN515-46
    795698c7f08f4 ALSA: hda/realtek: Add mute LED support for HP Pavilion 15-eh2xxx
    de4d87d5b5ab3 s390/dasd: Snapshot intrc before freeing the request block
    f302c2ce5e78d kconfig: abort rather than loop for ever on EOF
    2c4825a78bf44 net/rds: unpin MR pages with unpin_user_pages_dirty_lock()
    3ae57d5de9155 net/rds: fix rds_message leak in the rds_send_xmit() drop path
    d27f95e1d8e1d net/rds: hold the socket while an rds_mr references it
    6e016448a0dc0 net/rds: don't use unpin_user_pages_dirty_lock() from atomic context
    6802944b2bca3 HID: intel-ish-hid: ignore post-init ENUM_DEVICES from firmware
    d8152a70f694a HID: quirks: add ALWAYS_POLL quirk for AULA Mini 60 HE Pro Dongle
    799f115840607 HID: quirks: Add ALWAYS_POLL quirk for Beitong BTP-KP20D dongle
    d191b5ca149b7 HID: logitech-hidpp: Add support for G502 X Plus USB mouse
    70c6c25f1fdc5 ALSA: hda/realtek: Add quirk for ASUS VivoBook M515DA/X515DAP
    0a03dd1d896b1 wifi: wilc1000: validate monitor transmit frame headers
    cbbef3c7d07ca wifi: brcmfmac: validate msgbuf flowring IDs before use
    cc03f779a328c wifi: brcmfmac: Set DMA direction for msgbuf packet IDs
    853afa74a0a8d wifi: mt76: mt7603: restore hardware PS buffering after a service period
    f1a8ab40a5a2e wifi: mt76: mt7603: fix U-APSD service period termination
    fe0126804871c wifi: mt76: set the EOSP bit in the QoS header of the last released frame
    562b8dae64597 wifi: mt76: mt7615: fix NULL deref in mt7615_mac_set_rates
    b9ba943727cc6 ASoC: SOF: Intel: mtl: Power down DSP if it is left enabled in pre_fw_run()
    2ab864e232453 wifi: ath11k: fix resource leak on error in ext IRQ setup
    25fbd69967755 perf: marvell: Cancel CN10K DDR PMU hrtimer on device remove
    4da920688df00 netfilter: nf_tables: call skb_valid_dst() before skb_dst()
    0c6d33329960b netfilter: conntrack: tcp: use UNACK timeout for non-closing RST packets
    7b592201c2657 wifi: mt76: wed: fix kernel panic on non-DBDC MT7986
    f39060120cf81 wifi: mt76: mt7603: add 0x7592 EEPROM chip ID
    c16fe00dc2fd3 wifi: mt76: mt7921: fix memory leak when skb_linearize fails in mcu rx event
    44081a569fb64 wifi: mt76: mt7915: configure noise floor reporting on reset
    5470927c67dcf wifi: mt76: mt76x02: report rx FCS errors to mac80211
    3b45fe35f1c06 wifi: mt76: mt7603: free beacon SKB on error
    9bc5063c5123c virtio_console: take a kref in find_port_by_vq() to fix port UAF
    b64510df5898a nvmem: brcm_nvram: fix out-of-bounds access on malformed flash data
    6983cdcd9e478 nvmem: brcm_nvram: reject empty NVRAM partition
    10a665862bfe0 romfs: detect hard link cycles
    b7e89e2fa8f18 md/raid5: complete discard bios while reshape is active
    50d94323e8558 regulator: rt6245: Restore state on enable failure
    1a23e121c92e4 mfd: axp20x: Preserve other control bits when powering off
    6a81aedf497a4 ALSA: hda/realtek: add missing error checks for COEF index reads in alc269
    937f704f4bfc7 mfd: ipaq-micro: Fix out-of-bounds stack read in ipaq_micro_str
    f732a202ae1ca fs/ntfs3: Fix memory leak in indx_find_sort()
    2728611a9cc50 ALSA: hda/realtek: add missing NULL check for codec->bus->pci
    ed7d338c57cdd exfat: free new directory cluster if zeroing fails
    ff69fd262ed12 soc: mediatek: add missing MODULE_DEVICE_TABLE()
    2c6749d443ac2 drm/panel-edp: Add BOE NE140QDM-NX2
    0d96af6c34ca3 s390/mm: Fix handling of vmalloc area in do_secure_storage_access()
    020be4f6fa046 s390/mm: Add missing mm check to do_secure_storage_access()
    ad0976d2cc58b platform/x86: dell-smbios-wmi: Fix chardev resource management
    7ad1c9970678a drm/msm: Fix barriers accessing ctx vm
    94e9beb9f07ed drm/msm: Move nr_cmds initialization
    53b20af866fac ALSA: hda/conexant: Add NULL check for dc_mode_path
    521f9dcf2e261 exfat: clean up new entry on add entry failure
    f10cfe517a158 arm64/runtime-const: Use aarch64_insn_patch_text_nosync() for patching
    a5c18f62c897e drm/amd/display: Fix rounding errors in CalculatePrefetchSchedule
    a5bc8c907c9fa drm/amdkfd: Fix signal reset event
    b42b5fcf47c75 scsi: smartpqi: Add new PCI device-ids
    27577bc864c76 i2c: qup: Propagate clock enable failures
    47aa1638074e2 ata: ata_generic: Don't store pci_device_id
    39985760acd2b clk: clocking-wizard: fix clock difference detection
    91b9c9cc4066f clk: tegra: support 48MHz clock for pll_p_out1
    409acb7efcbfd clk: mediatek: mt6735-vencsys: add missing MODULE_DEVICE_TABLE()
    1d6ad628f553d clk: mediatek: mt6735-vdecsys: add missing MODULE_DEVICE_TABLE()
    fe6152b31967f media: cx88: fix memory leak in cx8802_register_driver() error path
    7554cd67a4023 clk: imx: imx8qxp-lpcg: add missing MODULE_DEVICE_TABLE()
    a2ec55a40da21 clk: imx: imx8qxp: add missing MODULE_DEVICE_TABLE()
    9438ed031075a iommu/tegra241-cmdqv: Rate-limit the error ISR's log message
    5bcbc5dfb8bbf remoteproc: Force shutdown during device removal
    3243737978f3a exfat: write moved entry before removing source
    ea0a6f62eb583 udf: bound lengthAllocDescs from unallocated space entry
    65bd51927d8d3 udf: Fix bh leak for unallocated space entries
    cb0f7456d550b scsi: ibmvfc: free ibmvfc_target allocations with mempool_free
    d2cf7dd54f2fe scsi: ibmvfc: check for NULL evt in implicit LOGO and target delete path
    1b2f849cd5721 iommu/rockchip: Clear stale page faults before enabling stall
    ebf377dcba5ff hsi: omap_ssi: remove debugfs on port creation failure
    ec6a78f9541ac pinctrl: npcm8xx: move GPIO IRQ setup into request_resources
    3046577a25870 pinctrl: npcm8xx: fix debounce register selection
    6ea28cfe3424b pinctrl: npcm8xx: clear pending GPIO events during init
    d00d165f4cc40 pinctrl: npcm8xx: enable RMII outputs from RMII groups
    9c9d79cf6b58d firmware: imx: scu: manage mailbox channels and global handle
    a77dc10cccc23 platform/x86: int1092: Fix info leak in parse_package()
    2715ac3f0b8e3 fs/ntfs3: load ATTR_BITMAP run extents from $MFT extension records
    cd64f6c8f944a fs/ntfs3: fix lseek EINVAL on sparse/compressed files with 64-bit clusters
    a664da9f549dc ntfs3: fix info-leak in ntfs_rename()
    2a793f20a7e75 fs/ntfs3: reserve NUL byte when converting UTF-16 names
    1affb82f18306 PCI/portdrv: Allow probing even without child services
    49a49271d6a39 ntfs3: initialize err in attr_wof_frame_info
    493f39b7fe971 soc: ixp4xx: qmgr: add missing MODULE_DEVICE_TABLE()
    7460497fe7df9 drm/etnaviv: force flush on power register ops
    4ae6749e29625 ata: pata_ep93xx: fix PIO fallback when DMA init fails
    7a4e9be7b7d16 bitops: make the *_bit_le functions use unsigned long
    3a2b86ccf13e0 ext4: use FGP_WRITEBEGIN for tail block zeroing
    e860ffebadc94 ext4: check return value of ext4_get_block() in ext4_load_tail_bh()
    a51500c4d9ac1 wifi: ath12k: fix scan command endianness on big endian
    213ba5c525647 wifi: ath10k: trigger hardware recovery upon rx failures
    e05a1a4ca1db2 wifi: ath11k: validate regulatory capability phy_id
    d4ffdd817e43b net: libwx: disable TX VLAN offload for packets with >2 VLAN tags
    823403820ab17 iommu/qcom: Publish pgtbl_ops before releasing init_mutex
    79b547ff77c32 thermal: intel: int340x: clean up RFIM groups on DVFS failure
    f8cd002bb33ed iommu/qcom: Enable clocks before hardware access in qcom_iommu_ctx_probe()
    34e6afb88d021 iommu/qcom: Check pm_runtime_resume_and_get() return in probe
    6a0f6531a3270 drm/panel: simple: Add Kyocera tcg070wvlq panel
    4061582141c0d iommu/arm-smmu-qcom: Add SM8450 MDSS compatible
    7a56475bb968c ext4: reject mount if clusters/inodes per group are not 8-aligned
    131d675880a85 wifi: cfg80211: include cf1 offset when sending chandef
    b3bec69dd24dd riscv, bpf: Add support for BPF_MOVSX in RV32 JIT
    da882736cbeda power: reset: piix4-poweroff: add missing MODULE_DEVICE_TABLE()
    71d4ef0a0b274 net: prestera: ignore duplicate RIF destruction events
    9fd6abedac793 net: sfp: add quirk for HORACO copper SFP+ module
    16b873971b929 power: supply: cros_pchg: unregister EC notifier
    5a83f99967922 riscv, bpf: Add support for BPF_SDIV and BPF_SMOD in RV32 JIT
    04f44f6885a58 ACPI: sysfs: Properly map BERT and CCEL data to their ACPI tables
    a6caf23bbbd01 wifi: mac80211_hwsim: clear PMSR request state on abort
    6e0ea620b2196 wifi: mac80211: ibss: read deauth reason_code after frame length check
    6166f19a69954 ext4: set EXT4_STATE_NO_EXPAND in ext4_evict_inode
    72b2bf5592438 PCI: vmd: Handle BUS_RESTRICT_CFG value 3 for Arrow Lake-HX
    dc40b64d04f80 ext4: reduce max cluster size to match documented 256MB limit
    745d9352ec80a platform/x86/amd/pmc: Add T14 Gen2 AMD (20XL) to s2idle quirk list
    c3023181ec3ef ACPI: battery: Sanitise model_number by dropping unprintable characters
    45083910bc256 ACPI: FPDT: validate table and record lengths
    c9aacd7db8132 ALSA: hda: Check snd_hda_power_pm construct error before executing verb
    996766054b887 platform/x86: asus-nb-wmi: map ProArt key (0x8b) to KEY_PROG3
    5e1f73e1c34d0 drm/panel: panel-edp: Adjust T8 timing for AUO B116XAK01.6 and B140XTK02.4
    5f9d81c7144f4 media: go7007: s2250: propagate control I/O failures
    c023ae2228cfa media: dvb-core: fix feed leak on failed DMX_ADD_PID
    b571ade3a0642 wifi: iwlwifi: mvm: ignore sync frames when sync is disabled
    9e458e80d21d3 wifi: iwlwifi: mld: drop connection on D3 resume failure
    d2554d9bd3ecd wifi: iwlwifi: mld: validate wake packet crypto overhead
    b7e3bcd3b2a16 drm/msm/adreno: Add support for A704 GPU
    5528da68628d2 driver core: attribute_container: Unwind device_add() on attr failure
    6f244ea2fafa4 PCI: switchtec: Add Microchip PCI1008 to NTB DMA alias quirk
    a1474ca799933 PCI: switchtec: Add Microchip PCI1008 device ID
    62a24f902e8ce misc: ibmvmc: reject oversized inbound messages
    97193b096581d ipack: ipoctal: add rwsem to guard against TOCTOU in remove path
    61d91a89e1364 misc: ibmvmc: release send buffer on write errors
    afcf127aa07d9 greybus: manifest: validate string descriptor header
    bc01e7408d8ab misc: rp1: clear chained IRQ handlers on teardown
    e1a03a65162b4 misc: hpilo: validate device queue entries before use
    fc586ea544108 misc: genwqe: handle a first DMA address of zero
    cfe59571ce974 misc: bcm-vk: validate write size before allocation
    833c44918f919 comedi: pcmuio: Add sanity check to interrupt handler
    52e7dfa88e395 comedi: pcm816: Fix sanity check in interrupt handler
    7fbcd6f653586 comedi: pcmmio: Add sanity check to interrupt handler
    7beb6ca2f3ffd comedi: aio_iiro_16: Add sanity check to interrupt handler
    ce0aea8f724bd comedi: pcm711: Fix sanity check in interrupt handler
    83b49a8dacfc2 comedi: dt2811: Fix sanity check in interrupt handler
    27c6696abcce1 comedi: das6402: Add sanity check to interrupt handler
    9fbe69c3ba2af comedi: quatech_daqp_cs: Fix sanity check in interrupt handler
    1b077ad73af7d comedi: pcm818: Fix sanity check in interrupt handler
    6c5a43d797add comedi: ni_at_a2150: Fix sanity check in interrupt handler
    a7300663fa0e0 comedi: ni_atmio16d: Add sanity check to interrupt handler
    1b432b8013855 uio: sercos3: add missing MODULE_DEVICE_TABLE()
    55836402fc519 USB: misc: uss720: Fix leak in get_1284_register
    7277d38c00bd3 usb: misc: cypress_cy7c63: check result of IO
    148fcb7faf16e usb: musb: host: clear stale RX interrupt on three-strikes error
    3c09eb8edc591 media: cec/core: drop cec_post_state_event call
    5bb38ddc4ddf9 media: cec: tegra_cec: don't break off msg on NACK
    c643f5567089e scsi: qla2xxx: Handle INTx not connected while passing through
    c91060db4f4ac wifi: iwlwifi: mld: Do not cleanup FW state when the device is dead
    c7d73393a9e5e wifi: iwlwifi: mld: support aborting an ongoing ftm request
    47e3a46c3c98d gpu: host1x: Wait for timeout worker completion on channel free
    cc9422f6caeef tools/lib/api: Fix potential double-free from fdarray__grow()
    bca5f8ecbeaf8 wifi: iwlwifi: mld: cancel wiphy work before freeing wiphy
    7ee63a67d2da9 wifi: iwlwifi: mvm: reset the smart fifo state upon FW stop
    38c0dfbd44dda ASoC: cs35l56: Add support for CS35L62 for SoundWire
    30d81bbb62391 wifi: iwlwifi: mld: reset the driver state upon firmware recovery
    3da9cb696cee6 remoteproc: core: cancel crash_handler work in rproc_add() error path
    3eae2410216a6 wifi: iwlwifi: mld: validate D3_END notif size
    46403a03d416e wifi: iwlwifi: validate UEFI reduced-power SKU TLV length
    5133a95f41092 wifi: iwlwifi: support TTL platform device ID
    528b299318ee2 wifi: iwlwifi: validate PNVM SKU TLV length
    d9754d77182fd remoteproc: qcom: Check subdev start status in rproc_stop()
    660cb7f6dafb2 media: go7007: avoid undefined shifts in MPEG-4 headers
    1f000ae86851d media: cx18: stop VBI start-code scan before short tail
    2579f03aad937 media: ivtv: stop VBI start-code scan before short tail
    39ef93ceb83ba media: i2c: ov8865: Program the sensor on stream start
    2e7b5b3b6688b drm/etnaviv: check MMUv2 status after reset
    80d182edba4fb drm/etnaviv: check all modules for idle after reset
    57a0b2edcd5fa media: i2c: ov8865: Drop the runtime PM usage count on stream failure
    25e807780416a nvme: clamp FDP nruhsd to allocated RUH status descriptor count
    c9513f41be7e9 iwlwifi: dvm: add missing cleaup for on error path
    155ae5908007b nvme: bound ns descriptor header and body to identify buffer
    b2fd3bc65516e hfs: validate catalog CNIDs before instantiating inodes
    2fcd643f0e3ab soundwire: intel_auxdevice: Add cs42l44 to wake_capable_list
    45d4470612293 soundwire: dmi-quirks: add a global ghost list
    d6c7e4fa4fcc9 drm/xe: only resume exec queues that were actually suspended
    aeb724dae9a79 media: em28xx: use vb2_video_unregister_device
    fbc2053fc89c5 media: em28xx: requeue buffers if start_streaming fails
    3b9bfc463b2f1 media: em28xx: dev_info->pr_info since dev has been freed
    3909eaa26344e mmc: rtsx_usb_sdmmc: suppress false CD after init timeout
    8879a96ba07d9 pmdomain: qcom: rpmhpd: Skip retention by default
    4a1ce4307f09e gpio: vf610: add missing MODULE_DEVICE_TABLE()
    7823cf4f9bc93 crypto: keembay - add missing MODULE_DEVICE_TABLE()
    edd239bf397ff pinctrl: sx150x: add missing MODULE_DEVICE_TABLE()
    d0fa85e364968 USB: gadget: inode: fix mm lifetime handling
    4fba239be9110 usb_string_copy: Use kzalloc() to avoid leaking old data
    099d34863a4c1 usb: gadget: u_audio: clean up capture endpoint on feedback failure
    6997b82a2a26d usb: fsl_qe_udc: check qe_alloc_request() failure in ch9getstatus()
    e8ba98b981a74 serial: qcom_geni: Disable closing_wait for console to prevent shutdown timeout
    d4b9dc0a5b4d1 tty: serial: pch_uart: add check for pci_get_slot()
    5996913c7c04f serial: 8250: force synchronous probe for the ISA and PNP drivers
    aa7c80d4e25a4 mmc: block: reject invalid perdev_minors before division
    813a0eaf5570f media: v4l2-tpg: reduce stack usage for kasan builds
    6b772df6ea8e3 media: cec: tegra: add missing MODULE_DEVICE_TABLE()
    d638c584bdae7 rpmsg: char: Check for ongoing chrdev destroy
    c50acb6685598 PCI/ATS: Ensure pci_ats_supported() is PF-aware for VFs
    6d7097c6cc34e platform/x86/amd/hsmp: Validate _DSD mailbox sub-package element count
    42dcaf236bf8f ASoC: codecs: max98396: Unwind supplies on resume failure
    8cc9318ac315b platform/x86/amd/hsmp: Validate ACPI UID before parsing socket index
    87afe445153c0 bus: mhi: core: Fix sys error transition latency
    21ffa516ded0d nvme: don't reference NS after unlocking in nvme_ns_head_ctrl_ioctl()
    61ebae16cef33 drm/amdgpu/gfx11: WARN() rather than BUG() for invalid SDMA engine
    a1a4ef16abcaa drm/amdgpu/atomfirmware: WARN() rather than BUG()
    7bec37dbc03de ASoC: codecs: uda1342: Leave cache-only mode before syncing
    e26ea9ee489f2 udf: avoid recursive s_alloc_mutex deadlock when freeing AED blocks
    d7f0518e1bbd2 udf: validate extent partition references in udf_current_aext()
    1e100c7514502 usb: typec: mux: tusb1046: add missing MODULE_DEVICE_TABLE()
    8a85caef42628 staging: rtl8723bs: fix missing unregister_netdev on sdio_alloc_irq failure
    e4bde5182fa11 nvme: zns: cap zone report nr_zones by DMA buffer size
    4be4e86ba5f7a nvme-auth: use crypto_memneq for DH-HMAC-CHAP response comparison
    0f4def9c8171e nvme: handle positive error codes in nuse_show()
    c9bfb6382c5fd remoteproc: core: Full attach detach during recovery
    d94ce71268534 clk: sunxi-ng: fix ccu probe clock unregister on error
    2b7412064bfad mmc: dw_mmc: stop and complete DMA also in STATE_DATA_BUSY state
    9978e5b0ebcb7 mmc: sdhci-of-ma35d1: add missing MODULE_DEVICE_TABLE()
    7cc038a9c2887 mmc: cqhci: fix to missed endian conversions
    7228d04ae8cfd mmc: moxart: report DMA completion timeout
    aca5b61f01c4b gpio: sifive: add missing MODULE_DEVICE_TABLE()
    f2cf823286f89 dt-bindings: arm: qcom,ids: Add SoC ID for Snapdragon SDM 850
    2aa1e4219a1c6 RDMA/rxe: Check PDs for memory window binds
    f6e8195ab2e07 soc: qcom: socinfo: Add SoC ID for SDM850
    25c13a5b8151d RDMA/irdma: Suppress PF reset on HMC error
    5a57301b3b2e9 iio: adc: max1241: add missing MODULE_DEVICE_TABLE()
    323a97943fd34 block: reject block device inodes with i_rdev == 0 in lookup_bdev()
    724be334c2944 soc: amlogic: meson-clk-measure: remove debugfs tree
    0d75eb5f52cf0 wifi: rtw89: wow: add QoS control field to WoWLAN ARP response for MLO
    0bc19a2f4a262 wifi: rtlwifi: fix disabling of ASPM for RTL8723BE with AER flooding
    a64fad3193fc0 wifi: rtw89: wow: only WiFi 6 chips initialize RF registers in WoWLAN mode
    61b73a744e95c wifi: rtlwifi: rtl8723be: Remove unnecessary irq save/restore in hw_init()
    b2f84c6f8e8a6 dmaengine: dw-axi-dmac: fix __le32 on set of CH_CTL_H_LLI_VALID
    5b2dc86f8ad71 net: mvneta_bm: add suspend/resume support to prevent crash after resume
    680154d070c43 dmaengine: pl330: remove debugfs file on teardown
    329df0483984d soundwire: dmi-quirks: Disable ghost Realtek on Asus Expertbook
    873f33349f3d3 netfilter: ebtables: bound num_counters like nentries in do_replace()
    2e23f7167e4a7 net: usb: rtl8150: handle link status read failures
    8e9b795a570b6 libbpf: Skip bpf_object__probe_loading() when BPF token is in use
    3e96da4909110 drm/panel-edp: Support MB116AS01'3 edp panel
    f1be0815acc30 drm/amdkfd: add sanity check in svm_range_is_valid
    35606292782dd drm/amd/pm: Validate legacy hwmgr PP table offsets
    d930abfdca53f drm/amd/pm: Validate Vega10 PPTable subtable bounds
    269e57807b70b drm/amd/pm: Validate Tonga PPTable subtable bounds
    f20fe19df5d99 drm/amd/pm: Guard VBIOS AC timing table walk
    2fe60f66d6ab0 drm/amd/pm: Validate Tonga PowerPlay state array bounds
    4487046481a55 drm/amdkfd: use node XCC count for v9 CRIU control stack restore
    88b64ba960522 drm/amd/pm: Use uploaded size for legacy custom PPTable
    bb556e5ff437c drm/amd/pm: Validate pp_table header before reading size
    6bd63ff350e1e drm/amd/pm: Validate Vega hwmgr PowerPlay table bounds
    cfb27089cf04d drm/amdgpu: add check for xcp id
    cafbd67662675 drm/amdgpu: Guard reads in pcie state readout
    884ffe3596256 drm/amdgpu: Support some Barco AMD based graphics adapters
    6441c5b430eb3 drm/amd/pm: validate vega10 profile mode inputs
    9d34f21482074 drm/amdgpu: validate XCP topology counts before division
    6d6b861cd078e drm/amdgpu: Validate ATIF buffer length before use
    27eef4dcedf82 drm/amdgpu: Fix kobject cleanup in xcp sysfs
    41e21fe60adfe drm/amdgpu: Validate ATPX buffer length before use
    66b095839f0b3 drm/amdgpu: Add checks to vbios fetch through ATRM
    7fca266784f6b i2c: acpi: Force ELAN1300 touchpads to 100 kHz
    6c65dfeb93ab0 netpoll: do not warn when the best-effort pool refill fails
    f3433cfb30fdb i2c: amd-asf: Validate firmware-reported length
    e291a2ccc5539 wifi: ath12k: avoid setting 320MHz support on non 6GHz band
    1f80e8bbe7c25 memory: stm32_omm: initialize ret in stm32_omm_set_amcr
    81673a22e1ee5 spi: bcmbca-hsspi: return error from failed controller suspend
    8af06aa5e860b spi: nxp-fspi: disable runtime PM on probe failures
    5a6dd98304fa1 spi: fsl-dspi: clean up after failed suspend and resume
    9e93c02b6bf06 drm/panel-edp: Add BOE NE160QDM-NY1 panel
    8c249f45dde83 spi: bcm63xx-hsspi: return error from failed controller suspend
    5bbe145daa754 spi: bcm63xx: return error from failed controller suspend
    b902b2bf21ed0 spi: bcm-qspi: return error from failed controller suspend
    a78ed42facf15 fs/namespace: notify pollers of legacy propagation changes
    00ad8fb259e95 perf/x86/intel/uncore: Fix PCI PMU cleanup on setup failure
    2ff10d2594453 fat: reject name longer than NAME_MAX in msdos_format_name()
    0211c538cc7b7 perf/core: Fix kernel register info leak via hardware skid
    d87eb804028e2 drm/sysfb: simpledrm: Validate mmap size against framebuffer size
    fb4a3facba36a perf/x86/intel: Fallback to sw branch type decoding if no hw decoding
    e85198f3f6b42 iio: accel: fxls8962af: clamp the device-reported FIFO sample count
    ee5298ac5f2b3 ARM: OMAP2+: Add CFI type for omap4_finish_suspend
    b220b2bb99b3c selftests/cgroup: Adjust cpu test duration based on HZ
    62549edc55291 regmap: maple: Workaround for another false-positive compiler warning
    709c3865ede5e ASoC: hdac_hdmi: Fix resource cleanup on probe failure
    32b1dce444ace ASoC: tlv320aic26: remove keyclick sysfs file
    2f5641f9740ea clk: zynq: handle kasprintf() failure in periph_clk registration
    69b25b97d439b spi: qpic-snand: free OOB buffer with ECC context
    f6e11b1c35a68 ASoC: sma1303: remove fault-check sysfs group on remove
    65f32bb18f5e4 irqdomain: Plug leak in irq_domain_alloc_irqs_locked() error path
    41088f2032937 ALSA: usb-audio: Release components on probe errors
    54116b5fc4d0a media: cec: stm32: return an error when log-address wait times out
    b97aa8f8ec988 ALSA: hda: Force resume if acomp notified during system suspend
    8c804241ce99a ALSA: hda: Add support for Hygon family 18h model 5h HD-Audio
    5073bafe7a8f8 w1: ds2482: add OF device match table
    bd78ad6bfa958 HID: wacom: avoid copying Bluetooth input reports
    c51a3ad1477cf selftests/filesystems/overlayfs: fix set_layers_via_fds link error
    220414ffec1b6 gpio: pca9570: Use I2C match data
    e0f1d03b9a648 drm/amdgpu: add bounds check to prevent array overflow
    9614f912f9aec drm/amdgpu: add buf length check
    d09f84813b4a6 drm/radeon: avoid double free in r600 DPM cleanup
    95437a9903773 drm/amd/display: fix max dispclk_khz/dppclk_khz double 1000
    7a8c7e9212c35 drm/amdgpu: Gate debugfs MMIO access on kernel lockdown
    29000475b125d drm/amd/pm: Validate OD DPM triples before mutating tables
    86229fb465756 drm/amdgpu/mes_v12_0: use mes schedule pipe for legacy queues on unified MES
    0c42724fcbcdf drm/panel-edp: Add BOE NV116WH2-M30, BOE NT116WHM-N21, BOE NV116FH1-M31, BOE NV116FH1-M30
    350761e9892f1 drm/virtio: abort virtqueue wait on device removal to avoid hung task
    d65d52d6370ee drm/rockchip: dw_hdmi: Use resume_early pm ops for system suspend
    862d9268f40a6 ALSA: line6: Clear prev_fbuf on capture buffer release
    aff15e1f648e9 net: bonding: move bond_should_notify_peers, e.g. into rtnl lock block
    024b63ae8c6ab net: bonding: use workqueue to make sure peer notify updated in lacp mode
    0160184fbf890 coredump: prevent TIF_NOTIFY_SIGNAL from interrupting coredumps
    64f2a38a16584 fork: don't create io threads once PF_POSTCOREDUMP is set
    c3b9c90f32c5d fork: move the coredump and exec checks into create_io_thread()
    4e023a26c613e exec: cancel io_uring requests before de_thread()
    e6223dfe62a22 hwmon: (lm90) Rely on subsystem locking
    1a1ed9ba4386d kbuild: link-vmlinux.sh: improve detection of third pass requirement
    220705d574388 platform: cznic: turris-omnia-mcu: Add missing MODULE_DEVICE_TABLE()
    fb1e15ddd94ce iio: hid-sensor: als: scale each channel individually
    62be46110a2c2 mm: vmscan: fix dirty folios throttling on cgroup v1 for MGLRU
    49675f7bc0e1a ksmbd: wait for negotiation before receiving another PDU
    1c623e3cbf43f net: skbuff: propagate shared-frag marker in skb_zerocopy()
    f45ed76d6791c Linux 6.18.60
    057cd46db83f7 ACPI: tiny-power-button: Convert the driver to a platform one
    05a4e200b1292 ACPI: scan: Do not combine resources that overlap completely
    67073dd6a642a resource: Add __resource_contains_unbound() for internal contains checks
    112182caff410 ACPI: scan: Avoid registering platform devices with resource overlaps
    70178691c467c pid_namespace: prevent TIF_NOTIFY_SIGNAL from interrupting the reaper
    2decf30c2427c signal: allow taks to temporarily block TIF_NOTIFY_SIGNAL
    7df22750f30db exit: hang up the tty before closing the files
    f7ac8500d58e7 fork: release the files of a failed fork after sched_cancel_fork()
    85b3ef7b9648a ptrace: refuse to change the signal mask of a user worker
    19c3fbf86c2a9 signal: only SIGKILL and the freezers interrupt a coredumping task
    c91e2a1f058db signal: don't retarget shared signals in a dying thread group
    16e94ed90b1b0 coredump: hold RCU while releasing parked threads
    8932e5a4df110 ftrace: Initialize modname and offset in print_rec()
    1aa0c7aa4c255 asymmetric_keys: reject trust keys without IDs
    e55d48f21f591 keys/trusted_keys: return immediately after TPM unseal failure
    0dac848d4e814 KEYS: trusted: Fix blob allocation size in tpm2_key_decode()
    01835d3a3709b KEYS: Fix key_reject_and_link() race with keyring restriction
    3edc064069d07 keys: Protect the read method check against type removal
    61ac0585d9f43 keys: make keyring indexes independent of kernel addresses
    6b613747f7ea3 keys: Protect the type name while describing a key
    b86db7993051d keys: Check the authorization payload in process keyring searches
    b0830a26e2c30 keys: Avoid the owner account dereference in named keyring lookup
    d3a32432e6be8 io_uring: keep the drain active when a deferred drain request is started
    708031a0f3d81 io_uring: end the drain when the drain request completes
    5bfeee1774791 io_uring/waitid: prevent cancel reference wrap
    29257ada73c41 io_uring/wait: wake real-time waiters from hard interrupt context
    68c3969f8682e io_uring/net: keep recv buffer select length within MAX_RW_COUNT
    9249f350e9b29 io_uring/poll: don't loop on HUP with multiple references
    f10ab47077e63 io_uring/timeout: don't lose a cancel as io-wq arms a timeout
    045dfbbbc7236 io_uring/timeout: don't flush with the sequence behind the last flush
    c7bb2c49581e8 io_uring/timeout: don't put a sequence target behind the last flush
    afa407c02f3aa io_uring/poll: avoid retry wakeup loss when dropping ownership
    8e3ac8ada6b50 io_uring: look up the file before queueing to io-wq
    379b1382befba io_uring/timeout: don't end a linked timeout with 1
    d25c2deb5dd4c io_uring/timeout: no ABS update of multishot timeouts
    fc8506eea4498 io_uring/net: don't retry recv on uncommitted buffers
    e9b540d004ca6 io_uring: don't pass restart error codes to userspace
    b4b7b2d19dab6 io_uring/openclose: keep the lock in io_pipe_fixed()
    64fca102086d5 io_uring/sqpoll: let the thread sleep on disabled rings
    857de5de2f576 io_uring/kbuf: handle index wrap in last buffer check
    9bfb315e2d090 io_uring/zcrx: fix buffer offsets in areas above 4GB
    1731af12abdd9 io_uring/napi: don't busy poll past an expired timeout
    18c373f446068 io_uring/napi: make stale entries time out after 60s
    d978f1fafc53d io_uring/wait: no early -ETIME if min_wait finds work
    515e06072da30 io_uring/timeout: keep repeat count on multishot update
    ec99bc7fae9f9 io_uring/timeout: don't skip over reached sequences
    c5a92562cddf1 io_uring/fdinfo: fix CQE dump of CQE32 rings
    24ea0d2fc921f io_uring/register: handle index wrap when resizing
    82274bbae24fe io_uring/register: don't wrap 32b CQEs when resizing
    3a9c90b5be6fe io_uring: drop the CQE cache if a refill fails
    3330d7c73fa95 io_uring/futex: allocate private hash before waiting
    1924a7e963089 io_uring/poll: drop stale double poll entry on rearm
    feb9c75c4d24d io_uring/wait: look at all CQ waiters on wake up
    2c88d978f1dfd io_uring: wake ring pollers for local task_work
    1827b011dd85d io_uring/cancel: let CANCEL_ALL find parked requests
    49dbeedbcc39f io_uring/cancel: recognize "no timeout" on 32-bit
    83fb8fe2210d6 io_uring/cancel: don't forget that the work was running
    4a9748a48f238 io_uring: don't lose a cancel as io-wq parks a request
    272f545ab9314 io_uring/poll: don't lose a cancel as io-wq arms poll
    a08c16cf40323 io_uring/io-wq: let cancel find picked up hashed work
    5d8092339f323 io_uring/io-wq: don't exit with a creation pending
    661bfc5b5cecb io_uring/io-wq: don't strand work when a worker exits
    20558701dbeb1 io_uring/io-wq: don't go to sleep on pending work
    14f56e9c0b8fd io_uring: don't flood a cancelling task with task_work
    3e02b8df0e9fa io_uring/io-wq: don't hide a link from cancellations
    7309fea05a3d6 io_uring/io-wq: don't lose the signal that ends work
    4a89352edd8b3 io_uring/wait: don't spin on a stuck overflow list
    2d5af21422060 io_uring/cmd: don't leave list poison in ->hash_node
    8381a912c65b8 io_uring/waitid: own the request before clearing ->head
    0d81cdd433b0a io-wq: order the exit bit against worker creation task work
    388604279da3d net: gso: limit recursive IP-in-IP segmentation
    06e816bed499f tracing/histograms: Verify event_call identity when updating synth_event refcount
    a9c51d3b5311d tracing: Fix 64-bit and signed histogram fields on 32-bit kernels
    431959fc76456 tracing: Unregister field variable histograms when the command fails
    3609ada3c12ce tracing: Save the event file instead of the compatible histogram
    1008e9e0b8280 tracing: Reject incomplete event filter expressions
    92b69f6db640d tracing: Hold trace_types_lock when resetting last boot data from readers
    57408eac99b0d tracing: Hold trace_types_lock when updating modules in persistent instances
    10c705dd706aa Bluetooth: L2CAP: refuse __l2cap_chan_add if chan already has conn
    216a047d17b5c net_sched: codel: fix stale state for empty flows in fq_codel
    d5482be6243b8 mm/damon/core: error damos_commit_quota_goal() for zero target_value
    ce68b7a19a23c block: avoid potential deadlock on zone revalidation failure
    50a4c00511cf6 ax25: don't free an incoming SABM skb left on the listener's queue
    422548da8d1a5 rose: bring up the link of the preferred route passed over by a connect request
    e1765e170a088 ax25: send unacknowledged I frames again when a link is re-established
    26c0952ba2267 rose: clear the circuits of a neighbour that restarts the link
    d5189ba853431 ax25: send a private copy of each I frame
    f44808ff191c2 ax25: don't accept frames on a device that is going down
    d046414d59009 ax25: wait for ax25_send_frame() before detaching the connections of a device
    08690ab94ca88 ax25: read the connection's ax25_dev only once when walking ax25_list
    56165cd0710cd ax25: don't create two connections for the same link in ax25_send_frame()
    515efcc5aacca rose: process received frames and send with the socket locked
    ccf05d51014e8 ax25: serialise the transmission of I frames on a connection
    d43478056d6f2 rose: restart the link of a neighbour created over a live AX.25 connection
    1e3cba4096442 rose: clear through routes when a neighbour is removed from the tables
    d834cb9b9ce7e netrom: fix nr_node leak when nr_del_node() removes the last route
    f026224d03017 netrom: clear nr_neigh->ax25 under the routing lock in nr_link_failed()
    9e08bc699bde7 netrom: fix reference count leak in nr_rt_device_down
    ece0d8fc6a459 netrom: look up and update routes in one critical section
    a007f3036b593 netrom: use a single lock for the node and neighbour lists
    23c0aedefd907 net: ax25: fix integer overflow in ax25_rx_fragment()
    d3db0d9b568bb ax25: check frame length in ax25_decode() and ax25_rx_iframe()
    0fb17d4257e8b ax25: fix OOB read after address header strip in ax25_rcv()
    9a92a7f8bd979 netrom: bound fragment reassembly in nr_queue_rx_frame()
    775505307e971 net: netrom: validate source address in nr_find_socket()
    2cf088d424357 netrom: require full NET/ROM headers in nr_route_frame()
    c8082ee771a03 netrom: linearize and validate lengths in nr_rx_frame()
    e885a256982c4 rose: clear stale N(R)/N(S) before (re)transmitting a data frame
    2a2927e95cf1b ice: change XDP RxQ frag_size from DMA write length to xdp.frame_sz
    eae1bd12387e1 ice: fix rxq info registering in mbuf packets
    54136991299a6 ACPI: scan: Register platform devices for fixed event buttons
    600d95eb39ad3 eventfs: fix SRCU read lock leak in eventfs_iterate()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
index 38c920f..a3057c9 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v6.18/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "12c82799f6285726ff94453e5cdcad7e753c30c5"
+SRCREV_machine:genericarm64 ?= "c071888d7624b37ecd174ded9ed9abd799f017de"
-- 
2.43.0

