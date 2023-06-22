Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3598EB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 23:19:40 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.25990.1687475975364473756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 16:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WvY8nS7T;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-3f9b1f43bd0so1382491cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 16:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687475974; x=1690067974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXihrIgPP/uvfmLsrTuHoGGx4gSzrtfKxuSTgmUt5po=;
        b=WvY8nS7Ta6tsxrVB9j2QQ8t63y2tTSC1d6ryo0xlhv3JAMgUaoDrjF3FWKUMuCYWyw
         6alkAE65NKviow/oS24Qxk1NH61G/YGjmfFHVvEBngFpP8DCXwagRBwZgH7xn8NY9+Ol
         TFyW0TNPb7tWbi5qR/dBnXQs45NiydoK0KOOmnv/Ljv643FubqGWAS6iBB8zrcwDJ1+M
         /5eAWC0BUcCUIB3GO+W1hkpw4ItjiesLbOLxOCwr+FZ/oZWcnWpkVSPgvZ8nEVeTlwKl
         YY4r8QFPtSLLDHLA11KLNctAXQ4qAjb6HrC2LIPNKwNxBtUf+rWqInZ8HbILvblzNgeP
         egEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687475974; x=1690067974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXihrIgPP/uvfmLsrTuHoGGx4gSzrtfKxuSTgmUt5po=;
        b=djRcZk/LTbk1eiWRZG4tMGzTov4ZIwqsh7I1/SA8M4UmKMqaJU632uOhabKT/nwlfx
         eB/MyKduP9Kr407qn/nzaTvUg1fjq2PKRkrSooceWHHOPYVvQbLho4jfD+BUMK+iZCf0
         38huY+013otTwR3yAKm71pSi0lEdadZECFTZW16fecuWtUHEft14j33UVLqkaS/7h0A4
         FF9TWRoMJZ6hneVHELJ0zsPyC6w79fB/coX9I9zeirgu1wKt1xNi0p9YsYBfkPQsV9MH
         aRm5ZYBYj3f8KnjxSw/V3pBEqB6vLdbS991kZi3rAvE5M+1MTQRLzvw/lvh1gtTOn3bq
         NvRQ==
X-Gm-Message-State: AC+VfDzrGHswMeFcH3F60vdK6jwrS25Nv0gWnvO0fyAwCrhTWz6rJlTF
	rc/e0vRvroIPpxhFVSuLKpGSJETnEl8g9w==
X-Google-Smtp-Source: ACHHUZ4kMfZPqvJI7yA2beNA+tg4jeRRJKwEoa+PiqGON8Av39bMVCoYqt5R+wom+wEl6ZvqOzoZTQ==
X-Received: by 2002:a05:622a:1823:b0:3ff:3360:c738 with SMTP id t35-20020a05622a182300b003ff3360c738mr10175924qtc.39.1687475974352;
        Thu, 22 Jun 2023 16:19:34 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t2-20020ac86a02000000b003f9c26069aesm4137148qtr.34.2023.06.22.16.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 16:19:34 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/4] linux-yocto/5.10: update to v5.10.183
