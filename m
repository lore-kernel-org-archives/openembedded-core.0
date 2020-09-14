Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.459.1600122870901025347
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 15:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XR+MG7QB;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id t20so1609030qtr.8
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 15:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IMcYABQo2Alf541c5yv/a0pDpPjKqO9H2jFtswF3Ygg=;
        b=XR+MG7QBvgUuYuIapVbaZ2Osnct2JgRGKVjQA+/rzAn4Wb7UvvKxoUsqr4p51pUKeZ
         mhhxkaaV9pzeyNw16ap5wlXq3T0NfSiErENUr7jYHfrXuc0WhxnDgcQyqhrRP87mTWO4
         Icir1EfFL+9Z/ulNot6uReq3medISb+hJehM5uQ5QZ2GumD9epjdO6IsEcAo1CfWGido
         8EZae8gBryFRA6LawOvCXeRXHVbkOko8ApxbLnQ2gNJby10jr/b2Z4R2GDuCaq+MEakf
         xisdWF6Q8mdlqCf5BxIjspOjW/MZ50OgKivPAK9d5yRtGMHT5KMiTLDzXofb34UWj6Yt
         MwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IMcYABQo2Alf541c5yv/a0pDpPjKqO9H2jFtswF3Ygg=;
        b=Qkwgi6H/SxXAoTJT25oQYGNO2szbXFU1/zbTVHOhPpniACStQJzdcZ2IwMPSfmP1ck
         l1SVTd6W1T6W99Roish0D3zgfXvbCGmyM5HWk9W2eJPSDqkS/dWhBkB/rsPvx92CfuKs
         htz1hN5rQh8xMwL6k9Lih/4jyepNgB5tT3Umh+RBKSLCIapYuORb9gf1X7kS8SBM1Hvc
         bKFQx8NAvxI+nbd+KHzwksKorzZe9eD9FtcFfaI+Ux8HnVnHJTK4+jfSF2tti/SVK40n
         ihilTFDu6uegMiPs3gLPtQ7Mtd2CNza4gNgc0xvDTdIeS3yTo9DW+TVgqdSmnyHCCR1x
         gLmA==
X-Gm-Message-State: AOAM531RjxehRQIal5BwNUln4vevdGPBtidlyk6OtMJy41kk/5IQCBxF
	gBjg1gYdm7gvckiik4LE6w8OLMdNIUKyFq9D
X-Google-Smtp-Source: ABdhPJxc7Bbbc1W/Y0A5ZV9vV/OT3fbY9bvYUc8xsJqXOCz9Et0o72ZdWrQwITD1OnKHibkWO1K6Lw==
X-Received: by 2002:ac8:f37:: with SMTP id e52mr15596695qtk.280.1600122869998;
        Mon, 14 Sep 2020 15:34:29 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id v131sm16355770qka.97.2020.09.14.15.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 15:34:28 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/5.8: update to v5.8.9
Date: Mon, 14 Sep 2020 18:34:19 -0400
Message-Id: <88cf008209ef57078b87bf74163ebe936a9aad8d.1600122415.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1600122415.git.bruce.ashfield@gmail.com>
References: <cover.1600122415.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.8 to the latest korg -stable release that comprises
the following commits:

    f82f36b2fb1d Linux 5.8.9
    cdba995d2f19 mptcp: free acked data before waiting for more memory
    655e1af6aecd net: disable netpoll on fresh napis
    6f0e276cda3e tipc: fix using smp_processor_id() in preemptible
    aae250a26893 tipc: fix shutdown() of connectionless socket
    44c3fca3de64 taprio: Fix using wrong queues in gate mask
    db16256c95ac sctp: not disable bh in the whole sctp_get_port_local()
    05a8237c08f0 net: usb: dm9601: Add USB ID of Keenetic Plus DSL
    6540bd18bf2f netlabel: fix problems with mapping removal
    089097476c4c ipv6: Fix sysctl max for fib_multipath_hash_policy
    d68c3397de48 ipv4: Silence suspicious RCU usage warning
    bd15d2192261 RDMA/cma: Execute rdma_cm destruction from a handler properly
    d4794085738d RDMA/cma: Remove unneeded locking for req paths
    c2064ac30331 RDMA/cma: Using the standard locking pattern when delivering the removal event
    5a0c4cbd099b RDMA/cma: Simplify DEVICE_REMOVAL for internal_id
    87d8175e9c3d io_uring: fix linked deferred ->files cancellation
    f5fea75f4ea4 io_uring: fix cancel of deferred reqs with ->files

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index ec8060c945..d29c5985cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "542471b271e827808692640e58f8771ff6bc67dc"
-SRCREV_meta ?= "7d52eb95f6d0899e764f58fec27acf1b477e31c7"
+SRCREV_machine ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
+SRCREV_meta ?= "a933cb2f91915dceb138775c3878212e228d3eff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.8.8"
+LINUX_VERSION ?= "5.8.9"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 2461254fb4..d32e5d372b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.8.8"
+LINUX_VERSION ?= "5.8.9"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "14a8e34bdcc80797e7b3355241625f13d3396ed8"
-SRCREV_machine ?= "542471b271e827808692640e58f8771ff6bc67dc"
-SRCREV_meta ?= "7d52eb95f6d0899e764f58fec27acf1b477e31c7"
+SRCREV_machine_qemuarm ?= "830cb9af40e856615b7a435a4fac57b748ba56d6"
+SRCREV_machine ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
+SRCREV_meta ?= "a933cb2f91915dceb138775c3878212e228d3eff"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index a0a55ac569..9ff1d5da80 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0e9ceeb178a44d70be22088205d9e6b52f9feb3f"
-SRCREV_machine_qemuarm64 ?= "542471b271e827808692640e58f8771ff6bc67dc"
-SRCREV_machine_qemumips ?= "68ccca78b4c670e7db82ee7d5aa289abb4910ebe"
-SRCREV_machine_qemuppc ?= "542471b271e827808692640e58f8771ff6bc67dc"
-SRCREV_machine_qemuriscv64 ?= "542471b271e827808692640e58f8771ff6bc67dc"
-SRCREV_machine_qemux86 ?= "542471b271e827808692640e58f8771ff6bc67dc"
-SRCREV_machine_qemux86-64 ?= "542471b271e827808692640e58f8771ff6bc67dc"
-SRCREV_machine_qemumips64 ?= "18d9d696a89282b3c7b9d3a0b4bbe9d5500e9eb3"
-SRCREV_machine ?= "542471b271e827808692640e58f8771ff6bc67dc"
-SRCREV_meta ?= "7d52eb95f6d0899e764f58fec27acf1b477e31c7"
+SRCREV_machine_qemuarm ?= "d351bf87c9c0e96a1f27f87f16d298bc4470e0b5"
+SRCREV_machine_qemuarm64 ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
+SRCREV_machine_qemumips ?= "93d29a70890b19fb5482ebcab5f3a49301851daf"
+SRCREV_machine_qemuppc ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
+SRCREV_machine_qemuriscv64 ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
+SRCREV_machine_qemux86 ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
+SRCREV_machine_qemux86-64 ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
+SRCREV_machine_qemumips64 ?= "4faa049b6b7b51c5d12d20c5e9fcf8e0a3ba8d42"
+SRCREV_machine ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
+SRCREV_meta ?= "a933cb2f91915dceb138775c3878212e228d3eff"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.8.8"
+LINUX_VERSION ?= "5.8.9"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

