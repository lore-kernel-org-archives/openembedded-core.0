Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C17C77B73
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 16:29:04 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.13493.1685982539356164400
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 09:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dR4uDR+x;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-3f805551a19so38423391cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 09:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685982538; x=1688574538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lxzheh7r8nvKG5sSz3Cdsqet3J3yJm5FytXwf1ST6t4=;
        b=dR4uDR+xnDLAmC4KWqxl/J27kniUQSlz6DnAKc+2wO7OBRo4fuKIpyKGgfQj6wOIlL
         P9kC0PQRJ5L/Y9CNAnW+shiCFfa4krKWuNJh9Tqd0yrZ+D5bTUvgwfhVyI1Uh/T4rjma
         0t9SWHCzaLrg+wlv4XG4NgXNSce/AOPShloOJTR7Fv69XP9dZzTc75CJ0AAr/fG5Tfqp
         +etG+Z2YGJUGcX/NaW+vxyogC+Z310XCDZPltUPXX20bM1OicAqukq8JJSpr1HHhW9fX
         UAsKDL1LZPE7t0DEyoI43kR2TsETVuxctwQ4qiVRhYZoUEOjwb+3fNZdNCss9th2cybp
         jB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685982538; x=1688574538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lxzheh7r8nvKG5sSz3Cdsqet3J3yJm5FytXwf1ST6t4=;
        b=P7mJFE/YrfaYl5HiqrHm5mf1YkMSgaOdxHxrKhjDfTdsPlpCZrtVLHW2Ntgr/UggvV
         j8iH15TTkvsLQkCGN/y9JLL1eyFPI4Jt1rpwEPkBa7dNNEseeFX6l8FT/EYXM+gcPpfT
         8TFuPyPVVRkl2RZVUIwu8d3URVR5KYmqws9+ba96PumXpxqZ9GpicgjYE9V2nmtRqYMr
         mEYtOvc4kIqGVzUssCa2xeOXBqZWE0KRs9RjFeQ5gSMLExtm38ttDpmbYpmXUigYtE02
         LjFy5YNRSUWB12Cj80M4IZr53hR3UMK0uR8x7uEFpRs0qzN/Z52D4upGhizXkqSrfsyG
         6XwA==
X-Gm-Message-State: AC+VfDzfsakkI5zD6GszN4eieXMMTu6HYfXjIVZXH7ltkY8Kn4u7LoLf
	upZ24Zxu5HC0DhIzqDUCdfFPsE+MP++1tg==
X-Google-Smtp-Source: ACHHUZ44WOIMoWIiaOwPcI7ZylVBrEqj/iOyoDaiD0YqMK8iC+KTN3ShIVkSsS9HtCNldJqdMFl0XQ==
X-Received: by 2002:ac8:5b44:0:b0:3f4:eb26:6d42 with SMTP id n4-20020ac85b44000000b003f4eb266d42mr7734990qtw.63.1685982538205;
        Mon, 05 Jun 2023 09:28:58 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id r16-20020ac84250000000b003e388264753sm4785309qtm.65.2023.06.05.09.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 09:28:57 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/6.1: update to v6.1.32
