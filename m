Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA19C7EE2D
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 18:49:18 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.2517.1685558949054239508
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 11:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bXR70yuk;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6260f03b76dso698006d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 11:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685558948; x=1688150948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27JEFalNVqvjVPFsSwxu+tkNhhH/rynsy7tCh+ahNgc=;
        b=bXR70yuk2eIaAiSOpQBGwCCwybP/M7MLg3RISvFfc2E42pdCh/0GEJ0PEaqr6pnE3J
         YncdzqLTAk7vXkJY4s5Zzjia6uCFJVIWHFMpFhiqZifGhUzQBZKJTiibkQkM6SaeA0pX
         HSSnVNouFPImwvPd5+2ESaDMgtAUpqH8mC7EdzhYEiNjMBhAVF7sMOBUPzGJKw/e7OO8
         NIoQYkn8JpPGUxz8cGlYyvGqJjJ+/2ED7md149gqfhTSFt+QY5V3QYJFvFbujNy4ffwv
         24+XiDe60rfxiHqqhJbQ7iF4Aku3nPWSb7aG3sqFBFhbRgvaxuwdK8XxFwQCChZWP5Yu
         UX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685558948; x=1688150948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27JEFalNVqvjVPFsSwxu+tkNhhH/rynsy7tCh+ahNgc=;
        b=PhPwdWQtIQZ6bvISrF6NYtwXxlLgX4K5s4cmARXThEsBq3u7cjQRlALaHbrVrApB7u
         rAE4VEWqNBvvSD6oAq4CYoHUbK8s6puL9gCqpfytmD4sefOcXRSVj1wHZl9nzvK9JuTX
         hhPWx2YurW0js7SKOOhBtHeB8k6jCnLcs370yD0VOu2J3hA4xLY3YbbSvEqmQqgQAA15
         7T3t/PzX8um5QwIbjjw6J13M5jfy23NQFkJBvIViAKyqlF6T+B7ncXqIrsDi42ixiB9M
         VJR5XpM270+TQFiOs4wHJHhcEgAJ6ngCEW921qCKhcPDgukDKe6FwfbxSJH1jfh70YSi
         /yCQ==
X-Gm-Message-State: AC+VfDxIIBRshuE0on3IweFpOxXLStY8BxTrJyzbZsWZDkbM/DR+RNQd
	815RvGgcHmcyXeez3xVVJn3PxNqysZRqLQ==
X-Google-Smtp-Source: ACHHUZ7VYu/PAJBNrvPMHSFbcG8bVcOG3XphnD0L7s2JWHQ97S0y+D2nudpa6tbUZD7tr2BD46NDBw==
X-Received: by 2002:a05:6214:21a9:b0:626:3a4d:b0ce with SMTP id t9-20020a05621421a900b006263a4db0cemr6664347qvc.49.1685558948077;
        Wed, 31 May 2023 11:49:08 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id e16-20020a0cf750000000b006257e64474asm3926645qvo.113.2023.05.31.11.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 11:49:07 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] linux-yocto-dev: bump to v6.4+
Date: Wed, 31 May 2023 14:48:56 -0400
Message-Id: <9ef6cb545fc5eb9214f8e338675c62b10922702a.1685558432.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685558432.git.bruce.ashfield@gmail.com>
References: <cover.1685558432.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 18:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182027

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 3a1595521e..37904ac4e4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.3/standard/base"
+KBRANCH = "v6.4/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.3"
+LINUX_VERSION ?= "6.4"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


