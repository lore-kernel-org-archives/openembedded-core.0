Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5D0C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:31:28 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.21602.1658104284020762522
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=CnfB1+d5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id b133so5536831pfb.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=g1VhelW9nkEP3cvUbSUhv2I6Qqhp7ixubKw3oYWVqH8=;
        b=CnfB1+d5V3rb077yuMOVsJaFVSVVzRXGi6emB6eCw6KG1l1vqcF72xbCVTQRwbDpJg
         fOcw/obLvKpHe2hC7gWhYd6CpsAVPIi/yKaxb/OburzMDlQ64fupxMTqYtoYhHOaB2q6
         602c3EghXB8EWaprxLScdtCvF6fmHvo/85RQw8D1Hi1n/mPgHtRgmkwAJAp41TqCiINR
         YUyZexMdz27jaQZLDftOCfJHlc9Z417jnT15N/KyzTTcWI12vRWC3IECPy+D8UTk+j3Z
         ScDmgCpYLl7M9IPowioH7NUxf9bFs3KV0AEZfshokZn6L3HgXCWNnhY+O3nrnjxoKhw1
         AhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g1VhelW9nkEP3cvUbSUhv2I6Qqhp7ixubKw3oYWVqH8=;
        b=Oc/yJq82oOGSjFYaFrY2W1egLa1cq3o6ZID8/1mQiCw0vQXCdZswcCH5ZSLZotsRfR
         D3xi9yuqb1NpBVIYGBOGNhqrtnhtwKJDvb1I0Hp5spUYaRWHppUnrghJJ3Xzl+nK8YkO
         zc/GrV16GLHw2m60I8yCmb69skoTYKXuyvUUoVWZN0tD1BiC+vbyzghmQDXXOn/Gy0Zh
         FA+wQNbXOLYrBqDzQEraj6+PXbKSf897Vo6jjX1CxpQN8oqA2GeN20JHc3dS7leoF+2A
         zFPf0JUEsPVFm16otMmkPRwJw47yXXYPO2sNDzXih44SKhv+3+Z5bwQUZ7GKVDOilgDs
         32LQ==
X-Gm-Message-State: AJIora86aCAO8P1dzlIbfakcpq6Xa5zqepf/JwX3EXF7uU5cT89CA7V3
	CsV0zxYj9A8+Cy8RlaBGps993GVIfdmtv/ci
X-Google-Smtp-Source: 
 AGRyM1uHdqW64QqWq1j0zbLpdx5ZoeY4s6SPEGz/RUyfxG77sbz9DAXt20tFVgPBPoZq0dgY3Exrfw==
X-Received: by 2002:a63:8049:0:b0:415:d366:7229 with SMTP id
 j70-20020a638049000000b00415d3667229mr22956402pgd.137.1658104282776;
        Sun, 17 Jul 2022 17:31:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm9958183pjd.22.2022.07.17.17.31.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:31:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/23] linux-yocto/5.10: update to v5.10.130
Date: Sun, 17 Jul 2022 14:30:09 -1000
Message-Id: 
 <ea72e5ed56c9338849d973da13581441c8d84afa.1658093505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658093505.git.steve@sakoman.com>
