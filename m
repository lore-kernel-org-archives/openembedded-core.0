Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BC7C41513
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:24:43 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.138678.1692116682074458027
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=X7YdDC2t;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bdb7b0c8afso23533055ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692116681; x=1692721481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1L7cBZo8sqwY3vSDtgw0ySDVDZj+R6Zg+u9rjd66SU=;
        b=X7YdDC2tKN/AgHjLBJCdr0x28k0cuStsJF0F7VWlE2ZXiKmNlhMIy84Ukf4Do5Yba8
         Fzey8n1vKDIw0OkjDnLmacY61QFCVNF7hxBnG9k9q2z11bOZ1HIqSRb6z9CPFgt+Akc9
         7gGClIn305gvqzVYQaYMAfu9uGu+dBrkkwy2iaJQ/CTe3NsDePKNVfl1HEIDNBP4mNVq
         joYMJ1HfYGHZDjkRWJo/v/DTrU3bo5YTS/rauEfL3pJquqLb3EcS5tL2aLas1/d113c/
         D+eYrZNeEXxwkVjWT3Ph121NO+Fy6mp67jHicgdwr8TTn0tq9ADYToxRYV/Ft684Dosa
         aiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692116681; x=1692721481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1L7cBZo8sqwY3vSDtgw0ySDVDZj+R6Zg+u9rjd66SU=;
        b=Q+NCYUVzbUZKLb9tlkGdsyVEL9n0iSyUP0ji4Nux2R4eV1w2TFyDDvYGD1d8ZE0xO1
         Y3mKZ/l6IPRKDrf4k8MlbnCsizng1fkaxOHlwLcCQPexMzirKPNaS4xv9K5x5/M6MuZL
         V+NHZsUOnb3DxYZuIUDWSlMtyRFntc8UiERiaVI4Pkl4ZGqfKJLh0BNeWBK+lv8Sb3JV
         AT6dBZmPxBPcoUD0mavqv3qhZ7jUo8DBQ6H63j7j9fVdLVisE7HUjxmi8VoFgoQVMs4J
         CNrSdu9ECvWPSxFXuIOA7ddpAORaK7UcnK/3W1mEOtCT+rE+u+FF2McXBgkaR0R3Bn9+
         z0+Q==
X-Gm-Message-State: AOJu0YxZinBBR+sW80weQN39Ya4JxQyk3T+zkQeXgSF/wF2A0i5Nqudh
	M9lsJTERihEsxU+EkwFIBuNg0aNgN/0+60uP7nE=
X-Google-Smtp-Source: AGHT+IHQkDx6nP7ABaCk0a9Tt22aPgRMlOGVbBYMF5QoLiA8Vur6rZQuCPmgpGBvH+2PJiq57hWJwg==
X-Received: by 2002:a17:902:db05:b0:1bb:c971:ef92 with SMTP id m5-20020a170902db0500b001bbc971ef92mr12159825plx.59.1692116681146;
        Tue, 15 Aug 2023 09:24:41 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm11414623plb.237.2023.08.15.09.24.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 09:24:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/18] binutils: stable 2.40 branch updates
Date: Tue, 15 Aug 2023 06:24:13 -1000
Message-Id: <74e6452a9fbeb928a635869160bc17cfeab867f0.1692116535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692116535.git.steve@sakoman.com>
References: <cover.1692116535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 16:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186083

From: sanjana <sanjanasanju1608@gmail.com>

Below commits on binutils-2.40 stable branch are updated.

391fd4d9ee5 PR30697, ppc32 mix of local-dynamic and global-dynamic TLS
7ad52a2357f [GOLD] powerpc DT_RELACOUNT
03f49a0619c PR30536, ppc64el gold linker produces unusable clang-16 binary

Signed-off-by: sanjana <sanjanasanju1608@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.40.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc b/meta/recipes-devtools/binutils/binutils-2.40.inc
index fb99d93b26..33e7f4198d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.40.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.40.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_40-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "7343182dd163d14b7e17c255515940dff67f2bbd"
+SRCREV ?= "391fd4d9ee5d2b78244cbcd57fc405738359b70b"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.34.1


