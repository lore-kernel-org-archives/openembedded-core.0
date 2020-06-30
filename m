Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web11.7642.1593486284110525737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nmYPHIdT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.195, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f195.google.com with SMTP id j19so2388276pgm.11
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=mk3bDMIk+SWJ/Swe7i9qVHIzYxyu4PBHxVnL8w5N9Vc=;
        b=nmYPHIdTvNBChPT9wcjO1Xg7mGt3kI3/knhr4kLqnrhLReRV0pY7pxs0brrs51lARv
         VasXuSwZ/GjLi3TlfEam0PJ9rHc+sPglWaSrczHNJmf2tmZ2b4+jlmjn5qWvCyyIQizy
         IISq521e6dvk1i6RbBp2KMpt4sLyGykBKpBSLj9hjz9jAuTX4pdruQwvYnb3H2S837GV
         G+XMi4U9HwC1+SEifmkLACNnFtQuBqivzi2FeRYM58R3V0iP3EDBdsdSPit2sKChhcJa
         nxglMluzhYP14KKUkOGrwonb952pJ7CXPScjy4G/REgaH0tE0arzBi3VnesYr2g06WAO
         HFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=mk3bDMIk+SWJ/Swe7i9qVHIzYxyu4PBHxVnL8w5N9Vc=;
        b=s5yNeYmIbAW0pyAcTnmBPwN5Blkn8Jx6yHUjKubJXtp3iIzKsi5weGt896/sNA0nwy
         F9qtLVcaEWAu3pKDbd04ATV4ftwJiZSlsFm7UzQ0+ly984j2UTvSPcyXwY6IYdrizBm+
         5qh4+K0X1K0YznXWvIwktv/LKgmPWVFTJ4jqFAinccULpA5Kr6Pj4iT7OLrPvOcnwpF/
         XdgUeb8eKZIDfSrG63WNEolsdqSFE0WhiZkYbW8CNZHNSGFnM+/hc1fzzPr3kgjcukqQ
         zraMn9NxuBmOrtj1u4lc06c6sOyp8Jwml+Pwcq5lb2+ql9ijIq4xz5kBYWL7WpVuO63I
         khOQ==
X-Gm-Message-State: AOAM531O+HkorrAZV+zOx8EqR/5528QkuPFfjpUWS06ioDY3zvxeNI63
	250g4k5+cSr4b+LFWAkbt7Saj3BWxoBfLQ==
X-Google-Smtp-Source: ABdhPJxUOv7rU6mBK4YDBFJVG+ruCZY+4crqTYM8InOqdGm7QDkqulvEtMWHpcGOaZcl1Uj+nclOgA==
X-Received: by 2002:a63:6447:: with SMTP id y68mr3711426pgb.428.1593486283191;
        Mon, 29 Jun 2020 20:04:43 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.04.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:04:42 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/22] oeqa/runtime/cases/ptest: Make output content path absolute
Date: Mon, 29 Jun 2020 17:03:09 -1000
Message-Id: <394d90efdc8d06dc61114bf6279ba6d094667289.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

From: Andrej Valek <andrej.valek@siemens.com>

The output content is created in current directory, because json content
has no defined absolute path to WORKDIR as in bitbake.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 14203b2cb9aa62f55cb12230ac8012b3cd995be7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 99a44f0767..ef0470da7e 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -42,6 +42,10 @@ class PtestRunnerTest(OERuntimeTestCase):
         # testdata.json is generated.
         if not test_log_dir:
             test_log_dir = os.path.join(self.td.get('WORKDIR', ''), 'testimage')
+        # Make the test output path absolute, otherwise the output content will be
+        # created relative to current directory
+        if not os.path.isabs(test_log_dir):
+            test_log_dir = os.path.join(self.td.get('TOPDIR', ''), test_log_dir)
         # Don't use self.td.get('DATETIME'), it's from testdata.json, not
         # up-to-date, and may cause "File exists" when re-reun.
         timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
-- 
2.17.1

