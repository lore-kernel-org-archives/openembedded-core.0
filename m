Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6421C433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:58:19 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.53345.1638136698509129419
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=dOFsiSdP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id g19so14629474pfb.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hDUFy0CXejFOrBHZUkJlIV1um2xDAeNBs7OYO/5/R10=;
        b=dOFsiSdPZsv+ptNeVDUsCLOKQDK67QIWUgRG/QNMefrO3H2uVHV+CFYeDP8Vw+WR3l
         lR/UH85QzHKua84Hm3zbrr72Atm3AWr8UPb/wqV6frUzF0rmd7kXj7cmyXpnJsqzGmRQ
         RH4Gkgvean9+oqs5wFNa20e+6fKI/2JsKlPXnT++aIsx9hwl2b4Zzs6xD79Oi31XlqE6
         gz2YjqLvXbIGxQiEflhVgrYvBZszicoLHoMNWihyUJeEyPFemAbJF21X2UUCiKyIL4fU
         aoo1M2maIrM1hngnyNTqECNnqIZfisX8Y2eJwWVlnZUsOC9/p+1TNREL2DPuR/895Ii0
         vAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hDUFy0CXejFOrBHZUkJlIV1um2xDAeNBs7OYO/5/R10=;
        b=qWi1lUcDutc4/Nvc4O4F8lHMMzNDV0ocyy15l4LtYGaWfeo3DKZGNl9oJdDbZA/X7I
         aoJEXjgkSLq1KZI0z9Ci/lhW6Fa6ZMEA+1493dvcRqtoir7WlZJSYLdLlR1jbLIgcCMP
         Ezc8/M4qX72Swvf+BmvkSpjvtbsyUYsKEppbxpxsKRVoWl3bgd6l/d0+ovn77KcvkhXp
         j7PPfovtPzUSRSaoUX7EQGAEen2/Go6XXAL6b/QyHud4YEle5Ix78vF6ZWVmWxmH2yg+
         qO78oLESpw6SKo5OWyg4A99saOFWf7PBeqfXfw6OQzpZ2ljdW86KEbsIWE01LbhiQAkw
         tgJQ==
X-Gm-Message-State: AOAM531bvFQC6poHQCcqOgHTYxCQsBjMe7QYNT7TpGeQSX1JKmXs2lRc
	5Vl6lyPNCkeiosCY/hYhFlYRYpZBs6pYJl/rI1A=
X-Google-Smtp-Source: 
 ABdhPJwm1NX+xAT8Zy+dRElGprPreNc0PqyHPN0sUd57Eb0FNb2dZZBiVEKxurQwTADj/5lRXDA2uA==
X-Received: by 2002:a63:7c54:: with SMTP id
 l20mr17952937pgn.587.1638136697133;
        Sun, 28 Nov 2021 13:58:17 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.58.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:58:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/42] linux-yocto/5.4: update to v5.4.154
