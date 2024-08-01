Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4940BC52D70
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 15:17:58 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.70934.1722525471765879891
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 08:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b5p8tjLF;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7a1d3e93cceso213134585a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722525471; x=1723130271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8N5fyEYqWP2IHyxpVX+tv5EIl2RifRuC/a9xHFZAGB4=;
        b=b5p8tjLF54eaFzsqG86BSqY2//lhl0YGtpLuuzkjjdYPwwuaSHpkU4imOCvbM8BWpl
         nMZBLbnBdRqpMLZ6XCxGyLKn7B+7VoIj7efdHQtEwvrATnItX6Psz4zP1Oe1zEEdId5I
         WHPxKxKc51z3gu7vYmaL0mCr0Z70QOpw6bTaEbWsOHfOop16YHsTBArvKZhmQqbJcLXV
         sB0ThWpowbTnLt+b0OK2siPzCOtrFkC0Nyks/DqpCwvjGuWrGxWz+u0rsGhSyAg3wSLD
         deruWW/KYoJquqwpGVX/eLpukg6giE27LQa8Y3Xv1SIUHgxbKxzSaynhL/v59yii2Ny9
         dH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722525471; x=1723130271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8N5fyEYqWP2IHyxpVX+tv5EIl2RifRuC/a9xHFZAGB4=;
        b=Ze3o83eArtK7RaYnRpOLgg3y6CaQ6iQMmoJ2HV8KG3mF6T6QUUL+u6DojYTHEBsmQK
         UMKvqPQ8cMnx6MJcN4u2ggsOVAwEAZFYPhiwkXAIuRUK7pmxWXhqhQqKRE3b12dPOlfT
         eR/7E6gyWY3b1OOkBv3ZbbdiVisfo10LVpvRZvQTBYO4nassDBLkLf71yxQXM98c3zIA
         C6HTPTXopCym2KyKVwkHgKch64kG5v7LkH0RySArBw/460twgXHhbFzCB9s3hUOCFZrz
         nSWpVNJ79yqBkgaU0h7eemw1Nx39fpjldaNWSw1WyuN1WEJb8QlYqcRRmltw832e09DQ
         jTSQ==
X-Gm-Message-State: AOJu0Yy4KT6bnDgyLfBKcvxfuw9V/5dOHdWbEhFGqXq6FY+rT+We/RJ/
	cIb0iia05Syv47lRjVUI0Yj7gWnn+UyVdoGy9rpk9uetCnQuKcSKENTAktLu
X-Google-Smtp-Source: AGHT+IFBOsfJ9RMfiX+lz41TGf0Ka3xZh9VqP8QsSQ9BTTAvtx8azN/22gF6+RGs6On6Sr/LDc7jUw==
X-Received: by 2002:a05:620a:468b:b0:79f:bd7:d24b with SMTP id af79cd13be357-7a34c01dd48mr244534385a.7.1722525469735;
        Thu, 01 Aug 2024 08:17:49 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d73ee80esm863306085a.70.2024.08.01.08.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:17:48 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/6] linux-yocto/5.10: update to v5.10.216
