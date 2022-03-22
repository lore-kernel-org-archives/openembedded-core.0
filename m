Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8D7C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:20:13 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.13073.1647969612079429460
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gkQ1G++w;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id bp39so3262161qtb.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1RYLvEpUM5sYK1AUPy7ipmFvLx5DtQWEUYDDEgfrwdU=;
        b=gkQ1G++wnqfqF5x1vb99081VNNFuUdP0dWNmpfhRMCogXhivscyGlP6vWgp+/CK3Ak
         bPF9INWanydS+Ngeu8LEDR+CZEPaRyeN0LdiAg70R2vNHPbAzlG/reoAosbzMXtRL5o4
         luGm1nv2gCvMe2oMTA+2y0VLU/CGHvlfhe2ZauPIRKkGZYeOmG5q4AUtjcfx78oXFl1j
         9dJTOJenrGMjlXtGyGckwXArFdyMFPOaWdN3luzD8iH2xDXyCsSF4V8+98F5Mhfx1ag4
         64zw3BhGzWUW3F/Dhc1K9Y19FMSZYwl26JjWmB16inLANdZJDob81FJUb5mOqxiUJmBk
         N/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1RYLvEpUM5sYK1AUPy7ipmFvLx5DtQWEUYDDEgfrwdU=;
        b=5byneOxkEQmMzZaI1hl3/54viGNpSyN0SybSXg0qh7cwscm6Ta6zK+TIocn0Ara4tC
         DKTK8oN8rTVYRIi5eEAdo1O5mWzmONfUoDX4SjRXMEsGTS1saO9bGzxM4F5pABxBm4F3
         eI8esxcuV5kvff/zJySqdB/SYkBZjHqbiVPdm3i81tkofFczwIgoPNI+RC61jYSTG2Jn
         H/79gwQUZI6fVnfmEUM7weMtBPM5vLHuQWAexv/SM+n/ydOLfxvCY+g/CzQp43Ky4Q2V
         ZeWKpJvTcc40x0yaHmHQIifYYhEfWaC8HsAjpocjkf6QiMY6cIbpr/5xaTzCv6XvtiZM
         B8CQ==
X-Gm-Message-State: AOAM533cH5Ys6zOVuaYy6llr75zpLUKcoENphbpjrBLyafcxtgixHHgr
	jG8lhmC7xd7y6B+8Iu+UFTzioxfF1JLUdA==
X-Google-Smtp-Source: 
 ABdhPJychOICykFJ6OQ0HL4pTiGq5M/yus8HxTKCZG/X1ta2cSIMgwmbZZiMp7z2xj+q7Q9n7FbTIQ==
X-Received: by 2002:a05:622a:1a97:b0:2e0:62b2:4507 with SMTP id
 s23-20020a05622a1a9700b002e062b24507mr21220151qtc.328.1647969611160;
        Tue, 22 Mar 2022 10:20:11 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q8-20020a05622a04c800b002e06d7c1eabsm14019648qtx.16.2022.03.22.10.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 10:20:10 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/10] linux-yocto-rt/5.10: update to -rt61
Date: Tue, 22 Mar 2022 13:19:57 -0400
Message-Id: 
 <852a34fce11b88c753a851865fbf8a3c2812d7fe.1647969481.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1647969481.git.bruce.ashfield@gmail.com>
References: <cover.1647969481.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 17:20:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163565

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto-rt/5.10:

    48b12b48c110 Linux 5.10.90-rt61
    2367f287812f aio: Fix incorrect usage of eventfd_signal_allowed()
    640f56f85c08 stop_machine: Remove this_cpu_ptr() from print_stop_info().
    38c47ed56da8 eventfd: Make signal recursion protection a task bit
    45f3f3c787e3 Linux 5.10.90-rt60
    257f82607c82 Linux 5.10.87-rt59
    7ff031bb6566 Linux 5.10.83-rt58
    03cfb1aadc5e Linux 5.10.80-rt57

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 88fb3b4113..17fc109728 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e0d87d9831a6e0df20a370adc9aba0d032d91661"
-SRCREV_meta ?= "b56db30a7c5a0d86ccc853ee68be925086318f88"
+SRCREV_machine ?= "48b12b48c1103b811263aaed4d81bfb8b24fdfc4"
+SRCREV_meta ?= "cec5f94cd2090d98b2dcfeee7a4258ae6adce506"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index f1c2bc33e4..9a4bf39b46 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "38f8b1b5b87959e6cb9367151e233d27befe015d"
-SRCREV_machine ?= "cc70f051e56005acda2e6ea994cadfb2538e66f6"
-SRCREV_meta ?= "b56db30a7c5a0d86ccc853ee68be925086318f88"
+SRCREV_machine:qemuarm ?= "3c9683e7166044d91c0ef900491f2f881a8bd6b7"
+SRCREV_machine ?= "7f3e78220d6510de21d74e3f330f1f93cb635745"
+SRCREV_meta ?= "cec5f94cd2090d98b2dcfeee7a4258ae6adce506"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 87a7d5e3ae..3aa28b3009 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "74469c4b03f62e4b4da066e52785ed74b1d121ae"
-SRCREV_machine:qemuarm64 ?= "69f185342f516efa8a9233e31d2c3f8356b3a388"
-SRCREV_machine:qemumips ?= "d97607700b2fba19af10b2110b99c448ed9a88e9"
-SRCREV_machine:qemuppc ?= "090085d4bb6181c3b972d82c9f8f7ed88c90ad6b"
-SRCREV_machine:qemuriscv64 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
-SRCREV_machine:qemuriscv32 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
-SRCREV_machine:qemux86 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
-SRCREV_machine:qemux86-64 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
-SRCREV_machine:qemumips64 ?= "a1b43f69bce61143dd4d6d637f619eadd3fabb6e"
-SRCREV_machine ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
-SRCREV_meta ?= "b56db30a7c5a0d86ccc853ee68be925086318f88"
+SRCREV_machine:qemuarm ?= "ed7ac660431f6eb29add763876d7a10b6a6e539e"
+SRCREV_machine:qemuarm64 ?= "9ca22664eb7cd86b7c91770bdaa1c5581a081938"
+SRCREV_machine:qemumips ?= "4d5c2b576ee19c6ede626f2ffdb6a96d06ddd065"
+SRCREV_machine:qemuppc ?= "54e5ceedcce6039a0479eaeea000e3c42cf4e4bc"
+SRCREV_machine:qemuriscv64 ?= "0370165abaa08fa66808c54ed345eb70a558268b"
+SRCREV_machine:qemuriscv32 ?= "0370165abaa08fa66808c54ed345eb70a558268b"
+SRCREV_machine:qemux86 ?= "0370165abaa08fa66808c54ed345eb70a558268b"
+SRCREV_machine:qemux86-64 ?= "0370165abaa08fa66808c54ed345eb70a558268b"
+SRCREV_machine:qemumips64 ?= "012ce81097a4d2d94a7d5cb596fb4ad7d8f438f1"
+SRCREV_machine ?= "0370165abaa08fa66808c54ed345eb70a558268b"
+SRCREV_meta ?= "cec5f94cd2090d98b2dcfeee7a4258ae6adce506"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.19.1


