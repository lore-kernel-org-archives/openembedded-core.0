Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A148DCCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 20:41:14 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.744.1760647265093501273
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 13:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=S3VVH6wE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202510162041000cd67c77d300020788-fnl2z_@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202510162041000cd67c77d300020788
        for <openembedded-core@lists.openembedded.org>;
        Thu, 16 Oct 2025 22:41:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=bh2rNsyWwa+GOUmV0Az+HDJaV7N6Ie1zBOuR6VFiaSg=;
 b=S3VVH6wEsUoVofADktEnKMujzuP2x0XW1tS6acaMOYmlXoWMs8H+FOOfqcuc6CkW6KkHu3
 SPQZwt901N+wafQt3qrjUOpBXMYQygAV6APpgWfysStf0UKC096dMPOF06ahuzBWMd18Zdgk
 w2hIRcwR0CWpYu24pO4u+ODy9Yn2rKGvbExEQcKSJK2RC5CUbvXXIXKsJRUq2PDLbq2YA2Zf
 ewmlJSNXcZg4al1zPAzwsSZ7p9FdVugf/PBwwUa9rHrz5SjFvRxaXZenBlsmpr5aQtX7MIiq
 caTB5qohd3861RNlUz+dI30KDd8lcSnu15GgsMeIOwL0u2e9i02avAQA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] python3: upgrade 3.13.7 -> 3.13.9
Date: Thu, 16 Oct 2025 22:40:58 +0200
Message-Id: <20251016204058.2551043-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 20:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224981

From: Peter Marko <peter.marko@siemens.com>

Drop upstreamed patch and refresh remaining patches.

Release information:
* https://www.python.org/downloads/release/python-3138/
* 3.13.8 is the eighth maintenance release of 3.13, containing around
  200 bugfixes, build improvements and documentation changes since
  3.13.7.

* https://www.python.org/downloads/release/python-3139/
* This Python 3.13.9, a maintenance release for Python 3.13.
* 3.13.9 is an expedited release containing a fix for one specific
  regression in Python 3.13.8

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...r-OpenSSL-3.4-and-add-it-to-multissl.patch |  4 ++--
 ...est_sysconfig-for-posix_user-purelib.patch |  2 +-
 ...DEV-portion-of-test_makedev-when-lin.patch | 24 -------------------
 ...le.py-correct-the-test-output-format.patch |  2 +-
 .../{python3_3.13.7.bb => python3_3.13.9.bb}  |  3 +--
 5 files changed, 5 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-gh-90548-Skip-NODEV-portion-of-test_makedev-when-lin.patch
 rename meta/recipes-devtools/python/{python3_3.13.7.bb => python3_3.13.9.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch b/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
index 075737e7d1a..327124e4e3a 100644
--- a/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
+++ b/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
@@ -1441,8 +1441,8 @@ index eae0e0c..fb06f63 100755
 +++ b/Tools/ssl/multissltests.py
 @@ -51,6 +51,7 @@ OPENSSL_RECENT_VERSIONS = [
      "3.1.7",
-     "3.2.3",
-     "3.3.2",
+     "3.2.6",
+     "3.3.5",
 +    "3.4.0",
  ]
  
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
index ab433d18367..adaca4ff779 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
@@ -25,7 +25,7 @@ diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
 index 1ade492..4e94889 100644
 --- a/Lib/test/test_sysconfig.py
 +++ b/Lib/test/test_sysconfig.py
-@@ -423,7 +423,7 @@ class TestSysConfig(unittest.TestCase):
+@@ -430,7 +430,7 @@ class TestSysConfig(unittest.TestCase):
                  expected = os.path.normpath(global_path.replace(base, user, 1))
                  # bpo-44860: platlib of posix_user doesn't use sys.platlibdir,
                  # whereas posix_prefix does.
diff --git a/meta/recipes-devtools/python/python3/0001-gh-90548-Skip-NODEV-portion-of-test_makedev-when-lin.patch b/meta/recipes-devtools/python/python3/0001-gh-90548-Skip-NODEV-portion-of-test_makedev-when-lin.patch
deleted file mode 100644
index 4390e086d0f..00000000000
--- a/meta/recipes-devtools/python/python3/0001-gh-90548-Skip-NODEV-portion-of-test_makedev-when-lin.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 2dc5e9f4c82888dbe21bd1eadb4b59b0efa9608c Mon Sep 17 00:00:00 2001
-From: Zachary Ware <zach@python.org>
-Date: Sat, 6 Sep 2025 13:20:12 -0500
-Subject: [PATCH] gh-90548: Skip NODEV portion of test_makedev when linked to musl
-
-Upstream-Status: Backport [https://github.com/python/cpython/pull/138593]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Lib/test/test_posix.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Lib/test/test_posix.py b/Lib/test/test_posix.py
-index c9cbe15..bfc1e2b 100644
---- a/Lib/test/test_posix.py
-+++ b/Lib/test/test_posix.py
-@@ -757,7 +757,7 @@ class PosixTester(unittest.TestCase):
-             self.assertRaises((ValueError, OverflowError), posix.makedev, x, minor)
-             self.assertRaises((ValueError, OverflowError), posix.makedev, major, x)
- 
--        if sys.platform == 'linux':
-+        if sys.platform == 'linux' and not support.linked_to_musl():
-             NODEV = -1
-             self.assertEqual(posix.major(NODEV), NODEV)
-             self.assertEqual(posix.minor(NODEV), NODEV)
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index 3fc3a7e8ced..189246911b4 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -34,7 +34,7 @@ diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
 index da4bd79..fd9e67d 100644
 --- a/Lib/test/test_locale.py
 +++ b/Lib/test/test_locale.py
-@@ -502,7 +502,7 @@ class TestRealLocales(unittest.TestCase):
+@@ -501,7 +501,7 @@ class TestRealLocales(unittest.TestCase):
              self.skipTest('test needs Turkish locale')
          loc = locale.getlocale(locale.LC_CTYPE)
          if verbose:
diff --git a/meta/recipes-devtools/python/python3_3.13.7.bb b/meta/recipes-devtools/python/python3_3.13.9.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.13.7.bb
rename to meta/recipes-devtools/python/python3_3.13.9.bb
index c682f1288ec..2e114a6c5bb 100644
--- a/meta/recipes-devtools/python/python3_3.13.7.bb
+++ b/meta/recipes-devtools/python/python3_3.13.9.bb
@@ -30,13 +30,12 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch \
-           file://0001-gh-90548-Skip-NODEV-portion-of-test_makedev-when-lin.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "5462f9099dfd30e238def83c71d91897d8caa5ff6ebc7a50f14d4802cdaaa79a"
+SRC_URI[sha256sum] = "ed5ef34cda36cfa2f3a340f07cac7e7814f91c7f3c411f6d3562323a866c5c66"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"