Date: Mon,  5 Jun 2023 12:28:55 -0400
Message-Id: <20230605162855.3700685-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230605162855.3700685-1-bruce.ashfield@gmail.com>
References: <20230605162855.3700685-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 16:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182396

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    76ba310227d2 Linux 6.1.32
    cd51ba98aeaa tools headers UAPI: Sync the linux/in.h with the kernel sources
    2cd02ae65654 netfilter: ctnetlink: Support offloaded conntrack entry deletion
    55ce796e9b0a cpufreq: amd-pstate: Add ->fast_switch() callback
    c18f6919b4e7 cpufreq: amd-pstate: Update policy->cur in amd_pstate_adjust_perf()
    efc8ec1636fa block: fix bio-cache for passthru IO
    5d08604754e8 Revert "thermal/drivers/mellanox: Use generic thermal_zone_get_trip() function"
    2333dbc88f38 bluetooth: Add cmd validity checks at the start of hci_sock_ioctl()
    6c1fad655b40 drm/amd: Don't allow s0ix on APUs older than Raven
    83a7f27c5b94 octeontx2-af: Add validation for lmac type
    3236221bb8e4 RDMA/rxe: Fix the error "trying to register non-static key in rxe_cleanup_task"
    592af07ac0c8 wifi: iwlwifi: mvm: fix potential memory leak
    0c469078bde4 wifi: iwlwifi: mvm: support wowlan info notification version 2
    b5ceb6aac607 wifi: rtw89: correct 5 MHz mask setting
    07c8c1a3cfcf net: phy: mscc: enable VSC8501/2 RGMII RX clock
    7c95f56995c6 page_pool: fix inconsistency for page_pool_ring_[un]lock()
    7dccd5fa7edb net: page_pool: use in_softirq() instead
    cd3c5e4e0d60 vfio/type1: check pfn valid before converting to struct page
    6793a3c6326e blk-mq: fix race condition in active queue accounting
    fe735073a50e bpf, sockmap: Incorrectly handling copied_seq
    dd628fc697ee bpf, sockmap: Wake up polling after data copy
    ab90b68f650e bpf, sockmap: TCP data stall on recv before accept
    3a2129ebae35 bpf, sockmap: Handle fin correctly
    ba4fec5bd6f8 bpf, sockmap: Improved check for empty queue
    1e4e379ccde8 bpf, sockmap: Reschedule is now done through backlog
    9f4d7efb3345 bpf, sockmap: Convert schedule_work into delayed_work
    4ae2af3e59e2 bpf, sockmap: Pass skb ownership through read_skb
    49b5b5bfeef1 gpio-f7188x: fix chip name and pin count on Nuvoton chip
    085f27f48c84 net/mlx5: E-switch, Devcom, sync devcom events and devcom comp register
    3347ac7a8160 tls: rx: strp: preserve decryption status of skbs when needed
    ba93977437e7 tls: rx: strp: factor out copying skb data
    52a89de3e9f2 tls: rx: strp: force mixed decrypted records into copy mode
    c48b8399e430 tls: rx: strp: fix determining record length in copy mode
    ecd9f6ed9ed2 tls: rx: strp: set the skb->len of detached / CoW'ed skbs
    e734a693a24c tls: rx: device: fix checking decryption status
    b3e54fb3a35d platform/x86/amd/pmf: Fix CnQF and auto-mode after resume
    8e8c33cc89a0 selftests/bpf: Fix pkg-config call building sign-file
    ca39992f1048 firmware: arm_ffa: Fix usage of partition info get count flag
    3f5413c95445 ipv{4,6}/raw: fix output xfrm lookup wrt protocol
    6728486447ee inet: Add IP_LOCAL_PORT_RANGE socket option

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 3b8a47b63a..794cbf2de9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a49ca8357f930ba63aa382ad291f4ddf1e6db427"
-SRCREV_meta ?= "61b6de9402762b8e9fa21c0f1c463591048cd194"
+SRCREV_machine ?= "1dbf96de89b0e1dc082bfa90b45a5d581b1470a3"
+SRCREV_meta ?= "fe6f2a4341877552eb279adc47e0ed32e3e2befa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.31"
+LINUX_VERSION ?= "6.1.32"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 4282bb152d..65a8148749 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.31"
+LINUX_VERSION ?= "6.1.32"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "456d730e6202dd0fc120322d64cf70a2cbccc572"
-SRCREV_meta ?= "61b6de9402762b8e9fa21c0f1c463591048cd194"
+SRCREV_machine ?= "24ec2fa877406f6e8ccce3841a1575e6d0e94679"
+SRCREV_meta ?= "fe6f2a4341877552eb279adc47e0ed32e3e2befa"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 6ae13428a9..a7bcced3e4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -20,25 +20,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9e67e588e7567894a3ad725c93013f0c1d178e48"
-SRCREV_machine:qemuarm64 ?= "456d730e6202dd0fc120322d64cf70a2cbccc572"
-SRCREV_machine:qemuloongarch64 ?= "456d730e6202dd0fc120322d64cf70a2cbccc572"
-SRCREV_machine:qemumips ?= "51c5e36b6ccfd16103c965ac6c815e1823170994"
-SRCREV_machine:qemuppc ?= "456d730e6202dd0fc120322d64cf70a2cbccc572"
-SRCREV_machine:qemuriscv64 ?= "456d730e6202dd0fc120322d64cf70a2cbccc572"
-SRCREV_machine:qemuriscv32 ?= "456d730e6202dd0fc120322d64cf70a2cbccc572"
-SRCREV_machine:qemux86 ?= "456d730e6202dd0fc120322d64cf70a2cbccc572"
-SRCREV_machine:qemux86-64 ?= "456d730e6202dd0fc120322d64cf70a2cbccc572"
-SRCREV_machine:qemumips64 ?= "85306ca86b05b98babf1b17902eaae30d8b4911a"
-SRCREV_machine ?= "456d730e6202dd0fc120322d64cf70a2cbccc572"
-SRCREV_meta ?= "61b6de9402762b8e9fa21c0f1c463591048cd194"
+SRCREV_machine:qemuarm ?= "a362b0a2279ab82e61c03d492b7efd528fee4422"
+SRCREV_machine:qemuarm64 ?= "24ec2fa877406f6e8ccce3841a1575e6d0e94679"
+SRCREV_machine:qemuloongarch64 ?= "24ec2fa877406f6e8ccce3841a1575e6d0e94679"
+SRCREV_machine:qemumips ?= "3adbad6b7ccd09550606f44271cdf67dd9583379"
+SRCREV_machine:qemuppc ?= "24ec2fa877406f6e8ccce3841a1575e6d0e94679"
+SRCREV_machine:qemuriscv64 ?= "24ec2fa877406f6e8ccce3841a1575e6d0e94679"
+SRCREV_machine:qemuriscv32 ?= "24ec2fa877406f6e8ccce3841a1575e6d0e94679"
+SRCREV_machine:qemux86 ?= "24ec2fa877406f6e8ccce3841a1575e6d0e94679"
+SRCREV_machine:qemux86-64 ?= "24ec2fa877406f6e8ccce3841a1575e6d0e94679"
+SRCREV_machine:qemumips64 ?= "bbdfb1b8c9b38bcb63aeaa785b60cc24af88b4b1"
+SRCREV_machine ?= "24ec2fa877406f6e8ccce3841a1575e6d0e94679"
+SRCREV_meta ?= "fe6f2a4341877552eb279adc47e0ed32e3e2befa"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d2869ace6eeb8ea8a6e70e6904524c5a6456d3fb"
+SRCREV_machine:class-devupstream ?= "76ba310227d2490018c271f1ecabb6c0a3212eb0"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -47,7 +47,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.31"
+LINUX_VERSION ?= "6.1.32"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


