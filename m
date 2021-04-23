Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.73.1619200983124735344
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 11:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dn888Pxb;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id bx20so57260021edb.12
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/pe1JSY4iZARpSTc6cWkrdlYgbT2aox4ftje4usq17U=;
        b=Dn888Pxb2TRPaD4V5ENZO9pcvIAmHisQJauo6zx42tXiPteKpwRbnvlO6AXVT3Gdtk
         4CvrK3RE28aPhthamtRyo9G9Mth9K2nnykTLNJ9Dcq7do0dqo1QaOeAElxTfC27Qcei/
         mDs48TlYpFw+ffMcUWAf8Vowjlk2lpr+vbbGbmy/eiPjHssxdn/BNiPzfYXhtGzw8fBa
         sSWh9f+ccbFC4cQDH7wrMus6ZUFxYWcDfptzAIX9gY8RqjYN5WEfTZRuTJl8Gpl7aiu9
         nsMgTF82pFTgCu1o4jSqSNOJJUlAxq/sc0Jy4Lzzw15inMKj8Bw4YUSQPdn31meh78cG
         9n8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/pe1JSY4iZARpSTc6cWkrdlYgbT2aox4ftje4usq17U=;
        b=CMdc7g2gNfcdK/A0xBtfHsD6oWBmJSQUzbZ6AsBEwh3JBF8ynlJIuc3Ue/KPb10Cdj
         ov98EUdJLM499n3DMofbWibv30LJlLX5mhYPOBywpO+nDDBPlbJg/EsVe3CxgjsEOBTc
         9ANgZHf7afZ/Mdhx9umu3fAFKpmUzKrthkYN1cSFZUWuMdDxKy0b1nORMoWTXtqVVr3O
         Q58Stk8lFNe2goSJJCrbM5FSucM4Bep9Qwmj6dKFycFZIMtpLYOdddLgsPQgzFCSafKY
         bxNmo1+jpINoz8YJbKF145pXT75v358f0jkR9kTj/u3De6G+Huzxd3RNY/+LqNH7OjdV
         es+g==
X-Gm-Message-State: AOAM533VjmUziQnqZ8lxikYU9QAIAvnhXPHG+s5NXaEJzCZ6yqjHgbo6
	+KXMANt4i83cKSmzPPQpjpE6sGAOZDCI/w==
X-Google-Smtp-Source: ABdhPJxcqlWiydLGlrUN9iUF50am0g7MhSV5ziaX2FI6IodxysP2yjsd/zN1+rdS71UpOSUGJ9GpYw==
X-Received: by 2002:a50:ec92:: with SMTP id e18mr6081568edr.246.1619200981811;
        Fri, 23 Apr 2021 11:03:01 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id z14sm5315849edc.62.2021.04.23.11.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 11:03:01 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/7] oeqa/buildperf: use weston image instead of sato
Date: Fri, 23 Apr 2021 20:02:49 +0200
Message-Id: <20210423180254.706537-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210423180254.706537-1-alex.kanavin@gmail.com>
References: <20210423180254.706537-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/buildperf/test_basic.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/test_basic.py b/meta/lib/oeqa/buildperf/test_basic.py
index 2104617ba3..0fe7d3c8dc 100644
--- a/meta/lib/oeqa/buildperf/test_basic.py
+++ b/meta/lib/oeqa/buildperf/test_basic.py
@@ -11,10 +11,10 @@ from oeqa.buildperf import BuildPerfTestCase
 from oeqa.utils.commands import get_bb_var, get_bb_vars
 
 class Test1P1(BuildPerfTestCase):
-    build_target = 'core-image-sato'
+    build_target = 'core-image-weston'
 
     def test1(self):
-        """Build core-image-sato"""
+        """Build core-image-weston"""
         self.rm_tmp()
         self.rm_sstate()
         self.rm_cache()
@@ -40,10 +40,10 @@ class Test1P2(BuildPerfTestCase):
 
 
 class Test1P3(BuildPerfTestCase):
-    build_target = 'core-image-sato'
+    build_target = 'core-image-weston'
 
     def test13(self):
-        """Build core-image-sato with rm_work enabled"""
+        """Build core-image-weston with rm_work enabled"""
         postfile = os.path.join(self.tmp_dir, 'postfile.conf')
         with open(postfile, 'w') as fobj:
             fobj.write('INHERIT += "rm_work"\n')
@@ -60,10 +60,10 @@ class Test1P3(BuildPerfTestCase):
 
 
 class Test2(BuildPerfTestCase):
-    build_target = 'core-image-sato'
+    build_target = 'core-image-weston'
 
     def test2(self):
-        """Run core-image-sato do_rootfs with sstate"""
+        """Run core-image-weston do_rootfs with sstate"""
         # Build once in order to populate sstate cache
         self.run_cmd(['bitbake', self.build_target])
 
@@ -93,7 +93,7 @@ class Test3(BuildPerfTestCase):
 
 
 class Test4(BuildPerfTestCase):
-    build_target = 'core-image-sato'
+    build_target = 'core-image-weston'
 
     def test4(self):
         """eSDK metrics"""
-- 
2.30.2

