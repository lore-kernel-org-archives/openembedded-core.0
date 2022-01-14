Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D83C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 18:23:49 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.11105.1642184627937588549
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:23:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DyrhPZwP;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id t66so11699678qkb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/as6xLVFPFq/jJ7z/jeAncKgWlUD7p45NsP9RhJR2Qc=;
        b=DyrhPZwPzXeOUWZwtTS4TbyHjOFKS7Lg3QcQLNymAE2/kS8f+awEqtYUiRkhxyUCIm
         5UJnRpHvm4OL+kjOZbz3QfK4URPCb08uceiS/VodG5Mbv5e2xjXl5AvMkFJuvma/23Da
         kUdOLj3/Srm7jNOiokpkEp63eIVnFZjUWztAflN6biWnEhP7cMz5nAvnz8vI2AG5l+WO
         eZsXVNUYsR06Oy7gTtqyUP8KbBf/Pfgb77rkrH86HfU+kehknfcnuYwMEUgw88j5nEFE
         Z98pMSwbi67h7pZ8skmK+csvwfuzLh8YLaHQE7IeG+/XyXoYhIG34v3dHZrPT1na8R1Z
         kztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/as6xLVFPFq/jJ7z/jeAncKgWlUD7p45NsP9RhJR2Qc=;
        b=zNw6P/QdmmrEnVOy0nZi4aXzBbtw2HgzJdgMlTHh3HpogMs0o9X4kZ2zYrCQgsA4NG
         CWq6ULt5WRld/JMLBUr7DoyF/bn1hmlBAFQSXSbBGnZcz3gMB8rd7shO53tzWdqY701V
         IgORU+w8hZhawMovXixBT2hZk/Mlo3iTfwSdBAb0QghBKc8rNcQ2N9Ddhogis1ECIuSu
         micHKZyGK4gvxgxjcF+2G4cG23C1XgOgBm133BrUAxo8jIHmWEP8yjy7HINlTyseIiJt
         Xzxr3r4og/BQN7r0UuWaZJOLl8/iTZ+HVjAPCB89Tvh+aKKUHr9IPV831hwvOA4VvVxF
         24TA==
X-Gm-Message-State: AOAM530N9+dAJwSgWgEKEIlE+VArDdP44n2oeDLYCg3di2WJYlE44VUP
	5nzKNWzO7lEtjNeTuX9puTU=
X-Google-Smtp-Source: 
 ABdhPJxd0T4J6INPM7lBF19Iwp2rVUSRqflmnEbjn4KayqWw1iYpxIgM/dtpHrRTpZOIwq4gmCJxZQ==
X-Received: by 2002:a05:620a:198b:: with SMTP id
 bm11mr7068594qkb.752.1642184626710;
        Fri, 14 Jan 2022 10:23:46 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 z14sm4448995qtw.59.2022.01.14.10.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:23:46 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/5.10: update to v5.10.91
Date: Fri, 14 Jan 2022 13:23:38 -0500
Message-Id: 
 <38e84478d2d3714a1a4edb165a86d3f418336436.1642184457.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1642184457.git.bruce.ashfield@gmail.com>
