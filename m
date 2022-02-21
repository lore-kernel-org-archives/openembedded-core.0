Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82682C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:15:06 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.11007.1645452905545247599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:15:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=VzMfXjyf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id b8so15363492pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wFRzJ/hNwZNNoKxrM1maqQIEE23uBR5G6ctXW4pNBc0=;
        b=VzMfXjyfz1S72yMuPnYN3y3L3yRDSn0p0enj03ht0+zcKVttfDGDVAYqglxO6EF9oy
         t8I1nLzdfSRQLMk8huey4GVelOszx3DFgARpwMZOJiqyxxVfoNm1Ajhd7lwj8a3koOHe
         GtiRo0oGe+XlodMhuqhenqrYv0RMCbaJV1twjqFCjwhayjxTncOYHIUpG2xAihhBmDlf
         zBXyJ46Ng7iRtTFd8igW4x464g9gtoIDnyn4+2myn2jm7SotpH6VhkWhSQpj4oBfohQS
         7t9nPrVRfBtKNLykdj8tNxpWUzeYxAQdryBQ1W/mDj6NzYYNrpcZtZ/MggSyY8bCXwqg
         bXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wFRzJ/hNwZNNoKxrM1maqQIEE23uBR5G6ctXW4pNBc0=;
        b=U+w/P9FN3qUZVKmogbyI7PpbccsW4nzdNIkYO0ycTyi9VEOE81k8V+fZcAx/eggOdh
         W2+MFY6ySeYZGIlq0kd2chebfLH5p6scOmZEqXsw9zgjP0oO/wEvJPzqe+D8kZD3Y2kM
         OHAW4qkl9gySLb3W8Yddrm2hwm8TR9GY3lBolppxQqeUjUsNgVzC/NYFahPOa2GIzuEL
         Z8AmIaLIlZ+m9zthVLIiB1yVDeYUPsiGLTNXIHfgSggwGX5maR+M2i4i1f5Uokv9qIu9
         nldbBl+3I/B1eP58hzj5+lV1KJIZXHQjKgKrTXDye5zAC+Et77qJQB19H7K4YgIfch4X
         uvXw==
X-Gm-Message-State: AOAM532GNGGF2RTNGxnOTUYB/xBODyQNgPOeQrHAUkrfFHy+A3qn7O6o
	22uAjQEMDI3IeCFrty03FeT1wXLgL9BUbu3p
X-Google-Smtp-Source: 
 ABdhPJxlQLv9L+8mNbanpaQ0eR7GpkxN7flhLi6GrLiraXih2P+HAqHWKxrjDvim8lnNf84nL/wbAQ==
X-Received: by 2002:a17:903:248f:b0:14f:acf5:a5c2 with SMTP id
 p15-20020a170903248f00b0014facf5a5c2mr6662891plw.167.1645452904587;
        Mon, 21 Feb 2022 06:15:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 8sm12919235pfl.164.2022.02.21.06.15.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 06:15:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/20] linux-yocto/5.4: update to v5.4.178
Date: Mon, 21 Feb 2022 04:14:14 -1000
Message-Id: 
 <049b7d65642de99a92df7db1e3c0b6e99c579dd4.1645452535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645452535.git.steve@sakoman.com>
