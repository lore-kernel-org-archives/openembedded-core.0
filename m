Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.497.1600122872216995464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 15:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oPUxy8oF;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id t138so2243960qka.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 15:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c9inlHTl2O/bGHYGfdbidZDr/nSJzFNbjnSJxE3FvlI=;
        b=oPUxy8oFO4xSFkEIf+3MflzNKV/XBZeZA3zL8V11Psn6rI8FoJjOiR510yHEE8DbGa
         fvvqn41J9dhd/1yS/nPUerBdy0SCZTPIGWqZiAsFIiebjw8Natb1Rcqj59OcmgN/lwV0
         QvH2o7r7+nhF8/pI3T1YWmFbLgMFznmXsf2cxHCXnwcNtchYfSaniSG72vkP+o2Ug/IM
         xIuVVQ3R393GQXzt/C4l12RxuC5QB0/z9wsKt6usWzXXeRYc7aFW+KUea3+fRdbbJxB1
         amWRygh3dKERuV0vGG483lf0NdonXC2o7AF6Ut0ocxc0+vlgCOjm6YvO8LYHpaVjJ9fx
         +Eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c9inlHTl2O/bGHYGfdbidZDr/nSJzFNbjnSJxE3FvlI=;
        b=IGbI5GV2Ak+C4X6Xdo9OFdvdHxUgaf3NYJHUZnJzFoIKZAIohPFFysfgk/hNsxFDTg
         26b2G0z7AqhuxLbRkvus9d2MK8moxMV9vGmUPQ0ij8KObI0Aumyj5b1fsR0JwAdY/j2/
         mS4bjpG/g2XO6bmRfdSDWf9gdttIOfxfGBYkiDdfR3g3EJPZ4IpI1Pdsw7JhUCwkxbWa
         TGRQXBwQ3NjfVH/ZdLxt4+YNlUFxO7L8PrNe72Wjlxx+7/+JE3Qbe16y1HYrcZIbsGhF
         hrOIkuqNJ1FR8eVrNuWu15rnAgFKOiVkgA5IT4Uin/3nTN8x+J3TPMAIcT4yWdBDjst0
         RLEQ==
X-Gm-Message-State: AOAM532sd3FojPayxoz6sBl8ArF1iFm0+Do+ZRhlrXVYOQLaNttQImLn
	+o0HKrZbjQHkYZ+LjqMf4nZwFqeVwQC38XRd
X-Google-Smtp-Source: ABdhPJwXKv1zg/imzpR9B/lchrOSzH0vIdSJeZkbQiqpMZlelLQTPqs8X1nUYvBRAze+xBr0tszEAw==
X-Received: by 2002:a37:aca:: with SMTP id 193mr15315150qkk.149.1600122871310;
        Mon, 14 Sep 2020 15:34:31 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id v131sm16355770qka.97.2020.09.14.15.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 15:34:30 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/5.4: update to v5.4.65
Date: Mon, 14 Sep 2020 18:34:20 -0400
Message-Id: <b9e11439db319bf7d1686823e09d411556a66c68.1600122415.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1600122415.git.bruce.ashfield@gmail.com>
References: <cover.1600122415.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    6c3d34dea2fc Linux 5.4.65
    ddb279d64b72 net: disable netpoll on fresh napis
    09c45065257b tipc: fix shutdown() of connectionless socket
    b95eb482c288 taprio: Fix using wrong queues in gate mask
    20f8c874789a sctp: not disable bh in the whole sctp_get_port_local()
    8b61bb0b2d57 net: usb: dm9601: Add USB ID of Keenetic Plus DSL
    346fefa82325 netlabel: fix problems with mapping removal
    3f73dbf94f8f ipv6: Fix sysctl max for fib_multipath_hash_policy
    263e463358d3 ipv4: Silence suspicious RCU usage warning

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 97cb7d934f..73876bb99e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b170a5953260ea7d7bdfcf223fb92d138eb7db67"
-SRCREV_meta ?= "34b6e8caf82c411655d33e0eeff6700a8de1f6fc"
+SRCREV_machine ?= "1d9e25c4f35155580cef313ff2a76de545124a1d"
+SRCREV_meta ?= "0d860e075788a92601dff3eb9b615ee41e465040"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.64"
+LINUX_VERSION ?= "5.4.65"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 7d836593c9..853fc93694 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.64"
+LINUX_VERSION ?= "5.4.65"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "3bd01ef1ebb9b2a9bbae3c35eb9d640cd1ab9da7"
-SRCREV_machine ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
-SRCREV_meta ?= "34b6e8caf82c411655d33e0eeff6700a8de1f6fc"
+SRCREV_machine_qemuarm ?= "bb77791bc00cfa70211dd238d312b4db950c0808"
+SRCREV_machine ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
+SRCREV_meta ?= "0d860e075788a92601dff3eb9b615ee41e465040"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 26778a67a3..fe93691961 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "33ab5549b39d7bbfc067f13527bfa817250c69a3"
-SRCREV_machine_qemuarm64 ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
-SRCREV_machine_qemumips ?= "7954ad760bd317039a9ad44300a8bf1a34107fc8"
-SRCREV_machine_qemuppc ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
-SRCREV_machine_qemuriscv64 ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
-SRCREV_machine_qemux86 ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
-SRCREV_machine_qemux86-64 ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
-SRCREV_machine_qemumips64 ?= "91fb319534f5206619aa04556dbf32d49afa1080"
-SRCREV_machine ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
-SRCREV_meta ?= "34b6e8caf82c411655d33e0eeff6700a8de1f6fc"
+SRCREV_machine_qemuarm ?= "894e63d3256613faa39931a6ae505cfd196df067"
+SRCREV_machine_qemuarm64 ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
+SRCREV_machine_qemumips ?= "aa13fdb2c5f8c4e4e432bfee6df9c8f76ec8ac70"
+SRCREV_machine_qemuppc ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
+SRCREV_machine_qemuriscv64 ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
+SRCREV_machine_qemux86 ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
+SRCREV_machine_qemux86-64 ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
+SRCREV_machine_qemumips64 ?= "4fb21d604fc54db63221ea28ab90622c29d74202"
+SRCREV_machine ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
+SRCREV_meta ?= "0d860e075788a92601dff3eb9b615ee41e465040"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.64"
+LINUX_VERSION ?= "5.4.65"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

