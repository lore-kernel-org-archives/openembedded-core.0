Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C05C00528
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 03:55:57 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.54379.1691466949709348680
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 20:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=a9Ukz7ql;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-63cf96c37beso23526116d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 20:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691466949; x=1692071749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mv6S49OQx2Bi/h0pnls7cEq6w763xRGZGpFy9u64KOc=;
        b=a9Ukz7ql4NAMsbQR0aUI7ex/HW7weVVgHVwBRwnnCOHr7ja1cnIBoe/i9FemGlQ7wm
         X4wlZD3gpMh7C206JfmuMWwfANeIDzMHOvaVHPS4JCAOMInFIs0PP3JatKozBhtOPVB7
         xNPen7pxpMAhvj5aJ05dk6vj7kfpuRYukQRnVdMlJCurmZjnDCzBxJCKJGpsBNGwvKeR
         eBRFW6WXgr6KIbEcw4/9WldRR0CnPe8CA1P2YNRWXJUKFtnXoxDnmq8qhNaP5hgBsqOU
         0v3RbsvPqTU0wxmN5yBXtLwPQlJj0pCvKXutbqFR7mjT7KXuUwxtrGOjSbS1X9dfb74c
         5tkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691466949; x=1692071749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mv6S49OQx2Bi/h0pnls7cEq6w763xRGZGpFy9u64KOc=;
        b=U7RHM7BTzgHuRFGvn5naPKazmL9cu4pVCKfZcOIiEjX59+2bPAqpL8WXl/UFP7mubU
         JRo+XNv3ThYU4mFb+jHNKo/goqNs2Jhe80Es0rKMBcrcw0HRYYlYZpiy7ylhrGYXdncz
         8XoslF1g3Jxka/B9mBAkoXJtSGw0LzBYYPD0fAakM9x/CI9u1f/I14IpssOIqucPziP1
         XcMeqnQm6r9JhnRh/otQbtlPcTAf0H7wWY3+1LkhU/Vp3c+lUzNR0YUWDUcKAdOoEMr/
         p6p8b3Ug9ymn8CicZvbHt1xekAvQdUqoT3eriu5PDpZTwqY6pXXh0NW4porbzoMtIRhe
         BEiQ==
X-Gm-Message-State: AOJu0YxOq44EDouCSMEr3UFXQVA96eRltiugzfvTxJZy1JVrTs9r1zPc
	SmctyMnfcwRwIi2/9OHcOOF3kzJUePL+iA==
X-Google-Smtp-Source: AGHT+IHgaNU8TMN1CAffL9v1iFSgZJLkNrF4iTwOM78XYUKH4vhMduhgE8inLSCUt7c7aLS/6Aam2Q==
X-Received: by 2002:a0c:f1c5:0:b0:630:14e0:982e with SMTP id u5-20020a0cf1c5000000b0063014e0982emr11438119qvl.22.1691466948600;
        Mon, 07 Aug 2023 20:55:48 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id s2-20020a0cb302000000b0063d0b792469sm3423847qve.136.2023.08.07.20.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 20:55:48 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 1/3] linux-yocto/5.4: update to v5.4.249
Date: Mon,  7 Aug 2023 23:55:44 -0400
Message-Id: <20230808035546.3230840-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 03:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185638

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


