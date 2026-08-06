Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0652C561E6
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 06:24:25 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13884.1785997457669758943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 23:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Hwh9EuFL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2lO8aLUP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019fd5be7576-de679ccd-7d93-427b-832f-8e67aea9615d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785997456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PAC43qVkHo4k2UsVimbfsGpX6gMG+pR6kCpOe6UeMbM=;
	b=Hwh9EuFL6thawbcsCGneLxLqpma90rvqdB8aJnkOYWsGUgGpNKVj7tI24LCciFf/
	mxy7Zb9RW+YylaeviBFyXE2vvHPWZBcU/6mUUDDNTBQqkXGLc/1uLECfR3aYw+mcyO+
	pKRbbI0pYwp78eLYLzWjPdbzOeTtRCyYtaN8P1sE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785997456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PAC43qVkHo4k2UsVimbfsGpX6gMG+pR6kCpOe6UeMbM=;
	b=2lO8aLUPiIxEy1v0KrYx952ou+XWXLRca1z/nZwpt2hNgndkTzEnN8fnFm98410M
	xyylHvgkqyMACXJC3BggdkhDVF+zH95q8GFbZ5KiDpoc2GodZk43vZump3+7XOrV5/n
	YkxCeyvDxXu9xbUw6qRgTXR3fgXvAXmmZub9Vryw=
Content-Type: multipart/mixed; boundary="===============9104330730762520242=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3: upgrading to 3.14.7 FAILED
Message-ID: <0101019fd5be7576-de679ccd-7d93-427b-832f-8e67aea9615d-000000@us-west-2.amazonses.com>
Date: Thu, 6 Aug 2026 06:24:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.06-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 06:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242909

--===============9104330730762520242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3* to *3.14.7* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-upgrade-3.14.6-3.14.7.patch
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
From 8a29f1deec338ef8d36631467ab3494461855db3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 6 Aug 2026 05:52:26 +0000
Subject: [PATCH] python3: upgrade 3.14.6 -> 3.14.7

Source: Misc/NEWS

What's New in Python 3.14.7 final?
==================================

*Release date: 2026-08-05*

Security
--------

- gh-153030: Fixed quadratic complexity in incremental parsing of long
  unterminated constructs (such as tags or comments) in
  :class:`html.parser.HTMLParser`, which could be exploited for a denial of
  service.

- gh-152674: The :class:`xml.etree.ElementTree.Element` methods
  :meth:`~xml.etree.ElementTree.Element.findall`,
  :meth:`~xml.etree.ElementTree.Element.iterfind` and
  :meth:`~xml.etree.ElementTree.Element.find` avoid quadratic behavior when
  using XPath index predicates (``[1]``, ``[last()]``, ``[last()-N]``) on
  XML documents with many same-tag siblings.

- gh-152216: Update bundled `libexpat <https://libexpat.github.io/>`_ to
  version 2.8.2.

- gh-151987: The :meth:`tarfile.TarFile.extract` method now applies the
  given filter when it extracts a link target from the archive as a
  fallback.

- gh-151981: In :mod:`tarfile`, seeking a stream now stops when end of the
  stream is reached.

- gh-151544: :file:`Modules/Setup.local` is no longer used as a landmark to
  discover whether Python is running in a source tree, as it could
  potentially affect actual installs. The :file:`pybuilddir.txt` file is now
  the sole indicator of running in a source tree.

- gh-151558: Fixed an vulnerability in the :mod:`tarfile` ``data`` and
  ``tar`` extraction filters where crafted archives could create a symlink
  pointing outside the destination directory. This was a bypass of
  :cve:`2025-4330`.

- gh-150743: :mod:`http.client` now limits the number of chunked-response
  trailer lines it will read to 100, and the number of interim (1xx)
  responses it will skip to 100.  A malicious or broken server could
  previously stream trailer lines or ``100 Continue`` responses forever,
  hanging the client even when a socket timeout was in use. Reported by
  ``@YLChen-007`` via GHSA-w4q2-g22w-6fr4.

- gh-143927: Normalize all line endings (CR, CRLF, and LF) to LF+TAB when
  writing multi-line configparser values.

- gh-143921: Reject NUL, CR and LF characters in IMAP commands. Other
  control characters are allowed and sent quoted.

Core and Builtins
-----------------

- gh-133931: Fix data races when setting attributes of function objects on
  the :term:`free threaded <free threading>` build.

- gh-154709: Fix an out-of-bounds access in reverse dictionary iterators
  when the underlying dictionary is cleared and modified after the iterator
  is created.

- gh-154695: Fix :class:`asyncio.Task` raising :exc:`AttributeError` when
  created with ``eager_start=True`` and no explicit *loop* argument.

- gh-153809: Fix interpreter crash while deallocating objects of
  :class:`asyncio.Task` on free-threaded builds. Contributed by Sergey
  Miryanov.

- gh-154275: Fix a crash when getting deeply nested ``__parameters__`` from
  a :class:`types.GenericAlias` objects.

