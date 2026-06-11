Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26FD3CDB46F
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:55 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50429.1781195510621012332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SvFil/K8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AUTw6r5x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019eb78690d9-284dda10-3115-4e89-b105-a89b563d888e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195510;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bl1TIJLX8FmZ0CF/Mfu6AqQiv8JtsYYtVLRRqJRjXb0=;
	b=SvFil/K8r0DQ6j5F6F2Gt8efZyE0Y8nwXiQZmz56x6CtmM621fvv1R9PNFC4p+0J
	ZIkU+G9tcPUZpWtiJ60b8nRkIsoVYbhAkgNxHCuolHDAUOWCfi4o//mGVJLrHBRnice
	rLu275RuaX8RC4LDUA7ld0xqgyxQtFphDm4dSfqg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195510;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bl1TIJLX8FmZ0CF/Mfu6AqQiv8JtsYYtVLRRqJRjXb0=;
	b=AUTw6r5xw2pCJnr5Tg27lEpnbXeSSOkrsdbVaX4lXwT/gJqZWXmRtNyUCGbmy6Lb
	0tvy0ms379WRpDp+uLNWY6Hqbf7RCBktwMK+hto7/WxvFYyJN/2Mn4i3DbCs77ugtoV
	mjiGlHkKS/0F4+ccZx7TeewwZ3eSz0HetZWpgHaA=
Content-Type: multipart/mixed; boundary="===============2207885470127259152=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3: upgrading to 3.14.6 FAILED
Message-ID: <0101019eb78690d9-284dda10-3115-4e89-b105-a89b563d888e-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238509

--===============2207885470127259152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3* to *3.14.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-upgrade-3.14.5-3.14.6.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 5a16d18aefb9c562f4059f316dc85bb0b4047028 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 10:31:50 +0000
Subject: [PATCH] python3: upgrade 3.14.5 -> 3.14.6

