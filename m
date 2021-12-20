Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BE5C433FE
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:12:30 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web09.6497.1640013150057979528
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:12:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DUMsilYu;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id 8so10012169qtx.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BxqvMaz4LQ/hJ9R/p2yxH+hhji0gWeCtUh8DmRnSgIk=;
        b=DUMsilYu4dd2pYjY0zotkO+6/IiKVjI9S7fInb+l+jd37LQSbk1/4Wgo1m5JmJEHr8
         8H6o0WMtJjIGcElQvF8YaH/AlAP6pP/+4mdC1FbSJmIBW/j7ocFC2YMZt267Y9ZCLRjF
         2M40rmY0SZBpr2ghzu8lJASlNlOtLsjEfLWNrN16dijTJP5mVIG5DVtxeR9njJ5u09U+
         71SKO9XM04pbcvkvBrPePXDhZmDLRZoaLmyWRrQsW3+n258LNyAbIfdg6AVSubRwQhqg
         OmcwqhOYz5yNPDTMj3ZSnma6zNlOZCsVuHwQUxeo+ZOFsQbylXVz8BLJct2UQXPVvO8M
         3h0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BxqvMaz4LQ/hJ9R/p2yxH+hhji0gWeCtUh8DmRnSgIk=;
        b=zkSkU/fy660mLmH6V7tu8t5Q3wURJQ/PudlWBlRf3h1RJL3zSfBaKcTW9dAKVzjwxP
         5PqDfv7HN6C7dPlQhTv63Qu9S4hVmoOWzq+sDu+7Wwvo6fUZFv6uUQ9FqZ0jw7Wa3wr9
         Fhy5/NQp7JvJJDcQKhR6r5gR9O1LRzzQ5sfnkLIxUnbn+0HNpCSsHP/rmvGD2d3J7p4a
         LWBDqUqVE3nEXb6yCqN9Xkft+bRhgJLxjiDT24l9SqMMIrAmaxmOMvfD5vAy/iLn+T1k
         jd7i0S5aFLlCs2V15jTGv36Ri4BCStIQMHF/ApWj3GQP7m7L9NicX9mn3sRO/1yGZgrE
         pGUg==
X-Gm-Message-State: AOAM530rjxhh13EEL/m48Wt6nZvnBVkM/4rrwp1MwrjCwwj2EPmrCS3j
	if0kaefMRkazZa8eK8t6sAP2Ui0WF84=
X-Google-Smtp-Source: 
 ABdhPJyhoKsCBWx2g8yuElVmXISeIa9WhsX+Q35as8uZu+BTs+zELhmgb7GZ7EzrqkXcVdPV+1B60g==
X-Received: by 2002:ac8:5bc8:: with SMTP id b8mr12554078qtb.247.1640013149097;
        Mon, 20 Dec 2021 07:12:29 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 w10sm15378146qtk.90.2021.12.20.07.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 07:12:28 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com,
	richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] linux-yocto/5.4: update to v5.4.167
Date: Mon, 20 Dec 2021 10:12:19 -0500
Message-Id: 
 <287e0d9fc0dfe91370620a778c6c4ca77ca83ddf.1640012653.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1640012653.git.bruce.ashfield@gmail.com>
References: <cover.1640012653.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 15:12:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159880

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

