Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4371.1793244362223060161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 20:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=IGKqcHzG;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91791ec1b83so13534696d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 20:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793244361; x=1793849161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEEcf7Ck+VWVhQAjQiF/kXXr9iPhKFbvY801wDyWKIY=;
        b=IGKqcHzGRjibq1kUSBKOtzY2H+Rkpc9IppvHFH13JBHW4/bVY0dJUla2ZInrXGSzmB
         tHoNaQShjRYIvjcOOa8ctOm/loHFk6O97QAPJr7SpYrHJFSmCaJtVePbE9ogrskb5/Zl
         Me44/RVbeOgbDwC96RxAAT88iwjt4DiaU6SagHM8mtdRFS9/nEShny31GjPPDQsxS0Oe
         WpTew+1sNdNz536Wd4zLopGY5BJNahpExWEY4REEOFZv13mAPCUT5OwZ5b62njFYwM1u
         zuU0N9cR4aZbSKQFtI+li9CKEo/1WNBWT2tSNskPihSD0q7IWx69BHSkNFSjU9tjIepE
         5Pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244361; x=1793849161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wEEcf7Ck+VWVhQAjQiF/kXXr9iPhKFbvY801wDyWKIY=;
        b=kMKeheWNVVYPxB+DNjvBHAK1V6ktK8sI+RvoIm72a/BrUFqT5qs+mjq/GippvKaqpM
         ZopKNU0CTerCiJg6XaZy2UCZiNgKBYKqKjm6Tc8Seq0ybHu498NjjCAhtd0CRmYxMf7a
         TdIZiwyDpkWp/qJhBTwOiIgQQRDPdamCziFE0TnC+5UWUcrAB6vhdwvxPNrhPL69a51V
         wRVR/yin7mWE2+MLk6FaBifwpitMwbnTpuzfJ2//6+RHVpZ/h92/Q0uv2bxCnDYT/Eqy
         IbCO2+Cr/xWbGR0eazvxvWaIv1Ef02e11trDthM/zl3agkpYtbHbKm9AaO/AGkCvmoKZ
         Oq6g==
X-Gm-Message-State: AFq9FYIDkBP/urpP//Y9x/oAk/e/IZ1+9NZ4Z40W1lvD8oianRsAylo0
	/y45l58OwiWdiwQNB4BZmtlA3m22RuwXaNCK2uRR9PsFhm7ukIXmNPyB0HJtIN+O
X-Gm-Gg: AYBFou02OJmhLATLby6nrEBfeGZFpNBy3SDS7QnywFIbGNRuzGt0Ahpeg9fuXVn1tD5
	4D8k9Zg7QWgWiSZGTnpGRGf2Pw6RJj9/TT4b/TD3kForI4lLci+QYzxCdaRyS5vDNBfPNUKSPfG
	NQWfZ1VCk73eA4yX5WmaGiiRyx9lCC3j7lErbieMWVesVjouJ/YUsC00ewbuNoxqjZQhrBRdXRa
	DCfChOR29HOOQ9h6ao91WzhWp1/QoIEi4Aam6pnChBTWpl7WwySCvAzF4bWSkISsJVy7i094Vfs
	6zfZvnj26C0eHepLcH+y9ueMqUXJ+Om2RWdqgnC8sMTtmVdpMWap4oBXwIKU0S4KoUJSePwc5hX
	t2R7//aSgZ7gtIHOWcOApZqGoFcTFiW2ENx4ZFRHGHgmtrjLeR7bnYCanOhR1Js1pmP47+kqjTL
	FqRbcZnuxAiNvj6BArJ6EllxCpl3uzWrsqPvmu4pQ1yoJj5VfRNjFSx9d/959szbqgxo/xQAjqD
	acvm2wdu95mc8DWMO8CZbbxdcO6kSqWSBLisgkujzMs3C6BNIT+aqupztk93k/ibidpv44n8cw1
	zMNLtjaMvLD0Y7oxWFvhKzbZ5TGLZKVSRqy+b8erHPQNp/e+d6a6JLrmXdfUsmncVwUjfir8nDr
	5Ln7h3/yut1DSk4Tpcr4YROuzIjE0wqx7uAetGWHFVr5gkyefzzFpmeDf/+qB2KeqHzOIpft/B8
	P5Go4cTBL+prLhNeHy/HN1Xc/pWe9RCOYef9ida/y2IEJ+ww==
