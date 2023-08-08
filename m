Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84741C001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 04:01:37 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.54243.1691467288318662570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 21:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JHO5Lv/S;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-63cf28db24cso31731426d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 21:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691467287; x=1692072087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/3ACJEvcxd+OkgiayYBkG2lf2LCMQ8Pge/VkQkOeZY=;
        b=JHO5Lv/SY3rzOuMoEjCjDpqMenr4SHWQEfPYIHtpF6ZxYk2Y0rIMQPfL1Iq9YjDt8k
         8Cqs43QppcTWk1bFscLpYXvLAvH0BYiKzjTFN9aibWm81xJ5ALMO6Bugr0nS4rWd6hPS
         wCT0+tR7QVs8s1d5m5D9fcLJAvKEvzGexmp++1rO7mwGH/FWQkepIyMbVn0goiqVcFMv
         M6+dvrD11Yl4k0N2eWZ9uEBum2a0zGhd4aXfSaw29ODYr2UHTTe3VDwp1cJZ0/vNfOYo
         sw6SGZ5jayK/R2V8dz9cG0brNxzegCpqboaS+HljvvAtRyyWxOyNK2h0OmmDmDGkci+P
         jziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691467287; x=1692072087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/3ACJEvcxd+OkgiayYBkG2lf2LCMQ8Pge/VkQkOeZY=;
        b=SgG/ug7wndlQVoHiVWsPrWY1EIld8vbk/q1KCCnAXljV6yDdaeAmeUQhcAirVpMIlm
         oqmSnZDaSPGEs9jk+CnwHYiwxhmYplACmoaOrcsymI2aJDbkwbhdLJnEPW/i9UhUFwhN
         7BTMNFDxe8ox+jPoh0l2A0XjctcEiRyIV9ApQ4oF/UUXFsLtPDxVEvpjF6+FOBwybfoc
         2q8odR/Yt56zJx0IwOoclUzrmv//eiwJ9imedagZvpbZH4FureFXx5FmpnYdpFNhoeKq
         QcKhD89yVKgJKmtaezm5kVKjEUSW4nJ6JV8bANTucRLFo00+hExgy2BPjEwaaLh4vy9f
         zi7g==
X-Gm-Message-State: AOJu0YxJ7CDH1OzcDipqlOu5SLNPOQIBzu+brCwChbxgkoUXzz+yUO5V
	plo2OsWDedgos9o2mvjKdyONFrYIyDTy2g==
X-Google-Smtp-Source: AGHT+IES1AvrH0shw1rWm6b/OusgraF69CWJ0ndxK5npb1h3F9ff8Ev0rTDr2cmwzidUX+EfVf21vQ==
X-Received: by 2002:ac8:5a0e:0:b0:400:95e4:a311 with SMTP id n14-20020ac85a0e000000b0040095e4a311mr18141460qta.24.1691467287363;
        Mon, 07 Aug 2023 21:01:27 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id r4-20020ac85e84000000b00406b11a54b8sm3112656qtx.7.2023.08.07.21.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 21:01:26 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/3] linux-yocto/5.10: update to v5.10.187
Date: Tue,  8 Aug 2023 00:01:23 -0400
Message-Id: <20230808040124.3231454-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808040124.3231454-1-bruce.ashfield@gmail.com>
References: <20230808040124.3231454-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 04:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185645

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    140d69b4e41d Linux 5.10.187
    93df00f9d48d x86/cpu/amd: Add a Zenbleed fix
    191b8f9b0e37 x86/cpu/amd: Move the errata checking functionality up
    113ce5ed59fc x86/microcode/AMD: Load late on both threads too

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 6d8effd6e2..5feaa9811a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4a1803ede76bf613f627954d55abc14bc3ce33a2"
-SRCREV_meta ?= "2edebf2a655a6ee6f23846cf9af1f81352fc5cd1"
+SRCREV_machine ?= "0a7d0eaa4e53eede45702dde31a3580e4cce0034"
+SRCREV_meta ?= "35a34e59a7c16f5f115ab371352ff2712c695d4d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.186"
+LINUX_VERSION ?= "5.10.187"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 8a013a3862..1e401e2499 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.186"
+LINUX_VERSION ?= "5.10.187"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "be5fe90e1270855b9cc67ae6312fe04fa4d19693"
-SRCREV_machine ?= "1d287024a6dd075a6dc4027679fea5df640cebd6"
-SRCREV_meta ?= "2edebf2a655a6ee6f23846cf9af1f81352fc5cd1"
+SRCREV_machine:qemuarm ?= "54fe699b2a16739a9fb3905d3a6c6ff7475214ea"
+SRCREV_machine ?= "2fe6f9bdf89df6d468f7e2c7fc070993a11f029a"
+SRCREV_meta ?= "35a34e59a7c16f5f115ab371352ff2712c695d4d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 2ccedd8c45..93eff2bd58 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f9df75cf799c8ac43b932476c7ad6b4b4fba33de"
-SRCREV_machine:qemuarm64 ?= "404cf5c05b3fc82b4d8395fcc5abe4b26407665a"
-SRCREV_machine:qemumips ?= "9d39a0ab63dfaa32be0ddd02b61acd2fe1a2b156"
-SRCREV_machine:qemuppc ?= "e55cd861f7167730eb17a5c82891fad17c515b64"
-SRCREV_machine:qemuriscv64 ?= "cfcf13659ada4eee41e11484404de999ce571196"
-SRCREV_machine:qemuriscv32 ?= "cfcf13659ada4eee41e11484404de999ce571196"
-SRCREV_machine:qemux86 ?= "cfcf13659ada4eee41e11484404de999ce571196"
-SRCREV_machine:qemux86-64 ?= "cfcf13659ada4eee41e11484404de999ce571196"
-SRCREV_machine:qemumips64 ?= "7d139a5b0b4abc1a7104845c5c9f2523dce0d589"
-SRCREV_machine ?= "cfcf13659ada4eee41e11484404de999ce571196"
-SRCREV_meta ?= "2edebf2a655a6ee6f23846cf9af1f81352fc5cd1"
+SRCREV_machine:qemuarm ?= "ca4bf25fb041f115ee9144acf175266e7d2c5495"
+SRCREV_machine:qemuarm64 ?= "7ef1d2f467aa45b98241421262e607ec080e0921"
+SRCREV_machine:qemumips ?= "f275b4829346d60d1cb600d4b8195eb6812361fd"
+SRCREV_machine:qemuppc ?= "af1960c76a2c940eee2e7b4c20e07c248b030b02"
+SRCREV_machine:qemuriscv64 ?= "c4d95d557212e22763382fd345d8c7efc92f825f"
+SRCREV_machine:qemuriscv32 ?= "c4d95d557212e22763382fd345d8c7efc92f825f"
+SRCREV_machine:qemux86 ?= "c4d95d557212e22763382fd345d8c7efc92f825f"
+SRCREV_machine:qemux86-64 ?= "c4d95d557212e22763382fd345d8c7efc92f825f"
+SRCREV_machine:qemumips64 ?= "2f630e9e4b3c809cf48d8e252477845c405195cc"
+SRCREV_machine ?= "c4d95d557212e22763382fd345d8c7efc92f825f"
+SRCREV_meta ?= "35a34e59a7c16f5f115ab371352ff2712c695d4d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.186"
+LINUX_VERSION ?= "5.10.187"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


