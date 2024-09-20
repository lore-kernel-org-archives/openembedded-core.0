Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19430C7884C
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 13:39:40 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.18276.1726839573203289791
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 06:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=R/ruYSLj;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7c6b4222fe3so1324146a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 06:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726839572; x=1727444372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAr2HbDeyEM4l2BySfArraP7OwCCunF1lSvIJLvsDFA=;
        b=R/ruYSLj+gUFw/GoLcc1hTMMns2P9gXtVQaVt4B2wtl0IeaAZRwgC5yMldY1d36ubz
         5PNtTxltIYvVdeBZ/A1+HhRkelNgN+JPy5dXYSA6UpaEjO15NWw0IAAlo40IhT7wmRne
         bK57SL+nTu+KkOBqnpoPCQNk8KtLoQ2UBonvnSvlDY2/dwhIHAqeyypxV2FseNk3BIDC
         j7Rffaan+cy1+l5yqZ8jBi8MzNQdbVwj2Ff3+40IpvxhsuwiuLOSG3Z6rkFaVUXuL8OK
         0FmYwI1uZVr2FvmzWLXAVN+l9n+Q84Y0LxeJ2raaD2497bp3QIgl6PCA+88PEhWLEafY
         fXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726839572; x=1727444372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAr2HbDeyEM4l2BySfArraP7OwCCunF1lSvIJLvsDFA=;
        b=etHVrZaugTXXT+a6h2USCH7BG/r9UO+QcGQ/+OD1mRiFfBdFl6fP+zunrXqrdc736D
         IoDc2FCDoavrdR17z9ek/NH5LfdR8fmBKM2qqaKVr+FXW1WrbLx+9v+8Vk+DrHt80opb
         TR9qZGrHS2kLCrYsUkkoKuoI8m6HoE5pDNjcL82/O2F9JL8TjRMhn2tiHcBXFR60/Hi1
         5shSVbBfod9XerjeOBQ+QPKTRxv4XEjgxLGWCnyjKKb0D3gh/+YhhR0+8ALwnVIKQwBn
         /lPMGhtNIezJC2Suxf10BaV20BtcTUpbSemDJlTmKyA3QSx+b1u28icxbrKpDgVVvyxJ
         PvPQ==
X-Gm-Message-State: AOJu0YyFFh0whv9PnzVwcVdY+B+67WJiDSp/0yU8L/gIrNgmEryRszqk
	ddw4pNN/jghNM9stLiRxpT3r4mdj9GhAP4/2veWakAimvEUlXmw5j0ZwJW1qjF3tuNZKTH6Vf71
	a
X-Google-Smtp-Source: AGHT+IEJkVFN0bC+qEg0Ickq69CidcxAbLaPzYfomxyo+08hMDRrEK/ctl/YiOcNIHPddfbm3GJe6g==
X-Received: by 2002:a05:6a21:38c:b0:1cf:476f:2d10 with SMTP id adf61e73a8af0-1d30cb6fb99mr3801073637.49.1726839572329;
        Fri, 20 Sep 2024 06:39:32 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b97e45sm9811846b3a.164.2024.09.20.06.39.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 06:39:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/16] python3: Upgrade 3.12.5 -> 3.12.6
Date: Fri, 20 Sep 2024 06:39:04 -0700
Message-Id: <6688a8ff2e1cbf6ad8ebd1b89ec6c929caf6a161.1726839438.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726839438.git.steve@sakoman.com>
References: <cover.1726839438.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 13:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204745

From: Peter Marko <peter.marko@siemens.com>

Includes security fixes for CVE-2024-7592, CVE-2024-8088, CVE-2024-6232,
CVE-2023-27043 and other bug fixes.

Removed below patches, as the fix is included in 3.12.6 upgrade:
1. CVE-2024-7592.patch
2. CVE-2024-8088.patch

Release Notes:
https://www.python.org/downloads/release/python-3126/

