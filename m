Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038F6C41513
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:19:29 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.93784.1691961560597500312
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=f/HSvIuj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-26b0b4a7ccbso1885531a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961560; x=1692566360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wuGRqhO1hi8xwfoYnPivNrbuIgcklRorD9zS1UuxYlk=;
        b=f/HSvIujsMNXWqzWh+ojhjgeK8LQ9TglofWAZLphtfmewpfNwWcyLu2JU1Pnik/4No
         c24bUZwPwPpR62dqsYPqm8ksJ63xtGYZ4WfqPn97iS1q7etIfawr1GPUNJXzy0MDL0eR
         iBf0+JwGdlx/lZK3a8cVgwCaMWsRRJ7J9oO1xrMe+4DFxecGxt93wbyHnxEWd+4UCrOZ
         hSLrFwWOgRTRv/y9shDiaPPJvQpKwSv8wLYpyLPBMkmGWw5rBGHTQMBykl7XsIWayUrn
         49fCJuwfh9zeogKrcnOib5koXmh54dk31hakqPT8XPcS4CN51w+VTQ5YXgo3PBQdq7Zc
         i9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961560; x=1692566360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wuGRqhO1hi8xwfoYnPivNrbuIgcklRorD9zS1UuxYlk=;
        b=gBosnqkFGsdCltgfkaMPm8wDjwuOqd3dMeLJCrozDgI4SWFaTN0F94Lca2/YBkCwyr
         7Q6etOS8jOU4rLUe+j/HXOYopxUSYIvRfipxiVRdTvFoC94e/SMOBt3g6kYCC5wZlG5P
         fv6SHWuZz9lLaX4ReszRzxGBkCdu0kesxv9764XwnSSrwxXy2tP9XelqYUO0FBbXt8Td
         Sg1dKDaITt6XUBAWzvHxvOvfOYlda33C1IbjD+Uhv1sVy+e8gsmKXdxssWrWv0TWK9bG
         BvGNcpPAkM4yOAczgijvELGXicK91wIZDd7nY8vOcHvGTw43VAWPR+IkLvvYmPjId5K0
         I4KA==
X-Gm-Message-State: AOJu0Ywrv9adQkFc5hlA4Uo4cFfcO3ONAelK5Gz3B2knjMuv0nArnyOU
	2HXSDYKtVLIBd2cntlZ8JLjQR5CpdAsCxws586vuyQ==
X-Google-Smtp-Source: AGHT+IHjOpDH5hm1ohMj1CsAkMF10MuE9Knt4hO3Wt7dwMPE/yHnusqZNAgLpykWdAAlu/T9P0H7lw==
X-Received: by 2002:a17:90a:ad8a:b0:26b:2576:1e48 with SMTP id s10-20020a17090aad8a00b0026b25761e48mr5723416pjq.34.1691961559644;
        Sun, 13 Aug 2023 14:19:19 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.19.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:19:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/22] linux-yocto/5.4: update to v5.4.249
