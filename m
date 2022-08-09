Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BCEC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 03:39:55 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.7727.1660016393341697293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 20:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GlMHxOB/;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id m7so7895232qkk.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 20:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=1FbHKR7fVF+2hBnrjA0leuJP5LcKj0Pv/jbz6WRuC0s=;
        b=GlMHxOB/8GfvtjAnwrkso9m2fkrlrbygsp0qoLu2qErbDhNtUdgfPeEUnjNpTmjtBF
         W5SjM+5mqJsZV1aJE1XZuGIU7N253b4WqrM9bz92hu+3Yb5zibrYyo/f2J2bvS/aq9Dn
         QQzlhuvYmPwk6RXptfFPI0lfbp7PsDtZiY4MzEzfSWwRWck9ewb3RhNwyqV3Jrp1H+G9
         tfOf7+69ItUtyx9RCa9/z5dtVAcRxdTkr1fos0pfPSaNpuNd0Onioh7MrwOGlt5Hmfgn
         hjPOYJQkz8UbqIywWe+jDjdTYtHjpyZrgZGTe7riYm+oAvdcRYhzv9+wW4LfvRlZEtzC
         yYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=1FbHKR7fVF+2hBnrjA0leuJP5LcKj0Pv/jbz6WRuC0s=;
        b=iTF1MUceEWv7DzJB/uLb0b00cpg5fYIKr/c1tUzpLO2sPEb9sHadxvPXpYNIY+Jw+p
         7z5VuqX91We2T/SO1RFYbdbK5/EU0041R7mhvDoIXkJGiiza70bjPE86BXJEC+vxIcvQ
         zDJ6cMsjHvIOyk7ysUUMqtNKeKDMbLMZpWRrbsH1oWSbAHObVb3LVL34VN5v5aglXxBh
         yMPNdM2LBktu1dmhsaWFMb9cS65lTy288Md4jlWA/WegHgInQwW6PstaJIKMkH8nZE3k
         Wh1u7q0yLxn15mkQSt1X5UiZauCS1QwJqzagpkqFYfABRIvDwqLjuzfRSDtalU0PEnWY
         akBQ==
X-Gm-Message-State: ACgBeo1/NrG8xk+gjoztui9biD4b8BfOIxNvb4QNiLVrDAtKrnoYiwfb
	p8Wmx/V/0TLf0+a+9ZtAiIR+bb3mINzfxg==
X-Google-Smtp-Source: 
 AA6agR6mepAcGj1GbzLMhiu20CGwn+e2briCGFduNCwgC/fk5u4IZiwB6p365J2yYONxKPJfdXY1HA==
X-Received: by 2002:a05:620a:29d5:b0:6b9:803f:a15a with SMTP id
 s21-20020a05620a29d500b006b9803fa15amr309222qkp.87.1660016392336;
        Mon, 08 Aug 2022 20:39:52 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 bs27-20020ac86f1b000000b00342f58fffe0sm4734179qtb.9.2022.08.08.20.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 20:39:51 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2][dunfell] linux-yocto/5.4: update to v5.4.209
Date: Mon,  8 Aug 2022 23:39:48 -0400
Message-Id: <20220809033948.52817-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20220809033948.52817-1-bruce.ashfield@gmail.com>
References: <20220809033948.52817-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 03:39:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169124

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    8d8935e76f6f Linux 5.4.209
    0b0088e47587 scsi: core: Fix race between handling STS_RESOURCE and completion
    85fe8623f061 mt7601u: add USB device ID for some versions of XiaoDu WiFi Dongle.
    d5a596c148b3 ARM: crypto: comment out gcc warning that breaks clang builds
    8d6dab81ee3d sctp: leave the err path free in sctp_stream_init to sctp_stream_free
    a49282eca8ab sfc: disable softirqs for ptp TX
    7799f742f24b perf symbol: Correct address for bss symbols
    388b3f14ff60 virtio-net: fix the race between refill work and close
    52be29e8b645 netfilter: nf_queue: do not allow packet truncation below transport header offset
    8e0ed463dbd5 sctp: fix sleep in atomic context bug in timer handlers
    bc135e464dee i40e: Fix interface init with MSI interrupts (no MSI-X)
    46462e26e65f tcp: Fix a data-race around sysctl_tcp_comp_sack_nr.
    d42f68a9ceb4 tcp: Fix a data-race around sysctl_tcp_comp_sack_delay_ns.
    c2b57a4d3ff6 Documentation: fix sctp_wmem in ip-sysctl.rst
    2d30375343b6 tcp: Fix a data-race around sysctl_tcp_invalid_ratelimit.
    5d235c2fc295 tcp: Fix a data-race around sysctl_tcp_autocorking.
    e02c7ee5a430 tcp: Fix a data-race around sysctl_tcp_min_rtt_wlen.
    558a2949608f tcp: Fix a data-race around sysctl_tcp_min_tso_segs.
    fb200869eabe net: sungem_phy: Add of_node_put() for reference returned by of_get_parent()
    e20dd1b0e0ea igmp: Fix data-races around sysctl_igmp_qrv.
    73e5a0b59129 ipv6/addrconf: fix a null-ptr-deref bug for ip6_ptr
    421e5dd1f12e net: ping6: Fix memleak in ipv6_renew_options().
    3d492b008b3d tcp: Fix a data-race around sysctl_tcp_challenge_ack_limit.
    dfdc635d55f9 tcp: Fix a data-race around sysctl_tcp_limit_output_bytes.
    d62e255ecc33 scsi: ufs: host: Hold reference returned by of_parse_phandle()
    b1343528c7ae ice: do not setup vlan for loopback VSI
    15d019860159 ice: check (DD | EOF) bits on Rx descriptor rather than (EOP | RS)
    cd23a2ad7b7c tcp: Fix a data-race around sysctl_tcp_nometrics_save.
    f9a03fd8ed31 tcp: Fix a data-race around sysctl_tcp_frto.
    3be498bcf6ea tcp: Fix a data-race around sysctl_tcp_adv_win_scale.
    f4b83df01105 tcp: Fix a data-race around sysctl_tcp_app_win.
    f240d0cad26c tcp: Fix data-races around sysctl_tcp_dsack.
    b9f937d3d54d s390/archrandom: prevent CPACF trng invocations in interrupt context
    911904c577e0 ntfs: fix use-after-free in ntfs_ucsncmp()
    098e07ef0059 Bluetooth: L2CAP: Fix use-after-free caused by l2cap_chan_put

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  4 ++--
 .../linux/linux-yocto-tiny_5.4.bb             |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 20 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 91cb68dc8d..8e8fbb5b12 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0bba5a75ccbb78703197b5c16499733079979425"
