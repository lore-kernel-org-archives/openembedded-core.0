Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FB4EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:00 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.26502.1688656019341907253
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=KA7pLdnq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b89b75dc1cso14007085ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656018; x=1691248018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7g7ic54W98y59lC+qtVH7NGcjeRHhZQLadzh9KQc9A=;
        b=KA7pLdnq5ucTyxE+9Pg3Ll16kqC+W4vvst0tXKDGRNiiwRM1GAdj6phDqZDms+866/
         QYdymrrZ0bqWKxDApEUHbrFl3VZkBc/tHQKvgeW5/zjPrVu5NlLGYAkim6T1x7A/d4Rg
         DNjui5tSHZPi12CtB5RgOaD5mKEcnfJ7V84Dmvd9BwkoUUAcPowOQQ2JhJgXANFTVor4
         V6ddMJsFJmdJXhN5QUXKv0V+w24oSeL6SG4ERkhzHZ9S2nBzHTGk3CfdUPfL358PMfc1
         S5kTrNEtPnDe2z/hq+qvQ9XiwDdNxtCQooWdbt+FxBIWQ7NJp1/PybOXKEx1fgfyc53F
         pcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656018; x=1691248018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7g7ic54W98y59lC+qtVH7NGcjeRHhZQLadzh9KQc9A=;
        b=M/Z8WTjRWXdu3GosqDqKonB5tkV1OmgLF3hg3eswUfvSeh9sY5PVOgpwou2Q77X+UN
         sVwKA/jXHXWqkfLawdGOoxXhapUCvULqf4Q3ZFZkg+ay6juJbNfRxcPmMK1soEgB4gEp
         qi1NzIB3YKTHy6/jzijUM5wIZH+W+0RnhltTr372yJxgbvzVKxSy+s1pycfGgaVQVBcx
         WommQMljlTrHjG4ceAt2D2OTMB6WK5z9R1SwrTT7xRJEjMgxET2d0tg6vjUb/BF659wa
         3pMUoGfn6k/VmdedJqyteyX+jsnPGwPcWLfYgB91bp7+VNfiHvHI+11t1WxCXTZhKMs5
         MdOw==
X-Gm-Message-State: ABy/qLay2LhTHEXYmCYnAojS9hfjQdkCAirdJcXdBTuspoW8tEUnUhMU
	iAIh5DRZi0Ftm9b76o4p2pSVc9FtXJNQwfAoFOI=
X-Google-Smtp-Source: APBJJlGarx0E6AUjCxLxYjxq9CjAbPU6+2nm3fCDYvtuCLkYyCggi1qIjZ9EcAh7//R+A37MusBn5Q==
X-Received: by 2002:a17:902:dacf:b0:1b6:b703:36f8 with SMTP id q15-20020a170902dacf00b001b6b70336f8mr4120319plx.25.1688656018250;
        Thu, 06 Jul 2023 08:06:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.06.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:06:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/28] linux-yocto/5.15: update to v5.15.116
