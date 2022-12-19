Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE7CC10F1B
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 17:44:47 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web10.28832.1671471884771470611
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 09:44:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VwqJKzWC;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id k11so9467067vsr.4
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 09:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A80nQG4UrwhlV5BRDXk3MjBce/XiH461Qx/EjjZRDyI=;
        b=VwqJKzWCk6fZMn/kTqJG8jbk3c737+WRoDlLN8deL9h/d1QeVyQRabT2LUsfOzI02E
         n8tcS/+wcFk8dAchO7GbS6yZwA1nOKS8xgmzTX8j1vgyxnRajSpZSsRCAWbo9+ZRBPGw
         KDaG1KVff9FLx4zMYkrX+Ig9velUj6G7gVecsUhhBUi+4j6V0zoCnWnCzhusiaS8ZZx8
         nbvF0Y5gKQgDcT2EdMXOVOp9WUbmHvkyokXRyD1BBl9wB4hqFCrBK+G7HmOGex5EReQE
         K2+phzTy+98KKLeTpO8iBmM0dN8NX3lsbrBEJTmLHtKcqm4KNtP+6R/JRIGoVSo8AMP+
         YqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A80nQG4UrwhlV5BRDXk3MjBce/XiH461Qx/EjjZRDyI=;
        b=b4UCm4M4oiqgiqSrTqoot1qT/vNj/pCCNoZPK6VYsUBAYe+TpU0AOo4AojyqtvO0AS
         E0sQYKUlpBG+w+7wra/rYExaQpZ/iSls17Zg/V32qYoGIRAAhX7Pp8lWwBQLtrcTm09W
         QBcX7TE4BspIWl6WioNi8+OKlE7LZnxV6yet+b/TSshswBoCD520J6k8skrUx3euU4oQ
         r8P0+BGp+jU5kkhPwLdBTIsjCD8UDoCrsL5H1b817YJYIE8Ex+miWWm++8CNSQ0AnJcl
         nLyUiSlg1fMSZ3Bje5Mo1xfsF6V7KMNKbeJp+y3Mu7LCKwsZ7UiGKhH45fYU7dMqMxdb
         TVVQ==
X-Gm-Message-State: ANoB5pniw/Jv8B7G4SofMyBumqWfJDxVLALicNS6MFdrS0tSSwv2mBso
	aAlP3jvCJ63z39Gr2MZpcrp8NHwm6YA=
X-Google-Smtp-Source: AA0mqf7GuSDETbTAWw/GBJ3Xd9x9WXFxVkMoKKcygnCahiaQkcWYXyu11RyqUvhV1ahbjCHjWFKu6Q==
X-Received: by 2002:a67:d796:0:b0:3b1:fde0:8255 with SMTP id q22-20020a67d796000000b003b1fde08255mr26565060vsj.0.1671471883535;
        Mon, 19 Dec 2022 09:44:43 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id bn35-20020a05620a2ae300b006ce76811a07sm7268913qkb.75.2022.12.19.09.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 09:44:43 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3][kirkstone] linux-yocto/5.10: update to v5.10.154
