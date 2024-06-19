Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6436C41513
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:00:11 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.16484.1718787611380284341
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l6CPSE2y;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4230366ad7bso57885955e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718787610; x=1719392410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUnY/bVXWBDGMqpAAZeFQilvCN62T+dxiyKlzWI1fHQ=;
        b=l6CPSE2yh6AFtxxMUarD5rKBRpcUz8nhXuQHAUPTRslcothoqVSKyW6kNlTVzkbaDm
         qSYX9cQI1tRr+53zzCJ4aotU+T+TONJgoYy5jyvTH1m3O7Jlv/MrYbi1yxHLUZdUyUts
         NUiYHh+SJbdciKqvN5nduOuwbAgZM7OqF56xdjoN+YHi2GtC/SEBKgp6wg+P2fHjVAGQ
         RXaUGW8qMM+73NEWZw1B38OYP2cZf8viKHPCCePc0MdYdGuUiQc/lN8e5+SMRU/AfYZV
         eOpZkFWhgnufaL0q8S0ipzhla2s9xoHXMGRdJ2YoT0iVJoYCal1pNWmeo4g0mRH8fjNN
         zBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718787610; x=1719392410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUnY/bVXWBDGMqpAAZeFQilvCN62T+dxiyKlzWI1fHQ=;
        b=wECC9OwTEFnMr7sji1l4eeSoMLJGEyYmJ8LyV67Qb0ZjzA8FLPUeuatwmdlG0Hck9k
         rZZ9Hn7I0EG58O3L2LEgRbzykh57J0rpXFCVVpD9E8YhH2DlJhlkpcAF1HsvNjPql1hu
         j1/lSN34Hd5RH6DNXqyQvPazdddrWBosrh8IjhBdcb/jQuMfq76Dh/NIKCu+Wf6pvQYT
         IA62g7qLlLVWgHA6cJ9W4/pRFS0qMnF+Hgs+qF0jhMfikqfKcdIrSAZ+hN6REf7jDkRw
         ZSdg+V61fK11QPevXZMfoaQ9EC0KyPKEU5Sfp2vm3Od2SQZjF5PmSRneSmk6tgDIaspS
         lGbw==
X-Gm-Message-State: AOJu0YxnzdIG/BWqpXxOrn2o9niZzdo7zS7aDfMLuBXq6rOeL/auMuW0
	tTYYV1oyyWd+nKuOB+S9SJ2TPmzPlGBQkIgpYfEXpG6pscrdFSIOShzJrg==
X-Google-Smtp-Source: AGHT+IF++jCUMCPfGoyZub3+mbanD6Qu5clE4iS2zctbyhj9PEmwlZfheRDvdxRFw8+Nr0w+WHoFcQ==
X-Received: by 2002:a5d:6885:0:b0:364:1692:ea04 with SMTP id ffacd0b85a97d-3641692eb06mr43671f8f.60.1718787609735;
        Wed, 19 Jun 2024 02:00:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm16401876f8f.76.2024.06.19.02.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:00:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/15] libacpi: mark patches as inactive-upstream
Date: Wed, 19 Jun 2024 10:59:57 +0200
Message-Id: <20240619085957.2787700-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619085957.2787700-1-alex.kanavin@gmail.com>
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200901

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../files/0001-libacpi-Fix-build-witth-fno-commom.patch        | 2 +-
 meta/recipes-bsp/libacpi/files/ldflags.patch                   | 3 +--
 meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch       | 2 +-
 meta/recipes-bsp/libacpi/files/makefile-fix.patch              | 2 +-
 .../libacpi/files/use_correct_strip_in_cross_environment.patch | 2 +-
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-bsp/libacpi/files/0001-libacpi-Fix-build-witth-fno-commom.patch b/meta/recipes-bsp/libacpi/files/0001-libacpi-Fix-build-witth-fno-commom.patch
index 32808fb92a2..e8ff78082c8 100644
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
index a7424c39da4..db0974104ba 100644
--- a/meta/recipes-bsp/libacpi/files/ldflags.patch
+++ b/meta/recipes-bsp/libacpi/files/ldflags.patch
@@ -1,7 +1,6 @@
 libacpi: Remove QA warning: No GNU_HASH in the elf binary
 
-Upstream-Status: Inappropriate [other]
-  Useful within bitbake environment only.
+Upstream-Status: Inactive-Upstream [last release before 2008, no vcs]
 
 Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
 
diff --git a/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch b/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
index 06f20e5a782..955a175c963 100644
--- a/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
+++ b/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [last release before 2008, no vcs]
 
 Fix libacpi for x32
     
diff --git a/meta/recipes-bsp/libacpi/files/makefile-fix.patch b/meta/recipes-bsp/libacpi/files/makefile-fix.patch
index c34ef34e095..3b91bfaee1b 100644
--- a/meta/recipes-bsp/libacpi/files/makefile-fix.patch
+++ b/meta/recipes-bsp/libacpi/files/makefile-fix.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [last release before 2008, no vcs]
 
 ---
  Makefile  |    6 +++---
diff --git a/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch b/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch
index ef376aa3162..901e5fa3b4c 100644
--- a/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch
+++ b/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [last release before 2008, no vcs]
 
 Used the cross strip instead of host strip to avoid this build error:
 
-- 
2.39.2