Date: Thu, 22 Jun 2023 19:19:30 -0400
Message-Id: <20230622231932.928672-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622231932.928672-1-bruce.ashfield@gmail.com>
References: <20230622231932.928672-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 23:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183299

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    7356714b95aa Linux 5.10.183
    842156dc0aad ARM: defconfig: drop CONFIG_DRM_RCAR_LVDS
    2c0ea7a06db5 ext4: enable the lazy init thread when remounting read/write
    92450a1eaa9e selftests: mptcp: join: skip if MPTCP is not supported
    1a6db1f92724 selftests: mptcp: simult flows: skip if MPTCP is not supported
    4f8356ab74dd selftests: mptcp: diag: skip if MPTCP is not supported
    81df7153f011 crypto: ccp: Play nice with vmalloc'd memory for SEV command structs
    1f988ce6e44f crypto: ccp: Reject SEV commands with mismatching command buffer
    d21a20f4421d scsi: dpt_i2o: Do not process completions with invalid addresses
    a2cd7599b558 scsi: dpt_i2o: Remove broken pass-through ioctl (I2OUSERCMD)
    6d6612f7f976 drm/rcar: stop using 'imply' for dependencies
    c759c9e4bf38 media: ti-vpe: cal: avoid FIELD_GET assertion
    d21e955de918 tpm, tpm_tis: Request threaded interrupt handler
    608c1f20830c regmap: Account for register length when chunking
    cb1cbe430e67 KEYS: asymmetric: Copy sig and digest in public_key_verify_signature()
    3295dc04af33 KVM: x86: Account fastpath-only VM-Exits in vCPU stats
    21bb3cd2e1bc test_firmware: fix the memory leak of the allocated firmware buffer
    510e015b9058 serial: 8250_tegra: Fix an error handling path in tegra_uart_probe()
    b02ae50c7fd8 fbcon: Fix null-ptr-deref in soft_cursor
    c94228a5aea4 ext4: add lockdep annotations for i_data_sem for ea_inode's
    ef70012ab51c ext4: disallow ea_inodes with extended attributes
    6f4fa43757bb ext4: set lockdep subclass for the ea_inode in ext4_xattr_inode_cache_find()
    6d67d4966c1e ext4: add EA_INODE checking to ext4_iget()
    6d0adaa90dbe selftests: mptcp: pm nl: skip if MPTCP is not supported
    54dea0aa6bef selftests: mptcp: connect: skip if MPTCP is not supported
    57eb824b8cbb tracing/probe: trace_probe_primary_from_call(): checked list_first_entry
    122ba1d40bea selinux: don't use make's grouped targets feature yet
    e0b8664c2fec btrfs: fix csum_tree_block page iteration to avoid tripping on -Werror=array-bounds
    6c859764f44d tty: serial: fsl_lpuart: use UARTCTRL_TXINV to send break instead of UARTCTRL_SBK
    6127e956c3a7 mmc: vub300: fix invalid response handling
    99cb5ed15d3e eth: sun: cassini: remove dead code
    1d8693376aaa gcc-12: disable '-Wdangling-pointer' warning for now
    7c602f540bfd ath6kl: Use struct_group() to avoid size-mismatched casting
    c92ea38a779f ACPI: thermal: drop an always true check
    93e28b66c104 x86/boot: Wrap literal addresses in absolute_pointer()
    3442be8f3095 ata: libata-scsi: Use correct device no in ata_find_dev()
    ae0d7613e0e3 scsi: stex: Fix gcc 13 warnings
    86b2d292c260 misc: fastrpc: reject new invocations during device removal
    dacb7c103c2f misc: fastrpc: return -EPIPE to invocations on device removal
    a4f88cb043c5 usb: gadget: f_fs: Add unbind event before functionfs_unbind
    90f581eb745c net: usb: qmi_wwan: Set DTR quirk for BroadMobi BM818
    e18b0009ddfb iio: dac: build ad5758 driver when AD5758 is selected
    a869ab6987f4 iio: adc: ad7192: Change "shorted" channels to differential
    143dbb313aea iio: dac: mcp4725: Fix i2c_master_send() return value handling
    81c70f4beaad iio: light: vcnl4035: fixed chip ID check
    ff864a92d903 iio: imu: inv_icm42600: fix timestamp reset
    954bd5a44b09 HID: wacom: avoid integer overflow in wacom_intuos_inout()
    adac1c22f54b HID: google: add jewel USB id
    55c507a34e7e iio: adc: mxs-lradc: fix the order of two cleanup operations
    5a445c2bf651 mailbox: mailbox-test: fix a locking issue in mbox_test_message_write()
    c05ac53bb0df atm: hide unused procfs functions
    ab332304583d drm/msm: Be more shouty if per-process pgtables aren't working
    93a61212db4b ALSA: oss: avoid missing-prototype warnings
    4987bf04465e netfilter: conntrack: define variables exp_nat_nla_policy and any_addr with CONFIG_NF_NAT
    1c2537291e9c wifi: b43: fix incorrect __packed annotation
    ea478186ea29 scsi: core: Decrease scsi_device's iorequest_cnt if dispatch failed
    05226a8f2288 arm64/mm: mark private VM_FAULT_X defines as vm_fault_t
    32f86763c2a2 ARM: dts: stm32: add pin map for CAN controller on stm32f7
    01c76cb5e512 wifi: rtl8xxxu: fix authentication timeout due to incorrect RCR value
    046721280664 s390/pkey: zeroize key blobs
    76169f749089 media: dvb-core: Fix use-after-free due to race condition at dvb_ca_en50221
    ca2d171fd1f3 media: dvb-core: Fix kernel WARNING for blocking operation in wait_event*()
    2ea7d26ed851 media: dvb-core: Fix use-after-free due on race condition at dvb_net
    415651c8f468 media: mn88443x: fix !CONFIG_OF error by drop of_match_ptr from ID table
    eb37fef417a2 media: ttusb-dec: fix memory leak in ttusb_dec_exit_dvb()
    1995e714725f media: dvb_ca_en50221: fix a size write bug
    b85233ab5335 media: netup_unidvb: fix irq init by register it at the end of probe
    74c80d2024d9 media: dvb-usb: dw2102: fix uninit-value in su3000_read_mac_address
    fcbb72b041d9 media: dvb-usb: digitv: fix null-ptr-deref in digitv_i2c_xfer()
    7945c13c9b7f media: dvb-usb-v2: rtl28xxu: fix null-ptr-deref in rtl28xxu_i2c_xfer
    2d47867a6b3c media: dvb-usb-v2: ce6230: fix null-ptr-deref in ce6230_i2c_master_xfer()
    647da51e4da7 media: dvb-usb-v2: ec168: fix null-ptr-deref in ec168_i2c_xfer()
    084e43d9a4c1 media: dvb-usb: az6027: fix three null-ptr-deref in az6027_i2c_xfer()
    a81280cf3343 media: dvb_demux: fix a bug for the continuity counter
    204e9082f6af ASoC: ssm2602: Add workaround for playback distortions
    beee708ccccc ASoC: dt-bindings: Adjust #sound-dai-cells on TI's single-DAI codecs
    bd99da647262 xfrm: Check if_id in inbound policy/secpath match
    5ee83fef0c24 ASoC: dwc: limit the number of overrun messages
    32f6f1bf1bef block/rnbd: replace REQ_OP_FLUSH with REQ_OP_WRITE
    01c3d3064975 nbd: Fix debugfs_create_dir error checking
    29f6b42a73b3 fbdev: stifb: Fix info entry in sti_struct on error path
    742dab42d70e fbdev: modedb: Add 1920x1080 at 60 Hz video mode
    d03d31d3a206 gfs2: Don't deref jdesc in evict
    fe4f6e159b9a media: rcar-vin: Select correct interrupt mode for V4L2_FIELD_ALTERNATE
    16ee4562c7bb ARM: 9295/1: unwind:fix unwind abort for uleb128 case
    a3393eb6fb41 btrfs: abort transaction when sibling keys check fails for leaves
    c12c288f1e67 mailbox: mailbox-test: Fix potential double-free in mbox_test_message_write()
    0dcf021af4cb ALSA: hda: Glenfly: add HD Audio PCI IDs and HDMI Codec Vendor IDs.
    d5fcccfc5010 watchdog: menz069_wdt: fix watchdog initialisation
    9823ac6e7ae1 mtd: rawnand: marvell: don't set the NAND frequency select
    e4666d793a22 mtd: rawnand: marvell: ensure timing values are written
    a437d3d25a27 net: dsa: mv88e6xxx: Increase wait after reset deactivation
    7c5c67aa2944 net/sched: flower: fix possible OOB write in fl_set_geneve_opt()
    f5c29a9e9146 net/mlx5: Read embedded cpu after init bit cleared
    f03bc013604c udp6: Fix race condition in udp6_sendmsg & connect
    57e6c5403427 net/netlink: fix NETLINK_LIST_MEMBERSHIPS length report
    ae7e941f4dc3 net: sched: fix NULL pointer dereference in mq_attach
    a8ad1303b9de net/sched: Prohibit regrafting ingress or clsact Qdiscs
    676f203803f9 net/sched: Reserve TC_H_INGRESS (TC_H_CLSACT) for ingress (clsact) Qdiscs
    18c76349afda net/sched: sch_clsact: Only create under TC_H_CLSACT
    1b0163b2dc3b net/sched: sch_ingress: Only create under TC_H_INGRESS
    dfb80ebc3bb4 tcp: Return user_mss for TCP_MAXSEG in CLOSE/LISTEN state if user_mss set
    cccc6209708f tcp: deny tcp_disconnect() when threads are waiting
    8f0365a3e286 af_packet: do not use READ_ONCE() in packet_bind()
    4de3c2c43c6f mtd: rawnand: ingenic: fix empty stub helper definitions
    11a1f2561b53 amd-xgbe: fix the false linkup in xgbe_phy_status
    fa909b138480 af_packet: Fix data-races of pkt_sk(sk)->num.
    616da05ff8a9 netrom: fix info-leak in nr_write_internal()
    d1b224cb7856 net/mlx5: fw_tracer, Fix event handling
    a864a8543cd5 dmaengine: pl330: rename _start to prevent build error
    33d7035dc224 iommu/amd: Don't block updates to GATag if guest mode is on
    bd9e61ee3e9d iommu/rockchip: Fix unwind goto issue
    75c60dacf0b4 RDMA/bnxt_re: Fix return value of bnxt_re_process_raw_qp_pkt_rx
    861868b06304 RDMA/bnxt_re: Fix a possible memory leak
    ff296fccebcb dmaengine: at_xdmac: fix potential Oops in at_xdmac_prep_interleaved()
    6b32ed353f44 dmaengine: at_xdmac: Move the free desc to the tail of the desc list
    3041b768cc0f dmaengine: at_xdmac: Fix race for the tx desc callback
    127afc87bb02 dmaengine: at_xdmac: Fix concurrency over chan's completed_cookie
    958226b3a663 RDMA/efa: Fix unsupported page sizes in device
    7d6662e4a4b6 RDMA/bnxt_re: Fix the page_size used during the MR creation
    b51c8962853e RDMA/bnxt_re: Code refactor while populating user MRs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index c23dd96547..883aabc9de 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f8048496a00def29e831a2dde503f9dc41350858"