Date: Mon, 19 Dec 2022 12:44:40 -0500
Message-Id: <20221219174441.64835-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20221219174441.64835-1-bruce.ashfield@gmail.com>
References: <20221219174441.64835-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 17:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174828

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    f5b40c0eb9ea Linux 5.10.154
    bf506e366da4 ipc: remove memcg accounting for sops objects in do_semtimedop()
    c6678c8f4f3f wifi: brcmfmac: Fix potential buffer overflow in brcmf_fweh_event_worker()
    a6c57adec567 drm/i915/sdvo: Setup DDC fully before output init
    b86830cc95af drm/i915/sdvo: Filter out invalid outputs more sensibly
    9f3b8678080a drm/rockchip: dsi: Force synchronous probe
    23f1fc7ce55f ext4,f2fs: fix readahead of verity data
    e5cef906cb40 KVM: x86: emulator: update the emulation mode after CR0 write
    ce9261accccd KVM: x86: emulator: introduce emulator_recalc_and_set_mode
    c8a2fd7a715d KVM: x86: emulator: em_sysexit should update ctxt->mode
    e0c7410378cd KVM: x86: Mask off reserved bits in CPUID.80000001H
    9302ebc1c21d KVM: x86: Mask off reserved bits in CPUID.80000008H
    cc40c5f3e921 KVM: x86: Mask off reserved bits in CPUID.8000001AH
    bd64a88f364c KVM: x86: Mask off reserved bits in CPUID.80000006H
    156451a67b93 ext4: fix BUG_ON() when directory entry has invalid rec_len
    5370b965b7a9 ext4: fix warning in 'ext4_da_release_space'
    c9598cf62953 parisc: Avoid printing the hardware path twice
    98f836e80d21 parisc: Export iosapic_serial_irq() symbol for serial port driver
    814af9a32b03 parisc: Make 8250_gsc driver dependend on CONFIG_PARISC
    29d106d086d2 perf/x86/intel: Add Cooper Lake stepping to isolation_ucodes[]
    98f6e7c33703 perf/x86/intel: Fix pebs event constraints for ICL
    3be2d66822a0 efi: random: Use 'ACPI reclaim' memory for random seed
    83294f7c7759 efi: random: reduce seed size to 32 bytes
    f8e8cda869fd fuse: add file_modified() to fallocate
    cdf01c807e97 capabilities: fix potential memleak on error path from vfs_getxattr_alloc()
    ff32d8a099dc tracing/histogram: Update document for KEYS_MAX size
    533bfacbacb8 tools/nolibc/string: Fix memcmp() implementation
    f100a0274861 kprobe: reverse kp->flags when arm_kprobe failed
    bef08acbe560 tracing: kprobe: Fix memory leak in test_gen_kprobe/kretprobe_cmd()
    2bf33b5ea46d tcp/udp: Make early_demux back namespacified.
    ea5f2fd4640e ftrace: Fix use-after-free for dynamic ftrace_ops
    06de93a47cec btrfs: fix type of parameter generation in btrfs_get_dentry
    e33ce54cef5d coresight: cti: Fix hang in cti_disable_hw()
    015ac18be7de binder: fix UAF of alloc->vma in race with munmap()
    836686e1a01d memcg: enable accounting of ipc resources
    e4e4b24b42e7 mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on program/erase times
    818c36b988b8 tcp/udp: Fix memory leak in ipv6_renew_options().
    29997a6fa60d fscrypt: fix keyring memory leak on mount failure
    391cceee6d43 fscrypt: stop using keyrings subsystem for fscrypt_master_key
    092401142b95 fscrypt: simplify master key locking
    54c13d3520ef ALSA: usb-audio: Add quirks for MacroSilicon MS2100/MS2106 devices
    a0e2577cf3cc block, bfq: protect 'bfqd->queued' by 'bfqd->lock'
    26ca2ac091b4 Bluetooth: L2CAP: Fix attempting to access uninitialized memory
    6b6f94fb9a74 Bluetooth: L2CAP: Fix accepting connection request for invalid SPSM
    bfd5e62f9a7e i2c: piix4: Fix adapter not be removed in piix4_remove()
    fc3e2fa0a5fb arm64: dts: juno: Add thermal critical trip points
    b743ecf29ca7 firmware: arm_scmi: Make Rx chan_setup fail on memory errors
    29e8e9bfc2f2 firmware: arm_scmi: Suppress the driver's bind attributes
    d7b1e2cbe0a4 ARM: dts: imx6qdl-gw59{10,13}: fix user pushbutton GPIO offset
    160d8904b2b5 efi/tpm: Pass correct address to memblock_reserve
    c40b4d604b3e i2c: xiic: Add platform module alias
    5bf8c7798b1c drm/amdgpu: set vm_update_mode=0 as default for Sienna Cichlid in SRIOV case
    496eb203d046 HID: saitek: add madcatz variant of MMO7 mouse device ID
    ff06067b7086 scsi: core: Restrict legal sdev_state transitions via sysfs
    9edf20e5a1d8 ACPI: APEI: Fix integer overflow in ghes_estatus_pool_init()
    be6e22f54623 media: meson: vdec: fix possible refcount leak in vdec_probe()
    c5fd54a65c35 media: dvb-frontends/drxk: initialize err to 0
    7fdc58d8c213 media: cros-ec-cec: limit msg.len to CEC_MAX_MSG_SIZE
    1609231f8676 media: s5p_cec: limit msg.len to CEC_MAX_MSG_SIZE
    c46759e3703b media: rkisp1: Zero v4l2_subdev_format fields in when validating links
    3144ce557440 media: rkisp1: Initialize color space on resizer sink and source pads
    6b24d9c2acda s390/boot: add secure boot trailer
    efc6420d65ae xhci-pci: Set runtime PM as default policy on all xHC 1.2 or later devices
    37bb57908dd3 mtd: parsers: bcm47xxpart: Fix halfblock reads
    85e458369c0f mtd: parsers: bcm47xxpart: print correct offset on read error
    ec54104febdc fbdev: stifb: Fall back to cfb_fillrect() on 32-bit HCRX cards
    f8c86d782952 video/fbdev/stifb: Implement the stifb_fillrect() function
    e975d7aecad7 mmc: sdhci-pci-core: Disable ES for ASUS BIOS on Jasper Lake
    afeae13b8a3c mmc: sdhci-pci: Avoid comma separated statements
    a06721767cfc mmc: sdhci-esdhc-imx: Propagate ESDHC_FLAG_HS400* only on 8bit bus
    59400c9b0d07 drm/msm/hdmi: fix IRQ lifetime
    8225bdaec5b0 drm/msm/hdmi: Remove spurious IRQF_ONESHOT flag
    5dbb47ee8976 ipv6: fix WARNING in ip6_route_net_exit_late()
    1c89642e7f2b net, neigh: Fix null-ptr-deref in neigh_table_clear()
    634f066d02bd net: mdio: fix undefined behavior in bit shift for __mdiobus_register
    d9ec6e2fbd4a Bluetooth: L2CAP: fix use-after-free in l2cap_conn_del()
    cb1c012099ef Bluetooth: L2CAP: Fix use-after-free caused by l2cap_reassemble_sdu
    0a0dead4ad1a btrfs: fix ulist leaks in error paths of qgroup self tests
    61e061281137 btrfs: fix inode list leak during backref walking at find_parent_nodes()
    a52e24c7fcc3 btrfs: fix inode list leak during backref walking at resolve_indirect_refs()
    81204283ea13 isdn: mISDN: netjet: fix wrong check of device registration
    e77d213843e6 mISDN: fix possible memory leak in mISDN_register_device()
    f06186e5271b rose: Fix NULL pointer dereference in rose_send_frame()
    2c8d81bdb268 ipvs: fix WARNING in ip_vs_app_net_cleanup()
    931f56d59c85 ipvs: fix WARNING in __ip_vs_cleanup_batch()
    d69328cdb92f ipvs: use explicitly signed chars
    b2d7a92aff0f netfilter: nf_tables: release flow rule object from commit path
    3583826b443a net: tun: fix bugs for oversize packet when napi frags enabled
    5960b9081bac net: sched: Fix use after free in red_enqueue()
    24f9c41435a8 ata: pata_legacy: fix pdc20230_set_piomode()
    c85ee1c3cbc6 net: fec: fix improper use of NETDEV_TX_BUSY
    52438e734c15 nfc: nfcmrvl: Fix potential memory leak in nfcmrvl_i2c_nci_send()
    0acfcd2aed4f nfc: s3fwrn5: Fix potential memory leak in s3fwrn5_nci_send()
    9ae2c9a91ff0 nfc: nxp-nci: Fix potential memory leak in nxp_nci_send()
    eecea068bf11 NFC: nxp-nci: remove unnecessary labels
    e8c11ee2d07f nfc: fdp: Fix potential memory leak in fdp_nci_send()
    31b83d6990c8 nfc: fdp: drop ftrace-like debugging messages
    4e1e4485b252 RDMA/qedr: clean up work queue on failure in qedr_alloc_resources()
    d360e875c011 RDMA/core: Fix null-ptr-deref in ib_core_cleanup()
    37a098fc9b42 net: dsa: Fix possible memory leaks in dsa_loop_init()
    45aea4fbf61e nfs4: Fix kmemleak when allocate slot failed
    f0f1c74fa670 NFSv4.1: We must always send RECLAIM_COMPLETE after a reboot
    10c554d72275 NFSv4.1: Handle RECLAIM_COMPLETE trunking errors
    4813dd737dc4 NFSv4: Fix a potential state reclaim deadlock
    7c4260f8f188 IB/hfi1: Correctly move list in sc_disable()
    87ac93c8dd6d RDMA/cma: Use output interface for net_dev check
    4dbb739eb29c KVM: x86: Add compat handler for KVM_X86_SET_MSR_FILTER
    bb584caee895 KVM: x86: Copy filter arg outside kvm_vm_ioctl_set_msr_filter()
    9faacf442d11 KVM: x86: Protect the unused bits in MSR exiting flags
    5bdbccc79c86 x86/topology: Fix duplicated core ID within a package
    6c31fc028a65 x86/topology: Fix multiple packages shown on a single-package system
    f5ad52da145a x86/topology: Set cpu_die_id only if DIE_TYPE found
    570fa3bcd2f9 KVM: x86: Treat #DBs from the emulator as fault-like (code and DR7.GD=1)
    e5d7c6786bef KVM: x86: Trace re-injected exceptions
    8364786152d5 KVM: nVMX: Don't propagate vmcs12's PERF_GLOBAL_CTRL settings to vmcs02
    523e1dd9f8d4 KVM: nVMX: Pull KVM L0's desired controls directly from vmcs01
    028fcabd8a67 serial: ar933x: Deassert Transmit Enable on ->rs485_config()
    e6da7808c955 serial: 8250: Let drivers request full 16550A feature probing
    95aa34f72132 Linux 5.10.153
    26a2b9c468de serial: Deassert Transmit Enable on probe in driver-specific way
    4a230f65d6a8 serial: core: move RS485 configuration tasks from drivers into core
    eb69c07eca22 can: rcar_canfd: rcar_canfd_handle_global_receive(): fix IRQ storm on global FIFO receive
    d5924531dd8a arm64/kexec: Test page size support with new TGRAN range values
    c911f03f8d44 arm64/mm: Fix __enable_mmu() for new TGRAN range values
    d523384766fd scsi: sd: Revert "scsi: sd: Remove a local variable"
    52a43b82006d arm64: Add AMPERE1 to the Spectre-BHB affected list
    9889ca7efa12 net: enetc: survive memory pressure without crashing
    fdba224ab028 net/mlx5: Fix crash during sync firmware reset
    bbcc06933f35 net/mlx5: Fix possible use-after-free in async command interface
    16376ba5cfd7 net/mlx5e: Do not increment ESN when updating IPsec ESN state
    0d88359092dd nh: fix scope used to find saddr when adding non gw nh
    3519b5ddac21 net: ehea: fix possible memory leak in ehea_register_port()
    79631daa5a51 openvswitch: switch from WARN to pr_warn
    00d6f33f6782 ALSA: aoa: Fix I2S device accounting
    ce6fd1c382a3 ALSA: aoa: i2sbus: fix possible memory leak in i2sbus_add_dev()
    97262705c0cb net: fec: limit register access on i.MX6UL
    df67a8e625fc PM: domains: Fix handling of unavailable/disabled idle states
    1f262d80882a net: ksz884x: fix missing pci_disable_device() on error in pcidev_init()
    6170b4579f36 i40e: Fix flow-type by setting GL_HASH_INSET registers
    9abae363af5c i40e: Fix VF hang when reset is triggered on another VF
    23d5599058a0 i40e: Fix ethtool rx-flow-hash setting for X722
    44affe7ede59 ipv6: ensure sane device mtu in tunnels
    905f05c0ab19 media: vivid: set num_in/outputs to 0 if not supported
    b6c7446d0a38 media: videodev2.h: V4L2_DV_BT_BLANKING_HEIGHT should check 'interlaced'
    683015ae1634 media: v4l2-dv-timings: add sanity checks for blanking values
    147b8f1892aa media: vivid: dev->bitmap_cap wasn't freed in all cases
    1cf51d51581c media: vivid: s_fbuf: add more sanity checks
    3221c2701d19 PM: hibernate: Allow hybrid sleep to work with s2idle
    0eb19ecbd0a9 can: mcp251x: mcp251x_can_probe(): add missing unregister_candev() in error path
    6b2d07fc0b0a can: mscan: mpc5xxx: mpc5xxx_can_probe(): add missing put_clock() in error path
    1634d5d39cfd tcp: fix indefinite deferral of RTO with SACK reneging
    4f23cb2be530 tcp: fix a signed-integer-overflow bug in tcp_add_backlog()
    49713d7c3858 tcp: minor optimization in tcp_add_backlog()
    aab883bd60bc net: lantiq_etop: don't free skb when returning NETDEV_TX_BUSY
    c3edc6e80820 net: fix UAF issue in nfqnl_nf_hook_drop() when ops_init() failed
    e2a28807b1ce kcm: annotate data-races around kcm->rx_wait
    c325f92d8d9b kcm: annotate data-races around kcm->rx_psock
    af7879529e5a atlantic: fix deadlock at aq_nic_stop
    d7ccd49c4dd9 amd-xgbe: add the bit rate quirk for Molex cables
    17350734fdca amd-xgbe: fix the SFP compliance codes check for DAC cables
    b55d6ea965ba x86/unwind/orc: Fix unreliable stack dump with gcov
    0ce1ef335300 net: hinic: fix the issue of double release MBOX callback of VF
    6603843c80b1 net: hinic: fix the issue of CMDQ memory leaks
    bb01910763f9 net: hinic: fix memory leak when reading function table
    ce605b68db53 net: hinic: fix incorrect assignment issue in hinic_set_interrupt_cfg()
    62f0a08e82a6 net: netsec: fix error handling in netsec_register_mdio()
    32a3d4660b34 tipc: fix a null-ptr-deref in tipc_topsrv_accept
    fb94152aae88 perf/x86/intel/lbr: Use setup_clear_cpu_cap() instead of clear_cpu_cap()
    bfce73088682 ALSA: ac97: fix possible memory leak in snd_ac97_dev_register()
    2663b16c76d0 ASoC: qcom: lpass-cpu: Mark HDMI TX parity register as volatile
    a52755729956 arc: iounmap() arg is volatile
    648ac633e764 ASoC: qcom: lpass-cpu: mark HDMI TX registers as volatile
    6571f6ca8a21 drm/msm: Fix return type of mdp4_lvds_connector_mode_valid
    4953a989b72d media: v4l2: Fix v4l2_i2c_subdev_set_name function documentation
    9d00384270b1 net: ieee802154: fix error return code in dgram_bind()
    568e3812b177 mm,hugetlb: take hugetlb_lock before decrementing h->resv_huge_pages
    935a8b620210 mm/memory: add non-anonymous page check in the copy_present_page()
    49db6cb81400 xen/gntdev: Prevent leaking grants
    a3f2cc11d6b6 Xen/gntdev: don't ignore kernel unmapping error
    467230b9ef40 s390/pci: add missing EX_TABLE entries to __pcistg_mio_inuser()/__pcilg_mio_inuser()
    fe187c801a44 s390/futex: add missing EX_TABLE entry to __futex_atomic_op()
    449070996ce6 perf auxtrace: Fix address filter symbol name match for modules
    6f72a3977ba9 kernfs: fix use-after-free in __kernfs_remove
    0bcd1ab3e8b3 counter: microchip-tcb-capture: Handle Signal1 read and Synapse
    8bf037279b58 mmc: core: Fix kernel panic when remove non-standard SDIO card
    5684808b269b mmc: sdhci_am654: 'select', not 'depends' REGMAP_MMIO
    b686ffc0acb8 drm/msm/dp: fix IRQ lifetime
    08c7375fa27a drm/msm/hdmi: fix memory corruption with too many bridges
    21c4679af01f drm/msm/dsi: fix memory corruption with too many bridges
    44a86d96fac8 scsi: qla2xxx: Use transport-defined speed mask for supported_speeds
    c368f751da8e mac802154: Fix LQI recording
    9ba2990f4e80 exec: Copy oldsighand->action under spin-lock
    706215300411 fs/binfmt_elf: Fix memory leak in load_elf_binary()
    d9ddfeb01fb9 fbdev: smscufx: Fix several use-after-free bugs
    f19f1a75d378 iio: temperature: ltc2983: allocate iio channels once
    af236da8552e iio: light: tsl2583: Fix module unloading
    90ff5bef2bc7 tools: iio: iio_utils: fix digit calculation
    678d2cc2041c xhci: Remove device endpoints from bandwidth list when freeing the device
    3b250824b6d3 xhci: Add quirk to reset host back to default state at shutdown
    63c7df3c818e mtd: rawnand: marvell: Use correct logic for nand-keep-config
    228101fc832f usb: xhci: add XHCI_SPURIOUS_SUCCESS to ASM1042 despite being a V0.96 controller
    2bc4f99ee243 usb: bdc: change state when port disconnected
    e440957f9c8b usb: dwc3: gadget: Don't set IMI for no_interrupt
    fb074d622ccc usb: dwc3: gadget: Stop processing more requests on IMI
    c29fcef5791d USB: add RESET_RESUME quirk for NVIDIA Jetson devices in RCM
    4cc7a360ec3b ALSA: rme9652: use explicitly signed char
    895909230008 ALSA: au88x0: use explicitly signed char
    2bf5b1631569 ALSA: Use del_timer_sync() before freeing timer
    ca1034bff85a can: kvaser_usb: Fix possible completions during init_completion
    370be31cde50 can: j1939: transport: j1939_session_skb_drop_old(): spin_unlock_irqrestore() before kfree_skb()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 62c494a868..c2f5df0878 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "899cf349eab4ac3020c6bad06f889e679509a1d2"
