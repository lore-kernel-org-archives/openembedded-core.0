Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C732CC00140
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 02:25:04 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.20321.1659320701387948138
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jul 2022 19:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ONT6fxIh;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id r186so8514109pgr.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jul 2022 19:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=fIOltz/qRyFcpXt9EMgQSmS7gvilpSGs4LQ4z3tTedY=;
        b=ONT6fxIhjAXMjoLtubbBUXf2nHLcx6X+GJbgWRhlI2ajLoucy+Wwcc/3a5I6yYThUX
         R0sE9qGYKXG04RGDNuid2mpF9gE7RHjPcoTuUprXdRxIkEzgHRyNJP9vdUEvaJiH0Que
         0Lq3S3X3RSg8LttOE1fKydh45MPeAokjl/DM8jnjoX9I2NVk1yqSoLf2xbefcxzDQTqy
         6LjKlePCaSM+kxZIsSWGmsTC+7GYSD3JY7MRPKy6AD7BkD5/3prUbZf7lK4/YHa3k3Pa
         JxSEznE+kcYlQciORrNzApf/iHEp3L5UT1sywA2yjsFNB3AxGpt0XnBmQujtdBhAJ7pG
         2BAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=fIOltz/qRyFcpXt9EMgQSmS7gvilpSGs4LQ4z3tTedY=;
        b=wMUEmqCODOn2/usaOEOYu1wbqgon0yr4jp93HUcUDvzJDLGqWRvc/TT6rRY+1A2/Al
         MXjpxCPyTyHMZdzOyRwocGJxKn0DWF9fp5ed+CkoQRCduaNVidhuZHFlq8X9xq1VVTT7
         hbduVHH73Fz4PSjOxmV4ynYfBHRjOBhso27DI4JG9rAZe57xRBf3usso+o3IKhgRWm9g
         wnyWZQuoV7X/pnmLORmbFYILWMzrLbhxyV2TtZvpItGL0GgQ4WD6tKRWNYOTcWg1ndEY
         sn0cLv8fzSwMIFJwDIKxs3ikunRrbc10rLyBbfoI0LRSOfAHO1Ha8JVCl6uMAWShn9Ye
         3L4A==
X-Gm-Message-State: AJIora8B4Rui//oKaclj4cfkuymbWH7rpm47MglM+EnnAyQ8jKyM/ILH
	8XBmamm7qPQDKQIiCHTnnrkrvfRUypcHlC8O
X-Google-Smtp-Source: 
 AGRyM1t9M6ILq7NjYN7f19KkRBs4ekqHJlYlmay+9LFnfCA14mU9Oy+nrWGpy2ttopilMKKVCMwUUw==
X-Received: by 2002:aa7:8d03:0:b0:52b:5792:e304 with SMTP id
 j3-20020aa78d03000000b0052b5792e304mr13977715pfe.36.1659320700067;
        Sun, 31 Jul 2022 19:25:00 -0700 (PDT)
Received: from localhost.localdomain ([2406:b400:d1:8792:5264:ddb1:f675:feaa])
        by smtp.googlemail.com with ESMTPSA id
 32-20020a631160000000b0041b34595becsm6328773pgr.50.2022.07.31.19.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 19:24:59 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [kirkstone] binutils: stable 2.38 branch updates
Date: Mon,  1 Aug 2022 07:54:46 +0530
Message-Id: <20220801022446.12464-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 02:25:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168690

Below commits on Binutils-2.38 development branch are updated.
5c0b4ee4060 i386: Don't allow GOTOFF relocation against IFUNC symbol for PIC
19892fedb7b x86: Properly check invalid relocation against protected symbol
b8a2baa80b1 libctf: tests: prune warnings from compiler output
7f9a495a167 libctf: fix linking together multiple objects derived from the same source
97dd8079feb PowerPC64: fix assertion in ppc_build_one_stub with -Os code

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 742ca86379..eed252976a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "eed56ee299b9ef8754bb4e53f2e9cf2a7c28c04d"
+SRCREV ?= "5c0b4ee406035917d0e50aa138194fab57ae6bf8"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.25.1


