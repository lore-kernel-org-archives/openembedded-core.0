Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.12448.1624892817007173342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 08:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KwGKBDWO;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.171, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f171.google.com with SMTP id b2so19942502oiy.6
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 08:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lltM2NYBs0ea0tiWmwCapYng6EkuDHRAqz2JVBKzMAU=;
        b=KwGKBDWOLPfHHHiwqwTtf5zf48j6sQgh3reInQ6/kp8Zr2OVaNhJzGGNHhZG4UYPUt
         FnuF2H0LJ0NPvHkJUeuVXOwhIkUFxXB3JWP3ZKh40K7JRrbdLTtA82MhKTf7p9oCTclz
         EHyI5JNJKKtv5i9AxjjB1X7zwKcLlCVdIpyWtoA9iBlzdFDL/v2csfiksZbhaxBEQR32
         uRNGm75gV28sg0S9qE8MR0dJTVHg2AJ7bOe+W3yIkedmwKanvFjGOB1mr0PnBJQiqXXj
         IGTtcpsQsY9waceFp5ieUOeX/EuDcxzc5cf89jlCfpG0jUW21F6c54bwb9rKpS3mcTXE
         iD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lltM2NYBs0ea0tiWmwCapYng6EkuDHRAqz2JVBKzMAU=;
        b=KJBD3vzdMUt8YOdFG/2o2BDWf68DAHL4uP9PZJrZtoTyzByFs9xVnnSrqQv6p3EQwc
         l4WkTwnJW/48VnA9UJZp60KMCzc0s65sP5Vhe7HipjZKTBFlLzRpDbOsla+E0AC6ilBq
         7zpcOYXwJ/lWyzjGOKyZWG4JiS5XfpWWkwhMEiw1sobnX8+MfLwugQjWmD0X/cxKtSyB
         n3+sSGKazYnjvd9cVcL3eqp0sLSnl504amKkpkFpVg09Vev2pIKq5cpr6PLSobqoEbKN
         v7tZzs7GNUm5EYogjT43DDL9pdLzM1U36cYwlKne6y+W4Lmt+kQbL/2uMGzXaJBMU3ga
         XKyA==
X-Gm-Message-State: AOAM530zHHvkC3gKFaTj8cAfm2h4zFINPEf+bBzhWG2u8ASlDiAW8V9D
	erUJGLUsY7Hd/aqz33BAzcvaKrTKemYmcMCOPuo=
X-Google-Smtp-Source: ABdhPJzdjuHZdU4L2qgLvj0KJlELwWwQew/VxJQiT8l74iiKidlUEJz2TZRfeNK8FFXORugT1KrM9A==
X-Received: by 2002:a05:6808:301:: with SMTP id i1mr17112460oie.144.1624892815899;
        Mon, 28 Jun 2021 08:06:55 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id c21sm2095892otp.8.2021.06.28.08.06.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 08:06:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/14] python3: upgrade 3.8.8 -> 3.8.9
Date: Mon, 28 Jun 2021 05:05:29 -1000
Message-Id: <fe037d895e045c5de7ea834c38d09a1c08d8b8a2.1624892565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1624892565.git.steve@sakoman.com>
References: <cover.1624892565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@intel.com>

Release Date: April 2, 2021

Note: The release you're looking at is Python 3.8.9, a bugfix release for the
legacy 3.8 series. Python 3.9 is now the latest feature release series of
Python 3.

* Refresh test_local.py patch for upstream changes
* Add DEPENDS on autoconf-archive:
  - bpo-43617: Improve configure.ac: Check for presence of autoconf-archive
    package and remove our copies of M4 macros.

References:
https://www.python.org/downloads/release/python-389/
https://docs.python.org/release/3.8.9/whatsnew/changelog.html#python-3-8-9
https://bugs.python.org/issue43617

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...le.py-correct-the-test-output-format.patch | 24 ++++++++++---------
 .../{python3_3.8.8.bb => python3_3.8.9.bb}    |  6 ++---
 2 files changed, 16 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.8.8.bb => python3_3.8.9.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index 35b7e0c480..f9d2eadc11 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -1,6 +1,6 @@
-From b94995e0c694ec9561efec0d1a59b323340e6105 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Mon, 5 Aug 2019 15:57:39 +0800
+From e11787d373baa6d7b0e0d94aff8ccd373203bfb1 Mon Sep 17 00:00:00 2001
+From: Tim Orling <ticotimo@gmail.com>
+Date: Wed, 16 Jun 2021 07:49:52 -0700
 Subject: [PATCH] test_locale.py: correct the test output format
 
 Before this patch:
@@ -24,23 +24,25 @@ Before this patch:
 Upstream-Status: Submitted [https://github.com/python/cpython/pull/15132]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
+
+Refresh patch for upstream changes in 3.8.9
+
+Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
 ---
  Lib/test/test_locale.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
-index e2c2178..558d63c 100644
+index 39091c0..5050f3d 100644
 --- a/Lib/test/test_locale.py
 +++ b/Lib/test/test_locale.py
-@@ -527,7 +527,7 @@ class TestMiscellaneous(unittest.TestCase):
+@@ -563,7 +563,7 @@ class TestMiscellaneous(unittest.TestCase):
              self.skipTest('test needs Turkish locale')
          loc = locale.getlocale(locale.LC_CTYPE)
          if verbose:
 -            print('testing with %a' % (loc,), end=' ', flush=True)
 +            print('testing with %a...' % (loc,), end=' ', flush=True)
-         locale.setlocale(locale.LC_CTYPE, loc)
-         self.assertEqual(loc, locale.getlocale(locale.LC_CTYPE))
- 
--- 
-2.7.4
-
+         try:
+             locale.setlocale(locale.LC_CTYPE, loc)
+         except locale.Error as exc:
diff --git a/meta/recipes-devtools/python/python3_3.8.8.bb b/meta/recipes-devtools/python/python3_3.8.9.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.8.8.bb
rename to meta/recipes-devtools/python/python3_3.8.9.bb
index d77c7d87fb..13d3b8e5b5 100644
--- a/meta/recipes-devtools/python/python3_3.8.8.bb
+++ b/meta/recipes-devtools/python/python3_3.8.9.bb
@@ -41,8 +41,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "23e6b769857233c1ac07b6be7442eff4"
-SRC_URI[sha256sum] = "7c664249ff77e443d6ea0e4cf0e587eae918ca3c48d081d1915fe2a1f1bcc5cc"
+SRC_URI[md5sum] = "51b5bbf2ab447e66d15af4883db1c133"
+SRC_URI[sha256sum] = "5e391f3ec45da2954419cab0beaefd8be38895ea5ce33577c3ec14940c4b9572"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -72,7 +72,7 @@ ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config
 ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"
 
 
-DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2"
+DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2 autoconf-archive"
 DEPENDS_append_class-target = " python3-native"
 DEPENDS_append_class-nativesdk = " python3-native"
 
-- 
2.25.1