X-Received: by 2002:a05:6214:5987:b0:91b:8b44:d4be with SMTP id 6a1803df08f44-91c7cf72dc6mr66329856d6.28.1793244360844;
        Wed, 28 Oct 2026 20:26:00 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47bda586sm147529056d6.8.2026.10.28.20.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:25:58 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH 11/11] yocto-bsps: update to v7.2.13
Date: Wed, 28 Oct 2026 23:25:26 -0400
Message-ID: <20261029032527.3150782-12-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029032527.3150782-1-bruce.ashfield@gmail.com>
References: <20261029032527.3150782-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 03:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248868
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/7.2 to the latest korg -stable release that comprises
the following commits:

    3c172eede0d6b Linux 7.2.13
    924fe47419fff smb: client: drain outstanding I/O before truncating on O_TRUNC open
    dedb4aa2c3a95 ntfs: fix memmove overlap in ntfs_new_attr_flags
    7dc2c52460803 ntfs: move attribute payload before shrinking its record
    c5434e86d6c53 ntfs: fix resident conversion in ntfs_new_attr_flags
    f0b0738ba9573 ntfs: take invalidate_lock in ntfs_setattr_size()
    5c581a59bcce3 ntfs: use pagecache_isize_extended() on size extension
    3d2ef2b9f4c08 workqueue: Fix unbound pool lifetime for pending pwqs
    f0f18075e45d4 sched_ext: Fix the bypass dispatch claim for schedulers bypassed by an ancestor
    396ba6f04da3f sched_ext: Fix stall when a task enqueued with SCX_ENQ_LAST lands back on its CPU's local DSQ
    2d9d24385201f drm/amdgpu: free the userptr ranges when a CS fails after parser_bos
    62ebf3310eeb1 drm/amdgpu: Remove the bo list mutex
    357061da006f2 genirq/proc: Fix missing CPU header in /proc/interrupts
    2c4d5de1b6827 ntfs: fix undefined behavior in mft/index record size calculation
    0a9122cada749 ntfs: fix incorrect MFT record pointer passed to ntfs_attr_record_resize
    5e87da8ba8d3d ntfs: fix FITRIM range alignment
    ad096ce2923cf ntfs: handle signal interruption in fallocate
    9efbd764ab80f smb: client: reject SetEA requests that do not fit the request buffer
    23ee613f831b0 smb: client: fix multiuser mount with krb5
    596b4062e6c75 smb: client: fix heap overflow in cifs_do_set_acl()
    ffa66fdc7d35b smb: client: fix data corruption with concurrent writes and O_TRUNC
    bb187146c7e5c net/sched: cls_flower: validate mask pointer after nla_next()
    015fffa48e96c ksmbd: zero the FS_OBJECT_ID_INFORMATION buffer before filling it in
    03bb4338c3a7c ksmbd: initialize FileSystemControlFlags in FS_CONTROL_INFORMATION
    ab057f271ef60 ksmbd: fill in FileSysIdentifier in FS_POSIX_INFORMATION
    c962695467d3a net: psp: do not inherit the Rx association on clone
    7afab9846120c net: ntb_netdev: Fix statistics races
    b45e8c24608c9 net: bridge: mcast: don't truncate the port group walk on teardown
    05f7a2f712f8b drm/i915/dmc: Harden DMC firmware payload parsing
    d1d6b859e89dd drm/amdgpu/userq: actually validate userq BOs
    76acfb84973bd drm/amdgpu: correct reservation fence slots for userq per-vm BOs eviction
    d6e08ec2fff45 KVM: x86/mmu: Cope with the SS bit being set in #NPF exit codes
    ad50f41e4f047 drm/amdgpu: Fix VCE 3 ring align_mask
    d5520e815c4b1 ipv4: avoid divide by zero in fib_rebalance
    90c423b62ec9b vsock/vmci: validate packet source for connected sockets
    e9bf92de436ba vsock/virtio: validate packet source for connected sockets
    126a7c227d854 s390/pci: Fix leak of uninitialized kernel data in SCLP report
    cf348ec613f75 s390/pai: Handle multiple PMU stop callback invocations
    8a2f7a4ad1d81 s390/ctcm: Prevent XID null dereference
    dca1b51693c81 page_pool: keep frag_offset aligned for odd-sized requests
    9ac57e4c62e93 sctp: validate chunk length in the inqueue parser
    e1ef306ba20eb selinux: fix BPF token permission checks
    fa8c78c0e49aa tipc: protect node reset trace dump with node lock
    bc48075278e46 workqueue: Annotate cb_lock nesting when draining a dead BH pool
    3c2928f1ed195 workqueue: Use raise_softirq() to trigger softirq in irq_work handler
    3005459e0ddfc io_uring/cancel: don't spin on local work the task can't run
    a1b9b87f45ea6 netlink: specs: add missing mask attributes for conntrack dump
    64a55488a3685 netlink: specs: fix the conntrack filter type
    fca6b33b8a607 xfs: fix zoned write iomap flags assignments
    7809ac0161c7c xfs: fix capability check in xfs
    6353e5cd8c43d xfs: don't hold buffer locks across sync transaction commit in xfs_sync_sb_buf
    fe7393a627db2 net/iucv: fix the recvmsg window update
    a585901bb8cd2 mac802154: fix data race and NULL deref on local->assoc_dev
    74e4ecc08c3d1 dm-integrity: require stable writes for internal hash modes
    251b44b424920 dm-integrity: fix infinite loop on discard with large tag size
    2fe1e2fe3170d dm-ebs: fix incorrect device offset check in ebs_ctr()
    4f16bb982b27b dm-crypt: fix a tiny race condition in crypt_dec_pending
    104f09e02038b dm cache: fix issue with background work locking
    96fb82b38a555 dm cache: fix demotion stats in passthrough mode
    88a51743cd809 cifs: don't update i_size in cifs_do_truncate without a cached handle
    bcd2ba4cc245f cifs: add revalidation on FSCTL failure in smb2_duplicate_extents()
    71154fc2e351f cgroup: fix spurious SIGKILL of CLONE_INTO_CGROUP children
    39aa489e85752 tcp: fix use-after-free in do_tcp_getsockopt(TCP_CC_INFO)
    a8e45471afa23 tcp: fix use-after-free in do_tcp_getsockopt(TCP_CONGESTION)
    8c4f962f368d5 wifi: p54: validate firmware record lengths
    135a0cdac6c96 tracing: Fix ignored return value of resize_buffer_duplicate_size()
    89e90b16aadd6 tracing: Fix hist trigger timestamps for buffered events
    b1547c6ba93b8 tracing: Fix crash in print_graph_function_event()
    7539c61f522ff tracing: Do not initialize tracefs work if tracing is disabled
    75e894f924173 tracing: Check operator stack capacity before pushing
    5f6175281ec22 tracing: Take trace_types_lock when dropping the buffer_meta reference
    68ecc9510bb82 tracing: Keep the predicate limit separate from program capacity
    e0298fcb8555c tracing: Fix the shift out of bounds in the log2 histogram modifier
    2f8b49b415cdc sched_ext: Propagate every bypass depth change to the descendants
    3e6672f0a5a51 sched_ext: idle: Respect task affinity in restricted CPU selection
    633f586329bfd sched_ext: Fix use-after-free of a destroyed user DSQ by a deferred reenqueue
    135e998dd1e66 drm/xe: Don't transfer shrinker pages for pinned bos on purgeable state change
    49e59f9bcc946 drm/xe: Bump LRU for external objects on exec and rebind
    2fbd099b4e7c8 drm/i915/dmc: Add sanity check for DMC load address
    326ceaa896972 drm/i915/cx0_phy: Fix ARL-S host bridge detection
    7a10cd79c4d9a drm/exec: don't immediately add prelocked obj to array of locked objs
    ba76082b1b812 drm/amdgpu: report the BO alignment in bytes in GEM_LIST_HANDLES
    6467c4cc83b94 drm/amdgpu: keep the eviction fence until the last handle is closed
    5d9c2d3e67f1e drm/amdgpu: fix sched entity leak in ttm buffer entity init
    64a6d40156ae9 drm/amdgpu: fix GEM object leak on ENOMEM in userptr ioctl
    253555a9bacce drm/amdgpu: don't drop the runtime PM reference twice in amdgpu_gpr
    42bd6e4538464 drm/amdgpu: destroy mutex when tearing down ttm buffer entity
    123e1d47db26d drm/amdgpu/uvd3.1: Fix checking whether UVD firmware keyselect was already set
    c65ea712a6918 drm/amdgpu/sdma3: Work around POLL_REGMEM / FENCE hang
    1f1750d474643 drm/amd/pm: add zero fan stop temperature support on smu 14.0.2
    4c8b5e5b9776a drm/amd/display: Fix NULL sink dereference in USB4 bandwidth functions
    f721487523d45 scsi: libiscsi: Validate the task named by a management response
    d79343ae3223b scsi: libiscsi: Validate the ITT reflected in a Reject PDU
    35b60549a9562 scsi: libiscsi: Reject a negative task index from parse_pdu_itt
    15791e57f57f7 scsi: xen/scsifront: Check for a NULL shadow entry on a backend response
    18a0e3733ce38 scsi: st: Fix use-after-free race between st_remove() and st_open()
    7a755f6d47b81 scsi: bsg: Pass reply_len to bsg_setup_queue() to fit UFS ARPMB replies
    68e6ab180cfb6 ring-buffer: Fix false warning in ring_buffer_map_get_reader()
    7469b3585ef5f ring-buffer: Fix the sub-buffer array base in rb_meta_subbuf_idx()
    ae670c1a24fb5 ring-buffer: Do not show buffer_meta for CPUs without a buffer
    329e1a230741c perf: Update cgroup time when rotating multiplexed events
    5c9a86256c559 perf: Track the perf mlock gift separately
    47e105bdc863f i2c: xiic: restore non-managed runtime PM to fix clk WARN flood
    1875de656370c i2c: viai2c-wmt: Fix clock leak in wmt_i2c_probe()
    bb39720dbd05a i2c: qcom-cci: Fix HALT_ACK reset request being dropped
    7f9eb6aaf9a3a gpio: shared: gracefully handle no-device lookup of shared GPIOs
    8861491f85015 gpio: shared: fix use-after-free bug when adding shared proxies
    deb336ae7c7b3 tracing/histograms: Reject non-stacktrace fields for synthetic stacktrace fields
    425976fc4886e tools: gpio: fix building from the top level with O=
    8163c6fdd510b tools/power turbostat: Read complete CPU lists
    2777f6637da02 spi: imx: fix slab corruption from undersized DMA bounce buffers
    fd56ac95ec31a sctp: revalidate output stream after association connect wait
    e3318dd73b235 riscv: dts: microchip: beaglev-fire: remove double definition of gpio interrupts
    1d7a731ddb163 power: sequencing: qcom-wcn: power off WLAN at probe
    db531fa89c775 pinctrl: amd: Clear S4 wake bits when firmware has _AEI
    ca14c289ed9ff net: rds: fix uninitialized trans dereference in CM event handler
    2e012e431aa27 net/sched: fix use-after-free in __tcf_action_put()
    5c0757b065fbd mshv_vtl: Check per-CPU register page before mmap
    9b016f25f7178 lib/crypto: poly1305: Use memzero_explicit() in poly1305_final()
    414e60bbca2e3 lib/crypto: arm64: Fix lost Poly1305 carry when resuming NEON state
    2855ddc6844f5 futex: Fix mm reuse handling for FUT_OFF_MMSHARED
    92c9171f95eef namei: test for a negative dentry the way traverse_mounts() does
    bd71d33923b9d namespace: a mount that copy_tree() leaves out can't take over a lock
    7abecef26a9be ntfs3: free the sbi after a grace period
    c0620b648321f ipc: drop the mqueue mount with kern_unmount() on setup failure
    45fcfd5d9c10e eventfs: Free the eventfs_inode after an rcu grace period too
    87d29b8b84973 ext4: free the sbi after a grace period
    7deb577084033 pid_namespace: make zap_pid_ns_processes() freezable
    472589eacdf10 fsnotify: prevent mark additions during connector teardown
    c9716f956216e KVM: nVMX: Reset MMU back to the root MMU if loading L2 state fails for !VM-Entry
    184382f9852d4 KVM: SEV: Fix page dirtying in sev_gmem_post_populate()
    f45ee1ff6358a x86/kvm: Don't consume async #PF flags on a kernel #PF in NMI context
    9e73a6754457f watch_queue: Fix note pool publication race in watch_queue_set_size()
    6560c3d9a6925 unicode: free the map after a grace period
    0fa258819abba bootconfig: give the footer size static_assert a message
    fb296391f685d autofs: ignore notification errors from a replaced pipe
    a761789d657a5 ASoC: SOF: sof-client: Use event-handler mutex consistently
    5e1322787c5e4 ASoC: SOF: ipc4-topology: Fix shift-out-of-bounds for aggregated ALH capture
    7cd3019e8924c afs: free the super info after a grace period
    c137756469d5b accel/rocket: search every core slot when looking up a scheduler
    134451cf95cb6 accel/rocket: search every core slot when a core is removed
    69f9de644f9c7 9p: free the session after a grace period
    a8caee0e623ca firewire: core: fix race condition in split transaction handling
    0efe927053f7e x86/insn-eval: Fix shadowed segment index in get_seg_reg_override_idx()
    581fb47389fc4 PCI: Don't treat ~0 as ready in pci_dev_wait() with RRS SV
    938ff9c0e8586 PCI: Ignore Immediate Readiness on Samsung 990 PRO and 990 EVO Plus NVMe
    792acd173da08 printk: Postpone kthread startup
    f5f0028764de3 perf: Fix perf_pmu_migrate_context() leaving events behind
    cfc707a0a49f4 perf/x86/intel/uncore: Fix DMR CXL CM invert filter
    affc6d5729352 net: stmmac: dwmac1000: clear the RGMII status interrupt
    21596ceb63749 ring-buffer: Use subbuf_order in available memory estimation
    04228a1d47b87 gpio: mxc: fix race between gpiochip registration and IRQ domain setup
    31a797762ca7c gpio: mxc: fix wakeup_pads bit operations
    df6395fe5d4cb gpio: mxc: fix both_edges bit operations
    6c1e035d88157 gpio: mxc: fix race between chained IRQ handler install and probe completion
    890c3bf08e0fc gpiolib: fix memory leak in gpiod_set_array_value_complex() on error paths
    8ee0e03663826 calipso: keep BIG TCP payload_len in calipso_skbuff_setattr()
    7939ad3b4db9e net: bcmgenet: unshare the skb before writing the control block
    e7694aab7ad00 net: ti: icssm-prueth: Move setting of netops to fix crash
    5293e376e9d6c net: ethernet: aeroflex: move setting of netops to fix crash
    c51b13299b4d4 net: ethoc: move setting of netops to fix crash
    cfc11024fc061 net: au1000: move setting of netops to fix crash
    bfb1ca89e9f6e net: mv643xx: move setting of netops to fix crash
    d2eca3a54f415 net: ethernet: actions: Move setting of netops to fix crash
    1c2f9c3a63baa net: hisilicon: hip04_eth: Move setting of netops to fix crash
    06ef5b084b150 net: hisilicon: hisi_femac: Move setting of netops to fix crash
    078deff25f8a8 netlink: avoid hashing the network namespace pointer
    08b95ef36a64c scsi: libsas: Fix SMP IO deadlock during HA resume
    dc6c7cf2090a3 tracing: probes: error if BTF is required but unavailable
    ef398f6715f41 ring-buffer: Skip si_mem_available() for persistent and remote buffers
    17c424d9d28de tracing: Fix simple_ring_buffer undef check on sparc64
    9f533ae516089 tracing: Fix simple_ring_buffer undef check on parisc
    75a6278ddb38e tracing: Fix empty symbol names in simple_ring_buffer undef check
    2259809e5b704 pipe: preserve existing fasync readers on writer setup failure
    3d3a7390e24ce exit: fix lost-update race on the child_subreaper bitfields
    460dbf8495212 samples: pidfd: fix userprogs typo
    2bc426a32bfb7 ocfs2/dlm: Protect the recovery list during debugfs reads
    eabb519d45fc8 drm/panthor: fix immortalis condition
    7cadb8d82ee43 iommupt/kunit: Use if_changed_rule for the kunit
    2557eb2d8bfd0 entry: Account the deferred hrtimer rearm as hardirq context for lockdep
    ae89744c5ebf2 sched/core: Call wakeup_preempt() for queued tasks during class change
    6caa2b3edb7da scsi: target: iscsi: Fix race in discovery auth updates
    7563650522732 scsi: target: Disable interrupts while holding delayed_cmd_lock
    67defb87a0a6c scsi: st: Save the visited block for the partition the drive is in
    c01068a1944be nios2: fix __wsum type degradation in csum_fold()
    c6ab64c4786a0 spi: tegra114: assert CS GPIO for every transfer in a message
    cd3e2918c247d drm/xe/oa: Zero OA buffer at allocation
    b6499d19ade1f drm/xe: skip eviction of a BO with no resource
    e01b5d143e241 ASoC: amd: yc: disable MSI on resume
    b993de8eb8931 net/mlx5: HWS, fix flow meter offset within its bulk
    374b28a462392 net/mlx5: HWS, release L2 to L3 tunnel reformats to their own pool
    dd47a6c920083 accel/rocket: clear rdev on device init failure
    06935da5de83a netlink: reset skb headers before unicast and multicast filtering
    a87481103d4f0 regmap: Drop map lock during cache init and exit
    f98e96f937a82 ASoC: nau8822: Fix the 128x oversampling switch bits
    26beeefbce5d0 ASoC: wm8978: Fix the 128x oversampling switch bits
    40cc9bf395c83 ASoC: max98371: Fix the Speaker DHT Min Volume bits
    f31f55e4823bf ASoC: pcm3168a: Fix the DAC zero flag polarity bit
    784a5b8b91b5d ASoC: cs42l52: Fix the NG Type Switch bit
    565a1a2f50dee ASoC: cs42l56: Put the Limiter Cushion control on the limiter register
    5764664840732 ASoC: stm32: spdifrx: fix synchronization state check
    f92aa855f017b ASoC: Intel: avs: Reset the stream unless it is already prepared
    20de4c4393643 accel/amdxdna: Fix Kconfig invalid configuration
    91ece3efa064f net/rds: don't let the rdma_cm destroy an id RDS still owns on route failure
    44d1ca05d6094 vsock: treat TCP_CLOSING as once-established
    ac9132f3c0f26 gpio: nct6694: Mark the GPIO controller as sleeping
    6a987992c78e2 drm/vc4: hdmi: Move packet RAM enable to PM runtime
    4f2321b30670c pinctrl: sunxi: dt: do not accumulate npins across probe attempts
    21ddf976f204e pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12
    45388e50d14bc power: supply: core: prevent unregistering a power supply while a callback runs
    57ff289505fb0 power: supply: generic-adc-battery: Fix temperature IIO channel conversion
    74784f1ead355 tools/power turbostat: Fix add_counter issue if > 24 counters.
    429bcb67630dc tools/power turbostat: Fix PMT error path fd handling
    0bea622befdf1 tools/power turbostat: Fix CWF PMT off-by-one
    3513b9d7cc35a tools/power turbostat: Fix fd_perf leak on reset
    35f1cce2ff382 tools/power turbostat: Warn, but don't Err on out-dated perf systems
    c8b8326aa5477 pinctrl: qcom: spmi-gpio: make direction changes exclusive
    096e20372476c pinctrl: qcom: ipq5018: add missing pwm3 function on gpio13
    51f935a7e9284 ARM: configs: sama5: enable current Microchip KSZ DSA symbols
    6b662f6e6a562 pinctrl: qcom: qcs8300: Fix intr_target_width
    a723b4dd99f48 pinctrl: qcom: hawi: Fix intr_target_width
    d68d5e430b311 pinctrl: qcom: nord: fix GPIO interrupt target width
    3195546a377c2 Drivers: hv: Don't reset VMBus connection state on error/exit paths
    bc8ca0f476962 x86/hyperv: Avoid using per-cpu output page in hv_apicid_to_vp_index()
    95fec47cdbf74 Drivers: hv: Avoid infinite retry loop in init_vp_index()
    43bc7d5707bbb soc/tegra: pmc: Fix uninitialised clock rate
    a6f95263d9f33 power: supply: ds2780: Fix ds2780_get_capacity() returning raw value
    f93a54e83e3f1 power: supply: Fix maintenance charge table kernel-doc
    cea6e3e7a9903 ARM: dts: ti/omap: dra7: fix PCIe PHY clock divider definition
    44f272f6cba06 soc/tegra: fuse: Add missing newline to APBMISC error message
    2bd56a2de8312 i2c: qcom-geni: Restore the source-clock selection policy
    d41b9735881a3 ksmbd: exempt FSCTL_PIPE_TRANSCEIVE from the generic file-id lookup
    cc9de5d4b5ab6 Linux 7.2.12
    e792a9ace39d2 KVM: x86: Use active memslots for the per-vCPU MMIO cache
    4722d06b29075 ksmbd: fix heap out-of-bounds write in krb5_authenticate()
    7ce5d94246de8 ASoC: cs35l56: Add DAI for SDCA OT25 stream
    40c9216390eb0 wifi: atk9k: Revert "wifi: ath9k: reject short WMI command responses"
    e2e2fc0663b38 net: mana: reserve RX buffer headroom to fix forwarding performance
    5c380dfecbf9d net: mana: refactor mana_get_strings() and mana_get_sset_count() to use switch
    6d30b399ae28e readdir: take no inode lock on an immutable directory
    e58253e87d0a9 nullfs: refuse file locks
    173ff9d03ec63 sched_ext: Fix CPU hotplug hang when a dying CPU's tasks sit in the BPF scheduler
    e9ec5cbbaf4dd dm-integrity: validate the superblock on resume
    69ed43ed8a174 dm-integrity: fix NULL pointer dereference when the 'R' flag is used
    8e42aeb5b39f7 nfsd: fix all-zero stateid in CB_OFFLOAD for async COPY

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend
index fb46379..4584b4b 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v7.2/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "e4323ef8c241ed533d213f156a340083a8cdb92d"
+SRCREV_machine:genericarm64 ?= "278328a7e4f0b7d4ccaea67b55951e8b7551d166"
-- 
2.43.0

