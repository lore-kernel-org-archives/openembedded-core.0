Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web08.226.1626377419474281295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 12:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oS0FgXgx;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id p202so6283902qka.12
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 12:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iDbwoTrxIV4g+pFpoOeDAALnHCCZJH1LPwku17s6Zm0=;
        b=oS0FgXgxBilcG56QvL3MysOQde1TI/VzudHmDMJzrURbi3i91CTd/aqiTPB0JmOxoa
         3oAQeGXqW+YqWzbGR6m7NH8CKiD1tvp8Finwr7A80gASy4CBeekK/pQtmQU0msGopAgD
         G/Hda/cb8B1VQWDrfF1KnriJLahM9EPA7yki0FUN77aLbrEVYKeqWB1dhY10RIG74Guv
         cJua80zJKEYO/Qcw0HrAEL+bQrYmMmq33ZLSTOuPsvytssiW7qcMEZcO9m9b+D8O37Ef
         4M0Tso+POqm0LnDU74XnTJgRsLrSNM87YI34vXsB3KE5sdmBBm5JAuu3s9TZcCDiX+9h
         cBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iDbwoTrxIV4g+pFpoOeDAALnHCCZJH1LPwku17s6Zm0=;
        b=tFn+ZI1RC7fGmScu/lJfSDEtD7HHnng0e42EOrc/yyoabiiN/oS9gjuVws7LIT6eNK
         y9SdcIHmcxTsL6o6cn26Wnx91C2GbyMcWtqSDXqO/e4Hp+AxIfuUknn7q6vjAj0yVsXR
         AGJ8lL8/FaX90B0fZv01fD2HD4hRLTpNU1s0Y/aTXezDho4rJNBWjAqCe+GFqyR4YwBO
         CmbVKQMpO+nAsmVJdnTb1tSrhwLSc76yj0ZPZo5QAFy0Tuay6WHvRBdJvCMJi3GKzHdd
         PXI90RGTQwdmRaP+zhF48X4IjNPTfxVdHI2NfQ4LygR7AcR8EOtJb51i4eWG9WU8fT+o
         W+/Q==
X-Gm-Message-State: AOAM532h5UedUL1cPI1NT5YhMhy+N2EZxbY9Io6xIYjMdeq/91EwGMgR
	I3GS2XREl5jiFXD9CRL/dfY=
X-Google-Smtp-Source: ABdhPJz1RCFVmRGvrJHkRRe61mDYkaQ0CbRF1CsqUHYq7kLxYbXUDJ5RJt4FxufMWpK3cVJ3qNj2vQ==
X-Received: by 2002:a05:620a:2217:: with SMTP id m23mr5840934qkh.383.1626377418617;
        Thu, 15 Jul 2021 12:30:18 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id f36sm2340670qtb.40.2021.07.15.12.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:30:18 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] linux-yocto/5.4: update to v5.4.131
Date: Thu, 15 Jul 2021 15:30:09 -0400
Message-Id: <d772f12de347bc57f72580bb73d2ff19b1369d42.1626377295.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1626377295.git.bruce.ashfield@gmail.com>
References: <cover.1626377295.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    e8d9b740a550 Linux 5.4.131
    d2f8a8a07ee3 xen/events: reset active flag for lateeoi events later
    a05499b29a6e KVM: SVM: Call SEV Guest Decommission if ASID binding fails
    58356f448b61 s390/stack: fix possible register corruption with stack switch helper
    abbd42939db6 KVM: SVM: Periodically schedule when unregistering regions on destroy
    8b24c7edc2f2 Linux 5.4.130
    5e8519c4083b RDMA/mlx5: Block FDB rules when not in switchdev mode
    c5fb49e12f2c gpio: AMD8111 and TQMX86 require HAS_IOPORT_MAP
    cf5eb8209723 drm/nouveau: fix dma_address check for CPU/GPU sync
    3edfd34f1338 scsi: sr: Return appropriate error code when disk is ejected
    a6c85a8433e0 x86/efi: remove unused variables

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 7a4267531f..48514bfe83 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c86c4081f4764f57bbb26df8a9202c01799c3771"
-SRCREV_meta ?= "c5e5dc4e13bd4882a8ed96b8026e6fd268b68f8a"
+SRCREV_machine ?= "2bfba6ef5182dbebe73e576c6d8a629285148215"
+SRCREV_meta ?= "4a0bfc329c4d858e5259e05479716cbe34eeecd7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.129"
+LINUX_VERSION ?= "5.4.131"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 5d487ac23f..33d65466a1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.129"
+LINUX_VERSION ?= "5.4.131"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ca636d1a2ccbb2626c4eacbdb0da2c30654b108c"
-SRCREV_machine ?= "d46f8ecb3f81bdba8131b90dc90174ecb36a1b78"
-SRCREV_meta ?= "c5e5dc4e13bd4882a8ed96b8026e6fd268b68f8a"
+SRCREV_machine_qemuarm ?= "88ff7ffcdf2653941105106e5e26717f0a78d7a9"
+SRCREV_machine ?= "b9bcd1be30f8be9c00797a6368a1f8df7aa21916"
+SRCREV_meta ?= "4a0bfc329c4d858e5259e05479716cbe34eeecd7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 94605b3942..0430e06995 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "dfb964733268c1e6f932900a384a793a0ca8de34"
-SRCREV_machine_qemuarm64 ?= "7d3eac73a6edc8fdcd701bbb0aa8c21030eb2027"
-SRCREV_machine_qemumips ?= "a40b68f2f4be601dfe020940ad29ac894cc31298"
-SRCREV_machine_qemuppc ?= "a3258c8b1690ecfa620eae9552a75cec9224ecd4"
-SRCREV_machine_qemuriscv64 ?= "e211c039dcd85ad2d4c1f1a70909d0eefef49778"
-SRCREV_machine_qemux86 ?= "e211c039dcd85ad2d4c1f1a70909d0eefef49778"
-SRCREV_machine_qemux86-64 ?= "e211c039dcd85ad2d4c1f1a70909d0eefef49778"
-SRCREV_machine_qemumips64 ?= "dded4f6e58cd90c7333b5257c9327e5e30f78e26"
-SRCREV_machine ?= "e211c039dcd85ad2d4c1f1a70909d0eefef49778"
-SRCREV_meta ?= "c5e5dc4e13bd4882a8ed96b8026e6fd268b68f8a"
+SRCREV_machine_qemuarm ?= "1fe32172ee9971daa7debf3fc8165b6ccb80fe85"
+SRCREV_machine_qemuarm64 ?= "087640d0be07b7160b8012ee0e0b08c21915a632"
+SRCREV_machine_qemumips ?= "2e6db18dd388f7b35f70727556e5e55556b5d0a4"
+SRCREV_machine_qemuppc ?= "672230448073e1342fb18137654abff89baacf5f"
+SRCREV_machine_qemuriscv64 ?= "c36ad648e4430819de715bba70fb735ac1f16878"
+SRCREV_machine_qemux86 ?= "c36ad648e4430819de715bba70fb735ac1f16878"
+SRCREV_machine_qemux86-64 ?= "c36ad648e4430819de715bba70fb735ac1f16878"
+SRCREV_machine_qemumips64 ?= "92e0699c1dfc9e9fe6b2dd0015f36a7fcc76092c"
+SRCREV_machine ?= "c36ad648e4430819de715bba70fb735ac1f16878"
+SRCREV_meta ?= "4a0bfc329c4d858e5259e05479716cbe34eeecd7"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.129"
+LINUX_VERSION ?= "5.4.131"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