Date: Thu,  6 Jul 2023 05:06:12 -1000
Message-Id: <5bcbae7273fcb619be39d388a7b593799b46dab5.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183962

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    7349e40704a0 Linux 5.15.116
    62886f17d3e6 RDMA/irdma: Do not generate SW completions for NOPs
    14d148401c52 RDMA/irdma: Fix drain SQ hang with no completion
    e88b19b252db ARM: defconfig: drop CONFIG_DRM_RCAR_LVDS
    a1c76e2907c1 ext4: enable the lazy init thread when remounting read/write
    76a7dfc9cc02 selftests: mptcp: join: skip if MPTCP is not supported
    807114223d3e selftests: mptcp: simult flows: skip if MPTCP is not supported
    9319c8b75ee6 selftests: mptcp: diag: skip if MPTCP is not supported
    c971ca2b9d8d drm/amdgpu/gfx10: Disable gfxoff before disabling powergating.
    7a20262fa9ee scsi: dpt_i2o: Do not process completions with invalid addresses
    daeab37ddb6f scsi: dpt_i2o: Remove broken pass-through ioctl (I2OUSERCMD)
    78a79c625265 drm/rcar: stop using 'imply' for dependencies
    4c3dda6b7cfd tpm, tpm_tis: Request threaded interrupt handler
    19750d7b575a regmap: Account for register length when chunking
    6cb7e7579a3d KEYS: asymmetric: Copy sig and digest in public_key_verify_signature()
    d56c2ab32594 ksmbd: fix incorrect AllocationSize set in smb2_get_info
    380b47932e76 ksmbd: fix credit count leakage
    8a870c07a1df KVM: x86: Account fastpath-only VM-Exits in vCPU stats
    808ed7d86ed9 test_firmware: fix the memory leak of the allocated firmware buffer
    4b7a35eb8a18 serial: 8250_tegra: Fix an error handling path in tegra_uart_probe()
    fc8ef0714161 fbcon: Fix null-ptr-deref in soft_cursor
    a0790a7739a2 ext4: add lockdep annotations for i_data_sem for ea_inode's
    a8c3024c3e46 ext4: disallow ea_inodes with extended attributes
    39a66e7a2987 ext4: set lockdep subclass for the ea_inode in ext4_xattr_inode_cache_find()
    bdbfbb7d5057 ext4: add EA_INODE checking to ext4_iget()
    efa3fe247d6b selftests: mptcp: sockopt: skip if MPTCP is not supported
    95ad73b62765 selftests: mptcp: pm nl: skip if MPTCP is not supported
    30bacfd8caf6 selftests: mptcp: connect: skip if MPTCP is not supported
    2712a1ba0597 tracing/probe: trace_probe_primary_from_call(): checked list_first_entry
    8a716b28b933 selinux: don't use make's grouped targets feature yet
    11a8e7fd7231 block: fix revalidate performance regression
    538d8504859f usb: cdns3: fix NCM gadget RX speed 20x slow than expection at iMX8QM
    57a2fd7b2c75 usb: cdns3: allocate TX FIFO size according to composite EP number
    d42d869b2cf4 iommu/amd: Fix domain flush size when syncing iotlb
    cb21384372d1 powerpc/iommu: Limit number of TCEs to 512 for H_STUFF_TCE hcall
    f257c1a6cc86 btrfs: fix csum_tree_block page iteration to avoid tripping on -Werror=array-bounds
    292806cfe43d tty: serial: fsl_lpuart: use UARTCTRL_TXINV to send break instead of UARTCTRL_SBK
    3fda903511f3 mmc: pwrseq: sd8787: Fix WILC CHIP_EN and RESETN toggling order
    dade1f4a379d mmc: vub300: fix invalid response handling
    3eb4590bc37c block/blk-iocost (gcc13): keep large values in a new enum
    43124187fe3a ath6kl: Use struct_group() to avoid size-mismatched casting
    43f4aca98bf2 x86/boot: Wrap literal addresses in absolute_pointer()
    3cfd7f042e67 drm/amd/pm: reverse mclk and fclk clocks levels for renoir
    7e0c25b39065 drm/amd/pm: reverse mclk and fclk clocks levels for yellow carp
    fce05ec3deb5 drm/amd/pm: reverse mclk and fclk clocks levels for vangogh
    b0dda610b42c ata: libata-scsi: Use correct device no in ata_find_dev()
    57f4555bdfa5 scsi: stex: Fix gcc 13 warnings
    6f675380db4f misc: fastrpc: reject new invocations during device removal
    cebe84b9c02e misc: fastrpc: return -EPIPE to invocations on device removal
    d3103fc0d191 md/raid5: fix miscalculation of 'end_sector' in raid5_read_one_chunk()
    599e19202be2 usb: gadget: f_fs: Add unbind event before functionfs_unbind
    c762eafe7949 dt-bindings: usb: snps,dwc3: Fix "snps,hsphy_interface" type
    7099a87cf5ee net: usb: qmi_wwan: Set DTR quirk for BroadMobi BM818
    16bd13e701c0 iio: dac: build ad5758 driver when AD5758 is selected
    b6622c1fd233 iio: adc: ad7192: Change "shorted" channels to differential
    aeec28d83865 iio: dac: mcp4725: Fix i2c_master_send() return value handling
    23c6a184c2b8 iio: adc: ad_sigma_delta: Fix IRQ issue by setting IRQ_DISABLE_UNLAZY flag
    4349ee3deef9 iio: light: vcnl4035: fixed chip ID check
    db633585e93b dt-bindings: iio: adc: renesas,rcar-gyroadc: Fix adi,ad7476 compatible value
    6bd3d6305b6a iio: imu: inv_icm42600: fix timestamp reset
    536b4ffa93fa HID: wacom: avoid integer overflow in wacom_intuos_inout()
    cfa747cc65ca HID: google: add jewel USB id
    11bc983e4393 iio: adc: mxs-lradc: fix the order of two cleanup operations
    a5461c3134ce iio: accel: st_accel: Fix invalid mount_matrix on devices without ACPI _ONT method
    6a7d946733ea media: uvcvideo: Don't expose unsupported formats to userspace
    6dd02a7bff9d mailbox: mailbox-test: fix a locking issue in mbox_test_message_write()
    0f3c55c7d62c nvme-pci: Add quirk for Teamgroup MP33 SSD
    c9079eb6f1cf drm/amdgpu: skip disabling fence driver src_irqs when device is unplugged
    4238ea044eb2 atm: hide unused procfs functions
    5d4c31d93973 drm/msm: Be more shouty if per-process pgtables aren't working
    825cc70fbf2f ALSA: oss: avoid missing-prototype warnings
    a79da1659cdc nvme-multipath: don't call blk_mark_disk_dead in nvme_mpath_remove_disk
    9a195b991709 netfilter: conntrack: define variables exp_nat_nla_policy and any_addr with CONFIG_NF_NAT
    82f505878f0a wifi: b43: fix incorrect __packed annotation
    ab62fc176eac scsi: core: Decrease scsi_device's iorequest_cnt if dispatch failed
    e04de12881ca wifi: mac80211: simplify chanctx allocation
    24dc97e135e8 arm64: vdso: Pass (void *) to virt_to_page()
    2944b9f0fdcf arm64/mm: mark private VM_FAULT_X defines as vm_fault_t
    39d84ddd9ebc ARM: dts: stm32: add pin map for CAN controller on stm32f7
    b2f00acd5369 wifi: rtl8xxxu: fix authentication timeout due to incorrect RCR value
    ce135055be33 ACPI: resource: Add IRQ override quirk for LG UltraPC 17U70P
    66f05cf2b2fd s390/topology: honour nr_cpu_ids when adding CPUs
    79803685425c s390/pkey: zeroize key blobs
    42624bc8c30c media: dvb-core: Fix use-after-free due to race condition at dvb_ca_en50221
    22fc36d59eab media: dvb-core: Fix kernel WARNING for blocking operation in wait_event*()
    a47a3f7a9bf6 media: dvb-core: Fix use-after-free due to race at dvb_register_device()
    50831747cb3a media: dvb-core: Fix use-after-free due on race condition at dvb_net
    9f74fec18f4c media: mn88443x: fix !CONFIG_OF error by drop of_match_ptr from ID table
    d6c47b235992 media: ttusb-dec: fix memory leak in ttusb_dec_exit_dvb()
    747a121914e3 media: dvb_ca_en50221: fix a size write bug
    34562df4082b media: netup_unidvb: fix irq init by register it at the end of probe
    5e56e3d5ebeb media: dvb-usb: dw2102: fix uninit-value in su3000_read_mac_address
    5240bc8c0c9a media: dvb-usb: digitv: fix null-ptr-deref in digitv_i2c_xfer()
    cd6764cf45ab media: dvb-usb-v2: rtl28xxu: fix null-ptr-deref in rtl28xxu_i2c_xfer
    ef0d867e295d media: dvb-usb-v2: ce6230: fix null-ptr-deref in ce6230_i2c_master_xfer()
    abaf49c5a95d media: dvb-usb-v2: ec168: fix null-ptr-deref in ec168_i2c_xfer()
    4b61ee116a3c media: dvb-usb: az6027: fix three null-ptr-deref in az6027_i2c_xfer()
    5e9ad9962f2a media: dvb_demux: fix a bug for the continuity counter
    ae3e3ac8b294 ASoC: ssm2602: Add workaround for playback distortions
    6cf7f03d2d34 ASoC: dt-bindings: Adjust #sound-dai-cells on TI's single-DAI codecs
    133c78bc6769 xfrm: Check if_id in inbound policy/secpath match
    f1a6d366cdb1 um: harddog: fix modular build
    e9d167ca4810 ASoC: dwc: limit the number of overrun messages
    84dfd8bee506 nvme-pci: add quirk for missing secondary temperature thresholds
    b32eeafd4eb9 nvme-pci: add NVME_QUIRK_BOGUS_NID for HS-SSD-FUTURE 2048G
    f7af470fad9c block/rnbd: replace REQ_OP_FLUSH with REQ_OP_WRITE
    8ba70707c3fe nbd: Fix debugfs_create_dir error checking
    156f5237e9c3 fbdev: stifb: Fix info entry in sti_struct on error path
    b3c785428797 fbdev: modedb: Add 1920x1080 at 60 Hz video mode
    ad3de274e065 fbdev: imsttfb: Fix use after free bug in imsttfb_probe
    fd8b4e28f400 gfs2: Don't deref jdesc in evict
    a00cc8562835 platform/x86: intel_scu_pcidrv: Add back PCI ID for Medfield
    736626df53e9 media: rcar-vin: Select correct interrupt mode for V4L2_FIELD_ALTERNATE
    1eae6e919639 ARM: 9295/1: unwind:fix unwind abort for uleb128 case
    af739a701517 btrfs: abort transaction when sibling keys check fails for leaves
    872a038dd4c9 drm/ast: Fix ARM compatibility
    3291f4a1073a mailbox: mailbox-test: Fix potential double-free in mbox_test_message_write()
    fe6f6f470612 drm/amdgpu: Use the default reset when loading or reloading the driver
    2226d9ef63d5 ALSA: hda: Glenfly: add HD Audio PCI IDs and HDMI Codec Vendor IDs.
    65221bdde702 watchdog: menz069_wdt: fix watchdog initialisation
    6a7bf0038973 drm/amdgpu: release gpu full access after "amdgpu_device_ip_late_init"
    8ac106aade8f rtnetlink: call validate_linkmsg in rtnl_create_link
    beeffe764e07 mtd: rawnand: marvell: don't set the NAND frequency select
    6494318f11f3 mtd: rawnand: marvell: ensure timing values are written
    0fad29dabce1 net: dsa: mv88e6xxx: Increase wait after reset deactivation
    45f47d2cf114 net/sched: flower: fix possible OOB write in fl_set_geneve_opt()
    b15adce7d326 net/mlx5: Read embedded cpu after init bit cleared
    c3caee8fe178 net/mlx5e: Fix error handling in mlx5e_refresh_tirs
    1abb7b04ec37 udp6: Fix race condition in udp6_sendmsg & connect
    7dc379f8856b net/netlink: fix NETLINK_LIST_MEMBERSHIPS length report
    91b07931c14d net: sched: fix NULL pointer dereference in mq_attach
    b1cb1ba1fbfa net/sched: Prohibit regrafting ingress or clsact Qdiscs
    cde00dcdf0ce net/sched: Reserve TC_H_INGRESS (TC_H_CLSACT) for ingress (clsact) Qdiscs
    2e859de5aeb0 net/sched: sch_clsact: Only create under TC_H_CLSACT
    cff0af3d1364 net/sched: sch_ingress: Only create under TC_H_INGRESS
    a907a389c71c tcp: Return user_mss for TCP_MAXSEG in CLOSE/LISTEN state if user_mss set
    fade445f3921 tcp: deny tcp_disconnect() when threads are waiting
    5434c8128777 af_packet: do not use READ_ONCE() in packet_bind()
    60bd1403bab7 RDMA/irdma: Fix Local Invalidate fencing
    0b3c392b82cd RDMA/irdma: Prevent QP use after free
    bd2af69575f5 RDMA/irdma: Add SW mechanism to generate completions on error
    2d04dde4ded7 mtd: rawnand: ingenic: fix empty stub helper definitions
    8f61d394b0c2 amd-xgbe: fix the false linkup in xgbe_phy_status
    aefcb6ea1d44 af_packet: Fix data-races of pkt_sk(sk)->num.
    c8775b97bf96 netrom: fix info-leak in nr_write_internal()
    8045788adda6 net: mellanox: mlxbf_gige: Fix skb_panic splat under memory pressure
    8d9d0bfd4c22 net/mlx5e: Don't attach netdev profile while handling internal error
    d002e0287d78 net/mlx5: fw_tracer, Fix event handling
    3a7793ae6911 riscv: Fix unused variable warning when BUILTIN_DTB is set
    3f1191bc5b6a dmaengine: pl330: rename _start to prevent build error
    c4be5d71d7a4 iommu/amd: Don't block updates to GATag if guest mode is on
    b4fd38c0c7b8 iommu/rockchip: Fix unwind goto issue
    190ea1c39104 RDMA/bnxt_re: Fix return value of bnxt_re_process_raw_qp_pkt_rx
    2fa9ee0fd65d RDMA/bnxt_re: Fix a possible memory leak
    fdc977f2e785 dmaengine: at_xdmac: fix potential Oops in at_xdmac_prep_interleaved()
    f68eff0faf67 dmaengine: at_xdmac: Move the free desc to the tail of the desc list
    ba0e7ca84a93 RDMA/hns: Modify the value of long message loopback slice
    15aeb44199e6 RDMA/hns: Fix base address table allocation
    b0f40ecc46d9 RDMA/efa: Fix unsupported page sizes in device
    f370588ec389 RDMA/bnxt_re: Fix the page_size used during the MR creation

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 20388189ab6d03ae3c6e4fdd0135af4f88e15198)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index eee248dba9..32eb5b8351 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "649674a0e78bb0454571f2b8cb3cded4e0bb2b6a"
-SRCREV_meta ?= "5f6249ab6fc0f2ac02d745c815adfbf2ad2f92fa"
+SRCREV_machine ?= "c24198eab94f04755689cf431a434932396e56f6"
+SRCREV_meta ?= "ae5766055d47d5675065e386ffa286b212a352c0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.115"
+LINUX_VERSION ?= "5.15.116"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 67c0ae51a4..259db4b41f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.115"
+LINUX_VERSION ?= "5.15.116"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1475d97fc568cd18aee2ffc9e2327df42ab11dbc"
-SRCREV_meta ?= "5f6249ab6fc0f2ac02d745c815adfbf2ad2f92fa"
+SRCREV_machine ?= "7002dac746495520fb193cb13b1afd83fe4dd2cb"
+SRCREV_meta ?= "ae5766055d47d5675065e386ffa286b212a352c0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 766995dbed..0d86a84415 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c4eda8f51adfce3ce4a7ec38945138db06d10847"
-SRCREV_machine:qemuarm64 ?= "644dc3e054fde0403f2e211e0d33fdcc65b86eb9"
-SRCREV_machine:qemumips ?= "9b1d37b6e5f0cc9c0397d6665b7457ebccedf20a"
-SRCREV_machine:qemuppc ?= "6fa7818e5625448e3ce9a08a7a9ec2cfadbea50e"
-SRCREV_machine:qemuriscv64 ?= "ad4f0f4baf291e68300bffe88ef0c6e98f5c9882"
-SRCREV_machine:qemuriscv32 ?= "ad4f0f4baf291e68300bffe88ef0c6e98f5c9882"
-SRCREV_machine:qemux86 ?= "ad4f0f4baf291e68300bffe88ef0c6e98f5c9882"
-SRCREV_machine:qemux86-64 ?= "ad4f0f4baf291e68300bffe88ef0c6e98f5c9882"
-SRCREV_machine:qemumips64 ?= "d13909f10dbd2affda5ac77d8d7ac0c0dbd9fe9c"
-SRCREV_machine ?= "ad4f0f4baf291e68300bffe88ef0c6e98f5c9882"
-SRCREV_meta ?= "5f6249ab6fc0f2ac02d745c815adfbf2ad2f92fa"
+SRCREV_machine:qemuarm ?= "846212e7d5354df9f5a061cac6fff98c2d2ca218"
+SRCREV_machine:qemuarm64 ?= "c15cb294c24733e9f1f73c5efccaacec7e0ad534"
+SRCREV_machine:qemumips ?= "9268ce3666b74e3da988ee8476b5908a11208b59"
+SRCREV_machine:qemuppc ?= "8a029153e24092cc00d18f888f22bc03e73a2860"
+SRCREV_machine:qemuriscv64 ?= "ec5cfb5e4ec277f8d0a728032047639192072107"
+SRCREV_machine:qemuriscv32 ?= "ec5cfb5e4ec277f8d0a728032047639192072107"
+SRCREV_machine:qemux86 ?= "ec5cfb5e4ec277f8d0a728032047639192072107"
+SRCREV_machine:qemux86-64 ?= "ec5cfb5e4ec277f8d0a728032047639192072107"
+SRCREV_machine:qemumips64 ?= "ea7f77e865a06b2431f06bc8cbf320c9e5e71642"
+SRCREV_machine ?= "ec5cfb5e4ec277f8d0a728032047639192072107"
+SRCREV_meta ?= "ae5766055d47d5675065e386ffa286b212a352c0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d7af3e5ba454d007b4939f858739cf1cecdeab46"
+SRCREV_machine:class-devupstream ?= "7349e40704a0209a2af8b37fa876322209de9684"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.115"
+LINUX_VERSION ?= "5.15.116"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


