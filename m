Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295F5C41535
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 22:29:12 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.7251.1668810546877469417
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 14:29:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ExqM+m9y;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id v8so4442802qkg.12
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 14:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhP8nEEoSZ59hKqgA1ByxU+Lj8+B6HBVShyl+S+Lfv0=;
        b=ExqM+m9yCMPYuZrbataV+hZoO3Sm5jtWbrmZP3bWzlpakGPahvYU1gsH2mOU3zfqtp
         LrtJDmnkVmFdJcb98pdV+kbESBhI3B2iQSREKF1DMrujIzA/cKe0xVPSYDGeZVoxeFoB
         du7TtYrA5KorwxSJGzQWqSpmjr38IIMxcT+8/OkuNXehWeSUWky/+zncjesC7HJ1PdDN
         m3mEOjucpclpbNqph+8tF6+9KWBIIrVdLBvYsSBGpSM67pf3PcdXZyYSiEpBSJ7FxODO
         jMoPzK+87lcGSJ5KuAqeJ9LrFtFzfRN0PlDZrjViJ1k0YdJWdHw8WGM2ndKNoewpQZYq
         UdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhP8nEEoSZ59hKqgA1ByxU+Lj8+B6HBVShyl+S+Lfv0=;
        b=RjoLfJ6ipQtdP9kESktbiTNKlio3ZJ5yKVFlmBAKj2b3OsNqDrBoTlC0HGeUtP9SLc
         o6RE0fq30k99smOltS1R1f7z6LQYFgcMmDHOeL5sTfvgJ2CX0QQ6pEN47SYAfnaGIA8S
         r/FP/PQsPT/Px84CqiuUOZweVKA5uOjQqeGDVBYm+2Has7T/Ez9kI3FjEdvbGoF4aLI4
         88cjPA4kGvYpbNVoi95Dj+HO/HfbAS5cr97f9yH6ZTPjDeLfgsfidJc0v92uCtdrE1u6
         BCjwV/tcqpE5xp2VayafOzdqa9BcIl/34HP9dOaqX9O2ouLJfwglwrrLXzZDqXu0c+JX
         Zo9g==
X-Gm-Message-State: ANoB5pmKpbz2AD4lWEGEkldncIKWUYVIh035RjmJ+KkAZp/2XkQjxJ3P
	yrP62IhKb6BjkrxnH1emzj4NqgE5a55ViA==
X-Google-Smtp-Source: AA0mqf4EeW+k4sOsERnPJI3eHMaY8+VtFTTId5it4dJGDwt1JzAF01a1Bohx1M70u3cJ4sk7JJlSDQ==
X-Received: by 2002:ae9:e605:0:b0:6fa:2522:9c56 with SMTP id z5-20020ae9e605000000b006fa25229c56mr7842722qkf.22.1668810547037;
        Fri, 18 Nov 2022 14:29:07 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id h9-20020a05620a284900b006f9ddaaf01esm3304068qkp.102.2022.11.18.14.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:29:06 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/15] linux-yocto/5.19: cfg: intel and vesa updates
Date: Fri, 18 Nov 2022 17:28:50 -0500
Message-Id: <01cc7cae53fd1eeb58d2615b20ede18f5f893b5a.1668810409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668810409.git.bruce.ashfield@gmail.com>
References: <cover.1668810409.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 22:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173499

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    399055aee2f vesafb.cfg: rename FB_BOOT_VESA_SUPPORT -> BOOT_VESA_SUPPORT
    fe0fe0945fb media-radio.cfg: switch RADIO_ADAPTERS from y to m
    9724cfa270c bsp/common-pc-64 : add igc driver
    39431755e59 bsp/intel-common: add igc driver for meta-intel bsp machines

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.19.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index f55be51b64..f78ade3e10 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "59a2ffca6673305b3b9e3186294feb5437698d18"
-SRCREV_meta ?= "200c6fddf19c4a54c86dbfbe3d0f64597f5bc0c2"
+SRCREV_meta ?= "399055aee2fe59fbde5f7f9aadcc953bf49222f4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index 41e37dbab1..f34ec707ae 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_meta ?= "200c6fddf19c4a54c86dbfbe3d0f64597f5bc0c2"
+SRCREV_meta ?= "399055aee2fe59fbde5f7f9aadcc953bf49222f4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index 76d9d4b4ad..0447d500d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
 SRCREV_machine:qemux86-64 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
 SRCREV_machine:qemumips64 ?= "4e9603752156d3a0b9fe53309f4bc78d3f4f7df5"
 SRCREV_machine ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_meta ?= "200c6fddf19c4a54c86dbfbe3d0f64597f5bc0c2"
+SRCREV_meta ?= "399055aee2fe59fbde5f7f9aadcc953bf49222f4"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


