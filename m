Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511C8C48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 02:46:54 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.4750.1708483606080016140
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 18:46:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dfsF+wKT;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-78716bfff61so350774585a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 18:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708483605; x=1709088405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4GqozI2oztO0Slrld1Cl9yidGVeXD00ctI97vsDGEI=;
        b=dfsF+wKTTCIXpo60PdLRwdidAJj2kPd3YoxNh/OirG/XZ30auUrnN9Rl/U9f5i0epP
         eqCKvbJ/6/dKZMUPcT6pY4Sq1D5ri/JzvQtvaUCChfXYxK5cFnkhlK2DeDxtO3xnneH5
         zbmLUqvLYf+e7TlXXuNaCu19p2ukRQAfZYH5c12IqbHJASLqBDo9/BPiwIzKXNGRxQkC
         ZlVWKHB2gtqbe/kEpzZMFKOM/YMnRybfWp298tgXXwelOZaVlNcRqe2EuTFOMQwfhzKQ
         gewU3h83S/t92Kv/O+4yXiAPcrb8tCp9D/Aky0XCSAU8g718G2POSCNL6EQ/J/UUFAiW
         hadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708483605; x=1709088405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4GqozI2oztO0Slrld1Cl9yidGVeXD00ctI97vsDGEI=;
        b=o9cDCTyeXANAOL6V2lwKO0lj9jvvZOh8aaSHtUd+wDkuFLX7C8wYNVbQl7vTJ3ryJC
         RDmLwdYNSBGuPkQEqhYuCQ5c+XIPpRYnhulkh/k0S6JTifWNPJafk7lrqZMviaX/fuwc
         dScIFslliFzGgKm33lLNPKyCi1lPGlvk/nUTy/5azb5Xr+bDl24UDHWW4WTQMqRiYOVv
         +b7xRWUF9zCQqZWbp4s43+iji2rNfpBJKfw0nDFz7lytFuHB8sn79nWBaPyUkNV3cbpr
         +lXrmIULExV6hNaxjqe1JsMZHjnWooootsf5KeWfw9b8fG85RLs2vjZu4FPxaEnxgJJW
         Y5dw==
X-Gm-Message-State: AOJu0Yzp1y7R0jV5pWsMsP66SwIJwk2KHCnz4du504K84oD0nkDx4C/z
	2iMosQDWo0XynWwHRn1cgHbhrZUL9Yubmz49S/vB43z1jKIwT4N0lJCHAwFE
X-Google-Smtp-Source: AGHT+IEJHQxSfcgcNZO9Bb34I5r3IR09fOpoDO4uff7hYExpXJb5UfQb17Kw/nhPkVvA6Drae9BdUw==
X-Received: by 2002:ae9:f202:0:b0:787:7ec4:ead with SMTP id m2-20020ae9f202000000b007877ec40eadmr2656029qkg.39.1708483605054;
        Tue, 20 Feb 2024 18:46:45 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ow39-20020a05620a822700b007872acdc390sm3934105qkn.9.2024.02.20.18.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 18:46:44 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/5] linux-yocto/5.4: update to v5.4.267
Date: Tue, 20 Feb 2024 21:46:39 -0500
Message-Id: <20240221024640.3239284-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240221024640.3239284-1-bruce.ashfield@gmail.com>
References: <20240221024640.3239284-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 02:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195954

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    9153fc966495 Linux 5.4.267
    69ef165176a3 ASoC: meson: codec-glue: fix pcm format cast warning
    584756c3d75a ipv6: remove max_size check inline with ipv4
    66b3025202b4 ipv6: make ip6_rt_gc_expire an atomic_t
    ae424c848db6 net/dst: use a smaller percpu_counter batch for dst entries accounting
    7b3a9c2bf315 PCI: Disable ATS for specific Intel IPU E2000 devices
    c6141c49bc80 PCI: Extract ATS disabling to a helper function
    8711fa0c06d4 netfilter: nf_tables: Reject tables of unsupported family
    c67bf30baf26 net: tls, update curr on splice as well
    c2d9b438554e ath10k: Get rid of "per_ce_irq" hw param
    d15f869cb3b3 ath10k: Keep track of which interrupts fired, don't poll them
    696b992edc7e ath10k: Add interrupt summary based CE processing
    366df9ecbcb8 ath10k: Wait until copy complete is actually done before completing
    c4541e39808e mmc: sdhci-sprd: Fix eMMC init failure after hw reset
    a9c9ffcd217b mmc: core: Cancel delayed work before releasing host
    bfc3720ca8d0 mmc: rpmb: fixes pause retune on all RPMB partitions.
    77359c497305 mm: fix unmap_mapping_range high bits shift bug
    5af5e946c4dd i2c: core: Fix atomic xfer check for non-preempt config
    d8ec24d79db1 firewire: ohci: suppress unexpected system reboot in AMD Ryzen machines and ASM108x/VT630x PCIe cards
    85015a96bc24 mm/memory-failure: check the mapcount of the precise page
    3d8fab93ca98 net: Implement missing SO_TIMESTAMPING_NEW cmsg support
    f7084217d945 bnxt_en: Remove mis-applied code from bnxt_cfg_ntp_filters()
    acfeb9039b17 asix: Add check for usbnet_get_endpoints
    6c00721ad7aa net/qla3xxx: fix potential memleak in ql_alloc_buffer_queues
    a4ea54c52828 net/qla3xxx: switch from 'pci_' to 'dma_' API
    863ca421b4a7 i40e: Restore VF MSI-X state during PCI reset
    01c2d73ae2dd ASoC: meson: g12a-tohdmitx: Fix event generation for S/PDIF mux
    bdc00b8c3afe ASoC: meson: g12a-tohdmitx: Validate written enum values
    fe2d1dda1db4 ASoC: meson: g12a: extract codec-to-codec utils
    93d80aadc02e i40e: fix use-after-free in i40e_aqc_add_filters()
    b40828a2ab57 net: Save and restore msg_namelen in sock_sendmsg
    68c8fdb9f9c8 net: bcmgenet: Fix FCS generation for fragmented skbuffs
    4c0fa624a693 ARM: sun9i: smp: Fix array-index-out-of-bounds read in sunxi_mc_smp_init
    c1556217ff6f net-timestamp: extend SOF_TIMESTAMPING_OPT_ID to HW timestamps
    2cdb65084824 can: raw: add support for SO_MARK
    96a6d1bb28ed can: raw: add support for SO_TXTIME/SCM_TXTIME
    b1719cbb733e net: sched: em_text: fix possible memory leak in em_text_destroy()
    ef4fd7518c6e i40e: Fix filter input checks to prevent config with invalid values
    65c6ef02ff26 nfc: llcp_core: Hold a ref to llcp_local->dev when holding a ref to llcp_local

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  4 ++--
 .../linux/linux-yocto-tiny_5.4.bb             |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 20 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 72fa7b91184..44278cb2a49 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b587a3fecb37c3e198592a5733ce23cd8a33f6fc"
