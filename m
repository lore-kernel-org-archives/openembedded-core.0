Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A60C4708E
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:42:25 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.57986.1671561736514973755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:42:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wxb3FPde;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id c7so11759951qtw.8
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 10:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIwBYisGhma45mslPRYMcfXwBy6qEya+iS0BKR+oI8Y=;
        b=Wxb3FPdeW29l4OBcTM0ds+e/Sds+c2ccAN4fPtu9AzGPfKNpOvAgzk+1wPmz862+4Y
         1SuN459tIQWBv4dKEF6KVU6zqFU9EEgWpsxvMWNyFg8JR4G+vw7Qr/BROnCF77EQ3fOv
         RDWfXFsjbHZ8vMj3LDo/nvfootHtssAZFWITZjl4Zak22jaqh7G7hzPvjFQhfslPgfCf
         Gc3YRLLy1mLIX0bL3eboCgjyMbKfN+p0lQnDMgIglyYK9KBgzzZLG14K4aPFz/l46Jjy
         GvLr094gCSxlAcxY67yrzCDGaWXRBhWrivJZr0hxmzTScBJer1HxjHuAHlSWr51k5Tom
         Ys+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIwBYisGhma45mslPRYMcfXwBy6qEya+iS0BKR+oI8Y=;
        b=uOypFg1l8AGDHZtFqqwWLpag732fSShuxq0gQlFOby5RZwwg7SbcbjpsoNjHRN2jou
         SSXjMZu36UCY4lvUqRnwgw/IJghAQ+Y149HT9XcTwmVdWrl5K56WQtlaVlxn2gTZdYDc
         oIpIbYrluxoDCRv7M65BC7ylRO1z81akaOTiqs/BL3HYEv9cJb19TtMJeGQyg33BBN9g
         ECi0UfWA/aY7cPTX7JHfakDDxrrY3YG1BMKGVOE/xsAa5arEt8jRewEACVG0AiYGHFS8
         yowcwK6ETN50lBukGZxYt+IZS91d8MkkjNPG0Z+83KSFPwOlFiO0M+MaZFhhKU43rwQ/
         UZ6g==
X-Gm-Message-State: AFqh2kq9CF8nbwpHXwLYrf3BNSnEQ5m4PsqKQzcz3aPqS0TOU11y3fDJ
	37HUrdBULWCo8loO1FxjFHJXqq2eA38=
X-Google-Smtp-Source: AMrXdXskEYmymndsFmeoNRWUf4Rk7RInXRTfDJDFXdfvdTQd/rc4/q3oiwRB/IW3OLEHaI2X4xJkdg==
X-Received: by 2002:ac8:5199:0:b0:3a4:ff03:f1ac with SMTP id c25-20020ac85199000000b003a4ff03f1acmr4775591qtn.6.1671561734174;
        Tue, 20 Dec 2022 10:42:14 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id x30-20020a05620a0b5e00b006fc94f65417sm9229265qkg.40.2022.12.20.10.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:42:13 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] yocto-bsps/5.15: update to v5.15.78