References: <cover.1645452535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:15:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162044

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    76fd334f07cc Linux 5.4.178
    ed339069725a cgroup/cpuset: Fix "suspicious RCU usage" lockdep warning
    c8d7d7c58e64 ext4: fix error handling in ext4_restore_inline_data()
    f4a575eada7c EDAC/xgene: Fix deferred probing
    0f1ca7cea596 EDAC/altera: Fix deferred probing
    66c5aa5726bc rtc: cmos: Evaluate century appropriate
    2ffe36c9c4b6 selftests: futex: Use variable MAKE instead of make
    c17a316f3d53 nfsd: nfsd4_setclientid_confirm mistakenly expires confirmed client.
    53e4f71763c6 scsi: bnx2fc: Make bnx2fc_recv_frame() mp safe
    bfba4e8088ca pinctrl: bcm2835: Fix a few error paths
    71e60c170105 ASoC: max9759: fix underflow in speaker_gain_control_put()
    e7e396324fe2 ASoC: cpcap: Check for NULL pointer after calling of_get_child_by_name
    7709133f1f7a ASoC: xilinx: xlnx_formatter_pcm: Make buffer bytes multiple of period bytes
    e51b323f891f ASoC: fsl: Add missing error handling in pcm030_fabric_probe
    04698be843dc drm/i915/overlay: Prevent divide by zero bugs in scaling
    4a674b8e8a3c net: stmmac: ensure PTP time register reads are consistent
    9afc02864031 net: stmmac: dump gmac4 DMA registers correctly
    77454c9ada77 net: macsec: Verify that send_sci is on when setting Tx sci explicitly
    dc8c2f0d010c net: ieee802154: Return meaningful error codes from the netlink helpers
    6f38d3a6ec11 net: ieee802154: ca8210: Stop leaking skb's
    859ded7ac2a6 net: ieee802154: mcr20a: Fix lifs/sifs periods
    13be1165efda net: ieee802154: hwsim: Ensure proper channel selection at probe time
    8cfa026a212e spi: meson-spicc: add IRQ check in meson_spicc_probe
    fe58eb96bb41 spi: mediatek: Avoid NULL pointer crash in interrupt
    c9fc48511c65 spi: bcm-qspi: check for valid cs before applying chip select
    6e0498e24b13 iommu/amd: Fix loop timeout issue in iommu_ga_log_enable()
    5c43d46daa0d iommu/vt-d: Fix potential memory leak in intel_setup_irq_remapping()
    cff7faba8884 RDMA/mlx4: Don't continue event handler after memory allocation failure
    bc5d3e8b70d5 RDMA/siw: Fix broken RDMA Read Fence/Resume logic.
    60af6e686084 IB/rdmavt: Validate remote_addr during loopback atomic tests
    4bbb6e6a1caa memcg: charge fs_context and legacy_fs_context
    2f837785c2ec Revert "ASoC: mediatek: Check for error clk pointer"
    952717785218 block: bio-integrity: Advance seed correctly for larger interval sizes
    d3533ee20e9a mm/kmemleak: avoid scanning potential huge holes
    acc887ba8833 drm/nouveau: fix off by one in BIOS boundary checking
    26b3901d20bf btrfs: fix deadlock between quota disable and qgroup rescan worker
    e680e4d30186 ALSA: hda/realtek: Fix silent output on Gigabyte X570 Aorus Xtreme after reboot from Windows
    7e59f0554410 ALSA: hda/realtek: Fix silent output on Gigabyte X570S Aorus Master (newer chipset)
    d8fbf567e703 ALSA: hda/realtek: Add missing fixup-model entry for Gigabyte X570 ALC1220 quirks
    66b5dd10c2b0 ALSA: hda/realtek: Add quirk for ASUS GU603
    f2c5fde84cee ALSA: usb-audio: Simplify quirk entries with a macro
    fd9a23319f16 ASoC: ops: Reject out of bounds values in snd_soc_put_xr_sx()
    c33402b056de ASoC: ops: Reject out of bounds values in snd_soc_put_volsw_sx()
    68fd71872428 ASoC: ops: Reject out of bounds values in snd_soc_put_volsw()
    01baaf3bede9 audit: improve audit queue handling when "audit=1" on cmdline
    b8f53f917128 Linux 5.4.177
    4fc41403f0b6 af_packet: fix data-race in packet_setsockopt / packet_setsockopt
    db6c57d2666d cpuset: Fix the bug that subpart_cpus updated wrongly in update_cpumask()
    bd43771ee975 rtnetlink: make sure to refresh master_dev/m_ops in __rtnl_newlink()
    b1d17e920dfc net: sched: fix use-after-free in tc_new_tfilter()
    9892742f035f net: amd-xgbe: Fix skb data length underflow
    28bdf65a5612 net: amd-xgbe: ensure to reset the tx_timer_active flag
    f2a186a44e7e ipheth: fix EOVERFLOW in ipheth_rcvbulk_callback
    0e8283cbe499 cgroup-v1: Require capabilities to set release_agent
    2fd752ed77ab psi: Fix uaf issue when psi trigger is destroyed while being polled
    464da38ba827 PCI: pciehp: Fix infinite loop in IRQ handler upon power fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 72b11c3c2d..523ace3e14 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b24dd7e4d381fb2b855e46428087f1d2d5a2e98f"
