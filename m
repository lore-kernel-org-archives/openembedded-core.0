Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684FCC47DDB
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 21:14:36 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.6082.1705698871191259133
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 13:14:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jZ5ndWoB;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6818f3cf006so5418356d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705698870; x=1706303670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lklcJTVt5f+HyFHmLxMjg05HCbwISGGs6NTUhzHZfYY=;
        b=jZ5ndWoBf41gN1VJtctbe3bvDMpJ20aKR4RZ7qVLLO8lHIP+59IGBni6qHAA095C1g
         SkzqjLJNZ9A8Z/Rz+tD5AU963Np5pBde7o9xJbHrm/jLST8wEKGP3vtKK8ApATF0AXnF
         GTuPJh5smSd5gPu8Os9cFQZlEee18LSQer3XGt5vO3ostL0Htn40Urf+YZhzmOCiQyWN
         mu3x2/uEJD7CYwR0SH5Ud8cWr05HLBGi9pMR6uMjzuV/0HAhJGD5VLSpJOkyG0+d/wsy
         3fXLxnjf1FHI7yhmlh9T3z2rtjojIEx37UiFZR3CHkEtOVk/OF2/YmDpkzjke7lA/1gp
         vk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705698870; x=1706303670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lklcJTVt5f+HyFHmLxMjg05HCbwISGGs6NTUhzHZfYY=;
        b=IWsdjCyhBLeg5raovpXCjVOi1x9+8xBeNamDcuXgHwuRx+2XnKJEkevUxErHpy6DUn
         wfY9eR01JKtPuSafFRzGrzioGZv9pyDcFHBYfhrl1O7wad/90c0V1qUaXy9HexzVvF5S
         WUtJ6YYY4VF/ybycJ3Oq3R1KE73Z0e8um+3eGmbUXr5Ddtuaf8CAwor9lStfc2DUlASX
         mJRhKfb5kFrDdTlRJcO6H9LAbQFrR30yDsfVpZtI23RnNHVf+2mh6J898cuVwk1p8sag
         xf0WU2aaTEUvI/2n/vetuuy3ZPmA3xK/3X+usk0/U9DDj1i9blTpcC56BOKOibbUn9kf
         3sUw==
X-Gm-Message-State: AOJu0Yz/PaNckOFIumNgdEj0pqvihaOwjUbrqx0b0k61d+CPvCOSoXNx
	nVWsh2GbJAxFNETYOj2QpzCXM38VYzJIm2dGNbcjeQXKudwPaDzcHauTVeyi/6k=
X-Google-Smtp-Source: AGHT+IEkPzeGavrdpTmZjipNUaA7Jl8jt4isx3mrhxZlfT1qDd0uKrWcFGk5cUqO/8osTT2NHG3VKg==
X-Received: by 2002:a05:6214:dc5:b0:681:87dc:c80a with SMTP id 5-20020a0562140dc500b0068187dcc80amr560836qvt.118.1705698870130;
        Fri, 19 Jan 2024 13:14:30 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id mk13-20020a056214580d00b0068178f50102sm33552qvb.25.2024.01.19.13.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 13:14:29 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/11] linux-yocto/6.6: update to v6.6.12
Date: Fri, 19 Jan 2024 16:14:16 -0500
Message-Id: <d27cff98ba5ba6b4633ad2c130af67d7597bcc24.1705698717.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705698717.git.bruce.ashfield@gmail.com>
References: <cover.1705698717.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 21:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194074

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    47345b4264bc Linux 6.6.12
    edbc56139579 nfsd: drop the nfsd_put helper

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 308beb9bc1..d30389124b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3e67e7e050ae8af74f9158dc71f952539f1516e5"
-SRCREV_meta ?= "268af5402032d35347f7d949673250b9bcc3a389"
+SRCREV_machine ?= "59ee8cb752a7e280cfe2d480964aa5b6c74e4203"
+SRCREV_meta ?= "48f7c852bd375b9340c68897ccd87ad89ead5f38"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.11"
+LINUX_VERSION ?= "6.6.12"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index f32e58f418..628a7cbd82 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.11"
+LINUX_VERSION ?= "6.6.12"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
-SRCREV_meta ?= "268af5402032d35347f7d949673250b9bcc3a389"
+SRCREV_machine ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
+SRCREV_meta ?= "48f7c852bd375b9340c68897ccd87ad89ead5f38"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 0d16fac054..ab72df5c61 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "53699f09df655724152c7c82ce94ebbe8a0a4fd4"
-SRCREV_machine:qemuarm64 ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
-SRCREV_machine:qemuloongarch64 ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
-SRCREV_machine:qemumips ?= "cc1dc06263a8d1c9d78dadc4045fbd47469b791c"
-SRCREV_machine:qemuppc ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
-SRCREV_machine:qemuriscv64 ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
-SRCREV_machine:qemuriscv32 ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
-SRCREV_machine:qemux86 ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
-SRCREV_machine:qemux86-64 ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
-SRCREV_machine:qemumips64 ?= "cbf59cfe385657b0ee385264be2fcf785f6f1959"
-SRCREV_machine ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
-SRCREV_meta ?= "268af5402032d35347f7d949673250b9bcc3a389"
+SRCREV_machine:qemuarm ?= "f50c6da5bec6481c9fd5618176c768d4ff7afcdd"
+SRCREV_machine:qemuarm64 ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
+SRCREV_machine:qemuloongarch64 ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
+SRCREV_machine:qemumips ?= "0175e713ae72f9b4ed10d1702ab9386d294fe96c"
+SRCREV_machine:qemuppc ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
+SRCREV_machine:qemuriscv64 ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
+SRCREV_machine:qemuriscv32 ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
+SRCREV_machine:qemux86 ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
+SRCREV_machine:qemux86-64 ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
+SRCREV_machine:qemumips64 ?= "d41c8b84fcfcb4c2dd8eb856172cdc2b6a1bd342"
+SRCREV_machine ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
+SRCREV_meta ?= "48f7c852bd375b9340c68897ccd87ad89ead5f38"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "22852eaf43ec64b7dc0aa72687b22237b65a88f9"
+SRCREV_machine:class-devupstream ?= "47345b4264bc394a8d16bb16e8e7744965fa3934"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.11"
+LINUX_VERSION ?= "6.6.12"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


