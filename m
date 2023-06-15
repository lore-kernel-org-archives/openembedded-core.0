Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F71EB64DC
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 11:56:50 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.16121.1686830208348024909
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 04:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=a7+DA/3n;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-3f9f523c70bso3440161cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 04:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686830207; x=1689422207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oA1H+WSdUNp07Oa+kom71JrTHCuNaTmEDQ6MGdFJ2Yg=;
        b=a7+DA/3ngCpsu/rrATWr5P2RvxjbMeNEyWizuHgNkDhpzbKJZkSDXKS8U/1CZB+MCC
         ir+fQJJPj/AfZ89IQg36wzE9wgkCEvZcv5G9c4PzFd/GVc8O9cxcmyrHjNEcZsIp62/g
         24DDabujhh3HDZxr4jYjWopr3iO3/LNd3M3w2ZAbMSfwoqqFDco1ywGRYQC/mAg1B080
         VtDn5kLF3c0G0Z5K5NhLOtbncZothWHZUkJiKzk/ZCEtN/Us8rCqav4+h9i+yqR7zrgJ
         8xswvCKWJTtvbD8eB0h4k8XG7TbcfmVzM8FfIe8uCujofs4zmY2XXSXUuGD50a6KYGuV
         LAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686830207; x=1689422207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oA1H+WSdUNp07Oa+kom71JrTHCuNaTmEDQ6MGdFJ2Yg=;
        b=L9GURrlRB54LTgtSu3eMkzgMIy3To3cQOq3TvxL15C3R3FPzIkwDWQqD2ChxN56mDy
         0+9FRcQsF1dvmTXnfUiUymR+IG2TFgAuK/L8cFXIPjTuhbyCyt7OhgKVfirhcDGm/bYC
         vzxcIsTnZ5492Hf9Amr4x2MU1XJP/9xYS0XRK9SRqL2fo4Cuju/jkPrUNsB1c2/a5j0o
         EN3q48q9nHhJdZ2P3L5kIS00tIp2/I2CvpuP0usT2tjHccTr319HOuZiu9TfsWCWsS3F
         5/IQzYKq+yaKmg9rPjab7HDAaMXJTUHj1+Gj4uMBOI9d6B1gZysEC44UofHo9pBRwM58
         MZ9w==
X-Gm-Message-State: AC+VfDzWJoriv+CZ8tMizPl8G8li4uLMj45ZoAGYy++IDpQRDRjyGxXn
	BF8tdozHYK3zl2J1gbJeb7dLDb1HfAj40g==
X-Google-Smtp-Source: ACHHUZ6zRRljlLpEBTFBLhrMzRqm6LIEMn5rtynMtUtMuF14Fc58VvjVB8oDr80qgYOjS3lN0srvQw==
X-Received: by 2002:ac8:5702:0:b0:3f8:66b7:94dd with SMTP id 2-20020ac85702000000b003f866b794ddmr4634791qtw.33.1686830207054;
        Thu, 15 Jun 2023 04:56:47 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d3-20020ac85343000000b003f740336bb9sm6116254qto.9.2023.06.15.04.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 04:56:46 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.1: update to v6.1.33
