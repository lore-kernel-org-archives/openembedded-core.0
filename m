Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9A4C43219
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 00:38:40 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.1255.1668559113301649682
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 16:38:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CvGEVDQv;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id s20so10715975qkg.5
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 16:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y32TQgYTOUFoGNuOAVcQUyp8igdtRI8KDy5257ZW/7o=;
        b=CvGEVDQvsHJMdTkpZgwEs+ubPJCKf186A5Kc+NKnxldG0uZsN1354Shz8kLsUgStNy
         Sp/E6LZit0as8n/VK4x1B+alE4m6X9nlpNXvrq2kqXTwW5thgc4KYATE4fQ/eImEGY73
         1igefz2hj5EfBY1GJ8sfy9r9aciWaP71iH96dFv2nnhB2DfhhU6EV97p1jvFVvIS4tTJ
         xEyUxl5zjnJmSBowtCoEQuGTLGc1STKwnPpqRpQvSf9oB3gDoCtuR7PEWEbeSQKi42Jq
         +01/H9fPYazqKMK00KnhZK66oQKsRVf7Q5lSn9578hxozIjq8uAakfB3+BGlEVeXpfz9
         6CGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y32TQgYTOUFoGNuOAVcQUyp8igdtRI8KDy5257ZW/7o=;
        b=KC0vPUYIH5XZTLcGdqe765cnWu9UgozeRFz59nnHsD8geKbXcHaysv/jBBG2vHngAq
         S64AFj34NVCnkqzfkf2A6P8KGQHu5Y8ELCeFUZg1iuVWkuMc1h7O9LtQwJhjaT97hLuM
         QdHP4uttB1A0LDUQMLa6XxHvphEjk26KEUZNJU8clNSSnTbHLGL4H6roYRwjvclVeUnc
         qQeibFMUIN+OAk4GP11VN6X2lh3iq10iOPuluLVzsZgiBf2/2tlq2LeD/rFTxBqb7Ib4
         k4MvafSQbBpdsEcR1sGfq5r8ByKMEtnJRxwXb9YbfQ75rEHok0X5wwg+xFyEK4MExDuo
         An8g==
X-Gm-Message-State: ANoB5plbZbcWWWY1cnnB6SDy4eaiIqVJ09/Anuj0oAlAQ7Isv0hlxGkn
	8g+j5JJZtH+03kTSD4V7QzSIydaL6VEeZw==
X-Google-Smtp-Source: AA0mqf5rx/MZRLWGYtRsYWS8g2Pd8QzTS250oasQpz17hnGz5Q5sbj3ueaFOuZoax+2e3xNB6vmxqQ==
X-Received: by 2002:ae9:f70a:0:b0:6ee:830c:488a with SMTP id s10-20020ae9f70a000000b006ee830c488amr17241225qkg.596.1668559112258;
        Tue, 15 Nov 2022 16:38:32 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id z17-20020ac86b91000000b0038d9555b580sm7926243qts.44.2022.11.15.16.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 16:38:31 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] linux-yocto-dev: bump to v6.0+
Date: Tue, 15 Nov 2022 19:38:19 -0500
Message-Id: <8b8a36ee7a8b2af7c94150821dbf9b3a80febb96.1668558954.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668558954.git.bruce.ashfield@gmail.com>
References: <cover.1668558954.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 00:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173364

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


