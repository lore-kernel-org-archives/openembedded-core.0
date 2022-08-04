Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A56C19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 14:07:55 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.5184.1659622070690521529
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=fHOy/WyC;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 p14-20020a17090a74ce00b001f4d04492faso5734384pjl.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7rWFwBOeF+6CF/NW4OAWiOA1o5YAcgFSI/xX2oh881Y=;
        b=fHOy/WyCXlEtCRja+sLF/YVCMhVW6S/KgdtdVs/kMnyB7EYAfHjljdSKg8hF1yyz7F
         5CDU60sBENlUyoSj60O0BLx1SxehYZ5jyhWitzFfLojM0W+t9GWlJZP+G6G/+e7yX1bT
         7Z4ePSFt2A3qqsBWbBKUoeitWkhI2lVJLK88jMaVLtQ2xasOgdvVIKPHGoz8kAxAEhiO
         6JwcWLz/3smORws99eaob4vkxvdfos3qBd6EfSSXUD/++z0eW5Ef86R9WG9JsJ6WlMqh
         kSQ51ed3kQ72HYj7fI0QEz57KjzjShSb2VHWCyQsHHtQgKNlHZxz8i7cedlaPZQuJ66X
         fieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7rWFwBOeF+6CF/NW4OAWiOA1o5YAcgFSI/xX2oh881Y=;
        b=uxo55zOTfNFT22EY+9/100Evk2piSOQQe9nxu8NI/67pZANPuQsGyci+gSunHQtMs3
         VAkZofowmNy4idj1Lnsp9U+dCYh9H6fY4wHVFdpKMP1ER7Lg551p2VbnjQHI5t2fkzVQ
         dIYe/S8hiC5WvPrJZFriBgGiQGNOqeINGZY+LneZoM+v7iv9yrYKiZCMpDmRcu+4V6w2
         +d/AW+N/TPMiULi5JMI2ts0OX7c56zPADHknK8CX5ShYGuAspJOoRpUv1qxMdztIcmIB
         /EfTpiAiACza/DVFKNMf7QjanTtKyUKlDrYXQ0Wc8leMOgtGcN2uCYCXTyWsy0lvWHNB
         qbiQ==
X-Gm-Message-State: ACgBeo2koGwmEg9HLhhBy3qC5tzozkHAWk4qDTXwD5ds197UUyOemr6H
	hoxRO9+fOuGnSJ0a6k6kD5JKen2d50Jc/87i
X-Google-Smtp-Source: 
 AA6agR7fiWwDGrs3QZKaKLEgg1kw1mUZMnci9TgDaflxcuJv3fR7ACaoeHL/kjUPDIqxVKX+g4YBsg==
X-Received: by 2002:a17:902:9005:b0:16d:1ffd:cf56 with SMTP id
 a5-20020a170902900500b0016d1ffdcf56mr2086676plp.119.1659622069476;
        Thu, 04 Aug 2022 07:07:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 196-20020a6215cd000000b0052d5e93fcb7sm970261pfv.191.2022.08.04.07.07.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 07:07:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/7] binutils: stable 2.38 branch updates
Date: Thu,  4 Aug 2022 04:06:04 -1000
Message-Id: 
 <4eb53b33bc46a8131653354bd077229ee7ee42ed.1659621460.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659621460.git.steve@sakoman.com>
References: <cover.1659621460.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 14:07:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168850

From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>

Below commits on Binutils-2.38 development branch are updated.
5c0b4ee4060 i386: Don't allow GOTOFF relocation against IFUNC symbol for PIC
19892fedb7b x86: Properly check invalid relocation against protected symbol
b8a2baa80b1 libctf: tests: prune warnings from compiler output
7f9a495a167 libctf: fix linking together multiple objects derived from the same source
97dd8079feb PowerPC64: fix assertion in ppc_build_one_stub with -Os code

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


