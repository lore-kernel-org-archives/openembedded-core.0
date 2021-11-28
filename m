Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8189C433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:23 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.52884.1638136763047029329
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Sa6roIlx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso12221416pjo.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=t/fHgd6qxB/fQcx1SqqctzvAU4npRiX9P+3OW/2Eik4=;
        b=Sa6roIlxCHFALIw4Ge4J65BwN5Q3oEOsbEKpofTyfTqtaxRns7WcC9301MCcwm26u5
         gxlJYVolKTF1vqvcCCKMH46DIk6TMq2EVMFdnZQQz47tFYa+prwj9Pz1EbR+jlsNKN4y
         K2i9fLJonCAwC9sClnr6xMrFpUFGf5niqPakXbOYsJKrZlQcEh/xH9S8mat+AYu+F53Y
         UGy8MsTZL0c8OLDCI5YpYLHu5dZ1SYK4BULPWglnN3Av/flLqr40wzLHWSrN0ollfCfg
         rVKMPlLpGtlfbkbvibhID1gvqOoOyX7g9+tpG8ebhvutvY4o4l3rae+8BKAwcpG513tM
         wFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t/fHgd6qxB/fQcx1SqqctzvAU4npRiX9P+3OW/2Eik4=;
        b=SSnI8bRV+nn/v1bgKdGop3DQ1JI71FZP9FB3A0jXtkoSxjMqOUeBkrZM0zaNXZt1TA
         XYqsK5cpXHOGTDPb2zW4+8ejwHt/jKbxP2zBdF+ejlOjvFiyxgaFWhbaw4h6pHpTQGt/
         Z6D6frtiZwmZRzSKIx6arXdG5vFFC/v40RqKseJiLbwqtkEJCbUkmH9XVr06YneWlfXZ
         jcGrEBrg7NqmFvy74Bgk4XeDJSRq1Zs/68hJrfxvlSJfK8CiqCIKxWfb44hqjHyRlHwz
         TvJllyopS2xgypPektxh4slvmfg5wHPnQ3w0gvJgG2E466lqULTBQ6yKqJTBk9G3Oyyl
         /2ZA==
X-Gm-Message-State: AOAM531tCp/vlXR61b41jgvT1E6ksGoNftoF09J8sPUo8he4c/fRiHN1
	4pzGnwEpNqJ3O6bKI2/xJFRJNgJGDQ7al+vTyAQ=
X-Google-Smtp-Source: 
 ABdhPJz7r+i32KuBd5FdR2raoP/7PKYlokzJZmFj4B4vQJUtvlx7JgyC2Te2+PwssjD9BLoCDV9gEA==
X-Received: by 2002:a17:902:d4cf:b0:141:d36c:78f6 with SMTP id
 o15-20020a170902d4cf00b00141d36c78f6mr56023160plg.56.1638136761971;
        Sun, 28 Nov 2021 13:59:21 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/42] valgrind: mark ptest-specific patch as
 inappropriate
Date: Sun, 28 Nov 2021 11:57:37 -1000
Message-Id: 
 <d6aff070240f12d00c398ae36fde7f779c15616b.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158907

From: Alexander Kanavin <alex.kanavin@gmail.com>

I do not think upstream is going to accept this; if you disagree
please do the submission.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 22b0bd6cfdbf7216a6aca34fa9ca93133a3cee64)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
index 0c399ef52c..a3637ea846 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
@@ -14,7 +14,7 @@ option, --yocto-ptest, the valgrind regression test output is unchanged.
 Enforce 30 seconds limit for the test.
 This resume execution of the remaining tests when valgrind hangs.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-- 
2.25.1


