Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2A1C4706F
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 14:25:20 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.52375.1703168717992837990
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 06:25:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SMq3ewmo;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-77f8308616eso55440085a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 06:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703168717; x=1703773517; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pToijUd4ZgmZU2QXmLjCUb9Q/9zD3HrLtpDh8G9JhVs=;
        b=SMq3ewmoN5R/srRzDXmPnN2KRbbXkwEOJAC/DQ7qi1R9Sdr1gLxfbD9nu72xG4SbeO
         nWnRuMZ12IXQ++g3llsf80xiTaTwcS9QxNks3tig9e9V53z+kiSgrqF1djzKEEF1gFh8
         4/wTcmgE+zxbAnSFdW1zA4pj2PTFsbc9+lC8EQ780JRaLzyeFC5oT6fFVoxGF9k6E3cA
         eDJYUBlMHIt604TsCdjFdZTakdZTs169N5Um2zQwMvv+vy6wJ4432Je7YY6SjBVIXt39
         LrYGvo6SP9LU+YIetAyaQCbHxu+bmT1vDawHsYrS0eHvh/jD+eugHz+eNFEN4Dpsxp2m
         /j/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703168717; x=1703773517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pToijUd4ZgmZU2QXmLjCUb9Q/9zD3HrLtpDh8G9JhVs=;
        b=hPnm1stdqjf0TQjMQru06am0THORNDhD0dEBmdNcH/v/MReZgT0N9uuBB3PKCoOrSN
         AAtBifEU9qrIIzl5ABKg3mO1nTY6VOX1sw8ulacULFZpeqao0apIYsNz30d6h60s1wRN
         Cl2alxYx9yWTBsg5SSeOyeipMg8MIMOEfQjto9TLGU/XeAa5TZGarJr2d03p+S1/n36T
         IreoZfWJFoaosfA+BpxK3FY+o4UFx9DeG7E+ZJV9JGAU4MinsDxxFXAWmFU0J+ql87GJ
         ICj2bYaKYDdEa7OMSw8kGxQ5X4wF/b2L8PadoZbM5KXFaSkBiX03aNFGQjVq2uSuO0tc
         thzQ==
X-Gm-Message-State: AOJu0Yw9rY6U1AwDJDeiAM6YlqZU9H7UR4T5vuMmcT3pKNUG7R+9S78p
	RjqQBiXD+lAIqQTMqyyZ8StAe6bgt2mqTpu1
X-Google-Smtp-Source: AGHT+IHH5Gjq4M5eXR8GHShX1rXwNJ7tJyWTWOIkZZa7jL3ffTnqZCcyp+PKS0MMm7EXApudvjzmpw==
X-Received: by 2002:ae9:e40f:0:b0:77f:2ee7:3eb with SMTP id q15-20020ae9e40f000000b0077f2ee703ebmr23612432qkc.128.1703168716917;
        Thu, 21 Dec 2023 06:25:16 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g4-20020a37e204000000b0077eff6eece8sm679490qki.62.2023.12.21.06.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 06:25:16 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/6.1: update to v6.1.67
Date: Thu, 21 Dec 2023 09:25:07 -0500
Message-Id: <4f5988389934fd260399c47f172c8e27f96a89dd.1703168370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1703168370.git.bruce.ashfield@gmail.com>
References: <cover.1703168370.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 14:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192834

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    e7cddbb41b63 Linux 6.1.67
    db46c77f3d51 Revert "wifi: cfg80211: fix CQM for non-range use"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 54f7f4efef..93fc6a73e9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "97d59da1d2d5a9ace6b4e7695b1eabbcd6197c4c"
-SRCREV_meta ?= "211dccdc1a71cd953c83f88a025adfa6b5c58ad4"
+SRCREV_machine ?= "40d218ec6d26f4d8de1481ef665e7eafb18f45aa"
+SRCREV_meta ?= "b1742128ddec29743c5f9d5c031a5770ece2b1b6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.66"
+LINUX_VERSION ?= "6.1.67"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 3e025e6726..e3d3671a32 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.66"
+LINUX_VERSION ?= "6.1.67"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
-SRCREV_meta ?= "211dccdc1a71cd953c83f88a025adfa6b5c58ad4"
+SRCREV_machine ?= "5b9711b24429c3543018411369d7086839169481"
+SRCREV_meta ?= "b1742128ddec29743c5f9d5c031a5770ece2b1b6"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 18beb3c3a1..3380604229 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "7f7eb326b47065b720ad4c760b77d52021336f95"
-SRCREV_machine:qemuarm64 ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
-SRCREV_machine:qemuloongarch64 ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
-SRCREV_machine:qemumips ?= "638a98e4a2146f79a588b125d74addaae42f75a2"
-SRCREV_machine:qemuppc ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
-SRCREV_machine:qemuriscv64 ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
-SRCREV_machine:qemuriscv32 ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
-SRCREV_machine:qemux86 ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
-SRCREV_machine:qemux86-64 ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
-SRCREV_machine:qemumips64 ?= "d39acda588fe786b00969ade6eef057d86386578"
-SRCREV_machine ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
-SRCREV_meta ?= "211dccdc1a71cd953c83f88a025adfa6b5c58ad4"
+SRCREV_machine:qemuarm ?= "6b4fd468de656727bb53d6faf7634157a3f80d4b"
+SRCREV_machine:qemuarm64 ?= "5b9711b24429c3543018411369d7086839169481"
+SRCREV_machine:qemuloongarch64 ?= "5b9711b24429c3543018411369d7086839169481"
+SRCREV_machine:qemumips ?= "09c54782be2fdab1a62e547504c28f57160b81fd"
+SRCREV_machine:qemuppc ?= "5b9711b24429c3543018411369d7086839169481"
+SRCREV_machine:qemuriscv64 ?= "5b9711b24429c3543018411369d7086839169481"
+SRCREV_machine:qemuriscv32 ?= "5b9711b24429c3543018411369d7086839169481"
+SRCREV_machine:qemux86 ?= "5b9711b24429c3543018411369d7086839169481"
+SRCREV_machine:qemux86-64 ?= "5b9711b24429c3543018411369d7086839169481"
+SRCREV_machine:qemumips64 ?= "a4b4e1d2daa47b400beb16e7f4aa0e7b650d8649"
+SRCREV_machine ?= "5b9711b24429c3543018411369d7086839169481"
+SRCREV_meta ?= "b1742128ddec29743c5f9d5c031a5770ece2b1b6"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "6c6a6c7e211cc02943dcb8c073919d2105054886"
+SRCREV_machine:class-devupstream ?= "e7cddbb41b63252ddb5b7f8247da5d0b24adfac5"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.66"
+LINUX_VERSION ?= "6.1.67"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


