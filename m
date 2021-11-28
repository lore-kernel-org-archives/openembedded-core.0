Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88E7C433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:21 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.53169.1638136760748112654
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1znnln9M;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id y7so10524162plp.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0tu83M2QycyDbCtfmXA1trZqAgmV0RmoXzQf+yka3DM=;
        b=1znnln9MIX2TZhGc/R2KTohWVu9sisjICuNvC7QN1o2p9Kabbnu9q4yL1/y5i2+ecf
         MK3PbecPvBPhhvo8raGvi2JU9C8+A9UwJjojPH/34pPJbEI2ebDpX2e6U22tXuLI8Cc3
         ItSnsPuGchds5JcD4S2MmnPx7HemUyOh4BbqbsyTi1k4fAO3SEFbRh8kdHbCn6/0ReD6
         86YGUHENrcB7GM6occHYNXYGNExWPpJkUZFtJs6NBIywZwWbwds1SjxRfSnWS411DP04
         kBiUCMPTr7CDiVy53TRJN8rE6/tSuqXaDJ5Zz0PToavWuo/TNOAK8vUnDsKYlrQ92V36
         Rv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0tu83M2QycyDbCtfmXA1trZqAgmV0RmoXzQf+yka3DM=;
        b=5/gmfBygNwPNTWLGCOXPc5Vs2vD/hZHDAdjQt/xOVcnX5U0tWBkeCJM737KQw5i4bR
         KUHMU/m1HeXgl+qeOPVTdy7L9/4bLABQSZnk4hYcveAvwJxMrIiFwyyMoFrjyu0Ke8v9
         QhdNsYseq6Wc0IiW1tUdkLL1XvqCjA4twEDmx2UH5PhxCbEoRhEMTm4JLJj3T3NBvC9u
         FhgUBYIbbixR1YQIIhRDi3oPkMbJIr+admL7ObKojPCpYy1vksevcp+2vKTLmrXOrDo3
         cQIadeBJstDpcvV15CEvSLn44t7t3VRt1Ti+e0bNNyFB2ZPI/d1d3BgRCXrFnow2/Yoo
         hE1A==
X-Gm-Message-State: AOAM531gwEHaOywgSFclv9TLrNMmrWvFC00dbcXzsLS+jg020fzTFYEI
	Zhr7tFW+nQ4CRIJO8nrBcpHExmHMbX+2OywiwIc=
X-Google-Smtp-Source: 
 ABdhPJwrTTBxQk82W0MYsoiXON6F7p0LJNOsBDGrcg8bmxP0mLRvwl5rYict4ZL88HD3VdIfCxuIYA==
X-Received: by 2002:a17:902:ec90:b0:142:269:4691 with SMTP id
 x16-20020a170902ec9000b0014202694691mr55337161plg.48.1638136759609;
        Sun, 28 Nov 2021 13:59:19 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/42] lrzsz: patch is not upstreamable
Date: Sun, 28 Nov 2021 11:57:36 -1000
Message-Id: 
 <e57a3473ba898123dcc0881da06bc8026fbc4167.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158906

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fed850280c376c0668c238980d34f75e1db6d908)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Fix-cross-compilation-using-autoconf-detected-AR.patch | 2 +-
 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch
index 47c7ec4170..c8f0e2c4fe 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Fix cross compilation using autoconf detected AR
 currently its using 'ar' program from build host, which is not expected,
 we need to respect AR passed in environment
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [upstream hasn't been active since 1998]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch
index 33af38b4a8..ebd4a88081 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools-update.patch
@@ -1,6 +1,6 @@
 Update autotools infrastructure (including gettext) to modern versions.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [upstream hasn't been active since 1998]
 Signed-off-by: Phil Blundell <pb@pbcl.net>
 
 diff -uprN clean/lrzsz-0.12.20/configure.in lrzsz-0.12.20/configure.in
-- 
2.25.1