Date: Thu,  1 Aug 2024 11:17:42 -0400
Message-Id: <20240801151746.3685916-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240801151746.3685916-1-bruce.ashfield@gmail.com>
References: <20240801151746.3685916-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 15:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202753

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    39fbb15b4a74 Linux 5.10.216
    1897993bb8a5 riscv: Disable STACKPROTECTOR_PER_TASK if GCC_PLUGIN_RANDSTRUCT is enabled
    ba7bc80da3cf serial: core: fix kernel-doc for uart_port_unlock_irqrestore()
    16affc4d731b udp: preserve the connected status if only UDP cmsg
    66297b2ceda8 bounds: Use the right number of bits for power-of-two CONFIG_NR_CPUS
    5095b93021b8 HID: i2c-hid: remove I2C_HID_READ_PENDING flag to prevent lock-up
    5fd72404587d i2c: smbus: fix NULL function pointer dereference
    04bf2e5f95c1 riscv: Fix TASK_SIZE on 64-bit NOMMU
    d5cc3498f079 riscv: fix VMALLOC_START definition
    fcdd5bb4a8c8 dma: xilinx_dpdma: Fix locking
    5129f84bc377 idma64: Don't try to serve interrupts when device is powered off
    4d051d6f9c7d dmaengine: owl: fix register access functions
    ab31bc5022b6 tcp: Fix NEW_SYN_RECV handling in inet_twsk_purge()
    74e5e5601df4 tcp: Clean up kernel listener's reqsk in inet_twsk_purge()
    179a890ee4c6 mtd: diskonchip: work around ubsan link failure
    f99de42b80e0 stackdepot: respect __GFP_NOLOCKDEP allocation flag
    c9d5f3b5af8f net: b44: set pause params only when interface is up
    f3a2f186a1cb ethernet: Add helper for assigning packet type when dest address does not match device address
    aa44d2157475 irqchip/gic-v3-its: Prevent double free on error
    5ab19dc55c5e drm/amdgpu: Fix leak when GPU memory allocation fails
    48a92487dbbc drm/amdgpu/sdma5.2: use legacy HDP flush for SDMA2/3
    b2d5ef07dd3c arm64: dts: rockchip: enable internal pull-up for Q7_THRM# on RK3399 Puma
    af6d6a923b40 cpu: Re-enable CPU mitigations by default for !X86 architectures
    30189e54ba80 btrfs: fix information leak in btrfs_ioctl_logical_to_ino()
    6dc5afe8f242 Bluetooth: btusb: Add Realtek RTL8852BE support ID 0x0bda:0x4853
    de657b21099b Bluetooth: Fix type of len in {l2cap,sco}_sock_getsockopt_old()
    087de000e4f8 PM / devfreq: Fix buffer overflow in trans_stat_show
    772a23d60a64 tracing: Increase PERF_MAX_TRACE_SIZE to handle Sentinel1 and docker together
    ffbeb5d4f9df tracing: Show size of requested perf buffer
    98f282c351db net/mlx5e: Fix a race in command alloc flow
    2862578fcdfb Revert "crypto: api - Disallow identical driver names"
    0dc0637e6b16 serial: mxs-auart: add spinlock around changing cts state
    fc955bdebaca serial: core: Provide port lock wrappers
    ae7c8f52aa2a af_unix: Suppress false-positive lockdep splat for spin_lock() in __unix_gc().
    dd0eb1dab929 net: ethernet: ti: am65-cpts: Fix PTPv1 message type on TX packets
    d51037994f5f iavf: Fix TC config comparison with existing adapter TC config
    3a4677b21927 i40e: Report MFS in decimal base instead of hex
    fbbb2404340d i40e: Do not use WQ_MEM_RECLAIM flag for workqueue
    e4bb6da24de3 netfilter: nf_tables: honor table dormant flag from netdev release event path
    857ed800133f mlxsw: spectrum_acl_tcam: Fix memory leak when canceling rehash work
    09846c2309b1 mlxsw: spectrum_acl_tcam: Fix incorrect list API usage
    1d76bd2a0034 mlxsw: spectrum_acl_tcam: Fix warning during rehash
    617e98ba4c50 mlxsw: spectrum_acl_tcam: Fix memory leak during rehash
    3c443a34a0e0 mlxsw: spectrum_acl_tcam: Rate limit error message
    a429a912d6c7 mlxsw: spectrum_acl_tcam: Fix possible use-after-free during rehash
    e24d24874247 mlxsw: spectrum_acl_tcam: Fix possible use-after-free during activity update
    e1ad8eaa80c4 mlxsw: spectrum_acl_tcam: Fix race during rehash delayed work
    35880c3fa6f8 net: openvswitch: Fix Use-After-Free in ovs_ct_exit
    aca5dadab154 ipvs: Fix checksumming on GSO of SCTP packets
    0caff3e6390f net: gtp: Fix Use-After-Free in gtp_dellink
    9bda5e2f62cc net: usb: ax88179_178a: stop lying about skb->truesize
    7da0f91681c4 ipv4: check for NULL idev in ip_route_use_hint()
    c676c68e48e9 NFC: trf7970a: disable all regulators on removal
    6496fadf2a42 mlxsw: core: Unregister EMAD trap using FORWARD action
    e860a8705448 vxlan: drop packets from invalid src-address
    4dc8beb88745 wifi: iwlwifi: mvm: remove old PASN station when adding a new one
    b4a29e183502 ARC: [plat-hsdk]: Remove misplaced interrupt-cells property
    4c7a2f71b5d8 arm64: dts: mediatek: mt2712: fix validation errors
    755703e68dbd arm64: dts: mediatek: mt7622: drop "reset-names" from thermal block
    ed993f7448ae arm64: dts: mediatek: mt7622: fix ethernet controller "compatible"
    819da78e4c7e arm64: dts: mediatek: mt7622: fix IR nodename
    55d07efd38a5 arm64: dts: mediatek: mt7622: fix clock controllers
    136c8e0169df arm64: dts: mediatek: mt7622: introduce nodes for Wireless Ethernet Dispatch
    57ff09043fa1 arm64: dts: mediatek: mt7622: add support for coherent DMA
    f9930871353a arm64: dts: rockchip: Remove unsupported node from the Pinebook Pro dts
    759796d76844 arm64: dts: rockchip: enable internal pull-up on PCIE_WAKE# for RK3399 Puma
    38db853f7c22 arm64: dts: rockchip: fix alphabetical ordering RK3399 puma
    7061c7efbb9e nilfs2: fix OOB in nilfs_set_de_type
    13d76b2f443d nouveau: fix instmem race condition around ptr stores
    1fd7db5c1602 drm/amdgpu: validate the parameters of bo mapping operations more clearly
    2ef607ea1036 init/main.c: Fix potential static_command_line memory overflow
    84bd4c2ae9c3 fs: sysfs: Fix reference leak in sysfs_break_active_protection()
    6401038acfa2 speakup: Avoid crash on very long word
    bf786df6bd83 mei: me: disable RPL-S on SPS and IGN firmwares
    5160b4bd4d8b usb: Disable USB3 LPM at shutdown
    26fde0ea40dd usb: dwc2: host: Fix dereference issue in DDMA completion flow.
    ab92e11b73b4 Revert "usb: cdc-wdm: close race between read and workqueue"
    ba11df453e23 USB: serial: option: add Telit FN920C04 rmnet compositions
    33b29a500750 USB: serial: option: add Rolling RW101-GL and RW135-GL support
    6e7cdfd6c72f USB: serial: option: support Quectel EM060K sub-models
    b5c3eceec209 USB: serial: option: add Lonsung U8300/U9300 product
    e32faa0e9d91 USB: serial: option: add support for Fibocom FM650/FG650
    3366e4fdfea3 USB: serial: option: add Fibocom FM135-GL variants
    ab86cf6f8d24 serial/pmac_zilog: Remove flawed mitigation for rx irq flood
    f15370e31597 comedi: vmk80xx: fix incomplete endpoint checking
    5a7e30d9be7a thunderbolt: Fix wake configurations after device unplug
    e6245ed82248 thunderbolt: Avoid notify PM core about runtime PM resume
    48a1f83ca9c6 binder: check offset alignment in binder_get_object()
    2e212ae0664f x86/cpufeatures: Fix dependencies for GFNI, VAES, and VPCLMULQDQ
    4af115f1a20a clk: Get runtime PM before walking tree during disable_unused
    d339ce273962 clk: Initialize struct clk_core kref earlier
    83e6e77f68e1 clk: Print an info line before disabling unused clocks
    c04fc24403d6 clk: remove extra empty line
    f5591ad6e2d6 clk: Mark 'all_lists' as const
    bde446f16766 clk: Remove prepare_lock hold assertion in __clk_release()
    f3d4f017373b drm/panel: visionox-rm69299: don't unregister DSI device
    097c7918fcfa drm: nv04: Fix out of bounds access
    5ebbbeb2950c RDMA/mlx5: Fix port number for counter query in multi-port configuration
    40c48586234d RDMA/cm: Print the old state when cm_destroy_id gets timeout
    2e45acd12c28 RDMA/rxe: Fix the problem "mutex_destroy missing"
    14cdb43dbc82 tun: limit printing rate when illegal packet received by tun dev
    e3b887a9c11c netfilter: nft_set_pipapo: do not free live element
    934e66e231cf netfilter: nf_tables: Fix potential data-race in __nft_expr_type_get()
    26ebeffff238 Revert "tracing/trigger: Fix to return error if failed to alloc snapshot"
    5062d1f4f07f kprobes: Fix possible use-after-free issue on kprobe registration
    1d9ff61160f0 selftests/ftrace: Limit length in subsystem-enable tests
    9abc3e6f1116 riscv: process: Fix kernel gp leakage
    11a821ee5e57 riscv: Enable per-task stack canaries
    4c5e9eaa7086 btrfs: record delayed inode root in transaction
    c38ea6f1ea2e irqflags: Explicitly ignore lockdep_hrtimer_exit() argument
    85df831dc5c8 x86/apic: Force native_apic_mem_read() to use the MOV instruction
    4979a581c775 selftests: timers: Fix abs() warning in posix_timers test
    30da4180fd76 x86/cpu: Actually turn off mitigations by default for SPECULATION_MITIGATIONS=n
    a75a785dbe5d vhost: Add smp_rmb() in vhost_vq_avail_empty()
    41586487769e drm/client: Fully protect modes[] with dev->mode_config.mutex
    fb9f76b2a22c btrfs: qgroup: correctly model root qgroup rsv in convert
    b43ff1173615 mailbox: imx: fix suspend failue
    5ef15c06ac9e iommu/vt-d: Allocate local memory for page request queue
    b26aa765f743 net: ena: Fix incorrect descriptor free behavior
    c3b3b0c1acb7 net: ena: Wrong missing IO completions check order
    02c42a27742a net: ena: Fix potential sign extension issue
    2e2a03787f4f af_unix: Fix garbage collector racing against connect()
    14bea27d1cc2 af_unix: Do not use atomic ops for unix_sk(sk)->inflight.
    3d90ca9145f6 net/mlx5: Properly link new fs rules into the tree
    cf4bc359b761 netfilter: complete validation of user input
    b0e30c37695b Bluetooth: SCO: Fix not validating setsockopt user input
    3fb02ec57ead ipv6: fix race condition between ipv6_get_ifaddr and ipv6_del_addr
    9e55a650ace2 ipv4/route: avoid unused-but-set-variable warning
    1afc86bcfb18 ipv6: fib: hide unused 'pn' variable
    434aabb6c1a3 octeontx2-af: Fix NIX SQ mode and BP config
    10204df9beda geneve: fix header validation in geneve[6]_xmit_skb
    a82984b3c6a7 xsk: validate user input for XDP_{UMEM|COMPLETION}_FILL_RING
    69fbe5bf3194 u64_stats: fix u64_stats_init() for lockdep when used repeatedly in one file
    583b7b856f7f net: openvswitch: fix unwanted error log on timeout policy probing
    e252fc8279df nouveau: fix function cast warning
    7dc2f7b2c310 media: cec: core: remove length check of Timer Status
    8478394f76c7 Bluetooth: Fix memory leak in hci_req_sync_complete()
    70a8be9dc2fb batman-adv: Avoid infinite loop trying to resize local TT
    e2e4e7b4ae79 Linux 5.10.215
    cea750c99d8f x86/head/64: Re-enable stack protection
    0bdc64e9e716 x86/retpoline: Add NOENDBR annotation to the SRSO dummy return thunk
    85d11ded2d1d scsi: sd: Fix wrong zone_write_granularity value during revalidate
    44900a8bec03 kbuild: dummy-tools: adjust to stricter stackprotector check
    682f6ca96759 VMCI: Fix possible memcpy() run-time warning in vmci_datagram_invoke_guest_handler()
    f7d846acf91b Bluetooth: btintel: Fixe build regression
    fe34587acc99 drm/i915/gt: Reset queue_priority_hint on parking
    c2b2430b48f3 x86/mm/pat: fix VM_PAT handling in COW mappings
    3b29694dde9b virtio: reenable config if freezing device failed
    ada28eb4b956 tty: n_gsm: require CAP_NET_ADMIN to attach N_GSM0710 ldisc
    b58d0ac35f6d netfilter: nf_tables: discard table flag update with pending basechain deletion
    2cee2ff7f8cc netfilter: nf_tables: release mutex after nft_gc_seq_end from abort path
    453c8da7ef6d netfilter: nf_tables: release batch on table validation from abort path
    951838fee462 fbmon: prevent division by zero in fb_videomode_from_videomode()
    c6e0de1e07aa drivers/nvme: Add quirks for device 126f:2262
    19536fe42003 fbdev: viafb: fix typo in hw_bitblt_1 and hw_bitblt_2
    e9efe31e6baf usb: sl811-hcd: only defined function checkdone if QUIRK2 is defined
    8406161fbeb9 usb: typec: tcpci: add generic tcpci fallback compatible
    e0184c95aaf1 tools: iio: replace seekdir() in iio_generic_buffer
    91698804bbee ring-buffer: use READ_ONCE() to read cpu_buffer->commit_page in concurrent environment
    694b7fa79e26 ktest: force $buildonly = 1 for 'make_warnings_file' test type
    804ed6c3aca2 platform/x86: touchscreen_dmi: Add an extra entry for a variant of the Chuwi Vi8 tablet
    95bd7e317d6c Input: allocate keycode for Display refresh rate toggle
    d4b856aaaaea RDMA/cm: add timeout to cm_destroy_id wait
    b0cb5564c3e8 block: prevent division by zero in blk_rq_stat_sum()
    d2341dc41a96 libperf evlist: Avoid out-of-bounds access
    5e0a89c49f05 Revert "ACPI: PM: Block ASUS B1400CEAE from suspend to idle by default"
    4b676584d02e SUNRPC: increase size of rpc_wait_queue.qlen from unsigned short to unsigned int
    0b5668a87caa drm/amd/display: Fix nanosec stat overflow
    48882b489f90 ext4: forbid commit inconsistent quota data when errors=remount-ro
    6545e1307a1e ext4: add a hint for block bitmap corrupt state in mb_groups
    2fef0059859c media: sta2x11: fix irq handler cast
    bd12d39aaf8f isofs: handle CDs with bad root inode but good Joliet root directory
    c473288f27d1 scsi: lpfc: Fix possible memory leak in lpfc_rcv_padisc()
    674c1c4229e7 sysv: don't call sb_bread() with pointers_lock held
    94b01bdf49b9 pinctrl: renesas: checker: Limit cfg reg enum checks to provided IDs
    fd238540fb1a Input: synaptics-rmi4 - fail probing if memory allocation for "phys" fails
    86e9b47e8a75 Bluetooth: btintel: Fix null ptr deref in btintel_read_version
    bc4d1ebca11b net/smc: reduce rtnl pressure in smc_pnet_create_pnetids_list()
    4720d590c4cb btrfs: send: handle path ref underflow in header iterate_inode_ref()
    0002df7380ba btrfs: export: handle invalid inode or root reference in btrfs_get_parent()
    87299cdaae75 btrfs: handle chunk tree lookup error in btrfs_relocate_sys_chunks()
    a2e43c53b885 tools/power x86_energy_perf_policy: Fix file leak in get_pkg_num()
    98e2b97acb87 pstore/zone: Add a null pointer check to the psz_kmsg_read
    a3cd11046393 ionic: set adminq irq affinity
    bd365f064452 arm64: dts: rockchip: fix rk3399 hdmi ports node
    3ea4717296c9 arm64: dts: rockchip: fix rk3328 hdmi ports node
    5b71a921dbe7 panic: Flush kernel log buffer at the end
    ad78c5047dc4 VMCI: Fix memcpy() run-time warning in dg_dispatch_as_host()
    46e219d886a3 wifi: ath9k: fix LNA selection in ath_ant_try_scan()
    1a038ea9f9cc objtool: Add asm version of STACK_FRAME_NON_STANDARD
    bb5fb12c50d9 x86/cpufeatures: Add CPUID_LNX_5 to track recently added Linux-defined word
    c137ee44c57a mptcp: don't account accept() of non-MPC client as fallback to TCP
    aae6464684fb x86/retpoline: Do the necessary fixup to the Zen3/4 srso return thunk for !SRSO
    f5e9b93fbe70 x86/bugs: Fix the SRSO mitigation on Zen3/4
    2cba2ba2a884 riscv: Fix spurious errors from __get/put_kernel_nofault
    9fd381feafa5 s390/entry: align system call table on 8 bytes
    f5e65b782f3e x86/mce: Make sure to grab mce_sysfs_mutex in set_bank()
    3127b2ee50c4 of: dynamic: Synchronize of_changeset_destroy() with the devlink removals
    7f62d985e94e driver core: Introduce device_link_wait_removal()
    976b0215f6c5 ALSA: hda/realtek: Update Panasonic CF-SZ6 quirk to support headset with microphone
    75c3348796d7 ata: sata_mv: Fix PCI device ID table declaration compilation warning
    ca2229553510 scsi: mylex: Fix sysfs buffer lengths
    dff4cd7de1f3 ata: sata_sx4: fix pdc20621_get_from_dimm() on 64-bit
    aa5936f5ec83 ASoC: ops: Fix wraparound for mask in snd_soc_get_volsw
    21d2994c743b arm64: dts: qcom: sc7180-trogdor: mark bluetooth address as broken
    a6186caf176a arm64: dts: qcom: sc7180: Remove clock for bluetooth on Trogdor
    ae5f35ff244c net: ravb: Always process TX descriptor ring
    3391b157780b udp: do not accept non-tunnel GSO skbs landing in a tunnel
    43183be84aa9 Revert "usb: phy: generic: Get the vbus supply"
    00810a246402 scsi: qla2xxx: Update manufacturer detail
    20414bdc3294 scsi: qla2xxx: Update manufacturer details
    b8e82128b44f i40e: fix vf may be used uninitialized in this function warning
    a88765b0a591 i40e: fix i40e_count_filters() to count only active/new filters
    6ebcf688ae90 octeontx2-pf: check negative error code in otx2_open()
    360edeb6216f udp: do not transition UDP GRO fraglist partial checksums to unnecessary
    fd307f2d91d4 ipv6: Fix infinite recursion in fib6_dump_done().
    ed2bdbf5d280 selftests: reuseaddr_conflict: add missing new line at the end of the output
    b14b9f9503ec erspan: make sure erspan_base_hdr is present in skb->head
    42852763a0fc net: stmmac: fix rx queue priority assignment
    5e45dc440885 net/sched: act_skbmod: prevent kernel-infoleak
    dd54b48db0c8 bpf, sockmap: Prevent lock inversion deadlock in map delete elem
    aedc6cfb7147 vboxsf: Avoid an spurious warning if load_nls_xxx() fails
    0f038242b77d netfilter: validate user input for expected length
    940d41caa71f netfilter: nf_tables: Fix potential data-race in __nft_flowtable_type_get()
    46c4481938e2 netfilter: nf_tables: flush pending destroy work before exit_net release
    7b6fba691871 netfilter: nf_tables: reject new basechain after table flag update
    8f6dfa1f1efe block: add check that partition length needs to be aligned with block size
    e7ea043bc3f1 x86/srso: Add SRSO mitigation for Hygon processors
    af47e6a95eb7 mm, vmscan: prevent infinite loop for costly GFP_NOIO | __GFP_RETRY_MAYFAIL allocations
    a15bcaa75d90 Revert "x86/mm/ident_map: Use gbpages only where full GB page should be mapped."
    1eff09acc808 io_uring: ensure '0' is returned on file registration success
    a563fc18583c vfio/fsl-mc: Block calling interrupt handler without trigger
    09452c8fcbd7 vfio/platform: Create persistent IRQ handlers
    27d40bf72dd9 vfio/pci: Create persistent INTx handler
    d6f77b5e4785 vfio: Introduce interface to flush virqfd inject workqueue
    3dd9be6cb55e vfio/pci: Lock external INTx masking ops
    561d5e1998d5 vfio/pci: Disable auto-enable of exclusive INTx IRQ
    cfb786b03b03 net/rds: fix possible cp null dereference
    6f3ae02bbb62 netfilter: nf_tables: disallow timeout for anonymous sets
    e47088075477 Bluetooth: Fix TOCTOU in HCI debugfs implementation
    71605692819b Bluetooth: hci_event: set the conn encrypted before conn establishes
    89583ff143c2 x86/cpufeatures: Add new word for scattered features
    77a82b961177 r8169: fix issue caused by buggy BIOS on certain boards with RTL8168d
    e4be2df1b1b0 dm integrity: fix out-of-range warning
    c58306690998 Octeontx2-af: fix pause frame configuration in GMP mode
    9970e059af47 bpf: Protect against int overflow for stack access size
    e8ed357a6f4a ACPICA: debugger: check status of acpi_evaluate_object() in acpi_db_walk_for_fields()
    e3e27d2b446d tcp: properly terminate timers for kernel sockets
    10b1273d8a10 ixgbe: avoid sleeping allocation in ixgbe_ipsec_vf_add_sa()
    755e53bbc61b nfc: nci: Fix uninit-value in nci_dev_up and nci_ntf_packet
    e451709573f8 USB: core: Fix deadlock in usb_deauthorize_interface()
    bb22d3689e04 scsi: lpfc: Correct size for wqe for memset()
    f49642661fe5 PCI/DPC: Quirk PIO log size for Intel Ice Lake Root Ports
    34a81f5259b9 x86/cpu: Enable STIBP on AMD if Automatic IBRS is enabled
    72ba168746d8 scsi: qla2xxx: Delay I/O Abort on PCI error
    67b2d35853c2 scsi: qla2xxx: Fix command flush on cable pull
    a56b2033f152 scsi: qla2xxx: Split FCE|EFT trace control
    db0f08a6b60b usb: typec: ucsi: Clear UCSI_CCI_RESET_COMPLETE before reset
    e9042f4e71f0 usb: typec: ucsi: Ack unsupported commands
    3e944ddc17c0 usb: udc: remove warning when queue disabled ep
    fd84c4eb4dbc usb: dwc2: gadget: LPM flow fix
    db4fa0c8e811 usb: dwc2: host: Fix ISOC flow in DDMA mode
    85ebae7707a6 usb: dwc2: host: Fix hibernation flow
    c63869e99026 usb: dwc2: host: Fix remote wakeup from hibernation
    8e047bc5a5c5 USB: core: Add hub_get() and hub_put() routines
    6f4953255bbc staging: vc04_services: fix information leak in create_component()
    3be3809b5d9d staging: vc04_services: changen strncpy() to strscpy_pad()
    5c2386ba80e7 scsi: core: Fix unremoved procfs host directory regression
    aa39e6878f61 ALSA: sh: aica: reorder cleanup operations to avoid UAF bugs
    9b319f4a8809 usb: cdc-wdm: close race between read and workqueue
    6d9395ba7f85 net: ll_temac: platform_get_resource replaced by wrong function
    2b539c88940e mmc: core: Avoid negative index with array access
    bce3a98352ea mmc: core: Initialize mmc_blk_ioc_data
    51c99c6795c1 hexagon: vmlinux.lds.S: handle attributes section
    73b3ea467331 exec: Fix NOMMU linux_binprm::exec in transfer_args_to_stack()
    e8b067c4058c wifi: mac80211: check/clear fast rx for non-4addr sta VLAN changes
    f8f76b757407 init: open /initrd.image with O_LARGEFILE
    2e5fe7403487 mm/migrate: set swap entry values of THP tail pages properly.
    38753f1adaf5 mm/memory-failure: fix an incorrect use of tail pages
    4e37416e4ee1 serial: sc16is7xx: convert from _raw_ to _noinc_ regmap functions for FIFO
    9c5f4014f6d1 powerpc: xor_vmx: Add '-mhard-float' to CFLAGS
    f33255ccbb0f efivarfs: Request at most 512 bytes for variable names
    33414e560f03 perf/core: Fix reentry problem in perf_output_read_group()
    91cf85f75375 KVM/x86: Export RFDS_NO and RFDS_CLEAR to guests
    66d5260fc7d5 x86/rfds: Mitigate Register File Data Sampling (RFDS)
    5fbd9f6c3953 Documentation/hw-vuln: Add documentation for RFDS
    6e04cae36b8f x86/mmio: Disable KVM mitigation when X86_FEATURE_CLEAR_CPU_BUF is set
    b9a97767c6be KVM/VMX: Move VERW closer to VMentry for MDS mitigation
    52aad34ee36f KVM/VMX: Use BT+JNC, i.e. EFLAGS.CF to select VMRESUME vs. VMLAUNCH
    6192d9ed311f x86/bugs: Use ALTERNATIVE() instead of mds_user_clear static key
    50f021f0b985 x86/entry_32: Add VERW just before userspace transition
    edc702b4a820 x86/entry_64: Add VERW just before userspace transition
    35e36eac881c x86/bugs: Add asm helpers for executing VERW
    8b20c6f894b7 x86/asm: Add _ASM_RIP() macro for x86-64 (%rip) suffix
    b42235849005 btrfs: allocate btrfs_ioctl_defrag_range_args on stack
    3377090b810c printk: Update @console_may_schedule in console_trylock_spinning()
    0fc88aeb2e32 xen/events: close evtchn after mapping cleanup
    bc40ded92af5 tee: optee: Fix kernel panic caused by incorrect error handling
    94eb0293703c fs/aio: Check IOCB_AIO_RW before the struct aio_kiocb conversion
    1ce408f75ccf vt: fix unicode buffer corruption when deleting characters
    28924c43ce61 mei: me: add arrow lake point H DID
    4ba385d29e03 mei: me: add arrow lake point S DID
    bb664ed988a0 tty: serial: fsl_lpuart: avoid idle preamble pending if CTS is enabled
    1d14247972dd usb: port: Don't try to peer unused USB ports based on location
    ef846cdbd100 usb: gadget: ncm: Fix handling of zero block length packets
    284fb1003d5d USB: usb-storage: Prevent divide-by-0 error in isd200_ata_command
    24427b02bf81 ALSA: hda/realtek - Fix headset Mic no show at resume back for Lenovo ALC897 platform
    2d13b79640b1 KVM: SVM: Flush pages under kvm->lock to fix UAF in svm_register_enc_region()
    6406c55fdc26 xfrm: Avoid clang fortify warning in copy_to_user_tmpl()
    d2951b72ea47 Drivers: hv: vmbus: Calculate ring buffer size for more efficient use of memory
    2863e2f062cc netfilter: nf_tables: reject constant set with timeout
    fe40ffbca19d netfilter: nf_tables: disallow anonymous set with timeout flag
    e2d45f467096 netfilter: nf_tables: mark set as dead when unbinding anonymous set with timeout
    449b8bdcde9f cpufreq: brcmstb-avs-cpufreq: fix up "add check for cpufreq_cpu_get's return value"
    ac816bbb10fe comedi: comedi_test: Prevent timers rescheduling during deletion
    d430e298549b scripts: kernel-doc: Fix syntax error due to undeclared args variable
    d0838b072931 x86/pm: Work around false positive kmemleak report in msr_build_context()
    f5948717323a x86/stackprotector/32: Make the canary into a regular percpu variable
    6d22547437f1 vxge: remove unnecessary cast in kfree()
    9759ff196e7d dm snapshot: fix lockup in dm_exception_table_exit
    b074a76cbd2c drm/amd/display: Fix noise issue on HDMI AV mute
    1a77ee0f0695 drm/amd/display: Return the correct HDCP error code
    2f8329154384 ahci: asm1064: asm1166: don't limit reported ports
    ce4c5d278727 ahci: asm1064: correct count of reported ports
    493aa6bdcffd wireguard: netlink: access device through ctx instead of peer
    f52be46e3e6e wireguard: netlink: check for dangling peer via is_dead instead of empty list
    ec5098d4c88b net: hns3: tracing: fix hclgevf trace event strings
    bce7345ee0b5 x86/CPU/AMD: Update the Zenbleed microcode revisions
    224ec95f6397 cpufreq: dt: always allocate zeroed cpumask
    f0fe7ad5aff4 nilfs2: prevent kernel bug at submit_bh_wbc()
    c3b5c5c31e72 nilfs2: fix failure to detect DAT corruption in btree and direct mappings
    7607860ae4dd memtest: use {READ,WRITE}_ONCE in memory scanning
    c734f9c19896 drm/vc4: hdmi: do not return negative values from .get_modes()
    51c519d79fd0 drm/imx/ipuv3: do not return negative values from .get_modes()
    a8cb3b072403 drm/exynos: do not return negative values from .get_modes()
    9aaa60f35b89 drm/panel: do not return negative error codes from drm_panel_get_modes()
    6470078ab3d8 s390/zcrypt: fix reference counting on zcrypt card objects
    32edca2f03a6 soc: fsl: qbman: Use raw spinlock for cgr_lock
    39ed969a7a54 soc: fsl: qbman: Add CGR update function
    c542f3a70521 soc: fsl: qbman: Add helper for sanity checking cgr ops
    dd199e5b759f soc: fsl: qbman: Always disable interrupts when taking cgr_lock
    47ad5c133ed5 ring-buffer: Fix full_waiters_pending in poll
    616a78bd682e ring-buffer: Fix resetting of shortest_full
    756934d840a6 ring-buffer: Do not set shortest_full when full target is hit
    3d4873cf80c6 ring-buffer: Fix waking up ring buffer readers
    ad68ce493616 vfio/platform: Disable virqfds on cleanup
    ef73db1cc885 PCI: dwc: endpoint: Fix advertised resizable BAR size
    70077e0af5cf kbuild: Move -Wenum-{compare-conditional,enum-conversion} into W=1
    4595d90b5d2e nfs: fix UAF in direct writes
    7e55155db07b PCI/AER: Block runtime suspend when handling errors
    648906b645f4 PCI/ERR: Clear AER status only when we control AER
    bb317bba5bd3 speakup: Fix 8bit characters from direct synth
    92eac4c00d9d usb: gadget: tegra-xudc: Fix USB3 PHY retrieval logic
    a799864b9e70 usb: gadget: tegra-xudc: Use dev_err_probe()
    350aeb14aac9 phy: tegra: xusb: Add API to retrieve the port number of phy
    0213b8bf7167 slimbus: core: Remove usage of the deprecated ida_simple_xx() API
    b45970fc0ad7 nvmem: meson-efuse: fix function pointer type mismatch
    e8e8b1973172 ext4: fix corruption during on-line resize
    89bc7ed7400e hwmon: (amc6821) add of_match table
    37005a1b8585 drm/etnaviv: Restore some id values
    a1d62c0651c5 mmc: core: Fix switch on gp3 partition
    d85c11c97ecf mm: swap: fix race between free_swap_and_cache() and swapoff()
    068ab2759bc0 mac802154: fix llsec key resources release in mac802154_llsec_key_del
    1302344f8abf dm-raid: fix lockdep waring in "pers->hot_add_disk"
    b07326747952 Revert "Revert "md/raid5: Wait for MD_SB_CHANGE_PENDING in raid5d""
    be7f399e3ffd PCI/DPC: Quirk PIO log size for Intel Raptor Lake Root Ports
    a654d0a1863b PCI/DPC: Quirk PIO log size for certain Intel Root Ports
    51411a4d0a8b PCI/ASPM: Make Intel DG2 L1 acceptable latency unlimited
    81d9ca159791 PCI: Work around Intel I210 ROM BAR overlap defect
    619013d79739 PCI: Cache PCIe Device Capabilities register
    1f5ea9e3aeea PCI/ERR: Cache RCEC EA Capability offset in pci_init_capabilities()
    bbe068b24409 PCI/PM: Drain runtime-idle callbacks before driver removal
    39f7310eaa79 PCI: Drop pci_device_remove() test of pci_dev->driver
    d2a970972800 btrfs: fix off-by-one chunk length calculation at contains_pending_extent()
    d7800338a208 serial: Lock console when calling into driver before registration
    590326a5d466 printk/console: Split out code that enables default console
    a0e8272533cd usb: typec: ucsi: Clean up UCSI_CABLE_PROP macros
    c71ac0596ebf fuse: don't unhash root
    853f0c0d34be fuse: fix root lookup with nonzero generation
    ab166a9445bc mmc: tmio: avoid concurrent runs of mmc_request_done()
    40dda0548655 PM: sleep: wakeirq: fix wake irq warning in system suspend
    ad5b7fc6a7b5 USB: serial: cp210x: add pid/vid for TDK NC0110013M and MM0110113M
    fec4dea54d71 USB: serial: option: add MeiG Smart SLM320 product
    76b4979096d4 USB: serial: cp210x: add ID for MGP Instruments PDS100
    cc235a4b8a7f USB: serial: add device ID for VeriFone adapter
    dccd649747f4 USB: serial: ftdi_sio: add support for GMC Z216C Adapter IR-USB
    a51a65d33ef3 powerpc/fsl: Fix mfpmr build errors with newer binutils
    3ff4a0f6a8f0 clk: qcom: mmcc-msm8974: fix terminating of frequency table arrays
    a09aecb6cb48 clk: qcom: mmcc-apq8084: fix terminating of frequency table arrays
    851cc19bdb02 clk: qcom: gcc-ipq8074: fix terminating of frequency table arrays
    ae60e3342296 clk: qcom: gcc-ipq6018: fix terminating of frequency table arrays
    0aa06ebe69bd PM: suspend: Set mem_sleep_current during kernel command line setup
    47cad45f8bd6 parisc: Strip upper 32 bit of sum in csum_ipv6_magic for 64-bit builds
    d4a20501ddbe parisc: Fix csum_ipv6_magic on 64-bit systems
    2a318f10d412 parisc: Fix csum_ipv6_magic on 32-bit systems
    27b0db8def1f parisc: Fix ip_fast_csum
    8b8019f9d76e parisc: Avoid clobbering the C/B bits in the PSW with tophys and tovirt macros
    c2f8af101ce2 mtd: rawnand: meson: fix scrambling mode value in command macro
    7a9337af5ba0 ubi: correct the calculation of fastmap size
    0a16a633a208 ubi: Check for too small LEB size in VTBL code
    8f599ab6fabb ubifs: Set page uptodate in the correct place
    a276c595c3a6 fat: fix uninitialized field in nostale filehandles
    83a2275f9d32 bounds: support non-power-of-two CONFIG_NR_CPUS
    96661f8c3d5f block: Clear zone limits for a non-zoned stacked queue
    6b4bb49e3418 block: introduce zone_write_granularity limit
    0eb348f4d736 ext4: correct best extent lstart adjustment logic
    8f5dfcbf962d selftests/mqueue: Set timeout to 180 seconds
    d03092550f52 crypto: qat - resolve race condition during AER recovery
    02fa834fb427 crypto: qat - fix double free during reset
    6796844c054f sparc: vDSO: fix return value of __setup handler
    308b721d69e4 sparc64: NMI watchdog: fix return value of __setup handler
    f8730d6335e5 KVM: Always flush async #PF workqueue when vCPU is being destroyed
    7936e5c8da5b media: xc4000: Fix atomicity violation in xc4000_get_frequency
    c45e53c27b78 serial: max310x: fix NULL pointer dereference in I2C instantiation
    c560327d900b drm/vmwgfx: Fix possible null pointer derefence with invalid contexts
    675ebda69c5a drm/vmwgfx: Fix some static checker warnings
    dc7cd107cef3 drm/vmwgfx/vmwgfx_cmdbuf_res: Remove unused variable 'ret'
    b6fc792bf8f2 drm/vmwgfx: switch over to the new pin interface v2
    1502b87c652a drm/vmwgfx: stop using ttm_bo_create v2
    7f0de642acd9 arm: dts: marvell: Fix maxium->maxim typo in brownstone dts
    fbda83d03fd4 smack: Handle SMACK64TRANSMUTE in smack_inode_setsecurity()
    a354d9e3b66c smack: Set SMACK64TRANSMUTE only for dirs in smack_inode_setxattr()
    1c18c1541f53 clk: qcom: gcc-sdm845: Add soft dependency on rpmhpd
    b3afaa407d76 media: staging: ipu3-imgu: Set fields before media_entity_pads_init()
    bacb8c3ab86d wifi: brcmfmac: Fix use-after-free bug in brcmf_cfg80211_detach
    d8166e8adb7f timers: Rename del_timer_sync() to timer_delete_sync()
    fa576cdd4d24 timers: Use del_timer_sync() even on UP
    127dbb3d8be8 timers: Update kernel-doc for various functions
    6487fb01b7ee x86/bugs: Use sysfs_emit()
    d3084b03098a x86/cpu: Support AMD Automatic IBRS
    2c1a50493189 Documentation/hw-vuln: Update spectre doc
    fcbd99b3c733 amdkfd: use calloc instead of kzalloc to avoid integer overflow
    dfa382591091 Linux 5.10.214
    5148026b65ca remoteproc: stm32: fix phys_addr_t format string
    a943eb828364 regmap: Add missing map->bus check
    bcfcdf196980 spi: spi-mt65xx: Fix NULL pointer access in interrupt handler
    6c46d680e4b3 bpf: report RCU QS in cpumap kthread
    aad6bb260beb rcu: add a helper to report consolidated flavor QS
    fcf32a5bfcb8 netfilter: nf_tables: do not compare internal table flags on updates
    096245bb7f9d ARM: dts: sun8i-h2-plus-bananapi-m2-zero: add regulator nodes vcc-dram and vcc1v2
    f205ed8d9ead scsi: fc: Update formal FPIN descriptor definitions
    b36b83297ff4 netfilter: nft_set_pipapo: release elements in clone only from destroy path
    766c2627acb2 octeontx2-af: Use separate handlers for interrupts
    8eebff95ce95 net/bnx2x: Prevent access to a freed page in page_pool
    f6c6ca618e93 hsr: Handle failures in module init
    1e1e4316fcae rds: introduce acquire/release ordering in acquire/release_in_xmit()
    f87884e0dffd wireguard: receive: annotate data-race around receiving_counter.counter
    d0ab075e34b5 net: dsa: mt7530: prevent possible incorrect XTAL frequency selection
    68e84120319d packet: annotate data-races around ignore_outgoing
    7fb2d4d6bb1c hsr: Fix uninit-value access in hsr_get_node()
    cdff6144b04b soc: fsl: dpio: fix kcalloc() argument order
    76d1394d9b07 s390/vtime: fix average steal time calculation
    ce061bf4eff9 octeontx2-af: Use matching wake_up API variant in CGX command interface
    2ddc931ccca2 io_uring: don't save/restore iowait state
    ed71e73693fe usb: gadget: net2272: Use irqflags in the call to net2272_probe_fin
    745c27184be3 staging: greybus: fix get_channel_from_mode() failure path
    a4d503856a91 serial: 8250_exar: Don't remove GPIO device on suspend
    864f17c1347a rtc: mt6397: select IRQ_DOMAIN instead of depending on it
    87ddba29e72b kconfig: fix infinite loop when expanding a macro at the end of file
    1639e9c7a3ae tty: serial: samsung: fix tx_empty() to return TIOCSER_TEMT
    1eb9ab1f9f20 serial: max310x: fix syntax error in IRQ error message
    6199e1942e0d tty: vt: fix 20 vs 0x20 typo in EScsiignore
    40260d06497d remoteproc: stm32: Fix incorrect type assignment returned by stm32_rproc_get_loaded_rsc_tablef
    0dd5b63ae2b5 remoteproc: stm32: Fix incorrect type in assignment for va
    f0b0a4de789d remoteproc: stm32: use correct format strings on 64-bit
    9d057eacf804 remoteproc: stm32: Move resource table setup to rproc_ops
    7b9547204985 remoteproc: Add new get_loaded_rsc_table() to rproc_ops
    1d7e9bc40abb remoteproc: stm32: Constify st_rproc_ops
    b94f434fe977 afs: Revert "afs: Hide silly-rename files from userspace"
    b8c52f7d08f1 NFS: Fix an off by one in root_nfs_cat()
    32903ecf21ab watchdog: stm32_iwdg: initialize default timeout
    916ee6deae6f NFSv4.2: fix listxattr maximum XDR buffer size
    4403438eaca6 NFSv4.2: fix nfs4_listxattr kernel BUG at mm/usercopy.c:102
    84ec5c0a7fab net: sunrpc: Fix an off by one in rpc_sockaddr2uaddr()
    a2b74f35eea3 scsi: bfa: Fix function pointer type mismatch for hcb_qe->cbfn
    11adfabee1ae RDMA/device: Fix a race between mad_client and cm_client init
    3ac85382bcfb scsi: csiostor: Avoid function pointer casts
    6370d070e235 f2fs: compress: fix to check unreleased compressed cluster
    bdd895e0190c RDMA/srpt: Do not register event handler until srpt device is fully setup
    5cd466673b34 ALSA: usb-audio: Stop parsing channels bits when all channels are found.
    4266f6e72620 ALSA: hda/realtek: fix ALC285 issues on HP Envy x360 laptops
    239174535dba clk: Fix clk_core_get NULL dereference
    e55a6014631b sparc32: Fix section mismatch in leon_pci_grpci
    6ec49d07905c backlight: lp8788: Fully initialize backlight_properties during probe
    ad70a7888e8e backlight: lm3639: Fully initialize backlight_properties during probe
    f3bd1e36f0ae backlight: da9052: Fully initialize backlight_properties during probe
    f58ce2bed9d8 backlight: lm3630a: Don't set bl->props.brightness in get_brightness
    fc43d668c98b backlight: lm3630a: Initialize backlight_properties on init
    97b397aa3f80 leds: sgm3140: Add missing timer cleanup and flash gpio control
    b9040d5746c0 leds: aw2013: Unlock mutex before destroying it
    72f9bf6ddbb3 powerpc/embedded6xx: Fix no previous prototype for avr_uart_send() etc.
    cfb3a57e7bbc drm/msm/dpu: add division of drm_display_mode's hskew parameter
    fd639cb8fa57 powerpc/hv-gpci: Fix the H_GET_PERF_COUNTER_INFO hcall return value checks
    4688be96d20f drm/mediatek: Fix a null pointer crash in mtk_drm_crtc_finish_page_flip
    6c5a15622ead media: mediatek: vcodec: avoid -Wcast-function-type-strict warning
    910363473e4b media: ttpci: fix two memleaks in budget_av_attach
    b49fe84c6cef media: go7007: fix a memleak in go7007_load_encoder
    fb07104a02e8 media: dvb-frontends: avoid stack overflow warnings with clang
    ab896d93fd6a media: pvrusb2: fix uaf in pvr2_context_set_notify
    1c5620f99ad8 drm/amdgpu: Fix missing break in ATOM_ARG_IMM Case of atom_get_src_int()
    24d71c7e46b4 ASoC: meson: axg-tdm-interface: add frame rate constraint
    4bc8e7f3a129 ASoC: meson: axg-tdm-interface: fix mclk setup without mclk-fs
    fe9796edda93 mtd: rawnand: lpc32xx_mlc: fix irq handler prototype
    2c8a6d2bef2f mtd: maps: physmap-core: fix flash size larger than 32-bit
    858839c64b92 drm/tidss: Fix initial plane zpos values
    9e42bebd4bef crypto: arm/sha - fix function cast warnings
    9883ac689493 mfd: altera-sysmgr: Call of_node_put() only when of_parse_phandle() takes a ref
    df6924449fc9 mfd: syscon: Call of_node_put() only when of_parse_phandle() takes a ref
    bd5f2747e3e0 drm/tegra: put drm_gem_object ref on error in tegra_fb_create
    2d476959f263 clk: hisilicon: hi3519: Release the correct number of gates in hi3519_clk_unregister()
    7057b8fa7695 PCI: Mark 3ware-9650SE Root Port Extended Tags as broken
    792e6428597a drm/mediatek: dsi: Fix DSI RGB666 formats and definitions
    85e2d9166095 clk: qcom: dispcc-sdm845: Adjust internal GDSC wait times
    0680a58e2d11 media: pvrusb2: fix pvr2_stream_callback casts
    964f45a7840a media: pvrusb2: remove redundant NULL check
    1f8d45cd0e9f media: go7007: add check of return value of go7007_read_addr()
    5d9fe604bf9b media: imx: csc/scaler: fix v4l2_ctrl_handler memory leak
    c753ca1e5a07 media: sun8i-di: Fix chroma difference threshold
    6b5791c54084 media: sun8i-di: Fix power on/off sequences
    d2f806664c18 media: sun8i-di: Fix coefficient writes
    47588154b10e ASoC: meson: t9015: fix function pointer type mismatch
    3df9cd610b05 ASoC: meson: aiu: fix function pointer type mismatch
    ac85b842418f ASoC: meson: Use dev_err_probe() helper
    bae8577ea7ba perf stat: Avoid metric-only segv
    eca94a4b07cc ALSA: seq: fix function cast warnings
    33a44d8759f1 drm/radeon/ni: Fix wrong firmware size logging in ni_init_microcode()
    89526d7728e2 perf thread_map: Free strlist on normal path in thread_map__new_by_tid_str()
    8a01335aedc5 crypto: xilinx - call finalize with bh disabled
    38e61b751113 PCI: switchtec: Fix an error handling path in switchtec_pci_probe()
    ca1cd5605a77 quota: Fix rcu annotations of inode dquot pointers
    61380537aa6d quota: Fix potential NULL pointer dereference
    00684e932839 quota: simplify drop_dquot_ref()
    2e005642a680 clk: qcom: reset: Ensure write completion on reset de/assertion
    b30800467c71 clk: qcom: reset: Commonize the de/assert functions
    160095aadafe pinctrl: mediatek: Drop bogus slew rate register range for MT8192
    096237039d00 media: edia: dvbdev: fix a use-after-free
    afd2a82fe300 media: v4l2-mem2mem: fix a memleak in v4l2_m2m_register_entity
    94303a06e185 media: v4l2-tpg: fix some memleaks in tpg_alloc
    19cb33fa22a2 media: em28xx: annotate unchecked call to media_device_register()
    892d955f8e0a perf evsel: Fix duplicate initialization of data->id in evsel__parse_sample()
    330caa061af5 drm/amd/display: Fix potential NULL pointer dereferences in 'dcn10_set_output_transfer_func()'
    ff28893c96c5 drm/amd/display: Fix a potential buffer overflow in 'dp_dsc_clock_en_read()'
    53dea95c23f7 HID: lenovo: Add middleclick_workaround sysfs knob for cptkbd
    7007354d0caf perf record: Fix possible incorrect free in record__switch_output()
    ed2be47b8dfb PCI/DPC: Print all TLP Prefixes, not just the first
    610f20e5cf35 media: tc358743: register v4l2 async device only after successful setup
    2c58c4dda2f3 dmaengine: tegra210-adma: Update dependency to ARCH_TEGRA
    f2e80ac9344a drm/lima: fix a memleak in lima_heap_alloc
    e0d4850ecd8d drm/rockchip: lvds: do not print scary message when probing defer
    375a60fce4e6 drm/rockchip: lvds: do not overwrite error code
    2cb881069e31 drm: Don't treat 0 as -1 in drm_fixp2int_ceil
    fbb37b397733 drm/rockchip: inno_hdmi: Fix video timing
    b7a82cfb85e2 drm/tegra: output: Fix missing i2c_put_adapter() in the error handling paths of tegra_output_probe()
    f95401a50921 drm/tegra: dsi: Fix missing pm_runtime_disable() in the error handling path of tegra_dsi_probe()
    317155c5fac0 drm/tegra: dsi: Fix some error handling paths in tegra_dsi_probe()
    0e8c9283e5e7 drm/tegra: dsi: Make use of the helper function dev_err_probe()
    92003981a6df drm/tegra: dsi: Add missing check for of_find_device_by_node
    f89bd2770937 dm: call the resume method on internal suspend
    94a6a9cfbfbb dm raid: fix false positive for requeue needed during reshape
    928705e34101 nfp: flower: handle acti_netdevs allocation failure
    e9b72f729db4 net/x25: fix incorrect parameter validation in the x25_getsockopt() function
    3627f21b9e38 net: kcm: fix incorrect parameter validation in the kcm_getsockopt) function
    03c74f548f94 udp: fix incorrect parameter validation in the udp_lib_getsockopt() function
    b42e56435846 l2tp: fix incorrect parameter validation in the pppol2tp_getsockopt() function
    5a98fa3332b1 ipmr: fix incorrect parameter validation in the ip_mroute_getsockopt() function
    8693e3cf0c96 bpf: net: Change do_ip_getsockopt() to take the sockptr_t argument
    415edd2d661c net/ipv4/ipv6: Replace one-element arraya with flexible-array members
    7394669d5987 net/ipv4: Revert use of struct_size() helper
    1ebd0d898fae net/ipv4: Replace one-element array with flexible-array member
    c8059876317a tcp: fix incorrect parameter validation in the do_tcp_getsockopt() function
    1f6244e9954e OPP: debugfs: Fix warning around icc_get_name()
    6cf2e53315a1 net: phy: dp83822: Fix RGMII TX delay configuration
    c44a5aa4bef7 net: phy: DP83822: enable rgmii mode if phy_interface_is_rgmii
    a352d039ffa2 net: hns3: fix port duplex configure error in IMP reset
    06dd21045a7e net: phy: fix phy_get_internal_delay accessing an empty array
    77fd5294ea09 net: ip_tunnel: make sure to pull inner header in ip_tunnel_rcv()
    edcec2363477 ipv6: fib6_rules: flush route cache when rule is changed
    15641007df0f bpf: Fix stackmap overflow check on 32-bit arches
    64f00b4df059 bpf: Fix hashtab overflow check on 32-bit arches
    225da02acdc9 bpf: Fix DEVMAP_HASH overflow check on 32-bit arches
    70294d8bc31f bpf: Eliminate rlimit-based memory accounting for devmap maps
    6b4a39acafaf sr9800: Add check for usbnet_get_endpoints
    d47e6c1932ce Bluetooth: hci_core: Fix possible buffer overflow
    69d9425b8878 Bluetooth: Remove superfluous call to hci_conn_check_pending()
    cbe742db8bc5 igb: Fix missing time sync events
    02cba67662c3 igb: move PEROUT and EXTTS isr logic to separate functions
    f873b85ec762 iommu/vt-d: Don't issue ATS Invalidation request when device is disconnected
    f858c084ebde PCI: Make pci_dev_is_disconnected() helper public for other drivers
    722c24cddc6d wifi: rtw88: 8821c: Fix false alarm count
    c55cc6363880 mmc: wmt-sdmmc: remove an incorrect release_mem_region() call in the .remove function
    bb336cd8d5ec SUNRPC: fix some memleaks in gssx_dec_option_array
    a4e7ff1a7427 x86, relocs: Ignore relocations in .notes section
    47a429a524e2 ACPI: scan: Fix device check notification handling
    5f99b46dce89 arm64: dts: marvell: reorder crypto interrupts on Armada SoCs
    46792f9ba314 ARM: dts: imx6dl-yapp4: Move the internal switch PHYs under the switch node
    2d1e515789dc ARM: dts: imx6dl-yapp4: Fix typo in the QCA switch register address
    23d05494481f ARM: dts: imx6dl-yapp4: Move phy reset into switch node
    229563e2168f ARM: dts: arm: realview: Fix development chip ROM compatible value
    2478026f94e4 net: ena: Remove ena_select_queue
    98d186a14264 wifi: brcmsmac: avoid function pointer casts
    fb7601ebf686 iommu/amd: Mark interrupt as managed
    be8c53390a4e bus: tegra-aconnect: Update dependency to ARCH_TEGRA
    c2a30c81bf3c ACPI: processor_idle: Fix memory leak in acpi_processor_power_exit()
    5956f4203b6c wifi: wilc1000: prevent use-after-free on vif when cleaning up all interfaces
    115252fc6183 wireless: Remove redundant 'flush_workqueue()' calls
    23278c845a0b bpf: Mark bpf_spin_{lock,unlock}() helpers with notrace correctly
    c5f2076aaa7a bpf: Factor out bpf_spin_lock into helpers.
    dfd8a62a107e arm64: dts: mediatek: mt7622: add missing "device_type" to memory nodes
    f0dd27314c7a wifi: libertas: fix some memleaks in lbs_allocate_cmd_buffer()
    7d4b47f20f7e net: blackhole_dev: fix build warning for ethh set but not used
    918d7f0d3ee9 wifi: iwlwifi: fix EWRD table validity check
    fabe2db7de32 wifi: iwlwifi: dbg-tlv: ensure NUL termination
    1bc5461a21c5 wifi: ath9k: delay all of ath9k_wmi_event_tasklet() until init is complete
    bdaf08b472c2 af_unix: Annotate data-race of gc_in_progress in wait_for_unix_gc().
    1524f46376b1 bpftool: Silence build warning about calloc()
    926d95eb399e inet_diag: annotate data-races around inet_diag_table[]
    784412247e7d sock_diag: annotate data-races around sock_diag_handlers[family]
    9127599c075c cpufreq: brcmstb-avs-cpufreq: add check for cpufreq_cpu_get's return value
    11824d6a8a79 wifi: mwifiex: debugfs: Drop unnecessary error check for debugfs_create_dir()
    5aa586bf8010 wifi: wilc1000: fix multi-vif management when deleting a vif
    dddedfa3b29a wifi: rtl8xxxu: add cancel_work_sync() for c2hcmd_work
    b4bbf38c350a wifi: wilc1000: fix RCU usage in connect path
    fd86efb897e4 wifi: wilc1000: fix declarations ordering
    caa839d40ea4 wifi: b43: Disable QoS for bcm4331
    39c915a32302 wifi: b43: Stop correct queue in DMA worker when QoS is disabled
    871788995c16 wifi: b43: Stop/wake correct queue in PIO Tx path when QoS is disabled
    49f067726ab0 wifi: b43: Stop/wake correct queue in DMA Tx path when QoS is disabled
    e1dc7aa814a9 wifi: ath10k: fix NULL pointer dereference in ath10k_wmi_tlv_op_pull_mgmt_tx_compl_ev()
    c6fd906c3c33 timekeeping: Fix cross-timestamp interpolation for non-x86
    763a009228da timekeeping: Fix cross-timestamp interpolation corner case decision
    fe90806209b9 timekeeping: Fix cross-timestamp interpolation on counter wrap
    faf0b4c5e00b aoe: fix the potential use-after-free problem in aoecmd_cfg_pkts
    bb567cb5cdbe md: Don't clear MD_CLOSING when the raid is about to stop
    ab25f7cd4914 md: implement ->set_read_only to hook into BLKROSET processing
    2a0f8202f77a block: add a new set_read_only method
    a0bccba5f503 fs/select: rework stack allocation hack for clang
    4af837db0fd3 nbd: null check for nla_nest_start
    cde76b3af247 do_sys_name_to_handle(): use kzalloc() to fix kernel-infoleak
    cc6ddd6fa93e x86/paravirt: Fix build due to __text_gen_insn() backport
    0344b12a970b ASoC: wm8962: Fix up incorrect error message in wm8962_set_fll
    cd72f7de5bca ASoC: wm8962: Enable both SPKOUTR_ENA and SPKOUTL_ENA in mono mode
    423d747fa35d ASoC: wm8962: Enable oscillator if selecting WM8962_FLL_OSC
    442864752b38 Input: gpio_keys_polled - suppress deferred probe error for gpio
    020601445f6b ASoC: Intel: bytcr_rt5640: Add an extra entry for the Chuwi Vi8 tablet
    713eaf5c510c firewire: core: use long bus reset on gap count error
    81d7d920a22f Bluetooth: rfcomm: Fix null-ptr-deref in rfcomm_check_security
    ba3a55d118bf scsi: mpt3sas: Prevent sending diag_reset when the controller is ready
    e30b8525e140 dm-verity, dm-crypt: align "struct bvec_iter" correctly
    87221877ed99 block: sed-opal: handle empty atoms when parsing response
    d2e2cb525811 parisc/ftrace: add missing CONFIG_DYNAMIC_FTRACE check
    3e0f73be40db net/iucv: fix the allocation size of iucv_path_table array
    6e4694e65b6d x86/mm: Disallow vsyscall page read for copy_from_kernel_nofault()
    aa64355c4537 x86/mm: Move is_vsyscall_vaddr() into asm/vsyscall.h
    434a709df130 RDMA/mlx5: Relax DEVX access upon modify commands
    d27c48dc309d RDMA/mlx5: Fix fortify source warning while accessing Eth segment
    0f9fa4e6b2b3 gen_compile_commands: fix invalid escape sequence warning
    a8fee6674b50 HID: multitouch: Add required quirk for Synaptics 0xcddc device
    df14e946ea98 MIPS: Clear Cause.BD in instruction_pointer_set
    eb279074bada x86/xen: Add some null pointer checking to smp.c
    eddf7e95b846 ASoC: rt5645: Make LattePanda board DMI match more precise
    8e2113f61d9d selftests: tls: use exact comparison in recv_partial
    90c445799fd1 bpf: Defer the free of inner map when necessary
    93c37f1c63b4 rcu-tasks: Provide rcu_trace_implies_rcu_gp()
    a6771f343af9 io_uring: drop any code related to SCM_RIGHTS
    875f5fed30a1 io_uring/unix: drop usage of io_uring socket
    d35f38551c21 Linux 5.10.213
    738845b022d3 serial: max310x: fix IO data corruption in batched operations
    85d79478710a serial: max310x: implement I2C support
    8082cc992dec serial: max310x: make accessing revision id interface-agnostic
    f36ef837a7a6 regmap: Add bulk read/write callbacks into regmap_config
    915848be2f1b regmap: allow to define reg_update_bits for no bus configuration
    82a62478b9f7 Drivers: hv: vmbus: Drop error message when 'No request id available'
    74d83d0fe04e serial: max310x: Unprepare and disable clock in error path
    f610023e67ec getrusage: use sig->stats_lock rather than lock_task_sighand()
    9ca97868205a getrusage: use __for_each_thread()
    21677f35e104 getrusage: move thread_group_cputime_adjusted() outside of lock_task_sighand()
    811415fe768f getrusage: add the "signal_struct *sig" local variable
    14136bed4104 mm: hugetlb pages should not be reserved by shmat() if SHM_NORESERVE
    05edf43452c0 mm/hugetlb: change hugetlb_reserve_pages() to type bool
    5b10a88f64c0 hv_netvsc: Register VF in netvsc_probe if NET_DEVICE_REGISTER missed
    8f41b33d240e hv_netvsc: use netif_is_bond_master() instead of open code
    0d54d2240da7 hv_netvsc: Make netvsc/VF binding check both MAC and serial number
    3cfee5668b35 hv_netvsc: Process NETDEV_GOING_DOWN on VF hot remove
    0db98ee09b9c hv_netvsc: Wait for completion on request SWITCH_DATA_PATH
    cdba03568050 hv_netvsc: Use vmbus_requestor to generate transaction IDs for VMBus hardening
    2ce36635004a Drivers: hv: vmbus: Add vmbus_requestor data structure for VMBus hardening
    58bf67d524e2 ext4: convert to exclusive lock while inserting delalloc extents
    5b69dabd7e4a ext4: refactor ext4_da_map_blocks()
    b3bca5e8c76a ext4: make ext4_es_insert_extent() return void
    c09ffff246ca lsm: fix default return value of the socket_getpeersec_*() hooks
    ea6e87db9037 lsm: make security_socket_getpeersec_stream() sockptr_t safe
    a9482f3b4877 bpf: net: Change sk_getsockopt() to take the sockptr_t argument
    be155e9466dd net: Change sock_getsockopt() to take the sk ptr instead of the sock ptr
    518ec3da99f8 serial: max310x: prevent infinite while() loop in port startup
    fe0d16b3a3c3 serial: max310x: use a separate regmap for each port
    c1ecaadbcd40 serial: max310x: use regmap methods for SPI batch operations
    32e32ab1da5a serial: max310x: Make use of device properties
    c7e9e6d5ee84 serial: max310x: fail probe if clock crystal is unstable
    c2b9cbf09e59 serial: max310x: Try to get crystal clock rate from property
    569154b29a24 serial: max310x: Use devm_clk_get_optional() to get the input clock
    696e4112e5c1 xhci: handle isoc Babble and Buffer Overrun events properly
    fe2322caa074 xhci: process isoc TD properly when there was a transaction error mid TD.
    fa5aaf31e5f5 xhci: prevent double-fetch of transfer and transfer event TRBs
    89ed7ebae4f0 xhci: remove extra loop in interrupt context
    9c398afd4930 um: allow not setting extra rpaths in the linux binary
    c9c3cc6a13bd selftests: mm: fix map_hugetlb failure on 64K page size systems
    1dee72c02170 selftests/mm: switch to bash from sh
    bbf950a6e96a netrom: Fix data-races around sysctl_net_busy_read
    cfe0f73fb38a netrom: Fix a data-race around sysctl_netrom_link_fails_count
    b7d33e083f9d netrom: Fix a data-race around sysctl_netrom_routing_control
    01d4e3afe257 netrom: Fix a data-race around sysctl_netrom_transport_no_activity_timeout
    652b0b358196 netrom: Fix a data-race around sysctl_netrom_transport_requested_window_size
    f3315a6edaec netrom: Fix a data-race around sysctl_netrom_transport_busy_delay
    34c84e0036a6 netrom: Fix a data-race around sysctl_netrom_transport_acknowledge_delay
    34a164d24482 netrom: Fix a data-race around sysctl_netrom_transport_maximum_tries
    291d36d772f5 netrom: Fix a data-race around sysctl_netrom_transport_timeout
    d1261bde59a3 netrom: Fix data-races around sysctl_netrom_network_ttl_initialiser
    18c95d11c347 netrom: Fix a data-race around sysctl_netrom_obsolescence_count_initialiser
    e041df5dc9e6 netrom: Fix a data-race around sysctl_netrom_default_path_quality
    ccd1108b16ab netfilter: nf_conntrack_h323: Add protection for bmp length out of range
    2b4e7cb7d523 netfilter: nft_ct: fix l3num expectations with inet pseudo family
    9dfc15a10dfd net/rds: fix WARNING in rds_conn_connect_if_down
    5f4e51abfbe6 cpumap: Zero-initialise xdp_rxq_info struct before running XDP program
    79ce2e54cc0a net/ipv6: avoid possible UAF in ip6_route_mpath_notify()
    37fe99016b12 net: ice: Fix potential NULL pointer dereference in ice_bridge_setlink()
    c7137900691f geneve: make sure to pull inner header in geneve_rx()
    fdb63c179f7a tracing/net_sched: Fix tracepoints that save qdisc_dev() as a string
    71e21eb1f888 i40e: disable NAPI right after disabling irqs when handling xsk_pool
    ad91d5d1b65a ixgbe: {dis, en}able irqs in ixgbe_txrx_ring_{dis, en}able
    336261af0415 net: lan78xx: fix runtime PM count underflow on link stop
    11a3c9f48940 lan78xx: Fix race conditions in suspend/resume handling
    69215f8edae3 lan78xx: Fix partial packet errors on suspend/resume
    e5d7f43c4cdd lan78xx: Add missing return code checks
    061336268eb9 lan78xx: Fix white space and style issues
    0224cbc53ba8 mmc: mmci: stm32: fix DMA API overlapping mappings warning
    abda366ece48 mmc: mmci: stm32: use a buffer for unaligned DMA requests
    2bba1cb1487b loop: Select I/O scheduler 'none' from inside add_disk()
    027f4dd7c993 blk-mq: Introduce the BLK_MQ_F_NO_SCHED_BY_DEFAULT flag
    7cfcd0ed929b Linux 5.10.212
    f74362a00422 mptcp: fix double-free on socket dismantle
    30d84d87c36e mtd: spinand: gigadevice: fix Quad IO for GD5F1GQ5UExxG
    1805131d8f93 gpio: fix resource unwinding order in error path
    51f7044d103b gpiolib: Fix the error path order in gpiochip_add_data_with_key()
    947baae18505 gpio: 74x164: Enable output pins after registers are reset
    80d852299987 fs,hugetlb: fix NULL pointer dereference in hugetlbs_fill_super
    43eccc582373 cachefiles: fix memory leak in cachefiles_add_cache()
    287172812726 ext4: avoid bb_free and bb_fragments inconsistency in mb_free_blocks()
    70e5b013538d mptcp: fix possible deadlock in subflow diag
    36103f8cb902 x86/cpu/intel: Detect TME keyid bits before setting MTRR mask registers
    7a7cb5266b8f pmdomain: qcom: rpmhpd: Fix enabled_corner aggregation
    36b02df0a6ce mmc: sdhci-xenon: fix PHY init clock stability
    d3c703c22b09 mmc: sdhci-xenon: add timeout for PHY init complete
    3fd14520dd86 mmc: core: Fix eMMC initialization with 1-bit bus connection
    9579a21e99fe dmaengine: fsl-qdma: init irq after reg initialization
    bb3a06e9b9a3 dmaengine: fsl-qdma: fix SoC may hang on 16 byte unaligned read
    2886fe308a83 btrfs: dev-replace: properly validate device names
    99eb2159680a wifi: nl80211: reject iftype change with mesh ID change
    e668b92a3a01 gtp: fix use-after-free and null-ptr-deref in gtp_newlink()
    a23ac1788e2c tomoyo: fix UAF write bug in tomoyo_write_control()
    8af1c121b010 riscv: Sparse-Memory/vmemmap out-of-bounds fix
    96370ba395c5 afs: Fix endless loop in directory parsing
    14aacfcd7308 ALSA: Drop leftover snd-rtctimer stuff from Makefile
    d7acc4a569f5 power: supply: bq27xxx-i2c: Do not free non existing IRQ
    537e3f49dbe8 efi/capsule-loader: fix incorrect allocation size
    882a51a10ecf rtnetlink: fix error logic of IFLA_BRIDGE_FLAGS writing back
    80fabcd5d10c netfilter: nf_tables: allow NFPROTO_INET in nft_(match/target)_validate()
    e24acaefdd79 Bluetooth: Enforce validation on max value of connection interval
    df193568d612 Bluetooth: hci_event: Fix handling of HCI_EV_IO_CAPA_REQUEST
    0309b68aeaac Bluetooth: hci_event: Fix wrongly recorded wakeup BD_ADDR
    6dd0a9dfa99f Bluetooth: Avoid potential use-after-free in hci_error_reset
    6782a54e1a7f net: usb: dm9601: fix wrong return value in dm9601_mdio_read
    c1c7396b571c lan78xx: enable auto speed configuration for LAN7850 if no EEPROM is detected
    810fa7d5e520 ipv6: fix potential "struct net" leak in inet6_rtm_getaddr()
    906986fed827 tun: Fix xdp_rxq_info's queue_index when detaching
    2e95350fe9db net: ip_tunnel: prevent perpetual headroom growth
    f19d1f98e60e netlink: Fix kernel-infoleak-after-free in __skb_datagram_iter
    acd9f6d481d8 mtd: spinand: gigadevice: Fix the get ecc status issue
    8e3a867593e1 mtd: spinand: gigadevice: Support GD5F1GQ5UExxG
    37077ed16c77 crypto: virtio/akcipher - Fix stack overflow on memcpy
    bf85def4b6cb platform/x86: touchscreen_dmi: Allow partial (prefix) matches for ACPI names
    9985c44f239f Linux 5.10.211
    94ebf71bddbc ext4: regenerate buddy after block freeing failed if under fc replay
    dbc9b22d0ed3 arp: Prevent overflow in arp_req_get().
    ea1cd64d59f2 fs/aio: Restrict kiocb_set_cancel_fn() to I/O submitted via libaio
    bff0a0658e57 block: ataflop: more blk-mq refactoring fixes
    b49b022f7dfc drm/amd/display: Fix memory leak in dm_sw_fini()
    c6551ff227f6 drm/syncobj: call drm_syncobj_fence_add_wait when WAIT_AVAILABLE flag is set
    144ec5e1ce3b drm/syncobj: make lockdep complain on WAIT_FOR_SUBMIT v3
    31ea574aeca1 netfilter: nf_tables: set dormant flag on hook register failure
    31e10d6cb0c9 tls: stop recv() if initial process_rx_list gave us non-DATA
    7c54eaa3b078 tls: rx: drop pointless else after goto
    4820e84e2852 tls: rx: jump to a more appropriate label
    5d4e4eff791d s390: use the correct count for __iowrite64_copy()
    f6ce90567ed3 net: dev: Convert sa_data to flexible array in struct sockaddr
    c1b447a21a65 packet: move from strlcpy with unused retval to strscpy
    65c38f23d10f ipv6: sr: fix possible use-after-free and null-ptr-deref
    d9b5e2b7a819 afs: Increase buffer size in afs_update_volume_status()
    2f56d7126299 ipv6: properly combine dev_base_seq and ipv6.dev_addr_genid
    dcc1375d41a0 ipv4: properly combine dev_base_seq and ipv4.dev_addr_genid
    fc30793e0610 nouveau: fix function cast warnings
    49ef33a90e1f scsi: jazz_esp: Only build if SCSI core is builtin
    b42b801abada bpf, scripts: Correct GPL license name
    a2d1e1f8f064 RDMA/srpt: fix function pointer cast warnings
    905de68fcdff arm64: dts: rockchip: set num-cs property for spi on px30
    5639414a52a2 RDMA/qedr: Fix qedr_create_user_qp error flow
    5a5c039dac1b RDMA/srpt: Support specifying the srpt_service_guid parameter
    179bb08834fb RDMA/bnxt_re: Return error for SRQ resize
    3fa240bb6b2d IB/hfi1: Fix a memleak in init_credit_return
    8affdbb3e2ef mptcp: fix lockless access in subflow ULP diag
    eb3693454baa usb: roles: don't get/set_role() when usb_role_switch is unregistered
    e279bf8e5189 usb: roles: fix NULL pointer issue when put module's reference
    57ca0e16f393 usb: gadget: ncm: Avoid dropping datagrams of properly parsed NTBs
    1e204a8e9eb5 usb: cdns3: fix memory double free when handle zero packet
    b40328eea93c usb: cdns3: fixed memory use after free at cdns3_gadget_ep_disable()
    1dfe6393d179 x86/alternative: Make custom return thunk unconditional
    dd1a169b4496 Revert "x86/alternative: Make custom return thunk unconditional"
    e8e9d1f6cf02 x86/returnthunk: Allow different return thunks
    4eb421fa71e4 x86/ftrace: Use alternative RET encoding
    b253061d4b86 x86/ibt,paravirt: Use text_gen_insn() for paravirt_patch()
    e752912ce18c x86/text-patching: Make text_gen_insn() play nice with ANNOTATE_NOENDBR
    c13d42604069 Revert "x86/ftrace: Use alternative RET encoding"
    70d92abbe296 ARM: ep93xx: Add terminator to gpiod_lookup_table
    dcb4d1426859 l2tp: pass correct message length to ip6_append_data
    03366ad11115 PCI/MSI: Prevent MSI hardware interrupt number truncation
    2e534fd15e5c gtp: fix use-after-free and null-ptr-deref in gtp_genl_dump_pdp()
    6e5069b40fb4 KVM: arm64: vgic-its: Test for valid IRQ in its_sync_lpi_pending_table()
    615af9cb3e70 KVM: arm64: vgic-its: Test for valid IRQ in MOVALL handler
    3c652f6fa1e1 dm-crypt: don't modify the data when using authenticated encryption
    f6a765a61e0e s390/cio: fix invalid -EBUSY on ccw_device_start
    3f38d22e645e IB/hfi1: Fix sdma.h tx->num_descs off-by-one error
    a0180e940cf1 erofs: fix lz4 inplace decompression
    841b9f6f681d x86: drop bogus "cc" clobber from __try_cmpxchg_user_asm()
    6360869cc4e9 jbd2: Fix wrongly judgement for buffer head removing while doing checkpoint
    69389d82ab6d jbd2: recheck chechpointing non-dirty buffer
    cb1609ef8aa2 jbd2: remove redundant buffer io error checks
    52b9609b89e3 iwlwifi: mvm: write queue_sync_state only for sync
    f5e6da2ca116 iwlwifi: mvm: do more useful queue sync accounting
    87b7d049ce55 platform/x86: intel-vbtn: Support for tablet mode on HP Pavilion 13 x360 PC
    6c367739cd64 lan743x: fix for potential NULL pointer dereference with bare card
    a1ccc4f44133 btrfs: do not pin logs too early during renames
    16b70511bd48 btrfs: unify lookup return value when dir entry is missing
    fccb8a610987 btrfs: introduce btrfs_lookup_match_dir
    aaf2d6b7ecba btrfs: tree-checker: check for overlapping extent items
    b8034ca2fdcc task_stack, x86/cea: Force-inline stack helpers
    68ffe3ec198d ASoC: Intel: bytcr_rt5651: Drop reference count of ACPI device after use
    edeef1b4fb10 ASoC: Intel: boards: get codec device with ACPI instead of bus search
    151b360f4739 ASoC: Intel: boards: harden codec property handling
    877037eff7d1 mtd: spinand: macronix: Add support for MX35LFxGE4AD
    b6c4a44e89d7 cifs: add a warning when the in-flight count goes negative
    e410dfaaac17 powerpc/watchpoints: Annotate atomic context in more places
    2641aa3f56b1 powerpc/watchpoint: Workaround P10 DD1 issue with VSX-32 byte instructions
    d021ba1142e2 block: ataflop: fix breakage introduced at blk-mq refactoring
    1dd3dc389211 seccomp: Invalidate seccomp mode to catch death failures
    7ab8a3bac531 x86/uaccess: Implement macros for CMPXCHG on user addresses
    13f6937f53e3 hsr: Avoid double remove of a node.
    b2e72d88c33b hvc/xen: prevent concurrent accesses to the shared ring
    86ba65e5357b media: av7110: prevent underflow in write_ts_to_decoder()
    d6e60c53d2e2 ASoC: fsl_micfil: register platform component before registering cpu dai
    de899edac73d ARM: dts: imx: Set default tuning step for imx6sx usdhc
    51582123dd84 irqchip/mips-gic: Don't touch vl_map if a local interrupt is not routable
    ef6128a1bafe ARM: dts: BCM53573: Drop nonexistent "default-off" LED trigger
    a4c0234b167b pmdomain: renesas: r8a77980-sysc: CR7 must be always on
    5fe446b245ba virtio-blk: Ensure no requests in virtqueues before deleting vqs.
    92a1090b4798 firewire: core: send bus reset promptly on gap count error
    6a375022b0a8 scsi: lpfc: Use unsigned type for num_sge
    7fb19792749c hwmon: (coretemp) Enlarge per package core count limit
    988ae00e69b9 efi: Don't add memblocks for soft-reserved memory
    4fff3d735bae efi: runtime: Fix potential overflow of soft-reserved region size
    865f99f64121 Input: i8042 - add Fujitsu Lifebook U728 to i8042 quirk table
    30a878457286 ext4: correct the hole length returned by ext4_map_blocks()
    a72037da4ab8 nvmet-fc: abort command when there is no binding
    a0fa157bd4eb nvmet-fc: release reference on target port
    5da866be3d49 nvmet-fcloop: swap the list_add_tail arguments
    4f2c95015ec2 nvme-fc: do not wait in vain when unloading module
    f82ed69f6aed netfilter: conntrack: check SCTP_CID_SHUTDOWN_ACK for vtag setting in sctp_new
    da47fc8d30fb spi: sh-msiof: avoid integer overflow in constants
    0a840d798435 ASoC: sunxi: sun4i-spdif: Add support for Allwinner H616
    5b33bbeefbd8 nvmet-tcp: fix nvme tcp ida memory leak
    d21c122de3cc regulator: pwm-regulator: Add validity checks in continuous .get_voltage
    c432094aa7c9 dmaengine: ti: edma: Add some null pointer checks to the edma_probe
    ffeb72a80a82 ext4: avoid allocating blocks from corrupted group in ext4_mb_find_by_goal()
    927794a02169 ext4: avoid allocating blocks from corrupted group in ext4_mb_try_best_found()
    2b39c1a0a89f ahci: add 43-bit DMA address quirk for ASMedia ASM1061 controllers
    15bb22da0fd6 ahci: asm1166: correct count of reported ports
    e94da8aca2e7 spi: hisi-sfc-v3xx: Return IRQ_NONE if no interrupts were detected
    cd36da760bd1 fbdev: sis: Error out if pixclock equals zero
    512ee6d6041e fbdev: savage: Error out if pixclock equals zero
    5ffab99e070b wifi: mac80211: fix race condition on enabling fast-xmit
    7e71fbc68dad wifi: cfg80211: fix missing interfaces when dumping
    17c976fe2cf6 dmaengine: fsl-qdma: increase size of 'irq_name'
    d94a80da905b dmaengine: shdma: increase size of 'dev_id'
    168ed59170de scsi: target: core: Add TMF to tmr_list handling
    e4bc31174507 sched/rt: Disallow writing invalid values to sched_rt_period_us
    13c6bce76d94 sched/rt: Fix sysctl_sched_rr_timeslice intial value
    b1ba065137f4 zonefs: Improve error handling
    19087d70e9e6 userfaultfd: fix mmap_changing checking in mfill_atomic_hugetlb
    18d88bf9c2e7 sched/rt: sysctl_sched_rr_timeslice show default timeslice after reset
    94b064984a19 smb: client: fix parsing of SMB3.1.1 POSIX create context
    13fb0fc49176 smb: client: fix potential OOBs in smb2_parse_contexts()
    b03c8099a738 smb: client: fix OOB in receive_encrypted_standard()
    3fa31e7a9d3a net/sched: Retire dsmark qdisc
    71925d686386 net/sched: Retire ATM qdisc
    56a6720d9bc3 net/sched: Retire CBQ qdisc
    2214ded26c86 tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    44494049e815 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    0d7c23009d82 tpm: Add flag to use default cancellation policy
    07914bef4e16 tpm: tis_i2c: Fix sanity check interrupt enable mask
    35f85f04bd69 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    7b04c6c08107 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    4790cb2d1283 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    50f74deaf308 hwmon: Add driver for Texas Instruments TMP464 and TMP468
    a4e6e4b7bb08 dt-bindings: hwmon: add tmp464.yaml
    e0ed2149d7b5 drm/amdkfd: Check for null pointer after calling kmemdup
    c6ddded89322 ARM: renumber bits related to _TIF_WORK_MASK
    35b96a325c1e arm64: make _TIF_WORK_MASK bits contiguous
    f5a8f06aa595 arm64: uaccess: remove vestigal UAO support
    3a330b569301 arm64: uaccess: remove redundant PAN toggling
    9cbbb016d6e7 arm64: uaccess: remove addr_limit_user_check()
    fd83411f5e08 arm64: uaccess: remove set_fs()
    15a6dc2f4b53 arm64: uaccess cleanup macro naming
    912a6ab683a4 arm64: uaccess: split user/kernel routines
    d004ab02dae2 arm64: uaccess: refactor __{get,put}_user
    e1941a8b459e arm64: uaccess: simplify __copy_user_flushcache()
    dfae822b4c59 arm64: uaccess: rename privileged uaccess routines
    1efdb8f0a0c7 arm64: sdei: explicitly simulate PAN/UAO entry
    b35fec69554c arm64: sdei: move uaccess logic to arch/arm64/
    b5a28033fe7b arm64: head.S: always initialize PSTATE
    243eb8553513 arm64: head.S: cleanup SCTLR_ELx initialization
    74a00405d97f arm64: head.S: rename el2_setup -> init_kernel_el
    73c5f386d175 arm64: add C wrappers for SET_PSTATE_*()
    e17fb7543df1 arm64: ensure ERET from kthread is illegal
    eff6289cc53b ixgbevf: add disable link state
    262595681381 ixgbe: add improvement for MDD response functionality
    b9d78b06dea8 ixgbe: add the ability for the PF to disable VF link state
    d829911485da Documentation: arm64: Document PMU counters access from userspace
    fe5d29bfce20 arm64: perf: Enable PMU counter userspace access for perf event
    15ce6d04ed6a arm64: perf: Add userspace counter access disable switch
    4f288acbeed8 perf: Add a counter for number of user access events in context
    354ba4a8c4b8 x86: perf: Move RDPMC event flag to a common definition
    d29cec94c49b libperf xyarray: Add bounds checks to xyarray__entry()
    8264d2b91841 libperf: Add support for user space counter access
    7fd81b678b5f libperf tests: Add support for verbose printing
    6029ff53a48f libperf: Add evsel mmap support
    28b0c8956369 tools include: Add an initial math64.h
    492e532d20f1 perf record: Improve 'Workload failed' message printing events + what was exec'ed
    d0a1fc61733e perf evlist: Add a method to return the list of evsels as a string
    81a77b39be0a perf annotate: Fix sample events lost in stdio mode
    2883e69e202d pnmtologo: use relocatable file name
    80f5207b5abd tools: use basename to identify file in gen-mach-types
    4d201ec392f1 vt/conmakehash: improve reproducibility
    ae24d013888f lib/build_OID_registry: fix reproducibility issues
    5d72da88dbb4 x86/boot: Wrap literal addresses in absolute_pointer()
    dc0bd7aa2319 ACPI: thermal: drop an always true check
    0c4288cceef5 xfs: Fix -Werror=dangling-pointer work-around for older GCC
    5509050b3392 xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    669827c6e293 virtio-pci: Remove wrong address verification in vp_del_vqs()
    1c80d994d3db regulator: consumer: Add missing stubs to regulator/consumer.h
    3303d0e2aeff ipv6: Fix stats accounting in ip6_pkt_drop
    c56e60f665e7 memcg: enable accounting of ipc resources
    e6c8ebd210a2 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    1655ee30e684 sched/isolation: really align nohz_full with rcu_nocbs
    253c752ed120 pstore/ftrace: Add and use ftrace_test_recursion_trylock_safe
    356e8a12bd66 pstore/ftrace: Add recursion protection to the ftrace callback
    334706a1e873 ftrace: Add ftrace_test_recursion_trylock() helper function
    78c260d7f60b ftrace: Move the recursion testing into global headers
    c0b313d988a1 powerpc/mm: Switch obsolete dssall to .long
    1bd813fe8d0e riscv: fix build with binutils 2.38
    835a2d1b24c6 powerpc/lib/sstep: fix 'ptesync' build error
    fd84b99a8ccb drm/amd/display: Don't allow partial copy_from_user
    024f4ff63d55 drm/amdgpu: Fix even more out of bound writes from debugfs
    0c0ad634e899 e1000e: Serialize TGP e1000e PM ops
    add88b0536fa e1000e: Make mei_me active when e1000e is in use
    a8f317c1a17e yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    c8400a2cbe1f iommu/arm-smmu-v3: Ratelimit event dump
    b8ec7e43e95e regmap: teach regmap to use raw spinlocks if requested in the config
    4b7fa7684be7 OF: DT-Overlay configfs interface (v7)
    d515a5c0e9a9 net: xilinx_emaclite: Do not print real IOMEM pointer
    11329e49959b drivers: net: xilinx_emaclite: remove arch limitation
    29dc69bf2a07 drivers: net: xilinx_emaclite: Add COMPILE_TEST support
    ff106eff01f6 drivers: net: xilinx_emaclite: Fix -Wpointer-to-int-cast warnings with W=1
    c27462391070 serial: 8250: 8250_omap: Fix possible array out of bounds access
    16976d8e307f perf intel-pt: Use aux_watermark
    d421a2346946 perf: Cap allocation order at aux_watermark
    6da8d5f29481 timers: Fix get_next_timer_interrupt() with no timers pending
    af141841735a eventfd: Enlarge recursion limit to allow vhost to work
    a125a6102808 iwlwifi: select MAC80211_LEDS conditionally
    139fe7d68413 rcu: Fix stall-warning deadlock due to non-release of rcu_node ->lock
    8d0c79931235 console: Fix build when CONFIG_BLK_DEV_INITRD is disabled.
    ea777841e8ea yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    ab49d2db98bd cgroup1: fix leaked context root causing sporadic NULL deref in LTP
    bdda1b6cf99b aufs5: aufs-core
    2fa276071d07 aufs5: aufs-standalone
    06ed4d532456 aufs5: aufs-mmap
    372857834999 aufs5: aufs-kbuild
    fd68c9840693 aufs5: aufs-base
    a673c127156c Revert "aufs5: core"
    cf62bfcde384 Revert "aufs5: aufs5-base"
    a644419ec785 Revert "aufs5: aufs5-mmap"
    b893f9a999bb Revert "aufs5: aufs5-standalone"
    c60db0819480 Revert "aufs: initial port to v5.10"
    c66a5900f139 Revert "Revert "aufs: initial port to v5.10""
    1320cf58f5dd Revert "aufs: linux-v5.10-rc1, no more set_fs()"
    02349d7738ff Revert "for aufs: linux-v5.10-rc1, no more vfs_(read|write)f_t"
    f01dab74750c Revert "aufs: linux-v5.10-rc1, no more f_op->read() and ->write()"
    3d5de709b676 Revert "aufs5: aufs5-kbuild"
    a97f1329edf7 tracing/arm: Have max stack tracer handle the case of return address after data
    5c54112a05ab net: Treat __napi_schedule_irqoff() as __napi_schedule() on PREEMPT_RT
    ddac76981cb3 sched/isolation: reconcile rcu_nocbs= and nohz_full=
    56fd8c36614e net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    a8808e541750 aufs: linux-v5.10-rc1, no more f_op->read() and ->write()
    cb1c41dac775 for aufs: linux-v5.10-rc1, no more vfs_(read|write)f_t
    a5805df6583f aufs: linux-v5.10-rc1, no more set_fs()
    64e145dcca8c Revert "aufs: initial port to v5.10"
    d6e20b2257ec defconfig: add dependency for CONFIG_ACPI_APEI_PCIEAER
    b237d48208d0 arm64/mm: Drop THP conditionality from FORCE_MAX_ZONEORDER
    1209195ed0f7 driver: adc: ltc2497: return directly after reading the adc conversion value
    a60fe3fcf113 Revert "mfd: syscon: Don't free allocated name for regmap_config"
    13d68767aa4a rcutorture: Use "all" and "N" in "nohz_full" and "rcu_nocbs"
    54e69571a97d rcu: deprecate "all" option to rcu_nocbs=
    a605b9d20447 lib: test_bitmap: add tests for "N" alias
    8c22517f444e lib: bitmap: support "N" as an alias for size of bitmap
    88187167e63a lib: bitmap: move ERANGE check from set_region to check_region
    ca5429633613 lib: bitmap: fold nbits into region struct
    9381134cea8a lib: test_bitmap: add more start-end:offset/len tests
    c825800730ab lib: test_bitmap: add tests to trigger ERANGE case.
    8cc8264dca3f lib: test_bitmap: clearly separate ERANGE from EINVAL tests.
    470da7b7f2ff Revert "cpumask: Un-inline cpulist_parse for SMP; prepare for ascii helpers"
    28dc1d37602d Revert "cpumask: Make "all" alias global and not just RCU"
    dbfe0b183fca Revert "cpumask: Add a "none" alias to complement "all""
    a57711fcff30 Revert "cpumask: Add "last" alias for cpu list specifications"
    34523d7c8476 qemux86: add configuration symbol to select values
    cdca78778415 objtool: Fix seg fault with Clang non-section symbols
    d3287798bd88 x86/entry: Emit a symbol for register restoring thunk
    2ad99ddaac78 cpumask: Add "last" alias for cpu list specifications
    c10e9481810b cpumask: Add a "none" alias to complement "all"
    b00ceed9d388 cpumask: Make "all" alias global and not just RCU
    8b215206e797 cpumask: Un-inline cpulist_parse for SMP; prepare for ascii helpers
    1b5024caeda8 clear_warn_once: add a clear_warn_once= boot parameter
    fc0dd76cce0e clear_warn_once: bind a timer to written reset value
    d64fc2d2b14a clear_warn_once: expand debugfs to include read support
    77592e956cc9 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    6e022759f727 perf: x86-32: explicitly include <errno.h>
    22d6bbb947d4 perf: mips64: Convert __u64 to unsigned long long
    c35f9150001c perf: fix bench numa compilation
    c4caef513eb1 perf: add SLANG_INC for slang.h
    07dfbf9405dd perf: add sgidefs.h to for mips builds
    42c5431ad2cf perf: change --root to --prefix for python install
    af79bfe90143 perf: add 'libperl not found' warning
    ddfbd9e75f08 perf: force include of <stdbool.h>
    0f34e6305176 fat: don't use obsolete random32 call in namei_vfat
    b5b55eaad1df FAT: Added FAT_NO_83NAME
    756b13bfab6e FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    fabad71cb2b5 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    06fd68d75bd1 aufs: initial port to v5.10
    c9126877d1f5 aufs5: core
    f5150173c643 aufs5: aufs5-standalone
    b57d26b072d9 aufs5: aufs5-mmap
    78f128c4b8e5 aufs5: aufs5-base
    47aa35171d08 aufs5: aufs5-kbuild
    35c480a23c66 yaffs: include blkdev.h
    2c64c43540a5 yaffs: fix misplaced variable declaration
    bde410ee9f59 yaffs2: v5.6 build fixups
    414c8e866931 yaffs2: fix memory leak when /proc/yaffs is read
    c99c1990cf7c yaffs: add strict check when call yaffs_internal_read_super
    498f5fafe50a yaffs: repair yaffs_get_mtd_device
    7ca3c08ebbf9 yaffs: Fix build failure by handling inode i_version with proper atomic API
    0ba47e881bb8 yaffs2: fix memory leak in mount/umount
    39a5406665dd yaffs: Avoid setting any ACL releated xattr
    ca5b43ddc6fd Yaffs:check oob size before auto selecting Yaffs1
    c2619c05a53e fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    5e08fb7b8ee0 yaffs2: adjust to proper location of MS_RDONLY
    5f1a1a9678a8 yaffs2: import git revision b4ce1bb (jan, 2020)
    fc21f09ae369 initramfs: allow an optional wrapper script around initramfs generation
    73887fca03be arm64/perf: Fix wrong cast that may cause wrong truncation
    a267cafaac44 defconfigs: drop obselete options
    eb5d1bc00c3f arm64/perf: fix backtrace for AAPCS with FP enabled
    062b2c98c087 linux-yocto: Handle /bin/awk issues
    d3beb253ae71 uvesafb: provide option to specify timeout for task completion
    75ccbf377a51 uvesafb: print error message when task timeout occurs
    18ffa2e88024 compiler.h: Undef before redefining __attribute_const__
    3ed931201746 vmware: include jiffies.h
    938942859596 Resolve jiffies wrapping about arp
    069a883d837c nfs: Allow default io size to be configured.
    3b568edcd3e9 check console device file on fs when booting
    77ec93228920 mount_root: clarify error messages for when no rootfs found
    17a15e0f7536 menuconfig,mconf-cfg: Allow specification of ncurses location
    8f13b1349a74 modpost: mask trivial warnings
    b6c9e0fa24e8 kbuild: exclude meta directory from distclean processing
    62dbbdbec60a powerpc: serialize image targets
    27b8dec5dbb3 arm: serialize build targets
    fc365512e4c4 Revert "platform/x86: wmi: Destroy on cleanup rather than unregister"
    9a6e91d2e691 crtsavres: fixups for 5.4+
    7dbc3cd0398f powerpc/ptrace: Disable array-bounds warning with gcc8
    ebe3bcb89cb0 powerpc: Disable attribute-alias warnings from gcc8
    65ba0e7de081 powerpc: add crtsavres.o to archprepare for kbuild
    6bd3efdce5a9 powerpc: kexec fix for powerpc64
    41671522c159 powerpc: Add unwind information for SPE registers of E500 core
    8851006b0109 mips: vdso: fix 'jalr $t9' crash in vdso code
    ed5db62477e8 mips: Kconfig: add QEMUMIPS64 option
    2a7ca094fc42 4kc cache tlb hazard: tlbp cache coherency
    b742d60d3f70 malta uhci quirks: make allowance for slow 4k(e)c
    8a160fc86eb6 arm/Makefile: Fix systemtap
    b9805882353c vexpress: Pass LOADADDR to Makefile
    332e618aa7ae arm: ARM EABI socketcall
    1ec682cb85f8 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 95aa8a29b2..9c37ea8a15 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d4e1591e2a700e5317e604af9c46dc9f92d87527"
