Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29813.1793868235186819877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=CbtShsIg;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c45111bebso765856f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868233; x=1794473033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=twWFDxrvfh4z9M8lYteLYYmq8MqqUIWO9tSrEDAaxco=;
        b=CbtShsIgpzDdzOegtBnqUic3DJtLlfyNl4IVF/Dmh4niunLqDFskHnv+hMt5ZKRXLb
         8KigBu6JchQ8gTjrdYlxoHEoTRQzReC4T0uThCUXBqCnqQ8UAuulr8NqaEzCoMKqarqA
         Z0T2WRM7DPnWTrz9lCPRifkrkQMx/24+JAD97vsE31ptou5PszmRtyhpBTJJZNlmTsnN
         kajdL+gyc0nPwEopOzs6za3V1j+iYPj7oEJ7bfcgKD2hM5I9BbpLE10eM2kAle98Ylhq
         R7+Rvnq2Xa3L7Bq/Nil4Ko+zvETM6ClvlKv79hQEbpwMuvy5oGNA+QQO9UneTtogGepF
         dYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868233; x=1794473033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=twWFDxrvfh4z9M8lYteLYYmq8MqqUIWO9tSrEDAaxco=;
        b=gsvx6yxm+tetOxXRqFwxet2hOVkKeJgQNltSeuJ3yvWbVGOX6YCkrOlybByiccY9Gv
         J7319jOFIyXLVB8HpBrF0GAFn1KU1VOweyw0SkWgX9q4PwN96+zqe0GWPeOsS6qcUkeb
         vA2OYIHvN+lGPrH1mr0hE0I2z8yqgALSqeFCVv6/hHoBIytGjlCZpeujYLsbUaAeCcY5
         l2w7CATaJgDQttWWLCjndOjI2vGY7VR4o3YoRtr1xl9kbhtsR/mMrXrdU5rcREYbY0jo
         F19bB5aEaif0H6JcFaAXGtO+I5WxxlP6QklWKjZ21vyHYvlgvA+507/f3eBjekMAOVsH
         JMJQ==
X-Gm-Message-State: APuU4Z9RAfJGxNKYVxJC1HqvZXoTsJkNNgPm8o7gTlvRNH6+FmqZvCF0
	9q8DSUMcLW7YFKhhtXrSJXkYlL6jS9YrY/oKLOMgvZkR35noPGQ2/kL/cqbpmfjLXMNl6jIkwdH
	ddJ6mx/A=
X-Gm-Gg: AYBFou3In49WPhusZ5au9XO1y3e0h35ms90VeRyoG2OhJ0qkj/xrJxnUQoRwbJirNw9
	0uUNIOvWa1G7ucjmG9WxtzH9mmScvDDn0XfdwW2DTSOIuRUeaW8xwZGQaFxdR27R47V/quWW/1V
	qA/BFzRmiF0ybvWGXFm9bmYQGt8whgRq5to9DcIXNTGJsEQ5CI7RixHRKipC6rb2S+jOglJlHeY
	OwqI6Qmu1B624HC9rLLgKHFV+iOoX7SNGjcl5VkLeqzba8rEFLDDfDoWJO9ofJBHG4hhHkPdFQQ
	xtsbL1mSKA+RIucYn1x8jdlbSl4Mm9RwfIwEJBWebQkjX+FNGIzfhsydSaQhgzhza9KvJyR0J04
	qnLegePxm5Ss2rSZM8aExEqvRNYKq3aObpPpGHGWnaPXVoZPZNFbYFn81NWeiyQjzaYnTOHIy9L
	RCdXKk46mjOnsHi0WzZiRQswcE83n/3sw9QyDEUqWFizulTcuqTUlhu87u0aXIU2Y3JrwNnI5H7
	PputcVRnvUfJCDT1pZAOMNFKD3C3cpIUquoH/6coX0ErdymOaWIoIgoB2fy8YpXKR4hQqbk9kDB
	B7aaVlvjbdSwFNBIG1f8Y3iukn44BV1x1ROHIrxfiIbEAY/PLXyQFz4qpmaFgLyNw9016ObpvIc
	L0wtE6t9nDMx0DY5Ag9mz1grAf+HYhg==
