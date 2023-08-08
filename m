Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82460C41513
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 03:55:57 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.54171.1691466950909973977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 20:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=s2K7Ny+v;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-76ca8921c6cso236945885a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 20:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691466950; x=1692071750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8WCLV0WPAyeYCfSbTZOQlmHiJCK3LPtMW3VLZxXg+8=;
        b=s2K7Ny+vqPgwxD2gInaOhA7R96EwZTv3bHYKDoE2hXCPndwane3Hy8nVa5dd9U9c0X
         R0kSPm6AF/dPl4zuOjWJ1E5l/0cdhiI7dTAjg2ou4JwYEGZ+hQC5i8x8EPTAMK7zwxIc
         hMoLTXqvCaFTDYXffMvL7FMucIFU+iAUCl6czn3C1wGKpMf3CfBjyLWWLNhAnwbjcK6T
         epg+6OcU2VXyFBhctJXAodRvsCD2hLA91Wb3+fyJ+EuurOJO6+64NUwdvatsBoCR4mPF
         d+K4APSO24sx/VIVNNksE1581yvJvUvh/Qkm9ABo4OBEUO/9bEWmZzaxTnsSg4CnyQdB
         T/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691466950; x=1692071750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8WCLV0WPAyeYCfSbTZOQlmHiJCK3LPtMW3VLZxXg+8=;
        b=HdorEQuOJVykaB30ieqBaYox+m0ZPAjPUwMQ3dXBYJf+2bbcNL8xTljuXPJPoQ8L3l
         U3JJYReywvJ/LR9FYNSsSN+X0xALTqeGptZTdPs8fyhhIXaD59/YdGhwSorLXv1R5oLD
         tnaljAimkZTV5yQFYmAoXQqjOWRaMGPcrvgKOjcLSFheBYfjudXI+yhxYWywro6TEH2d
         r2Kmg/cpZVghrxBWbMqen1V4kx4BORxn2fHTnR+Zy04lc6pGPhsaF+96xKBOPaAzvnOa
         qBa3AFDczRM39JE06AN/vKRhw7NXSqZ57wjPglPdWvMPXyUQ4aA9QvTZoenEiF0TXzg4
         s+MA==
X-Gm-Message-State: AOJu0YwixqNY+V23ZpwjFLTmsG09rF1nmiirweWHBzQsUDrQdCGvs7f2
	j+zWS4hsAp98PqXejqLGT0I=
X-Google-Smtp-Source: AGHT+IEA3bfOta3O27FWTsjm63Q9PRHZ1MnlLjSwA0ge+JleH7sJ6sBTuJ3oCbkKGTGStFT7aHqb0A==
X-Received: by 2002:a05:620a:4496:b0:76c:a402:d7a8 with SMTP id x22-20020a05620a449600b0076ca402d7a8mr11550078qkp.25.1691466949804;
        Mon, 07 Aug 2023 20:55:49 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id s2-20020a0cb302000000b0063d0b792469sm3423847qve.136.2023.08.07.20.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 20:55:49 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 2/3] linux-yocto/5.4: update to v5.4.250
Date: Mon,  7 Aug 2023 23:55:45 -0400
Message-Id: <20230808035546.3230840-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808035546.3230840-1-bruce.ashfield@gmail.com>
References: <20230808035546.3230840-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 03:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185639

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    27745d94abe1 Linux 5.4.250
    00363ef30797 x86/cpu/amd: Add a Zenbleed fix
    92b292bed627 x86/cpu/amd: Move the errata checking functionality up
    4d4112e2845c x86/microcode/AMD: Load late on both threads too

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 8e2ac6f853..f31b920ca7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7c1c3e523391507938420fb93bfafbbf1788e6b1"
-SRCREV_meta ?= "cc142627e073a6ef70b2646df36a8119cda3c736"
+SRCREV_machine ?= "0057180769503ac049b495a794f864053965c7ea"
+SRCREV_meta ?= "863d597749c6214d272d704c8c04ead3373142f4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.249"
+LINUX_VERSION ?= "5.4.250"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 710fc63d47..6f94fe3bd6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.249"
+LINUX_VERSION ?= "5.4.250"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "532857ef9f2014098015fa9ba30501639f8840ee"
-SRCREV_machine ?= "de0d74f8949990ebd464742fbb4b4e5bfaace7b3"
-SRCREV_meta ?= "cc142627e073a6ef70b2646df36a8119cda3c736"
+SRCREV_machine_qemuarm ?= "f0ae300728e87e4b1e51305737b9f4dda383e7bf"
+SRCREV_machine ?= "de7c8d928de44e1c130760bf11d741d25e1c0213"
+SRCREV_meta ?= "863d597749c6214d272d704c8c04ead3373142f4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 3e4c1ca08b..9589ca280a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "05e04a6628f7da8169ee7c46288bdcf5694de623"
-SRCREV_machine_qemuarm64 ?= "23ac11eda9c661a3d01fc0142a6e23aad03f2b08"
-SRCREV_machine_qemumips ?= "08adf55a99423b9a86b9cf0b11dcf1f6bf0a280d"
-SRCREV_machine_qemuppc ?= "5b29dfbf9af0afb45cc588154a9ac6c7f68f4d81"
-SRCREV_machine_qemuriscv64 ?= "19998b76926cac29365e10bc1abc976ff2481cb5"
-SRCREV_machine_qemux86 ?= "19998b76926cac29365e10bc1abc976ff2481cb5"
-SRCREV_machine_qemux86-64 ?= "19998b76926cac29365e10bc1abc976ff2481cb5"
-SRCREV_machine_qemumips64 ?= "a70b5911861ec339487b3fd3edc49983d3e46669"
-SRCREV_machine ?= "19998b76926cac29365e10bc1abc976ff2481cb5"
-SRCREV_meta ?= "cc142627e073a6ef70b2646df36a8119cda3c736"
+SRCREV_machine_qemuarm ?= "fb7218e03f4d75e77f3bc50217855e043e32b06a"
+SRCREV_machine_qemuarm64 ?= "9561485ac053a0ea76ee95fa8dead1da30a41a8a"
+SRCREV_machine_qemumips ?= "7bd91d1af3b4a24e1f34e3a9583d02d7f08aaf53"
+SRCREV_machine_qemuppc ?= "f4145ff9d93b0e0b0393d16c1889bcf3c6e13e15"
+SRCREV_machine_qemuriscv64 ?= "c862ec7816d3f8b34c6e2a9ba9d2dae79eda31d1"
+SRCREV_machine_qemux86 ?= "c862ec7816d3f8b34c6e2a9ba9d2dae79eda31d1"
+SRCREV_machine_qemux86-64 ?= "c862ec7816d3f8b34c6e2a9ba9d2dae79eda31d1"
+SRCREV_machine_qemumips64 ?= "72944e165489f0dc5121461bfc74fb2bfaa3d7d7"
+SRCREV_machine ?= "c862ec7816d3f8b34c6e2a9ba9d2dae79eda31d1"
+SRCREV_meta ?= "863d597749c6214d272d704c8c04ead3373142f4"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.249"
+LINUX_VERSION ?= "5.4.250"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


