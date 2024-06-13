Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54E9C3DA40
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:13 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.9695.1718288468273106520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ohmei/CU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f68834bfdfso9196105ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288467; x=1718893267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34YiP9a3cNIN9kwswQSrOf+rUN/1nyiFKUXVDsWOw0U=;
        b=ohmei/CU+A1hgDEXT4VKZ8sx4JTi1swhBYcuaec3s2zBmCniPMuSOy+SosOpiVH/dg
         d76IVcMu8oPta+Bi0AC52bcGn3ZU9tEiOLDogLMMBYPdP+qJqcbp7H+TNPGPbqdtVSVw
         2bqUMNSSYcTZyS8qQqpdrAK99tMHhJOO4M+faKDWrvPlZWpXqSL5wpMzJigug+ftbbaA
         Q8d+pX1ql18/1ifunpL3D/xdoAG8ekSR79yA2/m2bvOa6PqENBEsExZfRsv+DkIedBn+
         y3TzBSVP8ONdZb7Ls+4qAWwhJ+6H9Egm5Hb53tR0VGPpkMzdvY1QEWYShDamTGcu1Jbq
         54Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288467; x=1718893267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34YiP9a3cNIN9kwswQSrOf+rUN/1nyiFKUXVDsWOw0U=;
        b=Absqol2zfYoh1FD1/rUY3F9aoASXxWTf7wbzYql1YFHIMBsKeFXNmpBpn7u2rRkuy5
         3ZBMpLXU95udKbNPrXAW7YvxnHYYrgGPiqEBnSwLzWXxxGHepYXa2mvxMSitRhm5cUUP
         rNsFwzB/yqdA1Afiwl81RMYg2N2rL8yY18ABWjQ0Bj5+OMvRGTC6Zqt8FuUZUeEmUwDD
         Wk72FW5l3YOJ+TWu3Id/kfHRVHJptUv330py1jdhf0ZFZjjY57j7a6OH2ymsUQX29tHK
         vWL5UcH5Hp+HU2e+rsQhsSlkQEQAAxMYKBcelQVhCj8GdgZe+QTM1rl2snK66KqCP5UO
         5VNg==
X-Gm-Message-State: AOJu0YwxXqhBH+WC+BA3i5VevIGorILyoi36Ht8XX5d60v0YeT5BwmUU
	L2+m3myNx1IkjZZc8W8r9RguF8bsZAd5zVXJsoxu9vAKbLa2nvpwPnZIfVs7VzV2/drc/we7HXm
	Q
X-Google-Smtp-Source: AGHT+IELiVKMg78Z/E6T1r1IJ+v5TzZaPL8R90mriVTkMFZ5oFrI/hjxHTg/13Djx2mTbo9GFf2O6w==
X-Received: by 2002:a17:902:c942:b0:1f8:44f8:a390 with SMTP id d9443c01a7336-1f844f8a69amr47764255ad.33.1718288467537;
        Thu, 13 Jun 2024 07:21:07 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.21.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:21:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/29] icu: add upstream submission links for fix-install-manx.patch
Date: Thu, 13 Jun 2024 07:20:25 -0700
Message-Id: <bebafda283f4ecf63994dfcc334e3bd0ac875e7e.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200623

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 269a1a65d2526be5622b4c1f552b6f5541e0cb86)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/icu/icu/fix-install-manx.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu/fix-install-manx.patch b/meta/recipes-support/icu/icu/fix-install-manx.patch
index 7526bde370..16cabc8264 100644
--- a/meta/recipes-support/icu/icu/fix-install-manx.patch
+++ b/meta/recipes-support/icu/icu/fix-install-manx.patch
@@ -11,7 +11,9 @@ and one process tries to chown a file that the other process has just deleted.
 Also install-manx should be a phony target, and for clarity use $^ instead of $?
 in the install command.
 
-Upstream-Status: Pending
+Upstream ticket: https://unicode-org.atlassian.net/jira/software/c/projects/ICU/issues/ICU-21172
+
+Upstream-Status: Submitted [https://github.com/unicode-org/icu/pull/2966]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 ---
  Makefile.in | 8 ++++----
-- 
2.34.1


