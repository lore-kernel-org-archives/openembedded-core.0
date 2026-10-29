Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4566.1793245510043105161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 20:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qsA4mrRb;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53394bffe0fso3315481cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 20:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793245509; x=1793850309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7l1j5rr7A4ch0y9Ofg+8zcnVm1Y1bFL36IVd2G2/rts=;
        b=qsA4mrRbRdE7fqeEFkPpiD8VhpSK6VI6ZUyyF2ZWvSb0+Z0laYlWQRWZe3oiedoFtW
         AXZKky+tLV5bLgDUlpDcBp7GYlZDyms9Jno6+qweRmGt1NJvYmcT/UEGtLYA4WRzL2hq
         mYrudf9iTc6dzH/Yrfjt2pW0vV81uLLwbyvNOHxsiw3+dVCfNLSFBj1MsNodN+lRiikL
         dFx5cX5osEEFq1LlhkmnopXArim1YNLo9dUiQSuKdWMqfRuPSlaNYQ1tsOGYUDbQdUzk
         Buad+aVcF3maPix2nVXeedvc0KZWqV+Bc969XOzhH86XN4ZYKxDkPfDhiNSVucfbCF7k
         bEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245509; x=1793850309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7l1j5rr7A4ch0y9Ofg+8zcnVm1Y1bFL36IVd2G2/rts=;
        b=YgoQFqN/4mOzLWPrs98XF/2m+RCIMIFcvyIbXtdXfFZB2gzYlzSCx93h70S0g9HyFZ
         Ux2woh3M0xqj7CKJKRRjhdYB1hYrtflKvDISwjmeCefHLlXBOQLw44zxf06+Hl6Rihe2
         /U6vBjFl7vaes4G9TP1VlBOaH9QvIeJ5ogn1rxAwFiYND1TQ4VfnQ9T06tvSEz9nGH+H
         mFQoHDzMUYX5Raa1ArJJ/jZ7uIJu4oohE94njNiv0jgnTImz89tVFH9xGOtJCq31JYRg
         thDpoaE18XZqYDkoZUv4wDMYCv0ZJvSeThSauq5TUNUoPL1a/21m13qfLBJzeLA3H4kA
         xIwg==
X-Gm-Message-State: AFq9FYKV276LVarO2IThITxeBAfkOxzHZTJTdRhqwr3KVIcFjebwznRT
	//+hDdcsNM7k5c7zeXaTcGGAhbrIVwHhGs64HASgfOdPmGZ8RmLiuCASx5BWLMMq
X-Gm-Gg: AYBFou095mJm3Uxzz15eEtNW3R88xwvFQe6zjnmHbg8aBk1Jaff6tp8vXT+2hP/UQ33
	7awHIiNHTeAVqQSgIc8GLHrjnHNq8sVAZpZ1f/JzhHj5Guyk+R8DSqMsfqUmrXVL9O1qSocWKqb
	O3NMehaN+nF0F9sDul6fDvQdIe8XKazFmpo7knlzvaKZFmyH90+Pp/AN2KyCubjvo2UkItS2iWG
	z9vJb8z0cC7KCpNvtQ+pqSW9yioiq0QJo3jtzGpmp4FvXXXS8brCx0tuSE91WZUQ67adO+1qG5z
	kLiZeaChvwTUlI8ns3hdowoEzVfXeZmzPJQekyRJ+l8NqLAa6yu1S6+cJHCZ2SRW4GpDjBVqAFd
	7CA0jDtbuI07SIyHP1DWsNIPId5vjHe41zlk5fZtiUPiUGpFFkOgBFniOxdXC3emkV5du0a46+u
	ywWQoS9F34Sr/a/kLFDtaSSV+xCydRcwEJ5Mz5SQg8Lgc4a/02sjcax+CCPKynHZfKoNNyWno7J
	jcTC8CJWUCdxWlLv4blBOVSvPgMGmltrNLbc+gC87R7deRYq6TSAAaIOl8s3A3IFTzHHIQDMKV/
	DFzUCC8H7MiykYs2q9VsAiSa6uTDK1hp6I8DTBT4hp40priNjaGK5QeMGez5057v0sd3iwUfB5w
	DoRMW+egFKd8SPR6VToLaLkswOak4lCT2iz0u+8kYHrWNWMnl/DY72zCA4OzTm5CXpZl0u3k2cW
	/li06Sb1fq6eu7YUSJpb21uzYT+qxGHEY6NrlUhPfGkHIChw==
X-Received: by 2002:a05:622a:4292:b0:535:f9dd:a3c9 with SMTP id d75a77b69052e-5411d8434camr21631911cf.6.1793245508191;
        Wed, 28 Oct 2026 20:45:08 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c16569sm147542096d6.18.2026.10.28.20.45.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:45:06 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH 01/07] linux-yocto/6.6: update to v6.6.156
