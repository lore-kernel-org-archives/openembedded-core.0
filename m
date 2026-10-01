Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2492ECA5FD5
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 06:31:53 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5329.1790836303927935797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 23:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DOllqnfY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Q3GKOZGc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a0f6296539-d5cd290b-b68d-4632-a774-5263fa10249e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790836303;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nARoviPZlz85OjLrnVsb9hZSrFyV6zxcVFBXxorZic8=;
	b=DOllqnfYshLsF3afARB1uzXGlITvZspEntvWpQo1gfWPa55nqjGXTxQ31TvGiqVE
	InGkAx91IwIJGvKIKe7cBpCUBZ03JFsAxUUD+qp1WorUUBUuYTzOBYlL/uWbtqYqc0b
	bKPVpLGuFeIPTo+xyJgJK+RXV5ZuHnzJP3shklwI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790836303;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nARoviPZlz85OjLrnVsb9hZSrFyV6zxcVFBXxorZic8=;
	b=Q3GKOZGcJgomT/mTnu6arfyRSfoFR/RHD/uUvRYerghdkgTFARzExRhxvgEYpk40
	Fuyitu43Ns97BtxyoVKJ6K4Jz6+COu+OA/eW4+ugufUqd+c5dEAz87rqD2yVNucD4gQ
	1dW9+X10zKwK3l32Ugp/04yZxZaV/ExsqeXq6VJA=
Content-Type: multipart/mixed; boundary="===============5485900956335931169=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3: upgrading to 3.14.8 SUCCEEDED
Message-ID: <010101a0f6296539-d5cd290b-b68d-4632-a774-5263fa10249e-000000@us-west-2.amazonses.com>
Date: Thu, 1 Oct 2026 06:31:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 06:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247006

--===============5485900956335931169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3* to *3.14.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-upgrade-3.14.7-3.14.8.patch
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
From 77b83de4ac0e05ce4922f563b4d339cd1c5bdca4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Oct 2026 05:43:36 +0000
Subject: [PATCH] python3: upgrade 3.14.7 -> 3.14.8

What's New in Python 3.14.8 final?
==================================

*Release date: 2026-09-30*

Security
--------

- gh-158446: Fix a crash or incorrect output that could occur when
  formatting a :class:`float` or :class:`complex` with a precision close to
  the platform's ``INT_MAX``.  :c:func:`PyOS_double_to_string` now raises
  :exc:`ValueError` for any precision of that magnitude, regardless of
  presentation type or value, as the format string parsers already did for
  precisions above ``INT_MAX``.

- gh-156793: :mod:`asyncio`: :meth:`loop.start_tls()
  <asyncio.loop.start_tls>` and :meth:`loop.create_connection()
  <asyncio.loop.create_connection>` now validate the *server_hostname*
  argument if an :class:`ssl.SSLContext` is passed with *check_hostname* set
  to ``True``.

- gh-156793: :meth:`ssl.SSLContext.wrap_bio` now validates its
  *server_side*, *server_hostname* and *session* arguments similar to
  :meth:`ssl.SSLContext.wrap_socket`.

  In particular, a context with :attr:`~ssl.SSLContext.check_hostname`
  enabled and no *server_hostname* passed to :meth:`!wrap_bio` now raises
  :exc:`ValueError` instead of completing a handshake that verified the
  certificate chain without verifying the peer's identity, with no
  indication that the check had been skipped.

- gh-157953: Update bundled `libexpat <https://libexpat.github.io/>`_ to
  version 2.8.5.

- gh-156002: Bound the amount of data :mod:`zipfile` decompresses per read
  for members compressed with bzip2, LZMA, or Zstandard, matching the
  existing limit for deflate. A small archive member could previously expand
  into an unbounded allocation even when read in small chunks.

- gh-155999: Fix the :mod:`tarfile` ``tar`` and ``data`` extraction filters
  creating directories outside the destination for members whose name leaves
  the destination and returns to it, such as ``../evil/../dest/sub/file``.
  The containment check used the resolved path, but intermediate directories
  were created from the name as given.

- gh-156293: Fix a crash in :mod:`ssl` when an
  :attr:`~ssl.SSLContext.sni_callback` switches a connection to another
  :class:`~ssl.SSLContext` and the context that carries the callback is no
  longer referenced by the application. Servers that keep their
  ``sni_callback`` context alive (the usual case when it wraps the listening
  socket or is stored on the server object) were not affected. This
  addresses :cve:`2026-19445`.

- gh-155292: Change the :mod:`stringprep` module and :mod:`encodings.idna`
  codec to not consider Unicode codepoint attributes beyond those defined in
  :rfc:`3454`.

- gh-155694: Fix :cve:`2026-15806` by scoping
  :class:`~urllib.request.HTTPPasswordMgr` credentials to the URL scheme,
  preventing credentials stored for an HTTPS URL from being used for a
  matching HTTP URL, while URIs without a scheme continue to match any
  scheme.

Core and Builtins
-----------------

- gh-158364: Fix crash when :func:`sys._current_frames` or
  :func:`sys._current_exceptions` is called while another interpreter is
  running.

- gh-158254: Reverse iterators over a :class:`dict` and its views now raise
  :exc:`RuntimeError` if the dictionary's keys change during iteration, like
  forward iterators, instead of yielding entries for the new keys.

- gh-157838: Merge biased reference counts on behalf of threads that are
  detached instead of waiting for them to attach again, in the free-threaded
  build.

- gh-157378: Fix ``SyntaxError.offset`` and ``SyntaxError.end_offset`` for
  the "Non-UTF-8 code starting with ..." error when a non-ASCII character
  precedes the invalid byte on the same line. Patch by Shamil Abdulaev.

- gh-156762: Fix undefined behaviour in :class:`operator.methodcaller`: its
  :c:member:`~PyTypeObject.tp_clear` slot function returned ``void`` instead
  of ``int``, so the garbage collector called it through an incompatible
  function type. Patched by Shamil Abdulaev.

- gh-157377: Fix :func:`gc.get_count` on the free-threaded build resetting
  the thread-local allocation counter that schedules automatic garbage
  collection. A thread that called it while allocating could prevent cyclic
  garbage from ever being collected.

- gh-156091: Fix a crash when compiling deeply nested inlined list, set, or
  dict comprehensions. A :exc:`SyntaxError` is now raised when the nesting
  exceeds the compiler's static block limit.

- gh-156894: Fix the position of syntax errors which cover a range if the
  line contains non-ASCII characters before the error.

- gh-155525: Fix quadratic-time tokenization of modules containing many
  f-strings or t-strings.

- gh-156689: Fix an out-of-bounds read in :func:`compile` and
  :func:`ast.parse` when an AST object is passed with ``mode='func_type'``.

- gh-156371: Fix missing ``PyRefTracer_DESTROY`` events for trashcan
  deferred objects. Patch by Donghee Na.

- gh-156114: Fix a crash in the perf trampoline when a code object has a
  name or filename that cannot be encod

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...shebang-overflow-on-python-config.py.patch |  6 +--
 ...e-stdin-I-O-errors-same-way-as-maste.patch |  2 +-
 ...-use-prefix-value-from-build-configu.patch |  2 +-
 ...-qemu-wrapper-when-gathering-profile.patch |  6 +--
 ...est_sysconfig-for-posix_user-purelib.patch |  2 +-
 ...146207-Add-support-for-OpenSSL-4.0.0.patch | 42 +++++++++----------
 .../0001-prefer-valid-entrypoints.patch       |  2 +-
 ...g.py-use-platlibdir-also-for-purelib.patch |  2 +-
 ...le.py-correct-the-test-output-format.patch |  2 +-
 ...Update-_ssl._SSLSocket-for-OpenSSL-4.patch | 22 +++++-----
 ...utdown-test-in-test_ssl.test_got_eof.patch |  6 +--
 .../python/python3/makerace.patch             |  6 +--
 .../python/python3/valid-dists.patch          |  2 +-
 .../{python3_3.14.7.bb => python3_3.14.8.bb}  |  2 +-
 14 files changed, 52 insertions(+), 52 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.14.7.bb => python3_3.14.8.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 7a60538364..2e519df9e1 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -1,4 +1,4 @@
-From 3f2df0e1fce8c7425998dade00d084f1b101a982 Mon Sep 17 00:00:00 2001
+From f0a7ea3a22726c67c9432d0a2095cf1f2efb8d41 Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Tue, 7 Jun 2022 16:16:41 +0200
 Subject: [PATCH] Avoid shebang overflow on python-config.py
@@ -16,10 +16,10 @@ Upstream-Status: Denied [distribution]
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index e946018..345ed29 100644
+index b43baf1..18a46de 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2835,6 +2835,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2836,6 +2836,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index 532adfe69a..0e3c7d5f49 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
@@ -1,4 +1,4 @@
-From 9cd44429215352eb2753e0fd8e25fef24f714006 Mon Sep 17 00:00:00 2001
+From b68b37ca8a876b0123a291366b341eeacf1db71d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 16 Sep 2021 16:35:37 +0200
 Subject: [PATCH] Lib/pty.py: handle stdin I/O errors same way as master I/O
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 60391e726b..9cb25917d9 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From b5aad6a9b6c5add7a85861aed8aa030c1ad3d52f Mon Sep 17 00:00:00 2001
+From 7be6f1b478c2472822d17a40ca42ad1fc19fc6f4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 17 Nov 2023 14:26:32 +0100
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index c7f14cad1e..0b9d3d13d7 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -1,4 +1,4 @@
-From d6f77e3a934616d1f6c083b7144c50a32e08b70a Mon Sep 17 00:00:00 2001
+From 649b09c80b5954a54d2ed2ebf6c9bf61e98db225 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 Jan 2019 12:41:04 +0100
 Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile data
@@ -15,10 +15,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 526d500..a7e536d 100644
+index 7ca65dd..de72b03 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -861,8 +861,7 @@ profile-run-stamp:
+@@ -862,8 +862,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
index 5509b7475a..9691131d7a 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
@@ -1,4 +1,4 @@
-From c608cb4b3c8c31f1aa25ad1264ff58733fb99769 Mon Sep 17 00:00:00 2001
+From 43f53b757f220c592d5a77d228d087099a92ea7a Mon Sep 17 00:00:00 2001
 From: Wentao Zhang <wentao.zhang@windriver.com>
 Date: Mon, 20 Mar 2023 13:39:52 +0800
 Subject: [PATCH] Update test_sysconfig for posix_user purelib
diff --git a/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch b/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch
index bef6044358..ded212d822 100644
--- a/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch
+++ b/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch
@@ -1,7 +1,10 @@
-From 3364e7e62fa24d0e19133fb0f90b1c24ef1110c5 Mon Sep 17 00:00:00 2001
+From fb464673dbaecfb1afa6e54776b9e0eaff791e4b Mon Sep 17 00:00:00 2001
 From: Victor Stinner <vstinner@python.org>
 Date: Wed, 25 Mar 2026 07:44:47 +0100
 Subject: [PATCH] gh-146207: Add support for OpenSSL 4.0.0 alpha1 (#146217)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 OpenSSL 4.0.0 alpha1 removed these functions:
 
@@ -29,10 +32,10 @@ Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
  4 files changed, 58 insertions(+), 31 deletions(-)
 
 diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index dc795c6bd8a..61355927296 100644
+index d1486a4..f50888d 100644
 --- a/Lib/test/test_ssl.py
 +++ b/Lib/test/test_ssl.py
-@@ -395,7 +395,7 @@ def test_constants(self):
+@@ -424,7 +424,7 @@ class BasicSocketTests(unittest.TestCase):
          ssl.OP_NO_COMPRESSION
          self.assertEqual(ssl.HAS_SNI, True)
          self.assertEqual(ssl.HAS_ECDH, True)
@@ -41,7 +44,7 @@ index dc795c6bd8a..61355927296 100644
          self.assertEqual(ssl.HAS_TLSv1_3, True)
          ssl.OP_NO_SSLv2
          ssl.OP_NO_SSLv3
-@@ -586,11 +586,11 @@ def test_openssl_version(self):
+@@ -615,11 +615,11 @@ class BasicSocketTests(unittest.TestCase):
          # Some sanity checks follow
          # >= 1.1.1
          self.assertGreaterEqual(n, 0x10101000)
@@ -56,7 +59,7 @@ index dc795c6bd8a..61355927296 100644
          self.assertGreaterEqual(minor, 0)
          self.assertLess(minor, 256)
          self.assertGreaterEqual(fix, 0)
-@@ -656,12 +656,14 @@ def test_openssl111_deprecations(self):
+@@ -685,12 +685,14 @@ class BasicSocketTests(unittest.TestCase):
              ssl.OP_NO_TLSv1_2,
              ssl.OP_NO_TLSv1_3
          ]
@@ -77,7 +80,7 @@ index dc795c6bd8a..61355927296 100644
          versions = [
              ssl.TLSVersion.SSLv3,
              ssl.TLSVersion.TLSv1,
-@@ -1205,6 +1207,7 @@ def test_min_max_version(self):
+@@ -1184,6 +1186,7 @@ class ContextTests(unittest.TestCase):
                  ssl.TLSVersion.TLSv1,
                  ssl.TLSVersion.TLSv1_1,
                  ssl.TLSVersion.TLSv1_2,
@@ -85,7 +88,7 @@ index dc795c6bd8a..61355927296 100644
                  ssl.TLSVersion.SSLv3,
              }
          )
-@@ -1218,7 +1221,7 @@ def test_min_max_version(self):
+@@ -1197,7 +1200,7 @@ class ContextTests(unittest.TestCase):
          with self.assertRaises(ValueError):
              ctx.minimum_version = 42
  
@@ -94,7 +97,7 @@ index dc795c6bd8a..61355927296 100644
              ctx = ssl.SSLContext(ssl.PROTOCOL_TLSv1_1)
  
              self.assertIn(
-@@ -1675,23 +1678,24 @@ def test__create_stdlib_context(self):
+@@ -1749,23 +1752,24 @@ class ContextTests(unittest.TestCase):
          self.assertFalse(ctx.check_hostname)
          self._assert_context_options(ctx)
  
@@ -130,7 +133,7 @@ index dc795c6bd8a..61355927296 100644
  
          ctx = ssl._create_stdlib_context(purpose=ssl.Purpose.CLIENT_AUTH)
          self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLS_SERVER)
-@@ -3654,10 +3658,10 @@ def test_protocol_tlsv1_2(self):
+@@ -3863,10 +3867,10 @@ class ThreadedTests(unittest.TestCase):
                             client_options=ssl.OP_NO_TLSv1_2)
  
          try_protocol_combo(ssl.PROTOCOL_TLS, ssl.PROTOCOL_TLSv1_2, 'TLSv1.2')
@@ -144,10 +147,10 @@ index dc795c6bd8a..61355927296 100644
              try_protocol_combo(ssl.PROTOCOL_TLSv1_1, ssl.PROTOCOL_TLSv1_2, False)
  
 diff --git a/Modules/_ssl.c b/Modules/_ssl.c
-index b45295b4c0c..6f75af86113 100644
+index 90bcb6f..b99830e 100644
 --- a/Modules/_ssl.c
 +++ b/Modules/_ssl.c
