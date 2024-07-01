Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F517C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:13:32 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.13491.1719814402404364681
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:13:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SPdQPeDT;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fab03d2eecso19688965ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 23:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719814401; x=1720419201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGYBXr3kr8jDQeTYRngC/pMckzYxZg8UUeyRVhnklMA=;
        b=SPdQPeDTZkXfmAKQ2kA2JWtyR09hgXdd1IPI9RC+ea1agmvkB2w890eMMnKuUbnnGP
         zTSc3oOYBBvYu6SA/QwRUIOH0rLboxT0a32lN0OeOngeRWnymfBDaD98TvyRUC0HnVhP
         qwqF08qVwAOzaZ/OsaCICrfS9EFuDO4CC7oH+LJxBa0yh6Spm4kNDwZjFBWJdY7dJKh1
         GalFRtETkiUzdYWG0nnI6fEVHH3wUoRkIJrD4lnQa7GSD7vKbwpbUAvL/B7bxRbKGOJ6
         p+7KXXterl6JKj3BTgXNsdFOWhAnp9FUNNlZSCqHRlEbRiuE1NJJoxmwdki/C//FkQj6
         oGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719814401; x=1720419201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGYBXr3kr8jDQeTYRngC/pMckzYxZg8UUeyRVhnklMA=;
        b=NAwYMobJbuzv3T0vzSVc+raLv5sSDyu2x3uI430OqTn5hMzHDsNc884bHAcvMPRw2O
         pOPGisbX/SKrQagr2XASqpu8cylSxVBgNE5PK7mj8dKYqVM/ezNIDWb3x1ns1ZVAI63L
         qHUrTTTOqUbU+8XLc6crteXTqh1tWFpWMgyg7uHrXlQQ+n8x9h4AXWN6OmnjVKAQjQXe
         IUuzUDqNxSAwLNDf0wr8HIMyrwpjzZ9NDxhcVWb+7rHtfX6CS+swRQS1hXiSbDf/nLDF
         fEnCa7SNcU7paAsK8wX9XlG7Kgdx1HfySBN1zuAx5MzhYMAfQ6dltb0kmhhLa9axG+/j
         K5tQ==
X-Gm-Message-State: AOJu0Yzo7nf9tKKDcTpP+SvdN3FHCi/pI3IqUuswJsNhv0pXvNi/Cmhz
	bkDPV2tSRoyDyUSsMM5Ip6ynPCt7CUeOsQk6iGgAV+lZyZva2aWDXc5DFxjL
X-Google-Smtp-Source: AGHT+IEGpyNvs/zYwxneZSi0+hnBwHqtgasstxvuQ/Bupbnr7DRmIY/vmVq/mxc8iYzOSADaHF6cfQ==
X-Received: by 2002:a17:902:f685:b0:1fa:d4b9:6776 with SMTP id d9443c01a7336-1fadbc94054mr48861555ad.17.1719814401534;
        Sun, 30 Jun 2024 23:13:21 -0700 (PDT)
Received: from localhost.localdomain ([43.231.237.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac159ac64sm55677685ad.295.2024.06.30.23.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 23:13:21 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone][PATCH 2/2] glibc-tests: Add missing bash ptest dependency
Date: Mon,  1 Jul 2024 11:42:45 +0530
Message-Id: <20240701061245.141303-2-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240701061245.141303-1-ppjadhav456@gmail.com>
References: <20240701061245.141303-1-ppjadhav456@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 06:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201278

From: Poonam Jadhav <poonam.jadhav@kpit.com>

The script has a bashism and needs bash to execute correctly. Mark it
as such and add the missing bash dependency so it executes in minimal
images.

(From OE-Core rev: a1b5afac108d9c94e8fc2ad8cfebfee16f6f243b)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 28b8d57a88849f7f024d13c5c901f3621f5166c7)
Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 meta/recipes-core/glibc/glibc-tests_2.35.bb | 2 +-
 meta/recipes-core/glibc/glibc/run-ptest     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-tests_2.35.bb b/meta/recipes-core/glibc/glibc-tests_2.35.bb
index 4b765eaab8..9c440f92b7 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.35.bb
+++ b/meta/recipes-core/glibc/glibc-tests_2.35.bb
@@ -28,7 +28,7 @@ python __anonymous() {
 # Remove any leftovers from original glibc recipe
 RPROVIDES:${PN} = "${PN}"
 RRECOMMENDS:${PN} = ""
-RDEPENDS:${PN} = " glibc sed"
+RDEPENDS:${PN} = " glibc sed bash"
 RDEPENDS:${PN}-ptest = "${PN}"
 DEPENDS += "sed"
 
diff --git a/meta/recipes-core/glibc/glibc/run-ptest b/meta/recipes-core/glibc/glibc/run-ptest
index f637986105..c394b49866 100755
--- a/meta/recipes-core/glibc/glibc/run-ptest
+++ b/meta/recipes-core/glibc/glibc/run-ptest
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # ptest script for glibc - to run time related tests to
 # facilitate Y2038 validation
 # Run with 'ptest-runner glibc-tests'
-- 
2.25.1


