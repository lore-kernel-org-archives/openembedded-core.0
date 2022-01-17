Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03C6C43217
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 19:58:16 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.2605.1642449495417821198
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 11:58:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RRYDcsun;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id h2so142068qkp.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 11:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3b8K9fC4ociABAnJmnnz9LsJ1ft07pWu08R6joW10HI=;
        b=RRYDcsunfW8C2hL5g3v8hOTCSyQfnUmdCBAfqkPNZDuz+kgbY0lvpccigAdagbBfDM
         rxJ6XuA+qXUIkQwAYefDD5b1eb715ZTygy8LUb3hkiUzUkW5KJOdHSbg3x6B4wlPAb1Q
         Wp0rp+ZsdQ6tBgrD3OOYLs7dCWFdJBXswhFd+cj2REW921ik1ptOwjN2q43I+vVdt1z5
         U/szeJfuVT1m6MjydPu0661GH46oNN05bJN889wANe38HiSnH/RZRZ8un6R8CWAPZ5yl
         W+FjS2y6x7WqY6+bYu+II7eHTnIbZ1sTcdJLBA1SRGp93A1iSaEIofykAEPGSXNw70d4
         zUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3b8K9fC4ociABAnJmnnz9LsJ1ft07pWu08R6joW10HI=;
        b=xpj80of5TXypwHooqzYy0hNgKIaEVn1xB9/0Hfw4gK7Azkjlg06ucl0bl0Xog8fR7Z
         D3eCSGl5OHcbHeqXpQGGRkN687yVRSCVJP+RHZhfIkGKvmi1t5gpGCN5jYR/IiUScAh+
         1obNuTOFzVBPBVU403sFqacpjBZikUn45iF1vhuPqA9rHanmavFnF/QbvgY9K+HJuZ5y
         62wtX5RBT5GgJavuj2cQaQdzO82pswKKgFY0xwfMuluZPg+etadCgfWnL10NXd40Bg93
         csOZy+8NHGM1Y55KZFpzn/1ikqDV6EZeJKV7jEPEp/PA370d8UUErIf2bcy+j2JRxk2w
         G1vA==
X-Gm-Message-State: AOAM5325JJdDg3rCt9yFATg7CvWspf5/QiiMME8sjWNO9nkXXQCHZNF1
	wtWqrrYKfpar7Asfe5dEzmUXdhpDtSucTQ==
X-Google-Smtp-Source: 
 ABdhPJzWN24HbLmHSt+A1MdvBPJXurYS5h13eLb6ZkAiTNiyuc7+I//LqQ47AdAJCH09i3udYJjAXA==
X-Received: by 2002:a05:620a:2016:: with SMTP id
 c22mr11925348qka.508.1642449494513;
        Mon, 17 Jan 2022 11:58:14 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 o6sm8851203qtr.83.2022.01.17.11.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 11:58:13 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com,
	richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4][dunfell] linux-yocto/5.4: update to v5.4.171