+SRCREV_machine ?= "36f355fd2c80860745565b2e5bd293d35a645b86"
 SRCREV_meta ?= "8ce0cca5a5a2895ef024bee2daff56c5e846c3bc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.266"
+LINUX_VERSION ?= "5.4.267"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 023b9fe9e1e..abc7ecad064 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.266"
+LINUX_VERSION ?= "5.4.267"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "da07f26ba47c365237459233a85f398599677b28"
-SRCREV_machine ?= "65fdb0d3fc750b89ed2ad3268d346765a7131094"
+SRCREV_machine_qemuarm ?= "f5c9f947b3349a982c032c81f4b636728e2b8004"
+SRCREV_machine ?= "028ae2c5666867a95ebc7b44723048286338bb0d"
 SRCREV_meta ?= "8ce0cca5a5a2895ef024bee2daff56c5e846c3bc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 412b8230ab9..550960dcd0d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -13,15 +13,15 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "732f4200d901957f0ab0a6c760fcc26e8ddfdb03"
-SRCREV_machine_qemuarm64 ?= "458f12462197606e02368dc74a79cc5f10e3409b"
-SRCREV_machine_qemumips ?= "4a746565ac1418646f94506f983f85779902b4eb"
-SRCREV_machine_qemuppc ?= "f51c8df8974a2b439d6a845ffbf144e935f04f5c"
-SRCREV_machine_qemuriscv64 ?= "c2bd298696fc9965fb3a888e78cfb00a92d6824f"
-SRCREV_machine_qemux86 ?= "c2bd298696fc9965fb3a888e78cfb00a92d6824f"
-SRCREV_machine_qemux86-64 ?= "c2bd298696fc9965fb3a888e78cfb00a92d6824f"
-SRCREV_machine_qemumips64 ?= "d56e5470a9173e9d2af61828619098356fadb75e"
-SRCREV_machine ?= "c2bd298696fc9965fb3a888e78cfb00a92d6824f"
+SRCREV_machine_qemuarm ?= "8c115d2b1f1a2f1ddc5196fd13d2045ed65d5c6e"
+SRCREV_machine_qemuarm64 ?= "9f7ddd1312cafad0c67288936518e94d9f7cecc5"
+SRCREV_machine_qemumips ?= "6a033ec3a29689156cd3e9c16383560f21e230e2"
+SRCREV_machine_qemuppc ?= "d2ca96883f4c93dfd56e5dc203b15ea36151cf4c"
+SRCREV_machine_qemuriscv64 ?= "2ee6ae8d74b9921a1454fec6949b79bd676a95c8"
+SRCREV_machine_qemux86 ?= "2ee6ae8d74b9921a1454fec6949b79bd676a95c8"
+SRCREV_machine_qemux86-64 ?= "2ee6ae8d74b9921a1454fec6949b79bd676a95c8"
+SRCREV_machine_qemumips64 ?= "e75dbfccf896e92c327165880b90e42049774552"
+SRCREV_machine ?= "2ee6ae8d74b9921a1454fec6949b79bd676a95c8"
 SRCREV_meta ?= "8ce0cca5a5a2895ef024bee2daff56c5e846c3bc"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
@@ -31,7 +31,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.266"
+LINUX_VERSION ?= "5.4.267"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