e8ef940326ef Linux 5.4.167
c97579584fa8 arm: ioremap: don't abuse pfn_valid() to check if pfn is in RAM
6026d4032dbb arm: extend pfn_valid to take into account freed memory map alignment
492f4d3cde95 memblock: ensure there is no overflow in memblock_overlaps_region()
bdca964781a0 memblock: align freed memory map on pageblock boundaries with SPARSEMEM
60111b30be0b memblock: free_unused_memmap: use pageblock units instead of MAX_ORDER
3e8e272805e7 hwmon: (dell-smm) Fix warning on /proc/i8k creation error
f6f1d1911492 bpf: Fix integer overflow in argument calculation for bpf_map_area_alloc
b06b1f46306a selinux: fix race condition when computing ocontext SIDs
2fb8e4267c47 KVM: x86: Ignore sparse banks size for an "all CPUs", non-sparse IPI req
467359957ad2 tracing: Fix a kmemleak false positive in tracing_map
fb8cd2b336e4 drm/amd/display: add connector type check for CRC source set
8fc2f28e3348 drm/amd/display: Fix for the no Audio bug with Tiled Displays
c0315e93552e net: netlink: af_netlink: Prevent empty skb by adding a check on len.
7ff666e6fdc0 i2c: rk3x: Handle a spurious start completion interrupt flag
409ecd029ac5 parisc/agp: Annotate parisc agp init functions with __init
4233fbd459ac net/mlx4_en: Update reported link modes for 1/10G
b6158d968b3e drm/msm/dsi: set default num_data_lanes
d731ecc6f2ea nfc: fix segfault in nfc_genl_dump_devices_done
c32c40ff8092 Linux 5.4.166
eb1b5eaaddec netfilter: selftest: conntrack_vrf.sh: fix file permission

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index beea153b52..b7a7cbcbe3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6a419217887717ae815e47990c4f50540e4486f0"
-SRCREV_meta ?= "c9027edfa2919e0148ba12d56afa7c5a797aad10"
+SRCREV_machine ?= "2bddc20729f986e46ba5b802fa6ce8716ee34506"
+SRCREV_meta ?= "ff304dbaec03398dc510602800b19d28b7c82927"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.165"
+LINUX_VERSION ?= "5.4.167"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 0f97913ebf..a2db551ccb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.165"
+LINUX_VERSION ?= "5.4.167"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "de76f2a485fb6c73e3978b0138f756afb22e4db4"
-SRCREV_machine ?= "74fb33c678e2cf4cfbf9c6aa3e1fe6b019d10a5e"
-SRCREV_meta ?= "c9027edfa2919e0148ba12d56afa7c5a797aad10"
+SRCREV_machine_qemuarm ?= "e8825a1df3d08af26acf8fc2ddb140c40aa233f4"
+SRCREV_machine ?= "b9dbced11f660908cec12d5e1339bbff0ac28d59"
+SRCREV_meta ?= "ff304dbaec03398dc510602800b19d28b7c82927"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index c37006cc04..6571b5ead5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "abbd99315753c7f8bde10fb6ac5b31d5ab7cdcd6"
-SRCREV_machine_qemuarm64 ?= "ab4c88e094069467cdb4e7d7bbac303e5039bc9f"
-SRCREV_machine_qemumips ?= "b52f600f9157b8107e5318d61f43007efb99c02c"
-SRCREV_machine_qemuppc ?= "5b3b062a7c87b3265274da81dcf675596b90d65b"
-SRCREV_machine_qemuriscv64 ?= "c232ad04fa15d324714799b90b9c4810a5dbe1bc"
-SRCREV_machine_qemux86 ?= "c232ad04fa15d324714799b90b9c4810a5dbe1bc"
-SRCREV_machine_qemux86-64 ?= "c232ad04fa15d324714799b90b9c4810a5dbe1bc"
-SRCREV_machine_qemumips64 ?= "b0057ef25af45fda6ae3ae9274cab8c248b4a70b"
-SRCREV_machine ?= "c232ad04fa15d324714799b90b9c4810a5dbe1bc"
-SRCREV_meta ?= "c9027edfa2919e0148ba12d56afa7c5a797aad10"
+SRCREV_machine_qemuarm ?= "6669d1a2f103a3275306cde2486a0c133ab288a4"
+SRCREV_machine_qemuarm64 ?= "0727e136f0c04aac28ee442d1a5b208d41021c00"
+SRCREV_machine_qemumips ?= "ec2a556c8c4bea3c26d85d9097fcb7bc37d9b470"
+SRCREV_machine_qemuppc ?= "dc1f229c713f712f3e29a8f3a20e45120aeccf2a"
+SRCREV_machine_qemuriscv64 ?= "6244469059318276e2ffca54f85ecd3d13cd6756"
+SRCREV_machine_qemux86 ?= "6244469059318276e2ffca54f85ecd3d13cd6756"
+SRCREV_machine_qemux86-64 ?= "6244469059318276e2ffca54f85ecd3d13cd6756"
+SRCREV_machine_qemumips64 ?= "ec66f75ec62c5b2f576b98dcfd7dc870643590da"
+SRCREV_machine ?= "6244469059318276e2ffca54f85ecd3d13cd6756"
+SRCREV_meta ?= "ff304dbaec03398dc510602800b19d28b7c82927"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.165"
+LINUX_VERSION ?= "5.4.167"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