-@@ -164,6 +164,17 @@ static void _PySSLFixErrno(void) {
+@@ -135,6 +135,17 @@ static void _PySSLFixErrno(void) {
  #error Unsupported OpenSSL version
  #endif
  
@@ -165,7 +168,7 @@ index b45295b4c0c..6f75af86113 100644
  /* OpenSSL API 1.1.0+ does not include version methods */
  #ifndef OPENSSL_NO_SSL3_METHOD
  extern const SSL_METHOD *SSLv3_method(void);
-@@ -1151,7 +1162,7 @@ _asn1obj2py(_sslmodulestate *state, const ASN1_OBJECT *name, int no_name)
+@@ -1134,7 +1145,7 @@ _asn1obj2py(_sslmodulestate *state, const ASN1_OBJECT *name, int no_name)
  
  static PyObject *
  _create_tuple_for_attribute(_sslmodulestate *state,
@@ -174,7 +177,7 @@ index b45295b4c0c..6f75af86113 100644
  {
      Py_ssize_t buflen;
      PyObject *pyattr;
-@@ -1180,16 +1191,16 @@ _create_tuple_for_attribute(_sslmodulestate *state,
+@@ -1163,16 +1174,16 @@ _create_tuple_for_attribute(_sslmodulestate *state,
  }
  
  static PyObject *
@@ -195,7 +198,7 @@ index b45295b4c0c..6f75af86113 100644
      int index_counter;
      int rdn_level = -1;
      int retcode;
-@@ -6967,9 +6978,15 @@ sslmodule_init_constants(PyObject *m)
+@@ -6529,9 +6540,15 @@ sslmodule_init_constants(PyObject *m)
      ADD_INT_CONST("PROTOCOL_TLS", PY_SSL_VERSION_TLS);
      ADD_INT_CONST("PROTOCOL_TLS_CLIENT", PY_SSL_VERSION_TLS_CLIENT);
      ADD_INT_CONST("PROTOCOL_TLS_SERVER", PY_SSL_VERSION_TLS_SERVER);
@@ -212,7 +215,7 @@ index b45295b4c0c..6f75af86113 100644
  #define ADD_OPTION(NAME, VALUE) if (sslmodule_add_option(m, NAME, (VALUE)) < 0) return -1
  
 diff --git a/Modules/_ssl/cert.c b/Modules/_ssl/cert.c
-index f2e7be89668..061b0fb3171 100644
+index f2e7be8..061b0fb 100644
 --- a/Modules/_ssl/cert.c
 +++ b/Modules/_ssl/cert.c
 @@ -128,7 +128,8 @@ _ssl_Certificate_get_info_impl(PySSLCertificate *self)
@@ -226,10 +229,10 @@ index f2e7be89668..061b0fb3171 100644
      PyObject *res;
      BIO *biobuf;
 diff --git a/Tools/ssl/multissltests.py b/Tools/ssl/multissltests.py
-index 3b4507c6771..48207e5330f 100755
+index 99e2a3f..70812bc 100755
 --- a/Tools/ssl/multissltests.py
 +++ b/Tools/ssl/multissltests.py
-@@ -429,9 +429,11 @@ def _post_install(self):
+@@ -422,9 +422,11 @@ class BuildOpenSSL(AbstractBuilder):
      def _post_install(self):
          if self.version.startswith("3."):
              self._post_install_3xx()
@@ -242,7 +245,7 @@ index 3b4507c6771..48207e5330f 100755
              config_args += ("enable-fips",)
          super()._build_src(config_args)
  
-@@ -447,6 +449,9 @@ def _post_install_3xx(self):
+@@ -440,6 +442,9 @@ class BuildOpenSSL(AbstractBuilder):
              lib64 = self.lib_dir + "64"
              os.symlink(lib64, self.lib_dir)
  
@@ -252,6 +255,3 @@ index 3b4507c6771..48207e5330f 100755
      @property
      def short_version(self):
          """Short version for OpenSSL download URL"""
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.patch b/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.patch
index ae3698fac4..169ab6b6a8 100644
--- a/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.patch
+++ b/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.patch
@@ -1,4 +1,4 @@
-From 8d7fcf04c6513841c7985e64b746b1ef5de0c426 Mon Sep 17 00:00:00 2001
+From b0fd65529c925d4f972088c5d87b85de69c4570f Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 17 Apr 2026 16:53:42 +0100
 Subject: [PATCH] prefer valid entrypoints
diff --git a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
index 7807827d9a..2a6a00911b 100644
--- a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
@@ -1,4 +1,4 @@
-From c10d1b295a9fb93836830cce441da3f22e5c7cd7 Mon Sep 17 00:00:00 2001
+From c7d69dd13f84777ea31d3c086052e2bcef709141 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 12 Sep 2021 21:44:36 +0200
 Subject: [PATCH] sysconfig.py: use platlibdir also for purelib
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index a60d082e2f..bb91787604 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -1,4 +1,4 @@
-From f0ac5b479b99bfb7f5e937a941b31a596f4caafc Mon Sep 17 00:00:00 2001
+From 7dcb9be72f60b3bc1a5bb15a3e3684137f6ed300 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 5 Aug 2019 15:57:39 +0800
 Subject: [PATCH] test_locale.py: correct the test output format
diff --git a/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch b/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
index 587f141dd4..b2ca168360 100644
--- a/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
+++ b/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
@@ -1,4 +1,4 @@
-From 3c2a3014af7d73cc34f2498f60fdf863d9bc7c6c Mon Sep 17 00:00:00 2001
+From 24629aaf608733c17ba3c0fd5202301078924af9 Mon Sep 17 00:00:00 2001
 From: Victor Stinner <vstinner@python.org>
 Date: Mon, 4 May 2026 13:52:57 +0200
 Subject: [PATCH] gh-148292: Update _ssl._SSLSocket for OpenSSL 4 (#149102)
@@ -25,10 +25,10 @@ Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
  create mode 100644 Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-148292.oIq3ml.rst
 
 diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index 965dbc36f096499..03d9e3f9e5e96b5 100644
+index f50888d..375f905 100644
 --- a/Lib/test/test_ssl.py
 +++ b/Lib/test/test_ssl.py
-@@ -2711,6 +2711,36 @@ def close(self):
+@@ -2994,6 +2994,36 @@ class ThreadedEchoServer(threading.Thread):
      def stop(self):
          self.active = False
  
@@ -65,7 +65,7 @@ index 965dbc36f096499..03d9e3f9e5e96b5 100644
  class AsyncoreEchoServer(threading.Thread):
  
      # this one's based on asyncore.dispatcher
-@@ -4747,6 +4777,58 @@ def background(sock):
+@@ -5035,6 +5065,58 @@ class ThreadedTests(unittest.TestCase):
                      if cm.exc_value is not None:
                          raise cm.exc_value
  
@@ -126,7 +126,7 @@ index 965dbc36f096499..03d9e3f9e5e96b5 100644
                       "Test needs TLS 1.3 PHA")
 diff --git a/Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-148292.oIq3ml.rst b/Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-148292.oIq3ml.rst
 new file mode 100644
-index 000000000000000..e1f308df5a678e6
+index 0000000..e1f308d
 --- /dev/null
 +++ b/Misc/NEWS.d/next/Library/2026-04-28-17-47-55.gh-issue-148292.oIq3ml.rst
 @@ -0,0 +1,7 @@
@@ -138,10 +138,10 @@ index 000000000000000..e1f308df5a678e6
 +Thanks to that, :class:`ssl.SSLSocket` behaves the same on all OpenSSL versions
 +on EOF.  Patch by Victor Stinner.
 diff --git a/Modules/_ssl.c b/Modules/_ssl.c
-index 1603d0ffd559559..376df32b7cb4bd6 100644
+index b99830e..c352de6 100644
 --- a/Modules/_ssl.c
 +++ b/Modules/_ssl.c
-@@ -352,6 +352,16 @@ typedef struct {
+@@ -351,6 +351,16 @@ typedef struct {
       * and shutdown methods check for chained exceptions.
       */
      PyObject *exc;
@@ -158,7 +158,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
  } PySSLSocket;
  
  #define PySSLSocket_CAST(op)    ((PySSLSocket *)(op))
-@@ -499,6 +509,10 @@ fill_and_set_sslerror(_sslmodulestate *state,
+@@ -498,6 +508,10 @@ fill_and_set_sslerror(_sslmodulestate *state,
      PyObject *init_value, *msg, *key;
      PyUnicodeWriter *writer = NULL;
  
@@ -169,7 +169,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
      if (errcode != 0) {
          int lib, reason;
  
-@@ -654,6 +668,18 @@ PySSL_ChainExceptions(PySSLSocket *sslsock) {
+@@ -653,6 +667,18 @@ PySSL_ChainExceptions(PySSLSocket *sslsock) {
      return -1;
  }
  
@@ -188,7 +188,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
  static PyObject *
  PySSL_SetError(PySSLSocket *sslsock, const char *filename, int lineno)
  {
-@@ -901,6 +927,7 @@ newPySSLSocket(PySSLContext *sslctx, PySocketSockObject *sock,
+@@ -900,6 +926,7 @@ newPySSLSocket(PySSLContext *sslctx, PySocketSockObject *sock,
      self->server_hostname = NULL;
      self->err = err;
      self->exc = NULL;
@@ -196,7 +196,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
  
      /* Make sure the SSL error state is initialized */
      ERR_clear_error();
-@@ -1041,6 +1068,11 @@ _ssl__SSLSocket_do_handshake_impl(PySSLSocket *self)
+@@ -1040,6 +1067,11 @@ _ssl__SSLSocket_do_handshake_impl(PySSLSocket *self)
          BIO_set_nbio(SSL_get_wbio(self->ssl), nonblocking);
      }
  
diff --git a/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch b/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
index af067f549c..eb95bec5d3 100644
--- a/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
+++ b/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
@@ -1,4 +1,4 @@
-From 81911909bc439d6de8ce6a173b0691b3c58e9e1a Mon Sep 17 00:00:00 2001
+From 6d037e6ae517ce3179225044a73f2a518ce73d6c Mon Sep 17 00:00:00 2001
 From: Victor Stinner <vstinner@python.org>
 Date: Mon, 4 May 2026 16:20:25 +0200
 Subject: [PATCH] gh-148292: Remove shutdown() test in test_ssl.test_got_eof()
@@ -21,10 +21,10 @@ Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
  1 file changed, 8 deletions(-)
 
 diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index 03d9e3f9e5e96b5..6445f122b4272be 100644
+index 375f905..efdd293 100644
 --- a/Lib/test/test_ssl.py
 +++ b/Lib/test/test_ssl.py
-@@ -4820,14 +4820,6 @@ def test_got_eof(self):
+@@ -5108,14 +5108,6 @@ class ThreadedTests(unittest.TestCase):
                  sslsock.do_handshake()
  
              self.assertEqual(sslsock.pending(), 0)
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index 248a521118..5984fb322a 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From b41557f570ff4451c477669d6ca5bfacabe21c66 Mon Sep 17 00:00:00 2001
+From 4a290494e1b83662c526ac371db139f721916385 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
@@ -17,10 +17,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index a7e536d..e946018 100644
+index de72b03..b43baf1 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2741,7 +2741,7 @@ COMPILEALL_OPTS=-j0
+@@ -2742,7 +2742,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3/valid-dists.patch b/meta/recipes-devtools/python/python3/valid-dists.patch
index 7fe18254e5..64b92ab60b 100644
--- a/meta/recipes-devtools/python/python3/valid-dists.patch
+++ b/meta/recipes-devtools/python/python3/valid-dists.patch
@@ -1,4 +1,4 @@
-From 66874ce1a9f21b4b00dc85919734d58e6243ca29 Mon Sep 17 00:00:00 2001
+From 874d907f7ab58b3c240671a1abed35ead6c30152 Mon Sep 17 00:00:00 2001
 From: "Jason R. Coombs" <jaraco@jaraco.com>
 Date: Tue, 23 Jul 2024 08:36:16 -0400
 Subject: [PATCH] Prioritize valid dists to invalid dists when retrieving by
diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-devtools/python/python3_3.14.8.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.14.7.bb
rename to meta/recipes-devtools/python/python3_3.14.8.bb
index f917edebd8..4663ee85cd 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.8.bb
@@ -30,7 +30,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81"
+SRC_URI[sha256sum] = "c2215904f02b175596dc49351585104f4bc20341e1c47378b26a2c274360ce73"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.47.1


--===============5485900956335931169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="python3-changelog.txt"

V2hhdCdzIE5ldyBpbiBQeXRob24gMy4xNC44IGZpbmFsPwo9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09CgoqUmVsZWFzZSBkYXRlOiAyMDI2LTA5LTMwKgoKU2VjdXJpdHkKLS0tLS0t
LS0KCi0gZ2gtMTU4NDQ2OiBGaXggYSBjcmFzaCBvciBpbmNvcnJlY3Qgb3V0cHV0IHRoYXQgY291
bGQgb2NjdXIgd2hlbgogIGZvcm1hdHRpbmcgYSA6Y2xhc3M6YGZsb2F0YCBvciA6Y2xhc3M6YGNv
bXBsZXhgIHdpdGggYSBwcmVjaXNpb24gY2xvc2UgdG8KICB0aGUgcGxhdGZvcm0ncyBgYElOVF9N
QVhgYC4gIDpjOmZ1bmM6YFB5T1NfZG91YmxlX3RvX3N0cmluZ2Agbm93IHJhaXNlcwogIDpleGM6
YFZhbHVlRXJyb3JgIGZvciBhbnkgcHJlY2lzaW9uIG9mIHRoYXQgbWFnbml0dWRlLCByZWdhcmRs
ZXNzIG9mCiAgcHJlc2VudGF0aW9uIHR5cGUgb3IgdmFsdWUsIGFzIHRoZSBmb3JtYXQgc3RyaW5n
IHBhcnNlcnMgYWxyZWFkeSBkaWQgZm9yCiAgcHJlY2lzaW9ucyBhYm92ZSBgYElOVF9NQVhgYC4K
Ci0gZ2gtMTU2NzkzOiA6bW9kOmBhc3luY2lvYDogOm1ldGg6YGxvb3Auc3RhcnRfdGxzKCkKICA8
YXN5bmNpby5sb29wLnN0YXJ0X3Rscz5gIGFuZCA6bWV0aDpgbG9vcC5jcmVhdGVfY29ubmVjdGlv
bigpCiAgPGFzeW5jaW8ubG9vcC5jcmVhdGVfY29ubmVjdGlvbj5gIG5vdyB2YWxpZGF0ZSB0aGUg
KnNlcnZlcl9ob3N0bmFtZSoKICBhcmd1bWVudCBpZiBhbiA6Y2xhc3M6YHNzbC5TU0xDb250ZXh0
YCBpcyBwYXNzZWQgd2l0aCAqY2hlY2tfaG9zdG5hbWUqIHNldAogIHRvIGBgVHJ1ZWBgLgoKLSBn
aC0xNTY3OTM6IDptZXRoOmBzc2wuU1NMQ29udGV4dC53cmFwX2Jpb2Agbm93IHZhbGlkYXRlcyBp
dHMKICAqc2VydmVyX3NpZGUqLCAqc2VydmVyX2hvc3RuYW1lKiBhbmQgKnNlc3Npb24qIGFyZ3Vt
ZW50cyBzaW1pbGFyIHRvCiAgOm1ldGg6YHNzbC5TU0xDb250ZXh0LndyYXBfc29ja2V0YC4KCiAg
SW4gcGFydGljdWxhciwgYSBjb250ZXh0IHdpdGggOmF0dHI6YH5zc2wuU1NMQ29udGV4dC5jaGVj
a19ob3N0bmFtZWAKICBlbmFibGVkIGFuZCBubyAqc2VydmVyX2hvc3RuYW1lKiBwYXNzZWQgdG8g
Om1ldGg6YCF3cmFwX2Jpb2Agbm93IHJhaXNlcwogIDpleGM6YFZhbHVlRXJyb3JgIGluc3RlYWQg
b2YgY29tcGxldGluZyBhIGhhbmRzaGFrZSB0aGF0IHZlcmlmaWVkIHRoZQogIGNlcnRpZmljYXRl
IGNoYWluIHdpdGhvdXQgdmVyaWZ5aW5nIHRoZSBwZWVyJ3MgaWRlbnRpdHksIHdpdGggbm8KICBp
bmRpY2F0aW9uIHRoYXQgdGhlIGNoZWNrIGhhZCBiZWVuIHNraXBwZWQuCgotIGdoLTE1Nzk1Mzog
VXBkYXRlIGJ1bmRsZWQgYGxpYmV4cGF0IDxodHRwczovL2xpYmV4cGF0LmdpdGh1Yi5pby8+YF8g
dG8KICB2ZXJzaW9uIDIuOC41LgoKLSBnaC0xNTYwMDI6IEJvdW5kIHRoZSBhbW91bnQgb2YgZGF0
YSA6bW9kOmB6aXBmaWxlYCBkZWNvbXByZXNzZXMgcGVyIHJlYWQKICBmb3IgbWVtYmVycyBjb21w
cmVzc2VkIHdpdGggYnppcDIsIExaTUEsIG9yIFpzdGFuZGFyZCwgbWF0Y2hpbmcgdGhlCiAgZXhp
c3RpbmcgbGltaXQgZm9yIGRlZmxhdGUuIEEgc21hbGwgYXJjaGl2ZSBtZW1iZXIgY291bGQgcHJl
dmlvdXNseSBleHBhbmQKICBpbnRvIGFuIHVuYm91bmRlZCBhbGxvY2F0aW9uIGV2ZW4gd2hlbiBy
ZWFkIGluIHNtYWxsIGNodW5rcy4KCi0gZ2gtMTU1OTk5OiBGaXggdGhlIDptb2Q6YHRhcmZpbGVg
IGBgdGFyYGAgYW5kIGBgZGF0YWBgIGV4dHJhY3Rpb24gZmlsdGVycwogIGNyZWF0aW5nIGRpcmVj
dG9yaWVzIG91dHNpZGUgdGhlIGRlc3RpbmF0aW9uIGZvciBtZW1iZXJzIHdob3NlIG5hbWUgbGVh
dmVzCiAgdGhlIGRlc3RpbmF0aW9uIGFuZCByZXR1cm5zIHRvIGl0LCBzdWNoIGFzIGBgLi4vZXZp
bC8uLi9kZXN0L3N1Yi9maWxlYGAuCiAgVGhlIGNvbnRhaW5tZW50IGNoZWNrIHVzZWQgdGhlIHJl
c29sdmVkIHBhdGgsIGJ1dCBpbnRlcm1lZGlhdGUgZGlyZWN0b3JpZXMKICB3ZXJlIGNyZWF0ZWQg
ZnJvbSB0aGUgbmFtZSBhcyBnaXZlbi4KCi0gZ2gtMTU2MjkzOiBGaXggYSBjcmFzaCBpbiA6bW9k
OmBzc2xgIHdoZW4gYW4KICA6YXR0cjpgfnNzbC5TU0xDb250ZXh0LnNuaV9jYWxsYmFja2Agc3dp
dGNoZXMgYSBjb25uZWN0aW9uIHRvIGFub3RoZXIKICA6Y2xhc3M6YH5zc2wuU1NMQ29udGV4dGAg
YW5kIHRoZSBjb250ZXh0IHRoYXQgY2FycmllcyB0aGUgY2FsbGJhY2sgaXMgbm8KICBsb25nZXIg
cmVmZXJlbmNlZCBieSB0aGUgYXBwbGljYXRpb24uIFNlcnZlcnMgdGhhdCBrZWVwIHRoZWlyCiAg
YGBzbmlfY2FsbGJhY2tgYCBjb250ZXh0IGFsaXZlICh0aGUgdXN1YWwgY2FzZSB3aGVuIGl0IHdy
YXBzIHRoZSBsaXN0ZW5pbmcKICBzb2NrZXQgb3IgaXMgc3RvcmVkIG9uIHRoZSBzZXJ2ZXIgb2Jq
ZWN0KSB3ZXJlIG5vdCBhZmZlY3RlZC4gVGhpcwogIGFkZHJlc3NlcyA6Y3ZlOmAyMDI2LTE5NDQ1
YC4KCi0gZ2gtMTU1MjkyOiBDaGFuZ2UgdGhlIDptb2Q6YHN0cmluZ3ByZXBgIG1vZHVsZSBhbmQg
Om1vZDpgZW5jb2RpbmdzLmlkbmFgCiAgY29kZWMgdG8gbm90IGNvbnNpZGVyIFVuaWNvZGUgY29k
ZXBvaW50IGF0dHJpYnV0ZXMgYmV5b25kIHRob3NlIGRlZmluZWQgaW4KICA6cmZjOmAzNDU0YC4K
Ci0gZ2gtMTU1Njk0OiBGaXggOmN2ZTpgMjAyNi0xNTgwNmAgYnkgc2NvcGluZwogIDpjbGFzczpg
fnVybGxpYi5yZXF1ZXN0LkhUVFBQYXNzd29yZE1ncmAgY3JlZGVudGlhbHMgdG8gdGhlIFVSTCBz
Y2hlbWUsCiAgcHJldmVudGluZyBjcmVkZW50aWFscyBzdG9yZWQgZm9yIGFuIEhUVFBTIFVSTCBm
cm9tIGJlaW5nIHVzZWQgZm9yIGEKICBtYXRjaGluZyBIVFRQIFVSTCwgd2hpbGUgVVJJcyB3aXRo
b3V0IGEgc2NoZW1lIGNvbnRpbnVlIHRvIG1hdGNoIGFueQogIHNjaGVtZS4KCkNvcmUgYW5kIEJ1
aWx0aW5zCi0tLS0tLS0tLS0tLS0tLS0tCgotIGdoLTE1ODM2NDogRml4IGNyYXNoIHdoZW4gOmZ1
bmM6YHN5cy5fY3VycmVudF9mcmFtZXNgIG9yCiAgOmZ1bmM6YHN5cy5fY3VycmVudF9leGNlcHRp
b25zYCBpcyBjYWxsZWQgd2hpbGUgYW5vdGhlciBpbnRlcnByZXRlciBpcwogIHJ1bm5pbmcuCgot
IGdoLTE1ODI1NDogUmV2ZXJzZSBpdGVyYXRvcnMgb3ZlciBhIDpjbGFzczpgZGljdGAgYW5kIGl0
cyB2aWV3cyBub3cgcmFpc2UKICA6ZXhjOmBSdW50aW1lRXJyb3JgIGlmIHRoZSBkaWN0aW9uYXJ5
J3Mga2V5cyBjaGFuZ2UgZHVyaW5nIGl0ZXJhdGlvbiwgbGlrZQogIGZvcndhcmQgaXRlcmF0b3Jz
LCBpbnN0ZWFkIG9mIHlpZWxkaW5nIGVudHJpZXMgZm9yIHRoZSBuZXcga2V5cy4KCi0gZ2gtMTU3
ODM4OiBNZXJnZSBiaWFzZWQgcmVmZXJlbmNlIGNvdW50cyBvbiBiZWhhbGYgb2YgdGhyZWFkcyB0
aGF0IGFyZQogIGRldGFjaGVkIGluc3RlYWQgb2Ygd2FpdGluZyBmb3IgdGhlbSB0byBhdHRhY2gg
YWdhaW4sIGluIHRoZSBmcmVlLXRocmVhZGVkCiAgYnVpbGQuCgotIGdoLTE1NzM3ODogRml4IGBg
U3ludGF4RXJyb3Iub2Zmc2V0YGAgYW5kIGBgU3ludGF4RXJyb3IuZW5kX29mZnNldGBgIGZvcgog
IHRoZSAiTm9uLVVURi04IGNvZGUgc3RhcnRpbmcgd2l0aCAuLi4iIGVycm9yIHdoZW4gYSBub24t
QVNDSUkgY2hhcmFjdGVyCiAgcHJlY2VkZXMgdGhlIGludmFsaWQgYnl0ZSBvbiB0aGUgc2FtZSBs
aW5lLiBQYXRjaCBieSBTaGFtaWwgQWJkdWxhZXYuCgotIGdoLTE1Njc2MjogRml4IHVuZGVmaW5l
ZCBiZWhhdmlvdXIgaW4gOmNsYXNzOmBvcGVyYXRvci5tZXRob2RjYWxsZXJgOiBpdHMKICA6Yzpt
ZW1iZXI6YH5QeVR5cGVPYmplY3QudHBfY2xlYXJgIHNsb3QgZnVuY3Rpb24gcmV0dXJuZWQgYGB2
b2lkYGAgaW5zdGVhZAogIG9mIGBgaW50YGAsIHNvIHRoZSBnYXJiYWdlIGNvbGxlY3RvciBjYWxs
ZWQgaXQgdGhyb3VnaCBhbiBpbmNvbXBhdGlibGUKICBmdW5jdGlvbiB0eXBlLiBQYXRjaGVkIGJ5
IFNoYW1pbCBBYmR1bGFldi4KCi0gZ2gtMTU3Mzc3OiBGaXggOmZ1bmM6YGdjLmdldF9jb3VudGAg
b24gdGhlIGZyZWUtdGhyZWFkZWQgYnVpbGQgcmVzZXR0aW5nCiAgdGhlIHRocmVhZC1sb2NhbCBh
bGxvY2F0aW9uIGNvdW50ZXIgdGhhdCBzY2hlZHVsZXMgYXV0b21hdGljIGdhcmJhZ2UKICBjb2xs
ZWN0aW9uLiBBIHRocmVhZCB0aGF0IGNhbGxlZCBpdCB3aGlsZSBhbGxvY2F0aW5nIGNvdWxkIHBy
ZXZlbnQgY3ljbGljCiAgZ2FyYmFnZSBmcm9tIGV2ZXIgYmVpbmcgY29sbGVjdGVkLgoKLSBnaC0x
NTYwOTE6IEZpeCBhIGNyYXNoIHdoZW4gY29tcGlsaW5nIGRlZXBseSBuZXN0ZWQgaW5saW5lZCBs
aXN0LCBzZXQsIG9yCiAgZGljdCBjb21wcmVoZW5zaW9ucy4gQSA6ZXhjOmBTeW50YXhFcnJvcmAg
aXMgbm93IHJhaXNlZCB3aGVuIHRoZSBuZXN0aW5nCiAgZXhjZWVkcyB0aGUgY29tcGlsZXIncyBz
dGF0aWMgYmxvY2sgbGltaXQuCgotIGdoLTE1Njg5NDogRml4IHRoZSBwb3NpdGlvbiBvZiBzeW50
YXggZXJyb3JzIHdoaWNoIGNvdmVyIGEgcmFuZ2UgaWYgdGhlCiAgbGluZSBjb250YWlucyBub24t
QVNDSUkgY2hhcmFjdGVycyBiZWZvcmUgdGhlIGVycm9yLgoKLSBnaC0xNTU1MjU6IEZpeCBxdWFk
cmF0aWMtdGltZSB0b2tlbml6YXRpb24gb2YgbW9kdWxlcyBjb250YWluaW5nIG1hbnkKICBmLXN0
cmluZ3Mgb3IgdC1zdHJpbmdzLgoKLSBnaC0xNTY2ODk6IEZpeCBhbiBvdXQtb2YtYm91bmRzIHJl
YWQgaW4gOmZ1bmM6YGNvbXBpbGVgIGFuZAogIDpmdW5jOmBhc3QucGFyc2VgIHdoZW4gYW4gQVNU
IG9iamVjdCBpcyBwYXNzZWQgd2l0aCBgYG1vZGU9J2Z1bmNfdHlwZSdgYC4KCi0gZ2gtMTU2Mzcx
OiBGaXggbWlzc2luZyBgYFB5UmVmVHJhY2VyX0RFU1RST1lgYCBldmVudHMgZm9yIHRyYXNoY2Fu
CiAgZGVmZXJyZWQgb2JqZWN0cy4gUGF0Y2ggYnkgRG9uZ2hlZSBOYS4KCi0gZ2gtMTU2MTE0OiBG
aXggYSBjcmFzaCBpbiB0aGUgcGVyZiB0cmFtcG9saW5lIHdoZW4gYSBjb2RlIG9iamVjdCBoYXMg
YQogIG5hbWUgb3IgZmlsZW5hbWUgdGhhdCBjYW5ub3QgYmUgZW5jb2RlZCB0byBVVEYtOC4gUGF0
Y2hlZCBieSBTaGFtaWwKICBBYmR1bGFldi4KCi0gZ2gtMTU2MTI2OiBGaXggYSBjcmFzaCB3aGVu
IGltcG9ydGluZyBhIG1vZHVsZSB3aG9zZSBuYW1lIGNvbnRhaW5zCiAgY2hhcmFjdGVycyB0aGF0
IGNhbm5vdCBiZSBlbmNvZGVkIHRvIFVURi04IChzdWNoIGFzIGxvbmUgc3Vycm9nYXRlcykgd2hp
bGUKICA6b3B0aW9uOmAtWCBpbXBvcnR0aW1lIDwtWD5gIGlzIGVuYWJsZWQuCgotIGdoLTE1NTc1
MjogRml4IGEgY3Jhc2ggd2hlbiBhIDpjbGFzczpgdHlwZXMuR2VuZXJpY0FsaWFzYCBhcmd1bWVu
dCBnYWlucyBhCiAgYGBfX3R5cGluZ19zdWJzdF9fYGAgaG9vayBhZnRlciB0aGUgYWxpYXMgcGFy
YW1ldGVycyBoYXZlIGJlZW4gY2FjaGVkLgoKLSBnaC0xNTU1MDQ6IEZpeCBhIGNyYXNoIHdoZW4g
dGhyZWFkIHN0YXRlIGNyZWF0aW9uIGZhaWxzIGJlZm9yZSB0aGUgdGhyZWFkCiAgc3RhdGUgaXMg
ZnVsbHkgaW5pdGlhbGl6ZWQuCgotIGdoLTE1NTUyNjogRml4IHNwdXJpb3VzIDpleGM6YE92ZXJm
bG93RXJyb3JgIGZvciBgYGFicyhuYW5qKWBgIGluIGNhc2UKICA6YzpkYXRhOmBlcnJub2Agd2Fz
IHByZXZpb3VzbHkgc2V0IHRvIDpjOm1hY3JvOmAhRVJBTkdFYCBieSBzb21lIGxpYnJhcnkKICBj
YWxsLiBQYXRjaCBieSBTZXJnZXkgQiBLaXJwaWNoZXYuCgotIGdoLTEyOTc1MjogRG9uJ3QgdXBk
YXRlIGFkYXB0aXZlIGNvdW50ZXJzIGluIHRoZSBmcmVlLXRocmVhZGVkIGJ1aWxkIHdoZW4KICB0
aHJlYWQtbG9jYWwgYnl0ZWNvZGUgaXMgZGlzYWJsZWQgKGBgLVggdGxiYz0wYGApLiBQYXRjaCBi
eSBEb25naGVlIE5hLgoKLSBnaC0xNTU1MTU6IFRyYWNrIHRoZSBpbnRlcm5hbCBIQU1UIGl0ZXJh
dG9ycywgd2hpY2ggYmFjayBpdGVyYXRpb24gb3ZlciBhCiAgOmNsYXNzOmBjb250ZXh0dmFycy5D
b250ZXh0YCwgd2l0aCB0aGUgZ2FyYmFnZSBjb2xsZWN0b3IuICBBIHJlZmVyZW5jZQogIGN5Y2xl
IHJ1bm5pbmcgdGhyb3VnaCBzdWNoIGFuIGl0ZXJhdG9yIHdhcyBuZXZlciBjb2xsZWN0ZWQsIGxl
YWtpbmcgdGhlCiAgd2hvbGUgY29udGV4dCBpdCBpdGVyYXRlZCBvdmVyLgoKLSBnaC0xNTQ5Mzc6
IEZpeCBhIGRhdGEgcmFjZSBvbiB0aHJlYWQgaGFuZGxlIGlkZW50aWZpZXJzIHdoZW4KICBgYF90
aHJlYWQuX3NodXRkb3duKClgYCBydW5zIGNvbmN1cnJlbnRseSB3aXRoIHRoZSBzdGFydHVwIG9m
IG5vbi1kYWVtb24KICB0aHJlYWRzIGluIHRoZSA6dGVybTpgZnJlZS10aHJlYWRlZCBidWlsZGAu
CgotIGdoLTE1NDkwMjogRml4IGEgY3Jhc2ggd2hlbiBgYF9fY29uZGl0aW9uYWxfYW5ub3RhdGlv
bnNfX2BgIGlzIHJlYm91bmQgdG8KICBhIG5vbi1zZXQgb2JqZWN0LgoKLSBnaC0xNTE0NjQ6IEV4
Y2x1ZGUgaW52YWxpZCB0b2tlbiBgYDw+YGAgZnJvbSA6bW9kOmB0b2tlbml6ZWAgb3V0cHV0Lgog
IDpleGM6YFN5bnRheEVycm9yYCBmb3IgYGA8PmBgIG5vdyBzdWdnZXN0cyBgYCE9YGAuCgotIGdo
LTE1NDcxOTogVHJhaWxpbmcgd2hpdGVzcGFjZSBpbiBhIHQtc3RyaW5nIGludGVycG9sYXRpb24g
ZXhwcmVzc2lvbiBpcwogIG5vdyBwcmVzZXJ2ZWQgaW4gOmF0dHI6YHN0cmluZy50ZW1wbGF0ZWxp
Yi5JbnRlcnBvbGF0aW9uLmV4cHJlc3Npb25gLCB1cAogIHRvIHRoZSBjbG9zaW5nIGBgfWBgIG9y
IHRoZSBjb252ZXJzaW9uIChgYCFgYCksIGZvcm1hdCAoYGA6YGApLCBvciBkZWJ1ZwogIChgYD1g
YCkgZGVsaW1pdGVyLiBFeHBsaWNpdCBsaW5lIGNvbnRpbnVhdGlvbnMgZm9sbG93aW5nIGEgZGVi
dWcgYGA9YGAKICByZW1haW4gcGFydCBvZiB0aGUgZGVidWcgdGV4dCBhbmQgYXJlIGV4Y2x1ZGVk
IGZyb20KICA6YXR0cjpgfnN0cmluZy50ZW1wbGF0ZWxpYi5JbnRlcnBvbGF0aW9uLmV4cHJlc3Np
b25gLiBFc2NhcGVkIHF1b3RlcyBhcmUKICBub3cgcHJlc2VydmVkIHdoaWxlIHJlY29uc3RydWN0
aW5nIHQtc3RyaW5nIGludGVycG9sYXRpb24gbWV0YWRhdGEgYW5kCiAgZi1zdHJpbmcgZGVidWcg
dGV4dCBjb250YWluaW5nIGNvbW1lbnRzLgoKLSBnaC0xNTM1Nzg6IEZpeCBhbiBvdXQtb2YtYm91
bmRzIHdyaXRlIGluIDptZXRoOmBieXRlYXJyYXkuZXh0ZW5kYCB3aGVuIHRoZQogIGJ5dGVhcnJh
eSBpcyByZXNpemVkIHdoaWxlIHRoZSBhcmd1bWVudCdzIDptZXRoOmB+b2JqZWN0Ll9fYnVmZmVy
X19gIGlzCiAgYmVpbmcgYWNxdWlyZWQsIGZvciBleGFtcGxlIGJ5IGFub3RoZXIgdGhyZWFkLiBQ
YXRjaCBieSB0b25naHVhcm9vdC4KCi0gZ2gtMTQ4ODE3OiBGb2xkIGxhcmdlIGNvbnN0YW50IGxp
c3QgYW5kIHNldCBsaXRlcmFscyB1c2VkIGFzIHRoZSBpdGVyYWJsZQogIG9mIGEgOmtleXdvcmQ6
YGZvcmAgbG9vcCBvciBgYGluYGAvYGBub3QgaW5gYCB0ZXN0IGludG8gYSBjb25zdGFudAogIDpj
bGFzczpgdHVwbGVgIG9yIDpjbGFzczpgZnJvemVuc2V0YCwgcmVzdG9yaW5nIGFuIG9wdGltaXph
dGlvbiBwcmV2aW91c2x5CiAgZG9uZSBieSB0aGUgQVNUIG9wdGltaXplciB0aGF0IHdhcyBsb3N0
IHdoZW4gY29uc3RhbnQgZm9sZGluZyBtb3ZlZCB0byB0aGUKICBDRkcuCgotIGdoLTE0NjA5Njog
Rml4ZWQgc2VnbWVudGF0aW9uIGZhdWx0IHdoZW4gY2FsbGVkIHJlcHIgZm9yCiAgQmFzZUV4Y2Vw
dGlvbkdyb3VwIHdpdGggZW1wdHkgb3IgMS1zaXplIHR1cGxlIGFyZ3MuCgotIGdoLTg1MjYwOiA6
ZnVuYzpgY29tcGlsZWAgbm93IHJhaXNlcyA6ZXhjOmBWYWx1ZUVycm9yYCBpbnN0ZWFkIG9mIGNy
YXNoaW5nCiAgb24gYSBkZWJ1ZyBidWlsZCBpZiBhbiBpZGVudGlmaWVyIGZpZWxkIG9mIGFuIEFT
VCBub2RlIChzdWNoIGFzIHRoZSBuYW1lCiAgb2YgYSBmdW5jdGlvbiwgYSBjbGFzcywgYW4gaW1w
b3J0ZWQgbW9kdWxlIG9yIGEgY2F1Z2h0IGV4Y2VwdGlvbikgaXMKICBgYCJOb25lImBgLCBgYCJU
cnVlImBgIG9yIGBgIkZhbHNlImBgLgoKTGlicmFyeQotLS0tLS0tCgotIGdoLTE1ODE2OTogRml4
IDphdHRyOmB6bGliLkRlY29tcHJlc3MudW5jb25zdW1lZF90YWlsYCBkdXBsaWNhdGluZwogIDph
dHRyOmB+emxpYi5EZWNvbXByZXNzLnVudXNlZF9kYXRhYCBhZnRlciBlbmQgb2Ygc3RyZWFtIHdo
ZW4gKm1heF9sZW5ndGgqCiAgd2FzIHVzZWQuCgotIGdoLTE1Nzc4ODogRml4IGBgcHl0aG9uIC1t
IGFzeW5jaW8gcHNgYCBmYWlsaW5nIG9uIGEgcHJvY2VzcyB0aGF0IGhhcyBhCiAgdGFzayB3aXRo
IGEgbmFtZSBsb25nZXIgdGhhbiAyNTUgY2hhcmFjdGVycy4KCi0gZ2gtMTU3NjYwOiBGaXggYGBf
cmVtb3RlX2RlYnVnZ2luZ2BgIHJlcG9ydGluZyBlcnJvcnMgb3IgaW5jb3JyZWN0IGxpbmUKICBu
dW1iZXJzIGluIGZyZWUtdGhyZWFkZWQgYnVpbGRzIHdoZW4gYSB0aHJlYWQtbG9jYWwgYnl0ZWNv
ZGUgYXJyYXkgZ3Jvd3MKICBvciBnYWlucyBlbnRyaWVzIGFmdGVyIGJlaW5nIGNhY2hlZC4KCi0g
Z2gtMTU3NjcyOiBGaXggOm1vZDpgdGtpbnRlcmAgb24gbWFjT1M6IGNyZWF0aW5nIGEgOmNsYXNz
OmB+dGtpbnRlci5Ua2AKICBpbnN0YW5jZSBubyBsb25nZXIgcmVwbGFjZXMgdGhlIFB5dGhvbiBo
YW5kbGVycyBvZiBTSUdJTlQsIFNJR0hVUCBhbmQKICBTSUdURVJNIHdpdGggVGsncyBoYW5kbGVy
IHdoaWNoIGV4aXRzIHRoZSBwcm9jZXNzLCBzbyBDdHJsLUMgcmFpc2VzCiAgOmV4YzpgS2V5Ym9h
cmRJbnRlcnJ1cHRgIGFnYWluLgoKLSBnaC0xNTc2Mzk6IEZpeCBhIGNyYXNoIGluIDptb2Q6YCFj
UHJvZmlsZWAgd2hlbiBhbiBleHRlcm5hbCB0aW1lcgogIHJlLWVudGVycyB0aGUgcHJvZmlsZXIu
IFByb2ZpbGluZyBldmVudHMgcmFpc2VkIHdoaWxlIHRoZSBleHRlcm5hbCB0aW1lcgogIHJ1bnMg
YXJlIG5vdyBpZ25vcmVkLgoKLSBnaC02OTkxOTogOm1ldGg6YGNvZGUuSW50ZXJhY3RpdmVJbnRl
cnByZXRlci5ydW5zb3VyY2VgIGFuZCB0aGUgUkVQTCBub3cKICByZXBvcnQgYW55IGV4Y2VwdGlv
biByYWlzZWQgYnkgY29tcGlsaW5nIHRoZSBzb3VyY2UsIHN1Y2ggYXMKICA6ZXhjOmBNZW1vcnlF
cnJvcmAgb3IgOmV4YzpgUmVjdXJzaW9uRXJyb3JgIGZvciB0b28gZGVlcGx5IG5lc3RlZCBzb3Vy
Y2UsCiAgaW5zdGVhZCBvZiBwcm9wYWdhdGluZyBpdCBvciBwcmludGluZyBhIHRyYWNlYmFjayBv
ZiB0aGUgUkVQTCBpbnRlcm5hbHMuCgotIGdoLTE1NzQ1MTogRml4IDptb2Q6YGdldHRleHRgIHBs
dXJhbCBmb3JtIHNlbGVjdGlvbiB3aGVuIHRoZQogIGBgUGx1cmFsLUZvcm1zYGAgZXhwcmVzc2lv
biBjb21iaW5lcyB0aGUgdW5hcnkgYGAhYGAgb3BlcmF0b3Igd2l0aCBhCiAgYmluYXJ5IG9wZXJh
dG9yLCBmb3IgZXhhbXBsZSBgYCFuICsgMWBgIG9yIGBgMiAqICFuYGAuICBUaGUgbGF0dGVyIHJh
aXNlZAogIDpleGM6YFN5bnRheEVycm9yYC4KCi0gZ2gtMTU3MzM1OiBGaXggb3V0LW9mLWJvdW5k
cyB3cml0ZSBpbiBgYG1tYXAubW1hcC5fX3NldGl0ZW1fX2BgIHRoYXQgY291bGQKICBvY2N1ciB3
aGVuIGNvbnZlcnRpbmcgdGhlIGluZGV4IG9yIHRoZSBhc3NpZ25lZCB2YWx1ZSAodmlhCiAgOm1l
dGg6YH5vYmplY3QuX19pbmRleF9fYCBmb3IgYSBzaW5nbGUgaXRlbSwgb3IgdmlhIHRoZSBidWZm
ZXIgcHJvdG9jb2wKICBmb3IgYSBzbGljZSkgcmVzaXplZCBvciBjbG9zZWQgdGhlIG1tYXAgb2Jq
ZWN0IGR1cmluZyB0aGUgYXNzaWdubWVudC4KCi0gZ2gtMTU3NDA2OiBGaXggdGhlIFB5dGhvbiBp
bXBsZW1lbnRhdGlvbiBvZgogIDpjbGFzczpgeG1sLmV0cmVlLkVsZW1lbnRUcmVlLlhNTFBhcnNl
cmA6IHRoZSBgYGRvY3R5cGUoKWBgIG1ldGhvZCBvZiB0aGUKICB0YXJnZXQgaXMgbm93IGNhbGxl
ZCBmb3IgYSBkb2N1bWVudCB0eXBlIGRlY2xhcmF0aW9uIHdpdGhvdXQgYW4gZXh0ZXJuYWwKICBp
ZGVudGlmaWVyLCBsaWtlIGBgPCFET0NUWVBFIGh0bWw+YGAsIGFzIGluIHRoZSBDIGltcGxlbWVu
dGF0aW9uLgoKLSBnaC0xMjg1MDk6IDpmdW5jOmBtYXJzaGFsLmxvYWRgIGFuZCA6ZnVuYzpgbWFy
c2hhbC5sb2Fkc2AgY2FuIG5vdyBnZXQKICAxLWJ5dGUgc3RyaW5nIHNpbmdsZXRvbnMuIFBhdGNo
IGJ5IFZpY3RvciBTdGlubmVyLgoKLSBnaC0xNTczMjU6IEZpeCBhbiBvdXQtb2YtYm91bmRzIHJl
YWQgaW4gdGhlIGBgaHpgYCBpbmNyZW1lbnRhbCBkZWNvZGVyCiAgd2hlbiB0aGUgaW5wdXQgZW5k
cyB3aXRoIGBgfmBgLgoKLSBnaC0xNTcyMTM6IEZpeCA6ZnVuYzpgYXN5bmNpby5nYXRoZXJgIGxl
YXZpbmcgc3RhbGUgYXdhaXQtZ3JhcGggZWRnZXMgb24KICBjaGlsZHJlbiB0aGF0IG91dGxpdmUg
aXQuCgotIGdoLTE1NjAwMjogOm1vZDpgemlwZmlsZWAgYWdhaW4gcmVhZHMgbWVtYmVycyB0aHJv
dWdoIGEgdGhpcmQtcGFydHkKICBkZWNvbXByZXNzb3IgaW5zdGFsbGVkIGJ5IG1vbmtleS1wYXRj
aGluZyB0aGUgcHJpdmF0ZQogIGBgX2dldF9kZWNvbXByZXNzb3IoKWBgIHRvIHJldHVybiBhbiBv
YmplY3QgdGhhdCBvbmx5IGltcGxlbWVudHMgb2xkCiAgQloyRGVjb21wcmVzc29yIEFQSSBmcm9t
IFB5dGhvbiAzLjMuIE5vdGUgdGhhdCBkZWNvbXByZXNzb3JzIHdpdGhvdXQKICBgYG5lZWRzX2lu
cHV0YGAgYW5kIHR3by1hcmd1bWVudCBgYGRlY29tcHJlc3MoKWBgIGFyZSB2dWxuZXJhYmxlIHRv
CiAgOmN2ZTpgMjAyNi0xNTMxMGAuCgotIGdoLTE1NzE1OTogVGhlIHVzYWdlIG1lc3NhZ2UgcHJp
bnRlZCBieSBgYHB5dGhvbiAtbSB0YWJuYW5ueWBgIHdoZW4gbm8KICBhcmd1bWVudHMgYXJlIGdp
dmVuIG5vdyBzdWdnZXN0cyBgYHB5dGhvbiAtbWBgIGluc3RlYWQgb2YgdGhlIHNvdXJjZSBmaWxl
LgoKLSBnaC0xMjMwMTg6IEZpeCA6ZnVuYzpgcmVhZGxpbmUud3JpdGVfaGlzdG9yeV9maWxlYCBh
bmQKICA6ZnVuYzpgcmVhZGxpbmUuYXBwZW5kX2hpc3RvcnlfZmlsZWAgcHJvZHVjaW5nIGEgaGlz
dG9yeSBmaWxlIHRoYXQKICA6ZnVuYzpgcmVhZGxpbmUucmVhZF9oaXN0b3J5X2ZpbGVgIGNvdWxk
IG5vdCBsb2FkIHdoZW4gYSBsaW1pdCB3YXMgc2V0CiAgd2l0aCA6ZnVuYzpgcmVhZGxpbmUuc2V0
X2hpc3RvcnlfbGVuZ3RoYCBhbmQgUHl0aG9uIHdhcyBidWlsdCBhZ2FpbnN0CiAgYGBsaWJlZGl0
YGAuICBUaGlzIHdvcmtzIGFyb3VuZCBgTmV0QlNEIFBSIDYwMzIyCiAgPGh0dHBzOi8vZ25hdHMu
bmV0YnNkLm9yZy82MDMyMj5gXy4KCi0gZ2gtMTU3MDU4OiA6ZnVuYzpgYXN5bmNpby53YWl0X2Zv
cmAgd2l0aCBhIG5vbi1wb3NpdGl2ZSB0aW1lb3V0IG5vdwogIHJlY29yZHMgdGhlIHdhaXRlciBp
biB0aGUgY2FsbCBncmFwaC4KCi0gZ2gtMTU2OTMzOiBGaXggaW5jb3JyZWN0IGludGVnZXIgcmV0
dXJuIHZhbHVlcyBmcm9tIDptb2Q6YGN0eXBlc2AKICBjYWxsYmFja3Mgb24gc29tZSBwbGF0Zm9y
bXMsIHN1Y2ggYXMgczM5MHguCgotIGdoLTE1NzA0ODogUHJlc2VydmUgdGhlIHBvc2l0aW9uIGFu
ZCBjb250ZW50cyBvZiA6Y2xhc3M6YGlvLkJ5dGVzSU9gIHdoZW4KICA6bWV0aDpgIUJ5dGVzSU8u
X19pbml0X19gIGZhaWxzIGJlY2F1c2UgYSBidWZmZXIgaXMgZXhwb3J0ZWQuCgotIGdoLTE1Njk2
MTogRml4IDpmdW5jOmB0a2ludGVyLmZvbnQubmFtZXRvZm9udGAgYW5kIHRoZQogIDpjbGFzczpg
dGtpbnRlci5mb250LkZvbnRgIGNvbnN0cnVjdG9yIGZvciBhIGZvbnQgbmFtZSByZXR1cm5lZCBi
eSBUayBhcyBhCiAgVGNsIG9iamVjdCwgZm9yIGV4YW1wbGUgYnkgOm1ldGg6YHR0ay5TdHlsZS5s
b29rdXAoKQogIDx0a2ludGVyLnR0ay5TdHlsZS5sb29rdXA+YC4KCi0gZ2gtMTU2OTg4OiA6ZnVu
YzpgYXN5bmNpby5wcmludF9jYWxsX2dyYXBoYCBubyBsb25nZXIgdHJ1bmNhdGVzIHRoZSBjYWxs
CiAgc3RhY2sgYXQgYSBzeW5jaHJvbm91cyBnZW5lcmF0b3IuCgotIGdoLTE1Njk3MDogU2V0IHRo
ZSBkb2NzdHJpbmcgb2YgOmF0dHI6YHVuaXR0ZXN0Lm1vY2suTW9jay5yZXR1cm5fdmFsdWVgLgoK
LSBnaC0xNTY5NDY6IEZpeCBhIGNyYXNoIGluIDptb2Q6YGN1cnNlcy5wYW5lbGAgd2hlbiB0aGUg
ZmluYWxpemVyIG9mIGEKICBwYW5lbCdzIHVzZXIgcG9pbnRlciBydW5zIHdoaWxlIHRoZSBwYW5l
bCBpcyBiZWluZyBkZWFsbG9jYXRlZC4gIFRoZSBwYW5lbAogIGlzIG5vdyB0YWtlbiBvZmYgdGhl
IHBhbmVsIHN0YWNrIGJlZm9yZSBpdHMgdXNlciBwb2ludGVyIGlzIGRyb3BwZWQuCgotIGdoLTE1
Njc5NzogRml4IDpjbGFzczpgeG1sLnNheC5zYXh1dGlscy5YTUxHZW5lcmF0b3JgOiB0aGUgbmFt
ZXNwYWNlIFVSSQogIGlzIG5vdyBlc2NhcGVkIGluIHRoZSBuYW1lc3BhY2UgZGVjbGFyYXRpb24u
ICBQcmV2aW91c2x5IGEgVVJJIGNvbnRhaW5pbmcKICBgYCZgYCwgYGA8YGAgb3IgYSBxdW90ZSBj
aGFyYWN0ZXIgcHJvZHVjZWQgYSBkb2N1bWVudCB3aGljaCBjYW5ub3QgYmUKICBwYXJzZWQuCgot
IGdoLTgzODk1OiA6bW9kOmB4bWwuZXRyZWUuRWxlbWVudFRyZWVgIG5vdyBhY2NlcHRzIGlucHV0
IGxhcmdlciB0aGFuIDIgR2lCCiAgaW4gdGhlIEMgaW1wbGVtZW50YXRpb24uIFRoZSBkYXRhIGlz
IGZlZCB0byBFeHBhdCBpbiBjaHVua3MsIGFzCiAgOm1vZDpgeG1sLnBhcnNlcnMuZXhwYXRgIGFs
cmVhZHkgZGlkLCBpbnN0ZWFkIG9mIHJhaXNpbmcKICA6ZXhjOmBPdmVyZmxvd0Vycm9yYC4KCi0g
Z2gtOTkwNjQ6IEZpeCA6ZnVuYzpgeG1sLmV0cmVlLkVsZW1lbnRUcmVlLnBhcnNlYCB3aXRoIGEg
dGV4dCBmaWxlIG9yCiAgb3RoZXIgc291cmNlIG9mIDpjbGFzczpgc3RyYCBkYXRhIGluIHRoZSBD
IGltcGxlbWVudGF0aW9uLiBUaGUgZW5jb2RpbmcKICBkZWNsYXJlZCBpbiB0aGUgZG9jdW1lbnQg
d2FzIGFwcGxpZWQgdG8gdGhlIGFscmVhZHkgZGVjb2RlZCB0ZXh0LCB3aGljaAogIHByb2R1Y2Vk
IG1vamliYWtlLiBJdCBpcyBub3cgaWdub3JlZCwgYXMgd2hlbiBwYXJzaW5nIHdpdGgKICA6bWV0
aDpgIVhNTFBhcnNlci5mZWVkYCBvciA6ZnVuYzpgfnhtbC5ldHJlZS5FbGVtZW50VHJlZS5mcm9t
c3RyaW5nYC4KCi0gZ2gtMTU2NzEzOiBGaXggOmZ1bmM6YCFudHVybDJwYXRoLnBhdGhuYW1lMnVy
bGAgYW5kCiAgOmZ1bmM6YCFudHVybDJwYXRoLnVybDJwYXRobmFtZWA6IHRoZSBmaWxlc3lzdGVt
IGVuY29kaW5nIGFuZCBlcnJvcgogIGhhbmRsZXIgYXJlIG5vdyB1c2VkIGZvciBwZXJjZW50LWVu
Y29kaW5nIGFuZCBkZWNvZGluZywgYXMgaW4KICA6bW9kOmB1cmxsaWIucmVxdWVzdGAuICBQcmV2
aW91c2x5IHBhdGhzIGNvbnRhaW5pbmcgc3Vycm9nYXRlIGNoYXJhY3RlcnMKICByYWlzZWQgOmV4
YzpgVW5pY29kZUVuY29kZUVycm9yYC4KCi0gZ2gtMTI3MDU3OiBGaXggOmNsYXNzOmBhc3luY2lv
LlByb2FjdG9yRXZlbnRMb29wYCBVRFAgdHJhbnNwb3J0cyBzbyB0aGF0IGEKICA6ZXhjOmBDb25u
ZWN0aW9uUmVzZXRFcnJvcmAgcmFpc2VkIGJ5IGBgV1NBUmVjdkZyb21gYCBubyBsb25nZXIgc3Rv
cHMgdGhlCiAgcmVhZCBsb29wLgoKLSBnaC0xNTY2NTg6IDptb2Q6YHhtbC5kb21gIGFuZCA6bW9k
OmB4bWwuZXRyZWUuRWxlbWVudFRyZWVgIG5vIGxvbmdlciB0cmVhdAogIGNoYXJhY3RlcnMgd2hp
Y2ggYXJlIG5vdCB3aGl0ZSBzcGFjZSBpbiBYTUwgKHN1Y2ggYXMgVSswMEEwKSBhcyB3aGl0ZQog
IHNwYWNlLiBQcmV2aW91c2x5IHRoZXkgY291bGQgYmUgbG9zdCBpbgogIDpmdW5jOmB+eG1sLmV0
cmVlLkVsZW1lbnRUcmVlLmluZGVudGAsCiAgOmZ1bmM6YH54bWwuZXRyZWUuRWxlbWVudFRyZWUu
Y2Fub25pY2FsaXplYCB3aXRoIGBgc3RyaXBfdGV4dD1UcnVlYGAsIGFuZAogIHdoZW4gcGFyc2lu
ZyB3aXRoIHRoZSBgYHdoaXRlc3BhY2UtaW4tZWxlbWVudC1jb250ZW50YGAgZmVhdHVyZSB0dXJu
ZWQKICBvZmYuCgotIGdoLTE1NjUxMjogRml4IDptb2Q6YGFzeW5jaW9gIGxvc2luZyBhIGNvbm5l
Y3Rpb24gdHdpY2Ugd2hlbgogIGBgcmVzdW1lX3dyaXRpbmcoKWBgIGNsb3NlcyB0aGUgdHJhbnNw
b3J0LgoKLSBnaC0xNTY1MjM6IEZpeCA6ZnVuYzpgYXN5bmNpby5hc19jb21wbGV0ZWRgIG5vdCBy
ZWNvcmRpbmcgdGhlIGF3YWl0aW5nCiAgdGFzayBpbiB0aGUgY2FsbCBncmFwaC4KCi0gZ2gtMTU2
NDc2OiBUaGUgcHVyZSBQeXRob24gaW1wbGVtZW50YXRpb24gb2YgOm1ldGg6YHF1ZXVlLlNpbXBs
ZVF1ZXVlLmdldGAKICBub3cgaWdub3JlcyAqdGltZW91dCogd2hlbiAqYmxvY2sqIGlzIGZhbHNl
LCBtYXRjaGluZyB0aGUgZG9jdW1lbnRlZAogIGJlaGF2aW9yIGFuZCB0aGUgQyBpbXBsZW1lbnRh
dGlvbi4gSXQgcHJldmlvdXNseSByYWlzZWQgOmV4YzpgVmFsdWVFcnJvcmAuCgotIGdoLTE1NjQ0
NDogRml4IG1hdGNoaW5nIG9mIGEgbmVnYXRlZCBjaGFyYWN0ZXIgc2V0IGluIGEgYnl0ZXMgcGF0
dGVybgogIGNvbXBpbGVkIHdpdGggYm90aCA6Y29uc3Q6YHJlLklHTk9SRUNBU0VgIGFuZCA6Y29u
c3Q6YHJlLkxPQ0FMRWAuICBUaGUKICBjYXNlIGNsb3N1cmUgaXMgbm93IGFwcGxpZWQgdG8gdGhl
IG1lbWJlcnMgb2YgdGhlIHNldCwgc28gdGhhdCBgYFteYmNdYGAKICBubyBsb25nZXIgbWF0Y2hl
cyBgYGInQidgYC4KCi0gZ2gtMTU2NDA4OiBGaXggOmZ1bmM6YGFzeW5jaW8ucHJpbnRfY2FsbF9n
cmFwaGAgcmFpc2luZwogIDpleGM6YEF0dHJpYnV0ZUVycm9yYCB3aGVuIGNhbGxlZCBvbiBhIHRh
c2sgdGhhdCBoYXMgYWxyZWFkeSBmaW5pc2hlZC4KCi0gZ2gtMTU2MzUzOiBGaXggOm1vZDpgY29u
ZmlncGFyc2VyYCBwYXJzaW5nIHdoZW4gdXNpbmcgd2hpdGVzcGFjZSBpbgogICpkZWxpbWl0ZXJz
Ki4KCi0gZ2gtMTU2MTY2OiA6bW9kOmBzc2xgOiBBIGZhaWxlZCBhc3NpZ25tZW50IG9yIGRlbGV0
aW9uIG9mIHRoZQogIGBgX21zZ19jYWxsYmFja2BgIGF0dHJpYnV0ZSBvZiA6Y2xhc3M6YHNzbC5T
U0xDb250ZXh0YCBubyBsb25nZXIgcmVtb3ZlcwogIHRoZSBjdXJyZW50IGNhbGxiYWNrLiBEZWxl
dGluZyBpdCBub3cgcmFpc2VzIDpleGM6YEF0dHJpYnV0ZUVycm9yYCBpbnN0ZWFkCiAgb2YgOmV4
YzpgVHlwZUVycm9yYC4KCi0gZ2gtMTU2MTczOiBDYWxsaW5nIDptZXRoOmB6bGliLkRlY29tcHJl
c3MuZmx1c2hgIG9uIGludmFsaWQgY29tcHJlc3NlZAogIGRhdGEgbm93IHJhaXNlcyA6ZXhjOmB6
bGliLmVycm9yYCBpbnN0ZWFkIG9mIGJlaW5nIHNpbGVudGx5IGlnbm9yZWQuCgotIGdoLTE1Mjgx
NzogOm1vZDpgc3FsaXRlM2A6IERpc2FsbG93IHJlbW92aW5nIHRoZSBgYHJvd19mYWN0b3J5YGAg
YXR0cmlidXRlCiAgb2YgYSBjdXJzb3IgdG8gcHJldmVudCBhIGNyYXNoIG9uIGEgcXVlcnkuCgot
IGdoLTE1NjEyNDogRml4IGEgY3Jhc2ggaW4gdGhlIGZyZWUtdGhyZWFkZWQgYnVpbGQgd2hlbiBk
ZWxldGluZyB0aGUKICA6YXR0cjpgIWNvbnRlbnRzYCBhdHRyaWJ1dGUgb2YgYSA6bW9kOmBjdHlw
ZXNgIHBvaW50ZXIuCgotIGdoLTE1NjExMjogOm1vZDpgIV9pb3Nfc3VwcG9ydGAgbm8gbG9uZ2Vy
IGZhaWxzIHRvIGltcG9ydCB3aGVuCiAgOmZ1bmM6YGN0eXBlcy51dGlsLmZpbmRfbGlicmFyeWAg
Y2Fubm90IHJlc29sdmUgdGhlIE9iakMgcnVudGltZSB0aHJvdWdoCiAgdGhlIGR5bGQgc2hhcmVk
IGNhY2hlLCBhcyBpcyB0aGUgY2FzZSBvbiBpT1MgMTMuIFRoZSBydW50aW1lIGlzIG5vdyBsb2Fk
ZWQKICBieSBuYW1lLCB3aGljaCBkeWxkIHJlc29sdmVzIGFnYWluc3QgdGhlIGNhY2hlIGRpcmVj
dGx5LgoKLSBnaC0xNTYxMDE6IEZpeCA6YXR0cjpgc3FsaXRlMy5DdXJzb3IuYXJyYXlzaXplYCBi
ZWluZyBzZXQgdG8gMCBpZiB0aGUKICBhc3NpZ25lZCB2YWx1ZSBpcyB0b28gbGFyZ2UuIFRoZSBh
dHRyaWJ1dGUgaXMgbm93IGxlZnQgdW5jaGFuZ2VkIGlmIHRoZQogIGFzc2lnbm1lbnQgZmFpbHMu
CgotIGdoLTE1NjEwMDogRml4IGNyYXNoZXMgaW4gOmNsYXNzOmBzcWxpdGUzLkNvbm5lY3Rpb25g
IHdoZW4gZGVsZXRpbmcgdGhlCiAgOmF0dHI6YH5zcWxpdGUzLkNvbm5lY3Rpb24uYXV0b2NvbW1p
dGAgYXR0cmlidXRlIG9yIHNldHRpbmcgaXQgdG8gYW4KICBpbnRlZ2VyIHdoaWNoIGRvZXMgbm90
IGZpdCBpbiBDIDpjOmV4cHI6YGxvbmdgLiBCb3RoIG5vdyByYWlzZSBhbgogIGV4Y2VwdGlvbi4K
Ci0gZ2gtMTU2MDk5OiBGaXggYSBjcmFzaCB3aGVuIGRlbGV0aW5nIHRoZSBgYGtleWxvZ19maWxl
bmFtZWBgIGF0dHJpYnV0ZSBvZgogIDpjbGFzczpgc3NsLlNTTENvbnRleHRgLiBJdCBub3cgcmFp
c2VzIDpleGM6YEF0dHJpYnV0ZUVycm9yYC4KCi0gZ2gtMTU2MDY3OiBGaXggZXJyb3IgaGFuZGxp
bmcgaW4gdGhlIDptb2Q6YHpvbmVpbmZvYCBhY2NlbGVyYXRvciBtb2R1bGUKICB3aGVuIGEgdHJh
bnNpdGlvbiBpbmRleCBpcyBgYC0xYGAgb3IgYSBUWiBzdHJpbmcncyBgYF9fYm9vbF9fYGAgcmFp
c2VzLgoKLSBnaC0xNTU5OTc6IEZpeCA6ZnVuYzpgY29uY3VycmVudC5pbnRlcnByZXRlcnMubGlz
dF9hbGxgLiAgSXQgZmFpbGVkIGlmIGFuCiAgaW50ZXJwcmV0ZXIgd2FzIGRlc3Ryb3llZCBkdXJp
bmcgdGhlIGNhbGwsIGluIHBhcnRpY3VsYXIgYnkgYSBnYXJiYWdlCiAgY29sbGVjdGlvbiB3aGlj
aCBmaW5hbGl6ZWQgdGhlIG9iamVjdCBvd25pbmcgdGhlIGxhc3QgcmVmZXJlbmNlIHRvIGl0LgoK
LSBnaC0xNTU5NDE6IEZpeCA6ZnVuYzpgYXN5bmNpby5zdGFydF9zZXJ2ZXJgIHdoZW4gYSBwbGFp
bi1mdW5jdGlvbgogICpjbGllbnRfY29ubmVjdGVkX2NiKiByYWlzZXM6IHRoZSBlcnJvciBpcyBu
b3cgcmVwb3J0ZWQgbGlrZSB0aGUgY29yb3V0aW5lCiAgY2FzZSBhbmQgdGhlIHRyYW5zcG9ydCBp
cyBjbG9zZWQsIGluc3RlYWQgb2YgbGVhdmluZyB0aGUgY29ubmVjdGlvbiBvcGVuCiAgZm9yZXZl
ciAod2hpY2ggYWxzbyBtYWRlIDptZXRoOmBhc3luY2lvLlNlcnZlci53YWl0X2Nsb3NlZGAgaGFu
ZykuCgotIGdoLTE1NTk1MjogRml4IHRoZSBzaWduYXR1cmVzIG9mIDptZXRoOmBzcWxpdGUzLkNv
bm5lY3Rpb24uZXhlY3V0ZWAsCiAgOmZ1bmM6YHdhcm5pbmdzLndhcm5gIGFuZCA6ZnVuYzpgbG9j
YWxlLnNldGxvY2FsZWAgd2hpY2ggcmVuZGVyZWQKICBgYDx1bnJlcHJlc2VudGFibGU+YGAgaW5z
dGVhZCBvZiB0aGUgY29ycmVjdCBkZWZhdWx0cyBmb3IgcGFyYW1ldGVycy4KCi0gZ2gtMTU1ODg4
OiBGaXggOm1ldGg6YGFzeW5jaW8uV3JpdGVUcmFuc3BvcnQud3JpdGVsaW5lc2AgaGFuZ2luZyB0
aGUKICB0cmFuc3BvcnQgd2hlbiB0aGUgbGFzdCBkYXRhIGNodW5rIGlzIGVtcHR5LgoKLSBnaC0x
NTU3NzU6IEZpeCBhIHJlZ3Jlc3Npb24gaW4gOm1vZDpgaW1hcGxpYmAgaW50cm9kdWNlZCBpbiB0
aGUgZml4IGZvcgogIDpnaDpgNjMxMjFgOiByZWZyZXNoaW5nIHRoZSBjYXBhYmlsaXRpZXMgYWZ0
ZXIgYSBzdWNjZXNzZnVsCiAgOm1ldGg6YH5pbWFwbGliLklNQVA0LmxvZ2luYCBvciA6bWV0aDpg
fmltYXBsaWIuSU1BUDQuYXV0aGVudGljYXRlYAogIGNvbnN1bWVkIHRoZSBgYENBUEFCSUxJVFlg
YCByZXNwb25zZSwgc28gaXQgY291bGQgbm8gbG9uZ2VyIGJlIHJlYWQgd2l0aAogIDptZXRoOmB+
aW1hcGxpYi5JTUFQNC5yZXNwb25zZWAuCgotIGdoLTExMzMxODogRml4IGNyYXNoZXMgd2hlbiBk
ZWxldGluZyBhbiBhdHRyaWJ1dGUgd2hvc2Ugc2V0dGVyIGlzCiAgZ2VuZXJhdGVkIGJ5IEFyZ3Vt
ZW50IENsaW5pYyBhbmQgaXMgbm90IHByZXBhcmVkIGZvciBkZWxldGlvbiwgYW1vbmcgdGhlbQog
IDphdHRyOmBmcmFtZS5mX3RyYWNlX29wY29kZXNgIGFuZCB0aGUgYGBjb250ZXh0YGAsIGBgb3du
ZXJgYCBhbmQKICBgYHNlc3Npb25gYCBhdHRyaWJ1dGVzIG9mIGBgX3NzbC5fU1NMU29ja2V0YGAu
IERlbGV0aW5nIHN1Y2ggYXR0cmlidXRlIG5vdwogIHJhaXNlcyA6ZXhjOmBBdHRyaWJ1dGVFcnJv
cmAuCgotIGdoLTE1NTQ2ODogRml4IDptb2Q6YG5ldHJjYCB0byBkaXN0aW5ndWlzaCBlbXB0eSBx
dW90ZWQgdG9rZW5zIGZyb20KICBlbmQtb2YtZmlsZSwgc28gbWFsZm9ybWVkIGZpbGVzIG5vIGxv
bmdlciBjYXVzZSB0aGUgcmVtYWluaW5nIGNvbnRlbnQgdG8KICBiZSBzaWxlbnRseSBpZ25vcmVk
LgoKLSBnaC0xNTU1MTk6IEF2b2lkIGEgZGF0YS1yYWNlIGluIGZyZWUtdGhyZWFkZWQgYnVpbGRz
IHdoZW4gcmVhZGluZyBhbmQKICB3cml0aW5nIGNvbnRleHQgdmFyaWFibGVzIGZyb20gZGlmZmVy
ZW50IHRocmVhZHMuCgotIGdoLTE1NTMzNjogRml4IGVycm9yIGhhbmRsaW5nIGluIDpmdW5jOmBz
b2NrZXQuZ2V0aG9zdGJ5YWRkcmAgYW5kCiAgOmZ1bmM6YHNvY2tldC5nZXRob3N0YnluYW1lX2V4
YCB3aGVuIGhvc3RuYW1lIHJlc29sdXRpb24gZmFpbHMuCgotIGdoLTEwMjQ3NTogRml4IDpmdW5j
OmBvcy5wYXRoLnJlYWxwYXRoYCBvbiBXaW5kb3dzOiB0aGUgdW5yZXNvbHZlZCBwYXJ0IG9mCiAg
dGhlIHBhdGggaXMgbm93IGFwcGVuZGVkLCBub3Qgam9pbmVkLCBzbyBhIGZpbGUgbmFtZSB3aGlj
aCBsb29rcyBsaWtlIGEKICBkcml2ZSAoZS5nLiBgYHNwYW06ZWdnc2BgKSBubyBsb25nZXIgZGlz
Y2FyZHMgdGhlIHJlc29sdmVkIHBhcnQuICBBIHBhdGgKICByZWxhdGl2ZSB0byBhbm90aGVyIGRy
aXZlIGlzIG5vdyByZXNvbHZlZCBhZ2FpbnN0IHRoZSByb290IGRpcmVjdG9yeSBvZgogIHRoYXQg
ZHJpdmUuCgotIGdoLTg5NzYwOiBGaXggOmZ1bmM6YG9zLnBhdGgucmVhbHBhdGhgIG9uIFdpbmRv
d3M6IHRoZSBgYFxcP1xgYCBwcmVmaXggaXMKICBubyBsb25nZXIgc3RyaXBwZWQgZnJvbSBhIHZv
bHVtZSBHVUlEIHBhdGgsIHdoaWNoIG1hZGUgdGhlIHJlc3VsdCBpbnZhbGlkLgoKLSBnaC04NDQx
OTogRml4IDpmdW5jOmBvcy5zdGF0YCBvbiBXaW5kb3dzOiB0cmFpbGluZyBkb3RzIGFuZCBzcGFj
ZXMsIHdoaWNoCiAgYXJlIGlnbm9yZWQgYnkgdGhlIG9wZXJhdGluZyBzeXN0ZW0sIGFyZSBubyBs
b25nZXIgdGFrZW4gaW50byBhY2NvdW50IHdoZW4KICB0aGUgZXhlY3V0ZSBwZXJtaXNzaW9ucyBh
cmUgZ3Vlc3NlZCBmcm9tIHRoZSBmaWxlIGV4dGVuc2lvbi4KCi0gZ2gtMTU1MzE5OiA6ZnVuYzpg
d2FybmluZ3Mud2Fybl9leHBsaWNpdGAgbm93IGRpc3BsYXlzIHRoZSBzb3VyY2UgbGluZQogIHRh
a2VuIGZyb20gdGhlIGxvYWRlciBvZiB0aGUgbW9kdWxlIHdob3NlIGdsb2JhbHMgYXJlIHBhc3Nl
ZCBhcwogICptb2R1bGVfZ2xvYmFscyouICBJdCBhbHNvIG5vIGxvbmdlciByYWlzZXMgOmV4Yzpg
SW5kZXhFcnJvcmAgaWYgKmxpbmVubyoKICBpcyBvdXQgb2YgdGhlIHJhbmdlIG9mIHRoZSBtb2R1
bGUgc291cmNlLgoKLSBnaC0xMjMwMTE6IDpmdW5jOmB3YXJuaW5ncy53YXJuX2V4cGxpY2l0YCBu
byBsb25nZXIgZW1pdHMgYSBzcHVyaW91cwogIDpleGM6YERlcHJlY2F0aW9uV2FybmluZ2Agb3Ig
cmFpc2VzIDpleGM6YEltcG9ydEVycm9yYCB3aGVuIGl0IGlzIGNhbGxlZAogIHdpdGggdGhlIGds
b2JhbHMgb2YgdGhlIDptb2Q6YF9fbWFpbl9fYCBtb2R1bGUuCgotIGdoLTY5MzcwOiA6cHJvZ3Jh
bTpgcHl0aG9uIC1tIGluc3BlY3QgLS1kZXRhaWxzYCBubyBsb25nZXIgZmFpbHMgd2l0aAogIDpl
eGM6YFVuaWNvZGVFbmNvZGVFcnJvcmAgaWYgdGhlIHBhdGggb2YgdGhlIG1vZHVsZSBjb250YWlu
cyBjaGFyYWN0ZXJzCiAgdW5lbmNvZGFibGUgaW4gdGhlIGVuY29kaW5nIG9mIDpkYXRhOmBzeXMu
c3Rkb3V0YC4gIFN1Y2ggY2hhcmFjdGVycyBhcmUKICBub3cgZXNjYXBlZCB3aXRoIGJhY2tzbGFz
aGVzLgoKLSBnaC02OTM3MTogRml4IDptb2Q6YHB5ZG9jYCBmb3IgbW9kdWxlcyB3aG9zZSBwYXRo
IGNvbnRhaW5zIHVuZGVjb2RhYmxlCiAgYnl0ZXMuIDpmdW5jOmAhcHlkb2Mud3JpdGVkb2NgIGFu
ZCB0aGUgcHlkb2MgSFRUUCBzZXJ2ZXIgbm8gbG9uZ2VyIGZhaWwKICB3aXRoIDpleGM6YFVuaWNv
ZGVFbmNvZGVFcnJvcmA6IHRoZSBmaWxlIFVSTCBpcyBub3cgcGVyY2VudC1lbmNvZGVkIHVzaW5n
CiAgdGhlIGZpbGVzeXN0ZW0gZW5jb2RpbmcsIGFuZCBjaGFyYWN0ZXJzIHVuZW5jb2RhYmxlIGlu
IHRoZSBnZW5lcmF0ZWQgSFRNTAogIHBhZ2UgYXJlIGVzY2FwZWQgd2l0aCBiYWNrc2xhc2hlcy4K
Ci0gZ2gtMTU1MTQzOiBGaXggOmZ1bmM6YGFzeW5jaW8uc2hpZWxkYCBsZWFraW5nIHRoZSBjYWxs
aW5nIHRhc2sgdmlhIHRoZQogIGF3YWl0LWdyYXBoIGFuZCBjYWxsYmFja3Mgd2hlbiBjYWxsZWQg
b24gYSBmdXR1cmUgdGhhdCBuZXZlciByZXNvbHZlcy4KCi0gZ2gtMTU0ODcxOiBGaXhlZCBhIGNy
YXNoIGluIDptZXRoOmBhc3luY2lvLlRhc2suZ2V0X2NvbnRleHRgIHdoZW4gY2FsbGVkCiAgb24g
YW4gdW5pbml0aWFsaXplZCB0YXNrLgoKLSBnaC0xNTQ4NTU6IEZpeCA6bWV0aDpgY3Vyc2VzLndp
bmRvdy5pbnN0cmAgcmV0dXJuaW5nIG9uZSBjaGFyYWN0ZXIgdG9vIGZldwogIHdoZW4gdGhlIDpt
b2Q6YGN1cnNlc2AgbW9kdWxlIGlzIGJ1aWx0IGFnYWluc3QgYSBjdXJzZXMgbGlicmFyeSB0aGF0
CiAgY291bnRzIHRoZSB0ZXJtaW5hdG9yIGluIHRoZSByZXF1ZXN0ZWQgbGVuZ3RoLCBzdWNoIGFz
IHRoZSBOZXRCU0Qgb25lLgoKLSBnaC0xMzU2ODM6IDpjbGFzczpgbG9nZ2luZy5GaWxlSGFuZGxl
cmAgYW5kCiAgOmNsYXNzOmBsb2dnaW5nLmhhbmRsZXJzLldhdGNoZWRGaWxlSGFuZGxlcmAgbm93
IGhvbm9yCiAgOmRhdGE6YGxvZ2dpbmcucmFpc2VFeGNlcHRpb25zYCBmb3IgZXJyb3JzIHRoYXQg
b2NjdXIgd2hpbGUgb3BlbmluZyB0aGUKICBmaWxlLCBsaWtlIGZvciBvdGhlciBlcnJvcnMgZHVy
aW5nIGxvZ2dpbmcuCgotIGdoLTE1Mzk3MDogQ2FsbGluZyA6ZnVuYzpgc3RyYCBvbiBhIDpleGM6
YHN1YnByb2Nlc3MuQ2FsbGVkUHJvY2Vzc0Vycm9yYAogIG5vIGxvbmdlciByYWlzZXMgOmV4Yzpg
VHlwZUVycm9yYCB3aGVuIGl0cyA6YXR0cjpgIXJldHVybmNvZGVgIGlzIG5vdCBhbgogIGludGVn
ZXIsIHN1Y2ggYXMgYGBOb25lYGAuCgotIGdoLTE1MzAwNTogOm1ldGg6YCFjb25jdXJyZW50Lmlu
dGVycHJldGVycy5RdWV1ZS5nZXRgIGFuZAogIDptZXRoOmAhY29uY3VycmVudC5pbnRlcnByZXRl
cnMuUXVldWUucHV0YCBub3cgY29tcHV0ZSB0aGVpciBgYHRpbWVvdXRgYAogIGRlYWRsaW5lIGZy
b20gOmZ1bmM6YHRpbWUubW9ub3RvbmljYCBpbnN0ZWFkIG9mIHRoZSB3YWxsIGNsb2NrLCBzbwog
IGFkanVzdGluZyB0aGUgc3lzdGVtIGNsb2NrIGR1cmluZyB0aGUgY2FsbCBubyBsb25nZXIgbWFr
ZXMgdGhlbSBvdmVyLSBvcgogIHVuZGVyLXdhaXQuCgotIGdoLTE1Mzc3MjogOmZ1bmM6YGlzaW5z
dGFuY2VgIGNoZWNrcyBhZ2FpbnN0IDptb2Q6YGNvbGxlY3Rpb25zLmFiY2AKICBjbGFzc2VzIHN1
Y2ggYXMgOmNsYXNzOmB+Y29sbGVjdGlvbnMuYWJjLk1hcHBpbmdgIG5vIGxvbmdlciByYWlzZQog
IDpleGM6YEF0dHJpYnV0ZUVycm9yYCB3aGVuIHRoZSBpbnN0YW5jZSBoYXMgbm8gYGBfX2NsYXNz
X19gYC4gIFRoZQogIGFic3RyYWN0IGJhc2UgY2xhc3MgbWFjaGluZXJ5IG5vdyBmYWxscyBiYWNr
IHRvIHRoZSBvYmplY3QncyB0eXBlIGluIHRoYXQKICBjYXNlLCBtYXRjaGluZyB0aGUgYmVoYXZp
b3VyIG9mIHRoZSBidWlsdC1pbiA6ZnVuYzpgaXNpbnN0YW5jZWAuCgotIGdoLTgxMjQxOiBGaXgg
OmV4YzpgT1NFcnJvcmAgd2hlbiBpbXBvcnRpbmcgOm1vZDpgY3R5cGVzYCBmcm9tIGEKICBzdGF0
aWNhbGx5IGxpbmtlZCBpbnRlcnByZXRlci4KCi0gZ2gtMTUzNjAzOiBGaXggYSBjcmFzaCBpbiB0
aGUgSVNPLTIwMjIgZGVjb2RlcnMgd2hlbiBkZWNvZGluZyBhIGJ5dGUgYWZ0ZXIKICBhbiB1bmtu
b3duIGNoYXJzZXQgZGVzaWduYXRpb24gaXMgc2V0IHZpYSB0aGUgZGVjb2RlcidzIGBgc2V0c3Rh
dGVgYAogIG1ldGhvZC4gUGF0Y2ggYnkgdG9uZ2h1YXJvb3QuCgotIGdoLTE1MzUzOTogRml4IGEg
Y3Jhc2ggaW4gdGhlIEMgaW1wbGVtZW50YXRpb24gb2YKICA6bWV0aDpgaW8uVGV4dElPV3JhcHBl
ci50ZWxsYCB3aGVuIHRoZSBkZWNvZGVyJ3MgYGBnZXRzdGF0ZWBgIG1ldGhvZAogIHRyaWdnZXJz
IGEgcmVlbnRyYW50IHNlZWssIG9yIHdoZW4gYW5vdGhlciB0aHJlYWQgc2Vla3MgdGhlIHNhbWUg
c3RyZWFtCiAgY29uY3VycmVudGx5LiBQYXRjaCBieSB0b25naHVhcm9vdC4KCi0gZ2gtMTUyOTA3
OiBSZXN0b3JlIGNvb2tlZC1tb2RlIHRlcm1pbmFsIG91dHB1dCBmbGFncyBhcm91bmQKICA6Yzpk
YXRhOmBQeU9TX0lucHV0SG9va2AgY2FsbGJhY2tzIGluIHRoZSBuZXcgOnRlcm06YFJFUExgCiAg
KDptb2Q6YCFfcHlyZXBsYCksIHNvIHRoYXQgb3V0cHV0IHdyaXR0ZW4gYnkgYW4gaW5wdXQgaG9v
ayAoZm9yIGV4YW1wbGUgYQogIEdVSSB0b29sa2l0IGV2ZW50IGxvb3ApIGlzIG5vIGxvbmdlciBl
bWl0dGVkIHdpdGggYGBPUE9TVGBgIGRpc2FibGVkIGFuZAogIGtlZXBzIGl0cyBjYXJyaWFnZSBy
ZXR1cm5zLgoKLSBnaC0xNTMzMTk6IFRoZSA6bW9kOmB0dXJ0bGVkZW1vYCB2aWV3ZXIgbm93IHJl
YWRzIGVhY2ggZGVtbyBzY3JpcHQgYXMKICBVVEYtOCBpbnN0ZWFkIG9mIHRoZSBsb2NhbGUgZW5j
b2RpbmcuCgotIGdoLTE1MzEzMzogRml4IGEgc29ja2V0IGxlYWsgaW4gOm1ldGg6YGFzeW5jaW8u
bG9vcC5jcmVhdGVfY29ubmVjdGlvbmAKICB3aGVuIHRoZSB0cmFuc3BvcnQgY2Fubm90IGJlIGNy
ZWF0ZWQuCgotIGdoLTE1MjA2ODogRml4ZXMgYSBidWcgd2hlbiBhIGxpbmUgd2FzIHNwbGl0IChw
YXJ0aWN1bGFybHkgb24gbWFjT1MKICBUZXJtaW5hbC5hcHApIGluIHRoZSBtaWRkbGUgb2YgYSBj
b2xvcml6ZWQga2V5d29yZCwgY2F1c2luZyB0aGUgQU5TSSBDb2xvcgogIFJlc2V0IHNlcXVlbmNl
IChFU0MwbSkgdG8gbm90IGJlIHByb3Blcmx5IHByaW50ZWQsIGNhdXNpbmcgdGhlIG91dHB1dCB0
bwogIGJlIGNvbG9yZWQgd2hlbiBpdCBzaG91bGRuJ3QKCi0gZ2gtMTUyMjA0OiBGaXggdGhlIHB1
cmUtUHl0aG9uIGltcGxlbWVudGF0aW9ucyBvZgogIDptZXRoOmBkYXRldGltZS5kYXRlLmZyb21p
c29mb3JtYXRgLCA6bWV0aDpgZGF0ZXRpbWUudGltZS5mcm9taXNvZm9ybWF0YAogIGFuZCA6bWV0
aDpgZGF0ZXRpbWUuZGF0ZXRpbWUuZnJvbWlzb2Zvcm1hdGAgc2lsZW50bHkgYWNjZXB0aW5nIHNv
bWUKICBtYWxmb3JtZWQgSVNPIDg2MDEgc3RyaW5ncywgc3VjaCBhcyBub24tQVNDSUkgZGlnaXRz
IG9yIGEgc2lnbiBpbiBhCiAgZml4ZWQtd2lkdGggZmllbGQgKGZvciBleGFtcGxlIGBgJzIwMjAr
MTInYGAgb3IgYGAnMjAyMDEyMTJUMDEwMtmj2aQnYGApLgogIEVhY2ggZmllbGQgaXMgbm93IHJl
cXVpcmVkIHRvIGJlIGV4YWN0bHkgKk4qIEFTQ0lJIGRpZ2l0cywgbWF0Y2hpbmcgdGhlIEMKICBp
bXBsZW1lbnRhdGlvbi4KCi0gZ2gtMTUxOTU1OiBBbGxvdyBtb3JlIHR5cGVzIHRvIGJlIHVzZWQg
aW4gdGhlIGBgYm91bmRgYCBhcmd1bWVudCB0bwogIDpjbGFzczpgdHlwaW5nLlBhcmFtU3BlY2Au
CgotIGdoLTE1MDc3MTogRml4IHNlcmlhbGl6YXRpb24gb2YgOm1vZDpgZW1haWxgIG1lc3NhZ2Vz
IHVzaW5nIHRoZQogIGBgc2hpZnRfamlzYGAgb3IgYGBldWMtanBgYCBjaGFyc2V0czogYGBzZXRf
Y29udGVudCgpYGAgbm93IGVuY29kZXMgdGhlCiAgcGF5bG9hZCB1c2luZyB0aGUgb3V0cHV0IGNo
YXJzZXQsIHNvIGBgc3RyKG0pYGAgbm8gbG9uZ2VyIHJhaXNlcwogIDpleGM6YFVuaWNvZGVFbmNv
ZGVFcnJvcmAuCgotIGdoLTE0NTg1NjogRml4IDpmdW5jOmBwbGlzdGxpYi5kdW1wc2AgYW5kIDpm
dW5jOmBwbGlzdGxpYi5kdW1wYCBzbyB0aGF0CiAgYGBza2lwa2V5cz1UcnVlYGAgdG9nZXRoZXIg
d2l0aCBgYHNvcnRfa2V5cz1UcnVlYGAgY29ycmVjdGx5IGRyb3BzCiAgbm9uLXN0cmluZyBrZXlz
IHdoZW4gdGhlIGRpY3Rpb25hcnkgY29udGFpbnMgYSBtaXggb2Ygc3RyaW5nIGFuZAogIG5vbi1z
dHJpbmcga2V5cy4gIFByZXZpb3VzbHkgdGhlIHNvcnQgcmFuIGJlZm9yZSB0aGUgZmlsdGVyIGFu
ZCByYWlzZWQKICA6ZXhjOmBUeXBlRXJyb3JgLgoKLSBnaC0xNDA3Mjk6IEZpeCBhIHBpY2tsaW5n
IGVycm9yIGluIHRoZSBgYGNQcm9maWxlYGAgbW9kdWxlIHdoZW4gcHJvZmlsaW5nCiAgYSBzY3Jp
cHQgdGhhdCB1c2VzIDpjbGFzczpgbXVsdGlwcm9jZXNzaW5nLlByb2Nlc3NgIHdpdGggdGhlIGBg
c3Bhd25gYCBhbmQKICBgYGZvcmtzZXJ2ZXJgYCBzdGFydCBtZXRob2RzLgoKLSBnaC0xMTMzMjk6
IEZpeCA6ZXhjOmBPU0Vycm9yYCBiZWluZyByYWlzZWQgd2hlbiB0cnlpbmcgdG8gcnVuIGRvY3Rl
c3RzIG9uCiAgYSBjbGFzcyBvYmplY3RzIGluIHRoZSBSRVBMLiBQYXRjaCBieSBTdGVuIFdlc3Nl
bC4KCi0gZ2gtMTAyOTY3OiBBIGJ1ZyBpbiA6ZnVuYzpgIWRvY3Rlc3QuX1Nwb29mT3V0LnRydW5j
YXRlYCB3YXMgY2F1c2luZyBOb25lCiAgdG8gYmUgcGFzc2VkIHRvIDpmdW5jOmAhU3RyaW5nSU8u
c2Vla2Agd2hlbiBubyBzaXplIHdhcyBnaXZlbi4gQSBzaW1wbGUKICBmaXggc2tpcHMgdGhlIHNl
ZWsgY2FsbCB3aGVuIG5vIHNpemUgaXMgZ2l2ZW4gc28gdGhlIGJ1ZmZlciBjYW4gYmUKICB0cnVu
Y2F0ZWQgZnJvbSB0aGUgY3VycmVudCBwb3NpdGlvbi4KCi0gZ2gtODIwMzk6IDptZXRoOmBodHRw
LmNvb2tpZWphci5GaWxlQ29va2llSmFyLmxvYWRgIG5vdyBjaGVja3MgdGhlIGZpcnN0LAogIGZv
cm1hdCBzaWduYXR1cmUgbGluZSBpbiBhIGNhc2UtaW5zZW5zaXRpdmUgbWFubmVyLiBQYXRjaCBi
eSBBc2hsZXkKICBIYXJ2ZXkuCgotIGdoLTcwNzU4OiBDcmVhdGluZyBhIG5ldyA6bW9kOmB0dXJ0
bGVgIHNjcmVlbiBhZnRlciB0aGUgcHJldmlvdXMgb25lIHdhcwogIGNsb3NlZCBubyBsb25nZXIg
cmFpc2VzIGBgdHVydGxlLlRlcm1pbmF0b3JgYCBvbiB0aGUgZmlyc3QgdHVydGxlIGNvbW1hbmQu
CgotIGJwby00NDAxMjogVGhlIGBgZXhwbG9kZWRgYCBhdHRyaWJ1dGUgb2YgOmNsYXNzOmBpcGFk
ZHJlc3MuSVB2NkFkZHJlc3NgCiAgYW5kIDpjbGFzczpgaXBhZGRyZXNzLklQdjZJbnRlcmZhY2Vg
IG5vdyBzdXBwb3J0cyBhZGRyZXNzZXMgd2l0aCBhIHNjb3BlCiAgSUQgKGxpbmstbG9jYWwgYWRk
cmVzc2VzKS4gUHJldmlvdXNseSB0aGUgZm9ybWVyIHJhaXNlZAogIDpleGM6YH5pcGFkZHJlc3Mu
QWRkcmVzc1ZhbHVlRXJyb3JgIGFuZCB0aGUgbGF0dGVyIG9taXR0ZWQgdGhlIHNjb3BlIElELgoK
LSBnaC04Mzg2OTogRml4IDptb2Q6YHRhcmZpbGVgIHJlYWRpbmcgYW4gYXJjaGl2ZSB3aXRoIGEg
R05VIHNwYXJzZSAxLjAKICBtZW1iZXIgd2hvc2Ugc2l6ZSBpcyBzZXQgaW4gdGhlIHBheCBleHRl
bmRlZCBoZWFkZXIuIFRoZSBvZmZzZXQgb2YgdGhlCiAgbmV4dCBoZWFkZXIgd2FzIGNvbXB1dGVk
IGZyb20gdGhlIG9mZnNldCBvZiB0aGUgZGF0YSwgd2hpY2ggaXMgYWxyZWFkeQogIHBhc3QgdGhl
IHNwYXJzZSBtYXAsIGFuZCBmcm9tIHRoZSBzaXplIG9mIHRoZSBtZW1iZXIsIHdoaWNoIGNhbiBi
ZSB0aGUKICBhcHBhcmVudCBzaXplIG9mIHRoZSBzcGFyc2UgZmlsZS4gQWxsIGZvbGxvd2luZyBt
ZW1iZXJzIHdlcmUgdW5yZWFjaGFibGUuCgotIGdoLTYxMzY2OiA6Y2xhc3M6YGh0dHAuY29va2ll
amFyLk1vemlsbGFDb29raWVKYXJgIG5vdyByZWFkcyBzZXNzaW9uCiAgY29va2llcyB3cml0dGVu
IGJ5IGN1cmwgYW5kIFdnZXQsIHdoaWNoIHVzZSBgYDBgYCBpbiB0aGUgZXhwaXJhdGlvbiB0aW1l
CiAgZmllbGQuIENvbnRyaWJ1dGVkIGJ5IErDqXLDqW1pZSBEZXRyZXkuCgpEb2N1bWVudGF0aW9u
Ci0tLS0tLS0tLS0tLS0KCi0gZ2gtNTc0OTE6IFJlZHVjZSB0aGUgZGVwdGggb2YgdGhlIHRhYmxl
IG9mIGNvbnRlbnRzIGluIHRoZSBFUFVCCiAgZG9jdW1lbnRhdGlvbiBmcm9tIHRocmVlIGxldmVs
cyB0byB0d28sIG1ha2luZyBpdCBtdWNoIHNob3J0ZXIgYW5kIGVhc2llcgogIHRvIG5hdmlnYXRl
IGluIGUtYm9vayByZWFkZXJzLgoKVGVzdHMKLS0tLS0KCi0gZ2gtMTU4MDUxOiBUaGUgaU9TIHRl
c3RiZWQgaGFzIGJlZW4gdXBkYXRlZCBmb3IgY29tcGF0aWJpbHR5IHdpdGggWGNvZGUKICAyNy4K
Ci0gZ2gtMTU1NDExOiBGaXggOmZ1bmM6YCF0ZXN0LnN1cHBvcnQuc3ViVGVzdHNgIGZvciBhc3lu
Y2hyb25vdXMgdGVzdAogIG1ldGhvZHMuICBUaGV5IHdlcmUgd3JhcHBlZCBpbiBhIHN5bmNocm9u
b3VzIGZ1bmN0aW9uLCB3aGljaCBkaXNjYXJkZWQgdGhlCiAgY29yb3V0aW5lIHdpdGhvdXQgYXdh
aXRpbmcgaXQsIHNvIHRoZSB0ZXN0IHNpbGVudGx5IGRpZCBub3QgcnVuIGF0IGFsbC4KCi0gZ2gt
MTMyNTgxOiBUaGUgbGlzdCBvZiB0ZXN0cyB3aGljaCBhbHRlcmVkIHRoZSBleGVjdXRpb24gZW52
aXJvbm1lbnQgbm93CiAgaW5jbHVkZXMgdGhlIHJlYXNvbnMgd2h5IHRoZSBlbnZpcm9ubWVudCB3
YXMgY29uc2lkZXJlZCBhbHRlcmVkLCBmb3IKICBleGFtcGxlIGFuIHVucmFpc2FibGUgZXhjZXB0
aW9uIG9yIGEgbW9kaWZpZWQgOmRhdGE6YHN5cy5wYXRoYC4gIFRoZSBmaW5hbAogIHJlc3VsdCBu
byBsb25nZXIgcmVwZWF0cyB0aGUgc2FtZSBzdGF0ZSB0d2ljZSAobGlrZSBgYEVOViBDSEFOR0VE
IHRoZW4gRU5WCiAgQ0hBTkdFRGBgKS4KCi0gZ2gtMTQyNDE0OiBJc29sYXRlIHJlbG9hZGluZyBt
b2R1bGVzIGluIHRlc3RfaW50ZXJwcmV0ZXJzIHRvIGF2b2lkIGhhdmluZwogIGJyb2tlbiByZWZl
cmVuY2VzLgoKQnVpbGQKLS0tLS0KCi0gZ2gtMTU4MDEwOiBVcGRhdGUgQW5kcm9pZCBhbmQgaU9T
IGJ1aWxkIHNjcmlwdHMgdG8gdXNlIE9wZW5TU0wgMy41LjkuCgotIGdoLTE1NzU0OTogVXNlIGBg
c3lzY29uZihfU0NfUEFHRVNJWkUpYGAgaW5zdGVhZCBvZiBgYGdldHBhZ2VzaXplKClgYCBpbgog
IGBgcmVtb3RlX2RlYnVnLmhgYCBzbyBgYF9yZW1vdGVfZGVidWdnaW5nYGAgYnVpbGRzIG9uIERh
cndpbiB3aXRoCiAgYGAtV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uYGAuCgot
IGdoLTE1NzE0MjogRml4IHRoZSBsaW5rIG9mIGBgUHJvZ3JhbXMvX2ZyZWV6ZV9tb2R1bGVgYCB3
aGVuIGV4dGVuc2lvbgogIG1vZHVsZXMgYXJlIGJ1aWx0IGluIChgYE1PRFVMRV9CVUlMRFRZUEU9
c3RhdGljYGApIGFuZCB0aGUgdGVzdCBtb2R1bGVzCiAgYXJlIGVuYWJsZWQ6IGBgTW9kdWxlcy9n
ZXRwYXRoX25vb3AuY2BgIG5vdyBkZWZpbmVzCiAgYGBfUHlfR2V0X0dldHBhdGhfQ29kZU9iamVj
dCgpYGAsIHdoaWNoIGBgX3Rlc3RpbnRlcm5hbGNhcGlgYCB1c2VzLgoKLSBnaC0xNTU5MTE6IEZp
eCBjdXJzZXMgZGV0ZWN0aW9uIHdoZW4gYSBjdXJzZXMgbGlicmFyeSBpcyBhbHJlYWR5IGluCiAg
YGBMSUJTYGAuIFBhdGNoIGJ5IFNoYW1pbCBBYmR1bGFldi4KCi0gZ2gtMTU2MTE1OiBpT1Mgc2lt
dWxhdG9yIGJ1aWxkcyBhcmUgbm93IGNvbmZpZ3VyZWQgd2l0aAogIGBgLW1pb3Mtc2ltdWxhdG9y
LXZlcnNpb24tbWluYGAgaW5zdGVhZCBvZiB0aGUgZGV2aWNlJ3MKICBgYC1taW9zLXZlcnNpb24t
bWluYGAuIFRoZSBkZXZpY2UgZmxhZyBtYWRlIHRoZSBsaW5rZXIgcmVqZWN0IGxpYnJhcmllcwog
IHJlc29sdmVkIGZyb20gdGhlIHNpbXVsYXRvciBTREssIHNvIGxpYnJhcnkgZGV0ZWN0aW9uIHNp
bGVudGx5IGZhaWxlZC4KCi0gZ2gtMTUyMDIzOiBVcGRhdGUgQW5kcm9pZCBidWlsZHMgdG8gU1FM
aXRlIDMuNTMuNC4gQWRkaXRpb25hbGx5LCBlbmFibGUKICB0aGUgYGBtZWRpYW4oKWBgIGFuZCBg
YHBlcmNlbnRpbGUoKWBgIGZ1bmN0aW9ucy4KCi0gZ2gtMTQ0Njc5OiBXaGVuIGJ1aWxkaW5nIHdp
dGggVmlzdWFsIFN0dWRpbyAyMDI2IChWZXJzaW9uIDE4KSwgdXNlCiAgUGxhdGZvcm1Ub29sU2V0
IHYxNDUgYnkgZGVmYXVsdC4gUGF0Y2ggYnkgQ2hyaXMgRWlibC4KCldpbmRvd3MKLS0tLS0tLQoK
LSBnaC0xNTgwMTA6IFVwZGF0ZWQgV2luZG93cyBidWlsZHMgdG8gdXNlIE9wZW5TU0wgMy41Ljku
CgotIGdoLTE1NzM2ODogRml4IHRydW5jYXRlZCA6ZGF0YTpgc3lzLnZlcnNpb25gIGluIHRoZSBj
YXNlIG9mIGNsYW5nLWNsCiAgdmVyc2lvbnMgMjIgb3IgbmV3ZXIgb24gV2luZG93cy4gQWxzbyBm
aXhlcyB0aGUgV2luZG93cyBvbiBBcm0gY2FzZSwgd2hlcmUKICB0aGUgTWljcm9zb2Z0IGNvbXBp
bGVyIHdhcyByZXBvcnRlZCBpbnN0ZWFkIG9mIGNsYW5nLiBQYXRjaCBieSBDaHJpcyBFaWJsLgoK
LSBnaC03MjM1MzogUmVhZGluZyBmcm9tIHRoZSBjb25zb2xlIG9uIFdpbmRvd3Mgbm93IGNvbnRp
bnVlcyBpZiB0aGUgcmVhZAogIHdhcyBjYW5jZWxsZWQgYnkgQ3RybCtDLCBidXQgdGhlIDpjb25z
dDpgfnNpZ25hbC5TSUdJTlRgIGhhbmRsZXIgZGlkIG5vdAogIHJhaXNlIGFuIGV4Y2VwdGlvbi4g
IFByZXZpb3VzbHkgdGhlIHJlYWQgZW5kZWQgYXMgaWYgYXQgZW5kIG9mIGZpbGUuCgotIGdoLTg2
NDI3OiBGaXggdGhlIGVuY29kaW5nIG9mIHRoZSBzdGFuZGFyZCBzdHJlYW1zIGluIHRoZSBsZWdh
Y3kgV2luZG93cwogIHN0ZGlvIG1vZGUgKDplbnZ2YXI6YFBZVEhPTkxFR0FDWVdJTkRPV1NTVERJ
T2ApLiAgSXQgaXMgbm93IHRoZSBjb2RlIHBhZ2UKICBvZiB0aGUgY29uc29sZSwgYXMgaW4gUHl0
aG9uIDMuNywgbm90IHRoZSBBTlNJIGNvZGUgcGFnZS4KCi0gZ2gtODc1ODc6IDpmdW5jOmBvcy5k
ZXZpY2VfZW5jb2RpbmdgIG9uIFdpbmRvd3Mgbm93IHJldHVybnMgdGhlIGNvZGUgcGFnZQogIG9m
IGFueSBjb25zb2xlIGZpbGUgZGVzY3JpcHRvciwgbm90IG9ubHkgMCwgMSBhbmQgMiwgYW5kIHJl
dHVybnMgYGBOb25lYGAKICBmb3Igb3RoZXIgY2hhcmFjdGVyIGRldmljZXMgbGlrZSBgYE5VTGBg
LiAgVGhlIFVURi04IGNvZGUgcGFnZSBpcyBub3cKICByZXBvcnRlZCBhcyBgYCJ1dGYtOCJgYCBp
bnN0ZWFkIG9mIGBgImNwNjUwMDEiYGAuCgptYWNPUwotLS0tLQoKLSBnaC0xNTgwMTA6IFVwZGF0
ZSBtYWNPUyBpbnN0YWxsZXIgdG8gdXNlIE9wZW5TU0wgMy41LjkuCgpJRExFCi0tLS0KCi0gZ2gt
MTU4MDY3OiBGaXggdGhlIElETEUgRmlsZSBPcGVuIGRpYWxvZyBsaXN0aW5nIHRleHQgZmlsZXMg
YmVmb3JlIFB5dGhvbgogIGZpbGVzIHdoZW4gb3BlbmVkIGZyb20gdGhlIFNoZWxsIG9yIGFuIE91
dHB1dCB3aW5kb3cuCgotIGdoLTU2NTk2OiBNYWtlIElETEUga2V5Ym9hcmQgc2hvcnRjdXRzIHdp
dGggYXNjaWkgbGV0dGVycyB3b3JrIHdoZW4gQ2FwcwogIExvY2sgaXMgb24gZXZlbiB3aGVuIG9u
bHkgb25lIG9mIHRoZSB1cHBlciBhbmQgbG93ZXJjYXNlIHZlcnNpb25zIGFyZQogIGRlZmluZWQu
CgotIGdoLTc1NTEyOiBPdXRwdXQgZnJvbSBhIHRocmVhZCBwcmludGVkIGluIHRoZSBJRExFIFNo
ZWxsIHdoaWxlIGEgc3RhdGVtZW50CiAgaXMgYmVpbmcgZW50ZXJlZCBubyBsb25nZXIgdGFrZXMg
b3ZlciB0aGUgcHJvbXB0IG9mIHRoZSBzdGF0ZW1lbnQuCgotIGdoLTY0MDA3OiBJRExFIG5vIGxv
bmdlciBhcHBsaWVzIHN5bnRheCBjb2xvcmluZyB0byB0aGUgdGV4dCBlbnRlcmVkIGZvcgogIDpm
dW5jOmBpbnB1dGAgaW4gdGhlIFNoZWxsLgoKLSBnaC04NTU2MDogRml4IElETEUgZmFpbGluZyB0
byBmaW5kIHRoZSBvcGVuaW5nIHBhcmVudGhlc2lzIHdoZW4gYQogIGNvbnRpbnVhdGlvbiBsaW5l
IGluc2lkZSB0aGUgcGFyZW50aGVzZXMgc3RhcnRzIHdpdGggYGBlbHNlYGAgb2YgYQogIGNvbmRp
dGlvbmFsIGV4cHJlc3Npb24gb3Igd2l0aCBgYHlpZWxkYGAuCgotIGdoLTc1NDg3OiBGaXggc2F2
aW5nIGEgdHJ1bmNhdGVkIG51bWJlciB3aGVuIGFuIGludGVnZXIgZW50cnkgaW4gdGhlIElETEUK
ICBTZXR0aW5ncyBkaWFsb2cgaXMgYmxhbmtlZCB3aXRoIHRoZSBCYWNrc3BhY2Uga2V5LgoKLSBn
aC03NDExMjogQ3RybC1DIGluIHRoZSBJRExFIFNoZWxsIG5vdyBpbnRlcnJ1cHRzIGJsb2NraW5n
IGNhbGxzIHN1Y2ggYXMKICA6ZnVuYzpgdGltZS5zbGVlcGAgYW5kIDptZXRoOmBzb2NrZXQucmVj
diA8c29ja2V0LnNvY2tldC5yZWN2PmAuCgotIGdoLTE1MTQ3MTogQ29sb3JpemUgdGhlIHNvZnQg
a2V5d29yZCBgYHR5cGVgYCBpbiBJRExFLgoKLSBnaC0xMDMwODk6IElETEUgbm8gbG9uZ2VyIGhh
bmdzIHdoZW4gb3BlbmluZyBhIGZpbGUgd2l0aCB2ZXJ5IGxvbmcgbGluZXMuCiAgT25seSB0aGUg
Zmlyc3QgMiwwMDAgY2hhcmFjdGVycyBvZiBhIGxpbmUgYXJlIGNvbG9yaXplZC4KCi0gZ2gtODk1
NDQ6IEZpeCBJRExFIGhhbmdpbmcgYWZ0ZXIgUmVzdGFydCBTaGVsbCB3aGlsZSByZWNlaXZpbmcg
YSBsYXJnZQogIG91dHB1dCBmcm9tIHRoZSB1c2VyIHByb2Nlc3MuCgotIGdoLTcwMzMxOiBJRExF
IG5vIGxvbmdlciBmYWlscyB0byBzdGFydCB3aXRoIGBgcHl0aG9uIC1tIGlkbGVsaWJgYCwgYW5k
CiAgaXRzIHVzZXIgcHJvY2VzcyBubyBsb25nZXIgZmFpbHMgdG8gc3RhcnQsIHdoZW4gdGhlIGN1
cnJlbnQgZGlyZWN0b3J5CiAgY29udGFpbnMgdXNlciBmaWxlcyB3aXRoIHRoZSBzYW1lIG5hbWVz
IGFzIHN0YW5kYXJkIGxpYnJhcnkgbW9kdWxlcyB0aGF0CiAgSURMRSBpbXBvcnRzLCBzdWNoIGFz
IGBgcmFuZG9tLnB5YGAgb3IgYGB0a2ludGVyLnB5YGAuCgotIGdoLTkzMDE2OiBGaXggcGFyc2lu
ZyBvZiBjb21tYW5kIGxpbmUgYXJndW1lbnRzIGluIHRoZSBJRExFICJSdW4uLi4KICBDdXN0b21p
emVkIiBkaWFsb2cgb24gV2luZG93czogYmFja3NsYXNoZXMgYXJlIG5vIGxvbmdlciB0cmVhdGVk
IGFzIGVzY2FwZQogIGNoYXJhY3RlcnMuIEZpeCBhbHNvIGRpc3BsYXkgb2YgdGhlIHByZXZpb3Vz
IGFyZ3VtZW50cyBpbiB0aGUgZGlhbG9nLgoKLSBnaC01OTU2ODogRml4ICJTYXZlIEFzIiBhbmQg
Ik9wZW4iIGRpYWxvZ3MgaW4gSURMRSBmb3IgYSBmaWxlIHdob3NlIG5hbWUKICBzdGFydHMgd2l0
aCBgYH5gYCBvbiBXaW5kb3dzIGFuZCBYMTEgd2l0aCBUY2wvVGsgb2xkZXIgdGhhbiA5LgoKLSBn
aC02OTAwNDogVGhlIERlYnVnZ2VyIGl0ZW0gb2YgdGhlIElETEUgRGVidWcgbWVudSBpcyBub3cg
ZGlzYWJsZWQgd2hpbGUKICB1c2VyIGNvZGUgcnVucywgbGlrZSBTdGFjayBWaWV3ZXIuCgotIGdo
LTY5MzY1OiBUaGUgSURMRSBzZWFyY2ggZGlhbG9ncyBub3cgc2hvdyBhIHJlZ3VsYXIgZXhwcmVz
c2lvbiBlcnJvcgogIGJlbG93IHRoZSBlbnRyeSBpbnN0ZWFkIG9mIGluIGEgbWVzc2FnZSBib3gu
CgotIGdoLTkzOTY2OiBUaGUgaGlnaGxpZ2h0aW5nIG9mIGEgc3ludGF4IGVycm9yIGluIHRoZSBJ
RExFIFNoZWxsIGlzIG5vdwogIHJlbW92ZWQgd2hlbiB0aGUgbmV4dCBzdGF0ZW1lbnQgaXMgZW50
ZXJlZCwgbm90IG9ubHkgd2hlbiB0aGUgbmV4dCBzeW50YXgKICBlcnJvciBvY2N1cnMuCgotIGdo
LTEwNTY4OTogRml4IGNhbGx0aXBzLCBwYXJlbnRoZXNpcyBtYXRjaGluZyBhbmQgYXV0by1pbmRl
bnQgaW4gdGhlIElETEUKICBTaGVsbCBhZnRlciBvdXRwdXQgY29udGFpbmluZyB1bmJhbGFuY2Vk
IHF1b3RlcyBvciBwYXJlbnRoZXNlcy4KCi0gZ2gtNjA0MDI6IEluIElETEUsIFRhYiBpbiBhIHN0
cmluZyB0aGF0IGlzIG5vdCB0aGUgc3RhcnQgb2YgYSBmaWxlIG5hbWUKICBpbnNlcnRzIGEgdGFi
IGluc3RlYWQgb2Ygb3BlbmluZyB0aGUgY29tcGxldGlvbiBsaXN0LgoKLSBnaC02ODQ1MzogRml4
IHJ1bm5pbmcgSURMRSB3aXRoIHRoZSAtcyBvcHRpb24gdG9nZXRoZXIgd2l0aCAtYywgLXIgb3Ig
LToKICB0aGUgY29tbWFuZCBvciBzY3JpcHQgbm93IHJ1bnMgYWZ0ZXIgdGhlIHN0YXJ0dXAgZmls
ZSwgd2l0aG91dCBhbiBlcnJvcgogIGRpYWxvZyBhbmQgd2l0aG91dCByZXN0YXJ0aW5nIHRoZSBz
aGVsbC4KCi0gZ2gtNzUyMzQ6IEZpeCBlZGl0aW5nIGhlbHAgc291cmNlcyBhbmQga2V5IGJpbmRp
bmdzIGluIHRoZSBJRExFIFNldHRpbmdzCiAgZGlhbG9nIGFmdGVyIHNlbGVjdGluZyB0aGVtIHdp
dGggdGhlIGtleWJvYXJkLgoKLSBnaC02OTkxOTogSURMRSBub3cgcmVwb3J0cyBhbnkgZXhjZXB0
aW9uIHJhaXNlZCBieSBjb21waWxpbmcgdGhlIHNvdXJjZSwKICBzdWNoIGFzIDpleGM6YE1lbW9y
eUVycm9yYCBmb3IgdG9vIGRlZXBseSBuZXN0ZWQgc291cmNlLCBpbnN0ZWFkIG9mCiAgaGFuZ2lu
ZyB0aGUgU2hlbGwuCgotIGdoLTkxMzk4OiBSZW1vdmUgdGhlIGJvcmRlciBhcm91bmQgdGhlIElE
TEUgU2hlbGwgc2lkZWJhciwgd2hpY2ggd2FzIGRyYXduCiAgaW4gdGhlIHdpbmRvdyBiYWNrZ3Jv
dW5kIGNvbG9yIGFuZCBzdG9vZCBvdXQgd2l0aCBkYXJrIHRoZW1lcy4KCi0gZ2gtNzExMzY6IEZp
eCBhIGhhbmcgb2YgdGhlIElETEUgU2hlbGwgd2hlbiBjb2RlIHJ1biB1bmRlciB0aGUgZGVidWdn
ZXIKICByYWlzZXMgOmV4YzpgS2V5Ym9hcmRJbnRlcnJ1cHRgLgoKLSBnaC0xNTQ1MTE6IENvbnNv
bGlkYXRlIElETEUncyBtb3VzZSB3aGVlbCBoYW5kbGluZyBpbiBgYGlkbGVsaWIudXRpbGBgLgog
IGBgd2hlZWxfZXZlbnRgYCBtb3ZlcyB0aGVyZSBmcm9tIGBgaWRsZWxpYi50cmVlYGAgYW5kIGpv
aW5zCiAgYGB4MTFfYnV0dG9uc2BgLCB3aGljaCB0ZWxscyB3aGV0aGVyIFRrIHJlcG9ydHMgd2hl
ZWwgcm90YXRpb25zIHRvIGEKICB3aWRnZXQgYXMgYGA8QnV0dG9uLTQ+YGAvYGA8QnV0dG9uLTU+
YGAgZXZlbnRzLCBhbmQgYGBiaW5kX3doZWVsYGAsIHdoaWNoCiAgYmluZHMgd2hpY2hldmVyIGV2
ZW50cyBUayBzZW5kcy4KCi0gZ2gtMTU2ODk2OiBTdG9wIGRlbGV0aW5nIHRraW50ZXIgc3VibW9k
dWxlcyB3aGVuIGlkbGVsaWIucnVuIGlzIGltcG9ydGVkLgoKLSBnaC0xNTM0ODA6IEZpeCBJRExF
IGZhaWxpbmcgdG8gc3RhcnQgd2hlbiBvcGVuaW5nIGEgZmlsZSB3aGljaCBkb2VzIG5vdAogIGV4
aXN0IHlldC4gRml4IGEgdHJhY2ViYWNrIHdoZW4gYSBmaWxlIG9wZW4gaW4gdGhlIElETEUgZWRp
dG9yIGlzIGRlbGV0ZWQKICBieSBhbm90aGVyIHByb2dyYW07IElETEUgbm93IGFza3Mgd2hldGhl
ciB0byBjbG9zZSB0aGUgd2luZG93LCBzYXZlIHRoZQogIGZpbGUgZWxzZXdoZXJlLCBvciBpZ25v
cmUgaXQuCgotIGdoLTU1NjQ2OiBGaXggSURMRSBjcmFzaCBhdCBzdGFydHVwIHdoZW4gdGhlIHVz
ZXIgY29uZmlndXJhdGlvbiBjb250YWlucwogIGFuIGludmFsaWQga2V5IGJpbmRpbmcsIHN1Y2gg
YXMgYGA8QWx0LUtleS11cD5gYCBpbnN0ZWFkIG9mCiAgYGA8QWx0LUtleS1VcD5gYC4gIFRoZSBp
bnZhbGlkIGJpbmRpbmcgaXMgbm93IGlnbm9yZWQgd2l0aCBhIHdhcm5pbmcuCgotIGdoLTY2MTcy
OiBJRExFIG5vIGxvbmdlciBmYWlscyB0byBzdGFydCB3aGVuIGEgdXNlciBjb25maWd1cmF0aW9u
IGZpbGUgaXMKICBjb3JydXB0LiBUaGUgdW5wYXJzYWJsZSBmaWxlIGlzIHJlbmFtZWQgd2l0aCBh
ICIuYmFkIiBzdWZmaXgsIGRlZmF1bHQKICBzZXR0aW5ncyBhcmUgdXNlZCBpbnN0ZWFkLCBhbmQg
YSB3YXJuaW5nIGxpc3RzIHRoZSBhZmZlY3RlZCBmaWxlcy4KCi0gZ2gtOTAzMDQ6IFByZXZlbnQg
SURMRSBmcm9tIGZhaWxpbmcgdG8gc3RhcnQgd2hlbiBhIGZvbnQgcmVwb3J0cyBhIHplcm8KICB3
aWR0aCBmb3IgdGhlIGBgJzAnYGAgY2hhcmFjdGVyLiAgU3VjaCBhIGJyb2tlbiBmb250IGNhdXNl
ZCBhCiAgOmV4YzpgWmVyb0RpdmlzaW9uRXJyb3JgOyB0aGUgZWRpdG9yIG5vdyBmYWxscyBiYWNr
IHRvIHRoZSBjb25maWd1cmVkCiAgd2lkdGguCgotIGdoLTEzNTUxMTogRml4IGRpc3BsYXkgb2Yg
OmV4YzpgTmFtZUVycm9yYCBhbmQgOmV4YzpgQXR0cmlidXRlRXJyb3JgIHdpdGgKICBtdWx0aS1s
aW5lIG1lc3NhZ2UuCgpUb29scy9EZW1vcwotLS0tLS0tLS0tLQoKLSBnaC0xNTg0NTE6IGBgcHl0
aG9uLWdkYi5weWBgIGlzIG5vdyBhYmxlIHRvIGZvcm1hdCBhbiBpbnZhbGlkIFVuaWNvZGUKICBz
dHJpbmc6IHJlbmRlciBpbnZhbGlkIGNoYXJhY3RlcnMgYXMgYGBcVWhoaGhoaGhoYGAgaW5zdGVh
ZCBvZiByYWlzaW5nIGFuCiAgZXhjZXB0aW9uLiBQYXRjaCBieSBWaWN0b3IgU3Rpbm5lci4KCi0g
Z2gtMTEzMzE4OiBGaXggQXJndW1lbnQgQ2xpbmljIGZvciBgYEBnZXR0ZXJgYCBhbmQgYGBAc2V0
dGVyYGAgaW4gYQogIHByZXByb2Nlc3NvciBjb25kaXRpb25hbCBibG9jay4gSXQgZmFpbGVkIHdp
dGggYW4gaW50ZXJuYWwgZXJyb3IuIEFyZ3VtZW50CiAgQ2xpbmljIG5vdyBhbHNvIHJlamVjdHMg
dGhlIGFjY2Vzc29ycyBvZiB0aGUgc2FtZSBhdHRyaWJ1dGUgd2l0aCBkaWZmZXJlbnQKICBDIGJh
c2VuYW1lcywgYW5kIHRoZSBzYW1lIGFjY2Vzc29yIGRlZmluZWQgdHdpY2UsIHdoaWNoIHNpbGVu
dGx5IGdlbmVyYXRlZAogIGludmFsaWQgb3IgZHVwbGljYXRlZCBlbnRyaWVzIG9mIDpjOnR5cGU6
YFB5R2V0U2V0RGVmYC4KCi0gZ2gtNjQ1MDI6IEZpeCBBcmd1bWVudCBDbGluaWMgc3VwcG9ydCBv
ZiBwYXJhbWV0ZXJzIHdpdGggYSBkZWZhdWx0IHZhbHVlCiAgdXNlZCB0b2dldGhlciB3aXRoIG9w
dGlvbmFsIGdyb3Vwcy4gU3VjaCBwYXJhbWV0ZXJzIHdlcmUgYWx3YXlzIHJlcXVpcmVkCiAgaW4g
dGhlIGdlbmVyYXRlZCBwYXJzaW5nIGNvZGUuCgpDIEFQSQotLS0tLQoKLSBnaC0xNTY5OTU6IE9u
IEZyZWUgVGhyZWFkaW5nLCBgYF9QeUJ5dGVzX1Jlc2l6ZSgmb2JqLCAxKWBgIG5vIGxvbmdlcgog
IHJldHVybnMgYSBzaW5nbGUgYnl0ZSBzaW5nbGV0b24gaWYgdGhlIGN1cnJlbnQgdGhyZWFkIGlz
IGRpZmZlcmVudCB0aGFuCiAgdGhlIHRocmVhZCB3aGljaCBjcmVhdGVkIHRoZSBvYmplY3QuIFBh
dGNoIGJ5IFN0YW4gVWxicnljaC4KCi0gZ2gtMTU2MTAxOiBEb24ndCBzZXQgdGhlIHJlc3VsdCBp
biBlcnJvciBpbiA6YzpmdW5jOmBQeUxvbmdfQXNJbnQzMmAsCiAgOmM6ZnVuYzpgUHlMb25nX0Fz
VUludDMyYCwgOmM6ZnVuYzpgUHlMb25nX0FzSW50NjRgIGFuZAogIDpjOmZ1bmM6YFB5TG9uZ19B
c1VJbnQ2NGAuIExlYXZlIHRoZSByZXN1bHQgdW5jaGFuZ2VkIGluIHRoaXMgY2FzZS4gUGF0Y2gK
ICBieSBWaWN0b3IgU3Rpbm5lci4KCi0gZ2gtMTMxNzQwOiBPbiB0aGUgZnJlZS10aHJlYWRlZCBi
dWlsZCwKICA6YzpmdW5jOmBQeVVuc3RhYmxlX0dDX1Zpc2l0T2JqZWN0c2Agbm93IGFsc28gdmlz
aXRzIGZyb3plbiBvYmplY3RzCiAgKG9iamVjdHMgbW92ZWQgdG8gdGhlIHBlcm1hbmVudCBnZW5l
cmF0aW9uIGJ5IDpmdW5jOmBnYy5mcmVlemVgKSwgbWF0Y2hpbmcKICB0aGUgYmVoYXZpb3Igb2Yg
dGhlIGRlZmF1bHQgYnVpbGQuCg==

--===============5485900956335931169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3/python3-tests: FILELIST: removed "/usr/lib/python3.14/idlelib/idle_test/__pycache__/test_zzdummy_user.cpython-314.pyc /usr/lib/python3.14/idlelib/idle_test/test_zzdummy_user.py", added "/usr/lib/python3.14/test/test_free_threading/__pycache__/test_context.cpython-314.pyc /usr/lib/python3.14/test/test_free_threading/test_context.py /usr/lib/python3.14/test/test_capi/test_slice.py /usr/lib/python3.14/test/test_capi/__pycache__/test_slice.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3 (sysroot):
  /usr/lib/python3.14/idlelib/idle_test/__pycache__/test_zzdummy_user.cpython-314.pyc was removed
  /usr/lib/python3.14/idlelib/idle_test/test_zzdummy_user.py was removed
Changes to packages/x86_64-linux/python3-native (sysroot):
  /usr/lib/python3.14/idlelib/idle_test/test_zzdummy_user.py was removed

--===============5485900956335931169==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-upgrade-3.14.7-3.14.8.patch"

RnJvbSA3N2I4M2RlNGFjMGUwNWNlNDkyMmY1NjNiNGQzMzljZDFjNWJkY2E0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBPY3QgMjAyNiAwNTo0MzozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjM6IHVwZ3JhZGUgMy4xNC43IC0+IDMuMTQuOAoKV2hhdCdzIE5ldyBpbiBQeXRob24gMy4x
NC44IGZpbmFsPwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgoqUmVsZWFzZSBk
YXRlOiAyMDI2LTA5LTMwKgoKU2VjdXJpdHkKLS0tLS0tLS0KCi0gZ2gtMTU4NDQ2OiBGaXggYSBj
cmFzaCBvciBpbmNvcnJlY3Qgb3V0cHV0IHRoYXQgY291bGQgb2NjdXIgd2hlbgogIGZvcm1hdHRp
bmcgYSA6Y2xhc3M6YGZsb2F0YCBvciA6Y2xhc3M6YGNvbXBsZXhgIHdpdGggYSBwcmVjaXNpb24g
Y2xvc2UgdG8KICB0aGUgcGxhdGZvcm0ncyBgYElOVF9NQVhgYC4gIDpjOmZ1bmM6YFB5T1NfZG91
YmxlX3RvX3N0cmluZ2Agbm93IHJhaXNlcwogIDpleGM6YFZhbHVlRXJyb3JgIGZvciBhbnkgcHJl
Y2lzaW9uIG9mIHRoYXQgbWFnbml0dWRlLCByZWdhcmRsZXNzIG9mCiAgcHJlc2VudGF0aW9uIHR5
cGUgb3IgdmFsdWUsIGFzIHRoZSBmb3JtYXQgc3RyaW5nIHBhcnNlcnMgYWxyZWFkeSBkaWQgZm9y
CiAgcHJlY2lzaW9ucyBhYm92ZSBgYElOVF9NQVhgYC4KCi0gZ2gtMTU2NzkzOiA6bW9kOmBhc3lu
Y2lvYDogOm1ldGg6YGxvb3Auc3RhcnRfdGxzKCkKICA8YXN5bmNpby5sb29wLnN0YXJ0X3Rscz5g
IGFuZCA6bWV0aDpgbG9vcC5jcmVhdGVfY29ubmVjdGlvbigpCiAgPGFzeW5jaW8ubG9vcC5jcmVh
dGVfY29ubmVjdGlvbj5gIG5vdyB2YWxpZGF0ZSB0aGUgKnNlcnZlcl9ob3N0bmFtZSoKICBhcmd1
bWVudCBpZiBhbiA6Y2xhc3M6YHNzbC5TU0xDb250ZXh0YCBpcyBwYXNzZWQgd2l0aCAqY2hlY2tf
aG9zdG5hbWUqIHNldAogIHRvIGBgVHJ1ZWBgLgoKLSBnaC0xNTY3OTM6IDptZXRoOmBzc2wuU1NM
Q29udGV4dC53cmFwX2Jpb2Agbm93IHZhbGlkYXRlcyBpdHMKICAqc2VydmVyX3NpZGUqLCAqc2Vy
dmVyX2hvc3RuYW1lKiBhbmQgKnNlc3Npb24qIGFyZ3VtZW50cyBzaW1pbGFyIHRvCiAgOm1ldGg6
YHNzbC5TU0xDb250ZXh0LndyYXBfc29ja2V0YC4KCiAgSW4gcGFydGljdWxhciwgYSBjb250ZXh0
IHdpdGggOmF0dHI6YH5zc2wuU1NMQ29udGV4dC5jaGVja19ob3N0bmFtZWAKICBlbmFibGVkIGFu
ZCBubyAqc2VydmVyX2hvc3RuYW1lKiBwYXNzZWQgdG8gOm1ldGg6YCF3cmFwX2Jpb2Agbm93IHJh
aXNlcwogIDpleGM6YFZhbHVlRXJyb3JgIGluc3RlYWQgb2YgY29tcGxldGluZyBhIGhhbmRzaGFr
ZSB0aGF0IHZlcmlmaWVkIHRoZQogIGNlcnRpZmljYXRlIGNoYWluIHdpdGhvdXQgdmVyaWZ5aW5n
IHRoZSBwZWVyJ3MgaWRlbnRpdHksIHdpdGggbm8KICBpbmRpY2F0aW9uIHRoYXQgdGhlIGNoZWNr
IGhhZCBiZWVuIHNraXBwZWQuCgotIGdoLTE1Nzk1MzogVXBkYXRlIGJ1bmRsZWQgYGxpYmV4cGF0
IDxodHRwczovL2xpYmV4cGF0LmdpdGh1Yi5pby8+YF8gdG8KICB2ZXJzaW9uIDIuOC41LgoKLSBn
aC0xNTYwMDI6IEJvdW5kIHRoZSBhbW91bnQgb2YgZGF0YSA6bW9kOmB6aXBmaWxlYCBkZWNvbXBy
ZXNzZXMgcGVyIHJlYWQKICBmb3IgbWVtYmVycyBjb21wcmVzc2VkIHdpdGggYnppcDIsIExaTUEs
IG9yIFpzdGFuZGFyZCwgbWF0Y2hpbmcgdGhlCiAgZXhpc3RpbmcgbGltaXQgZm9yIGRlZmxhdGUu
IEEgc21hbGwgYXJjaGl2ZSBtZW1iZXIgY291bGQgcHJldmlvdXNseSBleHBhbmQKICBpbnRvIGFu
IHVuYm91bmRlZCBhbGxvY2F0aW9uIGV2ZW4gd2hlbiByZWFkIGluIHNtYWxsIGNodW5rcy4KCi0g
Z2gtMTU1OTk5OiBGaXggdGhlIDptb2Q6YHRhcmZpbGVgIGBgdGFyYGAgYW5kIGBgZGF0YWBgIGV4
dHJhY3Rpb24gZmlsdGVycwogIGNyZWF0aW5nIGRpcmVjdG9yaWVzIG91dHNpZGUgdGhlIGRlc3Rp
bmF0aW9uIGZvciBtZW1iZXJzIHdob3NlIG5hbWUgbGVhdmVzCiAgdGhlIGRlc3RpbmF0aW9uIGFu
ZCByZXR1cm5zIHRvIGl0LCBzdWNoIGFzIGBgLi4vZXZpbC8uLi9kZXN0L3N1Yi9maWxlYGAuCiAg
VGhlIGNvbnRhaW5tZW50IGNoZWNrIHVzZWQgdGhlIHJlc29sdmVkIHBhdGgsIGJ1dCBpbnRlcm1l
ZGlhdGUgZGlyZWN0b3JpZXMKICB3ZXJlIGNyZWF0ZWQgZnJvbSB0aGUgbmFtZSBhcyBnaXZlbi4K
Ci0gZ2gtMTU2MjkzOiBGaXggYSBjcmFzaCBpbiA6bW9kOmBzc2xgIHdoZW4gYW4KICA6YXR0cjpg
fnNzbC5TU0xDb250ZXh0LnNuaV9jYWxsYmFja2Agc3dpdGNoZXMgYSBjb25uZWN0aW9uIHRvIGFu
b3RoZXIKICA6Y2xhc3M6YH5zc2wuU1NMQ29udGV4dGAgYW5kIHRoZSBjb250ZXh0IHRoYXQgY2Fy
cmllcyB0aGUgY2FsbGJhY2sgaXMgbm8KICBsb25nZXIgcmVmZXJlbmNlZCBieSB0aGUgYXBwbGlj
YXRpb24uIFNlcnZlcnMgdGhhdCBrZWVwIHRoZWlyCiAgYGBzbmlfY2FsbGJhY2tgYCBjb250ZXh0
IGFsaXZlICh0aGUgdXN1YWwgY2FzZSB3aGVuIGl0IHdyYXBzIHRoZSBsaXN0ZW5pbmcKICBzb2Nr
ZXQgb3IgaXMgc3RvcmVkIG9uIHRoZSBzZXJ2ZXIgb2JqZWN0KSB3ZXJlIG5vdCBhZmZlY3RlZC4g
VGhpcwogIGFkZHJlc3NlcyA6Y3ZlOmAyMDI2LTE5NDQ1YC4KCi0gZ2gtMTU1MjkyOiBDaGFuZ2Ug
dGhlIDptb2Q6YHN0cmluZ3ByZXBgIG1vZHVsZSBhbmQgOm1vZDpgZW5jb2RpbmdzLmlkbmFgCiAg
Y29kZWMgdG8gbm90IGNvbnNpZGVyIFVuaWNvZGUgY29kZXBvaW50IGF0dHJpYnV0ZXMgYmV5b25k
IHRob3NlIGRlZmluZWQgaW4KICA6cmZjOmAzNDU0YC4KCi0gZ2gtMTU1Njk0OiBGaXggOmN2ZTpg
MjAyNi0xNTgwNmAgYnkgc2NvcGluZwogIDpjbGFzczpgfnVybGxpYi5yZXF1ZXN0LkhUVFBQYXNz
d29yZE1ncmAgY3JlZGVudGlhbHMgdG8gdGhlIFVSTCBzY2hlbWUsCiAgcHJldmVudGluZyBjcmVk
ZW50aWFscyBzdG9yZWQgZm9yIGFuIEhUVFBTIFVSTCBmcm9tIGJlaW5nIHVzZWQgZm9yIGEKICBt
YXRjaGluZyBIVFRQIFVSTCwgd2hpbGUgVVJJcyB3aXRob3V0IGEgc2NoZW1lIGNvbnRpbnVlIHRv
IG1hdGNoIGFueQogIHNjaGVtZS4KCkNvcmUgYW5kIEJ1aWx0aW5zCi0tLS0tLS0tLS0tLS0tLS0t
CgotIGdoLTE1ODM2NDogRml4IGNyYXNoIHdoZW4gOmZ1bmM6YHN5cy5fY3VycmVudF9mcmFtZXNg
IG9yCiAgOmZ1bmM6YHN5cy5fY3VycmVudF9leGNlcHRpb25zYCBpcyBjYWxsZWQgd2hpbGUgYW5v
dGhlciBpbnRlcnByZXRlciBpcwogIHJ1bm5pbmcuCgotIGdoLTE1ODI1NDogUmV2ZXJzZSBpdGVy
YXRvcnMgb3ZlciBhIDpjbGFzczpgZGljdGAgYW5kIGl0cyB2aWV3cyBub3cgcmFpc2UKICA6ZXhj
OmBSdW50aW1lRXJyb3JgIGlmIHRoZSBkaWN0aW9uYXJ5J3Mga2V5cyBjaGFuZ2UgZHVyaW5nIGl0
ZXJhdGlvbiwgbGlrZQogIGZvcndhcmQgaXRlcmF0b3JzLCBpbnN0ZWFkIG9mIHlpZWxkaW5nIGVu
dHJpZXMgZm9yIHRoZSBuZXcga2V5cy4KCi0gZ2gtMTU3ODM4OiBNZXJnZSBiaWFzZWQgcmVmZXJl
bmNlIGNvdW50cyBvbiBiZWhhbGYgb2YgdGhyZWFkcyB0aGF0IGFyZQogIGRldGFjaGVkIGluc3Rl
YWQgb2Ygd2FpdGluZyBmb3IgdGhlbSB0byBhdHRhY2ggYWdhaW4sIGluIHRoZSBmcmVlLXRocmVh
ZGVkCiAgYnVpbGQuCgotIGdoLTE1NzM3ODogRml4IGBgU3ludGF4RXJyb3Iub2Zmc2V0YGAgYW5k
IGBgU3ludGF4RXJyb3IuZW5kX29mZnNldGBgIGZvcgogIHRoZSAiTm9uLVVURi04IGNvZGUgc3Rh
cnRpbmcgd2l0aCAuLi4iIGVycm9yIHdoZW4gYSBub24tQVNDSUkgY2hhcmFjdGVyCiAgcHJlY2Vk
ZXMgdGhlIGludmFsaWQgYnl0ZSBvbiB0aGUgc2FtZSBsaW5lLiBQYXRjaCBieSBTaGFtaWwgQWJk
dWxhZXYuCgotIGdoLTE1Njc2MjogRml4IHVuZGVmaW5lZCBiZWhhdmlvdXIgaW4gOmNsYXNzOmBv
cGVyYXRvci5tZXRob2RjYWxsZXJgOiBpdHMKICA6YzptZW1iZXI6YH5QeVR5cGVPYmplY3QudHBf
Y2xlYXJgIHNsb3QgZnVuY3Rpb24gcmV0dXJuZWQgYGB2b2lkYGAgaW5zdGVhZAogIG9mIGBgaW50
YGAsIHNvIHRoZSBnYXJiYWdlIGNvbGxlY3RvciBjYWxsZWQgaXQgdGhyb3VnaCBhbiBpbmNvbXBh
dGlibGUKICBmdW5jdGlvbiB0eXBlLiBQYXRjaGVkIGJ5IFNoYW1pbCBBYmR1bGFldi4KCi0gZ2gt
MTU3Mzc3OiBGaXggOmZ1bmM6YGdjLmdldF9jb3VudGAgb24gdGhlIGZyZWUtdGhyZWFkZWQgYnVp
bGQgcmVzZXR0aW5nCiAgdGhlIHRocmVhZC1sb2NhbCBhbGxvY2F0aW9uIGNvdW50ZXIgdGhhdCBz
Y2hlZHVsZXMgYXV0b21hdGljIGdhcmJhZ2UKICBjb2xsZWN0aW9uLiBBIHRocmVhZCB0aGF0IGNh
bGxlZCBpdCB3aGlsZSBhbGxvY2F0aW5nIGNvdWxkIHByZXZlbnQgY3ljbGljCiAgZ2FyYmFnZSBm
cm9tIGV2ZXIgYmVpbmcgY29sbGVjdGVkLgoKLSBnaC0xNTYwOTE6IEZpeCBhIGNyYXNoIHdoZW4g
Y29tcGlsaW5nIGRlZXBseSBuZXN0ZWQgaW5saW5lZCBsaXN0LCBzZXQsIG9yCiAgZGljdCBjb21w
cmVoZW5zaW9ucy4gQSA6ZXhjOmBTeW50YXhFcnJvcmAgaXMgbm93IHJhaXNlZCB3aGVuIHRoZSBu
ZXN0aW5nCiAgZXhjZWVkcyB0aGUgY29tcGlsZXIncyBzdGF0aWMgYmxvY2sgbGltaXQuCgotIGdo
LTE1Njg5NDogRml4IHRoZSBwb3NpdGlvbiBvZiBzeW50YXggZXJyb3JzIHdoaWNoIGNvdmVyIGEg
cmFuZ2UgaWYgdGhlCiAgbGluZSBjb250YWlucyBub24tQVNDSUkgY2hhcmFjdGVycyBiZWZvcmUg
dGhlIGVycm9yLgoKLSBnaC0xNTU1MjU6IEZpeCBxdWFkcmF0aWMtdGltZSB0b2tlbml6YXRpb24g
b2YgbW9kdWxlcyBjb250YWluaW5nIG1hbnkKICBmLXN0cmluZ3Mgb3IgdC1zdHJpbmdzLgoKLSBn
aC0xNTY2ODk6IEZpeCBhbiBvdXQtb2YtYm91bmRzIHJlYWQgaW4gOmZ1bmM6YGNvbXBpbGVgIGFu
ZAogIDpmdW5jOmBhc3QucGFyc2VgIHdoZW4gYW4gQVNUIG9iamVjdCBpcyBwYXNzZWQgd2l0aCBg
YG1vZGU9J2Z1bmNfdHlwZSdgYC4KCi0gZ2gtMTU2MzcxOiBGaXggbWlzc2luZyBgYFB5UmVmVHJh
Y2VyX0RFU1RST1lgYCBldmVudHMgZm9yIHRyYXNoY2FuCiAgZGVmZXJyZWQgb2JqZWN0cy4gUGF0
Y2ggYnkgRG9uZ2hlZSBOYS4KCi0gZ2gtMTU2MTE0OiBGaXggYSBjcmFzaCBpbiB0aGUgcGVyZiB0
cmFtcG9saW5lIHdoZW4gYSBjb2RlIG9iamVjdCBoYXMgYQogIG5hbWUgb3IgZmlsZW5hbWUgdGhh
dCBjYW5ub3QgYmUgZW5jb2QKCltDaGFuZ2Vsb2cgdHJ1bmNhdGVkIGFzIGl0IGV4Y2VlZHMgNTAw
MCBjaGFyYWN0ZXJzOwp0aGUgZnVsbCBjaGFuZ2Vsb2cgY2FuIGJlIGZvdW5kIGluIGFuIGF0dGFj
aG1lbnQgdG8gdGhlIEFVSCBlbWFpbF0KLS0tCiAuLi5zaGViYW5nLW92ZXJmbG93LW9uLXB5dGhv
bi1jb25maWcucHkucGF0Y2ggfCAgNiArLS0KIC4uLmUtc3RkaW4tSS1PLWVycm9ycy1zYW1lLXdh
eS1hcy1tYXN0ZS5wYXRjaCB8ICAyICstCiAuLi4tdXNlLXByZWZpeC12YWx1ZS1mcm9tLWJ1aWxk
LWNvbmZpZ3UucGF0Y2ggfCAgMiArLQogLi4uLXFlbXUtd3JhcHBlci13aGVuLWdhdGhlcmluZy1w
cm9maWxlLnBhdGNoIHwgIDYgKy0tCiAuLi5lc3Rfc3lzY29uZmlnLWZvci1wb3NpeF91c2VyLXB1
cmVsaWIucGF0Y2ggfCAgMiArLQogLi4uMTQ2MjA3LUFkZC1zdXBwb3J0LWZvci1PcGVuU1NMLTQu
MC4wLnBhdGNoIHwgNDIgKysrKysrKysrLS0tLS0tLS0tLQogLi4uLzAwMDEtcHJlZmVyLXZhbGlk
LWVudHJ5cG9pbnRzLnBhdGNoICAgICAgIHwgIDIgKy0KIC4uLmcucHktdXNlLXBsYXRsaWJkaXIt
YWxzby1mb3ItcHVyZWxpYi5wYXRjaCB8ICAyICstCiAuLi5sZS5weS1jb3JyZWN0LXRoZS10ZXN0
LW91dHB1dC1mb3JtYXQucGF0Y2ggfCAgMiArLQogLi4uVXBkYXRlLV9zc2wuX1NTTFNvY2tldC1m
b3ItT3BlblNTTC00LnBhdGNoIHwgMjIgKysrKystLS0tLQogLi4udXRkb3duLXRlc3QtaW4tdGVz
dF9zc2wudGVzdF9nb3RfZW9mLnBhdGNoIHwgIDYgKy0tCiAuLi4vcHl0aG9uL3B5dGhvbjMvbWFr
ZXJhY2UucGF0Y2ggICAgICAgICAgICAgfCAgNiArLS0KIC4uLi9weXRob24vcHl0aG9uMy92YWxp
ZC1kaXN0cy5wYXRjaCAgICAgICAgICB8ICAyICstCiAuLi4ve3B5dGhvbjNfMy4xNC43LmJiID0+
IHB5dGhvbjNfMy4xNC44LmJifSAgfCAgMiArLQogMTQgZmlsZXMgY2hhbmdlZCwgNTIgaW5zZXJ0
aW9ucygrKSwgNTIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi97cHl0aG9uM18zLjE0LjcuYmIgPT4gcHl0aG9uM18zLjE0LjguYmJ9ICg5OSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtQXZvaWQt
c2hlYmFuZy1vdmVyZmxvdy1vbi1weXRob24tY29uZmlnLnB5LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtQXZvaWQtc2hlYmFuZy1vdmVyZmxvdy1vbi1w
eXRob24tY29uZmlnLnB5LnBhdGNoCmluZGV4IDdhNjA1MzgzNjQuLjJlNTE5ZGY5ZTEgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLUF2b2lkLXNo
ZWJhbmctb3ZlcmZsb3ctb24tcHl0aG9uLWNvbmZpZy5weS5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1Bdm9pZC1zaGViYW5nLW92ZXJmbG93LW9u
LXB5dGhvbi1jb25maWcucHkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDNmMmRmMGUxZmNl
OGM3NDI1OTk4ZGFkZTAwZDA4NGYxYjEwMWE5ODIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGYwYTdlYTNhMjI3MjZjNjdjOTQzMmQwYTIwOTVjZjFmMmVmYjhkNDEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBQYXVsbyBOZXZlcyA8cHRzbmV2ZXNAZ21haWwuY29tPgogRGF0
ZTogVHVlLCA3IEp1biAyMDIyIDE2OjE2OjQxICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIEF2b2lk
IHNoZWJhbmcgb3ZlcmZsb3cgb24gcHl0aG9uLWNvbmZpZy5weQpAQCAtMTYsMTAgKzE2LDEwIEBA
IFVwc3RyZWFtLVN0YXR1czogRGVuaWVkIFtkaXN0cmlidXRpb25dCiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUucHJlLmluIGIvTWFrZWZp
bGUucHJlLmluCi1pbmRleCBlOTQ2MDE4Li4zNDVlZDI5IDEwMDY0NAoraW5kZXggYjQzYmFmMS4u
MThhNDZkZSAxMDA2NDQKIC0tLSBhL01ha2VmaWxlLnByZS5pbgogKysrIGIvTWFrZWZpbGUucHJl
LmluCi1AQCAtMjgzNSw2ICsyODM1LDggQEAgcHl0aG9uLWNvbmZpZzogJChzcmNkaXIpL01pc2Mv
cHl0aG9uLWNvbmZpZy5pbiBNaXNjL3B5dGhvbi1jb25maWcuc2gKK0BAIC0yODM2LDYgKzI4MzYs
OCBAQCBweXRob24tY29uZmlnOiAkKHNyY2RpcikvTWlzYy9weXRob24tY29uZmlnLmluIE1pc2Mv
cHl0aG9uLWNvbmZpZy5zaAogIAlAICMgU3Vic3RpdHV0aW9uIGhhcHBlbnMgaGVyZSwgYXMgdGhl
IGNvbXBsZXRlbHktZXhwYW5kZWQgQklORElSCiAgCUAgIyBpcyBub3QgYXZhaWxhYmxlIGluIGNv
bmZpZ3VyZQogIAlzZWQgLWUgInMsQEVYRU5BTUVALCQoRVhFTkFNRSksIiA8ICQoc3JjZGlyKS9N
aXNjL3B5dGhvbi1jb25maWcuaW4gPnB5dGhvbi1jb25maWcucHkKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLUxpYi1wdHkucHktaGFuZGxlLXN0
ZGluLUktTy1lcnJvcnMtc2FtZS13YXktYXMtbWFzdGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1MaWItcHR5LnB5LWhhbmRsZS1zdGRpbi1JLU8tZXJy
b3JzLXNhbWUtd2F5LWFzLW1hc3RlLnBhdGNoCmluZGV4IDUzMmFkZmU2OWEuLjBlM2M3ZDVmNDkg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLUxp
Yi1wdHkucHktaGFuZGxlLXN0ZGluLUktTy1lcnJvcnMtc2FtZS13YXktYXMtbWFzdGUucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtTGliLXB0eS5w
eS1oYW5kbGUtc3RkaW4tSS1PLWVycm9ycy1zYW1lLXdheS1hcy1tYXN0ZS5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gOWNkNDQ0MjkyMTUzNTJlYjI3NTNlMGZkOGUyNWZlZjI0ZjcxNDAwNiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjY4YjM3Y2E4YTg3NmIwMTIzYTI5MTM2NmIz
NDFlZWFjZjFkYjcxZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBUaHUsIDE2IFNlcCAyMDIxIDE2OjM1
OjM3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIExpYi9wdHkucHk6IGhhbmRsZSBzdGRpbiBJL08g
ZXJyb3JzIHNhbWUgd2F5IGFzIG1hc3RlciBJL08KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLUxpYi1zeXNjb25maWcucHktdXNlLXByZWZpeC12
YWx1ZS1mcm9tLWJ1aWxkLWNvbmZpZ3UucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMvMDAwMS1MaWItc3lzY29uZmlnLnB5LXVzZS1wcmVmaXgtdmFsdWUtZnJvbS1i
dWlsZC1jb25maWd1LnBhdGNoCmluZGV4IDYwMzkxZTcyNmIuLjljYjI1OTE3ZDkgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLUxpYi1zeXNjb25m
aWcucHktdXNlLXByZWZpeC12YWx1ZS1mcm9tLWJ1aWxkLWNvbmZpZ3UucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtTGliLXN5c2NvbmZpZy5weS11
c2UtcHJlZml4LXZhbHVlLWZyb20tYnVpbGQtY29uZmlndS5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gYjVhYWQ2YTliNmM1YWRkN2E4NTg2MWFlZDhhYTAzMGMxYWQzZDUyZiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2JlNmYxYjQ3OGMyNDcyODIyZDE3YTQwY2E0MmFkMWZjMTlm
YzZmNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBGcmksIDE3IE5vdiAyMDIzIDE0OjI2OjMyICswMTAw
CiBTdWJqZWN0OiBbUEFUQ0hdIExpYi9zeXNjb25maWcucHk6IHVzZSBwcmVmaXggdmFsdWUgZnJv
bSBidWlsZCBjb25maWd1cmF0aW9uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMvMDAwMS1NYWtlZmlsZS5wcmUtdXNlLXFlbXUtd3JhcHBlci13aGVuLWdh
dGhlcmluZy1wcm9maWxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLzAwMDEtTWFrZWZpbGUucHJlLXVzZS1xZW11LXdyYXBwZXItd2hlbi1nYXRoZXJpbmctcHJv
ZmlsZS5wYXRjaAppbmRleCBjN2YxNGNhZDFlLi4wYjlkM2QxM2Q3IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1NYWtlZmlsZS5wcmUtdXNlLXFl
bXUtd3JhcHBlci13aGVuLWdhdGhlcmluZy1wcm9maWxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLU1ha2VmaWxlLnByZS11c2UtcWVtdS13cmFw
cGVyLXdoZW4tZ2F0aGVyaW5nLXByb2ZpbGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ2
Zjc3ZTNhOTM0NjE2ZDFmNmMwODNiNzE0NGM1MGEzMmUwOGI3MGEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDY0OWIwOWM4MGI1OTU0YTU0ZDJlZDJlYmY2YzliZjYxZTk4ZGIyMjUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5h
dmluQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMzAgSmFuIDIwMTkgMTI6NDE6MDQgKzAxMDAKIFN1
YmplY3Q6IFtQQVRDSF0gTWFrZWZpbGUucHJlOiB1c2UgcWVtdSB3cmFwcGVyIHdoZW4gZ2F0aGVy
aW5nIHByb2ZpbGUgZGF0YQpAQCAtMTUsMTAgKzE1LDEwIEBAIFNpZ25lZC1vZmYtYnk6IFRyZXZv
ciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUucHJlLmlu
IGIvTWFrZWZpbGUucHJlLmluCi1pbmRleCA1MjZkNTAwLi5hN2U1MzZkIDEwMDY0NAoraW5kZXgg
N2NhNjVkZC4uZGU3MmIwMyAxMDA2NDQKIC0tLSBhL01ha2VmaWxlLnByZS5pbgogKysrIGIvTWFr
ZWZpbGUucHJlLmluCi1AQCAtODYxLDggKzg2MSw3IEBAIHByb2ZpbGUtcnVuLXN0YW1wOgorQEAg
LTg2Miw4ICs4NjIsNyBAQCBwcm9maWxlLXJ1bi1zdGFtcDoKICAJIyBlbmFibGVkLgogIAkkKE1B
S0UpIHByb2ZpbGUtZ2VuLXN0YW1wCiAgCSMgTmV4dCwgcnVuIHRoZSBwcm9maWxlIHRhc2sgdG8g
Z2VuZXJhdGUgdGhlIHByb2ZpbGUgaW5mb3JtYXRpb24uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1VcGRhdGUtdGVzdF9zeXNjb25maWctZm9y
LXBvc2l4X3VzZXItcHVyZWxpYi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy8wMDAxLVVwZGF0ZS10ZXN0X3N5c2NvbmZpZy1mb3ItcG9zaXhfdXNlci1wdXJlbGli
LnBhdGNoCmluZGV4IDU1MDliNzQ3NWEuLjk2OTExMzFkN2EgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLVVwZGF0ZS10ZXN0X3N5c2NvbmZpZy1m
b3ItcG9zaXhfdXNlci1wdXJlbGliLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy8wMDAxLVVwZGF0ZS10ZXN0X3N5c2NvbmZpZy1mb3ItcG9zaXhfdXNlci1w
dXJlbGliLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjNjA4Y2I0YjNjOGMzMWYxYWEyNWFk
MTI2NGZmNTg3MzNmYjk5NzY5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0M2Y1M2I3
NTdmMjIwYzU5MmQ1YTc3ZDIyOGQwODcwOTlhOTJlYTdhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogV2VudGFvIFpoYW5nIDx3ZW50YW8uemhhbmdAd2luZHJpdmVyLmNvbT4KIERhdGU6
IE1vbiwgMjAgTWFyIDIwMjMgMTM6Mzk6NTIgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gVXBkYXRl
IHRlc3Rfc3lzY29uZmlnIGZvciBwb3NpeF91c2VyIHB1cmVsaWIKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLWdoLTE0NjIwNy1BZGQtc3VwcG9y
dC1mb3ItT3BlblNTTC00LjAuMC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy8wMDAxLWdoLTE0NjIwNy1BZGQtc3VwcG9ydC1mb3ItT3BlblNTTC00LjAuMC5wYXRj
aAppbmRleCBiZWY2MDQ0MzU4Li5kZWQyMTJkODIyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1naC0xNDYyMDctQWRkLXN1cHBvcnQtZm9yLU9w
ZW5TU0wtNC4wLjAucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLzAwMDEtZ2gtMTQ2MjA3LUFkZC1zdXBwb3J0LWZvci1PcGVuU1NMLTQuMC4wLnBhdGNoCkBA
IC0xLDcgKzEsMTAgQEAKLUZyb20gMzM2NGU3ZTYyZmEyNGQwZTE5MTMzZmIwZjkwYjFjMjRlZjEx
MTBjNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZmI0NjQ2NzNkYmFlY2ZiMWFmYTZl
NTQ3NzZiOWUwZWFmZjc5MWU0YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFZpY3Rv
ciBTdGlubmVyIDx2c3Rpbm5lckBweXRob24ub3JnPgogRGF0ZTogV2VkLCAyNSBNYXIgMjAyNiAw
Nzo0NDo0NyArMDEwMAogU3ViamVjdDogW1BBVENIXSBnaC0xNDYyMDc6IEFkZCBzdXBwb3J0IGZv
ciBPcGVuU1NMIDQuMC4wIGFscGhhMSAoIzE0NjIxNykKK01JTUUtVmVyc2lvbjogMS4wCitDb250
ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5j
b2Rpbmc6IDhiaXQKIAogT3BlblNTTCA0LjAuMCBhbHBoYTEgcmVtb3ZlZCB0aGVzZSBmdW5jdGlv
bnM6CiAKQEAgLTI5LDEwICszMiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBKYWlwYXVsIENoZWVybmFt
IDxqYWlwYXVsLmNoZWVybmFtQGVzdC50ZWNoPgogIDQgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0
aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9MaWIvdGVzdC90ZXN0X3Nz
bC5weSBiL0xpYi90ZXN0L3Rlc3Rfc3NsLnB5Ci1pbmRleCBkYzc5NWM2YmQ4YS4uNjEzNTU5Mjcy
OTYgMTAwNjQ0CitpbmRleCBkMTQ4NmE0Li5mNTA4ODhkIDEwMDY0NAogLS0tIGEvTGliL3Rlc3Qv
dGVzdF9zc2wucHkKICsrKyBiL0xpYi90ZXN0L3Rlc3Rfc3NsLnB5Ci1AQCAtMzk1LDcgKzM5NSw3
IEBAIGRlZiB0ZXN0X2NvbnN0YW50cyhzZWxmKToKK0BAIC00MjQsNyArNDI0LDcgQEAgY2xhc3Mg
QmFzaWNTb2NrZXRUZXN0cyh1bml0dGVzdC5UZXN0Q2FzZSk6CiAgICAgICAgICBzc2wuT1BfTk9f
Q09NUFJFU1NJT04KICAgICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwoc3NsLkhBU19TTkksIFRydWUp
CiAgICAgICAgICBzZWxmLmFzc2VydEVxdWFsKHNzbC5IQVNfRUNESCwgVHJ1ZSkKQEAgLTQxLDcg
KzQ0LDcgQEAgaW5kZXggZGM3OTVjNmJkOGEuLjYxMzU1OTI3Mjk2IDEwMDY0NAogICAgICAgICAg
c2VsZi5hc3NlcnRFcXVhbChzc2wuSEFTX1RMU3YxXzMsIFRydWUpCiAgICAgICAgICBzc2wuT1Bf
Tk9fU1NMdjIKICAgICAgICAgIHNzbC5PUF9OT19TU0x2MwotQEAgLTU4NiwxMSArNTg2LDExIEBA
IGRlZiB0ZXN0X29wZW5zc2xfdmVyc2lvbihzZWxmKToKK0BAIC02MTUsMTEgKzYxNSwxMSBAQCBj
bGFzcyBCYXNpY1NvY2tldFRlc3RzKHVuaXR0ZXN0LlRlc3RDYXNlKToKICAgICAgICAgICMgU29t
ZSBzYW5pdHkgY2hlY2tzIGZvbGxvdwogICAgICAgICAgIyA+PSAxLjEuMQogICAgICAgICAgc2Vs
Zi5hc3NlcnRHcmVhdGVyRXF1YWwobiwgMHgxMDEwMTAwMCkKQEAgLTU2LDcgKzU5LDcgQEAgaW5k
ZXggZGM3OTVjNmJkOGEuLjYxMzU1OTI3Mjk2IDEwMDY0NAogICAgICAgICAgc2VsZi5hc3NlcnRH
cmVhdGVyRXF1YWwobWlub3IsIDApCiAgICAgICAgICBzZWxmLmFzc2VydExlc3MobWlub3IsIDI1
NikKICAgICAgICAgIHNlbGYuYXNzZXJ0R3JlYXRlckVxdWFsKGZpeCwgMCkKLUBAIC02NTYsMTIg
KzY1NiwxNCBAQCBkZWYgdGVzdF9vcGVuc3NsMTExX2RlcHJlY2F0aW9ucyhzZWxmKToKK0BAIC02
ODUsMTIgKzY4NSwxNCBAQCBjbGFzcyBCYXNpY1NvY2tldFRlc3RzKHVuaXR0ZXN0LlRlc3RDYXNl
KToKICAgICAgICAgICAgICBzc2wuT1BfTk9fVExTdjFfMiwKICAgICAgICAgICAgICBzc2wuT1Bf
Tk9fVExTdjFfMwogICAgICAgICAgXQpAQCAtNzcsNyArODAsNyBAQCBpbmRleCBkYzc5NWM2YmQ4
YS4uNjEzNTU5MjcyOTYgMTAwNjQ0CiAgICAgICAgICB2ZXJzaW9ucyA9IFsKICAgICAgICAgICAg
ICBzc2wuVExTVmVyc2lvbi5TU0x2MywKICAgICAgICAgICAgICBzc2wuVExTVmVyc2lvbi5UTFN2
MSwKLUBAIC0xMjA1LDYgKzEyMDcsNyBAQCBkZWYgdGVzdF9taW5fbWF4X3ZlcnNpb24oc2VsZik6
CitAQCAtMTE4NCw2ICsxMTg2LDcgQEAgY2xhc3MgQ29udGV4dFRlc3RzKHVuaXR0ZXN0LlRlc3RD
YXNlKToKICAgICAgICAgICAgICAgICAgc3NsLlRMU1ZlcnNpb24uVExTdjEsCiAgICAgICAgICAg
ICAgICAgIHNzbC5UTFNWZXJzaW9uLlRMU3YxXzEsCiAgICAgICAgICAgICAgICAgIHNzbC5UTFNW
ZXJzaW9uLlRMU3YxXzIsCkBAIC04NSw3ICs4OCw3IEBAIGluZGV4IGRjNzk1YzZiZDhhLi42MTM1
NTkyNzI5NiAxMDA2NDQKICAgICAgICAgICAgICAgICAgc3NsLlRMU1ZlcnNpb24uU1NMdjMsCiAg
ICAgICAgICAgICAgfQogICAgICAgICAgKQotQEAgLTEyMTgsNyArMTIyMSw3IEBAIGRlZiB0ZXN0
X21pbl9tYXhfdmVyc2lvbihzZWxmKToKK0BAIC0xMTk3LDcgKzEyMDAsNyBAQCBjbGFzcyBDb250
ZXh0VGVzdHModW5pdHRlc3QuVGVzdENhc2UpOgogICAgICAgICAgd2l0aCBzZWxmLmFzc2VydFJh
aXNlcyhWYWx1ZUVycm9yKToKICAgICAgICAgICAgICBjdHgubWluaW11bV92ZXJzaW9uID0gNDIK
ICAKQEAgLTk0LDcgKzk3LDcgQEAgaW5kZXggZGM3OTVjNmJkOGEuLjYxMzU1OTI3Mjk2IDEwMDY0
NAogICAgICAgICAgICAgIGN0eCA9IHNzbC5TU0xDb250ZXh0KHNzbC5QUk9UT0NPTF9UTFN2MV8x
KQogIAogICAgICAgICAgICAgIHNlbGYuYXNzZXJ0SW4oCi1AQCAtMTY3NSwyMyArMTY3OCwyNCBA
QCBkZWYgdGVzdF9fY3JlYXRlX3N0ZGxpYl9jb250ZXh0KHNlbGYpOgorQEAgLTE3NDksMjMgKzE3
NTIsMjQgQEAgY2xhc3MgQ29udGV4dFRlc3RzKHVuaXR0ZXN0LlRlc3RDYXNlKToKICAgICAgICAg
IHNlbGYuYXNzZXJ0RmFsc2UoY3R4LmNoZWNrX2hvc3RuYW1lKQogICAgICAgICAgc2VsZi5fYXNz
ZXJ0X2NvbnRleHRfb3B0aW9ucyhjdHgpCiAgCkBAIC0xMzAsNyArMTMzLDcgQEAgaW5kZXggZGM3
OTVjNmJkOGEuLjYxMzU1OTI3Mjk2IDEwMDY0NAogIAogICAgICAgICAgY3R4ID0gc3NsLl9jcmVh
dGVfc3RkbGliX2NvbnRleHQocHVycG9zZT1zc2wuUHVycG9zZS5DTElFTlRfQVVUSCkKICAgICAg
ICAgIHNlbGYuYXNzZXJ0RXF1YWwoY3R4LnByb3RvY29sLCBzc2wuUFJPVE9DT0xfVExTX1NFUlZF
UikKLUBAIC0zNjU0LDEwICszNjU4LDEwIEBAIGRlZiB0ZXN0X3Byb3RvY29sX3Rsc3YxXzIoc2Vs
Zik6CitAQCAtMzg2MywxMCArMzg2NywxMCBAQCBjbGFzcyBUaHJlYWRlZFRlc3RzKHVuaXR0ZXN0
LlRlc3RDYXNlKToKICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbGllbnRfb3B0aW9ucz1z
c2wuT1BfTk9fVExTdjFfMikKICAKICAgICAgICAgIHRyeV9wcm90b2NvbF9jb21ibyhzc2wuUFJP
VE9DT0xfVExTLCBzc2wuUFJPVE9DT0xfVExTdjFfMiwgJ1RMU3YxLjInKQpAQCAtMTQ0LDEwICsx
NDcsMTAgQEAgaW5kZXggZGM3OTVjNmJkOGEuLjYxMzU1OTI3Mjk2IDEwMDY0NAogICAgICAgICAg
ICAgIHRyeV9wcm90b2NvbF9jb21ibyhzc2wuUFJPVE9DT0xfVExTdjFfMSwgc3NsLlBST1RPQ09M
X1RMU3YxXzIsIEZhbHNlKQogIAogZGlmZiAtLWdpdCBhL01vZHVsZXMvX3NzbC5jIGIvTW9kdWxl
cy9fc3NsLmMKLWluZGV4IGI0NTI5NWI0YzBjLi42Zjc1YWY4NjExMyAxMDA2NDQKK2luZGV4IDkw
YmNiNmYuLmI5OTgzMGUgMTAwNjQ0CiAtLS0gYS9Nb2R1bGVzL19zc2wuYwogKysrIGIvTW9kdWxl
cy9fc3NsLmMKLUBAIC0xNjQsNiArMTY0LDE3IEBAIHN0YXRpYyB2b2lkIF9QeVNTTEZpeEVycm5v
KHZvaWQpIHsKK0BAIC0xMzUsNiArMTM1LDE3IEBAIHN0YXRpYyB2b2lkIF9QeVNTTEZpeEVycm5v
KHZvaWQpIHsKICAjZXJyb3IgVW5zdXBwb3J0ZWQgT3BlblNTTCB2ZXJzaW9uCiAgI2VuZGlmCiAg
CkBAIC0xNjUsNyArMTY4LDcgQEAgaW5kZXggYjQ1Mjk1YjRjMGMuLjZmNzVhZjg2MTEzIDEwMDY0
NAogIC8qIE9wZW5TU0wgQVBJIDEuMS4wKyBkb2VzIG5vdCBpbmNsdWRlIHZlcnNpb24gbWV0aG9k
cyAqLwogICNpZm5kZWYgT1BFTlNTTF9OT19TU0wzX01FVEhPRAogIGV4dGVybiBjb25zdCBTU0xf
TUVUSE9EICpTU0x2M19tZXRob2Qodm9pZCk7Ci1AQCAtMTE1MSw3ICsxMTYyLDcgQEAgX2FzbjFv
YmoycHkoX3NzbG1vZHVsZXN0YXRlICpzdGF0ZSwgY29uc3QgQVNOMV9PQkpFQ1QgKm5hbWUsIGlu
dCBub19uYW1lKQorQEAgLTExMzQsNyArMTE0NSw3IEBAIF9hc24xb2JqMnB5KF9zc2xtb2R1bGVz
dGF0ZSAqc3RhdGUsIGNvbnN0IEFTTjFfT0JKRUNUICpuYW1lLCBpbnQgbm9fbmFtZSkKICAKICBz
dGF0aWMgUHlPYmplY3QgKgogIF9jcmVhdGVfdHVwbGVfZm9yX2F0dHJpYnV0ZShfc3NsbW9kdWxl
c3RhdGUgKnN0YXRlLApAQCAtMTc0LDcgKzE3Nyw3IEBAIGluZGV4IGI0NTI5NWI0YzBjLi42Zjc1
YWY4NjExMyAxMDA2NDQKICB7CiAgICAgIFB5X3NzaXplX3QgYnVmbGVuOwogICAgICBQeU9iamVj
dCAqcHlhdHRyOwotQEAgLTExODAsMTYgKzExOTEsMTYgQEAgX2NyZWF0ZV90dXBsZV9mb3JfYXR0
cmlidXRlKF9zc2xtb2R1bGVzdGF0ZSAqc3RhdGUsCitAQCAtMTE2MywxNiArMTE3NCwxNiBAQCBf
Y3JlYXRlX3R1cGxlX2Zvcl9hdHRyaWJ1dGUoX3NzbG1vZHVsZXN0YXRlICpzdGF0ZSwKICB9CiAg
CiAgc3RhdGljIFB5T2JqZWN0ICoKQEAgLTE5NSw3ICsxOTgsNyBAQCBpbmRleCBiNDUyOTViNGMw
Yy4uNmY3NWFmODYxMTMgMTAwNjQ0CiAgICAgIGludCBpbmRleF9jb3VudGVyOwogICAgICBpbnQg
cmRuX2xldmVsID0gLTE7CiAgICAgIGludCByZXRjb2RlOwotQEAgLTY5NjcsOSArNjk3OCwxNSBA
QCBzc2xtb2R1bGVfaW5pdF9jb25zdGFudHMoUHlPYmplY3QgKm0pCitAQCAtNjUyOSw5ICs2NTQw
LDE1IEBAIHNzbG1vZHVsZV9pbml0X2NvbnN0YW50cyhQeU9iamVjdCAqbSkKICAgICAgQUREX0lO
VF9DT05TVCgiUFJPVE9DT0xfVExTIiwgUFlfU1NMX1ZFUlNJT05fVExTKTsKICAgICAgQUREX0lO
VF9DT05TVCgiUFJPVE9DT0xfVExTX0NMSUVOVCIsIFBZX1NTTF9WRVJTSU9OX1RMU19DTElFTlQp
OwogICAgICBBRERfSU5UX0NPTlNUKCJQUk9UT0NPTF9UTFNfU0VSVkVSIiwgUFlfU1NMX1ZFUlNJ
T05fVExTX1NFUlZFUik7CkBAIC0yMTIsNyArMjE1LDcgQEAgaW5kZXggYjQ1Mjk1YjRjMGMuLjZm
NzVhZjg2MTEzIDEwMDY0NAogICNkZWZpbmUgQUREX09QVElPTihOQU1FLCBWQUxVRSkgaWYgKHNz
bG1vZHVsZV9hZGRfb3B0aW9uKG0sIE5BTUUsIChWQUxVRSkpIDwgMCkgcmV0dXJuIC0xCiAgCiBk
aWZmIC0tZ2l0IGEvTW9kdWxlcy9fc3NsL2NlcnQuYyBiL01vZHVsZXMvX3NzbC9jZXJ0LmMKLWlu
ZGV4IGYyZTdiZTg5NjY4Li4wNjFiMGZiMzE3MSAxMDA2NDQKK2luZGV4IGYyZTdiZTguLjA2MWIw
ZmIgMTAwNjQ0CiAtLS0gYS9Nb2R1bGVzL19zc2wvY2VydC5jCiArKysgYi9Nb2R1bGVzL19zc2wv
Y2VydC5jCiBAQCAtMTI4LDcgKzEyOCw4IEBAIF9zc2xfQ2VydGlmaWNhdGVfZ2V0X2luZm9faW1w
bChQeVNTTENlcnRpZmljYXRlICpzZWxmKQpAQCAtMjI2LDEwICsyMjksMTAgQEAgaW5kZXggZjJl
N2JlODk2NjguLjA2MWIwZmIzMTcxIDEwMDY0NAogICAgICBQeU9iamVjdCAqcmVzOwogICAgICBC
SU8gKmJpb2J1ZjsKIGRpZmYgLS1naXQgYS9Ub29scy9zc2wvbXVsdGlzc2x0ZXN0cy5weSBiL1Rv
b2xzL3NzbC9tdWx0aXNzbHRlc3RzLnB5Ci1pbmRleCAzYjQ1MDdjNjc3MS4uNDgyMDdlNTMzMGYg
MTAwNzU1CitpbmRleCA5OWUyYTNmLi43MDgxMmJjIDEwMDc1NQogLS0tIGEvVG9vbHMvc3NsL211
bHRpc3NsdGVzdHMucHkKICsrKyBiL1Rvb2xzL3NzbC9tdWx0aXNzbHRlc3RzLnB5Ci1AQCAtNDI5
LDkgKzQyOSwxMSBAQCBkZWYgX3Bvc3RfaW5zdGFsbChzZWxmKToKK0BAIC00MjIsOSArNDIyLDEx
IEBAIGNsYXNzIEJ1aWxkT3BlblNTTChBYnN0cmFjdEJ1aWxkZXIpOgogICAgICBkZWYgX3Bvc3Rf
aW5zdGFsbChzZWxmKToKICAgICAgICAgIGlmIHNlbGYudmVyc2lvbi5zdGFydHN3aXRoKCIzLiIp
OgogICAgICAgICAgICAgIHNlbGYuX3Bvc3RfaW5zdGFsbF8zeHgoKQpAQCAtMjQyLDcgKzI0NSw3
IEBAIGluZGV4IDNiNDUwN2M2NzcxLi40ODIwN2U1MzMwZiAxMDA3NTUKICAgICAgICAgICAgICBj
b25maWdfYXJncyArPSAoImVuYWJsZS1maXBzIiwpCiAgICAgICAgICBzdXBlcigpLl9idWlsZF9z
cmMoY29uZmlnX2FyZ3MpCiAgCi1AQCAtNDQ3LDYgKzQ0OSw5IEBAIGRlZiBfcG9zdF9pbnN0YWxs
XzN4eChzZWxmKToKK0BAIC00NDAsNiArNDQyLDkgQEAgY2xhc3MgQnVpbGRPcGVuU1NMKEFic3Ry
YWN0QnVpbGRlcik6CiAgICAgICAgICAgICAgbGliNjQgPSBzZWxmLmxpYl9kaXIgKyAiNjQiCiAg
ICAgICAgICAgICAgb3Muc3ltbGluayhsaWI2NCwgc2VsZi5saWJfZGlyKQogIApAQCAtMjUyLDYg
KzI1NSwzIEBAIGluZGV4IDNiNDUwN2M2NzcxLi40ODIwN2U1MzMwZiAxMDA3NTUKICAgICAgQHBy
b3BlcnR5CiAgICAgIGRlZiBzaG9ydF92ZXJzaW9uKHNlbGYpOgogICAgICAgICAgIiIiU2hvcnQg
dmVyc2lvbiBmb3IgT3BlblNTTCBkb3dubG9hZCBVUkwiIiIKLS0tIAotMi4yNS4xCi0KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLXByZWZlci12
YWxpZC1lbnRyeXBvaW50cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy8wMDAxLXByZWZlci12YWxpZC1lbnRyeXBvaW50cy5wYXRjaAppbmRleCBhZTM2OThmYWM0
Li4xNjlhYjZiNmE4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMvMDAwMS1wcmVmZXItdmFsaWQtZW50cnlwb2ludHMucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtcHJlZmVyLXZhbGlkLWVudHJ5cG9pbnRz
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4ZDdmY2YwNGM2NTEzODQxYzc5ODVlNjRiNzQ2
YjFlZjVkZTBjNDI2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiMGZkNjU1MjljOTI1
ZDRmOTcyMDg4YzVkODdiODVkZTY5YzQ1NzBmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRlOiBGcmksIDE3IEFwciAy
MDI2IDE2OjUzOjQyICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHByZWZlciB2YWxpZCBlbnRyeXBv
aW50cwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAw
MDEtc3lzY29uZmlnLnB5LXVzZS1wbGF0bGliZGlyLWFsc28tZm9yLXB1cmVsaWIucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1zeXNjb25maWcucHktdXNl
LXBsYXRsaWJkaXItYWxzby1mb3ItcHVyZWxpYi5wYXRjaAppbmRleCA3ODA3ODI3ZDlhLi4yYTZh
MDA5MTFiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMv
MDAwMS1zeXNjb25maWcucHktdXNlLXBsYXRsaWJkaXItYWxzby1mb3ItcHVyZWxpYi5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1zeXNjb25maWcu
cHktdXNlLXBsYXRsaWJkaXItYWxzby1mb3ItcHVyZWxpYi5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gYzEwZDFiMjk1YTlmYjkzODM2ODMwY2NlNDQxZGEzZjIyZTVjN2NkNyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzdkNjlkZDEzZjg0Nzc3ZWEzMWQzYzA4NjA1MmUyYmNlZjcw
OTE0MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBTdW4sIDEyIFNlcCAyMDIxIDIxOjQ0OjM2ICswMjAw
CiBTdWJqZWN0OiBbUEFUQ0hdIHN5c2NvbmZpZy5weTogdXNlIHBsYXRsaWJkaXIgYWxzbyBmb3Ig
cHVyZWxpYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LzAwMDEtdGVzdF9sb2NhbGUucHktY29ycmVjdC10aGUtdGVzdC1vdXRwdXQtZm9ybWF0LnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtdGVzdF9sb2NhbGUu
cHktY29ycmVjdC10aGUtdGVzdC1vdXRwdXQtZm9ybWF0LnBhdGNoCmluZGV4IGE2MGQwODJlMmYu
LmJiOTE3ODc2MDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy8wMDAxLXRlc3RfbG9jYWxlLnB5LWNvcnJlY3QtdGhlLXRlc3Qtb3V0cHV0LWZvcm1hdC5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS10ZXN0
X2xvY2FsZS5weS1jb3JyZWN0LXRoZS10ZXN0LW91dHB1dC1mb3JtYXQucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGYwYWM1YjQ3OWI5OWJmYjdmNWU5MzdhOTQxYjMxYTU5NmY0Y2FhZmMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdkY2I5YmU3MmY2MGIzYmMxYTViYjE1YTNlMzY4
NDEzN2Y2ZWQzMDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaW5nbGkgWXUgPG1p
bmdsaS55dUB3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCA1IEF1ZyAyMDE5IDE1OjU3OjM5ICsw
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RfbG9jYWxlLnB5OiBjb3JyZWN0IHRoZSB0ZXN0IG91
dHB1dCBmb3JtYXQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy8wMDAyLWdoLTE0ODI5Mi1VcGRhdGUtX3NzbC5fU1NMU29ja2V0LWZvci1PcGVuU1NMLTQu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMi1naC0xNDgy
OTItVXBkYXRlLV9zc2wuX1NTTFNvY2tldC1mb3ItT3BlblNTTC00LnBhdGNoCmluZGV4IDU4N2Yx
NDFkZDQuLmIyY2ExNjgzNjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy8wMDAyLWdoLTE0ODI5Mi1VcGRhdGUtX3NzbC5fU1NMU29ja2V0LWZvci1PcGVu
U1NMLTQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAw
MDItZ2gtMTQ4MjkyLVVwZGF0ZS1fc3NsLl9TU0xTb2NrZXQtZm9yLU9wZW5TU0wtNC5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gM2MyYTMwMTRhZjdkNzNjYzM0ZjI0OThmNjBmZGY4NjNkOWJj
N2M2YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjQ2MjlhYWY2MDg3MzNjMTdiYTNj
MGZkNTIwMjMwMTA3ODkyNGFmOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFZpY3Rv
ciBTdGlubmVyIDx2c3Rpbm5lckBweXRob24ub3JnPgogRGF0ZTogTW9uLCA0IE1heSAyMDI2IDEz
OjUyOjU3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdoLTE0ODI5MjogVXBkYXRlIF9zc2wuX1NT
TFNvY2tldCBmb3IgT3BlblNTTCA0ICgjMTQ5MTAyKQpAQCAtMjUsMTAgKzI1LDEwIEBAIFNpZ25l
ZC1vZmYtYnk6IEphaXBhdWwgQ2hlZXJuYW0gPGphaXBhdWwuY2hlZXJuYW1AZXN0LnRlY2g+CiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IE1pc2MvTkVXUy5kL25leHQvTGlicmFyeS8yMDI2LTA0LTI4LTE3
LTQ3LTU1LmdoLWlzc3VlLTE0ODI5Mi5vSXEzbWwucnN0CiAKIGRpZmYgLS1naXQgYS9MaWIvdGVz
dC90ZXN0X3NzbC5weSBiL0xpYi90ZXN0L3Rlc3Rfc3NsLnB5Ci1pbmRleCA5NjVkYmMzNmYwOTY0
OTkuLjAzZDllM2Y5ZTVlOTZiNSAxMDA2NDQKK2luZGV4IGY1MDg4OGQuLjM3NWY5MDUgMTAwNjQ0
CiAtLS0gYS9MaWIvdGVzdC90ZXN0X3NzbC5weQogKysrIGIvTGliL3Rlc3QvdGVzdF9zc2wucHkK
LUBAIC0yNzExLDYgKzI3MTEsMzYgQEAgZGVmIGNsb3NlKHNlbGYpOgorQEAgLTI5OTQsNiArMjk5
NCwzNiBAQCBjbGFzcyBUaHJlYWRlZEVjaG9TZXJ2ZXIodGhyZWFkaW5nLlRocmVhZCk6CiAgICAg
IGRlZiBzdG9wKHNlbGYpOgogICAgICAgICAgc2VsZi5hY3RpdmUgPSBGYWxzZQogIApAQCAtNjUs
NyArNjUsNyBAQCBpbmRleCA5NjVkYmMzNmYwOTY0OTkuLjAzZDllM2Y5ZTVlOTZiNSAxMDA2NDQK
ICBjbGFzcyBBc3luY29yZUVjaG9TZXJ2ZXIodGhyZWFkaW5nLlRocmVhZCk6CiAgCiAgICAgICMg
dGhpcyBvbmUncyBiYXNlZCBvbiBhc3luY29yZS5kaXNwYXRjaGVyCi1AQCAtNDc0Nyw2ICs0Nzc3
LDU4IEBAIGRlZiBiYWNrZ3JvdW5kKHNvY2spOgorQEAgLTUwMzUsNiArNTA2NSw1OCBAQCBjbGFz
cyBUaHJlYWRlZFRlc3RzKHVuaXR0ZXN0LlRlc3RDYXNlKToKICAgICAgICAgICAgICAgICAgICAg
IGlmIGNtLmV4Y192YWx1ZSBpcyBub3QgTm9uZToKICAgICAgICAgICAgICAgICAgICAgICAgICBy
YWlzZSBjbS5leGNfdmFsdWUKICAKQEAgLTEyNiw3ICsxMjYsNyBAQCBpbmRleCA5NjVkYmMzNmYw
OTY0OTkuLjAzZDllM2Y5ZTVlOTZiNSAxMDA2NDQKICAgICAgICAgICAgICAgICAgICAgICAiVGVz
dCBuZWVkcyBUTFMgMS4zIFBIQSIpCiBkaWZmIC0tZ2l0IGEvTWlzYy9ORVdTLmQvbmV4dC9MaWJy
YXJ5LzIwMjYtMDQtMjgtMTctNDctNTUuZ2gtaXNzdWUtMTQ4MjkyLm9JcTNtbC5yc3QgYi9NaXNj
L05FV1MuZC9uZXh0L0xpYnJhcnkvMjAyNi0wNC0yOC0xNy00Ny01NS5naC1pc3N1ZS0xNDgyOTIu
b0lxM21sLnJzdAogbmV3IGZpbGUgbW9kZSAxMDA2NDQKLWluZGV4IDAwMDAwMDAwMDAwMDAwMC4u
ZTFmMzA4ZGY1YTY3OGU2CitpbmRleCAwMDAwMDAwLi5lMWYzMDhkCiAtLS0gL2Rldi9udWxsCiAr
KysgYi9NaXNjL05FV1MuZC9uZXh0L0xpYnJhcnkvMjAyNi0wNC0yOC0xNy00Ny01NS5naC1pc3N1
ZS0xNDgyOTIub0lxM21sLnJzdAogQEAgLTAsMCArMSw3IEBACkBAIC0xMzgsMTAgKzEzOCwxMCBA
QCBpbmRleCAwMDAwMDAwMDAwMDAwMDAuLmUxZjMwOGRmNWE2NzhlNgogK1RoYW5rcyB0byB0aGF0
LCA6Y2xhc3M6YHNzbC5TU0xTb2NrZXRgIGJlaGF2ZXMgdGhlIHNhbWUgb24gYWxsIE9wZW5TU0wg
dmVyc2lvbnMKICtvbiBFT0YuICBQYXRjaCBieSBWaWN0b3IgU3Rpbm5lci4KIGRpZmYgLS1naXQg
YS9Nb2R1bGVzL19zc2wuYyBiL01vZHVsZXMvX3NzbC5jCi1pbmRleCAxNjAzZDBmZmQ1NTk1NTku
LjM3NmRmMzJiN2NiNGJkNiAxMDA2NDQKK2luZGV4IGI5OTgzMGUuLmMzNTJkZTYgMTAwNjQ0CiAt
LS0gYS9Nb2R1bGVzL19zc2wuYwogKysrIGIvTW9kdWxlcy9fc3NsLmMKLUBAIC0zNTIsNiArMzUy
LDE2IEBAIHR5cGVkZWYgc3RydWN0IHsKK0BAIC0zNTEsNiArMzUxLDE2IEBAIHR5cGVkZWYgc3Ry
dWN0IHsKICAgICAgICogYW5kIHNodXRkb3duIG1ldGhvZHMgY2hlY2sgZm9yIGNoYWluZWQgZXhj
ZXB0aW9ucy4KICAgICAgICovCiAgICAgIFB5T2JqZWN0ICpleGM7CkBAIC0xNTgsNyArMTU4LDcg
QEAgaW5kZXggMTYwM2QwZmZkNTU5NTU5Li4zNzZkZjMyYjdjYjRiZDYgMTAwNjQ0CiAgfSBQeVNT
TFNvY2tldDsKICAKICAjZGVmaW5lIFB5U1NMU29ja2V0X0NBU1Qob3ApICAgICgoUHlTU0xTb2Nr
ZXQgKikob3ApKQotQEAgLTQ5OSw2ICs1MDksMTAgQEAgZmlsbF9hbmRfc2V0X3NzbGVycm9yKF9z
c2xtb2R1bGVzdGF0ZSAqc3RhdGUsCitAQCAtNDk4LDYgKzUwOCwxMCBAQCBmaWxsX2FuZF9zZXRf
c3NsZXJyb3IoX3NzbG1vZHVsZXN0YXRlICpzdGF0ZSwKICAgICAgUHlPYmplY3QgKmluaXRfdmFs
dWUsICptc2csICprZXk7CiAgICAgIFB5VW5pY29kZVdyaXRlciAqd3JpdGVyID0gTlVMTDsKICAK
QEAgLTE2OSw3ICsxNjksNyBAQCBpbmRleCAxNjAzZDBmZmQ1NTk1NTkuLjM3NmRmMzJiN2NiNGJk
NiAxMDA2NDQKICAgICAgaWYgKGVycmNvZGUgIT0gMCkgewogICAgICAgICAgaW50IGxpYiwgcmVh
c29uOwogIAotQEAgLTY1NCw2ICs2NjgsMTggQEAgUHlTU0xfQ2hhaW5FeGNlcHRpb25zKFB5U1NM
U29ja2V0ICpzc2xzb2NrKSB7CitAQCAtNjUzLDYgKzY2NywxOCBAQCBQeVNTTF9DaGFpbkV4Y2Vw
dGlvbnMoUHlTU0xTb2NrZXQgKnNzbHNvY2spIHsKICAgICAgcmV0dXJuIC0xOwogIH0KICAKQEAg
LTE4OCw3ICsxODgsNyBAQCBpbmRleCAxNjAzZDBmZmQ1NTk1NTkuLjM3NmRmMzJiN2NiNGJkNiAx
MDA2NDQKICBzdGF0aWMgUHlPYmplY3QgKgogIFB5U1NMX1NldEVycm9yKFB5U1NMU29ja2V0ICpz
c2xzb2NrLCBjb25zdCBjaGFyICpmaWxlbmFtZSwgaW50IGxpbmVubykKICB7Ci1AQCAtOTAxLDYg
KzkyNyw3IEBAIG5ld1B5U1NMU29ja2V0KFB5U1NMQ29udGV4dCAqc3NsY3R4LCBQeVNvY2tldFNv
Y2tPYmplY3QgKnNvY2ssCitAQCAtOTAwLDYgKzkyNiw3IEBAIG5ld1B5U1NMU29ja2V0KFB5U1NM
Q29udGV4dCAqc3NsY3R4LCBQeVNvY2tldFNvY2tPYmplY3QgKnNvY2ssCiAgICAgIHNlbGYtPnNl
cnZlcl9ob3N0bmFtZSA9IE5VTEw7CiAgICAgIHNlbGYtPmVyciA9IGVycjsKICAgICAgc2VsZi0+
ZXhjID0gTlVMTDsKQEAgLTE5Niw3ICsxOTYsNyBAQCBpbmRleCAxNjAzZDBmZmQ1NTk1NTkuLjM3
NmRmMzJiN2NiNGJkNiAxMDA2NDQKICAKICAgICAgLyogTWFrZSBzdXJlIHRoZSBTU0wgZXJyb3Ig
c3RhdGUgaXMgaW5pdGlhbGl6ZWQgKi8KICAgICAgRVJSX2NsZWFyX2Vycm9yKCk7Ci1AQCAtMTA0
MSw2ICsxMDY4LDExIEBAIF9zc2xfX1NTTFNvY2tldF9kb19oYW5kc2hha2VfaW1wbChQeVNTTFNv
Y2tldCAqc2VsZikKK0BAIC0xMDQwLDYgKzEwNjcsMTEgQEAgX3NzbF9fU1NMU29ja2V0X2RvX2hh
bmRzaGFrZV9pbXBsKFB5U1NMU29ja2V0ICpzZWxmKQogICAgICAgICAgQklPX3NldF9uYmlvKFNT
TF9nZXRfd2JpbyhzZWxmLT5zc2wpLCBub25ibG9ja2luZyk7CiAgICAgIH0KICAKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAzLWdoLTE0ODI5Mi1S
ZW1vdmUtc2h1dGRvd24tdGVzdC1pbi10ZXN0X3NzbC50ZXN0X2dvdF9lb2YucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMy1naC0xNDgyOTItUmVtb3ZlLXNo
dXRkb3duLXRlc3QtaW4tdGVzdF9zc2wudGVzdF9nb3RfZW9mLnBhdGNoCmluZGV4IGFmMDY3ZjU0
OWMuLmViOTViZWM1ZDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy8wMDAzLWdoLTE0ODI5Mi1SZW1vdmUtc2h1dGRvd24tdGVzdC1pbi10ZXN0X3NzbC50
ZXN0X2dvdF9lb2YucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLzAwMDMtZ2gtMTQ4MjkyLVJlbW92ZS1zaHV0ZG93bi10ZXN0LWluLXRlc3Rfc3NsLnRlc3Rf
Z290X2VvZi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gODE5MTE5MDliYzQzOWQ2ZGU4Y2U2
YTE3M2IwNjkxYjNjNThlOWUxYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNmQwMzdl
NmFlNTE3Y2UzMTc5MjI1MDQ0YTczZjJhNTE4Y2U3M2Q2YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IFZpY3RvciBTdGlubmVyIDx2c3Rpbm5lckBweXRob24ub3JnPgogRGF0ZTogTW9u
LCA0IE1heSAyMDI2IDE2OjIwOjI1ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdoLTE0ODI5Mjog
UmVtb3ZlIHNodXRkb3duKCkgdGVzdCBpbiB0ZXN0X3NzbC50ZXN0X2dvdF9lb2YoKQpAQCAtMjEs
MTAgKzIxLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEphaXBhdWwgQ2hlZXJuYW0gPGphaXBhdWwuY2hl
ZXJuYW1AZXN0LnRlY2g+CiAgMSBmaWxlIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCiAKIGRpZmYg
LS1naXQgYS9MaWIvdGVzdC90ZXN0X3NzbC5weSBiL0xpYi90ZXN0L3Rlc3Rfc3NsLnB5Ci1pbmRl
eCAwM2Q5ZTNmOWU1ZTk2YjUuLjY0NDVmMTIyYjQyNzJiZSAxMDA2NDQKK2luZGV4IDM3NWY5MDUu
LmVmZGQyOTMgMTAwNjQ0CiAtLS0gYS9MaWIvdGVzdC90ZXN0X3NzbC5weQogKysrIGIvTGliL3Rl
c3QvdGVzdF9zc2wucHkKLUBAIC00ODIwLDE0ICs0ODIwLDYgQEAgZGVmIHRlc3RfZ290X2VvZihz
ZWxmKToKK0BAIC01MTA4LDE0ICs1MTA4LDYgQEAgY2xhc3MgVGhyZWFkZWRUZXN0cyh1bml0dGVz
dC5UZXN0Q2FzZSk6CiAgICAgICAgICAgICAgICAgIHNzbHNvY2suZG9faGFuZHNoYWtlKCkKICAK
ICAgICAgICAgICAgICBzZWxmLmFzc2VydEVxdWFsKHNzbHNvY2sucGVuZGluZygpLCAwKQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zL21ha2VyYWNlLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zL21ha2VyYWNlLnBhdGNo
CmluZGV4IDI0OGE1MjExMTguLjU5ODRmYjMyMmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy9tYWtlcmFjZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvbWFrZXJhY2UucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGI0MTU1N2Y1NzBmZjQ0NTFjNDc3NjY5ZDZjYTViZmFjYWJlMjFjNjYgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDRhMjkwNDk0ZTFiODM2NjJjNTI2YWMzNzFkYjEzOWY3MjE5MTYz
ODUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFy
ZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFR1ZSwgMTMgSnVsIDIwMjEgMjM6
MTk6MjkgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gcHl0aG9uMzogRml4IG1ha2UgcmFjZQpAQCAt
MTcsMTAgKzE3LDEwIEBAIFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1
cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUucHJlLmluIGIvTWFrZWZp
bGUucHJlLmluCi1pbmRleCBhN2U1MzZkLi5lOTQ2MDE4IDEwMDY0NAoraW5kZXggZGU3MmIwMy4u
YjQzYmFmMSAxMDA2NDQKIC0tLSBhL01ha2VmaWxlLnByZS5pbgogKysrIGIvTWFrZWZpbGUucHJl
LmluCi1AQCAtMjc0MSw3ICsyNzQxLDcgQEAgQ09NUElMRUFMTF9PUFRTPS1qMAorQEAgLTI3NDIs
NyArMjc0Miw3IEBAIENPTVBJTEVBTExfT1BUUz0tajAKICBURVNUX01PRFVMRVM9QFRFU1RfTU9E
VUxFU0AKICAKICAuUEhPTlk6IGxpYmluc3RhbGwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy92YWxpZC1kaXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy92YWxpZC1kaXN0cy5wYXRjaAppbmRleCA3ZmUxODI1NGU1
Li42NGI5MmFiNjBiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMvdmFsaWQtZGlzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zL3ZhbGlkLWRpc3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2Njg3NGNl
MWE5ZjIxYjRiMDBkYzg1OTE5NzM0ZDU4ZTYyNDNjYTI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA4NzRkOTA3ZjdhYjU4YjNjMjQwNjcxYTFhYmVkMzVlYWQ2YzMwMTUyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogIkphc29uIFIuIENvb21icyIgPGphcmFjb0BqYXJhY28u
Y29tPgogRGF0ZTogVHVlLCAyMyBKdWwgMjAyNCAwODozNjoxNiAtMDQwMAogU3ViamVjdDogW1BB
VENIXSBQcmlvcml0aXplIHZhbGlkIGRpc3RzIHRvIGludmFsaWQgZGlzdHMgd2hlbiByZXRyaWV2
aW5nIGJ5CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNf
My4xNC43LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zXzMuMTQuOC5i
YgpzaW1pbGFyaXR5IGluZGV4IDk5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjNfMy4xNC43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjNfMy4xNC44LmJiCmluZGV4IGY5MTdlZGViZDguLjQ2NjNlZTg1Y2QgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uM18zLjE0LjcuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zXzMuMTQuOC5iYgpAQCAt
MzAsNyArMzAsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtTGliLXN5c2NvbmZpZy5weS11c2UtcHJlZml4LXZhbHVlLWZyb20tYnVp
bGQtY29uZmlndS5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjNiNDhkYWM4ZmI1OWY2MmVhYTY3YWM4M2MxZWIxMmJkYTFiN2EwODQwNmRkMjg2ZTI1MmMxMWE2
NmJlMjdmODEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzIyMTU5MDRmMDJiMTc1NTk2ZGM0OTM1
MTU4NTEwNGY0YmMyMDM0MWUxYzQ3Mzc4YjI2YTJjMjc0MzYwY2U3MyIKIAogIyBleGNsdWRlIHBy
ZS1yZWxlYXNlcyBmb3IgYm90aCBweXRob24gMi54IGFuZCAzLngKIFVQU1RSRUFNX0NIRUNLX1JF
R0VYID0gIltQcF15dGhvbi0oP1A8cHZlcj5cZCsoXC5cZCspKykudGFyIgotLSAKMi40Ny4xCgo=

--===============5485900956335931169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/ca-certificates/ca-certificates-dev: FILES: removed "/lib/*.la /lib/lib*.so /lib/*.o"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/ca-certificates/ca-certificates: FILES: removed "/sbin/* /bin/* /lib/*.so.*", added "/usr/lib/*.so.*"
packages/all-poky-linux/tzdata/tzdata: FILES: removed "/sbin/* /bin/* /lib/*.so.*", added "/usr/lib/*.so.*"
packages/x86-64-v3-poky-linux/python3: SRC_URI changed from "http://www.python.org/ftp/python/3.14.7/Python-3.14.7.tar.xz file://run-ptest file://create_manifest3.py file://get_module_deps3.py file://python3-manifest.json file://check_build_completeness.py file://reformat_sysconfig.py file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch file://0001-test_locale.py-correct-the-test-output-format.patch file://makerace.patch file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch file://valid-dists.patch file://0001-Avoid-shebang-overflow-on-python-config.py.patch file://0001-Update-test_sysconfig-for-posix_user-purelib.patch file://0001-prefer-valid-entrypoints.patch file://0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch file://0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch file://0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch" to "http://www.python.org/ftp/p
 ython/3.14.8/Python-3.14.8.tar.xz file://run-ptest file://create_manifest3.py file://get_module_deps3.py file://python3-manifest.json file://check_build_completeness.py file://reformat_sysconfig.py file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch file://0001-test_locale.py-correct-the-test-output-format.patch file://makerace.patch file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch file://valid-dists.patch file://0001-Avoid-shebang-overflow-on-python-config.py.patch file://0001-Update-test_sysconfig-for-posix_user-purelib.patch file://0001-prefer-valid-entrypoints.patch file://0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch file://0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch file://0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch"
packages/x86-64-v3-poky-linux/python3: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/libpython3-staticdev: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/libpython3-staticdev: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/libpython3: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/libpython3: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/libpython3: PKGSIZE changed from 6126976 to 6131072 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-asyncio: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-asyncio: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-asyncio: PKGSIZE changed from 1534009 to 1539252 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-audio: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-audio: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-codecs: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-codecs: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-compile: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-compile: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-compression: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-compression: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-compression: PKGSIZE changed from 685248 to 688713 (+1%)
packages/x86-64-v3-poky-linux/python3/python3-core: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-core: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-core: PKGSIZE changed from 10339016 to 10386342 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-crypt: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-crypt: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-ctypes: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-ctypes: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-ctypes: PKGSIZE changed from 483303 to 483445 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-curses: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-curses: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-datetime: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-datetime: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-db: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-db: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-dbg: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-dbg: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-dbg: PKGSIZE changed from 49162368 to 49261912 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-debugger: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-debugger: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-debugger: PKGSIZE changed from 395830 to 395826 (-0%)
packages/x86-64-v3-poky-linux/python3/python3-dev: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-dev: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-dev: PKGSIZE changed from 1957919 to 1958857 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-difflib: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-difflib: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-doc: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-doc: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-doc: PKGSIZE changed from 24996 to 24995 (-0%)
packages/x86-64-v3-poky-linux/python3/python3-doctest: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-doctest: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-doctest: PKGSIZE changed from 220467 to 220551 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-email: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-email: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-email: PKGSIZE changed from 1013193 to 1013438 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-ensurepip: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-ensurepip: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-fcntl: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-fcntl: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-gdbm: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-gdbm: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-html: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-html: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-idle: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-idle: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-idle: PKGSIZE changed from 2171096 to 2203201 (+1%)
packages/x86-64-v3-poky-linux/python3/python3-image: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-image: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-io: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-io: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-io: PKGSIZE changed from 892291 to 893310 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-json: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-json: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-locale: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-locale: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-logging: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-logging: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-logging: PKGSIZE changed from 402593 to 403337 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-mailbox: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-mailbox: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-man: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-man: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-math: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-math: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-mime: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-mime: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-misc: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-misc: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-misc: PKGSIZE changed from 3861965 to 3871281 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-mmap: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-mmap: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-modules: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-modules: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-multiprocessing: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-multiprocessing: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-netclient: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-netclient: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-netclient: PKGSIZE changed from 892761 to 893076 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-netserver: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-netserver: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-numbers: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-numbers: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-numbers: PKGSIZE changed from 926909 to 927013 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-pickle: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-pickle: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-pkgutil: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-pkgutil: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-plistlib: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-plistlib: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-plistlib: PKGSIZE changed from 74575 to 75592 (+1%)
packages/x86-64-v3-poky-linux/python3/python3-pprint: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-pprint: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-profile: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-profile: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-profile: PKGSIZE changed from 164123 to 164254 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-ptest: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-ptest: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-pydoc: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-pydoc: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-pydoc: PKGSIZE changed from 1499003 to 1501501 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-resource: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-resource: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-shell: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-shell: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-sqlite3: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-sqlite3: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-src: FILELIST: directory renamed /usr/src/debug/python3/3.14.7/Programs -> /usr/src/debug/python3/3.14.8/Programs, directory renamed /usr/src/debug/python3/3.14.7/Modules/_ctypes -> /usr/src/debug/python3/3.14.8/Modules/_ctypes, directory renamed /usr/src/debug/python3/3.14.7/Modules/_ssl -> /usr/src/debug/python3/3.14.8/Modules/_ssl, directory renamed /usr/src/debug/python3/3.14.7/Objects/stringlib/clinic -> /usr/src/debug/python3/3.14.8/Objects/stringlib/clinic, directory renamed /usr/src/debug/python3/3.14.7/Modules/_testinternalcapi/clinic -> /usr/src/debug/python3/3.14.8/Modules/_testinternalcapi/clinic, directory renamed /usr/src/debug/python3/3.14.7/Python/frozen_modules -> /usr/src/debug/python3/3.14.8/Python/frozen_modules, directory renamed /usr/src/debug/python3/3.14.7/Modules/_ssl/clinic -> /usr/src/debug/python3/3.14.8/Modules/_ssl/clinic, directory renamed /usr/src/debug/python3/3.14.7/Modules/cjkcodecs -> /usr/src/debug/pyt
 hon3/3.14.8/Modules/cjkcodecs, directory renamed /usr/src/debug/python3/3.14.7/Modules/_sqlite -> /usr/src/debug/python3/3.14.8/Modules/_sqlite, directory renamed /usr/src/debug/python3/3.14.7/Objects -> /usr/src/debug/python3/3.14.8/Objects, directory renamed /usr/src/debug/python3/3.14.7/Objects/clinic -> /usr/src/debug/python3/3.14.8/Objects/clinic, directory renamed /usr/src/debug/python3/3.14.7/Python -> /usr/src/debug/python3/3.14.8/Python, directory renamed /usr/src/debug/python3/3.14.7/Python/clinic -> /usr/src/debug/python3/3.14.8/Python/clinic, directory renamed /usr/src/debug/python3/3.14.7/Parser/tokenizer -> /usr/src/debug/python3/3.14.8/Parser/tokenizer, directory renamed /usr/src/debug/python3/3.14.7/Include/internal/mimalloc -> /usr/src/debug/python3/3.14.8/Include/internal/mimalloc, directory renamed /usr/src/debug/python3/3.14.7/Modules/_sqlite/clinic -> /usr/src/debug/python3/3.14.8/Modules/_sqlite/clinic, directory renamed /usr/src/debug/python3/3.14.7/Modules/_h
 acl/internal -> /usr/src/debug/python3/3.14.8/Modules/_hacl/internal, directory renamed /usr/src/debug/python3/3.14.7/Modules/_xxtestfuzz -> /usr/src/debug/python3/3.14.8/Modules/_xxtestfuzz, directory renamed /usr/src/debug/python3/3.14.7/Objects/stringlib -> /usr/src/debug/python3/3.14.8/Objects/stringlib, directory renamed /usr/src/debug/python3/3.14.7/Modules/_decimal -> /usr/src/debug/python3/3.14.8/Modules/_decimal, directory renamed /usr/src/debug/python3/3.14.7/Include/internal/mimalloc/mimalloc -> /usr/src/debug/python3/3.14.8/Include/internal/mimalloc/mimalloc, directory renamed /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/clinic -> /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/clinic, directory renamed /usr/src/debug/python3/3.14.7/Modules/_io/clinic -> /usr/src/debug/python3/3.14.8/Modules/_io/clinic, directory renamed /usr/src/debug/python3/3.14.7/Modules/_testinternalcapi -> /usr/src/debug/python3/3.14.8/Modules/_testinternalcapi, directory renamed /
 usr/src/debug/python3/3.14.7/Modules/_ctypes/clinic -> /usr/src/debug/python3/3.14.8/Modules/_ctypes/clinic, directory renamed /usr/src/debug/python3/3.14.7/Objects/mimalloc/prim/unix -> /usr/src/debug/python3/3.14.8/Objects/mimalloc/prim/unix, directory renamed /usr/src/debug/python3/3.14.7/Modules/_multiprocessing/clinic -> /usr/src/debug/python3/3.14.8/Modules/_multiprocessing/clinic, directory renamed /usr/src/debug/python3/3.14.7/Include -> /usr/src/debug/python3/3.14.8/Include, directory renamed /usr/src/debug/python3/3.14.7/Modules/_hacl -> /usr/src/debug/python3/3.14.8/Modules/_hacl, directory renamed /usr/src/debug/python3/3.14.7/Modules/_hacl/include/krml -> /usr/src/debug/python3/3.14.8/Modules/_hacl/include/krml, directory renamed /usr/src/debug/python3/3.14.7/Modules/_sre -> /usr/src/debug/python3/3.14.8/Modules/_sre, directory renamed /usr/src/debug/python3/3.14.7/Parser -> /usr/src/debug/python3/3.14.8/Parser, directory renamed /usr/src/debug/python3/3.14.7/Modules/_m
 ultiprocessing -> /usr/src/debug/python3/3.14.8/Modules/_multiprocessing, directory renamed /usr/src/debug/python3/3.14.7/Modules/_decimal/libmpdec -> /usr/src/debug/python3/3.14.8/Modules/_decimal/libmpdec, directory renamed /usr/src/debug/python3/3.14.7/Modules/_io -> /usr/src/debug/python3/3.14.8/Modules/_io, directory renamed /usr/src/debug/python3/3.14.7/Modules/cjkcodecs/clinic -> /usr/src/debug/python3/3.14.8/Modules/cjkcodecs/clinic, directory renamed /usr/src/debug/python3/3.14.7/Modules/_sre/clinic -> /usr/src/debug/python3/3.14.8/Modules/_sre/clinic, directory renamed /usr/src/debug/python3/3.14.7/Modules -> /usr/src/debug/python3/3.14.8/Modules, directory renamed /usr/src/debug/python3/3.14.7/Objects/mimalloc -> /usr/src/debug/python3/3.14.8/Objects/mimalloc, directory renamed /usr/src/debug/python3/3.14.7/Include/cpython -> /usr/src/debug/python3/3.14.8/Include/cpython, directory renamed /usr/src/debug/python3/3.14.7/Modules/_hacl/include/krml/internal -> /usr/src/debug
 /python3/3.14.8/Modules/_hacl/include/krml/internal, directory renamed /usr/src/debug/python3/3.14.7/Parser/lexer -> /usr/src/debug/python3/3.14.8/Parser/lexer, directory renamed /usr/src/debug/python3/3.14.7/Modules/_testcapi/clinic -> /usr/src/debug/python3/3.14.8/Modules/_testcapi/clinic, directory renamed /usr/src/debug/python3/3.14.7/Modules/_testcapi -> /usr/src/debug/python3/3.14.8/Modules/_testcapi, directory renamed /usr/src/debug/python3/3.14.7/Modules/_zstd/clinic -> /usr/src/debug/python3/3.14.8/Modules/_zstd/clinic, directory renamed /usr/src/debug/python3/3.14.7/Modules/clinic -> /usr/src/debug/python3/3.14.8/Modules/clinic, directory renamed /usr/src/debug/python3/3.14.7/Include/internal -> /usr/src/debug/python3/3.14.8/Include/internal, directory renamed /usr/src/debug/python3/3.14.7/Modules/_zstd -> /usr/src/debug/python3/3.14.8/Modules/_zstd, removed "/usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/import.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedc
 api/codec.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/complex.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/testcapi_long.h /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/object.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/float.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/run.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/pyos.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/bytes.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/sys.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/eval.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/long.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/version.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/set.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/vectorcall_limited.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/capsule.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/tuple.c /usr/src/debug/python
 3/3.14.7/Modules/_testlimitedcapi/parts.h /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/weakref.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/unicode.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/abstract.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/list.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/util.h /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/file.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/heaptype_relative.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/bytearray.c /usr/src/debug/python3/3.14.7/Modules/_testlimitedcapi/dict.c", added "/usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/import.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/codec.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/complex.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/testcapi_long.h /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/slice.c /usr/src/debug/python3/3.14.8/Modu
 les/_testlimitedcapi/object.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/float.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/run.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/pyos.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/bytes.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/sys.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/eval.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/long.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/version.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/set.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/vectorcall_limited.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/capsule.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/tuple.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/parts.h /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/weakref.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/unicode.c /usr/src/d
 ebug/python3/3.14.8/Modules/_testlimitedcapi/abstract.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/list.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/util.h /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/file.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/heaptype_relative.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/bytearray.c /usr/src/debug/python3/3.14.8/Modules/_testlimitedcapi/dict.c"
packages/x86-64-v3-poky-linux/python3/python3-src: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-src: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-src: PKGSIZE changed from 28365790 to 28420206 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-staticdev: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-staticdev: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-statistics: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-statistics: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-stringold: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-stringold: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-syslog: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-syslog: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-terminal: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-terminal: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-tests: FILELIST: removed "/usr/lib/python3.14/idlelib/idle_test/__pycache__/test_zzdummy_user.cpython-314.pyc /usr/lib/python3.14/idlelib/idle_test/test_zzdummy_user.py", added "/usr/lib/python3.14/test/test_capi/__pycache__/test_slice.cpython-314.pyc /usr/lib/python3.14/test/test_free_threading/test_context.py /usr/lib/python3.14/test/test_capi/test_slice.py /usr/lib/python3.14/test/test_free_threading/__pycache__/test_context.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3/python3-tests: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-tests: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-tests: PKGSIZE changed from 75675887 to 76305228 (+1%)
packages/x86-64-v3-poky-linux/python3/python3-threading: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-threading: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-threading: PKGSIZE changed from 60528 to 60610 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-tkinter: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-tkinter: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-tkinter: PKGSIZE changed from 733393 to 733980 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-tomllib: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-tomllib: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-unittest: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-unittest: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-unittest: PKGSIZE changed from 589894 to 589907 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-unixadmin: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-unixadmin: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-venv: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-venv: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-xml: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-xml: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-xml: PKGSIZE changed from 854627 to 855555 (+0%)
packages/x86-64-v3-poky-linux/python3/python3-xmlrpc: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-xmlrpc: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-zipapp: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-zipapp: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3-zoneinfo: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3-zoneinfo: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
packages/x86-64-v3-poky-linux/python3/python3: PV changed from "3.14.7" to "3.14.8"
packages/x86-64-v3-poky-linux/python3/python3: PKGV changed from 3.14.7 [default] to 3.14.8 [default]
Changes to packages/x86-64-v3-poky-linux/python3 (sysroot):
  /usr/lib/python3.14/idlelib/idle_test/__pycache__/test_zzdummy_user.cpython-314.pyc was removed
  /usr/lib/python3.14/idlelib/idle_test/test_zzdummy_user.py was removed
Changes to packages/x86_64-linux/python3-native (sysroot):
  /usr/lib/python3.14/idlelib/idle_test/test_zzdummy_user.py was removed

--===============5485900956335931169==--

