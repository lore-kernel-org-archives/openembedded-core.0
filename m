Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.13148.1619796879312384344
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 08:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1ot8n605;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id p17so10895071plf.12
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 08:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BdpX4BQzc8gwS6e04iy/CX/bIbJ8uKmDK2FCg/NHjpA=;
        b=1ot8n6059f8iD0taraFEafve2TJlsoE16qplNg5ZqYQkjelf0WApHhn9tPklBXO0NI
         lTz5zSl66lHrCcN/gWLA2kU2s5GaxkBwY2p+i3ISSP6NIWEAWz63aQocbO0DrhLdoldc
         Hu4bQA6O4srgQIKBKFICAYtaVTGTBqbeoomy2dhM0mLHz9Po1VIi4ext9Xy4M4qT85Nt
         TgwB+vwImuRT7jd9/Irlw9xoDGHWXk4RHsMf8BBkswkqcAOIOc7ghGQMA0S4JYk//VJX
         M9t7XUe3ixDX7ambTGDcB6LUG+UswR5AsKQlvX9eu/Vku5itWYd0ZIMe83LGY8d33vGJ
         +1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BdpX4BQzc8gwS6e04iy/CX/bIbJ8uKmDK2FCg/NHjpA=;
        b=Mv9p+CMB86lTq5Bo41LHWlyLWnX7TIhLlYw6iJkkGoVHxbCbRPi6Evh1Q7FftTl7YT
         57ih6aBQsjC3qJh8MLxa42AoRKaYPcs9zC8SgcNSxiS0s2G0HynkU3UhYVnl2kXCrs1k
         Etooj9MrjgoDkveckOuFK5NhMGpzcKkWh88tF/QIuyec+Doc/zLNnEDFt9eAvTxOi4tW
         uCBUwj+z8KEKut+0v34+CWqoMTiLR3zf3Gke7JSs/UtoLgyX7/GKJSo21u8VzdbAEdgi
         2kR0fUCI//lHFy8pgpARXk2L4t2CSOG6In+G88ubFf9AO72k7svhZerm2UwxXuNiHnU6
         +91g==
X-Gm-Message-State: AOAM533DFiiA3XWAnn1Dl51VREbWovrT55YL+irgLCTokm3+ek9i0U7I
	HP9ifSAjG5/7x27ZcvsiSbdtFRy7Ycoy37ey
X-Google-Smtp-Source: ABdhPJxx/1u+bhkBfeUmKRIcxyBMqI05jfyyW7Vas06nTTkwthZ03J4J1mkUWo+Q8vA44a0CcBFlmQ==
X-Received: by 2002:a17:90a:b907:: with SMTP id p7mr5775382pjr.79.1619796878454;
        Fri, 30 Apr 2021 08:34:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id x9sm2900386pfq.197.2021.04.30.08.34.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:34:37 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/12] oeqa/selftest/bblayers: Add test case for bitbake-layers layerindex-show-depends
Date: Fri, 30 Apr 2021 05:33:42 -1000
Message-Id: <1a1bce6d9a84d268fd2c0e87a33dc4591d792dd0.1619796615.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619796615.git.steve@sakoman.com>
References: <cover.1619796615.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Diego Sueiro <diego.sueiro@arm.com>

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 80090c31164d62a169431ab71c4aaee5475b6f40)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index f131d9856c..7d74833f61 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -12,6 +12,11 @@ from oeqa.selftest.case import OESelftestTestCase
 
 class BitbakeLayers(OESelftestTestCase):
 
+    def test_bitbakelayers_layerindexshowdepends(self):
+        result = runCmd('bitbake-layers layerindex-show-depends meta-poky')
+        find_in_contents = re.search("openembedded-core", result.output)
+        self.assertTrue(find_in_contents, msg = "openembedded-core should have been listed at this step. bitbake-layers layerindex-show-depends meta-poky output: %s" % result.output)
+
     def test_bitbakelayers_showcrossdepends(self):
         result = runCmd('bitbake-layers show-cross-depends')
         self.assertIn('aspell', result.output)
-- 
2.25.1

