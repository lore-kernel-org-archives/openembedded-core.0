Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAB9EB64DD
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 03:34:46 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.71.1689651280720005545
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 20:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nloAzLPq;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4039a42467fso32842481cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 20:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689651280; x=1692243280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++Gro3AaaH+LOQ7OpQuYhmohaDj0QzZA+qHTyNPGcT8=;
        b=nloAzLPqsWsr797vFbDbQr6QWYlvGBQ12ESDNGpxhedjSi8uv5OgVu2nJ6hq3Tpaid
         CH1WSjGt4KNJsXC6Kl29jEqdwBjRJvCLDpvi5ZK7ggncuoy00Y60OQ5CSl34nqM+lbsi
         HAU0WjMx3dXd+hr3R9vhlJUbHPDwhKKv22JL+fJ2+1E3eLkB785h5iTz/TeH5aaGEe7j
         KUzracapE+sBUoYrehxn4DqRXBJ3pbIcktOJkEkpciYojvo8D8giNz8SwPHWEcbrqbDx
         kV1rnqTzFH6cNQPRJv5hOFGK4/+NImrYkyOV3AWJjxst3XJYvmLQRQ5OhiMImfrmm8GD
         wFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689651280; x=1692243280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++Gro3AaaH+LOQ7OpQuYhmohaDj0QzZA+qHTyNPGcT8=;
        b=BKQLvfRZ5Fq+oihIQ019bqDcDIGZ/fnyXFYRtiYvQRw2eacv2hEHpZN9tn4KHSLf84
         PeVv91ACMfCuHIks2aaaCp09OdMID2jZgCwbiiGpiDd5XWvVOL0xCyiH6xPzBINL+FPa
         J8QRuce3N4Fh28U8F3E4871QU5BBD8BEulqEWYshkVCiwxxiTho1TTV1FJvQwdPx5s21
         n/CwdyiS8+QRa/0nEn7I2RpNQfWwL9oquLLn5uJw0xImiXHT4BTWsBj7h+V5JMt8COxq
         2M0ze5t06Rs24QHKPoAeKmBNPtqd/nfgU/D5XbGa5qUvqdTZqm2BoeKhTP92Q/hbpXqj
         WRSg==
X-Gm-Message-State: ABy/qLbwDuNME0WCUJ5X/DnWtJwAGeRnEGLK50uZvUDbJyVKcGtww/RG
	S/T4TuBvSQULWrOCya926KRAQODdkamViw==
X-Google-Smtp-Source: APBJJlF4zVomLAnY5NbFZZK3Ki/DX6pJM0UWfaWERE9oTy46O6O56MOwmcCw1OLkb98Zd6HcO022eA==
X-Received: by 2002:ac8:590c:0:b0:403:54d7:e328 with SMTP id 12-20020ac8590c000000b0040354d7e328mr1155363qty.9.1689651279649;
        Mon, 17 Jul 2023 20:34:39 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id k5-20020ac80745000000b00403715e4cb7sm356633qth.79.2023.07.17.20.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 20:34:39 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/6.4: update to v6.4.3
Date: Mon, 17 Jul 2023 23:34:34 -0400
Message-Id: <731f8c8661e12ede801f5efafadd9a50c93e4017.1689651113.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689651113.git.bruce.ashfield@gmail.com>
References: <cover.1689651113.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 03:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184491

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    160f4124ea8b Linux 6.4.3
    036666b4163d fork: lock VMAs of the parent process when forking
    890ba5c464c2 bootmem: remove the vmemmap pages from kmemleak in free_bootmem_page
    e83e62fb1f38 mm: call arch_swap_restore() from do_swap_page()
    18822d84fd09 mm: lock newly mapped VMA with corrected ordering
    406815be903b mm: lock newly mapped VMA which can be modified after it becomes visible
    10bef9542ad3 mm: lock a vma before stack expansion

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 4a048b19f4..26b4eb5658 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0c7d2016a3a548fd8f7caf7b1f46abd71008cd5c"
-SRCREV_meta ?= "d40b8461761ed3a7a52c53a2b3129d5dbad04f41"
+SRCREV_machine ?= "7682858d44d18f0aef63a29ae7a575fd06b839f1"
+SRCREV_meta ?= "ba6cc4ef36e055aaa7710111d55ea30fa0549fc6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.4.2"
+LINUX_VERSION ?= "6.4.3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 67bea2223f..3bb562789c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.4.inc
 
-LINUX_VERSION ?= "6.4.2"
+LINUX_VERSION ?= "6.4.3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
-SRCREV_meta ?= "d40b8461761ed3a7a52c53a2b3129d5dbad04f41"
+SRCREV_machine ?= "17eff7ed940e09879e95c77bb66d5c3ffaed682e"
+SRCREV_meta ?= "ba6cc4ef36e055aaa7710111d55ea30fa0549fc6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 0252543c35..723bf4b0c6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "89ab6408aa244552f100996ac5a2b49379bf9a2b"
-SRCREV_machine:qemuarm64 ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
-SRCREV_machine:qemuloongarch64 ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
-SRCREV_machine:qemumips ?= "7abe3962401b09a7768acc879070671308c04163"
-SRCREV_machine:qemuppc ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
-SRCREV_machine:qemuriscv64 ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
-SRCREV_machine:qemuriscv32 ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
-SRCREV_machine:qemux86 ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
-SRCREV_machine:qemux86-64 ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
-SRCREV_machine:qemumips64 ?= "4dddf5763b3a26b7892ed75d02bcb9c25a3fe703"
-SRCREV_machine ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
-SRCREV_meta ?= "d40b8461761ed3a7a52c53a2b3129d5dbad04f41"
+SRCREV_machine:qemuarm ?= "16c806279fc162e769b1359be53941c210074bb6"
+SRCREV_machine:qemuarm64 ?= "17eff7ed940e09879e95c77bb66d5c3ffaed682e"
+SRCREV_machine:qemuloongarch64 ?= "17eff7ed940e09879e95c77bb66d5c3ffaed682e"
+SRCREV_machine:qemumips ?= "1e22bf901a1b9e56293f93a8f06638608a64944b"
+SRCREV_machine:qemuppc ?= "17eff7ed940e09879e95c77bb66d5c3ffaed682e"
+SRCREV_machine:qemuriscv64 ?= "17eff7ed940e09879e95c77bb66d5c3ffaed682e"
+SRCREV_machine:qemuriscv32 ?= "17eff7ed940e09879e95c77bb66d5c3ffaed682e"
+SRCREV_machine:qemux86 ?= "17eff7ed940e09879e95c77bb66d5c3ffaed682e"
+SRCREV_machine:qemux86-64 ?= "17eff7ed940e09879e95c77bb66d5c3ffaed682e"
+SRCREV_machine:qemumips64 ?= "0dfb1ac4cd963c856a8dc956cf79f561cf56e83f"
+SRCREV_machine ?= "17eff7ed940e09879e95c77bb66d5c3ffaed682e"
+SRCREV_meta ?= "ba6cc4ef36e055aaa7710111d55ea30fa0549fc6"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d7defc5b8d422ba19ab762a96cf1b1eb158aa5a8"
+SRCREV_machine:class-devupstream ?= "160f4124ea8b4cd6c86867e111fa55e266345a16"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.4/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.4.2"
+LINUX_VERSION ?= "6.4.3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


