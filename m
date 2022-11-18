Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DADC4708A
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 22:29:12 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.7445.1668810543119071741
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 14:29:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X6c+Y4z1;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id n18so4293406qvt.11
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 14:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y32TQgYTOUFoGNuOAVcQUyp8igdtRI8KDy5257ZW/7o=;
        b=X6c+Y4z1AnPJeVnZGaJbtTr/x38tvqaiNleF4K3Rx6rn4dlUafmRGbdSA7JFOu35ov
         zeKbiteXbjogpfMSThTDgyMChJ1uYob/C8wEj0FxPwJG9WMkiF5IHpBVOhDPzBoOIpC1
         BHA7CJ5AMyPIAEp3Yk9JvBmKUl2vYGi3Frbzgb3V8PDQHB2dmBPIx4TAYF4xgZlxEIoR
         EMOo7wck3SDk0kxFPd7aDNh021i0viwhxUsdvfqP8XDfYaXZNVVEIWeqkiYa90T2aMEK
         pS7Ju+uKfEdomnfNOuM2O3qVL1b5JVfuPDD5oquI8LDlXQUozIst25ubvWGoOwlD3PAE
         1UQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y32TQgYTOUFoGNuOAVcQUyp8igdtRI8KDy5257ZW/7o=;
        b=qgUeJUCSGAAP7D+rPKxOf2xT5RjZ95Lvx2NfxOiaI8UPa1A0rGyxNNOAf1Qiyl9wk7
         lD4X+kQr5MSjiNiCw6OInjO9XlhrpwzTN4x00OMsrf8nXuAGfQcmLa3vjxZ0HhfWmGT1
         UkrQT1EA14f1luirrDCadWDpmxi53el6VOVwUtLheCsdXWeoVfX1hWRazwKS6+iBdeA4
         PqEG5UOJFazP0wJoiziBb5I98o1RiWbu1csD8js/sFayyVpGPUsBB5s5b7A5zLXZ7mjH
         SohFFE6KyvqIyIEgOO9dOcbkwSD1sNdZToiKRYwkStXgKba/agr9+SrYFVvBfxAxlgqT
         WocA==
X-Gm-Message-State: ANoB5pneJPNNed6LNWB2INfl4ZqTyfgy/0nr6GNs6fVTsxQxKXMgxefC
	lHPkBUv5vLDOmZoxENOYwqelpySvCojRzw==
X-Google-Smtp-Source: AA0mqf4QPjALKfNMwH16N8xXRWJKwF4Krpl+swMNsv23hS6f7/ZcYUUwU3Dp6I3tSNzR00SBuFfucg==
X-Received: by 2002:ad4:448e:0:b0:4bb:701b:f218 with SMTP id m14-20020ad4448e000000b004bb701bf218mr8654098qvt.81.1668810542048;
        Fri, 18 Nov 2022 14:29:02 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id h9-20020a05620a284900b006f9ddaaf01esm3304068qkp.102.2022.11.18.14.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:29:01 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/15] linux-yocto-dev: bump to v6.0+
Date: Fri, 18 Nov 2022 17:28:45 -0500
Message-Id: <8b8a36ee7a8b2af7c94150821dbf9b3a80febb96.1668810409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668810409.git.bruce.ashfield@gmail.com>
References: <cover.1668810409.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 22:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173495

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Introducing the 6.0+ development kernel branches. These
have been sanity tested on all supported architectures.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index aeb04f59e8..e85d2ab723 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -16,7 +16,7 @@ inherit pkgconfig
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v5.19/standard/base"
+KBRANCH = "v6.0/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.19+"
+LINUX_VERSION ?= "6.0"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1


