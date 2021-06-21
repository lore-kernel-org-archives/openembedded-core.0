Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web08.50324.1624294993637262856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 10:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JFqijaxk;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id b3so1270512plg.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 10:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LsDJTssK1YPdyv9P3zgMPKbvboYVvhTGpw3aCYwZaGk=;
        b=JFqijaxkpIADRee61HH49eW/eKjrKcgpnZE/aa3FQ1Zo0iI5Ic55qN6lJWUHHprUoa
         WI5kV1Rk7PaZ5cmj6RS//eVrgaCoJSuOUntHYZUz1BlLNA3jE5LCVkDjX/YnVppfV4s/
         sBeY9pa6vf/bs9S8hgZIWizflQ1v3Tdg/DlMsbAvDe3Doe9mQqGANHX8r0bt/VPD1vcQ
         SiXIjJqIKCW1m/b05RoYAG4CFju0VppCmN0xZ/fXFkkl8fAazLzi+KI/RO9tYGSBAand
         Ez+DQrB6DG+bwlkIySARuJkxdzeySNWiFNSJ57wqSVihX7DM9a2uxA6j4oZ84wbyFN71
         Ybxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LsDJTssK1YPdyv9P3zgMPKbvboYVvhTGpw3aCYwZaGk=;
        b=bujVanS0rkTXgszHg9QqWBryfgOdobrTrlqHXn+cIjxhYNU0Mfe9l9vu4Lm9Go0COa
         qv+TjVGC/l4qBIVOVEDLozxHKpk1rWMxvpwPJv8Od25bjysVKigobUny8SRKkIlk1SQT
         oqX3nHaDNHEzUH2YeFs/wJjqZvY+lIS+g4SQcYD0cWNQiKGy7x+SaSgt2yvJNPo5twc/
         ARLAtFQVC+Zsp0neqU20mRq0vMkj7n95odQ6j6VZSR3JGLFsASm8IkV4aUorEPSQerii
         HIk3zlIBbsQViXyr2OvqRyjzud3PCmtukfqGtCQan70JSazERN/tAU/YJsHKlN/xBVVk
         NkRw==
X-Gm-Message-State: AOAM533EhDrARXxOQV+UfpqjgNUTilK+6tmj+1LrfLtmnqc4oTcRn1r+
	aldMde1j/dfZK/yS8mQdUbJ5LjLDCbfFWA==
X-Google-Smtp-Source: ABdhPJzC/YZsz/3tXw4A1g0kncHYANjFq2bEFAvlT7XKxhT+6xSEN/ejh+ULCRJQwxQvQEFmY/klTA==
X-Received: by 2002:a17:902:740b:b029:11e:62b3:e452 with SMTP id g11-20020a170902740bb029011e62b3e452mr18865853pll.13.1624294992969;
        Mon, 21 Jun 2021 10:03:12 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:8a50:f0aa:6cd5:a7ef])
        by smtp.gmail.com with ESMTPSA id s125sm6002868pgc.63.2021.06.21.10.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:03:12 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [RFC PATCH 08/10][dunfell] python3: upgrade 3.8.8 -> 3.8.9
Date: Mon, 21 Jun 2021 10:02:55 -0700
Message-Id: <3ceff4ce0e949df3352b957b76a1d173401cc2a7.1624294059.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1624294059.git.timothy.t.orling@intel.com>
References: <cover.1624294059.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 ...le.py-correct-the-test-output-format.patch | 24 ++++++++++---------
 .../{python3_3.8.8.bb => python3_3.8.9.bb}    |  6 ++---
 2 files changed, 16 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.8.8.bb => python3_3.8.9.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index 35b7e0c480a..f9d2eadc119 100644
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
index 0febe6b672d..c6e7e593787 100644
--- a/meta/recipes-devtools/python/python3_3.8.8.bb
+++ b/meta/recipes-devtools/python/python3_3.8.9.bb
@@ -42,8 +42,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "23e6b769857233c1ac07b6be7442eff4"
-SRC_URI[sha256sum] = "7c664249ff77e443d6ea0e4cf0e587eae918ca3c48d081d1915fe2a1f1bcc5cc"
+SRC_URI[md5sum] = "51b5bbf2ab447e66d15af4883db1c133"
+SRC_URI[sha256sum] = "5e391f3ec45da2954419cab0beaefd8be38895ea5ce33577c3ec14940c4b9572"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -73,7 +73,7 @@ ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config
 ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"
 
 
-DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2"
+DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2 autoconf-archive"
 DEPENDS_append_class-target = " python3-native"
 DEPENDS_append_class-nativesdk = " python3-native"
 
-- 
2.30.2