- gh-153932: Fix thread safety issue in the ``__reduce__``

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...shebang-overflow-on-python-config.py.patch |   6 +-
 ...e-stdin-I-O-errors-same-way-as-maste.patch |   4 +-
 ...-use-prefix-value-from-build-configu.patch |   7 +-
 ...-qemu-wrapper-when-gathering-profile.patch |   9 +-
 ...est_sysconfig-for-posix_user-purelib.patch |   4 +-
 .../0001-prefer-valid-entrypoints.patch       |   2 +-
 ...g.py-use-platlibdir-also-for-purelib.patch |   4 +-
 ...le.py-correct-the-test-output-format.patch |   6 +-
 .../python/python3/CVE-2026-11940.patch       |  67 ----------
 .../python/python3/CVE-2026-11972.patch       |  61 ---------
 .../python/python3/CVE-2026-4360.patch        | 125 +-----------------
 .../python/python3/makerace.patch             |   6 +-
 .../python/python3/valid-dists.patch          |   2 +-
 .../{python3_3.14.6.bb => python3_3.14.7.bb}  |   5 +-
 14 files changed, 27 insertions(+), 281 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11940.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11972.patch
 rename meta/recipes-devtools/python/{python3_3.14.6.bb => python3_3.14.7.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index c2106f9437..7a60538364 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -1,4 +1,4 @@
-From 6b111a328c1c57b1580d63894b2b5d337316f6d4 Mon Sep 17 00:00:00 2001
+From 3f2df0e1fce8c7425998dade00d084f1b101a982 Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Tue, 7 Jun 2022 16:16:41 +0200
 Subject: [PATCH] Avoid shebang overflow on python-config.py
@@ -16,10 +16,10 @@ Upstream-Status: Denied [distribution]
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 9ec3a71..f7d5382 100644
+index e946018..345ed29 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2829,6 +2829,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2835,6 +2835,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index d9072a36f7..532adfe69a 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
@@ -1,4 +1,4 @@
-From 129ee75863081d9e3418acca3df1e47667f671ad Mon Sep 17 00:00:00 2001
+From 9cd44429215352eb2753e0fd8e25fef24f714006 Mon Sep 17 00:00:00 2001
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
index 285580195b..60391e726b 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From e3c6e770e73e1329958db0a73883e42b01763ae3 Mon Sep 17 00:00:00 2001
+From b5aad6a9b6c5add7a85861aed8aa030c1ad3d52f Mon Sep 17 00:00:00 2001
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
index e25797f57e..c7f14cad1e 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -1,4 +1,4 @@
-From e7a8a7385f561f214054cf95f0a22bfa064eee0b Mon Sep 17 00:00:00 2001
+From d6f77e3a934616d1f6c083b7144c50a32e08b70a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 Jan 2019 12:41:04 +0100
 Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile data
@@ -15,10 +15,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 3bd4495f95b..8e8fc60bc76 100644
+index 526d500..a7e536d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -857,8 +857,7 @@ profile-run-stamp:
+@@ -861,8 +861,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
@@ -28,6 +28,3 @@ index 3bd4495f95b..8e8fc60bc76 100644
  	$(LLVM_PROF_MERGER)
  	# Remove profile generation binary since we are done with it.
  	$(MAKE) clean-retain-profile
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
index 6a62c6dc5b..5509b7475a 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
@@ -1,4 +1,4 @@
-From 5bf5aa6eae1fa3eed66893e51a1858ab481426b4 Mon Sep 17 00:00:00 2001
+From c608cb4b3c8c31f1aa25ad1264ff58733fb99769 Mon Sep 17 00:00:00 2001
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
index 1250dc9ff0..ae3698fac4 100644
--- a/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.patch
+++ b/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.patch
@@ -1,4 +1,4 @@
-From ef33ac27e3ac1b9cb159d7eec0ad1af120cd9dc1 Mon Sep 17 00:00:00 2001
+From 8d7fcf04c6513841c7985e64b746b1ef5de0c426 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 17 Apr 2026 16:53:42 +0100
 Subject: [PATCH] prefer valid entrypoints
diff --git a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
index b9c68a98d7..7807827d9a 100644
--- a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
@@ -1,4 +1,4 @@
-From bbcb17dc1ed283f41c8cd94d39f70898f0c45583 Mon Sep 17 00:00:00 2001
+From c10d1b295a9fb93836830cce441da3f22e5c7cd7 Mon Sep 17 00:00:00 2001
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
index 201271b0c0..a60d082e2f 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -1,4 +1,4 @@
-From c1f3cf625c0f011060ddaa2a4096f6aa13dd1ee6 Mon Sep 17 00:00:00 2001
+From f0ac5b479b99bfb7f5e937a941b31a596f4caafc Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 5 Aug 2019 15:57:39 +0800
 Subject: [PATCH] test_locale.py: correct the test output format
@@ -31,10 +31,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
-index da4bd79..fd9e67d 100644
+index f918435..1910a43 100644
 --- a/Lib/test/test_locale.py
 +++ b/Lib/test/test_locale.py
-@@ -500,7 +500,7 @@ class TestRealLocales(unittest.TestCase):
+@@ -499,7 +499,7 @@ class TestRealLocales(unittest.TestCase):
              self.skipTest('test needs Turkish locale')
          loc = locale.getlocale(locale.LC_CTYPE)
          if verbose:
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11940.patch b/meta/recipes-devtools/python/python3/CVE-2026-11940.patch
deleted file mode 100644
index 05a5802c39..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2026-11940.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From e24b4e95524fbe8cd0f46aa3292e8040f0e07c83 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Tue, 23 Jun 2026 15:58:47 +0200
-Subject: [PATCH 1/2] gh-151558: Fix symlink escape via `tarfile`
- hardlink-extraction fallback (GH-151559)
-
-CVE: CVE-2026-11940
-Upstream-Status: Backport [https://github.com/python/cpython/commit/27dd970bf6b17ebca7c8ed486a40ab043ed7af8f]
-
-Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
----
- Lib/tarfile.py           |  3 +++
- Lib/test/test_tarfile.py | 24 ++++++++++++++++++++++++
- 2 files changed, 27 insertions(+)
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index e6734db24f64..63f23490e8a1 100644
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -2782,6 +2782,9 @@ def makelink_with_filter(self, tarinfo, targetpath,
-                     "makelink_with_filter: if filter_function is not None, "
-                     + "extraction_root must also not be None")
-             try:
-+                filter_function(
-+                    unfiltered.replace(name=tarinfo.name, deep=False),
-+                    extraction_root)
-                 filtered = filter_function(unfiltered, extraction_root)
-             except _FILTER_ERRORS as cause:
-                 raise LinkFallbackError(tarinfo, unfiltered.name) from cause
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index d974c7d46ec1..0fc7413be8db 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -4344,6 +4344,30 @@ def test_sneaky_hardlink_fallback(self):
-                     self.expect_file("boom", symlink_to='../../link_here')
-                     self.expect_file("c", symlink_to='b')
-
-+    @symlink_test
-+    def test_sneaky_hardlink_fallback_deep(self):
-+        # (CVE-2026-11940)
-+        with ArchiveMaker() as arc:
-+            arc.add("a/b/s", symlink_to=os.path.join("..", "escape"))
-+            arc.add("s", hardlink_to=os.path.join("a", "b", "s"))
-+
-+        with self.check_context(arc.open(), 'data'):
-+            e = self.expect_exception(
-+                tarfile.LinkFallbackError,
-+                "link 's' would be extracted as a copy of "
-+                + "'a/b/s', which was rejected")
-+            self.assertIsInstance(e.__cause__,
-+                                  tarfile.LinkOutsideDestinationError)
-+
-+        for filter in 'tar', 'fully_trusted':
-+            with self.subTest(filter), self.check_context(arc.open(), filter):
-+                if not os_helper.can_symlink():
-+                    self.expect_file("a/")
-+                    self.expect_file("a/b/")
-+                else:
-+                    self.expect_file("a/b/s", symlink_to=os.path.join('..', 'escape'))
-+                    self.expect_file("s", symlink_to=os.path.join('..', 'escape'))
-+
-     @symlink_test
-     def test_exfiltration_via_symlink(self):
-         # (CVE-2025-4138)
---
-2.54.0
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11972.patch b/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
deleted file mode 100644
index 12a79754fe..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 2d256d4bfd654bdcaf2d96733799be73b8ff8f69 Mon Sep 17 00:00:00 2001
-From: Petr Viktorin <encukou@gmail.com>
-Date: Tue, 23 Jun 2026 15:13:30 +0200
-Subject: [PATCH 2/2] gh-151981: Make tarfile._Stream.seek break at EOF
- (GH-151982)
-
-Co-authored-by: Stan Ulbrych <stan@python.org>
-
-CVE: CVE-2026-11972
-Upstream-Status: Backport [https://github.com/python/cpython/commit/f50bf13566189c8d0ce5a814f33eff3d89951896]
-
-Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
----
- Lib/tarfile.py           |  4 +++-
- Lib/test/test_tarfile.py | 16 ++++++++++++++++
- 2 files changed, 19 insertions(+), 1 deletion(-)
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index 63f23490e8a1..399f906efdff 100644
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -524,7 +524,9 @@ def seek(self, pos=0):
-         if pos - self.pos >= 0:
-             blocks, remainder = divmod(pos - self.pos, self.bufsize)
-             for i in range(blocks):
--                self.read(self.bufsize)
-+                data = self.read(self.bufsize)
-+                if not data:
-+                    break
-             self.read(remainder)
-         else:
-             raise StreamError("seeking backwards is not allowed")
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index 0fc7413be8db..045377d620cc 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -4786,6 +4786,22 @@ def valueerror_filter(tarinfo, path):
-         with self.check_context(arc.open(errorlevel='boo!'), filtererror_filter):
-             self.expect_exception(TypeError)  # errorlevel is not int
-
-+    @support.subTests('format', [tarfile.GNU_FORMAT, tarfile.PAX_FORMAT])
-+    def test_getmembers_big_size(self, format):
-+        # gh-151981: A loop in seek() for streaming files tried to read the
-+        # declared number of blocks even at EOF
-+        tinfo = tarfile.TarInfo("huge-file")
-+        tinfo.size = 1 << 64
-+        bio = io.BytesIO()
-+        # Write header without data
-+        bio.write(tinfo.tobuf(format))
-+
-+        # Reset & try to get contents
-+        bio.seek(0)
-+        with tarfile.open(fileobj=bio, mode="r|") as tar:
-+            with self.assertRaises(tarfile.ReadError):
-+                tar.getmembers()
-+
-
- class OverwriteTests(archiver_tests.OverwriteTests, unittest.TestCase):
-     testdir = os.path.join(TEMPDIR, "testoverwrite")
---
-2.54.0
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-4360.patch b/meta/recipes-devtools/python/python3/CVE-2026-4360.patch
index d381508959..df7a00f05e 100644
--- a/meta/recipes-devtools/python/python3/CVE-2026-4360.patch
+++ b/meta/recipes-devtools/python/python3/CVE-2026-4360.patch
@@ -1,4 +1,4 @@
-From 66c8bc346c0c614edc05535145c0424a14fba213 Mon Sep 17 00:00:00 2001
+From 91698cfa88474b99f87c8bebde2de61118588a7e Mon Sep 17 00:00:00 2001
 From: "Miss Islington (bot)"
  <31488909+miss-islington@users.noreply.github.com>
 Date: Mon, 29 Jun 2026 21:11:22 +0200
@@ -15,129 +15,10 @@ Upstream-Status: Backport [https://github.com/python/cpython/commit/5e0ef3f1afe8
 
 Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
 ---
- Lib/tarfile.py                                |  3 +-
- Lib/test/test_tarfile.py                      | 92 +++++++++++++++++++
- ...-06-23-14-19-30.gh-issue-151987.8mNIMf.rst |  2 +
- 3 files changed, 96 insertions(+), 1 deletion(-)
+ .../Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf.rst     | 2 ++
+ 1 file changed, 2 insertions(+)
  create mode 100644 Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf.rst
 
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index e6734db..2c46179 100644
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -2510,7 +2510,8 @@ class TarFile(object):
-         tarinfo, unfiltered = self._get_extract_tarinfo(
-             member, filter_function, path)
-         if tarinfo is not None:
--            self._extract_one(tarinfo, path, set_attrs, numeric_owner)
-+            self._extract_one(tarinfo, path, set_attrs, numeric_owner,
-+                              filter_function=filter_function)
- 
-     def _get_extract_tarinfo(self, member, filter_function, path):
-         """Get (filtered, unfiltered) TarInfos from *member*
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index d974c7d..9a15585 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -4399,6 +4399,98 @@ class TestExtractionFilters(unittest.TestCase):
-                     st_mode = cc.outerdir.stat().st_mode
-                     self.assertNotEqual(st_mode & 0o777, 0o777)
- 
-+    @symlink_test
-+    @unittest.skipUnless(hasattr(os, 'chown'), "missing os.chown")
-+    @unittest.skipUnless(hasattr(os, 'lchown'), "missing os.lchown")
-+    @unittest.skipUnless(hasattr(os, 'geteuid'), "missing os.geteuid")
-+    @support.subTests('link_type', (tarfile.SYMTYPE, tarfile.LNKTYPE))
-+    def test_chown_links_on_extract(self, link_type):
-+        with ArchiveMaker() as arc:
-+            arc.add("test.txt",
-+                    uid=1337, gid=1337, uname="", gname="", mode='-rwxr-xr-x')
-+            arc.add("link",
-+                    type=link_type,
-+                    linkname='test.txt',
-+                    uid=1337, gid=1337, uname="", gname="", mode='-rwxr-xr-x')
-+
-+        with (
-+            os_helper.temp_dir() as tmpdir,
-+            arc.open() as tar,
-+            unittest.mock.patch("os.chown") as mock_chown,
-+            unittest.mock.patch("os.lchown") as mock_lchown,
-+            unittest.mock.patch("os.geteuid") as mock_geteuid,
-+        ):
-+            # Set UID to 0 so chown() is attempted.
-+            mock_geteuid.return_value = 0
-+            tar.extract("link", path=tmpdir, filter='data')
-+            extract_path = os.path.join(tmpdir, "link")
-+
-+            if link_type == tarfile.SYMTYPE:
-+                mock_chown.assert_not_called()
-+                mock_lchown.assert_called_once_with(extract_path, -1, -1)
-+            else:
-+                mock_chown.assert_has_calls([
-+                    unittest.mock.call(extract_path, -1, -1),
-+                    unittest.mock.call(extract_path, -1, -1)
-+                ])
-+                mock_lchown.assert_not_called()
-+
-+    @symlink_test
-+    @unittest.skipUnless(hasattr(os, 'chown'), "missing os.chown")
-+    @unittest.skipUnless(hasattr(os, 'lchown'), "missing os.lchown")
-+    @unittest.skipUnless(hasattr(os, 'geteuid'), "missing os.geteuid")
-+    @support.subTests('link_type', (tarfile.SYMTYPE, tarfile.LNKTYPE))
-+    def test_chown_links_on_extractall(self, link_type):
-+        with ArchiveMaker() as arc:
-+            arc.add("test.txt",
-+                    uid=1337, gid=1337, uname="", gname="", mode='-rwxr-xr-x')
-+            arc.add("link",
-+                    type=link_type,
-+                    linkname='test.txt',
-+                    uid=1337, gid=1337, uname="", gname="", mode='-rwxr-xr-x')
-+
-+        with (
-+            os_helper.temp_dir() as tmpdir,
-+            arc.open() as tar,
-+            unittest.mock.patch("os.chown") as mock_chown,
-+            unittest.mock.patch("os.lchown") as mock_lchown,
-+            unittest.mock.patch("os.geteuid") as mock_geteuid,
-+        ):
-+            # Set UID to 0 so chown() is attempted.
-+            mock_geteuid.return_value = 0
-+            tar.extractall(path=tmpdir, filter='data')
-+            extract_link_path = os.path.join(tmpdir, "link")
-+            extract_file_path = os.path.join(tmpdir, "test.txt")
-+
-+            if link_type == tarfile.SYMTYPE:
-+                mock_chown.assert_called_once_with(extract_file_path, -1, -1)
-+                mock_lchown.assert_called_once_with(extract_link_path, -1, -1)
-+            else:
-+                mock_chown.assert_has_calls([
-+                    unittest.mock.call(extract_file_path, -1, -1),
-+                    unittest.mock.call(extract_link_path, -1, -1)
-+                ])
-+                mock_lchown.assert_not_called()
-+
-+    def test_extract_filters_target(self):
-+        # Test that when extract() falls back to extracting (rather than
-+        # linking) a hardlink target, it filters the target.
-+        with ArchiveMaker() as arc:
-+            arc.add("target")
-+            arc.add("link", hardlink_to="target")
-+        def testing_filter(member, path):
-+            if member.name == 'target':
-+                # target: set read-only
-+                return member.replace(mode=stat.S_IRUSR)
-+            # link: don't overwrite the mode
-+            return member.replace(mode=None)
-+        tempdir = pathlib.Path(TEMPDIR) / 'extract'
-+        with os_helper.temp_dir(tempdir), arc.open() as tar:
-+            tar.extract("link", path=tempdir, filter=testing_filter)
-+            path = tempdir / 'link'
-+            if os_helper.can_chmod():
-+                self.assertFalse(path.stat().st_mode & stat.S_IWUSR)
-+
-     def test_link_fallback_normalizes(self):
-         # Make sure hardlink fallbacks work for non-normalized paths for all
-         # filters
 diff --git a/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf.rst b/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf.rst
 new file mode 100644
 index 0000000..9eea7b3
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index b29ea56cc3..248a521118 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From 2b458b4e1bcd57e3f135d3f0e715f64b98b27906 Mon Sep 17 00:00:00 2001
+From b41557f570ff4451c477669d6ca5bfacabe21c66 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
@@ -17,10 +17,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index be1b9ea..9ec3a71 100644
+index a7e536d..e946018 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2735,7 +2735,7 @@ COMPILEALL_OPTS=-j0
+@@ -2741,7 +2741,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3/valid-dists.patch b/meta/recipes-devtools/python/python3/valid-dists.patch
index 38b6ebc5cb..7fe18254e5 100644
--- a/meta/recipes-devtools/python/python3/valid-dists.patch
+++ b/meta/recipes-devtools/python/python3/valid-dists.patch
@@ -1,4 +1,4 @@
-From a65c29adc027b3615154cab73aaedd58a6aa23da Mon Sep 17 00:00:00 2001
+From 66874ce1a9f21b4b00dc85919734d58e6243ca29 Mon Sep 17 00:00:00 2001
 From: "Jason R. Coombs" <jaraco@jaraco.com>
 Date: Tue, 23 Jul 2024 08:36:16 -0400
 Subject: [PATCH] Prioritize valid dists to invalid dists when retrieving by
diff --git a/meta/recipes-devtools/python/python3_3.14.6.bb b/meta/recipes-devtools/python/python3_3.14.7.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.14.6.bb
rename to meta/recipes-devtools/python/python3_3.14.7.bb
index 77333ce3e2..5d51717bfa 100644
--- a/meta/recipes-devtools/python/python3_3.14.6.bb
+++ b/meta/recipes-devtools/python/python3_3.14.7.bb
@@ -22,15 +22,14 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
            file://0001-prefer-valid-entrypoints.patch \
-           file://CVE-2026-11940.patch \
-           file://CVE-2026-11972.patch \
            file://CVE-2026-4360.patch \
+           file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "143b1dddefaec3bd2e21e3b839b34a2b7fb9842272883c576420d605e9f30c63"
+SRC_URI[sha256sum] = "3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.47.1


--===============9104330730762520242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1987 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-7e174a474678a7bab156dc07cbbfc444a283b732"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:7e174a474678a7bab156dc07cbbfc444a283b732"
meta-yocto-bsp       
meta-poky            = "master:9c6cf36c3511b94957aba04002d98bec665e9f1e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 626 Local 295 Mirrors 0 Missed 331 Current 289 (47% match, 63% complete)
done.
Removing 79 stale sstate objects for arch x86-64-v3...done.
Removing 39 stale sstate objects for arch x86_64...done.
Removing 8 stale sstate objects for arch allarch...done.
Removing 64 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 377 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.44.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 393 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 413 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 426 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 438 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 443 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 444 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 447 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_create_spdx_setscene)
NOTE: Running setscene task 457 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 460 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glibc-locale-2.44+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glibc-locale-2.44+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzcode-native-2026c-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ca-certificates-20260601-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20260601-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe tzdata-2026c-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.44+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzcode-native-2026c-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 463 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 475 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 477 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ca-certificates-20260601-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 478 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 483 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe tzdata-2026c-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 484 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 489 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.7.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 498 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 507 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 512 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 521 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ca-certificates-20260601-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 523 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 530 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tzdata-2026c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 531 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 532 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.7.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gawk-5.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.44+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 534 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 536 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 537 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 540 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gawk-5.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 545 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 546 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.7.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 547 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 550 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 552 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 553 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 554 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glibc-locale-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perlcross-native-1.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 565 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 566 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glibc-locale-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 572 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe tzdata-2026c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 575 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 576 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 578 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 584 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 587 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 589 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe attr-native-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 593 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 595 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 597 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 600 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe attr-native-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 601 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 605 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gawk-5.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ca-certificates-20260601-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 613 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perlcross-native-1.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 615 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 618 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 619 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-4.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 623 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 624 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 625 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe gawk-5.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 628 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-native-5.48-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 629 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ca-certificates-20260601-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 630 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 632 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_create_recipe_spdx_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tzdata-2026c-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-native-5.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 636 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 638 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 640 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 641 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 645 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe tzdata-2026c-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 646 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 648 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 650 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe expat-2.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 656 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 657 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 658 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tzcode-native-2026c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_create_spdx_setscene)
NOTE: recipe file-5.48-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 665 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 667 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 673 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 675 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 676 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 678 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzlib-1.16-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmicrohttpd-1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 679 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 681 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 685 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe tzcode-native-2026c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 686 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-native-1.1.45-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 689 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 694 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 695 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 696 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 700 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_recipe_spdx_setscene)
NOTE: recipe lzlib-1.16-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 701 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe perlcross-native-1.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 703 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 706 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-native-10.47-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 709 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-initial-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 711 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 715 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 716 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 723 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-native-10.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 724 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 735 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 741 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 743 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 746 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 750 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 751 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 752 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 757 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gawk-native-5.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 759 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 760 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tzcode-native-2026c-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gawk-native-5.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 764 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzcode-native-2026c-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 765 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 766 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-native-10.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 768 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 770 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 771 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 772 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 773 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 780 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-native-1.1.45-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 782 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 790 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 794 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 796 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-native-10.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 798 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 802 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 803 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 804 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe libxcrypt-4.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnu-config-native-20260629+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpsl-0.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 805 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 806 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 807 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_create_spdx_setscene)
NOTE: recipe qemu-native-11.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 809 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 810 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 811 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 812 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 813 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_spdx_setscene)
NOTE: recipe libxcrypt-4.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-native-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 814 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 816 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.7.1.bb:do_create_spdx_setscene)
NOTE: recipe gnu-config-native-20260629+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 817 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-native-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 822 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 824 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 829 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-native-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 830 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_stash_locale_setscene)
NOTE: recipe xz-native-5.8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-native-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-native-20260512-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-native-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 833 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe expat-native-2.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-native-3_3.53.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-native-1.26-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-native-3.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-native-3.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 834 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnu-config-native-20260629+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-native-5.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 835 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-libuuid-native-2.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-native-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libedit-native-20260512-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 836 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 839 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 840 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-native-3_3.53.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe expat-native-2.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdbm-native-1.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 847 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 848 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-native-3.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-native-3.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 849 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 852 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 854 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 856 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-native-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 860 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.7.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnu-config-native-20260629+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 861 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 864 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-native-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xz-native-5.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 866 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-native-2.42.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libedit-native-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-native-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 868 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-native-3.7.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-native-2.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 869 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-native-0.195-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 871 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-native-3.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-native-5.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libedit-native-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 875 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 876 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-native-2.42.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 877 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-native-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 879 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 881 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 884 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-native-1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-native-3.7.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe expat-native-2.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 885 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-native-0.195-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 887 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 888 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-native-3.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 892 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 893 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-native-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-native-1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-native-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 895 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-native-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-native-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe meson-native-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.44+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe p11-kit-native-0.26.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 896 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 897 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-native-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-native-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 899 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-native-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-installer-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 900 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-packaging-native-26.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 902 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe meson-native-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe p11-kit-native-0.26.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-native-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-native-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-installer-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-native-5.44.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glibc-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-native-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 226 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_fetch)
NOTE: recipe glibc-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-native-5.44.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 905 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 906 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 302 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa)
NOTE: recipe libgcc-initial-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 908 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 910 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_fetch: Started
NOTE: Running task 420 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_fetch)
NOTE: Running task 424 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_fetch)
NOTE: Running task 428 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_fetch)
NOTE: Running task 438 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_fetch)
NOTE: Running task 440 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_fetch: Succeeded
NOTE: Running task 448 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_fetch)
NOTE: Running task 452 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_fetch)
NOTE: Running noexec task 454 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_fetch)
NOTE: Running task 456 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_fetch)
NOTE: Running task 458 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_fetch)
NOTE: Running task 459 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_unpack)
NOTE: recipe gawk-native-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 915 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-native-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdbm-native-1.26-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-initial-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Started
NOTE: recipe glibc-2.44+git-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-native-3.14.7-r0: task do_recipe_qa: Started
NOTE: recipe zlib-native-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_fetch: Started
NOTE: Running task 460 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcc-initial-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_fetch: Started
NOTE: recipe gdbm-native-1.26-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_fetch: Started
NOTE: Running setscene task 913 of 915 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_fetch: Started
NOTE: recipe meson-native-1.11.2-r0: task do_fetch: Started
NOTE: Running noexec task 468 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_fetch)
NOTE: Running task 472 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_fetch)
NOTE: recipe python3-packaging-native-26.2-r0: task do_fetch: Succeeded
NOTE: Running task 473 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_unpack)
NOTE: recipe gawk-native-5.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 474 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_unpack)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe gawk-native-5.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 475 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_unpack)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 486 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_unpack)
NOTE: Running task 488 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_fetch)
NOTE: Running task 489 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_unpack)
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_fetch: Succeeded
NOTE: Running task 490 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_unpack)
NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_fetch: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_unpack: Started
NOTE: Running task 506 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 507 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_unpack)
NOTE: recipe python3-packaging-native-26.2-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 508 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_patch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_fetch: Started
NOTE: Running task 530 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_write_config)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 531 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_unpack)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_unpack: Started
NOTE: Running task 532 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_unpack: Succeeded
NOTE: Running task 533 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_patch)
NOTE: recipe python3-build-native-1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_unpack: Started
NOTE: Running task 534 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_patch)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_unpack: Started
NOTE: Running task 535 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_patch)
NOTE: Running task 536 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_patch)
NOTE: Running task 537 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_unpack)
NOTE: recipe libtool-cross-2.6.2-r0: task do_unpack: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_patch: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_write_config: Started
NOTE: recipe python3-native-3.14.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 538 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_fetch)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-native-26.2-r0: task do_patch: Succeeded
NOTE: Running task 539 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_patch)
NOTE: Running task 542 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_fetch)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_patch: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_write_config: Succeeded
NOTE: Running task 544 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_fetch)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_patch: Started
NOTE: recipe glibc-2.44+git-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_patch: Started
NOTE: Running task 547 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_fetch)
NOTE: recipe python3-build-native-1.5.1-r0: task do_patch: Succeeded
NOTE: Running task 550 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_fetch)
NOTE: Running task 553 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_fetch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_patch: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_fetch: Started
NOTE: Running task 554 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_patch)
NOTE: Running task 558 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_patch: Started
NOTE: recipe attr-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 566 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe qemu-native-11.0.3-r0: task do_fetch: Started
NOTE: Running task 567 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_fetch: Started
NOTE: Running task 570 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_fetch)
NOTE: recipe python3-native-3.14.7-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_patch: Started
NOTE: recipe python3-native-3.14.7-r0: task do_fetch: Succeeded
NOTE: Running task 571 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_unpack)
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 572 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-native-4.21.0-r0: task do_fetch: Started
NOTE: Running task 581 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch)
NOTE: Running task 582 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_unpack)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 583 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_unpack)
NOTE: recipe util-linux-native-2.42.2-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 586 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_unpack)
NOTE: recipe libarchive-native-3.8.9-r0: task do_fetch: Started
NOTE: recipe attr-2.6.0-r0: task do_unpack: Started
NOTE: recipe meson-native-1.11.2-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_unpack: Started
NOTE: recipe python3-native-3.14.7-r0: task do_unpack: Started
NOTE: Running task 587 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_unpack)
NOTE: recipe libarchive-native-3.8.9-r0: task do_fetch: Succeeded
NOTE: Running task 588 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: recipe python3-native-3.14.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 589 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_patch)
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 590 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_patch)
NOTE: recipe meson-native-1.11.2-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_unpack: Started
NOTE: recipe attr-2.6.0-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 591 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_patch)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_patch: Started
NOTE: Running task 593 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe attr-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 607 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_unpack)
NOTE: recipe libpam-1.7.2-r0: task do_patch: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_patch: Succeeded
NOTE: Running task 617 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_unpack)
NOTE: recipe python3-native-3.14.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-native-2.42.2-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 622 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: Running task 623 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_fetch)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_fetch: Succeeded
NOTE: Running task 625 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: recipe meson-native-1.11.2-r0: task do_unpack: Succeeded
NOTE: Running task 626 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_unpack)
NOTE: Running task 627 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_patch)
NOTE: recipe libarchive-native-3.8.9-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 628 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_patch: Succeeded
NOTE: Running task 631 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb:do_fetch)
NOTE: recipe libidn2-native-2.3.8-r0: task do_fetch: Started
NOTE: recipe p11-kit-native-0.26.4-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 635 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_fetch)
NOTE: recipe meson-native-1.11.2-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe gnutls-native-3.8.13-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 637 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_fetch)
NOTE: recipe libmicrohttpd-native-1.0.9-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 640 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_write_config)
NOTE: recipe elfutils-native-0.195-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.195-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Started
NOTE: recipe libarchive-native-3.8.9-r0: task do_unpack: Succeeded
NOTE: Running task 642 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_write_config)
NOTE: Running task 643 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_patch)
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 648 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_fetch)
NOTE: recipe meson-native-1.11.2-r0: task do_patch: Succeeded
NOTE: Running task 651 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 661 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_write_config: Started
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Started
NOTE: recipe libarchive-native-3.8.9-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_write_config: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Started
NOTE: Running task 662 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb:do_unpack)
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe libidn2-native-2.3.8-r0: task do_unpack: Started
NOTE: Running task 669 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_unpack)
NOTE: recipe gnutls-native-3.8.13-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.8.9-r0: task do_patch: Succeeded
NOTE: Running task 670 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_unpack)
NOTE: recipe libmicrohttpd-native-1.0.9-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.195-r0: task do_unpack: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 671 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: Running task 715 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 716 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_patch)
NOTE: recipe libidn2-native-2.3.8-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_unpack: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: Running task 717 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_patch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 719 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_fetch)
NOTE: recipe libmicrohttpd-native-1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 720 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb:do_patch)
NOTE: recipe libidn2-native-2.3.8-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_patch: Started
NOTE: Running task 738 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_write_config)
NOTE: recipe openssl-3.5.7-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 739 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_patch)
NOTE: recipe openssl-3.5.7-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 751 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: recipe libmicrohttpd-native-1.0.9-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_patch: Started
NOTE: Running task 752 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_unpack)
NOTE: recipe p11-kit-native-0.26.4-r0: task do_write_config: Started
NOTE: recipe libmicrohttpd-native-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 756 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe p11-kit-native-0.26.4-r0: task do_write_config: Succeeded
NOTE: Running task 758 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.7-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 759 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: recipe util-linux-native-2.42.2-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 761 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_fetch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: Running task 764 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_fetch)
NOTE: recipe xz-5.8.3-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 767 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_fetch)
NOTE: recipe xz-5.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 771 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_fetch)
NOTE: recipe libcap-2.78-r0: task do_fetch: Started
NOTE: recipe gnutls-native-3.8.13-r0: task do_unpack: Succeeded
NOTE: Running task 772 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_fetch: Succeeded
NOTE: Running task 773 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_fetch)
NOTE: recipe python3-native-3.14.7-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Started
NOTE: Running task 774 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_unpack)
NOTE: recipe acl-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 775 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_patch)
NOTE: Running task 776 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_fetch)
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Succeeded
NOTE: Running task 778 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_fetch)
NOTE: recipe nettle-4.0-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_patch: Succeeded
NOTE: Running task 782 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe nettle-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 784 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe gnutls-native-3.8.13-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 785 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe python3-native-3.14.7-r0: task do_patch: Started
NOTE: recipe xz-5.8.3-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.195-r0: task do_unpack: Succeeded
NOTE: Running task 786 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_patch)
NOTE: recipe xz-5.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 787 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_patch)
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 790 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_patch: Succeeded
NOTE: Running task 811 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_unpack)
NOTE: recipe elfutils-native-0.195-r0: task do_patch: Started
NOTE: recipe libcap-2.78-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.13-r0: task do_patch: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_patch: Started
NOTE: Running task 813 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_unpack)
NOTE: recipe libcap-2.78-r0: task do_unpack: Succeeded
NOTE: Running task 814 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_patch)
NOTE: recipe acl-2.4.0-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Started
NOTE: recipe xz-5.8.3-r0: task do_patch: Succeeded
NOTE: Running task 815 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_unpack)
NOTE: recipe acl-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 816 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_patch)
NOTE: recipe glibc-2.44+git-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.78-r0: task do_patch: Started
NOTE: Running task 817 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_patch)
NOTE: recipe nettle-4.0-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_patch: Started
NOTE: Running task 818 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_patch: Started
NOTE: Running task 819 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 820 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Succeeded
NOTE: Running task 821 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_patch)
NOTE: recipe nettle-4.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: Running task 822 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_patch)
NOTE: Running task 823 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_patch)
NOTE: recipe acl-2.4.0-r0: task do_patch: Succeeded
NOTE: Running task 824 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_unpack)
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe openssl-3.5.7-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Started
NOTE: Running task 825 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_patch)
NOTE: recipe libxcrypt-4.5.2-r0: task do_patch: Started
NOTE: recipe nettle-4.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.7-r0: task do_patch: Started
NOTE: recipe elfutils-native-0.195-r0: task do_patch: Succeeded
NOTE: Running task 828 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe libxcrypt-4.5.2-r0: task do_patch: Succeeded
NOTE: Running task 849 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 853 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 857 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: Running task 865 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx)
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe nettle-4.0-r0: task do_patch: Succeeded
NOTE: Running task 866 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_patch)
NOTE: Running task 870 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_fetch)
NOTE: recipe libpsl-0.23.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.23.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_fetch: Started
NOTE: Running task 871 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_unpack)
NOTE: recipe curl-8.21.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 872 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_unpack)
NOTE: Running task 875 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe json-c-0.19-r0: task do_fetch: Started
NOTE: recipe json-c-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 878 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe libpsl-0.23.1-r0: task do_unpack: Started
NOTE: recipe python3-native-3.14.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe curl-8.21.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.7-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Succeeded
NOTE: Running task 882 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_fetch)
NOTE: Running task 884 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 885 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: Running task 887 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch)
NOTE: recipe libgcrypt-1.12.2-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: Running task 888 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_unpack)
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 891 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Succeeded
NOTE: Running task 894 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 895 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_patch)
NOTE: recipe json-c-0.19-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 896 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe python3-native-3.14.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: Running task 898 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: Running task 899 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: Running task 900 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_recipe_spdx)
NOTE: recipe json-c-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 901 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_patch)
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Started
NOTE: recipe libpsl-0.23.1-r0: task do_unpack: Succeeded
NOTE: Running task 902 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe curl-8.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 903 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_patch)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_unpack: Started
NOTE: Running task 904 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Started
NOTE: recipe json-c-0.19-r0: task do_patch: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_patch: Started
NOTE: Running task 906 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_write_config)
NOTE: recipe curl-8.21.0-r0: task do_patch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: recipe json-c-0.19-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_write_config: Started
NOTE: Running task 909 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_unpack)
NOTE: recipe glibc-2.44+git-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_patch: Succeeded
NOTE: Running task 915 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_fetch)
NOTE: Running task 918 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: recipe libpsl-0.23.1-r0: task do_write_config: Succeeded
NOTE: Running task 933 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_generate_toolchain_file)
NOTE: recipe libarchive-3.8.9-r0: task do_unpack: Started
NOTE: recipe expat-2.8.2-r0: task do_fetch: Started
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: recipe expat-2.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 937 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_recipe_spdx)
NOTE: Running task 939 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: Running task 941 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_fetch)
NOTE: Running task 942 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_unpack)
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: Running task 943 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Started
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: Running task 956 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_fetch)
NOTE: recipe expat-2.8.2-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Succeeded
NOTE: Running task 958 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_fetch)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: recipe lzlib-1.16-r0: task do_fetch: Started
NOTE: recipe lzlib-1.16-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_unpack: Succeeded
NOTE: recipe file-5.48-r0: task do_fetch: Started
NOTE: Running task 959 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_unpack)
NOTE: Running task 960 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_patch)
NOTE: recipe expat-2.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 961 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_patch)
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 962 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_unpack)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Started
NOTE: recipe libarchive-3.8.9-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_unpack: Succeeded
NOTE: recipe p11-kit-native-0.26.4-r0: task do_fetch: Succeeded
NOTE: Running task 963 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_patch)
NOTE: Running task 964 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_unpack)
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 967 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb:do_fetch)
NOTE: Running task 968 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_create_recipe_spdx)
NOTE: recipe expat-2.8.2-r0: task do_patch: Started
NOTE: recipe file-5.48-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_unpack: Started
NOTE: Running task 970 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_fetch)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Succeeded
NOTE: Running task 971 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_patch)
NOTE: recipe libgcrypt-1.12.2-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.9-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 974 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_unpack)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.8.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 975 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe p11-kit-native-0.26.4-r0: task do_unpack: Started
NOTE: recipe elfutils-0.195-r0: task do_fetch: Started
NOTE: Running task 977 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_generate_toolchain_file)
NOTE: recipe libarchive-3.8.9-r0: task do_patch: Succeeded
NOTE: Running task 979 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_unpack)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Started
NOTE: recipe elfutils-0.195-r0: task do_fetch: Succeeded
NOTE: Running task 980 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb:do_unpack)
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Succeeded
NOTE: Running task 981 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: recipe lzlib-1.16-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe lzlib-1.16-r0: task do_unpack: Succeeded
NOTE: Running task 982 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_patch)
NOTE: recipe expat-2.8.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe file-5.48-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.9-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Started
NOTE: recipe expat-2.8.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 984 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_unpack)
NOTE: recipe lzlib-1.16-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: Running task 987 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_fetch)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Succeeded
NOTE: Running task 990 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: recipe elfutils-0.195-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_fetch: Started
NOTE: recipe lzlib-1.16-r0: task do_patch: Succeeded
NOTE: Running task 991 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_fetch)
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 995 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
NOTE: Running task 996 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb:do_patch)
NOTE: Running task 997 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.7.1.bb:do_fetch)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_patch: Succeeded
NOTE: recipe sed-4.10-r0: task do_fetch: Started
NOTE: Running task 998 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_create_recipe_spdx)
NOTE: Running task 1001 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Started
NOTE: recipe sed-4.10-r0: task do_fetch: Succeeded
NOTE: Running task 1002 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa)
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-1.0.9-r0: task do_patch: Started
NOTE: recipe libffi-3.7.1-r0: task do_fetch: Started
NOTE: Running task 1004 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_fetch)
NOTE: recipe libffi-3.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1006 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_fetch)
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1007 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_unpack)
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1010 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_unpack)
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Succeeded
NOTE: Running task 1011 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_unpack)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa: Started
NOTE: recipe coreutils-9.11-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_fetch: Succeeded
NOTE: Running task 1013 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_unpack)
NOTE: Running task 1014 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.7.1.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_unpack: Started
NOTE: recipe bash-5.3-r0: task do_unpack: Started
NOTE: recipe sed-4.10-r0: task do_unpack: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Started
NOTE: recipe libffi-3.7.1-r0: task do_unpack: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1016 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_fetch)
NOTE: recipe ncurses-6.6-r0: task do_unpack: Succeeded
NOTE: recipe file-5.48-r0: task do_unpack: Succeeded
NOTE: Running task 1017 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_patch)
NOTE: recipe libffi-3.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1018 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_patch)
NOTE: Running task 1020 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_patch)
NOTE: recipe perl-5.44.0-r0: task do_fetch: Started
NOTE: recipe sed-4.10-r0: task do_unpack: Succeeded
NOTE: Running task 1021 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_patch)
NOTE: recipe file-5.48-r0: task do_patch: Started
NOTE: recipe ncurses-6.6-r0: task do_patch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1022 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1023 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_fetch)
NOTE: recipe sed-4.10-r0: task do_patch: Started
NOTE: recipe file-5.48-r0: task do_patch: Succeeded
NOTE: Running task 1025 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.7.1.bb:do_patch)
NOTE: recipe bash-5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1026 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_patch)
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Succeeded
NOTE: recipe sed-4.10-r0: task do_patch: Succeeded
NOTE: Running task 1027 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: Running task 1028 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_unpack)
NOTE: recipe python3-3.14.7-r0: task do_fetch: Started
NOTE: recipe libffi-3.7.1-r0: task do_patch: Started
NOTE: recipe bash-5.3-r0: task do_patch: Started
NOTE: recipe python3-3.14.7-r0: task do_fetch: Succeeded
NOTE: Running task 1029 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_unpack)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Succeeded
NOTE: Running task 1030 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_patch)
NOTE: recipe python3-3.14.7-r0: task do_unpack: Started
NOTE: recipe libffi-3.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1031 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_unpack)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1032 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe elfutils-0.195-r0: task do_unpack: Succeeded
NOTE: Running task 1033 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_patch)
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe coreutils-9.11-r0: task do_unpack: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe elfutils-0.195-r0: task do_patch: Started
NOTE: Running task 1035 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.0.bb:do_fetch)
NOTE: recipe ncurses-6.6-r0: task do_patch: Succeeded
NOTE: Running task 1038 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_fetch)
NOTE: recipe bash-5.3-r0: task do_patch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1041 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_create_recipe_spdx)
NOTE: Running task 1044 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.20.0-r0: task do_fetch: Started
NOTE: Running task 1045 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_patch)
NOTE: recipe bash-completion-2.17.0-r0: task do_fetch: Started
NOTE: recipe p11-kit-native-0.26.4-r0: task do_unpack: Succeeded
NOTE: Running task 1046 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_patch)
NOTE: recipe bash-completion-2.17.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 1050 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_fetch)
NOTE: Running task 1057 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.0.bb:do_unpack)
NOTE: recipe readline-8.3-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_patch: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.4.1-r0: task do_fetch: Started
NOTE: Running task 1058 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_unpack)
NOTE: recipe shadow-4.20.0-r0: task do_unpack: Started
NOTE: recipe p11-kit-native-0.26.4-r0: task do_patch: Started
NOTE: recipe p11-kit-native-0.26.4-r0: task do_patch: Succeeded
NOTE: recipe qemu-native-11.0.3-r0: task do_unpack: Started
NOTE: recipe perl-5.44.0-r0: task do_fetch: Succeeded
NOTE: Running task 1060 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_unpack)
NOTE: Running task 1061 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_unpack)
NOTE: recipe bash-completion-2.17.0-r0: task do_unpack: Started
NOTE: recipe perl-5.44.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1062 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_create_recipe_spdx)
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1064 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_patch)
NOTE: Running task 1077 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_fetch)
NOTE: recipe coreutils-9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1078 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_patch)
NOTE: recipe meson-native-1.11.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe elfutils-0.195-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_patch: Succeeded
NOTE: Running task 1081 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe libcap-ng-0.9.3-r0: task do_fetch: Started
NOTE: Running task 1084 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_fetch)
NOTE: recipe coreutils-9.11-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1086 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_fetch)
NOTE: recipe bash-completion-2.17.0-r0: task do_patch: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Started
NOTE: Running task 1089 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_fetch)
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1090 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_fetch)
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Started
NOTE: recipe meson-native-1.11.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1106 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe util-linux-2.42.2-r0: task do_fetch: Started
NOTE: recipe findutils-4.10.0-r0: task do_fetch: Started
NOTE: recipe util-linux-2.42.2-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 1107 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_unpack)
NOTE: Running task 1108 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1109 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe coreutils-9.11-r0: task do_patch: Succeeded
NOTE: Running task 1111 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_create_recipe_spdx)
NOTE: recipe libmpc-1.4.1-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1112 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_unpack)
NOTE: recipe libmpc-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1113 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Succeeded
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe shadow-4.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 1114 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_unpack)
NOTE: Running task 1115 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.0.bb:do_patch)
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Started
NOTE: recipe libmpc-1.4.1-r0: task do_patch: Started
NOTE: recipe shadow-4.20.0-r0: task do_patch: Started
NOTE: recipe util-linux-2.42.2-r0: task do_unpack: Started
NOTE: recipe libmpc-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1117 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_fetch)
NOTE: recipe perl-5.44.0-r0: task do_unpack: Succeeded
NOTE: Running task 1118 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_patch)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe binutils-2.47-r0: task do_fetch: Started
NOTE: Running task 1133 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: recipe perl-5.44.0-r0: task do_patch: Started
NOTE: recipe shadow-4.20.0-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.47-r0: task do_fetch: Succeeded
NOTE: Running task 1135 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 1136 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb:do_fetch)
NOTE: recipe tzdata-2026c-r0: task do_fetch: Started
WARNING: gawk-5.4.1-r0 do_fetch: Failed to fetch URL https://ftpmirror.gnu.org/gnu/gawk/gawk-5.4.1.tar.xz, attempting MIRRORS if available
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Started
NOTE: recipe ca-certificates-20260601-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1140 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe ca-certificates-20260601-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_unpack: Succeeded
NOTE: Running task 1148 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_patch)
NOTE: Running task 1150 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_unpack)
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 1151 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_patch)
NOTE: recipe binutils-2.47-r0: task do_unpack: Started
NOTE: recipe python3-3.14.7-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1152 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_patch)
NOTE: recipe libcap-ng-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 1161 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_create_recipe_spdx)
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Started
NOTE: recipe perl-5.44.0-r0: task do_patch: Succeeded
NOTE: Running task 1171 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1173 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20260601-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20260601-r0: task do_unpack: Succeeded
NOTE: Running task 1175 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe gawk-5.4.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 1176 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_unpack)
NOTE: Running task 1177 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1178 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb:do_patch)
NOTE: Running task 1179 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe gawk-5.4.1-r0: task do_unpack: Started
NOTE: recipe util-linux-2.42.2-r0: task do_patch: Started
NOTE: recipe ca-certificates-20260601-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r0: task do_patch: Started
NOTE: recipe python3-3.14.7-r0: task do_patch: Succeeded
NOTE: Running task 1180 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1181 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_patch)
NOTE: recipe ca-certificates-20260601-r0: task do_patch: Succeeded
NOTE: Running task 1183 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_create_recipe_spdx)
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.4.1-r0: task do_patch: Started
NOTE: recipe util-linux-2.42.2-r0: task do_patch: Succeeded
NOTE: Running task 1185 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx)
NOTE: recipe qemu-native-11.0.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe gawk-5.4.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running noexec task 1213 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_fetch)
NOTE: Running task 1214 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1223 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 43a5eed45be5f03da4b85c3553d0f54d484743ea1bf86e066be2f808a536e5e1
NOTE: Setscene tasks completed
NOTE: Running task 1235 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_recipe_spdx)
NOTE: recipe qemu-native-11.0.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe ca-certificates-20260601-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1236 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_recipe_spdx)
NOTE: recipe ca-certificates-20260601-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1237 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb:do_configure)
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1238 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_create_recipe_spdx)
NOTE: recipe ca-certificates-20260601-r0: task do_configure: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe ca-certificates-20260601-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1239 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb:do_compile)
NOTE: recipe ca-certificates-20260601-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: Running task 1240 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
WARNING: make-4.4.1-r0 do_fetch: Failed to fetch URL https://ftpmirror.gnu.org/gnu/make/make-4.4.1.tar.gz, attempting MIRRORS if available
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1241 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_recipe_spdx)
WARNING: findutils-4.10.0-r0 do_fetch: Failed to fetch URL https://ftpmirror.gnu.org/gnu/findutils/findutils-4.10.0.tar.xz, attempting MIRRORS if available
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe libpsl-0.23.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1242 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_create_recipe_spdx)
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1245 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_create_recipe_spdx)
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx: Started
NOTE: recipe curl-8.21.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe ca-certificates-20260601-r0: task do_compile: Succeeded
NOTE: Running task 1246 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb:do_install)
NOTE: recipe util-linux-native-2.42.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe curl-8.21.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe util-linux-native-2.42.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_fetch: Succeeded
NOTE: Running task 1247 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_unpack)
NOTE: Running task 1248 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_unpack)
NOTE: Running task 1249 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: Running task 1251 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: Running task 1256 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_create_recipe_spdx)
NOTE: Running task 1257 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_create_recipe_spdx)
NOTE: Running task 1258 of 2115 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_create_recipe_spdx)
NOTE: Running task 1274 of 2115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.0.bb:do_create_recipe_spdx)
NOTE: recipe ca-certificates-20260601-r0: task do_install: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe findutils-4.10.0-r0: task do_unpack: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe shadow-4.20.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gnutls-3.8.13-r0: task do_create_recipe_spdx: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-native-3.14.7-r0: task do_patch: Failed
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
WARNING: readline-8.3-r0 do_fetch: Failed to fetch URL https://ftpmirror.gnu.org/gnu/readline/readline-8.3.tar.gz;name=archive, attempting MIRRORS if available
NOTE: recipe findutils-4.10.0-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe shadow-4.20.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe readline-8.3-r0: task do_fetch: Succeeded
NOTE: recipe ca-certificates-20260601-r0: task do_install: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.47-r0: task do_unpack: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Succeeded
NOTE: recipe tzdata-2026c-r0: task do_fetch: Succeeded
NOTE: recipe qemu-native-11.0.3-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1275 tasks of which 993 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260806055202.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260806055202.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-native/3.14.7/temp/log.do_patch.2630130
Summary: There were 4 WARNING messages.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-native-3.14.7-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-native/3.14.7/sources/Python-3.14.7'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-native/3.14.7/recipe-sysroot-native/etc/quiltrc push', 1, 'stdout: Patch 0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-native/3.14.7/temp/log.do_patch.2630130
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_patch) failed with exit code '1'

--===============9104330730762520242==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-upgrade-3.14.6-3.14.7.patch"

RnJvbSA4YTI5ZjFkZWVjMzM4ZWY4ZDM2NjMxNDY3YWIzNDk0NDYxODU1ZGIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNiBBdWcgMjAyNiAwNTo1MjoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjM6IHVwZ3JhZGUgMy4xNC42IC0+IDMuMTQuNwoKU291cmNlOiBNaXNjL05FV1MKCldoYXQn
cyBOZXcgaW4gUHl0aG9uIDMuMTQuNyBmaW5hbD8KPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQoKKlJlbGVhc2UgZGF0ZTogMjAyNi0wOC0wNSoKClNlY3VyaXR5Ci0tLS0tLS0tCgot
IGdoLTE1MzAzMDogRml4ZWQgcXVhZHJhdGljIGNvbXBsZXhpdHkgaW4gaW5jcmVtZW50YWwgcGFy
c2luZyBvZiBsb25nCiAgdW50ZXJtaW5hdGVkIGNvbnN0cnVjdHMgKHN1Y2ggYXMgdGFncyBvciBj
b21tZW50cykgaW4KICA6Y2xhc3M6YGh0bWwucGFyc2VyLkhUTUxQYXJzZXJgLCB3aGljaCBjb3Vs
ZCBiZSBleHBsb2l0ZWQgZm9yIGEgZGVuaWFsIG9mCiAgc2VydmljZS4KCi0gZ2gtMTUyNjc0OiBU
aGUgOmNsYXNzOmB4bWwuZXRyZWUuRWxlbWVudFRyZWUuRWxlbWVudGAgbWV0aG9kcwogIDptZXRo
OmB+eG1sLmV0cmVlLkVsZW1lbnRUcmVlLkVsZW1lbnQuZmluZGFsbGAsCiAgOm1ldGg6YH54bWwu
ZXRyZWUuRWxlbWVudFRyZWUuRWxlbWVudC5pdGVyZmluZGAgYW5kCiAgOm1ldGg6YH54bWwuZXRy
ZWUuRWxlbWVudFRyZWUuRWxlbWVudC5maW5kYCBhdm9pZCBxdWFkcmF0aWMgYmVoYXZpb3Igd2hl
bgogIHVzaW5nIFhQYXRoIGluZGV4IHByZWRpY2F0ZXMgKGBgWzFdYGAsIGBgW2xhc3QoKV1gYCwg
YGBbbGFzdCgpLU5dYGApIG9uCiAgWE1MIGRvY3VtZW50cyB3aXRoIG1hbnkgc2FtZS10YWcgc2li
bGluZ3MuCgotIGdoLTE1MjIxNjogVXBkYXRlIGJ1bmRsZWQgYGxpYmV4cGF0IDxodHRwczovL2xp
YmV4cGF0LmdpdGh1Yi5pby8+YF8gdG8KICB2ZXJzaW9uIDIuOC4yLgoKLSBnaC0xNTE5ODc6IFRo
ZSA6bWV0aDpgdGFyZmlsZS5UYXJGaWxlLmV4dHJhY3RgIG1ldGhvZCBub3cgYXBwbGllcyB0aGUK
ICBnaXZlbiBmaWx0ZXIgd2hlbiBpdCBleHRyYWN0cyBhIGxpbmsgdGFyZ2V0IGZyb20gdGhlIGFy
Y2hpdmUgYXMgYQogIGZhbGxiYWNrLgoKLSBnaC0xNTE5ODE6IEluIDptb2Q6YHRhcmZpbGVgLCBz
ZWVraW5nIGEgc3RyZWFtIG5vdyBzdG9wcyB3aGVuIGVuZCBvZiB0aGUKICBzdHJlYW0gaXMgcmVh
Y2hlZC4KCi0gZ2gtMTUxNTQ0OiA6ZmlsZTpgTW9kdWxlcy9TZXR1cC5sb2NhbGAgaXMgbm8gbG9u
Z2VyIHVzZWQgYXMgYSBsYW5kbWFyayB0bwogIGRpc2NvdmVyIHdoZXRoZXIgUHl0aG9uIGlzIHJ1
bm5pbmcgaW4gYSBzb3VyY2UgdHJlZSwgYXMgaXQgY291bGQKICBwb3RlbnRpYWxseSBhZmZlY3Qg
YWN0dWFsIGluc3RhbGxzLiBUaGUgOmZpbGU6YHB5YnVpbGRkaXIudHh0YCBmaWxlIGlzIG5vdwog
IHRoZSBzb2xlIGluZGljYXRvciBvZiBydW5uaW5nIGluIGEgc291cmNlIHRyZWUuCgotIGdoLTE1
MTU1ODogRml4ZWQgYW4gdnVsbmVyYWJpbGl0eSBpbiB0aGUgOm1vZDpgdGFyZmlsZWAgYGBkYXRh
YGAgYW5kCiAgYGB0YXJgYCBleHRyYWN0aW9uIGZpbHRlcnMgd2hlcmUgY3JhZnRlZCBhcmNoaXZl
cyBjb3VsZCBjcmVhdGUgYSBzeW1saW5rCiAgcG9pbnRpbmcgb3V0c2lkZSB0aGUgZGVzdGluYXRp
b24gZGlyZWN0b3J5LiBUaGlzIHdhcyBhIGJ5cGFzcyBvZgogIDpjdmU6YDIwMjUtNDMzMGAuCgot
IGdoLTE1MDc0MzogOm1vZDpgaHR0cC5jbGllbnRgIG5vdyBsaW1pdHMgdGhlIG51bWJlciBvZiBj
aHVua2VkLXJlc3BvbnNlCiAgdHJhaWxlciBsaW5lcyBpdCB3aWxsIHJlYWQgdG8gMTAwLCBhbmQg
dGhlIG51bWJlciBvZiBpbnRlcmltICgxeHgpCiAgcmVzcG9uc2VzIGl0IHdpbGwgc2tpcCB0byAx
MDAuICBBIG1hbGljaW91cyBvciBicm9rZW4gc2VydmVyIGNvdWxkCiAgcHJldmlvdXNseSBzdHJl
YW0gdHJhaWxlciBsaW5lcyBvciBgYDEwMCBDb250aW51ZWBgIHJlc3BvbnNlcyBmb3JldmVyLAog
IGhhbmdpbmcgdGhlIGNsaWVudCBldmVuIHdoZW4gYSBzb2NrZXQgdGltZW91dCB3YXMgaW4gdXNl
LiBSZXBvcnRlZCBieQogIGBgQFlMQ2hlbi0wMDdgYCB2aWEgR0hTQS13NHEyLWcyMnctNmZyNC4K
Ci0gZ2gtMTQzOTI3OiBOb3JtYWxpemUgYWxsIGxpbmUgZW5kaW5ncyAoQ1IsIENSTEYsIGFuZCBM
RikgdG8gTEYrVEFCIHdoZW4KICB3cml0aW5nIG11bHRpLWxpbmUgY29uZmlncGFyc2VyIHZhbHVl
cy4KCi0gZ2gtMTQzOTIxOiBSZWplY3QgTlVMLCBDUiBhbmQgTEYgY2hhcmFjdGVycyBpbiBJTUFQ
IGNvbW1hbmRzLiBPdGhlcgogIGNvbnRyb2wgY2hhcmFjdGVycyBhcmUgYWxsb3dlZCBhbmQgc2Vu
dCBxdW90ZWQuCgpDb3JlIGFuZCBCdWlsdGlucwotLS0tLS0tLS0tLS0tLS0tLQoKLSBnaC0xMzM5
MzE6IEZpeCBkYXRhIHJhY2VzIHdoZW4gc2V0dGluZyBhdHRyaWJ1dGVzIG9mIGZ1bmN0aW9uIG9i
amVjdHMgb24KICB0aGUgOnRlcm06YGZyZWUgdGhyZWFkZWQgPGZyZWUgdGhyZWFkaW5nPmAgYnVp
bGQuCgotIGdoLTE1NDcwOTogRml4IGFuIG91dC1vZi1ib3VuZHMgYWNjZXNzIGluIHJldmVyc2Ug
ZGljdGlvbmFyeSBpdGVyYXRvcnMKICB3aGVuIHRoZSB1bmRlcmx5aW5nIGRpY3Rpb25hcnkgaXMg
Y2xlYXJlZCBhbmQgbW9kaWZpZWQgYWZ0ZXIgdGhlIGl0ZXJhdG9yCiAgaXMgY3JlYXRlZC4KCi0g
Z2gtMTU0Njk1OiBGaXggOmNsYXNzOmBhc3luY2lvLlRhc2tgIHJhaXNpbmcgOmV4YzpgQXR0cmli
dXRlRXJyb3JgIHdoZW4KICBjcmVhdGVkIHdpdGggYGBlYWdlcl9zdGFydD1UcnVlYGAgYW5kIG5v
IGV4cGxpY2l0ICpsb29wKiBhcmd1bWVudC4KCi0gZ2gtMTUzODA5OiBGaXggaW50ZXJwcmV0ZXIg
Y3Jhc2ggd2hpbGUgZGVhbGxvY2F0aW5nIG9iamVjdHMgb2YKICA6Y2xhc3M6YGFzeW5jaW8uVGFz
a2Agb24gZnJlZS10aHJlYWRlZCBidWlsZHMuIENvbnRyaWJ1dGVkIGJ5IFNlcmdleQogIE1pcnlh
bm92LgoKLSBnaC0xNTQyNzU6IEZpeCBhIGNyYXNoIHdoZW4gZ2V0dGluZyBkZWVwbHkgbmVzdGVk
IGBgX19wYXJhbWV0ZXJzX19gYCBmcm9tCiAgYSA6Y2xhc3M6YHR5cGVzLkdlbmVyaWNBbGlhc2Ag
b2JqZWN0cy4KCi0gZ2gtMTUzOTMyOiBGaXggdGhyZWFkIHNhZmV0eSBpc3N1ZSBpbiB0aGUgYGBf
X3JlZHVjZV9fYGAKCltDaGFuZ2Vsb2cgdHJ1bmNhdGVkIGFzIGl0IGV4Y2VlZHMgMzAwMCBjaGFy
YWN0ZXJzOwp0aGUgZnVsbCBjaGFuZ2Vsb2cgY2FuIGJlIGZvdW5kIGluIGFuIGF0dGFjaG1lbnQg
dG8gdGhlIEFVSCBlbWFpbF0KLS0tCiAuLi5zaGViYW5nLW92ZXJmbG93LW9uLXB5dGhvbi1jb25m
aWcucHkucGF0Y2ggfCAgIDYgKy0KIC4uLmUtc3RkaW4tSS1PLWVycm9ycy1zYW1lLXdheS1hcy1t
YXN0ZS5wYXRjaCB8ICAgNCArLQogLi4uLXVzZS1wcmVmaXgtdmFsdWUtZnJvbS1idWlsZC1jb25m
aWd1LnBhdGNoIHwgICA3ICstCiAuLi4tcWVtdS13cmFwcGVyLXdoZW4tZ2F0aGVyaW5nLXByb2Zp
bGUucGF0Y2ggfCAgIDkgKy0KIC4uLmVzdF9zeXNjb25maWctZm9yLXBvc2l4X3VzZXItcHVyZWxp
Yi5wYXRjaCB8ICAgNCArLQogLi4uLzAwMDEtcHJlZmVyLXZhbGlkLWVudHJ5cG9pbnRzLnBhdGNo
ICAgICAgIHwgICAyICstCiAuLi5nLnB5LXVzZS1wbGF0bGliZGlyLWFsc28tZm9yLXB1cmVsaWIu
cGF0Y2ggfCAgIDQgKy0KIC4uLmxlLnB5LWNvcnJlY3QtdGhlLXRlc3Qtb3V0cHV0LWZvcm1hdC5w
YXRjaCB8ICAgNiArLQogLi4uL3B5dGhvbi9weXRob24zL0NWRS0yMDI2LTExOTQwLnBhdGNoICAg
ICAgIHwgIDY3IC0tLS0tLS0tLS0KIC4uLi9weXRob24vcHl0aG9uMy9DVkUtMjAyNi0xMTk3Mi5w
YXRjaCAgICAgICB8ICA2MSAtLS0tLS0tLS0KIC4uLi9weXRob24vcHl0aG9uMy9DVkUtMjAyNi00
MzYwLnBhdGNoICAgICAgICB8IDEyNSArLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9weXRob24vcHl0
aG9uMy9tYWtlcmFjZS5wYXRjaCAgICAgICAgICAgICB8ICAgNiArLQogLi4uL3B5dGhvbi9weXRo
b24zL3ZhbGlkLWRpc3RzLnBhdGNoICAgICAgICAgIHwgICAyICstCiAuLi4ve3B5dGhvbjNfMy4x
NC42LmJiID0+IHB5dGhvbjNfMy4xNC43LmJifSAgfCAgIDUgKy0KIDE0IGZpbGVzIGNoYW5nZWQs
IDI3IGluc2VydGlvbnMoKyksIDI4MSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvQ1ZFLTIwMjYtMTE5NDAucGF0Y2gK
IGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMv
Q1ZFLTIwMjYtMTE5NzIucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3tweXRob24zXzMuMTQuNi5iYiA9PiBweXRob24zXzMuMTQuNy5iYn0gKDk5JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1Bdm9pZC1zaGVi
YW5nLW92ZXJmbG93LW9uLXB5dGhvbi1jb25maWcucHkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1Bdm9pZC1zaGViYW5nLW92ZXJmbG93LW9uLXB5dGhv
bi1jb25maWcucHkucGF0Y2gKaW5kZXggYzIxMDZmOTQzNy4uN2E2MDUzODM2NCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtQXZvaWQtc2hlYmFu
Zy1vdmVyZmxvdy1vbi1weXRob24tY29uZmlnLnB5LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLUF2b2lkLXNoZWJhbmctb3ZlcmZsb3ctb24tcHl0
aG9uLWNvbmZpZy5weS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmIxMTFhMzI4YzFjNTdi
MTU4MGQ2Mzg5NGIyYjVkMzM3MzE2ZjZkNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
M2YyZGYwZTFmY2U4Yzc0MjU5OThkYWRlMDBkMDg0ZjFiMTAxYTk4MiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IFBhdWxvIE5ldmVzIDxwdHNuZXZlc0BnbWFpbC5jb20+CiBEYXRlOiBU
dWUsIDcgSnVuIDIwMjIgMTY6MTY6NDEgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gQXZvaWQgc2hl
YmFuZyBvdmVyZmxvdyBvbiBweXRob24tY29uZmlnLnB5CkBAIC0xNiwxMCArMTYsMTAgQEAgVXBz
dHJlYW0tU3RhdHVzOiBEZW5pZWQgW2Rpc3RyaWJ1dGlvbl0KICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5wcmUuaW4gYi9NYWtlZmlsZS5w
cmUuaW4KLWluZGV4IDllYzNhNzEuLmY3ZDUzODIgMTAwNjQ0CitpbmRleCBlOTQ2MDE4Li4zNDVl
ZDI5IDEwMDY0NAogLS0tIGEvTWFrZWZpbGUucHJlLmluCiArKysgYi9NYWtlZmlsZS5wcmUuaW4K
LUBAIC0yODI5LDYgKzI4MjksOCBAQCBweXRob24tY29uZmlnOiAkKHNyY2RpcikvTWlzYy9weXRo
b24tY29uZmlnLmluIE1pc2MvcHl0aG9uLWNvbmZpZy5zaAorQEAgLTI4MzUsNiArMjgzNSw4IEBA
IHB5dGhvbi1jb25maWc6ICQoc3JjZGlyKS9NaXNjL3B5dGhvbi1jb25maWcuaW4gTWlzYy9weXRo
b24tY29uZmlnLnNoCiAgCUAgIyBTdWJzdGl0dXRpb24gaGFwcGVucyBoZXJlLCBhcyB0aGUgY29t
cGxldGVseS1leHBhbmRlZCBCSU5ESVIKICAJQCAjIGlzIG5vdCBhdmFpbGFibGUgaW4gY29uZmln
dXJlCiAgCXNlZCAtZSAicyxARVhFTkFNRUAsJChFWEVOQU1FKSwiIDwgJChzcmNkaXIpL01pc2Mv
cHl0aG9uLWNvbmZpZy5pbiA+cHl0aG9uLWNvbmZpZy5weQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtTGliLXB0eS5weS1oYW5kbGUtc3RkaW4t
SS1PLWVycm9ycy1zYW1lLXdheS1hcy1tYXN0ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy8wMDAxLUxpYi1wdHkucHktaGFuZGxlLXN0ZGluLUktTy1lcnJvcnMt
c2FtZS13YXktYXMtbWFzdGUucGF0Y2gKaW5kZXggZDkwNzJhMzZmNy4uNTMyYWRmZTY5YSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtTGliLXB0
eS5weS1oYW5kbGUtc3RkaW4tSS1PLWVycm9ycy1zYW1lLXdheS1hcy1tYXN0ZS5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1MaWItcHR5LnB5LWhh
bmRsZS1zdGRpbi1JLU8tZXJyb3JzLXNhbWUtd2F5LWFzLW1hc3RlLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAxMjllZTc1ODYzMDgxZDllMzQxOGFjY2EzZGYxZTQ3NjY3ZjY3MWFkIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5Y2Q0NDQyOTIxNTM1MmViMjc1M2UwZmQ4ZTI1ZmVm
MjRmNzE0MDA2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IFRodSwgMTYgU2VwIDIwMjEgMTY6MzU6Mzcg
KzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gTGliL3B0eS5weTogaGFuZGxlIHN0ZGluIEkvTyBlcnJv
cnMgc2FtZSB3YXkgYXMgbWFzdGVyIEkvTwpAQCAtMjksNyArMjksNyBAQCBTaWduZWQtb2ZmLWJ5
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL0xpYi9wdHku
cHkgYi9MaWIvcHR5LnB5Ci1pbmRleCAxZDk3OTk0Li5mYTg4MjFiIDEwMDY0NAoraW5kZXggNGIy
NWFjMy4uZDZhYWMwNyAxMDA2NDQKIC0tLSBhL0xpYi9wdHkucHkKICsrKyBiL0xpYi9wdHkucHkK
IEBAIC0xNDksNyArMTQ5LDEwIEBAIGRlZiBfY29weShtYXN0ZXJfZmQsIG1hc3Rlcl9yZWFkPV9y
ZWFkLCBzdGRpbl9yZWFkPV9yZWFkKToKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy8wMDAxLUxpYi1zeXNjb25maWcucHktdXNlLXByZWZpeC12YWx1ZS1m
cm9tLWJ1aWxkLWNvbmZpZ3UucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMvMDAwMS1MaWItc3lzY29uZmlnLnB5LXVzZS1wcmVmaXgtdmFsdWUtZnJvbS1idWlsZC1j
b25maWd1LnBhdGNoCmluZGV4IDI4NTU4MDE5NWIuLjYwMzkxZTcyNmIgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLUxpYi1zeXNjb25maWcucHkt
dXNlLXByZWZpeC12YWx1ZS1mcm9tLWJ1aWxkLWNvbmZpZ3UucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtTGliLXN5c2NvbmZpZy5weS11c2UtcHJl
Zml4LXZhbHVlLWZyb20tYnVpbGQtY29uZmlndS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
ZTNjNmU3NzBlNzNlMTMyOTk1OGRiMGE3Mzg4M2U0MmIwMTc2M2FlMyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gYjVhYWQ2YTliNmM1YWRkN2E4NTg2MWFlZDhhYTAzMGMxYWQzZDUyZiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxp
bnV0cm9uaXguZGU+CiBEYXRlOiBGcmksIDE3IE5vdiAyMDIzIDE0OjI2OjMyICswMTAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIExpYi9zeXNjb25maWcucHk6IHVzZSBwcmVmaXggdmFsdWUgZnJvbSBidWls
ZCBjb25maWd1cmF0aW9uCkBAIC0xOCw3ICsxOCw3IEBAIFNpZ25lZC1vZmYtYnk6IFRyZXZvciBH
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL0xpYi9zeXNjb25maWcvX19p
bml0X18ucHkgYi9MaWIvc3lzY29uZmlnL19faW5pdF9fLnB5Ci1pbmRleCAyZWNiZmYyMjJmZS4u
Y2VjNTRjYjIzZGMgMTAwNjQ0CitpbmRleCAwYThiY2MwLi5hMjM0MWYyIDEwMDY0NAogLS0tIGEv
TGliL3N5c2NvbmZpZy9fX2luaXRfXy5weQogKysrIGIvTGliL3N5c2NvbmZpZy9fX2luaXRfXy5w
eQogQEAgLTUzOCwxMiArNTM4LDEyIEBAIGRlZiBfaW5pdF9jb25maWdfdmFycygpOgpAQCAtMzks
NiArMzksMyBAQCBpbmRleCAyZWNiZmYyMjJmZS4uY2VjNTRjYjIzZGMgMTAwNjQ0CiAgICAgIF9D
T05GSUdfVkFSU1snaW1wbGVtZW50YXRpb24nXSA9IF9nZXRfaW1wbGVtZW50YXRpb24oKQogICAg
ICBfQ09ORklHX1ZBUlNbJ2ltcGxlbWVudGF0aW9uX2xvd2VyJ10gPSBfZ2V0X2ltcGxlbWVudGF0
aW9uKCkubG93ZXIoKQogICAgICBfQ09ORklHX1ZBUlNbJ2FiaWZsYWdzJ10gPSBhYmlmbGFncwot
LS0gCi0yLjUxLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLzAwMDEtTWFrZWZpbGUucHJlLXVzZS1xZW11LXdyYXBwZXItd2hlbi1nYXRoZXJpbmct
cHJvZmlsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAx
LU1ha2VmaWxlLnByZS11c2UtcWVtdS13cmFwcGVyLXdoZW4tZ2F0aGVyaW5nLXByb2ZpbGUucGF0
Y2gKaW5kZXggZTI1Nzk3ZjU3ZS4uYzdmMTRjYWQxZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtTWFrZWZpbGUucHJlLXVzZS1xZW11LXdyYXBw
ZXItd2hlbi1nYXRoZXJpbmctcHJvZmlsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1NYWtlZmlsZS5wcmUtdXNlLXFlbXUtd3JhcHBlci13aGVu
LWdhdGhlcmluZy1wcm9maWxlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlN2E4YTczODVm
NTYxZjIxNDA1NGNmOTVmMGEyMmJmYTA2NGVlZTBiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBkNmY3N2UzYTkzNDYxNmQxZjZjMDgzYjcxNDRjNTBhMzJlMDhiNzBhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFp
bC5jb20+CiBEYXRlOiBXZWQsIDMwIEphbiAyMDE5IDEyOjQxOjA0ICswMTAwCiBTdWJqZWN0OiBb
UEFUQ0hdIE1ha2VmaWxlLnByZTogdXNlIHFlbXUgd3JhcHBlciB3aGVuIGdhdGhlcmluZyBwcm9m
aWxlIGRhdGEKQEAgLTE1LDEwICsxNSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBUcmV2b3IgR2FtYmxp
biA8dGdhbWJsaW5AYmF5bGlicmUuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLnByZS5pbiBiL01ha2Vm
aWxlLnByZS5pbgotaW5kZXggM2JkNDQ5NWY5NWIuLjhlOGZjNjBiYzc2IDEwMDY0NAoraW5kZXgg
NTI2ZDUwMC4uYTdlNTM2ZCAxMDA2NDQKIC0tLSBhL01ha2VmaWxlLnByZS5pbgogKysrIGIvTWFr
ZWZpbGUucHJlLmluCi1AQCAtODU3LDggKzg1Nyw3IEBAIHByb2ZpbGUtcnVuLXN0YW1wOgorQEAg
LTg2MSw4ICs4NjEsNyBAQCBwcm9maWxlLXJ1bi1zdGFtcDoKICAJIyBlbmFibGVkLgogIAkkKE1B
S0UpIHByb2ZpbGUtZ2VuLXN0YW1wCiAgCSMgTmV4dCwgcnVuIHRoZSBwcm9maWxlIHRhc2sgdG8g
Z2VuZXJhdGUgdGhlIHByb2ZpbGUgaW5mb3JtYXRpb24uCkBAIC0yOCw2ICsyOCwzIEBAIGluZGV4
IDNiZDQ0OTVmOTViLi44ZThmYzYwYmM3NiAxMDA2NDQKICAJJChMTFZNX1BST0ZfTUVSR0VSKQog
IAkjIFJlbW92ZSBwcm9maWxlIGdlbmVyYXRpb24gYmluYXJ5IHNpbmNlIHdlIGFyZSBkb25lIHdp
dGggaXQuCiAgCSQoTUFLRSkgY2xlYW4tcmV0YWluLXByb2ZpbGUKLS0tIAotMi4zOS41Ci0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLVVwZGF0
ZS10ZXN0X3N5c2NvbmZpZy1mb3ItcG9zaXhfdXNlci1wdXJlbGliLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtVXBkYXRlLXRlc3Rfc3lzY29uZmlnLWZv
ci1wb3NpeF91c2VyLXB1cmVsaWIucGF0Y2gKaW5kZXggNmE2MmM2ZGM1Yi4uNTUwOWI3NDc1YSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtVXBk
YXRlLXRlc3Rfc3lzY29uZmlnLWZvci1wb3NpeF91c2VyLXB1cmVsaWIucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtVXBkYXRlLXRlc3Rfc3lzY29u
ZmlnLWZvci1wb3NpeF91c2VyLXB1cmVsaWIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVi
ZjVhYTZlYWUxZmEzZWVkNjY4OTNlNTFhMTg1OGFiNDgxNDI2YjQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGM2MDhjYjRiM2M4YzMxZjFhYTI1YWQxMjY0ZmY1ODczM2ZiOTk3NjkgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBXZW50YW8gWmhhbmcgPHdlbnRhby56aGFuZ0B3
aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCAyMCBNYXIgMjAyMyAxMzozOTo1MiArMDgwMAogU3Vi
amVjdDogW1BBVENIXSBVcGRhdGUgdGVzdF9zeXNjb25maWcgZm9yIHBvc2l4X3VzZXIgcHVyZWxp
YgpAQCAtMjIsNyArMjIsNyBAQCBTaWduZWQtb2ZmLWJ5OiBXZW50YW8gWmhhbmcgPHdlbnRhby56
aGFuZ0B3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvTGliL3Rlc3QvdGVzdF9zeXNjb25maWcucHkgYi9M
aWIvdGVzdC90ZXN0X3N5c2NvbmZpZy5weQotaW5kZXggMWFkZTQ5Mi4uNGU5NDg4OSAxMDA2NDQK
K2luZGV4IDFmZTRiNjguLjM4MzE0MmEgMTAwNjQ0CiAtLS0gYS9MaWIvdGVzdC90ZXN0X3N5c2Nv
bmZpZy5weQogKysrIGIvTGliL3Rlc3QvdGVzdF9zeXNjb25maWcucHkKIEBAIC00MzQsNyArNDM0
LDcgQEAgY2xhc3MgVGVzdFN5c0NvbmZpZyh1bml0dGVzdC5UZXN0Q2FzZSwgVmlydHVhbEVudmly
b25tZW50TWl4aW4pOgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLzAwMDEtcHJlZmVyLXZhbGlkLWVudHJ5cG9pbnRzLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtcHJlZmVyLXZhbGlkLWVudHJ5cG9pbnRzLnBh
dGNoCmluZGV4IDEyNTBkYzlmZjAuLmFlMzY5OGZhYzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLXByZWZlci12YWxpZC1lbnRyeXBvaW50cy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1wcmVm
ZXItdmFsaWQtZW50cnlwb2ludHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGVmMzNhYzI3
ZTNhYzFiOWNiMTU5ZDdlZWMwYWQxYWYxMjBjZDlkYzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDhkN2ZjZjA0YzY1MTM4NDFjNzk4NWU2NGI3NDZiMWVmNWRlMGM0MjYgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4K
IERhdGU6IEZyaSwgMTcgQXByIDIwMjYgMTY6NTM6NDIgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0g
cHJlZmVyIHZhbGlkIGVudHJ5cG9pbnRzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1zeXNjb25maWcucHktdXNlLXBsYXRsaWJkaXItYWxzby1m
b3ItcHVyZWxpYi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8w
MDAxLXN5c2NvbmZpZy5weS11c2UtcGxhdGxpYmRpci1hbHNvLWZvci1wdXJlbGliLnBhdGNoCmlu
ZGV4IGI5YzY4YTk4ZDcuLjc4MDc4MjdkOWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy8wMDAxLXN5c2NvbmZpZy5weS11c2UtcGxhdGxpYmRpci1hbHNv
LWZvci1wdXJlbGliLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy8wMDAxLXN5c2NvbmZpZy5weS11c2UtcGxhdGxpYmRpci1hbHNvLWZvci1wdXJlbGliLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiYmNiMTdkYzFlZDI4M2Y0MWM4Y2Q5NGQzOWY3MDg5
OGYwYzQ1NTgzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjMTBkMWIyOTVhOWZiOTM4
MzY4MzBjY2U0NDFkYTNmMjJlNWM3Y2Q3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
QWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IFN1biwgMTIgU2Vw
IDIwMjEgMjE6NDQ6MzYgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gc3lzY29uZmlnLnB5OiB1c2Ug
cGxhdGxpYmRpciBhbHNvIGZvciBwdXJlbGliCkBAIC0xMyw3ICsxMyw3IEBAIFNpZ25lZC1vZmYt
Ynk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9MaWIvc3lz
Y29uZmlnL19faW5pdF9fLnB5IGIvTGliL3N5c2NvbmZpZy9fX2luaXRfXy5weQotaW5kZXggODBh
ZWYzNC4uZjhlMWM3ZCAxMDA2NDQKK2luZGV4IGZhZjgyNzMuLjBhOGJjYzAgMTAwNjQ0CiAtLS0g
YS9MaWIvc3lzY29uZmlnL19faW5pdF9fLnB5CiArKysgYi9MaWIvc3lzY29uZmlnL19faW5pdF9f
LnB5CiBAQCAtMjksNyArMjksNyBAQCBfSU5TVEFMTF9TQ0hFTUVTID0gewpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtdGVzdF9sb2NhbGUucHkt
Y29ycmVjdC10aGUtdGVzdC1vdXRwdXQtZm9ybWF0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLzAwMDEtdGVzdF9sb2NhbGUucHktY29ycmVjdC10aGUtdGVzdC1v
dXRwdXQtZm9ybWF0LnBhdGNoCmluZGV4IDIwMTI3MWIwYzAuLmE2MGQwODJlMmYgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLXRlc3RfbG9jYWxl
LnB5LWNvcnJlY3QtdGhlLXRlc3Qtb3V0cHV0LWZvcm1hdC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS10ZXN0X2xvY2FsZS5weS1jb3JyZWN0LXRo
ZS10ZXN0LW91dHB1dC1mb3JtYXQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGMxZjNjZjYy
NWMwZjAxMTA2MGRkYWEyYTQwOTZmNmFhMTNkZDFlZTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGYwYWM1YjQ3OWI5OWJmYjdmNWU5MzdhOTQxYjMxYTU5NmY0Y2FhZmMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29t
PgogRGF0ZTogTW9uLCA1IEF1ZyAyMDE5IDE1OjU3OjM5ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hd
IHRlc3RfbG9jYWxlLnB5OiBjb3JyZWN0IHRoZSB0ZXN0IG91dHB1dCBmb3JtYXQKQEAgLTMxLDEw
ICszMSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBk
aWZmIC0tZ2l0IGEvTGliL3Rlc3QvdGVzdF9sb2NhbGUucHkgYi9MaWIvdGVzdC90ZXN0X2xvY2Fs
ZS5weQotaW5kZXggZGE0YmQ3OS4uZmQ5ZTY3ZCAxMDA2NDQKK2luZGV4IGY5MTg0MzUuLjE5MTBh
NDMgMTAwNjQ0CiAtLS0gYS9MaWIvdGVzdC90ZXN0X2xvY2FsZS5weQogKysrIGIvTGliL3Rlc3Qv
dGVzdF9sb2NhbGUucHkKLUBAIC01MDAsNyArNTAwLDcgQEAgY2xhc3MgVGVzdFJlYWxMb2NhbGVz
KHVuaXR0ZXN0LlRlc3RDYXNlKToKK0BAIC00OTksNyArNDk5LDcgQEAgY2xhc3MgVGVzdFJlYWxM
b2NhbGVzKHVuaXR0ZXN0LlRlc3RDYXNlKToKICAgICAgICAgICAgICBzZWxmLnNraXBUZXN0KCd0
ZXN0IG5lZWRzIFR1cmtpc2ggbG9jYWxlJykKICAgICAgICAgIGxvYyA9IGxvY2FsZS5nZXRsb2Nh
bGUobG9jYWxlLkxDX0NUWVBFKQogICAgICAgICAgaWYgdmVyYm9zZToKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy9DVkUtMjAyNi0xMTk0MC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy9DVkUtMjAyNi0xMTk0MC5wYXRj
aApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDVhNTgwMmMzOS4uMDAwMDAwMDAwMAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvQ1ZFLTIwMjYtMTE5NDAu
cGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw2NyArMCwwIEBACi1Gcm9tIGUyNGI0ZTk1NTI0ZmJl
OGNkMGY0NmFhMzI5MmU4MDQwZjBlMDdjODMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9t
OiAiTWlzcyBJc2xpbmd0b24gKGJvdCkiCi0gPDMxNDg4OTA5K21pc3MtaXNsaW5ndG9uQHVzZXJz
Lm5vcmVwbHkuZ2l0aHViLmNvbT4KLURhdGU6IFR1ZSwgMjMgSnVuIDIwMjYgMTU6NTg6NDcgKzAy
MDAKLVN1YmplY3Q6IFtQQVRDSCAxLzJdIGdoLTE1MTU1ODogRml4IHN5bWxpbmsgZXNjYXBlIHZp
YSBgdGFyZmlsZWAKLSBoYXJkbGluay1leHRyYWN0aW9uIGZhbGxiYWNrIChHSC0xNTE1NTkpCi0K
LUNWRTogQ1ZFLTIwMjYtMTE5NDAKLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8v
Z2l0aHViLmNvbS9weXRob24vY3B5dGhvbi9jb21taXQvMjdkZDk3MGJmNmIxN2ViY2E3YzhlZDQ4
NmE0MGFiMDQzZWQ3YWY4Zl0KLQotU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gUm9iaW4gPGJlbmph
bWluLnJvYmluQGJvb3RsaW4uY29tPgotLS0tCi0gTGliL3RhcmZpbGUucHkgICAgICAgICAgIHwg
IDMgKysrCi0gTGliL3Rlc3QvdGVzdF90YXJmaWxlLnB5IHwgMjQgKysrKysrKysrKysrKysrKysr
KysrKysrCi0gMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQg
YS9MaWIvdGFyZmlsZS5weSBiL0xpYi90YXJmaWxlLnB5Ci1pbmRleCBlNjczNGRiMjRmNjQuLjYz
ZjIzNDkwZThhMSAxMDA2NDQKLS0tLSBhL0xpYi90YXJmaWxlLnB5Ci0rKysgYi9MaWIvdGFyZmls
ZS5weQotQEAgLTI3ODIsNiArMjc4Miw5IEBAIGRlZiBtYWtlbGlua193aXRoX2ZpbHRlcihzZWxm
LCB0YXJpbmZvLCB0YXJnZXRwYXRoLAotICAgICAgICAgICAgICAgICAgICAgIm1ha2VsaW5rX3dp
dGhfZmlsdGVyOiBpZiBmaWx0ZXJfZnVuY3Rpb24gaXMgbm90IE5vbmUsICIKLSAgICAgICAgICAg
ICAgICAgICAgICsgImV4dHJhY3Rpb25fcm9vdCBtdXN0IGFsc28gbm90IGJlIE5vbmUiKQotICAg
ICAgICAgICAgIHRyeToKLSsgICAgICAgICAgICAgICAgZmlsdGVyX2Z1bmN0aW9uKAotKyAgICAg
ICAgICAgICAgICAgICAgdW5maWx0ZXJlZC5yZXBsYWNlKG5hbWU9dGFyaW5mby5uYW1lLCBkZWVw
PUZhbHNlKSwKLSsgICAgICAgICAgICAgICAgICAgIGV4dHJhY3Rpb25fcm9vdCkKLSAgICAgICAg
ICAgICAgICAgZmlsdGVyZWQgPSBmaWx0ZXJfZnVuY3Rpb24odW5maWx0ZXJlZCwgZXh0cmFjdGlv
bl9yb290KQotICAgICAgICAgICAgIGV4Y2VwdCBfRklMVEVSX0VSUk9SUyBhcyBjYXVzZToKLSAg
ICAgICAgICAgICAgICAgcmFpc2UgTGlua0ZhbGxiYWNrRXJyb3IodGFyaW5mbywgdW5maWx0ZXJl
ZC5uYW1lKSBmcm9tIGNhdXNlCi1kaWZmIC0tZ2l0IGEvTGliL3Rlc3QvdGVzdF90YXJmaWxlLnB5
IGIvTGliL3Rlc3QvdGVzdF90YXJmaWxlLnB5Ci1pbmRleCBkOTc0YzdkNDZlYzEuLjBmYzc0MTNi
ZThkYiAxMDA2NDQKLS0tLSBhL0xpYi90ZXN0L3Rlc3RfdGFyZmlsZS5weQotKysrIGIvTGliL3Rl
c3QvdGVzdF90YXJmaWxlLnB5Ci1AQCAtNDM0NCw2ICs0MzQ0LDMwIEBAIGRlZiB0ZXN0X3NuZWFr
eV9oYXJkbGlua19mYWxsYmFjayhzZWxmKToKLSAgICAgICAgICAgICAgICAgICAgIHNlbGYuZXhw
ZWN0X2ZpbGUoImJvb20iLCBzeW1saW5rX3RvPScuLi8uLi9saW5rX2hlcmUnKQotICAgICAgICAg
ICAgICAgICAgICAgc2VsZi5leHBlY3RfZmlsZSgiYyIsIHN5bWxpbmtfdG89J2InKQotCi0rICAg
IEBzeW1saW5rX3Rlc3QKLSsgICAgZGVmIHRlc3Rfc25lYWt5X2hhcmRsaW5rX2ZhbGxiYWNrX2Rl
ZXAoc2VsZik6Ci0rICAgICAgICAjIChDVkUtMjAyNi0xMTk0MCkKLSsgICAgICAgIHdpdGggQXJj
aGl2ZU1ha2VyKCkgYXMgYXJjOgotKyAgICAgICAgICAgIGFyYy5hZGQoImEvYi9zIiwgc3ltbGlu
a190bz1vcy5wYXRoLmpvaW4oIi4uIiwgImVzY2FwZSIpKQotKyAgICAgICAgICAgIGFyYy5hZGQo
InMiLCBoYXJkbGlua190bz1vcy5wYXRoLmpvaW4oImEiLCAiYiIsICJzIikpCi0rCi0rICAgICAg
ICB3aXRoIHNlbGYuY2hlY2tfY29udGV4dChhcmMub3BlbigpLCAnZGF0YScpOgotKyAgICAgICAg
ICAgIGUgPSBzZWxmLmV4cGVjdF9leGNlcHRpb24oCi0rICAgICAgICAgICAgICAgIHRhcmZpbGUu
TGlua0ZhbGxiYWNrRXJyb3IsCi0rICAgICAgICAgICAgICAgICJsaW5rICdzJyB3b3VsZCBiZSBl
eHRyYWN0ZWQgYXMgYSBjb3B5IG9mICIKLSsgICAgICAgICAgICAgICAgKyAiJ2EvYi9zJywgd2hp
Y2ggd2FzIHJlamVjdGVkIikKLSsgICAgICAgICAgICBzZWxmLmFzc2VydElzSW5zdGFuY2UoZS5f
X2NhdXNlX18sCi0rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRhcmZpbGUuTGlu
a091dHNpZGVEZXN0aW5hdGlvbkVycm9yKQotKwotKyAgICAgICAgZm9yIGZpbHRlciBpbiAndGFy
JywgJ2Z1bGx5X3RydXN0ZWQnOgotKyAgICAgICAgICAgIHdpdGggc2VsZi5zdWJUZXN0KGZpbHRl
ciksIHNlbGYuY2hlY2tfY29udGV4dChhcmMub3BlbigpLCBmaWx0ZXIpOgotKyAgICAgICAgICAg
ICAgICBpZiBub3Qgb3NfaGVscGVyLmNhbl9zeW1saW5rKCk6Ci0rICAgICAgICAgICAgICAgICAg
ICBzZWxmLmV4cGVjdF9maWxlKCJhLyIpCi0rICAgICAgICAgICAgICAgICAgICBzZWxmLmV4cGVj
dF9maWxlKCJhL2IvIikKLSsgICAgICAgICAgICAgICAgZWxzZToKLSsgICAgICAgICAgICAgICAg
ICAgIHNlbGYuZXhwZWN0X2ZpbGUoImEvYi9zIiwgc3ltbGlua190bz1vcy5wYXRoLmpvaW4oJy4u
JywgJ2VzY2FwZScpKQotKyAgICAgICAgICAgICAgICAgICAgc2VsZi5leHBlY3RfZmlsZSgicyIs
IHN5bWxpbmtfdG89b3MucGF0aC5qb2luKCcuLicsICdlc2NhcGUnKSkKLSsKLSAgICAgQHN5bWxp
bmtfdGVzdAotICAgICBkZWYgdGVzdF9leGZpbHRyYXRpb25fdmlhX3N5bWxpbmsoc2VsZik6Ci0g
ICAgICAgICAjIChDVkUtMjAyNS00MTM4KQotLS0KLTIuNTQuMApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zL0NWRS0yMDI2LTExOTcyLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zL0NWRS0yMDI2LTExOTcyLnBhdGNoCmRl
bGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAxMmE3OTc1NGZlLi4wMDAwMDAwMDAwCi0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy9DVkUtMjAyNi0xMTk3Mi5wYXRj
aAorKysgL2Rldi9udWxsCkBAIC0xLDYxICswLDAgQEAKLUZyb20gMmQyNTZkNGJmZDY1NGJkY2Fm
MmQ5NjczMzc5OWJlNzNiOGZmOGY2OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFBl
dHIgVmlrdG9yaW4gPGVuY3Vrb3VAZ21haWwuY29tPgotRGF0ZTogVHVlLCAyMyBKdW4gMjAyNiAx
NToxMzozMCArMDIwMAotU3ViamVjdDogW1BBVENIIDIvMl0gZ2gtMTUxOTgxOiBNYWtlIHRhcmZp
bGUuX1N0cmVhbS5zZWVrIGJyZWFrIGF0IEVPRgotIChHSC0xNTE5ODIpCi0KLUNvLWF1dGhvcmVk
LWJ5OiBTdGFuIFVsYnJ5Y2ggPHN0YW5AcHl0aG9uLm9yZz4KLQotQ1ZFOiBDVkUtMjAyNi0xMTk3
MgotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi9j
cHl0aG9uL2NvbW1pdC9mNTBiZjEzNTY2MTg5YzhkMGNlNWE4MTRmMzNlZmYzZDg5OTUxODk2XQot
Ci1TaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBSb2JpbiA8YmVuamFtaW4ucm9iaW5AYm9vdGxpbi5j
b20+Ci0tLS0KLSBMaWIvdGFyZmlsZS5weSAgICAgICAgICAgfCAgNCArKystCi0gTGliL3Rlc3Qv
dGVzdF90YXJmaWxlLnB5IHwgMTYgKysrKysrKysrKysrKysrKwotIDIgZmlsZXMgY2hhbmdlZCwg
MTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvTGliL3RhcmZp
bGUucHkgYi9MaWIvdGFyZmlsZS5weQotaW5kZXggNjNmMjM0OTBlOGExLi4zOTlmOTA2ZWZkZmYg
MTAwNjQ0Ci0tLS0gYS9MaWIvdGFyZmlsZS5weQotKysrIGIvTGliL3RhcmZpbGUucHkKLUBAIC01
MjQsNyArNTI0LDkgQEAgZGVmIHNlZWsoc2VsZiwgcG9zPTApOgotICAgICAgICAgaWYgcG9zIC0g
c2VsZi5wb3MgPj0gMDoKLSAgICAgICAgICAgICBibG9ja3MsIHJlbWFpbmRlciA9IGRpdm1vZChw
b3MgLSBzZWxmLnBvcywgc2VsZi5idWZzaXplKQotICAgICAgICAgICAgIGZvciBpIGluIHJhbmdl
KGJsb2Nrcyk6Ci0tICAgICAgICAgICAgICAgIHNlbGYucmVhZChzZWxmLmJ1ZnNpemUpCi0rICAg
ICAgICAgICAgICAgIGRhdGEgPSBzZWxmLnJlYWQoc2VsZi5idWZzaXplKQotKyAgICAgICAgICAg
ICAgICBpZiBub3QgZGF0YToKLSsgICAgICAgICAgICAgICAgICAgIGJyZWFrCi0gICAgICAgICAg
ICAgc2VsZi5yZWFkKHJlbWFpbmRlcikKLSAgICAgICAgIGVsc2U6Ci0gICAgICAgICAgICAgcmFp
c2UgU3RyZWFtRXJyb3IoInNlZWtpbmcgYmFja3dhcmRzIGlzIG5vdCBhbGxvd2VkIikKLWRpZmYg
LS1naXQgYS9MaWIvdGVzdC90ZXN0X3RhcmZpbGUucHkgYi9MaWIvdGVzdC90ZXN0X3RhcmZpbGUu
cHkKLWluZGV4IDBmYzc0MTNiZThkYi4uMDQ1Mzc3ZDYyMGNjIDEwMDY0NAotLS0tIGEvTGliL3Rl
c3QvdGVzdF90YXJmaWxlLnB5Ci0rKysgYi9MaWIvdGVzdC90ZXN0X3RhcmZpbGUucHkKLUBAIC00
Nzg2LDYgKzQ3ODYsMjIgQEAgZGVmIHZhbHVlZXJyb3JfZmlsdGVyKHRhcmluZm8sIHBhdGgpOgot
ICAgICAgICAgd2l0aCBzZWxmLmNoZWNrX2NvbnRleHQoYXJjLm9wZW4oZXJyb3JsZXZlbD0nYm9v
IScpLCBmaWx0ZXJlcnJvcl9maWx0ZXIpOgotICAgICAgICAgICAgIHNlbGYuZXhwZWN0X2V4Y2Vw
dGlvbihUeXBlRXJyb3IpICAjIGVycm9ybGV2ZWwgaXMgbm90IGludAotCi0rICAgIEBzdXBwb3J0
LnN1YlRlc3RzKCdmb3JtYXQnLCBbdGFyZmlsZS5HTlVfRk9STUFULCB0YXJmaWxlLlBBWF9GT1JN
QVRdKQotKyAgICBkZWYgdGVzdF9nZXRtZW1iZXJzX2JpZ19zaXplKHNlbGYsIGZvcm1hdCk6Ci0r
ICAgICAgICAjIGdoLTE1MTk4MTogQSBsb29wIGluIHNlZWsoKSBmb3Igc3RyZWFtaW5nIGZpbGVz
IHRyaWVkIHRvIHJlYWQgdGhlCi0rICAgICAgICAjIGRlY2xhcmVkIG51bWJlciBvZiBibG9ja3Mg
ZXZlbiBhdCBFT0YKLSsgICAgICAgIHRpbmZvID0gdGFyZmlsZS5UYXJJbmZvKCJodWdlLWZpbGUi
KQotKyAgICAgICAgdGluZm8uc2l6ZSA9IDEgPDwgNjQKLSsgICAgICAgIGJpbyA9IGlvLkJ5dGVz
SU8oKQotKyAgICAgICAgIyBXcml0ZSBoZWFkZXIgd2l0aG91dCBkYXRhCi0rICAgICAgICBiaW8u
d3JpdGUodGluZm8udG9idWYoZm9ybWF0KSkKLSsKLSsgICAgICAgICMgUmVzZXQgJiB0cnkgdG8g
Z2V0IGNvbnRlbnRzCi0rICAgICAgICBiaW8uc2VlaygwKQotKyAgICAgICAgd2l0aCB0YXJmaWxl
Lm9wZW4oZmlsZW9iaj1iaW8sIG1vZGU9InJ8IikgYXMgdGFyOgotKyAgICAgICAgICAgIHdpdGgg
c2VsZi5hc3NlcnRSYWlzZXModGFyZmlsZS5SZWFkRXJyb3IpOgotKyAgICAgICAgICAgICAgICB0
YXIuZ2V0bWVtYmVycygpCi0rCi0KLSBjbGFzcyBPdmVyd3JpdGVUZXN0cyhhcmNoaXZlcl90ZXN0
cy5PdmVyd3JpdGVUZXN0cywgdW5pdHRlc3QuVGVzdENhc2UpOgotICAgICB0ZXN0ZGlyID0gb3Mu
cGF0aC5qb2luKFRFTVBESVIsICJ0ZXN0b3ZlcndyaXRlIikKLS0tCi0yLjU0LjAKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy9DVkUtMjAyNi00MzYwLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zL0NWRS0yMDI2LTQzNjAu
cGF0Y2gKaW5kZXggZDM4MTUwODk1OS4uZGY3YTAwZjA1ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zL0NWRS0yMDI2LTQzNjAucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zL0NWRS0yMDI2LTQzNjAucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDY2YzhiYzM0NmMwYzYxNGVkYzA1NTM1MTQ1YzA0MjRhMTRmYmEy
MTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDkxNjk4Y2ZhODg0NzRiOTlmODdjOGJl
YmRlMmRlNjExMTg1ODhhN2UgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiAiTWlzcyBJ
c2xpbmd0b24gKGJvdCkiCiAgPDMxNDg4OTA5K21pc3MtaXNsaW5ndG9uQHVzZXJzLm5vcmVwbHku
Z2l0aHViLmNvbT4KIERhdGU6IE1vbiwgMjkgSnVuIDIwMjYgMjE6MTE6MjIgKzAyMDAKQEAgLTE1
LDEyOSArMTUsMTAgQEAgVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIu
Y29tL3B5dGhvbi9jcHl0aG9uL2NvbW1pdC81ZTBlZjNmMWFmZTgKIAogU2lnbmVkLW9mZi1ieTog
TGVvbmlkIEl6aXVtdHNldiA8bGVvbmlkLml6aXVtdHNldkBlc3QudGVjaD4KIC0tLQotIExpYi90
YXJmaWxlLnB5ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzICstCi0gTGliL3Rl
c3QvdGVzdF90YXJmaWxlLnB5ICAgICAgICAgICAgICAgICAgICAgIHwgOTIgKysrKysrKysrKysr
KysrKysrKwotIC4uLi0wNi0yMy0xNC0xOS0zMC5naC1pc3N1ZS0xNTE5ODcuOG1OSU1mLnJzdCB8
ICAyICsKLSAzIGZpbGVzIGNoYW5nZWQsIDk2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
KyAuLi4vU2VjdXJpdHkvMjAyNi0wNi0yMy0xNC0xOS0zMC5naC1pc3N1ZS0xNTE5ODcuOG1OSU1m
LnJzdCAgICAgfCAyICsrCisgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQogIGNyZWF0
ZSBtb2RlIDEwMDY0NCBNaXNjL05FV1MuZC9uZXh0L1NlY3VyaXR5LzIwMjYtMDYtMjMtMTQtMTkt
MzAuZ2gtaXNzdWUtMTUxOTg3LjhtTklNZi5yc3QKIAotZGlmZiAtLWdpdCBhL0xpYi90YXJmaWxl
LnB5IGIvTGliL3RhcmZpbGUucHkKLWluZGV4IGU2NzM0ZGIuLjJjNDYxNzkgMTAwNjQ0Ci0tLS0g
YS9MaWIvdGFyZmlsZS5weQotKysrIGIvTGliL3RhcmZpbGUucHkKLUBAIC0yNTEwLDcgKzI1MTAs
OCBAQCBjbGFzcyBUYXJGaWxlKG9iamVjdCk6Ci0gICAgICAgICB0YXJpbmZvLCB1bmZpbHRlcmVk
ID0gc2VsZi5fZ2V0X2V4dHJhY3RfdGFyaW5mbygKLSAgICAgICAgICAgICBtZW1iZXIsIGZpbHRl
cl9mdW5jdGlvbiwgcGF0aCkKLSAgICAgICAgIGlmIHRhcmluZm8gaXMgbm90IE5vbmU6Ci0tICAg
ICAgICAgICAgc2VsZi5fZXh0cmFjdF9vbmUodGFyaW5mbywgcGF0aCwgc2V0X2F0dHJzLCBudW1l
cmljX293bmVyKQotKyAgICAgICAgICAgIHNlbGYuX2V4dHJhY3Rfb25lKHRhcmluZm8sIHBhdGgs
IHNldF9hdHRycywgbnVtZXJpY19vd25lciwKLSsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBmaWx0ZXJfZnVuY3Rpb249ZmlsdGVyX2Z1bmN0aW9uKQotIAotICAgICBkZWYgX2dldF9leHRy
YWN0X3RhcmluZm8oc2VsZiwgbWVtYmVyLCBmaWx0ZXJfZnVuY3Rpb24sIHBhdGgpOgotICAgICAg
ICAgIiIiR2V0IChmaWx0ZXJlZCwgdW5maWx0ZXJlZCkgVGFySW5mb3MgZnJvbSAqbWVtYmVyKgot
ZGlmZiAtLWdpdCBhL0xpYi90ZXN0L3Rlc3RfdGFyZmlsZS5weSBiL0xpYi90ZXN0L3Rlc3RfdGFy
ZmlsZS5weQotaW5kZXggZDk3NGM3ZC4uOWExNTU4NSAxMDA2NDQKLS0tLSBhL0xpYi90ZXN0L3Rl
c3RfdGFyZmlsZS5weQotKysrIGIvTGliL3Rlc3QvdGVzdF90YXJmaWxlLnB5Ci1AQCAtNDM5OSw2
ICs0Mzk5LDk4IEBAIGNsYXNzIFRlc3RFeHRyYWN0aW9uRmlsdGVycyh1bml0dGVzdC5UZXN0Q2Fz
ZSk6Ci0gICAgICAgICAgICAgICAgICAgICBzdF9tb2RlID0gY2Mub3V0ZXJkaXIuc3RhdCgpLnN0
X21vZGUKLSAgICAgICAgICAgICAgICAgICAgIHNlbGYuYXNzZXJ0Tm90RXF1YWwoc3RfbW9kZSAm
IDBvNzc3LCAwbzc3NykKLSAKLSsgICAgQHN5bWxpbmtfdGVzdAotKyAgICBAdW5pdHRlc3Quc2tp
cFVubGVzcyhoYXNhdHRyKG9zLCAnY2hvd24nKSwgIm1pc3Npbmcgb3MuY2hvd24iKQotKyAgICBA
dW5pdHRlc3Quc2tpcFVubGVzcyhoYXNhdHRyKG9zLCAnbGNob3duJyksICJtaXNzaW5nIG9zLmxj
aG93biIpCi0rICAgIEB1bml0dGVzdC5za2lwVW5sZXNzKGhhc2F0dHIob3MsICdnZXRldWlkJyks
ICJtaXNzaW5nIG9zLmdldGV1aWQiKQotKyAgICBAc3VwcG9ydC5zdWJUZXN0cygnbGlua190eXBl
JywgKHRhcmZpbGUuU1lNVFlQRSwgdGFyZmlsZS5MTktUWVBFKSkKLSsgICAgZGVmIHRlc3RfY2hv
d25fbGlua3Nfb25fZXh0cmFjdChzZWxmLCBsaW5rX3R5cGUpOgotKyAgICAgICAgd2l0aCBBcmNo
aXZlTWFrZXIoKSBhcyBhcmM6Ci0rICAgICAgICAgICAgYXJjLmFkZCgidGVzdC50eHQiLAotKyAg
ICAgICAgICAgICAgICAgICAgdWlkPTEzMzcsIGdpZD0xMzM3LCB1bmFtZT0iIiwgZ25hbWU9IiIs
IG1vZGU9Jy1yd3hyLXhyLXgnKQotKyAgICAgICAgICAgIGFyYy5hZGQoImxpbmsiLAotKyAgICAg
ICAgICAgICAgICAgICAgdHlwZT1saW5rX3R5cGUsCi0rICAgICAgICAgICAgICAgICAgICBsaW5r
bmFtZT0ndGVzdC50eHQnLAotKyAgICAgICAgICAgICAgICAgICAgdWlkPTEzMzcsIGdpZD0xMzM3
LCB1bmFtZT0iIiwgZ25hbWU9IiIsIG1vZGU9Jy1yd3hyLXhyLXgnKQotKwotKyAgICAgICAgd2l0
aCAoCi0rICAgICAgICAgICAgb3NfaGVscGVyLnRlbXBfZGlyKCkgYXMgdG1wZGlyLAotKyAgICAg
ICAgICAgIGFyYy5vcGVuKCkgYXMgdGFyLAotKyAgICAgICAgICAgIHVuaXR0ZXN0Lm1vY2sucGF0
Y2goIm9zLmNob3duIikgYXMgbW9ja19jaG93biwKLSsgICAgICAgICAgICB1bml0dGVzdC5tb2Nr
LnBhdGNoKCJvcy5sY2hvd24iKSBhcyBtb2NrX2xjaG93biwKLSsgICAgICAgICAgICB1bml0dGVz
dC5tb2NrLnBhdGNoKCJvcy5nZXRldWlkIikgYXMgbW9ja19nZXRldWlkLAotKyAgICAgICAgKToK
LSsgICAgICAgICAgICAjIFNldCBVSUQgdG8gMCBzbyBjaG93bigpIGlzIGF0dGVtcHRlZC4KLSsg
ICAgICAgICAgICBtb2NrX2dldGV1aWQucmV0dXJuX3ZhbHVlID0gMAotKyAgICAgICAgICAgIHRh
ci5leHRyYWN0KCJsaW5rIiwgcGF0aD10bXBkaXIsIGZpbHRlcj0nZGF0YScpCi0rICAgICAgICAg
ICAgZXh0cmFjdF9wYXRoID0gb3MucGF0aC5qb2luKHRtcGRpciwgImxpbmsiKQotKwotKyAgICAg
ICAgICAgIGlmIGxpbmtfdHlwZSA9PSB0YXJmaWxlLlNZTVRZUEU6Ci0rICAgICAgICAgICAgICAg
IG1vY2tfY2hvd24uYXNzZXJ0X25vdF9jYWxsZWQoKQotKyAgICAgICAgICAgICAgICBtb2NrX2xj
aG93bi5hc3NlcnRfY2FsbGVkX29uY2Vfd2l0aChleHRyYWN0X3BhdGgsIC0xLCAtMSkKLSsgICAg
ICAgICAgICBlbHNlOgotKyAgICAgICAgICAgICAgICBtb2NrX2Nob3duLmFzc2VydF9oYXNfY2Fs
bHMoWwotKyAgICAgICAgICAgICAgICAgICAgdW5pdHRlc3QubW9jay5jYWxsKGV4dHJhY3RfcGF0
aCwgLTEsIC0xKSwKLSsgICAgICAgICAgICAgICAgICAgIHVuaXR0ZXN0Lm1vY2suY2FsbChleHRy
YWN0X3BhdGgsIC0xLCAtMSkKLSsgICAgICAgICAgICAgICAgXSkKLSsgICAgICAgICAgICAgICAg
bW9ja19sY2hvd24uYXNzZXJ0X25vdF9jYWxsZWQoKQotKwotKyAgICBAc3ltbGlua190ZXN0Ci0r
ICAgIEB1bml0dGVzdC5za2lwVW5sZXNzKGhhc2F0dHIob3MsICdjaG93bicpLCAibWlzc2luZyBv
cy5jaG93biIpCi0rICAgIEB1bml0dGVzdC5za2lwVW5sZXNzKGhhc2F0dHIob3MsICdsY2hvd24n
KSwgIm1pc3Npbmcgb3MubGNob3duIikKLSsgICAgQHVuaXR0ZXN0LnNraXBVbmxlc3MoaGFzYXR0
cihvcywgJ2dldGV1aWQnKSwgIm1pc3Npbmcgb3MuZ2V0ZXVpZCIpCi0rICAgIEBzdXBwb3J0LnN1
YlRlc3RzKCdsaW5rX3R5cGUnLCAodGFyZmlsZS5TWU1UWVBFLCB0YXJmaWxlLkxOS1RZUEUpKQot
KyAgICBkZWYgdGVzdF9jaG93bl9saW5rc19vbl9leHRyYWN0YWxsKHNlbGYsIGxpbmtfdHlwZSk6
Ci0rICAgICAgICB3aXRoIEFyY2hpdmVNYWtlcigpIGFzIGFyYzoKLSsgICAgICAgICAgICBhcmMu
YWRkKCJ0ZXN0LnR4dCIsCi0rICAgICAgICAgICAgICAgICAgICB1aWQ9MTMzNywgZ2lkPTEzMzcs
IHVuYW1lPSIiLCBnbmFtZT0iIiwgbW9kZT0nLXJ3eHIteHIteCcpCi0rICAgICAgICAgICAgYXJj
LmFkZCgibGluayIsCi0rICAgICAgICAgICAgICAgICAgICB0eXBlPWxpbmtfdHlwZSwKLSsgICAg
ICAgICAgICAgICAgICAgIGxpbmtuYW1lPSd0ZXN0LnR4dCcsCi0rICAgICAgICAgICAgICAgICAg
ICB1aWQ9MTMzNywgZ2lkPTEzMzcsIHVuYW1lPSIiLCBnbmFtZT0iIiwgbW9kZT0nLXJ3eHIteHIt
eCcpCi0rCi0rICAgICAgICB3aXRoICgKLSsgICAgICAgICAgICBvc19oZWxwZXIudGVtcF9kaXIo
KSBhcyB0bXBkaXIsCi0rICAgICAgICAgICAgYXJjLm9wZW4oKSBhcyB0YXIsCi0rICAgICAgICAg
ICAgdW5pdHRlc3QubW9jay5wYXRjaCgib3MuY2hvd24iKSBhcyBtb2NrX2Nob3duLAotKyAgICAg
ICAgICAgIHVuaXR0ZXN0Lm1vY2sucGF0Y2goIm9zLmxjaG93biIpIGFzIG1vY2tfbGNob3duLAot
KyAgICAgICAgICAgIHVuaXR0ZXN0Lm1vY2sucGF0Y2goIm9zLmdldGV1aWQiKSBhcyBtb2NrX2dl
dGV1aWQsCi0rICAgICAgICApOgotKyAgICAgICAgICAgICMgU2V0IFVJRCB0byAwIHNvIGNob3du
KCkgaXMgYXR0ZW1wdGVkLgotKyAgICAgICAgICAgIG1vY2tfZ2V0ZXVpZC5yZXR1cm5fdmFsdWUg
PSAwCi0rICAgICAgICAgICAgdGFyLmV4dHJhY3RhbGwocGF0aD10bXBkaXIsIGZpbHRlcj0nZGF0
YScpCi0rICAgICAgICAgICAgZXh0cmFjdF9saW5rX3BhdGggPSBvcy5wYXRoLmpvaW4odG1wZGly
LCAibGluayIpCi0rICAgICAgICAgICAgZXh0cmFjdF9maWxlX3BhdGggPSBvcy5wYXRoLmpvaW4o
dG1wZGlyLCAidGVzdC50eHQiKQotKwotKyAgICAgICAgICAgIGlmIGxpbmtfdHlwZSA9PSB0YXJm
aWxlLlNZTVRZUEU6Ci0rICAgICAgICAgICAgICAgIG1vY2tfY2hvd24uYXNzZXJ0X2NhbGxlZF9v
bmNlX3dpdGgoZXh0cmFjdF9maWxlX3BhdGgsIC0xLCAtMSkKLSsgICAgICAgICAgICAgICAgbW9j
a19sY2hvd24uYXNzZXJ0X2NhbGxlZF9vbmNlX3dpdGgoZXh0cmFjdF9saW5rX3BhdGgsIC0xLCAt
MSkKLSsgICAgICAgICAgICBlbHNlOgotKyAgICAgICAgICAgICAgICBtb2NrX2Nob3duLmFzc2Vy
dF9oYXNfY2FsbHMoWwotKyAgICAgICAgICAgICAgICAgICAgdW5pdHRlc3QubW9jay5jYWxsKGV4
dHJhY3RfZmlsZV9wYXRoLCAtMSwgLTEpLAotKyAgICAgICAgICAgICAgICAgICAgdW5pdHRlc3Qu
bW9jay5jYWxsKGV4dHJhY3RfbGlua19wYXRoLCAtMSwgLTEpCi0rICAgICAgICAgICAgICAgIF0p
Ci0rICAgICAgICAgICAgICAgIG1vY2tfbGNob3duLmFzc2VydF9ub3RfY2FsbGVkKCkKLSsKLSsg
ICAgZGVmIHRlc3RfZXh0cmFjdF9maWx0ZXJzX3RhcmdldChzZWxmKToKLSsgICAgICAgICMgVGVz
dCB0aGF0IHdoZW4gZXh0cmFjdCgpIGZhbGxzIGJhY2sgdG8gZXh0cmFjdGluZyAocmF0aGVyIHRo
YW4KLSsgICAgICAgICMgbGlua2luZykgYSBoYXJkbGluayB0YXJnZXQsIGl0IGZpbHRlcnMgdGhl
IHRhcmdldC4KLSsgICAgICAgIHdpdGggQXJjaGl2ZU1ha2VyKCkgYXMgYXJjOgotKyAgICAgICAg
ICAgIGFyYy5hZGQoInRhcmdldCIpCi0rICAgICAgICAgICAgYXJjLmFkZCgibGluayIsIGhhcmRs
aW5rX3RvPSJ0YXJnZXQiKQotKyAgICAgICAgZGVmIHRlc3RpbmdfZmlsdGVyKG1lbWJlciwgcGF0
aCk6Ci0rICAgICAgICAgICAgaWYgbWVtYmVyLm5hbWUgPT0gJ3RhcmdldCc6Ci0rICAgICAgICAg
ICAgICAgICMgdGFyZ2V0OiBzZXQgcmVhZC1vbmx5Ci0rICAgICAgICAgICAgICAgIHJldHVybiBt
ZW1iZXIucmVwbGFjZShtb2RlPXN0YXQuU19JUlVTUikKLSsgICAgICAgICAgICAjIGxpbms6IGRv
bid0IG92ZXJ3cml0ZSB0aGUgbW9kZQotKyAgICAgICAgICAgIHJldHVybiBtZW1iZXIucmVwbGFj
ZShtb2RlPU5vbmUpCi0rICAgICAgICB0ZW1wZGlyID0gcGF0aGxpYi5QYXRoKFRFTVBESVIpIC8g
J2V4dHJhY3QnCi0rICAgICAgICB3aXRoIG9zX2hlbHBlci50ZW1wX2Rpcih0ZW1wZGlyKSwgYXJj
Lm9wZW4oKSBhcyB0YXI6Ci0rICAgICAgICAgICAgdGFyLmV4dHJhY3QoImxpbmsiLCBwYXRoPXRl
bXBkaXIsIGZpbHRlcj10ZXN0aW5nX2ZpbHRlcikKLSsgICAgICAgICAgICBwYXRoID0gdGVtcGRp
ciAvICdsaW5rJwotKyAgICAgICAgICAgIGlmIG9zX2hlbHBlci5jYW5fY2htb2QoKToKLSsgICAg
ICAgICAgICAgICAgc2VsZi5hc3NlcnRGYWxzZShwYXRoLnN0YXQoKS5zdF9tb2RlICYgc3RhdC5T
X0lXVVNSKQotKwotICAgICBkZWYgdGVzdF9saW5rX2ZhbGxiYWNrX25vcm1hbGl6ZXMoc2VsZik6
Ci0gICAgICAgICAjIE1ha2Ugc3VyZSBoYXJkbGluayBmYWxsYmFja3Mgd29yayBmb3Igbm9uLW5v
cm1hbGl6ZWQgcGF0aHMgZm9yIGFsbAotICAgICAgICAgIyBmaWx0ZXJzCiBkaWZmIC0tZ2l0IGEv
TWlzYy9ORVdTLmQvbmV4dC9TZWN1cml0eS8yMDI2LTA2LTIzLTE0LTE5LTMwLmdoLWlzc3VlLTE1
MTk4Ny44bU5JTWYucnN0IGIvTWlzYy9ORVdTLmQvbmV4dC9TZWN1cml0eS8yMDI2LTA2LTIzLTE0
LTE5LTMwLmdoLWlzc3VlLTE1MTk4Ny44bU5JTWYucnN0CiBuZXcgZmlsZSBtb2RlIDEwMDY0NAog
aW5kZXggMDAwMDAwMC4uOWVlYTdiMwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zL21ha2VyYWNlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zL21ha2VyYWNlLnBhdGNoCmluZGV4IGIyOWVhNTZjYzMuLjI0OGE1MjExMTgg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy9tYWtlcmFj
ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvbWFrZXJh
Y2UucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDJiNDU4YjRlMWJjZDU3ZTNmMTM1ZDNmMGU3
MTVmNjRiOThiMjc5MDYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGI0MTU1N2Y1NzBm
ZjQ0NTFjNDc3NjY5ZDZjYTViZmFjYWJlMjFjNjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4K
IERhdGU6IFR1ZSwgMTMgSnVsIDIwMjEgMjM6MTk6MjkgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0g
cHl0aG9uMzogRml4IG1ha2UgcmFjZQpAQCAtMTcsMTAgKzE3LDEwIEBAIFNpZ25lZC1vZmYtYnk6
IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0
IGEvTWFrZWZpbGUucHJlLmluIGIvTWFrZWZpbGUucHJlLmluCi1pbmRleCBiZTFiOWVhLi45ZWMz
YTcxIDEwMDY0NAoraW5kZXggYTdlNTM2ZC4uZTk0NjAxOCAxMDA2NDQKIC0tLSBhL01ha2VmaWxl
LnByZS5pbgogKysrIGIvTWFrZWZpbGUucHJlLmluCi1AQCAtMjczNSw3ICsyNzM1LDcgQEAgQ09N
UElMRUFMTF9PUFRTPS1qMAorQEAgLTI3NDEsNyArMjc0MSw3IEBAIENPTVBJTEVBTExfT1BUUz0t
ajAKICBURVNUX01PRFVMRVM9QFRFU1RfTU9EVUxFU0AKICAKICAuUEhPTlk6IGxpYmluc3RhbGwK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy92YWxpZC1k
aXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy92YWxpZC1k
aXN0cy5wYXRjaAppbmRleCAzOGI2ZWJjNWNiLi43ZmUxODI1NGU1IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvdmFsaWQtZGlzdHMucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zL3ZhbGlkLWRpc3RzLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBhNjVjMjlhZGMwMjdiMzYxNTE1NGNhYjczYWFlZGQ1OGE2YWEy
M2RhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2Njg3NGNlMWE5ZjIxYjRiMDBkYzg1
OTE5NzM0ZDU4ZTYyNDNjYTI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogIkphc29u
IFIuIENvb21icyIgPGphcmFjb0BqYXJhY28uY29tPgogRGF0ZTogVHVlLCAyMyBKdWwgMjAyNCAw
ODozNjoxNiAtMDQwMAogU3ViamVjdDogW1BBVENIXSBQcmlvcml0aXplIHZhbGlkIGRpc3RzIHRv
IGludmFsaWQgZGlzdHMgd2hlbiByZXRyaWV2aW5nIGJ5CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfMy4xNC42LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zXzMuMTQuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk5JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfMy4xNC42LmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfMy4xNC43LmJiCmluZGV4
IDc3MzMzY2UzZTIuLjVkNTE3MTdiZmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uM18zLjE0LjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zXzMuMTQuNy5iYgpAQCAtMjIsMTUgKzIyLDE0IEBAIFNSQ19VUkkgPSAiaHR0
cDovL3d3dy5weXRob24ub3JnL2Z0cC9weXRob24vJHtQVn0vUHl0aG9uLSR7UFZ9LnRhci54eiBc
CiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUF2b2lkLXNoZWJhbmctb3ZlcmZsb3ctb24tcHl0aG9u
LWNvbmZpZy5weS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVVwZGF0ZS10ZXN0X3N5
c2NvbmZpZy1mb3ItcG9zaXhfdXNlci1wdXJlbGliLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTov
LzAwMDEtcHJlZmVyLXZhbGlkLWVudHJ5cG9pbnRzLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTov
L0NWRS0yMDI2LTExOTQwLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovL0NWRS0yMDI2LTExOTcy
LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL0NWRS0yMDI2LTQzNjAucGF0Y2ggXAorICAgICAg
ICAgICBmaWxlOi8vMDAwMS1MaWItc3lzY29uZmlnLnB5LXVzZS1wcmVmaXgtdmFsdWUtZnJvbS1i
dWlsZC1jb25maWd1LnBhdGNoIFwKICAgICAgICAgICAgIgogU1JDX1VSSTphcHBlbmQ6Y2xhc3Mt
bmF0aXZlID0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUxpYi1zeXNjb25maWcucHktdXNl
LXByZWZpeC12YWx1ZS1mcm9tLWJ1aWxkLWNvbmZpZ3UucGF0Y2ggXAogICAgICAgICAgICAiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxNDNiMWRkZGVmYWVjM2JkMmUyMWUzYjgzOWIzNGEyYjdm
Yjk4NDIyNzI4ODNjNTc2NDIwZDYwNWU5ZjMwYzYzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNi
NDhkYWM4ZmI1OWY2MmVhYTY3YWM4M2MxZWIxMmJkYTFiN2EwODQwNmRkMjg2ZTI1MmMxMWE2NmJl
MjdmODEiCiAKICMgZXhjbHVkZSBwcmUtcmVsZWFzZXMgZm9yIGJvdGggcHl0aG9uIDIueCBhbmQg
My54CiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJbUHBdeXRob24tKD9QPHB2ZXI+XGQrKFwuXGQr
KSspLnRhciIKLS0gCjIuNDcuMQoK

--===============9104330730762520242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="python3-changelog.txt"

Q2hhbmdlbG9nIGZvciBweXRob24zOiAzLjE0LjYgLT4gMy4xNC43ClNvdXJjZTogTWlzYy9ORVdT
CgpXaGF0J3MgTmV3IGluIFB5dGhvbiAzLjE0LjcgZmluYWw/Cj09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0KCipSZWxlYXNlIGRhdGU6IDIwMjYtMDgtMDUqCgpTZWN1cml0eQotLS0t
LS0tLQoKLSBnaC0xNTMwMzA6IEZpeGVkIHF1YWRyYXRpYyBjb21wbGV4aXR5IGluIGluY3JlbWVu
dGFsIHBhcnNpbmcgb2YgbG9uZwogIHVudGVybWluYXRlZCBjb25zdHJ1Y3RzIChzdWNoIGFzIHRh
Z3Mgb3IgY29tbWVudHMpIGluCiAgOmNsYXNzOmBodG1sLnBhcnNlci5IVE1MUGFyc2VyYCwgd2hp
Y2ggY291bGQgYmUgZXhwbG9pdGVkIGZvciBhIGRlbmlhbCBvZgogIHNlcnZpY2UuCgotIGdoLTE1
MjY3NDogVGhlIDpjbGFzczpgeG1sLmV0cmVlLkVsZW1lbnRUcmVlLkVsZW1lbnRgIG1ldGhvZHMK
ICA6bWV0aDpgfnhtbC5ldHJlZS5FbGVtZW50VHJlZS5FbGVtZW50LmZpbmRhbGxgLAogIDptZXRo
OmB+eG1sLmV0cmVlLkVsZW1lbnRUcmVlLkVsZW1lbnQuaXRlcmZpbmRgIGFuZAogIDptZXRoOmB+
eG1sLmV0cmVlLkVsZW1lbnRUcmVlLkVsZW1lbnQuZmluZGAgYXZvaWQgcXVhZHJhdGljIGJlaGF2
aW9yIHdoZW4KICB1c2luZyBYUGF0aCBpbmRleCBwcmVkaWNhdGVzIChgYFsxXWBgLCBgYFtsYXN0
KCldYGAsIGBgW2xhc3QoKS1OXWBgKSBvbgogIFhNTCBkb2N1bWVudHMgd2l0aCBtYW55IHNhbWUt
dGFnIHNpYmxpbmdzLgoKLSBnaC0xNTIyMTY6IFVwZGF0ZSBidW5kbGVkIGBsaWJleHBhdCA8aHR0
cHM6Ly9saWJleHBhdC5naXRodWIuaW8vPmBfIHRvCiAgdmVyc2lvbiAyLjguMi4KCi0gZ2gtMTUx
OTg3OiBUaGUgOm1ldGg6YHRhcmZpbGUuVGFyRmlsZS5leHRyYWN0YCBtZXRob2Qgbm93IGFwcGxp
ZXMgdGhlCiAgZ2l2ZW4gZmlsdGVyIHdoZW4gaXQgZXh0cmFjdHMgYSBsaW5rIHRhcmdldCBmcm9t
IHRoZSBhcmNoaXZlIGFzIGEKICBmYWxsYmFjay4KCi0gZ2gtMTUxOTgxOiBJbiA6bW9kOmB0YXJm
aWxlYCwgc2Vla2luZyBhIHN0cmVhbSBub3cgc3RvcHMgd2hlbiBlbmQgb2YgdGhlCiAgc3RyZWFt
IGlzIHJlYWNoZWQuCgotIGdoLTE1MTU0NDogOmZpbGU6YE1vZHVsZXMvU2V0dXAubG9jYWxgIGlz
IG5vIGxvbmdlciB1c2VkIGFzIGEgbGFuZG1hcmsgdG8KICBkaXNjb3ZlciB3aGV0aGVyIFB5dGhv
biBpcyBydW5uaW5nIGluIGEgc291cmNlIHRyZWUsIGFzIGl0IGNvdWxkCiAgcG90ZW50aWFsbHkg
YWZmZWN0IGFjdHVhbCBpbnN0YWxscy4gVGhlIDpmaWxlOmBweWJ1aWxkZGlyLnR4dGAgZmlsZSBp
cyBub3cKICB0aGUgc29sZSBpbmRpY2F0b3Igb2YgcnVubmluZyBpbiBhIHNvdXJjZSB0cmVlLgoK
LSBnaC0xNTE1NTg6IEZpeGVkIGFuIHZ1bG5lcmFiaWxpdHkgaW4gdGhlIDptb2Q6YHRhcmZpbGVg
IGBgZGF0YWBgIGFuZAogIGBgdGFyYGAgZXh0cmFjdGlvbiBmaWx0ZXJzIHdoZXJlIGNyYWZ0ZWQg
YXJjaGl2ZXMgY291bGQgY3JlYXRlIGEgc3ltbGluawogIHBvaW50aW5nIG91dHNpZGUgdGhlIGRl
c3RpbmF0aW9uIGRpcmVjdG9yeS4gVGhpcyB3YXMgYSBieXBhc3Mgb2YKICA6Y3ZlOmAyMDI1LTQz
MzBgLgoKLSBnaC0xNTA3NDM6IDptb2Q6YGh0dHAuY2xpZW50YCBub3cgbGltaXRzIHRoZSBudW1i
ZXIgb2YgY2h1bmtlZC1yZXNwb25zZQogIHRyYWlsZXIgbGluZXMgaXQgd2lsbCByZWFkIHRvIDEw
MCwgYW5kIHRoZSBudW1iZXIgb2YgaW50ZXJpbSAoMXh4KQogIHJlc3BvbnNlcyBpdCB3aWxsIHNr
aXAgdG8gMTAwLiAgQSBtYWxpY2lvdXMgb3IgYnJva2VuIHNlcnZlciBjb3VsZAogIHByZXZpb3Vz
bHkgc3RyZWFtIHRyYWlsZXIgbGluZXMgb3IgYGAxMDAgQ29udGludWVgYCByZXNwb25zZXMgZm9y
ZXZlciwKICBoYW5naW5nIHRoZSBjbGllbnQgZXZlbiB3aGVuIGEgc29ja2V0IHRpbWVvdXQgd2Fz
IGluIHVzZS4gUmVwb3J0ZWQgYnkKICBgYEBZTENoZW4tMDA3YGAgdmlhIEdIU0EtdzRxMi1nMjJ3
LTZmcjQuCgotIGdoLTE0MzkyNzogTm9ybWFsaXplIGFsbCBsaW5lIGVuZGluZ3MgKENSLCBDUkxG
LCBhbmQgTEYpIHRvIExGK1RBQiB3aGVuCiAgd3JpdGluZyBtdWx0aS1saW5lIGNvbmZpZ3BhcnNl
ciB2YWx1ZXMuCgotIGdoLTE0MzkyMTogUmVqZWN0IE5VTCwgQ1IgYW5kIExGIGNoYXJhY3RlcnMg
aW4gSU1BUCBjb21tYW5kcy4gT3RoZXIKICBjb250cm9sIGNoYXJhY3RlcnMgYXJlIGFsbG93ZWQg
YW5kIHNlbnQgcXVvdGVkLgoKQ29yZSBhbmQgQnVpbHRpbnMKLS0tLS0tLS0tLS0tLS0tLS0KCi0g
Z2gtMTMzOTMxOiBGaXggZGF0YSByYWNlcyB3aGVuIHNldHRpbmcgYXR0cmlidXRlcyBvZiBmdW5j
dGlvbiBvYmplY3RzIG9uCiAgdGhlIDp0ZXJtOmBmcmVlIHRocmVhZGVkIDxmcmVlIHRocmVhZGlu
Zz5gIGJ1aWxkLgoKLSBnaC0xNTQ3MDk6IEZpeCBhbiBvdXQtb2YtYm91bmRzIGFjY2VzcyBpbiBy
ZXZlcnNlIGRpY3Rpb25hcnkgaXRlcmF0b3JzCiAgd2hlbiB0aGUgdW5kZXJseWluZyBkaWN0aW9u
YXJ5IGlzIGNsZWFyZWQgYW5kIG1vZGlmaWVkIGFmdGVyIHRoZSBpdGVyYXRvcgogIGlzIGNyZWF0
ZWQuCgotIGdoLTE1NDY5NTogRml4IDpjbGFzczpgYXN5bmNpby5UYXNrYCByYWlzaW5nIDpleGM6
YEF0dHJpYnV0ZUVycm9yYCB3aGVuCiAgY3JlYXRlZCB3aXRoIGBgZWFnZXJfc3RhcnQ9VHJ1ZWBg
IGFuZCBubyBleHBsaWNpdCAqbG9vcCogYXJndW1lbnQuCgotIGdoLTE1MzgwOTogRml4IGludGVy
cHJldGVyIGNyYXNoIHdoaWxlIGRlYWxsb2NhdGluZyBvYmplY3RzIG9mCiAgOmNsYXNzOmBhc3lu
Y2lvLlRhc2tgIG9uIGZyZWUtdGhyZWFkZWQgYnVpbGRzLiBDb250cmlidXRlZCBieSBTZXJnZXkK
ICBNaXJ5YW5vdi4KCi0gZ2gtMTU0Mjc1OiBGaXggYSBjcmFzaCB3aGVuIGdldHRpbmcgZGVlcGx5
IG5lc3RlZCBgYF9fcGFyYW1ldGVyc19fYGAgZnJvbQogIGEgOmNsYXNzOmB0eXBlcy5HZW5lcmlj
QWxpYXNgIG9iamVjdHMuCgotIGdoLTE1MzkzMjogRml4IHRocmVhZCBzYWZldHkgaXNzdWUgaW4g
dGhlIGBgX19yZWR1Y2VfX2BgIG1ldGhvZCBvZgogIDpweTpjbGFzczpgZW51bWVyYXRlYC4KCi0g
Z2gtMTUzMjk4OiBGaXhlcyBhIGRhdGEgcmFjZSBpbiA6Y2xhc3M6YHR5cGVzLkdlbmVyaWNBbGlh
c2AKICBgYF9fcGFyYW1ldGVyc19fYGAgaW5pdGlhbGl6YXRpb24gb24gZnJlZS10aHJlYWRpbmcg
YnVpbGRzLgoKLSBnaC0xNTMyMDU6IEZpeCBhIHBvdGVudGlhbCA6ZXhjOmBTeXN0ZW1FcnJvcmAg
ZHVyaW5nIHZlY3RvciBjYWxscyB3aGVuCiAgbWVtb3J5IGFsbG9jYXRpb24gZmFpbHMuIEEgOmV4
YzpgTWVtb3J5RXJyb3JgIGlzIG5vdyByYWlzZWQgaW5zdGVhZC4KCi0gZ2gtMTUyNjgyOiBGaXgg
TlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGluIDpmdW5jOmBjb21waWxlYCB3aGVuIGEgcmVzZXJ2
ZWQKICBuYW1lIChlLmcuIGBgX19jbGFzc2RpY3RfX2BgKSBpcyB1c2VkIGFzIGEgdHlwZSBwYXJh
bWV0ZXIgbmFtZSBhbmQgbWVtb3J5CiAgYWxsb2NhdGlvbiBmYWlscyB3aGlsZSBmb3JtYXR0aW5n
IHRoZSBlcnJvciBtZXNzYWdlLgoKLSBnaC0xNTI2MzU6IEZpeCBhIGNyYXNoIGNhdXNlZCB3aGVu
IHJ1bm5pbmcgb3V0IG9mIG1lbW9yeSBjcmVhdGluZyBhCiAgOm1vZDpgIV9pbnRlcnBjaGFubmVs
c2AgY2hhbm5lbC4gTm93IGEgOmV4YzpgTWVtb3J5RXJyb3JgIGlzIGNvcnJlY3RseQogIHJhaXNl
ZC4KCi0gZ2gtMTUyMzc1OiBGaXggdW5kZWZpbmVkIGJlaGF2aW91ciB3aGVuIGEgOm1vZDpgc3lz
Lm1vbml0b3JpbmdgIGNhbGxiYWNrCiAgcmFpc2VkIGFuIGV4Y2VwdGlvbiB3aGlsZSB0aGUgcHJv
Z3JhbSB3YXMgZm9sbG93aW5nIGEgYnJhbmNoIG9yIGxvb3AuCgotIGdoLTE1MjIzNTogRGVmZXIg
R0MgdHJhY2tpbmcgb2YgOm1ldGg6YHNldC5pbnRlcnNlY3Rpb25gLAogIDptZXRoOmBzZXQuZGlm
ZmVyZW5jZWAsIDptZXRoOmBzZXQuc3ltbWV0cmljX2RpZmZlcmVuY2VgLAogIDptZXRoOmBzZXQu
dW5pb25gIGFuZCBgYHNldC5fX3N1Yl9fYGAuIFBhdGNoIGJ5IERvbmdoZWUgTmEuCgotIGdoLTE1
MjIzNTogRGVmZXIgR0MgdHJhY2tpbmcgb2YgYSA6Y2xhc3M6YHNldGAgb3IgOmNsYXNzOmBmcm96
ZW5zZXRgIHRvCiAgdGhlIGVuZCBvZiBpdHMgY29uc3RydWN0aW9uIGZyb20gaXRlcmFibGUuIFBh
dGNoIGJ5IERvbmdoZWUgTmEuCgotIGdoLTE1MjIyODogRml4IGFuIGFzc2VydGlvbiBmYWlsdXJl
IHdoZW4gcHl0aG9uIGlzIGJ1aWx0IGluIGEgZGVidWcgbW9kZQogIHRoYXQgaGFwcGVuZWQgaW4g
Om1ldGg6YHN0ci5yZXBsYWNlYCB1bmRlciBhIGxpbWl0ZWQgbWVtb3J5IHNpdHVhdGlvbi4KCi0g
Z2gtMTUxNzYzOiBGaXhlcyBwb3NzaWJsZSBjcmFzaCBvbiA6Y2xhc3M6YHR5cGVzLkNvZGVUeXBl
YCBkZWFsbG9jYXRpb24uCgotIGdoLTE1MjAyMDogT24gdGhlIGZyZWUtdGhyZWFkZWQgYnVpbGQs
IDpmdW5jOmBhc3luY2lvLmFsbF90YXNrc2Agbm8gbG9uZ2VyCiAgbG9zZXMgZWFnZXItc3RhcnRl
ZCB0YXNrcyB3aGVuIGNhbGxlZCBmcm9tIGEgdGhyZWFkIG90aGVyIHRoYW4gdGhlIG9uZQogIHJ1
bm5pbmcgdGhlIGV2ZW50IGxvb3AuCgotIGdoLTE1MTc2MzogRml4IGEgcG90ZW50aWFsIGNyYXNo
IGluIDpmdW5jOmBjb21waWxlYCwgOmZ1bmM6YGV4ZWNgLAogIDpmdW5jOmBldmFsYCBhbmQgOmZ1
bmM6YGFzdC5wYXJzZWAgd2hlbiBhbiBhbGxvY2F0aW9uIGZhaWxzOiB0aGUgcGFyc2VyIG9yCiAg
Y29tcGlsZXIgY291bGQgcmV0dXJuIHdpdGhvdXQgc2V0dGluZyBhbiBleGNlcHRpb24uCgotIGdo
LTE1MTkxMjogRml4ZWQgYSBjcmFzaCBpbiBgYHR5cGUoKWBgIHdoZW4gc2VsZWN0aW5nIGEgbWV0
YWNsYXNzIHdob3NlCiAgYGB0cF9uZXdgYCBzbG90IGlzIGBgTlVMTGBgLiBTdWNoIG1ldGFjbGFz
c2VzIGFyZSBub3cgcmVqZWN0ZWQgd2l0aAogIGBgVHlwZUVycm9yYGAgaW5zdGVhZCBvZiBjYXVz
aW5nIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLgoKLSBnaC0xNTE5MDU6IEZpeCBPT00gZXJy
b3IgaGFuZGxpbmcgaW4gOmM6ZnVuYzpgUHlGcmFtZV9HZXRCYWNrYCB0bwogIHByb3BhZ2F0ZSBl
eGNlcHRpb25zIGluc3RlYWQgb2YgbWFza2luZyB0aGVtIGFzIE5vbmUuCgotIGdoLTE1MTc3Mzog
Rml4IGEgY3Jhc2ggaW4gOmZ1bmM6YGNvbnRleHR2YXJzLkNvbnRleHRWYXIuc2V0YCB3aGVuIG1l
bW9yeQogIGFsbG9jYXRpb24gZmFpbHMuCgotIGdoLTE1MTEyNjogRml4IGEgY3Jhc2ggd2hlbiBz
aGFyaW5nIDpjbGFzczpgbWVtb3J5dmlld2Agb2JqZWN0cyBiZXR3ZWVuCiAgaW50ZXJwcmV0ZXJz
IGZhaWxzIGR1ZSB0byBydW5uaW5nIG91dCBvZiBtZW1vcnkuIEl0IG5vdyByYWlzZXMgYSBwcm9w
ZXIKICA6ZXhjOmBNZW1vcnlFcnJvcmAuCgotIGdoLTE1MTY0NDogRml4IGEgZGF0YSByYWNlIGlu
IDpmdW5jOmBzeXMuc2V0ZGxvcGVuZmxhZ3NgIGFuZAogIDpmdW5jOmBzeXMuZ2V0ZGxvcGVuZmxh
Z3NgIHdoZW4gY2FsbGVkIGNvbmN1cnJlbnRseSBpbiB0aGUgZnJlZS10aHJlYWRlZAogIGJ1aWxk
LiBUaGUgdW5kZXJseWluZyBgYF9QeUltcG9ydF9HZXRETE9wZW5GbGFnc2BgIGFuZAogIGBgX1B5
SW1wb3J0X1NldERMT3BlbkZsYWdzYGAgZnVuY3Rpb25zIG5vdyB1c2UgYXRvbWljIGxvYWQvc3Rv
cmUKICBvcGVyYXRpb25zLgoKLSBnaC0xNTExMjY6IEF2b2lkIHBvc3NpYmxlIGNyYXNoIGluIGBg
X3dpbmFwaS5jYGAgd2hlcmUgYSBkZXZpY2UgaGFzIG5vCiAgbWVtb3J5IGxlZnQuIE5vdyBpdCBw
cm9wZXJseSByYWlzZXMgYSA6ZXhjOmBNZW1vcnlFcnJvcmAuIFBhdGNoIGJ5IEl2eSBYdS4KCi0g
Z2gtMTUxNTQ2OiBGaXggdGhlIHN0YWNrIGxpbWl0IGNoZWNrIGlmIFB5dGhvbiBpcyBsaW5rZWQg
dG8gbXVzbCAoZXg6CiAgQWxwaW5lIExpbnV4KS4gVXNlIHRoZSBzdGFjayBzaXplIHNldCBieSB0
aGUgbGlua2VyIHRvIGNvbXB1dGUgdGhlIHN0YWNrCiAgbGltaXRzLiBQYXRjaCBieSBWaWN0b3Ig
U3Rpbm5lci4KCi0gZ2gtMTUxNDYxOiBGaXggZGlyZWN0IGV4ZWN1dGlvbiBvZiBmaWxlcyB3aXRo
IGludmFsaWQgc291cmNlIGVuY29kaW5ncyB0bwogIHJlcG9ydCB0aGUgdW5kZXJseWluZyBjb2Rl
YyBsb29rdXAgb3IgZGVjb2RpbmcgZXJyb3IgaW5zdGVhZCBvZiB0aGUKICBnZW5lcmljIGBgU3lu
dGF4RXJyb3I6IGVuY29kaW5nIHByb2JsZW1gYCBtZXNzYWdlLiBQYXRjaCBieSBCYXJ0b3N6CiAg
U8WCYXdlY2tpLgoKLSBnaC0xNTEyMTg6IDpjOmZ1bmM6YFB5Q29uZmlnX1NldGAgYW5kIDpmdW5j
OmBzeXMuc2V0X2ludF9tYXhfc3RyX2RpZ2l0c2AKICBub3cgcmVwbGFjZSA6ZGF0YTpgc3lzLmZs
YWdzYCAoY3JlYXRlIGEgbmV3IG9iamVjdCksIGluc3RlYWQgb2YgbW9kaWZ5aW5nCiAgOmRhdGE6
YHN5cy5mbGFnc2AgaW4tcGxhY2UuIFBhdGNoIGJ5IFZpY3RvciBTdGlubmVyLgoKLSBnaC0xNTEy
NTM6IElmIGBgaW1wb3J0IGVuY29kaW5nc2BgIChmaXJzdCBpbXBvcnQpIGZhaWxzIGF0IFB5dGhv
biBzdGFydHVwLAogIGR1bXAgdGhlIFB5dGhvbiBwYXRoIGNvbmZpZ3VyYXRpb24gdG8gaGVscCB1
c2VycyBkZWJ1Z2dpbmcgdGhlaXIKICBjb25maWd1cmF0aW9uLiBQYXRjaCBieSBWaWN0b3IgU3Rp
bm5lci4KCi0gZ2gtMTUxMjM4OiBGaXggYSBjcmFzaCB3aGVuIGNvbXBpbGluZyBhIGNvbmNhdGVu
YXRlZCBmLXN0cmluZyBvciB0LXN0cmluZwogIGlmIGFuIGVycm9yIG9jY3VycyB3aGVuIHByb2Nl
c3Npbmcgb25lIG9mIGl0J3MgcGFydHMuCgotIGdoLTE1MTEyNjogRml4IGEgY3Jhc2gsIHdoZW4g
dGhlcmUncyBubyBtZW1vcnkgbGVmdCBvbiBhIGRldmljZSwgd2hpY2gKICBoYXBwZW5lZCBpbiA6
bW9kOmAhX2ludGVycGNoYW5uZWxzYCBtb2R1bGUuCgogIE5vdyBpdCByYWlzZXMgcHJvcGVyIDpl
eGM6YE1lbW9yeUVycm9yYCBlcnJvcnMuCgotIGdoLTE1MDkwMjogQXBwbHkgYW4gZXhpc3Rpbmcg
b3B0aW1pemF0aW9uIG9mIFB5Q3JpdGljYWxTZWN0aW9uIChzaW5nbGUKICBtdXRleCkgdG8gUHlD
cml0aWNhbFNlY3Rpb24yOiBhdm9pZCBhY3F1aXJpbmcgdGhlIHNhbWUgbG9ja3MgdGhhdCB0aGUK
ICBjdXJyZW50IENTIGhhcyBhbHJlYWR5IGFjcXVpcmVkLgoKLSBnaC0xNTEwNjU6IEZpeCBtZW1v
cnkgbGVhayB3aGVuIHVzaW5nIHRoZSA6cmVmOmBtaW1hbGxvYyBtZW1vcnkgYWxsb2NhdG9yCiAg
PG1pbWFsbG9jPmAuCgotIGdoLTE1MTAyOTogT24gTGludXgsIGZpeCA6ZnVuYzpgc3lzLnJlbW90
ZV9leGVjYCB1bmFibGUgdG8gZmluZCByZW1vdGUKICB3cml0YWJsZSBtZW1vcnkgd2hlbiBgYGxp
YnB5dGhvbmBgIHJlcGxhY2VkIG9uIGRpc2suCgotIGdoLTE1MDk4ODogRml4IGEgcmVmZXJlbmNl
IGxlYWsgaW4gOmV4YzpgT1NFcnJvcmAgd2hlbiBhdHRyaWJ1dGVzIGFyZSBzZXQKICBiZWZvcmUg
YGBzdXBlcigpLl9faW5pdF9fKClgYC4KCi0gZ2gtMTQ0Nzc0OiBGaXggZGF0YSByYWNlIGluIDpj
bGFzczpgQmFzZUV4Y2VwdGlvbmAgd2hlbiBhbiBleGNlcHRpb24gaXMKICBjb3BpZWQgd2hpbGUg
YmVpbmcgbXV0YXRlZC4KCi0gZ2gtMTUwNDExOiBGaXggYSBkYXRhIHJhY2UgaW4gdGhlIGZyZWUt
dGhyZWFkZWQgYnVpbGQgd2hlbgogIDpmdW5jOmBnYy5nZXRfY291bnRgIHJlYWRzIHRoZSB5b3Vu
ZyBnZW5lcmF0aW9uIGFsbG9jYXRpb24gY291bnQgd2hpbGUKICBhbm90aGVyIHRocmVhZCB1cGRh
dGVzIGl0LgoKLSBnaC0xNDk2ODk6IEZpeCBtaXNzaW5nIGVycm9yIHByb3BhZ2F0aW9uIGluIHBh
cnNlciBhY3Rpb24gaGVscGVycyB3aGVuCiAgbWVtb3J5IGFsbG9jYXRpb24gZmFpbHMuIFBhdGNo
IGJ5IFRob21hcyBLb3dhbHNraS4KCi0gZ2gtMTQ5MTYyOiBGaXggYSBwb3RlbnRpYWwgZGVhZGxv
Y2sgaW4KICA6YzpmdW5jOmBQeVVuaWNvZGVfSW50ZXJuRnJvbVN0cmluZ2AgYW5kIG90aGVyIGlu
dGVybmluZyBmdW5jdGlvbnMgaW4gdGhlCiAgOnRlcm06YGZyZWUtdGhyZWFkZWQgYnVpbGRgIHdo
ZW4gY2FsbGVkIGZyb20gQysrIHN0YXRpYyBsb2NhbAogIGluaXRpYWxpemVycy4KCkxpYnJhcnkK
LS0tLS0tLQoKLSBnaC0xNTUwMDk6IEZpeCA6Y2xhc3M6YGFyZ3BhcnNlLkFyZ3VtZW50UGFyc2Vy
YCB0byBwcmVzZXJ2ZSB0aGUgcHJvZ3JhbQogIG5hbWUgZnJvbSBgYHN5cy5hcmd2WzBdYGAgd2hl
biBhIG5hbWVkIG1vZHVsZSBpcyBleGVjdXRlZCBhcyB0aGUgbWFpbgogIHByb2dyYW0gd2l0aG91
dCByZXBsYWNpbmcgYGBzeXMuYXJndlswXWBgLgoKLSBnaC0xNTUwNjM6IEJ1bXAgdGhlIHZlcnNp
b24gb2YgcGlwIGJ1bmRsZWQgaW4gZW5zdXJlcGlwIHRvIHZlcnNpb24gMjYuMi4xCgotIGdoLTE1
NTA2MzogQnVtcCB0aGUgdmVyc2lvbiBvZiBwaXAgYnVuZGxlZCBpbiBlbnN1cmVwaXAgdG8gdmVy
c2lvbiAyNi4yCgotIGdoLTE1NDkzNjogRml4IHRoZSBwdXJlIFB5dGhvbiA6bW9kOmBqc29uYCBk
ZWNvZGVyIHRvIHJlcG9ydCB0aGUgY29ycmVjdAogIHBvc2l0aW9uIGZvciBpbnZhbGlkIGxpdGVy
YWwgY29udHJvbCBjaGFyYWN0ZXJzIGluIEpTT04gc3RyaW5ncy4KCi0gZ2gtMTU0ODkyOiBGaXgg
YSBidWcgaW4gdGhlIEMgYWNjZWxlcmF0b3IgZm9yIDptb2Q6YHpvbmVpbmZvYCB3aGVyZQogIDpj
bGFzczpgZGF0ZXRpbWUuZGF0ZXRpbWVgIHN1YmNsYXNzZXMgcmV0dXJuaW5nIGBgLTFgYCBmb3Ig
YGBob3VyYGAsCiAgYGBtaW51dGVgYCwgb3IgYGBzZWNvbmRgYCBjb3VsZCBpbmNvcnJlY3RseSBy
YWlzZSBhIDpleGM6YFN5c3RlbUVycm9yYC4KCi0gZ2gtMTU0ODQ4OiBUaGUgOm1vZDpgcGlja2xl
YCBDIGFjY2VsZXJhdG9yIG5vdyBlbmZvcmNlcyBmcmFtZSBib3VuZGFyaWVzCiAgd2hlbiB1bnBp
Y2tsaW5nLCBhcyB0aGUgcHVyZSBQeXRob24gaW1wbGVtZW50YXRpb24gYWxyZWFkeSBkaWQuICBB
bgogIGFyZ3VtZW50IHRoYXQgc3RyYWRkbGVzIGEgZnJhbWUgYm91bmRhcnksIG9yIGEgZnJhbWUg
dGhhdCBiZWdpbnMgYmVmb3JlCiAgdGhlIHByZXZpb3VzIG9uZSBoYXMgZW5kZWQsIG5vdyByYWlz
ZXMgOmV4YzpgcGlja2xlLlVucGlja2xpbmdFcnJvcmAKICBpbnN0ZWFkIG9mIGJlaW5nIHNpbGVu
dGx5IHJlYWQgYWNyb3NzIHRoZSBib3VuZGFyeS4gIFRoaXMgcHJldmVudHMgdGhlCiAgbG9hZGVk
IGRhdGEgZnJvbSBkaXZlcmdpbmcgZnJvbSB0aGUgOm1vZDpgcGlja2xldG9vbHNgIGRpc2Fzc2Vt
Ymx5IG9mIHRoZQogIHNhbWUgcGlja2xlLgoKLSBnaC0xMDk2Mzg6IEZpeCBleHBvbmVudGlhbCB0
aW1lIGluIDptZXRoOmBjc3YuU25pZmZlci5zbmlmZmAgZm9yIGEgc2FtcGxlCiAgd2hpY2ggY29u
dGFpbnMgbWFueSBxdW90ZSBjaGFyYWN0ZXJzLiAgQSBkb3VibGVkIHF1b3RlIGNoYXJhY3RlciBp
cyBub3cKICBhbHNvIGRldGVjdGVkIGluIGEgZmllbGQgd2hpY2ggY29udGFpbnMgdGhlIGRlbGlt
aXRlciBvciBhIGxpbmUgYnJlYWsuCgotIGdoLTk4ODIwOiBGaXggcXVhZHJhdGljIHRpbWUgaW4g
Om1ldGg6YGNzdi5TbmlmZmVyLnNuaWZmYCBmb3IgYSBzYW1wbGUKICB3aGljaCBjb250YWlucyBx
dW90ZWQgZmllbGRzLCBpbiBwYXJ0aWN1bGFyIGZvciBhIHNpbmdsZSBjb2x1bW4gb2YgcXVvdGVk
CiAgZmllbGRzLgoKLSBnaC0xNTQ3Mzg6IEZpeCA6bWV0aDpgIUV4dGVybmFsRW50aXR5UGFyc2Vy
Q3JlYXRlYCBub3QgcHJvcGFnYXRpbmcgdGhlCiAgcmVwYXJzZS1kZWZlcnJhbCBzZXR0aW5nIHRv
IHRoZSBzdWJwYXJzZXIsIHdoaWNoIGxlZnQKICA6bWV0aDpgIUdldFJlcGFyc2VEZWZlcnJhbEVu
YWJsZWRgIHJldHVybmluZyBhbiB1bmluaXRpYWxpemVkIHZhbHVlLgogIFBhdGNoIGJ5IHRvbmdo
dWFyb290LgoKLSBnaC05MzI1MTogRml4IDpleGM6YFVuaWNvZGVEZWNvZGVFcnJvcmAgaW4gOm1v
ZDpgc29ja2V0YCBmdW5jdGlvbnMgKHN1Y2gKICBhcyA6ZnVuYzpgfnNvY2tldC5nZXRhZGRyaW5m
b2AgYW5kIDpmdW5jOmB+c29ja2V0LmdldGhvc3RieWFkZHJgKSB3aGVuIHRoZQogIGxvY2FsaXpl
ZCBlcnJvciBtZXNzYWdlIG9mIHRoZSBDIGxpYnJhcnkgaXMgbm90IFVURi04OiBkZWNvZGUgaXQg
ZnJvbSB0aGUKICBsb2NhbGUgZW5jb2RpbmcuCgotIGdoLTE1NDU1MTogRml4IDpmdW5jOmBjdHlw
ZXMudXRpbC5maW5kX2xpYnJhcnlgIHJldHVybmluZyBgYE5vbmVgYCBpbgogIG5vbi1VVEYtOCBs
b2NhbGVzLgoKLSBnaC03OTM2NjogRml4ZWQgYSByYWNlIGNvbmRpdGlvbiBpbiA6bW9kOmBsb2dn
aW5nYDogaWYgYSBoYW5kbGVyIHdhcwogIHJlbW92ZWQgd2hpbGUgYSByZWNvcmQgd2FzIGJlaW5n
IGVtaXR0ZWQsIHRoZSBmb2xsb3dpbmcgaGFuZGxlcnMgb2YgdGhlCiAgc2FtZSBsb2dnZXIgY291
bGQgYmUgc2tpcHBlZC4KCi0gZ2gtNzM0NTg6IEZpeCA6ZnVuYzpgbG9nZ2luZy5jb25maWcubGlz
dGVuYDogaXQgbGVmdCB0aGUgY2FsbGVyIHdhaXRpbmcKICBmb3IgdGhlIGBgcmVhZHlgYCBldmVu
dCBmb3JldmVyIGlmIHRoZSBzZXJ2ZXIgY291bGQgbm90IGJlIHN0YXJ0ZWQsIGZvcgogIGV4YW1w
bGUgaWYgdGhlIHBvcnQgd2FzIGludmFsaWQgb3IgYWxyZWFkeSBpbiB1c2UuIEl0IG5vdyBhbHNv
IGJpbmRzIHRvIGFuCiAgSVB2NiBhZGRyZXNzIGlmIHRoZSBob3N0IGhhcyBubyBJUHY0IGFkZHJl
c3MsIGZvciBleGFtcGxlIGlmIGBgbG9jYWxob3N0YGAKICBpcyBvbmx5IGFsaWFzZWQgdG8gYGA6
OjFgYC4KCi0gZ2gtMTU0NDYwOiBGaXggOmZ1bmM6YHRpbWUuc3RyZnRpbWVgIGFuZAogIDptZXRo
OmBkYXRldGltZS5kYXRldGltZS5zdHJmdGltZWAgcmV0dXJuaW5nIGEgd3JvbmcgSVNPIDg2MDEg
d2VlayBudW1iZXIKICAoYGAlVmBgKSBvbiBPcGVuQlNELgoKLSBnaC0xNTQ0MzU6IEZpeCA6ZnVu
Yzpgb3MucG9zaXhfZmFkdmlzZWAgYW5kIDpmdW5jOmBvcy5wb3NpeF9mYWxsb2NhdGVgIG9uCiAg
RHJhZ29uRmx5IEJTRDogdGhleSByYWlzZWQgOmV4YzpgT1NFcnJvcmAgd2l0aCBhIG1lYW5pbmds
ZXNzIGVycm9yIGNvZGUsCiAgYmVjYXVzZSB0aGVzZSBmdW5jdGlvbnMgcmV0dXJuIC0xIGFuZCBz
ZXQgYGBlcnJub2BgIHRoZXJlLgoKLSBnaC0xNTQzOTk6IEZpeCA6bW9kOmB2ZW52YCBhY3RpdmF0
aW9uIGluIGEgbm9uLWludGVyYWN0aXZlIGNzaDoKICBgYGFjdGl2YXRlLmNzaGBgIG5vIGxvbmdl
ciBmYWlscyB3aGVuIHRoZSBgYHByb21wdGBgIHZhcmlhYmxlIGlzIG5vdCBzZXQuCgotIGdoLTE1
NDM4OTogRml4IDpmdW5jOmB1dWlkLnV1aWQxYCBvbiBPcGVuQlNEOiBpdCByZXR1cm5lZCBhIHZl
cnNpb24gNAogIFVVSUQsIGJlY2F1c2UgYGB1dWlkX2NyZWF0ZSgpYGAgZ2VuZXJhdGVzIHJhbmRv
bSBVVUlEcyBvbiB0aGlzIHBsYXRmb3JtLgoKLSBnaC0xNTQzMjQ6IEZpeCA6ZnVuYzpgb3Muc2Vu
ZGZpbGVgIG9uIGlsbHVtb3M6IGl0IG5vIGxvbmdlciByZXBvcnRzIGEKICBzdWNjZXNzZnVsIHRy
YW5zZmVyIHdoZW4gdGhlIHVuZGVybHlpbmcgc3lzdGVtIGNhbGwgZmFpbGVkIHdpdGhvdXQgd3Jp
dGluZwogIGFueSBkYXRhLgoKLSBnaC0xNTQzMDc6IEZpeCA6bWV0aDpgdGVtcGZpbGUuVGVtcG9y
YXJ5RGlyZWN0b3J5LmNsZWFudXBgIG9uIERyYWdvbkZseQogIEJTRCwgd2hlcmUgcmVtb3Zpbmcg
YSBmaWxlIHdpdGggdGhlIGBgVUZfTk9VTkxJTktgYCBmbGFnIGZhaWxlZCB3aXRoCiAgYGBFSVNE
SVJgYCBpbnN0ZWFkIG9mIGBgRVBFUk1gYC4KCi0gZ2gtMTU0MjkxOiBGaXggOmZ1bmM6YHNvY2tl
dC5oYXNfZHVhbHN0YWNrX2lwdjZgIHRvIHJldHVybiBgYEZhbHNlYGAgb24KICBwbGF0Zm9ybXMg
c3VjaCBhcyBEcmFnb25GbHkgQlNEIHdoZXJlIHNldHRpbmcgYGBJUFY2X1Y2T05MWWBgIHRvIDAK
ICBzaWxlbnRseSBoYXMgbm8gZWZmZWN0LgoKLSBnaC0xNTQyODM6IE9uIERyYWdvbkZseSBCU0Qs
IDpmdW5jOmB0aHJlYWRpbmcuZ2V0X25hdGl2ZV9pZGAgbm93IHJldHVybnMgYQogIHZhbHVlIHRo
YXQgaXMgdW5pcXVlIGFjcm9zcyBwcm9jZXNzZXMsIG1hdGNoaW5nIHRoZSBvdGhlciBwbGF0Zm9y
bXMuCgotIGdoLTE1NDI1ODogRml4IGEgY3Jhc2ggaW4gOm1ldGg6YG1tYXAubW1hcC5yZXNpemVg
IG9uIE5ldEJTRCB3aGVuIGdyb3dpbmcKICBhIHNoYXJlZCBhbm9ueW1vdXMgbWFwcGluZy4gIDpt
ZXRoOmAhcmVzaXplYCBub3cgcmFpc2VzIDpleGM6YFZhbHVlRXJyb3JgCiAgaW4gdGhpcyBjYXNl
LCBhcyBpdCBhbHJlYWR5IGRpZCBvbiBMaW51eC4KCi0gZ2gtMTMxNTY1OiA6ZnVuYzpgY3R5cGVz
LnV0aWwuZGxsaXN0YCBub3cgd29ya3Mgb24gTmV0QlNELiAgSXQgaXMKICBpbXBsZW1lbnRlZCBp
biB0aGUgOm1vZDpgIV9jdHlwZXNgIGV4dGVuc2lvbiBtb2R1bGUgc28gdGhhdAogIGBgZGxfaXRl
cmF0ZV9waGRyKClgYCByZXBvcnRzIGFsbCBsb2FkZWQgc2hhcmVkIGxpYnJhcmllczogb24gTmV0
QlNEIGl0CiAgb25seSByZXBvcnRzIHRoZSBsaW5rLW1hcCBncm91cCBvZiB0aGUgY2FsbGluZyBv
YmplY3QsIHdoaWNoIGV4Y2x1ZGVkIHRoZW0KICB3aGVuIGNhbGxlZCB0aHJvdWdoIGN0eXBlcy4K
Ci0gZ2gtMTU0MjI1OiBGaXggOmZ1bmM6YG9zLm9wZW5wdHlgIG9uIFNvbGFyaXMgYW5kIGlsbHVt
b3M6IGl0IG5vIGxvbmdlcgogIGxlYXZlcyB0aGUgcHNldWRvLXRlcm1pbmFsIGFzIHRoZSBjb250
cm9sbGluZyB0ZXJtaW5hbCBvZiB0aGUgY2FsbGluZwogIHByb2Nlc3MuCgotIGdoLTE1NDIyNzog
Rml4IDpmdW5jOmBvcy5wb3NpeF9vcGVucHRgIG9uIE9wZW5CU0QsIHdoZXJlIGl0IHJlamVjdGVk
IHRoZQogIDpkYXRhOmB+b3MuT19DTE9FWEVDYCBmbGFnLgoKLSBnaC0xNDUwMzA6IEZpeCA6bW9k
OmBhc3luY2lvYCB3cml0ZSBwaXBlIHRyYW5zcG9ydHMgZm9yIG5hbWVkIEZJRk9zIG9uCiAgbWFj
T1MgYW5kIFNvbGFyaXMuIFVucmVhZCBkYXRhIHNpdHRpbmcgaW4gdGhlIEZJRk8gbWFkZSB0aGUg
dHJhbnNwb3J0CiAgbWlzaW50ZXJwcmV0IGEgcG9sbCBldmVudCBhcyB0aGUgcmVhZGVyIGRpc2Nv
bm5lY3RpbmcsIHdyb25nbHkgY2xvc2luZyB0aGUKICB0cmFuc3BvcnQuCgotIGdoLTE1NDAwMTog
Rml4IDpmdW5jOmByYW5kb20uYmlub21pYWx2YXJpYXRlYCByYWlzaW5nCiAgOmV4YzpgWmVyb0Rp
dmlzaW9uRXJyb3JgIHdoZW4gOmZ1bmM6YHJhbmRvbS5yYW5kb21gIHJldHVybnMgemVyby4KCi0g
Z2gtMTUzOTA4OiBGaXggZGF0YSByYWNlIHdoZW4gY2FsbGluZyA6ZnVuYzpgcmVwcmAgb24KICA6
Y2xhc3M6YGl0ZXJ0b29scy5jb3VudGAgdW5kZXIgdGhlIDp0ZXJtOmBmcmVlLXRocmVhZGVkIGJ1
aWxkYC4KCi0gZ2gtMTUzODk2OiBEZWR1cGxpY2F0ZSB1bmhhc2hhYmxlIGFyZ3MgaW4gOmRhdGE6
YHR5cGluZy5MaXRlcmFsYC4KCi0gZ2gtMTUzODY0OiBPbiBhIHdpZGUgOm1vZDpgY3Vyc2VzYCBi
dWlsZCwgOm1ldGg6YGN1cnNlcy53aW5kb3cuaW5zY2hgIG5vdwogIGluc2VydHMgYSBub24tQVND
SUkgYnl0ZSBhcyB0aGUgY2hhcmFjdGVyIGl0IGVuY29kZXMgaW4gdGhlIHdpbmRvdydzCiAgZW5j
b2RpbmcsIGNvbnNpc3RlbnRseSB3aXRoIDptZXRoOmB+Y3Vyc2VzLndpbmRvdy5hZGRjaGAsIGlu
c3RlYWQgb2YgaXRzCiAgY29kZSBwb2ludC4KCi0gZ2gtMTUzODYyOiBPbiBhIHdpZGUgOm1vZDpg
Y3Vyc2VzYCBidWlsZCwgOm1ldGg6YGN1cnNlcy53aW5kb3cuaW5jaGAgbm93CiAgcmV0dXJucyB0
aGUgbG9jYWxlLWVuY29kZWQgYnl0ZSBvZiBhIG5vbi1BU0NJSSBjaGFyYWN0ZXIsIG1hdGNoaW5n
CiAgOm1ldGg6YH5jdXJzZXMud2luZG93Lmluc3RyYCwgaW5zdGVhZCBvZiB0aGUgbG93IGJ5dGUg
b2YgaXRzIGNvZGUgcG9pbnQuCgotIGdoLTE0NjAxMTogRml4IGEgaGVhcC11c2UtYWZ0ZXItZnJl
ZSBpbiB0aGUgQyBpbXBsZW1lbnRhdGlvbiBvZgogIDptb2Q6YGRlY2ltYWxgIHdoZW4gY2FsbGlu
ZyA6ZnVuYzpgcmVwcmAgYWZ0ZXIgZGVsZXRpbmcgdGhlCiAgOmNsYXNzOmB+ZGVjaW1hbC5Db250
ZXh0YC4KCi0gZ2gtMTUzNzYxOiBGaXggY2FuY2VsbGluZyA6bWV0aDpgYXN5bmNpby5sb29wLnNv
Y2tfYWNjZXB0YCBkcm9wcGluZyBhCiAgcGVuZGluZyBjb25uZWN0aW9uLgoKLSBnaC0xNTM2OTU6
IEhhc2hpbmcgYSA6Y2xhc3M6YHNxbGl0ZTMuUm93YCB0aGF0IGNvbnRhaW5zIGFuIHVuaGFzaGFi
bGUKICB2YWx1ZSBub3cgcmFpc2VzIDpleGM6YFR5cGVFcnJvcmAgaW5zdGVhZCBvZiA6ZXhjOmBT
eXN0ZW1FcnJvcmAuIFBhdGNoIGJ5CiAgdG9uZ2h1YXJvb3QuCgotIGdoLTEyNzA0OTogRml4IGEg
cmFjZSBjb25kaXRpb24gaW4gOm1vZDpgYXN5bmNpb2Agb24gVW5peCB3aGVyZQogIDptZXRoOmBh
c3luY2lvLnN1YnByb2Nlc3MuUHJvY2Vzcy5zZW5kX3NpZ25hbGAsCiAgOm1ldGg6YH5hc3luY2lv
LnN1YnByb2Nlc3MuUHJvY2Vzcy50ZXJtaW5hdGVgIG9yCiAgOm1ldGg6YH5hc3luY2lvLnN1YnBy
b2Nlc3MuUHJvY2Vzcy5raWxsYCBjb3VsZCBzaWduYWwgYW4gdW5yZWxhdGVkIHByb2Nlc3MKICB0
aGF0IHdhcyByZWN5Y2xlZCBvbnRvIHRoZSBQSUQgb2YgdGhlIGFscmVhZHktcmVhcGVkIGNoaWxk
IHdoZW4KICBUaHJlYWRlZENoaWxkV2F0Y2hlciBpcyB1c2VkLiBQYXRjaCBieSBLdW1hciBBZGl0
eWEuCgotIGdoLTE1MzY1ODogRml4IDptZXRoOmBzcWxpdGUzLkNvbm5lY3Rpb24uaXRlcmR1bXBg
IHJhaXNpbmcKICA6ZXhjOmBzcWxpdGUzLk9wZXJhdGlvbmFsRXJyb3JgIHdoZW4gYSB0YWJsZSBu
YW1lIGNvbnRhaW5zIGEgc2luZ2xlIHF1b3RlLgogIFBhdGNoIGJ5IHRvbmdodWFyb290LgoKLSBn
aC04NTk0MzogRml4IDptb2Q6YHN0cnVjdGAgZnVuY3Rpb25zIHJhaXNpbmcgOmV4YzpgQnl0ZXNX
YXJuaW5nYCB1bmRlcgogIHRoZSBgYC1iYmBgIGNvbW1hbmQgbGluZSBvcHRpb24gd2hlbiBhIDpj
bGFzczpgc3RyYCBmb3JtYXQgaXMgdXNlZCBhZnRlcgogIGFuIGVxdWFsIDpjbGFzczpgYnl0ZXNg
IGZvcm1hdCAob3IgdmljZSB2ZXJzYSkuICBUaGUgaW50ZXJuYWwgZm9ybWF0IGNhY2hlCiAgbm8g
bG9uZ2VyIG1peGVzIDpjbGFzczpgc3RyYCBhbmQgOmNsYXNzOmBieXRlc2Aga2V5cy4KCi0gZ2gt
MTUzNDA0OiA6Y2xhc3M6YHVybGxpYi5yb2JvdHBhcnNlci5Sb2JvdEZpbGVQYXJzZXJgIG5vdyBz
aWxlbnRseQogIGlnbm9yZXMgYSBgYENyYXdsLWRlbGF5YGAgb3IgYGBSZXF1ZXN0LXJhdGVgYCB2
YWx1ZSB3cml0dGVuIHdpdGgKICBub24tZGVjaW1hbCBkaWdpdHMgKHN1Y2ggYXMgYGBVKzAwQjIg
U1VQRVJTQ1JJUFQgVFdPYGApIGluc3RlYWQgb2YgcmFpc2luZwogIDpleGM6YFZhbHVlRXJyb3Jg
IGFuZCBhYm9ydGluZyB0aGUgcGFyc2Ugb2YgdGhlIHdob2xlIGBgcm9ib3RzLnR4dGBgIGZpbGUu
CgotIGdoLTE1MzQxNzogRXJyb3IgbWVzc2FnZXMgZnJvbSA6bWV0aDpgaW1hcGxpYi5JTUFQNC5z
ZWxlY3RgIGFuZAogIDptZXRoOmBpbWFwbGliLklNQVA0LnVpZGAgbm8gbG9uZ2VyIHJhaXNlIDpl
eGM6YEJ5dGVzV2FybmluZ2AgdW5kZXIKICA6b3B0aW9uOmAhLWJiYCB3aGVuIHRoZSBtYWlsYm94
IG9yIGNvbW1hbmQgYXJndW1lbnQgaXMgOmNsYXNzOmBieXRlc2AuCgotIGdoLTE1MzQwNjogOmZ1
bmM6YGVtYWlsLnV0aWxzLnBhcnNlZGF0ZV90b19kYXRldGltZWAgbm93IHJhaXNlcwogIDpleGM6
YFZhbHVlRXJyb3JgIGluc3RlYWQgb2YgOmV4YzpgT3ZlcmZsb3dFcnJvcmAgd2hlbiB0aGUgcGFy
c2VkIHllYXIgb3IKICB0aW1lem9uZSBvZmZzZXQgaXMgb3V0IG9mIHJhbmdlLCBtYXRjaGluZyBp
dHMgZG9jdW1lbnRlZCBiZWhhdmlvci4KCi0gZ2gtMTUzMDgzOiBEZWZlciBHQyB0cmFja2luZyBv
ZiBhbiA6Y2xhc3M6YGFycmF5LmFycmF5YCB0byB0aGUgZW5kIG9mIGl0cwogIGNvbnN0cnVjdGlv
bi4gUGF0Y2ggYnkgRG9uZ2hlZSBOYS4KCi0gZ2gtMTUzMjkyOiBGaXggZGF0YSByYWNlIGluIHJl
cHIgb2YgOmNsYXNzOmB0aHJlYWRpbmcuUkxvY2tgIGluCiAgZnJlZS10aHJlYWRpbmcgYnVpbGQu
CgotIGdoLTE0Mzk5MDogQSA6Y2xhc3M6YHRraW50ZXIuZm9udC5Gb250YCBjcmVhdGVkIGZyb20g
YSBuYW1lZCBmb250LAogIGluY2x1ZGluZyBieSA6bWV0aDpgfnRraW50ZXIuZm9udC5Gb250LmNv
cHlgLCBub3cgY29waWVzIGl0cyBjb25maWd1cmVkCiAgb3B0aW9ucyByYXRoZXIgdGhhbiB0aGUg
b3B0aW9ucyByZXNvbHZlZCBieSBUY2wncyBgYGZvbnQgYWN0dWFsYGAsCiAgcHJlc2VydmluZyBh
IHNpemUgc3BlY2lmaWVkIGluIHBpeGVscyAoYSBuZWdhdGl2ZSBzaXplKS4KCi0gZ2gtMTQ4Mjg2
OiBGaXggdW5kZWZpbmVkIGJlaGF2aW9yIGluCiAgOmF0dHI6YGNvbXByZXNzaW9uLnpzdGQuWnN0
ZERlY29tcHJlc3Nvci51bnVzZWRfZGF0YWAgd2hlbiBhIGNvbXBsZXRlCiAgZnJhbWUgd2FzIGRl
Y29tcHJlc3NlZCBpbiBhIHNpbmdsZSBjYWxsLgoKLSBnaC0xNTMyMTA6IEZpeCBjcmFzaCBvbiA6
bW9kOmBhcnJheWAgaW1wb3J0IHVuZGVyIGEgbWVtb3J5IHByZXNzdXJlLgoKLSBnaC0xNTMyMDA6
IEZpeCA6ZnVuYzpgbWF0aC5pc3FydGAgcmV0dXJuaW5nIGFuIGluY29ycmVjdCByZXN1bHQgZm9y
CiAgYXJndW1lbnRzIG5vdCBsZXNzIHRoYW4gMioqNjQgdGhhdCBhcmUgaW5zdGFuY2VzIG9mIGFu
IDpjbGFzczpgaW50YAogIHN1YmNsYXNzIHdpdGggYW4gb3ZlcnJpZGRlbiBjb21wYXJpc29uIG9w
ZXJhdG9yLgoKLSBnaC0xNTMwNjg6IEZpeCA6bWV0aDpgIWNQcm9maWxlLlByb2ZpbGUuZW5hYmxl
YCB0byBubyBsb25nZXIgb3ZlcndyaXRlCiAgZXJyb3JzIGZyb20gOm1vZDpgc3lzLm1vbml0b3Jp
bmdgLgoKLSBnaC0xNTMwNjI6IEZpeCBhIGNyYXNoIHdoZW4gY29uY3VycmVudGx5IGl0ZXJhdGlu
ZyBhbgogIDpmdW5jOmBpdGVydG9vbHMudGVlYCBpdGVyYXRvciBvbiB0aGUgZnJlZS10aHJlYWRl
ZCBidWlsZC4KCi0gZ2gtMTUzMDU2OiBGaXggOmNsYXNzOmBzdHJpbmcuVGVtcGxhdGVgIHJhaXNp
bmcgYSBzcHVyaW91cwogIDpleGM6YFZhbHVlRXJyb3JgIHdoZW4gdGhlICpwYXR0ZXJuKiBhdHRy
aWJ1dGUgaXMgYSBjb21waWxlZCByZWd1bGFyCiAgZXhwcmVzc2lvbiBvYmplY3QsIHdoaWNoIHRo
ZSBkb2N1bWVudGF0aW9uIGFsbG93cy4gIE9uIHRoZSBmcmVlLXRocmVhZGVkCiAgYnVpbGQgdGhp
cyBhbHNvIG9jY3VycmVkIGFzIGEgZGF0YSByYWNlIG9uIHRoZSBmaXJzdCBjb25jdXJyZW50IHVz
ZS4KCi0gZ2gtMTUzMDM3OiBGaXggOmNsYXNzOmB+Y29tcHJlc3Npb24uenN0ZC5ac3RkRmlsZWAg
cmFpc2luZwogIDpleGM6YEF0dHJpYnV0ZUVycm9yYCBpbnN0ZWFkIG9mIDpleGM6YGlvLlVuc3Vw
cG9ydGVkT3BlcmF0aW9uYCB3aGVuCiAgaXRlcmF0aW5nIG92ZXIgYSBmaWxlIHRoYXQgaXMgbm90
IG9wZW4gZm9yIHJlYWRpbmcuCgotIGdoLTEzNTY2MTogRml4IDpjbGFzczpgaHRtbC5wYXJzZXIu
SFRNTFBhcnNlcmA6IGFuIGFicnVwdGx5IGNsb3NlZCBlbXB0eQogIGNvbW1lbnQgKGBgPCEtLT5g
YCBvciBgYDwhLS0tPmBgKSBubyBsb25nZXIgZXh0ZW5kcyB1cCB0byBhIGxhdGVyIGBgLS0+YGAK
ICBpbiB0aGUgc2FtZSA6bWV0aDpgfmh0bWwucGFyc2VyLkhUTUxQYXJzZXIuZmVlZGAgY2FsbC4K
Ci0gZ2gtMTUyODUxOiBQcmV2ZW50IGEgY3Jhc2ggd2hlbiBhbGxvY2F0aW9uIGZhaWxzIHdoaWxl
IGNvcHlpbmcgYQogIDpmdW5jOmBCTEFLRS0ycy8yYiA8aGFzaGxpYi5ibGFrZTJiPmAgb2JqZWN0
LiBQYXRjaCBieSBCw6luw6lkaWt0IFRyYW4uCgotIGdoLTU0OTMwOiBFcnJvciByZXNwb25zZXMg
b2YgOmNsYXNzOmBodHRwLnNlcnZlci5CYXNlSFRUUFJlcXVlc3RIYW5kbGVyYAogIHRvIG1hbGZv
cm1lZCByZXF1ZXN0IGxpbmVzIG5vdyBpbmNsdWRlIGEgc3RhdHVzIGxpbmUgYW5kIGhlYWRlcnMg
aW5zdGVhZAogIG9mIGJlaW5nIHNlbnQgaW4gdGhlIGJhcmUgSFRUUC8wLjkgc3R5bGUuIE9ubHkg
YSB2YWxpZCBIVFRQLzAuOSByZXF1ZXN0IChhCiAgdHdvLXdvcmQgYGBHRVRgYCByZXF1ZXN0IGxp
bmUpIG5vdyByZWNlaXZlcyBhbiBIVFRQLzAuOSBzdHlsZSByZXNwb25zZS4KCi0gZ2gtMTE5NTky
OiBGaXggOmNsYXNzOmBjb25jdXJyZW50LmZ1dHVyZXMuUHJvY2Vzc1Bvb2xFeGVjdXRvcmAgc3Ry
YW5kaW5nCiAgc3VibWl0dGVkIHdvcmsgZm9yZXZlciB3aGVuIGEgd29ya2VyIHByb2Nlc3MgZXhp
dGVkIHVwb24gcmVhY2hpbmcgaXRzCiAgKm1heF90YXNrc19wZXJfY2hpbGQqIGxpbWl0IGFmdGVy
CiAgOm1ldGg6YH5jb25jdXJyZW50LmZ1dHVyZXMuRXhlY3V0b3Iuc2h1dGRvd25gIHdhcyBjYWxs
ZWQgd2l0aAogIGBgd2FpdD1GYWxzZWBgOiBhIHJlcGxhY2VtZW50IHdvcmtlciBpcyBub3cgc3Bh
d25lZCBhbmQgdGhlIHJlbWFpbmluZyB3b3JrCiAgZXhlY3V0ZWQgYXMgZG9jdW1lbnRlZC4gSWYg
dGhlIGV4ZWN1dG9yIGhhcyBpbnN0ZWFkIGJlZW4gZ2FyYmFnZSBjb2xsZWN0ZWQKICB3aXRob3V0
IGBgc2h1dGRvd24oKWBgICg6Z2g6YDE1Mjk2N2ApLCBvciBhIHJlcGxhY2VtZW50IHdvcmtlciBj
YW5ub3QgYmUKICBzdGFydGVkLCB0aGUgcmVtYWluaW5nIGZ1dHVyZXMgbm93IGZhaWwgd2l0aAog
IDpleGM6YH5jb25jdXJyZW50LmZ1dHVyZXMucHJvY2Vzcy5Ccm9rZW5Qcm9jZXNzUG9vbGAgaW5z
dGVhZCBvZiBuZXZlcgogIHJlc29sdmluZy4gQSB3b3JrZXIgZXhpdCByYWNpbmcgYGBzaHV0ZG93
bih3YWl0PUZhbHNlKWBgIGNhbiBhbHNvIG5vCiAgbG9uZ2VyIGNyYXNoIHRoZSBleGVjdXRvciBt
YW5hZ2VtZW50IHRocmVhZC4KCi0gZ2gtMTUyOTUxOiA6Y2xhc3M6YGNvbGxlY3Rpb25zLmRlcXVl
YCBwcmV2ZW50IHJhcmUgY3Jhc2ggd2hlbiBjYWxsaW5nCiAgYGBleHRlbmRgYCB1bmRlciBoaWdo
IG1lbW9yeSBwcmVzc3VyZSBjb25kaXRpb25zLgoKLSBnaC0xNTA4ODA6IE5vcm1hbGl6ZSBub24t
ZXh0ZW5kZWQgV2luZG93cyBwYXRocyBiZWZvcmUgYXBwZW5kaW5nIHRoZQogIHdpbGRjYXJkIHVz
ZWQgYnkgYGBvcy5saXN0ZGlyKClgYCBhbmQgYGBvcy5zY2FuZGlyKClgYCwgbWFraW5nIHBhdGhz
IHdpdGgKICB0cmFpbGluZyBzcGFjZXMgYmVoYXZlIGNvbnNpc3RlbnRseSB3aXRoIG90aGVyIGZp
bGVzeXN0ZW0gQVBJcy4KCi0gZ2gtMTUyODQ5OiBPdXQtb2YtcmFuZ2UgZmxvYXQgYW5kIGludGVn
ZXIgdGltZXN0YW1wcyBub3cgcmFpc2UKICA6ZXhjOmBPdmVyZmxvd0Vycm9yYCB3aXRoIHRoZSBz
YW1lIG1lc3NhZ2UuIFBhdGNoIGJ5IHRvbmdodWFyb290LgoKLSBnaC0xNTI4NDc6IFJlamVjdCBh
IFBPU0lYIFRaIHRyYW5zaXRpb24gcnVsZSB3aXRoIG5vbi1kaWdpdCBjaGFyYWN0ZXJzIGluCiAg
dGhlIGRheS1vZi15ZWFyIGZpZWxkIGluIHRoZSBwdXJlLVB5dGhvbiA6bW9kOmB6b25laW5mb2Ag
cGFyc2VyLiBQYXRjaCBieQogIHRvbmdodWFyb290LgoKLSBnaC0xMDgyODA6IENvbm5lY3Rpbmcg
Om1vZDpgaW1hcGxpYmAgdG8gYSBzZXJ2ZXIgdGhhdCBkb2VzIG5vdCBzZW5kIGEKICB2YWxpZCBJ
TUFQNCBncmVldGluZyAoZm9yIGV4YW1wbGUgYSBQT1AzIHNlcnZlciBhbnN3ZXJpbmcgb24gdGhl
IElNQVAKICBwb3J0KSBub3cgcmFpc2VzIGFuIGVycm9yIHJlcG9ydGluZyB0aGUgc2VydmVyJ3Mg
cmVzcG9uc2UgaW5zdGVhZCBvZgogIGBgaW1hcGxpYi5JTUFQNC5lcnJvcjogTm9uZWBgLgoKLSBn
aC02MzEyMTogOm1vZDpgaW1hcGxpYmAgbm93IHJlZnJlc2hlcyB0aGUgY2FjaGVkIGNhcGFiaWxp
dHkgbGlzdCBhZnRlciBhCiAgc3VjY2Vzc2Z1bCA6bWV0aDpgfmltYXBsaWIuSU1BUDQubG9naW5g
IG9yCiAgOm1ldGg6YH5pbWFwbGliLklNQVA0LmF1dGhlbnRpY2F0ZWAsIHVzaW5nIHRoZSBgYENB
UEFCSUxJVFlgYCByZXNwb25zZQogIHNlbnQgYnkgdGhlIHNlcnZlciBvciwgaWYgbm9uZSB3YXMg
c2VudCwgYnkgcXVlcnlpbmcgaXQsIHNvIHRoYXQKICBjYXBhYmlsaXRpZXMgdGhhdCBiZWNvbWUg
YXZhaWxhYmxlIG9ubHkgYWZ0ZXIgYXV0aGVudGljYXRpb24gKHN1Y2ggYXMKICBgYEVOQUJMRWBg
IG9uIEdtYWlsKSBhcmUgcmVjb2duaXplZC4gIENhcGFiaWxpdGllcyBhZHZlcnRpc2VkIGluIHRo
ZQogIHNlcnZlciBncmVldGluZyBhcmUgbm93IGFsc28gdXNlZCwgYXZvaWRpbmcgYSByZWR1bmRh
bnQgYGBDQVBBQklMSVRZYGAKICBjb21tYW5kLgoKLSBnaC04ODU3NDogOm1vZDpgaW1hcGxpYmAg
bm8gbG9uZ2VyIGZhaWxzIHdoZW4gYSBzZXJ2ZXIgc2VuZHMgYSBzcHVyaW91cwogIGJsYW5rIGxp
bmUgYWZ0ZXIgdGhlIGNvdW50ZWQgZGF0YSBvZiBhIGxpdGVyYWwsIGluY2x1ZGluZyBhZnRlciBh
IGxpdGVyYWwKICB0aGF0IHRlcm1pbmF0ZXMgYSByZXNwb25zZSAoc3VjaCBhcyBhIG1haWxib3gg
bmFtZSByZXR1cm5lZCBieSBgYExJU1RgYCkuCiAgU3VjaCBibGFuayBsaW5lcyBhcmUgbm93IHNr
aXBwZWQgd2l0aG91dCBzd2FsbG93aW5nIHRoZSBmb2xsb3dpbmcgbGluZS4KCi0gZ2gtMTUyNTAy
OiBEZXRlY3QgdGhlIDptb2Q6YGN1cnNlc2AgbW91c2UgaW50ZXJmYWNlCiAgKDpmdW5jOmB+Y3Vy
c2VzLmdldG1vdXNlYCwgdGhlIGBgQlVUVE9OKmBgIGNvbnN0YW50cywgYW5kIG90aGVycykgd2l0
aCBhCiAgY29uZmlndXJlIGNhcGFiaWxpdHkgcHJvYmUgb3IgbGlicmFyeSBtYWNyb3MgaW5zdGVh
ZCBvZiBnYXRpbmcgaXQgb24KICBuY3Vyc2VzLXNwZWNpZmljIG1hY3Jvcy4gIEl0IGlzIG5vdyBh
bHNvIGF2YWlsYWJsZSB3aXRoIG90aGVyIGN1cnNlcwogIGltcGxlbWVudGF0aW9ucyB0aGF0IHBy
b3ZpZGUgaXQsIHN1Y2ggYXMgTmV0QlNEIGN1cnNlcyBhbmQgUERDdXJzZXMgKHRoZQogIGxhdHRl
ciB1bmRlcnBpbnMgYGB3aW5kb3dzLWN1cnNlc2BgKS4KCi0gZ2gtMTUxODQyOiBGaXggYSBjcmFz
aCBpbiA6ZnVuYzpgIV9pbnRlcnByZXRlcnMuY2FwdHVyZV9leGNlcHRpb25gIHdoZW4KICA6ZXhj
OmBNZW1vcnlFcnJvcmAgaGFwcGVucy4gUGF0Y2ggYnkgQW1ydXRoYSBNb2RlbGEuCgotIGdoLTQw
MDM4OiA6bW9kOmBpbWFwbGliYCBub3cgYWdhaW4gcXVvdGVzIGNvbW1hbmQgYXJndW1lbnRzIHdo
ZW4KICBuZWNlc3NhcnksIGZvciBleGFtcGxlIG1haWxib3ggbmFtZXMgY29udGFpbmluZyBhIHNw
YWNlLiAgU3VjaCBxdW90aW5nIHdhcwogIGluYWR2ZXJ0ZW50bHkgZGlzYWJsZWQgd2hlbiB0aGUg
bW9kdWxlIHdhcyBwb3J0ZWQgdG8gUHl0aG9uIDMsIGFuZCB0aGUKICBhcmd1bWVudHMgYXJlIG5v
dyBxdW90ZWQgYWNjb3JkaW5nIHRvIHRoZSA6cmZjOmAzNTAxYCBncmFtbWFyLiAgRm9yCiAgYmFj
a3dhcmQgY29tcGF0aWJpbGl0eSwgYW4gYXJndW1lbnQgYWxyZWFkeSBlbmNsb3NlZCBpbiBkb3Vi
bGUgcXVvdGVzIGlzCiAgbGVmdCB1bmNoYW5nZWQsIHNvIGNvZGUgdGhhdCBxdW90ZXMgYXJndW1l
bnRzIGl0c2VsZiBrZWVwcyB3b3JraW5nLgoKLSBnaC01MDk2NjogRml4IHVuYm91bmRlZCByZWN1
cnNpb24gaW4gOm1vZDpgdHVydGxlYCB3aGVuIGEgbW91c2UgZXZlbnQKICBoYW5kbGVyIHRoYXQg
bW92ZXMgdGhlIHR1cnRsZSBpcyByZWVudGVyZWQgd2hpbGUgdGhlIHNjcmVlbiBpcyBiZWluZwog
IHJlZHJhd24sIGZvciBleGFtcGxlIHdpdGggYGBzY3JlZW4ub25kcmFnKHR1cnRsZS5nb3RvKWBg
LiAgVGhpcyBjb3VsZAogIHByZXZpb3VzbHkgY3Jhc2ggdGhlIGludGVycHJldGVyLgoKLSBnaC0x
NTI1Njk6IEZpeCA6ZnVuYzpgYXN5bmNpby53YWl0YCBsZWFraW5nIHdhaXRpbmcgdGFza3Mgdmlh
IHRoZQogIGF3YWl0LWdyYXBoIHdoZW4gcmFjaW5nIGEgZnV0dXJlIHRoYXQgbmV2ZXIgcmVzb2x2
ZXMuIFRoZSB3YWl0aW5nIHRhc2sgaXMKICBub3cgZGlzY2FyZGVkIGZyb20gZXZlcnkgZnV0dXJl
J3MgYGBhd2FpdGVkX2J5YGAgc2V0IG9uY2UKICA6ZnVuYzpgfmFzeW5jaW8ud2FpdGAgcmV0dXJu
cywgZXZlbiBmb3IgcGVuZGluZyBmdXR1cmVzLgoKLSBnaC03ODMzNTogVXBkYXRlIHRoZSBkb2Nz
dHJpbmdzIG9mIDptb2Q6YHRraW50ZXJgIGFuZCA6bW9kOmB0a2ludGVyLnR0a2AKICB3aWRnZXQg
Y2xhc3NlcyB0byBsaXN0IGFsbCBzdXBwb3J0ZWQgd2lkZ2V0IG9wdGlvbnMsIGluY2x1ZGluZyBv
cHRpb25zCiAgYWRkZWQgaW4gVGsgOS4wIGFuZCA5LjEuICBgYHRraW50ZXIuTWVudWJ1dHRvbmBg
IGFuZCBgYHRraW50ZXIuTWVzc2FnZWBgCiAgcHJldmlvdXNseSBoYWQgbm8gb3B0aW9uIGxpc3Qg
YXQgYWxsLgoKLSBnaC0xNTI0MzE6IEZpeCBgYGFzeW5jaW8uU3RyZWFtV3JpdGVyLnN0YXJ0X3Rs
cygpYGAgdG8ga2VlcCB0aGUgbGlua2VkCiAgYGBTdHJlYW1SZWFkZXJgYCB0cmFuc3BvcnQgaW4g
c3luYyB3aXRoIHRoZSB1cGdyYWRlZCB0cmFuc3BvcnQuCgotIGdoLTE1MTEyNjogRml4IHR3byBj
cmFzaGVzIGluIDptb2Q6YHRraW50ZXJgIGFuZCA6bW9kOmBzb2NrZXRgIG1vZHVsZXMKICBpbml0
aWFsaXphdGlvbiB1bmRlciBhIG1lbW9yeSBwcmVzc3VyZS4gU2V0cyBtaXNzaW5nIDpleGM6YE1l
bW9yeUVycm9yYC4KCi0gZ2gtMTMzMDMxOiA6Y2xhc3M6YGN1cnNlcy50ZXh0cGFkLlRleHRib3hg
IG5vdyBlbnRlcnMgYW5kIHJlYWRzIGJhY2sgdGhlCiAgbm9uLUFTQ0lJIGNoYXJhY3RlcnMgb2Yg
YW4gOC1iaXQgbG9jYWxlIGVuY29kaW5nLCBpbnN0ZWFkIG9mIG1hbmdsaW5nIHRoZW0KICB3aXRo
IGEgNy1iaXQgbWFzay4KCi0gZ2gtNzE4ODA6IDpjbGFzczpgY3Vyc2VzLnRleHRwYWQuVGV4dGJv
eGAgbm93IGxldHMgdGhlIGxvd2VyLXJpZ2h0IGNlbGwgb2YKICB0aGUgd2luZG93IGJlIGVkaXRl
ZC4gIFdyaXRpbmcgaXQgd2l0aCA6bWV0aDpgfmN1cnNlcy53aW5kb3cuYWRkY2hgIHdvdWxkCiAg
bW92ZSB0aGUgY3Vyc29yIHBhc3QgdGhlIGVuZCBvZiB0aGUgd2luZG93LCByYWlzaW5nIGFuIGVy
cm9yIGFuZCBzY3JvbGxpbmcKICBhIHNjcm9sbGFibGUgd2luZG93LCBzbyBpdCBpcyBub3cgd3Jp
dHRlbiB3aXRoCiAgOm1ldGg6YH5jdXJzZXMud2luZG93Lmluc2NoYCwgd2hpY2gga2VlcHMgdGhl
IGN1cnNvciBpbiBwbGFjZS4KCi0gZ2gtODMyNzQ6IERlYWxsb2NhdGluZyBhIDptb2Q6YHRraW50
ZXJgIGFwcGxpY2F0aW9uIGZyb20gYSB0aHJlYWQgb3RoZXIKICB0aGFuIHRoZSBvbmUgaXQgd2Fz
IGNyZWF0ZWQgaW4gbm8gbG9uZ2VyIGNyYXNoZXMgdGhlIGludGVycHJldGVyLiAgVGhlCiAgdW5k
ZXJseWluZyBUY2wgaW50ZXJwcmV0ZXIgaXMgbGVha2VkIGluc3RlYWQsIGFuZCBhIDpleGM6YFJ1
bnRpbWVXYXJuaW5nYAogIGlzIHJlcG9ydGVkLgoKLSBnaC0xNTIzMDU6IEZpeCB0aGUgcHVyZS1Q
eXRob24gOm1ldGg6YGRhdGV0aW1lLnRpbWUuc3RyZnRpbWVgCiAgaW1wbGVtZW50YXRpb24gcmFp
c2luZyA6ZXhjOmBBdHRyaWJ1dGVFcnJvcmAgZm9yIHRoZSB5ZWFyIGRpcmVjdGl2ZXMuCiAgUGF0
Y2ggYnkgdG9uZ2h1YXJvb3QuCgotIGdoLTg4NzU4OiA6bWV0aDpgIXRraW50ZXIuTWlzYy5mb2N1
c19nZXRgLCA6bWV0aDpgIWZvY3VzX2Rpc3BsYXlvZmAsCiAgOm1ldGg6YCFmb2N1c19sYXN0Zm9y
YCBhbmQgOm1ldGg6YCF3aW5mb19jb250YWluaW5nYCBub3cgcmV0dXJuIGBgTm9uZWBgCiAgaW5z
dGVhZCBvZiByYWlzaW5nIDpleGM6YEtleUVycm9yYCB3aGVuIHRoZSB3aWRnZXQgd2FzIG5vdCBj
cmVhdGVkIGJ5CiAgOm1vZDpgdGtpbnRlcmAgKGZvciBleGFtcGxlIGEgdG9ybi1vZmYgbWVudSku
CgotIGdoLTM4NDY0OiA6bWV0aDpgIXRraW50ZXIuTWlzYy5uYW1ldG93aWRnZXRgIG5vdyByZXNv
bHZlcyB0aGUKICBhdXRvLWdlbmVyYXRlZCBuYW1lcyBvZiBjbG9uZWQgbWVudXMgKGEgbWVudSB1
c2VkIGFzIGEgbWVudWJhciBvciBhCiAgY2FzY2FkZSkgYmFjayB0byB0aGUgb3JpZ2luYWwgd2lk
Z2V0LgoKLSBnaC0xNTIyNDg6IE1ha2UgdGhlIEMgYW5kIHB1cmUtUHl0aG9uIDptb2Q6YHpvbmVp
bmZvYCBwYXJzZXJzIHZhbGlkYXRlCiAgUE9TSVggVFogYWJicmV2aWF0aW9ucyBjb25zaXN0ZW50
bHksIHJlamVjdGluZyB1bnF1b3RlZCBhYmJyZXZpYXRpb25zIHdpdGgKICBub24tbGV0dGVyIGNo
YXJhY3RlcnMgYW5kIGVtcHR5IHF1b3RlZCBhYmJyZXZpYXRpb25zLiBQYXRjaCBieQogIHRvbmdo
dWFyb290LgoKLSBnaC04MDkzNzogRml4IGEgbWVtb3J5IGxlYWsgaW4gOm1vZDpgdGtpbnRlcmAg
d2hlbiBhIFRjbCBjb21tYW5kIGNyZWF0ZWQKICB3aXRoIGBgY3JlYXRlY29tbWFuZGBgIHdhcyBu
b3QgZXhwbGljaXRseSByZW1vdmVkIGJlZm9yZSB0aGUgaW50ZXJwcmV0ZXIKICB3YXMgZGVsZXRl
ZC4gIFRoZSBjb21tYW5kIG5vIGxvbmdlciBrZWVwcyB0aGUgaW50ZXJwcmV0ZXIgYWxpdmUgdGhy
b3VnaCBhCiAgcmVmZXJlbmNlIGN5Y2xlLgoKLSBnaC0xNTIyNDY6IEZpeCB0aGUgcHVyZS1QeXRo
b24gOm1vZDpgem9uZWluZm9gIHBhcnNlciBhY2NlcHRpbmcgYW4gaW52YWxpZAogIFBPU0lYIFRa
IHRyYW5zaXRpb24gcnVsZSB3aXRoIGEgbm9uLXBlcmlvZCBzZXBhcmF0b3IuIFBhdGNoIGJ5CiAg
dG9uZ2h1YXJvb3QuCgotIGdoLTEzOTgxNjogRml4IGEgaGFuZyBpbiA6bW9kOmB0a2ludGVyYCBv
biBpbnRlcmFjdGl2ZSBQeXRob24gYnVpbHQKICB3aXRob3V0IDptb2Q6YHJlYWRsaW5lYC4gIEFu
IGV4Y2VwdGlvbiByYWlzZWQgaW4gYSBjYWxsYmFjayBubyBsb25nZXIKICBjYXVzZXMgdGhlIGV2
ZW50IGxvb3AgdG8gc3RvcCBhbmQgd2FpdCBmb3IgdGhlIHVzZXIgdG8gcHJlc3MgRW50ZXI7CiAg
cGVuZGluZyBjYWxsYmFja3Mgbm93IGtlZXAgcnVubmluZyB1bnRpbCBpbnB1dCBpcyBhY3R1YWxs
eSBhdmFpbGFibGUgb24KICBzdGRpbi4KCi0gZ2gtMTM5MTQ1OiBGaXggYSBidXN5IGxvb3AgaW4g
Om1vZDpgdGtpbnRlcmAgb24gaW50ZXJhY3RpdmUgUHl0aG9uLiAgV2hlbgogIGEgVGNsIGNvbW1h
bmQgcnVubmluZyBpdHMgb3duIGV2ZW50IGxvb3AgKHN1Y2ggYXMgYGB2d2FpdGBgIG9yCiAgOm1l
dGg6YCF3YWl0X3ZhcmlhYmxlYCkgd2FzIGFjdGl2ZSBhbmQgaW5wdXQgYXJyaXZlZCBvbiBzdGRp
biwgdGhlIGV2ZW50CiAgbG9vcCBrZXB0IHNwaW5uaW5nIGF0IDEwMCUgQ1BVLiBUaGUgc3RkaW4g
ZmlsZSBoYW5kbGVyIGlzIG5vdyByZW1vdmVkIGFzCiAgc29vbiBhcyBpbnB1dCBpcyBhdmFpbGFi
bGUuICBCYXNlZCBvbiBhIHBhdGNoIGJ5IE1pY2hpZWwgZGUgSG9vbi4KCi0gZ2gtMTUyMjEyOiBG
aXggdGhlIHB1cmUtUHl0aG9uIDptb2Q6YHpvbmVpbmZvYCBwYXJzZXIgYWNjZXB0aW5nIGEgUE9T
SVggVFoKICBzdHJpbmcgd2l0aCBhIGBgc3RkYGAgYWJicmV2aWF0aW9uIGJ1dCBubyBvZmZzZXQu
IFRoaXMgaXMgaW52YWxpZCBwZXIKICBQT1NJWCBhbmQgbm93IHJhaXNlcyA6ZXhjOmBWYWx1ZUVy
cm9yYCwgbWF0Y2hpbmcgdGhlIEMgYWNjZWxlcmF0b3IuIFBhdGNoCiAgYnkgdG9uZ2h1YXJvb3Qu
CgotIGdoLTE1MjE1NjogRml4IGEgcG9zc2libGUgY3Jhc2ggaW4gOmZ1bmM6YGNvbmN1cnJlbnQu
aW50ZXJwcmV0ZXJzLmNyZWF0ZWAKICB1bmRlciBsaW1pdGVkIG1lbW9yeSBjb25kaXRpb25zLgoK
LSBnaC0xNTIxNTc6IFRoZSBDIGltcGxlbWVudGF0aW9ucyBvZgogIDptZXRoOmB+ZGF0ZXRpbWUu
ZGF0ZXRpbWUuZnJvbWlzb2Zvcm1hdGAgYW5kCiAgOm1ldGg6YH5kYXRldGltZS50aW1lLmZyb21p
c29mb3JtYXRgIG5vdyByZWplY3QgYSBkZWNpbWFsIHNlcGFyYXRvciB0aGF0CiAgaXMgbm90IGZv
bGxvd2VkIGJ5IGFueSBmcmFjdGlvbmFsIGRpZ2l0IGJlZm9yZSBhIHRpbWV6b25lIGRlc2lnbmF0
b3IuCgotIGdoLTE1MTc2MzogRml4IGNyYXNoIGluIDpmdW5jOmAhX2ludGVycHF1ZXVlcy5jcmVh
dGVgIHdoZQogIDpleGM6YE1lbW9yeUVycm9yYCBoYXBwZW5zIG9uIHF1ZXVlIGNyZWF0aW9uLgoK
LSBnaC0xMDU4OTU6IEFkZCA6a2V5d29yZDpgbWF0Y2hgIGFuZCA6a2V5d29yZDpgY2FzZWAgdG8g
dGhlIGxpc3Qgb2YKICBzdXBwb3J0ZWQgdG9waWNzIGJ5IDpmdW5jOmBoZWxwYC4KCi0gZ2gtMTUy
MDc5OiBGaXggOm1ldGg6YGRhdGV0aW1lLmRhdGV0aW1lLmZyb21pc29mb3JtYXRgIGluIHRoZSBD
CiAgaW1wbGVtZW50YXRpb24gZHJvcHBpbmcgdGhlIHN1Yi1zZWNvbmQgcGFydCBvZiBhIFVUQyBv
ZmZzZXQgd2hvc2UKICB3aG9sZS1zZWNvbmQgcGFydCBpcyB6ZXJvLCBtYXRjaGluZyB0aGUgcHVy
ZS1QeXRob24gaW1wbGVtZW50YXRpb24uCgotIGdoLTE1MjA1MjogVGhlIDptb2Q6YGpzb25gIEMg
YWNjZWxlcmF0b3Igbm93IGNvcnJlY3RseSByZXBvcnRzIGFuCiAgdW50ZXJtaW5hdGVkIHN0cmlu
ZyBmb3IgYSBgYFx1WFhYWGBgIGVzY2FwZSBhdCB0aGUgZW5kIG9mIHRoZSBpbnB1dC4KCi0gZ2gt
MTUyMDYwOiBGaXggOm1ldGg6YGRhdGV0aW1lLmRhdGV0aW1lLmZyb21pc29mb3JtYXRgIHJhaXNp
bmcKICA6ZXhjOmBBc3NlcnRpb25FcnJvcmAgaW5zdGVhZCBvZiA6ZXhjOmBWYWx1ZUVycm9yYCBm
b3Igc29tZSBtYWxmb3JtZWQKICBzdHJpbmdzIGluIHRoZSBwdXJlLVB5dGhvbiBpbXBsZW1lbnRh
dGlvbiwgbWF0Y2hpbmcgdGhlIEMgaW1wbGVtZW50YXRpb24uCgotIGdoLTEyNjIxOTogRml4ZWQg
YSBjcmFzaCBpbiA6Y2xhc3M6YHRraW50ZXIuVGtgIHdoZW4gKmNsYXNzTmFtZSogY29udGFpbnMK
ICBhIG5vbi1CTVAgY2hhcmFjdGVyIGFuZCB0a2ludGVyIGlzIGJ1aWx0IGFnYWluc3QgVGNsL1Rr
IDgueC4gIFN1Y2ggYSBuYW1lCiAgaXMgbm93IHJlamVjdGVkIHdpdGggYSA6ZXhjOmBWYWx1ZUVy
cm9yYC4KCi0gZ2gtODYxNjU6IEZpeCA6ZnVuYzpgaW1hcGxpYi5UaW1lMkludGVybmFsZGF0ZWAg
dG8gdXNlIHRoZSBsb2NhbCB0aW1lem9uZQogIG9mZnNldCBmb3IgYGB0aW1lLnN0cnVjdF90aW1l
YGAgdmFsdWVzIHdpdGggYGB0bV9nbXRvZmZgYCBzZXQgdG8gYGBOb25lYGAsCiAgYXMgcmV0dXJu
ZWQgYnkgYGBkYXRldGltZS5kYXRldGltZS50aW1ldHVwbGUoKWBgLiBDb250cmlidXRlZCBieSBY
aWFvCiAgWXVhbi4KCi0gZ2gtMTUxODE0OiBGaXggdW5ib3VuZGVkIG1lbW9yeSBncm93dGggaW4g
OmNsYXNzOmBpby5UZXh0SU9XcmFwcGVyYCB3aGVuCiAgcmVwZWF0ZWRseSB3cml0aW5nIGFuIGVt
cHR5IHN0cmluZy4KCi0gZ2gtMTUxNzcwOiBGaXggOm1ldGg6YGRhdGV0aW1lLmRhdGV0aW1lLmZy
b21pc29mb3JtYXRgIHJhaXNpbmcKICA6ZXhjOmBBc3NlcnRpb25FcnJvcmAgaW5zdGVhZCBvZiA6
ZXhjOmBWYWx1ZUVycm9yYCBmb3IgYW4gb3V0LW9mLXJhbmdlCiAgbW9udGggY29tYmluZWQgd2l0
aCBhIGBgMjQ6MDBgYCB0aW1lLgoKLSBnaC0xNTE2NjU6IDpmdW5jOmBpbnNwZWN0LnNpZ25hdHVy
ZWAgbm93IHdvcmtzIG9uIHRoZSBsYXp5IGV2YWx1YXRvcnMgb2YKICB0eXBlIGFsaWFzZXMgYW5k
IHR5cGUgcGFyYW1ldGVycyBpbnN0ZWFkIG9mIHJhaXNpbmcgOmV4YzpgVmFsdWVFcnJvcmAuCgot
IGdoLTE1MTY5NTogRml4IGEgdXNlLWFmdGVyLWZyZWUgaW4gdGhlIDptb2Q6YGN1cnNlc2AgbW9k
dWxlLiAgVGhlIGVuY29kaW5nCiAgb2YgdGhlIGluaXRpYWwgc2NyZWVuLCB1c2VkIGJ5IDpmdW5j
OmBjdXJzZXMudW5jdHJsYCBhbmQKICA6ZnVuYzpgY3Vyc2VzLnVuZ2V0Y2hgIHRvIGVuY29kZSBu
b24tQVNDSUkgY2hhcmFjdGVycywgaXMgbm93IGtlcHQgYXMgYQogIHByaXZhdGUgY29weSBpbnN0
ZWFkIG9mIGEgYm9ycm93ZWQgcG9pbnRlciB0byBhIHdpbmRvdyBvYmplY3QgdGhhdCBtYXkgYmUK
ICBkZWFsbG9jYXRlZC4KCi0gZ2gtMTUxNTk2OiBBZGQgbWlzc2luZyBgYHNpemVgYCBwb3NpdGlv
bmFsIGFyZ3VtZW50IHRvIHRoZSBwdXJlLVB5dGhvbgogIGltcGxlbWVudGF0aW9uIG9mIDptZXRo
OmBpby5UZXh0SU9CYXNlLnJlYWRsaW5lYC4KCi0gZ2gtMTUxNjQwOiBGaXggYSBkYXRhIHJhY2Ug
aW4gOmNsYXNzOmBpby5CeXRlc0lPYCBpbiBmcmVlLXRocmVhZGVkIGJ1aWxkcwogIHdoZW4gd2hv
bGUtYnVmZmVyIHJlYWRzIG9yIHBlZWtzLCBvciA6bWV0aDpgfmlvLkJ5dGVzSU8uZ2V0dmFsdWVg
LCBzaGFyZQogIHRoZSBpbnRlcm5hbCBidWZmZXIgd2l0aCBjb25jdXJyZW50IHdyaXRlcy4KCi0g
Z2gtMTQ4NjYwOiBGaXggYSBjcmFzaCBpbiA6bWV0aDpgIWNvbGxlY3Rpb25zLk9yZGVyZWREaWN0
LmNvcHlgIHdoZW4gYQogIGtleSdzIGBgX19lcV9fYGAgb3IgYSBzdWJjbGFzcyBtZXRob2QgbXV0
YXRlcyB0aGUgZGljdCBkdXJpbmcgdGhlIGNvcHkuCiAgTm93IHJhaXNlcyA6ZXhjOmBSdW50aW1l
RXJyb3JgIGluc3RlYWQsIGFzIGl0ZXJhdGlvbiBkb2VzLgoKLSBnaC0xNTE0OTc6IE9wZW5pbmcg
YSA6bW9kOmB0YXJmaWxlYCBhcmNoaXZlIG5vIGxvbmdlciBhdHRlbXB0cyB0bwogIHByZS1hbGxv
Y2F0ZSBhIGh1Z2UgYnVmZmVyIHdoZW4gYSBjcmFmdGVkIG9yIHRydW5jYXRlZCBtZW1iZXIgY2xh
aW1zIGFuCiAgb3ZlcnNpemVkIGV4dGVuZGVkIGhlYWRlciAoYSBHTlUgbG9uZyBuYW1lL2xpbmsg
b3IgYSBwYXggaGVhZGVyKS4gIFRoZQogIGV4dGVuZGVkIGhlYWRlciBpcyBub3cgcmVhZCBpbiBi
b3VuZGVkIGNodW5rcywgc28gaXRzIHNpemUgZmllbGQgY2FuIG5vCiAgbG9uZ2VyIHRyaWdnZXIg
bWVtb3J5IGV4aGF1c3Rpb24uCgotIGdoLTE1MTQwMzogRml4ZWQgYSBjcmFzaCBpbiA6Y2xhc3M6
YHN1YnByb2Nlc3MuUG9wZW5gIChhbmQKICBgYF9wb3NpeHN1YnByb2Nlc3MuZm9ya19leGVjYGAp
IHdoZW4gYW4gYGBhcmd2YGAgaXRlbSdzCiAgOm1ldGg6YH5vcy5QYXRoTGlrZS5fX2ZzcGF0aF9f
YCBjb25jdXJyZW50bHkgbXV0YXRlcyB0aGUgYGBhcmdzYGAgc2VxdWVuY2UKICBiZWluZyBjb252
ZXJ0ZWQuCgotIGdoLTE1MTM5MDogQ29sb3JpemUgYGBtYXRjaGBgIGluIHRoZSA6dGVybTpgUkVQ
TGAgd2hlbiBmb2xsb3dlZCBieSBhIHVuYXJ5CiAgYGArYGAgb3IgYGAtYGAgb3BlcmF0b3IuIFBh
dGNoIGJ5IEJhcnRvc3ogU8WCYXdlY2tpLgoKLSBnaC0xNTExMjY6IEZpeCBjcmFzaCBvbiB1bnNl
dCA6ZXhjOmBNZW1vcnlFcnJvcmAgb24gYWxsb2NhdGlvbiBmYWlsdXJlIGluCiAgOmZ1bmM6YGN0
eXBlcy5nZXRfZXJybm9gLgoKLSBnaC0xNTE0MTY6IEZpeCBhIGNyYXNoIGluIDpmdW5jOmBvcy5z
cGF3bnZgIGFuZCA6ZnVuYzpgb3Muc3Bhd252ZWAgd2hlbiBhbgogICphcmd2KiBpdGVtJ3MgOm1l
dGg6YH5vcy5QYXRoTGlrZS5fX2ZzcGF0aF9fYCBtZXRob2QgbXV0YXRlcyB0aGUgKmFyZ3YqCiAg
bGlzdCBkdXJpbmcgYXJndW1lbnQgY29udmVyc2lvbi4gIDpmdW5jOmAhb3Muc3Bhd252YCBhcmd1
bWVudCBjb252ZXJzaW9uCiAgZXJyb3JzIG90aGVyIHRoYW4gOmV4YzpgVHlwZUVycm9yYCwgc3Vj
aCBhcyB0aGUgOmV4YzpgVmFsdWVFcnJvcmAgZm9yIGFuCiAgZW1iZWRkZWQgbnVsbCwgYXJlIG5v
IGxvbmdlciByZXBsYWNlZCB3aXRoIGEgZ2VuZXJpYyA6ZXhjOmBUeXBlRXJyb3JgLgoKLSBnaC0x
NTEzMzc6IEF2b2lkIHBvc3NpYmxlIG1lbW9yeSBsZWFrIGluIGBgdGtpbnRlci5jYGAgb24gV2lu
ZG93cy4KCi0gZ2gtMTUxMTI2OiBGaXggYSBjcmFzaCB3aGVuIDpleGM6YE1lbW9yeUVycm9yYCBp
bgogIDpmdW5jOmAhb3MuX3BhdGhfc3BsaXRyb290YCB3YXMgbm90IHNldCBwcm9wZXJseS4KCi0g
Z2gtMTUxMTI2OiBGaXggYSBjcmFzaCwgd2hlbiB0aGVyZSdzIG5vIG1lbW9yeSBsZWZ0IG9uIGEg
ZGV2aWNlLCB3aGljaAogIGhhcHBlbmVkIGluIDptb2Q6YCFfaW50ZXJwY2hhbm5lbHNgIG1vZHVs
ZS4KCiAgTm93IGl0IHJhaXNlcyBwcm9wZXIgOmV4YzpgTWVtb3J5RXJyb3JgIGVycm9ycy4KCi0g
Z2gtMTE5NzEwOiBGaXggOm1vZDpgYXN5bmNpb2Agc3VicHJvY2VzcwogIDptZXRoOmB+YXN5bmNp
by5zdWJwcm9jZXNzLlByb2Nlc3Mud2FpdGAgaGFuZ2luZyB3aGVuIHRoZSBwcm9jZXNzIGhhcwog
IGV4aXRlZCBidXQgb25lIG9mIGl0cyBwaXBlcyBpcyBrZXB0IG9wZW4gYnkgYW4gaW5oZXJpdGVk
IGNoaWxkIHByb2Nlc3MgKHNvCiAgdGhlIHBpcGUgbmV2ZXIgcmVhY2hlcyBFT0YpLiBgYHdhaXQo
KWBgIG5vdyByZXR1cm5zIGFzIHNvb24gYXMgdGhlIHByb2Nlc3MKICBleGl0cywgcmVnYXJkbGVz
cyBvZiB0aGUgcGlwZXMnIHN0YXRlLgoKLSBnaC0xNTEyOTU6IEZpeGVkIGEgY3Jhc2ggKHVzZS1h
ZnRlci1mcmVlKSBpbiA6bWV0aDpgYnl0ZXMuam9pbmAgYW5kCiAgOm1ldGg6YGJ5dGVhcnJheS5q
b2luYCB0aGF0IGNvdWxkIG9jY3VyIGlmIGFuIGl0ZW0ncwogIDptZXRoOmB+b2JqZWN0Ll9fYnVm
ZmVyX19gIGNvbmN1cnJlbnRseSBtdXRhdGVzIHRoZSBzZXF1ZW5jZSBiZWluZyBqb2luZWQuCiAg
VGhlIG11dGF0aW9uIGlzIG5vdyByZXBvcnRlZCBhcyBhIDpleGM6YFJ1bnRpbWVFcnJvcmAgaW5z
dGVhZC4KCi0gZ2gtMTA5OTQwOiBGaXggV2luZG93cyA6bW9kOmB2ZW52YCBhY3RpdmF0aW9uIGlu
IGBgY21kLmV4ZWBgIHRvIHJlc3BlY3QKICBgYFZJUlRVQUxfRU5WX0RJU0FCTEVfUFJPTVBUYGAu
CgotIGdoLTExNzgwNzogRml4IDptb2Q6YG1pbWV0eXBlc2AgaW5pdGlhbGl6YXRpb24gZnJvbSBN
SU1FIG1hcCBmaWxlcwogIGNvbnRhaW5pbmcgaW52YWxpZCBVVEYtOCBieXRlcy4KCi0gZ2gtMTUw
NTgzOiBDb3JyZWN0bHkgc2V0IHRoZSBkZWZhdWx0IGNvbXByZXNzaW9uIGxldmVsIGluCiAgOm1v
ZDpgY29tcHJlc3Npb24uenN0ZGAgd2hlbiBwYXNzaW5nIGEgZGlnZXN0ZWQgZGljdGlvbmFyeSBk
dXJpbmcKICBjb21wcmVzc2lvbi4KCi0gZ2gtMTUwNjQxOiBGaXggYnVnIHdoZXJlIDpmdW5jOmB0
eXBpbmcuZXZhbHVhdGVfZm9yd2FyZF9yZWZgIHdpdGggdGhlCiAgYGBTVFJJTkdgYCBmb3JtYXQg
Y291bGQgbGVhayBpbnRlcm5hbCBuYW1lcyB1c2VkIGJ5IHRoZSBhbm5vdGF0aW9uCiAgbWFjaGlu
ZXJ5LgoKLSBnaC0xNTA0ODQ6IEZpeCA6ZnVuYzpgdW5pdHRlc3QubW9jay5tb2NrX29wZW5gIGBg
X19leGl0X19gYCByYWlzaW5nCiAgYGBUeXBlRXJyb3JgYCB3aGVuIHVzZWQgd2l0aCA6Y2xhc3M6
YGNvbnRleHRsaWIuRXhpdFN0YWNrYC4KCi0gZ2gtMTQ5ODE2OiBGaXggYSBwb3RlbnRpYWwgdXNl
IGFmdGVyIGZyZWUgY29uZGl0aW9uIGluCiAgOmZ1bmM6YHBpY2tsZS5kdW1wc2AgaW4gZnJlZS10
aHJlYWRlZCBtb2RlIHdoZW4gc2VyaWFsaXppbmcgbGlzdHMuCgotIGdoLTE0OTMxOTogVGhlIDpt
b2Q6YGFzeW5jaW9gIFJFUEwgbm93IGlnbm9yZXMgOmVudnZhcjpgUFlUSE9OU1RBUlRVUGAgYW5k
CiAgOmVudnZhcjpgUFlUSE9OX0JBU0lDX1JFUExgIHdoZW4gOm9wdGlvbjpgLUVgIG9yIDpvcHRp
b246YC1JYCBpcyB1c2VkLgogIFBhdGNoIGJ5IEpvbmF0aGFuIER1bmcuCgotIGdoLTQ3MDA1OiBG
aXggOm1ldGg6YCF1cmxsaWIucmVxdWVzdC5BYnN0cmFjdEhUVFBIYW5kbGVyLmRvX29wZW5gIHRv
IGdpdmUKICByZWd1bGFyIGhlYWRlcnMgc2V0IHZpYSA6bWV0aDpgfnVybGxpYi5yZXF1ZXN0LlJl
cXVlc3QuYWRkX2hlYWRlcmAKICBwcmlvcml0eSBvdmVyIHVucmVkaXJlY3RlZCBoZWFkZXJzLCBj
b25zaXN0ZW50IHdpdGgKICA6bWV0aDpgfnVybGxpYi5yZXF1ZXN0LlJlcXVlc3QuZ2V0X2hlYWRl
cmAgYW5kCiAgOm1ldGg6YH51cmxsaWIucmVxdWVzdC5SZXF1ZXN0LmhlYWRlcl9pdGVtc2AuCgot
IGdoLTEyMzQ3MTogTWFrZSBjb25jdXJyZW50IGl0ZXJhdGlvbiBvdmVyIDpjbGFzczpgaXRlcnRv
b2xzLnppcF9sb25nZXN0YAogIHNhZmUgdW5kZXIgZnJlZS10aHJlYWRpbmcuCgotIGdoLTEyMzcy
MDogYXN5bmNpbzogRml4IDpmdW5jOmBhc3luY2lvLlNlcnZlci5zZXJ2ZV9mb3JldmVyYCBzaHV0
ZG93bgogIHJlZ3Jlc3Npb24uIFNpbmNlIDMuMTIsIGNhbmNlbGxpbmcgYGBzZXJ2ZV9mb3JldmVy
KClgYCBjb3VsZCBoYW5nIHdhaXRpbmcKICBmb3IgYSBoYW5kbGVyIGJsb2NrZWQgb24gYSByZWFk
IGZyb20gYSBjbGllbnQgdGhhdCBuZXZlciBjbG9zZWQKICAoZWZmZWN0aXZlbHkgcmVxdWlyaW5n
IHR3byBpbnRlcnJ1cHRzIHRvIHN0b3ApOyB0aGUgc2h1dGRvd24gc2VxdWVuY2Ugbm93CiAgZW5z
dXJlcyBjbGllbnQgc3RyZWFtcyBhcmUgY2xvc2VkIHNvIGBgc2VydmVfZm9yZXZlcigpYGAgZXhp
dHMgcHJvbXB0bHkKICBhbmQgaGFuZGxlcnMgb2JzZXJ2ZSBFT0YuCgotIGdoLTEyMzQ3MTogTWFr
ZSBjb25jdXJyZW50IGl0ZXJhdGlvbiBvdmVyIDpjbGFzczpgaXRlcnRvb2xzLmFjY3VtdWxhdGVg
CiAgc2FmZSB1bmRlciBmcmVlLXRocmVhZGluZy4KCi0gZ2gtMTIzNDcxOiBNYWtlIGNvbmN1cnJl
bnQgaXRlcmF0aW9uIG92ZXIKICA6Y2xhc3M6YGl0ZXJ0b29scy5jb21iaW5hdGlvbnNfd2l0aF9y
ZXBsYWNlbWVudGAgYW5kCiAgOmNsYXNzOmBpdGVydG9vbHMucGVybXV0YXRpb25zYCBzYWZlIHVu
ZGVyIGZyZWUtdGhyZWFkaW5nLgoKLSBnaC0xNDM5ODg6IEZpeGVkIGNyYXNoZXMgaW4gOm1ldGg6
YHNvY2tldC5zb2NrZXQuc2VuZG1zZ2AgYW5kCiAgOm1ldGg6YHNvY2tldC5zb2NrZXQucmVjdm1z
Z19pbnRvYCB0aGF0IGNvdWxkIG9jY3VyIGlmIGJ1ZmZlciBzZXF1ZW5jZXMKICBhcmUgY29uY3Vy
cmVudGx5IG11dGF0ZWQuCgotIGdoLTEzMDc5NjogVW5kZXByZWNhdGUgdGhlIDpmdW5jOmBsb2Nh
bGUuZ2V0ZGVmYXVsdGxvY2FsZWAgZnVuY3Rpb24uIFBhdGNoCiAgYnkgVmljdG9yIFN0aW5uZXIu
CgotIGdoLTExNTYzNDogRml4IGEgZGVhZGxvY2sgaW4KICA6Y2xhc3M6YGNvbmN1cnJlbnQuZnV0
dXJlcy5Qcm9jZXNzUG9vbEV4ZWN1dG9yYCB3aGVuIHVzaW5nCiAgYGBtYXhfdGFza3NfcGVyX2No
aWxkYGAsIHByZXNlbnQgc2luY2UgdGhlIGZlYXR1cmUgd2FzIGludHJvZHVjZWQgaW4KICBQeXRo
b24gMy4xMS4gVGhlIGV4ZWN1dG9yIHN0b3BwZWQgc2NoZWR1bGluZyBxdWV1ZWQgdGFza3MgYWZ0
ZXIgYSB3b3JrZXIKICBwcm9jZXNzIGV4aXRlZCB1cG9uIHJlYWNoaW5nIGl0cyB0YXNrIGxpbWl0
LiBCYXNlZCBvbiBhIGZpeCBwcm9wb3NlZCBieQogIFRhYnJleiBNb2hhbW1lZC4KCi0gZ2gtMTQw
MzI2OiBGaXggdGhlIDptb2Q6YGFzeW5jaW9gIFJFUEwgbmFtZXNwYWNlIHNvIHRoYXQgcmVsYXRp
dmUgaW1wb3J0cwogIG5vIGxvbmdlciByZXNvbHZlIGFnYWluc3QgdGhlIDptb2Q6YGFzeW5jaW9g
IHBhY2thZ2UgYW5kIGBgX19maWxlX19gYCBpcwogIG5vIGxvbmdlciBzZXQuCgotIGdoLTc5NjM4
OiBEaXNhbGxvdyBhbGwgYWNjZXNzIGluIDptb2Q6YHVybGxpYi5yb2JvdHBhcnNlcmAgaWYgdGhl
CiAgYGByb2JvdHMudHh0YGAgZmlsZSBpcyB1bnJlYWNoYWJsZSBkdWUgdG8gc2VydmVyIG9yIG5l
dHdvcmsgZXJyb3JzLgoKLSBnaC0xMjM0NzE6IE1ha2UgY29uY3VycmVudCBpdGVyYXRpb25zIG92
ZXIgOmNsYXNzOmBpdGVydG9vbHMuY2hhaW5gIHNhZmUKICB1bmRlciA6dGVybTpgZnJlZSB0aHJl
YWRpbmdgLgoKLSBnaC0xMjM0NzE6IE1ha2UgY29uY3VycmVudCBpdGVyYXRpb25zIG92ZXIgOmNs
YXNzOmBpdGVydG9vbHMuY29tYmluYXRpb25zYAogIGFuZCA6Y2xhc3M6YGl0ZXJ0b29scy5wcm9k
dWN0YCBzYWZlIHVuZGVyIGZyZWUtdGhyZWFkaW5nLgoKLSBnaC0xMjM0NzE6IE1ha2UgY29uY3Vy
cmVudCBpdGVyYXRpb25zIG92ZXIgOmNsYXNzOmBpdGVydG9vbHMuY3ljbGVgIHNhZmUKICB1bmRl
ciBmcmVlLXRocmVhZGluZy4KCi0gZ2gtMTIwNjY1OiBGaXhlZCBhbiBpc3N1ZSB3aGVyZSBgYHVu
aXR0ZXN0YGAgbG9hZGVycyB3b3VsZCBsb2FkIGFuZAogIGluc3RhbnRpYXRlIDpjbGFzczpgdW5p
dHRlc3QuVGVzdENhc2VgLWRlcml2ZWQgc3ViY2xhc3NlcyB0aGF0IGFyZSBhbHNvCiAgYWJzdHJh
Y3QgYmFzZSBjbGFzc2VzLCB3aGljaCBjYW4ndCBiZSBpbnN0YW50aWF0ZWQuCgotIGdoLTEwNTcw
ODogQWNjZXB0IGFuIHVwcGVyY2FzZSBWIHByZWZpeCBpbiBJUHZGdXR1cmUgYWRkcmVzc2VzIGlu
CiAgOmZ1bmM6YHVybGxpYi5wYXJzZS51cmxzcGxpdGAuCgotIGdoLTEwMzkyNTogRml4IDptZXRo
OmBjc3YuU25pZmZlci5zbmlmZmAgZm9yIGEgc2FtcGxlIHdpdGggYGBcclxuYGAgbGluZQogIGVu
ZGluZ3MgaW4gd2hpY2ggYSBxdW90ZWQgZmllbGQgZW5kcyBhIGxpbmU6IGEgbGV0dGVyIGNvdWxk
IGJlIGRldGVjdGVkIGFzCiAgdGhlIGRlbGltaXRlci4KCi0gZ2gtMTAxMjY3OiBXaGVuIGEgd29y
a2VyIHByb2Nlc3MgdGVybWluYXRlcyB1bmV4cGVjdGVkbHksCiAgOmNsYXNzOmBjb25jdXJyZW50
LmZ1dHVyZXMuUHJvY2Vzc1Bvb2xFeGVjdXRvcmAgbm93IHNldHMgYSBzZXBhcmF0ZQogIDpleGM6
YH5jb25jdXJyZW50LmZ1dHVyZXMucHJvY2Vzcy5Ccm9rZW5Qcm9jZXNzUG9vbGAgZXhjZXB0aW9u
IG9uIGVhY2gKICBwZW5kaW5nIGZ1dHVyZSBpbnN0ZWFkIG9mIHNoYXJpbmcgYSBzaW5nbGUgaW5z
dGFuY2UgYW1vbmcgdGhlbSBhbGwuCiAgU2hhcmluZyBvbmUgZXhjZXB0aW9uIHByb2R1Y2VkIG1h
bGZvcm1lZCB0cmFjZWJhY2tzOiBlYWNoCiAgOm1ldGg6YEZ1dHVyZS5yZXN1bHQoKSA8Y29uY3Vy
cmVudC5mdXR1cmVzLkZ1dHVyZS5yZXN1bHQ+YCBjYWxsIHJlLXJhaXNlZAogIHRoZSBzYW1lIG9i
amVjdCwgYXBwZW5kaW5nIGFub3RoZXIgY29weSBvZiB0aGUgdHJhY2ViYWNrIHRvIGl0LgoKRG9j
dW1lbnRhdGlvbgotLS0tLS0tLS0tLS0tCgotIGdoLTExODE1MDogQ2xhcmlmeSBpbiB0aGUgOm1v
ZDpgZGlmZmxpYmAgZG9jdW1lbnRhdGlvbiB3aGF0ICpqdW5rKgogIGFjdHVhbGx5IGRvZXMsIGl0
cyBkcmF3YmFja3MsIGFuZCBob3cgdG8gY29udHJvbCBpdC4KCi0gZ2gtODY3MjY6IEdyZWF0bHkg
ZXhwYW5kIHRoZSA6bW9kOmB0a2ludGVyYCBkb2N1bWVudGF0aW9uIHRvIGNvdmVyIHRoZQogIGZ1
bGwgcHVibGljIEFQSSBvZiB0aGUgcGFja2FnZSBhbmQgaXRzIHN1Ym1vZHVsZXMuICBUaGUgZGVz
Y3JpcHRpb25zIGFyZQogIG9yaWVudGVkIHRvd2FyZHMgUHl0aG9uIHJhdGhlciB0aGFuIFRjbC9U
aywgd2l0aCBjb3JyZWN0ZWQgcmV0dXJuIHR5cGVzCiAgYW5kIGBgdmVyc2lvbmFkZGVkYGAvYGB2
ZXJzaW9uY2hhbmdlZGBgIGluZm9ybWF0aW9uLgoKVGVzdHMKLS0tLS0KCi0gZ2gtMTU1MTA5OiBB
ZGQgYGB0ZXN0LnN1cHBvcnQucnVuX3dpdGhfbGltaXRlZF9jX3N0YWNrKClgYCBhbmQgdXNlIGl0
IGluCiAgdGVzdHMgdGhhdCBleGhhdXN0IHRoZSBDIHN0YWNrIHdpdGggYSBmaXhlZCBudW1iZXIg
b2YgcmVjdXJzaXZlIGNhbGxzLCBzbwogIHRoYXQgdGhlaXIgb3V0Y29tZSBubyBsb25nZXIgZGVw
ZW5kcyBvbiB0aGUgQyBzdGFjayBzaXplLgoKLSBnaC03NjU5NTogQWRkIEMgQVBJIHRlc3RzIGZv
ciA6YzpmdW5jOmBQeUNhcHN1bGVfSW1wb3J0YC4KCi0gZ2gtMTU0MjExOiBBZGQgYGB0ZXN0LnN1
cHBvcnQuc2tpcF9pZl9odWdlX2Nfc3RhY2soKWBgIGFuZCB1c2UgaXQgdG8gc2tpcAogIHRlc3Rz
IHRoYXQgZXhoYXVzdCB0aGUgQyBzdGFjayBpZiB0aGUgc3RhY2sgbGltaXQgaXMgdmVyeSBsYXJn
ZSAoZS5nLiBvbgogIERyYWdvbkZseSBCU0Qgb3Igd2l0aCBgYHVsaW1pdCAtcyB1bmxpbWl0ZWRg
YCkuCgotIGdoLTE1NDE2NzogVGhlIHRlc3QgcnVubmVyIChyZWdydGVzdCkgbm93IHJlc3RvcmVz
IHRoZSBkZWZhdWx0IFNJR0lOVAogIGhhbmRsZXIgaWYgaXQgd2FzIGluaGVyaXRlZCBhcyBpZ25v
cmVkLCBzbyB0aGUgdGVzdCBzdWl0ZSBubyBsb25nZXIgaGFuZ3MKICB3aGVuIHJ1biBhcyBhIHNo
ZWxsIGJhY2tncm91bmQgam9iLgoKLSBnaC0xNTQxNDQ6IEZpeCBidWlsZGluZyB0aGUgOm1vZDpg
IV90ZXN0Y2FwaWAgbW9kdWxlIG9uIE5ldEJTRC4KCi0gZ2gtMTUyNTQ4OiBBZGQgdGhlIDpmdW5j
OmB0ZXN0LnN1cHBvcnQuaXNvbGF0aW9uLnJ1bkluU3VicHJvY2Vzc2AKICBkZWNvcmF0b3IgdG8g
cnVuIGEgdGVzdCBtZXRob2Qgb3IgYGBUZXN0Q2FzZWBgIHN1YmNsYXNzIGluIGEgZnJlc2gKICBp
bnRlcnByZXRlciBzdWJwcm9jZXNzLCBpc29sYXRlZCBmcm9tIHRoZSByZXN0IG9mIHRoZSB0ZXN0
IHJ1bi4KCi0gZ2gtMTUxNjI2OiBGaXggc2V2ZXJhbCB0ZXN0cyBpbiBgYHRlc3QudGVzdF9pbnNw
ZWN0YGAsCiAgYGB0ZXN0LnRlc3RfaW1wb3J0YGAsIGBgdGVzdC50ZXN0X2ltcG9ydGxpYmBgLCBg
YHRlc3QudGVzdF9weV9jb21waWxlYGAKICBhbmQgYGB0ZXN0LnRlc3RfY29tcGlsZWFsbGBgIHRo
YXQgZmFpbGVkIHdoZW4gdGhlIHRlc3Qgc3VpdGUgd2FzIHJ1biB3aXRoCiAgOmVudnZhcjpgUFlU
SE9OUFlDQUNIRVBSRUZJWGAgc2V0LiAgVGhlc2UgdGVzdHMgbm93IG5ldXRyYWxpemUgdGhlIHB5
Y2FjaGUKICBwcmVmaXggd2hlcmUgdGhleSBhc3N1bWUgdGhlIGRlZmF1bHQgYGBfX3B5Y2FjaGVf
X2BgIGJ5dGVjb2RlIGxheW91dC4KCi0gZ2gtMTUxMDk2OiBGaXggYGB0ZXN0X2VtYmVkYGAgZmFp
bGluZyB3aGVuIENQeXRob24gaXMgY29uZmlndXJlZCB3aXRoIGEKICBzcGxpdCBleGVjIHByZWZp
eCAoYGAtLWV4ZWMtcHJlZml4YGAgZGlmZmVyaW5nIGZyb20gYGAtLXByZWZpeGBgKS4KCi0gZ2gt
MTQ4ODUzOiBGaXggdGVzdHMgZmFpbGluZyBvbiBGcmVlQlNEIGluIHRlc3Quc3VwcG9ydCdzCiAg
aW5fc3lzdGVtZF9uc3Bhd25fc3luY19zdXBwcmVzc2VkKCkgIGR1ZSB0byB1bnJlYWRhYmxlIC9y
dW4gZGlyZWN0b3J5LgoKQnVpbGQKLS0tLS0KCi0gZ2gtMTU0MDcwOiBCdWlsZCB0aGUgOm1vZDpg
Y3Vyc2VzYCBtb2R1bGUgYWdhaW5zdCBhIHdpZGUtY2hhcmFjdGVyIGNhcGFibGUKICBuY3Vyc2Vz
IGV2ZW4gd2hlbiBpdCBpcyBub3QgbmFtZWQgYGBuY3Vyc2Vzd2BgIC0tIGZvciBleGFtcGxlIHRo
ZSBwa2dzcmMKICBuY3Vyc2VzIG9uIE5ldEJTRCBhbmQgaWxsdW1vcywgb3IgdGhlIHN5c3RlbSBu
Y3Vyc2VzIG9uIG1hY09TLiAgU3VjaCBhCiAgbGlicmFyeSBwcmV2aW91c2x5IHByb2R1Y2VkIGEg
bmFycm93IGJ1aWxkLgoKLSBnaC0xMjY4Nzc6IEZpeCB0aGUgOnByb2dyYW06YGNvbmZpZ3VyZWAg
Y2hlY2sgZm9yIFRjbC9UayB3aGljaCBjb3VsZAogIHdyb25nbHkgc3VjY2VlZCB3aXRoIG9wdGlt
aXppbmcgY29tcGlsZXJzIHdoZW4gdGhlIGxpYnJhcmllcyBhcmUgbWlzc2luZy4KCi0gZ2gtMTUz
NDM4OiBVcGRhdGUgV2luZG93cyBidWlsZCBhbmQgaW5zdGFsbGVyIHRvb2xpbmcgYW5kIGRvY3Vt
ZW50YXRpb24gdG8KICB1c2UgdGhlIGN1cnJlbnQgZG93bmxvYWQgVVJMIGZvciBgYG51Z2V0LmV4
ZWBgLgoKLSBnaC0xNTI1MDI6IFRoZSA6bW9kOmBjdXJzZXNgIG1vZHVsZSBub3cgZGV0ZWN0cyBg
YHNldF9lc2NkZWxheSgpYGAsCiAgYGBzZXRfdGFic2l6ZSgpYGAgYW5kIHRoZSBgYEVTQ0RFTEFZ
YGAgYW5kIGBgVEFCU0laRWBgIHZhcmlhYmxlcyB3aXRoCiAgOnByb2dyYW06YGNvbmZpZ3VyZWAg
Y2FwYWJpbGl0eSBwcm9iZXMgaW5zdGVhZCBvZiB0aGUgbmN1cnNlcy1zcGVjaWZpYwogIGBgTkNV
UlNFU19FWFRfRlVOQ1NgYCBtYWNybywgc28gdGhleSBhcmUgZXhwb3NlZCB3aGVuIGJ1aWxkaW5n
IGFnYWluc3QKICBvdGhlciBjdXJzZXMgaW1wbGVtZW50YXRpb25zIHN1Y2ggYXMgTmV0QlNEIGN1
cnNlcyB0aGF0IHByb3ZpZGUgdGhlbS4KCi0gZ2gtMTQ4MjYwOiBPbiBMaW51eCB3aGVuIFB5dGhv
biBpcyBsaW5rZWQgdG8gdGhlIG11c2wgQyBsaWJyYXJ5LCB1c2UgYQogIHRocmVhZCBzdGFjayBz
aXplIG9mIGF0IGxlYXN0IDEgTWlCIGluc3RlYWQgb2YgbXVzbCBkZWZhdWx0IHdoaWNoIGlzIDEy
OAogIGtpQi4gUGF0Y2ggYnkgVmljdG9yIFN0aW5uZXIuCgotIGdoLTEzODgwMDogRml4IGxpYnJh
cnkgbmFtZSBpbiBweXRob24zLnBjIG9uIEFuZHJvaWQuCgpXaW5kb3dzCi0tLS0tLS0KCi0gZ2gt
MTI0MTExOiBVcGRhdGVkIFdpbmRvd3MgYnVpbGRzIHRvIHVzZSBUY2wvVGsgOS4wLjQuCgotIGdo
LTE1MDgzNjogTWFrZSBpbnN0YWxsZWQgdGtpbnRlciB3b3JrIHdpdGggVGNsL1RrIDkgYnVpbGRz
IHRoYXQgZW1iZWQgdGhlCiAgVGsgc2NyaXB0IGxpYnJhcnkgaW4gdGhlIFRrIERMTCBvbiBXaW5k
b3dzLgoKLSBnaC0xNDAxNDY6IFByZXZlbnQgOm1vZDpgdGtpbnRlcmAgZnJvbSBoYW5naW5nIG9u
IFdpbmRvd3MgaWYgc3RkaW4gaXMKICByZWRpcmVjdGVkIHRvIGEgcGlwZSBpbiBhbiBpbnRlcmFj
dGl2ZSBzZXNzaW9uLiBUaGlzIGlzIGhlbHBmdWwgZm9yCiAgdGVzdGluZyBpbnRlcmFjdGl2ZSB1
c2FnZSBvZiB0a2ludGVyIGZyb20gYSBzY3JpcHQsIGZvciBleGFtcGxlIGFzIHBhcnQgb2YKICB0
aGUgY3B5dGhvbiB0ZXN0IHN1aXRlLgoKbWFjT1MKLS0tLS0KCi0gZ2gtMTUzNzExOiBPbiBtYWNP
UywgZG8gbm90IGF0dGVtcHQgdG8gdXNlIHRoZSA6bWFucGFnZTpgZHVwMygyKWAgYW5kCiAgOm1h
bnBhZ2U6YHBpcGUyKDIpYCBzeXN0ZW0gY2FsbHMgaW50cm9kdWNlZCBpbiBtYWNPUyAyNyB0byBw
cmV2ZW50CiAgcHJvYmxlbXMgd2hlbiBydW5uaW5nIG9uIG9sZGVyIHN5c3RlbXMuCgotIGdoLTEy
NDExMTogVXBkYXRlIG1hY09TIGluc3RhbGxlciB0byB1c2UgVGNsL1RrIDkuMC40LgoKSURMRQot
LS0tCgotIGdoLTgyMTgzOiBXaGVuIHRoZSBzaGVsbCBpcyBidXN5IHJ1bm5pbmcgY29kZSwgdXNp
bmcgIlJ1bi4uLiBDdXN0b21pemVkIgogIHdpdGggIlJlc3RhcnQgc2hlbGwiIHVuY2hlY2tlZCBu
b3cgcmVwb3J0cyB0aGF0IHRoZSBzaGVsbCBpcyBleGVjdXRpbmcKICBpbnN0ZWFkIG9mIHJlc3Rh
cnRpbmcgaXQgYW55d2F5LgoKLSBnaC04MzY1MzogQmxhbmtpbmcgYW4gaW50ZWdlciBlbnRyeSBp
biBJRExFJ3MgU2V0dGluZ3MgZGlhbG9nLCBzdWNoIGFzCiAgIkF1dG8gc3F1ZWV6ZSBtaW4gbGlu
ZXMiLCBubyBsb25nZXIgc2F2ZXMgYW4gZW1wdHkgc3RyaW5nIGFzIGFuIGludmFsaWQKICBjb25m
aWd1cmF0aW9uIHZhbHVlLgoKLSBnaC02NTMzOTogU2F2aW5nIHRoZSBJRExFIFNoZWxsIG9yIGFu
IE91dHB1dCB3aW5kb3cgbm93IGRlZmF1bHRzIHRvIGEKICBgYC50eHRgYCBleHRlbnNpb24gYW5k
IGxpc3RzIHRleHQgZmlsZXMgYmVmb3JlIFB5dGhvbiBmaWxlcywgc2luY2UgdGhlaXIKICBjb250
ZW50IGlzIG5vdCBQeXRob24gc291cmNlLgoKLSBnaC04MDUwNDogVGhlICJJbiBmaWxlczoiIGZp
ZWxkIG9mIElETEUncyBGaW5kIGluIEZpbGVzIGRpYWxvZyBub3cgYWx3YXlzCiAgY29udGFpbnMg
YSBmdWxsIGRpcmVjdG9yeSBwYXRoLCBldmVuIGZvciBhbiB1bnNhdmVkIGVkaXRvciBvciB0aGUg
U2hlbGwuCiAgVGhpcyBzaG93cyBpbiB0aGUgZ3JlcCBvdXRwdXQgd2hpY2ggZGlyZWN0b3J5IHdh
cyBzZWFyY2hlZC4KCi0gZ2gtMTM0MzAwOiBEbyBub3QgYWRkIHRoZSBgYGlkbGVsaWJgYCBkaXJl
Y3RvcnkgdG8gdGhlIHBhdGggb2YgdGhlIElETEUKICB1c2VyIHByb2Nlc3MuIFVzZXIgY29kZSBy
dW4gaW4gSURMRSBjYW4gbm8gbG9uZ2VyIGltcG9ydCBgYGlkbGVsaWJgYAogIHN1Ym1vZHVsZXMg
YXMgdG9wLWxldmVsIG1vZHVsZXMsIHN1Y2ggYXMgYGBpbXBvcnQgaGVscGBgLgoKLSBnaC04OTM2
MDogRml4IGEgcmFyZSBjcmFzaCBpbiB0aGUgSURMRSBlZGl0b3Igd2hlbiB0aGUgY29tcGxldGlv
biB3aW5kb3cKICBpcyBjbG9zZWQ6IGRlbGV0aW5nIGEga2V5IGJpbmRpbmcgZm9yIGEgc2VxdWVu
Y2UgdGhhdCBpcyBub3QgYm91bmQgdG8gdGhlCiAgdmlydHVhbCBldmVudCBpcyBub3cgaWdub3Jl
ZCBpbnN0ZWFkIG9mIHJhaXNpbmcgYSBgYFZhbHVlRXJyb3JgYC4KCi0gZ2gtNzE5NTY6IEZpeCBS
ZXBsYWNlIEFsbCBpbiB0aGUgSURMRSBlZGl0b3IncyBSZXBsYWNlIGRpYWxvZyB3aGVuIHRoZQog
IHNlYXJjaCBkaXJlY3Rpb24gaXMgIlVwIiBhbmQgIldyYXAgYXJvdW5kIiBpcyBvZmY6IGl0IG5v
dyByZXBsYWNlcyBhbGwKICBtYXRjaGVzIGFib3ZlIHRoZSBjdXJyZW50IHBvc2l0aW9uIGluc3Rl
YWQgb2Ygb25seSB0aGUgZmlyc3Qgb25lLgoKLSBnaC0xNTI3Mjg6IE1vdmUgZnVuY3Rpb25zIHJ1
bi5maXhfc2NhbGluZywgZWRpdG9yLmZpeHdvcmRicmVha3MgKGFzCiAgZml4X3dvcmRfYnJlYWtz
KSBhbmQgcHlzaGVsbC5maXhfeDExX3Bhc3RlIHRvIGlkbGVsaWIudXRpbC4KCi0gZ2gtNjYzMzE6
IFNldCB0aGUgYGBXTV9DTEFTU2BgIHdpbmRvdyBwcm9wZXJ0eSBvZiBJRExFJ3Mgd2luZG93cyB0
bwogIGBgSWRsZWBgIG9uIFgxMSwgc28gdGhhdCB3aW5kb3cgbWFuYWdlcnMgZ3JvdXAgYW5kIGxh
YmVsIHRoZW0gY29ycmVjdGx5CiAgaW5zdGVhZCBvZiB1c2luZyB0aGUgZGVmYXVsdCBgYFRvcGxl
dmVsYGAuCgotIGdoLTg1MzIwOiBJRExFIG5vdyByZWFkcyBhbmQgd3JpdGVzIGl0cyBjb25maWd1
cmF0aW9uIGZpbGVzIGFuZCB0aGUKICBicmVha3BvaW50cyBmaWxlIHVzaW5nIFVURi04IGluc3Rl
YWQgb2YgdGhlIGxvY2FsZSBlbmNvZGluZy4gIFRoaXMga2VlcHMKICBub24tQVNDSUkgZGF0YSAo
c3VjaCBhcyBub24tQVNDSUkgcGF0aHMpIGZyb20gYmVpbmcgY29ycnVwdGVkIGFuZCBtYWtlcwog
IHRoZSBmaWxlcyBwb3J0YWJsZSBiZXR3ZWVuIGVudmlyb25tZW50cy4KCi0gZ2gtOTQ1MjM6IERl
dGVjdCBmaWxlIGlmIG1vZGlmaWVkIGF0IGxvY2FsIGRpc2sgYW5kIHByb21wdCB0byBhc2sgcmVm
cmVzaC4KICBQYXRjaCBieSBTaGl4aWFuIExpLgoKLSBnaC0xMzk1NTE6IFN1cHBvcnQgcmVuZGVy
aW5nIDpleGM6YEJhc2VFeGNlcHRpb25Hcm91cGAgaW4gSURMRS4KCi0gZ2gtODk1MjA6IE1ha2Ug
SURMRSBleHRlbnNpb24gY29uZmlndXJhdGlvbiBsb29rIGF0IHVzZXIgY29uZmlnIGZpbGVzLAog
IGFsbG93aW5nIHVzZXItaW5zdGFsbGVkIGV4dGVuc2lvbnMgdG8gaGF2ZSBzZXR0aW5ncyBhbmQg
a2V5IGJpbmRpbmdzCiAgZGVmaW5lZCBpbiB+Ly5pZGxlcmMuCgpUb29scy9EZW1vcwotLS0tLS0t
LS0tLQoKLSBnaC0xNTUyMTg6IEZpeCBBcmd1bWVudCBDbGluaWMgZ2VuZXJhdGluZyB0aGUgZmxh
Z3Mgb2YgdGhlIG9wdGlvbmFsIGdyb3VwcwogIGluIGRpZmZlcmVudCBvcmRlciBvbiAzMi1iaXQg
YW5kIDY0LWJpdCBwbGF0Zm9ybXMuCgotIGdoLTE1NTIwNzogQXJndW1lbnQgQ2xpbmljIG5vdyBz
dXBwb3J0cyB0aGUgYGAtLWRyeS1ydW5gYCBhbmQgYGAtLWRpZmZgYAogIG9wdGlvbnMuIFRoZXkg
bGlzdCB0aGUgZmlsZXMgd2hpY2ggd291bGQgYmUgY2hhbmdlZCwgb3Igd3JpdGUgYSB1bmlmaWVk
CiAgZGlmZiBvZiB0aGUgY2hhbmdlcyB0byB0aGUgc3RhbmRhcmQgb3V0cHV0LCB3aXRob3V0IG1v
ZGlmeWluZyBhbnkgZmlsZS4KCi0gZ2gtMTU0NTgwOiBGaXggYGBweXRob24tZ2RiLnB5YGAgcmFp
c2luZyA6ZXhjOmBVbmljb2RlRW5jb2RlRXJyb3JgIHdoZW4KICBwcmV0dHktcHJpbnRpbmcgYSBu
b24tQVNDSUkgOmNsYXNzOmBzdHJgIGluIGEgbG9jYWxlIHdob3NlIGhvc3QgY2hhcnNldAogIGNh
bm5vdCBlbmNvZGUgaXQsIHN1Y2ggYXMgYW55IG5vbi1BU0NJSSBzdHJpbmcgaW4gdGhlIEMgbG9j
YWxlLgoKQyBBUEkKLS0tLS0KCi0gZ2gtMTUyMTMyOiBGaXggOmM6ZnVuYzpgUHlfUnVuTWFpbmAg
dG8gcmV0dXJuIGFuIGV4aXQgY29kZSwgcmF0aGVyIHRoYW4KICBjYWxsaW5nIDpjOmZ1bmM6YFB5
X0V4aXRgLCB3aGVuIHJ1bm5pbmcgYSBzY3JpcHQsIGEgY29tbWFuZCwgb3IgdGhlIFJFUEwuCiAg
UGF0Y2ggYnkgVmljdG9yIFN0aW5uZXIuCgotIGdoLTE1MzMwMDogOmM6ZnVuYzpgUHlDb25maWdf
U2V0KClgIG5vdyBhbHNvIHNldCBnbG9iYWwgY29uZmlndXJhdGlvbgogIHZhcmlhYmxlcy4gRm9y
IGV4YW1wbGUsIGBgUHlDb25maWdfU2V0KCJpbnNwZWN0IiwgdmFsdWUpYGAgbm93IGFsc28gc2V0
cwogIDpjOnZhcjpgUHlfSW5zcGVjdEZsYWdgLiBQYXRjaCBieSBWaWN0b3IgU3Rpbm5lci4KCi0g
Z2gtMTIzNjE5OiA6YzpmdW5jOmBQeVVuc3RhYmxlX09iamVjdF9FbmFibGVEZWZlcnJlZFJlZmNv
dW50YCBub3cgcmV0dXJucwogIGBgMGBgIGlmIHRoZSBvYmplY3QgaXMgbm90IHRyYWNrZWQgYnkg
dGhlIGdhcmJhZ2UgY29sbGVjdG9yOiBpZgogIDpmdW5jOmBnYy5pc190cmFja2VkYCBpcyBmYWxz
ZS4gUGF0Y2ggYnkgVmljdG9yIFN0aW5uZXIuCgotIGdoLTk3OTY2OiBPbiA6Y2xhc3M6YG9zLnVu
YW1lX3Jlc3VsdGAsIHJlc3RvcmVkIGV4cGVjdGF0aW9uIHRoYXQKICBgYF9maWVsZHNgYCBhbmQg
YGBfYXNkaWN0YGAgd291bGQgaW5jbHVkZSBhbGwgc2l4IHByb3BlcnRpZXMgaW5jbHVkaW5nCiAg
YGBwcm9jZXNzb3JgYC4KLSBicG8tNDIxNjM6IFJlc3RvcmUgY29tcGF0aWJpbGl0eSBmb3IgOmNs
YXNzOmBvcy51bmFtZV9yZXN1bHRgIGFyb3VuZAogIGRlZXBjb3B5IGFuZCBfcmVwbGFjZS4K

--===============9104330730762520242==--

