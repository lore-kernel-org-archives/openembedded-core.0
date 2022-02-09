Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27E9C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 23:03:57 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web12.2803.1644447837198580948
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 15:03:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ik/T5dqO;
 spf=pass (domain: gmail.com, ip: 209.85.217.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id j5so1113631vsm.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 15:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v23qN+ATbwsdZ0mnSmNgIcIGwc9SyiiqzW1niTwtOec=;
        b=Ik/T5dqODCcc/aYks+J8+cSOKGzxhPJz79XWcrCxEWteOHzoxDWiyoK6WV9xjvtJ5Z
         FVai+zxvDNEoIMWYeBtC3Gp5FbUwssrY3zi0wm5B9vAHvIkd8QDBZW9zxZjpKJGsgcMW
         5eHD4LwL6r5e8oQE2SqsGHF7NlEiG4Na5GDAxfGRQQaH/DM8o+LwbGQSC/Bn2koODdeD
         8fsgZGTNioM9DI5Kc51wyv7t9YhNDNHBl+pobUs19SZUlDPBXuWJA08xSjz3vwJB7H6K
         haK3gY+zwUN61VHD4sqC2atAm9l2cWOwpFs/p68TkwIh9mR6MfMeqaCzT47dWWviXDM4
         8+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v23qN+ATbwsdZ0mnSmNgIcIGwc9SyiiqzW1niTwtOec=;
        b=DIgA1JoJYtfYLaYD67qj2vcXR99aa7PzZbwG5pnjACi8yi1JY1uWLNhKImcpZLqLmH
         sDDEj3GFj1+lh4e1ia3tIIkdk1fV0FtE/NN+/ULIBAVtzYQdMxE8TScTpyppAvqmaCyI
         yYvB0kc6TSKT1BIga3QVuWk/SP92e/Y9YZdn46LnUFAOHhWyTogH7xddszbH04X64P7C
         fbwKIlSmg14Jwc4ciG+/rwMv3ZzvGZpEGIJxkrR6CzQ6WSxmTpMm1JTsmGhv8wMzu71V
         6GadOWqV8MKeciPP8ipFDz/0bG0tEA6UF2HU7QcvnR3T5tkd+DMzZjlyqgExZsjlReCO
         EiUg==
X-Gm-Message-State: AOAM532k71q232kBNJvnCtVDehWb/1JZW8rvRSiVNVcebesxHPDqOR/b
	qvJBs0LCkc3nWw4ocS7EBNo=
X-Google-Smtp-Source: 
 ABdhPJwT8FkBwyOXtEq1psGlFoXQiYmkWbDq4tD3xzefW8T1o4jxEXch8TfJAH1tF7e6t2F5o1qosg==
X-Received: by 2002:a67:fbd4:: with SMTP id o20mr1418703vsr.44.1644447836251;
        Wed, 09 Feb 2022 15:03:56 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 29sm3511994vki.25.2022.02.09.15.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 15:03:55 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com,
	richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/5.4: update to v5.4.178
Date: Wed,  9 Feb 2022 18:03:52 -0500
Message-Id: <20220209230352.28324-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20220209230352.28324-1-bruce.ashfield@gmail.com>
References: <20220209230352.28324-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 23:03:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161594

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
2.19.1