+SRCREV_machine ?= "f6c9d6db383201a730e8d638995eae82acd4d8e7"
 SRCREV_meta ?= "028688aaad2b64e353d771ba5505a8666cd01696"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.208"
+LINUX_VERSION ?= "5.4.209"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index e369770d4b..cdccebeb1c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.208"
+LINUX_VERSION ?= "5.4.209"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "d38a6d65eb92e50dfd0152af4a79978d8df19c50"
-SRCREV_machine ?= "550ae0d8908f5f7176b54afd6730b614c1a28ee8"
+SRCREV_machine_qemuarm ?= "8f087017ff03465fa8d318c06a7e4e072c533daf"
+SRCREV_machine ?= "a4b7263158de8713dc85c5171aed99e3424a9f7c"
 SRCREV_meta ?= "028688aaad2b64e353d771ba5505a8666cd01696"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 3b9481af4b..0f597fc3d6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a182bd07250f86a80f2eae38a404532f1dfc72e6"
-SRCREV_machine_qemuarm64 ?= "e9742104ea2f0af13d5bffb7455759eb648bc615"
-SRCREV_machine_qemumips ?= "28fb757496c273f1405ca7fea85ef5b94a5dd7be"
-SRCREV_machine_qemuppc ?= "6ec7e0cd9f39bef1aa7c00be4fe91fedc96e64a4"
-SRCREV_machine_qemuriscv64 ?= "2abc3740e7891a58015cbfa8f9283785cd498cad"
-SRCREV_machine_qemux86 ?= "2abc3740e7891a58015cbfa8f9283785cd498cad"
-SRCREV_machine_qemux86-64 ?= "2abc3740e7891a58015cbfa8f9283785cd498cad"
-SRCREV_machine_qemumips64 ?= "df50d1958e0eac5cc60a2548e6bfa94e9bc91b9b"
-SRCREV_machine ?= "2abc3740e7891a58015cbfa8f9283785cd498cad"
+SRCREV_machine_qemuarm ?= "4fefb5a57ecb9bc5c6aab38319f773b02c894e6b"
+SRCREV_machine_qemuarm64 ?= "407b5fa877ca8993a405542fa4c3d73584e8ea98"
+SRCREV_machine_qemumips ?= "1bfe5d39c9f954f0ac2480115f4750f39500d4f4"
+SRCREV_machine_qemuppc ?= "753def987b630ed41686223b5dc252436757e893"
+SRCREV_machine_qemuriscv64 ?= "90d5f03a7c79ccd5c02e0579049d22cf2686da9b"
+SRCREV_machine_qemux86 ?= "90d5f03a7c79ccd5c02e0579049d22cf2686da9b"
+SRCREV_machine_qemux86-64 ?= "90d5f03a7c79ccd5c02e0579049d22cf2686da9b"
+SRCREV_machine_qemumips64 ?= "b391bfc877fe8ae41e579ffd4bcd814b4ad438ea"
+SRCREV_machine ?= "90d5f03a7c79ccd5c02e0579049d22cf2686da9b"
 SRCREV_meta ?= "028688aaad2b64e353d771ba5505a8666cd01696"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.208"
+LINUX_VERSION ?= "5.4.209"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


