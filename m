Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.17531.1590940462687439266
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WZD7uTw3;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id x1so6857843ejd.8
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oy7vq08AjbViGiUEuoOHB1wvyNi6PbUrsxOibt8gyJw=;
        b=WZD7uTw3pYHMkAY2nM34wFNpQ5muK95xQQRFqSSzIW6lrHGEQCSsbKf5AClCQTlyt3
         qXfVMP+iXMVhh3xvZHyYsjoJzKSImNdR8CxHXP5I2CO9VtXY1exmb8TdNpfxn7IKcNa1
         +z07T/KtC5ZuvOnJL5iMLy7aOmwie2zAlIsd5upbt0l7s+5XH6ThBHZBx8h7EfEFmm7s
         modqr3tQu7lDWLmMaBJVvYF01wSuN9cxm3+ia6kjjB+DrJ/aTKgd1Gi6OiKWoBsId34n
         NlQSTjaKMzS9aKqcXFP8YfVb9Y2tUZYSzOchBIeLnNU9o6UQlrMarudDQOVwS5+Cvp7v
         5fgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oy7vq08AjbViGiUEuoOHB1wvyNi6PbUrsxOibt8gyJw=;
        b=iT126XtLCl1+ftBaRSsMPe5E5UkdAhU3t1UkqsA175wHEjIZXptYsLyYTzi8F7Re0y
         RnSBt1zR+dHMbnLv/jSwPtl2QAuBbX9YPY2Su0F+chMA9LPMm/ckHlo66fDQJkSInya6
         qQAnyTwU3SoKVmSYDWriGW0hXJGRRzGIEaXwCPGa3NJIBvHezQpjQEep3+dtKakHQ+DS
         /e7j7wvOoDOBmWAEo06fRFYw/D/v5hhhq3YapvN8+wseJC6yK/yyK6z0U8/WzS1J6LHC
         cR66X27ZVB/xFriR1u5sxPu62OO66gnEcbpCTxCmp3fTmI28MWTH0rAkCOTontShT7zk
         SFcg==
X-Gm-Message-State: AOAM533ChOCcj3Wpl+8fkyRmcnzsgYJLW/ZW4F+6jUmb/Upcmm52m2GA
	5tOvlbVof6ScqWzTZsNHLSqVvnYk
X-Google-Smtp-Source: ABdhPJzVg7Be5ambZ9jaMrS4i3+WVzjJ+pBYPYHeHKi6aWowbtePHhNZN3kdLJVL7VJU6lqG5rBxNw==
X-Received: by 2002:a17:906:594e:: with SMTP id g14mr6237554ejr.52.1590940460968;
        Sun, 31 May 2020 08:54:20 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:20 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 61/70] python3-setuptools: upgrade 45.2.0 -> 47.1.1
Date: Sun, 31 May 2020 17:52:45 +0200
Message-Id: <20200531155254.10283-61-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ly-do-not-fetch-code-by-easy_install.patch |  6 +++---
 .../python/python-setuptools.inc              |  3 +--
 .../0001-change-shebang-to-python3.patch      | 21 ++++---------------
 ...45.2.0.bb => python3-setuptools_47.1.1.bb} |  0
 4 files changed, 8 insertions(+), 22 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_45.2.0.bb => python3-setuptools_47.1.1.bb} (100%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 5f99cd2512..c7acdd2d55 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From a8f871c9ebc4fcb99d4163b226aabeef26567099 Mon Sep 17 00:00:00 2001
+From f1d625cad6db3958507b8c6f3785788a1b17970c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 426301d..55c8062 100644
+index 6bcdc98..0bf0c24 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -649,6 +649,11 @@ class easy_install(Command):
+@@ -651,6 +651,11 @@ class easy_install(Command):
              os.path.exists(tmpdir) and rmtree(rmtree_safe(tmpdir))
  
      def easy_install(self, spec, deps=False):
diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index e9ad93dbee..eae6095e3a 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -12,8 +12,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[md5sum] = "0c956eea142af9c2b02d72e3c042af30"
-SRC_URI[sha256sum] = "89c6e6011ec2f6d57d43a3f9296c4ef022c2cbf49bab26b407fe67992ae3397f"
+SRC_URI[sha256sum] = "145fa62b9d7bb544fce16e9b5a9bf4ab2032d2f758b7cd674af09a92736aff74"
 
 DEPENDS += "${PYTHON_PN}"
 
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang-to-python3.patch b/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang-to-python3.patch
index 33af8daed7..5ed4cb8bef 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang-to-python3.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang-to-python3.patch
@@ -1,4 +1,4 @@
-From c39d0896930e25c224cc897660fc8511ccae30c8 Mon Sep 17 00:00:00 2001
+From f80880c6b8823f78937ade1cb9f395a6c60bf0ed Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 23 Apr 2020 10:01:12 +0000
 Subject: [PATCH] change shebang to python3
@@ -6,10 +6,10 @@ Subject: [PATCH] change shebang to python3
 Upstream-Status: Pending
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
 ---
- pkg_resources/_vendor/appdirs.py   | 2 +-
- setuptools/command/easy_install.py | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ pkg_resources/_vendor/appdirs.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pkg_resources/_vendor/appdirs.py b/pkg_resources/_vendor/appdirs.py
 index ae67001..933e398 100644
@@ -21,16 +21,3 @@ index ae67001..933e398 100644
  # -*- coding: utf-8 -*-
  # Copyright (c) 2005-2010 ActiveState Software Inc.
  # Copyright (c) 2013 Eddy Petrișor
-diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index abca1ae..6bcdc98 100644
---- a/setuptools/command/easy_install.py
-+++ b/setuptools/command/easy_install.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """
- Easy Install
- ------------
--- 
-2.24.1
-
diff --git a/meta/recipes-devtools/python/python3-setuptools_45.2.0.bb b/meta/recipes-devtools/python/python3-setuptools_47.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_45.2.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_47.1.1.bb
-- 
2.26.2

