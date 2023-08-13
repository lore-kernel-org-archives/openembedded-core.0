Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10882C3DA40
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:19:29 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.93787.1691961562532650124
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=2Glfbutl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-686be28e1a8so2603725b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961561; x=1692566361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2eNvUu7ZRwcx7rhIcgOyI5ek/PdTjuljXGkzHkrrLk=;
        b=2GlfbutlLrNabOcV6JrG7oVPUsvfx5ZNLxfp8X2d34UE+a2vD2zt/WcUnwpYe6zMSu
         paSzxggz8gLtrkYSY/ju+eqx/wBrpmtaksMYrfVX4qK6Gxa4AFFRZGpUzpCLrxs/pfdA
         wAisaSWvu/GdBDRA2VmhPdklSDic/mCeRVw9i0QumGK/HP2YJho7ISqo7BYBrG7so1dp
         oVSYn4xELE5FbGRTO0lMqvZUn+L1OzvsHqPBsYQh1Hw8I7/yarXEPw0XoiPaM3HaSaiV
         8ki40j7lQj8kgbkhzDPzIwoDwuBy/OQsPIVGlDL6QdN3JVQwno81pHyRCgviTnoCxaW1
         VUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961561; x=1692566361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2eNvUu7ZRwcx7rhIcgOyI5ek/PdTjuljXGkzHkrrLk=;
        b=be62V088PcSsSMeJacIs+CiVkfo0qM9hjQSnts3Fn6Nvxe2jItWgwpBdhekQ9NPzHX
         HEbp2ToFEX8sBF/cGeAYn9HYFNjXqlCV/f0GFW6iVtJlMZYpjoTlpzcZ9OkTi1ODtAV3
         Q9Ehx8M7vDWs412kLRwzNF5xdft4jf3jnji0Glgdf0FwSqXxIg2htf2pWZ6iS9pCLN4N
         2TGeLfntBtoiFC0pELXWURnBq1LwvGoEebtXR4QvEl58F9WKDb6LR67jSKXOgbH8Xqxr
         eSlyrIAf52gSWY/l0iKCdbANWuIBvC1WGgJKNYEDbVR505XuMEUaqR6xwDmUgb4QZGFN
         nIDg==
X-Gm-Message-State: AOJu0Yzn2PTHWgW+3OaVjdYfZ4UlWzaF1fJOUbJYhJ9FT6bj5rrHqv/g
	QZ2xpF94UBt5YdJkKFhRVrc+aPePPrjr/PvZQ+JRhA==
X-Google-Smtp-Source: AGHT+IEXBphudV+4VU4cTgExQv2rR5jJj3rW3WY379lUkHDoXvyYpHDrfv1PX9rLmrR9/YmjqFeBWQ==
X-Received: by 2002:a17:90a:34ca:b0:268:38f5:86ac with SMTP id m10-20020a17090a34ca00b0026838f586acmr5289767pjf.24.1691961561619;
        Sun, 13 Aug 2023 14:19:21 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.19.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:19:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/22] linux-yocto/5.4: update to v5.4.250
Date: Sun, 13 Aug 2023 11:18:23 -1000
Message-Id: <55f3f04896f1c301bbc7e18360ac05ff583b7a1d.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691961051.git.steve@sakoman.com>
References: <cover.1691961051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185908

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    27745d94abe1 Linux 5.4.250
    00363ef30797 x86/cpu/amd: Add a Zenbleed fix
    92b292bed627 x86/cpu/amd: Move the errata checking functionality up
    4d4112e2845c x86/microcode/AMD: Load late on both threads too

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