X-Received: by 2002:a05:6000:4a0f:b0:490:6327:96ba with SMTP id ffacd0b85a97d-4906327988dmr6053002f8f.47.1793868233005;
        Thu, 05 Nov 2026 00:43:53 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:52 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 27/60] linux-yocto/6.18: update to v6.18.59
Date: Thu,  5 Nov 2026 09:42:46 +0100
Message-ID: <10f51c4144fe84e4f3bca8af0f182a70ca219ac2.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249485
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    1253a6aa5d104 Linux 6.18.59
    9a5d65b06dc33 smb: client: drain outstanding I/O before truncating on O_TRUNC open
    a4c584ea79d95 ice: fix crash in ethtool offline loopback test
    9f158a9b10e1e ice: fix broken Rx on VFs
    f4a25618c3683 ice: switch to Page Pool
    0026267561bc6 ice: drop page splitting and recycling
    c8bd04221f6a8 ice: remove legacy Rx and construct SKB
    4d143608a0445 smb: client: fix data corruption with concurrent writes and O_TRUNC
    c027f8b429dbb vsock/vmci: validate packet source for connected sockets
    ecd7ead4bf05e ipv4: udp: Create exceptions before socket matching
    6cd829de69efd vsock/virtio: validate packet source for connected sockets
    569c34a35fbc9 virtio: set skb owner of virtio_transport_reset_no_sock() reply
    f320b85c90fe5 workqueue: Fix unbound pool lifetime for pending pwqs
    299912bbc6455 workqueue: release pwq pools by pool type
    94d13387b96e5 io_uring/cancel: don't spin on local work the task can't run
    7123c79206e49 io_uring/cancel: move cancelation code from io_uring.c to cancel.c
    76cb14d6f1433 io_uring/cancel: move __io_uring_cancel() into cancel.c
    755e88e78beaf io_uring/cancel: move request/task cancelation logic into cancel.c
    de477667b890b cifs: add revalidation on FSCTL failure in smb2_duplicate_extents()
    242c7b3a71ddf smb/client: refresh allocation size after duplicate extents
    8d891c218016b sched_ext: Fix stall when a task enqueued with SCX_ENQ_LAST lands back on its CPU's local DSQ
    6ac46ae5ac561 drm/amdgpu: free the userptr ranges when a CS fails after parser_bos
    2058a1fe791bb tracing: Keep the predicate limit separate from program capacity
    07180a910e9d0 tracing: Fix ignored return value of resize_buffer_duplicate_size()
    a425e1c687595 sched_ext: idle: Respect task affinity in restricted CPU selection
    dfcfe2874e7c1 drm/i915/dmc: Harden DMC firmware payload parsing
    c8b1a48404679 ntfs3: free the sbi after a grace period
    d977b979081ef fs/ntfs3: fix ntfs_mount_options leak in ntfs_fill_super()
    129b0a64fe9ac ntfs3: fix double free of sbi->options->nls and clarify ownership of fc->fs_private
    e0ab437276575 ntfs3: fix use-after-free of sbi->options in cmp_fnames
    a1647b653549f scsi: st: Fix use-after-free race between st_remove() and st_open()
    d2f591e6c7304 smb: client: fix multiuser mount with krb5
    d96f3365ce61c smb: client: fix heap overflow in cifs_do_set_acl()
    45e60747a9db2 net/sched: cls_flower: validate mask pointer after nla_next()
    898cb4f2e12a5 ksmbd: zero the FS_OBJECT_ID_INFORMATION buffer before filling it in
    d8c450ad0d089 ksmbd: initialize FileSystemControlFlags in FS_CONTROL_INFORMATION
    beba2ef6f66a7 ksmbd: fill in FileSysIdentifier in FS_POSIX_INFORMATION
    a9f14ea73e82d net: psp: do not inherit the Rx association on clone
    8243d587a081e net: bridge: mcast: don't truncate the port group walk on teardown
    80d5db1686b05 ext4: free the sbi after a grace period
    cad63a7798d6a ASoC: SOF: ipc4-topology: Fix shift-out-of-bounds for aggregated ALH capture
    c17cc2027773e futex: Fix mm reuse handling for FUT_OFF_MMSHARED
    dce8f7f03a47b drm/amdgpu: keep the eviction fence until the last handle is closed
    0caeefed99b37 KVM: x86/mmu: Cope with the SS bit being set in #NPF exit codes
    7786dde1b5001 KVM: x86/mmu: Preserve nested TDP shadow page tables if they are used as roots
    dc29c0478b856 netfilter: nft_byteorder: remove multi-register support
    61f376654fb9d drm/amdgpu: Fix VCE 3 ring align_mask
    d49fa454c2869 KVM: SVM: Stop toggling virtual VMSAVE/VMLOAD on intercept recalc
    5dac5c7ba8f5f ipv4: avoid divide by zero in fib_rebalance
    ba5001db9bb23 s390/pci: Fix leak of uninitialized kernel data in SCLP report
    34fa3607b7604 s390/ctcm: Prevent XID null dereference
    813a72beaa5d3 page_pool: keep frag_offset aligned for odd-sized requests
    40507f59f230d sctp: validate chunk length in the inqueue parser
    b8b7d28dc2b74 tipc: protect node reset trace dump with node lock
    f7e82f72b90ce workqueue: Annotate cb_lock nesting when draining a dead BH pool
    6b26b3d39904c workqueue: Use raise_softirq() to trigger softirq in irq_work handler
    b6a0e5faf0dca netlink: specs: add missing mask attributes for conntrack dump
    62ed32a1d4499 netlink: specs: fix the conntrack filter type
    e20e6b14e3b5c xfs: fix zoned write iomap flags assignments
    19a1a22029ad3 xfs: fix capability check in xfs
    e5456dec79c71 xfs: don't hold buffer locks across sync transaction commit in xfs_sync_sb_buf
    8f2efa742f4cf net/iucv: fix the recvmsg window update
    3cdd8b1abddeb mac802154: fix data race and NULL deref on local->assoc_dev
    c8922e7afb058 dm-integrity: require stable writes for internal hash modes
    fc512700f1413 dm-integrity: fix infinite loop on discard with large tag size
    40791f07bad61 dm-ebs: fix incorrect device offset check in ebs_ctr()
    ac5d887ab9359 dm-crypt: fix a tiny race condition in crypt_dec_pending
    73df2ff409f3d dm cache: fix issue with background work locking
    de9e8e587c07b dm cache: fix demotion stats in passthrough mode
    04d020b3d0b58 cifs: don't update i_size in cifs_do_truncate without a cached handle
    2f9dd8214d421 cgroup: fix spurious SIGKILL of CLONE_INTO_CGROUP children
    86814e5370068 tcp: fix use-after-free in do_tcp_getsockopt(TCP_CC_INFO)
    c1804ef016392 tcp: fix use-after-free in do_tcp_getsockopt(TCP_CONGESTION)
    f641066b0ddcd wifi: p54: validate firmware record lengths
    09c7cce2e59e6 tracing: Fix hist trigger timestamps for buffered events
    813e18881c647 tracing: Do not initialize tracefs work if tracing is disabled
    a866a8a753922 tracing: Check operator stack capacity before pushing
    7c0c6d88a232a tracing: Take trace_types_lock when dropping the buffer_meta reference
    c4918c28b1baf tracing: Fix the shift out of bounds in the log2 histogram modifier
    3a3c4503ba1b4 drm/xe: Bump LRU for external objects on exec and rebind
    ef82b4d5cb4a3 drm/i915/dmc: Add sanity check for DMC load address
    22fd3f760845f drm/i915/cx0_phy: Fix ARL-S host bridge detection
    96d9996e5dbcf drm/exec: don't immediately add prelocked obj to array of locked objs
    07002a326c7cc drm/amdgpu: report the BO alignment in bytes in GEM_LIST_HANDLES
    652b1f26125fe drm/amdgpu: don't drop the runtime PM reference twice in amdgpu_gpr
    05507b9b19f95 drm/amdgpu/sdma3: Work around POLL_REGMEM / FENCE hang
    6cfc4a25d4f02 drm/amd/pm: add zero fan stop temperature support on smu 14.0.2
    55a65ef61e277 scsi: libiscsi: Validate the task named by a management response
    7215a69b6456f scsi: libiscsi: Validate the ITT reflected in a Reject PDU
    6cadfa6f1f589 scsi: libiscsi: Reject a negative task index from parse_pdu_itt
    1d91ec793d6c8 scsi: xen/scsifront: Check for a NULL shadow entry on a backend response
    2effbe746452c scsi: bsg: Pass reply_len to bsg_setup_queue() to fit UFS ARPMB replies
    029770f5baded ring-buffer: Fix false warning in ring_buffer_map_get_reader()
    2f1248b728b56 ring-buffer: Fix the sub-buffer array base in rb_meta_subbuf_idx()
    8512d0312cc0e ring-buffer: Do not show buffer_meta for CPUs without a buffer
    29469305a9390 perf: Update cgroup time when rotating multiplexed events
    b67fb3955b07d perf: Track the perf mlock gift separately
    5d476bb76b7d7 i2c: viai2c-wmt: Fix clock leak in wmt_i2c_probe()
    d2cb4d7451491 i2c: qcom-cci: Fix HALT_ACK reset request being dropped
    1f36e4ddd05d5 tracing/histograms: Reject non-stacktrace fields for synthetic stacktrace fields
    13735c2cf4849 tools: gpio: fix building from the top level with O=
    77a63d1b813b0 sctp: revalidate output stream after association connect wait
    6232e93c3036c pinctrl: amd: Clear S4 wake bits when firmware has _AEI
    5f23e4e3a31da net: rds: fix uninitialized trans dereference in CM event handler
    2465d27ef90de net/sched: fix use-after-free in __tcf_action_put()
    568323cddd54f lib/crypto: poly1305: Use memzero_explicit() in poly1305_final()
    ae6584eaaa4f1 lib/crypto: arm64: Fix lost Poly1305 carry when resuming NEON state
    492c10662177f namei: test for a negative dentry the way traverse_mounts() does
    4586ef24ce390 eventfs: Free the eventfs_inode after an rcu grace period too
    2e10b8a74f55b pid_namespace: make zap_pid_ns_processes() freezable
    952501bfc6e5e fsnotify: prevent mark additions during connector teardown
    d00d5f534a823 KVM: nVMX: Reset MMU back to the root MMU if loading L2 state fails for !VM-Entry
    b77e9622bbade x86/kvm: Don't consume async #PF flags on a kernel #PF in NMI context
    811fb6d0b0760 watch_queue: Fix note pool publication race in watch_queue_set_size()
    2b54d3c971a1e unicode: free the map after a grace period
    d518fc5cced10 bootconfig: give the footer size static_assert a message
    1a177064f501e autofs: ignore notification errors from a replaced pipe
    debb0f36bfe3d afs: free the super info after a grace period
    5078c91f5c84b accel/rocket: search every core slot when a core is removed
    7249a442ab261 PCI: Don't treat ~0 as ready in pci_dev_wait() with RRS SV
    7595bacee48bc printk: Postpone kthread startup
    3eb08f09bfb36 perf: Fix perf_pmu_migrate_context() leaving events behind
    d0ffb0dc01166 gpio: mxc: fix race between gpiochip registration and IRQ domain setup
    238f93bd1d063 gpio: mxc: fix wakeup_pads bit operations
    dab5c228a8468 gpio: mxc: use BIT() macro
    911f606dd05d7 gpio: mxc: fix both_edges bit operations
    261802c14e1a3 gpio: mxc: fix race between chained IRQ handler install and probe completion
    78189c0e35abb gpiolib: fix memory leak in gpiod_set_array_value_complex() on error paths
    1c9fcfca51e3c calipso: keep BIG TCP payload_len in calipso_skbuff_setattr()
    e221a7d6f7c91 net/ipv6: Introduce payload_len helpers
    40c04abcbc34e net: bcmgenet: unshare the skb before writing the control block
    bdd55b8a8acbf netlink: avoid hashing the network namespace pointer
    c9fb89246d992 scsi: libsas: Fix SMP IO deadlock during HA resume
    fbb5a6f0b06fb tracing: probes: error if BTF is required but unavailable
    4c42ce499ce4b pipe: preserve existing fasync readers on writer setup failure
    7780f9e828da0 samples: pidfd: fix userprogs typo
    04d4571c00db6 ocfs2/dlm: Protect the recovery list during debugfs reads
    de3923caf0772 drm/panthor: fix immortalis condition
    9b07828b133b3 scsi: target: iscsi: Fix race in discovery auth updates
    71e12d43ef37e scsi: st: Save the visited block for the partition the drive is in
    e3bf250a2fda6 nios2: fix __wsum type degradation in csum_fold()
    e4d45c651d19f spi: tegra114: assert CS GPIO for every transfer in a message
    21f41b6daf0db drm/xe/oa: Zero OA buffer at allocation
    6046bb9cb2859 drm/xe: skip eviction of a BO with no resource
    8d15821aa2de1 ASoC: amd: yc: disable MSI on resume
    efe1393e783f2 net/mlx5: HWS, fix flow meter offset within its bulk
    a3516f0704b96 net/mlx5: HWS, release L2 to L3 tunnel reformats to their own pool
    79071b67182e1 accel/rocket: clear rdev on device init failure
    06791594274f8 netlink: reset skb headers before unicast and multicast filtering
    4a9fb8122a19d regmap: Drop map lock during cache init and exit
    bae057687f615 regcache: Do not overwrite error code when finalizing cache after error
    b498b70a8174b regcache: Add ->populate() callback to separate from ->init()
    0a9a172d4cbfc ASoC: nau8822: Fix the 128x oversampling switch bits
    9a87917b8f3d5 ASoC: wm8978: Fix the 128x oversampling switch bits
    9b1a72628f125 ASoC: max98371: Fix the Speaker DHT Min Volume bits
    384e00dd8908b ASoC: pcm3168a: Fix the DAC zero flag polarity bit
    db3a7a70cc214 ASoC: cs42l52: Fix the NG Type Switch bit
    856ecf3c600af ASoC: cs42l56: Put the Limiter Cushion control on the limiter register
    4528f8d38d893 ASoC: stm32: spdifrx: fix synchronization state check
    d3239b8f4fc46 ASoC: Intel: avs: Reset the stream unless it is already prepared
    a7c7d0ff87637 net/rds: don't let the rdma_cm destroy an id RDS still owns on route failure
    c2c5359ef2c33 vsock: treat TCP_CLOSING as once-established
    fb5fb74fb4fff gpio: nct6694: Mark the GPIO controller as sleeping
    6b03e354526f6 drm/vc4: hdmi: Move packet RAM enable to PM runtime
    47b725c17dcb2 pinctrl: sunxi: dt: do not accumulate npins across probe attempts
    9d0508bcf6743 pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12
    2ac0256a28e15 power: supply: core: prevent unregistering a power supply while a callback runs
    dda0df37aabd8 power: supply: generic-adc-battery: Fix temperature IIO channel conversion
    06e3e6dc2688f tools/power turbostat: Fix add_counter issue if > 24 counters.
    f573d257aad5a tools/power turbostat: Fix PMT error path fd handling
    b2af180dbc5f5 tools/power turbostat: Fix CWF PMT off-by-one
    e2c86984ccc0b tools/power turbostat: Fix fd_perf leak on reset
    e76e6284de2ba pinctrl: qcom: ipq5018: add missing pwm3 function on gpio13
    54e54a690bf13 pinctrl: qcom: qcs8300: Fix intr_target_width
    f47ce27af80b8 Drivers: hv: Don't reset VMBus connection state on error/exit paths
    2b561786c9076 x86/hyperv: Avoid using per-cpu output page in hv_apicid_to_vp_index()
    7141331f2d245 Drivers: hv: Avoid infinite retry loop in init_vp_index()
    c3e5854b2e8b6 power: supply: ds2780: Fix ds2780_get_capacity() returning raw value
    7de3a5a49410a power: supply: Fix maintenance charge table kernel-doc
    ea9c08c33d57c ARM: dts: ti/omap: dra7: fix PCIe PHY clock divider definition
    0992d03e55e5a soc/tegra: fuse: Add missing newline to APBMISC error message
    07fa8baa78d64 kho: free phys_bits bitmaps using free_page() in __kho_abort()
    96d2abaa2e328 i2c: qcom-geni: Restore the source-clock selection policy
    cd3c05651d04b rose: purge rose_neigh->queue on final teardown
    6b450cf6dd419 ax25: bound REJ-driven fast retransmits with the existing N2 counter
    c7bdc88b27cc6 ALSA: ctxfi: Use correct DAIO type for da_desc
    fb5e2dd6565a9 ALSA: ctxfi: Rename SPDIFI1 to SPDIFI_BAY
    7fca3600e79e9 ALSA: ctxfi: Don't enumerate SPDIF1 at DAIO initialization
    b48ebe399b4e7 drm/ttm: fix swapped-out resources never leaving their bulk_move range
    2926d88bb7fc4 Linux 6.18.58
    2566780c684c9 KVM: x86: Use active memslots for the per-vCPU MMIO cache
    517404e157395 ksmbd: fix heap out-of-bounds write in krb5_authenticate()
    88c7c3aa8d0ff wifi: atk9k: Revert "wifi: ath9k: reject short WMI command responses"
    5c0940abe76c9 bpf, sockmap: Account for receive queue in FIONREAD without a verdict program
    8b7748e9904f8 kho: free chunks using free_page() instead of kfree()
    a6d84b420a848 io_uring/kbuf: don't charge provided buffer rings to RLIMIT_MEMLOCK
    e46794d1936ca io_uring: do not charge the SQ/CQ rings to RLIMIT_MEMLOCK
    314b72d5e8273 rose: hold a reference on incoming sockets queued for accept()
    30ec3025b7715 USB: iowarrior: fix use-after-free on disconnect race
    e8ed9a1dfc74f usb: iowarrior: remove inherent race with minor number
    c24d2e190b955 selinux: allow multiple opens of /sys/fs/selinux/policy
    93a7f297362de mm/damon/core: fix damos_walk() vs kdamond_fn() exit race
    7e54ed8a780c8 mm/damon/core: cancel damos_walk() before damon_ctx->kdamond reset
    7ea3850b9ce00 xfs: close crash window in attr dabtree inactivation
    4b963fddf470f xfs: factor out xfs_attr3_leaf_init
    50144efd23ad9 xfs: factor out xfs_attr3_node_entry_remove
    0f39d936a3493 ima: Fix stack-out-of-bounds in is_bprm_creds_for_exec()
    265ca3f6524be ima: Access decompressed kernel module to verify appended signature
    7d6fd50746482 fat: stop reading directory entries past the end-of-directory marker
    f6c1e709a4f91 cifs: fix time_last_write stamp placement in setattr/truncate paths
    2efa187fd4c9b drm/xe/i2c: cancel the client work on remove
    97e736000731f scsi: ufs: core: Avoid unsafe MMIO reads in ufshcd_mcq_compl_all_cqes_lock()
    ee01d48f0f086 scsi: ufs: core: Add a comment block above ufshcd_mcq_compl_all_cqes_lock()
    e36bac5923a3b scsi: ufs: core: Add debug log for MCQ command timeout
    d12c834b97c36 scsi: ufs: core: Move an assignment in ufshcd_mcq_process_cqe()
    a34a230ccea1b scsi: ch: Do not keep references to data transfer element devices
    8176ec7e36987 scsi: ufs: core: Decouple CQ sweep from request iterator in MCQ
    9e8fc7972b398 riscv: patch: fix handling of bpf-jit execmem addresses
    420bf39a22a73 riscv: patch: Avoid early phys_to_page()
    08275dcfbfc3b net: mana: reserve RX buffer headroom to fix forwarding performance
    eececf7c3a679 net: xilinx: axienet: Free outstanding DMA buffers on dmaengine stop
    cc7732b8549ec Bluetooth: RFCOMM: connect the session socket without rfcomm_mutex
    638ee6bca1975 sched_ext: Fix CPU hotplug hang when a dying CPU's tasks sit in the BPF scheduler
    454b67fcc28c1 dm-integrity: validate the superblock on resume
    2e25842f0e442 dm-integrity: fix NULL pointer dereference when the 'R' flag is used
    0c9d4f9c66ca7 wifi: mt76: connac: tolerate inactive BSS deactivation
    22732b0f290ac nfsd: fix all-zero stateid in CB_OFFLOAD for async COPY
    0c5595cba7224 mm/mremap: fix locked_vm leak from MREMAP_DONTUNMAP self-merge
    5720bf6b91295 mm/mremap: fix locked_vm leak by splitting VMA for MREMAP_DONTUNMAP
    fdf4f011c6004 iavf: send MAC change request synchronously
    5aa9efb559174 iavf: iavf_virtchnl_completion: drop duplicate ether_addr_equal() test
    b030fde644501 drm/amd: Create a device link between APU display and XHCI devices
    2d06cb25a497d ip6_gre: remove obsolete ERSPAN PMTU update
    903a2ab8325a2 PCI: dwc: Return -EIO from dw_pcie_wait_for_link() if device is not active
    adc0d81b4d415 PCI: dwc: Return -ENODEV from dw_pcie_wait_for_link() if device is not found
    e32aa1d85126e RDMA/erdma: Use IRQ-safe XArray helpers for QP and CQ tables
    3c03f6f7c6f2d usb: gadget: f_hid: Add missing error code
    7820bca8cb207 spi: mpc52xx: clean up interrupt handling

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5d1656b394fb5c06269ff9251e1dd0b4a93b7821)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 9690d312b8b..cf6ed368c53 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f87ce4ad0a7f6290a8fd961a63fd1653c7308a14"
-SRCREV_meta ?= "5978c5f530b91cfb62213506ee6f157897432ba3"
+SRCREV_machine ?= "582762f4ac66e79c16b088b3fbb5a67a57a15d88"
+SRCREV_meta ?= "cf1eb35154969907fb08e980fe6d1881c97d6a97"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.57"
+LINUX_VERSION ?= "6.18.59"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 939ca9c5b83..d117eb8a205 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.57"
+LINUX_VERSION ?= "6.18.59"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "cbba43337e083c0ace9a6cf998850eb1d3f4a0b0"
-SRCREV_meta ?= "5978c5f530b91cfb62213506ee6f157897432ba3"
+SRCREV_machine ?= "0aa9c16e54e9a318d97bae25e0082d7807186232"
+SRCREV_meta ?= "cf1eb35154969907fb08e980fe6d1881c97d6a97"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index ce4878d0f27..f579bacf7ac 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "3881e81dea81f6aea84ea28b22899708f3fef903"
-SRCREV_machine:qemuarm64 ?= "cbba43337e083c0ace9a6cf998850eb1d3f4a0b0"
-SRCREV_machine:qemuloongarch64 ?= "cbba43337e083c0ace9a6cf998850eb1d3f4a0b0"
+SRCREV_machine:qemuarm ?= "5d45ccb59e84ed3f8071c55eeba225af3d8ff987"
+SRCREV_machine:qemuarm64 ?= "0aa9c16e54e9a318d97bae25e0082d7807186232"
+SRCREV_machine:qemuloongarch64 ?= "0aa9c16e54e9a318d97bae25e0082d7807186232"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "cbba43337e083c0ace9a6cf998850eb1d3f4a0b0"
-SRCREV_machine:qemuriscv64 ?= "cbba43337e083c0ace9a6cf998850eb1d3f4a0b0"
-SRCREV_machine:qemuriscv32 ?= "cbba43337e083c0ace9a6cf998850eb1d3f4a0b0"
-SRCREV_machine:qemux86 ?= "cbba43337e083c0ace9a6cf998850eb1d3f4a0b0"
-SRCREV_machine:qemux86-64 ?= "cbba43337e083c0ace9a6cf998850eb1d3f4a0b0"
+SRCREV_machine:qemuppc ?= "0aa9c16e54e9a318d97bae25e0082d7807186232"
+SRCREV_machine:qemuriscv64 ?= "0aa9c16e54e9a318d97bae25e0082d7807186232"
+SRCREV_machine:qemuriscv32 ?= "0aa9c16e54e9a318d97bae25e0082d7807186232"
+SRCREV_machine:qemux86 ?= "0aa9c16e54e9a318d97bae25e0082d7807186232"
+SRCREV_machine:qemux86-64 ?= "0aa9c16e54e9a318d97bae25e0082d7807186232"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "cbba43337e083c0ace9a6cf998850eb1d3f4a0b0"
-SRCREV_meta ?= "5978c5f530b91cfb62213506ee6f157897432ba3"
+SRCREV_machine ?= "0aa9c16e54e9a318d97bae25e0082d7807186232"
+SRCREV_meta ?= "cf1eb35154969907fb08e980fe6d1881c97d6a97"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "2ff600d29ee478d0a8d46ef8a58afb5e038fe692"
+SRCREV_machine:class-devupstream ?= "1253a6aa5d104312bf0992afacc15220ae35bdf9"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.57"
+LINUX_VERSION ?= "6.18.59"
 
 PV = "${LINUX_VERSION}+git"
 