Date: Tue, 20 Dec 2022 13:42:02 -0500
Message-Id: <0fd108c99e66a55dca19cef428d9716b9b18b3e5.1671560769.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1671560768.git.bruce.ashfield@gmail.com>
References: <cover.1671560768.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174875

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the reference BSPs to the latest 5.15 in linux-yocto, which
picks up the following commits:

    509a32764e1a Linux 5.15.78
    7038af4ce951 wifi: brcmfmac: Fix potential buffer overflow in brcmf_fweh_event_worker()
    b66617cc3c2f drm/i915/sdvo: Setup DDC fully before output init
    73d52322c4af drm/i915/sdvo: Filter out invalid outputs more sensibly
    2219b6aad345 drm/rockchip: dsi: Force synchronous probe
    dd955eb4e616 drm/rockchip: dsi: Clean up 'usage_mode' when failing to attach
    cfa8a89af9f2 cifs: fix regression in very old smb1 mounts
    3189de0ac310 ext4,f2fs: fix readahead of verity data
    a663e6ab17a2 tee: Fix tee_shm_register() for kernel TEE drivers
    d46db722a0af KVM: x86: emulator: update the emulation mode after CR0 write
    942aec252b23 KVM: x86: emulator: update the emulation mode after rsm
    9df4bb7b3863 KVM: x86: emulator: introduce emulator_recalc_and_set_mode
    311f1e51a290 KVM: x86: emulator: em_sysexit should update ctxt->mode
    37a03de2d0c5 KVM: arm64: Fix bad dereference on MTE-enabled systems
    167dca5e210b KVM: VMX: fully disable SGX if SECONDARY_EXEC_ENCLS_EXITING unavailable
    19c2b2ffbeec KVM: x86: Mask off reserved bits in CPUID.8000001FH
    553fd40d3bf7 KVM: x86: Mask off reserved bits in CPUID.80000001H
    006366b96c16 KVM: x86: Mask off reserved bits in CPUID.80000008H
    fc796fd861fa KVM: x86: Mask off reserved bits in CPUID.8000001AH
    ef7716398a78 KVM: x86: Mask off reserved bits in CPUID.80000006H
    a88998446b6d x86/syscall: Include asm/ptrace.h in syscall_wrapper header
    999cff2b6ce3 ext4: fix BUG_ON() when directory entry has invalid rec_len
    0a43c015e981 ext4: fix warning in 'ext4_da_release_space'
    ada82803a773 parisc: Avoid printing the hardware path twice
    081ff43a7786 parisc: Export iosapic_serial_irq() symbol for serial port driver
    5daf985dd0f3 parisc: Make 8250_gsc driver dependend on CONFIG_PARISC
    425fe99771bf perf/x86/intel: Fix pebs event constraints for SPR
    4613a450172e perf/x86/intel: Add Cooper Lake stepping to isolation_ucodes[]
    7de3fe6a1354 perf/x86/intel: Fix pebs event constraints for ICL
    71d6c33fe223 arm64: entry: avoid kprobe recursion
    52be536155f5 efi: random: Use 'ACPI reclaim' memory for random seed
    83b5ec7ee82d efi: random: reduce seed size to 32 bytes
    0417f70b8588 fuse: add file_modified() to fallocate
    2de8eec8afb7 capabilities: fix potential memleak on error path from vfs_getxattr_alloc()
    bd07f8067b35 tracing/histogram: Update document for KEYS_MAX size
    27b4406f9c35 tools/nolibc/string: Fix memcmp() implementation
    b5074df412bf ring-buffer: Check for NULL cpu_buffer in ring_buffer_wake_waiters()
    85f3caa95579 kprobe: reverse kp->flags when arm_kprobe failed
    d1b6a8e3414a tracing: kprobe: Fix memory leak in test_gen_kprobe/kretprobe_cmd()
    828577e0baaf tcp/udp: Make early_demux back namespacified.
    88561a66777e ftrace: Fix use-after-free for dynamic ftrace_ops
    450d7480705e btrfs: fix type of parameter generation in btrfs_get_dentry
    007058eb8292 btrfs: fix tree mod log mishandling of reallocated nodes
    336fdd295c14 btrfs: fix lost file sync on direct IO write with nowait and dsync iocb
    cff805b1518f fscrypt: fix keyring memory leak on mount failure
    e6f4fd85ef1e fscrypt: stop using keyrings subsystem for fscrypt_master_key
    3975affcf55f af_unix: Fix memory leaks of the whole sk due to OOB skb.
    4302806dbfea block, bfq: protect 'bfqd->queued' by 'bfqd->lock'
    3e4697ffdfbb Bluetooth: L2CAP: Fix attempting to access uninitialized memory
    81035e1201e2 Bluetooth: L2CAP: Fix accepting connection request for invalid SPSM
    d78ccdce662e i2c: piix4: Fix adapter not be removed in piix4_remove()
    c76ff8ae113f arm64: dts: juno: Add thermal critical trip points
    7398435e616d firmware: arm_scmi: Fix devres allocation device in virtio transport
    3653cdc21b9e firmware: arm_scmi: Make Rx chan_setup fail on memory errors
    e514d67b2364 firmware: arm_scmi: Suppress the driver's bind attributes
    4e68c5da60cd block: Fix possible memory leak for rq_wb on add_disk failure
    bf822b6980a6 arm64: dts: ls208xa: specify clock frequencies for the MDIO controllers
    f2329886e567 arm64: dts: ls1088a: specify clock frequencies for the MDIO controllers
    33fcc55dbc5b arm64: dts: lx2160a: specify clock frequencies for the MDIO controllers
    f3429a1e4924 arm64: dts: imx8: correct clock order
    de2a83186ad3 ARM: dts: imx6qdl-gw59{10,13}: fix user pushbutton GPIO offset
    cb9ce8910a6f clk: qcom: Update the force mem core bit for GPU clocks
    bdc118249698 efi/tpm: Pass correct address to memblock_reserve
    3a4d6f165eac i2c: xiic: Add platform module alias
    62eea4014a9b drm/amdgpu: set vm_update_mode=0 as default for Sienna Cichlid in SRIOV case
    7a2547cac2e0 HID: saitek: add madcatz variant of MMO7 mouse device ID
    931c97a54cd1 scsi: core: Restrict legal sdev_state transitions via sysfs
    c50ec15725e0 ACPI: APEI: Fix integer overflow in ghes_estatus_pool_init()
    8ecd1db58b7a media: v4l: subdev: Fail graciously when getting try data for NULL state
    f96ad391d054 media: meson: vdec: fix possible refcount leak in vdec_probe()
    8b785cdcd3cb media: dvb-frontends/drxk: initialize err to 0
    73dfb6421338 media: cros-ec-cec: limit msg.len to CEC_MAX_MSG_SIZE
    cbfa26936f31 media: s5p_cec: limit msg.len to CEC_MAX_MSG_SIZE
    647c12c47ee0 media: rkisp1: Zero v4l2_subdev_format fields in when validating links
    abbeb8f7271b media: rkisp1: Use correct macro for gradient registers
    03b30e5a369d media: rkisp1: Initialize color space on resizer sink and source pads
    d58b6b665c88 media: rkisp1: Don't pass the quantization to rkisp1_csm_config()
    0e501fd0f38e s390/cio: fix out-of-bounds access on cio_ignore free
    c65cc569370c s390/cio: derive cdev information only for IO-subchannels
    c64be93f1e51 s390/boot: add secure boot trailer
    1cdaca8f00a7 s390/uaccess: add missing EX_TABLE entries to __clear_user()
    509cbbdec9d7 mtd: parsers: bcm47xxpart: Fix halfblock reads
    5b8797e9dbf7 mtd: parsers: bcm47xxpart: print correct offset on read error
    2f07635876bd fbdev: stifb: Fall back to cfb_fillrect() on 32-bit HCRX cards
    154934c74f97 video/fbdev/stifb: Implement the stifb_fillrect() function
    b524b41806e9 drm/msm/hdmi: fix IRQ lifetime
    c55dd6200131 drm/msm/hdmi: Remove spurious IRQF_ONESHOT flag
    d153d468c43d vsock: fix possible infinite sleep in vsock_connectible_wait_data()
    0ed71af4d017 ipv6: fix WARNING in ip6_route_net_exit_late()
    2b45d6d0c41c net, neigh: Fix null-ptr-deref in neigh_table_clear()
    61defd6450a9 net/smc: Fix possible leaked pernet namespace in smc_init()
    de889774273f stmmac: dwmac-loongson: fix invalid mdio_node
    535b78739ae7 ibmvnic: Free rwi on reset success
    985a88bf0b27 net: mdio: fix undefined behavior in bit shift for __mdiobus_register
    aa16cac06b75 Bluetooth: L2CAP: Fix memory leak in vhci_write
    a3a7b2ac64de Bluetooth: L2CAP: fix use-after-free in l2cap_conn_del()
    cf2719a21fdb Bluetooth: virtio_bt: Use skb_put to set length
    8278a87bb1ee Bluetooth: L2CAP: Fix use-after-free caused by l2cap_reassemble_sdu
    42d20d5e2457 netfilter: ipset: enforce documented limit to prevent allocating huge memory
    f46ea5fa3320 btrfs: fix ulist leaks in error paths of qgroup self tests
    222a3d533027 btrfs: fix inode list leak during backref walking at find_parent_nodes()
    6ba3479f9e96 btrfs: fix inode list leak during backref walking at resolve_indirect_refs()
    a80634f392af isdn: mISDN: netjet: fix wrong check of device registration
    029d5b7688a2 mISDN: fix possible memory leak in mISDN_register_device()
    3e2129c67dac rose: Fix NULL pointer dereference in rose_send_frame()
    06d7596d1872 ipvs: fix WARNING in ip_vs_app_net_cleanup()
    5ee2d6b726b0 ipvs: fix WARNING in __ip_vs_cleanup_batch()
    33e7783bc07e ipvs: use explicitly signed chars
    6044791b7be7 netfilter: nf_tables: release flow rule object from commit path
    1ffe7100411a netfilter: nf_tables: netlink notifier might race to release objects
    dcc79cf735b8 net: tun: fix bugs for oversize packet when napi frags enabled
    fc4b50adb400 net: sched: Fix use after free in red_enqueue()
    ab80025ea7ac ata: pata_legacy: fix pdc20230_set_piomode()
    dede9ba02705 net: fec: fix improper use of NETDEV_TX_BUSY
    5dfdac5e3f8d nfc: nfcmrvl: Fix potential memory leak in nfcmrvl_i2c_nci_send()
    7486f5c90078 nfc: s3fwrn5: Fix potential memory leak in s3fwrn5_nci_send()
    3cba1f061bfe nfc: nxp-nci: Fix potential memory leak in nxp_nci_send()
    44bc1868a4f5 nfc: fdp: Fix potential memory leak in fdp_nci_send()
    4bef9a89f2f5 net: dsa: fall back to default tagger if we can't load the one from DT
    06f9e0b37f7e RDMA/qedr: clean up work queue on failure in qedr_alloc_resources()
    6b3d5dcb1234 RDMA/core: Fix null-ptr-deref in ib_core_cleanup()
    9f555b1584fc net: dsa: Fix possible memory leaks in dsa_loop_init()
    24641993a7dc nfs4: Fix kmemleak when allocate slot failed
    0797c85433cc NFSv4.2: Fixup CLONE dest file size for zero-length count
    d59722d088a9 SUNRPC: Fix null-ptr-deref when xps sysfs alloc failed
    dea7ef05deea NFSv4.1: We must always send RECLAIM_COMPLETE after a reboot
    7b1c2458dec1 NFSv4.1: Handle RECLAIM_COMPLETE trunking errors
    4ec017e30089 NFSv4: Fix a potential state reclaim deadlock
    e3e53c5af563 RDMA/hns: Disable local invalidate operation
    85ab79ac9413 RDMA/hns: Use hr_reg_xxx() instead of remaining roce_set_xxx()
    be16cc7abdae RDMA/hns: Remove magic number
    ba95409d6b58 IB/hfi1: Correctly move list in sc_disable()
    484d9690370e RDMA/cma: Use output interface for net_dev check
    f7d9de8a0d33 KVM: x86: Add compat handler for KVM_X86_SET_MSR_FILTER
    b7b66f13ac09 KVM: x86: Copy filter arg outside kvm_vm_ioctl_set_msr_filter()
    0c60fa7f5518 KVM: x86: Protect the unused bits in MSR exiting flags
    ad8e4868dd16 HID: playstation: add initial DualSense Edge controller support
    3a44ae4afaa5 mm/hugetlb: fix races when looking up a CONT-PTE/PMD size hugetlb page
    8576d7edeaa5 drm/amd/display: explicitly disable psr_feature_enable appropriately
    058b3a11f748 KVM: x86: Treat #DBs from the emulator as fault-like (code and DR7.GD=1)
    9ee32892c767 KVM: x86: Trace re-injected exceptions
    0c9c1306d6bd serial: ar933x: Deassert Transmit Enable on ->rs485_config()
    21d65b351691 scsi: lpfc: Rework MIB Rx Monitor debug info logic
    d70705e131d6 scsi: lpfc: Adjust CMF total bytes and rxmonitor
    9ebc6e8ad13b scsi: lpfc: Adjust bytes received vales during cmf timer interval
    793d8378b74a Linux 5.15.77
    1401e9336beb tcp/udp: Fix memory leak in ipv6_renew_options().
    b079d3775237 serial: Deassert Transmit Enable on probe in driver-specific way
    63f75fea3a72 serial: core: move RS485 configuration tasks from drivers into core
    0753069d4431 can: rcar_canfd: rcar_canfd_handle_global_receive(): fix IRQ storm on global FIFO receive
    17ff99e2240c can: rcar_canfd: fix channel specific IRQ handling for RZ/G2L
    aad798a0b39c scsi: sd: Revert "scsi: sd: Remove a local variable"
    52c2329147cf arm64: Add AMPERE1 to the Spectre-BHB affected list
    5397ea6a08a5 net: enetc: survive memory pressure without crashing
    885a454e97c4 kcm: do not sense pfmemalloc status in kcm_sendpage()
    92b4c5c3fa81 net: do not sense pfmemalloc status in skb_append_pagefrags()
    ae1b08592edf net/mlx5: Fix crash during sync firmware reset
    37ada47d019b net/mlx5: Update fw fatal reporter state on PCI handlers successful recover
    9e6523d06a09 net/mlx5: Print more info on pci error handlers
    ab3de780c176 net/mlx5: Fix possible use-after-free in async command interface
    8bbff203e306 net/mlx5e: Extend SKB room check to include PTP-SQ
    ee1c0ca1af7c net/mlx5e: Do not increment ESN when updating IPsec ESN state
    eefa97a7a001 netdevsim: remove dir in nsim_dev_debugfs_init() when creating ports dir failed
    c9589e18a60c net: broadcom: bcm4908_enet: update TX stats after actual transmission
    9711616a4908 net: broadcom: bcm4908enet: remove redundant variable bytes
    b317d53680b1 nh: fix scope used to find saddr when adding non gw nh
    2ad284ac8866 net: bcmsysport: Indicate MAC is in charge of PHY PM
    d1cfa71d5b68 net: ehea: fix possible memory leak in ehea_register_port()
    588bdd7ee48f openvswitch: switch from WARN to pr_warn
    9a1c1df9255b ALSA: aoa: Fix I2S device accounting
    e81d7826b8f4 ALSA: aoa: i2sbus: fix possible memory leak in i2sbus_add_dev()
    77a754fcfec1 net: ethernet: ave: Fix MAC to be in charge of PHY PM
    bc2518ec710e net: fec: limit register access on i.MX6UL
    f710deeea73a perf vendor events arm64: Fix incorrect Hisi hip08 L3 metrics
    eb59cb2fabd4 PM: domains: Fix handling of unavailable/disabled idle states
    bde7c2acef30 net: ksz884x: fix missing pci_disable_device() on error in pcidev_init()
    8927d90d56e4 i40e: Fix flow-type by setting GL_HASH_INSET registers
    c39de3ae5075 i40e: Fix VF hang when reset is triggered on another VF
    250bf8ab78f7 i40e: Fix ethtool rx-flow-hash setting for X722
    ad3f1d9bf162 ipv6: ensure sane device mtu in tunnels
    e2ec5bb78ca8 perf vendor events power10: Fix hv-24x7 metric events
    f9df388ed6ea media: vivid: set num_in/outputs to 0 if not supported
    4cc7d8d42047 media: videodev2.h: V4L2_DV_BT_BLANKING_HEIGHT should check 'interlaced'
    491c0959f01d media: v4l2-dv-timings: add sanity checks for blanking values
    0f83edbe4fe9 media: vivid: dev->bitmap_cap wasn't freed in all cases
    5b1fb2a28d0a media: vivid: s_fbuf: add more sanity checks
    3436e5633776 PM: hibernate: Allow hybrid sleep to work with s2idle
    3cc8c4088fae can: mcp251x: mcp251x_can_probe(): add missing unregister_candev() in error path
    a3e09eff32d8 can: mscan: mpc5xxx: mpc5xxx_can_probe(): add missing put_clock() in error path
    304a10161696 drm/amdkfd: Fix memory leak in kfd_mem_dmamap_userptr()
    2fe6b24ce299 net-memcg: avoid stalls when under memory pressure
    9b171fdcbf0e tcp: fix indefinite deferral of RTO with SACK reneging
    a85d39f14aa8 tcp: fix a signed-integer-overflow bug in tcp_add_backlog()
    2437f3c5c6a6 tcp: minor optimization in tcp_add_backlog()
    ef27df75912d net: lantiq_etop: don't free skb when returning NETDEV_TX_BUSY
    a1e18acb0246 net: fix UAF issue in nfqnl_nf_hook_drop() when ops_init() failed
    62086d1c4602 kcm: annotate data-races around kcm->rx_wait
    342d918cf9a4 kcm: annotate data-races around kcm->rx_psock
    6bb23225bb70 atlantic: fix deadlock at aq_nic_stop
    4e2cbc1f0e18 drm/i915/dp: Reset frl trained flag before restarting FRL training
    3d92ab0865f1 amd-xgbe: add the bit rate quirk for Molex cables
    75a6d1ebf8b7 amd-xgbe: fix the SFP compliance codes check for DAC cables
    98bada8fa0e3 x86/unwind/orc: Fix unreliable stack dump with gcov
    88e879c9f595 nfc: virtual_ncidev: Fix memory leak in virtual_nci_send()
    18c60b383df3 net: macb: Specify PHY PM management done by MAC
    95c22fc1e80e net: hinic: fix the issue of double release MBOX callback of VF
    6016d96a6adf net: hinic: fix the issue of CMDQ memory leaks
    e6765fe8de37 net: hinic: fix memory leak when reading function table
    62aa78a0c3e5 net: hinic: fix incorrect assignment issue in hinic_set_interrupt_cfg()
    1e0bee973ef6 net: netsec: fix error handling in netsec_register_mdio()
    7a939503fc32 tipc: fix a null-ptr-deref in tipc_topsrv_accept
    c638b520ba4b perf/x86/intel/lbr: Use setup_clear_cpu_cap() instead of clear_cpu_cap()
    4fdf6f978c6b ALSA: ac97: fix possible memory leak in snd_ac97_dev_register()
    b68873690373 ASoC: qcom: lpass-cpu: Mark HDMI TX parity register as volatile
    eca851572df5 mtd: rawnand: intel: Add missing of_node_put() in ebu_nand_probe()
    08c246c7dfef arc: iounmap() arg is volatile
    739eac37ff9c sched/core: Fix comparison in sched_group_cookie_match()
    ca7b0a10287e perf: Fix missing SIGTRAPs
    eb77474a2a21 ASoC: qcom: lpass-cpu: mark HDMI TX registers as volatile
    9b6841ab7096 KVM: selftests: Fix number of pages for memory slot in memslot_modification_stress_test
    59de8738ed43 drm/msm: Fix return type of mdp4_lvds_connector_mode_valid
    a560aeac2f2d media: atomisp: prevent integer overflow in sh_css_set_black_frame()
    32f93e460861 media: v4l2: Fix v4l2_i2c_subdev_set_name function documentation
    5a93a8288c57 net: ieee802154: fix error return code in dgram_bind()
    138a13d8f5c8 ethtool: eeprom: fix null-deref on genl_info in dump
    1c2b1d3bba2e mmc: block: Remove error check of hw_reset on reset
    0b0d169723f4 Revert "scsi: lpfc: SLI path split: Refactor lpfc_iocbq"
    7a0fce24de60 Revert "scsi: lpfc: SLI path split: Refactor fast and slow paths to native SLI4"
    7a36c9de4324 Revert "scsi: lpfc: SLI path split: Refactor SCSI paths"
    eb8be2dbfbb4 Revert "scsi: lpfc: Fix locking for lpfc_sli_iocbq_lookup()"
    065bf71a8a53 Revert "scsi: lpfc: Fix element offset in __lpfc_sli_release_iocbq_s4()"
    97dc9076ea5e Revert "scsi: lpfc: Resolve some cleanup issues following SLI path refactoring"
    b32b766be44e s390/pci: add missing EX_TABLE entries to __pcistg_mio_inuser()/__pcilg_mio_inuser()
    1ad7213fcf49 s390/futex: add missing EX_TABLE entry to __futex_atomic_op()
    ae9398e837b9 perf auxtrace: Fix address filter symbol name match for modules
    14009ada5712 ARC: mm: fix leakage of memory allocated for PTE
    eb9ed3343ca7 pinctrl: Ingenic: JZ4755 bug fixes
    94d2643df1e7 kernfs: fix use-after-free in __kernfs_remove
    f1204dfc4cd7 counter: microchip-tcb-capture: Handle Signal1 read and Synapse
    6fb0106c64ee mmc: sdhci-esdhc-imx: Propagate ESDHC_FLAG_HS400* only on 8bit bus
    73e3901e7029 mmc: sdhci-pci-core: Disable ES for ASUS BIOS on Jasper Lake
    1e8cd93ae536 mmc: core: Fix kernel panic when remove non-standard SDIO card
    02e51e7cd1d3 mmc: sdhci_am654: 'select', not 'depends' REGMAP_MMIO
    4c365a0c21aa coresight: cti: Fix hang in cti_disable_hw()
    b32775e03969 drm/msm/dp: fix IRQ lifetime
    b48949ab451e drm/msm/hdmi: fix memory corruption with too many bridges
    9f035d1fb306 drm/msm/dsi: fix memory corruption with too many bridges
    986a89b3717e drm/amdgpu: disallow gfxoff until GC IP blocks complete s2idle resume
    a2f0934e6bdb scsi: qla2xxx: Use transport-defined speed mask for supported_speeds
    2b1a3172ee4d mac802154: Fix LQI recording
    46b4b1e11e52 exec: Copy oldsighand->action under spin-lock
    265b6fb780f5 fs/binfmt_elf: Fix memory leak in load_elf_binary()
    24030742a7b8 cpufreq: intel_pstate: hybrid: Use known scaling factor for P-cores
    3423a3417f4f cpufreq: intel_pstate: Read all MSRs on the target CPU
    cc6a7249842f fbdev: smscufx: Fix several use-after-free bugs
    1a8b22e3f394 iio: adxl372: Fix unsafe buffer attributes
    2f08cad21366 iio: temperature: ltc2983: allocate iio channels once
    1bfe97f49785 iio: light: tsl2583: Fix module unloading
    569709540e12 tools: iio: iio_utils: fix digit calculation
    c892a81c7424 xhci: Remove device endpoints from bandwidth list when freeing the device
    dfacb5c7f0a9 xhci-pci: Set runtime PM as default policy on all xHC 1.2 or later devices
    64058af657ba xhci: Add quirk to reset host back to default state at shutdown
    022f21e850e9 mtd: rawnand: marvell: Use correct logic for nand-keep-config
    f90897c0f634 usb: xhci: add XHCI_SPURIOUS_SUCCESS to ASM1042 despite being a V0.96 controller
    a0c54d5152d5 usb: bdc: change state when port disconnected
    e0fd70ab4815 usb: dwc3: gadget: Don't set IMI for no_interrupt
    ad538aea64dd usb: dwc3: gadget: Stop processing more requests on IMI
    f2f53be61714 usb: gadget: uvc: fix sg handling during video encode
    80ff4ef77737 usb: gadget: uvc: fix sg handling in error case
    555011f6b27b USB: add RESET_RESUME quirk for NVIDIA Jetson devices in RCM
    311428871ba1 ALSA: rme9652: use explicitly signed char
    fa8b39c7ed82 ALSA: au88x0: use explicitly signed char
    8af82d330d5d ALSA: usb-audio: Add quirks for M-Audio Fast Track C400/600
    259cb4dee1bb ALSA: Use del_timer_sync() before freeing timer
    33ddee2b95ab can: kvaser_usb: Fix possible completions during init_completion
    86da269c7567 can: j1939: transport: j1939_session_skb_drop_old(): spin_unlock_irqrestore() before kfree_skb()
    ead049562758 NFSv4: Add an fattr allocation to _nfs4_discover_trunking()
    eb1fe9600b86 NFSv4: Fix free of uninitialized nfs4_label on referral lookup.
    4f5365f77018 Linux 5.15.76
    33fc9e26b7cb mm: /proc/pid/smaps_rollup: fix no vma's null-deref
    b9d8cbe90a0f mmc: core: Add SD card quirk for broken discard
    0ee2f0567a56 Makefile.debug: re-enable debug info for .S files
    117825e9bbb1 x86/Kconfig: Drop check for -mabi=ms for CONFIG_EFI_STUB
    0983205085fa ACPI: video: Force backlight native for more TongFang devices
    289b56715ba6 perf: Skip and warn on unknown format 'configN' attrs
    9d912a385368 mmc: sdhci-tegra: Use actual clock rate for SW tuning correction
    7aeda81191fd tracing: Do not free snapshot if tracer is on cmdline
    57252e7bd491 tracing: Simplify conditional compilation code in tracing_set_tracer()
    20bc6d23f7f6 ksmbd: fix incorrect handling of iterate_dir
    3c8cfcaa2d9a ksmbd: handle smb2 query dir request for OutputBufferLength that is too small
    8754fa5dbc6e arm64: mte: move register initialization to C
    ea7be82fd7e1 fs: dlm: fix invalid derefence of sb_lvbptr
    0365d6af75f9 iommu/vt-d: Clean up si_domain in the init_dmars() error path
    5c95d0c9d0eb iommu/vt-d: Allow NVS regions in arch_rmrr_sanity_check()
    209740fd132e net: phy: dp83822: disable MDI crossover status change interrupt
    ce1234573d18 net: sched: fix race condition in qdisc_graft()
    91f8f5342bee net: hns: fix possible memory leak in hnae_ae_register()
    50c31fa95230 wwan_hwsim: fix possible memory leak in wwan_hwsim_dev_new()
    d2fc83a6b55e sfc: include vport_id in filter spec hash and equal()
    c2e1e59d59fa net: sched: sfb: fix null pointer access issue when sfb_init() fails
    34f2a4eedc8e net: sched: delete duplicate cleanup of backlog and qlen
    154f4c06d9db net: sched: cake: fix null pointer access issue when cake_init() fails
    5efed7578dd4 nvmet: fix workqueue MEM_RECLAIM flushing dependency
    2f2b84b02088 nvme-hwmon: kmalloc the NVME SMART log buffer
    66c56b232839 nvme-hwmon: consistently ignore errors from nvme_hwmon_init
    d77f6908f9ce netfilter: nf_tables: relax NFTA_SET_ELEM_KEY_END set flags requirements
    efa9dd7e679e ionic: catch NULL pointer issue on reconfig
    35ece858660e net: hsr: avoid possible NULL deref in skb_clone()
    e326df21da25 dm: remove unnecessary assignment statement in alloc_dev()
    847301f0ee1c cifs: Fix xid leak in cifs_ses_add_channel()
    8905d13b9ede cifs: Fix xid leak in cifs_flock()
    27cfd3afaab0 cifs: Fix xid leak in cifs_copy_file_range()
    593d877c39aa cifs: Fix xid leak in cifs_create()
    a8df9d0428c7 udp: Update reuse->has_conns under reuseport_lock.
    9749595feb33 scsi: lpfc: Fix memory leak in lpfc_create_port()
    b9122e0e0ea8 net: phylink: add mac_managed_pm in phylink_config structure
    412db9b06d3c net: phy: dp83867: Extend RX strap quirk for SGMII mode
    5ce613051994 net/atm: fix proc_mpc_write incorrect return value
    0eb17faedce7 sfc: Change VF mac via PF as first preference if available.
    0f58940ca3c1 HID: magicmouse: Do not set BTN_MOUSE on double report
    94a171c982b8 i40e: Fix DMA mappings leak
    dbc01c0a4e20 tipc: fix an information leak in tipc_topsrv_kern_subscr
    b294cad6f02e tipc: Fix recognition of trial period
    6161c364e378 ACPI: extlog: Handle multiple records
    40e5fceddfd5 drm/vc4: Add module dependency on hdmi-codec
    6c5041a10324 btrfs: fix processing of delayed tree block refs during backref walking
    af67578d565c btrfs: fix processing of delayed data refs during backref walking
    c439cafce8cf x86/topology: Fix duplicated core ID within a package
    d31f4bc22596 x86/topology: Fix multiple packages shown on a single-package system
    fcc96e89b3ff media: venus: dec: Handle the case where find_format fails
    b22b4823a0a5 media: mceusb: set timeout to at least timeout provided
    5265cc1202a3 media: ipu3-imgu: Fix NULL pointer dereference in active selection access
    1e4e71f9e197 KVM: arm64: vgic: Fix exit condition in scan_its_table()
    5bf2fda26a72 kvm: Add support for arch compat vm ioctls
    112a005d1ded mm,hugetlb: take hugetlb_lock before decrementing h->resv_huge_pages
    2d508b4e6536 drm/amdgpu: fix sdma doorbell init ordering on APUs
    b5606e3ab1f7 cpufreq: qcom: fix memory leak in error path
    d866f5982c15 x86/resctrl: Fix min_cbm_bits for AMD
    8fbe13de1cc7 ata: ahci: Match EM_MAX_SLOTS with SATA_PMP_MAX_PORTS
    5d6a037b3a94 ata: ahci-imx: Fix MODULE_ALIAS
    30cf0dee372b hwmon/coretemp: Handle large core ID value
    2f7171465f26 x86/microcode/AMD: Apply the patch early on every logical thread
    93d7e2b47a72 i2c: qcom-cci: Fix ordering of pm_runtime_xx and i2c_add_adapter
    14d260f94ff8 cpufreq: qcom: fix writes in read-only memory region
    3006766d247b selinux: enable use of both GFP_KERNEL and GFP_ATOMIC in convert_context()
    1b31cb0065e2 ocfs2: fix BUG when iput after ocfs2_mknod fails
    e469db818ec9 ocfs2: clear dinode links count in case of error
    ded9d535be0d btrfs: enhance unsupported compat RO flags handling
    537412c54712 perf/x86/intel/pt: Relax address filter validation
    8ddc58e0e312 arm64: errata: Remove AES hwcap for COMPAT tasks
    738515cf8bb4 usb: gadget: uvc: improve sg exit condition
    db11d8c72a5d usb: gadget: uvc: giveback vb2 buffer on req complete
    aee340dccf5a usb: gadget: uvc: rework uvcg_queue_next_buffer to uvcg_complete_buffer
    2f54ce7392d7 usb: gadget: uvc: use on returned header len in video_encode_isoc_sg
    d80db2f1450c usb: gadget: uvc: consistently use define for headerlen
    f9681a67503e arm64/mm: Consolidate TCR_EL1 fields
    5b20aacff7ad r8152: add PID for the Lenovo OneLink+ Dock
    bd8a595958a5 Linux 5.15.75
    b6e2c54be37d io-wq: Fix memory leak in worker creation
    7c359e28492f gcov: support GCC 12.1 and newer compilers
    8418c1672c1f thermal: intel_powerclamp: Use first online CPU as control_cpu
    55c824b62067 ext4: continue to expand file system when the target size doesn't reach
    0e63de6d7e4c lib/Kconfig.debug: Add check for non-constant .{s,u}leb128 support to DWARF5
    84cd0b20fada Kconfig.debug: add toolchain checks for DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
    371aaf6b48f5 Kconfig.debug: simplify the dependency of DEBUG_INFO_DWARF4/5
    e1591557e3a0 drm/amd/display: Fix build breakage with CONFIG_DEBUG_FS=n
    34f31a2b6679 net/ieee802154: don't warn zero-sized raw_sendmsg()
    de904d0fe1cb Revert "net/ieee802154: reject zero-sized raw_sendmsg()"
    9c65eef9d6c9 net: ethernet: ti: davinci_mdio: fix build for mdio bitbang uses
    d7eadffce032 blk-wbt: fix that 'rwb->wc' is always set to 1 in wbt_init()
    28787ff9fbea ALSA: usb-audio: Fix last interface check for registration
    b8989e95d74e net: ieee802154: return -EINVAL for unknown addr type
    0db2efb3bff8 mm: hugetlb: fix UAF in hugetlb_handle_userfault
    98aada6e2278 io_uring/rw: fix unexpected link breakage
    d6b7efc722a2 io_uring/rw: fix error'ed retry return values
    e857457c6f90 io_uring/rw: fix short rw error handling
    cd148d4e3183 io_uring: correct pinned_vm accounting
    813d8fe5d303 io_uring/af_unix: defer registered files gc to io_uring release
    c69a2324fc6b perf intel-pt: Fix segfault in intel_pt_print_info() with uClibc
    e81bf40b280b clk: bcm2835: Round UART input clock up
    da17cbb229af clk: bcm2835: Make peripheral PLLC critical
    20b8c456df58 usb: idmouse: fix an uninit-value in idmouse_open
    ec8adf767e1c nvmet-tcp: add bounds check on Transfer Tag
    1c6432884010 nvme: copy firmware_rev on each init
    b9b5560b342e ext2: Use kvmalloc() for group descriptor array
    8c067a3051cd scsi: tracing: Fix compile error in trace_array calls when TRACING is disabled
    39bef9c6a91b staging: rtl8723bs: fix a potential memory leak in rtw_init_cmd_priv()
    b4573a2bad3c staging: rtl8723bs: fix potential memory leak in rtw_init_drv_sw()
    eb24d93e3e01 Revert "usb: storage: Add quirk for Samsung Fit flash"
    3a38985d8bfd usb: dwc3: core: Enable GUCTL1 bit 10 for fixing termination error after resume bug
    9d4f84a15f9c arm64: dts: imx8mp: Add snps,gfladj-refclk-lpm-sel quirk to USB nodes
    3c84c7f592c4 usb: musb: Fix musb_gadget.c rxstate overflow bug
    fcd594da0b59 usb: host: xhci: Fix potential memory leak in xhci_alloc_stream_info()
    9e86dffd0b02 md/raid5: Wait for MD_SB_CHANGE_PENDING in raid5d
    f8e80792c1a8 eventfd: guard wake_up in eventfd fs calls as well
    c61786dc727d HID: roccat: Fix use-after-free in roccat_read()
    f7f425d61de9 soundwire: intel: fix error handling on dai registration issues
    093a5463aeec soundwire: cadence: Don't overwrite msg->buf during write commands
    1b4ed920b2ff bcache: fix set_at_max_writeback_rate() for multiple attached devices
    eecb5ccc84a1 ata: libahci_platform: Sanity check the DT child nodes number
    70b2adb1d698 blk-throttle: prevent overflow while calculating wait time
    ff8551d411f1 staging: vt6655: fix potential memory leak
    7c8bc374659d power: supply: adp5061: fix out-of-bounds read in adp5061_get_chg_type()
    3d6946180734 iommu/arm-smmu-v3: Make default domain type of HiSilicon PTT device to identity
    c0d73be0af8c nbd: Fix hung when signal interrupts nbd_start_device_ioctl()
    9d54de866062 scsi: 3w-9xxx: Avoid disabling device if failing to enable it
    d68da10b0cce dmaengine: ti: k3-udma: Reset UDMA_CHAN_RT byte counters to prevent overflow
    518a2a1cc361 usb: host: xhci-plat: suspend/resume clks for brcm
    f002aa7c0ac5 usb: host: xhci-plat: suspend and resume clocks
    6bcd745c87a0 clk: zynqmp: pll: rectify rate rounding in zynqmp_pll_round_rate
    5c32cbf6ccea media: platform: fix some double free in meson-ge2d and mtk-jpeg and s5p-mfc
    6f21976095c1 media: cx88: Fix a null-ptr-deref bug in buffer_prepare()
    0a07b13af04d clk: zynqmp: Fix stack-out-of-bounds in strncpy`
    3680442cbaee ARM: 9242/1: kasan: Only map modules if CONFIG_KASAN_VMALLOC=n
    4a89c0befca7 btrfs: don't print information about space cache or tree every remount
    39a07058c762 btrfs: scrub: try to fix super block errors
    f3857dd7c03a btrfs: dump extra info if one free space cache has more bitmaps than it should
    d3c6d5be46de arm64: dts: imx8mq-librem5: Add bq25895 as max17055's power supply
    82046b6a84e0 kselftest/arm64: Fix validatation termination record after EXTRA_CONTEXT
    35365417333d ARM: dts: imx6sx: add missing properties for sram
    602813650cbc ARM: dts: imx6sll: add missing properties for sram
    6a12e1e23cb1 ARM: dts: imx6sl: add missing properties for sram
    8c24dc621bb7 ARM: dts: imx6qp: add missing properties for sram
    47666b9a11a1 ARM: dts: imx6dl: add missing properties for sram
    19fe40c5185d ARM: dts: imx6q: add missing properties for sram
    9361ba779152 ARM: dts: imx7d-sdb: config the max pressure for tsc2046
    0f90671ff93f drm/amd/display: Remove interface for periodic interrupt 1
    88fd06740659 drm/dp: Don't rewrite link config when setting phy test pattern
    668806a8268b mmc: sdhci-msm: add compatible string check for sdm670
    587c7da87721 drm/meson: explicitly remove aggregate driver at module unload time
    d76ff04a72f9 drm/meson: reorder driver deinit sequence to fix use-after-free bug
    d894db35617f drm/amdgpu: fix initial connector audio value
    e3675f688d3b ASoC: SOF: pci: Change DMI match info to support all Chrome platforms
    f16e1b7b3968 platform/x86: msi-laptop: Change DMI match / alias strings to fix module autoloading
    39da49ffa2f3 platform/chrome: cros_ec: Notify the PM of wake events during resume
    74636047845c drm: panel-orientation-quirks: Add quirk for Anbernic Win600
    2810061452f9 drm/vc4: vec: Fix timings for VEC modes
    0506c4eae9a9 ALSA: usb-audio: Register card at the last interface
    39d7a81bbb7a drm: bridge: dw_hdmi: only trigger hotplug event on link change
    dfbed8c92eb8 udmabuf: Set ubuf->sg = NULL if the creation of sg table fails
    a47d92c74b1e drm/amd/display: fix overflow on MIN_I64 definition
    a29f7427041a gpu: lontium-lt9611: Fix NULL pointer dereference in lt9611_connector_init()
    5ff7bec678ca drm/komeda: Fix handling of atomic commits in the atomic_commit_tail hook
    ca163e389f0a drm: Prevent drm_copy_field() to attempt copying a NULL pointer
    df5ac9392648 drm: Use size_t type for len variable in drm_copy_field()
    5ab84b1596b2 drm/nouveau/nouveau_bo: fix potential memory leak in nouveau_bo_alloc()
    b3179865cf7e r8152: Rate limit overflow messages
    d1e894f950ad Bluetooth: L2CAP: Fix user-after-free
    124b7c773271 net: If sock is dead don't access sock's sk_wq in sk_stream_wait_memory
    5b94d48898d9 hwmon: (sht4x) do not overflow clamping operation on 32-bit platforms
    a269c3e39087 wifi: rt2x00: correctly set BBP register 86 for MT7620
    b5e6ada5a5d6 wifi: rt2x00: set SoC wmac clock register
    357c89074ae6 wifi: rt2x00: set VGC gain for both chains of MT7620
    92e2e04da567 wifi: rt2x00: set correct TX_SW_CFG1 MAC register for MT7620
    4304b8e07579 wifi: rt2x00: don't run Rt5592 IQ calibration on MT7620
    4a5eab200e43 can: bcm: check the result of can_send() in bcm_can_tx()
    3423a50fa018 Bluetooth: hci_sysfs: Fix attempting to call device_add multiple times
    3ac837cef1fb Bluetooth: L2CAP: initialize delayed works at l2cap_chan_create()
    af46b2b9b096 wifi: mt76: mt7921: reset msta->airtime_ac while clearing up hw value
    e33da263e965 regulator: core: Prevent integer underflow
    d58c8781c0d7 Bluetooth: btintel: Mark Intel controller to support LE_STATES quirk
    232d59eca07f wifi: brcmfmac: fix use-after-free bug in brcmf_netdev_start_xmit()
    37f15edba22d iavf: Fix race between iavf_close and iavf_reset_task
    03155680191e xfrm: Update ipcomp_scratches with NULL when freed
    716c526d666d thunderbolt: Add back Intel Falcon Ridge end-to-end flow control workaround
    b1b4144508ad wifi: ath9k: avoid uninit memory read in ath9k_htc_rx_msg()
    839f563c5dc5 x86/mce: Retrieve poison range from hardware
    1663629bc3ff tcp: annotate data-race around tcp_md5sig_pool_populated
    7b03296b4f7a openvswitch: Fix overreporting of drops in dropwatch
    ffd7a1dcae9a openvswitch: Fix double reporting of drops in dropwatch
    d449d00a8dce net: ethernet: ti: davinci_mdio: Add workaround for errata i2329
    624f03a027f2 ice: set tx_tstamps when creating new Tx rings via ethtool
    2e52d858de3a bpftool: Clear errno after libcap's checks
    75995ce1c926 wifi: brcmfmac: fix invalid address access when enabling SCAN log level
    83b94969751a NFSD: fix use-after-free on source server when doing inter-server copy
    118dc74b2bc0 NFSD: Return nfserr_serverfault if splice_ok but buf->pages have data
    066b1302f2a9 x86/entry: Work around Clang __bdos() bug
    06c56c9d5da8 ACPI: x86: Add a quirk for Dell Inspiron 14 2-in-1 for StorageD3Enable
    6733222f2cc9 ARM: decompressor: Include .data.rel.ro.local
    561490843445 thermal: intel_powerclamp: Use get_cpu() instead of smp_processor_id() to avoid crash
    139bbbd01114 powercap: intel_rapl: fix UBSAN shift-out-of-bounds issue
    a1387ae83e97 MIPS: BCM47XX: Cast memcmp() of function to (void *)
    c2790fede920 cpufreq: intel_pstate: Add Tigerlake support in no-HWP mode
    30eca146c89d ACPI: tables: FPDT: Don't call acpi_os_map_memory() on invalid phys address
    5374638222d0 ACPI: video: Add Toshiba Satellite/Portege Z830 quirk
    7ed95b080334 rcu-tasks: Convert RCU_LOCKDEP_WARN() to WARN_ONCE()
    cf38a05eb1d0 rcu: Back off upon fill_page_cache_func() allocation failure
    3e2d8b89f031 rcu: Avoid triggering strict-GP irq-work when RCU is idle
    27d3e646dd83 fs: dlm: fix race in lowcomms
    b6b87460f4eb selftest: tpm2: Add Client.__del__() to close /dev/tpm* handle
    497d736784e5 f2fs: fix to account FS_CP_DATA_IO correctly
    fb1dcc2a9e4b f2fs: fix race condition on setting FI_NO_EXTENT flag
    6ddbd411a00a ACPI: APEI: do not add task_work to kernel thread to avoid memory leak
    21f1ba52b88c thermal/drivers/qcom/tsens-v0_1: Fix MSM8939 fourth sensor hw_id
    172c8a24fc83 crypto: cavium - prevent integer overflow loading firmware
    12acfa1059ad crypto: marvell/octeontx - prevent integer overflows
    c963ce2fa05d kbuild: rpm-pkg: fix breakage when V=1 is used
    059ce6b68b76 kbuild: remove the target in signal traps when interrupted
    1e9c23db31b6 tracing/osnoise: Fix possible recursive locking in stop_per_cpu_kthreads
    84795de93e1f tracing: kprobe: Make gen test module work in arm and riscv
    867fce09aa20 tracing: kprobe: Fix kprobe event gen test module on exit
    a9990f24adfe iommu/iova: Fix module config properly
    f0cac6cc02a9 cifs: return correct error in ->calc_signature()
    1f1ab76e2515 crypto: qat - fix DMA transfer direction
    393307b99aac crypto: inside-secure - Change swab to swab32
    93538944ab0b crypto: ccp - Release dma channels before dmaengine unrgister
    779a9930f3e1 crypto: akcipher - default implementation for setting a private key
    0c7043a5b5c3 iommu/omap: Fix buffer overflow in debugfs
    046803b74d51 cgroup/cpuset: Enable update_tasks_cpumask() on top_cpuset
    771d8aa02dac crypto: hisilicon/qm - fix missing put dfx access
    9bf3ec61a246 crypto: qat - fix default value of WDT timer
    3bfc220e5ce3 hwrng: imx-rngc - Moving IRQ handler registering after imx_rngc_irq_mask_clear()
    507128a0e32d cgroup: Honor caller's cgroup NS when resolving path
    8ffe511b7de7 hwrng: arm-smccc-trng - fix NO_ENTROPY handling
    272093471305 crypto: hisilicon/zip - fix mismatch in get/set sgl_sge_nr
    e0b4ebf59834 crypto: sahara - don't sleep when in softirq
    8484023b5763 powerpc/pseries/vas: Pass hw_cpu_id to node associativity HCALL
    7f536a8cb62d powerpc/kprobes: Fix null pointer reference in arch_prepare_kprobe()
    1f98f8f43541 powerpc: Fix SPE Power ISA properties for e500v1 platforms
    72c5b7110fba powerpc/64s: Fix GENERIC_CPU build flags for PPC970 / G5
    399afe92f640 x86/hyperv: Fix 'struct hv_enlightened_vmcs' definition
    592b302d8bf6 powerpc: Fix fallocate and fadvise64_64 compat parameter combination
    61af84b3db81 powerpc/powernv: add missing of_node_put() in opal_export_attrs()
    5be9cb6c06fa powerpc/pci_dn: Add missing of_node_put()
    5a13d3f1af1c powerpc/sysdev/fsl_msi: Add missing of_node_put()
    b0c0490b3c57 powerpc/math_emu/efp: Include module.h
    93379dc92de0 powerpc/configs: Properly enable PAPR_SCM in pseries_defconfig
    25a4fb0e1a76 mailbox: bcm-ferxrm-mailbox: Fix error check for dma_map_sg
    b8fcd9ab0f65 mailbox: mpfs: account for mbox offsets while sending
    ba2264359525 mailbox: mpfs: fix handling of the reg property
    fad007a315fe clk: ast2600: BCLK comes from EPLL
    3441076f83aa clk: ti: dra7-atl: Fix reference leak in of_dra7_atl_clk_probe
    9209e6bab75d clk: imx: scu: fix memleak on platform_device_add() fails
    bdf72f2d649b clk: bcm2835: fix bcm2835_clock_rate_from_divisor declaration
    e338131e980b clk: baikal-t1: Add SATA internal ref clock buffer
    35b766027580 clk: baikal-t1: Add shared xGMAC ref/ptp clocks internal parent
    b2db8b2c5391 clk: baikal-t1: Fix invalid xGMAC PTP clock divider
    435a8a39c6ae clk: vc5: Fix 5P49V6901 outputs disabling when enabling FOD
    b0bc75fe6775 spmi: pmic-arb: correct duplicate APID to PPID mapping logic
    faabbb103d60 usb: mtu3: fix failed runtime suspend in host only mode
    57f66534a41a dmaengine: ioat: stop mod_timer from resurrecting deleted timer in __cleanup()
    8aa96c5bc393 clk: mediatek: mt8183: mfgcfg: Propagate rate changes to parent
    2dafc5afd9d6 mfd: sm501: Add check for platform_driver_register()
    d43d93dbd8aa mfd: fsl-imx25: Fix check for platform_get_irq() errors
    b940bb3c8154 mfd: lp8788: Fix an error handling path in lp8788_irq_init() and lp8788_irq_init()
    0715005c483e mfd: lp8788: Fix an error handling path in lp8788_probe()
    aec1f073f91f mfd: fsl-imx25: Fix an error handling path in mx25_tsadc_setup_irq()
    53bfc1c3c751 mfd: intel_soc_pmic: Fix an error handling path in intel_soc_pmic_i2c_probe()
    2f921d62c236 fsi: core: Check error number after calling ida_simple_get
    041c79f6aefb RDMA/rxe: Fix resize_finish() in rxe_queue.c
    959d4ee095e9 clk: qcom: gcc-sm6115: Override default Alpha PLL regs
    8e556f557368 clk: qcom: apss-ipq6018: mark apcs_alias0_core_clk as critical
    a26b0658751b scsi: iscsi: iscsi_tcp: Fix null-ptr-deref while calling getpeername()
    e87fb1fcf88f scsi: iscsi: Run recv path from workqueue
    c2af03a7c1b5 scsi: iscsi: Add recv workqueue helpers
    d6aafc21bef1 scsi: iscsi: Rename iscsi_conn_queue_work()
    e45a1516d293 scsi: libsas: Fix use-after-free bug in smp_execute_task_sg()
    6a54f769748b serial: 8250: Fix restoring termios speed after suspend
    a5dba0933834 firmware: google: Test spinlock on panic path to avoid lockups
    60d14575d0ba slimbus: qcom-ngd-ctrl: allow compile testing without QCOM_RPROC_COMMON
    f19e5b7df545 staging: vt6655: fix some erroneous memory clean-up loops
    433c33c554d7 phy: qualcomm: call clk_disable_unprepare in the error handling
    c4293def8860 tty: serial: fsl_lpuart: disable dma rx/tx use flags in lpuart_dma_shutdown
    a91a3c2d8db8 serial: 8250: Toggle IER bits on only after irq has been set up
    6be8e565a4a6 drivers: serial: jsm: fix some leaks in probe
    1d05df7757f4 usb: gadget: function: fix dangling pnp_string in f_printer.c
    ed2c66b75280 xhci: Don't show warning for reinit on known broken suspend
    4d7d8f5cb284 IB: Set IOVA/LENGTH on IB_MR in core/uverbs layers
    e221b4f16e9e RDMA/cm: Use SLID in the work completion as the DLID in responder side
    7a37c58ee72e md/raid5: Remove unnecessary bio_put() in raid5_read_one_chunk()
    b467d9460ec2 md/raid5: Ensure stripe_fill happens on non-read IO with journal
    5d8259c9d191 md: Replace snprintf with scnprintf
    9e92d5ca5424 mtd: rawnand: meson: fix bit map use in meson_nfc_ecc_correct()
    058833dbeb8d ata: fix ata_id_has_dipm()
    dad910a6d4a5 ata: fix ata_id_has_ncq_autosense()
    21faddeff7bf ata: fix ata_id_has_devslp()
    204cc767dcb5 ata: fix ata_id_sense_reporting_enabled() and ata_id_has_sense_reporting()
    5c75d608fad5 RDMA/siw: Fix QP destroy to wait for all references dropped.
    308cd50f174c RDMA/siw: Always consume all skbuf data in sk_data_ready() upcall.
    e58a0b9100ba RDMA/srp: Fix srp_abort()
    dc9e4ef6b072 RDMA/irdma: Align AE id codes to correct flush code and event
    84ce1a8e36bb mtd: rawnand: fsl_elbc: Fix none ECC mode
    be424a7d5374 mtd: rawnand: intel: Remove undocumented compatible string
    445395900b64 mtd: rawnand: intel: Read the chip-select line from the correct OF node
    cbbf9cca47ac phy: phy-mtk-tphy: fix the phy type setting issue
    e4be7c9495c8 phy: amlogic: phy-meson-axg-mipi-pcie-analog: Hold reference returned by of_get_parent()
    88263152ff56 mtd: devices: docg3: check the return value of devm_ioremap() in the probe
    a0e4ac698891 clk: qcom: sm6115: Select QCOM_GDSC
    aecb632674b7 dyndbg: drop EXPORTed dynamic_debug_exec_queries
    0d4421f2cb54 dyndbg: let query-modname override actual module name
    0c0d9f38b087 dyndbg: fix module.dyndbg handling
    49d85932f7d2 dyndbg: fix static_branch manipulation
    7cb9b20941e1 dmaengine: hisilicon: Add multi-thread support for a DMA channel
    b88630d9aac0 dmaengine: hisilicon: Fix CQ head update
    e84aeeafe8b3 dmaengine: hisilicon: Disable channels when unregister hisi_dma
    b94605f5cb99 fpga: prevent integer overflow in dfl_feature_ioctl_set_irq()
    11bd8bbdf8f6 misc: ocxl: fix possible refcount leak in afu_ioctl()
    c23c5e184550 RDMA/rxe: Fix the error caused by qp->sk
    f2f405af70e6 RDMA/rxe: Fix "kernel NULL pointer dereference" error
    2ea7caa96846 media: xilinx: vipp: Fix refcount leak in xvip_graph_dma_init
    23624abbc9c6 media: uvcvideo: Use entity get_cur in uvc_ctrl_set
    6c5da92103bd media: uvcvideo: Fix memory leak in uvc_gpio_parse
    4e2042f1adc7 media: meson: vdec: add missing clk_disable_unprepare on error in vdec_hevc_start()
    aeffca434426 tty: xilinx_uartps: Fix the ignore_status
    a8d772c7b853 media: exynos4-is: fimc-is: Add of_node_put() when breaking out of loop
    6225501072d3 HSI: omap_ssi_port: Fix dma_map_sg error check
    691f23a8475f HSI: omap_ssi: Fix refcount leak in ssi_probe
    d6e750535b46 clk: tegra20: Fix refcount leak in tegra20_clock_init
    e7a57fb92af5 clk: tegra: Fix refcount leak in tegra114_clock_init
    417ed4432b1b clk: tegra: Fix refcount leak in tegra210_clock_init
    ca5f338ef165 clk: sprd: Hold reference returned by of_get_parent()
    49343bdf95eb clk: berlin: Add of_node_put() for of_get_parent()
    857b719bede4 clk: qoriq: Hold reference returned by of_get_parent()
    a8cbce0305b2 clk: oxnas: Hold reference returned by of_get_parent()
    e0001a565c16 clk: meson: Hold reference returned by of_get_parent()
    e900ec4c4f74 usb: common: debug: Check non-standard control requests
    c11f48764c8b RDMA/mlx5: Don't compare mkey tags in DEVX indirect mkey
    cd35ad9a7d66 iio: magnetometer: yas530: Change data type of hard_offsets to signed
    23fafc2e2cf6 iio: ABI: Fix wrong format of differential capacitance channel ABI.
    8169da520e8f iio: inkern: fix return value in devm_of_iio_channel_get_by_name()
    504e8807fe5f iio: inkern: only release the device node when done with it
    b0d4fcc3ecb8 iio: adc: at91-sama5d2_adc: disable/prepare buffer on suspend/resume
    5db9b840ac88 iio: adc: at91-sama5d2_adc: lock around oversampling and sample freq
    c5c63736d2a1 iio: adc: at91-sama5d2_adc: check return status for pressure and touch
    5f1654a0e520 iio: adc: at91-sama5d2_adc: fix AT91_SAMA5D2_MR_TRACKTIM_MAX
    017cf3b0a628 ARM: dts: exynos: fix polarity of VBUS GPIO of Origen
    6c93b683ceda arm64: ftrace: fix module PLTs with mcount
    bbf64eb10273 ext4: don't run ext4lazyinit for read-only filesystems
    7a00a2320752 ARM: Drop CMDLINE_* dependency on ATAGS
    2af04fe87ea5 ARM: dts: exynos: correct s5k6a3 reset polarity on Midas family
    2134214bc403 arm64: dts: ti: k3-j7200: fix main pinmux range
    7247a1d7a46a soc/tegra: fuse: Drop Kconfig dependency on TEGRA20_APB_DMA
    4f7892f24281 ia64: export memory_add_physaddr_to_nid to fix cxl build error
    2ef01657b2d6 ARM: dts: kirkwood: lsxl: remove first ethernet port
    bf7caa3c5caf ARM: dts: kirkwood: lsxl: fix serial line
    42ce4c73a468 ARM: dts: turris-omnia: Fix mpp26 pin name and comment
    96d8f2b43e72 ARM: dts: imx6qdl-kontron-samx6i: hook up DDC i2c bus
    08ada28d1def soc: qcom: smem_state: Add refcounting for the 'state->of_node'
    96e0028debdd soc: qcom: smsm: Fix refcount leak bugs in qcom_smsm_probe()
    a29b6eb959bd locks: fix TOCTOU race when granting write lease
    7e053784c4c7 memory: of: Fix refcount leak bug in of_lpddr3_get_ddr_timings()
    2680690f9ce4 memory: of: Fix refcount leak bug in of_get_ddr_timings()
    566b143aa511 memory: pl353-smc: Fix refcount leak bug in pl353_smc_probe()
    10df962300c2 ALSA: hda/hdmi: Don't skip notification handling during PM operation
    cc756b79a5c9 ASoC: mt6660: Fix PM disable depth imbalance in mt6660_i2c_probe
    f9cb3bd55726 ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe
    b7dda65fa875 ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe
    b2bc9fc56a3e ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe
    3c3ef19a8870 mmc: wmt-sdmmc: Fix an error handling path in wmt_mci_probe()
    b14dc262274b ALSA: dmaengine: increment buffer pointer atomically
    f5f1f5ee5048 ASoC: da7219: Fix an error handling path in da7219_register_dai_clks()
    f910aca07625 ASoC: codecs: tx-macro: fix kcontrol put
    b47a37ad4a44 drm/vmwgfx: Fix memory leak in vmw_mksstat_add_ioctl()
    bdf54d4b0074 drm/msm/dp: correct 1.62G link rate at dp_catalog_ctrl_config_msa()
    635e7700c5b4 drm/msm/dpu: index dpu_kms->hw_vbif using vbif_idx
    4f859884673d ASoC: eureka-tlv320: Hold reference returned from of_find_xxx API
    64545b8a9690 mmc: au1xmmc: Fix an error handling path in au1xmmc_probe()
    3ba3814c00a4 drm/amdgpu: Fix memory leak in hpd_rx_irq_create_workqueue()
    a5ce83e85d79 drm/omap: dss: Fix refcount leak bugs
    f5f599daa0bc drm/bochs: fix blanking
    928ac9fc1ace ALSA: hda: beep: Simplify keep-power-at-enable behavior
    fbb88a7c84c1 ASoC: rsnd: Add check for rsnd_mod_power_on
    4610e7a4111f drm/bridge: megachips: Fix a null pointer dereference bug
    079c550c57ff drm/amdgpu: add missing pci_disable_device() in amdgpu_pmops_runtime_resume()
    c12daccc9017 platform/chrome: cros_ec_typec: Correct alt mode index
    c317d2b8a430 platform/x86: msi-laptop: Fix resource cleanup
    0e21d41bc768 platform/x86: msi-laptop: Fix old-ec check for backlight registering
    6bc81c1b6313 ASoC: tas2764: Fix mute/unmute
    e644497c5361 ASoC: tas2764: Drop conflicting set_bias_level power setting
    35bd912ed6c0 ASoC: tas2764: Allow mono streams
    fd1d3b265784 platform/chrome: fix memory corruption in ioctl
    27bb672c0437 platform/chrome: fix double-free in chromeos_laptop_prepare()
    57dfb855bc9e ASoC: mt6359: fix tests for platform_get_irq() failure
    8a475a7732a5 drm:pl111: Add of_node_put() when breaking out of for_each_available_child_of_node()
    56d2233cf573 drm/dp_mst: fix drm_dp_dpcd_read return value checks
    fe6eb3d0c874 drm/bridge: parade-ps8640: Fix regulator supply order
    60630834fad3 drm/virtio: Correct drm_gem_shmem_get_sg_table() error handling
    26c1b4cfe56f drm/mipi-dsi: Detach devices when removing the host
    652042135e08 drm/bridge: Avoid uninitialized variable warning
    f369fb4deed7 drm: bridge: adv7511: unregister cec i2c device after cec adapter
    20609125b8bd drm: bridge: adv7511: fix CEC power down control register offset
    a624161ebe0c net: mvpp2: fix mvpp2 debugfs leak
    7aef5082c56e once: add DO_ONCE_SLOW() for sleepable contexts
    77bfd26cbb61 net/ieee802154: reject zero-sized raw_sendmsg()
    dc4e9cd6d6a6 net: wwan: iosm: Call mutex_init before locking it
    0b6516a4e3eb bnx2x: fix potential memory leak in bnx2x_tpa_stop()
    30bfa5aa7228 net: rds: don't hold sock lock when cancelling work from rds_tcp_reset_callbacks()
    f828333ca90f hwmon: (pmbus/mp2888) Fix sensors readouts for MPS Multi-phase mp2888 controller
    c91b922b4170 spi: Ensure that sg_table won't be used after being freed
    49d429760df7 tcp: fix tcp_cwnd_validate() to not forget is_cwnd_limited
    19d636b663e0 sctp: handle the error returned from sctp_auth_asoc_init_active_key
    7bfa18b05f38 mISDN: fix use-after-free bugs in l1oip timer handlers
    6f1991a940b9 eth: alx: take rtnl_lock on resume
    e28a4e7f0296 vhost/vsock: Use kvmalloc/kvfree for larger packets.
    5dbdd690ed83 wifi: rtl8xxxu: Fix AIFS written to REG_EDCA_*_PARAM
    432eecffcf1b spi: s3c64xx: Fix large transfers with DMA
    1454a26cb1ab netfilter: nft_fib: Fix for rpath check with VRF devices
    7d98b26684cb xfrm: Reinject transport-mode packets through workqueue
    397e880acf44 Bluetooth: hci_core: Fix not handling link timeouts propertly
    1331d3e1f9b5 i2c: mlxbf: support lock mechanism
    9233ab8198d8 skmsg: Schedule psock work if the cached skb exists on the psock
    44f1dc2e821d spi/omap100k:Fix PM disable depth imbalance in omap1_spi100k_probe
    daa5239ea49f spi: dw: Fix PM disable depth imbalance in dw_spi_bt1_probe
    6b941151865e x86/cpu: Include the header of init_ia32_feat_ctl()'s prototype
    3c27a1380798 x86/microcode/AMD: Track patch allocation size explicitly
    3e2b805a68ab wifi: ath11k: fix number of VHT beamformee spatial streams
    5a6827cdc258 netfilter: conntrack: revisit the gc initial rescheduling bias
    9c39ca418ba3 netfilter: conntrack: fix the gc rescheduling delay
    b8917dce2134 Bluetooth: hci_{ldisc,serdev}: check percpu_init_rwsem() failure
    c087c35292ea bpf: Ensure correct locking around vulnerable function find_vpid()
    a0f15af17b7d net: fs_enet: Fix wrong check in do_pd_setup
    ee7c5e814fb2 Bluetooth: RFCOMM: Fix possible deadlock on socket shutdown/release
    57d4f2f8a67b wifi: mt76: mt7915: do not check state before configuring implicit beamform
    dea9093f24d6 wifi: mt76: mt7615: add mt7615_mutex_acquire/release in mt7615_sta_set_decap_offload
    817e8b75ae06 wifi: mt76: sdio: fix transmitting packet hangs
    5dc095a37fbd wifi: rtl8xxxu: Remove copy-paste leftover in gen2_update_rate_mask
    9973f78c19f3 wifi: rtl8xxxu: gen2: Fix mistake in path B IQ calibration
    5d9222c68022 bpf: btf: fix truncated last_member_type_id in btf_struct_resolve
    4ce47c5545d2 spi: meson-spicc: do not rely on busy flag in pow2 clk ops
    36c484bac9ed wifi: rtl8xxxu: Fix skb misuse in TX queue selection
    fefd2269e681 spi: qup: add missing clk_disable_unprepare on error in spi_qup_pm_resume_runtime()
    e22f6499183d spi: qup: add missing clk_disable_unprepare on error in spi_qup_resume()
    37005a948677 selftests/xsk: Avoid use-after-free on ctx
    69995c64e50e wifi: rtw88: add missing destroy_workqueue() on error path in rtw_core_init()
    6f9484e969cb wifi: rtl8xxxu: tighten bounds checking in rtl8xxxu_read_efuse()
    d091771f511d Bluetooth: btusb: mediatek: fix WMT failure during runtime suspend
    f91e25cfa553 bpf: Use this_cpu_{inc|dec|inc_return} for bpf_task_storage_busy
    0e1342510490 bpf: Propagate error from htab_lock_bucket() to userspace
    0b00c6130c1a bpf: Disable preemption when increasing per-cpu map_locked
    68ab7690332a xsk: Fix backpressure mechanism on Tx
    0559a6d96a99 x86/resctrl: Fix to restore to original value when re-enabling hardware prefetch register
    e962e458bf96 spi: mt7621: Fix an error message in mt7621_spi_probe()
    0a16bbc8b030 bpftool: Fix a wrong type cast in btf_dumper_int
    6e8eadfa9bb1 wifi: mac80211: allow bw change during channel switch in mesh
    4ed5155043c9 bpf: Fix reference state management for synchronous callbacks
    3d0a101e7139 leds: lm3601x: Don't use mutex after it was destroyed
    54a3201f3c1f wifi: ath10k: add peer map clean up for peer delete in ath10k_sta_state()
    714536ff6f6c wifi: rtlwifi: 8192de: correct checking of IQK reload
    80a474502ef5 NFSD: Fix handling of oversized NFSv4 COMPOUND requests
    dc7f225090c2 NFSD: Protect against send buffer overflow in NFSv2 READDIR
    cedaf73c8bda SUNRPC: Fix svcxdr_init_encode's buflen calculation
    6b55707ff8b2 SUNRPC: Fix svcxdr_init_decode's end-of-buffer calculation
    aed881630557 nfsd: Fix a memory leak in an error handling path
    5c4b234c44cb objtool: Preserve special st_shndx indexes in elf_update_symbol
    425a2a9469d2 ARM: 9247/1: mm: set readonly for MT_MEMORY_RO with ARM_LPAE
    2647b20e043c ARM: 9244/1: dump: Fix wrong pg_level in walk_pmd()
    93296e7ab774 MIPS: SGI-IP27: Fix platform-device leak in bridge_platform_create()
    993b13abde17 MIPS: SGI-IP27: Free some unused memory
    959855093f94 sh: machvec: Use char[] for section boundaries
    91fafd22f852 thermal: cpufreq_cooling: Check the policy first in cpufreq_cooling_register()
    81fb3ee298d5 ntfs3: rework xattr handlers and switch to POSIX ACL VFS helpers
    33d478eee2b5 userfaultfd: open userfaultfds with O_RDONLY
    10918ebecdc9 ima: fix blocking of security.ima xattrs of unsupported algorithms
    b7af9b8be891 selinux: use "grep -E" instead of "egrep"
    73b8218ef4aa smb3: must initialize two ACL struct fields to zero
    adf428ae46be drm/amd/display: Fix vblank refcount in vrr transition
    60a517452560 drm/i915: Fix watermark calculations for gen12+ CCS+CC modifier
    01bd3eaa5371 drm/i915: Fix watermark calculations for gen12+ MC CCS modifier
    20018a252f19 drm/i915: Fix watermark calculations for gen12+ RC CCS modifier
    861f085f81fd drm/nouveau: fix a use-after-free in nouveau_gem_prime_import_sg_table()
    446d40e2a8cb drm/nouveau/kms/nv140-: Disable interlacing
    4dab0d27a421 staging: greybus: audio_helper: remove unused and wrong debugfs usage
    28eb4bdb23e2 KVM: VMX: Drop bits 31:16 when shoving exception error code into VMCS
    4f7b1e7d0f36 KVM: nVMX: Don't propagate vmcs12's PERF_GLOBAL_CTRL settings to vmcs02
    be1a6a61f1b3 KVM: nVMX: Unconditionally purge queued/injected events on nested "exit"
    379de01906eb KVM: x86/emulator: Fix handing of POP SS to correctly set interruptibility
    e3e5baa36879 blk-wbt: call rq_qos_add() after wb_normal is initialized
    e8e0a6f4b8a2 media: cedrus: Fix endless loop in cedrus_h265_skip_bits()
    b76fac61c33f media: cedrus: Set the platform driver data earlier
    b19254eadab3 efi: libstub: drop pointless get_memory_map() call
    5cda4a11b490 thunderbolt: Explicitly enable lane adapter hotplug events at startup
    d9c79fbcbdb6 tracing: Fix reading strings from synthetic events
    b9ab154d22b8 tracing: Add "(fault)" name injection to kernel probes
    8ae88c4842c2 tracing: Move duplicate code of trace_kprobe/eprobe.c into header
    84f4be2093e1 tracing: Add ioctl() to force ring buffer waiters to wake up
    32eb54a986f4 tracing: Wake up waiters when tracing is disabled
    2475de2bc0de tracing: Wake up ring buffer waiters on closing of the file
    48272aa48d80 tracing: Disable interrupt or preemption before acquiring arch_spinlock_t
    d4ab9bc5f56e ring-buffer: Fix race between reset page and reading page
    be60f698c276 ring-buffer: Add ring_buffer_wake_waiters()
    5201dd81aef7 ring-buffer: Check pending waiters when doing wake ups as well
    bc6d4e9d6484 ring-buffer: Have the shortest_full queue be the shortest not longest
    e8d116738514 ring-buffer: Allow splice to read previous partially read pages
    fb96b7489fbd ftrace: Properly unset FTRACE_HASH_FL_MOD
    31dc1727c103 livepatch: fix race between fork and KLP transition
    36997b75bbb3 ext4: update 'state->fc_regions_size' after successful memory allocation
    417b0455a0b6 ext4: fix potential memory leak in ext4_fc_record_regions()
    9b5eb368a86f ext4: fix potential memory leak in ext4_fc_record_modified_inode()
    ef1607c99136 ext4: fix miss release buffer head in ext4_fc_write_inode
    d29fa1ab4e62 ext4: fix dir corruption when ext4_dx_add_entry() fails
    d12471b41674 ext4: place buffer head allocation before handle start
    46e5f470a144 ext4: ext4_read_bh_lock() should submit IO if the buffer isn't uptodate
    1f5e643b3829 ext4: don't increase iversion counter for ea_inodes
    dd366295d1ec ext4: fix check for block being out of directory size
    4a967fe8b043 ext4: make ext4_lazyinit_thread freezable
    533c60a0b97c ext4: fix null-ptr-deref in ext4_write_info
    d8e4af8314df ext4: avoid crash when inline data creation follows DIO write
    56fcd0788f0d jbd2: add miss release buffer head in fc_do_one_pass()
    d11d2ded2939 jbd2: fix potential use-after-free in jbd2_fc_wait_bufs
    e7385c868ee0 jbd2: fix potential buffer head reference count leak
    d87fe290a533 jbd2: wake up journal waiters in FIFO order, not LIFO
    7434626c5eaa hardening: Remove Clang's enable flag for -ftrivial-auto-var-init=zero
    095493833b18 hardening: Avoid harmless Clang option under CONFIG_INIT_STACK_ALL_ZERO
    73687c53919f f2fs: fix to do sanity check on summary info
    ed854f10e6af f2fs: fix to do sanity check on destination blkaddr during recovery
    7f10357c9046 f2fs: increase the limit for reserve_root
    0035b84223de f2fs: flush pending checkpoints when freezing super
    ab4958975490 f2fs: complete checkpoints during remount
    0a408c6212c1 btrfs: set generation before calling btrfs_clean_tree_block in btrfs_init_new_buffer
    4b996a3014ef btrfs: fix race between quota enable and quota rescan ioctl
    0d9423034308 fs: record I_DIRTY_TIME even if inode already has I_DIRTY_INODE
    95a520b591c9 ksmbd: Fix user namespace mapping
    a19f316406ea ksmbd: Fix wrong return value and message length check in smb2_ioctl()
    39b685562825 ksmbd: fix endless loop when encryption for response fails
    2b0897e33682 fbdev: smscufx: Fix use-after-free in ufx_ops_open()
    aa7b2c927e4e pinctrl: rockchip: add pinmux_ops.gpio_set_direction callback
    5d97378b3626 gpio: rockchip: request GPIO mux to pinctrl when setting direction
    e0b1c16fdadd scsi: qedf: Populate sysfs attributes for vport
    1d567179f277 slimbus: qcom-ngd: cleanup in probe error path
    fa0aab2e45f0 slimbus: qcom-ngd: use correct error in message of pdr_add_lookup() failure
    ba2159df1806 powerpc/boot: Explicitly disable usage of SPE instructions
    9df2a9cdad5b powercap: intel_rapl: Use standard Energy Unit for SPR Dram RAPL domain
    75d9de25a6f8 NFSD: Protect against send buffer overflow in NFSv3 READ
    2be9331ca606 NFSD: Protect against send buffer overflow in NFSv2 READ
    071a076fd1b7 NFSD: Protect against send buffer overflow in NFSv3 READDIR
    209a94c5192b serial: 8250: Request full 16550A feature probing for OxSemi PCIe devices
    63a3d75cf18c serial: 8250: Let drivers request full 16550A feature probing
    26e5c79e673c PCI: Sanitise firmware BAR assignments behind a PCI-PCI bridge
    7c16d0a4e6a4 xen/gntdev: Accommodate VMA splitting
    1cb73704cb47 xen/gntdev: Prevent leaking grants
    43bed0a13a5c mm/mmap: undo ->mmap() when arch_validate_flags() fails
    2b0072d33eb6 mm/damon: validate if the pmd entry is present before accessing
    91c4eb16e804 arm64: errata: Add Cortex-A55 to the repeat tlbi list
    fc0f921b7e6e drm/udl: Restore display mode on resume
    064093472524 drm/virtio: Use appropriate atomic state in virtio_gpu_plane_cleanup_fb()
    fb3910436be4 drm/virtio: Unlock reservations on virtio_gpu_object_shmem_init() error
    f122bcb34f1a drm/virtio: Check whether transferred 2D BO is shmem
    a95fb5d55af0 dmaengine: mxs: use platform_driver_register
    e7a3334e83f9 Revert "drm/amdgpu: use dirty framebuffer helper"
    4bdedc3b5341 nvme-pci: set min_align_mask before calculating max_hw_sectors
    32aa0b3f0c06 nvme-multipath: fix possible hang in live ns resize with ANA access
    9391cc3a787a nvmem: core: Fix memleak in nvmem_register()
    7efe61dc6aa4 UM: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
    81ab826a285d riscv: Pass -mno-relax only on lld < 15.0.0
    7780bb02a069 riscv: always honor the CONFIG_CMDLINE_FORCE when parsing dtb
    c657b70e8074 riscv: Make VM_WRITE imply VM_READ
    3c3c4fa118a4 riscv: Allow PROT_WRITE-only mmap()
    af3aaee08df8 parisc: fbdev/stifb: Align graphics memory size to 4MB
    dc235db7b79a RISC-V: Make port I/O string accessors actually work
    8c487db000fd riscv: topology: fix default topology reporting
    d46c24f307fb arm64: topology: move store_cpu_topology() to shared code
    fcf0f6cbb653 regulator: qcom_rpm: Fix circular deferral regression
    78d81a8a8ce1 net: thunderbolt: Enable DMA paths only after rings are enabled
    3281e81ce90c hwmon: (gsc-hwmon) Call of_node_get() before of_find_xxx API
    e1ab98ec2bc9 ASoC: wcd934x: fix order of Slimbus unprepare/disable
    a2140a9922d1 ASoC: wcd9335: fix order of Slimbus unprepare/disable
    d0507b36da9f platform/chrome: cros_ec_proto: Update version on GET_NEXT_EVENT failure
    fcfeecca153d quota: Check next/prev free block number after reading from quota file
    17214cfab73b HID: multitouch: Add memory barriers
    219e4a0f9d68 fs: dlm: handle -EBUSY first in lock arg validation
    34ed22dd2860 fs: dlm: fix race between test_bit() and queue_work()
    7fa5304c4b5b i2c: designware: Fix handling of real but unexpected device interrupts
    f9effcefa8be mmc: sdhci-sprd: Fix minimum clock limit
    a4df91a88c3f can: kvaser_usb_leaf: Fix CAN state after restart
    0c28c2c0cfa2 can: kvaser_usb_leaf: Fix TX queue out of sync after restart
    b8c4f6345e0e can: kvaser_usb_leaf: Fix overread with an invalid command
    de4434d6823c can: kvaser_usb: Fix use of uninitialized completion
    354d768e315d usb: add quirks for Lenovo OneLink+ Dock
    103b459590e1 xhci: dbc: Fix memory leak in xhci_alloc_dbc()
    39f4c90b9995 iio: pressure: dps310: Reset chip after timeout
    bc493cd75466 iio: pressure: dps310: Refactor startup procedure
    5f6bfc1926bb iio: adc: ad7923: fix channel readings for some variants
    1be580ed8403 iio: ltc2497: Fix reading conversion results
    ef4018707df8 iio: dac: ad5593r: Fix i2c read protocol requirements
    60480291c1fc cifs: Fix the error length of VALIDATE_NEGOTIATE_INFO message
    0d814a2199cf cifs: destage dirty pages before re-reading them for cache=none
    15993e9a9b12 hv_netvsc: Fix race between VF offering and VF association message from host
    f9dc33f23153 io_uring/net: don't update msg_name if not provided
    a1bd289c10ac mtd: rawnand: atmel: Unmap streaming DMA mappings
    3e4d2375d154 ALSA: hda/realtek: Add Intel Reference SSID to support headset keys
    41e83faf036c ALSA: hda/realtek: Add quirk for ASUS GV601R laptop
    c01f385c70db ALSA: hda/realtek: Correct pin configs for ASUS G533Z
    0d50e05ecc2c ALSA: hda/realtek: remove ALC289_FIXUP_DUAL_SPK for Dell 5530
    ec439b97d983 ALSA: usb-audio: Fix NULL dererence at error path
    0672215994e2 ALSA: usb-audio: Fix potential memory leaks
    550ca3082ebd ALSA: rawmidi: Drop register_mutex in snd_rawmidi_free()
    45899fae65e5 ALSA: oss: Fix potential deadlock at unregistration
    5ca155aa79e9 Revert "fs: check FMODE_LSEEK to control internal pipe splicing"
    a3f2f5ac9d61 Linux 5.15.74
    de124365a7d2 wifi: mac80211: fix MBSSID parsing use-after-free
    7d998f6b7365 mac80211: fix memory leaks with element parsing
    fee48f3bdd75 mac80211: always allocate struct ieee802_11_elems
    630060f11756 mac80211: mlme: find auth challenge directly
    21df3a583e8e mac80211: move CRC into struct ieee802_11_elems
    864f2d3482f4 mac80211: mesh: clean up rx_bcn_presp API
    e5ebcbb4f967 misc: pci_endpoint_test: Fix pci_endpoint_test_{copy,write,read}() panic
    cb9defecf381 misc: pci_endpoint_test: Aggregate params checking for xfer
    2c657a0cbd48 Input: xpad - fix wireless 360 controller breaking after suspend
    db4db28fccb4 Input: xpad - add supported devices as contributed on github
    d15bb1f6dabe wifi: cfg80211: update hidden BSSes to avoid WARN_ON
    93a3a3255407 wifi: mac80211: fix crash in beacon protection for P2P-device
    fff244e9171b wifi: mac80211_hwsim: avoid mac80211 warning on bad rate
    0a8ee682e4f9 wifi: cfg80211: avoid nontransmitted BSS list corruption
    bfe29873454f wifi: cfg80211: fix BSS refcounting bugs
    9e99ca59ed39 wifi: cfg80211: ensure length byte is present before access
    0a861bd25dad wifi: cfg80211/mac80211: reject bad MBSSID elements
    9a8ef2030510 wifi: cfg80211: fix u8 overflow in cfg80211_update_notlisted_nontrans()
    398e30b67092 random: use expired timer rather than wq for mixing fast pool
    984faa6fc759 random: avoid reading two cache lines on irq randomness
    a937c59863d7 Revert "crypto: qat - reduce size of mapped region"
    0e3ff69ee691 Revert "powerpc/rtas: Implement reentrant rtas call"
    e0295c43166b USB: serial: qcserial: add new usb-id for Dell branded EM7455
    76efb4897bc3 scsi: stex: Properly zero out the passthrough command structure
    5fbbe7e98e9b efi: Correct Macmini DMI match in uefi cert quirk
    8754dc846d03 ALSA: hda: Fix position reporting on Poulsbo
    14f143fb4268 random: clamp credited irq bits to maximum mixed
    be53fa6cf667 random: restore O_NONBLOCK support
    2f96da3fd18f ceph: don't truncate file in atomic_open
    c0c3d3d3ea41 nilfs2: replace WARN_ONs by nilfs_error for checkpoint acquisition failure
    44b1ee304bac nilfs2: fix leak of nilfs_root in case of writer thread creation failure
    cb602c2b654e nilfs2: fix use-after-free bug of struct nilfs_root
    1e512c65b4ad nilfs2: fix NULL pointer dereference at nilfs_bmap_lookup_at_level()
    17aac9b7af2b Linux 5.15.73
    f7b16f51753a Revert "clk: ti: Stop using legacy clkctrl names for omap4 and 5"
    d8b1b64a070e rpmsg: qcom: glink: replace strncpy() with strscpy_pad()
    d58eb80b723d USB: serial: ftdi_sio: fix 300 bps rate for SIO
    5ff80339cdc3 usb: mon: make mmapped memory read only
    278fefd29eea net/mlx5: Disable irq when locking lag_lock
    54f382d4b7f8 wifi: cfg80211: fix MCS divisor value
    0fa249414a6f mm/huge_memory: use pfn_to_online_page() in split_huge_pages_all()
    f1d6894159fc mm/huge_memory: minor cleanup for split_huge_pages_all
    7190afd4cd5f perf parse-events: Identify broken modifiers
    f6f740f6ca3b mmc: core: Terminate infinite loop in SD-UHS voltage switch
    9635e05e015a mmc: core: Replace with already defined values for readability
    f2af62d909ad drm/amd/display: skip audio setup when audio stream is enabled
    d444cfe6d047 drm/amd/display: update gamut remap if plane has changed
    4afcb53474ae drm/amd/display: Assume an LTTPR is always present on fixed_vs links
    5e76ff629a20 drm/amd/display: Fix double cursor on non-video RGB MPO
    e6590139ffa3 net: atlantic: fix potential memory leak in aq_ndev_close()
    005e368a61bc arch: um: Mark the stack non-executable to fix a binutils warning
    5f85191bedba um: Cleanup compiler warning in arch/x86/um/tls_32.c
    6827af886be8 um: Cleanup syscall_handler_t cast in syscalls_32.h
    f386b373e9f7 ALSA: hda/hdmi: Fix the converter reuse for the silent stream
    a36b2dc5c0da net: marvell: prestera: add support for for Aldrin2
    d2588ba1a338 net/ieee802154: fix uninit value bug in dgram_sendmsg
    1030659dac4e scsi: qedf: Fix a UAF bug in __qedf_probe()
    f7126aa3624c ARM: dts: fix Moxa SDIO 'compatible', remove 'sdhci' misnomer
    968299cd58b7 dmaengine: xilinx_dma: Report error in case of dma_set_mask_and_coherent API failure
    17f55255af4c dmaengine: xilinx_dma: cleanup for fetching xlnx,num-fstores property
    b2f275550136 dmaengine: xilinx_dma: Fix devm_platform_ioremap_resource error handling
    fd425b89d040 firmware: arm_scmi: Add SCMI PM driver remove routine
    e092fc3a2892 firmware: arm_scmi: Harden accesses to the sensor domains
    9f81dbb934fb firmware: arm_scmi: Improve checks in the info_get operations
    64b79e632869 fs: fix UAF/GPF bug in nilfs_mdt_destroy
    31bdba07f6b2 powerpc/64s/radix: don't need to broadcast IPI for radix pmd collapse flush
    46c22e7b094f mm: gup: fix the fast GUP race against THP collapse
    88ccea0a4458 xsk: Inherit need_wakeup flag for shared sockets
    f07fbefcea5b docs: update mediator information in CoC docs
    cf26ddb96b4f Makefile.extrawarn: Move -Wcast-function-type-strict to W=1
    c68173b2012b Linux 5.15.72
    713fa3e4591f drm/i915/gem: Really move i915_gem_context.link under ref protection
    a00ed4e5d5ee x86/alternative: Fix race in try_get_desc()
    c3d4b8970c0d KVM: x86: Hide IA32_PLATFORM_DCA_CAP[31:0] from the guest
    ab5c5787ab5e clk: iproc: Do not rely on node name for correct PLL setup
    e748a084b51c clk: imx: imx6sx: remove the SET_RATE_PARENT flag for QSPI clocks
    19f4e1636626 fs: split off setxattr_copy and do_setxattr function from setxattr
    a0e3719e030a vdpa/ifcvf: fix the calculation of queuepair
    4755d9d2c9b0 selftests: Fix the if conditions of in test_extra_filter()
    c83a7606aa65 net: phy: Don't WARN for PHY_UP state in mdio_bus_phy_resume()
    a8cd7e1bc7cd net: stmmac: power up/down serdes in stmmac_open/release
    67c00bcf4231 wifi: mac80211: fix regression with non-QoS drivers
    520e434a082d nvme: Fix IOC_PR_CLEAR and IOC_PR_RELEASE ioctls for nvme devices
    e9d7d809022e net/mlxbf_gige: Fix an IS_ERR() vs NULL bug in mlxbf_gige_mdio_probe
    8b1b908507ce cxgb4: fix missing unlock on ETHOFLD desc collect fail path
    e99c7a61d89e net: sched: act_ct: fix possible refcount leak in tcf_ct_init()
    815381aeff95 usbnet: Fix memory leak in usbnet_disconnect()
    af91321b7372 gpio: mvebu: Fix check for pwm support on non-A8K platforms
    f592ccddac68 Input: melfas_mip4 - fix return value check in mip4_probe()
    ff982b1f325d Revert "drm: bridge: analogix/dp: add panel prepare/unprepare in suspend/resume time"
    bde7795794f4 drm/bridge: lt8912b: fix corrupted image output
    e103b0e83991 drm/bridge: lt8912b: set hdmi or dvi mode
    473f653a86ee drm/bridge: lt8912b: add vsync hsync
    6a12105d9d4f ASoC: tas2770: Reinit regcache on reset
    75ef73d7d2b3 arm64: dts: qcom: sm8350: fix UFS PHY serdes size
    5664dc84fc2e ASoC: imx-card: Fix refcount issue with of_node_put
    367403bc1cfe soc: sunxi: sram: Fix debugfs info for A64 SRAM C
    68d2f42cf4f6 soc: sunxi: sram: Fix probe function ordering issues
    2f82b5290078 soc: sunxi_sram: Make use of the helper function devm_platform_ioremap_resource()
    861adc2b2037 soc: sunxi: sram: Prevent the driver from being unbound
    8b07378ebe43 soc: sunxi: sram: Actually claim SRAM regions
    d50e0e2f3d94 ARM: dts: am5748: keep usb4_tm disabled
    c48e3db1df25 reset: imx7: Fix the iMX8MP PCIe PHY PERST support
    606229101290 ARM: dts: am33xx: Fix MMCHS0 dma properties
    bfe5dc2101ba swiotlb: max mapping size takes min align mask into account
    a6a3b6b11ac0 media: v4l2-compat-ioctl32.c: zero buffer passed to v4l2_compat_get_array_args()
    ab9d32844742 media: rkvdec: Disable H.264 error detection
    69379139ed78 media: dvb_vb2: fix possible out of bound access
    6287c9e00595 mm,hwpoison: check mm when killing accessing process
    f9aed3d8a029 mm: fix madivse_pageout mishandling on non-LRU page
    1299c1198878 mm/migrate_device.c: flush TLB while holding PTL
    e858f7ac7395 mm: fix dereferencing possible ERR_PTR
    d75ce115625e mm: prevent page_frag_alloc() from corrupting the memory
    23d17e2b04c7 mm/page_alloc: fix race condition between build_all_zonelists and page allocation
    fec2db7a434a mmc: hsq: Fix data stomping during mmc recovery
    4fef6e1fe07c mmc: moxart: fix 4-bit bus width and remove 8-bit bus width
    4f75d0cacd65 libata: add ATA_HORKAGE_NOLPM for Pioneer BDR-207M and BDR-205
    dc248ddf41ea vduse: prevent uninitialized memory accesses
    ea774829699a drm/amdgpu: Add amdgpu suspend-resume code path under SRIOV
    25759a7bc1f4 drm/i915/gt: Restrict forced preemption to the active context
    e0f576335d05 Revert "firmware: arm_scmi: Add clock management to the SCMI power domain"
    5de02ab84aec net: mt7531: only do PLL once after the reset
    56e3f8d56299 mm/damon/dbgfs: fix memory leak when using debugfs_lookup()
    149da9e60b8c ntfs: fix BUG_ON in ntfs_lookup_inode_by_name()
    dc8cdb988453 ARM: dts: integrator: Tag PCI host with device_type
    aa5c3aa3f197 x86/sgx: Do not fail on incomplete sanitization on premature stop of ksgxd
    476c188b9dbe clk: ingenic-tcu: Properly enable registers before accessing timers
    d134b0f7a9b9 can: c_can: don't cache TX messages for C_CAN cores
    6fff203793cb Input: snvs_pwrkey - fix SNVS_HPVIDR1 register address
    006a5085a3a8 net: usb: qmi_wwan: Add new usb-id for Dell branded EM7455
    81e759d71a6b thunderbolt: Explicitly reset plug events delay back to USB4 spec value
    85a70a259916 usb: typec: ucsi: Remove incorrect warning
    ac12a04c8e08 uas: ignore UAS for Thinkplus chips
    528aba78ee01 usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
    0a4e8f384e82 uas: add no-uas quirk for Hiksemi usb_disk
    8484a356cee8 cgroup: cgroup_get_from_id() must check the looked-up kn is a directory
    ae04dd5ef180 cgroup: reduce dependency on cgroup_mutex
    7a64e6dc6cb7 ALSA: hda/realtek: fix speakers and micmute on HP 855 G8
    6a3bee2ead9b ALSA: hda: Fix Nvidia dp infoframe
    f7392f93a2fb ALSA: hda: Fix hang at HD-audio codec unbinding due to refcount saturation
    de5deddfa7e7 ALSA: hda: Do disconnect jacks at codec unbind
    90c7e9b400c7 Linux 5.15.71
    214194610a18 ext4: use locality group preallocation for small closed files
    8a1ac4167dda ext4: avoid unnecessary spreading of allocations among groups
    fd8b82919549 ext4: make mballoc try target group first even with mb_optimize_scan
    21dada4ce19c ext4: limit the number of retries after discarding preallocations blocks
    be4df018c0be ext4: fix bug in extents parsing when eh_entries == 0 and eh_depth > 0
    90bc7b630c6c ext4: make directory inode spreading reflect flexbg size
    95d714d8ad3d devdax: Fix soft-reservation memory description
    27bf7a5d1198 NFSv4: Fixes for nfs4_inode_return_delegation()
    21b0301f2234 drm/amdgpu: don't register a dirty callback for non-atomic
    6eb08245da51 i2c: mlxbf: Fix frequency calculation
    dc2a0c587006 i2c: mlxbf: prevent stack overflow in mlxbf_i2c_smbus_start_transaction()
    621c6ab03ac3 i2c: mlxbf: incorrect base address passed during io write
    c242dbf2e36f i2c: imx: If pm_runtime_get_sync() returned 1 device access is possible
    c71ec39be45a workqueue: don't skip lockdep work dependency in cancel_work_sync()
    929ef155e1da fsdax: Fix infinite loop in dax_iomap_rw()
    9aac3819f099 drm/rockchip: Fix return type of cdn_dp_connector_mode_valid
    1c26968caf18 drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinline for stack usage
    492db4ffcff3 drm/amd/display: Reduce number of arguments of dml31's CalculateFlipSchedule()
    9539cfc74493 drm/amd/display: Reduce number of arguments of dml31's CalculateWatermarksAndDRAMSpeedChangeSupport()
    a541c0111818 drm/amd/display: Limit user regamma to a valid value
    33b128f790b6 drm/amdgpu: use dirty framebuffer helper
    f76d6f309a68 drm/amd/pm: disable BACO entry/exit completely on several sienna cichlid cards
    e5ae504c8623 drm/gma500: Fix BUG: sleeping function called from invalid context errors
    e07d9154bb81 Drivers: hv: Never allocate anything besides framebuffer from framebuffer memory region
    5f270b61ee8b drm/amd/amdgpu: fixing read wrong pf2vf data in SRIOV
    d3a67c21b18f s390/dasd: fix Oops in dasd_alias_get_start_dev due to missing pavgroup
    faf0e1b5d82b serial: tegra-tcu: Use uart_xmit_advance(), fixes icount.tx accounting
    0aada772fd16 serial: tegra: Use uart_xmit_advance(), fixes icount.tx accounting
    4c7e17270cab serial: Create uart_xmit_advance()
    4199425b1132 serial: fsl_lpuart: Reset prior to registration
    cc1504f6da2e KVM: x86/mmu: Fold rmap_recycle into rmap_add
    dddae48eabfb selftests: forwarding: add shebang for sch_red.sh
    08483e4c0c83 bnxt: prevent skb UAF after handing over to PTP worker
    f8162aed962b net: sched: fix possible refcount leak in tc_new_tfilter()
    bd29ca2b398c net: sunhme: Fix packet reception for len < RX_COPY_THRESHOLD
    ec3a6f4ffe55 bonding: fix NULL deref in bond_rr_gen_slave_id
    db145b8a04fc net/smc: Stop the CLC flow if no link to map buffers on
    5daef0042d2c drm/mediatek: dsi: Move mtk_dsi_stop() call back to mtk_dsi_poweroff()
    a08cba2f50d7 perf tools: Honor namespace when synthesizing build-ids
    1a83f39dc4e1 perf kcore_copy: Do not check /proc/modules is unchanged
    a3b923f449a3 perf jit: Include program header in ELF files
    39dc6ccdd5af perf stat: Fix BPF program section name
    c6d939639fe0 can: gs_usb: gs_can_open(): fix race dev->can.state condition
    e1676adedc17 net: sh_eth: Fix PHY state warning splat during system resume
    71200518bbbf net: ravb: Fix PHY state warning splat during system resume
    d5917b7af7ca netfilter: ebtables: fix memory leak when blob is malformed
    08d7524f366a netfilter: nf_tables: fix percpu memory leak at nf_tables_addchain()
    91aa52652f4b netfilter: nf_tables: fix nft_counters_enabled underflow at nf_tables_addchain()
    c721623efd09 net/sched: taprio: make qdisc_leaf() see the per-netdev-queue pfifo child qdiscs
    f58e43184226 net/sched: taprio: avoid disabling offload when it was never enabled
    510e703e4ed0 net: enetc: deny offload of tc-based TSN features on VF interfaces
    11eb9ed08856 net: enetc: move enetc_set_psfp() out of the common enetc_set_features()
    c60801e4e2b5 wireguard: netlink: avoid variable-sized memcpy on sockaddr
    3ebf690d1cde wireguard: ratelimiter: disable timings test by default
    c2dc533a7edb net: ipa: properly limit modem routing table use
    cbdab7d68f20 of: mdio: Add of_node_put() when breaking out of for_each_xx
    ca86577c10bc drm/hisilicon: Add depends on MMU
    68c4acee6328 drm/hisilicon/hibmc: Allow to be built if COMPILE_TEST is enabled
    8547c7bfc061 sfc: fix null pointer dereference in efx_hard_start_xmit
    360910b88d14 sfc: fix TX channel offset when using legacy interrupts
    bc750d7127a9 i40e: Fix set max_tx_rate when it is lower than 1 Mbps
    53220b99059a i40e: Fix VF set max MTU size
    7249a653fe5f iavf: Fix set max MTU size with port VLAN and jumbo frames
    030e0688b6b2 mlxbf_gige: clear MDIO gateway lock after read
    93859f6878e7 iavf: Fix bad page state
    e1dbe8a62098 um: fix default console kernel parameter
    7400e2edfc9e MIPS: Loongson32: Fix PHY-mode being left unspecified
    abea65fa7713 MIPS: lantiq: export clk_get_io() for lantiq_wdt.ko
    831cf63c043e drm/panel: simple: Fix innolux_g121i1_l01 bus_format
    408d5752b60f net: team: Unsync device addresses on ndo_stop
    f50265a4f3da net: bonding: Unsync device addresses on ndo_stop
    e6b277f7367e net: bonding: Share lacpdu_mcast_addr definition
    8b2ab46b6c63 scsi: mpt3sas: Fix return value check of dma_get_required_mask()
    89df49e561b4 scsi: qla2xxx: Fix memory leak in __qlt_24xx_handle_abts()
    5826a555f77c net: phy: aquantia: wait for the suspend/resume operations to finish
    4d2f1bc9067a net: core: fix flow symmetric hash
    8d06006c7eb7 ipvlan: Fix out-of-bound bugs caused by unset skb->mac_header
    dae9d2abe25b iavf: Fix cached head and tail value for iavf_get_tx_pending
    34447d64b8d2 ice: Don't double unplug aux on peer initiated reset
    816eab147e5c netfilter: nfnetlink_osf: fix possible bogus match in nf_osf_find()
    dc33ffbc361e netfilter: nf_conntrack_irc: Tighten matching on DCC message
    0606c5d5fefd netfilter: nf_conntrack_sip: fix ct_sip_walk_headers
    0babb5bc85ee arm64: dts: rockchip: Remove 'enable-active-low' from rk3399-puma
    dd5a6c5a0875 dmaengine: ti: k3-udma-private: Fix refcount leak bug in of_xudma_dev_get()
    1b0e46d970b4 arm64: dts: rockchip: Set RK3399-Gru PCLK_EDP to 24 MHz
    e352fea1d0fc drm/mediatek: dsi: Add atomic {destroy,duplicate}_state, reset callbacks
    43733b6c9fda arm64: dts: rockchip: Fix typo in lisense text for PX30.Core
    2929463a9eff arm64: dts: rockchip: Pull up wlan wake# on Gru-Bob
    166a332463b5 firmware: arm_scmi: Fix the asynchronous reset requests
    1f08a1b26cfc firmware: arm_scmi: Harden accesses to the reset domains
    9ec5a534d77c xfs: validate inode fork size against fork format
    5caa3a127953 xfs: fix xfs_ifree() error handling to not leak perag ref
    9e7b231687fd xfs: reorder iunlink remove operation in xfs_ifree
    28c7ef86b21b vmlinux.lds.h: CFI: Reduce alignment of jump-table to function alignment
    3c3edb82d67b arm64: topology: fix possible overflow in amu_fie_setup()
    2427a04bce86 KVM: x86: Inject #UD on emulated XSETBV if XSAVES isn't enabled
    61703b248be9 mm: slub: fix flush_cpu_slab()/__free_slab() invocations in task context.
    2d6e55e0c038 mm/slub: fix to return errno if kmalloc() fails
    71075d7d4632 net: mana: Add rmb after checking owner bits
    19aea370fd09 can: flexcan: flexcan_mailbox_read() fix return value for drop = true
    bf0197aea195 kasan: call kasan_malloc() from __kmalloc_*track_caller()
    c75288a4902b riscv: fix a nasty sigreturn bug...
    97da736cd11a gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    9b26723e058f gpio: mockup: Fix potential resource leakage when register a chip
    18352095a0d5 gpio: mockup: fix NULL pointer dereference when removing debugfs
    2279e977405b wifi: mt76: fix reading current per-tid starting sequence number for aggregation
    b5bc5a274d54 efi: libstub: check Shim mode using MokSBStateRT
    ef43fee9f211 efi: x86: Wipe setup_data on pure EFI boot
    b173f1f8ef9e thunderbolt: Add support for Intel Maple Ridge single port controller
    65b13f951fe6 usb: dwc3: core: leave default DMA if the controller does not support 64-bit DMA
    7143f6cf58db media: flexcop-usb: fix endpoint type check
    d8a76a2e514f btrfs: fix hang during unmount when stopping a space reclaim worker
    46053262b5f5 btrfs: fix hang during unmount when stopping block group reclaim worker
    b02f86689a5a iommu/vt-d: Check correct capability for sagaw determination
    a963fe6d0eb6 ALSA: hda/realtek: Enable 4-speaker output Dell Precision 5530 laptop
    4b2fa20da623 ALSA: hda/realtek: Add quirk for ASUS GA503R laptop
    eb54e457c4ad ALSA: hda/realtek: Add pincfg for ASUS G533Z HP jack
    0898469913cd ALSA: hda/realtek: Add pincfg for ASUS G513 HP jack
    c6a746b4fca5 ALSA: hda/realtek: Re-arrange quirk table entries
    41e974cd6ecb ALSA: hda/realtek: Enable 4-speaker output Dell Precision 5570 laptop
    5421125bbda8 ALSA: hda/realtek: Add quirk for Huawei WRT-WX9
    84481d7a59a2 ALSA: hda: add Intel 5 Series / 3400 PCI DID
    04b5bd5702ab ALSA: hda/tegra: set depop delay for tegra
    e10425c5424b ALSA: core: Fix double-free at snd_card_new()
    10a8c5d7d393 Revert "ALSA: usb-audio: Split endpoint setups for hw_params and prepare"
    06c0204a6e80 USB: serial: option: add Quectel RM520N
    6cf9e8b7e67a USB: serial: option: add Quectel BG95 0x0203 composition
    369b008bbe36 USB: core: Fix RST error in hub.c
    d10d1e9d9f1e drivers/base: Fix unsigned comparison to -1 in CPUMAP_FILE_MAX_BYTES
    6eede01dfd0e Revert "usb: gadget: udc-xilinx: replace memcpy with memcpy_toio"
    c02431f43e12 Revert "usb: add quirks for Lenovo OneLink+ Dock"
    8de5e12f587b usb: gadget: udc-xilinx: replace memcpy with memcpy_toio
    2db7a7176c45 usb: add quirks for Lenovo OneLink+ Dock
    a72eee6d905e usb: dwc3: gadget: Avoid duplicate requests to enable Run/Stop
    f79a57d4091f usb: dwc3: gadget: Don't modify GEVNTCOUNT in pullup()
    1a9923999459 usb: dwc3: gadget: Refactor pullup()
    7604a210acbb usb: dwc3: gadget: Prevent repeat pullup()
    a0b5d22b0448 usb: dwc3: Issue core soft reset before enabling run/stop
    8d583ba79cde usb: dwc3: gadget: Avoid starting DWC3 gadget during UDC unbind
    167b18f25b96 staging: r8188eu: Add Rosewill USB-N150 Nano to device tables
    add40eda8258 staging: r8188eu: Remove support for devices with 8188FU chipset (0bda:f179)
    55653c548612 drm/amdgpu: make sure to init common IP before gmc
    25a90a11036b drm/amdgpu: Separate vf2pf work item init from virt data exchange
    3e98e33d345e Linux 5.15.70
    21f948cab866 ALSA: hda/sigmatel: Fix unused variable warning for beep power change
    5db17805b6ba cgroup: Add missing cpus_read_lock() to cgroup_attach_task_all()
    39b0235284c7 KVM: SEV: add cache flush to solve SEV cache incoherency issues
    d9bf46e74735 net: Find dst with sk's xfrm policy not ctl_sk
    ab5140c6ddd7 video: fbdev: pxa3xx-gcu: Fix integer overflow in pxa3xx_gcu_write
    9af7af862cb8 mksysmap: Fix the mismatch of 'L0' symbols in System.map
    2340f23c770d drm/panfrost: devfreq: set opp to the recommended one to configure regulator
    7e8df4920b2a MIPS: OCTEON: irq: Fix octeon_irq_force_ciu_mapping()
    af88da4c737a afs: Return -EAGAIN, not -EREMOTEIO, when a file already locked
    2dd0ae85fb3c net: usb: qmi_wwan: add Quectel RM520N
    a5e949e088bc ALSA: hda/tegra: Align BDL entry to 4KB boundary
    3d25aaf71fe0 ALSA: hda/sigmatel: Keep power up while beep is enabled
    d582756bfc71 wifi: mac80211_hwsim: check length for virtio packets
    17898c3b578a rxrpc: Fix calc of resend age
    1bbcd88c3c99 rxrpc: Fix local destruction being repeated
    87cd4c02bdb1 scsi: lpfc: Return DID_TRANSPORT_DISRUPTED instead of DID_REQUEUE
    f08a320b4b60 regulator: pfuze100: Fix the global-out-of-bounds access in pfuze100_regulator_probe()
    80c7be217ba7 ASoC: nau8824: Fix semaphore unbalance at error paths
    f1d57c4c99c2 arm64: dts: juno: Add missing MHU secure-irq
    59b756da49bf video: fbdev: i740fb: Error out if 'pixclock' equals zero
    899f4160b140 binder: remove inaccurate mmap_assert_locked()
    8c2bbfb0ded3 drm/amdgpu: move nbio sdma_doorbell_range() into sdma code for vega
    0a7d86f156fa drm/amdgpu: move nbio ih_doorbell_range() into ih code for vega
    dcef16f64969 drm/amdgpu: Don't enable LTR if not supported
    710ebf8f1a08 tools/include/uapi: Fix <asm/errno.h> for parisc and xtensa
    309e9f4a17cf parisc: Allow CONFIG_64BIT with ARCH=parisc
    9a72466fb61b cifs: always initialize struct msghdr smb_msg completely
    21c47a08f96a cifs: don't send down the destination address to sendmsg for a SOCK_STREAM
    e1aad8c56090 cifs: revalidate mapping when doing direct writes
    b04e0208d025 of/device: Fix up of_dma_configure_id() stub
    8fd27239ca92 parisc: ccio-dma: Add missing iounmap in error path in ccio_probe()
    5f285e4c47c3 block: blk_queue_enter() / __bio_queue_enter() must return -EAGAIN for nowait
    f86092d12fbb drm/meson: Fix OSD1 RGB to YCbCr coefficient
    d38eb1f37538 drm/meson: Correct OSD1 global alpha value
    89cfddd416ba gpio: mpc8xxx: Fix support for IRQ_TYPE_LEVEL_LOW flow_type in mpc85xx
    9a173db71a99 NFSv4: Turn off open-by-filehandle and NFS re-export for NFSv4.0
    cd358b2ee56f pinctrl: sunxi: Fix name for A100 R_PIO
    ca2b798e53d4 pinctrl: rockchip: Enhance support for IRQ_TYPE_EDGE_BOTH
    30fccb4fe449 pinctrl: qcom: sc8180x: Fix wrong pin numbers
    cbafdbb6f6ce pinctrl: qcom: sc8180x: Fix gpio_wakeirq_map
    ba6b9f7cc110 of: fdt: fix off-by-one error in unflatten_dt_nodes()
    c23065adf97f tty: serial: atmel: Preserve previous USART mode if RS485 disabled
    1d01d7beccba serial: atmel: remove redundant assignment in rs485_config
    f3450c33411b drm/tegra: vic: Fix build warning when CONFIG_PM=n
    820b689b4a7a Linux 5.15.69
    277674996dcf Input: goodix - add compatible string for GT1158
    b9b39f7332c5 RDMA/irdma: Use s/g array in post send only when its valid
    125c3ae8a936 usb: gadget: f_uac2: fix superspeed transfer
    fa7e0266c239 usb: gadget: f_uac2: clean up some inconsistent indenting
    07609e83c1b9 soc: fsl: select FSL_GUTS driver for DPIO
    3998dc50ebdc mm: Fix TLB flush for not-first PFNMAP mappings in unmap_region()
    cd698131ef5d usb: storage: Add ASUS <0x0b05:0x1932> to IGNORE_UAS
    6087747599ec platform/x86: acer-wmi: Acer Aspire One AOD270/Packard Bell Dot keymap fixes
    d4441b810bd8 perf/arm_pmu_platform: fix tests for platform_get_irq() failure
    55032fb14d4a net: dsa: hellcreek: Print warning only once
    985a5d3d491d drm/amd/amdgpu: skip ucode loading if ucode_size == 0
    a1347be8f0ff nvmet-tcp: fix unhandled tcp states in nvmet_tcp_state_change()
    3d380f9d1e2b Input: iforce - add support for Boeder Force Feedback Wheel
    b9682878abee ieee802154: cc2520: add rc code in cc2520_tx()
    3a10e8edee2b gpio: mockup: remove gpio debugfs when remove device
    b4ebcd6d48bc tg3: Disable tg3 device on system reboot to avoid triggering AER
    f715188c23fa hid: intel-ish-hid: ishtp: Fix ishtp client sending disordered message
    a86c8d1b36a9 HID: ishtp-hid-clientHID: ishtp-hid-client: Fix comment typo
    2e3aeb48995a dt-bindings: iio: gyroscope: bosch,bmg160: correct number of pins
    1b80691d5115 drm/msm/rd: Fix FIFO-full deadlock
    a9687a2dc7e1 platform/surface: aggregator_registry: Add support for Surface Laptop Go 2
    49801d5f8b67 Input: goodix - add support for GT1158
    709edbac4c45 iommu/vt-d: Fix kdump kernels boot failure with scalable mode
    90f922646f57 tracefs: Only clobber mode/uid/gid on remount if asked
    3c90af5a773a tracing: hold caller_addr to hardirq_{enable,disable}_ip
    64840a4a2d8e task_stack, x86/cea: Force-inline stack helpers
    0b009e5fd146 x86/mm: Force-inline __phys_addr_nodebug()
    f9571a969973 lockdep: Fix -Wunused-parameter for _THIS_IP_
    dee782da3937 ARM: dts: at91: sama7g5ek: specify proper regulator output ranges
    424ac5929d0a ARM: dts: at91: fix low limit for CPU regulator
    8be25fa7cfd6 ARM: dts: imx6qdl-kontron-samx6i: fix spi-flash compatible
    78eb5e326a0e ARM: dts: imx: align SPI NOR node name with dtschema
    3bb12efc5e4d ACPI: resource: skip IRQ override on AMD Zen platforms
    a68a734b19af NFS: Fix WARN_ON due to unionization of nfs_inode.nrequests
    dd20085f2a88 Linux 5.15.68
    e04b25638aef ARM: at91: ddr: remove CONFIG_SOC_SAMA7 dependency
    154e72a4b381 perf machine: Use path__join() to compose a path instead of snprintf(dir, '/', filename)
    590b4f10e3a4 drm/bridge: display-connector: implement bus fmts callbacks
    e084c6ab37d2 arm64: errata: add detection for AMEVCNTR01 incrementing incorrectly
    4740910867ea iommu/vt-d: Correctly calculate sagaw value of IOMMU
    f9e792035a0b arm64/bti: Disable in kernel BTI when cross section thunks are broken
    a8a007c5b10f Revert "arm64: kasan: Revert "arm64: mte: reset the page tag in page->flags""
    7aa57d869e4a hwmon: (mr75203) enable polling for all VM channels
    5e0fddad7100 hwmon: (mr75203) fix multi-channel voltage reading
    948b7beb0073 hwmon: (mr75203) fix voltage equation for negative source input
    a02267ebb247 hwmon: (mr75203) update pvt->v_num and vm_num to the actual number of used sensors
    000f3353231e hwmon: (mr75203) fix VM sensor allocation when "intel,vm-map" not defined
    4b198c41d736 s390/boot: fix absolute zero lowcore corruption on boot
    a557ae094207 iommu/amd: use full 64-bit value in build_completion_wait()
    4f8d65884808 swiotlb: avoid potential left shift overflow
    df82f5ce4f50 i40e: Fix ADQ rate limiting for PF
    39d9de5872b6 i40e: Refactor tc mqprio checks
    657d9d8ac3e6 kbuild: disable header exports for UML in a straightforward way
    12202e0f74fd MIPS: loongson32: ls1c: Fix hang during startup
    166ae43f02fb ASoC: mchp-spdiftx: Fix clang -Wbitfield-constant-conversion
    4643fbc79ded ASoC: mchp-spdiftx: remove references to mchp_i2s_caps
    30a455ac385e hwmon: (tps23861) fix byte order in resistance register
    159d35a87ec3 perf script: Fix Cannot print 'iregs' field for hybrid systems
    4519d4e32f98 sch_sfb: Also store skb len before calling child enqueue
    a600a9babad6 RDMA/irdma: Report RNR NAK generation in device caps
    3ca173b217f4 RDMA/irdma: Return correct WC error for bind operation failure
    c1872dfde6f7 RDMA/irdma: Report the correct max cqes from query device
    a1d7c8647c18 nvmet: fix mar and mor off-by-one errors
    a96b1d33ec71 tcp: fix early ETIMEDOUT after spurious non-SACK RTO
    8589bbfad2b4 nvme-tcp: fix regression that causes sporadic requests to time out
    13c80a6c1124 nvme-tcp: fix UAF when detecting digest errors
    8ddd001cef5e erofs: fix pcluster use-after-free on UP platforms
    5fbe35c94abc RDMA/mlx5: Set local port to one when accessing counters
    819110054b14 IB/core: Fix a nested dead lock as part of ODP flow
    55195563ec29 ipv6: sr: fix out-of-bounds read when setting HMAC data.
    4c4eda136410 RDMA/siw: Pass a pointer to virt_to_page()
    595e3616f8e0 xen-netback: only remove 'hotplug-status' when the vif is actually destroyed
    c3efe896f13b iavf: Detach device during reset task
    2ed94383f3a2 i40e: Fix kernel crash during module removal
    3e245b0e2168 ice: use bitmap_free instead of devm_kfree
    8527c9a6bf8e tcp: TX zerocopy should not sense pfmemalloc status
    cd5f1a69d0b6 net: introduce __skb_fill_page_desc_noacc
    7eb9bf4edd1c tipc: fix shift wrapping bug in map_get()
    1a889da60afc sch_sfb: Don't assume the skb is still around after enqueueing to child
    b0b35b455ece Revert "net: phy: meson-gxl: improve link-up behavior"
    2f6640b19edf afs: Use the operation issue time instead of the reply time for callbacks
    e28eb3519d5f rxrpc: Fix an insufficiently large sglist in rxkad_verify_packet_2()
    24a4e79d92e0 rxrpc: Fix ICMP/ICMP6 error handling
    59f1c62d91ca ALSA: usb-audio: Register card again for iface over delayed_register option
    4dc401ef8b23 ALSA: usb-audio: Inform the delayed registration more properly
    a8edd49c94b4 RDMA/srp: Set scmnd->result only when scmnd is not NULL
    451c9ce1e2fc netfilter: nf_conntrack_irc: Fix forged IP logic
    1ce55ec5cb7c netfilter: nf_tables: clean up hook list when offload flags check fails
    92837ac04779 netfilter: br_netfilter: Drop dst references before setting.
    940e58f2ccc0 ARM: dts: at91: sama5d2_icp: don't keep vdd_other enabled all the time
    86706fa90be6 ARM: dts: at91: sama5d27_wlsom1: don't keep ldo2 enabled all the time
    d6015c56f477 ARM: dts: at91: sama5d2_icp: specify proper regulator output ranges
    a8ab10c3f137 ARM: dts: at91: sama5d27_wlsom1: specify proper regulator output ranges
    6fbff44cba17 ARM: at91: pm: fix DDR recalibration when resuming from backup and self-refresh
    e11d08c825f2 ARM: at91: pm: fix self-refresh for sama7g5
    32dd0b22a5ba wifi: wilc1000: fix DMA on stack objects
    6f7aa1029f8e RDMA/hns: Fix wrong fixed value of qp->rq.wqe_shift
    c1796dd54259 RDMA/hns: Fix supported page size
    43245c77d9ef soc: brcmstb: pm-arm: Fix refcount leak and __iomem leak bugs
    d3eb252d7636 RDMA/cma: Fix arguments order in net device validation
    e2ec1064a47d tee: fix compiler warning in tee_shm_register()
    eb53e84dc1ac regulator: core: Clean up on enable failure
    a53b30716c60 soc: imx: gpcv2: Assert reset before ungating clock
    83a7e5d2f14e ARM: dts: imx6qdl-kontron-samx6i: remove duplicated node
    ae8e70e31763 RDMA/rtrs-srv: Pass the correct number of entries for dma mapped SGL
    ad69caa47861 RDMA/rtrs-clt: Use the right sg_cnt after ib_dma_map_sg
    237f16395304 ASoC: qcom: sm8250: add missing module owner
    3bf4bf54069f cgroup: Fix threadgroup_rwsem <-> cpus_read_lock() deadlock
    509e3456d363 cgroup: Elide write-locking threadgroup_rwsem when updating csses on an empty subtree
    3b97deb4abf5 NFS: Fix another fsync() issue after a server reboot
    31b992b3c39b NFS: Save some space in the inode
    88d24e83a268 NFS: Further optimisations for 'ls -l'
    1dcc308898e7 scsi: lpfc: Add missing destroy_workqueue() in error path
    6229fa494a59 scsi: mpt3sas: Fix use-after-free warning
    d2ca79dd0b54 drm/i915: Implement WaEdpLinkRateDataReload
    ebf46da50beb nvmet: fix a use-after-free
    58acd2ebae03 drm/amd/display: fix memory leak when using debugfs_lookup()
    26e9a1ded892 sched/debug: fix dentry leak in update_sched_domain_debugfs
    94c84128adb1 debugfs: add debugfs_lookup_and_remove()
    8875d606761e kprobes: Prohibit probes in gate area
    5321908ef74f vfio/type1: Unpin zero pages
    7da1afa444a1 btrfs: zoned: set pseudo max append zone limit in zone emulation mode
    75082adeb414 tracing: Fix to check event_mutex is held while accessing trigger list
    98e8e67395cc ALSA: usb-audio: Fix an out-of-bounds bug in __snd_usb_parse_audio_interface()
    df5ec554e9e3 ALSA: usb-audio: Split endpoint setups for hw_params and prepare
    d1118465ae2e ALSA: aloop: Fix random zeros in capture data when using jiffies timer
    45814a53514e ALSA: emu10k1: Fix out of bounds access in snd_emu10k1_pcm_channel_alloc()
    8015ef9e8a0e ALSA: pcm: oss: Fix race at SNDCTL_DSP_SYNC
    ad5ef763dbbe drm/amdgpu: mmVM_L2_CNTL3 register not initialized correctly
    fc5a2a9616f3 fbdev: chipsfb: Add missing pci_disable_device() in chipsfb_pci_init()
    c3abfd6ce2f3 fbdev: fbcon: Destroy mutex on freeing struct fb_info
    a7dff6f41e16 md: Flush workqueue md_rdev_misc_wq in md_alloc()
    0b7058067eb8 net/core/skbuff: Check the return value of skb_copy_bits()
    bd1b769564eb cpufreq: check only freq_table in __resolve_freq()
    e928cf258910 netfilter: conntrack: work around exceeded receive window
    29906311b351 arm64: cacheinfo: Fix incorrect assignment of signed error value to unsigned fw_level
    27092358e9c6 parisc: Add runtime check to prevent PA2.0 kernels on PA1.x machines
    deb2c9c0770b parisc: ccio-dma: Handle kmalloc failure in ccio_init_resources()
    c63ff388e7d4 Revert "parisc: Show error if wrong 32/64-bit compiler is being used"
    c50189129374 scsi: ufs: core: Reduce the power mode change timeout
    5a7a5b2edac4 drm/radeon: add a force flush to delay work when radeon
    622a557b28b7 drm/amdgpu: Check num_gfx_rings for gfx v9_0 rb setup.
    c15c2c2c0896 drm/amdgpu: Move psp_xgmi_terminate call from amdgpu_xgmi_remove_device to psp_hw_fini
    1f574fbe9c2b drm/gem: Fix GEM handle release errors
    bbfd857abbd2 scsi: megaraid_sas: Fix double kfree()
    8179f0e08578 scsi: qla2xxx: Disable ATIO interrupt coalesce for quad port ISP27XX
    625c78e1ae35 Revert "mm: kmemleak: take a full lowmem check in kmemleak_*_phys()"
    7c6333411acf fs: only do a memory barrier for the first set_buffer_uptodate()
    44b402da7b24 wifi: iwlegacy: 4965: corrected fix for potential off-by-one overflow in il4965_rs_fill_link_cmd()
    dd291e070be0 efi: capsule-loader: Fix use-after-free in efi_capsule_write
    ee06f08139e7 efi: libstub: Disable struct randomization
    6427605fa781 net: wwan: iosm: remove pointless null check
    e1ad7a011591 Linux 5.15.67
    096e34b05a43 kbuild: fix up permissions on scripts/pahole-flags.sh
    bcecd2ee19ef Linux 5.15.66
    e1779c25e48b USB: serial: ch341: fix disabled rx timer on older devices
    e0923b4f38df USB: serial: ch341: fix lost character on LCR updates
    55d328924347 usb: dwc3: disable USB core PHY management
    121c6e37da76 usb: dwc3: qcom: fix use-after-free on runtime-PM wakeup
    9d6a2d022010 usb: dwc3: fix PHY disable sequence
    b775fbf532dc kbuild: Add skip_encoding_btf_enum64 option to pahole
    0baced0e0938 kbuild: Unify options for BTF generation for vmlinux and modules
    309aea4b6b81 tty: n_gsm: add sanity check for gsm->receive in gsm_receive_buf()
    1787ec7dcc37 drm/i915: Skip wm/ddb readout for disabled pipes
    f9a0f49be767 drm/i915/glk: ECS Liva Q2 needs GLK HDMI port timing quirk
    301be8985e87 ALSA: seq: Fix data-race at module auto-loading
    9b7a07fcc5d4 ALSA: seq: oss: Fix data-race for max_midi_devs access
    b2c973b52f14 ALSA: hda/realtek: Add speaker AMP init for Samsung laptops with ALC298
    c5652d5d71cf net: mac802154: Fix a condition in the receive path
    4b9f3743a822 net: Use u64_stats_fetch_begin_irq() for stats fetch.
    57f1407ca166 ip: fix triggering of 'icmp redirect'
    5d20c6f932f2 wifi: mac80211: Fix UAF in ieee80211_scan_rx()
    552ba102a689 wifi: mac80211: Don't finalize CSA in IBSS mode if state is disconnected
    253ec5fb8405 driver core: Don't probe devices after bus_type.match() probe deferral
    7da29a2cc514 usb: gadget: mass_storage: Fix cdrom data transfers on MAC-OS
    299f4f420f23 usb: xhci-mtk: fix bandwidth release issue
    27102b39b6d0 usb: xhci-mtk: relax TT periodic bandwidth allocation
    c548b99e1c37 USB: core: Prevent nested device-reset calls
    4e22a43ec717 s390: fix nospec table alignments
    047a4d0f7924 s390/hugetlb: fix prepare_hugepage_range() check for 2 GB hugepages
    efdfa236a085 usb-storage: Add ignore-residue quirk for NXP PN7462AU
    0f8b5d706dcd USB: cdc-acm: Add Icom PMR F3400 support (0c26:0020)
    bf6e4243f80b usb: cdns3: fix incorrect handling TRB_SMM flag for ISOC transfer
    f1eb9e5d2f6e usb: cdns3: fix issue with rearming ISO OUT endpoint
    48917032c702 usb: dwc2: fix wrong order of phy_power_on and phy_init
    ea72b22a05ea usb: typec: tcpm: Return ENOTSUPP for power supply prop writes
    4be500c63911 usb: typec: intel_pmc_mux: Add new ACPI ID for Meteor Lake IOM device
    b201f6203197 usb: typec: altmodes/displayport: correct pin assignment for UFP receptacles
    577f84a6f120 USB: serial: option: add support for Cinterion MV32-WA/WB RmNet mode
    6415953963a9 USB: serial: option: add Quectel EM060K modem
    93c283a09959 USB: serial: option: add support for OPPO R11 diag port
    2bb1ad8c957d USB: serial: cp210x: add Decagon UCA device id
    3a6c5c5ab734 xhci: Add grace period after xHC start to prevent premature runtime suspend.
    75913c562f5b media: mceusb: Use new usb_control_msg_*() routines
    2c948dd68b9e usb: dwc3: pci: Add support for Intel Raptor Lake
    23987d01de44 thunderbolt: Use the actual buffer in tb_async_error()
    e31db376f6d1 xen-blkfront: Cache feature_persistent value before advertisement
    895a90ad7b3e xen-blkfront: Advertise feature-persistent as user requested
    3e8107d69fc3 xen-blkback: Advertise feature-persistent as user requested
    c235c4fc521f mm: pagewalk: Fix race between unmap and page walker
    763d77241d8f xen/grants: prevent integer overflow in gnttab_dma_alloc_pages()
    03b1870fbc5e KVM: x86: Mask off unsupported and unknown bits of IA32_ARCH_CAPABILITIES
    111a3586ed4a gpio: pca953x: Add mutex_lock for regcache sync in PM
    53196e037620 hwmon: (gpio-fan) Fix array out of bounds access
    7b8a284ffe7a clk: bcm: rpi: Add missing newline
    ff0b144d4b0a clk: bcm: rpi: Prevent out-of-bounds access
    e827a5f32a0d clk: bcm: rpi: Use correct order for the parameters of devm_kcalloc()
    237b4ef4c088 clk: bcm: rpi: Fix error handling of raspberrypi_fw_get_rate
    5ba6155d3b2f Input: rk805-pwrkey - fix module autoloading
    9766749a30f6 clk: core: Fix runtime PM sequence in clk_core_unprepare()
    c13b0be5ade0 Revert "clk: core: Honor CLK_OPS_PARENT_ENABLE for clk gate ops"
    519cd9c4b56e clk: core: Honor CLK_OPS_PARENT_ENABLE for clk gate ops
    0522550aeed4 drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"
    fec48eba4783 KVM: VMX: Heed the 'msr' argument in msr_write_intercepted()
    9e3c9efa7caf cifs: fix small mempool leak in SMB2_negotiate()
    81203ab7a6ef binder: fix alloc->vma_vm_mm null-ptr dereference
    c2a4b5dc8fa7 binder: fix UAF of ref->proc caused by race condition
    da3c6d0708e6 mmc: core: Fix inconsistent sd3_bus_mode at UHS-I SD voltage switch failure
    8bca22970e1c mmc: core: Fix UHS-I SD 1.8V workaround branch
    fc9b5b3f2ccc USB: serial: ftdi_sio: add Omron CS1W-CIF31 device id
    cf20c3533efc misc: fastrpc: fix memory corruption on open
    0e33b0f322fe misc: fastrpc: fix memory corruption on probe
    95ac9601feb5 iio: adc: mcp3911: use correct formula for AD conversion
    6e933a26e6a2 iio: ad7292: Prevent regulator double disable
    df1b53bc799d Input: iforce - wake up after clearing IFORCE_XMIT_RUNNING flag
    9f185ca8e019 tty: serial: lpuart: disable flow control while waiting for the transmit engine to complete
    532b255af195 musb: fix USB_MUSB_TUSB6010 dependency
    2535431ae967 vt: Clear selection before changing the font
    a19846f0f45b powerpc: align syscall table for ppc32
    f12afb4b5db0 staging: r8188eu: add firmware dependency
    dc02aaf95001 staging: rtl8712: fix use after free bugs
    01fd7e12f8fb serial: fsl_lpuart: RS485 RTS polariy is inverse
    839ca7969fcf soundwire: qcom: fix device status array range
    fdc69b070071 net/smc: Remove redundant refcount increase
    6ce0d73b2fbd Revert "sch_cake: Return __NET_XMIT_STOLEN when consuming enqueued skb"
    aca9d0acda9e tcp: annotate data-race around challenge_timestamp
    1c472d671d9c sch_cake: Return __NET_XMIT_STOLEN when consuming enqueued skb
    55fb8c3baa80 kcm: fix strp_init() order and cleanup
    660df4411ef4 mlxbf_gige: compute MDIO period based on i1clk
    a4c08cbfbcf9 ethernet: rocker: fix sleep in atomic context bug in neigh_timer_handler
    a420d5872601 net/sched: fix netdevice reference leaks in attach_default_qdiscs()
    ce881ddbdc02 net: sched: tbf: don't call qdisc_put() while holding tree lock
    d6ec2f711c94 net: dsa: xrs700x: Use irqsave variant for u64 stats update
    ca54b2bfaab3 openvswitch: fix memory leak at failed datapath creation
    8eeba7ef4d1d net: smsc911x: Stop and start PHY during suspend and resume
    cc2b9170aa34 net: sparx5: fix handling uneven length packets in manual extraction
    5359524251d2 Revert "xhci: turn off port power in shutdown"
    ee19bbed4b03 wifi: cfg80211: debugfs: fix return type in ht40allow_map_read()
    20b2d5be85e9 ALSA: hda: intel-nhlt: Correct the handling of fmt_config flexible array
    59a711467e8d ALSA: hda: intel-nhlt: remove use of __func__ in dev_dbg
    7828b5d0080a drm/i915/display: avoid warnings when registering dual panel backlight
    630ab29120b5 drm/i915/backlight: extract backlight code to a separate file
    9f8558c5c642 ieee802154/adf7242: defer destroy_workqueue call
    222bd95c89b1 bpf, cgroup: Fix kernel BUG in purge_effective_progs
    1c518476ceb4 bpf: Restrict bpf_sys_bpf to CAP_PERFMON
    de22cba333d8 skmsg: Fix wrong last sg check in sk_msg_recvmsg()
    7497f9766f08 iio: adc: mcp3911: make use of the sign bit
    9e1f74294d53 platform/x86: pmc_atom: Fix SLP_TYPx bitfield mask
    1a785b435276 drm/msm/dsi: Fix number of regulators for SDM660
    ab8533946db7 drm/msm/dsi: Fix number of regulators for msm8996_dsi_cfg
    0a4f633548c4 drm/msm/dp: delete DP_RECOVERED_CLOCK_OUT_EN to fix tps4
    e8bd54b0664b drm/msm/dsi: fix the inconsistent indenting
    633c3b4c71bb Linux 5.15.65
    572b646c8d93 net: neigh: don't call kfree_skb() under spin_lock_irqsave()
    facf99bc3a95 net/af_packet: check len when min_header_len equals to 0
    591a98b823fb android: binder: fix lockdep check on clearing vma
    92dc4c1a8e58 btrfs: fix space cache corruption and potential double allocations
    55c7a9152734 kprobes: don't call disarm_kprobe() for disabled kprobes
    6a27997cf44e btrfs: tree-checker: check for overlapping extent items
    1b2a7ddeaa77 btrfs: fix lockdep splat with reloc root extent buffers
    98dfad7fb688 btrfs: move lockdep class helpers to locking.c
    a74fc94fb1a9 testing: selftests: nft_flowtable.sh: use random netns names
    1d8b5d251994 netfilter: conntrack: NF_CONNTRACK_PROCFS should no longer default to y
    85dd24ff77c1 drm/amd/display: avoid doing vm_init multiple time
    898467ac9bcb drm/amdgpu: Increase tlb flush timeout for sriov
    4df54c493e76 drm/amd/display: Fix pixel clock programming
    a89e753d5a9f drm/amd/pm: add missing ->fini_microcode interface for Sienna Cichlid
    a2ede313fbf0 ksmbd: don't remove dos attribute xattr on O_TRUNC open
    a7ada939712a s390/hypfs: avoid error message under KVM
    db6fa03d80ab neigh: fix possible DoS due to net iface start/stop loop
    857048ea1d28 ksmbd: return STATUS_BAD_NETWORK_NAME error status if share is not configured
    5ee30bcfdb32 drm/amd/display: clear optc underflow before turn off odm clock
    e407e04a93d7 drm/amd/display: For stereo keep "FLIP_ANY_FRAME"
    2cddd3d0b049 drm/amd/display: Fix HDMI VSIF V3 incorrect issue
    0c8abeceee0f drm/amd/display: Avoid MPC infinite loop
    061ffb1e419b ASoC: sh: rz-ssi: Improve error handling in rz_ssi_probe() error path
    d347d66b1972 fs/ntfs3: Fix work with fragmented xattr
    bf216c168f9e btrfs: fix warning during log replay when bumping inode link count
    985bbad18408 btrfs: add and use helper for unlinking inode during log replay
    968815211212 btrfs: remove no longer needed logic for replaying directory deletes
    7697ca60db06 btrfs: remove root argument from btrfs_unlink_inode()
    71beead997f5 mmc: sdhci-of-dwcmshc: Re-enable support for the BlueField-3 SoC
    68b6cbaa318e mmc: sdhci-of-dwcmshc: rename rk3568 to rk35xx
    c038e4094ba2 mmc: sdhci-of-dwcmshc: add reset call back for rockchip Socs
    d6a74ee2a7b2 mmc: mtk-sd: Clear interrupts when cqe off/disable
    4676773ea117 drm/i915/gt: Skip TLB invalidations once wedged
    f0582f5ac1ea HID: thrustmaster: Add sparco wheel and fix array length
    77f8e40a3cbb HID: asus: ROG NKey: Ignore portion of 0x5a report
    d74ce3ece402 HID: AMD_SFH: Add a DMI quirk entry for Chromebooks
    a569d41c5aba HID: add Lenovo Yoga C630 battery quirk
    b08469874a16 ALSA: usb-audio: Add quirk for LH Labs Geek Out HD Audio 1V5
    c18a209b56e3 mm/rmap: Fix anon_vma->degree ambiguity leading to double-reuse
    a75987714bd2 bpf: Don't redirect packets with invalid pkt_len
    e4ae97295984 ftrace: Fix NULL pointer dereference in is_ftrace_trampoline when ftrace is dead
    34c3dea11895 fbdev: fb_pm2fb: Avoid potential divide by zero error
    a5d1cb908131 net: fix refcount bug in sk_psock_get (2)
    dfd27a737283 HID: hidraw: fix memory leak in hidraw_release()
    f2f6e6752291 media: pvrusb2: fix memory leak in pvr_probe
    e658538c610c udmabuf: Set the DMA mask for the udmabuf device (v2)
    989560b6d9e0 HID: steam: Prevent NULL pointer dereference in steam_{recv,send}_report
    67216f47922d Revert "PCI/portdrv: Don't disable AER reporting in get_port_device_capability()"
    9e38a363dc63 Bluetooth: L2CAP: Fix build errors in some archs
    2e0ffef17308 kbuild: Fix include path in scripts/Makefile.modpost
    e9d7ca0c4640 io_uring: fix UAF due to missing POLLFREE handling
    182dc3aa5ae2 io_uring: fix wrong arm_poll error handling
    6c7259c83773 io_uring: fail links when poll fails
    c41e79a0c464 io_uring: bump poll refs to full 31-bits
    7524ec52caa8 io_uring: remove poll entry from list when canceling all
    95a004a223f8 io_uring: Remove unused function req_ref_put
    f770fba096a6 io_uring: poll rework
    8dc669632f0d io_uring: inline io_poll_complete
    20bbcc316314 io_uring: kill poll linking optimisation
    a85d7ac14f22 io_uring: move common poll bits
    040e58f51c0b io_uring: refactor poll update
    b850d6ddc788 io_uring: clean cqe filling functions
    5c0ea4c8e54b io_uring: correct fill events helpers types
    285e77dbb36f arm64: errata: Add Cortex-A510 to the repeat tlbi list
    da60ddd80d09 mm/hugetlb: avoid corrupting page->mapping in hugetlb_mcopy_atomic_pte
    e7a792dcd6a7 Drivers: hv: balloon: Support status report for larger page sizes
    2edbdfc89d9f crypto: lib - remove unneeded selection of XOR_BLOCKS
    6db913f5e449 firmware: tegra: bpmp: Do only aligned access to IPC memory area
    80d46e73e8d3 drm/vc4: hdmi: Depends on CONFIG_PM
    3d2d12fb7815 drm/vc4: hdmi: Rework power up
    8468ccbf4c44 ACPI: thermal: drop an always true check
    f8b07c05b699 drm/bridge: Add stubs for devm_drm_of_get_bridge when OF is disabled
    3ffb97fce282 mm: Force TLB flush for PFNMAP mappings before unlink_file_vma()
    1ded0ef2419e Linux 5.15.64
    4f672112f866 bpf: Don't use tnum_range on array range checking for poke descriptors
    cd2a50d0a097 scsi: storvsc: Remove WQ_MEM_RECLAIM from storvsc_error_wq
    2c72bead9bc6 scsi: ufs: core: Enable link lost interrupt
    da86f80da31a perf stat: Clear evsel->reset_group for each stat run
    b5f5fee03d17 perf/x86/intel/ds: Fix precise store latency handling
    83bd6d121245 perf/x86/intel/uncore: Fix broken read_counter() for SNB IMC PMU
    a38e7ab46740 perf python: Fix build when PYTHON_CONFIG is user supplied
    77864ed6c6ce blk-mq: fix io hung due to missing commit_rqs
    4428d15cddd5 Documentation/ABI: Mention retbleed vulnerability info file for sysfs
    992d2fc2fe7f x86/nospec: Fix i386 RSB stuffing
    577d9c05cc48 binder_alloc: add missing mmap_lock calls when using the VMA
    1ed630bc530a arm64: Fix match_list for erratum 1286807 on Arm Cortex-A76
    af61a8f76039 mptcp: Fix crash due to tcp_tsorted_anchor was initialized before release skb
    661c01b2181d md: call __md_stop_writes in md_stop
    ee0c613bfe83 Revert "md-raid: destroy the bitmap after destroying the thread"
    0038f8593325 mm/hugetlb: fix hugetlb not supporting softdirty tracking
    6ee82524b0aa Revert "usbnet: smsc95xx: Forward PHY interrupts to PHY driver to avoid polling"
    7ae43647f499 Revert "usbnet: smsc95xx: Fix deadlock on runtime resume"
    295219ab7d62 io_uring: fix issue with io_write() not always undoing sb_start_write()
    f8aafb25ec38 riscv: traps: add missing prototype
    c2b7bae7c900 xen/privcmd: fix error exit of privcmd_ioctl_dm_op()
    0351fdbd8cb4 smb3: missing inode locks in punch hole
    3640cdccbe75 nouveau: explicitly wait on the fence in nouveau_bo_move_m2mf
    b490dfcbb921 ACPI: processor: Remove freq Qos request for all CPUs
    f1aedd2ffead Revert "memcg: cleanup racy sum avoidance code"
    ebd6f886aa24 fbdev: fbcon: Properly revert changes when vc_resize() failed
    8195e065abf3 s390: fix double free of GS and RI CBs on fork() failure
    16a12ee619e3 bootmem: remove the vmemmap pages from kmemleak in put_page_bootmem
    9227599cd987 s390/mm: do not trigger write fault when vma does not allow VM_WRITE
    ddcb0696136b mm/damon/dbgfs: avoid duplicate context directory creation
    95587037ea58 asm-generic: sections: refactor memory_intersects
    f96b9f7c1676 writeback: avoid use-after-free after removing device
    0455bef69028 loop: Check for overflow while configuring loop
    500195a109bc x86/nospec: Unwreck the RSB stuffing
    75fa6c733b85 x86/bugs: Add "unknown" reporting for MMIO Stale Data
    a7484eb9f3e0 x86/unwind/orc: Unwind ftrace trampolines with correct ORC entry
    1cdfef6cd296 perf/x86/lbr: Enable the branch type for the Arch LBR by default
    5f52402c7701 btrfs: fix possible memory leak in btrfs_get_dev_args_from_path()
    793505888d60 btrfs: check if root is readonly while setting security xattr
    2aa1a1cff81d btrfs: add info when mount fails due to stale replace target
    17343a515fa5 btrfs: replace: drop assert for suspended replace
    34cab3bba8ca btrfs: fix silent failure when deleting root reference
    50396e19d9d8 net: stmmac: work around sporadic tx issue on link-up
    48f4d54ccc4d ionic: VF initial random MAC address if no assigned mac
    bcbf1d959933 ionic: fix up issues with handling EAGAIN on FW cmds
    9a41433cc73b ionic: clear broken state on generation change
    8d2761dbfcb9 ionic: widen queue_lock use around lif init and deinit
    2bc769b8edb1 rxrpc: Fix locking in rxrpc's sendmsg
    0c3fd13b9c6d i40e: Fix incorrect address type for IPv6 flow rules
    bda3e3892434 ixgbe: stop resetting SYSTIME in ixgbe_ptp_start_cyclecounter
    cb9eaedd9fc0 net: Fix a data-race around sysctl_somaxconn.
    b340f83dafba net: Fix data-races around sysctl_devconf_inherit_init_net.
    181bae6dff66 net: Fix data-races around sysctl_fb_tunnels_only_for_init_net.
    ed14f10e13f6 net: Fix a data-race around netdev_budget_usecs.
    70564ad8d190 net: Fix data-races around sysctl_max_skb_frags.
    289f2f582667 mptcp: stop relying on tcp_tx_skb_cache
    a07f3af6393a tcp: expose the tcp_mark_push() and tcp_skb_entail() helpers
    2baeaef4dd73 net: Fix a data-race around netdev_budget.
    8e9e124aeb9c net: Fix a data-race around sysctl_net_busy_read.
    4e12829fd3b9 net: Fix a data-race around sysctl_net_busy_poll.
    f6b5be42ce4b net: Fix a data-race around sysctl_tstamp_allow_data.
    d39a02760bf2 net: Fix data-races around sysctl_optmem_max.
    0db9ce822f13 ratelimit: Fix data-races in ___ratelimit().
    cd755a7e4062 net: Fix data-races around netdev_tstamp_prequeue.
    4d2c808d0983 net: Fix data-races around netdev_max_backlog.
    572d4cdf907f net: Fix data-races around weight_p and dev_weight_[rt]x_bias.
    33372f2b6c6d net: Fix data-races around sysctl_[rw]mem_(max|default).
    8fbdec08dbf7 netfilter: flowtable: fix stuck flows on cleanup due to pending work
    eb6645a0f2ca netfilter: flowtable: add function to invoke garbage collection immediately
    51f192ae71c3 netfilter: nf_tables: disallow binding to already bound chain
    7196f4577f1c netfilter: nf_tables: disallow jump to implicit chain from set element
    4097749aec54 netfilter: nf_tables: upfront validation of data via nft_data_init()
    cc311eae1f30 netfilter: bitwise: improve error goto labels
    9bf98120a943 netfilter: nft_cmp: optimize comparison for 16-bytes
    c5ba86cde6bb netfilter: nf_tables: consolidate rule verdict trace call
    b6d601211ce4 netfilter: nft_tunnel: restrict it to netdev family
    530f4bb9ed58 netfilter: nft_osf: restrict osf to ipv4, ipv6 and inet families
    6d7ddee50395 netfilter: nf_tables: do not leave chain stats enabled on error
    cafe94e8d685 netfilter: nft_payload: do not truncate csum_offset and csum_type
    fbbecf068a3f netfilter: nft_payload: report ERANGE for too long offset and length
    fbaeb8046e7d netfilter: nf_tables: make table handle allocation per-netns friendly
    9f4b32890768 netfilter: nf_tables: disallow updates of implicit chain
    acca44ec232a bnxt_en: fix NQ resource accounting during vf creation on 57500 chips
    1b2c5428f773 netfilter: ebtables: reject blobs that don't provide all entry points
    7a5d10afeb1b net: ipvtap - add __init/__exit annotations to module init/exit funcs
    fec37fe2f278 bonding: 802.3ad: fix no transmission of LACPDUs
    aa108c97acf1 net: moxa: get rid of asymmetry in DMA mapping/unmapping
    c9dabd1f0410 net: phy: Don't WARN for PHY_READY state in mdio_bus_phy_resume()
    c4b38473b18e net: ipa: don't assume SMEM is page-aligned
    f7de12f247bb net/mlx5e: Fix wrong tc flag used when set hw-tc-offload off
    3f8608199640 net/mlx5e: Fix wrong application of the LRO state
    e161c24a92ef net/mlx5: Avoid false positive lockdep warning by adding lock_class_key
    0782959b92eb net/mlx5e: Properly disable vlan strip on non-UL reps
    fe76b3e67466 ice: xsk: prohibit usage of non-balanced queue id
    141b795ee39e ice: xsk: Force rings to be sized to power of 2
    9c34c33893db nfc: pn533: Fix use-after-free bugs caused by pn532_cmd_timeout
    2e8b65fda933 r8152: fix the RX FIFO settings when suspending
    59cfae681ffb r8152: fix the units of some registers for RTL8156A
    9cf85759e104 rose: check NULL rose_loopback_neigh->loopback
    e1ae035a5663 ntfs: fix acl handling
    d28f319043f0 mm/smaps: don't access young/dirty bit if pte unpresent
    28dccc4eaf98 SUNRPC: RPC level errors should set task->tk_rpc_status
    5626f9535611 NFSv4.2 fix problems with __nfs42_ssc_open
    519543a64650 NFS: Don't allocate nfs_fattr on the stack in __nfs42_ssc_open()
    84dc68c6140c Revert "net: macsec: update SCI upon MAC address change."
    c3f4f07a9eb1 net: use eth_hw_addr_set() instead of ether_addr_copy()
    770afc6e262b fs: require CAP_SYS_ADMIN in target namespace for idmapped mounts
    96f2758a6d02 xfrm: policy: fix metadata dst->dev xmit null pointer dereference
    103bd319c0fc af_key: Do not call xfrm_probe_algs in parallel
    4edd868acd23 xfrm: clone missing x->lastused in xfrm_do_migrate
    26ad2398fe49 xfrm: fix refcount leak in __xfrm_policy_check()
    044f8ff30e62 riscv: lib: uaccess: fix CSR_STATUS SR_SUM bit
    093cb743dcad riscv: lib: uaccess: fold fixups into body
    9de35edff035 btrfs: remove unnecessary parameter delalloc_start for writepage_delalloc()
    da7ad2ec580b btrfs: pass the dentry to btrfs_log_new_name() instead of the inode
    90b9e4892704 btrfs: put initial index value of a directory in a constant
    4438d54ce7a8 scsi: qla2xxx: edif: Fix dropped IKE message
    bcfe37c78854 scsi: qla2xxx: Fix response queue handler reading stale packets
    799e39edb0a8 drivers/base: fix userspace break from using bin_attributes for cpumap and cpulist
    75260fa268e1 Input: i8042 - add additional TUXEDO devices to i8042 quirk tables
    d6351dfe846c Input: i8042 - add TUXEDO devices to i8042 quirk tables
    e7d46453410d Input: i8042 - merge quirk tables
    0b0ee46bf65e Input: i8042 - move __initconst to fix code styling warning
    057238cdce45 btrfs: convert count_max_extents() to use fs_info->max_extent_size
    1aa262c1d056 btrfs: replace BTRFS_MAX_EXTENT_SIZE with fs_info->max_extent_size
    f675e3ae67e4 btrfs: zoned: revive max_zone_append_bytes
    1815305d8199 block: add bdev_max_segments() helper
    dd2ee2fd1fcb block: add a bdev_max_zone_append_sectors helper
    a50d9fde4616 x86/entry: Move CLD to the start of the idtentry macro
    108fb7e99bbf kernel/sys_ni: add compat entry for fadvise64_64
    7c83923031cd parisc: Fix exception handler for fldw and fstw instructions
    6efe7754e05d parisc: Make CONFIG_64BIT available for ARCH=parisc64 only
    f49fd5fe2399 cgroup: Fix race condition at rebind_subsystems()
    5c192867ae57 audit: fix potential double free on error path from fsnotify_add_inode_mark
    edd6e98a752c eth: sun: cassini: remove dead code
    b51ca7326d16 wifi: rtlwifi: remove always-true condition pointed out by GCC 12
    addc9003c2e8 Linux 5.15.63
    b92be74cb2da xfs: reject crazy array sizes being fed to XFS_IOC_GETBMAP*
    1350a4cdfbe6 xfs: revert "xfs: actually bump warning counts when we send warnings"
    12689d950d75 xfs: fix soft lockup via spinning in filestream ag selection loop
    bbc256bf904d xfs: fix overfilling of reserve pool
    90f414686bc4 xfs: always succeed at setting the reserve pool size
    07e17dcd03e0 xfs: remove infinite loop when reserving free block pool
    130b5965da3a xfs: reserve quota for target dir expansion when renaming files
    5e7f687ca727 xfs: reserve quota for dir expansion when linking/unlinking files
    139e6fc6e7a7 xfs: flush inodegc workqueue tasks before cancel
    d66d392c72a6 scsi: ufs: ufs-mediatek: Fix build error and type mismatch
    1a9f5411837a can: j1939: j1939_sk_queue_activate_next_locked(): replace WARN_ON_ONCE with netdev_warn_once()
    e7403632c015 MIPS: tlbex: Explicitly compare _PAGE_NO_EXEC against 0
    e740e787f066 video: fbdev: i740fb: Check the argument of i740_calc_vclk()
    0bdec5eed69c venus: pm_helpers: Fix warning in OPP during probe
    e3c9e9452a8e powerpc/64: Init jump labels before parse_early_param()
    ecdba236bc35 smb3: check xattr value length earlier
    3c201130cc81 f2fs: fix to do sanity check on segment type in build_sit_entries()
    5a01e45b925a f2fs: fix to avoid use f2fs_bug_on() in f2fs_new_node_page()
    3895d353f45a ALSA: control: Use deferred fasync helper
    409e6a799283 ALSA: timer: Use deferred fasync helper
    60110fd26623 ALSA: core: Add async signal helpers
    a5ec4cd45b52 powerpc/ioda/iommu/debugfs: Generate unique debugfs entries
    8641e0bbb5ef ovl: warn if trusted xattr creation fails
    0480540da5a2 powerpc/32: Don't always pass -mcpu=powerpc to the compiler
    3d5d2dc1dc08 powerpc/32: Set an IBAT covering up to _einittext during init
    6568e52b281c watchdog: export lockup_detector_reconfigure
    c5a8d0512018 RISC-V: Add fast call path of crash_kexec()
    64f94e6e1fab riscv: mmap with PROT_WRITE but no PROT_READ is invalid
    e751030eb844 riscv: dts: canaan: Add k210 topology information
    23069475daeb riscv: dts: sifive: Add fu740 topology information
    21d784398a04 ASoC: rsnd: care default case on rsnd_ssiu_busif_err_irq_ctrl()
    9774b96bce7d modules: Ensure natural alignment for .altinstructions and __bug_table sections
    2097c7835162 iommu/io-pgtable-arm-v7s: Add a quirk to allow pgtable PA up to 35bit
    7822d994eb95 mips: cavium-octeon: Fix missing of_node_put() in octeon2_usb_clocks_start
    c983edb06239 vfio: Clear the caps->buf to NULL after free
    a1d8021d2130 KVM: PPC: Book3S HV: Fix "rm_exit" entry in debugfs timings
    17c32546166d tty: serial: Fix refcount leak bug in ucc_uart.c
    ce0432aa8944 lib/list_debug.c: Detect uninitialized lists
    72b850a2a996 ext4: avoid resizing to a partial cluster size
    0e734f91cb1c ext4: avoid remove directory when directory is corrupted
    d9b94c3ace54 drivers:md:fix a potential use-after-free bug
    a600ed25e3d9 nvmet-tcp: fix lockdep complaint on nvmet_tcp_wq flush during queue teardown
    e59ef9b07130 md: Notify sysfs sync_completed in md_reap_sync_thread()
    2dc9615abfbc phy: samsung: phy-exynos-pcie: sanitize init/power_on callbacks
    405ea6d70684 openrisc: io: Define iounmap argument as volatile
    d1fc64bf4526 dmaengine: sprd: Cleanup in .remove() after pm_runtime_get_sync() failed
    d0e2b8e36911 selftests/kprobe: Do not test for GRP/ without event failures
    3645ed60ac07 csky/kprobe: reclaim insn_slot on kprobe unregistration
    fda4bff43bcd RDMA/rxe: Limit the number of calls to each tasklet
    54aa6c49361b dmaengine: dw-axi-dmac: ignore interrupt if no descriptor
    af76e6fdcf92 dmaengine: dw-axi-dmac: do not print NULL LLI during error
    e799817b67b3 um: add "noreboot" command line option for PANIC_TIMEOUT=-1 setups
    405f655ee7f6 PCI/ACPI: Guard ARM64-specific mcfg_quirks
    addff638c417 cxl: Fix a memory leak in an error handling path
    5e24cd70355e pinctrl: intel: Check against matching data instead of ACPI companion
    67b5870a35bb mmc: tmio: avoid glitches when resetting
    0f5916516d86 habanalabs/gaudi: mask constant value before cast
    b09e5ab18c9f habanalabs/gaudi: fix shift out of bounds
    1693fe9ba2ef coresight: etm4x: avoid build failure with unrolled loops
    94aadba8d000 gadgetfs: ep_io - wait until IRQ finishes
    9c8e2e607270 scsi: lpfc: Fix possible memory leak when failing to issue CMF WQE
    b92506dc51f8 scsi: lpfc: Prevent buffer overflow crashes in debugfs with malformed user input
    0af01d2c5edd clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
    25041029389b zram: do not lookup algorithm in backends table
    50de5045815e uacce: Handle parent device removal or parent driver module rmmod
    17d58499dc9c clk: qcom: ipq8074: dont disable gcc_sleep_clk_src
    348274a6bb7f vboxguest: Do not use devm for irq
    b9c31d4ae9be usb: dwc2: gadget: remove D+ pull-up while no vbus with usb-role-switch
    fbdbd61a36d8 usb: renesas: Fix refcount leak bug
    0fc62bbc9531 usb: host: ohci-ppc-of: Fix refcount leak bug
    4d6bab8d366a scsi: ufs: ufs-mediatek: Fix the timing of configuring device regulators
    35c3ec7d7a51 clk: ti: Stop using legacy clkctrl names for omap4 and 5
    00c274bc5bfa drm/meson: Fix overflow implicit truncation warnings
    b01d6bfdf2e4 irqchip/tegra: Fix overflow implicit truncation warnings
    49968090f921 PCI: aardvark: Fix reporting Slot capabilities on emulated bridge
    fb76cdd21662 usb: gadget: uvc: call uvc uvcg_warn on completed status instead of uvcg_info
    de6aa7abfebf usb: gadget: uvc: calculate the number of request depending on framesize
    8e142744f0e9 usb: cdns3: fix random warning message when driver load
    c3c1dbad3a2d usb: cdns3 fix use-after-free at workaround 2
    08c0a77b2aec platform/chrome: cros_ec_proto: don't show MKBP version if unsupported
    da56759a4a35 PCI: Add ACS quirk for Broadcom BCM5750x NICs
    6fc955b58acf HID: multitouch: new device class fix Lenovo X12 trackpad sticky
    57b5be2bd1e0 KVM: arm64: Reject 32bit user PSTATE on asymmetric systems
    cb332a666e3f KVM: arm64: Treat PMCR_EL1.LC as RES1 on asymmetric systems
    c682fb70a7df net: qrtr: start MHI channel after endpoit creation
    98e28de472ef drm/sun4i: dsi: Prevent underflow when computing packet sizes
    fe71d84c1a6c drm/meson: Fix refcount bugs in meson_vpu_has_available_connectors()
    6ee1310f4d14 ASoC: SOF: Intel: hda: Fix potential buffer overflow by snprintf()
    3142b5f09e55 ASoC: SOF: Intel: hda: Define rom_status_reg in sof_intel_dsp_desc
    88db4a22d954 drm/imx/dcss: get rid of HPD warning message
    1c7e569c0ece tracing/eprobes: Fix reading of string fields
    830426469f77 gcc-plugins: Undefine LATENT_ENTROPY_PLUGIN when plugin disabled for a file
    a2cafe242874 kbuild: fix the modules order between drivers and libs
    8ee44abe4cae igb: Add lock to avoid data race
    471295311960 stmmac: intel: Add a missing clk_disable_unprepare() call in intel_eth_pci_remove()
    334554aab154 fec: Fix timer capture timing in `fec_ptp_enable_pps()`
    c56e1fcb3091 i40e: Fix to stop tx_timeout recovery if GLOBR fails
    bd1fd0a02e9a regulator: pca9450: Remove restrictions for regulator-name
    09e512a659e4 i2c: imx: Make sure to unregister adapter on remove()
    b4ac11967e8c ice: Ignore EEXIST when setting promisc mode
    e84c6321f357 net: dsa: sja1105: fix buffer overflow in sja1105_setup_devlink_regions()
    caa80c1f8316 net: dsa: don't warn in dsa_port_set_state_now() when driver doesn't support it
    b0672895d8be net: genl: fix error path memory leak in policy dumping
    232fab59a65a net: dsa: felix: fix ethtool 256-511 and 512-1023 TX packet counters
    29c5956061c9 net: dsa: microchip: ksz9477: fix fdb_dump last invalid entry
    ffb155944333 net: fix potential refcount leak in ndisc_router_discovery()
    c7118a579106 net: moxa: pass pdev instead of ndev to DMA functions
    a44a1a14211d mlxsw: spectrum: Clear PTP configuration after unregistering the netdevice
    dd236b62d25e net: dsa: mv88e6060: prevent crash on an unused port
    c0434f0e0586 net/sunrpc: fix potential memory leaks in rpc_sysfs_xprt_state_change()
    dd32ea395658 spi: meson-spicc: add local pow2 clock ops to preserve rate between messages
    1d9e75c3d8cd powerpc/pci: Fix get_phb_number() locking
    e58d1a96e93b netfilter: nf_tables: check NFT_SET_CONCAT flag if field_count is specified
    7ac21b920ee6 netfilter: nf_tables: disallow NFT_SET_ELEM_CATCHALL and NFT_SET_ELEM_INTERVAL_END
    0df32f45be40 netfilter: nf_tables: NFTA_SET_ELEM_KEY_END requires concat and interval flags
    46f64e6325ee netfilter: nf_tables: validate NFTA_SET_ELEM_OBJREF based on NFT_SET_OBJECT flag
    8a6775ede639 netfilter: nf_tables: really skip inactive sets when allocating name
    b59bee8b05b0 netfilter: nf_tables: possible module reference underflow in error path
    3be4d59808bb netfilter: nf_tables: disallow NFTA_SET_ELEM_KEY_END with NFT_SET_ELEM_INTERVAL_END flag
    81dcb3b80475 fs/ntfs3: uninitialized variable in ntfs_set_acl_ex()
    8a38a73cb406 netfilter: nf_tables: use READ_ONCE and WRITE_ONCE for shared generation id access
    cacdddfefe8d ASoC: codec: tlv320aic32x4: fix mono playback via I2S
    18b5a57e7d96 ASoC: tas2770: Fix handling of mute/unmute
    8eab21065492 ASoC: tas2770: Drop conflicting set_bias_level power setting
    0a63bc250cc1 ASoC: tas2770: Allow mono streams
    480bf1e299a4 ASoC: tas2770: Set correct FSYNC polarity
    b318b9dd2ac6 ASoC: SOF: debug: Fix potential buffer overflow by snprintf()
    743dc4377bba iavf: Fix reset error handling
    dab6b551f5ba iavf: Fix adminq error handling
    8af269e5bdf4 nios2: add force_successful_syscall_return()
    c9f78def8856 nios2: restarts apply only to the first sigframe we build...
    3bee7b77d917 nios2: fix syscall restart checks
    f794d1fe6e52 nios2: traced syscall does need to check the syscall number
    80cae5d810d2 nios2: don't leave NULLs in sys_call_table[]
    35d5fd70e8c8 nios2: page fault et.al. are *not* restartable syscalls...
    c293e8abc09e fs/ntfs3: Fix missing i_op in ntfs_read_mft
    efdcf4df7a36 fs/ntfs3: Do not change mode if ntfs_set_ea failed
    78e4aebc35b3 fs/ntfs3: Fix double free on remount
    8feb84857915 fs/ntfs3: Don't clear upper bits accidentally in log_replay()
    8e8e1a84dac7 fs/ntfs3: Fix NULL deref in ntfs_update_mftmirr
    ecda80a345ca fs/ntfs3: Fix using uninitialized value n when calling indx_read
    69979b5e308f dpaa2-eth: trace the allocated address instead of page struct
    f39b424b4301 perf tests: Fix Track with sched_switch test for hybrid case
    5958ef867b9d perf parse-events: Fix segfault when event parser gets an error
    e8ab87549bbe perf probe: Fix an error handling path in 'parse_perf_probe_command()'
    51471b697303 geneve: fix TOS inheriting for ipv4
    a5d7ce086fe9 atm: idt77252: fix use-after-free bugs caused by tst_timer
    75b810104e40 xen/xenbus: fix return type in xenbus_file_read()
    d98b50d5b72d nfp: ethtool: fix the display error of `ethtool -m DEVNAME`
    5c21186c5f3a NTB: ntb_tool: uninitialized heap data in tool_fn_write()
    cffd1cefcdd7 tools build: Switch to new openssl API for test-libcrypto
    86ff5446b4da kbuild: dummy-tools: avoid tmpdir leak in dummy gcc
    f546faa216d0 ceph: don't leak snap_rwsem in handle_cap_grant
    3e7ee4dd1ea4 tools/vm/slabinfo: use alphabetic order when two values are equal
    d27e1834dee2 ceph: use correct index when encoding client supported features
    e49c17867c61 spi: dt-bindings: zynqmp-qspi: add missing 'required'
    b847ea541b1f spi: dt-bindings: cadence: add missing 'required'
    506fc3cab986 dt-bindings: clock: qcom,gcc-msm8996: add more GCC clock sources
    4e96aa5b46d4 dt-bindings: arm: qcom: fix MSM8994 boards compatibles
    5aa6548c0803 dt-bindings: arm: qcom: fix MSM8916 MTP compatibles
    e7a0e9ee5b12 dt-bindings: arm: qcom: fix Longcheer L8150 compatibles
    3632c642cacc dt-bindings: gpio: zynq: Add missing compatible strings
    52d8f48f85f7 vsock: Set socket state back to SS_UNCONNECTED in vsock_connect_timeout()
    e4c0428f8a6f vsock: Fix memory leak in vsock_connect()
    38b2ab9adf50 plip: avoid rcu debug splat
    133a08a3093b ipv6: do not use RT_TOS for IPv6 flowlabel
    5c9e5c44f89d mlx5: do not use RT_TOS for IPv6 flowlabel
    02b2b7372727 geneve: do not use RT_TOS for IPv6 flowlabel
    f150c1f84775 ACPI: property: Return type of acpi_add_nondev_subnodes() should be bool
    06337b9c255d octeontx2-af: Fix key checking for source mac
    dc5be2d4f928 octeontx2-af: Fix mcam entry resource leak
    f9a36fa5367e octeontx2-af: suppress external profile loading warning
    e0fe6aa19a80 octeontx2-af: Apply tx nibble fixup always
    17c3ea739979 octeontx2-pf: Fix NIX_AF_TL3_TL2X_LINKX_CFG register configuration
    0a02159ae636 Input: exc3000 - fix return value check of wait_for_completion_timeout
    a4a945641aca pinctrl: qcom: sm8250: Fix PDC map
    fed2247253dc pinctrl: sunxi: Add I/O bias setting for H6 R-PIO
    be82dc052155 pinctrl: amd: Don't save/restore interrupt status and wake status bits
    c1c7a7c950e6 pinctrl: qcom: msm8916: Allow CAMSS GP clocks to be muxed
    9272265f2f76 pinctrl: nomadik: Fix refcount leak in nmk_pinctrl_dt_subnode_to_map
    79eb8e9e38f3 dt-bindings: arm: qcom: fix Alcatel OneTouch Idol 3 compatibles
    8b7bf35d301d selftests: forwarding: Fix failing tests with old libnet
    c506c9a97120 net: bgmac: Fix a BUG triggered by wrong bytes_compl
    eb2d9dc79f5f net: bcmgenet: Indicate MAC is in charge of PHY PM
    47ac7b2f6a1f net: phy: Warn about incorrect mdio_bus_phy_resume() state
    c4d09fd1e18b devlink: Fix use-after-free after a failed reload
    d3723eab1119 virtio_net: fix memory leak inside XPD_TX with mergeable
    9721e238c24c SUNRPC: Reinitialise the backchannel request buffers before reuse
    d3c262f584df SUNRPC: Fix xdr_encode_bool()
    63e921d4edb3 sunrpc: fix expiry of auth creds
    3f16630fa23b m68k: coldfire/device.c: protect FLEXCAN blocks
    422a02a77159 net: atlantic: fix aq_vec index out of range error
    98dc8fb08299 can: j1939: j1939_session_destroy(): fix memory leak of skbs
    890aba507802 can: mcp251x: Fix race condition on receive interrupt
    6648647599e0 bpf: Check the validity of max_rdwr_access for sock local storage map iterator
    03ca12e583f1 bpf: Acquire map uref in .init_seq_private for sock{map,hash} iterator
    e51b568ea2c8 bpf: Acquire map uref in .init_seq_private for sock local storage map iterator
    2f56304a0cf9 bpf: Acquire map uref in .init_seq_private for hash map iterator
    370805f0e72b bpf: Acquire map uref in .init_seq_private for array map iterator
    18a994e0661c bpf: Don't reinit map value in prealloc_lru_pop
    41fd6cc88aaf BPF: Fix potential bad pointer dereference in bpf_sys_bpf()
    a4cf3dadd1fa NFSv4/pnfs: Fix a use-after-free bug in open
    1e9fd95c27d8 NFSv4.1: RECLAIM_COMPLETE must handle EACCES
    281c6a47416b NFSv4: Fix races in the legacy idmapper upcall
    b32780cda567 NFSv4.1: Handle NFS4ERR_DELAY replies to OP_SEQUENCE correctly
    0696115a3230 NFSv4.1: Don't decrease the value of seq_nr_highest_sent
    6aea903916c1 Documentation: ACPI: EINJ: Fix obsolete example
    bf7ebebce2c2 apparmor: Fix memleak in aa_simple_write_to_buffer()
    64103ea35773 apparmor: fix reference count leak in aa_pivotroot()
    c62f2f56e086 apparmor: fix overlapping attachment computation
    e89b95f91e63 apparmor: fix setting unconfined mode on a loaded profile
    3104c8a0dc5f apparmor: fix aa_label_asxprint return check
    a683a0d87a22 apparmor: Fix failed mount permission check error message
    31b35b689123 apparmor: fix absroot causing audited secids to begin with =
    017b0ea49262 apparmor: fix quiet_denied for file rules
    8bc5ed70ef58 can: ems_usb: fix clang's -Wunaligned-access warning
    43ae96645898 dt-bindings: usb: mtk-xhci: Allow wakeup interrupt-names to be optional
    2294f43a07ea ALSA: usb-audio: More comprehensive mixer map for ASUS ROG Zenith II
    2fb8f62ee335 tracing: Have filter accept "common_cpu" to be consistent
    dac2b60345ef tracing/probes: Have kprobes and uprobes use $COMM too
    b489aca082a2 tracing/eprobes: Have event probes be consistent with kprobes and uprobes
    a11ce7bfbdb7 tracing/eprobes: Do not hardcode $comm as a string
    ba53c21ce977 tracing/eprobes: Do not allow eprobes to use $stack, or % for regs
    0d7970e8702b tracing/perf: Fix double put of trace event when init fails
    14674e47ff49 x86/kprobes: Fix JNG/JNLE emulation
    860efae12788 cifs: Fix memory leak on the deferred close
    6379a9af7cfc btrfs: fix lost error handling when looking up extended ref on log replay
    7ac430e319e9 btrfs: reset RO counter on block group if we fail to relocate
    78f8c2370e3d btrfs: unset reloc control if transaction commit fails in prepare_to_relocate()
    d8fc9df94b88 mmc: meson-gx: Fix an error handling path in meson_mmc_probe()
    6c4541d6b881 mmc: pxamci: Fix an error handling path in pxamci_probe()
    8b7ed38c38e1 mmc: pxamci: Fix another error handling path in pxamci_probe()
    23179d5b7c39 ata: libata-eh: Add missing command name
    82a27c185544 drm/amd/display: Check correct bounds for stream encoder instances for DCN303
    76672cd326c1 drm/ttm: Fix dummy res NULL ptr deref bug
    016b71479f46 drm/nouveau: recognise GA103
    1b7e0482abd0 locking/atomic: Make test_and_*_bit() ordered on failure
    852f6a784a4b rds: add missing barrier to release_refill
    d26beb910904 x86/mm: Use proper mask when setting PUD mapping
    177bf3542009 KVM: Unconditionally get a ref to /dev/kvm module when creating a VM
    e9a6a3bd97c7 ALSA: hda/realtek: Add quirk for Clevo NS50PU, NS70PU
    5d396df4631a ALSA: info: Fix llseek return value when using callback
    a0a7e0b2b8b2 Linux 5.15.62
    2a9114b3ec6f btrfs: raid56: don't trust any cached sector in __raid56_parity_recover()
    0d9c713cc30f btrfs: only write the sectors in the vertical stripe which has data stripes
    3eb602ad6a94 x86/ftrace: Use alternative RET encoding
    543138c55518 x86/ibt,ftrace: Make function-graph play nice
    f6632763484c Revert "x86/ftrace: Use alternative RET encoding"
    cb69d4d6f709 ksmbd: fix heap-based overflow in set_ntacl_dacl()
    c76b216753c9 ksmbd: prevent out of bound read for SMB2_WRITE
    5430db94434f net_sched: cls_route: disallow handle of 0
    c12f0e6126ad tee: add overflow check in register_shm_helper()
    3746d62ecf1c io_uring: use original request task for inflight tracking
    374bf3fc1f53 Linux 5.15.61
    17bf429b913b scsi: lpfc: Resolve some cleanup issues following SLI path refactoring
    6e99860de6f4 scsi: lpfc: Fix element offset in __lpfc_sli_release_iocbq_s4()
    9a570069cdbb scsi: lpfc: Fix locking for lpfc_sli_iocbq_lookup()
    f27259515797 drm/bridge: Move devm_drm_of_get_bridge to bridge/panel.c
    2711bedab26c Bluetooth: L2CAP: Fix l2cap_global_chan_by_psm regression
    449928869475 Revert "net: usb: ax88179_178a needs FLAG_SEND_ZLP"
    fa3040688d75 io_uring: mem-account pbuf buckets
    50446ac34545 drm/meson: Fix refcount leak in meson_encoder_hdmi_init
    a8278cf3f00d drm/msm: Fix dirtyfb refcounting
    3cfd07084b7e tracing/perf: Avoid -Warray-bounds warning for __rel_loc macro
    1889f4135fb2 drm/vc4: change vc4_dma_range_matches from a global to static
    3131a20eee20 net: phy: smsc: Disable Energy Detect Power-Down in interrupt mode
    a25f45ff8856 drm/bridge: tc358767: Fix (e)DP bridge endpoint parsing in dedicated function
    276e1cac8085 Revert "s390/smp: enforce lowcore protection on CPU restart"
    93d28e50cf72 Revert "mwifiex: fix sleep in atomic context bugs caused by dev_coredumpv"
    621b596b29e5 crypto: lib/blake2s - reduce stack frame usage in self test
    aa480f7d74b9 tcp: fix over estimation in sk_forced_mem_schedule()
    4db561ae4a90 mac80211: fix a memory leak where sta_info is not freed
    57bbb691a93b net_sched: cls_route: remove from list when handle is 0
    f467478d15fa tracing: Use a struct alignof to determine trace event field alignment
    5bafa7df79de powerpc: Fix eh field when calling lwarx on PPC32
    c98e956ef489 xen-blkfront: Apply 'feature_persistent' parameter when connect
    ef26b5d530d4 xen-blkback: Apply 'feature_persistent' parameter when connect
    7304be4c985d xen-blkback: fix persistent grants negotiation
    9e7dab7edabd tpm: eventlog: Fix section mismatch for DEBUG_SECTION_MISMATCH
    84075af9fb4a KEYS: asymmetric: enforce SM2 signature use pkey algo
    1be97463696c ext4: fix race when reusing xattr blocks
    470f0a5ef519 ext4: unindent codeblock in ext4_xattr_block_set()
    51877de35d21 ext4: use kmemdup() to replace kmalloc + memcpy
    0b885394fd00 ext4: remove EA inode entry from mbcache on inode eviction
    19dac09bd956 ext4: make sure ext4_append() always allocates new block
    ef6e69026d88 ext4: check if directory block is within i_size
    30dfb75e1f86 ext4: fix warning in ext4_iomap_begin as race between bmap and write
    9a080f8b085a ext4: correct the misjudgment in ext4_iget_extra_inode
    7dbba7916920 ext4: correct max_inline_xattr_value_size computing
    21f6bd5cbdab ext4: fix use-after-free in ext4_xattr_set_entry
    e6321fda51e5 ext4: add EXT4_INODE_HAS_XATTR_SPACE macro in xattr.h
    133b80d5582e ext4: fix extent status tree race in writeback error recovery path
    88bcc518e4ad ext4: update s_overhead_clusters in the superblock during an on-line resize
    3c0a5a0e1c66 tracing: Avoid -Warray-bounds warning for __rel_loc macro
    994dea8549f2 tracing: Add '__rel_loc' using trace event macros
    50235d9a1f1f dm raid: fix address sanitizer warning in raid_resume
    4c233811a495 dm raid: fix address sanitizer warning in raid_status
    34bef00a325a KVM: nVMX: Attempt to load PERF_GLOBAL_CTRL on nVMX xfer iff it exists
    e365c817beef KVM: VMX: Add helper to check if the guest PMU has PERF_GLOBAL_CTRL
    1eedac05b2f3 KVM: x86/pmu: Ignore pmu->global_ctrl check if vPMU doesn't support global_ctrl
    9f1a17222a8b KVM: VMX: Mark all PERF_GLOBAL_(OVF)_CTRL bits reserved if there's no vPMU
    81f723a006e7 KVM: x86/pmu: Introduce the ctrl_mask value for fixed counter
    0ceef1c56875 powerpc/powernv/kvm: Use darn for H_RANDOM on Power9
    0eeb7037a479 ACPI: CPPC: Do not prevent CPPC from working in the future
    2cc23122653f btrfs: properly flag filesystem with BTRFS_FEATURE_INCOMPAT_BIG_METADATA
    b5c541758650 btrfs: reset block group chunk force if we have to wait
    b367f125c80f btrfs: ensure pages are unlocked on cow_file_range() failure
    0b7f5d7a4d2a block: don't allow the same type rq_qos add more than once
    b055781dd947 block: remove the struct blk_queue_ctx forward declaration
    d2cbdbe22b5f locking/csd_lock: Change csdlock_debug from early_param to __setup
    96ba981f09a9 timekeeping: contribute wall clock to rng on time change
    6b841a891d28 ARM: remove some dead code
    7a7188df3eae net/9p: Initialize the iounit field during fid creation
    f83131a3071a dm thin: fix use-after-free crash in dm_sm_register_threshold_callback
    779fd8cb621e kexec, KEYS, s390: Make use of built-in and secondary keyring for signature verification
    9769bd964d54 dm writecache: set a default MAX_WRITEBACK_JOBS
    10bc71642fad tty: 8250: Add support for Brainboxes PX cards.
    6f47a7594bcf serial: 8250: Add proper clock handling for OxSemi PCIe devices
    96f2c1685b1c serial: 8250: Fold EndRun device support into OxSemi Tornado code
    b49c3b3a911d serial: 8250_pci: Replace dev_*() by pci_*() macros
    5baacb540c5a serial: 8250_pci: Refactor the loop in pci_ite887x_init()
    55e5487ae294 PCI: qcom: Power on PHY before IPQ8074 DBI register accesses
    c5d3873d3e1c PCI/AER: Iterate over error counters instead of error strings
    0b4c0003aeda iommu/vt-d: avoid invalid memory access via node_online(NUMA_NO_NODE)
    f2145a1bf7ab KVM: x86: Signal #GP, not -EPERM, on bad WRMSR(MCi_CTL/STATUS)
    1f71d1f7f491 KVM: set_msr_mce: Permit guests to ignore single-bit ECC errors
    925cc6d6ff8a intel_th: pci: Add Raptor Lake-S CPU support
    6d3c02fd9600 intel_th: pci: Add Raptor Lake-S PCH support
    df6faa9798eb intel_th: pci: Add Meteor Lake-P support
    2b5ef6430c21 scsi: lpfc: Remove extra atomic_inc on cmd_pending in queuecommand after VMID
    b4543dbea84c scsi: lpfc: SLI path split: Refactor SCSI paths
    c56cc7fefc31 scsi: lpfc: SLI path split: Refactor fast and slow paths to native SLI4
    1c5e670d6a5a scsi: lpfc: SLI path split: Refactor lpfc_iocbq
    eb36ec3039ce scsi: lpfc: Fix EEH support for NVMe I/O
    0c29e149b6bb firmware: arm_scpi: Ensure scpi_info is not assigned if the probe fails
    b574d1e3e9a2 usbnet: smsc95xx: Fix deadlock on runtime resume
    eaf3a094d892 usbnet: smsc95xx: Forward PHY interrupts to PHY driver to avoid polling
    09201006dac9 usbnet: smsc95xx: Avoid link settings race on interrupt reception
    048872438876 usbnet: smsc95xx: Don't clear read-only PHY interrupt
    c232db672713 drm/vc4: drv: Adopt the dma configuration from the HVS or V3D component
    4a54c13786c5 drm/dp/mst: Read the extended DPCD capabilities during system resume
    3dd33a09f5dc crypto: blake2s - remove shash module
    f96a9815b466 drm/mediatek: Keep dsi as LP00 before dcs cmds transfer
    8aa68065a877 drm/mediatek: Allow commands to be sent during video mode
    1e0ca3d809c3 spmi: trace: fix stack-out-of-bound access in SPMI tracing functions
    8cbc36e7e37a __follow_mount_rcu(): verify that mount_lock remains unchanged
    60c981f4b787 Input: gscps2 - check return value of ioremap() in gscps2_probe()
    9e255ed238fc posix-cpu-timers: Cleanup CPU timers before freeing them during exec
    c9c965fa1974 SMB3: fix lease break timeout when multiple deferred close handles for the same file.
    c273671ae826 x86/olpc: fix 'logical not is only applied to the left hand side'
    1cbf3882cb37 x86/kprobes: Update kcb status flag after singlestepping
    7c91c8da431d ftrace/x86: Add back ftrace_expected assignment
    0b00cb428f74 x86/bugs: Enable STIBP for IBPB mitigated RETBleed
    15f67058a1ee scsi: qla2xxx: Fix losing FCP-2 targets during port perturbation tests
    6f1d5e6979c1 scsi: qla2xxx: Fix losing target when it reappears during delete
    420e449e21b9 scsi: qla2xxx: Fix losing FCP-2 targets on long port disable with I/Os
    3f1102898b7b scsi: qla2xxx: Wind down adapter after PCIe error
    3b38c7f0c6ac scsi: qla2xxx: Fix erroneous mailbox timeout after PCI error injection
    1209da5278eb scsi: qla2xxx: Fix excessive I/O error messages by default
    b7bae3886a30 scsi: qla2xxx: Fix crash due to stale SRB access around I/O timeouts
    a76a155851fc scsi: qla2xxx: Turn off multi-queue for 8G adapters
    505fb1cc4328 scsi: qla2xxx: Fix discovery issues in FC-AL topology
    27a7805a19a7 scsi: qla2xxx: Fix imbalance vha->vref_count
    781a7dabeac2 scsi: zfcp: Fix missing auto port scan and thus missing target ports
    f5183d66c4f4 scsi: ufs: core: Correct ufshcd_shutdown() flow
    ce50d94afcb8 video: fbdev: s3fb: Check the size of screen before memset_io()
    0701df594bc1 video: fbdev: arkfb: Check the size of screen before memset_io()
    4a3cef1eaced video: fbdev: vt8623fb: Check the size of screen before memset_io()
    fff6bb19d56c f2fs: do not allow to decompress files have FI_COMPRESS_RELEASED
    05244b62ae94 f2fs: allow compression for mmap files in compress_mode=user
    608d4c5f9f4d x86/entry: Build thunk_$(BITS) only if CONFIG_PREEMPTION=y
    748d2e9585ae sched/core: Do not requeue task on CPU excluded from cpus_mask
    dd960a0ddd43 sched: Remove the limitation of WF_ON_CPU on wakelist if wakee cpu is idle
    f9ab9bcf53b6 sched: Fix the check of nr_running at queue wakelist
    1584dc3da7b4 tools/thermal: Fix possible path truncations
    236c1502520b video: fbdev: arkfb: Fix a divide-by-zero bug in ark_set_pixclock()
    3bb94ff1e794 x86/numa: Use cpumask_available instead of hardcoded NULL check
    147f66d22f58 sched, cpuset: Fix dl_cpu_busy() panic due to empty cs->cpus_allowed
    e51b98166334 sched/deadline: Merge dl_task_can_attach() and dl_cpu_busy()
    8fb62a576178 scripts/faddr2line: Fix vmlinux detection on arm64
    7f060ad6cb86 genelf: Use HAVE_LIBCRYPTO_SUPPORT, not the never defined HAVE_LIBCRYPTO
    e1c355ec7df1 powerpc/pci: Fix PHB numbering when using opal-phbid
    31dad89b16ed x86/bus_lock: Don't assume the init value of DEBUGCTLMSR.BUS_LOCK_DETECT to be zero
    a1edb85e60fd kprobes: Forbid probing on trampoline and BPF code areas
    533a06858b01 perf symbol: Fail to read phdr workaround
    5eaa93caa63a powerpc/cell/axon_msi: Fix refcount leak in setup_msi_msg_address
    ea494e8a9852 powerpc/xive: Fix refcount leak in xive_get_max_prio
    69e9fa07b229 powerpc/spufs: Fix refcount leak in spufs_init_isolated_loader
    74715fe0726c f2fs: fix to remove F2FS_COMPR_FL and tag F2FS_NOCOMP_FL at the same time
    9536d5451cf4 s390/smp: enforce lowcore protection on CPU restart
    70caac180f14 s390/maccess: rework absolute lowcore accessors
    ac0a3e2131bd s390/smp: cleanup control register update routines
    a002b8641254 s390/smp: cleanup target CPU callback starting
    9287df436294 s390/dump: fix os_info virtual vs physical address confusion
    cf0e42eb04c7 tty: serial: fsl_lpuart: correct the count of break characters
    ef0f4eeaba24 powerpc/pci: Prefer PCI domain assignment via DT 'linux,pci-domain' and alias
    df466a61f699 powerpc/iommu: Fix iommu_table_in_use for a small default DMA window case
    5414409ada0c powerpc/32: Do not allow selection of e5500 or e6500 CPUs on PPC32
    14965b8e2952 powerpc/32: Call mmu_mark_initmem_nx() regardless of data block mapping.
    96ead6679803 ASoC: mchp-spdifrx: disable end of block interrupt on failures
    8301c204db28 video: fbdev: sis: fix typos in SiS_GetModeID()
    29f06f1905c3 video: fbdev: amba-clcd: Fix refcount leak bugs
    f28764d10e9f watchdog: armada_37xx_wdt: check the return value of devm_ioremap() in armada_37xx_wdt_probe()
    84ddf527f907 watchdog: sp5100_tco: Fix a memory leak of EFCH MMIO resource
    27d0c621225d ASoC: audio-graph-card: Add of_node_put() in fail path
    642ebdd9579d fuse: Remove the control interface for virtio-fs
    509a5cb39019 ASoC: qcom: q6dsp: Fix an off-by-one in q6adm_alloc_copp()
    2e1b17ec0423 ASoC: imx-card: use snd_pcm_format_t type for asrc_format
    8ea7f75b87fa ASoC: fsl_easrc: use snd_pcm_format_t type for sample_format
    78263868dbe5 ASoC: fsl-asoc-card: force cast the asrc_format type
    10961cbaea2a ASoC: fsl_asrc: force cast the asrc_format type
    b08c3473ee1e s390/zcore: fix race when reading from hardware system area
    f1415771f6a1 s390/crash: fix incorrect number of bytes to copy to user space
    2165fd2bae8a s390/maccess: fix semantics of memcpy_real() and its callers
    ceea1bc15310 s390/dump: fix old lowcore virtual vs physical address confusion
    3ea02fc5d488 perf tools: Fix dso_id inode generation comparison
    c7d4e6cdd14f iommu/arm-smmu: qcom_iommu: Add of_node_put() when breaking out of loop
    facd31bbc799 mfd: max77620: Fix refcount leak in max77620_initialise_fps
    a8aa2a76eec7 mfd: t7l66xb: Drop platform disable callback
    0386a985a802 remoteproc: sysmon: Wait for SSCTL service to come up
    48042b342eae remoteproc: qcom: pas: Check if coredump is enabled
    3336e7c0767f proc: fix a dentry lock race between release_task and lookup
    f28e4d214839 lib/smp_processor_id: fix imbalanced instrumentation_end() call
    74824db8b2fa kfifo: fix kfifo_to_user() return type
    ece6cfe62a10 rpmsg: qcom_smd: Fix refcount leak in qcom_smd_parse_edge
    f543a9d19c29 MIPS: Fixed __debug_virt_addr_valid()
    8324649b0035 net: 9p: fix refcount leak in p9_read_work() error handling
    273c16d93f86 9p: Add client parameter to p9_req_put()
    3ac76cdab956 9p: Drop kref usage
    eb3eed52a77c 9p: fix a bunch of checkpatch warnings
    79f1a945bcaf iommu/exynos: Handle failed IOMMU device registration properly
    9a06340c9d95 serial: 8250_bcm7271: Save/restore RTS in suspend/resume
    3d69d86b3e9d ASoC: mt6359: Fix refcount leak bug
    1008e81163e8 swiotlb: fail map correctly with failed io_tlb_default_mem
    80f697b57f57 MIPS: vdso: Utilize __pa() for gic_pfn
    447e0f4be850 tty: n_gsm: fix missing corner cases in gsmld_poll()
    c94ea1a49eb8 tty: n_gsm: fix DM command
    fdcd4b065224 tty: n_gsm: fix wrong T1 retry count handling
    583cba5004f0 serial: 8250_fsl: Don't report FE, PE and OE twice
    79ed8856445b vfio/ccw: Do not change FSM state in subchannel event
    2ebb5a55d526 remoteproc: qcom: wcnss: Fix handling of IRQs
    fd3adcb84f7f ASoC: imx-card: Fix DSD/PDM mclk frequency
    7c69f70dc515 ASoC: qcom: Fix missing of_node_put() in asoc_qcom_lpass_cpu_platform_probe()
    e46bc8cacdb6 tty: n_gsm: fix resource allocation order in gsm_activate_mux()
    c9754e10f1a5 tty: n_gsm: fix race condition in gsmld_write()
    a7fa41552407 tty: n_gsm: fix packet re-transmission without open control channel
    ace28afbc63f tty: n_gsm: fix non flow control frames during mux flow off
    dd37f6573878 tty: n_gsm: fix missing timer to handle stalled links
    1018139cbb48 tty: n_gsm: fix wrong queuing behavior in gsm_dlci_data_output()
    dfa9b6d34aac tty: n_gsm: fix tty registration before control channel open
    3c8d5fdca881 tty: n_gsm: fix user open not possible at responder until initiator open
    794604fbd716 tty: n_gsm: Delete gsmtty open SABM frame when config requester
    76385916d093 ASoC: samsung: change gpiod_speaker_power and rx1950_audio from global to static variables
    87b1a9175f08 powerpc/perf: Optimize clearing the pending PMI and remove WARN_ON for PMI check in power_pmu_disable
    b01b18cd3d92 ASoC: samsung: h1940_uda1380: include proepr GPIO consumer header
    0dc1663e3fc2 remoteproc: imx_rproc: Fix refcount leak in imx_rproc_addr_init
    f0c151602f9b profiling: fix shift too large makes kernel panic
    49929f3ee8d3 selftests/livepatch: better synchronize test_klp_callbacks_busy
    cf112a52d758 remoteproc: k3-r5: Fix refcount leak in k3_r5_cluster_of_init
    2a7d605d74a2 rpmsg: mtk_rpmsg: Fix circular locking dependency
    f061773b7b55 rpmsg: char: Add mutex protection for rpmsg_eptdev_open()
    c81935d0e056 ASoC: codecs: wcd9335: move gains from SX_TLV to S8_TLV
    a24bb7fe7bab ASoC: codecs: msm8916-wcd-digital: move gains from SX_TLV to S8_TLV
    372b49ba0775 serial: 8250_dw: Store LSR into lsr_saved_flags in dw8250_tx_wait_empty()
    ad7fd9f652bc serial: 8250: dma: Allow driver operations before starting DMA transfers
    f945b12e65c5 serial: 8250: Export ICR access helpers for internal use
    994f2edeeb21 ASoC: mediatek: mt8173-rt5650: Fix refcount leak in mt8173_rt5650_dev_probe
    542861e5e2fa ASoC: codecs: da7210: add check for i2c_add_driver
    7dee72b1bcec ASoC: mt6797-mt6351: Fix refcount leak in mt6797_mt6351_dev_probe
    540c7b7385fb ASoC: mediatek: mt8173: Fix refcount leak in mt8173_rt5650_rt5676_dev_probe
    349242e6445a ASoC: imx-audmux: Silence a clang warning
    d69244d0ff1e ASoC: samsung: Fix error handling in aries_audio_probe
    1065c3853258 ASoC: cros_ec_codec: Fix refcount leak in cros_ec_codec_platform_probe
    13741bb88a93 opp: Fix error check in dev_pm_opp_attach_genpd()
    0edd9f8d13a8 usb: cdns3: Don't use priv_dev uninitialized in cdns3_gadget_ep_enable()
    e62f79827784 jbd2: fix assertion 'jh->b_frozen_data == NULL' failure when journal aborted
    5f9c70833ba6 ext4: recover csum seed of tmp_inode after migrating to extents
    b0e1268a8efd jbd2: fix outstanding credits assert in jbd2_journal_commit_transaction()
    70f70d54f06b block: ensure iov_iter advances for added pages
    a24f05f7ced7 block/bio: remove duplicate append pages code
    54e5b14c9b7f nvme: catch -ENODEV from nvme_revalidate_zones again
    a3f6aeba670e nvme: don't return an error from nvme_configure_metadata
    92a6233585dc nvme: disable namespace access for unsupported metadata
    52cd55a4fb2d nvme: define compat_ioctl again to unbreak 32-bit userspace.
    34552bf35f91 nvme: use command_id instead of req->tag in trace_nvme_complete_rq()
    87e7ba8b0b5b null_blk: fix ida error handling in null_add_dev()
    06f39bc5a7e9 block/rnbd-srv: Set keep_id to true after mutex_trylock
    2ceeb04252e6 RDMA/rxe: Fix error unwind in rxe_create_qp()
    bfb54ad9581d RDMA/rxe: Remove the is_user members of struct rxe_sq/rxe_rq/rxe_srq
    66c735c9a747 RDMA/rxe: Add memory barriers to kernel queues
    931990c820bb RDMA/mlx5: Add missing check for return value in get namespace flow
    0911cadd4f59 of/fdt: declared return type does not match actual return type
    128eeac87618 selftests: kvm: set rax before vmcall
    9fc8d3bee714 mm/mmap.c: fix missing call to vm_unacct_memory in mmap_region
    622ef885a89a android: binder: stop saving a pointer to the VMA
    e60d7e2462bf RDMA/srpt: Fix a use-after-free
    e7e853cdde17 RDMA/srpt: Introduce a reference count in struct srpt_device
    ca120c04bfa8 RDMA/srpt: Duplicate port name members
    28621b38ac57 platform/olpc: Fix uninitialized data in debugfs write
    e389e927e8f1 KVM: nVMX: Set UMIP bit CR4_FIXED1 MSR when emulating UMIP
    ee890b463398 mtd: spi-nor: fix spi_nor_spimem_setup_op() call in spi_nor_erase_{sector,chip}()
    bfa020146858 usb: cdns3: change place of 'priv_ep' assignment in cdns3_gadget_ep_dequeue(), cdns3_gadget_ep_enable()
    477c95578c3a USB: serial: fix tty-port initialized comments
    2988443802fc HID: amd_sfh: Handle condition of "no sensors"
    0d265155501e PCI: tegra194: Fix link up retry sequence
    472db7de9ff5 PCI: tegra194: Fix Root Port interrupt handling
    e4adb10bc5c6 RDMA/rxe: For invalidate compare according to set keys in mr
    3695aa94d789 HID: alps: Declare U1_UNICORN_LEGACY support
    71fdd63bfdbc mmc: cavium-thunderx: Add of_node_put() when breaking out of loop
    209b5d06e989 mmc: cavium-octeon: Add of_node_put() when breaking out of loop
    022c8d3f45fc RDMA/rxe: Fix mw bind to allow any consumer key portion
    45382d69074a scripts/gdb: fix 'lx-dmesg' on 32 bits arch
    9227a870b8e2 scripts/gdb: lx-dmesg: read records individually
    3adcd80b5e10 dmaengine: imx-dma: Cast of_device_get_match_data() with (uintptr_t)
    118e05368e27 HID: amd_sfh: Add NULL check for hid device
    91443c669d28 HID: mcp2221: prevent a buffer overflow in mcp_smbus_write()
    eafb19c8fe04 gpio: gpiolib-of: Fix refcount bugs in of_mm_gpiochip_add_data()
    e25b828553ae RDMA/hfi1: fix potential memory leak in setup_base_ctxt()
    5870343eabea clk: qcom: gcc-msm8939: Fix weird field spacing in ftbl_gcc_camss_cci_clk
    c41664346aa6 iio: cros: Register FIFO callback after sensor is registered
    f6e26e1a5f60 RDMA/siw: Fix duplicated reported IW_CM_EVENT_CONNECT_REPLY event
    9fc44cfd1866 RDMA/hns: Fix incorrect clearing of interrupt status register
    7e647a8d5fc0 RDMA/qedr: Fix potential memory leak in __qedr_alloc_mr()
    f851d8097fd9 RDMA/rtrs-clt: Replace list_next_or_null_rr_rcu with an inline function
    527df029be34 RDMA/rtrs-clt: Rename rtrs_clt_sess to rtrs_clt_path
    bab17b761c89 RDMA/rtrs-srv: Rename rtrs_srv_sess to rtrs_srv_path
    f706fcd56858 RDMA/rtrs: Rename rtrs_sess to rtrs_path
    e44928f2db0f RDMA/rtrs: Do not allow sessname to contain special symbols / and .
    8b6dba78922d RDMA/rtrs: Introduce destroy_cq helper
    001f93b39ef7 RDMA/rtrs: Replace duplicate check with is_pollqueue helper
    9c663e73f556 RDMA/rtrs: Fix warning when use poll mode on client side.
    08ff62fff0b1 RDMA/rtrs-srv: Fix modinfo output for stringify
    b801e80e1162 RDMA/irdma: Fix setting of QP context err_rq_idx_valid field
    9f9ef6cb72a3 RDMA/irdma: Fix VLAN connection with wildcard address
    92520864ef9f RDMA/irdma: Fix a window for use-after-free
    62d610cfc16f um: random: Don't initialise hwrng struct with zero
    3bf1085657f8 interconnect: imx: fix max_node_id
    52537ea892a5 phy: stm32: fix error return in stm32_usbphyc_phy_init
    3f2989ed9570 eeprom: idt_89hpesx: uninitialized data in idt_dbgfs_csr_write()
    edd22e6ad249 usb: dwc3: qcom: fix missing optional irq warnings
    116540c1052e usb: dwc3: core: Do not perform GCTL_CORE_SOFTRESET during bootup
    92728470a952 usb: dwc3: core: Deprecate GCTL.CORESOFTRESET
    4070f3c83cd2 usb: aspeed-vhub: Fix refcount leak bug in ast_vhub_init_desc()
    120538461985 usb: gadget: udc: amd5536 depends on HAS_DMA
    7689427e238d xtensa: iss: fix handling error cases in iss_net_configure()
    758145c84fe1 xtensa: iss/network: provide release() callback
    c5641494cd7e scsi: smartpqi: Fix DMA direction for RAID requests
    80f876b26dab PCI: qcom: Set up rev 2.1.0 PARF_PHY before enabling clocks
    c968af565ca6 PCI/portdrv: Don't disable AER reporting in get_port_device_capability()
    81ea65c9aefe KVM: s390: pv: leak the topmost page table when destroy fails
    d795bbde3ff0 mmc: block: Add single read for 4k sector cards
    f8585cad6dea of: device: Fix missing of_node_put() in of_dma_set_restricted_buffer
    5325975c19e3 mmc: sdhci-of-at91: fix set_uhs_signaling rewriting of MC1R
    961d7d12080f memstick/ms_block: Fix a memory leak
    2b12af05848f memstick/ms_block: Fix some incorrect memory allocation
    125534d2591f mmc: renesas_sdhi: Get the reset handle early in the probe
    268afd446ace mmc: mxcmmc: Silence a clang warning
    352377cf7471 mmc: sdhci-of-esdhc: Fix refcount leak in esdhc_signal_voltage_switch
    e3a1eaea6631 staging: rtl8192u: Fix sleep in atomic context bug in dm_fsync_timer_callback
    2c254fe3c5fc binder: fix redefinition of seq_file attributes
    566887bad7ff intel_th: msu: Fix vmalloced buffers
    08ec393b1d30 intel_th: msu-sink: Potential dereference of null pointer
    9b5469573a27 intel_th: Fix a resource leak in an error handling path
    0b154b745d11 scsi: qla2xxx: Check correct variable in qla24xx_async_gffid()
    1a8cc2ed9547 PCI: endpoint: Don't stop controller when unbinding endpoint function
    5ab2782c944e dmaengine: sf-pdma: Add multithread support for a DMA channel
    ebea637e9f4b KVM: arm64: Don't return from void function
    250b46505175 soundwire: revisit driver bind/unbind and callbacks
    3abe387e759a soundwire: bus_type: fix remove and shutdown support
    06a949457a8d PCI: dwc: Always enable CDM check if "snps,enable-cdm-check" exists
    b03a8f1264ea PCI: dwc: Deallocate EPC memory on dw_pcie_ep_init() errors
    981f451f3708 PCI: dwc: Set INCREASE_REGION_SIZE flag based on limit address
    0f5e892c41b9 PCI: dwc: Disable outbound windows only for controllers using iATU
    68c2cda90522 PCI: dwc: Add unroll iATU space support to dw_pcie_disable_atu()
    dbbfb410a3dd PCI: dwc: Stop link on host_init errors and de-initialization
    44652154484e mm/mempolicy: fix get_nodes out of bound access
    0b9f2f2a0488 clk: qcom: clk-rcg2: Make sure to not write d=0 to the NMD register
    522e13ebbf48 clk: qcom: clk-rcg2: Fail Duty-Cycle configuration if MND divider is not enabled.
    433a22104012 clk: qcom: camcc-sm8250: Fix topology around titan_top power domain
    123c76fbc2dd clk: qcom: camcc-sdm845: Fix topology around titan_top power domain
    93ff4172b9b2 clk: qcom: ipq8074: set BRANCH_HALT_DELAY flag for UBI clocks
    fd60d861624d clk: qcom: ipq8074: fix NSS port frequency tables
    7616ebecd358 clk: qcom: ipq8074: SW workaround for UBI32 PLL lock
    6f74519efa6a clk: qcom: ipq8074: fix NSS core PLL-s
    3b4934a635d9 RDMA/rxe: Fix deadlock in rxe_do_local_ops()
    dac3ecbd1ab8 usb: host: xhci: use snprintf() in xhci_decode_trb()
    26b305f01d62 clk: qcom: gcc-msm8939: Point MM peripherals to system_mm_noc clock
    d605b4125e77 clk: qcom: gcc-msm8939: Add missing system_mm_noc_bfdcd_clk_src
    558b097f8cdb clk: qcom: gcc-msm8939: Fix bimc_ddr_clk_src rcgr base address
    0c787dfc2238 clk: qcom: gcc-msm8939: Add missing SYSTEM_MM_NOC_BFDCD_CLK_SRC
    9ed2640eb883 clk: qcom: clk-krait: unlock spin after mux completion
    733ab0c19bf1 driver core: fix potential deadlock in __driver_attach
    80169b136c89 misc: rtsx: Fix an error handling path in rtsx_pci_probe()
    30f44ddfdb49 clk: qcom: camcc-sm8250: Fix halt on boot by reducing driver's init level
    2e79153d2ce9 mtd: dataflash: Add SPI ID table
    7837281f83bc dmaengine: dw-edma: Fix eDMA Rd/Wr-channels and DMA-direction semantics
    3e541526aab6 scsi: iscsi: Fix session removal on shutdown
    ca8936581506 scsi: iscsi: Add helper to remove a session from the kernel
    49f7414a1982 scsi: iscsi: Allow iscsi_if_stop_conn() to be called from kernel
    a78b882c1a9f mwifiex: fix sleep in atomic context bugs caused by dev_coredumpv
    358fbfc1322b mwifiex: Ignore BTCOEX events from the 88W8897 firmware
    26cdeedbb616 KVM: Don't set Accessed/Dirty bits for ZERO_PAGE
    d56c5eac8476 mm/memremap: fix memunmap_pages() race with get_dev_pagemap()
    d18a9085654b memremap: remove support for external pgmap refcounts
    d1e0ceeec04a lib/test_hmm: avoid accessing uninitialized pages
    81b64a9da38f clk: mediatek: reset: Fix written reset bit offset
    31c1072e6b55 iio: accel: bma400: Reordering of header files
    363c82a63478 platform/chrome: cros_ec: Always expose last resume result
    95faac56051b iio: accel: bma400: Fix the scale min and max macro values
    17d7a36dcd46 scsi: qla2xxx: edif: Fix no logout on delete for N2N
    3db6a63bae5f scsi: qla2xxx: edif: Fix session thrash
    4c35b8eb3dc2 scsi: qla2xxx: edif: Tear down session if keys have been removed
    58277fa8333f scsi: qla2xxx: edif: Fix no login after app start
    1138e2da4244 scsi: qla2xxx: edif: Reduce disruption due to multiple app start
    cc5745f2ee40 scsi: qla2xxx: edif: Send LOGO for unexpected IKE message
    154bf040ba53 netfilter: xtables: Bring SPDX identifier back
    8cffaf09336b usb: xhci: tegra: Fix error check
    4240b6e0f3b3 usb: gadget: tegra-xudc: Fix error check in tegra_xudc_powerdomain_init()
    59026d5cc615 usb: ohci-nxp: Fix refcount leak in ohci_hcd_nxp_probe
    c0a4b454486b usb: host: Fix refcount leak in ehci_hcd_ppc_of_probe
    1e5ec5e90e77 fpga: altera-pr-ip: fix unsigned comparison with less than zero
    0675fe20da7f PCI: mediatek-gen3: Fix refcount leak in mtk_pcie_init_irq_domains()
    c99dca4ebc78 mtd: st_spi_fsm: Add a clk_disable_unprepare() in .probe()'s error path
    762475464982 mtd: parsers: ofpart: Fix refcount leak in bcm4908_partitions_fw_offset
    8ea607579d30 mtd: partitions: Fix refcount leak in parse_redboot_of
    1ef96afd4f5a mtd: sm_ftl: Fix deadlock caused by cancel_work_sync in sm_release
    8489a20ac481 HID: cp2112: prevent a buffer overflow in cp2112_xfer()
    879bcbbec3e0 PCI: tegra194: Fix PM error handling in tegra_pcie_config_ep()
    c0ad5c7e68d1 PCI: microchip: Fix refcount leak in mc_pcie_init_irq_domains()
    ff1e7aea3ef7 phy: samsung: exynosautov9-ufs: correct TSRV register configurations
    7840dce7966a KVM: SVM: Stuff next_rip on emulated INT3 injection if NRIPS is supported
    2adc7032ec84 KVM: SVM: Unwind "speculative" RIP advancement if INTn injection "fails"
    473ba2ee7641 scsi: qla2xxx: edif: Fix n2n login retry for secure device
    fd2c194089eb scsi: qla2xxx: edif: Fix n2n discovery issue with secure target
    ba051e1fe739 scsi: qla2xxx: edif: Add retry for ELS passthrough
    703e1ccf6ff9 scsi: qla2xxx: edif: Synchronize NPIV deletion with authentication application
    d7d254cc1348 scsi: qla2xxx: edif: Fix inconsistent check of db_flags
    aa7269ee63ec scsi: qla2xxx: edif: Reduce connection thrash
    7b2fbfa4b2cd scsi: qla2xxx: edif: Fix potential stuck session in sa update
    bf890f1408b2 scsi: qla2xxx: edif: Reduce Initiator-Initiator thrashing
    beb5bba5dd13 of: check previous kernel's ima-kexec-buffer against memory bounds
    098b7e83b318 mtd: rawnand: meson: Fix a potential double free issue
    d5730780e9ea mtd: maps: Fix refcount leak in ap_flash_init
    4d67c8f74d80 mtd: maps: Fix refcount leak in of_flash_probe_versatile
    f74bd76a7524 clk: renesas: r9a06g032: Fix UART clkgrp bitsel
    36c27d813e75 HID: amd_sfh: Don't show client init failed as error when discovery fails
    c36369f7db87 wireguard: allowedips: don't corrupt stack when detecting overflow
    73ccc2b153a2 wireguard: ratelimiter: use hrtimer in selftest
    1618e0f1ed59 net: usb: make USB_RTL8153_ECM non user configurable
    8890bdb93ff5 dccp: put dccp_qpolicy_full() and dccp_qpolicy_push() in the same lock
    d4249d465da3 net: ionic: fix error check for vlan flags in ionic_set_nic_features()
    857f390dfdac net: rose: fix netdev reference changes
    bde545304f3d netdevsim: Avoid allocation warnings triggered from user space
    c9d901e17142 iavf: Fix 'tc qdisc show' listing too many queues
    d70ecd933042 iavf: Fix max_rate limiting
    f1974d3042d6 wifi: rtw88: check the return value of alloc_workqueue()
    f671cf48f383 netdevsim: fib: Fix reference count leak on route deletion failure
    51dd6d3beb7f net: allow unbound socket for packets in VRF when tcp_l3mdev_accept set
    8fd69d3df9f4 ipv6: add READ_ONCE(sk->sk_bound_dev_if) in INET6_MATCH()
    68bf74ec95c3 inet: add READ_ONCE(sk->sk_bound_dev_if) in INET_MATCH()
    c8b1baca99cf crypto: hisilicon/sec - fix auth key size error
    996be53de07b crypto: inside-secure - Add missing MODULE_DEVICE_TABLE for of
    0d11ab3db14b crypto: hisilicon/hpre - don't use GFP_KERNEL to alloc mem during softirq
    e5697a0a4529 net/mlx5: Adjust log_max_qp to be 18 at most
    2d800deb8766 net/mlx5e: Fix the value of MLX5E_MAX_RQ_NUM_MTTS
    2109cba576c5 net/mlx5e: Remove WARN_ON when trying to offload an unsupported TLS cipher/version
    22ae7f434f1f media: cedrus: hevc: Add check for invalid timestamp
    d7365590d15b wifi: libertas: Fix possible refcount leak in if_usb_probe()
    4a40af2b0b95 wifi: iwlwifi: mvm: fix double list_add at iwl_mvm_mac_wake_tx_queue
    689e5caf63e9 wifi: wil6210: debugfs: fix uninitialized variable use in `wil_write_file_wmi()`
    b50f5aa9f527 i2c: mux-gpmux: Add of_node_put() when breaking out of loop
    4fc616e25b66 i2c: cadence: Support PEC for SMBus block read
    aa6da8c32acb Bluetooth: hci_intel: Add check for platform_driver_register
    d1bedcd7947b can: pch_can: pch_can_error(): initialize errc before using it
    5793da4db3a9 can: error: specify the values of data[5..7] of CAN error frames
    3d70b6605a94 can: usb_8dev: do not report txerr and rxerr during bus-off
    bbe42d5dc486 can: kvaser_usb_leaf: do not report txerr and rxerr during bus-off
    0b328f9c7912 can: kvaser_usb_hydra: do not report txerr and rxerr during bus-off
    4b71a3c2a29c can: sun4i_can: do not report txerr and rxerr during bus-off
    dcfcd5fc999b can: hi311x: do not report txerr and rxerr during bus-off
    715ced011394 can: sja1000: do not report txerr and rxerr during bus-off
    b8c29e29059e can: rcar_can: do not report txerr and rxerr during bus-off
    ba0110c2dd03 can: pch_can: do not report txerr and rxerr during bus-off
    cbfcc7c4cc61 libbpf: fix an snprintf() overflow check
    ad3e3212492c selftests/bpf: fix a test for snprintf() overflow
    4388ea680346 wifi: p54: add missing parentheses in p54_flush()
    71fc0615c91e wifi: p54: Fix an error handling path in p54spi_probe()
    074e865b37da wifi: wil6210: debugfs: fix info leak in wil_write_file_wmi()
    05f3b437c962 media: staging: media: hantro: Fix typos
    6b593bcc6e6d media: hevc: Embedded indexes in RPS
    223b977c1cd4 media: hantro: Simplify postprocessor
    9d36596b5f71 media: hantro: postproc: Fix motion vector space size
    b1385d437e90 media: cedrus: h265: Fix flag name
    f29659bad1d5 fs: check FMODE_LSEEK to control internal pipe splicing
    c9a8a448e5e4 bpf: Fix subprog names in stack traces.
    8ff5be75ae31 selftests: timers: clocksource-switch: fix passing errors from child
    4d3481398287 selftests: timers: valid-adjtimex: build fix for newer toolchains
    070527cc3124 libbpf: Fix the name of a reused map
    273c11d9a900 tcp: make retransmitted SKB fit into the send window
    68f9f522ddf1 drm/exynos/exynos7_drm_decon: free resources when clk_set_parent() failed.
    293c53b7dbf9 skmsg: Fix invalid last sg check in sk_msg_recvmsg()
    c4ff3cef5d96 mediatek: mt76: eeprom: fix missing of_node_put() in mt76_find_power_limits_node()
    f646d94d7aec mediatek: mt76: mac80211: Fix missing of_node_put() in mt76_led_init()
    2837f4e90b13 mt76: mt7921: enlarge maximum VHT MPDU length to 11454
    6e83b10d8c7a mt76: mt7921: fix aggregation subframes setting to HE max
    0fb9387b8584 ieee80211: add EHT 1K aggregation definitions
    67cd6261d38a mt76: mt7615: do not update pm stats in case of error
    f1609c4f4a21 mt76: mt76x02u: fix possible memory leak in __mt76x02u_mcu_send_msg
    1a63d33006dc drm/msm/dpu: Fix for non-visible planes
    340bfec294d5 drm/msm: Avoid dirtyfb stalls on video mode displays (v2)
    7404d09455a0 media: platform: mtk-mdp: Fix mdp_ipi_comm structure alignment
    d6aee36c2f6f crypto: hisilicon - Kunpeng916 crypto driver don't sleep when in softirq
    aa495dfe7122 crypto: hisilicon/sec - don't sleep when in softirq
    f4e3a8c7e890 drm/msm/mdp5: Fix global state lock backoff
    693f31dc9156 net: hinic: avoid kernel hung in hinic_get_stats64()
    e850a4fc89b0 net: hinic: fix bug that ethtool get wrong stats
    8757ef67ce6b hinic: Use the bitmap API when applicable
    3052197b1175 drm: bridge: sii8620: fix possible off-by-one
    371331ede81d drm/mediatek: dpi: Only enable dpi after the bridge is enabled
    4f541100fb28 drm/mediatek: dpi: Remove output format of YUV
    23b1133bd33b drm/rockchip: Fix an error handling path rockchip_dp_probe()
    703d706b23ac drm/rockchip: vop: Don't crash for invalid duplicate_state()
    668fd740f8a6 selftests/xsk: Destroy BPF resources only when ctx refcount drops to 0
    1fc6ba6d0dae crypto: arm64/gcm - Select AEAD for GHASH_ARM64_CE
    8dc3b5d150b2 drm/vc4: hdmi: Correct HDMI timing registers for interlaced modes
    bbb4c0deae82 drm/vc4: hdmi: Fix timings for interlaced modes
    6ffe6a64ef24 drm/vc4: hdmi: Reset HDMI MISC_CONTROL register
    43d393e7cbb9 drm/vc4: hdmi: Avoid full hdmi audio fifo writes
    f30480775a6b drm/vc4: hdmi: Fix HPD GPIO detection
    07d7d4330403 drm/vc4: dsi: Add correct stop condition to vc4_dsi_encoder_disable iteration
    21febebc4fcc drm/vc4: dsi: Fix dsi0 interrupt support
    b096779a8276 drm/vc4: dsi: Register dsi0 as the correct vc4 encoder type
    fe6ebdb61559 drm/vc4: dsi: Correct pixel order for DSI0
    62b6d4308c2c drm/vc4: dsi: Correct DSI divider calculations
    80e2db799b38 drm/vc4: dsi: Release workaround buffer and DMA
    3d722c01d628 drm/vc4: Use of_device_get_match_data()
    c653b2c6a247 drm/vc4: dsi: Switch to devm_drm_of_get_bridge
    ed486d15084f drm/bridge: Add a function to abstract away panels
    b6fea72ea1aa drm/vc4: plane: Fix margin calculations for the right/bottom edges
    645b294e9bf7 drm/vc4: plane: Remove subpixel positioning check
    0597bcf77489 media: tw686x: Fix memory leak in tw686x_video_init
    ad1a66b40bf8 media: driver/nxp/imx-jpeg: fix a unexpected return value problem
    db01d107c21f media: v4l2-mem2mem: prevent pollerr when last_buffer_dequeued is set
    7ca91b2d870f media: hdpvr: fix error value returns in hdpvr_read
    3123ae6fdd40 drm/mcde: Fix refcount leak in mcde_dsi_bind
    375a6fdf7d54 media: imx-jpeg: Disable slot interrupt when frame done
    54f1c0606695 drm: bridge: adv7511: Add check for mipi_dsi_driver_register
    f831d2882c84 crypto: ccp - During shutdown, check SEV data pointer before using
    8f458e34a804 test_bpf: fix incorrect netdev features
    621595f771a6 rcutorture: Fix ksoftirqd boosting timing and iteration
    489b93ac63d2 rcutorture: Don't cpuhp_remove_state() if cpuhp_setup_state() failed
    5a6ff3e32a0c rcutorture: Warn on individual rcu_torture_init() error conditions
    e32f8c51a650 drm/radeon: fix incorrrect SPDX-License-Identifiers
    88b551561ded wifi: iwlegacy: 4965: fix potential off-by-one overflow in il4965_rs_fill_link_cmd()
    03ca957c5f7b ath9k: fix use-after-free in ath9k_hif_usb_rx_cb
    ebde990e2436 media: imx-jpeg: Implement drain using v4l2-mem2mem helpers
    9ae2d729de63 media: imx-jpeg: Align upwards buffer size
    88355f7b682b media: imx-jpeg: Support dynamic resolution change
    07888b84f370 media: imx-jpeg: Handle source change in a function
    8fcbb2e91e26 media: imx-jpeg: Identify and handle precision correctly
    24eef33c384e media: imx-jpeg: Refactor function mxc_jpeg_parse
    cab2a15969d0 media: imx-jpeg: Set V4L2_BUF_FLAG_LAST at eos
    5709766b078a media: imx-jpeg: use NV12M to represent non contiguous NV12
    cbc257317106 media: imx-jpeg: Add pm-runtime support for imx-jpeg
    c0d98e53e921 media: imx-jpeg: Leave a blank space before the configuration data
    2c784c14938a media: imx-jpeg: Correct some definition according specification
    33196a7ac6fa media: tw686x: Register the irq at the end of probe
    f61c0d97bdc8 media: atmel: atmel-sama7g5-isc: fix warning in configs without OF
    85c317a626b8 crypto: sun8i-ss - fix infinite loop in sun8i_ss_setup_ivs()
    35927d7509ab i2c: Fix a potential use after free
    8b4bba610f52 can: netlink: allow configuring of fixed data bit rates without need for do_set_data_bittiming callback
    d9bd6a965908 can: netlink: allow configuring of fixed bit rates without need for do_set_bittiming callback
    ab5a4e0cbfe3 net: fix sk_wmem_schedule() and sk_rmem_schedule() errors
    d806f3ae4b3c crypto: sun8i-ss - fix error codes in allocate_flows()
    b3cb6006857c crypto: sun8i-ss - do not allocate memory when handling hash requests
    aeecc92f5a68 drm: adv7511: override i2c address of cec before accessing it
    72893aadc001 drm/virtio: Fix NULL vs IS_ERR checking in virtio_gpu_object_shmem_init
    ff0087df198d drm/shmem-helper: Pass GEM shmem object in public interfaces
    4109ff9e7b95 drm/shmem-helper: Export dedicated wrappers for GEM object functions
    a3f82087b768 drm/shmem-helper: Unexport drm_gem_shmem_create_with_handle()
    39caef09666c virtio-gpu: fix a missing check to avoid NULL dereference
    c3a1cfd16445 i2c: mxs: Silence a clang warning
    73778e237003 i2c: npcm: Correct slave role behavior
    cdd51152a100 i2c: npcm: Remove own slave addresses 2:10
    a42f0c4c64fe drm/bridge: lt9611uxc: Cancel only driver's work
    275fed7142ff drm/meson: encoder_hdmi: Fix refcount leak in meson_encoder_hdmi_init
    e098989a9219 drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR
    c901a385b7a1 drm/mediatek: Add pull-down MIPI operation in mtk_dsi_poweroff function
    87c251d960dc drm/mediatek: Separate poweron/poweroff from enable/disable and define new funcs
    2ec80289a7ff drm/mediatek: Modify dsi funcs to atomic operations
    deb603c5928e drm/radeon: fix potential buffer overflow in ni_set_mc_special_registers()
    166b0a6171ab ath11k: Fix incorrect debug_mask mappings
    2dc78843fe98 drm/mipi-dbi: align max_chunk to 2 in spi_transfer
    eaff3946a86f ath11k: fix netdev open race
    90b4ec83ef15 wifi: rtlwifi: fix error codes in rtl_debugfs_set_write_h2c()
    438ac9f4f7e4 drm/panel: Fix build error when CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=y && CONFIG_DRM_DISPLAY_HELPER=m
    c2af61bd0404 drm/st7735r: Fix module autoloading for Okaya RH128128T
    d2d2789fb956 ath10k: do not enforce interrupt trigger type
    037844355198 drm/bridge: tc358767: Move (e)DP bridge endpoint parsing into dedicated function
    3f4829cd4784 drm/dp: Export symbol / kerneldoc fixes for DP AUX bus
    0491709eb3a6 pwm: lpc18xx: Fix period handling
    3475e55bc54d pwm: lpc18xx-sct: Simplify driver by not using pwm_[gs]et_chip_data()
    d0c79cda85b6 pwm: lpc18xx-sct: Reduce number of devm memory allocations
    009b384092ba pwm: sifive: Shut down hardware only after pwmchip_remove() completed
    53d784838a38 pwm: sifive: Ensure the clk is enabled exactly once per running PWM
    5c86cf45f551 pwm: sifive: Simplify offset calculation for PWMCMP registers
    87efb79c5f9e dm: return early from dm_pr_call() if DM device is suspended
    f28d733c318e thermal/tools/tmon: Include pthread and time headers in tmon.h
    226935eabe33 selftests/seccomp: Fix compile warning when CC=clang
    7bc43ab2b90a x86/extable: Fix ex_handler_msr() print condition
    b3d3069a6fc8 nohz/full, sched/rt: Fix missed tick-reenabling bug in dequeue_task_rt()
    4125108ec842 drivers/perf: arm_spe: Fix consistency of SYS_PMSCR_EL1.CX
    9d2a0422dedc irqdomain: Report irq number for NOMAP domains
    a815cb1088e7 arm64: dts: qcom: qcs404: Fix incorrect USB2 PHYs assignment
    7c432710198e soc: qcom: Make QCOM_RPMPD depend on PM
    c9df8ff29009 regulator: of: Fix refcount leak bug in of_get_regulation_constraints()
    a638fa974512 dm writecache: count number of blocks discarded, not number of discard bios
    fc988f1ca265 dm writecache: count number of blocks written, not number of write bios
    3a2500b73a17 dm writecache: count number of blocks read, not number of read bios
    880c4513eb33 dm writecache: return void from functions
    764b8892d7da PM: domains: Ensure genpd_debugfs_dir exists before remove
    b4439abfd77e blktrace: Trace remapped requests correctly
    c1a21bf5d012 hwmon: (drivetemp) Add module alias
    415b4ce61308 spi: tegra20-slink: fix UAF in tegra_slink_remove()
    445fb9c19cf4 spi: Fix simplification of devm_spi_register_controller
    6d8e185bf9de blk-mq: don't create hctx debugfs dir until q->debugfs_dir is created
    1c350a597c2d erofs: avoid consecutive detection for Highmem memory
    a34982fd219e arm64: tegra: Fix SDMMC1 CD on P2888
    a7f751d4e830 arm64: tegra: Mark BPMP channels as no-memory-wc
    778b6531fe24 arm64: tegra: Update Tegra234 BPMP channel addresses
    09da10968581 arm64: tegra: Fixup SYSRAM references
    40d72c485a85 arm64: dts: mt7622: fix BPI-R64 WPS button
    759fa566f433 arm64: dts: qcom: sm8250: add missing PCIe PHY clock-cells
    650d2e76a317 arm64: dts: qcom: sm6125: Append -state suffix to pinctrl nodes
    7847ebb6fcec arm64: dts: qcom: sm6125: Move sdc2 pinctrl from seine-pdx201 to sm6125
    c24bbe45965d ACPI: VIOT: Fix ACS setup
    273a7fbb06d6 drivers/iio: Remove all strcpy() uses
    335852f7a976 ACPI: APEI: explicit init of HEST and GHES in apci_init()
    6dc72d0181b4 arm64: dts: qcom: msm8916: Fix typo in pronto remoteproc node
    1c84883e79a3 stack: Declare {randomize_,}kstack_offset to fix Sparse warnings
    4a020202c391 bus: hisi_lpc: fix missing platform_device_put() in hisi_lpc_acpi_probe()
    a0a9813f1e09 ARM: dts: qcom: pm8841: add required thermal-sensor-cells
    053543ac1d09 soc: qcom: aoss: Fix refcount leak in qmp_cooling_devices_register
    84a928b44cb3 soc: qcom: ocmem: Fix refcount leak in of_get_ocmem
    e89261b18c4e ARM: dts: qcom-msm8974: fix irq type on blsp2_uart1
    c1fdcd13a610 ACPI: APEI: Fix _EINJ vs EFI_MEMORY_SP
    fc6dbc57f9d1 regulator: qcom_smd: Fix pm8916_pldo range
    179034fb108e cpufreq: zynq: Fix refcount leak in zynq_get_revision
    78ed18a5aa7f arm64: dts: qcom: sdm636-sony-xperia-ganges-mermaid: correct sdc2 pinconf
    0a8d15d85b19 arm64: dts: qcom: sdm630: fix gpu's interconnect path
    cd6bd95e9b02 arm64: dts: qcom: sdm630: fix the qusb2phy ref clock
    9f3b0a0b87e6 arm64: dts: qcom: sdm630: disable GPU by default
    1bf747824a8c ARM: OMAP2+: Fix refcount leak in omap3xxx_prm_late_init
    230ad40a59c9 ARM: OMAP2+: Fix refcount leak in omapdss_init_of
    ddad68dd9742 ARM: dts: qcom: mdm9615: add missing PMIC GPIO reg
    925a0117ac68 block: fix infinite loop for invalid zone append
    9abd50506fe4 soc: fsl: guts: machine variable might be unset
    4d6f33865e21 arm64: dts: qcom: sc7180: Remove ipa_fw_mem node on trogdor
    e0067e6d5475 locking/lockdep: Fix lockdep_init_map_*() confusion
    5b418289b060 arm64: cpufeature: Allow different PMU versions in ID_DFR0_EL1
    c66b3b49fe03 arm64: select TRACE_IRQFLAGS_NMI_SUPPORT
    e94388f78e65 arm64: dts: mt8192: Fix idle-states entry-method
    2fe4c39aa379 arm64: dts: mt8192: Fix idle-states nodes naming scheme
    e50541493882 ARM: dts: ast2600-evb-a1: fix board compatible
    5f73deb9afa6 ARM: dts: ast2600-evb: fix board compatible
    6fa1cf1b92f0 ARM: dts: ast2500-evb: fix board compatible
    377a4c5cb7ab x86/pmem: Fix platform-device leak in error path
    5a73493f0d6a arm64: dts: renesas: Fix thermal-sensors on single-zone sensors
    f370fbbd3151 soc: amlogic: Fix refcount leak in meson-secure-pwrc.c
    cb119a1dd929 dt-bindings: iio: accel: Add DT binding doc for ADXL355
    7bbcbfbc314d scsi: hisi_sas: Use managed PCI functions
    c010048e3f71 soc: renesas: r8a779a0-sysc: Fix A2DP1 and A2CV[2357] PDR values
    e7e4f1cb915e ARM: dts: imx7d-colibri-emmc: add cpu1 supply
    4bd8bc5c77a0 ACPI: processor/idle: Annotate more functions to live in cpuidle section
    bc7f487395f2 ARM: bcm: Fix refcount leak in bcm_kona_smc_init
    1f4bc0604dff spi: spi-altera-dfl: Fix an error handling path
    ebbd1412ce4f arm64: dts: renesas: beacon: Fix regulator node names
    e21744c6a0d4 meson-mx-socinfo: Fix refcount leak in meson_mx_socinfo_init
    a7c16b8966d4 ARM: findbit: fix overflowing offset
    0ff7f81559fa spi: spi-rspi: Fix PIO fallback on RZ platforms
    8e3407e0f5e1 powerpc/64s: Disable stack variable initialisation for prom_init
    e45491556e2a drm/amdgpu: Remove one duplicated ef removal
    abd3622f657e kasan: test: Silence GCC 12 warnings
    7363a69d8ca8 selinux: Add boundary check in put_entry()
    c877c5217145 selinux: fix memleak in security_read_state_kernel()
    2f0e18e0db42 PM: hibernate: defer device probing when resuming from hibernation
    d68601914e00 hwmon: (sht15) Fix wrong assumptions in device remove callback
    fb98663448cb hwmon: (dell-smm) Add Dell XPS 13 7390 to fan control whitelist
    c5a73bd9f11a firmware: tegra: Fix error check return value of debugfs_create_file()
    c53d904973cb ARM: shmobile: rcar-gen2: Increase refcount for new reference
    ef94e7897744 arm64: dts: allwinner: a64: orangepi-win: Fix LED node name
    3a4b3a0ff064 arm64: dts: qcom: ipq8074: fix NAND node name
    c0b8dcbaf37f ARM: dts: qcom: sdx55: Fix the IRQ trigger type for UART
    01d539d9f538 ACPI: LPSS: Fix missing check in register_device_clock()
    30abb8735892 ACPI: PM: save NVS memory for Lenovo G40-45
    f450635d781f ACPI: EC: Drop the EC_FLAGS_IGNORE_DSDT_GPE quirk
    730b9eb8fb88 ACPI: EC: Remove duplicate ThinkPad X1 Carbon 6th entry from DMI quirks
    75f23d72b6e0 ARM: OMAP2+: pdata-quirks: Fix refcount leak bug
    a89a865dc9f0 ARM: OMAP2+: display: Fix refcount leak bug
    b856645c1849 spi: synquacer: Add missing clk_disable_unprepare()
    cbfe9a2303c8 ARM: dts: ux500: Fix Gavini accelerometer mounting matrix
    e2d106b28460 ARM: dts: ux500: Fix Codina accelerometer mounting matrix
    ceafabd1d4ff ARM: dts: BCM5301X: Add DT for Meraki MR26
    0e4c38c795e7 ARM: dts: imx6ul: fix qspi node compatible
    95ba9c53999e ARM: dts: imx6ul: fix lcdif node compatible
    2db26fa7b9a1 ARM: dts: imx6ul: fix csi node compatible
    5357c3b24cfe ARM: dts: imx6ul: fix keypad compatible
    135155585647 ARM: dts: imx6ul: change operating-points to uint32-matrix
    ca367834a787 ARM: dts: imx6ul: add missing properties for sram
    8df06a275338 wait: Fix __wait_event_hrtimeout for RT/DL tasks
    f0d66189d161 irqchip/mips-gic: Check the return value of ioremap() in gic_of_init()
    f066e015821c sched/core: Always flush pending blk_plug
    f116c621dd1e genirq: GENERIC_IRQ_IPI depends on SMP
    00ffa95ed649 irqchip/mips-gic: Only register IPI domain when SMP is enabled
    f9842ec6839a genirq: Don't return error on missing optional irq_request_resources()
    079651c6cfdc sched/fair: Introduce SIS_UTIL to search idle CPU based on sum of util_avg
    96b18d3a1be0 ext2: Add more validity checks for inode counts
    add4bc9281e8 arm64: kasan: Revert "arm64: mte: reset the page tag in page->flags"
    cc69ef95988b arm64: fix oops in concurrently setting insn_emulation sysctls
    42eede3ae05b arm64: Do not forget syscall when starting a new thread.
    d1e812beae86 arch: make TRACE_IRQFLAGS_NMI_SUPPORT generic
    932b5e65245c x86: Handle idle=nomwait cmdline properly for x86_idle
    9ccb5d391c51 epoll: autoremove wakers even more aggressively
    8a2df34b5bf6 netfilter: nf_tables: fix null deref due to zeroed list head
    257b944464be netfilter: nf_tables: do not allow RULE_ID to refer to another chain
    915015130169 netfilter: nf_tables: do not allow CHAIN_ID to refer to another table
    faafd9286f13 netfilter: nf_tables: do not allow SET_ID to refer to another table
    5ea18ddc1703 usb: dwc3: gadget: fix high speed multiplier setting
    332a8c027aa3 usb: dwc3: gadget: refactor dwc3_repare_one_trb
    f0782cf2dce0 arm64: dts: uniphier: Fix USB interrupts for PXs3 SoC
    148a7fe3cdfc ARM: dts: uniphier: Fix USB interrupts for PXs2 SoC
    b76ea430e94f USB: HCD: Fix URB giveback issue in tasklet function
    269c917837c4 usb: typec: ucsi: Acknowledge the GET_ERROR_STATUS command completion
    b49b29ee113a coresight: Clear the connection field properly
    e41db8a9ce69 MIPS: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
    db68d474cf09 powerpc/powernv: Avoid crashing if rng is NULL
    552a29e47174 powerpc/ptdump: Fix display of RW pages on FSL_BOOK3E
    79da7a5f8f0b powerpc/fsl-pci: Fix Class Code of PCIe Root Port
    fdf759059164 PCI: Add defines for normal and subtractive PCI bridges
    ae6620a39748 ia64, processor: fix -Wincompatible-pointer-types in ia64_get_irr()
    74d64284538e media: [PATCH] pci: atomisp_cmd: fix three missing checks on list iterator
    ddc7fadd0504 mbcache: add functions to delete entry if unused
    1250557d3bf3 mbcache: don't reclaim used entries
    0f4d18cbea4a md-raid10: fix KASAN warning
    c5e4cdd44387 md-raid: destroy the bitmap after destroying the thread
    351ec3d68ce0 serial: mvebu-uart: uart2 error bits clearing
    ec8e701f9e20 fuse: ioctl: translate ENOSYS
    daa9cfb86221 fuse: limit nsec
    a54c509c32ad ksmbd: fix use-after-free bug in smb2_tree_disconect
    577619605556 ksmbd: prevent out of bound read for SMB2_TREE_CONNNECT
    dd4e4c811898 ksmbd: fix memory leak in smb2_handle_negotiate
    dead7f484a3b soundwire: qcom: Check device status before reading devid
    71bc3b75e941 scsi: qla2xxx: Zero undefined mailbox IN registers
    a659c7f8114d scsi: qla2xxx: Fix incorrect display of max frame size
    8c004b7dbb34 scsi: sg: Allow waiting for commands to complete on removed device
    fac589fb7646 iio: light: isl29028: Fix the warning in isl29028_remove()
    a76771da2156 iio: fix iio_format_avail_range() printing for none IIO_VAL_INT
    cac7ead0b3ab um: seed rng using host OS rng
    5d096e2dc20b um: Remove straying parenthesis
    2e88f5003399 mtd: rawnand: arasan: Update NAND bus clock instead of system clock
    2ffe64acf7d6 mtd: rawnand: arasan: Fix clock rate in NV-DDR
    89f3a8bbb4a7 btrfs: reject log replay if there is unsupported RO compat flag
    1f8ca9c40e62 bpf: Fix KASAN use-after-free Read in compute_effective_progs
    27f8f5219fe4 drm/amdgpu: fix check in fbdev init
    eb3c69c7c777 drm/amdgpu: Check BO's requested pinning domains against its preferred_domains
    f792acb67deb drm/nouveau/kms: Fix failure path for creating DP connectors
    67cb7be1561a drm/nouveau/acpi: Don't print error when we get -EINPROGRESS from pm_runtime
    f522c189e465 drm/nouveau: Don't pm_runtime_put_sync(), only pm_runtime_put_autosuspend()
    dcf37f58827e drm/nouveau: fix another off-by-one in nvbios_addr
    2806b02bac9c drm/hyperv-drm: Include framebuffer and EDID headers
    97049e69f5a8 drm/vc4: hdmi: Disable audio if dmas property is present but empty
    8589a83c0ae9 drm/shmem-helper: Add missing vunmap on error
    da2a1aa058ac drm/gem: Properly annotate WW context on drm_gem_lock_reservations() error
    3ef94852bb33 rtc: rx8025: fix 12/24 hour mode detection on RX-8035
    bb3b601f1414 RISC-V: Add modules to virtual kernel memory layout dump
    150573c60c02 RISC-V: Fixup schedule out issue in machine_crash_shutdown()
    111a049cacc6 RISC-V: Fixup get incorrect user mode PC for kernel mode regs
    22ae2fe45516 RISC-V: kexec: Fixup use of smp_processor_id() in preemptible context
    63fbab985a16 dt-bindings: riscv: fix SiFive l2-cache's cache-sets
    c71e000db853 riscv:uprobe fix SR_SPIE set/clear handling
    7df75cbd1bec parisc: io_pgetevents_time64() needs compat syscall in 32-bit compat mode
    9b67131162dc parisc: Check the return value of ioremap() in lba_driver_probe()
    68949e725c39 parisc: Drop pa_swapper_pg_lock spinlock
    422421cbf39a parisc: Fix device names in /proc/iomem
    35ef2ee74d95 ovl: drop WARN_ON() dentry is NULL in ovl_encode_fh()
    f2a920daa780 crypto: ccp - Use kzalloc for sev ioctl interfaces to prevent kernel memory leak
    4228c037f88e fix short copy handling in copy_mc_pipe_to_iter()
    635fd8953e43 usbnet: Fix linkwatch use-after-free on disconnect
    d0d6186eae61 fbcon: Fix accelerated fbdev scrolling while logo is still shown
    c1e09ee98f3a fbcon: Fix boundary checks for fbcon=vc:n1-n2 parameters
    06d6eb948e53 thermal: sysfs: Fix cooling_device_stats_setup() error code path
    cd28cf0f69b4 fs: Add missing umask strip in vfs_tmpfile
    5efc5b3baf13 vfs: Check the truncate maximum size in inode_newsize_ok()
    446f123aa602 tty: vt: initialize unicode screen buffer
    6b8d61a9fd96 ALSA: hda/realtek: Add a quirk for HP OMEN 15 (8786) mute LED
    7ad08c1e18c7 ALSA: hda/realtek: Add quirk for another Asus K42JZ model
    5d5b2d1d3663 ALSA: hda/cirrus - support for iMac 12,1 model
    e4b337fb82bf ALSA: hda/conexant: Add quirk for LENOVO 20149 Notebook model
    c840d626472e riscv: set default pm_power_off to NULL
    abedd69baf6e KVM: x86: revalidate steal time cache if MSR value changes
    77e26cdf5ced KVM: x86: do not report preemption if the steal time cache is stale
    69704ca43e08 KVM: x86: Tag kvm_mmu_x86_module_init() with __init
    439fcac3d0e0 KVM: nVMX: Always enable TSC scaling for L2 when it was enabled for L1
    14aebe952f86 KVM: x86: Set error code to segment selector on LLDT/LTR non-canonical #GP
    ccbf3f955ccd KVM: x86: Mark TSS busy during LTR emulation _after_ all fault checks
    2a117667f32f KVM: nVMX: Inject #UD if VMXON is attempted with incompatible CR0/CR4
    3868687afae1 KVM: nVMX: Account for KVM reserved CR4 bits in consistency checks
    76e6038cfa9b KVM: nVMX: Let userspace set nVMX MSR to any _host_ supported value
    9953f86a67e5 KVM: x86: Split kvm_is_valid_cr4() and export only the non-vendor bits
    aeb4c3e1c46f KVM: s390: pv: don't present the ecall interrupt twice
    6afe88fbb40e KVM: SVM: Don't BUG if userspace injects an interrupt with GIF=0
    1f27ca6534f3 KVM: nVMX: Snapshot pre-VM-Enter DEBUGCTL for !nested_run_pending case
    b69b7c1a0d21 KVM: nVMX: Snapshot pre-VM-Enter BNDCFGS for !nested_run_pending case
    5138b0f7cb5b HID: wacom: Don't register pad_input for touch switch
    c5ec7920b566 HID: wacom: Only report rotation for art pen
    109f0544a518 HID: hid-input: add Surface Go battery quirk
    e9ba81ee1cbd lockd: detect and reject lock arguments that overflow
    b437275e894b add barriers to buffer_uptodate and set_buffer_uptodate
    594f1b923813 wifi: mac80211_hwsim: use 32-bit skb cookie
    6b6ed18432ea wifi: mac80211_hwsim: add back erroneously removed cast
    879f766eaa31 wifi: mac80211_hwsim: fix race condition in pending packet
    14acf0290d2d ALSA: hda/realtek: Add quirk for HP Spectre x360 15-eb0xxx
    196d8d34de95 ALSA: hda/realtek: Add quirk for Clevo NV45PZ
    64ca7f50ad96 ALSA: bcd2000: Fix a UAF bug on the error path of probing
    30e8b553e029 ALSA: usb-audio: Add quirk for Behringer UMC202HD
    6a463eb6dfcc nfsd: eliminate the NFSD_FILE_BREAK_* flags
    8eedc616f327 NFSD: Clean up the show_nf_flags() macro
    94d0dd56f817 pNFS/flexfiles: Report RDMA connection errors to the server
    661714de2403 scsi: Revert "scsi: qla2xxx: Fix disk failure to rediscover"
    3593f251f973 Revert "pNFS: nfs3_set_ds_client should set NFS_CS_NOPING"
    b6c05de137c3 x86: link vdso and boot with -z noexecstack --no-warn-rwx-segments
    4c7ee827da2c Makefile: link with -z noexecstack --no-warn-rwx-segments
    7217df812798 Linux 5.15.60
    5c5c77746ce1 x86/speculation: Add LFENCE to RSB fill sequence
    7fcd99e889c0 x86/speculation: Add RSB VM Exit protections
    c81d1bb58c88 macintosh/adb: fix oob read in do_adb_query() function
    d98cf2b40c20 Bluetooth: btusb: Add Realtek RTL8852C support ID 0x13D3:0x3586
    ee421ad8973b Bluetooth: btusb: Add Realtek RTL8852C support ID 0x13D3:0x3587
    59689a843bc9 Bluetooth: btusb: Add Realtek RTL8852C support ID 0x0CB8:0xC558
    b653eeaa8cf8 Bluetooth: btusb: Add Realtek RTL8852C support ID 0x04C5:0x1675
    d4f921efb4bf Bluetooth: btusb: Add Realtek RTL8852C support ID 0x04CA:0x4007
    04e3388eeb47 Bluetooth: btusb: Add support of IMC Networks PID 0x3568
    6a5ec48fb752 dt-bindings: bluetooth: broadcom: Add BCM4349B1 DT binding
    88e088e29487 Bluetooth: hci_bcm: Add DT compatible for CYW55572
    2aa38f0af306 Bluetooth: hci_bcm: Add BCM4349B1 variant
    37b385c78cd5 btrfs: zoned: fix critical section of relocation inode writeback
    5e04c8bf42d8 btrfs: zoned: prevent allocation from previous data relocation BG
    775871d4be0d arm64: set UXN on swapper page tables
    a619a0312099 KVM: x86/svm: add __GFP_ACCOUNT to __sev_dbg_{en,de}crypt_user()
    e423893fe320 selftests: KVM: Handle compiler optimizations in ucall
    bc2cee443c74 tools/kvm_stat: fix display of error when multiple processes are found
    9acd899d2feb KVM: selftests: Make hyperv_clock selftest more stable
    ad6fd99d5feb KVM: x86: do not set st->preempted when going back to user space
    92343314d34e KVM: x86: do not report a vCPU as preempted outside instruction boundaries
    3d4c28475ee3 crypto: arm64/poly1305 - fix a read out-of-bound
    397c2116cbe2 ACPI: APEI: Better fix to avoid spamming the console with old error logs
    e7170bcda613 ACPI: video: Shortening quirk list by identifying Clevo by board_name only
    3a5fab5c4505 ACPI: video: Force backlight native for some TongFang devices
    9894717519cc tools/vm/slabinfo: Handle files in debugfs
    7ad47f414b40 block: fix default IO priority handling again
    e889a4c440eb selftests/bpf: Check dst_port only on the client socket
    119debdb9f25 selftests/bpf: Extend verifier and bpf_sock tests for dst_port loads
    df9692b8a319 x86/speculation: Make all RETbleed mitigations 64-bit only
    d676d6149a2f Linux 5.15.59
    f0e42e43795d x86/bugs: Do not enable IBPB at firmware entry when IBPB is not available
    d10e819d13f7 locking/rwsem: Allow slowpath writer to ignore handoff bit if not set by first waiter
    66d31cef4806 docs/kernel-parameters: Update descriptions for "mitigations=" param with retbleed
    7bada8b0bdf1 EDAC/ghes: Set the DIMM label unconditionally
    30dc2effc74a ARM: 9216/1: Fix MAX_DMA_ADDRESS overflow
    86e83233dd01 page_alloc: fix invalid watermark check on a negative value
    51a772c34ea4 mm/hmm: fault non-owner device private entries
    350fcb5e7bbb ARM: crypto: comment out gcc warning that breaks clang builds
    e796e1fe20ec sctp: leave the err path free in sctp_stream_init to sctp_stream_free
    f7c2a9c5435a sfc: disable softirqs for ptp TX
    fe0e602f0502 perf symbol: Correct address for bss symbols
    871168abe6d8 virtio-net: fix the race between refill work and close
    91c11008aab0 netfilter: nf_queue: do not allow packet truncation below transport header offset
    be5cd347ba22 octeontx2-pf: cn10k: Fix egress ratelimit configuration
    3688939cd3e8 sctp: fix sleep in atomic context bug in timer handlers
    186fcdb68f42 i40e: Fix interface init with MSI interrupts (no MSI-X)
    4685f16b3a5d ipv4: Fix data-races around sysctl_fib_notify_on_flag_change.
    eaccca7a0bb8 tcp: Fix data-races around sysctl_tcp_reflect_tos.
    4cc070e0ef2d tcp: Fix a data-race around sysctl_tcp_comp_sack_nr.
    34c9977b4dca tcp: Fix a data-race around sysctl_tcp_comp_sack_slack_ns.
    6842c94de9d5 tcp: Fix a data-race around sysctl_tcp_comp_sack_delay_ns.
    618116a273b7 net: Fix data-races around sysctl_[rw]mem(_offset)?.
    a610feb170bf tcp: Fix data-races around sk_pacing_rate.
    b01b4f5b45ff net: mld: fix reference count leak in mld_{query | report}_work()
    5831ccf37a31 net: macsec: fix potential resource leak in macsec_add_rxsa() and macsec_add_txsa()
    2959a86a472f macsec: always read MACSEC_SA_ATTR_PN as a u64
    a706a40d42f4 macsec: limit replay window size with XPN
    6ad56d5c4f98 macsec: fix error message in macsec_add_rxsa and _txsa
    8991687d3bcf macsec: fix NULL deref in macsec_add_rxsa
    830582c16be1 Documentation: fix sctp_wmem in ip-sysctl.rst
    dac5644a823e tcp: Fix a data-race around sysctl_tcp_invalid_ratelimit.
    6f446677ebb3 tcp: Fix a data-race around sysctl_tcp_autocorking.
    bd07f2e70a4b tcp: Fix a data-race around sysctl_tcp_min_rtt_wlen.
    922ca9fd221b tcp: Fix a data-race around sysctl_tcp_min_tso_segs.
    777d18e65d09 net: sungem_phy: Add of_node_put() for reference returned by of_get_parent()
    40f4739bbd36 net: pcs: xpcs: propagate xpcs_read error to xpcs_get_state_c37_sgmii
    c721324afc58 igmp: Fix data-races around sysctl_igmp_qrv.
    ad6d6ae4a34c net/tls: Remove the context from the list in tls_device_down
    189e370b8250 ipv6/addrconf: fix a null-ptr-deref bug for ip6_ptr
    4845d3ef6445 net: ping6: Fix memleak in ipv6_renew_options().
    6a4a1c70e446 scsi: mpt3sas: Stop fw fault watchdog work item during system shutdown
    3d3e41069b65 scsi: core: Fix warning in scsi_alloc_sgtables()
    ff2932ac8ee1 tcp: Fix a data-race around sysctl_tcp_challenge_ack_limit.
    a88de75673e4 tcp: Fix a data-race around sysctl_tcp_limit_output_bytes.
    664a3311e671 tcp: Fix data-races around sysctl_tcp_moderate_rcvbuf.
    59e2332846d8 octeontx2-pf: Fix UDP/TCP src and dst port tc filters
    927c5cf0ba3e Revert "tcp: change pingpong threshold to 3"
    bdaf56e0df15 scsi: ufs: host: Hold reference returned by of_parse_phandle()
    7f0a36506809 ice: do not setup vlan for loopback VSI
    cef4c1d0fb48 ice: check (DD | EOF) bits on Rx descriptor rather than (EOP | RS)
    62e721dee8cc tcp: Fix data-races around sysctl_tcp_no_ssthresh_metrics_save.
    aa2ca5b5629d tcp: Fix a data-race around sysctl_tcp_nometrics_save.
    6e167ed68999 tcp: Fix a data-race around sysctl_tcp_frto.
    0d8fa3c2a442 tcp: Fix a data-race around sysctl_tcp_adv_win_scale.
    74753ec663d7 tcp: Fix a data-race around sysctl_tcp_app_win.
    807b028115eb tcp: Fix data-races around sysctl_tcp_dsack.
    c9c01dd38975 watch_queue: Fix missing locking in add_watch_to_object()
    093610f216d0 watch_queue: Fix missing rcu annotation
    11c1cc3f6e42 drm/simpledrm: Fix return type of simpledrm_simple_display_pipe_mode_valid()
    121c8993d4f3 nouveau/svm: Fix to migrate all requested pages
    8bd9747d3066 s390/archrandom: prevent CPACF trng invocations in interrupt context
    71f71150115a asm-generic: remove a broken and needless ifdef conditional
    dc124c849c72 hugetlb: fix memoryleak in hugetlb_mcopy_atomic_pte
    2722fb0f7028 mm: fix page leak with multiple threads mapping the same page
    70d0ce332d26 secretmem: fix unhandled fault in truncate
    3ef8040afce7 fs: sendfile handles O_NONBLOCK of out_fd
    518df26b5238 ntfs: fix use-after-free in ntfs_ucsncmp()
    46f6301fb4f1 Revert "ocfs2: mount shared volume without ha stack"
    f32d5615a78a Bluetooth: L2CAP: Fix use-after-free caused by l2cap_chan_put
    7d8048d4e064 Linux 5.15.58
    c6e4817ab622 drm/amd/display: Fix wrong format specifier in amdgpu_dm.c
    198a6f40822e x86/entry_32: Fix segment exceptions
    ec9ec3bc08b1 drm/amdgpu: Off by one in dm_dmub_outbox1_low_irq()
    e4481000ac68 x86: drop bogus "cc" clobber from __try_cmpxchg_user_asm()
    9444462d6343 KVM: x86: fix typo in __try_cmpxchg_user causing non-atomicness
    b6c24afba608 x86/extable: Prefer local labels in .set directives
    f85a6046f771 drm/amd/display: invalid parameter check in dmub_hpd_callback
    760fe3203493 drm/amd/display: Don't lock connection_mutex for DMUB HPD
    d026ed6eda29 watch-queue: remove spurious double semicolon
    b34229f4b212 net: usb: ax88179_178a needs FLAG_SEND_ZLP
    b2d1e4cd558c tty: use new tty_insert_flip_string_and_push_buffer() in pty_write()
    816c301b6a73 tty: extract tty_flip_buffer_commit() from tty_flip_buffer_push()
    35545303454a tty: drop tty_schedule_flip()
    6219f5b54ad8 tty: the rest, stop using tty_schedule_flip()
    ea255921c4b5 tty: drivers/tty/, stop using tty_schedule_flip()
    ba3a8af8a21a watchqueue: make sure to serialize 'wqueue->defunct' properly
    49338b651f5a x86/alternative: Report missing return thunk details
    8842d5d70713 x86/amd: Use IBPB for firmware calls
    c2b484d784c8 drm/amd/display: Fix surface optimization regression on Carrizo
    958151194858 drm/amd/display: Optimize bandwidth on following fast update
    b3f16976b9ed drm/amd/display: Reset DMCUB before HW init
    4b4b1f8dfeb7 exfat: use updated exfat_chain directly during renaming
    000473ac997a Bluetooth: Fix bt_skb_sendmmsg not allocating partial chunks
    d01605a01f01 Bluetooth: SCO: Fix sco_send_frame returning skb->len
    5ae749f40d01 Bluetooth: Fix passing NULL to PTR_ERR
    367becefb8a1 Bluetooth: RFCOMM: Replace use of memcpy_from_msg with bt_skb_sendmmsg
    1864e820a5ac Bluetooth: SCO: Replace use of memcpy_from_msg with bt_skb_sendmsg
    cb7ed8c7fe5b Bluetooth: Add bt_skb_sendmmsg helper
    a4e8071be337 Bluetooth: Add bt_skb_sendmsg helper
    59f132fda50d um: virtio_uml: Fix broken device handling in time-travel
    38a28bb80f00 um: virtio_uml: Allow probing from devicetree
    d8413b16feee tracing: Fix return value of trace_pid_write()
    d9777061727b tracing: Place trace_pid_list logic into abstract functions
    6107b014163f tracing: Have event format check not flag %p* on __get_dynamic_array()
    621c1d8c1bd1 exfat: fix referencing wrong parent directory information after renaming
    72e0ec16f172 crypto: qat - re-enable registration of algorithms
    e7f979ed51f9 crypto: qat - add param check for DH
    4d6d2adce087 crypto: qat - add param check for RSA
    2488286d3e77 crypto: qat - remove dma_free_coherent() for DH
    6e8606e7ae40 crypto: qat - remove dma_free_coherent() for RSA
    a843925e0287 crypto: qat - fix memory leak in RSA
    ef5594895df2 crypto: qat - add backlog mechanism
    9cac903b6303 crypto: qat - refactor submission logic
    f576c7e01a6a crypto: qat - use pre-allocated buffers in datapath
    343cee3eafda crypto: qat - set to zero DH parameters before free
    c1f6637fe1c2 iwlwifi: fw: uefi: add missing include guards
    4448327b4173 mt76: fix use-after-free by removing a non-RCU wcid pointer
    829baf398f2c xhci: Set HCD flag to defer primary roothub registration
    813f4b49e81c xhci: dbc: Rename xhci_dbc_init and xhci_dbc_exit
    413c5f751f7c xhci: dbc: create and remove dbc structure in dbgtty driver.
    d7afb4a13f6c xhci: dbc: refactor xhci_dbc_init()
    d97c0667c1e6 KVM: x86: Use __try_cmpxchg_user() to emulate atomic accesses
    88eded8104d2 x86/futex: Remove .fixup usage
    6875d2425be8 x86/msr: Remove .fixup usage
    f637fbc7bda6 x86/extable: Extend extable functionality
    4bbc9a07e050 x86/entry_32: Remove .fixup usage
    e89d805e77f2 bitfield.h: Fix "type of reg too small for mask" test
    a86201c3ae79 x86/extable: Provide EX_TYPE_DEFAULT_MCE_SAFE and EX_TYPE_FAULT_MCE_SAFE
    3461326e1a9e x86/extable: Rework the exception table mechanics
    ad2d98ea72d2 x86/mce: Deduplicate exception handling
    3e6392ba3dce x86/extable: Get rid of redundant macros
    d3135da29e1a x86/extable: Tidy up redundant handler functions
    823424905d03 x86/uaccess: Implement macros for CMPXCHG on user addresses
    1062cfb47e56 dlm: fix pending remove if msg allocation fails
    765f802e0d25 x86/bugs: Warn when "ibrs" mitigation is selected on Enhanced IBRS parts
    46d5575df8a1 sched/deadline: Fix BUG_ON condition for deboosted tasks
    bc1fb3c53afd bpf: Make sure mac_header was set before using it
    8c5429a04ccd mm/mempolicy: fix uninit-value in mpol_rebind_policy()
    e91665fbbf3c KVM: Don't null dereference ops->destroy
    58466e053900 spi: bcm2835: bcm2835_spi_handle_err(): fix NULL pointer deref for non DMA transfers
    cd9f96aa8f57 KVM: selftests: Fix target thread to be migrated in rseq_test
    e129e5486b98 gpio: gpio-xilinx: Fix integer overflow
    ce3731c61589 tcp: Fix data-races around sysctl_tcp_max_reordering.
    84cee470f77c tcp: Fix a data-race around sysctl_tcp_abort_on_overflow.
    46d05dab1b4f tcp: Fix a data-race around sysctl_tcp_rfc1337.
    d46d55e3f9f8 tcp: Fix a data-race around sysctl_tcp_stdurg.
    1a1aedbb7605 tcp: Fix a data-race around sysctl_tcp_retrans_collapse.
    41aeba4506f6 tcp: Fix data-races around sysctl_tcp_slow_start_after_idle.
    404c53ccdebd tcp: Fix a data-race around sysctl_tcp_thin_linear_timeouts.
    a31e2d0cb5cf tcp: Fix data-races around sysctl_tcp_recovery.
    5037ca9e4b16 tcp: Fix a data-race around sysctl_tcp_early_retrans.
    329de75b9e16 tcp: Fix data-races around sysctl knobs related to SYN option.
    3f2ac2d6511b udp: Fix a data-race around sysctl_udp_l3mdev_accept.
    95724fe897a4 ip: Fix data-races around sysctl_ip_prot_sock.
    36f5b86f309b ipv4: Fix data-races around sysctl_fib_multipath_hash_fields.
    21fb844bc1dc ipv4: Fix data-races around sysctl_fib_multipath_hash_policy.
    b8d345db03b4 ipv4: Fix a data-race around sysctl_fib_multipath_use_neigh.
    94e4b855e22b drm/imx/dcss: Add missing of_node_put() in fail path
    3d13bf301e06 net: dsa: vitesse-vsc73xx: silent spi_device_id warnings
    25e1d782c9c3 net: dsa: sja1105: silent spi_device_id warnings
    aba8ff847f4f be2net: Fix buffer overflow in be_get_module_eeprom
    caae64d3e91b gpio: pca953x: use the correct register address when regcache sync during init
    dfb4b67ff4df gpio: pca953x: use the correct range when do regmap sync
    9726ed46b9b7 gpio: pca953x: only use single read/write for No AI mode
    e6fc5472b850 net: stmmac: remove redunctant disable xPCS EEE call
    16f929a5e76f ixgbe: Add locking to prevent panic when setting sriov_numvfs to zero
    893ea2b35bb9 i40e: Fix erroneous adapter reinitialization during recovery process
    fad55088ad73 pinctrl: armada-37xx: use raw spinlocks for regmap to avoid invalid wait context
    9d674108fe76 pinctrl: armada-37xx: Convert to use dev_err_probe()
    47c9f6bfc234 pinctrl: armada-37xx: Make use of the devm_platform_ioremap_resource()
    2cbb16513176 pinctrl: armada-37xx: Use temporary variable for struct device
    2918419c0608 iavf: Fix handling of dummy receive descriptors
    a77a75a0e7f3 tcp: Fix data-races around sysctl_tcp_fastopen_blackhole_timeout.
    539d9ab79eba tcp: Fix data-races around sysctl_tcp_fastopen.
    3ae85dc62a02 tcp: Fix data-races around sysctl_max_syn_backlog.
    58d5ea71aaa6 tcp: Fix a data-race around sysctl_tcp_tw_reuse.
    80d4d0c46167 tcp: Fix a data-race around sysctl_tcp_notsent_lowat.
    e816f8024617 tcp: Fix data-races around some timeout sysctl knobs.
    f6ce6556958c tcp: Fix data-races around sysctl_tcp_reordering.
    fcf6c6d8aeff tcp: Fix data-races around sysctl_tcp_migrate_req.
    10a9ba97a404 tcp: Fix data-races around sysctl_tcp_syncookies.
    78522951d718 tcp: Fix data-races around sysctl_tcp_syn(ack)?_retries.
    906beda70c2f tcp: Fix data-races around keepalive sysctl knobs.
    849450279dfc igmp: Fix data-races around sysctl_igmp_max_msf.
    2a408a4f423e igmp: Fix a data-race around sysctl_igmp_max_memberships.
    260446eb8e55 igmp: Fix data-races around sysctl_igmp_llm_reports.
    2e8c8309329d net/tls: Fix race in TLS device down flow
    7c687a893f5c net: stmmac: fix dma queue left shift overflow issue
    34e98fce9a9b perf tests: Fix Convert perf time to TSC test for hybrid
    196c21deb08a i2c: cadence: Change large transfer count reset logic to be unconditional
    66b73ef38d80 i2c: mlxcpld: Fix register setting for 400KHz frequency
    b8e68fce6f0e net: ipv4: use kfree_skb_reason() in ip_rcv_finish_core()
    ad5a78ed1356 net: ipv4: use kfree_skb_reason() in ip_rcv_core()
    82cda9918473 net: netfilter: use kfree_drop_reason() for NF_DROP
    f3ed670ef850 net: skb_drop_reason: add document for drop reasons
    8ac90de3d137 net: socket: rename SKB_DROP_REASON_SOCKET_FILTER
    b7adefdae236 net: skb: use kfree_skb_reason() in __udp4_lib_rcv()
    1629144da383 net: skb: use kfree_skb_reason() in tcp_v4_rcv()
    5158e18225c0 net: skb: introduce kfree_skb_reason()
    88ec2ff42da3 net: dsa: microchip: ksz_common: Fix refcount leak bug
    212a5360ef40 mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on program/erase times
    0156b402a5be mtd: rawnand: gpmi: validate controller clock rate
    f53c6ee5e7eb net: stmmac: fix unbalanced ptp clock issue in suspend/resume flow
    f784d232565b net: stmmac: fix pm runtime issue in stmmac_dvr_remove()
    e6b6f027e285 tcp: Fix a data-race around sysctl_tcp_probe_interval.
    f524c3e7f6cd tcp: Fix a data-race around sysctl_tcp_probe_threshold.
    cc36c37f5fe0 tcp: Fix a data-race around sysctl_tcp_mtu_probe_floor.
    0fc9357282df tcp: Fix data-races around sysctl_tcp_min_snd_mss.
    4d7dea651b7f tcp: Fix data-races around sysctl_tcp_base_mss.
    aabe9438fdfe tcp: Fix data-races around sysctl_tcp_mtu_probing.
    9ba9cd43b577 tcp: Fix data-races around sysctl_tcp_l3mdev_accept.
    b8e29f644583 tcp: sk->sk_bound_dev_if once in inet_request_bound_dev_if()
    bf3134feffe6 tcp/dccp: Fix a data-race around sysctl_tcp_fwmark_accept.
    dccf8a67f30e ip: Fix a data-race around sysctl_fwmark_reflect.
    87ceaa199a72 ip: Fix a data-race around sysctl_ip_autobind_reuse.
    4fdf9bdb2883 ip: Fix data-races around sysctl_ip_nonlocal_bind.
    351f81f7d718 ip: Fix data-races around sysctl_ip_fwd_update_priority.
    93fbc06da1d8 ip: Fix data-races around sysctl_ip_fwd_use_pmtu.
    01083e3f9868 ip: Fix data-races around sysctl_ip_no_pmtu_disc.
    e75b73081f1e igc: Reinstate IGC_REMOVED logic and implement it properly
    a4f7a9fbe24b Revert "e1000e: Fix possible HW unit hang after an s0ix exit"
    63aa107bce83 e1000e: Enable GPT clock before sending message to CSME
    98d81b2b154d nvme: fix block device naming collision
    321abf90c576 nvme: check for duplicate identifiers earlier
    dbedad96f416 scsi: ufs: core: Drop loglevel of WriteBoost message
    04ae8518745c scsi: megaraid: Clear READ queue map's nr_queues
    c7720f23bb93 drm/amd/display: Ignore First MST Sideband Message Return Error
    8bae037b0fb4 drm/amdgpu/display: add quirk handling for stutter mode
    e980e1d978e0 drm/amd/display: Fork thread to offload work of hpd_rx_irq
    54740bc4b182 drm/amd/display: Add option to defer works of hpd_rx_irq
    734d5ce02cb0 drm/amd/display: Support for DMUB HPD interrupt handling
    d1e0bbe08171 tcp: Fix data-races around sysctl_tcp_ecn.
    9cb4959493cd sysctl: move some boundary constants from sysctl.c to sysctl_vals
    e2b6c5f7ee95 mm/pagealloc: sysctl: change watermark_scale_factor max limit to 30%
    d2dba226acb9 net: tun: split run_ebpf_filter() and pskb_trim() into different "if statement"
    f52af853be7a ipv4/tcp: do not use per netns ctl sockets
    da3c256e2d0e perf/core: Fix data race between perf_event_set_output() and perf_mmap_close()
    44016a85419c pinctrl: ralink: Check for null return of devm_kcalloc
    e4e3187750f8 pinctrl: ralink: rename pinctrl-rt2880 to pinctrl-ralink
    d40def7cd05c pinctrl: ralink: rename MT7628(an) functions to MT76X8
    a4c5115140ed RDMA/irdma: Fix sleep from invalid context BUG
    03fd151bdff0 RDMA/irdma: Do not advertise 1GB page size for x722
    71ab83ac65e2 power/reset: arm-versatile: Fix refcount leak in versatile_reboot_probe
    c8e32bca0676 xfrm: xfrm_policy: fix a possible double xfrm_pols_put() in xfrm_bundle_lookup()
    1d3eeb199970 ip: Fix data-races around sysctl_ip_default_ttl.
    6bf450d92d0c r8152: fix a WOL issue
    44addae95ed7 xfs: prevent a WARN_ONCE() in xfs_ioc_attr_list()
    1da0b50ea071 xfs: fix perag reference leak on iteration race with growfs
    768bfde1cf3e xfs: terminate perag iteration reliably on agcount
    2991d51b42a3 xfs: rename the next_agno perag iteration variable
    4d6f22f6cc58 xfs: fold perag loop iteration logic into helper function
    67cb74213a52 xfs: fix maxlevels comparisons in the btree staging code
    cf719adb6fa9 mt76: mt7921: Fix the error handling path of mt7921_pci_probe()
    22b910a7a378 mt76: mt7921e: fix possible probe failure after reboot
    c3bcf1f959f6 mt76: mt7921: use physical addr to unify register access
    191c16f921ad Revert "mt76: mt7921e: fix possible probe failure after reboot"
    4666a6eb390c Revert "mt76: mt7921: Fix the error handling path of mt7921_pci_probe()"
    0cac1c84e1cc batman-adv: Use netif_rx_any_context() any.
    be56f007c414 serial: mvebu-uart: correctly report configured baudrate value
    92dcb50f7f09 PCI: hv: Fix interrupt mapping for multi-MSI
    2b77425d0ae4 PCI: hv: Reuse existing IRTE allocation in compose_msi_msg()
    35d24b115a40 PCI: hv: Fix hv_arch_irq_unmask() for multi-MSI
    5c676a214d63 PCI: hv: Fix multi-MSI to allow more than one MSI vector
    0791309aa0eb Revert "selftest/vm: verify mmap addr in mremap_test"
    cfd3a9be0ac4 Revert "selftest/vm: verify remap destination address in mremap_test"
    d7c4f9b8ed62 bus: mhi: host: pci_generic: add Telit FN990
    38b7bbe0ef1d bus: mhi: host: pci_generic: add Telit FN980 v1 hardware revision
    60e536b0a564 drm/ttm: fix locking in vmap/vunmap TTM GEM helpers
    0e66932a9dc9 lockdown: Fix kexec lockdown bypass with ima policy
    25ba5b824a72 mlxsw: spectrum_router: Fix IPv4 nexthop gateway indication
    73846553bcde riscv: add as-options for modules with assembly compontents
    aff42cea285f pinctrl: stm32: fix optional IRQ support to gpios
    a9e2d8e52e1c Linux 5.15.57
    b4296a7b863f x86: Use -mindirect-branch-cs-prefix for RETPOLINE builds
    06741ef8e7cc um: Add missing apply_returns()
    320fc994f0c8 x86/bugs: Remove apostrophe typo
    ac8edadc2b1e tools headers cpufeatures: Sync with the kernel sources
    1dd6c13b437c tools arch x86: Sync the msr-index.h copy with the kernel sources
    5f4e77cc9abf KVM: emulate: do not adjust size of fastop and setcc subroutines
    198685e58b13 x86/kvm: fix FASTOP_SIZE when return thunks are enabled
    554cf28b104d efi/x86: use naked RET on mixed mode call wrapper
    d0caa861a836 x86/speculation: Use DECLARE_PER_CPU for x86_spec_ctrl_current
    67040d1d922b x86/asm/32: Fix ANNOTATE_UNRET_SAFE use on 32-bit
    96907c5d3927 x86/xen: Fix initialisation in hypercall_page after rethunk
    86ccf19a91be x86/static_call: Serialize __static_call_fixup() properly
    73ad137d1146 x86/speculation: Disable RRSBA behavior
    db0128b8243f x86/kexec: Disable RET on kexec
    3653093b7bbf x86/bugs: Do not enable IBPB-on-entry when IBPB is not supported
    925340f99bdf x86/entry: Move PUSH_AND_CLEAR_REGS() back into error_entry
    2f8967e22322 x86/bugs: Add Cannon lake to RETBleed affected CPU list
    cc3011cdbe5f x86/retbleed: Add fine grained Kconfig knobs
    12a13570054f x86/cpu/amd: Enumerate BTC_NO
    d7a5c08b46b6 x86/common: Stamp out the stepping madness
    8d5cff499a6d x86/speculation: Fill RSB on vmexit for IBRS
    4207d7b645b8 KVM: VMX: Fix IBRS handling after vmexit
    0cbd5905c8f3 KVM: VMX: Prevent guest RSB poisoning attacks with eIBRS
    5fde25284dfe KVM: VMX: Convert launched argument to flags
    852fe53040b9 KVM: VMX: Flatten __vmx_vcpu_run()
    c590fa2d2dac objtool: Re-add UNWIND_HINT_{SAVE_RESTORE}
    66b37dccbc25 x86/speculation: Remove x86_spec_ctrl_mask
    b55663e7521f x86/speculation: Use cached host SPEC_CTRL value for guest entry/exit
    2069bd0e6f5b x86/speculation: Fix SPEC_CTRL write on SMT state change
    e898e28762f8 x86/speculation: Fix firmware entry SPEC_CTRL handling
    d427c1f83e8c x86/speculation: Fix RSB filling with CONFIG_RETPOLINE=n
    75d4fc2e965f x86/cpu/amd: Add Spectral Chicken
    dab72c3c32cc objtool: Add entry UNRET validation
    469d9b157017 x86/bugs: Do IBPB fallback check only once
    fd17a4254965 x86/bugs: Add retbleed=ibpb
    8894f699f187 x86/xen: Add UNTRAIN_RET
    87e6270183a4 x86/xen: Rename SYS* entry points
    e894b7817e08 objtool: Update Retpoline validation
    a1d912d7ac04 intel_idle: Disable IBRS during long idle
    e51769df6228 x86/bugs: Report Intel retbleed vulnerability
    b9349805e653 x86/bugs: Split spectre_v2_select_mitigation() and spectre_v2_user_select_mitigation()
    347d0bf6b0c0 x86/speculation: Add spectre_v2=ibrs option to support Kernel IBRS
    e03415eeba78 x86/bugs: Optimize SPEC_CTRL MSR writes
    62b4db57eefe x86/entry: Add kernel IBRS implementation
    fac1b0007cec x86/bugs: Keep a per-CPU IA32_SPEC_CTRL value
    b4e05ea71eda x86/bugs: Enable STIBP for JMP2RET
    89eba42632fc x86/bugs: Add AMD retbleed= boot parameter
    82e92fe936db x86/bugs: Report AMD retbleed vulnerability
    a9c0926fc754 x86: Add magic AMD return-thunk
    07f5c5e36236 objtool: Treat .text.__x86.* as noinstr
    1f068f9da743 x86/entry: Avoid very early RET
    1d61a2988612 x86: Use return-thunk in asm code
    6c45176bc2ae x86/sev: Avoid using __x86_return_thunk
    f3d9f990586c x86/vsyscall_emu/64: Don't use RET in vsyscall emulation
    5b43965d58ef x86/kvm: Fix SETcc emulation for return thunks
    0bfe8be824aa x86/bpf: Use alternative RET encoding
    e54fcb0812fa x86/ftrace: Use alternative RET encoding
    c1c80aabc7b9 x86,static_call: Use alternative RET encoding
    b0fb9784cf80 objtool: skip non-text sections when adding return-thunk sites
    1920e4be8a97 x86,objtool: Create .return_sites
    7bf553d9eebd x86: Undo return-thunk damage
    023a2b07d5c3 x86/retpoline: Use -mfunction-return
    bb81f3ac69f8 x86/retpoline: Swizzle retpoline thunk
    545b45c36a2f x86/retpoline: Cleanup some #ifdefery
    eee4f31fa2eb x86/cpufeatures: Move RETPOLINE flags to word 11
    ccb25d7db1a2 x86/kvm/vmx: Make noinstr clean
    2cd972ae337f x86/realmode: build with -D__DISABLE_EXPORTS
    6834878ace6e x86/entry: Remove skip_r11rcx
    40265bcd1bd3 objtool: Default ignore INT3 for unreachable
    32b2cd6060e7 bpf,x86: Respect X86_FEATURE_RETPOLINE*
    74b5a9f8edfe bpf,x86: Simplify computing label offsets
    1c2e7b40752a x86/alternative: Add debug prints to apply_retpolines()
    b93a0a740bca x86/alternative: Try inline spectre_v2=retpoline,amd
    a40925e2efd8 x86/alternative: Handle Jcc __x86_indirect_thunk_\reg
    86900f95fb06 x86/alternative: Implement .retpoline_sites support
    936c8fcb4995 x86/retpoline: Create a retpoline thunk array
    90ca76c83044 x86/retpoline: Move the retpoline thunk declarations to nospec-branch.h
    6a6fcb256301 x86/asm: Fixup odd GEN-for-each-reg.h usage
    71e578e1bd74 x86/asm: Fix register order
    18576e45b12a x86/retpoline: Remove unused replacement symbols
    655d4097039c objtool: Introduce CFI hash
    503882b5aeb6 objtool,x86: Replace alternatives with .retpoline_sites
    cad0e43a8c30 objtool: Shrink struct instruction
    c9fd00d8e622 objtool: Explicitly avoid self modifying code in .altinstr_replacement
    29e6b52efca1 objtool: Classify symbols
    1fd333eb3377 x86/entry: Don't call error_entry() for XENPV
    cac414684be9 x86/entry: Move PUSH_AND_CLEAR_REGS out of error_entry()
    19ac6c99a17e x86/entry: Switch the stack after error_entry() returns
    01bc8bd64c19 x86/traps: Use pt_regs directly in fixup_bad_iret()
    760adb59f621 Linux 5.15.56
    31f351eb534e drm/aperture: Run fbdev removal before internal helpers
    eac7fd3ca397 x86/pat: Fix x86_has_pat_wp()
    190ce5cdc55d serial: 8250: Fix PM usage_count for console handover
    2db3b95166f7 serial: pl011: UPSTAT_AUTORTS requires .throttle/unthrottle
    8ef116a2a738 serial: stm32: Clear prev values before setting RTS delays
    10b27fa2d67c serial: 8250: fix return error code in serial8250_request_std_resource()
    57964a571025 vt: fix memory overlapping when deleting chars in the buffer
    8b07c2998720 tty: serial: samsung_tty: set dma burst_size to 1
    3cb692555a0b usb: dwc3: gadget: Fix event pending check
    ea42ef3ef678 usb: typec: add missing uevent when partner support PD
    aa96257867c0 USB: serial: ftdi_sio: add Belimo device ids
    ec0c62a23c50 signal handling: don't use BUG_ON() for debugging
    c01793517d8d nvme-pci: phison e16 has bogus namespace ids
    15ef4d686a58 ALSA: usb-audio: Add quirk for Fiero SC-01 (fw v1.0.0)
    df982f9d094d ALSA: usb-audio: Add quirk for Fiero SC-01
    9d90a21f0cb7 ALSA: usb-audio: Add quirks for MacroSilicon MS2100/MS2106 devices
    2483ba7afa59 Revert "can: xilinx_can: Limit CANFD brp to 2"
    bd87cf2ed609 ARM: dts: stm32: use the correct clock source for CEC on stm32mp151
    c0cba036bfe8 soc: ixp4xx/npe: Fix unused match warning
    26bb7afc027c x86: Clear .brk area at early boot
    ee1da3d59674 irqchip: or1k-pic: Undefine mask_ack for level triggered hardware
    9c9869c308a3 ASoC: madera: Fix event generation for rate controls
    66cc34f2e493 ASoC: madera: Fix event generation for OUT1 demux
    74ead64cbf0d ASoC: cs47l15: Fix event generation for low power mux control
    ab2f5e5f3ce1 ASoC: dapm: Initialise kcontrol data for mux/demux controls
    269be8b29073 ASoC: rt711-sdca: fix kernel NULL pointer dereference when IO error
    44975751bef0 ASoC: wm5110: Fix DRE control
    bc9067062600 ASoC: Intel: bytcr_wm5102: Fix GPIO related probe-ordering problem
    dd70da2a5816 ASoC: wcd938x: Fix event generation for some controls
    05708fb473ce ASoC: SOF: Intel: hda-loader: Clarify the cl_dsp_init() flow
    e71d0e1370b1 ASoC: codecs: rt700/rt711/rt711-sdca: initialize workqueues in probe
    07a606e1389a ASoC: rt7*-sdw: harden jack_detect_handler
    b054614dd3fd ASoC: rt711: fix calibrate mutex initialization
    f2556ce6b35a ASoC: Intel: sof_sdw: handle errors on card registration
    42664a97f2b5 ASoC: rt711-sdca-sdw: fix calibrate mutex initialization
    4e81b38d9426 ASoC: Realtek/Maxim SoundWire codecs: disable pm_runtime on remove
    3cb392b64304 pinctrl: aspeed: Fix potential NULL dereference in aspeed_pinmux_set_mux()
    0c6c7d57ed00 ASoC: ops: Fix off by one in range control validation
    204543581a2f net: sfp: fix memory leak in sfp_probe()
    7a2294c5f2e5 nvme: fix regression when disconnect a recovering ctrl
    1e4427aa2fc8 nvme-tcp: always fail a request when sending it failed
    8ab067462e09 NFC: nxp-nci: don't print header length mismatch on i2c error
    833ecd0eae76 net: tipc: fix possible refcount leak in tipc_sk_create()
    13d28e0c79cb fbdev: Disable sysfb device registration when removing conflicting FBs
    b952569e0316 firmware: sysfb: Add sysfb_disable() helper function
    2ef4c6d66f7d firmware: sysfb: Make sysfb_create_simplefb() return a pdev pointer
    f57c76104c74 platform/x86: hp-wmi: Ignore Sanitization Mode event
    57289b6601fe cpufreq: pmac32-cpufreq: Fix refcount leak bug
    06f818de1621 scsi: hisi_sas: Limit max hw sectors for v3 HW
    03a400a64050 netfilter: br_netfilter: do not skip all hooks with 0 priority
    bf5307924563 virtio_mmio: Restore guest page size on resume
    26d824d1316f virtio_mmio: Add missing PM calls to freeze/restore
    65d7a723fdda vduse: Tie vduse mgmtdev and its device
    b34dbeb2b0ec vdpa/mlx5: Initialize CVQ vringh only once
    10f2cd373e65 powerpc/xive/spapr: correct bitmap allocation size
    4e69750549b8 ksmbd: use SOCK_NONBLOCK type for kernel_accept()
    d300ced12889 btrfs: zoned: fix a leaked bioc in read_zone_info
    d2faf8ed1dc2 btrfs: rename btrfs_bio to btrfs_io_context
    a06248fa62ef mm: sysctl: fix missing numa_stat when !CONFIG_HUGETLB_PAGE
    204d12228697 ACPI: video: Fix acpi_video_handles_brightness_key_presses()
    724ec407f997 net/tls: Check for errors in tls_device_init
    a0706d7c1429 KVM: x86: Fully initialize 'struct kvm_lapic_irq' in kvm_pv_kick_cpu_op()
    58c90993933e net: atlantic: remove aq_nic_deinit() when resume
    9b1cb795a7ab net: atlantic: remove deep parameter on suspend/resume functions
    68e5f32f0de9 sfc: fix kernel panic when creating VF
    2d84fcb6e6f7 seg6: bpf: fix skb checksum in bpf_push_seg6_encap()
    15e8b6274c49 seg6: fix skb checksum in SRv6 End.B6 and End.B6.Encaps behaviors
    859081fb60e6 seg6: fix skb checksum evaluation in SRH encapsulation/insertion
    5464c8987ddf ceph: switch netfs read ops to use rreq->inode instead of rreq->mapping->host
    58d93e9d160c sfc: fix use after free when disabling sriov
    8c37e7a2000d drm/amd/pm: Prevent divide by zero
    cded1186f7e9 drm/amd/display: Only use depth 36 bpp linebuffers on DCN display engines.
    601ae26aa280 ima: Fix potential memory leak in ima_init_crypto()
    2340428c90d4 ima: force signature verification when CONFIG_KEXEC_SIG is configured
    f4bd3202a2b4 net: stmmac: fix leaks in probe
    4225a78eb4d7 net: ftgmac100: Hold reference returned by of_get_child_by_name()
    0d17723afea3 nexthop: Fix data-races around nexthop_compat_mode.
    6b26fb2fe227 ipv4: Fix data-races around sysctl_ip_dynaddr.
    8bcf7339f2cf tcp: Fix a data-race around sysctl_tcp_ecn_fallback.
    46e9c46203fd raw: Fix a data-race around sysctl_raw_l3mdev_accept.
    8d7a13654a98 icmp: Fix a data-race around sysctl_icmp_ratemask.
    7c1b6e453481 icmp: Fix a data-race around sysctl_icmp_ratelimit.
    de9490c32bc1 icmp: Fix a data-race around sysctl_icmp_errors_use_inbound_ifaddr.
    44021c2929cf icmp: Fix a data-race around sysctl_icmp_ignore_bogus_error_responses.
    cce955efa0ab icmp: Fix data-races around sysctl_icmp_echo_enable_probe.
    a716a3846c5f sysctl: Fix data-races in proc_dointvec_ms_jiffies().
    e58b02e44546 sysctl: Fix data-races in proc_dou8vec_minmax().
    3852f048be60 bnxt_en: Fix bnxt_refclk_read()
    0260a9aa5d5c bnxt_en: Fix bnxt_reinit_after_abort() code path
    a6cecaf058c4 drm/i915: Require the vm mutex for i915_vma_bind()
    60d1bb301ea5 drm/i915/uc: correctly track uc_fw init failure
    86062ca5edf1 drm/i915/gt: Serialize TLB invalidates with GT resets
    0ee5874dad61 drm/i915/gt: Serialize GRDOM access between multiple engine resets
    f8ba02531476 drm/i915/dg2: Add Wa_22011100796
    40c12fc52023 drm/i915/selftests: fix a couple IS_ERR() vs NULL tests
    af515a633942 tracing: Fix sleeping while atomic in kdb ftdump
    62a6a708f392 lockd: fix nlm_close_files
    9c3eef773cf4 lockd: set fl_owner when unlocking files
    1e92426e2b3a xen/gntdev: Ignore failure to unmap INVALID_GRANT_HANDLE
    f6e3ced9c60f drm/i915/gvt: IS_ERR() vs NULL bug in intel_gvt_update_reg_whitelist()
    5a4bb158f4c6 netfilter: nf_tables: replace BUG_ON by element length check
    b97aa619a3cb netfilter: nf_log: incorrect offset to network header
    dc2ec80bc949 arm64: dts: broadcom: bcm4908: Fix cpu node for smp boot
    1d49665a93b1 arm64: dts: broadcom: bcm4908: Fix timer node for BCM4906 SoC
    f0ccff1c89ba ARM: dts: sunxi: Fix SPI NOR campatible on Orange Pi Zero
    c0dd77cede0a ARM: dts: at91: sama5d2: Fix typo in i2s1 node
    9be8aac91960 ipv4: Fix a data-race around sysctl_fib_sync_mem.
    e2828e8c6058 icmp: Fix data-races around sysctl.
    07b0caf8aeb9 cipso: Fix data-races around sysctl.
    a5796154b56f net: Fix data-races around sysctl_mem.
    82d07170290d inetpeer: Fix data-races around sysctl.
    2dfff4b607c4 tcp: Fix a data-race around sysctl_tcp_max_orphans.
    67623d290d45 sysctl: Fix data races in proc_dointvec_jiffies().
    dcdf3c3c587a sysctl: Fix data races in proc_doulongvec_minmax().
    40e0477a7371 sysctl: Fix data races in proc_douintvec_minmax().
    32d7f8da8244 sysctl: Fix data races in proc_dointvec_minmax().
    d335db59f7fb sysctl: Fix data races in proc_douintvec().
    279bf2a909e6 sysctl: Fix data races in proc_dointvec().
    ad3014b0f6b2 net: ethernet: ti: am65-cpsw: Fix devlink port register sequence
    d5c315a78765 net: stmmac: dwc-qos: Disable split header for Tegra194
    750a5e2e5368 ASoC: Intel: Skylake: Correct the handling of fmt_config flexible array
    0d083ea282e5 ASoC: Intel: Skylake: Correct the ssp rate discovery in skl_get_ssp_clks()
    dfe3ce23217c ASoC: tas2764: Fix amp gain register offset & default
    a92e7564c540 ASoC: tas2764: Correct playback volume range
    1230d3e4b884 ASoC: tas2764: Fix and extend FSYNC polarity handling
    7dc0ae04c04e ASoC: tas2764: Add post reset delays
    9b9773cc55d8 ASoC: sgtl5000: Fix noise on shutdown/remove
    c8d5d8194093 ima: Fix a potential integer overflow in ima_appraise_measurement
    505114dda5bb drm/i915: fix a possible refcount leak in intel_dp_add_mst_connector()
    c6e1c5c0c19d net/mlx5e: Ring the TX doorbell on DMA errors
    663a06e96203 net/mlx5e: Fix capability check for updating vnic env counters
    3a5e734ec002 net/mlx5e: Fix enabling sriov while tc nic rules are offloaded
    5adcc5ded58a net/mlx5e: kTLS, Fix build time constant test in RX
    2ee2ef846fa3 net/mlx5e: kTLS, Fix build time constant test in TX
    ba27a912f99e ARM: 9210/1: Mark the FDT_FIXED sections as shareable
    443838e6ff0f ARM: 9209/1: Spectre-BHB: avoid pr_info() every time a CPU comes out of idle
    2bcb2e42a500 spi: amd: Limit max transfer and message size
    28ad09b0d7b1 ARM: dts: imx6qdl-ts7970: Fix ngpio typo and count
    3bbe6437c1d5 reset: Fix devm bulk optional exclusive control getter
    d8124f111b67 xfs: drop async cache flushes from CIL commits.
    d4dab8b405c6 xfs: run callbacks before waking waiters in xlog_state_shutdown_callbacks
    88beb994eae1 xfs: don't include bnobt blocks when reserving free block pool
    ea22fcd0324d xfs: only run COW extent recovery when there are no live extents
    fb593531571c Revert "evm: Fix memleak in init_desc"
    d69f9ff4c8ab sh: convert nommu io{re,un}map() to static inline functions
    bb676a80c6eb nilfs2: fix incorrect masking of permission flags for symlinks
    ca58387e7ad1 fs/remap: constrain dedupe of EOF blocks
    1807d8867402 drm/panfrost: Fix shrinker list corruption by madvise IOCTL
    fbe7451a3ada drm/panfrost: Put mapping instead of shmem obj on panfrost_mmu_map_fault_addr() error
    531a140e269d btrfs: return -EAGAIN for NOWAIT dio reads/writes on compressed and inline extents
    54aee4e5ce8c cgroup: Use separate src/dst nodes when preloading css_sets for migration
    5a9df3101799 wifi: mac80211: fix queue selection for mesh/OCB interfaces
    2a098504d7a0 ARM: 9214/1: alignment: advance IT state after emulating Thumb instruction
    a4f5e3a22fbd ARM: 9213/1: Print message about disabled Spectre workarounds only once
    6f497564bf6a ip: fix dflt addr selection for connected nexthop
    1eb4bea3af81 net: sock: tracing: Fix sock_exceed_buf_limit not to dereference stale pointer
    22eeff55679d tracing/histograms: Fix memory leak problem
    e4967d22882b mm: split huge PUD on wp_huge_pud fallback
    27056f20d753 mm: userfaultfd: fix UFFDIO_CONTINUE on fallocated shmem pages
    b856e5738b1c fix race between exit_itimers() and /proc/pid/timers
    b99174ac57fe xen/netback: avoid entering xenvif_rx_next_skb() with an empty rx queue
    9d3243d774f5 ALSA: hda/realtek - Enable the headset-mic on a Xiaomi's laptop
    cd2731b3efe8 ALSA: hda/realtek - Fix headset mic problem for a HP machine with alc221
    dd9746cf6da3 ALSA: hda/realtek: fix mute/micmute LEDs for HP machines
    7d0c5005c580 ALSA: hda/realtek - Fix headset mic problem for a HP machine with alc671
    32fad77c4cd2 ALSA: hda/realtek: Fix headset mic for Acer SF313-51
    6744faa1d810 ALSA: hda/conexant: Apply quirk for another HP ProDesk 600 G3 model
    d60bb64d3263 ALSA: hda - Add fixup for Dell Latitidue E5430
    baefa2315cb1 Linux 5.15.55
    c80b15105a08 Revert "mtd: rawnand: gpmi: Fix setting busy timeout setting"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto_5.15.bbappend        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
index e4a08cfe03..b9d4a4df1e 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
@@ -9,8 +9,8 @@ KMACHINE:beaglebone-yocto ?= "beaglebone"
 
 SRCREV_machine:genericx86 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
 SRCREV_machine:genericx86-64 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:edgerouter ?= "90f1ee6589264545f548d731c2480b08a007230f"
-SRCREV_machine:beaglebone-yocto ?= "9aabbaa89fcb21af7028e814c1f5b61171314d5a"
+SRCREV_machine:edgerouter ?= "7d45a6cb45c174d33daf3c2af544861a6c1ece53"
+SRCREV_machine:beaglebone-yocto ?= "d3780eabef136a2129ee69249512abd0d69ccd04"
 
 COMPATIBLE_MACHINE:genericx86 = "genericx86"
 COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
@@ -19,5 +19,5 @@ COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
 
 LINUX_VERSION:genericx86 = "5.15.78"
 LINUX_VERSION:genericx86-64 = "5.15.78"
-LINUX_VERSION:edgerouter = "5.15.54"
-LINUX_VERSION:beaglebone-yocto = "5.15.54"
+LINUX_VERSION:edgerouter = "5.15.78"
+LINUX_VERSION:beaglebone-yocto = "5.15.78"
-- 
2.37.3