-SRCREV_meta ?= "25910e8585d93aa555c747a9aaedccbc405c5134"
+SRCREV_machine ?= "40423bc7ab2cc609f955a3dc16a0d854c1504ce3"
+SRCREV_meta ?= "e8c675c7e11fbd96cd812dfb9f4f6fb6f92b6abb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.176"
+LINUX_VERSION ?= "5.4.178"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 227356a126..35177d4f6c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.176"
+LINUX_VERSION ?= "5.4.178"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ce298ed73f24a8529058476004cb973c86432cd9"
-SRCREV_machine ?= "0b50f433a66bfa7ff4baaf1383a53aa9bfec7b66"
-SRCREV_meta ?= "25910e8585d93aa555c747a9aaedccbc405c5134"
+SRCREV_machine_qemuarm ?= "f6e09845d8bf3c307da395497b21c1ff17ef575c"
+SRCREV_machine ?= "a7ba52065be4401b5d73b6b020770f7d260b7bf1"
+SRCREV_meta ?= "e8c675c7e11fbd96cd812dfb9f4f6fb6f92b6abb"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index be14fd4f8f..081052d87c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "eecb4a32b034e7ac5f3e54f68cf5263499f79b6f"
-SRCREV_machine_qemuarm64 ?= "6786585bee3d0de9cd8886fa4be54eafd0aeac8a"
-SRCREV_machine_qemumips ?= "4fe08e5a1c9b437ad0276448cfa63c5fa1b8303b"
-SRCREV_machine_qemuppc ?= "0f5916a777fc69030480f19b097b0e9fc035f4bf"
-SRCREV_machine_qemuriscv64 ?= "7cff5cd60103d5af3dd1e6b13bff1c7a9ef8e99d"
-SRCREV_machine_qemux86 ?= "7cff5cd60103d5af3dd1e6b13bff1c7a9ef8e99d"
-SRCREV_machine_qemux86-64 ?= "7cff5cd60103d5af3dd1e6b13bff1c7a9ef8e99d"
-SRCREV_machine_qemumips64 ?= "f15ba204e8f1c7fe33b248ae19d1b0b851c7272d"
-SRCREV_machine ?= "7cff5cd60103d5af3dd1e6b13bff1c7a9ef8e99d"
-SRCREV_meta ?= "25910e8585d93aa555c747a9aaedccbc405c5134"
+SRCREV_machine_qemuarm ?= "b3ee7c62bf5a5ce3c7e30aff6c3dd9f70a847a28"
+SRCREV_machine_qemuarm64 ?= "bf6581eba15cb43af60fda7053edaf66990c18ac"
+SRCREV_machine_qemumips ?= "05580fff716df568dc3f737b288e0e514a908572"
+SRCREV_machine_qemuppc ?= "0a016b0775980f67d686e47cc8637adec46856dc"
+SRCREV_machine_qemuriscv64 ?= "e2020dbe2ccaef50d7e8f37a5bf08c68a006a064"
+SRCREV_machine_qemux86 ?= "e2020dbe2ccaef50d7e8f37a5bf08c68a006a064"
+SRCREV_machine_qemux86-64 ?= "e2020dbe2ccaef50d7e8f37a5bf08c68a006a064"
+SRCREV_machine_qemumips64 ?= "68f35eeca08d2a681495fd3a7b823ac34d9a97bc"
+SRCREV_machine ?= "e2020dbe2ccaef50d7e8f37a5bf08c68a006a064"
+SRCREV_meta ?= "e8c675c7e11fbd96cd812dfb9f4f6fb6f92b6abb"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.176"
+LINUX_VERSION ?= "5.4.178"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


