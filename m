Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C27DCAC587
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 20:01:54 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.7007.1757620913709903361
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 13:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S0RJtOdk;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: festevam@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7722bcb989aso819662b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 13:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757620912; x=1758225712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XGqEN1h4TsuLPZfFn+x/KahT/zgcra8+auQQcQYVb7Q=;
        b=S0RJtOdk6wjRrlonCLC3Fy8lUUcJyiBFga7wWCVsAwuEe0WMsnpMEYeJic99yi3zml
         1+0++lXOSNgtc0to9IfukcbvcaVYu2EFG56x0Z7m75WDGe/7SLGMDSeHN7RX7a97+knc
         N3eRkSiBFZieBQoERHZoTdids8HWk5kGk8nwFOrQPVG6JBYvkXGd8qomUBUlduBBrtNQ
         7/0ObqmD2gKkPngbrARGpJkV58HMSyvq1KKGQdWtMe8/cMnux7mcqZilITzYt3/OupBD
         nE6ASZj5nCXYgd6Nk4qKztrj6jw5pBreQQnRk9Y3FWFuCHyvZBQVj4+7w2AZ+Pd7dQnC
         ZIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757620912; x=1758225712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGqEN1h4TsuLPZfFn+x/KahT/zgcra8+auQQcQYVb7Q=;
        b=NypxOUOvP4igTfOknMDAA1hYpZqBrRwL1BDgIZ+LUBvBp0S8iM86B157emluaRIcvz
         bu6EDsrQrU5rp1EhcFbfzR2O5fUPYhVMUeaPVUs3IZMlEVANwbwXkjufoP71EtHgZKMf
         xage6agIQfpkkmWJaX6oxePfGyhVjr5RM/qKf5N5BN/n5VYJouIKmp9erBROIAoj+dNh
         92uHqPuNimvFNbkzeJVf5a+KJ6zasKN8jWwrZv7UpkBSo0jizKg8tSp3J8t2SIIImBkU
         /k6yATBnrGqQDr2xTshMfA4cW+iy1PxhXy5UK0yIQp24ByZNGqZwOEmGuJWFTVahNS5C
         YFjQ==
X-Gm-Message-State: AOJu0Yyh+p37NPecys9BM/eny3Q3NTaaJeo0zX1QOws8lu0Q7CLd9Rzc
	mSobhgAM+Wtz5hoMcLeRo4vZvhTYe78pTfkHkruoRxPpu43FgugUojbOc5cZWQ==
X-Gm-Gg: ASbGnctLfXALa0bXMoA3mqjna2C8fJStBM6581ZglAO8xNZ08OWXpjHpyrQQZfZwM+7
	hiyujBZNrtTL8ocFUCNWH3XziY2MfvJrAjJidXpvuKIYsV9tHkaHiSx9eO+tofZTUlsaZexBRur
	zRm971vROTGLUK6U6dJmkvJLhA+7KKCdDYA6U6ipgIxI+llBhvHXCjaPrtL/i+g8BMxsfU6+507
	ZLfS+ULLAex2Y+Ku2OOtoFeDrUgk6ITsAAXclRE4IZzO9+g6FSNIO5BsU6X3SQWmcD0Avo2hx/M
	nkfDSPWuIAx94yNXSnBrKj6Xhr5Q4p57fNhDR6GOrBjr/KFwwItvZeMRkUyAr8dozWBoDfdnrqU
	57oAa7Vb/bhwiEBy11PAkuox1HF/n
X-Google-Smtp-Source: AGHT+IGS2I+lTKn4Nm4AJ9upPzIy+LVSvvIPYLfnnNOUy/0ZmyCkz7qEhV+uifNlyyFjOnt97dqMBw==
X-Received: by 2002:a05:6a00:1743:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-77612064075mr727810b3a.4.1757620912422;
        Thu, 11 Sep 2025 13:01:52 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61::1000])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760793be60sm2917143b3a.7.2025.09.11.13.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 13:01:51 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] kmscube: upgrade to latest revision
Date: Thu, 11 Sep 2025 17:01:47 -0300
Message-Id: <20250911200147.749074-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 20:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223293

Upgrade to the latest kmscube revision.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index fbc775183057..243728b115b8 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2a12bf7a66f5f663d75186bf01eb607b"
 
-SRCREV = "afedb4255f380bb2041dd2100ed7fb75487a96dd"
+SRCREV = "2c1f2646c5e58d11b279b610a8509116c02b067b"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
            "
 
-- 
2.34.1


