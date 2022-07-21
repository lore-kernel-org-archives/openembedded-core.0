Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A44C43334
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 21:38:51 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.1062.1658439520809133216
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 14:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ssDXO6gJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id b9so2893655pfp.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 14:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gEnQFacqmdHKjODwxwMVjyOKiuZyPYo0hXBibGpVFA4=;
        b=ssDXO6gJjV1+K6rytiX/sRvpgykIq4UpQyPS+zrNDzq+IdkGFagsQcerITxFVqDVfi
         50Qg/Px0BsSNBR5qjYDWrdIqbq4WtKeygy2+SE3brR43Ll9qt9rRF2rFpfy1ph6X9Mxu
         pWPLReRRxeIX3dYGB7YSEaULzJsO3v6Lgtg1EpfVH3jytd3GzUY33Au2CJugKrEi4M7M
         0F+YIqZI5MvG366HDLyBqjCQev45WKaPk19PdqTcLaZ+R+VgbhtzQ2asJtNvJ5JDFMcg
         WVXulh40xIu9hp9Yp/Oem5OsZr3Y1E2tWbadd+mg2r/aNG1VzKj7w4yxH/cFvLNs7oiB
         3D2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gEnQFacqmdHKjODwxwMVjyOKiuZyPYo0hXBibGpVFA4=;
        b=RW0Pcuk9XdOzdmnDoFCt60iK1rxlN0P2e6HQy8ZhDeTn5Eqrxt62SYMONfEAkkEYRg
         OdxnKatg8eNzd77PvZExLPwZOevMeTD6LqOTu60EFEIFxubVth7iM472Kny71pW6k0f9
         5rsyWtX8UO3MScy+uQBhCVIf0hGxhlm9QaEtromW3XbnD/W294mUV4WLlr3+pQzhKpEd
         mf9e+j9i/d7SLjVA6r9Fnu+dwt7Pc9eIF5JVMQNE1/8C4R3aCBaW5XL6BdmZvQA6t5XI
         PM91ZSAZ0RjjncBQh3vBYuw4dZX5LUFmutM9TrqeKWqB5wuDNVHog+wvqxbqkDDE6azF
         PDOQ==
X-Gm-Message-State: AJIora8gI1oLzmUA55rMexkb1vydK/O7q6hdSDna0lz8cdVLJpO3ALZP
	kIpD6EByC0X9nP9Jyxv2w8qgI+2DDDK94UMt
X-Google-Smtp-Source: 
 AGRyM1txbHOgIkhdegHhUQapauu9gZycnru9uqbYIIWZHxTYdCcCZrnVZiAn6a7NAmYEdK487C98yA==
X-Received: by 2002:a65:6cc4:0:b0:412:35fa:5bce with SMTP id
 g4-20020a656cc4000000b0041235fa5bcemr338748pgw.466.1658439519324;
        Thu, 21 Jul 2022 14:38:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x184-20020a6263c1000000b005283f9e9b19sm2194275pfb.180.2022.07.21.14.38.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 14:38:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/4] linux-yocto/5.4: update to v5.4.205
Date: Thu, 21 Jul 2022 11:38:18 -1000
Message-Id: 
 <c954fc1097cb99b7caac764db007f6b2541c248f.1658429064.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658429064.git.steve@sakoman.com>