Date: Sun, 28 Nov 2021 11:57:13 -1000
Message-Id: 
 <b8f2b67706311672f923dfef9a0587c64c49e840.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:58:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158883

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    ce061ef43f1d Linux 5.4.154
    291a48871e51 sched: Always inline is_percpu_thread()
    3e105ecc4ab7 scsi: virtio_scsi: Fix spelling mistake "Unsupport" -> "Unsupported"
    1ff5ee9d3926 scsi: ses: Fix unsigned comparison with less than zero
    83d857d6b096 drm/amdgpu: fix gart.bo pin_count leak
    1843ae8c4b2b net: sun: SUNVNET_COMMON should depend on INET
    6d1d7acb1067 mac80211: check return value of rhashtable_init
    2aaf3fd5e109 net: prevent user from passing illegal stab size
    1e66a472b51b m68k: Handle arrivals of multiple signals correctly
    be191c8e68fe mac80211: Drop frames from invalid MAC address in ad-hoc mode
    fffad5988f28 netfilter: nf_nat_masquerade: defer conntrack walk to work queue
    b3cb06303419 netfilter: nf_nat_masquerade: make async masq_inet6_event handling generic
    a9d8aa2d3ca8 HID: wacom: Add new Intuos BT (CTL-4100WL/CTL-6100WL) device IDs
    8c6680025b49 netfilter: ip6_tables: zero-initialize fragment offset
    744b908a7f3f HID: apple: Fix logical maximum and usage maximum of Magic Keyboard JIS
    b6bccc978ec8 ext4: correct the error path of ext4_write_inline_data_end()
    de4a28b718bb net: phy: bcm7xxx: Fixed indirect MMD operations

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 13512ea6a4..dbd8ab3bb0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "88b78bac3bf83e6b3ef08d77f895bba5128cc1cd"
-SRCREV_meta ?= "9e3ab4e615b651c1b63d4f0cce71da79a3e89763"
+SRCREV_machine ?= "1f04ded6552fb7ceb6b01768d1a11a828c67c212"
+SRCREV_meta ?= "128808367b0f77f4aea86130bf60e441952946e1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.153"
+LINUX_VERSION ?= "5.4.154"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index e6e0ee73b2..ca73895d7f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.153"
+LINUX_VERSION ?= "5.4.154"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "fed16a9b9cb56ce639eeddeedd756ad5207fa89e"
-SRCREV_machine ?= "942b0cc9a1ff13a66016167d4437f7694e96d04e"
-SRCREV_meta ?= "9e3ab4e615b651c1b63d4f0cce71da79a3e89763"
+SRCREV_machine_qemuarm ?= "03c343c7f0392cc71eedc9ba0f05b0ebe02d45eb"
+SRCREV_machine ?= "4ef13608e3bc691718485e28fc6b78fa58c50d58"
+SRCREV_meta ?= "128808367b0f77f4aea86130bf60e441952946e1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 6c69878d03..7ed524efea 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "7a9ca83b483c096e6bd5e1b99cca7fe2fb79fd1a"
-SRCREV_machine_qemuarm64 ?= "d2ea3664c5872b3046a2aa970035de51e359922f"
-SRCREV_machine_qemumips ?= "118685bb5211a7740de6bd419c68eb34728f8770"
-SRCREV_machine_qemuppc ?= "7e8785640416d3c6382f91a3f88e0eca14f0a8b5"
-SRCREV_machine_qemuriscv64 ?= "d54d61f9e363806a987c9ab01df0e66a31d4ead5"
-SRCREV_machine_qemux86 ?= "d54d61f9e363806a987c9ab01df0e66a31d4ead5"
-SRCREV_machine_qemux86-64 ?= "d54d61f9e363806a987c9ab01df0e66a31d4ead5"
-SRCREV_machine_qemumips64 ?= "bd5e23a14522aa81e0f0ee37f976edd108669eb5"
-SRCREV_machine ?= "d54d61f9e363806a987c9ab01df0e66a31d4ead5"
-SRCREV_meta ?= "9e3ab4e615b651c1b63d4f0cce71da79a3e89763"
+SRCREV_machine_qemuarm ?= "9cc72430854edf4b980ece62e234629168e69b07"
+SRCREV_machine_qemuarm64 ?= "eb73aaed8bd13cffd05d699a6745408965708d7b"
+SRCREV_machine_qemumips ?= "6d7d1235cb7e9f9cb1071e630ea79a88a90f86fd"
+SRCREV_machine_qemuppc ?= "c22f5f06e64f63837c677cf09158131b9531c2d4"
+SRCREV_machine_qemuriscv64 ?= "83c1e7472a1783d745804247fcdc32b2cf6e761b"
+SRCREV_machine_qemux86 ?= "83c1e7472a1783d745804247fcdc32b2cf6e761b"
+SRCREV_machine_qemux86-64 ?= "83c1e7472a1783d745804247fcdc32b2cf6e761b"
+SRCREV_machine_qemumips64 ?= "4cf95264615ab852cdadd478c37554ab7fd1ea14"
+SRCREV_machine ?= "83c1e7472a1783d745804247fcdc32b2cf6e761b"
+SRCREV_meta ?= "128808367b0f77f4aea86130bf60e441952946e1"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.153"
+LINUX_VERSION ?= "5.4.154"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


