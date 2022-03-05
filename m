Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D8CEC43217
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 01:25:27 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web12.1640.1646443526913841086
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:25:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D8UGS/2D;
 spf=pass (domain: gmail.com, ip: 209.85.217.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id e26so10928338vso.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I8UUzFMN0zLNOS08x/6e63e9RVhGZh6qSfvQBGqRJHo=;
        b=D8UGS/2DXhjinX6xj02JeMQB2tUIRavDPtbFVylQtYV+AHg2ctJCCtOtijCD2sDnTe
         OpZiVHe8SVWwooSgRTYA6Xwxz1l3SolI2fdMHH3HWg+tSnOyZM1PWrE9LozxEeKnNfiP
         QYamCsvuOeGUG+bCCMj0bNCb9eGKIPbQfoR4lNrZUJNBbN6yFjFYLnn8EbFXjSPmqDNY
         1IzBNiBVwvIHTdALtqfYC3DYns4/H8NeIczp16hJs4rx1TYRsG5dNFbNi2zGVdTQg4N0
         02T7RZzUlFsjr7GJl4SGTKWD5VdxkLiq+itWSkxeC4/cLmo4SBQ7C4nkZea+gl0EfGwf
         q1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I8UUzFMN0zLNOS08x/6e63e9RVhGZh6qSfvQBGqRJHo=;
        b=0HyPpR1g0RlZv2LM/PTySDqznxV9qeLjg1aVVREnn0BxaoSijQvfXyRWm2Sue9zdU2
         HTWO+fuKOkzNOu3NkogOBFJZafH3YYAZDVkp8YU7ATZ7x29kY3S4BsSdomt3RW4dIj5N
         BPoZTfbv1AKsBi3sS85nKKdxY4fI0fKqeZmQeypM1Vh6G3LJrptCO0ihyNU+A+TOSYtw
         gyEdF4hMzQekVU8nm4Fs1YKZPY49d3cIJ9qLvRlzcfvFlBxQfalmkUF3ZiH//VO0IeFC
         kE7hiEhV4M4rO5epY2vLAM7SVQq66rqjLO3EENyjjM3nDirFZ0aPT8KqA5DKge12W6n3
         Snyw==
X-Gm-Message-State: AOAM5306QDH+ZGkba/fbflRFZYriQ0YryU/u7TvV+M5hxAo6chqGQS8D
	ZKc53WCz5Dy39nK1ac7Y+vg=
X-Google-Smtp-Source: 
 ABdhPJxcTPwmbYOs0xcaE8gpSFYDn1Qs/BdwphagsT8+pmJWT23Z2kwW3OVVKOXrFPnfn/uyIUBwMA==
X-Received: by 2002:a67:cd93:0:b0:31b:e4b3:50fa with SMTP id
 r19-20020a67cd93000000b0031be4b350famr534743vsl.63.1646443525980;
        Fri, 04 Mar 2022 17:25:25 -0800 (PST)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q9-20020ab02649000000b0034a4433fe82sm1053934uao.36.2022.03.04.17.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 17:25:25 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] linux-yocto/5.15: arm defconfig fixes
Date: Fri,  4 Mar 2022 20:25:14 -0500
Message-Id: 
 <e2b6f6359ef1b7ec692b65ce1a251f0a125ec23a.1646443420.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1646443420.git.bruce.ashfield@gmail.com>
References: <cover.1646443420.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Mar 2022 01:25:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162771

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    871f23ad3627 Revert "ARM: defconfig: Enable ax88796c driver for Exynos boards"
    ffad0783dd5b ARM: config: multi v7: Regenerate defconifg
    5c1e1a1ff2d3 ARM: config: multi v7: Add renamed symbols
    badaf96564fe ARM: config: multi v7: Clean up enabled by default options
    34996040fc9b ARM: config: multi v7: Drop unavailable options

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 20 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 4aa1d90f4d..58feb19cb7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3f32ac72547633bb4ba8af0a058ea6dd26700767"
+SRCREV_machine ?= "e62e8c1dfa2fe269a877b99dc9dedac6a9456b99"
 SRCREV_meta ?= "c4e4de6ccb27846e48a848d7ca1f20d9503a6fec"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 5b5946fdc0..30e63bf7f5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "fa8ed5bf61550cfa9e6bb9b046674a2491db5672"
-SRCREV_machine ?= "3cba0e6744d4323f2901af62ed458957d40b8017"
+SRCREV_machine:qemuarm ?= "e6e97d2b62f29bac98815616d89cf48490b03fc3"
+SRCREV_machine ?= "9cb2e893ad4e54c23650583ff55b6f7dd2168ec1"
 SRCREV_meta ?= "c4e4de6ccb27846e48a848d7ca1f20d9503a6fec"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 8b343d6eaa..fa68e9e574 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "2080556f77628b4b045c670321989cb058749acd"
-SRCREV_machine:qemuarm64 ?= "3cba0e6744d4323f2901af62ed458957d40b8017"
-SRCREV_machine:qemumips ?= "841c395c9a56e60c861e0d8346f39a88120fd8a1"
-SRCREV_machine:qemuppc ?= "3cba0e6744d4323f2901af62ed458957d40b8017"
-SRCREV_machine:qemuriscv64 ?= "3cba0e6744d4323f2901af62ed458957d40b8017"
-SRCREV_machine:qemuriscv32 ?= "3cba0e6744d4323f2901af62ed458957d40b8017"
-SRCREV_machine:qemux86 ?= "3cba0e6744d4323f2901af62ed458957d40b8017"
-SRCREV_machine:qemux86-64 ?= "3cba0e6744d4323f2901af62ed458957d40b8017"
-SRCREV_machine:qemumips64 ?= "f23755ed1e4ed384fe05651d51da41dd5ba1a43a"
-SRCREV_machine ?= "3cba0e6744d4323f2901af62ed458957d40b8017"
+SRCREV_machine:qemuarm ?= "681eace513f2eb77ade3954f7ede8e18c53ef3b8"
+SRCREV_machine:qemuarm64 ?= "5544942b9f3aaf9af76d55a8ea015cfcc8003921"
+SRCREV_machine:qemumips ?= "65c9fa3c96cdd8d2341ab6b6042227a928f04483"
+SRCREV_machine:qemuppc ?= "15df6d697a5319289bf2fcac3fa394da83f9aac2"
+SRCREV_machine:qemuriscv64 ?= "871f23ad362717d75aba60e56d511312522ba15c"
+SRCREV_machine:qemuriscv32 ?= "871f23ad362717d75aba60e56d511312522ba15c"
+SRCREV_machine:qemux86 ?= "871f23ad362717d75aba60e56d511312522ba15c"
+SRCREV_machine:qemux86-64 ?= "871f23ad362717d75aba60e56d511312522ba15c"
+SRCREV_machine:qemumips64 ?= "23dd0a182e404e823a7d4e4f3e00c716d7b33109"
+SRCREV_machine ?= "871f23ad362717d75aba60e56d511312522ba15c"
 SRCREV_meta ?= "c4e4de6ccb27846e48a848d7ca1f20d9503a6fec"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.19.1


