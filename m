Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E6FC25B0D
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 22:32:41 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.1025.1660170753751783710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=CV1XrhjP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id l64so15632701pge.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=PoJngnXCaF+R/N97CcYX2A0AK2EdIgYO0CXKrd8JDhk=;
        b=CV1XrhjPUvmXLHWADqiRhTUxoDZnbXdzLCMH1h+Ywv4HzOs5U9Os/e58YG8Sx5J7WE
         6Q69iIe+GjiVW3LiPSxhSSLcKu9uSrHqS1XEI2SGF9rm7xZFdIWRRVVaQetx/d/9aMzd
         ImNFCC07Dk0gheaeq6t4eh4d6F6E8uHhhEVuh6jv91rvT1kyQ83CJs5ahUFDnaxIwFjv
         2rd3FLlh70g4Ub2Lp2hrLYAQjJdgRpuX3UO0GYTsAariBEvGK16ngITGJRRd35luqwnO
         OIU4Uk9vAiTc9ZVusoauYgWdLxklS2qexS/4DJrofb//pG+FRD8swXAx3fnBSLSm2xd9
         SXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=PoJngnXCaF+R/N97CcYX2A0AK2EdIgYO0CXKrd8JDhk=;
        b=6qqk0u7vNvld5AKjwXqYkx5e16GXf2LVAOz5TrQcLOyUWlodUAsLMPTLYS8WsxurmX
         HffRxhuRxnnKcATtM+WmqZOdmsN1o/zS+4lENBvGXhjChRnwVFe33GAMUo0GaR5nsFsK
         DrSpYjwllcPr/Kneu4+21rdBFWklywzGHUTXvIinVDtUdk9DDuAIGzvcKa5WtoOU2C4y
         BPdhQZL8c4bpofm+28nYSJpp97FLQ7KyRAvqzt35dXuWWEvMcuPs8PD4MV1dMVYYTQjd
         nVT6kIRHAE007n35sEGKUKCTSRk3uz/Dm3+N1MIPf9EVtQanjDo6re9r8F+uiJnJsSbb
         oxcQ==
X-Gm-Message-State: ACgBeo1kg1GXdnX5fb48Gouej5SGoF+0imehM+/wuIUHQZX8AQrb79MG
	0bN6Z8t9zd0tvHHDOr35Ci6OmEDV8SpIjA85
X-Google-Smtp-Source: 
 AA6agR6jiPaeEF81CIana1WjK4Q3a4L27Xco8G3e7odynrgs5QAOLAAkG+0dtTfqJSpRUB2o0pyxJA==
X-Received: by 2002:a05:6a00:26c1:b0:52e:4a87:ad with SMTP id
 p1-20020a056a0026c100b0052e4a8700admr29213814pfw.68.1660170752768;
        Wed, 10 Aug 2022 15:32:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x14-20020aa79ace000000b0052d7606d144sm2532513pfp.74.2022.08.10.15.32.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 15:32:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/11] linux-yocto/5.4: update to v5.4.209
Date: Wed, 10 Aug 2022 12:32:03 -1000
Message-Id: 
 <bd55001d9f895c7d52fedc7d1d2eb7b2ad7032b1.1660170592.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660170592.git.steve@sakoman.com>
References: <cover.1660170592.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 22:32:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169218

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