Date: Thu, 15 Jun 2023 07:56:44 -0400
Message-Id: <20230615115644.191775-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 11:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182851

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    2f3918bc53fb Linux 6.1.33
    c3fcfe8931e1 ext4: enable the lazy init thread when remounting read/write
    84683a2cf5ed selftests: mptcp: join: avoid using 'cmp --bytes'
    fbb6db561dd4 selftests: mptcp: simult flows: skip if MPTCP is not supported
    4bc022b95392 selftests: mptcp: diag: skip if MPTCP is not supported
    e8631d84c01e arm64: efi: Use SMBIOS processor version to key off Ampere quirk
    b026755cc9a8 tls: rx: strp: don't use GFP_KERNEL in softirq context
    a2961463d74f xfs: verify buffer contents when we skip log replay
    4042d7ad40f1 drm/amd/display: Have Payload Properly Created After Resume
    4a9d63181f8d iommu/amd/pgtbl_v2: Fix domain max address
    3264d875f58a tpm, tpm_tis: Request threaded interrupt handler
    77ee4f8c02b8 regmap: Account for register length when chunking
    a8eaa9a06add fs/ntfs3: Validate MFT flags before replaying logs
    0b28edf227e3 KEYS: asymmetric: Copy sig and digest in public_key_verify_signature()
    4f303c0b9d5d ksmbd: fix multiple out-of-bounds read during context decoding
    522a9417f649 ksmbd: fix slab-out-of-bounds read in smb2_handle_negotiate
    4c6bdaacb3cb ksmbd: fix incorrect AllocationSize set in smb2_get_info
    f7add4d1598a ksmbd: fix UAF issue from opinfo->conn
    8072ea674374 ksmbd: fix credit count leakage
    5f4d3810ca9c KVM: x86: Account fastpath-only VM-Exits in vCPU stats
    b1d5667afad1 KVM: arm64: Populate fault info for watchpoint
    0659aee089da test_firmware: fix the memory leak of the allocated firmware buffer
    eef67dfdc050 test_firmware: fix a memory leak with reqs buffer
    33aebb014893 powerpc/xmon: Use KSYM_NAME_LEN in array size
    97211945ef68 serial: cpm_uart: Fix a COMPILE_TEST dependency
    7493392a375c serial: 8250_tegra: Fix an error handling path in tegra_uart_probe()
    3270095f6eb5 fbcon: Fix null-ptr-deref in soft_cursor
    ef8aeffb2c50 ext4: add lockdep annotations for i_data_sem for ea_inode's
    140aa33f96d6 ext4: disallow ea_inodes with extended attributes
    277cea6f7786 ext4: set lockdep subclass for the ea_inode in ext4_xattr_inode_cache_find()
    b112babc565e ext4: add EA_INODE checking to ext4_iget()
    9ce0319b0599 mptcp: fix active subflow finalization
    977a63afd401 mptcp: fix connect timeout handling
    97ecfe67f5ca selftests: mptcp: userspace pm: skip if MPTCP is not supported
    f324df8de0b5 selftests: mptcp: sockopt: skip if MPTCP is not supported
    0fea987ccf5f selftests: mptcp: join: skip if MPTCP is not supported
    17ddf2a54eff selftests: mptcp: pm nl: skip if MPTCP is not supported
    68ecc09a148c selftests: mptcp: connect: skip if MPTCP is not supported
    3f731926a1b0 tracing/probe: trace_probe_primary_from_call(): checked list_first_entry
    7403630eb94c tracing/histograms: Allow variables to have some modifiers
    2a1195f0e085 tracing/timerlat: Always wakeup the timerlat thread
    007c04225697 mtdchar: mark bits of ioctl handler noinline
    d7c34c8f6005 selinux: don't use make's grouped targets feature yet
    6fb0b098f690 io_uring: undeprecate epoll_ctl support
    94f97b8df005 riscv: perf: Fix callchain parse error with kernel tracepoint events
    c40dc6e26646 tpm, tpm_tis: correct tpm_tis_flags enumeration values
    b0e21c42c1fb iommu/amd: Fix domain flush size when syncing iotlb
    251cf7fd5a1b powerpc/iommu: Limit number of TCEs to 512 for H_STUFF_TCE hcall
    2a72e6814f55 block: fix revalidate performance regression
    867ad8cba251 phy: qcom-qmp-pcie-msm8996: fix init-count imbalance
    5daf7a171d27 phy: qcom-qmp-combo: fix init-count imbalance
    1af8dd540347 btrfs: fix csum_tree_block page iteration to avoid tripping on -Werror=array-bounds
    380d2da555a8 tty: serial: fsl_lpuart: use UARTCTRL_TXINV to send break instead of UARTCTRL_SBK
    2c8aa1163a21 mmc: pwrseq: sd8787: Fix WILC CHIP_EN and RESETN toggling order
    f25568e0801c mmc: vub300: fix invalid response handling
    03974abbf2a1 x86/mtrr: Revert 90b926e68f50 ("x86/pat: Fix pat_x_mtrr_type() for MTRR disabled case")
    8db2ea7b80d6 drm/amd/pm: reverse mclk and fclk clocks levels for renoir
    f05f3fcc7824 drm/amd/pm: reverse mclk and fclk clocks levels for yellow carp
    1c729bd5b30f drm/amd/pm: reverse mclk clocks levels for SMU v13.0.5
    0f8f233ed767 drm/amd/pm: resolve reboot exception for si oland
    e0a0f5d2ba59 drm/amd/pm: reverse mclk and fclk clocks levels for vangogh
    00abb872ef0f drm/amd/pm: reverse mclk and fclk clocks levels for SMU v13.0.4
    2f91f92bd870 drm/amdgpu: enable tmz by default for GC 11.0.1
    009886965e04 ata: libata-scsi: Use correct device no in ata_find_dev()
    63a44b01df36 scsi: stex: Fix gcc 13 warnings
    2e787e5153b7 misc: fastrpc: reject new invocations during device removal
    93f2aa05af2d misc: fastrpc: return -EPIPE to invocations on device removal
    cbfed647fd19 md/raid5: fix miscalculation of 'end_sector' in raid5_read_one_chunk()
    704842c97aa3 usb: gadget: f_fs: Add unbind event before functionfs_unbind
    cc8c9864da69 usb: cdns3: fix NCM gadget RX speed 20x slow than expection at iMX8QM
    08e8ff68a3f6 dt-bindings: usb: snps,dwc3: Fix "snps,hsphy_interface" type
    ef12610ff5fa net: usb: qmi_wwan: Set DTR quirk for BroadMobi BM818
    3cfdc3fc1801 iio: dac: build ad5758 driver when AD5758 is selected
    f453753900e9 iio: adc: stm32-adc: skip adc-diff-channels setup if none is present
    735d033bedc3 iio: adc: ad7192: Change "shorted" channels to differential
    84f4d63ae184 iio: addac: ad74413: fix resistance input processing
    ab0c2dffe80f iio: dac: mcp4725: Fix i2c_master_send() return value handling
    89f92d435352 iio: adc: ad_sigma_delta: Fix IRQ issue by setting IRQ_DISABLE_UNLAZY flag
    2eb269605113 iio: adc: stm32-adc: skip adc-channels setup if none is present
    54d737d79672 iio: light: vcnl4035: fixed chip ID check
    2896a356ed07 dt-bindings: iio: adc: renesas,rcar-gyroadc: Fix adi,ad7476 compatible value
    cb2a612c397d iio: imu: inv_icm42600: fix timestamp reset
    3fb021f5c114 HID: wacom: avoid integer overflow in wacom_intuos_inout()
    254be1f64819 HID: google: add jewel USB id
    23c241676f32 iio: adc: mxs-lradc: fix the order of two cleanup operations
    b6867ce5fb35 iio: accel: st_accel: Fix invalid mount_matrix on devices without ACPI _ONT method
    47cc3cae303c media: uvcvideo: Don't expose unsupported formats to userspace
    4d776371127e drivers: base: cacheinfo: Fix shared_cpu_map changes in event of CPU hotplug
    7d233f93594f mailbox: mailbox-test: fix a locking issue in mbox_test_message_write()
    4124000cf4c5 media: mediatek: vcodec: Only apply 4K frame sizes on decoder formats
    bafe94ac9950 KVM: arm64: vgic: Fix locking comment
    150a5f74a597 KVM: arm64: vgic: Wrap vgic_its_create() with config_lock
    4129d71e5bda KVM: arm64: vgic: Fix a circular locking issue
    7df6008b8726 block: Deny writable memory mapping if block is read-only
    16ddd3bc6741 nvme-pci: Add quirk for Teamgroup MP33 SSD
    a731273f3c22 ublk: fix AB-BA lockdep warning
    68ce1d57e52c drm/amdgpu: skip disabling fence driver src_irqs when device is unplugged
    baa8901ad70d ceph: silence smatch warning in reconnect_caps_cb()
    56e5d63e4e2d atm: hide unused procfs functions
    47d0f626795f drm/msm: Be more shouty if per-process pgtables aren't working
    c62a9a6bea0c ALSA: oss: avoid missing-prototype warnings
    e4f1532a9cd9 nvme: do not let the user delete a ctrl before a complete initialization
    f481c2af4916 nvme-multipath: don't call blk_mark_disk_dead in nvme_mpath_remove_disk
    d0013470677f netfilter: conntrack: define variables exp_nat_nla_policy and any_addr with CONFIG_NF_NAT
    def67e27f2b7 net: wwan: t7xx: Ensure init is completed before system sleep
    ae72bd1a4b04 wifi: b43: fix incorrect __packed annotation
    c061e13c7297 scsi: core: Decrease scsi_device's iorequest_cnt if dispatch failed
    7402fb48efff wifi: iwlwifi: mvm: Add locking to the rate read flow
    788f129f6370 wifi: mac80211: recalc chanctx mindef before assigning
    a03460061164 wifi: mac80211: consider reserved chanctx for mindef
    aefa37aa32cb wifi: mac80211: simplify chanctx allocation
    bdd97c99b346 arm64: vdso: Pass (void *) to virt_to_page()
    6bf0f6bfcd35 arm64/mm: mark private VM_FAULT_X defines as vm_fault_t
    e0b5316e2ead ARM: dts: stm32: add pin map for CAN controller on stm32f7
    de16dfe7cab5 wifi: rtl8xxxu: fix authentication timeout due to incorrect RCR value
    329da6d07cc9 ACPI: resource: Add IRQ override quirk for LG UltraPC 17U70P
    905b247f6e13 s390/topology: honour nr_cpu_ids when adding CPUs
    26cfe2faa82d s390/pkey: zeroize key blobs
    9f2f538cd8c3 ASoC: SOF: pm: save io region state in case of errors in resume
    eb708aee4126 ASoC: SOF: sof-client-probes: fix pm_runtime imbalance in error handling
    1cc6301dfcd2 ASoC: SOF: pcm: fix pm_runtime imbalance in error handling
    a6637d5a8f19 ASoC: SOF: debug: conditionally bump runtime_pm counter on exceptions
    d5d61f747e3f media: dvb-core: Fix use-after-free due to race condition at dvb_ca_en50221
    d0088ea444e6 media: dvb-core: Fix kernel WARNING for blocking operation in wait_event*()
    4a8ecfb2207c media: dvb-core: Fix use-after-free due to race at dvb_register_device()
    93b5dfebcb18 media: dvb-core: Fix use-after-free due on race condition at dvb_net
    bf3b6f82fd4c media: mn88443x: fix !CONFIG_OF error by drop of_match_ptr from ID table
    ea2938c27b02 media: ttusb-dec: fix memory leak in ttusb_dec_exit_dvb()
    dd6839936115 media: dvb_ca_en50221: fix a size write bug
    058822591b78 media: netup_unidvb: fix irq init by register it at the end of probe
    b769fbf04a91 media: dvb-usb: dw2102: fix uninit-value in su3000_read_mac_address
    5d2923fb0b72 media: dvb-usb: digitv: fix null-ptr-deref in digitv_i2c_xfer()
    6906e613e6b7 media: dvb-usb-v2: rtl28xxu: fix null-ptr-deref in rtl28xxu_i2c_xfer
    4e896b226311 media: dvb-usb-v2: ce6230: fix null-ptr-deref in ce6230_i2c_master_xfer()
    336ca9b37104 media: dvb-usb-v2: ec168: fix null-ptr-deref in ec168_i2c_xfer()
    1027c8c068f0 media: dvb-usb: az6027: fix three null-ptr-deref in az6027_i2c_xfer()
    8914ae00db45 media: dvb_demux: fix a bug for the continuity counter
    59dad726de2d ASoC: ssm2602: Add workaround for playback distortions
    7fbdd3bd7bbf ALSA: hda/realtek: Add quirks for ASUS GU604V and GU603V
    603f239216ca ASoC: dt-bindings: Adjust #sound-dai-cells on TI's single-DAI codecs
    f6d2aa322ca7 xfrm: Check if_id in inbound policy/secpath match
    40798c566b56 um: harddog: fix modular build
    c03dd9390514 ASoC: dwc: limit the number of overrun messages
    0960fb87cdaf ASoC: amd: yc: Add DMI entry to support System76 Pangolin 12
    7d98a36b101f nvme-pci: add quirk for missing secondary temperature thresholds
    53786bfadc43 nvme-pci: add NVME_QUIRK_BOGUS_NID for HS-SSD-FUTURE 2048G
    46193dd43dce block/rnbd: replace REQ_OP_FLUSH with REQ_OP_WRITE
    5af920e4d1d1 nbd: Fix debugfs_create_dir error checking
    f83c32ed05d4 fbdev: stifb: Fix info entry in sti_struct on error path
    be2aefa202a5 fbdev: modedb: Add 1920x1080 at 60 Hz video mode
    c6c0a9f61958 fbdev: imsttfb: Fix use after free bug in imsttfb_probe
    3e336ad6f517 drm/amdgpu: set gfx9 onwards APU atomics support to be true
    5ae4a618a155 gfs2: Don't deref jdesc in evict
    61c3962ab1f9 platform/mellanox: fix potential race in mlxbf-tmfifo driver
    809efd7a69a4 platform/x86: intel_scu_pcidrv: Add back PCI ID for Medfield
    18913fc7c1dd media: rcar-vin: Select correct interrupt mode for V4L2_FIELD_ALTERNATE
    705f4dcc41c2 hwmon: (k10temp) Add PCI ID for family 19, model 78h
    6578e0f196e8 ARM: 9295/1: unwind:fix unwind abort for uleb128 case
    0433baa89318 btrfs: abort transaction when sibling keys check fails for leaves
    e2d161c539a4 drm/ast: Fix ARM compatibility
    cad1abbe488d mailbox: mailbox-test: Fix potential double-free in mbox_test_message_write()
    88a042d599c3 drm/amdgpu: Use the default reset when loading or reloading the driver
    6a40da600750 ASoC: Intel: soc-acpi-cht: Add quirk for Nextbook Ares 8A tablet
    a7ec48a419fe ALSA: hda: Glenfly: add HD Audio PCI IDs and HDMI Codec Vendor IDs.
    867dae554780 watchdog: menz069_wdt: fix watchdog initialisation
    787e74b21394 drm/amdgpu: release gpu full access after "amdgpu_device_ip_late_init"
    e2feb39312a6 mptcp: add annotations around sk->sk_shutdown accesses
    0b9e6d64cd10 mptcp: fix data race around msk->first access
    519f16d96c2d mptcp: consolidate passive msk socket initialization
    fa2cbd1d689a mptcp: simplify subflow_syn_recv_sock()
    9872e8c63252 mptcp: avoid unneeded address copy
    1b9e3ab669a3 mptcp: add annotations around msk->subflow accesses
    c5ebb5cec9fb mptcp: avoid unneeded __mptcp_nmpc_socket() usage
    ea9d7382d5d3 rtnetlink: call validate_linkmsg in rtnl_create_link
    62dcac528be7 mtd: rawnand: marvell: don't set the NAND frequency select
    2187cb72b98b mtd: rawnand: marvell: ensure timing values are written
    a0843347a96a net: dsa: mv88e6xxx: Increase wait after reset deactivation
    c3fc733798c7 tcp: fix mishandling when the sack compression is deferred.
    eac615ed3c6d net/sched: flower: fix possible OOB write in fl_set_geneve_opt()
    4fc2724f445f iommu/mediatek: Flush IOTLB completely only if domain has been attached
    9316fdd57f25 net/mlx5: Read embedded cpu after init bit cleared
    4156c6ff331a net/mlx5e: Fix error handling in mlx5e_refresh_tirs
    7c3e271626d1 nvme: fix the name of Zone Append for verbose logging
    4e5a5cda3dfd nfsd: fix double fget() bug in __write_ports_addfd()
    401a1cf50bfa udp6: Fix race condition in udp6_sendmsg & connect
    507182f132a8 net/netlink: fix NETLINK_LIST_MEMBERSHIPS length report
    5c05ef3630ca net: sched: fix NULL pointer dereference in mq_attach
    f8884108a2fe net/sched: Prohibit regrafting ingress or clsact Qdiscs
    be3e1f71cb6f net/sched: Reserve TC_H_INGRESS (TC_H_CLSACT) for ingress (clsact) Qdiscs
    1ec1434630b3 net/sched: sch_clsact: Only create under TC_H_CLSACT
    89a0f4dcae43 net/sched: sch_ingress: Only create under TC_H_INGRESS
    d67a5a587c45 net/smc: Don't use RMBs not mapped to new link in SMCRv2 ADD LINK
    8c3ec8e7895e net/smc: Scan from current RMB list when no position specified
    752836e1a206 tcp: Return user_mss for TCP_MAXSEG in CLOSE/LISTEN state if user_mss set
    c2251ce0483d tcp: deny tcp_disconnect() when threads are waiting
    0dec22a09da1 af_packet: do not use READ_ONCE() in packet_bind()
    906134664f33 RDMA/irdma: Fix Local Invalidate fencing
    07322c8a12d6 RDMA/irdma: Prevent QP use after free
    3cf774741459 mtd: rawnand: ingenic: fix empty stub helper definitions
    789394f1df8b perf ftrace latency: Remove unnecessary "--" from --use-nsec option
    7164961a9ce0 amd-xgbe: fix the false linkup in xgbe_phy_status
    d615070b0eb8 tls: improve lockless access safety of tls_err_abort()
    0b64a2bf1699 af_packet: Fix data-races of pkt_sk(sk)->num.
    a2c2364e5f53 netrom: fix info-leak in nr_write_internal()
    ae0ef97f1e2b net: mellanox: mlxbf_gige: Fix skb_panic splat under memory pressure
    724aa4fd9e36 net/mlx5e: Don't attach netdev profile while handling internal error
    9c7ae143a01b net/mlx5: fw_tracer, Fix event handling
    e73b7de4bf96 net/mlx5: SF, Drain health before removing device
    9e49af9766ec net/mlx5: Drain health before unregistering devlink
    ddd8d552a8f8 riscv: Fix unused variable warning when BUILTIN_DTB is set
    72fef70abe18 dmaengine: pl330: rename _start to prevent build error
    bd424277a1f8 nfsd: make a copy of struct iattr before calling notify_change
    dac09fec5b57 iommu/amd: Fix up merge conflict resolution
    817ce9b1d27e iommu/amd: Handle GALog overflows
    c3ff24625a42 iommu/amd: Don't block updates to GATag if guest mode is on
    bf1f3f4aa47d iommu/rockchip: Fix unwind goto issue
    0021441cbbf0 RDMA/bnxt_re: Fix return value of bnxt_re_process_raw_qp_pkt_rx
    dcaa61b73d9c RDMA/bnxt_re: Fix a possible memory leak
    44fc5eb0e267 dmaengine: at_xdmac: fix potential Oops in at_xdmac_prep_interleaved()
    ef8c7616939d RDMA/hns: Modify the value of long message loopback slice
    736e1c4e54e9 RDMA/hns: Fix base address table allocation
    38771c0eefa6 RDMA/hns: Fix timeout attr in query qp for HIP08
    241de3fec11f RDMA/efa: Fix unsupported page sizes in device
    21c0eb064890 phy: amlogic: phy-meson-g12a-mipi-dphy-analog: fix CNTL2_DIF_TX_CTL0 value
    836f874d43ed RDMA/bnxt_re: Fix the page_size used during the MR creation

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 794cbf2de9..4a2a3ca4ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1dbf96de89b0e1dc082bfa90b45a5d581b1470a3"
-SRCREV_meta ?= "fe6f2a4341877552eb279adc47e0ed32e3e2befa"
+SRCREV_machine ?= "6871194107bd40397162bfca0a9ef06661057c50"
+SRCREV_meta ?= "1dd270d3231f82d94d2123b95e4eb576019440a3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.32"
+LINUX_VERSION ?= "6.1.33"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 65a8148749..bfc1c7652c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.32"
+LINUX_VERSION ?= "6.1.33"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "24ec2fa877406f6e8ccce3841a1575e6d0e94679"
-SRCREV_meta ?= "fe6f2a4341877552eb279adc47e0ed32e3e2befa"
+SRCREV_machine ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
+SRCREV_meta ?= "1dd270d3231f82d94d2123b95e4eb576019440a3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index a7bcced3e4..53a583e0a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -20,25 +20,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "a362b0a2279ab82e61c03d492b7efd528fee4422"
-SRCREV_machine:qemuarm64 ?= "24ec2fa877406f6e8ccce3841a1575e6d0e94679"
-SRCREV_machine:qemuloongarch64 ?= "24ec2fa877406f6e8ccce3841a1575e6d0e94679"
-SRCREV_machine:qemumips ?= "3adbad6b7ccd09550606f44271cdf67dd9583379"
-SRCREV_machine:qemuppc ?= "24ec2fa877406f6e8ccce3841a1575e6d0e94679"
-SRCREV_machine:qemuriscv64 ?= "24ec2fa877406f6e8ccce3841a1575e6d0e94679"
-SRCREV_machine:qemuriscv32 ?= "24ec2fa877406f6e8ccce3841a1575e6d0e94679"
-SRCREV_machine:qemux86 ?= "24ec2fa877406f6e8ccce3841a1575e6d0e94679"
-SRCREV_machine:qemux86-64 ?= "24ec2fa877406f6e8ccce3841a1575e6d0e94679"
-SRCREV_machine:qemumips64 ?= "bbdfb1b8c9b38bcb63aeaa785b60cc24af88b4b1"
-SRCREV_machine ?= "24ec2fa877406f6e8ccce3841a1575e6d0e94679"
-SRCREV_meta ?= "fe6f2a4341877552eb279adc47e0ed32e3e2befa"
+SRCREV_machine:qemuarm ?= "cff918ff5ee0001dec6493620535d8804f02cd8b"
+SRCREV_machine:qemuarm64 ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
+SRCREV_machine:qemuloongarch64 ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
+SRCREV_machine:qemumips ?= "7a59adc4cd39bea852101be2873855cfc835ef45"
+SRCREV_machine:qemuppc ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
+SRCREV_machine:qemuriscv64 ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
+SRCREV_machine:qemuriscv32 ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
+SRCREV_machine:qemux86 ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
+SRCREV_machine:qemux86-64 ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
+SRCREV_machine:qemumips64 ?= "273e099163a72247262a495cb73889d2e0ed6d2c"
+SRCREV_machine ?= "6034b10d39687bbd6769e4adb2a792524e6b4f16"
+SRCREV_meta ?= "1dd270d3231f82d94d2123b95e4eb576019440a3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "76ba310227d2490018c271f1ecabb6c0a3212eb0"
+SRCREV_machine:class-devupstream ?= "2f3918bc53fb998fdeed8683ddc61194ceb84edf"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -47,7 +47,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.32"
+LINUX_VERSION ?= "6.1.33"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


