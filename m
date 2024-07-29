Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACD6C49EA1
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:47 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.55964.1722258821804078894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VBYKLLJg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2cb63ceff6dso1985432a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258821; x=1722863621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gBmYd+EGNgqOcdmyLSvljzSWztKBzsoobxcyNxwbf4=;
        b=VBYKLLJg6nD/yfj8aS2AW+U018yNlkm4j7x2blHEA41IYI0P+2t4lj0Vd896ezFllf
         Hm+BbfjKcLiQg0tzhz2HUUuWTR1zIGxZkUYUPbKxSjInHvQGCiyvuYmWxUzH1aByBfvH
         ljwWTHAV1cyV1KnxKr74SNcf3d6Cr5fwDPDRvqRMqEOPrTwoKgHB/1AtVPA22GRTViBs
         dwJz6NotXfqmv6XjSlhuk8oJIf/Fp8q3gmfBNgWen7zcJIeFy7uyCES2JnfLPkm9Yt82
         zDajwtdnQ8GCAL8QRbyE7OLcatKo1cQL8uJGcS1QYRr8zM/9lu9tpCudeiHaUodjCnEz
         JsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258821; x=1722863621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+gBmYd+EGNgqOcdmyLSvljzSWztKBzsoobxcyNxwbf4=;
        b=qsGjAo+3ddJMA+GupAkH5lOY81oIab8zCgfnieBDrPsbdNs8X3TeseObr6uPgzQHeW
         2ZVDZtKMdyJPtXfBV4KjIuu/MRuQ3EA52VKaEE3ysgZp3SKEBGDUpjU7AeyJgXSfaraa
         mmvkESjjCY/iQgfMCYZtKMm+c4gZ9buOFsQays6NBG+ipAI6YRq+JilUbwk0NuQZBBM/
         C65havyyg+JWv7XL6ddxa7dYcFKj660g5BIUEo3P9Gx3vd5/+K57d+8C6JHrIcqZQT+0
         HW7YyQEgDy4nqtBlICxSIi2/3pQQS/umAiZcIGG5hTFvK1DFQklF3avVByVM0Exop1ac
         k9qw==
X-Gm-Message-State: AOJu0Yzpn2bM6JW1Wb6MNfxE2XUuu7ObtrVZoG+eK2eMC/ejCSlrf9QW
	BqqC0BoOf4javYlM5nP2rG70+yoDnj/CB5huKFMlIG53nEIslM1lElTVJf69sCqNGqyiDnmzI8S
	qS0SofQ==
X-Google-Smtp-Source: AGHT+IFhCerS+fP14byinsoIgAABc7Zh4cPh5Q6Bh84JCyKus7dH2udiz51ondGLhBxtFempb7vCWA==
X-Received: by 2002:a17:90a:c17:b0:2cf:c2da:771d with SMTP id 98e67ed59e1d1-2cfc2da7f13mr701891a91.25.1722258821061;
        Mon, 29 Jul 2024 06:13:41 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 32/37] libacpi: mark patches as inactive-upstream
Date: Mon, 29 Jul 2024 06:12:42 -0700
Message-Id: <c7c18d83029ed9b928ae0c7c78d2ef78813ca8bd.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202646

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 722ac78f151fb6c433379ff50394b34ec06ca816)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../files/0001-libacpi-Fix-build-witth-fno-commom.patch        | 2 +-
 meta/recipes-bsp/libacpi/files/ldflags.patch                   | 3 +--
 meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch       | 2 +-
 meta/recipes-bsp/libacpi/files/makefile-fix.patch              | 2 +-
 .../libacpi/files/use_correct_strip_in_cross_environment.patch | 2 +-
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-bsp/libacpi/files/0001-libacpi-Fix-build-witth-fno-commom.patch b/meta/recipes-bsp/libacpi/files/0001-libacpi-Fix-build-witth-fno-commom.patch
index 32808fb92a..e8ff78082c 100644
--- a/meta/recipes-bsp/libacpi/files/0001-libacpi-Fix-build-witth-fno-commom.patch
+++ b/meta/recipes-bsp/libacpi/files/0001-libacpi-Fix-build-witth-fno-commom.patch
@@ -3,7 +3,7 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 5 Aug 2020 12:06:01 -0700
 Subject: [PATCH] libacpi: Fix build witth -fno-commom
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [last release before 2008, no vcs]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-bsp/libacpi/files/ldflags.patch b/meta/recipes-bsp/libacpi/files/ldflags.patch
index a7424c39da..db0974104b 100644
--- a/meta/recipes-bsp/libacpi/files/ldflags.patch
+++ b/meta/recipes-bsp/libacpi/files/ldflags.patch
@@ -1,7 +1,6 @@
 libacpi: Remove QA warning: No GNU_HASH in the elf binary
 
-Upstream-Status: Inappropriate [other]
-  Useful within bitbake environment only.
+Upstream-Status: Inactive-Upstream [last release before 2008, no vcs]
 
 Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
 
diff --git a/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch b/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
index 06f20e5a78..955a175c96 100644
--- a/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
+++ b/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [last release before 2008, no vcs]
 
 Fix libacpi for x32
     
diff --git a/meta/recipes-bsp/libacpi/files/makefile-fix.patch b/meta/recipes-bsp/libacpi/files/makefile-fix.patch
index c34ef34e09..3b91bfaee1 100644
--- a/meta/recipes-bsp/libacpi/files/makefile-fix.patch
+++ b/meta/recipes-bsp/libacpi/files/makefile-fix.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [last release before 2008, no vcs]
 
 ---
  Makefile  |    6 +++---
diff --git a/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch b/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch
index ef376aa316..901e5fa3b4 100644
--- a/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch
+++ b/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [last release before 2008, no vcs]
 
 Used the cross strip instead of host strip to avoid this build error:
 
-- 
2.34.1