-SRCREV_meta ?= "b890cbbdcbc8498d1c84ec782bb5de8a51eb7d6d"
+SRCREV_machine ?= "6ed671f36a091fc09ca9ee804ff959bc7d6eb4c1"
+SRCREV_meta ?= "c658f078fe16bd2689f39a713bf17be1874bae53"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.210"
+LINUX_VERSION ?= "5.10.216"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 832d030031..2cf94cc9f6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.210"
+LINUX_VERSION ?= "5.10.216"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "0f8e37aa2c623070ac74f73e6d41ed51fab54b4c"
-SRCREV_machine ?= "2c2439238ab602a10ad6d7aa6b210562ee1df595"
-SRCREV_meta ?= "b890cbbdcbc8498d1c84ec782bb5de8a51eb7d6d"
+SRCREV_machine:qemuarm ?= "a897f5860a61c0bd5eac9780b292dba2f158a33b"
+SRCREV_machine ?= "5506a25c2de1ff6956b79138000301f344a6e869"
+SRCREV_meta ?= "c658f078fe16bd2689f39a713bf17be1874bae53"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 48fb4868fb..97772390b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,23 +14,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b1aa548003c2c76a8aa7d7ad83c7070cac5a4f21"
-SRCREV_machine:qemuarm64 ?= "32d0647cd0dfa7361a5dfdde34d39192f179f6bf"
-SRCREV_machine:qemumips ?= "8780d18791f93bacc3a7d0529fdeb4e31adacafa"
-SRCREV_machine:qemuppc ?= "9353fbbd955b1f29e56876aa332473e1029e9e96"
-SRCREV_machine:qemuriscv64 ?= "ee0d8dfb898ca2dc199437e79efaa02723ff9378"
-SRCREV_machine:qemuriscv32 ?= "ee0d8dfb898ca2dc199437e79efaa02723ff9378"
-SRCREV_machine:qemux86 ?= "ee0d8dfb898ca2dc199437e79efaa02723ff9378"
-SRCREV_machine:qemux86-64 ?= "ee0d8dfb898ca2dc199437e79efaa02723ff9378"
-SRCREV_machine:qemumips64 ?= "136942e72021d05bd1d93389d94a20f763dd8336"
-SRCREV_machine ?= "ee0d8dfb898ca2dc199437e79efaa02723ff9378"
-SRCREV_meta ?= "b890cbbdcbc8498d1c84ec782bb5de8a51eb7d6d"
+SRCREV_machine:qemuarm ?= "590d7093102d1def24e8034ee0be799797b62a5f"
+SRCREV_machine:qemuarm64 ?= "b1dc4c88ed9dd6e6abe2886bf765ebb741070c7e"
+SRCREV_machine:qemumips ?= "c09fe97a7469eb7a20cc60e9fb759ad433a78b91"
+SRCREV_machine:qemuppc ?= "9f1cff9c0409729a3aa098e411e4b20cf1d94001"
+SRCREV_machine:qemuriscv64 ?= "a035e16d75c1cd721091559a771bf967d5fa03f7"
+SRCREV_machine:qemuriscv32 ?= "a035e16d75c1cd721091559a771bf967d5fa03f7"
+SRCREV_machine:qemux86 ?= "a035e16d75c1cd721091559a771bf967d5fa03f7"
+SRCREV_machine:qemux86-64 ?= "a035e16d75c1cd721091559a771bf967d5fa03f7"
+SRCREV_machine:qemumips64 ?= "9fc7eb5bd92e22ec62caa3a1896b967109095916"
+SRCREV_machine ?= "a035e16d75c1cd721091559a771bf967d5fa03f7"
+SRCREV_meta ?= "c658f078fe16bd2689f39a713bf17be1874bae53"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.210"
+LINUX_VERSION ?= "5.10.216"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