Date: Wed, 28 Oct 2026 23:44:57 -0400
Message-ID: <20261029034503.3153661-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029034503.3153661-1-bruce.ashfield@gmail.com>
References: <20261029034503.3153661-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 03:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248877
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    8b73de7da85fd Linux 6.6.156
    65879e0a452ca usb: usbfs: fix use-after-free of usb_device in usbdev_release()
    62cd519ab74ca USB: c67x00: fix use-after-free in c67x00_add_iso_urb()
    8e987c4daf4f4 USB: serial: spcp8x5: drop broken carrier detect support
    030e3a73d3c3a USB: serial: option: fix slab OOB read in interrupt URB callback
    f1c05c41d07b8 ALSA: usb-audio: Complete cleanup after system-resume errors
    94e4562fcc81b ALSA: usb-audio: fix OOB write in snd_usbmidi_novation_output()
    656bd0ccb9006 usb: core: Strengthen error handling in hub_hub_status()
    04ab260407972 usb: core: Add lock to usb_wakeup_notification()
    087c19cc60a8c KVM: s390: vsie: zero stale crypto bits
    fb8110b748b20 crypto: qce - Remove unsafe/deprecated algorithms
    1537bd55b4f84 crypto: mxs-dcp - fix source scatterlist length access
    cc56d2b0d77cf crypto: qce - fix CCM AAD buffer underallocation
    4d35a92dd3da5 crypto: atmel-tdes - use scatterlist length before DMA mapping
    da45847766b52 mm/swap: reject swapon() on filesystem-level encrypted files
    f52f1e75716d2 ipv6: seg6: clear IPv4 control block on IPIP decapsulation
    7c54fd8cfbcf3 net: bridge: mcast: fix use-after-free of a master VLAN's multicast context
    c8837bbe79225 xfrm: fix xfrm_state_construct() auth-trunc leak
    f00df8500e5a3 xfrm: ah6: validate routing header segments_left
    2dd1609cadff4 xfrm: drop ESP-in-TCP packets with no ingress device
    ff8dd7a932f34 xfrm: espintcp: fix UAF during close
    a622167351020 x86/CPU/AMD: Carve out a Zen5 models range
    7287cc1211312 x86/CPU/AMD: Add models 0x60-0x6f to the Zen5 range
    fa05e559102ec x86/CPU/AMD: Add models 0x10-0x1f to the Zen5 range
    ed9cf952fdec3 x86/CPU/AMD: Add more models to X86_FEATURE_ZEN5
    5953e7a89966f x86/CPU/AMD: Add X86_FEATURE_ZEN5
    a832d7cb09da2 tls: device: fix out-of-bounds write in tls_append_frag()
    ad6f0375d2e93 usb: gadget: f_tcm: keep port count until LUN teardown completes
    f95e57b66195c usb: usbtest: disable dynamic ID support
    dcf30a56624c2 fuse: fix invalidate lock leak on open O_TRUNC DAX failure
    92588d187ba46 fuse: fix invalidate lock leak on setattr writeback failure
    c36e7e4eb83e9 xhci: dbgtty: Fix unregister on tty_alloc_driver() failure
    eaca2814f32b9 xhci: dbgtty: Fix unregister on tty_register_driver() failure
    d27599347b691 usb: xhci: Handle USB3 port events when there is one roothub
    daba8d1cd995c accessibility: speakup: unregister tty ldisc on later init failures
    ba537c32de311 fpga: dfl: fme: add error handling
    95f90c6029cae xfs: remove file_path tracepoint data
    b5181516a9f5c Bluetooth: hci_sync: Fix accept list UAF during suspend
    b95bc136fe541 Bluetooth: hci_sync: Use bt_dev_err() to log error message in hci_update_event_filter_sync()
    2e0471bf3ab2a HID: pidff: fix OOB write when hid->inputs is empty
    e9f2ce45b311d HID: pidff: clang-format pass
    1acff0590a447 HID: pidff: Support device error response from PID_BLOCK_LOAD
    9d77ac82e57ea HID: uclogic: fix use-after-free of inrange_timer on remove
    460514d46e889 HID: ft260: fix stack-use-after-return write in I2C read race
    3a32b93cff2a3 HID: ft260: validate i2c input report length
    c023443f0e6cf HID: nintendo: stop device IO before hid_hw_stop on probe failure
    25ad03d5c0e85 nvmet-tcp: bound SGL data length before allocating command buffers
    e4f43b3d85885 nvme: rename CDR/MORE/DNR to NVME_STATUS_*
    cb8b78b34593b nvme: fix status magic numbers
    59d4c2352e823 nvme: rename nvme_sc_to_pr_err to nvme_status_to_pr_err
    d16df755b4493 HID: magicmouse: prevent unbounded recursion in magicmouse_raw_event()
    250cea475827f HID: magicmouse: re-enable multitouch after reset-resume
    e25b44bd8b8cc nfc: nci: add data_len bound checks to activation parameter extractors
    a5e776e293758 nilfs2: reject invalid block index in GC ioctl
    df75b4d1656b5 nilfs2: correct return value kernel-doc descriptions for ioctl functions
    267a15c4f994d ext4: propagate errors from fast commit range replay
    0b34ea0dc2bb6 ext4: make some fast commit functions reuse extents path
    e971a37c68cb5 ext4: make state in ext4_mb_mark_bb to be bool
    4241e3b406c80 ksmbd: harden file lifetime during session teardown
    bfd861dadd3a4 crypto: starfive - Do not free stack buffer
    b300312562fd6 powerpc/hv-gpci: fix preempt count leak in sysfs show paths
    2df9641e4b622 net/sched: initialize noop_qdisc owner
    524323f52cbfb net/sched: Fix mirred deadlock on device recursion
    4f15e7704c335 selinux: switch two allocations to use kzalloc_objs()
    9a4d8e559c3c9 smc: Use __sk_dst_get() and dst_dev_rcu() in smc_vlan_by_tcpsk().
    a698d43ce95b7 ASoC: nau8821: Cancel pending work before suspend
    b671ba32c5638 Revert "PM: sleep: Use complete() in device_pm_sleep_init()"
    66dedb6028c3d riscv: Fix register corruption from uninitialized cregs on error
    5662dac41a344 bpf: Fix use-after-free in offloaded map/prog info fill
    36fb28fa033f6 ASoC: nau8821: Cancel delayed work on component remove
    4f5f52a584293 smc: Use __sk_dst_get() and dst_dev_rcu() in smc_clc_prfx_match().
    80d1fd39f4e37 smc: Use __sk_dst_get() and dst_dev_rcu() in in smc_clc_prfx_set().
    7b854e68365a8 KVM: arm64: Prevent access to vCPU events before init
    302dbed4760bc smc: Fix use-after-free in __pnet_find_base_ndev().
    53ca5b78b69d3 can: j1939: make j1939_sk_bind() fail if device is no longer registered
    fd8c807f8d5f1 can: j1939: add missing calls in NETDEV_UNREGISTER notification handler
    76957b618ce72 can: j1939: implement NETDEV_UNREGISTER notification handler
    75194165e6501 mISDN: hfcpci: Fix warning when deleting uninitialized timer
    71209954f1e8f media: platform: exynos4-is: Add hardware sync wait to fimc_is_hw_change_mode()
    ac65f76db9b2f exfat: fix double free in delayed_free
    a39f811a9f5ed jfs: Fix null-ptr-deref in jfs_ioc_trim
    9bc078818ec76 ibmvnic: Use kernel helpers for hex dumps
    47a99881ecc50 jfs: add check read-only before txBeginAnon() call
    41da1715cd24e jfs: add check read-only before truncation in jfs_truncate_nolock()
    e217492f6fa22 bpf: Remove tst_run from lwt_seg6local_prog_ops.
    ce12e1170c0c7 perf: Reject exited events as group leaders
    c1164f14c6366 bpf: Ensure reg is PTR_TO_STACK in process_iter_arg
    ff3f428df00bc Revert "usb: phy: fsl-usb: Fix use-after-free in delayed work during device removal"
    eb1e94fee5e27 io_uring/io-wq: fix worker accounting when canceling creation callbacks
    a13f61ba9b2a7 ext4: don't enable DAX on new encrypted files
    429b6f43b4d8c KVM: x86/mmu: Check write tracking in all address spaces
    f5e6580a3a16a RDMA/rxe: Fix OOB in free_rd_atomic_resources()
    a4a971135a2ff Linux 6.6.155
    3edf721bb4b99 inet: frags: strip GSO state from fragments before reassembly
    93e0c9521fa8e Linux 6.6.154
    e907bf694ed55 net: gro: properly validate BIG TCP aggregation criteria
    26741d178f319 Bluetooth: hci_event: validate LE Set CIG Parameters response
    0628cc9b2fa29 Bluetooth: hci_event: fix LE list UAF on reset
    334271d3812ab HID: hyperv: validate initial device info bounds
    2ce90cfc6646a HID: sensor: custom: Fix use-after-free in enable_sensor
    abec577de5fc1 HID: core: fix number/pointer type confusion on long items
    bd397c4123a4b HID: nintendo: fix out-of-bounds read in joycon_ctlr_read_handler()
    bb32e9a6a9a9f mptcp: pm: fix memory leak from alloc-during-teardown race
    a5321b00b98ec Input: atkbd - skip deactivate for HONOR ZQC-P
    346f0edba1d49 Input: atkbd - skip deactivate for HONOR FMB-P's internal keyboard
    c4cec575a6d6f Bluetooth: hci_sync: Fix advertising data UAFs
    f0ab9a71167ba xfrm: fix sk_dst_cache double-free in xfrm_user_policy()
    c1d9c16af51cc HID: core: fix OOB read of field->usage in hid_set_field()
    9b3469d162e3a HID: magicmouse: Prevent out-of-bounds (OOB) read during DOUBLE_REPORT_ID
    3d7a7bac4c75f HID: magicmouse: do not keep a stale msc->input if no input is claimed
    514a814c74277 HID: magicmouse: fix battery reporting for Bluetooth Magic Trackpad USB-C
    13aa13ce3d653 mptcp: pm: fix data race in add_addr timer callback
    48b76879f5bfc ASoC: codecs: lpass-tx-macro: Fix enum kcontrol accesses
    4931c09d83877 ASoC: SOF: ipc4-pcm: Continue the pipeline trigger in case of IPC timeout
    74ec9c120e900 ASoC: SOF: pcm: Add snd_sof_pcm specific wrappers for dev_dbg() and dev_err()
    5f291adb281ea ASoC: SOF: pcm: Move period/buffer configuration print after platform open
    93c9bee226152 ASoC: SOF: Relocate and rework functionality for PCM stream freeing
    925cb11b60c14 ASoC: sof: pcm: use snd_pcm_direction_name()
    86cc450022473 nvmet-tcp: Do not WARN on remotely-controlled oversized SGL allocations
    d094582cce9c0 nvmet-fc: fix invalid free in LS IOD error path
    8f6363c8d54dd nvmet-auth: zero the AUTH_RECEIVE response buffer
    087ee0d914aaa ipv6: fix use-after-free in ip6_finish_output2()
    b0ea911453ce7 ipv4: reject undersized MTUs in ip_do_fragment()
    eab3eeb68bfc6 libceph: fix OOB read in decode_watchers() via missing bounds check
    28d984a66b9e1 Input: byd - synchronize timer deletion before freeing private data
    3a398e09a6c15 ndisc: ndisc_send_redirect() cleanup
    790576dc7ccc4 nfc: nci: free destination parameters when closing a connection
    7489f59d1ea2d nfc: nci: fix uninit-value in the RF discover/activated NTF handlers
    24761d3a5f692 nfc: nci: fix out-of-bounds write in nci_target_auto_activated()
    9635507fe8294 nfc: st21nfca: validate ATR_REQ length against the received frame
    4a52ec2457ff8 nfc: pn533: purge fragmented skbs during cleanup
    3793d768b40f3 nfc: llcp: reject PDUs shorter than the LLCP header
    a209334ed9299 nfc: llcp: fix OOB read and u8 offset wrap in TLV parsers
    1964addc8dd53 nfc: llcp: bound the connect_sn TLV walk to the skb
    18f02354ed229 nfc: microread: validate target discovery payload lengths
    fc3c2bd5b1ec6 nfc: fdp: bound the device-reported read length and fix an skb leak
    d0756a98277e3 nfc: digital: clamp SENSF_RES length to the destination buffer
    77693fb8aec30 drm/amdgpu: check ASPM on the dGPU host link
    b287812f88a1c drm/amd/display: fix BT.2020 YCbCr limited output CSC matrix
    874d1bdda79bc drm/amd/display: Fix BT2020 YCbCr limited/full range input
    3227cd5116751 drm/amd/amdgpu: disable ASPM in some situations
    a3d60ae24183e s390/vfio_ccw: Implement a crw lock
    f0d189d95eee0 s390/vfio_ccw: Calculate idal length based on idaw type
    460b977a4e71c s390/vfio_ccw: Ensure first IDAW remains constant
    152fcb74a2680 s390/vfio_ccw: Free all memory if cp_init() fails
    b6505a4cea45d gpio: ml-ioh: use raw_spinlock_t for the register lock
    e99120b5944a1 xfs: validate attr entry pointer before field access
    46116f574be32 ext4: clear error before retrying inode xattr space fallback
    a40c45268f435 ext4: stop retrying saturated xattr cache entries
    a2fb8222cde23 kcov: fix data corruption and race conditions on PREEMPT_RT
    075e52fd6d86c null_blk: fix UBSAN shift-out-of-bounds when zone_size is 0 or overflows
    6a009f1e61b11 ocfs2: fix missing metadata reservation for large xattrs
    b20eb7ecbdaa3 ALSA: dummy: Check card index validity at probe
    b7528b42813f0 xfs: bounds-check buffer log item's dirty bitmap
    2eca18dd026b2 xfs: don't use a xfs_log_iovec for ri_buf in log recovery
    d3ffb89b29446 inet: frags: publish queues before arming timer
    bb7488c797d0f inet: frags: save a pair of atomic operations in reassembly
    32fa602b5dd6a inet: frags: change inet_frag_kill() to defer refcount updates
    c69b3593aa735 ipv4: frags: remove ipq_put()
    4d40d900ffb2d inet: frags: add inet_frag_putn() helper
    4a8887dd3a8a9 serial: sc16is7xx: enable THRI before filling TX FIFO
    811b44be278b2 serial: sc16is7xx: use guards for simple mutex locks
    a289a78f13ab0 serial: sc16is7xx: rename EFR mutex with generic name
    7047aa394d6ce serial: sc16is7xx: convert bitmask definitions to use BIT() macro
    969e3867ef67e serial: sc16is7xx: fix copy-paste errors in EFR_SWFLOWx_BIT constants
    1606abb7ce8c0 serial: qcom-geni: fix TX DMA buffer flush
    80c6054a4c40a perf/core: Fix group leader use-after-free after sibling detach
    c4ab0d6888022 perf: Unify perf_event_free_task() / perf_event_exit_task_context()
    c8c8e895f65fb serial: amba-pl011: synchronize DMA teardown
    fcaf8ba7e56bb NTB: ntb_netdev: Preserve RX queue depth on allocation failure
    10a6b99079697 rndis_host: add overflow check in rndis_rx_fixup()
    362726c9c6e56 Bluetooth: RFCOMM: take rfcomm_mutex for the deferred setup accept
    8d08713ec83a1 PCI: host-generic: Fix NULL pointer dereference on 32-bit CAM systems
    dc6160265ffc7 Linux 6.6.153
    22709117d9ae9 ring-buffer: Use current_context for safe per-CPU buffer swap
    cf0bc75d1ca9d ring-buffer: Remove jump to out label in ring_buffer_swap_cpu()
    171f95d662863 net: harmonize tstats and dstats
    2fdf8b07bee5e binfmt_misc: use exe_file_deny_write_access() for the interpreter clone
    1fc9f6d2c7c9f net/x25: fix use-after-free of the socket by its timers
    74365aef5bf22 erofs: fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS on some UP platforms
    ec5a552f4b2d8 net/sched: cls_bpf: reject dev-bound programs bound to a different device
    551688b410d3f net: ethernet: ti: am65-cpsw-nuss: Fix port_id extraction from SRC TAG
    f60c71deb17ea m68k: Define NR_CPUS to 1
    2930f1b49133e m68k: use the coherent DMA code for coldfire without data cache
    5904c758e0e95 dma-direct: add a CONFIG_ARCH_HAS_DMA_ALLOC symbol
    19d114b93c94b net/sched: cls_u32: skip hash tables in u32_bind_class()
    91d55fd1fdb85 net/sched: act_api: fix TOCTOU NULL deref on a->goto_chain
    a857e3408be07 net: sched: Add initial TC error skb drop reasons
    d54e7ec851664 net: sched: Move drop_reason to struct tc_skb_cb
    14f679a8d2ddc packet: add a generic drop reason for receive
    b72e44dc038f2 net, sched: Fix SKB_NOT_DROPPED_YET splat under debug config
    69c66cf557906 net, sched: Add tcf_set_drop_reason for {__,}tcf_classify
    5599966042e05 net, sched: Make tc-related drop reason more flexible
    1fc70b3d513ba af_packet: Don't send zero-byte data in tpacket_snd().
    b4ef887bee4d3 ASoC: xilinx: formatter_pcm: pass aud_drv_data to irq handlers
    06c2a53604fa1 net/tls: Fail tls_sw_splice_read() after a failed async decrypt
    e451e20adb869 net: packet: fix wrong transport_header when sending VLAN-tagged frame
    28afc87bd8da0 macvlan: inherit needed_headroom and needed_tailroom from lowerdev
    f3c17ff65f547 ipvlan: inherit needed_headroom and needed_tailroom from phy_dev
    ccc33e1b2edb4 netfilter: ipset: let destroy callbacks adjust ext mem size
    eada630d0ae3e netfilter: ipset: fix list type element drift bug
    d37917e7bebe0 netfilter: flowtable: publish GC-visible tuple last
    17c132e18ca5d netfilter: nf_tables_offload: suppress WARN_ON_ONCE for ENOMEM in abort path
    b891e7a6bb06e netfilter: ipset: fix refcount race between list:set GC and swap
    9f4a626420c71 crypto: ccm - Set rfc4309 maxauthsize from child
    4f1dde17b1222 arm64: tegra: Add EL2 virtual timer interrupt for Tegra194
    f3a874a903053 mm/huge_memory: fix huge_zero_pfn race
    28afde1edbd8b KVM: SVM: Serialize accesses to the owner and mirror list with separate lock
    76df4edf7d61e mm/ptdump: always stabilise against page table freeing using init_mm
    8d7f560f4b048 mm/vmalloc: acquire init_mm lock on huge vmap to avoid ptdump UAF
    56a45fdbe5b25 mm/pagewalk: split walk_page_range_novma() into kernel/user parts
    898a44d811cf0 drm/amdgpu: move debug_vm handling to amdgpu_cs_parser_fini
    9efc767335234 drm/amd/pm: fix pptable use-after-free
    50cfece0b1c02 drm/amd/pm: fix torn gpu metrics reads
    584a5d96b6ebf can: rcar_canfd: change the initializing flow for clocks and resets
    441e9c33284c1 i2c: iproc: reset bus after timeout if START_BUSY is stuck
    b95dd3225eea5 i2c: bcm-iproc: remove printout on handled timeouts
    bb01c51950c3f vxlan: use pskb_network_may_pull() for transmit path header pulls
    1db9041e91ac5 vxlan: Handle stats using NETDEV_PCPU_STAT_DSTATS.
    72496cf871aa2 vrf: Make pcpu_dstats update functions available to other modules.
    7806ff0e8a4d9 net: core,vrf: Change pcpu_dstat fields to u64_stats_t
    73e7998c3361c vxlan: Do not alloc tstats manually
    bbd63ba7961c6 ice: fix VF interrupts cleanup
    dd9ba32169e73 binfmt_misc: restore write access when removing an entry
    bf5ed2ef5cdb7 fs: don't block write during exec on pre-content watched files
    04958dba44dc7 veth: convert frag_list skbs before running XDP
    577443530cb59 net: pktgen: fix proc entry use-after-free
    b0a3d6d582ec2 net: pktgen: fix code style (WARNING: Block comments)
    81e21cb7bd147 ksmbd: reject repeated SMB2 NEGOTIATE requests
    5964d1f35402f ksmbd: conn lock to serialize smb2 negotiate
    a0f16c3376918 igc: remove napi_synchronize() in igc_down()
    1f389ecd0c35e ASoC: tas2562: Validate values for volume writes
    5b948706f11a9 mm: migrate_device: fix pte_pfn/pte_dirty called on non-present PTE
    94a15b8a8f5a9 btrfs: zoned: fix missing chunk metadata reservation
    2c3bd3b6ba701 btrfs: remove fs_info argument from btrfs_zoned_activate_one_bg()
    76f70daebe757 btrfs: add space_info argument to btrfs_chunk_alloc()
    17fe8f41c8c21 btrfs: add debug build only WARN
    8b0a3a094f4ca tcp: challenge ACK for non-exact RST in SYN-RECEIVED
    6eb6b1d172659 tcp: fast path functions later
    6ad63d36f6c5f tcp: Pass flags to __tcp_send_ack
    d8e5c5672724b ksmbd: validate minimum PDU size for transform requests
    b9e4b3b9aadbb smb/server: fix minimum SMB2 PDU size
    ecb45f5c8b0db smb/server: fix minimum SMB1 PDU size
    618af5277dcb5 ksmbd: rename smb2_get_msg to smb_get_msg
    45e3e87561b4a smb/server: rename include guard in smb_common.h
    7964b9ab3baf9 smb: move get_rfc1002_len() to common/smbglob.h
    bc73642ccd637 smb: move smb_version_values to common/smbglob.h
    05536cad35f27 super: fix emergency thaw deadlock on frozen block devices
    4131dd0b6f67a net/sched: serialize qdisc_rtab_list against concurrent get/put
    db3e82da616f5 net: gro: fix double aggregation of flush-marked skbs
    2cb6c8b12bda5 net: move skb_gro_receive_list from udp to core
    02430f6f729b2 libceph: fix two unsafe bare decodes in decode_lockers()
    d974b4b786214 userfaultfd: prevent registration of special VMAs
    d97b01e78ce31 userfaultfd: move vma_can_userfault out of line
    896e8884fc2cc mm: userfaultfd: add pgtable_supports_uffd_wp()
    48829622212f6 iomap: fix out-of-bounds bitmap_set() with zero-length range
    7439dc31f6781 iomap: hold state_lock over call to ifs_set_range_uptodate()
    a155aa7a52c6f ASoC: fsl_sai: Fix spurious BCLK on resume by clearing BYP
    42bc06c67d94d libceph: bound pg_{temp,upmap,upmap_items} length to CEPH_PG_MAX_SIZE
    7cd7b483893b6 libceph: Amend checking to fix `make W=1` build breakage
    34bb4c61948da ceph: Use a folio in ceph_page_mkwrite()
    e05c315b4da0c ceph: fix hanging __ceph_get_caps() with stale mds_wanted
    78af6441b8966 ceph: Remove ceph_writepage()
    c8a21660c3b90 ceph: avoid fs reclaim while using current->journal_info
    dbb90d8b21b94 RISC-V: Provide pgtable_l5_enabled on rv32
    48552988925d9 xfs: check v5 superblock features early
    5b756fbb60b5d xfs: don't swallow dquot recovery verification errors
    ed8bfb43de712 xfs: fix ilock leak on error in xfs_dq_get_next_id
    472cfa4ba2433 xfs: only check mergeability of bnobt records
    070229262ede3 drm/amdgpu: disallow multiple FENCE chunks in one submit
    60539d517e843 drm/amdgpu: Fix UVD decode image min size calculation
    fa96c24485942 drm/amdgpu: Fix UVD dpb min size calculation for H264
    7cff5d7870a11 drm/amdgpu: Fix UVD min buffer sizes
    f0f5048d58dec drm/amdgpu: Implement insert_end for VCE 3
    8435d41afcf2b drm/amdgpu: Reject UVD message with dimensions above 4096
    ce5da474c3ddf drm/amdgpu: validate GEM_CREATE domain combinations
    a930c54cb6720 drm/amdgpu: Reject UVD message with invalid number of h265 refs
    f72a51810d494 s390/vfio_ccw: Selectively expand io_mutex
    f98a9890ca42f s390/vfio_ccw: Move cp cleanup out of not operational
    af3f80ca4c8b1 s390/vfio_ccw: Fix out of bounds check on CCW array
    79ea5e0c4c8a9 s390/vfio_ccw: Ensure index for read/write regions are within range
    e868ea8be0bc8 s390/vfio_ccw: Cancel existing workqueues
    15fb4559a7fdf s390/vfio_ccw: Limit the number of channel program segments
    2acbeace14672 drm/radeon: fix autosuspend cleanup during teardown
    38d60f808b341 mmc: sdhci: make tuning_err a signed int
    fc90985bd5d7e mmc: sdhci: unmap the bounce buffer before device release
    2d481fc84b589 mmc: omap_hsmmc: fix busy_timeout overflow in ns conversion on 32-bit
    762be85fadd97 libceph: tolerate addrvecs with multiple entries of the same type
    54aff77ed44ac ceph: fix MDS random selection readiness predicate
    e2ffeec85201b libceph: Avoid using invalid osd indices from primary_temp
    28d9cd72827be Input: sur40 - fix V4L error path cleanup
    3e8ed76a4f357 Input: sur40 - fix input device registration ordering
    b4d73c3848bae openrisc: signal: do not restore privileged SR bits on sigreturn
    82f4f07f3f040 ftrace: Fix off-by-one fentry site disable in ftrace_free_mem()
    8c6ee5351b264 ftrace: Protect direct_functions in ftrace_find_rec_direct
    fa4aa86fff0c5 libceph: fix multiple unsafe decodes in decode_locker()
    de52c713d2180 crypto: qce - fix error path in devm_qce_register_algs
    ec61ca4e31066 Input: hynitron_cstxxx - validate touch count and finger IDs
    2b0403fb7e28f Input: synaptics-rmi4 - propagate F54 worker errors to V4L2 queue
    1d718f1461766 Input: synaptics-rmi4 - block s_input when F54 queue is busy
    12be3c6ca9589 Input: synaptics-rmi4 - bound the F54 report size to the allocated buffer
    77749685e55da Input: synaptics-rmi4 - zero report size on F54 work error
    8e3e0f23f8fd4 powerpc/pseries: lparcfg - fix kbuf[] underflow
    5232529eaf57f Input: iforce - validate input packet lengths
    9094997f073e9 Input: atkbd - skip deactivate for Xiaomi Book Pro 14's internal keyboard
    da6b8b05db0cf Input: psxpad-spi - set driver data before use
    81b07470cb293 Input: focaltech - fix array out-of-bounds in focaltech_process_rel_packet
    0739c65e799d4 Input: synaptics-rmi4 - fix F55 transmitter electrode count typo
    e19b45d5e031a powerpc/pseries: pci - logic bug
    142346822c700 Input: xpad - add support for ZENAIM LEVERLESS
    e5cb281913621 drm/amdgpu: fix aperture iounmap skipped on device removal
    42bc07b4e5a3c fbdev: core: Fix pointer desynchronization in fb_io_read()
    891129df5de79 ASoC: codecs: lpass-wsa-macro: Fix enum kcontrol accesses
    ad8b255006580 ASoC: cs35l41: sort the register default table
    673348de84471 ASoC: cs35l45: sort the register default table
    c18fe394ddcce ASoC: cs4265: sort the register default table
    b270ed3273804 ASoC: SOF: sof-audio: Fix error path in sof_widget_setup_unlocked()
    cc423f4105fe1 s390/qeth: validate user buffer length in SNMP and ARP query ioctls
    f75f174edc865 mptcp: fastopen: only mark MPTFO subflows with SYN data
    26dac5c9ffb20 mptcp: options: reset DSS fields in case of unexpected size
    dc1d8d3eb345c mptcp: avoid combining some incoming suboptions
    6e46970fc0001 selftests: mptcp: join: mark tests with data corruption as failed
    e0285bb152211 selinux: reject an unclaimed class value in security_get_classes()
    1acc317d67a75 selinux: do not cancel a policy conversion that never started
    2b7ffd7921fcb selinux: reject a class permission count below its inherited common
    3161daa3f1e3c selinux: require every boolean value to be defined
    6515053335d9f net: mana: Fix EQ leak in mana_remove on NULL port
    3e9d5f325e9ce ipvs: separate destination availability state
    68e094232dfe5 f2fs: fix UAF issue in f2fs_merge_page_bio()
    6f06dbe5012c1 block: stop the timeout timer when releasing a never added disk
    c610b395b0a51 Linux 6.6.152
    1a9e400a19df4 regulator: devres: fix devm_regulator_get_enable_read_voltage() return
    2ee4194be09fc net/tcp_sigpool: Use kref_get_unless_zero()
    0490d0b862ed5 net/tcp_sigpool: Fix some off by one bugs
    7a6a6d2a12786 bpf: tcp: fix double sock release on batch realloc
    50f0c8dd8c339 thunderbolt: Bound the DROM dual link port number before indexing sw->ports
    31efa656cf6af sctp: clear new_transport when removing a peer
    dc67d528c2fa9 sctp: fix use-after-free of cached ASCONF chunk
    1adf929121e13 sctp: keep chunk->transport in step with the list it is queued on
    ed935348a9a96 scsi: scsi_debug: Negate wrapped memcmp() result
    d192cff2a37d5 bpf, sockmap: Fix sk_redir use-after-free in send verdict
    310b5a537a78c sched/psi: Shut down rtpoll_timer in psi_cgroup_free()
    33b7e810ce099 fscrypt: use the mount idmap for the owner check in fscrypt_ioctl_set_policy()
    64e41736a26f3 ip6_tunnel: clear skb2->cb[] in ip6ip6_err()
    0b9e02f3bd31c ipv6: fix Route Information option length validation
    3d965811be784 ptp: ocp: Fix board ID over-read
    999e573212d5f Revert "thermal/drivers/hwmon: Cleanup coding style a bit"
    b77581b25e213 eventfs: Fix use-after-free in eventfs_remove_rec()
    f33ecb89d3523 KVM: x86/mmu: WARN and clear role.invalid when creating a child shadow page
    c292d4686f717 smb: client: Fix use-after-free in cifs_try_adding_channels()
    47ba70891b10b tipc: read le->link under the node lock in tipc_node_link_down()
    aa8b14647721b tls: don't leave a full plaintext sk_msg ring unpushed
    cf363a7a02ce1 vhost: reset the vring metadata cache on vring reconfiguration
    2f2a7f3f8b9f1 veth: fix skb length accounting after XDP frag adjustment
    9d80a04129a6c vsock/virtio: avoid refilling the RX queue after teardown
    a1fb0c5b8a7c2 vsock/virtio: read virtqueues under worker locks
    619dd29045e43 vxlan: do not arm the ageing timer on a device that is down
    ba13763d667e0 xdp: reject clones that overrun skb_shared_info tailroom
    7380f1bfe9d7e Revert "drm/amdgpu: fix aperture mapping leak"
    513478092966d ovl: don't warn when the mount is completed from another user namespace
    6bcb8839aa2d6 net/sched: act_gact, act_police: range check the fallback control action
    737873a59905a net/sched: act_ct: fix sk_buff leak when the header checks reject a packet
    ff451bc4290b7 net: atlantic: free RX pages of consumed but not refilled buffers
    7a3e1481f4ee6 net: atlantic: free stranded TX buffers on ring deinit
    63853eb20bba4 netfilter: nf_conntrack: defer invalid log until after unlock
    6ea88401e10e0 netfilter: bridge: release template ct on non-IP path
    cc5bd568f9b76 ipv6: prevent in6_dev_get() from resurrecting inet6_dev
    af02c67ce6543 net: smc: fix splice entry lifetime imbalance in smc_rx_splice
    94134d70abf92 fbdev: bitblit: bound-check glyph index in bit_cursor()
    e5f1d301b4bda tracing: Fix race between update_event_fields and, event_define_fields
    4208db2453e1e ALSA: usx2y: bound the hwdep mmap fault offset
    d431941825d35 ALSA: usb: Fix UAF at delayed release of MIDI2 EPs
    93e7044b548a7 ring-buffer: Fix crash passing ERR_PTR to kthread_stop()
    3ceec39788481 misc: fastrpc: fix memory leak in fastrpc_channel_ctx_free
    3f265e405e5ef misc: fastrpc: take fl->lock when moving mmaps on interrupted invoke
    97273624f7b35 misc: fastrpc: Remove buffer from list prior to unmap operation
    a2f5efe0b6ccf misc: fastrpc: fix channel ctx ref leak when session alloc fails
    c5e5d78743992 staging: rtl8723bs: validate monitor transmit frame lengths
    4ba402fd47009 staging: rtl8723bs: fix missing shared-key auth challenge length check
    1158b99312073 staging: rtl8723bs: fix OOB read in WMM_param_handler()
    0d19f0600fbb6 staging: rtl8723bs: fix OOB read in rtw_get_wpa_ie()
    e7a5d792cf64a serial: 8250_dma: Clear stale RX state on shutdown
    201b6961f02c6 mei: pull kvfree out of spinlock
    dfe388da13aa7 ipv4: fix use-after-free in fib_nhc_update_mtu()
    7f80ad373ce4a ipv4: Fix fib_nlmsg_size() for RTA_VIA nexthops
    606612b75d16d selftests/bpf: Adapt sockmap update error handling
    ce1418fec60e0 fscrypt: Replace mk_users keyring with simple list
    401b84010a93a pinctrl: renesas: rzg2l: Use -ENOTSUPP instead of -EOPNOTSUPP
    41cd5a536b3b2 fortify: Disable -Wstringop-overread in tests
    4d48c73b0a24b fortify: refactor test_fortify Makefile to fix some build problems
    aa5c571901c6b futex: Prevent robust futex exit race some more
    55a3e01f89480 dt-bindings: crypto: qcom,ice: Fix missing power-domain and iface clk
    eefd1214882fa KVM: s390: pci: Fix aisb calculation
    0e75b02682188 KVM: s390: pci: Fix resource leak on IRQ registration failure
    dea31682783ff KVM: s390: pci: Fix missing error codes and memory unaccounting
    dc7465a364104 KVM: s390: pci: Fix memory accounting for pinned/unpinned pages
    06d58b8d2f053 net: bridge: mrp: fix uninitialised bytes on the wire
    9d8a94b48b393 netfilter: ebt_nflog: pin the NFLOG backend
    fe820dcc1d8ff mac802154: fix netdev use-after-free in beacon worker
    99df6b7a713f9 net: remove CAP_SYS_RAWIO zero-padding in dev_validate_header
    eff6343033f57 net: octeontx2-pf: Fix UB in shift operation
    8ca8cdb749395 net/sched: reject overly deep qdisc hierarchies
    87d0c0040b5d4 net: openvswitch: reallocate update replies for mismatched IDs
    cf8189b82bb93 packet: synchronize pressure clearing with ring reconfiguration
    b47ba8fe6e1d2 net/packet: reset the MAC header on the packet-socket transmit path
    d85d2fd54e901 packet: use consistent hard_header_len in TX_RING send path
    91f041451f967 packet: use consistent hard_header_len in non-ring send paths
    ed246dd85ebf2 ipvs: clear IPv4 options after rebasing tunnel ICMP errors
    2061525f3431d ipvs: properly update the overload flag on dest edit
    bc2cba3662e23 ipvs: add totalconns for dest
    d5122a2b26011 ipvs: stop estimator after disabled calc phase
    b6cb134707a21 ima: fix out-of-bounds read in xattr_verify()
    06a286b320236 Input: evdev - fix information leak in evdev_pass_values()
    38a0aa593ebc2 vt: stabilize tty reference in kbd_keycode with tty_port_tty_get
    d8ead5083b203 vt: add permission check for KDSKBMETA ioctl
    1c63303659a22 net: usb: ax88179_178a: fix skb leak in ax88179_tx_fixup()
    11413d7ed4217 usb: gadget: f_ncm: Use unsigned int for ndp_index
    0f770d5edaca2 usb: cdnsp: fix incorrect endian conversions for APB timeout register
    c81b71b737b47 thunderbolt: icm: Preserve USB4 proxy data-valid bit
    993f7677949e3 usb: atm: cxacru: properly kill rcv_urb on error in cxacru_cm()
    6607f85242577 ALSA: usb-audio: fix OOB write on Type II inbound URBs
    5db341189bb7f Input: evdev - sanitize event type index when fetching event masks
    a74a3bc424b75 spi: spi-fsl-dspi: Avoid setup_accel logic for DMA transfers
    1232fd8cc252f net: fec: do not release NULL pages when RX buffer allocation fails
    83837e3e827dd hwmon: (ads7828) Fix external VREF regulator handling
    4f2f4e9cfbb48 regulator: devres: add API for reference voltage supplies
    6ae440fe5ff72 hwmon: (corsair-psu) fix possible out-of-bounds access on missing string termination
    73c1ff87b63b4 tls: don't abort the connection on signal-interrupted sends
    8de65194a04d2 sctp: clear control chunk transport if it is being removed
    35f258fee9ed3 net/atm: fix slab-out-of-bounds read in vcc_setsockopt()
    8adedc923f821 net/tcp: Add TCP-AO config and structures
    e2d44d24385a9 net/tcp: Prepare tcp_md5sig_pool for TCP-AO
    fa0dca89b4fb0 ata: pata_sl82c105: fix bridge revision use-after-free
    b5a21615f627c net: thunderbolt: Tear down DMA paths before stopping the rings
    01865e1ddb126 net/smc: fix TOCTOU race between smc_listen_out() and listener close
    d2adc4e80b29e net: remove WARN_ON_ONCE() from sk_mc_loop()
    6fad06bb793d7 net: prestera: validate firmware header length
    43c7d0a691775 net/ncsi: fix heap OOB read in NCSI_CMD_SEND_CMD payload length
    585fc5247d149 tcp: fix TFO max_qlen accounting across reuseport migration
    0de370f9bbf35 sctp: fix addip_serial increment on ASCONF_ACK allocation failure
    dd5d6de4ca86a bnxt_en: Fix PTP PPS setting bug
    b61c4911204a0 bnxt_en: Disable EOP for TPA on all chips to prevent data corruption
    b8b4950f331b3 bnxt_en: Do not set EOP on RX AGG BDs on 5760X chips
    ca84302458977 selftests/ftrace: refactor eprobes test to fix argument checks
    cbe7aaaa2ac91 hwmon: (pmbus/lm25066) Fix PMBus coefficient calculations
    a3f598c0bfbed hwmon: (lm25066) Use i2c_get_match_data()
    2b316608f521a hwmon: (nzxt-smart2) Check return value of init_device() in probe
    34e77d8e3570f net/sched: cls_api: Always acquire rtnl_lock when destroying locked classifiers
    69cba7b704400 net: sched: refine software bypass handling in tc_run
    4d1fc1d990f81 net: sched: cls_api: fix slab-use-after-free in fl_dump_key
    544cf4801b6cf net: sched: make skip_sw actually skip software
    f236d51f9caf2 net: sched: cls_api: add filter counter
    efd3ffa472d68 net: sched: cls_api: add skip_sw counter
    d8bea341b1831 net/openvswitch: check Ethernet header length in key_extract()
    0c4882bff3455 net/sched: sch_cake: drop WARN_ON(1) for malformed packets in ACK filter
    1ae134c012e10 udp: fix potential use-after-free in tunnel segmentation
    7bcb21bead667 tcp: do not change rcv_ssthresh in tcp_measure_rcv_mss()
    893775f29af77 vhost/vdpa: reject overflowing PA map page counts on 32-bit
    ddbe966b5d1fe bpf: tcp: Fix use-after-free in bpf_iter_tcp_established_batch()
    f9d22822720b7 bpf: tcp: Avoid socket skips and repeats during iteration
    4e3eaa5dce352 bpf: tcp: Use bpf_tcp_iter_batch_item for bpf_tcp_iter_state batch items
    beb8ffae319b7 bpf: tcp: Get rid of st_bucket_done
    1d7a82c1df5fc bpf: tcp: Make sure iter->batch always contains a full bucket snapshot
    524f2d0409706 bpf: tcp: Make mem flags configurable through bpf_iter_tcp_realloc_batch
    ccbbbca21ddda counter: microchip-tcb-capture: Fix DT channel validation
    9a416f000285a net/mlx5: fw_tracer, return NULL on create error
    7b6552e53426e devlink: fix net namespace reference leak in reload
    0e6c8440aeb3e net: hisilicon: hix5hd2_gmac: remove redundant NAPI delete
    b969984b2bdc8 net/sched: cls_route: fix fastmap use-after-free on filter
    06734dfeaeba8 net/smc: fix qentry overwrite for CONFIRM_LINK and ADD_LINK_CONT in smc_llc_event_handler()
    8cb23101a3fcc bpf: Preserve pointer state for commuted arithmetic
    e2c7e88815edd btrfs: fix memory leak in btrfs_do_encoded_write()
    f40409265dcb6 ipvs: return the csum validation for forward hook
    3c779b258c9c3 ipvs: avoid out-of-bounds write in ip_vs_nat_icmp
    2dd0312392d07 netfilter: ipset: switch ext_size to atomic64_t
    607adbda01053 net/mlx5e: TC, Check if flow is PEER before acquiring devcom lock
    dd148539fb474 bonding: alb: re-check primary_is_promisc under RTNL in bond_alb_monitor
    5d59e549b9033 Revert "net: thunderbolt: Enable end-to-end flow control also in transmit"
    51e32c5555b07 drm/bridge: ps8640: propagate AUX transfer register errors
    eacc1a5838710 ARM: dts: BCM5301X: fix PCIe controller 2 second interrupt
    4f7bb93a59082 ARM: npcm: Fix OF node refcount leaks in SMP setup
    caee6a68ffaa5 NFS: Pin the 'struct nfs_server' during a FREE_STATEID call
    7dd6e556dbfc9 s390/zcrypt: Fix missing mem scrub at clear key import in cca_clr2cipherkey()
    590d9aec777cb selftests/bpf: Fail unbound UDP on sockmap update
    91baa89437961 mount: honour SB_NOUSER in the new mount API

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 1d4f95e42c..e8d1f9da07 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "eaa4bfd4f99ab0f3cf46ec5a207b73e22fb1c3f9"
-SRCREV_meta ?= "dd201eb6ec53179f45836d41610ca68c725d28e2"
+SRCREV_machine ?= "f92c1779022032aac8134ccb9e75365b19f6c596"
+SRCREV_meta ?= "be02dc16fd11e7575782a0e13db080d122a8989a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.151"
+LINUX_VERSION ?= "6.6.156"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index f2d6e5eef5..03889d329e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.151"
+LINUX_VERSION ?= "6.6.156"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c51e01ecff210644b5d199a4edb30cb1a94a746f"
-SRCREV_meta ?= "dd201eb6ec53179f45836d41610ca68c725d28e2"
+SRCREV_machine ?= "d9da23dffd2dea6dcfa986e0aad77898a7b373da"
+SRCREV_meta ?= "be02dc16fd11e7575782a0e13db080d122a8989a"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index c1ac8e0a08..2632a4ef2f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ed7cf749dcade8ded9fda05be53c235a446dcbff"
-SRCREV_machine:qemuarm64 ?= "b96d2d770cab02b84c46606fa538ce027bee6b08"
-SRCREV_machine:qemuloongarch64 ?= "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
-SRCREV_machine:qemumips ?= "fcfa6f13ad7894cedda5f59124e7a6f6f0100a67"
-SRCREV_machine:qemuppc ?= "89811e5148d2a4c925940684ad9126bd08de9799"
-SRCREV_machine:qemuriscv64 ?= "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
-SRCREV_machine:qemuriscv32 ?= "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
-SRCREV_machine:qemux86 ?= "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
-SRCREV_machine:qemux86-64 ?= "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
-SRCREV_machine:qemumips64 ?= "b6dc41bac21f990565fffb211d470fdc97533291"
-SRCREV_machine ?= "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
-SRCREV_meta ?= "dd201eb6ec53179f45836d41610ca68c725d28e2"
+SRCREV_machine:qemuarm ?= "f05eb652ce405932e2f47a78f721d1c2c5859e80"
+SRCREV_machine:qemuarm64 ?= "2f7ef6e4d70eadf8f8b110cd81cfcafb2bb038fb"
+SRCREV_machine:qemuloongarch64 ?= "64e13e9d84c0eb6c16b39081300b49b9862b64f5"
+SRCREV_machine:qemumips ?= "1434d63083252688215ad6f5f6af122ead5865ee"
+SRCREV_machine:qemuppc ?= "fc69e9d8f99c5c151415f6ba9f1e0428bb7e8e84"
+SRCREV_machine:qemuriscv64 ?= "64e13e9d84c0eb6c16b39081300b49b9862b64f5"
+SRCREV_machine:qemuriscv32 ?= "64e13e9d84c0eb6c16b39081300b49b9862b64f5"
+SRCREV_machine:qemux86 ?= "64e13e9d84c0eb6c16b39081300b49b9862b64f5"
+SRCREV_machine:qemux86-64 ?= "64e13e9d84c0eb6c16b39081300b49b9862b64f5"
+SRCREV_machine:qemumips64 ?= "7969f6574cf5b126fa6eb28f33d0f2bcd8e7da5e"
+SRCREV_machine ?= "64e13e9d84c0eb6c16b39081300b49b9862b64f5"
+SRCREV_meta ?= "be02dc16fd11e7575782a0e13db080d122a8989a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d27334b2888c10d2b60c954c59b186182d833107"
+SRCREV_machine:class-devupstream ?= "8b73de7da85fde281a385e0b26eda9bffd3ca477"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.151"
+LINUX_VERSION ?= "6.6.156"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0