(From OE-Core rev: aa492b1fd5973c37b8fa2cd17d28199eba46afcc)

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...t_readline-skip-limited-history-test.patch |  19 +--
 .../python/python3/CVE-2024-7592.patch        | 143 ------------------
 .../python/python3/CVE-2024-8088.patch        | 128 ----------------
 .../{python3_3.12.5.bb => python3_3.12.6.bb}  |   4 +-
 4 files changed, 9 insertions(+), 285 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2024-7592.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2024-8088.patch
 rename meta/recipes-devtools/python/{python3_3.12.5.bb => python3_3.12.6.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
index 50a4609f7a..e8d297c721 100644
--- a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -16,11 +16,11 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  Lib/test/test_readline.py | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/Lib/test/test_readline.py b/Lib/test/test_readline.py
-index 91fd7dd13f9..d81f9bf8eed 100644
---- a/Lib/test/test_readline.py
-+++ b/Lib/test/test_readline.py
-@@ -132,6 +132,7 @@ def test_nonascii_history(self):
+Index: Python-3.12.6/Lib/test/test_readline.py
+===================================================================
+--- Python-3.12.6.orig/Lib/test/test_readline.py
++++ Python-3.12.6/Lib/test/test_readline.py
+@@ -133,6 +133,7 @@ class TestHistoryManipulation (unittest.
          self.assertEqual(readline.get_history_item(1), "entrée 1")
          self.assertEqual(readline.get_history_item(2), "entrée 22")
  
@@ -28,14 +28,11 @@ index 91fd7dd13f9..d81f9bf8eed 100644
      def test_write_read_limited_history(self):
          previous_length = readline.get_history_length()
          self.addCleanup(readline.set_history_length, previous_length)
-@@ -349,6 +350,7 @@ def test_history_size(self):
-             self.assertEqual(len(lines), history_size)
-             self.assertEqual(lines[-1].strip(), b"last input")
+@@ -371,6 +372,7 @@ readline.write_history_file(history_file
+         self.assertIn(b"done", output)
+ 
  
 +    @unittest.skip("Skipping problematic test")
      def test_write_read_limited_history(self):
          previous_length = readline.get_history_length()
          self.addCleanup(readline.set_history_length, previous_length)
--- 
-2.39.2
-
diff --git a/meta/recipes-devtools/python/python3/CVE-2024-7592.patch b/meta/recipes-devtools/python/python3/CVE-2024-7592.patch
deleted file mode 100644
index 7a6d63005c..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2024-7592.patch
+++ /dev/null
@@ -1,143 +0,0 @@
-From dcc3eaef98cd94d6cb6cb0f44bd1c903d04f33b1 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Sun, 25 Aug 2024 00:37:11 +0200
-Subject: [PATCH] gh-123067: Fix quadratic complexity in parsing  "-quoted
- cookie values with backslashes (GH-123075) (#123104)
-
-gh-123067: Fix quadratic complexity in parsing "-quoted cookie values with backslashes (GH-123075)
-
-This fixes CVE-2024-7592.
-(cherry picked from commit 44e458357fca05ca0ae2658d62c8c595b048b5ef)
-
-Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
-
-CVE: CVE-2024-7592
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/dcc3eaef98cd94d6cb6cb0f44bd1c903d04f33b1]
-
-Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
----
- Lib/http/cookies.py                           | 34 ++++-------------
- Lib/test/test_http_cookies.py                 | 38 +++++++++++++++++++
- ...-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst |  1 +
- 3 files changed, 47 insertions(+), 26 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst
-
-diff --git a/Lib/http/cookies.py b/Lib/http/cookies.py
-index 35ac2dc..2c1f021 100644
---- a/Lib/http/cookies.py
-+++ b/Lib/http/cookies.py
-@@ -184,8 +184,13 @@ def _quote(str):
-         return '"' + str.translate(_Translator) + '"'
-
-
--_OctalPatt = re.compile(r"\\[0-3][0-7][0-7]")
--_QuotePatt = re.compile(r"[\\].")
-+_unquote_sub = re.compile(r'\\(?:([0-3][0-7][0-7])|(.))').sub
-+
-+def _unquote_replace(m):
-+    if m[1]:
-+        return chr(int(m[1], 8))
-+    else:
-+        return m[2]
-
- def _unquote(str):
-     # If there aren't any doublequotes,
-@@ -205,30 +210,7 @@ def _unquote(str):
-     #    \012 --> \n
-     #    \"   --> "
-     #
--    i = 0
--    n = len(str)
--    res = []
--    while 0 <= i < n:
--        o_match = _OctalPatt.search(str, i)
--        q_match = _QuotePatt.search(str, i)
--        if not o_match and not q_match:              # Neither matched
--            res.append(str[i:])
--            break
--        # else:
--        j = k = -1
--        if o_match:
--            j = o_match.start(0)
--        if q_match:
--            k = q_match.start(0)
--        if q_match and (not o_match or k < j):     # QuotePatt matched
--            res.append(str[i:k])
--            res.append(str[k+1])
--            i = k + 2
--        else:                                      # OctalPatt matched
--            res.append(str[i:j])
--            res.append(chr(int(str[j+1:j+4], 8)))
--            i = j + 4
--    return _nulljoin(res)
-+    return _unquote_sub(_unquote_replace, str)
-
- # The _getdate() routine is used to set the expiration time in the cookie's HTTP
- # header.  By default, _getdate() returns the current time in the appropriate
-diff --git a/Lib/test/test_http_cookies.py b/Lib/test/test_http_cookies.py
-index 925c869..8879902 100644
---- a/Lib/test/test_http_cookies.py
-+++ b/Lib/test/test_http_cookies.py
-@@ -5,6 +5,7 @@ import unittest
- import doctest
- from http import cookies
- import pickle
-+from test import support
-
-
- class CookieTests(unittest.TestCase):
-@@ -58,6 +59,43 @@ class CookieTests(unittest.TestCase):
-             for k, v in sorted(case['dict'].items()):
-                 self.assertEqual(C[k].value, v)
-
-+    def test_unquote(self):
-+        cases = [
-+            (r'a="b=\""', 'b="'),
-+            (r'a="b=\\"', 'b=\\'),
-+            (r'a="b=\="', 'b=='),
-+            (r'a="b=\n"', 'b=n'),
-+            (r'a="b=\042"', 'b="'),
-+            (r'a="b=\134"', 'b=\\'),
-+            (r'a="b=\377"', 'b=\xff'),
-+            (r'a="b=\400"', 'b=400'),
-+            (r'a="b=\42"', 'b=42'),
-+            (r'a="b=\\042"', 'b=\\042'),
-+            (r'a="b=\\134"', 'b=\\134'),
-+            (r'a="b=\\\""', 'b=\\"'),
-+            (r'a="b=\\\042"', 'b=\\"'),
-+            (r'a="b=\134\""', 'b=\\"'),
-+            (r'a="b=\134\042"', 'b=\\"'),
-+        ]
-+        for encoded, decoded in cases:
-+            with self.subTest(encoded):
-+                C = cookies.SimpleCookie()
-+                C.load(encoded)
-+                self.assertEqual(C['a'].value, decoded)
-+
-+    @support.requires_resource('cpu')
-+    def test_unquote_large(self):
-+        n = 10**6
-+        for encoded in r'\\', r'\134':
-+            with self.subTest(encoded):
-+                data = 'a="b=' + encoded*n + ';"'
-+                C = cookies.SimpleCookie()
-+                C.load(data)
-+                value = C['a'].value
-+                self.assertEqual(value[:3], 'b=\\')
-+                self.assertEqual(value[-2:], '\\;')
-+                self.assertEqual(len(value), n + 3)
-+
-     def test_load(self):
-         C = cookies.SimpleCookie()
-         C.load('Customer="WILE_E_COYOTE"; Version=1; Path=/acme')
-diff --git a/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst
-new file mode 100644
-index 0000000..6a23456
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst
-@@ -0,0 +1 @@
-+Fix quadratic complexity in parsing ``"``-quoted cookie values with backslashes by :mod:`http.cookies`.
---
-2.40.0
diff --git a/meta/recipes-devtools/python/python3/CVE-2024-8088.patch b/meta/recipes-devtools/python/python3/CVE-2024-8088.patch
deleted file mode 100644
index 13836f1ccc..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2024-8088.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From dcc5182f27c1500006a1ef78e10613bb45788dea Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 12 Aug 2024 02:35:17 +0200
-Subject: [PATCH] gh-122905: Sanitize names in zipfile.Path. (GH-122906)
- (#122923)
-
-CVE: CVE-2024-8088
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/dcc5182f27c1500006a1ef78e10613bb45788dea]
-
-Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
----
- Lib/test/test_zipfile/_path/test_path.py      | 17 +++++
- Lib/zipfile/_path/__init__.py                 | 64 ++++++++++++++++++-
- ...-08-11-14-08-04.gh-issue-122905.7tDsxA.rst |  1 +
- 3 files changed, 81 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Library/2024-08-11-14-08-04.gh-issue-122905.7tDsxA.rst
-
-diff --git a/Lib/test/test_zipfile/_path/test_path.py b/Lib/test/test_zipfile/_path/test_path.py
-index 06d5aab..90885db 100644
---- a/Lib/test/test_zipfile/_path/test_path.py
-+++ b/Lib/test/test_zipfile/_path/test_path.py
-@@ -577,3 +577,20 @@ class TestPath(unittest.TestCase):
-         zipfile.Path(alpharep)
-         with self.assertRaises(KeyError):
-             alpharep.getinfo('does-not-exist')
-+
-+    def test_malformed_paths(self):
-+        """
-+        Path should handle malformed paths.
-+        """
-+        data = io.BytesIO()
-+        zf = zipfile.ZipFile(data, "w")
-+        zf.writestr("/one-slash.txt", b"content")
-+        zf.writestr("//two-slash.txt", b"content")
-+        zf.writestr("../parent.txt", b"content")
-+        zf.filename = ''
-+        root = zipfile.Path(zf)
-+        assert list(map(str, root.iterdir())) == [
-+            'one-slash.txt',
-+            'two-slash.txt',
-+            'parent.txt',
-+        ]
-diff --git a/Lib/zipfile/_path/__init__.py b/Lib/zipfile/_path/__init__.py
-index 78c4135..42f9fde 100644
---- a/Lib/zipfile/_path/__init__.py
-+++ b/Lib/zipfile/_path/__init__.py
-@@ -83,7 +83,69 @@ class InitializedState:
-         super().__init__(*args, **kwargs)
-
-
--class CompleteDirs(InitializedState, zipfile.ZipFile):
-+class SanitizedNames:
-+    """
-+    ZipFile mix-in to ensure names are sanitized.
-+    """
-+
-+    def namelist(self):
-+        return list(map(self._sanitize, super().namelist()))
-+
-+    @staticmethod
-+    def _sanitize(name):
-+        r"""
-+        Ensure a relative path with posix separators and no dot names.
-+
-+        Modeled after
-+        https://github.com/python/cpython/blob/bcc1be39cb1d04ad9fc0bd1b9193d3972835a57c/Lib/zipfile/__init__.py#L1799-L1813
-+        but provides consistent cross-platform behavior.
-+
-+        >>> san = SanitizedNames._sanitize
-+        >>> san('/foo/bar')
-+        'foo/bar'
-+        >>> san('//foo.txt')
-+        'foo.txt'
-+        >>> san('foo/.././bar.txt')
-+        'foo/bar.txt'
-+        >>> san('foo../.bar.txt')
-+        'foo../.bar.txt'
-+        >>> san('\\foo\\bar.txt')
-+        'foo/bar.txt'
-+        >>> san('D:\\foo.txt')
-+        'D/foo.txt'
-+        >>> san('\\\\server\\share\\file.txt')
-+        'server/share/file.txt'
-+        >>> san('\\\\?\\GLOBALROOT\\Volume3')
-+        '?/GLOBALROOT/Volume3'
-+        >>> san('\\\\.\\PhysicalDrive1\\root')
-+        'PhysicalDrive1/root'
-+
-+        Retain any trailing slash.
-+        >>> san('abc/')
-+        'abc/'
-+
-+        Raises a ValueError if the result is empty.
-+        >>> san('../..')
-+        Traceback (most recent call last):
-+        ...
-+        ValueError: Empty filename
-+        """
-+
-+        def allowed(part):
-+            return part and part not in {'..', '.'}
-+
-+        # Remove the drive letter.
-+        # Don't use ntpath.splitdrive, because that also strips UNC paths
-+        bare = re.sub('^([A-Z]):', r'\1', name, flags=re.IGNORECASE)
-+        clean = bare.replace('\\', '/')
-+        parts = clean.split('/')
-+        joined = '/'.join(filter(allowed, parts))
-+        if not joined:
-+            raise ValueError("Empty filename")
-+        return joined + '/' * name.endswith('/')
-+
-+
-+class CompleteDirs(InitializedState, SanitizedNames, zipfile.ZipFile):
-     """
-     A ZipFile subclass that ensures that implied directories
-     are always included in the namelist.
-diff --git a/Misc/NEWS.d/next/Library/2024-08-11-14-08-04.gh-issue-122905.7tDsxA.rst b/Misc/NEWS.d/next/Library/2024-08-11-14-08-04.gh-issue-122905.7tDsxA.rst
-new file mode 100644
-index 0000000..1be44c9
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2024-08-11-14-08-04.gh-issue-122905.7tDsxA.rst
-@@ -0,0 +1 @@
-+:class:`zipfile.Path` objects now sanitize names from the zipfile.
---
-2.40.0
diff --git a/meta/recipes-devtools/python/python3_3.12.5.bb b/meta/recipes-devtools/python/python3_3.12.6.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.5.bb
rename to meta/recipes-devtools/python/python3_3.12.6.bb
index 92109d58ce..ae69f0e781 100644
--- a/meta/recipes-devtools/python/python3_3.12.5.bb
+++ b/meta/recipes-devtools/python/python3_3.12.6.bb
@@ -35,15 +35,13 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
-           file://CVE-2024-7592.patch \
-           file://CVE-2024-8088.patch \
            "
 
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "fa8a2e12c5e620b09f53e65bcd87550d2e5a1e2e04bf8ba991dcc55113876397"
+SRC_URI[sha256sum] = "1999658298cf2fb837dffed8ff3c033ef0c98ef20cf73c5d5f66bed5ab89697c"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.34.1