References: <cover.1642184457.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 18:23:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160589

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    df395c763ba0 Linux 5.10.91
    674071c9eb26 Input: zinitix - make sure the IRQ is allocated before it gets enabled
    ef81f7d406c2 ARM: dts: gpio-ranges property is now required
    f63fa1a0d4df ipv6: raw: check passed optlen before reading
    cf07884e6bec drm/amd/display: Added power down for DCN10
    10b9ccd0674d mISDN: change function names to avoid conflicts
    dd8a09cfbb99 atlantic: Fix buff_ring OOB in aq_ring_rx_clean
    c2f4bb251eb4 net: udp: fix alignment problem in udp4_seq_show()
    f82b48d1d86b ip6_vti: initialize __ip6_tnl_parm struct in vti6_siocdevprivate
    8c87a83ef891 scsi: libiscsi: Fix UAF in iscsi_conn_get_param()/iscsi_conn_teardown()
    b798b677f94d usb: mtu3: fix interval value for intr and isoc
    498d77fc5e38 ipv6: Do cleanup if attribute validation fails in multipath route
    72b0d14a0a88 ipv6: Continue processing multipath route even if gateway attribute is invalid
    5a7d650bb181 power: bq25890: Enable continuous conversion for ADC at charging
    4f260ea5537d phonet: refcount leak in pep_sock_accep
    61952934608c rndis_host: support Hytera digital radios
    62cbde77d9c1 power: reset: ltc2952: Fix use of floating point literals
    998d157e3b2a power: supply: core: Break capacity loop
    16d8568378f9 xfs: map unwritten blocks in XFS_IOC_{ALLOC,FREE}SP just like fallocate
    aa606b82cdfb net: ena: Fix error handling when calculating max IO queues number
    e7f5480978fd net: ena: Fix undefined state when tx request id is out of bounds
    2de3d961f8e7 sch_qfq: prevent shift-out-of-bounds in qfq_init_qdisc
    4c34d5fd8c96 batman-adv: mcast: don't send link-local multicast to mcast routers
    f403b5f96e9a lwtunnel: Validate RTA_ENCAP_TYPE attribute length
    48d5adb08d60 ipv6: Check attribute length for RTA_GATEWAY when deleting multipath route
    173bfa2782fa ipv6: Check attribute length for RTA_GATEWAY in multipath route
    914420a2a6c5 ipv4: Check attribute length for RTA_FLOW in multipath route
    a8fe915be6c2 ipv4: Check attribute length for RTA_GATEWAY in multipath route
    786a335fef18 ftrace/samples: Add missing prototypes direct functions
    c859c4de0bd7 i40e: Fix incorrect netdev's real number of RX/TX queues
    d0ad64438fb5 i40e: Fix for displaying message regarding NVM version
    32845aa60203 i40e: fix use-after-free in i40e_sync_filters_subtask()
    f7edb6b9438b sfc: The RX page_ring is optional
    2b3f34da0d79 mac80211: initialize variable have_higher_than_11mbit
    16e5cad6eca1 RDMA/uverbs: Check for null return of kmalloc_array
    a7c2cae997db netrom: fix copying in user data in nr_setsockopt
    beeb0fdedae8 RDMA/core: Don't infoleak GRH fields
    3ca132e6b065 iavf: Fix limit of total number of queues to active queues of VF
    396e3016905d i40e: Fix to not show opcode msg on unsuccessful VF MAC change
    7f13d14e563c ieee802154: atusb: fix uninit value in atusb_set_extended_addr
    7db1e245cb71 tracing: Tag trace_percpu_buffer as a percpu pointer
    760c6a625506 tracing: Fix check for trace_percpu_buffer validity in get_trace_buf()
    c1e2da4b3f72 selftests: x86: fix [-Wstringop-overread] warn in test_process_vm_readv()
    384111e12367 f2fs: quota: fix potential deadlock

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 75beee3a04..420d67031e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "fbed4064df813f01c1a862548f28b2050ee9b09e"
-SRCREV_meta ?= "ad119826536616f28e4309e825b61e16357f4c7e"
+SRCREV_machine ?= "85c14e209f1ab7cee673735c4561e656b4e65217"
+SRCREV_meta ?= "de35f8006d0f932924752ddda94dd24e2da67fbc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.90"
+LINUX_VERSION ?= "5.10.91"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index c8787085fe..dabcb97a79 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.90"
+LINUX_VERSION ?= "5.10.91"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "ca2928bf9b108b45a8ecfe6c76ae9d66b9527f0c"
-SRCREV_machine ?= "5d7922b2755129e1066944a25675a4f9bdbbe706"
-SRCREV_meta ?= "ad119826536616f28e4309e825b61e16357f4c7e"
+SRCREV_machine:qemuarm ?= "2227ab16358ca3193f03d0cd8509092076aeffbb"
+SRCREV_machine ?= "b3fdab7a9f3c11a61565cead0445883a61081583"
+SRCREV_meta ?= "de35f8006d0f932924752ddda94dd24e2da67fbc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 9bc6511ec2..9c43738135 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "dbf49e7b0801b1b92994f7bc3c6bba943340e273"
-SRCREV_machine:qemuarm64 ?= "0b092f0c4e3471ef22aef0343477519b0ba8b533"
-SRCREV_machine:qemumips ?= "1806335706c3549985836385bb400c1d80819d73"
-SRCREV_machine:qemuppc ?= "270ee670f95ad200c7c32bf8a8ffbf6ed43d7964"
-SRCREV_machine:qemuriscv64 ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
-SRCREV_machine:qemuriscv32 ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
-SRCREV_machine:qemux86 ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
-SRCREV_machine:qemux86-64 ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
-SRCREV_machine:qemumips64 ?= "ea456bce3f1ed65b1ab00a0cf8cf551b5967aec3"
-SRCREV_machine ?= "fd84b99a8ccbfae11300c3a72183616bc0560870"
-SRCREV_meta ?= "ad119826536616f28e4309e825b61e16357f4c7e"
+SRCREV_machine:qemuarm ?= "fb570663823bd492e4c8d4339be825bda4210dc6"
+SRCREV_machine:qemuarm64 ?= "5a52b700c1693a95b8efa54cb65bec7807a75cd2"
+SRCREV_machine:qemumips ?= "8eb8a801f5f4764c362aefd5e97e704755cf740b"
+SRCREV_machine:qemuppc ?= "21b014e385a6b54a2fd7d667a1b556c69cda77de"
+SRCREV_machine:qemuriscv64 ?= "77c8d144b066f69e009ce2ee540a593b11eb736a"
+SRCREV_machine:qemuriscv32 ?= "77c8d144b066f69e009ce2ee540a593b11eb736a"
+SRCREV_machine:qemux86 ?= "77c8d144b066f69e009ce2ee540a593b11eb736a"
+SRCREV_machine:qemux86-64 ?= "77c8d144b066f69e009ce2ee540a593b11eb736a"
+SRCREV_machine:qemumips64 ?= "5468343e50389dba73b5d441289d5094bd0dc9f0"
+SRCREV_machine ?= "77c8d144b066f69e009ce2ee540a593b11eb736a"
+SRCREV_meta ?= "de35f8006d0f932924752ddda94dd24e2da67fbc"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.90"
+LINUX_VERSION ?= "5.10.91"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