Date: Mon, 17 Jan 2022 14:58:09 -0500
Message-Id: <20220117195810.30114-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20220117195810.30114-1-bruce.ashfield@gmail.com>
References: <20220117195810.30114-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 19:58:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160659

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    0a4ce4977bbe Linux 5.4.171
    0101f118529d mISDN: change function names to avoid conflicts
    34821931e18e atlantic: Fix buff_ring OOB in aq_ring_rx_clean
    44065cc11797 net: udp: fix alignment problem in udp4_seq_show()
    0ad45baead37 ip6_vti: initialize __ip6_tnl_parm struct in vti6_siocdevprivate
    8b36aa5af4da scsi: libiscsi: Fix UAF in iscsi_conn_get_param()/iscsi_conn_teardown()
    6a3ffcc9ffd0 usb: mtu3: fix interval value for intr and isoc
    f0e57098243c ipv6: Do cleanup if attribute validation fails in multipath route
    c94999cfbbbe ipv6: Continue processing multipath route even if gateway attribute is invalid
    2a6a811a45fd phonet: refcount leak in pep_sock_accep
    db0c834abbc1 rndis_host: support Hytera digital radios
    72eb522ae6f1 power: reset: ltc2952: Fix use of floating point literals
    159eaafee69b power: supply: core: Break capacity loop
    102af6edfd3a xfs: map unwritten blocks in XFS_IOC_{ALLOC,FREE}SP just like fallocate
    10f2c336929d net: phy: micrel: set soft_reset callback to genphy_soft_reset for KSZ8081
    c0db2e1e60c6 sch_qfq: prevent shift-out-of-bounds in qfq_init_qdisc
    bcbfc7780047 batman-adv: mcast: don't send link-local multicast to mcast routers
    76936ddb4913 lwtunnel: Validate RTA_ENCAP_TYPE attribute length
    2ebd777513d9 ipv6: Check attribute length for RTA_GATEWAY when deleting multipath route
    a02d2be7eb48 ipv6: Check attribute length for RTA_GATEWAY in multipath route
    34224e936a9d ipv4: Check attribute length for RTA_FLOW in multipath route
    125d91f07233 ipv4: Check attribute length for RTA_GATEWAY in multipath route
    1f46721836ee i40e: Fix incorrect netdev's real number of RX/TX queues
    f98acd3b4dcf i40e: Fix for displaying message regarding NVM version
    c340d45148c4 i40e: fix use-after-free in i40e_sync_filters_subtask()
    38fbb1561d66 mac80211: initialize variable have_higher_than_11mbit
    7646a340b25b RDMA/uverbs: Check for null return of kmalloc_array
    5eb5d9c6591d RDMA/core: Don't infoleak GRH fields
    415fc3f59595 iavf: Fix limit of total number of queues to active queues of VF
    23ebe9cfda5e ieee802154: atusb: fix uninit value in atusb_set_extended_addr
    aa171d748a36 tracing: Tag trace_percpu_buffer as a percpu pointer
    db50ad6eec87 tracing: Fix check for trace_percpu_buffer validity in get_trace_buf()
    cbbed1338d76 selftests: x86: fix [-Wstringop-overread] warn in test_process_vm_readv()
    6904679c8400 Input: touchscreen - Fix backport of a02dcde595f7cbd240ccd64de96034ad91cffc40
    6e80d2ee44c6 f2fs: quota: fix potential deadlock

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 9832de5880..6b1a10476c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "693f365a839705814228d4d7a9fb362285af3542"
-SRCREV_meta ?= "3ff7377107711b2670620aac2be36b3edefe7f37"
+SRCREV_machine ?= "2e96217d85f653d79f1e691c84aaf178931550a7"
+SRCREV_meta ?= "17ac54a7a0b472a035fea8aacd1f31c1fa322ff0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.170"
+LINUX_VERSION ?= "5.4.171"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index c5e6e16357..80d260cf88 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.170"
+LINUX_VERSION ?= "5.4.171"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "f0f037abc011fc633c51f9557471babb368668f3"
-SRCREV_machine ?= "0c76d34c0744a8f3d8b4a41860fc9f12624b082a"
-SRCREV_meta ?= "3ff7377107711b2670620aac2be36b3edefe7f37"
+SRCREV_machine_qemuarm ?= "59c50d08a8c111c9941b53cc3903cafc7b9339f0"
+SRCREV_machine ?= "da1b138e527f276887038d0091980ec5bfbd0824"
+SRCREV_meta ?= "17ac54a7a0b472a035fea8aacd1f31c1fa322ff0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index d7af5fe1cb..2d7703ec0e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2ee0677973f1c676d52c6864c0a227b8d0a91a3d"
-SRCREV_machine_qemuarm64 ?= "205b919a1a53a5c46ff432cfc7292cbf688f34ce"
-SRCREV_machine_qemumips ?= "ff59072d3f2b8189e65f1006357d003ef68ec03b"
-SRCREV_machine_qemuppc ?= "bd68bc38761902dea6a823853f6044f6688751ca"
-SRCREV_machine_qemuriscv64 ?= "d4f5a7cecc479dcfff63bd7e92507521956fb8b8"
-SRCREV_machine_qemux86 ?= "d4f5a7cecc479dcfff63bd7e92507521956fb8b8"
-SRCREV_machine_qemux86-64 ?= "d4f5a7cecc479dcfff63bd7e92507521956fb8b8"
-SRCREV_machine_qemumips64 ?= "8aa05337ebd7798187b81f2561de15f2074a5eca"
-SRCREV_machine ?= "d4f5a7cecc479dcfff63bd7e92507521956fb8b8"
-SRCREV_meta ?= "3ff7377107711b2670620aac2be36b3edefe7f37"
+SRCREV_machine_qemuarm ?= "c961afa9250955e8bc4e286fba5942181cdfce45"
+SRCREV_machine_qemuarm64 ?= "0408baf57ccb7975ea0291418f44c1bf241b9792"
+SRCREV_machine_qemumips ?= "1e20719de0a733cf6c9f1f5467a16e8449dd1eb3"
+SRCREV_machine_qemuppc ?= "40c08791a68abb946948e1aea7532dc156e9eaa5"
+SRCREV_machine_qemuriscv64 ?= "3889c10487e465acf5a2ecf182be8a9adb8ce863"
+SRCREV_machine_qemux86 ?= "3889c10487e465acf5a2ecf182be8a9adb8ce863"
+SRCREV_machine_qemux86-64 ?= "3889c10487e465acf5a2ecf182be8a9adb8ce863"
+SRCREV_machine_qemumips64 ?= "31c53aae874ab1a677be38ffe29dc0e7084a08f4"
+SRCREV_machine ?= "3889c10487e465acf5a2ecf182be8a9adb8ce863"
+SRCREV_meta ?= "17ac54a7a0b472a035fea8aacd1f31c1fa322ff0"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.170"
+LINUX_VERSION ?= "5.4.171"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


