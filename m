Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.6011.1615541519718128700
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 01:32:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NHr28RUU;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id u4so6972883edv.9
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 01:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JkQRToydmVUkJrs03NbYSN9iozpomy1az7ItM+BCDhM=;
        b=NHr28RUUc2NkxWpabniGY1lrUYtddYbz8pkXNZctt4EhIDCN7h8or/3vwXllEvEl9c
         a1+/qAE+bwNOtK+C9AeEPXUSNdsVcoqJEmUjHEcWDONivjWXIYfWSIKlgwoCfRbq5eJY
         9UKRpKbgasqrA8zFV3AWhXfIV3uSilOTXyFHu3SjKDqTc4/Sjhg24xReepWoa1876r1k
         t/udZ9hrncH5SPjmo5GjEWLzIhcUcQDBWfGZ4eAEjLjIKKwCEkUo8h4gdcQdw2YMTjAv
         l1hO+GeSnFCCefvPgJzzQcJqLmoIdAfUytaCgMMjsCTr88wpyG8CgVG/E4an2HfO0Q1v
         80bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JkQRToydmVUkJrs03NbYSN9iozpomy1az7ItM+BCDhM=;
        b=dQI5ip/Qo8jCNbTwS0sm9KI2qMwzfi8vJl7WyoCYSzOW441xDv6+xmo6aS4n7+4YXR
         Y1aJXOW4UCTHT0I6PHzgemhiHbnzUQSs1V3pJwIxF603u9s2f71qiGk9HJiPCmaxdxdB
         LWvzFgc4Sp6U5PrbHDn4RLU8cEeyh8JDs/r0ElirPLC2AmG/KTez0ontvjAYuBjMd3bY
         ftCONMi8mKgQLIjy+JW9eq5wC69mVlrC+xmSGSGdKiS6sRM1MS96G4hbWoMH/OXTIM8Q
         /yLBnnLE1UqwoHB+A+8tUnVFPfFbLLAurrDFrLBYSBYtnn/cBvoGMAnP+2xZ+QYQdgpY
         cchA==
X-Gm-Message-State: AOAM533Mg4GaS19q73SLoFJB6TQqfn3qd15o4YiQpSKyUA+2voF12oad
	dvS0YYuxlmk5BUfx9Z+sx2KolzKyL7k1zg==
X-Google-Smtp-Source: ABdhPJy6ZqbnxMUYM+9IsNvkh1GsZQAaykMOEElL/OYODI4wYSKdqz+ty2Y849BKCmpgdgN5UVhm2A==
X-Received: by 2002:aa7:d294:: with SMTP id w20mr13212726edq.68.1615541518239;
        Fri, 12 Mar 2021 01:31:58 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id a9sm2635831edt.82.2021.03.12.01.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 01:31:57 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 2/7] oeqa/buildperf: use weston image instead of sato
Date: Fri, 12 Mar 2021 10:31:34 +0100
Message-Id: <20210312093139.318889-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312093139.318889-1-alex.kanavin@gmail.com>
References: <20210312093139.318889-1-alex.kanavin@gmail.com>
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
2.29.2