Date: Sun, 13 Aug 2023 11:18:22 -1000
Message-Id: <c03281719f62d47ff98a4172cc48d875cbde5f2e.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691961051.git.steve@sakoman.com>
References: <cover.1691961051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185907

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    b30db4f7e45f Linux 5.4.249
    c87439055174 xfs: verify buffer contents when we skip log replay
    72ab3d39b443 mm: make wait_on_page_writeback() wait for multiple pending writebacks
    9ea42ba3e695 mm: fix VM_BUG_ON(PageTail) and BUG_ON(PageWriteback)
    dffd25725e99 i2c: imx-lpi2c: fix type char overflow issue when calculating the clock cycle
    f89bcf03e90c x86/apic: Fix kernel panic when booting with intremap=off and x2apic_phys
    a43c763f9cbe drm/radeon: fix race condition UAF in radeon_gem_set_domain_ioctl
    45f574d8dfc1 drm/exynos: fix race condition UAF in exynos_g2d_exec_ioctl
    c81a542e45a0 drm/exynos: vidi: fix a wrong error return
    948b8b5fd0f3 ARM: dts: Fix erroneous ADS touchscreen polarities
    8d6f9f5f3bfc ASoC: nau8824: Add quirk to active-high jack-detect
    d6fd1b3f7648 s390/cio: unregister device when the only path is gone
    0de32d3dd39d usb: gadget: udc: fix NULL dereference in remove()
    823dd7de8213 nfcsim.c: Fix error checking for debugfs_create_dir
    c32b39d0707b media: cec: core: don't set last_initiator if tx in progress
    a69a15a1e789 arm64: Add missing Set/Way CMO encodings
    99de9a18e646 HID: wacom: Add error check to wacom_parse_and_register()
    2af8d9637270 scsi: target: iscsi: Prevent login threads from racing between each other
    321a81d26c8d sch_netem: acquire qdisc lock in netem_change()
    91274bbe78a2 Revert "net: phy: dp83867: perform soft reset and retain established link"
    25c8d38c7560 netfilter: nfnetlink_osf: fix module autoload
    476c617e4dd4 netfilter: nf_tables: disallow element updates of bound anonymous sets
    d3b110395fea be2net: Extend xmit workaround to BE3 chip
    789d5286060f net: dsa: mt7530: fix trapping frames on non-MT7621 SoC MT7530 switch
    35373d602bd4 ipvs: align inner_mac_header for encapsulation
    ee155675bda8 mmc: usdhi60rol0: fix deferred probing
    0bd483fb95ce mmc: sh_mmcif: fix deferred probing
    6160d37db171 mmc: sdhci-acpi: fix deferred probing
    b25875cf5e3b mmc: omap_hsmmc: fix deferred probing
    cbb0118f8aa0 mmc: omap: fix deferred probing
    e0d505356973 mmc: mvsdio: fix deferred probing
    c2e675509ff8 mmc: mvsdio: convert to devm_platform_ioremap_resource
    3ef787d61972 mmc: mtk-sd: fix deferred probing
    3c01d64996be net: qca_spi: Avoid high load if QCA7000 is not available
    bf7a4fd33669 xfrm: Linearize the skb after offloading if needed.
    d0fe8a733fa7 ieee802154: hwsim: Fix possible memory leaks
    dfcac203a36a rcu: Upgrade rcu_swap_protected() to rcu_replace_pointer()
    94199d4727f6 x86/mm: Avoid using set_pgd() outside of real PGD pages
    be178a5eae0f cifs: Fix potential deadlock when updating vol in cifs_reconnect()
    8a5aaa4562a9 cifs: Merge is_path_valid() into get_normalized_path()
    339134c15c64 cifs: Introduce helpers for finding TCP connection
    cf8c7aa90618 cifs: Get rid of kstrdup_const()'d paths
    3fa4c08104c4 cifs: Clean up DFS referral cache
    b73539b887a4 nilfs2: prevent general protection fault in nilfs_clear_dirty_page()
    1cc7dcfdeb5e writeback: fix dereferencing NULL mapping->host on writeback_page_template
    18a0202bec17 ip_tunnels: allow VXLAN/GENEVE to inherit TOS/TTL from VLAN
    ab530c9bec51 mmc: meson-gx: remove redundant mmc_request_done() call from irq context
    88b373d1c5e9 cgroup: Do not corrupt task iteration when rebinding subsystem
    c06c568e43e7 PCI: hv: Fix a race condition bug in hv_pci_query_relations()
    f02a67690777 Drivers: hv: vmbus: Fix vmbus_wait_for_unload() to scan present CPUs
    966708ed9dd9 nilfs2: fix buffer corruption due to concurrent device reads
    a93ae93e9f1b media: dvb-core: Fix use-after-free due to race at dvb_register_device()
    225bd8cc9c3f media: dvbdev: fix error logic at dvb_register_device()
    5bc971f0435f media: dvbdev: Fix memleak in dvb_register_device
    40d7530bc7fd tick/common: Align tick period during sched_timer setup
    b9b61fd1f74d x86/purgatory: remove PGO flags
    4d02a166cbee tracing: Add tracing_reset_all_online_cpus_unlocked() function
    e14e9cc588bd epoll: ep_autoremove_wake_function should use list_del_init_careful
    e77e5481d5bf list: add "list_del_init_careful()" to go with "list_empty_careful()"
    c32ab1c1959a mm: rewrite wait_on_page_bit_common() logic
    559cefc7c25f nilfs2: reject devices with insufficient block count

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index d775a60e9f..8e2ac6f853 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8d8179549a233e7517523ac12887016451da2e20"
-SRCREV_meta ?= "465d61ba36f5c7e32d1fddef078d5d2068fcc2cc"
+SRCREV_machine ?= "7c1c3e523391507938420fb93bfafbbf1788e6b1"
+SRCREV_meta ?= "cc142627e073a6ef70b2646df36a8119cda3c736"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.248"
+LINUX_VERSION ?= "5.4.249"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 5e2b2ab6cf..710fc63d47 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.248"
+LINUX_VERSION ?= "5.4.249"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ca5368c73bab4eb276a8e721df28c02ceb8f3eeb"
-SRCREV_machine ?= "abb579170926348d1518bc1a2de8cb1cdf403808"
-SRCREV_meta ?= "465d61ba36f5c7e32d1fddef078d5d2068fcc2cc"
+SRCREV_machine_qemuarm ?= "532857ef9f2014098015fa9ba30501639f8840ee"
+SRCREV_machine ?= "de0d74f8949990ebd464742fbb4b4e5bfaace7b3"
+SRCREV_meta ?= "cc142627e073a6ef70b2646df36a8119cda3c736"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 336e72eede..3e4c1ca08b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "68775a8671944b96c6a1ee795809f81149951f2d"
-SRCREV_machine_qemuarm64 ?= "54bc3d459501d8df9baf093a34d8bb676c207a07"
-SRCREV_machine_qemumips ?= "ba2d346cc66307fa6332b9fb86eb8ca66f30ebcd"
-SRCREV_machine_qemuppc ?= "6703d4c7c75fab78e0c72227a98aba8071d5b1c3"
-SRCREV_machine_qemuriscv64 ?= "d18af0e8acb7c4cb245739fa8165a44845ff2ba0"
-SRCREV_machine_qemux86 ?= "d18af0e8acb7c4cb245739fa8165a44845ff2ba0"
-SRCREV_machine_qemux86-64 ?= "d18af0e8acb7c4cb245739fa8165a44845ff2ba0"
-SRCREV_machine_qemumips64 ?= "66cac7d41a43594760f6ac48e848d73315cc5dd3"
-SRCREV_machine ?= "d18af0e8acb7c4cb245739fa8165a44845ff2ba0"
-SRCREV_meta ?= "465d61ba36f5c7e32d1fddef078d5d2068fcc2cc"
+SRCREV_machine_qemuarm ?= "05e04a6628f7da8169ee7c46288bdcf5694de623"
+SRCREV_machine_qemuarm64 ?= "23ac11eda9c661a3d01fc0142a6e23aad03f2b08"
+SRCREV_machine_qemumips ?= "08adf55a99423b9a86b9cf0b11dcf1f6bf0a280d"
+SRCREV_machine_qemuppc ?= "5b29dfbf9af0afb45cc588154a9ac6c7f68f4d81"
+SRCREV_machine_qemuriscv64 ?= "19998b76926cac29365e10bc1abc976ff2481cb5"
+SRCREV_machine_qemux86 ?= "19998b76926cac29365e10bc1abc976ff2481cb5"
+SRCREV_machine_qemux86-64 ?= "19998b76926cac29365e10bc1abc976ff2481cb5"
+SRCREV_machine_qemumips64 ?= "a70b5911861ec339487b3fd3edc49983d3e46669"
+SRCREV_machine ?= "19998b76926cac29365e10bc1abc976ff2481cb5"
+SRCREV_meta ?= "cc142627e073a6ef70b2646df36a8119cda3c736"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.248"
+LINUX_VERSION ?= "5.4.249"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