-SRCREV_meta ?= "dd90d836c062535cc2e8fff8c69959178215a552"
+SRCREV_machine ?= "200dde5f2bbc51223a23c3c9ae19b74a3792305c"
+SRCREV_meta ?= "71ac1dd35ef4f83a56462757380a83f501a5e1ad"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.152"
+LINUX_VERSION ?= "5.10.154"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index bbb645803c..d1bcc972ce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.152"
+LINUX_VERSION ?= "5.10.154"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "7827d8bea61af83f961b011d45b4fc6afecbe65f"
-SRCREV_machine ?= "bde76dde922d5b44ea86ec55bcac956a1361e5d7"
-SRCREV_meta ?= "dd90d836c062535cc2e8fff8c69959178215a552"
+SRCREV_machine:qemuarm ?= "0099684b19d9c16d500a02b35ad898c0a9dc3106"
+SRCREV_machine ?= "f76f3607e10bfc8f531d7efabf32ea34049f91ae"
+SRCREV_meta ?= "71ac1dd35ef4f83a56462757380a83f501a5e1ad"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index e025e62067..9690e9012d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "2f3c80866ab9071dc1ac9f3aad4a464b7e079aa3"
-SRCREV_machine:qemuarm64 ?= "c787702068ec311d8b60bf772b54f2a182519bb2"
-SRCREV_machine:qemumips ?= "52c60eb7dcd36cb6a978723b198b0a2bdb92450a"
-SRCREV_machine:qemuppc ?= "89f4096a15892c8cfb003443a1d52818c27d5d11"
-SRCREV_machine:qemuriscv64 ?= "7d078581c0f754d6cb38b2bf1952925e0460ef84"
-SRCREV_machine:qemuriscv32 ?= "7d078581c0f754d6cb38b2bf1952925e0460ef84"
-SRCREV_machine:qemux86 ?= "7d078581c0f754d6cb38b2bf1952925e0460ef84"
-SRCREV_machine:qemux86-64 ?= "7d078581c0f754d6cb38b2bf1952925e0460ef84"
-SRCREV_machine:qemumips64 ?= "473c87e4e9438b67a13b23e1a94ed3d872b09df4"
-SRCREV_machine ?= "7d078581c0f754d6cb38b2bf1952925e0460ef84"
-SRCREV_meta ?= "dd90d836c062535cc2e8fff8c69959178215a552"
+SRCREV_machine:qemuarm ?= "181ab6e2f032db917d0a37752abc7d6512f9f9d9"
+SRCREV_machine:qemuarm64 ?= "4f22fcb495ad1cbf4828cce8bb14b03880faa3a5"
+SRCREV_machine:qemumips ?= "da60efd65e9442fb70c902e9f9d4656933948ed3"
+SRCREV_machine:qemuppc ?= "2dc9ff9466c872180d0a64de8995109dc78e5394"
+SRCREV_machine:qemuriscv64 ?= "e37d01c98215ba1b8fb714d931beee6e60f8ffa2"
+SRCREV_machine:qemuriscv32 ?= "e37d01c98215ba1b8fb714d931beee6e60f8ffa2"
+SRCREV_machine:qemux86 ?= "e37d01c98215ba1b8fb714d931beee6e60f8ffa2"
+SRCREV_machine:qemux86-64 ?= "e37d01c98215ba1b8fb714d931beee6e60f8ffa2"
+SRCREV_machine:qemumips64 ?= "f150eeba3fb02ca54b8d174b880c77a8ca425154"
+SRCREV_machine ?= "e37d01c98215ba1b8fb714d931beee6e60f8ffa2"
+SRCREV_meta ?= "71ac1dd35ef4f83a56462757380a83f501a5e1ad"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.152"
+LINUX_VERSION ?= "5.10.154"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