---
 ...shebang-overflow-on-python-config.py.patch |  4 +-
 ...eadingMock-call-count-race-condition.patch | 37 -------------------
 ...e-stdin-I-O-errors-same-way-as-maste.patch |  4 +-
 ...-use-prefix-value-from-build-configu.patch |  7 +---
 ...-qemu-wrapper-when-gathering-profile.patch |  7 +---
 ...est_sysconfig-for-posix_user-purelib.patch |  4 +-
 .../0001-prefer-valid-entrypoints.patch       |  2 +-
 ...g.py-use-platlibdir-also-for-purelib.patch |  4 +-
 ...le.py-correct-the-test-output-format.patch |  4 +-
 .../python/python3/makerace.patch             |  4 +-
 .../python/python3/valid-dists.patch          |  2 +-
 .../{python3_3.14.5.bb => python3_3.14.6.bb}  |  4 +-
 12 files changed, 20 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch
 rename meta/recipes-devtools/python/{python3_3.14.5.bb => python3_3.14.6.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index c2106f9437..8acc64387f 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -1,4 +1,4 @@
-From 6b111a328c1c57b1580d63894b2b5d337316f6d4 Mon Sep 17 00:00:00 2001
+From edb936317cc73de934ae5ba2f887ce1fc82f1943 Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Tue, 7 Jun 2022 16:16:41 +0200
 Subject: [PATCH] Avoid shebang overflow on python-config.py
@@ -16,7 +16,7 @@ Upstream-Status: Denied [distribution]
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 9ec3a71..f7d5382 100644
+index 654958c..e1ca1cb 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -2829,6 +2829,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
diff --git a/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch b/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch
deleted file mode 100644
index aba3188a59..0000000000
--- a/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 388e023fe1197c1ffed374520ed45df4ac72b8f5 Mon Sep 17 00:00:00 2001
-From: Sai Sneha <saisneha196@gmail.com>
-Date: Thu, 21 May 2026 13:08:07 +0530
-Subject: [PATCH] Fix ThreadingMock call_count race condition
-
-ThreadingMock._increment_mock_call() was not thread-safe.
-Multiple threads calling the mock simultaneously could lose
-increments due to race conditions on call_count and other
-attributes.
-
-Fix by overriding _increment_mock_call in ThreadingMixin
-and wrapping it with the existing _mock_calls_events_lock.
-
-Upstream-Status: Backport [https://github.com/python/cpython/pull/150176]
-
-Signed-off-by: Sai Sneha <saisneha196@gmail.com>
----
- Lib/unittest/mock.py | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Lib/unittest/mock.py b/Lib/unittest/mock.py
-index 16f3699e89..56cdc37942 100644
---- a/Lib/unittest/mock.py
-+++ b/Lib/unittest/mock.py
-@@ -3113,6 +3113,10 @@ def _mock_call(self, *args, **kwargs):
- 
-         return ret_value
- 
-+    def _increment_mock_call(self, /, *args, **kwargs):
-+        with self._mock_calls_events_lock:
-+            super()._increment_mock_call(*args, **kwargs)
-+
-     def wait_until_called(self, *, timeout=_timeout_unset):
-         """Wait until the mock object is called.
- 
--- 
-2.34.1
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index d9072a36f7..21a82f05c7 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
@@ -1,4 +1,4 @@
-From 129ee75863081d9e3418acca3df1e47667f671ad Mon Sep 17 00:00:00 2001
+From 5b7e49c4621b73bcc7d355b58106c9faea5563df Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 16 Sep 2021 16:35:37 +0200
 Subject: [PATCH] Lib/pty.py: handle stdin I/O errors same way as master I/O
@@ -29,7 +29,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/Lib/pty.py b/Lib/pty.py
-index 1d97994..fa8821b 100644
+index 4b25ac3..d6aac07 100644
 --- a/Lib/pty.py
 +++ b/Lib/pty.py
 @@ -149,7 +149,10 @@ def _copy(master_fd, master_read=_read, stdin_read=_read):
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 285580195b..f2db67afaa 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From e3c6e770e73e1329958db0a73883e42b01763ae3 Mon Sep 17 00:00:00 2001
+From 5488d535e818833b34184af88c6f2d430fb9df2b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 17 Nov 2023 14:26:32 +0100
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
@@ -18,7 +18,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
-index 2ecbff222fe..cec54cb23dc 100644
+index 0a8bcc0..a2341f2 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
 @@ -538,12 +538,12 @@ def _init_config_vars():
@@ -39,6 +39,3 @@ index 2ecbff222fe..cec54cb23dc 100644
      _CONFIG_VARS['implementation'] = _get_implementation()
      _CONFIG_VARS['implementation_lower'] = _get_implementation().lower()
      _CONFIG_VARS['abiflags'] = abiflags
--- 
-2.51.0
-
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index e25797f57e..a58ac508e6 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -1,4 +1,4 @@
-From e7a8a7385f561f214054cf95f0a22bfa064eee0b Mon Sep 17 00:00:00 2001
+From 4dfad79ab6c98085511002a2e79ebf5856097e2d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 Jan 2019 12:41:04 +0100
 Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile data
@@ -15,7 +15,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 3bd4495f95b..8e8fc60bc76 100644
+index f86d736..038af96 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -857,8 +857,7 @@ profile-run-stamp:
@@ -28,6 +28,3 @@ index 3bd4495f95b..8e8fc60bc76 100644
  	$(LLVM_PROF_MERGER)
  	# Remove profile generation binary since we are done with it.
  	$(MAKE) clean-retain-profile
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
index 6a62c6dc5b..3a849acb2c 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
@@ -1,4 +1,4 @@
-From 5bf5aa6eae1fa3eed66893e51a1858ab481426b4 Mon Sep 17 00:00:00 2001
+From a236fc8a75e6b8c91413d6b69a06ff9d79194ef8 Mon Sep 17 00:00:00 2001
 From: Wentao Zhang <wentao.zhang@windriver.com>
 Date: Mon, 20 Mar 2023 13:39:52 +0800
 Subject: [PATCH] Update test_sysconfig for posix_user purelib
@@ -22,7 +22,7 @@ Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
-index 1ade492..4e94889 100644
+index 1fe4b68..383142a 100644
 --- a/Lib/test/test_sysconfig.py
 +++ b/Lib/test/test_sysconfig.py
 @@ -434,7 +434,7 @@ class TestSysConfig(unittest.TestCase, VirtualEnvironmentMixin):
diff --git a/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.patch b/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.patch
index 1250dc9ff0..ec7f82bfd6 100644
--- a/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.patch
+++ b/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.patch
@@ -1,4 +1,4 @@
-From ef33ac27e3ac1b9cb159d7eec0ad1af120cd9dc1 Mon Sep 17 00:00:00 2001
+From 33b757a33f84a6846e20306900c7fa882e15311d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 17 Apr 2026 16:53:42 +0100
 Subject: [PATCH] prefer valid entrypoints
diff --git a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
index b9c68a98d7..9ab46bdb64 100644
--- a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
@@ -1,4 +1,4 @@
-From bbcb17dc1ed283f41c8cd94d39f70898f0c45583 Mon Sep 17 00:00:00 2001
+From 1ac7df742bd22145787714bfcbb5f252499d74ca Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 12 Sep 2021 21:44:36 +0200
 Subject: [PATCH] sysconfig.py: use platlibdir also for purelib
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
-index 80aef34..f8e1c7d 100644
+index faf8273..0a8bcc0 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
 @@ -29,7 +29,7 @@ _INSTALL_SCHEMES = {
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index 201271b0c0..44703b9bd8 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -1,4 +1,4 @@
-From c1f3cf625c0f011060ddaa2a4096f6aa13dd1ee6 Mon Sep 17 00:00:00 2001
+From 1c97eb3be932ae98b1052f6c1ca42664393de0bb Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 5 Aug 2019 15:57:39 +0800
 Subject: [PATCH] test_locale.py: correct the test output format
@@ -31,7 +31,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
-index da4bd79..fd9e67d 100644
+index 8e49aa8..c6f43f4 100644
 --- a/Lib/test/test_locale.py
 +++ b/Lib/test/test_locale.py
 @@ -500,7 +500,7 @@ class TestRealLocales(unittest.TestCase):
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index b29ea56cc3..5f5c9299ef 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From 2b458b4e1bcd57e3f135d3f0e715f64b98b27906 Mon Sep 17 00:00:00 2001
+From 97374afa439a0d5adf9dfafb7297b1bb18227c6e Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
@@ -17,7 +17,7 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index be1b9ea..9ec3a71 100644
+index 038af96..654958c 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -2735,7 +2735,7 @@ COMPILEALL_OPTS=-j0
diff --git a/meta/recipes-devtools/python/python3/valid-dists.patch b/meta/recipes-devtools/python/python3/valid-dists.patch
index 38b6ebc5cb..b023c6e5a4 100644
--- a/meta/recipes-devtools/python/python3/valid-dists.patch
+++ b/meta/recipes-devtools/python/python3/valid-dists.patch
@@ -1,4 +1,4 @@
-From a65c29adc027b3615154cab73aaedd58a6aa23da Mon Sep 17 00:00:00 2001
+From 313ae51215e4539c9268b1977ba31077990209bc Mon Sep 17 00:00:00 2001
 From: "Jason R. Coombs" <jaraco@jaraco.com>
 Date: Tue, 23 Jul 2024 08:36:16 -0400
 Subject: [PATCH] Prioritize valid dists to invalid dists when retrieving by
diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipes-devtools/python/python3_3.14.6.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.14.5.bb
rename to meta/recipes-devtools/python/python3_3.14.6.bb
index 02bda8ddcf..43d9272bde 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.6.bb
@@ -22,13 +22,13 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
            file://0001-prefer-valid-entrypoints.patch \
-           file://0001-Fix-ThreadingMock-call-count-race-condition.patch \
+           file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "7e32597b99e5d9a39abed35de4693fa169df3e5850d4c334337ffd6a19a36db6"
+SRC_URI[sha256sum] = "143b1dddefaec3bd2e21e3b839b34a2b7fb9842272883c576420d605e9f30c63"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.47.1


--===============2207885470127259152==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-upgrade-3.14.5-3.14.6.patch"

RnJvbSA1YTE2ZDE4YWVmYjljNTYyZjQwNTlmMzE2ZGM4NWJiMGI0MDQ3MDI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTA6MzE6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zOiB1cGdyYWRlIDMuMTQuNSAtPiAzLjE0LjYKCi0tLQogLi4uc2hlYmFuZy1vdmVyZmxv
dy1vbi1weXRob24tY29uZmlnLnB5LnBhdGNoIHwgIDQgKy0KIC4uLmVhZGluZ01vY2stY2FsbC1j
b3VudC1yYWNlLWNvbmRpdGlvbi5wYXRjaCB8IDM3IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLmUt
c3RkaW4tSS1PLWVycm9ycy1zYW1lLXdheS1hcy1tYXN0ZS5wYXRjaCB8ICA0ICstCiAuLi4tdXNl
LXByZWZpeC12YWx1ZS1mcm9tLWJ1aWxkLWNvbmZpZ3UucGF0Y2ggfCAgNyArLS0tCiAuLi4tcWVt
dS13cmFwcGVyLXdoZW4tZ2F0aGVyaW5nLXByb2ZpbGUucGF0Y2ggfCAgNyArLS0tCiAuLi5lc3Rf
c3lzY29uZmlnLWZvci1wb3NpeF91c2VyLXB1cmVsaWIucGF0Y2ggfCAgNCArLQogLi4uLzAwMDEt
cHJlZmVyLXZhbGlkLWVudHJ5cG9pbnRzLnBhdGNoICAgICAgIHwgIDIgKy0KIC4uLmcucHktdXNl
LXBsYXRsaWJkaXItYWxzby1mb3ItcHVyZWxpYi5wYXRjaCB8ICA0ICstCiAuLi5sZS5weS1jb3Jy
ZWN0LXRoZS10ZXN0LW91dHB1dC1mb3JtYXQucGF0Y2ggfCAgNCArLQogLi4uL3B5dGhvbi9weXRo
b24zL21ha2VyYWNlLnBhdGNoICAgICAgICAgICAgIHwgIDQgKy0KIC4uLi9weXRob24vcHl0aG9u
My92YWxpZC1kaXN0cy5wYXRjaCAgICAgICAgICB8ICAyICstCiAuLi4ve3B5dGhvbjNfMy4xNC41
LmJiID0+IHB5dGhvbjNfMy4xNC42LmJifSAgfCAgNCArLQogMTIgZmlsZXMgY2hhbmdlZCwgMjAg
aW5zZXJ0aW9ucygrKSwgNjMgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtRml4LVRocmVhZGluZ01vY2stY2Fs
bC1jb3VudC1yYWNlLWNvbmRpdGlvbi5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24ve3B5dGhvbjNfMy4xNC41LmJiID0+IHB5dGhvbjNfMy4xNC42LmJifSAoOTklKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLUF2
b2lkLXNoZWJhbmctb3ZlcmZsb3ctb24tcHl0aG9uLWNvbmZpZy5weS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLUF2b2lkLXNoZWJhbmctb3ZlcmZsb3ct
b24tcHl0aG9uLWNvbmZpZy5weS5wYXRjaAppbmRleCBjMjEwNmY5NDM3Li44YWNjNjQzODdmIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1Bdm9p
ZC1zaGViYW5nLW92ZXJmbG93LW9uLXB5dGhvbi1jb25maWcucHkucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtQXZvaWQtc2hlYmFuZy1vdmVyZmxv
dy1vbi1weXRob24tY29uZmlnLnB5LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2YjExMWEz
MjhjMWM1N2IxNTgwZDYzODk0YjJiNWQzMzczMTZmNmQ0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBlZGI5MzYzMTdjYzczZGU5MzRhZTViYTJmODg3Y2UxZmM4MmYxOTQzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGF1bG8gTmV2ZXMgPHB0c25ldmVzQGdtYWlsLmNvbT4K
IERhdGU6IFR1ZSwgNyBKdW4gMjAyMiAxNjoxNjo0MSArMDIwMAogU3ViamVjdDogW1BBVENIXSBB
dm9pZCBzaGViYW5nIG92ZXJmbG93IG9uIHB5dGhvbi1jb25maWcucHkKQEAgLTE2LDcgKzE2LDcg
QEAgVXBzdHJlYW0tU3RhdHVzOiBEZW5pZWQgW2Rpc3RyaWJ1dGlvbl0KICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5wcmUuaW4gYi9NYWtl
ZmlsZS5wcmUuaW4KLWluZGV4IDllYzNhNzEuLmY3ZDUzODIgMTAwNjQ0CitpbmRleCA2NTQ5NThj
Li5lMWNhMWNiIDEwMDY0NAogLS0tIGEvTWFrZWZpbGUucHJlLmluCiArKysgYi9NYWtlZmlsZS5w
cmUuaW4KIEBAIC0yODI5LDYgKzI4MjksOCBAQCBweXRob24tY29uZmlnOiAkKHNyY2RpcikvTWlz
Yy9weXRob24tY29uZmlnLmluIE1pc2MvcHl0aG9uLWNvbmZpZy5zaApkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtRml4LVRocmVhZGluZ01vY2st
Y2FsbC1jb3VudC1yYWNlLWNvbmRpdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy8wMDAxLUZpeC1UaHJlYWRpbmdNb2NrLWNhbGwtY291bnQtcmFjZS1jb25k
aXRpb24ucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGFiYTMxODhhNTkuLjAw
MDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEt
Rml4LVRocmVhZGluZ01vY2stY2FsbC1jb3VudC1yYWNlLWNvbmRpdGlvbi5wYXRjaAorKysgL2Rl
di9udWxsCkBAIC0xLDM3ICswLDAgQEAKLUZyb20gMzg4ZTAyM2ZlMTE5N2MxZmZlZDM3NDUyMGVk
NDVkZjRhYzcyYjhmNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFNhaSBTbmVoYSA8
c2Fpc25laGExOTZAZ21haWwuY29tPgotRGF0ZTogVGh1LCAyMSBNYXkgMjAyNiAxMzowODowNyAr
MDUzMAotU3ViamVjdDogW1BBVENIXSBGaXggVGhyZWFkaW5nTW9jayBjYWxsX2NvdW50IHJhY2Ug
Y29uZGl0aW9uCi0KLVRocmVhZGluZ01vY2suX2luY3JlbWVudF9tb2NrX2NhbGwoKSB3YXMgbm90
IHRocmVhZC1zYWZlLgotTXVsdGlwbGUgdGhyZWFkcyBjYWxsaW5nIHRoZSBtb2NrIHNpbXVsdGFu
ZW91c2x5IGNvdWxkIGxvc2UKLWluY3JlbWVudHMgZHVlIHRvIHJhY2UgY29uZGl0aW9ucyBvbiBj
YWxsX2NvdW50IGFuZCBvdGhlcgotYXR0cmlidXRlcy4KLQotRml4IGJ5IG92ZXJyaWRpbmcgX2lu
Y3JlbWVudF9tb2NrX2NhbGwgaW4gVGhyZWFkaW5nTWl4aW4KLWFuZCB3cmFwcGluZyBpdCB3aXRo
IHRoZSBleGlzdGluZyBfbW9ja19jYWxsc19ldmVudHNfbG9jay4KLQotVXBzdHJlYW0tU3RhdHVz
OiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL3B1bGwvMTUwMTc2
XQotCi1TaWduZWQtb2ZmLWJ5OiBTYWkgU25laGEgPHNhaXNuZWhhMTk2QGdtYWlsLmNvbT4KLS0t
LQotIExpYi91bml0dGVzdC9tb2NrLnB5IHwgNCArKysrCi0gMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvTGliL3VuaXR0ZXN0L21vY2sucHkgYi9MaWIvdW5p
dHRlc3QvbW9jay5weQotaW5kZXggMTZmMzY5OWU4OS4uNTZjZGMzNzk0MiAxMDA2NDQKLS0tLSBh
L0xpYi91bml0dGVzdC9tb2NrLnB5Ci0rKysgYi9MaWIvdW5pdHRlc3QvbW9jay5weQotQEAgLTMx
MTMsNiArMzExMywxMCBAQCBkZWYgX21vY2tfY2FsbChzZWxmLCAqYXJncywgKiprd2FyZ3MpOgot
IAotICAgICAgICAgcmV0dXJuIHJldF92YWx1ZQotIAotKyAgICBkZWYgX2luY3JlbWVudF9tb2Nr
X2NhbGwoc2VsZiwgLywgKmFyZ3MsICoqa3dhcmdzKToKLSsgICAgICAgIHdpdGggc2VsZi5fbW9j
a19jYWxsc19ldmVudHNfbG9jazoKLSsgICAgICAgICAgICBzdXBlcigpLl9pbmNyZW1lbnRfbW9j
a19jYWxsKCphcmdzLCAqKmt3YXJncykKLSsKLSAgICAgZGVmIHdhaXRfdW50aWxfY2FsbGVkKHNl
bGYsICosIHRpbWVvdXQ9X3RpbWVvdXRfdW5zZXQpOgotICAgICAgICAgIiIiV2FpdCB1bnRpbCB0
aGUgbW9jayBvYmplY3QgaXMgY2FsbGVkLgotIAotLS0gCi0yLjM0LjEKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLUxpYi1wdHkucHktaGFuZGxl
LXN0ZGluLUktTy1lcnJvcnMtc2FtZS13YXktYXMtbWFzdGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1MaWItcHR5LnB5LWhhbmRsZS1zdGRpbi1JLU8t
ZXJyb3JzLXNhbWUtd2F5LWFzLW1hc3RlLnBhdGNoCmluZGV4IGQ5MDcyYTM2ZjcuLjIxYTgyZjA1
YzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAx
LUxpYi1wdHkucHktaGFuZGxlLXN0ZGluLUktTy1lcnJvcnMtc2FtZS13YXktYXMtbWFzdGUucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtTGliLXB0
eS5weS1oYW5kbGUtc3RkaW4tSS1PLWVycm9ycy1zYW1lLXdheS1hcy1tYXN0ZS5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gMTI5ZWU3NTg2MzA4MWQ5ZTM0MThhY2NhM2RmMWU0NzY2N2Y2NzFh
ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNWI3ZTQ5YzQ2MjFiNzNiY2M3ZDM1NWI1
ODEwNmM5ZmFlYTU1NjNkZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRl
ciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBUaHUsIDE2IFNlcCAyMDIxIDE2
OjM1OjM3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIExpYi9wdHkucHk6IGhhbmRsZSBzdGRpbiBJ
L08gZXJyb3JzIHNhbWUgd2F5IGFzIG1hc3RlciBJL08KQEAgLTI5LDcgKzI5LDcgQEAgU2lnbmVk
LW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9M
aWIvcHR5LnB5IGIvTGliL3B0eS5weQotaW5kZXggMWQ5Nzk5NC4uZmE4ODIxYiAxMDA2NDQKK2lu
ZGV4IDRiMjVhYzMuLmQ2YWFjMDcgMTAwNjQ0CiAtLS0gYS9MaWIvcHR5LnB5CiArKysgYi9MaWIv
cHR5LnB5CiBAQCAtMTQ5LDcgKzE0OSwxMCBAQCBkZWYgX2NvcHkobWFzdGVyX2ZkLCBtYXN0ZXJf
cmVhZD1fcmVhZCwgc3RkaW5fcmVhZD1fcmVhZCk6CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1MaWItc3lzY29uZmlnLnB5LXVzZS1wcmVmaXgt
dmFsdWUtZnJvbS1idWlsZC1jb25maWd1LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLzAwMDEtTGliLXN5c2NvbmZpZy5weS11c2UtcHJlZml4LXZhbHVlLWZyb20t
YnVpbGQtY29uZmlndS5wYXRjaAppbmRleCAyODU1ODAxOTViLi5mMmRiNjdhZmFhIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1MaWItc3lzY29u
ZmlnLnB5LXVzZS1wcmVmaXgtdmFsdWUtZnJvbS1idWlsZC1jb25maWd1LnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLUxpYi1zeXNjb25maWcucHkt
dXNlLXByZWZpeC12YWx1ZS1mcm9tLWJ1aWxkLWNvbmZpZ3UucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIGUzYzZlNzcwZTczZTEzMjk5NThkYjBhNzM4ODNlNDJiMDE3NjNhZTMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDU0ODhkNTM1ZTgxODgzM2IzNDE4NGFmODhjNmYyZDQzMGZi
OWRmMmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogRnJpLCAxNyBOb3YgMjAyMyAxNDoyNjozMiArMDEw
MAogU3ViamVjdDogW1BBVENIXSBMaWIvc3lzY29uZmlnLnB5OiB1c2UgcHJlZml4IHZhbHVlIGZy
b20gYnVpbGQgY29uZmlndXJhdGlvbgpAQCAtMTgsNyArMTgsNyBAQCBTaWduZWQtb2ZmLWJ5OiBU
cmV2b3IgR2FtYmxpbiA8dGdhbWJsaW5AYmF5bGlicmUuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9MaWIvc3lzY29u
ZmlnL19faW5pdF9fLnB5IGIvTGliL3N5c2NvbmZpZy9fX2luaXRfXy5weQotaW5kZXggMmVjYmZm
MjIyZmUuLmNlYzU0Y2IyM2RjIDEwMDY0NAoraW5kZXggMGE4YmNjMC4uYTIzNDFmMiAxMDA2NDQK
IC0tLSBhL0xpYi9zeXNjb25maWcvX19pbml0X18ucHkKICsrKyBiL0xpYi9zeXNjb25maWcvX19p
bml0X18ucHkKIEBAIC01MzgsMTIgKzUzOCwxMiBAQCBkZWYgX2luaXRfY29uZmlnX3ZhcnMoKToK
QEAgLTM5LDYgKzM5LDMgQEAgaW5kZXggMmVjYmZmMjIyZmUuLmNlYzU0Y2IyM2RjIDEwMDY0NAog
ICAgICBfQ09ORklHX1ZBUlNbJ2ltcGxlbWVudGF0aW9uJ10gPSBfZ2V0X2ltcGxlbWVudGF0aW9u
KCkKICAgICAgX0NPTkZJR19WQVJTWydpbXBsZW1lbnRhdGlvbl9sb3dlciddID0gX2dldF9pbXBs
ZW1lbnRhdGlvbigpLmxvd2VyKCkKICAgICAgX0NPTkZJR19WQVJTWydhYmlmbGFncyddID0gYWJp
ZmxhZ3MKLS0tIAotMi41MS4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy8wMDAxLU1ha2VmaWxlLnByZS11c2UtcWVtdS13cmFwcGVyLXdoZW4tZ2F0
aGVyaW5nLXByb2ZpbGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMvMDAwMS1NYWtlZmlsZS5wcmUtdXNlLXFlbXUtd3JhcHBlci13aGVuLWdhdGhlcmluZy1wcm9m
aWxlLnBhdGNoCmluZGV4IGUyNTc5N2Y1N2UuLmE1OGFjNTA4ZTYgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLU1ha2VmaWxlLnByZS11c2UtcWVt
dS13cmFwcGVyLXdoZW4tZ2F0aGVyaW5nLXByb2ZpbGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtTWFrZWZpbGUucHJlLXVzZS1xZW11LXdyYXBw
ZXItd2hlbi1nYXRoZXJpbmctcHJvZmlsZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTdh
OGE3Mzg1ZjU2MWYyMTQwNTRjZjk1ZjBhMjJiZmEwNjRlZWUwYiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gNGRmYWQ3OWFiNmM5ODA4NTUxMTAwMmEyZTc5ZWJmNTg1NjA5N2UyZCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogRGF0ZTogV2VkLCAzMCBKYW4gMjAxOSAxMjo0MTowNCArMDEwMAogU3Vi
amVjdDogW1BBVENIXSBNYWtlZmlsZS5wcmU6IHVzZSBxZW11IHdyYXBwZXIgd2hlbiBnYXRoZXJp
bmcgcHJvZmlsZSBkYXRhCkBAIC0xNSw3ICsxNSw3IEBAIFNpZ25lZC1vZmYtYnk6IFRyZXZvciBH
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUucHJlLmluIGIv
TWFrZWZpbGUucHJlLmluCi1pbmRleCAzYmQ0NDk1Zjk1Yi4uOGU4ZmM2MGJjNzYgMTAwNjQ0Citp
bmRleCBmODZkNzM2Li4wMzhhZjk2IDEwMDY0NAogLS0tIGEvTWFrZWZpbGUucHJlLmluCiArKysg
Yi9NYWtlZmlsZS5wcmUuaW4KIEBAIC04NTcsOCArODU3LDcgQEAgcHJvZmlsZS1ydW4tc3RhbXA6
CkBAIC0yOCw2ICsyOCwzIEBAIGluZGV4IDNiZDQ0OTVmOTViLi44ZThmYzYwYmM3NiAxMDA2NDQK
ICAJJChMTFZNX1BST0ZfTUVSR0VSKQogIAkjIFJlbW92ZSBwcm9maWxlIGdlbmVyYXRpb24gYmlu
YXJ5IHNpbmNlIHdlIGFyZSBkb25lIHdpdGggaXQuCiAgCSQoTUFLRSkgY2xlYW4tcmV0YWluLXBy
b2ZpbGUKLS0tIAotMi4zOS41Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy8wMDAxLVVwZGF0ZS10ZXN0X3N5c2NvbmZpZy1mb3ItcG9zaXhfdXNlci1w
dXJlbGliLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEt
VXBkYXRlLXRlc3Rfc3lzY29uZmlnLWZvci1wb3NpeF91c2VyLXB1cmVsaWIucGF0Y2gKaW5kZXgg
NmE2MmM2ZGM1Yi4uM2E4NDlhY2IyYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLzAwMDEtVXBkYXRlLXRlc3Rfc3lzY29uZmlnLWZvci1wb3NpeF91c2Vy
LXB1cmVsaWIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LzAwMDEtVXBkYXRlLXRlc3Rfc3lzY29uZmlnLWZvci1wb3NpeF91c2VyLXB1cmVsaWIucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDViZjVhYTZlYWUxZmEzZWVkNjY4OTNlNTFhMTg1OGFiNDgx
NDI2YjQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGEyMzZmYzhhNzVlNmI4YzkxNDEz
ZDZiNjlhMDZmZjlkNzkxOTRlZjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBXZW50
YW8gWmhhbmcgPHdlbnRhby56aGFuZ0B3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCAyMCBNYXIg
MjAyMyAxMzozOTo1MiArMDgwMAogU3ViamVjdDogW1BBVENIXSBVcGRhdGUgdGVzdF9zeXNjb25m
aWcgZm9yIHBvc2l4X3VzZXIgcHVyZWxpYgpAQCAtMjIsNyArMjIsNyBAQCBTaWduZWQtb2ZmLWJ5
OiBXZW50YW8gWmhhbmcgPHdlbnRhby56aGFuZ0B3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvTGliL3Rl
c3QvdGVzdF9zeXNjb25maWcucHkgYi9MaWIvdGVzdC90ZXN0X3N5c2NvbmZpZy5weQotaW5kZXgg
MWFkZTQ5Mi4uNGU5NDg4OSAxMDA2NDQKK2luZGV4IDFmZTRiNjguLjM4MzE0MmEgMTAwNjQ0CiAt
LS0gYS9MaWIvdGVzdC90ZXN0X3N5c2NvbmZpZy5weQogKysrIGIvTGliL3Rlc3QvdGVzdF9zeXNj
b25maWcucHkKIEBAIC00MzQsNyArNDM0LDcgQEAgY2xhc3MgVGVzdFN5c0NvbmZpZyh1bml0dGVz
dC5UZXN0Q2FzZSwgVmlydHVhbEVudmlyb25tZW50TWl4aW4pOgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtcHJlZmVyLXZhbGlkLWVudHJ5cG9p
bnRzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtcHJl
ZmVyLXZhbGlkLWVudHJ5cG9pbnRzLnBhdGNoCmluZGV4IDEyNTBkYzlmZjAuLmVjN2Y4MmJmZDYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLXBy
ZWZlci12YWxpZC1lbnRyeXBvaW50cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMvMDAwMS1wcmVmZXItdmFsaWQtZW50cnlwb2ludHMucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIGVmMzNhYzI3ZTNhYzFiOWNiMTU5ZDdlZWMwYWQxYWYxMjBjZDlkYzEg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDMzYjc1N2EzM2Y4NGE2ODQ2ZTIwMzA2OTAw
YzdmYTg4MmUxNTMxMWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRv
biA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IEZyaSwgMTcgQXByIDIwMjYgMTY6NTM6NDIg
KzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gcHJlZmVyIHZhbGlkIGVudHJ5cG9pbnRzCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1zeXNjb25maWcu
cHktdXNlLXBsYXRsaWJkaXItYWxzby1mb3ItcHVyZWxpYi5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLXN5c2NvbmZpZy5weS11c2UtcGxhdGxpYmRpci1h
bHNvLWZvci1wdXJlbGliLnBhdGNoCmluZGV4IGI5YzY4YTk4ZDcuLjlhYjQ2YmRiNjQgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLXN5c2NvbmZp
Zy5weS11c2UtcGxhdGxpYmRpci1hbHNvLWZvci1wdXJlbGliLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLXN5c2NvbmZpZy5weS11c2UtcGxhdGxp
YmRpci1hbHNvLWZvci1wdXJlbGliLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiYmNiMTdk
YzFlZDI4M2Y0MWM4Y2Q5NGQzOWY3MDg5OGYwYzQ1NTgzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSAxYWM3ZGY3NDJiZDIyMTQ1Nzg3NzE0YmZjYmI1ZjI1MjQ5OWQ3NGNhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25p
eC5kZT4KIERhdGU6IFN1biwgMTIgU2VwIDIwMjEgMjE6NDQ6MzYgKzAyMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gc3lzY29uZmlnLnB5OiB1c2UgcGxhdGxpYmRpciBhbHNvIGZvciBwdXJlbGliCkBAIC0x
Myw3ICsxMyw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0
cm9uaXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiAKIGRpZmYgLS1naXQgYS9MaWIvc3lzY29uZmlnL19faW5pdF9fLnB5IGIvTGliL3N5c2NvbmZp
Zy9fX2luaXRfXy5weQotaW5kZXggODBhZWYzNC4uZjhlMWM3ZCAxMDA2NDQKK2luZGV4IGZhZjgy
NzMuLjBhOGJjYzAgMTAwNjQ0CiAtLS0gYS9MaWIvc3lzY29uZmlnL19faW5pdF9fLnB5CiArKysg
Yi9MaWIvc3lzY29uZmlnL19faW5pdF9fLnB5CiBAQCAtMjksNyArMjksNyBAQCBfSU5TVEFMTF9T
Q0hFTUVTID0gewpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLzAwMDEtdGVzdF9sb2NhbGUucHktY29ycmVjdC10aGUtdGVzdC1vdXRwdXQtZm9ybWF0LnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtdGVzdF9sb2Nh
bGUucHktY29ycmVjdC10aGUtdGVzdC1vdXRwdXQtZm9ybWF0LnBhdGNoCmluZGV4IDIwMTI3MWIw
YzAuLjQ0NzAzYjliZDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy8wMDAxLXRlc3RfbG9jYWxlLnB5LWNvcnJlY3QtdGhlLXRlc3Qtb3V0cHV0LWZvcm1h
dC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS10
ZXN0X2xvY2FsZS5weS1jb3JyZWN0LXRoZS10ZXN0LW91dHB1dC1mb3JtYXQucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIGMxZjNjZjYyNWMwZjAxMTA2MGRkYWEyYTQwOTZmNmFhMTNkZDFlZTYg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDFjOTdlYjNiZTkzMmFlOThiMTA1MmY2YzFj
YTQyNjY0MzkzZGUwYmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaW5nbGkgWXUg
PG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCA1IEF1ZyAyMDE5IDE1OjU3OjM5
ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RfbG9jYWxlLnB5OiBjb3JyZWN0IHRoZSB0ZXN0
IG91dHB1dCBmb3JtYXQKQEAgLTMxLDcgKzMxLDcgQEAgU2lnbmVkLW9mZi1ieTogTWluZ2xpIFl1
IDxtaW5nbGkueXVAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL0xpYi90ZXN0L3Rlc3RfbG9jYWxlLnB5
IGIvTGliL3Rlc3QvdGVzdF9sb2NhbGUucHkKLWluZGV4IGRhNGJkNzkuLmZkOWU2N2QgMTAwNjQ0
CitpbmRleCA4ZTQ5YWE4Li5jNmY0M2Y0IDEwMDY0NAogLS0tIGEvTGliL3Rlc3QvdGVzdF9sb2Nh
bGUucHkKICsrKyBiL0xpYi90ZXN0L3Rlc3RfbG9jYWxlLnB5CiBAQCAtNTAwLDcgKzUwMCw3IEBA
IGNsYXNzIFRlc3RSZWFsTG9jYWxlcyh1bml0dGVzdC5UZXN0Q2FzZSk6CmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvbWFrZXJhY2UucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvbWFrZXJhY2UucGF0Y2gKaW5kZXggYjI5
ZWE1NmNjMy4uNWY1YzkyOTllZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zL21ha2VyYWNlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy9tYWtlcmFjZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMmI0NThi
NGUxYmNkNTdlM2YxMzVkM2YwZTcxNWY2NGI5OGIyNzkwNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gOTczNzRhZmE0MzlhMGQ1YWRmOWRmYWZiNzI5N2IxYmIxODIyN2M2ZSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogVHVlLCAxMyBKdWwgMjAyMSAyMzoxOToyOSArMDEw
MAogU3ViamVjdDogW1BBVENIXSBweXRob24zOiBGaXggbWFrZSByYWNlCkBAIC0xNyw3ICsxNyw3
IEBAIFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZv
dW5kYXRpb24ub3JnPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUucHJlLmluIGIvTWFrZWZpbGUucHJlLmluCi1p
bmRleCBiZTFiOWVhLi45ZWMzYTcxIDEwMDY0NAoraW5kZXggMDM4YWY5Ni4uNjU0OTU4YyAxMDA2
NDQKIC0tLSBhL01ha2VmaWxlLnByZS5pbgogKysrIGIvTWFrZWZpbGUucHJlLmluCiBAQCAtMjcz
NSw3ICsyNzM1LDcgQEAgQ09NUElMRUFMTF9PUFRTPS1qMApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zL3ZhbGlkLWRpc3RzLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zL3ZhbGlkLWRpc3RzLnBhdGNoCmluZGV4IDM4YjZl
YmM1Y2IuLmIwMjNjNmU1YTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy92YWxpZC1kaXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMvdmFsaWQtZGlzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGE2
NWMyOWFkYzAyN2IzNjE1MTU0Y2FiNzNhYWVkZDU4YTZhYTIzZGEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDMxM2FlNTEyMTVlNDUzOWM5MjY4YjE5NzdiYTMxMDc3OTkwMjA5YmMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiAiSmFzb24gUi4gQ29vbWJzIiA8amFyYWNvQGph
cmFjby5jb20+CiBEYXRlOiBUdWUsIDIzIEp1bCAyMDI0IDA4OjM2OjE2IC0wNDAwCiBTdWJqZWN0
OiBbUEFUQ0hdIFByaW9yaXRpemUgdmFsaWQgZGlzdHMgdG8gaW52YWxpZCBkaXN0cyB3aGVuIHJl
dHJpZXZpbmcgYnkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uM18zLjE0LjUuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfMy4x
NC42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uM18zLjE0LjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uM18zLjE0LjYuYmIKaW5kZXggMDJiZGE4ZGRjZi4uNDNkOTI3MmJk
ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zXzMuMTQu
NS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfMy4xNC42LmJi
CkBAIC0yMiwxMyArMjIsMTMgQEAgU1JDX1VSSSA9ICJodHRwOi8vd3d3LnB5dGhvbi5vcmcvZnRw
L3B5dGhvbi8ke1BWfS9QeXRob24tJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAw
MDEtQXZvaWQtc2hlYmFuZy1vdmVyZmxvdy1vbi1weXRob24tY29uZmlnLnB5LnBhdGNoIFwKICAg
ICAgICAgICAgZmlsZTovLzAwMDEtVXBkYXRlLXRlc3Rfc3lzY29uZmlnLWZvci1wb3NpeF91c2Vy
LXB1cmVsaWIucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1wcmVmZXItdmFsaWQtZW50
cnlwb2ludHMucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1GaXgtVGhyZWFkaW5nTW9j
ay1jYWxsLWNvdW50LXJhY2UtY29uZGl0aW9uLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAw
MDEtTGliLXN5c2NvbmZpZy5weS11c2UtcHJlZml4LXZhbHVlLWZyb20tYnVpbGQtY29uZmlndS5w
YXRjaCBcCiAgICAgICAgICAgICIKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMS1MaWItc3lzY29uZmlnLnB5LXVzZS1wcmVmaXgtdmFsdWUt
ZnJvbS1idWlsZC1jb25maWd1LnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiN2UzMjU5N2I5OWU1ZDlhMzlhYmVkMzVkZTQ2OTNmYTE2OWRmM2U1ODUwZDRjMzM0
MzM3ZmZkNmExOWEzNmRiNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxNDNiMWRkZGVmYWVjM2Jk
MmUyMWUzYjgzOWIzNGEyYjdmYjk4NDIyNzI4ODNjNTc2NDIwZDYwNWU5ZjMwYzYzIgogCiAjIGV4
Y2x1ZGUgcHJlLXJlbGVhc2VzIGZvciBib3RoIHB5dGhvbiAyLnggYW5kIDMueAogVVBTVFJFQU1f
Q0hFQ0tfUkVHRVggPSAiW1BwXXl0aG9uLSg/UDxwdmVyPlxkKyhcLlxkKykrKS50YXIiCi0tIAoy
LjQ3LjEKCg==

--===============2207885470127259152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-3f87bb1f4b2a93a6cd020e15911e7ff49d4aa124"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:3f87bb1f4b2a93a6cd020e15911e7ff49d4aa124"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 530 Local 120 Mirrors 0 Missed 410 Current 388 (22% match, 55% complete)
done.
Removing 38 stale sstate objects for arch x86_64...done.
Removing 109 stale sstate objects for arch x86-64-v3...done.
Removing 8 stale sstate objects for arch allarch...done.
Removing 63 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 463 of 918 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 512 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 531 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_create_spdx_setscene)
NOTE: Running setscene task 559 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 561 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 612 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 617 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 622 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 918 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 664 of 918 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 667 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 669 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 710 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 719 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 730 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tzcode-native-2026b-r0: task do_create_spdx_setscene: Started
NOTE: recipe cross-localedef-native-2.43+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2026b-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ca-certificates-20260223-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe tzdata-2026b-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20260223-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnu-config-native-20250709+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-native-5.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzcode-native-2026b-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-native-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe cross-localedef-native-2.43+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 749 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 760 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tzdata-2026b-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20260223-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 764 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.43.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 777 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnu-config-native-20250709+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 783 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 797 of 918 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 808 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 817 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 818 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 819 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 822 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 837 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-native-5.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 850 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-native-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 851 of 918 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ca-certificates-20260223-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.43+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe file-5.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnu-config-native-20250709+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ca-certificates-20260223-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.60-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cross-localedef-native-2.43+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.8.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 856 of 918 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 876 of 918 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_spdx_setscene)
NOTE: recipe file-native-5.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe tzdata-2026b-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 907 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 908 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnu-config-native-20250709+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ca-certificates-20260223-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.60-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-native-5.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe tzcode-native-2026b-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-native-2.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe tzdata-2026b-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 177 of 2121 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_recipe_qa)
NOTE: recipe expat-native-2.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2026b-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-native-2.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe expat-native-2.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 909 of 918 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 910 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.3.3.bb:do_create_spdx_setscene)
NOTE: recipe tzcode-native-2026b-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_recipe_qa_setscene)
NOTE: recipe cmake-native-4.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-native-3.14.6-r0: task do_recipe_qa: Started
NOTE: recipe tzcode-native-2026b-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-native-2.8.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cmake-native-4.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 913 of 918 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_spdx_setscene)
NOTE: recipe tzcode-native-2026b-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 779 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_fetch)
NOTE: Running task 780 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_fetch)
NOTE: recipe expat-native-2.8.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 914 of 918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.3.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 837 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_fetch)
NOTE: Running task 856 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: Running task 865 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_fetch)
NOTE: Running task 871 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_fetch)
NOTE: Running task 878 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: Running task 881 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: Running task 884 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_fetch)
NOTE: recipe cmake-native-4.3.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 930 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_fetch)
NOTE: recipe openssl-native-3.5.6-r0: task do_create_spdx_setscene: Started
NOTE: Running task 954 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: recipe nettle-3.10.2-r0: task do_fetch: Started
NOTE: recipe python3-native-3.14.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 962 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_recipe_qa)
NOTE: recipe libgpg-error-1.60-r0: task do_fetch: Started
NOTE: Running task 975 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_fetch)
NOTE: Running task 976 of 2121 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_fetch)
NOTE: recipe nettle-3.10.2-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.60-r0: task do_fetch: Succeeded
NOTE: Running task 977 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_unpack)
NOTE: Running task 978 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_unpack)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.18-r0: task do_fetch: Started
NOTE: Running task 979 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: recipe curl-8.20.0-r0: task do_fetch: Started
NOTE: recipe libarchive-3.8.7-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: recipe cmake-native-4.3.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Started
NOTE: recipe openssl-native-3.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 981 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: Running setscene task 915 of 918 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 916 of 918 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.8.7-r0: task do_fetch: Succeeded
NOTE: recipe file-5.47-r0: task do_fetch: Started
NOTE: Running task 990 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_unpack)
NOTE: Running task 991 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: Running task 992 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_unpack)
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 993 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_unpack)
NOTE: Running task 994 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: recipe perl-5.42.0-r0: task do_fetch: Started
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_unpack: Started
NOTE: Running task 995 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_unpack)
NOTE: recipe perl-5.42.0-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.60-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Started
NOTE: recipe python3-3.14.6-r0: task do_recipe_qa: Started
NOTE: Running task 1001 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe json-c-0.18-r0: task do_unpack: Started
NOTE: recipe curl-8.20.0-r0: task do_unpack: Started
NOTE: recipe libarchive-3.8.7-r0: task do_unpack: Started
NOTE: recipe python3-native-3.14.6-r0: task do_fetch: Started
NOTE: recipe perl-native-5.42.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-native-3.5.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Started
NOTE: recipe json-c-0.18-r0: task do_unpack: Succeeded
NOTE: recipe python3-native-3.14.6-r0: task do_fetch: Succeeded
NOTE: Running task 1002 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_patch)
NOTE: recipe file-5.47-r0: task do_fetch: Succeeded
NOTE: Running task 1003 of 2121 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_unpack)
NOTE: recipe bash-5.3-r0: task do_unpack: Started
NOTE: recipe nettle-3.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 1004 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_unpack)
NOTE: recipe perl-5.42.0-r0: task do_unpack: Started
NOTE: Running task 1005 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_patch)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 1006 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe openssl-native-3.5.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe perl-native-5.42.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 918 of 918 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 1031 of 2121 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1042 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe json-c-0.18-r0: task do_patch: Started
NOTE: recipe file-5.47-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.60-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1043 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_patch)
NOTE: Running task 1044 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_fetch)
NOTE: recipe nettle-3.10.2-r0: task do_patch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1045 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_patch)
NOTE: recipe libarchive-3.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 1046 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_patch)
NOTE: recipe perl-native-5.42.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-native-3.14.6-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe json-c-0.18-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.60-r0: task do_patch: Started
NOTE: Running task 1048 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_generate_toolchain_file)
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Started
NOTE: recipe python3-native-3.14.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-native-5.42.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: Running task 1053 of 2121 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_recipe_spdx)
NOTE: recipe libarchive-3.8.7-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.18-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1100 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_fetch)
NOTE: Running task 1101 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_patch)
NOTE: Running task 1108 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_fetch)
NOTE: recipe bash-5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1109 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_patch)
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1152 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_fetch)
NOTE: Running task 1153 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: recipe libarchive-3.8.7-r0: task do_patch: Succeeded
NOTE: Running task 1154 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 1188 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Started
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_fetch: Started
NOTE: recipe curl-8.20.0-r0: task do_patch: Started
NOTE: Running task 1189 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_unpack)
NOTE: recipe bash-5.3-r0: task do_patch: Started
NOTE: recipe python3-native-3.14.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe findutils-4.10.0-r0: task do_fetch: Succeeded
NOTE: recipe ca-certificates-20260223-r0: task do_fetch: Started
NOTE: Running task 1190 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_unpack)
NOTE: recipe tzdata-2026b-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.60-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Started
NOTE: Running noexec task 1215 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1256 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe libmpc-1.4.1-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20260223-r0: task do_fetch: Succeeded
NOTE: Running task 1257 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_unpack)
NOTE: Running task 1258 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_prepare_recipe_sysroot)
NOTE: recipe findutils-4.10.0-r0: task do_unpack: Started
NOTE: recipe libmpc-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1259 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_patch)
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20260223-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ca-certificates-20260223-r0: task do_unpack: Started
NOTE: recipe python3-native-3.14.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_patch: Started
NOTE: recipe ca-certificates-20260223-r0: task do_unpack: Succeeded
NOTE: Running task 1260 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_patch)
NOTE: recipe ca-certificates-20260223-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-native-3.14.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe file-5.47-r0: task do_unpack: Succeeded
NOTE: Running task 1261 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_patch)
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1262 of 2121 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_recipe_spdx)
NOTE: Running task 1263 of 2121 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx)
NOTE: Running task 1264 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: recipe ca-certificates-20260223-r0: task do_patch: Started
NOTE: recipe findutils-4.10.0-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1266 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_patch)
NOTE: recipe bash-5.3-r0: task do_patch: Succeeded
NOTE: recipe file-5.47-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1269 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe perl-5.42.0-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1270 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch)
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe findutils-4.10.0-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r0: task do_patch: Started
NOTE: recipe file-5.47-r0: task do_patch: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_patch: Started
NOTE: recipe ca-certificates-20260223-r0: task do_patch: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1273 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_configure)
NOTE: recipe ca-certificates-20260223-r0: task do_configure: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1275 of 2121 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_recipe_spdx)
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe ca-certificates-20260223-r0: task do_configure: Succeeded
NOTE: Running task 1276 of 2121 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_create_recipe_spdx)
NOTE: Running task 1277 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_compile)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe ca-certificates-20260223-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 43a5eed45be5f03da4b85c3553d0f54d484743ea1bf86e066be2f808a536e5e1
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_recipe_spdx: Started
NOTE: Setscene tasks completed
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1279 of 2121 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_create_recipe_spdx)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe ca-certificates-20260223-r0: task do_compile: Succeeded
NOTE: Running task 1280 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_install)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe perl-5.42.0-r0: task do_patch: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-native-3.14.6-r0: task do_unpack: Succeeded
NOTE: Running task 1281 of 2121 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_patch)
NOTE: Running task 1282 of 2121 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.0.bb:do_create_recipe_spdx)
NOTE: Running task 1283 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_unpack)
NOTE: recipe tzdata-2026b-r0: task do_fetch: Succeeded
NOTE: Running task 1285 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_unpack)
NOTE: Running task 1286 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_prepare_recipe_sysroot)
NOTE: recipe ca-certificates-20260223-r0: task do_install: Started
NOTE: recipe tzdata-2026b-r0: task do_unpack: Started
NOTE: recipe tzdata-2026b-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-build-native-1.5.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-3.14.6-r0: task do_unpack: Started
NOTE: recipe tzdata-2026b-r0: task do_unpack: Succeeded
NOTE: Running task 1287 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_patch)
NOTE: recipe python3-native-3.14.6-r0: task do_patch: Started
NOTE: recipe tzdata-2026b-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tzdata-2026b-r0: task do_patch: Started
NOTE: recipe tzdata-2026b-r0: task do_patch: Succeeded
NOTE: recipe python3-build-native-1.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1289 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_configure)
NOTE: Running task 1290 of 2121 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_recipe_spdx)
NOTE: Running task 1291 of 2121 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_recipe_spdx)
NOTE: recipe tzdata-2026b-r0: task do_configure: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe tzdata-2026b-r0: task do_configure: Succeeded
NOTE: Running task 1292 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_compile)
NOTE: recipe unzip-1_6.0-r0: task do_patch: Succeeded
NOTE: recipe tzdata-2026b-r0: task do_compile: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1294 of 2121 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_create_recipe_spdx)
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe tzdata-2026b-r0: task do_compile: Succeeded
NOTE: Running task 1295 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_install)
NOTE: recipe tzdata-2026b-r0: task do_install: Started
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1296 of 2121 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_create_recipe_spdx)
NOTE: recipe ca-certificates-20260223-r0: task do_install: Succeeded
NOTE: recipe meson-native-1.11.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe meson-native-1.11.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1298 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_create_recipe_spdx)
NOTE: Running task 1299 of 2121 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_recipe_spdx)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1300 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_recipe_spdx)
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1301 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-3.14.6-r0: task do_unpack: Succeeded
NOTE: Running task 1302 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_patch)
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx: Started
NOTE: recipe tzdata-2026b-r0: task do_install: Succeeded
NOTE: recipe qemu-native-10.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-3.14.6-r0: task do_patch: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx: Succeeded
NOTE: recipe qemu-native-10.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1304 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_recipe_spdx)
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1305 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-3.14.6-r0: task do_patch: Succeeded
NOTE: Running task 1306 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1307 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_populate_lic)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1308 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx)
NOTE: Running task 1309 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx)
NOTE: Running task 1310 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx)
NOTE: Running task 1311 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx)
NOTE: Running task 1312 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_create_recipe_spdx)
NOTE: Running task 1313 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_create_recipe_spdx)
NOTE: Running task 1314 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_recipe_spdx)
NOTE: Running task 1315 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_recipe_spdx)
NOTE: Running task 1316 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.43.bb:do_create_recipe_spdx)
NOTE: recipe python3-3.14.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.14.6-r0: task do_populate_lic: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe lzlib-1.16-r0: task do_create_recipe_spdx: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe glibc-locale-2.43+git-r0: task do_create_recipe_spdx: Started
NOTE: recipe expat-2.8.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe json-c-0.18-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-3.14.6-r0: task do_populate_lic: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe glibc-locale-2.43+git-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-c-0.18-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1317 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_recipe_spdx)
NOTE: Running task 1318 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_recipe_spdx)
NOTE: Running task 1319 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_recipe_spdx)
NOTE: Running task 1320 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_recipe_spdx)
NOTE: recipe lzlib-1.16-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1321 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_recipe_spdx)
NOTE: Running task 1322 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_recipe_spdx)
NOTE: Running task 1323 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_recipe_spdx)
NOTE: Running task 1324 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_create_recipe_spdx)
NOTE: Running task 1325 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1326 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_recipe_spdx)
NOTE: Running task 1327 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx)
NOTE: Running task 1328 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx)
NOTE: Running task 1329 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx)
NOTE: Running task 1330 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx)
NOTE: Running task 1331 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_create_recipe_spdx)
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Started
NOTE: recipe attr-2.5.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libgpg-error-1.60-r0: task do_create_recipe_spdx: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1332 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx)
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1333 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_create_recipe_spdx)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1334 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_create_recipe_spdx)
NOTE: Running task 1335 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_recipe_spdx)
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1336 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_create_recipe_spdx)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1337 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_recipe_spdx)
NOTE: Running task 1338 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_recipe_spdx)
NOTE: Running task 1339 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_recipe_spdx)
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1340 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_recipe_spdx)
NOTE: recipe attr-2.5.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1341 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_create_recipe_spdx)
NOTE: recipe libgpg-error-1.60-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1342 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_recipe_spdx)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe mpfr-4.2.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe nettle-3.10.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe sed-4.10-r0: task do_create_recipe_spdx: Started
NOTE: recipe unzip-1_6.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe file-5.47-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe bash-5.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe acl-2.3.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe file-5.47-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1343 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_create_recipe_spdx)
NOTE: Running task 1344 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_recipe_spdx)
NOTE: recipe acl-2.3.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1345 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_create_recipe_spdx)
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1346 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_recipe_spdx)
NOTE: recipe sed-4.10-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1347 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_create_recipe_spdx)
NOTE: recipe nettle-3.10.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1348 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_create_recipe_spdx)
NOTE: Running task 1349 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_create_recipe_spdx)
NOTE: recipe bash-5.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx: Started
NOTE: recipe libarchive-3.8.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe shadow-4.19.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe curl-8.20.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gnutls-3.8.13-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libmpc-1.4.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1350 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_create_recipe_spdx)
NOTE: recipe libarchive-3.8.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1351 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_create_recipe_spdx)
NOTE: Running task 1352 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_create_recipe_spdx)
NOTE: recipe gcc-16.1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe curl-8.20.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe coreutils-9.11-r0: task do_create_recipe_spdx: Started
NOTE: recipe shadow-4.19.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1353 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_recipe_spdx)
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe gcc-16.1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1354 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_create_recipe_spdx)
NOTE: recipe coreutils-9.11-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1355 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_create_recipe_spdx)
NOTE: recipe elfutils-0.194-r0: task do_create_recipe_spdx: Started
NOTE: recipe elfutils-0.194-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1356 of 2121 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_create_recipe_spdx)
NOTE: recipe binutils-2.46-r0: task do_create_recipe_spdx: Started
NOTE: recipe binutils-2.46-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-native-3.14.6-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1356 tasks of which 1217 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611103131.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611103131.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-native/3.14.6/temp/log.do_patch.1006247
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-native-3.14.6-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-native/3.14.6/sources/Python-3.14.6'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-native/3.14.6/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch 0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-native/3.14.6/temp/log.do_patch.1006247
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_patch) failed with exit code '1'

--===============2207885470127259152==--