References: <cover.1658093505.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:31:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168173

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    26ae9c361414 Linux 5.10.130
    8365b151fd50 dmaengine: ti: Add missing put_device in ti_dra7_xbar_route_allocate
    37147e22cd8d dmaengine: ti: Fix refcount leak in ti_dra7_xbar_route_allocate
    1be247db203e dmaengine: at_xdma: handle errors of at_xdmac_alloc_desc() correctly
    7b721f5aec92 dmaengine: pl330: Fix lockdep warning about non-static key
    e23cfb3fdcbb ida: don't use BUG_ON() for debugging
    37995f034ff2 dt-bindings: dma: allwinner,sun50i-a64-dma: Fix min/max typo
    ca4a91958466 misc: rtsx_usb: set return value in rsp_buf alloc err path
    ff79e0ca2bea misc: rtsx_usb: use separate command and response buffers
    af7d9d4abe84 misc: rtsx_usb: fix use of dma mapped buffer for usb bulk transfer
    86884017bb63 dmaengine: imx-sdma: Allow imx8m for imx7 FW revs
    9b329edd77ca i2c: cadence: Unregister the clk notifier in error path
    26938bd28c0c r8169: fix accessing unset transport header
    904f622ec78e selftests: forwarding: fix error message in learning_test
    9906c223400f selftests: forwarding: fix learning_test when h1 supports IFF_UNICAST_FLT
    859b889029fc selftests: forwarding: fix flood_unicast_test when h2 supports IFF_UNICAST_FLT
    23cdc57d88d1 ibmvnic: Properly dispose of all skbs during a failover.
    2b4659c145ba i40e: Fix dropped jumbo frames statistics
    5561bddd0599 xsk: Clear page contiguity bit when unmapping pool
    87d2bb888259 ARM: dts: at91: sama5d2_icp: fix eeprom compatibles
    9b7d8e28b686 ARM: dts: at91: sam9x60ek: fix eeprom compatible and size
    ade03e5ea778 ARM: at91: pm: use proper compatibles for sam9x60's rtc and rtt
    b40ac801cbb1 ARM: at91: pm: use proper compatible for sama5d2's rtc
    4c3e73a66a27 arm64: dts: qcom: msm8992-*: Fix vdd_lvs1_2-supply typo
    1d0c3ced2d1c pinctrl: sunxi: sunxi_pconf_set: use correct offset
    e1cda2a03d81 arm64: dts: imx8mp-evk: correct I2C3 pad settings
    2ade1b1d92f6 arm64: dts: imx8mp-evk: correct gpio-led pad settings
    17b3883ba55f arm64: dts: imx8mp-evk: correct the uart2 pinctl value
    43319ee6a075 arm64: dts: imx8mp-evk: correct mmc pad settings
    6bf74a1e748f arm64: dts: qcom: msm8994: Fix CPU6/7 reg values
    2c0d10ce002a pinctrl: sunxi: a83t: Fix NAND function name for some pins
    3d90607e7e6a ARM: meson: Fix refcount leak in meson_smp_prepare_cpus
    e14930e9f9c6 xfs: remove incorrect ASSERT in xfs_rename
    852952ea0e15 can: kvaser_usb: kvaser_usb_leaf: fix bittiming limits
    a741e762e199 can: kvaser_usb: kvaser_usb_leaf: fix CAN clock frequency regression
    f439d08ef1a2 can: kvaser_usb: replace run-time checks with struct kvaser_usb_driver_info
    79af7be44ccb powerpc/powernv: delay rng platform device creation until later in boot
    19104425c962 video: of_display_timing.h: include errno.h
    96fa24eb1a38 memregion: Fix memregion_free() fallback definition
    d6931bff1cc1 PM: runtime: Redefine pm_runtime_release_supplier()
    cecb806c766c fbcon: Prevent that screen size is smaller than font size
    b727561ddc93 fbcon: Disallow setting font bigger than screen size
    b81212828ad1 fbmem: Check virtual screen sizes in fb_set_var()
    d03e8ed72d7d fbdev: fbmem: Fix logo center image dx issue
    963c80f070ed iommu/vt-d: Fix PCI bus rescan device hot add
    0a5e36dbcb44 netfilter: nf_tables: stricter validation of element data
    4a6430b99f67 netfilter: nft_set_pipapo: release elements in clone from abort path
    4f59d12efe30 net: rose: fix UAF bug caused by rose_t0timer_expiry
    0085da9df3dc usbnet: fix memory leak in error case
    e917be1f83ea bpf: Fix insufficient bounds propagation from adjust_scalar_min_max_vals
    9adec7334969 bpf: Fix incorrect verifier simulation around jmp32's jeq/jne
    d0b8e2239988 can: gs_usb: gs_usb_open/close(): fix memory leak
    b6f4b347a1fb can: grcan: grcan_probe(): remove extra of_node_get()
    85cd41070df9 can: bcm: use call_rcu() instead of costly synchronize_rcu()
    b75d4bec85b8 ALSA: hda/realtek: Add quirk for Clevo L140PU
    6c32496964da mm/slub: add missing TID updates on slab deactivation
    7208d1236f72 Linux 5.10.129
    0e21ef18019c clocksource/drivers/ixp4xx: remove EXPORT_SYMBOL_GPL from ixp4xx_timer_setup()
    7055e3446244 net: usb: qmi_wwan: add Telit 0x1070 composition
    f1a53bb27f17 net: usb: qmi_wwan: add Telit 0x1060 composition
    43c8d33ce353 xen/arm: Fix race in RB-tree based P2M accounting
    547b7c640df5 xen-netfront: restore __skb_queue_tail() positioning in xennet_get_responses()
    cbbd2d253153 xen/blkfront: force data bouncing when backend is untrusted
    4923217af574 xen/netfront: force data bouncing when backend is untrusted
    728d68bfe68d xen/netfront: fix leaking data in shared pages
    cfea428030be xen/blkfront: fix leaking data in shared pages
    d341e5a75480 selftests/rseq: Change type of rseq_offset to ptrdiff_t
    7e617278bf3a selftests/rseq: x86-32: use %gs segment selector for accessing rseq thread area
    27f6361cb415 selftests/rseq: x86-64: use %fs segment selector for accessing rseq thread area
    a4312e2d8192 selftests/rseq: Fix: work-around asm goto compiler bugs
    7e1a0a9a4442 selftests/rseq: Remove arm/mips asm goto compiler work-around
    ba4d79af7101 selftests/rseq: Fix warnings about #if checks of undefined tokens
    35c6f5047ff3 selftests/rseq: Fix ppc32 offsets by using long rather than off_t
    dbc1f0ee6044 selftests/rseq: Fix ppc32 missing instruction selection "u" and "x" for load/store
    d4f631ea2dd6 selftests/rseq: Fix ppc32: wrong rseq_cs 32-bit field pointer on big endian
    e85fdae4df72 selftests/rseq: Uplift rseq selftests for compatibility with glibc-2.35
    c79e564535c0 selftests/rseq: Introduce thread pointer getters
    4a78bf83e226 selftests/rseq: Introduce rseq_get_abi() helper
    3c2a416c80cc selftests/rseq: Remove volatile from __rseq_abi
    68e1232c6e93 selftests/rseq: Remove useless assignment to cpu variable
    3e77ed4f9052 selftests/rseq: introduce own copy of rseq uapi header
    54cd556487d4 selftests/rseq: remove ARRAY_SIZE define from individual tests
    14894cf6925c hwmon: (ibmaem) don't call platform_device_del() if platform_device_add() fails
    f72d410dbf8d ipv6/sit: fix ipip6_tunnel_get_prl return value
    25055da22a0f sit: use min
    652fd40eb01c drivers: cpufreq: Add missing of_node_put() in qoriq-cpufreq.c
    79963021fd71 xen/gntdev: Avoid blocking in unmap_grant_pages()
    5f614f5f70bf tcp: add a missing nf_reset_ct() in 3WHS handling
    9203dfb3ed6b xfs: fix xfs_reflink_unshare usage of filemap_write_and_wait_range
    f874e16870cc xfs: update superblock counters correctly for !lazysbcount
    7ab7458d7af7 xfs: fix xfs_trans slab cache name
    f12968a5a4be xfs: ensure xfs_errortag_random_default matches XFS_ERRTAG_MAX
    da61388f9a75 xfs: Skip repetitive warnings about mount options
    6b7dab812cba xfs: rename variable mp to parsing_mp
    b261cd005ab9 xfs: use current->journal_info for detecting transaction recursion
    c36d41b65e57 net: tun: avoid disabling NAPI twice
    59c51c3b5451 tunnels: do not assume mac header is set in skb_tunnel_check_pmtu()
    c9fc52c1739e io_uring: ensure that send/sendmsg and recv/recvmsg check sqe->ioprio
    b8def021ac70 epic100: fix use after free on rmmod
    456bc338871c tipc: move bc link creation back to tipc_node_create
    09f994623530 NFC: nxp-nci: Don't issue a zero length i2c_master_read()
    7d363362e006 nfc: nfcmrvl: Fix irq_of_parse_and_map() return value
    63b2fe509f69 net: bonding: fix use-after-free after 802.3ad slave unbind
    7597ed348e62 net: bonding: fix possible NULL deref in rlb code
    ac12337229ea net/sched: act_api: Notify user space if any actions were flushed before error
    91d3bb82c43e netfilter: nft_dynset: restore set element counter when failing to update
    4b480a7940ff s390: remove unneeded 'select BUILD_BIN2C'
    e65027fdebba PM / devfreq: exynos-ppmu: Fix refcount leak in of_get_devfreq_events
    653bdcd833b7 caif_virtio: fix race between virtio_device_ready() and ndo_open()
    208ff7967534 NFSD: restore EINVAL error translation in nfsd_commit()
    db82bb605404 net: ipv6: unexport __init-annotated seg6_hmac_net_init()
    eb1757ca20b8 usbnet: fix memory allocation in helpers
    fae2a9fb1eaf linux/dim: Fix divide by 0 in RDMA DIM
    b0cab8b517ae RDMA/cm: Fix memory leak in ib_cm_insert_listen
    9de276dfb20c RDMA/qedr: Fix reporting QP timeout attribute
    a42bd00f0035 net: dp83822: disable rx error interrupt
    9c06d84855bd net: dp83822: disable false carrier interrupt
    c70ca16f72b2 net: tun: stop NAPI when detaching queues
    bec1be0a745a net: tun: unlink NAPI from device on destruction
    0b2499c8014f net: dsa: bcm_sf2: force pause link settings
    3f55912a1a98 selftests/net: pass ipv6_args to udpgso_bench's IPv6 TCP test
    f7b8fb458445 virtio-net: fix race between ndo_open() and virtio_device_ready()
    c0a28f2ddf9a net: usb: ax88179_178a: Fix packet receiving
    8f74cb27c2b4 net: rose: fix UAF bugs caused by timer handler
    6a0b9512a6aa SUNRPC: Fix READ_PLUS crasher
    ed03a650fb57 s390/archrandom: simplify back to earlier design and initialize earlier
    d8bca518d527 dm raid: fix KASAN warning in raid5_add_disks
    9bf2b0757b04 dm raid: fix accesses beyond end of raid member array
    213c550deb6b powerpc/bpf: Fix use of user_pt_regs in uapi
    68a34e478ad5 powerpc/book3e: Fix PUD allocation size in map_kernel_page()
    e188bbdb9229 powerpc/prom_init: Fix kernel config grep
    e6a7d30b650a nvdimm: Fix badblocks clear off-by-one error
    0b99c4a18936 nvme-pci: add NVME_QUIRK_BOGUS_NID for ADATA XPG SX6000LNP (AKA SPECTRIX S40G)
    e77804158b30 ipv6: take care of disable_policy when restoring routes
    03b9e016598f drm/amdgpu: To flush tlb for MMHUB of RAVEN series

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d0f5a8d1c8fba0ae1c6c7ed0e2c602feb97c7983)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index c705b7c07a..40cc21bceb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2f72685aa16ee5e1c8c53df03457b223a6996540"
-SRCREV_meta ?= "2f79722c50ad61cf055b40e8ba6d6f48e8dc6db0"
+SRCREV_machine ?= "faeb2e0ef8f7014788d4e8152d4f5698a7472e0f"
+SRCREV_meta ?= "96ea2660bb97e15f48f4885b9e436f24c3606bd9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.128"
+LINUX_VERSION ?= "5.10.130"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 6336ef544f..2993ddc951 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.128"
+LINUX_VERSION ?= "5.10.130"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "3b951d9995d83be4e2985d6aa904d59cb9ac7692"
-SRCREV_machine ?= "f2b78db2b548501a7b0b17f76b9ee2f09978fb30"
-SRCREV_meta ?= "2f79722c50ad61cf055b40e8ba6d6f48e8dc6db0"
+SRCREV_machine:qemuarm ?= "da9808c1a36f935dec2b90fb5fa5f9df4ff400a3"
+SRCREV_machine ?= "bf0ae2ab0102a68bad4a586fd42ceb78cc0a24e1"
+SRCREV_meta ?= "96ea2660bb97e15f48f4885b9e436f24c3606bd9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 96c77e6a87..b1c991f55b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8b54878acc1161bdcfa3a1153cb2fff39c675b89"
-SRCREV_machine:qemuarm64 ?= "2db48159f4444dcfa0c0dab5804769ea528bb6ed"
-SRCREV_machine:qemumips ?= "fc5fb9c35b8c52a3b1b2348a56237b6f1bb7fc6b"
-SRCREV_machine:qemuppc ?= "736b1667a61f21d7a1b8c88e8cedb648e79e687b"
-SRCREV_machine:qemuriscv64 ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
-SRCREV_machine:qemuriscv32 ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
-SRCREV_machine:qemux86 ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
-SRCREV_machine:qemux86-64 ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
-SRCREV_machine:qemumips64 ?= "2105a97021e3d0c565d84947e5cd45dd77be07e3"
-SRCREV_machine ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
-SRCREV_meta ?= "2f79722c50ad61cf055b40e8ba6d6f48e8dc6db0"
+SRCREV_machine:qemuarm ?= "859babe91947ce09d70f8be4c8b314d9712a30ea"
+SRCREV_machine:qemuarm64 ?= "0a59ce2115693d52b931b0fc72f5699a22a77e81"
+SRCREV_machine:qemumips ?= "5bebdf68c5391f8a56f98a8cb31522c0627e05e0"
+SRCREV_machine:qemuppc ?= "0f4a4f1329c7331a02d36f7195f9414e40709d43"
+SRCREV_machine:qemuriscv64 ?= "a6e419710dedbe0390cbf30267c13752b9161972"
+SRCREV_machine:qemuriscv32 ?= "a6e419710dedbe0390cbf30267c13752b9161972"
+SRCREV_machine:qemux86 ?= "a6e419710dedbe0390cbf30267c13752b9161972"
+SRCREV_machine:qemux86-64 ?= "a6e419710dedbe0390cbf30267c13752b9161972"
+SRCREV_machine:qemumips64 ?= "03dc9bc06ba1b7d105467bea334e84b3666b67f4"
+SRCREV_machine ?= "a6e419710dedbe0390cbf30267c13752b9161972"
+SRCREV_meta ?= "96ea2660bb97e15f48f4885b9e436f24c3606bd9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.128"
+LINUX_VERSION ?= "5.10.130"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