-SRCREV_meta ?= "af3a4fed664af7cce2aef179812bdb572f690760"
+SRCREV_machine ?= "ca3e1d1a096f6f832182cc922164eb80f9c34b42"
+SRCREV_meta ?= "bdf41f170f57425ff7ec651a88d787d8554b6f86"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.182"
+LINUX_VERSION ?= "5.10.183"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 60627fa6ef..39a42ebd52 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.182"
+LINUX_VERSION ?= "5.10.183"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "710c1d3d6dc78d596514ccbd2fcc522154d06ce7"
-SRCREV_machine ?= "cf5955813dc42c3b912c370225d7b8b06a174e25"
-SRCREV_meta ?= "af3a4fed664af7cce2aef179812bdb572f690760"
+SRCREV_machine:qemuarm ?= "b8866faacf5938d92449ff29b1a70f3678814787"
+SRCREV_machine ?= "a2e1f5ef6d74a4c9f5656032e969d1238020071e"
+SRCREV_meta ?= "bdf41f170f57425ff7ec651a88d787d8554b6f86"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 63f30c250b..1e99e24284 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c07ca23533f6ea4b0c5d5ab3b3d3b4b5f361e036"
-SRCREV_machine:qemuarm64 ?= "32f59b5e5471134346fdee47ad92cf413d0949f5"
-SRCREV_machine:qemumips ?= "5f14b5b0a79815387ba790d4512f3a6c8b2adf2a"
-SRCREV_machine:qemuppc ?= "b71515906c0b182151512035c0c7475847018d3d"
-SRCREV_machine:qemuriscv64 ?= "b7c05c1d1a02709e45e38bee7d9690bd7fd9bbcb"
-SRCREV_machine:qemuriscv32 ?= "b7c05c1d1a02709e45e38bee7d9690bd7fd9bbcb"
-SRCREV_machine:qemux86 ?= "b7c05c1d1a02709e45e38bee7d9690bd7fd9bbcb"
-SRCREV_machine:qemux86-64 ?= "b7c05c1d1a02709e45e38bee7d9690bd7fd9bbcb"
-SRCREV_machine:qemumips64 ?= "c4c925d2becffbfb59ebd07f798ae027d3170a71"
-SRCREV_machine ?= "b7c05c1d1a02709e45e38bee7d9690bd7fd9bbcb"
-SRCREV_meta ?= "af3a4fed664af7cce2aef179812bdb572f690760"
+SRCREV_machine:qemuarm ?= "4b707a62625e8fe23b5b0c0a09edf6e585bbcac5"
+SRCREV_machine:qemuarm64 ?= "c397c6206489ac3461c6aba4f8d2e7b86f1e87af"
+SRCREV_machine:qemumips ?= "6e80c5bec3588a72fb128353c6ff56585abd869b"
+SRCREV_machine:qemuppc ?= "b7064086e1737cec9f9810a2825c0a6e691e3cba"
+SRCREV_machine:qemuriscv64 ?= "4fad5e082ddeadeb2a55042d151e3a3b519e2f53"
+SRCREV_machine:qemuriscv32 ?= "4fad5e082ddeadeb2a55042d151e3a3b519e2f53"
+SRCREV_machine:qemux86 ?= "4fad5e082ddeadeb2a55042d151e3a3b519e2f53"
+SRCREV_machine:qemux86-64 ?= "4fad5e082ddeadeb2a55042d151e3a3b519e2f53"
+SRCREV_machine:qemumips64 ?= "ef16c1d288827d14ae68defeb1b446aeae8b4141"
+SRCREV_machine ?= "4fad5e082ddeadeb2a55042d151e3a3b519e2f53"
+SRCREV_meta ?= "bdf41f170f57425ff7ec651a88d787d8554b6f86"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.182"
+LINUX_VERSION ?= "5.10.183"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