References: <cover.1658429064.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Jul 2022 21:38:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168395

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    0ec831fa971d Linux 5.4.205
    1be11d7f3c89 dmaengine: ti: Add missing put_device in ti_dra7_xbar_route_allocate
    b31ab132561c dmaengine: ti: Fix refcount leak in ti_dra7_xbar_route_allocate
    f19026ede26e dmaengine: at_xdma: handle errors of at_xdmac_alloc_desc() correctly
    164e88024f82 dmaengine: pl330: Fix lockdep warning about non-static key
    5af3f2a697d5 ida: don't use BUG_ON() for debugging
    d88022b41eff dt-bindings: dma: allwinner,sun50i-a64-dma: Fix min/max typo
    aaf875578fd9 misc: rtsx_usb: set return value in rsp_buf alloc err path
    29612c43a2c5 misc: rtsx_usb: use separate command and response buffers
    0e517d0d7feb misc: rtsx_usb: fix use of dma mapped buffer for usb bulk transfer
    858c2d070895 dmaengine: imx-sdma: Allow imx8m for imx7 FW revs
    67586906893c i2c: cadence: Unregister the clk notifier in error path
    acb72388aed5 selftests: forwarding: fix error message in learning_test
    7adf3d45c460 selftests: forwarding: fix learning_test when h1 supports IFF_UNICAST_FLT
    681738560bf2 selftests: forwarding: fix flood_unicast_test when h2 supports IFF_UNICAST_FLT
    0711d15ccb27 ibmvnic: Properly dispose of all skbs during a failover.
    aa698affa62c ARM: at91: pm: use proper compatibles for sam9x60's rtc and rtt
    6b4747d5af43 ARM: at91: pm: use proper compatible for sama5d2's rtc
    123540275034 pinctrl: sunxi: sunxi_pconf_set: use correct offset
    12a690536931 pinctrl: sunxi: a83t: Fix NAND function name for some pins
    3cf8ece91132 ARM: meson: Fix refcount leak in meson_smp_prepare_cpus
    c465bbcd3c74 xfs: remove incorrect ASSERT in xfs_rename
    845dac0276a5 can: kvaser_usb: kvaser_usb_leaf: fix bittiming limits
    9afdff9dd820 can: kvaser_usb: kvaser_usb_leaf: fix CAN clock frequency regression
    93f228fcbef2 can: kvaser_usb: replace run-time checks with struct kvaser_usb_driver_info
    0adb049bac09 powerpc/powernv: delay rng platform device creation until later in boot
    782b65ee7bbe video: of_display_timing.h: include errno.h
    af93e8219734 fbcon: Prevent that screen size is smaller than font size
    4f34f380f952 fbcon: Disallow setting font bigger than screen size
    997d86cd3e39 fbmem: Check virtual screen sizes in fb_set_var()
    407c1b491fbd fbdev: fbmem: Fix logo center image dx issue
    14ff1184310f iommu/vt-d: Fix PCI bus rescan device hot add
    800bb66ab275 net: rose: fix UAF bug caused by rose_t0timer_expiry
    04894ab34faf usbnet: fix memory leak in error case
    6f655b5e13fa can: gs_usb: gs_usb_open/close(): fix memory leak
    eb7bbd7728da can: grcan: grcan_probe(): remove extra of_node_get()
    5b48f5711f1c can: bcm: use call_rcu() instead of costly synchronize_rcu()
    e7e3e90d6710 mm/slub: add missing TID updates on slab deactivation
    3defefd22ad5 esp: limit skb_page_frag_refill use to a single page
    49286fbdad47 Linux 5.4.204
    0ac2845937ce clocksource/drivers/ixp4xx: remove EXPORT_SYMBOL_GPL from ixp4xx_timer_setup()
    d40057538bee net: usb: qmi_wwan: add Telit 0x1070 composition
    ea89a522b4cc net: usb: qmi_wwan: add Telit 0x1060 composition
    5c03cad51b84 xen/arm: Fix race in RB-tree based P2M accounting
    60ac50daad36 xen/blkfront: force data bouncing when backend is untrusted
    ede57be88a5f xen/netfront: force data bouncing when backend is untrusted
    04945b5beb73 xen/netfront: fix leaking data in shared pages
    42112e8f9461 xen/blkfront: fix leaking data in shared pages
    b7c996abe545 selftests/rseq: Change type of rseq_offset to ptrdiff_t
    dc2825288012 selftests/rseq: x86-32: use %gs segment selector for accessing rseq thread area
    f89d15c9861c selftests/rseq: x86-64: use %fs segment selector for accessing rseq thread area
    618da2318e15 selftests/rseq: Fix: work-around asm goto compiler bugs
    58082d4e8186 selftests/rseq: Remove arm/mips asm goto compiler work-around
    1c9f13880f47 selftests/rseq: Fix warnings about #if checks of undefined tokens
    6f87493c3aa6 selftests/rseq: Fix ppc32 offsets by using long rather than off_t
    4e9c8fd7f7f0 selftests/rseq: Fix ppc32 missing instruction selection "u" and "x" for load/store
    d0ca70238f40 selftests/rseq: Fix ppc32: wrong rseq_cs 32-bit field pointer on big endian
    20e2f0108539 selftests/rseq: Uplift rseq selftests for compatibility with glibc-2.35
    71c04fdf59ca selftests/rseq: Introduce thread pointer getters
    f491e073b992 selftests/rseq: Introduce rseq_get_abi() helper
    158d91ffe0be selftests/rseq: Remove volatile from __rseq_abi
    7037c511f67d selftests/rseq: Remove useless assignment to cpu variable
    9aa134cb66b4 selftests/rseq: introduce own copy of rseq uapi header
    8417f4475959 selftests/rseq: remove ARRAY_SIZE define from individual tests
    b13119007056 rseq/selftests,x86_64: Add rseq_offset_deref_addv()
    7b6bffcfb9d3 ipv6/sit: fix ipip6_tunnel_get_prl return value
    05387c4ff568 sit: use min
    e99a98616191 net: dsa: bcm_sf2: force pause link settings
    ac9cd4f66a4d hwmon: (ibmaem) don't call platform_device_del() if platform_device_add() fails
    ee25841221c1 xen/gntdev: Avoid blocking in unmap_grant_pages()
    5eac00ef2a11 net: tun: avoid disabling NAPI twice
    8f968872ec34 NFC: nxp-nci: Don't issue a zero length i2c_master_read()
    37287fd28fb0 nfc: nfcmrvl: Fix irq_of_parse_and_map() return value
    893825289ba8 net: bonding: fix use-after-free after 802.3ad slave unbind
    6fdef80e7eaa net: bonding: fix possible NULL deref in rlb code
    bb1dc7cc576e net/sched: act_api: Notify user space if any actions were flushed before error
    3b2ddeb89fe7 netfilter: nft_dynset: restore set element counter when failing to update
    5b3a1c6bca38 s390: remove unneeded 'select BUILD_BIN2C'
    bdecd912e99a PM / devfreq: exynos-ppmu: Fix refcount leak in of_get_devfreq_events
    e1284ec4a6d7 caif_virtio: fix race between virtio_device_ready() and ndo_open()
    9204bc3e8722 net: ipv6: unexport __init-annotated seg6_hmac_net_init()
    7a79f71f6931 usbnet: fix memory allocation in helpers
    5af106f8e072 linux/dim: Fix divide by 0 in RDMA DIM
    85d7d672e896 RDMA/qedr: Fix reporting QP timeout attribute
    ea0519bc578d net: tun: stop NAPI when detaching queues
    a8cf91902237 net: tun: unlink NAPI from device on destruction
    22e75461014b selftests/net: pass ipv6_args to udpgso_bench's IPv6 TCP test
    1d877327da33 virtio-net: fix race between ndo_open() and virtio_device_ready()
    7f89bb5d7102 net: usb: ax88179_178a: Fix packet receiving
    bb91556d2af0 net: rose: fix UAF bugs caused by timer handler
    76a477d39836 SUNRPC: Fix READ_PLUS crasher
    13816057eaf2 s390/archrandom: simplify back to earlier design and initialize earlier
    f157bd9cf377 dm raid: fix KASAN warning in raid5_add_disks
    90de15357504 dm raid: fix accesses beyond end of raid member array
    b6125c5dc3d6 powerpc/bpf: Fix use of user_pt_regs in uapi
    1ef2e87736a6 powerpc/prom_init: Fix kernel config grep
    d5e32f08e7f1 nvdimm: Fix badblocks clear off-by-one error
    53fb996f2709 ipv6: take care of disable_policy when restoring routes

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 7fa1b81229..5bc1993cf2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "fa8536530bdd6a87856aa6fe0af4f9ef4af21fe0"
-SRCREV_meta ?= "010ac788e81b6cb6c3fd2367802eee9d8feac34f"
+SRCREV_machine ?= "086bb7f7d2b47d654922e5cc526cc6274b28e319"
+SRCREV_meta ?= "aaaf9f090dfb3160154b24fbc2f9a6e669babc87"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.203"
+LINUX_VERSION ?= "5.4.205"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index d08658cf7e..769743856f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.203"
+LINUX_VERSION ?= "5.4.205"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "d92cd7d5916772a20105ef776c7f3bf433df55a4"
-SRCREV_machine ?= "5f7c3e952857eb90a4113a41901bb770150af46b"
-SRCREV_meta ?= "010ac788e81b6cb6c3fd2367802eee9d8feac34f"
+SRCREV_machine_qemuarm ?= "6a3e65256e24a2ff0e4e9fcd877987fb8afd12f2"
+SRCREV_machine ?= "d730b865a7cb7ff89efcf8ac725ca247283f3eeb"
+SRCREV_meta ?= "aaaf9f090dfb3160154b24fbc2f9a6e669babc87"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 545c754c1d..1043da7208 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "bf4029e0d9ff2e65d654909d7e9df50dce294c77"
-SRCREV_machine_qemuarm64 ?= "3e0dab732964f7bbc26671fee05be420fd02890a"
-SRCREV_machine_qemumips ?= "e8bea70e0c6a527383f2351e4f3d189aedf543a3"
-SRCREV_machine_qemuppc ?= "24cc2a066b8151925fdf86136b70b63cf37cc540"
-SRCREV_machine_qemuriscv64 ?= "9eab27738de4b3222b1c99cdebf3bde9611ef9fa"
-SRCREV_machine_qemux86 ?= "9eab27738de4b3222b1c99cdebf3bde9611ef9fa"
-SRCREV_machine_qemux86-64 ?= "9eab27738de4b3222b1c99cdebf3bde9611ef9fa"
-SRCREV_machine_qemumips64 ?= "5a5e07ef8df0e73b2f318b921f9262b49a6125d5"
-SRCREV_machine ?= "9eab27738de4b3222b1c99cdebf3bde9611ef9fa"
-SRCREV_meta ?= "010ac788e81b6cb6c3fd2367802eee9d8feac34f"
+SRCREV_machine_qemuarm ?= "943e7e1f32e61dc7dd7a7029062e789219d81b14"
+SRCREV_machine_qemuarm64 ?= "24d18667d92b460ee33480942306a0d9c80c491b"
+SRCREV_machine_qemumips ?= "2d469a0343033962ecea678491852aa9457b8ff6"
+SRCREV_machine_qemuppc ?= "85932dee050f49fa824fd9b49af7b8159fe28a8e"
+SRCREV_machine_qemuriscv64 ?= "8a59dfded81659402005acfb06fbb00b71c8ce86"
+SRCREV_machine_qemux86 ?= "8a59dfded81659402005acfb06fbb00b71c8ce86"
+SRCREV_machine_qemux86-64 ?= "8a59dfded81659402005acfb06fbb00b71c8ce86"
+SRCREV_machine_qemumips64 ?= "0edbd472c7f0b51994d20d07bb26ead379dc10ed"
+SRCREV_machine ?= "8a59dfded81659402005acfb06fbb00b71c8ce86"
+SRCREV_meta ?= "aaaf9f090dfb3160154b24fbc2f9a6e669babc87"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.203"
+LINUX_VERSION ?= "5.4.205"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


