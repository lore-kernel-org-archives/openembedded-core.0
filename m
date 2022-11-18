Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4999DC4321E
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 22:29:22 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.7260.1668810556029645843
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 14:29:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J+XLHvP0;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id w9so4057415qtv.13
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 14:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPwb2KjybB8O4t9sD38btk4A/4Hs6MBuOlxvzvQEopM=;
        b=J+XLHvP0LIz/x1yXE/Eymh75/uqrGNwG6MX1UOQ1L1Gsrn90aKigEYkjCk8UHEkroN
         WuskODyZ6lVISdFg+UqCrxOzdtXm1RQsT6Tt5UVyhtwop0OF9t9DtiMkyrfQn/NmhJoH
         ChBCzoXqcC7pseaivMC56ii+WfClv8SsP3qsyelmaQcjQfRvc+L8kvFvveQ8oesL1ZsT
         JbpLKuUqCmzzwZhguVI1VdbWhRUaQoNkRTCA2LK8dVC/QuOoRFCEXwRmnsf0dIMiFOrd
         9NbTRrn0VJWevm3QkQoYCdwGh/f3URPd8M+oO3AFg7iL4XuMYf3DYKgFql3NmtnXSPkn
         mdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPwb2KjybB8O4t9sD38btk4A/4Hs6MBuOlxvzvQEopM=;
        b=Jhz1/OHNj9X3WVRzEGwDMjz6dFnsj2sdcVpGbteMavZgRWhR3ZJ0DnalI4IWt0LdCg
         any9eejacHumquO2HwUVU4E8PceksVqa/e/LeJzQr4wDMZj6cDrIatR687k9k1tHC1VS
         3rigd8Ysg6t0H1K+JMRxuTSfYJ8RGybHYFUM3u+TPruicP+Y7PLQU3GITZN2ZeUPaXLK
         6GeiGrcTmk5ah2cCoVs4QrhC+pqvrxo863spMF+Vm6yvUd0y3fjoNXQXd9vzIunoQ+En
         iTXt4fkrcZiGN2Fd2VnO2aiuFdaJn5fRYNUptYFZB+Wc3yoG+qE3H8JJRgBKzzNAjUQb
         t07g==
X-Gm-Message-State: ANoB5plyspAvEFsY2qdcN3w32W7VitBZ5dNOy8d10LLFEragWfuLn8Vx
	pwaae2YyQ+h7e37diH2EPymsc6eLSKaB4Q==
X-Google-Smtp-Source: AA0mqf5hl+BvrHdqeM/R3xxPN9MPYtAgRYIwQtIjnGwV1wtp9qqfzDHJbmUsfyElIeWicQwtB0FH6A==
X-Received: by 2002:a05:622a:1496:b0:3a5:7eb0:4962 with SMTP id t22-20020a05622a149600b003a57eb04962mr8471911qtx.525.1668810554816;
        Fri, 18 Nov 2022 14:29:14 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id h9-20020a05620a284900b006f9ddaaf01esm3304068qkp.102.2022.11.18.14.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:29:14 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/15] linux-yocto/5.15: update to v5.15.78
Date: Fri, 18 Nov 2022 17:28:56 -0500
Message-Id: <9c8ac06cbac5cb17c85b169cbb93405d27d0d4f9.1668810409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668810409.git.bruce.ashfield@gmail.com>
References: <cover.1668810409.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 22:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173506

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

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

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 215a14c826..f80cabe55d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8cd14c788563009eeb88f1c5ffb0c0d8bad59943"
-SRCREV_meta ?= "a120c990509eccdaa613b264a4f6c187277548df"
+SRCREV_machine ?= "a0d36398b257c555381e735cd721cd8479d6762d"
+SRCREV_meta ?= "5ca1021282e796e2427f8c7769af524c433fb39d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.76"
+LINUX_VERSION ?= "5.15.78"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index bbbca44b76..c09f51ce61 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.76"
+LINUX_VERSION ?= "5.15.78"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f7afe3f65c15cc4d211ab30bc981493fd5b7d3a0"
-SRCREV_meta ?= "a120c990509eccdaa613b264a4f6c187277548df"
+SRCREV_machine ?= "1c3448ff6cc6d24d16c6ef6065cb642245cac627"
+SRCREV_meta ?= "5ca1021282e796e2427f8c7769af524c433fb39d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index f542b3cb11..710accc9e2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d7819ee61a286d4271fbb9aa8881ec6e70cdbe11"
-SRCREV_machine:qemuarm64 ?= "38180346106d8eb46aca94bf01228fc75d4b70fa"
-SRCREV_machine:qemumips ?= "d774a943b853ed0047169ce6d71249a0f8b77307"
-SRCREV_machine:qemuppc ?= "527f0c70315df84882792510ebf2e778c5980266"
-SRCREV_machine:qemuriscv64 ?= "d2f773f779186759d9b9a6c403fd8d533a0bff6c"
-SRCREV_machine:qemuriscv32 ?= "d2f773f779186759d9b9a6c403fd8d533a0bff6c"
-SRCREV_machine:qemux86 ?= "d2f773f779186759d9b9a6c403fd8d533a0bff6c"
-SRCREV_machine:qemux86-64 ?= "d2f773f779186759d9b9a6c403fd8d533a0bff6c"
-SRCREV_machine:qemumips64 ?= "980c0d78ca192b2d0e63753ff6c5daba7b9e37de"
-SRCREV_machine ?= "d2f773f779186759d9b9a6c403fd8d533a0bff6c"
-SRCREV_meta ?= "a120c990509eccdaa613b264a4f6c187277548df"
+SRCREV_machine:qemuarm ?= "d3aa5916b2b02966ef37bfe3fc527c99754571ec"
+SRCREV_machine:qemuarm64 ?= "a1d364fbe3d8a916426a107f07b89fd0338923c7"
+SRCREV_machine:qemumips ?= "904de7b55a7e8edf4cd894fb0558efee799a314a"
+SRCREV_machine:qemuppc ?= "35d547b91124bef128a13402190ca05f54a2392e"
+SRCREV_machine:qemuriscv64 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
+SRCREV_machine:qemuriscv32 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
+SRCREV_machine:qemux86 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
+SRCREV_machine:qemux86-64 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
+SRCREV_machine:qemumips64 ?= "ae8ab2e3acaf9e14cd75a6c96f1ba43c66a1babd"
+SRCREV_machine ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
+SRCREV_meta ?= "5ca1021282e796e2427f8c7769af524c433fb39d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4f5365f77018349d64386b202b37e8b737236556"
+SRCREV_machine:class-devupstream ?= "509a32764e1a5692935c4f26ed96fbe94c480186"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.76"
+LINUX_VERSION ?= "5.15.78"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


