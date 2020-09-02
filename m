Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.8803.1599057187912595149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 07:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XWuuYiVe;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id n10so3700851qtv.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 07:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ktG5+US5L7O9sbRY4H3PwEzbnyBNJ45Kdz4yzLz9A6U=;
        b=XWuuYiVeGwB6+BoZ9Egcdso2AQXAhBGyxhmvbGQwmDR4aoCp7anfX9zpZ5fqdk8KRT
         NJzpaKT6IcAEzS0P4tc0GmuKLKm12j6mp4elzxebcXURw/b3dsOQRNrPD0kuVUiAIO55
         EK+i1nLSLT2LKj9ngYWjp5XokeZfmkVYHsL/9aYec/vB1QGIIvdEdOgKk/8PR7v+L7ed
         T0sEzGbzCEYWjkgL4VKLJZbrj+57CVzonI6QwgqXDy8kZg49D68l605uScN0hH/WTmGP
         q0dmVh0Cf3ZkIPjpHUNehOWUe0j5ytTaytiM8HOlHNmS2Oed8zUCSic19uc3n6Gxfezj
         7Ksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ktG5+US5L7O9sbRY4H3PwEzbnyBNJ45Kdz4yzLz9A6U=;
        b=TjyZFgc/cMEU+GeoqiJR51f1n1u33BNTwXhAjuvQkmtdm2bR4IhUaUEMyorHwxQoFY
         KfSDs4DkvryThnRUAg4cP3qJWYmYyDQEjbz6c+VwqDjcd15S24OnUSLFBVNkierUvEh8
         T+i1cAwfWHH7+X1DLGzyTsgHC3XB93itcluXSzM70dIem/edSCvhHhEgTMcimEfRFkIK
         jdLK1/O8Yszks0IaUGaDNY/wEo4orGvKA67eQuA9WJ/PhhKFKmKQq73MMhBHl3KGrkWh
         pGe3aq4+BgAikVGXjsweD6bRwqA6yh2g4v5t1X/Mk1v+kDXGQ0M7EbQI46mdA/iVAWSN
         Iarg==
X-Gm-Message-State: AOAM530v2dtFaCmlkTiA6+8zIIiHCXMlWz6FB142mohvC5QDytV7suqg
	BlL2Go35p6oNrTsqj4yoqPE=
X-Google-Smtp-Source: ABdhPJy3DqCVHLyRl8po9PMMiEndmyE7HR7OLOIpw+N3G8/Qcjmt0r9C90Q0UmhYe4UMMDFy/W64ew==
X-Received: by 2002:ac8:691:: with SMTP id f17mr4390753qth.241.1599057186906;
        Wed, 02 Sep 2020 07:33:06 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id v14sm4589461qto.81.2020.09.02.07.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 07:33:06 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/5.8: update to v5.8.5
Date: Wed,  2 Sep 2020 10:33:03 -0400
Message-Id: <20200902143304.22364-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.8 to the latest korg -stable release that comprises
the following commits:

    9ece50d8a470 Linux 5.8.5
    c05dea7c0f3f binfmt_flat: revert "binfmt_flat: don't offset the data start"
    44f639d5aeda io_uring: fix missing ->mm on exit
    3f4be7a7db9f netlink: fix state reallocation in policy export
    1c0be9a99c9c ethtool: Don't omit the netlink reply if no features were changed
    507d7ac63fad ethtool: Account for hw_features in netlink interface
    e53140320193 ethtool: Fix preserving of wanted feature bits in netlink interface
    da995e0a6dac net: ena: Make missed_tx stat incremental
    3942262b7499 tipc: fix uninit skb->data in tipc_nl_compat_dumpit()
    828fd2e892b0 tipc: call rcu_read_lock() in tipc_aead_encrypt_done()
    22f2be57784e net/smc: Prevent kernel-infoleak in __smc_diag_dump()
    df805b956877 net: sctp: Fix negotiation of the number of data streams.
    4c1fc05e5d6a net/sched: act_ct: Fix skb double-free in tcf_ct_handle_fragments() error flow
    351366ffef2c net: qrtr: fix usage of idr in port assignment to socket
    c4c76ec584a7 net: nexthop: don't allow empty NHA_GROUP
    a75f8a60c415 net: Fix potential wrong skb->protocol in skb_vlan_untag()
    3f13223bb0b1 gre6: Fix reception with IP6_TNL_F_RCV_DSCP_COPY

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.8.bb               |  4 ++--
 .../linux/linux-yocto-tiny_5.8.bb             |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 20 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index f956f04d53..a87cad962e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
+SRCREV_machine ?= "ded3e9afb3262feb367227c63da1f762f893b192"
 SRCREV_meta ?= "0a4bef3856894e8bca3c74c97e7924ad262c0dc8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.8.4"
+LINUX_VERSION ?= "5.8.5"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index ae3b82b86a..3661072a48 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.8.4"
+LINUX_VERSION ?= "5.8.5"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "657076afb65e40e322bcc3b2bb8eeca590e20912"
-SRCREV_machine ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
+SRCREV_machine_qemuarm ?= "5bc60299c57b6dd6d88cd3196e1a3949a4365214"
+SRCREV_machine ?= "ded3e9afb3262feb367227c63da1f762f893b192"
 SRCREV_meta ?= "0a4bef3856894e8bca3c74c97e7924ad262c0dc8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index 0f162f87be..91a4873fc9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a23a3757322d01974a65285aefcf7fdbbcde9aa8"
-SRCREV_machine_qemuarm64 ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
-SRCREV_machine_qemumips ?= "1f31484dac3aaf69f06a07d8869bd04d1d0377b7"
-SRCREV_machine_qemuppc ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
-SRCREV_machine_qemuriscv64 ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
-SRCREV_machine_qemux86 ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
-SRCREV_machine_qemux86-64 ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
-SRCREV_machine_qemumips64 ?= "768aed7c0609f38222ee7672981a9b60c943f4fb"
-SRCREV_machine ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
+SRCREV_machine_qemuarm ?= "683da0bfdf000de0d65dc4a3c66bdc9906735144"
+SRCREV_machine_qemuarm64 ?= "ded3e9afb3262feb367227c63da1f762f893b192"
+SRCREV_machine_qemumips ?= "a86380b2bc78d8a40af8608569fe8d7f88f1bfd7"
+SRCREV_machine_qemuppc ?= "ded3e9afb3262feb367227c63da1f762f893b192"
+SRCREV_machine_qemuriscv64 ?= "ded3e9afb3262feb367227c63da1f762f893b192"
+SRCREV_machine_qemux86 ?= "ded3e9afb3262feb367227c63da1f762f893b192"
+SRCREV_machine_qemux86-64 ?= "ded3e9afb3262feb367227c63da1f762f893b192"
+SRCREV_machine_qemumips64 ?= "c0568a8edccef3a9bb29c2c4911b8200892c23f2"
+SRCREV_machine ?= "ded3e9afb3262feb367227c63da1f762f893b192"
 SRCREV_meta ?= "0a4bef3856894e8bca3c74c97e7924ad262c0dc8"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.8.4"
+LINUX_VERSION ?= "5.8.5"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

