Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F77DC00528
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 03:36:07 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.53946.1691465762013923420
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 20:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YvuQXNol;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-63d170a649eso33568856d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 20:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691465761; x=1692070561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXY4s3MHwS1zjssWT5kXLB8eX/tINe+T4axKEGMPyz4=;
        b=YvuQXNoledmqHphKsGF7TemnOk7QRZrjoVP9ekbUYC5coAfc1iFrBrRMIwSdrPxVeX
         4gbsAJ94IgSMXZdPh4GTX6wbjuAb4kdsu5ELHuUoMjPa2xbHTb/wS8+SE5U9N70+lZ44
         dOpjeSjegr1hfgBpf27fW9z6PsOLLOZ5Hkiy/kGZ/+WofxZn+UUD9MRw3exZNhGegrLt
         VnrWBQlV2Ii6rhCxfui6Yh3Ksw8ODuR7vJAIBsAVPlSCiAOX2H+5Ji0NlnPxJH8oQeFM
         oIDe6KGkbFfuPvcGskguXkM43bMZRXT4pESviZwAiG4ywd5SeyuDx6Q/hXfAa06aoIcf
         x6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691465761; x=1692070561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sXY4s3MHwS1zjssWT5kXLB8eX/tINe+T4axKEGMPyz4=;
        b=aPElYD1aFvXq0Lc90x+hq8/VZfDY1FnJLuPoq0uixOM9HlYb5gh1FoNVWWbLKXw9HC
         CYe4nX1Cc9M4sSBkLfktURY+dkXAH0z+bECFp+bSy4an1h9HK+vLxp22N1pRmULjauV6
         ZQ04OsPImC+G12CfvCIIMFYdIoK/TjLhrSLgKz3BKY4gCUBoRvA3SYUBHFSJF5FoThO4
         tLC/sdQ0URoAJJAGPoYi5WEZ0GNnfKmMeeXLop4g5r3T6rZhCloV0AXgvOxqwV/qP2I5
         a+OkXIduatyICrKe35RDVYlyvjFtOZ4+36ESROMpvKfpV4ewtT4zShTTAXfoJeUaUuQW
         KreA==
X-Gm-Message-State: AOJu0YzRN+FIfcH0SaY9mugVql2MrIfBbX7Rg3uepHwfVQzgZnKIUutR
	NqwNLqns+WCjPViqICD6sC4=
X-Google-Smtp-Source: AGHT+IEAd5UvNx+yyquXMZZAu1urf4wAFbMJoEqNyQcz0970948E732AoJI+gKFZaSoz0C4lnGO8Qw==
X-Received: by 2002:a05:6214:564c:b0:63c:f2bd:52e3 with SMTP id mh12-20020a056214564c00b0063cf2bd52e3mr10716777qvb.33.1691465761047;
        Mon, 07 Aug 2023 20:36:01 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g16-20020ae9e110000000b0076cb0ed2d7asm3033840qkm.24.2023.08.07.20.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 20:36:00 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto-dev: bump to v6.5+
Date: Mon,  7 Aug 2023 23:35:51 -0400
Message-Id: <576a2117a6219b19360f697a180aa2a2cc2284da.1691465503.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691465503.git.bruce.ashfield@gmail.com>
References: <cover.1691465503.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 03:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185635

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating the -dev kernel to track the latest k.org development
release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 37904ac4e4..e695e2d83e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.4/standard/base"
+KBRANCH = "v6.5/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.4"
+LINUX_VERSION ?= "6.5"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


