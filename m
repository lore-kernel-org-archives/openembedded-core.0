Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.1623.1618790798643141035
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 17:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H6TiTfGM;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id e13so24464172qkl.6
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 17:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zzznsgbVqkUrd1HJmR6iJyzgGVIAgtPaWF7H+SexjVQ=;
        b=H6TiTfGMlH2+64BwDZwSSbBksGbsgBsmJOVedBKp440C8f4RMLd+pbsJhkN3UVA/n7
         C3zy/Q1Vh7sEfRb8CDGgVTb1IblVhP5GQCNQYbB3X1ZEqvPaJ20cN6tMTw47gG3SDHzB
         rNSjj2S+l+oAEW438ltXIQqsUhHAxjrPK+wfJQffIXBfYg4x17n8Seg3oPTMxALbYi8R
         dpfOe5iSUnzcD4S2oN/M0gDAyRNTTQmSGYw35Fzmvzy7AGEBXfwDGV4uOX4OHjENxmkR
         ZYLsRdOpxFz4UAeOn13pxSnx+MJ6/HNxY6E4QceMlppqoahXe8/1ID3uJ6qksMjkOzsy
         AiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zzznsgbVqkUrd1HJmR6iJyzgGVIAgtPaWF7H+SexjVQ=;
        b=YGtQ4PwiHh4UOK3HBYH95nL3nYTC6ukEfBB6z4pqkEUQzzrx4Qvxa1D7tXY/955kN0
         ZPf3216CgEq7NmJ9TxDkLcHHF8avqPmv5zHx2cqZj3MVQhvBYinykKInjGW2dgefxsT0
         NIWQqh0dms2SbvXG173qWoHx8NUYuvk8NSoNtkYOi2+LiBozH5s3UHx6229RoqBw6puV
         PY/U1lImhBpX38m00AIPR4W0WSU9rSWIiV7gbmLrQNAp9I59dbHM1UGSksnsmJL0yfU5
         gJtre/QCJJTMpM1ug3vFCMpLH1CwqHMiINj5bbfaN61oJN2HNtgESLU+ypPWk2JlKf7I
         bYoA==
X-Gm-Message-State: AOAM531eyqwcPzg32lCaIv2S9LL+hDRt/yiaJ2d1RqY/kjm9i4MCbWiE
	XorMSyscYE+G+SQhti5OnFzyhyRC2wHi/A==
X-Google-Smtp-Source: ABdhPJxnax5+Ze2n4p86ORChXLJ+eZ/foAY/0azS0wro7WHlzURFGqeZ0FEh5OFFSRsF9kWH2u/sdg==
X-Received: by 2002:a37:2cc1:: with SMTP id s184mr9480289qkh.489.1618790797817;
        Sun, 18 Apr 2021 17:06:37 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id n136sm8641759qka.133.2021.04.18.17.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 17:06:37 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] linux-yocto/5.10: BSP configuration fixes
Date: Sun, 18 Apr 2021 20:06:26 -0400
Message-Id: <9b453994266a85d4bb17b1e71f31eb8701ca4b4b.1618790681.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1618790681.git.bruce.ashfield@gmail.com>
References: <cover.1618790681.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10.:

    fa039db710c qemuppc64: Enable the RTC driver
    f6cfc23fbfc nxp-s32g2xx: add HSE UIO related configs to make hse demo work
    2b445fb1e0b firmware: fix CONFIG_FW_LOADER option mismatch warning
    60dde01d949 nxp-imx8: Correct DRM_TTM config and delete redundant config
    07119316ee5 xlnx: bsp: drop obsolete kernel options for xilinx-zynqmp and xilinx-zynq
    0cf78165f8e bcm-2xxx-rpi: update v5.10 kernel config for raspberrypi 4b platform
    9b5a9e46778 marvell-cn96xx: Add the preempt-rt support

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 3e08b5aec5..1896b2f295 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8262073e1b09920fb55a32d698c3a98c3af628eb"
-SRCREV_meta ?= "bbff9c3b4b30e741730c2ceb2365ab18639c246a"
+SRCREV_machine ?= "57f0dabaec5ad65d936350e9b1f69791c8ddf97e"
+SRCREV_meta ?= "fa039db710ceb054f8670e09e7e31142c1566253"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 92c15e9b5b..a7b93fce7a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "2825075bb360f256c3a9dcdf3cf67b34423d657d"
-SRCREV_machine ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
-SRCREV_meta ?= "bbff9c3b4b30e741730c2ceb2365ab18639c246a"
+SRCREV_machine_qemuarm ?= "ae643fde3bb3d99f194ec0b6b9662bdd1d508c2f"
+SRCREV_machine ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
+SRCREV_meta ?= "fa039db710ceb054f8670e09e7e31142c1566253"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index f89f513878..d480fc27c7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0441d737d347be0b8bcf9bef0b7707d5ba2741a0"
-SRCREV_machine_qemuarm64 ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
-SRCREV_machine_qemumips ?= "5fbc41f5c569e11bf5e56beea77c432efa69b99e"
-SRCREV_machine_qemuppc ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
-SRCREV_machine_qemuriscv64 ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
-SRCREV_machine_qemuriscv32 ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
-SRCREV_machine_qemux86 ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
-SRCREV_machine_qemux86-64 ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
-SRCREV_machine_qemumips64 ?= "a60cf276769d28c6c495dbf2816a50871705d5eb"
-SRCREV_machine ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
-SRCREV_meta ?= "bbff9c3b4b30e741730c2ceb2365ab18639c246a"
+SRCREV_machine_qemuarm ?= "036f0e96d68be58be2e97ea7cab11f9ca2fb8e1c"
+SRCREV_machine_qemuarm64 ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
+SRCREV_machine_qemumips ?= "46964fe445c229120a9733ed98dcd5ab8454c999"
+SRCREV_machine_qemuppc ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
+SRCREV_machine_qemuriscv64 ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
+SRCREV_machine_qemuriscv32 ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
+SRCREV_machine_qemux86 ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
+SRCREV_machine_qemux86-64 ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
+SRCREV_machine_qemumips64 ?= "efe9e0c23330929c92a364d2497b231d1325ef29"
+SRCREV_machine ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
+SRCREV_meta ?= "fa039db710ceb054f8670e09e7e31142c1566253"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

