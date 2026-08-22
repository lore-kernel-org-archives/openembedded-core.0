Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61297C5DF97
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 17:25:59 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.792.1787419554432122656
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 10:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=hDZSm2Mi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260822172550dd070587ca000207ac-qxyuqy@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260822172550dd070587ca000207ac
        for <openembedded-core@lists.openembedded.org>;
        Sat, 22 Aug 2026 19:25:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=DuunEbgKHMJcLPO6FG5WCg66YS/iUAuMRdP78TFNjjg=;
 b=hDZSm2MimLEPgdcELLFJmKBfcjldg87RzUmcbbH2YLpBsqSOaNCbkUMK5xGzoKaAEgJPXC
 +967NdxFyXRvYRbeC+MOjssVclkwjDudDyDCPVFn1aYHqEJGIgtyp+YJ9lxPLMvYaXWGtG7K
 YI31xSwNYa8VwcHdqkCLniJBLFjzdoYzE0iBiPUvMHZmaeEUMt+BYbLLImIQrWkoNAfzocp0
 Hqhy8vd1gnOTc8IVf5ocZud+Hr8aU+8dVhEDfDh616QamRlMlmOZnG7T8f9pdsZYAnBNTN25
 7B8Irdlqp8c/LVdWWH1/M6kR8k/DWWqWW1+o0pHLnkyPAik10MtkJ47w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] python3: upgrade 3.12.13 -> 3.12.14
Date: Sat, 22 Aug 2026 19:25:43 +0200
Message-ID: <20260822172544.1927400-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 17:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243991

From: Peter Marko <peter.marko@siemens.com>

This is a security release of Python 3.12
Release information: [1]

* drop CVE patches included in this release
* refresh all remaining patches via devtool
* remove some tab style in SRC_URI.
* add CVE_STATUS entries for CVEs fixed in this release but still
  reported as Unpatched by cve-check (including 2 fixed already in
  previous release)

[1] https://www.python.org/downloads/release/python-31214/

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...shebang-overflow-on-python-config.py.patch |   2 +-
 ...-qemu-wrapper-when-gathering-profile.patch |   2 +-
 ...e-treat-overflow-in-UID-GID-as-failu.patch |   2 +-
 .../python/python3/CVE-2025-13462.patch       | 142 ----------------
 .../python/python3/CVE-2026-11940.patch       |  66 --------
 .../python/python3/CVE-2026-11972.patch       |  60 -------
 .../python/python3/CVE-2026-1502.patch        | 113 -------------
 .../python3/CVE-2026-3644_CVE-2026-0672.patch | 154 -----------------
 .../python/python3/CVE-2026-4224.patch        | 121 -------------
 .../python3/CVE-2026-4519_CVE-2026-4786.patch |  66 --------
 .../python/python3/CVE-2026-4519_p1.patch     | 107 ------------
 .../python/python3/CVE-2026-4519_p2.patch     | 159 ------------------
 .../python/python3/CVE-2026-6100.patch        |  75 ---------
 .../python/python3/CVE-2026-7210.patch        | 148 ----------------
 .../python/python3/CVE-2026-9669.patch        |  96 -----------
 .../python/python3/makerace.patch             |   2 +-
 ...{python3_3.12.13.bb => python3_3.12.14.bb} |  24 +--
 17 files changed, 13 insertions(+), 1326 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13462.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11940.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11972.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-1502.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-3644_CVE-2026-0672.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4224.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4519_CVE-2026-4786.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4519_p1.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4519_p2.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-6100.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-9669.patch
 rename meta/recipes-devtools/python/{python3_3.12.13.bb => python3_3.12.14.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index a8f98d873e8..6c8b1bf6cd9 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 2d235d2..1ac2263 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2356,6 +2356,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2361,6 +2361,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index b78f6199580..6066b26e38f 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -13,7 +13,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 083f4c7..dce36a5 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -660,8 +660,7 @@ profile-run-stamp:
+@@ -663,8 +663,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
diff --git a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
index 98b3aa42d21..5fdf5f4514e 100644
--- a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
+++ b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
@@ -16,7 +16,7 @@ diff --git a/Lib/tarfile.py b/Lib/tarfile.py
 index 0a0f31e..4dfb67d 100755
 --- a/Lib/tarfile.py
 +++ b/Lib/tarfile.py
-@@ -2688,7 +2688,8 @@ class TarFile(object):
+@@ -2721,7 +2721,8 @@ class TarFile(object):
                      os.lchown(targetpath, u, g)
                  else:
                      os.chown(targetpath, u, g)
diff --git a/meta/recipes-devtools/python/python3/CVE-2025-13462.patch b/meta/recipes-devtools/python/python3/CVE-2025-13462.patch
deleted file mode 100644
index 36d492338ba..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2025-13462.patch
+++ /dev/null
@@ -1,142 +0,0 @@
-From 14d7d2e8f51a17c23c98f13f33743253a0b7a18a Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 18 May 2026 19:43:51 +0200
-Subject: [PATCH] [3.12] gh-141707: Skip TarInfo DIRTYPE normalization during
- GNU long name handling (#145817)
-
-gh-141707: Skip TarInfo DIRTYPE normalization during GNU long name handling
-
-CVE: CVE-2025-13462
-Upstream-Status: Backport [https://github.com/python/cpython/commit/d10950739a78f54d0718d88fb5a868374603c084]
-
-Backport Changes:
-- This file is not present in the current version and is therefore omitted
-  Misc/NEWS.d/next/Library/2025-11-18-06-35-53.gh-issue-141707.DBmQIy.rst
-
-(cherry picked from commit 42d754e34c06e57ad6b8e7f92f32af679912d8ab)
-
-Co-authored-by: Seth Michael Larson <seth@python.org>
-Co-authored-by: Eashwar Ranganathan <eashwar@eashwar.com>
-(cherry picked from commit d10950739a78f54d0718d88fb5a868374603c084)
-Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
----
- Lib/tarfile.py           | 29 +++++++++++++++++++++++++----
- Lib/test/test_tarfile.py | 19 +++++++++++++++++++
- Misc/ACKS                |  1 +
- 3 files changed, 45 insertions(+), 4 deletions(-)
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index 99451aa765..70fdbe85b0 100755
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -1246,6 +1246,20 @@ class TarInfo(object):
-     @classmethod
-     def frombuf(cls, buf, encoding, errors):
-         """Construct a TarInfo object from a 512 byte bytes object.
-+
-+        To support the old v7 tar format AREGTYPE headers are
-+        transformed to DIRTYPE headers if their name ends in '/'.
-+        """
-+        return cls._frombuf(buf, encoding, errors)
-+
-+    @classmethod
-+    def _frombuf(cls, buf, encoding, errors, *, dircheck=True):
-+        """Construct a TarInfo object from a 512 byte bytes object.
-+
-+        If ``dircheck`` is set to ``True`` then ``AREGTYPE`` headers will
-+        be normalized to ``DIRTYPE`` if the name ends in a trailing slash.
-+        ``dircheck`` must be set to ``False`` if this function is called
-+        on a follow-up header such as ``GNUTYPE_LONGNAME``.
-         """
-         if len(buf) == 0:
-             raise EmptyHeaderError("empty header")
-@@ -1276,7 +1290,7 @@ class TarInfo(object):
- 
-         # Old V7 tar format represents a directory as a regular
-         # file with a trailing slash.
--        if obj.type == AREGTYPE and obj.name.endswith("/"):
-+        if dircheck and obj.type == AREGTYPE and obj.name.endswith("/"):
-             obj.type = DIRTYPE
- 
-         # The old GNU sparse format occupies some of the unused
-@@ -1311,8 +1325,15 @@ class TarInfo(object):
-         """Return the next TarInfo object from TarFile object
-            tarfile.
-         """
-+        return cls._fromtarfile(tarfile)
-+
-+    @classmethod
-+    def _fromtarfile(cls, tarfile, *, dircheck=True):
-+        """
-+        See dircheck documentation in _frombuf().
-+        """
-         buf = tarfile.fileobj.read(BLOCKSIZE)
--        obj = cls.frombuf(buf, tarfile.encoding, tarfile.errors)
-+        obj = cls._frombuf(buf, tarfile.encoding, tarfile.errors, dircheck=dircheck)
-         obj.offset = tarfile.fileobj.tell() - BLOCKSIZE
-         return obj._proc_member(tarfile)
- 
-@@ -1370,7 +1391,7 @@ class TarInfo(object):
- 
-         # Fetch the next header and process it.
-         try:
--            next = self.fromtarfile(tarfile)
-+            next = self._fromtarfile(tarfile, dircheck=False)
-         except HeaderError as e:
-             raise SubsequentHeaderError(str(e)) from None
- 
-@@ -1505,7 +1526,7 @@ class TarInfo(object):
- 
-         # Fetch the next header.
-         try:
--            next = self.fromtarfile(tarfile)
-+            next = self._fromtarfile(tarfile, dircheck=False)
-         except HeaderError as e:
-             raise SubsequentHeaderError(str(e)) from None
- 
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index 759fa03ead..82637841ed 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -1134,6 +1134,25 @@ class LongnameTest:
-                 self.assertIsNotNone(tar.getmember(longdir))
-                 self.assertIsNotNone(tar.getmember(longdir.removesuffix('/')))
- 
-+    def test_longname_file_not_directory(self):
-+        # Test reading a longname file and ensure it is not handled as a directory
-+        # Issue #141707
-+        buf = io.BytesIO()
-+        with tarfile.open(mode='w', fileobj=buf, format=self.format) as tar:
-+            ti = tarfile.TarInfo()
-+            ti.type = tarfile.AREGTYPE
-+            ti.name = ('a' * 99) + '/' + ('b' * 3)
-+            tar.addfile(ti)
-+
-+            expected = {t.name: t.type for t in tar.getmembers()}
-+
-+        buf.seek(0)
-+        with tarfile.open(mode='r', fileobj=buf) as tar:
-+            actual = {t.name: t.type for t in tar.getmembers()}
-+
-+        self.assertEqual(expected, actual)
-+
-+
- class GNUReadTest(LongnameTest, ReadTest, unittest.TestCase):
- 
-     subdir = "gnu"
-diff --git a/Misc/ACKS b/Misc/ACKS
-index a6e63a991f..30d5f99ebb 100644
---- a/Misc/ACKS
-+++ b/Misc/ACKS
-@@ -1492,6 +1492,7 @@ Dhushyanth Ramasamy
- Ashwin Ramaswami
- Jeff Ramnani
- Bayard Randel
-+Eashwar Ranganathan
- Varpu Rantala
- Brodie Rao
- Rémi Rampin
--- 
-2.35.6
-
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11940.patch b/meta/recipes-devtools/python/python3/CVE-2026-11940.patch
deleted file mode 100644
index 0851138ae89..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2026-11940.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 91a9bd79cdbab8f8518c4a5e669b3f19680a2f31 Mon Sep 17 00:00:00 2001
-From: Stan Ulbrych <stan@python.org>
-Date: Tue, 23 Jun 2026 14:31:38 +0100
-Subject: [PATCH] gh-151558: Fix symlink escape via `tarfile`
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
-index 59d3f6e5cce1..83226e907e4b 100755
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -2650,6 +2650,9 @@ def makelink_with_filter(self, tarinfo, targetpath,
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
-index 759fa03ead70..29719d95b6c1 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -4080,6 +4080,30 @@ def test_sneaky_hardlink_fallback(self):
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
index 36334f247e6..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From a83ebdb495a9cbd28a03675acdeda235fade90b3 Mon Sep 17 00:00:00 2001
-From: Petr Viktorin <encukou@gmail.com>
-Date: Tue, 23 Jun 2026 15:13:30 +0200
-Subject: [PATCH] gh-151981: Make tarfile._Stream.seek break at EOF (GH-151982)
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
-index 83226e907e4b..c0007a78f700 100755
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -516,7 +516,9 @@ def seek(self, pos=0):
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
-index 29719d95b6c1..8aeb2e1b1b9a 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -4480,6 +4480,22 @@ def valueerror_filter(tarinfo, path):
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
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-1502.patch b/meta/recipes-devtools/python/python3/CVE-2026-1502.patch
deleted file mode 100644
index be6a8379a85..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2026-1502.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 05ed7ce7ae9e17c23a04085b2539fe6d6d3cef69 Mon Sep 17 00:00:00 2001
-From: Seth Larson <seth@python.org>
-Date: Fri, 10 Apr 2026 10:21:42 -0500
-Subject: [PATCH] gh-146211: Reject CR/LF in HTTP tunnel request headers
- (#146212)
-
-Co-authored-by: Illia Volochii <illia.volochii@gmail.com>
-
-CVE: CVE-2026-1502
-Upstream-Status: Backport [https://github.com/python/cpython/commit/05ed7ce7ae9e17c23a04085b2539fe6d6d3cef69]
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- Lib/http/client.py                            | 11 ++++-
- Lib/test/test_httplib.py                      | 45 +++++++++++++++++++
- ...-03-20-09-29-42.gh-issue-146211.PQVbs7.rst |  2 +
- 3 files changed, 57 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Security/2026-03-20-09-29-42.gh-issue-146211.PQVbs7.rst
-
-diff --git a/Lib/http/client.py b/Lib/http/client.py
-index 70451d6..7db4807 100644
---- a/Lib/http/client.py
-+++ b/Lib/http/client.py
-@@ -972,13 +972,22 @@ class HTTPConnection:
-         return ip
- 
-     def _tunnel(self):
-+        if _contains_disallowed_url_pchar_re.search(self._tunnel_host):
-+            raise ValueError('Tunnel host can\'t contain control characters %r'
-+                             % (self._tunnel_host,))
-         connect = b"CONNECT %s:%d %s\r\n" % (
-             self._wrap_ipv6(self._tunnel_host.encode("idna")),
-             self._tunnel_port,
-             self._http_vsn_str.encode("ascii"))
-         headers = [connect]
-         for header, value in self._tunnel_headers.items():
--            headers.append(f"{header}: {value}\r\n".encode("latin-1"))
-+            header_bytes = header.encode("latin-1")
-+            value_bytes = value.encode("latin-1")
-+            if not _is_legal_header_name(header_bytes):
-+                raise ValueError('Invalid header name %r' % (header_bytes,))
-+            if _is_illegal_header_value(value_bytes):
-+                raise ValueError('Invalid header value %r' % (value_bytes,))
-+            headers.append(b"%s: %s\r\n" % (header_bytes, value_bytes))
-         headers.append(b"\r\n")
-         # Making a single send() call instead of one per line encourages
-         # the host OS to use a more optimal packet size instead of
-diff --git a/Lib/test/test_httplib.py b/Lib/test/test_httplib.py
-index e46dac0..e027d93 100644
---- a/Lib/test/test_httplib.py
-+++ b/Lib/test/test_httplib.py
-@@ -369,6 +369,51 @@ class HeaderTests(TestCase):
-                 with self.assertRaisesRegex(ValueError, 'Invalid header'):
-                     conn.putheader(name, value)
- 
-+    def test_invalid_tunnel_headers(self):
-+        cases = (
-+            ('Invalid\r\nName', 'ValidValue'),
-+            ('Invalid\rName', 'ValidValue'),
-+            ('Invalid\nName', 'ValidValue'),
-+            ('\r\nInvalidName', 'ValidValue'),
-+            ('\rInvalidName', 'ValidValue'),
-+            ('\nInvalidName', 'ValidValue'),
-+            (' InvalidName', 'ValidValue'),
-+            ('\tInvalidName', 'ValidValue'),
-+            ('Invalid:Name', 'ValidValue'),
-+            (':InvalidName', 'ValidValue'),
-+            ('ValidName', 'Invalid\r\nValue'),
-+            ('ValidName', 'Invalid\rValue'),
-+            ('ValidName', 'Invalid\nValue'),
-+            ('ValidName', 'InvalidValue\r\n'),
-+            ('ValidName', 'InvalidValue\r'),
-+            ('ValidName', 'InvalidValue\n'),
-+        )
-+        for name, value in cases:
-+            with self.subTest((name, value)):
-+                conn = client.HTTPConnection('example.com')
-+                conn.set_tunnel('tunnel', headers={
-+                    name: value
-+                })
-+                conn.sock = FakeSocket('')
-+                with self.assertRaisesRegex(ValueError, 'Invalid header'):
-+                    conn._tunnel()  # Called in .connect()
-+
-+    def test_invalid_tunnel_host(self):
-+        cases = (
-+            'invalid\r.host',
-+            '\ninvalid.host',
-+            'invalid.host\r\n',
-+            'invalid.host\x00',
-+            'invalid host',
-+        )
-+        for tunnel_host in cases:
-+            with self.subTest(tunnel_host):
-+                conn = client.HTTPConnection('example.com')
-+                conn.set_tunnel(tunnel_host)
-+                conn.sock = FakeSocket('')
-+                with self.assertRaisesRegex(ValueError, 'Tunnel host can\'t contain control characters'):
-+                    conn._tunnel()  # Called in .connect()
-+
-     def test_headers_debuglevel(self):
-         body = (
-             b'HTTP/1.1 200 OK\r\n'
-diff --git a/Misc/NEWS.d/next/Security/2026-03-20-09-29-42.gh-issue-146211.PQVbs7.rst b/Misc/NEWS.d/next/Security/2026-03-20-09-29-42.gh-issue-146211.PQVbs7.rst
-new file mode 100644
-index 0000000..4993633
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2026-03-20-09-29-42.gh-issue-146211.PQVbs7.rst
-@@ -0,0 +1,2 @@
-+Reject CR/LF characters in tunnel request headers for the
-+HTTPConnection.set_tunnel() method.
--- 
-2.50.1
-
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-3644_CVE-2026-0672.patch b/meta/recipes-devtools/python/python3/CVE-2026-3644_CVE-2026-0672.patch
deleted file mode 100644
index 42d8133a183..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2026-3644_CVE-2026-0672.patch
+++ /dev/null
@@ -1,154 +0,0 @@
-From 6e291d2eba0b6820bc924e68f1db750328bf6c75 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 16 Mar 2026 15:05:13 +0100
-Subject: [PATCH] [3.13] gh-145599, CVE 2026-3644: Reject control
- characters in `http.cookies.Morsel.update()` (GH-145600) (#146024)
-
-gh-145599, CVE 2026-3644: Reject control characters in `http.cookies.Morsel.update()` (GH-145600)
-
-Reject control characters in `http.cookies.Morsel.update()` and `http.cookies.BaseCookie.js_output`.
-
-CVE: CVE-2026-3644 CVE-2026-0672
-Upstream-Status: Backport [https://github.com/python/cpython/commit/d16ecc6c3626f0e2cc8f08c309c83934e8a979dd]
-
-Backport Changes:
-- This file is not present in the current version and is therefore omitted
-  Misc/NEWS.d/next/Security/2026-03-06-17-03-38.gh-issue-145599.kchwZV.rst
-
-(cherry picked from commit 57e88c1cf95e1481b94ae57abe1010469d47a6b4)
-
-Co-authored-by: Stan Ulbrych <89152624+StanFromIreland@users.noreply.github.com>
-Co-authored-by: Victor Stinner <vstinner@python.org>
-Co-authored-by: Victor Stinner <victor.stinner@gmail.com>
-(cherry picked from commit d16ecc6c3626f0e2cc8f08c309c83934e8a979dd)
-Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
----
- Lib/http/cookies.py           | 24 ++++++++++++++++++----
- Lib/test/test_http_cookies.py | 38 +++++++++++++++++++++++++++++++++++
- 2 files changed, 58 insertions(+), 4 deletions(-)
-
-diff --git a/Lib/http/cookies.py b/Lib/http/cookies.py
-index d0a69cbe191..63d119ad46c 100644
---- a/Lib/http/cookies.py
-+++ b/Lib/http/cookies.py
-@@ -335,9 +335,16 @@ class Morsel(dict):
-             key = key.lower()
-             if key not in self._reserved:
-                 raise CookieError("Invalid attribute %r" % (key,))
-+            if _has_control_character(key, val):
-+                raise CookieError("Control characters are not allowed in "
-+                                  f"cookies {key!r} {val!r}")
-             data[key] = val
-         dict.update(self, data)
- 
-+    def __ior__(self, values):
-+        self.update(values)
-+        return self
-+
-     def isReservedKey(self, K):
-         return K.lower() in self._reserved
- 
-@@ -363,9 +370,15 @@ class Morsel(dict):
-         }
- 
-     def __setstate__(self, state):
--        self._key = state['key']
--        self._value = state['value']
--        self._coded_value = state['coded_value']
-+        key = state['key']
-+        value = state['value']
-+        coded_value = state['coded_value']
-+        if _has_control_character(key, value, coded_value):
-+            raise CookieError("Control characters are not allowed in cookies "
-+                              f"{key!r} {value!r} {coded_value!r}")
-+        self._key = key
-+        self._value = value
-+        self._coded_value = coded_value
- 
-     def output(self, attrs=None, header="Set-Cookie:"):
-         return "%s %s" % (header, self.OutputString(attrs))
-@@ -377,13 +390,16 @@ class Morsel(dict):
- 
-     def js_output(self, attrs=None):
-         # Print javascript
-+        output_string = self.OutputString(attrs)
-+        if _has_control_character(output_string):
-+            raise CookieError("Control characters are not allowed in cookies")
-         return """
-         <script type="text/javascript">
-         <!-- begin hiding
-         document.cookie = \"%s\";
-         // end hiding -->
-         </script>
--        """ % (self.OutputString(attrs).replace('"', r'\"'))
-+        """ % (output_string.replace('"', r'\"'))
- 
-     def OutputString(self, attrs=None):
-         # Build up our result
-diff --git a/Lib/test/test_http_cookies.py b/Lib/test/test_http_cookies.py
-index f196bcc48e3..2478a6c630f 100644
---- a/Lib/test/test_http_cookies.py
-+++ b/Lib/test/test_http_cookies.py
-@@ -573,6 +573,14 @@ class MorselTests(unittest.TestCase):
-             with self.assertRaises(cookies.CookieError):
-                 morsel["path"] = c0
- 
-+            # .__setstate__()
-+            with self.assertRaises(cookies.CookieError):
-+                morsel.__setstate__({'key': c0, 'value': 'val', 'coded_value': 'coded'})
-+            with self.assertRaises(cookies.CookieError):
-+                morsel.__setstate__({'key': 'key', 'value': c0, 'coded_value': 'coded'})
-+            with self.assertRaises(cookies.CookieError):
-+                morsel.__setstate__({'key': 'key', 'value': 'val', 'coded_value': c0})
-+
-             # .setdefault()
-             with self.assertRaises(cookies.CookieError):
-                 morsel.setdefault("path", c0)
-@@ -587,6 +595,18 @@ class MorselTests(unittest.TestCase):
-             with self.assertRaises(cookies.CookieError):
-                 morsel.set("path", "val", c0)
- 
-+            # .update()
-+            with self.assertRaises(cookies.CookieError):
-+                morsel.update({"path": c0})
-+            with self.assertRaises(cookies.CookieError):
-+                morsel.update({c0: "val"})
-+
-+            # .__ior__()
-+            with self.assertRaises(cookies.CookieError):
-+                morsel |= {"path": c0}
-+            with self.assertRaises(cookies.CookieError):
-+                morsel |= {c0: "val"}
-+
-     def test_control_characters_output(self):
-         # Tests that even if the internals of Morsel are modified
-         # that a call to .output() has control character safeguards.
-@@ -607,6 +627,24 @@ class MorselTests(unittest.TestCase):
-             with self.assertRaises(cookies.CookieError):
-                 cookie.output()
- 
-+        # Tests that .js_output() also has control character safeguards.
-+        for c0 in support.control_characters_c0():
-+            morsel = cookies.Morsel()
-+            morsel.set("key", "value", "coded-value")
-+            morsel._key = c0  # Override private variable.
-+            cookie = cookies.SimpleCookie()
-+            cookie["cookie"] = morsel
-+            with self.assertRaises(cookies.CookieError):
-+                cookie.js_output()
-+
-+            morsel = cookies.Morsel()
-+            morsel.set("key", "value", "coded-value")
-+            morsel._coded_value = c0  # Override private variable.
-+            cookie = cookies.SimpleCookie()
-+            cookie["cookie"] = morsel
-+            with self.assertRaises(cookies.CookieError):
-+                cookie.js_output()
-+
- 
- def load_tests(loader, tests, pattern):
-     tests.addTest(doctest.DocTestSuite(cookies))
--- 
-2.35.6
-
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-4224.patch b/meta/recipes-devtools/python/python3/CVE-2026-4224.patch
deleted file mode 100644
index 09dd2dda003..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2026-4224.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From ca301e24e20d1d9d58bbd432ff103cab2cb87128 Mon Sep 17 00:00:00 2001
-From: Stan Ulbrych <stan@python.org>
-Date: Wed, 8 Apr 2026 11:27:39 +0100
-Subject: [PATCH] gh-145986: Avoid unbound C recursion in `conv_content_model`
- in `pyexpat.c` (CVE-2026-4224) (GH-145987) (#146000)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-* [3.11] gh-145986: Avoid unbound C recursion in `conv_content_model` in `pyexpat.c` (CVE-2026-4224) (GH-145987)
-
-Fix C stack overflow (CVE-2026-4224) when an Expat parser
-with a registered `ElementDeclHandler` parses inline DTD
-containing deeply nested content model.
-
----------
-(cherry picked from commit eb0e8be3a7e11b87d198a2c3af1ed0eccf532768)
-(cherry picked from commit e5caf45faac74b0ed869e3336420cffd3510ce6e)
-
-Co-authored-by: Stan Ulbrych <89152624+StanFromIreland@users.noreply.github.com>
-Co-authored-by: Bénédikt Tran <10796600+picnixz@users.noreply.github.com>
-
-* Update Misc/NEWS.d/next/Security/2026-03-14-17-31-39.gh-issue-145986.ifSSr8.rst
-
----------
-
-Co-authored-by: Bénédikt Tran <10796600+picnixz@users.noreply.github.com>
-
-CVE: CVE-2026-4224
-Upstream-Status: Backport [https://github.com/python/cpython/commit/642865ddf4b232da1f3b1f7abcfa3254c4bfe785]
-
-Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
----
- Lib/test/test_pyexpat.py                       | 18 ++++++++++++++++++
- ...6-03-14-17-31-39.gh-issue-145986.ifSSr8.rst |  4 ++++
- Modules/pyexpat.c                              |  9 ++++++++-
- 3 files changed, 30 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Security/2026-03-14-17-31-39.gh-issue-145986.ifSSr8.rst
-
-diff --git a/Lib/test/test_pyexpat.py b/Lib/test/test_pyexpat.py
-index 38f951573f0..37d9086f40a 100644
---- a/Lib/test/test_pyexpat.py
-+++ b/Lib/test/test_pyexpat.py
-@@ -675,6 +675,24 @@ class ChardataBufferTest(unittest.TestCase):
-         parser.Parse(xml2, True)
-         self.assertEqual(self.n, 4)
- 
-+class ElementDeclHandlerTest(unittest.TestCase):
-+    def test_deeply_nested_content_model(self):
-+        # This should raise a RecursionError and not crash.
-+        # See https://github.com/python/cpython/issues/145986.
-+        N = 500_000
-+        data = (
-+            b'<!DOCTYPE root [\n<!ELEMENT root '
-+            + b'(a, ' * N + b'a' + b')' * N
-+            + b'>\n]>\n<root/>\n'
-+        )
-+
-+        parser = expat.ParserCreate()
-+        parser.ElementDeclHandler = lambda _1, _2: None
-+        with support.infinite_recursion():
-+            with self.assertRaises(RecursionError):
-+                parser.Parse(data)
-+
-+
- class MalformedInputTest(unittest.TestCase):
-     def test1(self):
-         xml = b"\0\r\n"
-diff --git a/Misc/NEWS.d/next/Security/2026-03-14-17-31-39.gh-issue-145986.ifSSr8.rst b/Misc/NEWS.d/next/Security/2026-03-14-17-31-39.gh-issue-145986.ifSSr8.rst
-new file mode 100644
-index 00000000000..cb9dbadb72d
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2026-03-14-17-31-39.gh-issue-145986.ifSSr8.rst
-@@ -0,0 +1,4 @@
-+:mod:`xml.parsers.expat`: Fixed a crash caused by unbounded C recursion when
-+converting deeply nested XML content models with
-+:meth:`~xml.parsers.expat.xmlparser.ElementDeclHandler`.
-+This addresses `CVE-2026-4224 <https://www.cve.org/CVERecord?id=CVE-2026-4224>`_.
-diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
-index 79492ca5c4f..8673540f358 100644
---- a/Modules/pyexpat.c
-+++ b/Modules/pyexpat.c
-@@ -3,6 +3,7 @@
- #endif
- 
- #include "Python.h"
-+#include "pycore_ceval.h"           // _Py_EnterRecursiveCall()
- #include "pycore_runtime.h"         // _Py_ID()
- #include <ctype.h>
- 
-@@ -578,6 +579,10 @@ static PyObject *
- conv_content_model(XML_Content * const model,
-                    PyObject *(*conv_string)(const XML_Char *))
- {
-+    if (_Py_EnterRecursiveCall(" in conv_content_model")) {
-+        return NULL;
-+    }
-+
-     PyObject *result = NULL;
-     PyObject *children = PyTuple_New(model->numchildren);
-     int i;
-@@ -589,7 +594,7 @@ conv_content_model(XML_Content * const model,
-                                                  conv_string);
-             if (child == NULL) {
-                 Py_XDECREF(children);
--                return NULL;
-+                goto done;
-             }
-             PyTuple_SET_ITEM(children, i, child);
-         }
-@@ -597,6 +602,8 @@ conv_content_model(XML_Content * const model,
-                                model->type, model->quant,
-                                conv_string,model->name, children);
-     }
-+done:
-+    _Py_LeaveRecursiveCall();
-     return result;
- }
- 
--- 
-2.34.1
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-4519_CVE-2026-4786.patch b/meta/recipes-devtools/python/python3/CVE-2026-4519_CVE-2026-4786.patch
deleted file mode 100644
index 6a4714f25ae..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2026-4519_CVE-2026-4786.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From b9af29b9f2f880cdcdc49a1460743680f59dcb4e Mon Sep 17 00:00:00 2001
-From: Stan Ulbrych <stan@python.org>
-Date: Mon, 13 Apr 2026 22:41:51 +0100
-Subject: [PATCH] [3.11] gh-148169: Fix webbrowser `%action` substitution
- bypass of dash-prefix check (GH-148170) (#148520)
-
-CVE: CVE-2026-4519 CVE-2026-4786
-Upstream-Status: Backport [https://github.com/python/cpython/commit/f4654824ae0850ac87227fb270f9057477946769]
-
-Backport Changes:
-- This file is not present in the current version and is therefore omitted.
-  Misc/NEWS.d/next/Security/2026-03-31-09-15-51.gh-issue-148169.EZJzz2.rst
-
-(cherry picked from commit d22922c8a7958353689dc4763dd72da2dea03fff)
-(cherry picked from commit f4654824ae0850ac87227fb270f9057477946769)
-Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
----
- Lib/test/test_webbrowser.py | 8 ++++++++
- Lib/webbrowser.py           | 5 +++--
- 2 files changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/Lib/test/test_webbrowser.py b/Lib/test/test_webbrowser.py
-index c9bf525360d..1d21f133725 100644
---- a/Lib/test/test_webbrowser.py
-+++ b/Lib/test/test_webbrowser.py
-@@ -103,6 +103,14 @@ class ChromeCommandTest(CommandTestMixin, unittest.TestCase):
-                    options=[],
-                    arguments=[URL])
- 
-+    def test_reject_action_dash_prefixes(self):
-+        browser = self.browser_class(name=CMD_NAME)
-+        with self.assertRaises(ValueError):
-+            browser.open('%action--incognito')
-+        # new=1: action is "--new-window", so "%action" itself expands to
-+        # a dash-prefixed flag even with no dash in the original URL.
-+        with self.assertRaises(ValueError):
-+            browser.open('%action', new=1)
- 
- class EdgeCommandTest(CommandTestMixin, unittest.TestCase):
- 
-diff --git a/Lib/webbrowser.py b/Lib/webbrowser.py
-index 000e89275b7..97c4eec9080 100755
---- a/Lib/webbrowser.py
-+++ b/Lib/webbrowser.py
-@@ -268,7 +268,6 @@ class UnixBrowser(BaseBrowser):
- 
-     def open(self, url, new=0, autoraise=True):
-         sys.audit("webbrowser.open", url)
--        self._check_url(url)
-         if new == 0:
-             action = self.remote_action
-         elif new == 1:
-@@ -282,7 +281,9 @@ class UnixBrowser(BaseBrowser):
-             raise Error("Bad 'new' parameter to open(); " +
-                         "expected 0, 1, or 2, got %s" % new)
- 
--        args = [arg.replace("%s", url).replace("%action", action)
-+        self._check_url(url.replace("%action", action))
-+
-+        args = [arg.replace("%action", action).replace("%s", url)
-                 for arg in self.remote_args]
-         args = [arg for arg in args if arg]
-         success = self._invoke(args, True, autoraise, url)
--- 
-2.35.6
-
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-4519_p1.patch b/meta/recipes-devtools/python/python3/CVE-2026-4519_p1.patch
deleted file mode 100644
index 1514d2c5414..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2026-4519_p1.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From 7df48dd3c6330611a04d85a5159c0ea424dc1e62 Mon Sep 17 00:00:00 2001
-From: Pinky <pinky00ch@gmail.com>
-Date: Wed, 25 Mar 2026 01:02:37 +0530
-Subject: [PATCH] [3.12] gh-143930: Reject leading dashes in webbrowser
- URLs (GH-146360)
-
-CVE: CVE-2026-4519
-Upstream-Status: Backport [https://github.com/python/cpython/commit/cbba6119391112aba9c5aebf7b94aea447922c48]
-
-Backport Changes:
-- This file is not present in the current version and is therefore omitted
-  Misc/NEWS.d/next/Security/2026-01-16-12-04-49.gh-issue-143930.zYC5x3.rst
-
-(cherry picked from commit 82a24a4442312bdcfc4c799885e8b3e00990f02b)
-
-Co-authored-by: Seth Michael Larson <seth@python.org>
-(cherry picked from commit cbba6119391112aba9c5aebf7b94aea447922c48)
-Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
----
- Lib/test/test_webbrowser.py |  5 +++++
- Lib/webbrowser.py           | 12 ++++++++++++
- 2 files changed, 17 insertions(+)
-
-diff --git a/Lib/test/test_webbrowser.py b/Lib/test/test_webbrowser.py
-index 2d695bc8831..60f094fd6a1 100644
---- a/Lib/test/test_webbrowser.py
-+++ b/Lib/test/test_webbrowser.py
-@@ -59,6 +59,11 @@ class GenericBrowserCommandTest(CommandTestMixin, unittest.TestCase):
-                    options=[],
-                    arguments=[URL])
- 
-+    def test_reject_dash_prefixes(self):
-+        browser = self.browser_class(name=CMD_NAME)
-+        with self.assertRaises(ValueError):
-+            browser.open(f"--key=val {URL}")
-+
- 
- class BackgroundBrowserCommandTest(CommandTestMixin, unittest.TestCase):
- 
-diff --git a/Lib/webbrowser.py b/Lib/webbrowser.py
-index 13b9e85f9e1..0bdb644d7db 100755
---- a/Lib/webbrowser.py
-+++ b/Lib/webbrowser.py
-@@ -158,6 +158,12 @@ class BaseBrowser(object):
-     def open_new_tab(self, url):
-         return self.open(url, 2)
- 
-+    @staticmethod
-+    def _check_url(url):
-+        """Ensures that the URL is safe to pass to subprocesses as a parameter"""
-+        if url and url.lstrip().startswith("-"):
-+            raise ValueError(f"Invalid URL: {url}")
-+
- 
- class GenericBrowser(BaseBrowser):
-     """Class for all browsers started with a command
-@@ -175,6 +181,7 @@ class GenericBrowser(BaseBrowser):
- 
-     def open(self, url, new=0, autoraise=True):
-         sys.audit("webbrowser.open", url)
-+        self._check_url(url)
-         cmdline = [self.name] + [arg.replace("%s", url)
-                                  for arg in self.args]
-         try:
-@@ -195,6 +202,7 @@ class BackgroundBrowser(GenericBrowser):
-         cmdline = [self.name] + [arg.replace("%s", url)
-                                  for arg in self.args]
-         sys.audit("webbrowser.open", url)
-+        self._check_url(url)
-         try:
-             if sys.platform[:3] == 'win':
-                 p = subprocess.Popen(cmdline)
-@@ -260,6 +268,7 @@ class UnixBrowser(BaseBrowser):
- 
-     def open(self, url, new=0, autoraise=True):
-         sys.audit("webbrowser.open", url)
-+        self._check_url(url)
-         if new == 0:
-             action = self.remote_action
-         elif new == 1:
-@@ -350,6 +359,7 @@ class Konqueror(BaseBrowser):
- 
-     def open(self, url, new=0, autoraise=True):
-         sys.audit("webbrowser.open", url)
-+        self._check_url(url)
-         # XXX Currently I know no way to prevent KFM from opening a new win.
-         if new == 2:
-             action = "newTab"
-@@ -554,6 +564,7 @@ if sys.platform[:3] == "win":
-     class WindowsDefault(BaseBrowser):
-         def open(self, url, new=0, autoraise=True):
-             sys.audit("webbrowser.open", url)
-+            self._check_url(url)
-             try:
-                 os.startfile(url)
-             except OSError:
-@@ -638,6 +649,7 @@ if sys.platform == 'darwin':
- 
-         def open(self, url, new=0, autoraise=True):
-             sys.audit("webbrowser.open", url)
-+            self._check_url(url)
-             if self.name == 'default':
-                 script = 'open location "%s"' % url.replace('"', '%22') # opens in default browser
-             else:
--- 
-2.35.6
-
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-4519_p2.patch b/meta/recipes-devtools/python/python3/CVE-2026-4519_p2.patch
deleted file mode 100644
index 7ee145e5e80..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2026-4519_p2.patch
+++ /dev/null
@@ -1,159 +0,0 @@
-From 3ca64ff1722d2410a4e50e760de70f6279fa99fa Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Sat, 4 Apr 2026 00:53:49 +0200
-Subject: [PATCH] [3.11] gh-143930: Tweak the exception message and
- increase test coverage (GH-146476) (GH-148045) (GH-148051) (GH-148052)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-CVE: CVE-2026-4519
-Upstream-Status: Backport [https://github.com/python/cpython/commit/96fc5048605863c7b6fd6289643feb0e97edd96c]
-
-Backport Changes:
-- This file is not present in the current version and is therefore omitted.
-  Misc/NEWS.d/next/Security/2026-01-16-12-04-49.gh-issue-143930.zYC5x3.rst
-- The file introduced in v3.12 by this commit;
-  https://github.com/python/cpython/commit/cbba6119391112aba9c5aebf7b94aea447922c48
-
-(cherry picked from commit cc023511238ad93ecc8796157c6f9139a2bb2932)
-(cherry picked from commit 89bfb8e5ed3c7caa241028f1a4eac5f6275a46a4)
-(cherry picked from commit 3681d47a440865aead912a054d4599087b4270dd)
-
-Co-authored-by: Łukasz Langa <lukasz@langa.pl>
-(cherry picked from commit 96fc5048605863c7b6fd6289643feb0e97edd96c)
-Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
----
- Lib/test/test_webbrowser.py | 81 ++++++++++++++++++++++++++++++++++---
- Lib/webbrowser.py           |  2 +-
- 2 files changed, 76 insertions(+), 7 deletions(-)
-
-diff --git a/Lib/test/test_webbrowser.py b/Lib/test/test_webbrowser.py
-index 60f094fd6a1..c9bf525360d 100644
---- a/Lib/test/test_webbrowser.py
-+++ b/Lib/test/test_webbrowser.py
-@@ -1,6 +1,7 @@
-+import io
-+import os
- import webbrowser
- import unittest
--import os
- import sys
- import subprocess
- from unittest import mock
-@@ -49,6 +50,14 @@ class CommandTestMixin:
-             popen_args.pop(popen_args.index(option))
-         self.assertEqual(popen_args, arguments)
- 
-+    def test_reject_dash_prefixes(self):
-+        browser = self.browser_class(name=CMD_NAME)
-+        with self.assertRaisesRegex(
-+            ValueError,
-+            r"^Invalid URL \(leading dash disallowed\): '--key=val http.*'$"
-+        ):
-+            browser.open(f"--key=val {URL}")
-+
- 
- class GenericBrowserCommandTest(CommandTestMixin, unittest.TestCase):
- 
-@@ -59,11 +68,6 @@ class GenericBrowserCommandTest(CommandTestMixin, unittest.TestCase):
-                    options=[],
-                    arguments=[URL])
- 
--    def test_reject_dash_prefixes(self):
--        browser = self.browser_class(name=CMD_NAME)
--        with self.assertRaises(ValueError):
--            browser.open(f"--key=val {URL}")
--
- 
- class BackgroundBrowserCommandTest(CommandTestMixin, unittest.TestCase):
- 
-@@ -224,6 +228,71 @@ class ELinksCommandTest(CommandTestMixin, unittest.TestCase):
-                    arguments=['openURL({},new-tab)'.format(URL)])
- 
- 
-+class MockPopenPipe:
-+    def __init__(self, cmd, mode):
-+        self.cmd = cmd
-+        self.mode = mode
-+        self.pipe = io.StringIO()
-+        self._closed = False
-+
-+    def write(self, buf):
-+        self.pipe.write(buf)
-+
-+    def close(self):
-+        self._closed = True
-+        return None
-+
-+
-+@unittest.skipUnless(sys.platform == "darwin", "macOS specific test")
-+class MacOSXOSAScriptTest(unittest.TestCase):
-+    def setUp(self):
-+        # Ensure that 'BROWSER' is not set to 'open' or something else.
-+        # See: https://github.com/python/cpython/issues/131254.
-+        env = self.enterContext(os_helper.EnvironmentVarGuard())
-+        env.unset("BROWSER")
-+
-+        support.patch(self, os, "popen", self.mock_popen)
-+        self.browser = webbrowser.MacOSXOSAScript("default")
-+
-+    def mock_popen(self, cmd, mode):
-+        self.popen_pipe = MockPopenPipe(cmd, mode)
-+        return self.popen_pipe
-+
-+    def test_default(self):
-+        browser = webbrowser.get()
-+        assert isinstance(browser, webbrowser.MacOSXOSAScript)
-+        self.assertEqual(browser.name, "default")
-+
-+    def test_default_open(self):
-+        url = "https://python.org"
-+        self.browser.open(url)
-+        self.assertTrue(self.popen_pipe._closed)
-+        self.assertEqual(self.popen_pipe.cmd, "osascript")
-+        script = self.popen_pipe.pipe.getvalue()
-+        self.assertEqual(script.strip(), f'open location "{url}"')
-+
-+    def test_url_quote(self):
-+        self.browser.open('https://python.org/"quote"')
-+        script = self.popen_pipe.pipe.getvalue()
-+        self.assertEqual(
-+            script.strip(), 'open location "https://python.org/%22quote%22"'
-+        )
-+
-+    def test_explicit_browser(self):
-+        browser = webbrowser.MacOSXOSAScript("safari")
-+        browser.open("https://python.org")
-+        script = self.popen_pipe.pipe.getvalue()
-+        self.assertIn('tell application "safari"', script)
-+        self.assertIn('open location "https://python.org"', script)
-+
-+    def test_reject_dash_prefixes(self):
-+        with self.assertRaisesRegex(
-+            ValueError,
-+            r"^Invalid URL \(leading dash disallowed\): '--key=val http.*'$"
-+        ):
-+            self.browser.open(f"--key=val {URL}")
-+
-+
- class BrowserRegistrationTest(unittest.TestCase):
- 
-     def setUp(self):
-diff --git a/Lib/webbrowser.py b/Lib/webbrowser.py
-index 0bdb644d7db..000e89275b7 100755
---- a/Lib/webbrowser.py
-+++ b/Lib/webbrowser.py
-@@ -162,7 +162,7 @@ class BaseBrowser(object):
-     def _check_url(url):
-         """Ensures that the URL is safe to pass to subprocesses as a parameter"""
-         if url and url.lstrip().startswith("-"):
--            raise ValueError(f"Invalid URL: {url}")
-+            raise ValueError(f"Invalid URL (leading dash disallowed): {url!r}")
- 
- 
- class GenericBrowser(BaseBrowser):
--- 
-2.35.6
-
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-6100.patch b/meta/recipes-devtools/python/python3/CVE-2026-6100.patch
deleted file mode 100644
index 9084101434b..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2026-6100.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From c3cf71c3366fe49acb776a639405c0eea6169c20 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 13 Apr 2026 03:35:24 +0200
-Subject: [PATCH] [3.13] gh-148395: Fix a possible UAF in
- `{LZMA,BZ2,_Zlib}Decompressor` (GH-148396) (#148479)
-
-gh-148395: Fix a possible UAF in `{LZMA,BZ2,_Zlib}Decompressor` (GH-148396)
-
-Fix dangling input pointer after `MemoryError` in _lzma/_bz2/_ZlibDecompressor.decompress
-(cherry picked from commit 8fc66aef6d7b3ae58f43f5c66f9366cc8cbbfcd2)
-
-Co-authored-by: Stan Ulbrych <stan@python.org>
-
-CVE: CVE-2026-6100
-Upstream-Status: Backport [https://github.com/python/cpython/commit/c3cf71c3366fe49acb776a639405c0eea6169c20]
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- .../Security/2026-04-10-16-28-21.gh-issue-148395.kfzm0G.rst  | 5 +++++
- Modules/_bz2module.c                                         | 1 +
- Modules/_lzmamodule.c                                        | 1 +
- Modules/zlibmodule.c                                         | 1 +
- 4 files changed, 8 insertions(+)
- create mode 100644 Misc/NEWS.d/next/Security/2026-04-10-16-28-21.gh-issue-148395.kfzm0G.rst
-
-diff --git a/Misc/NEWS.d/next/Security/2026-04-10-16-28-21.gh-issue-148395.kfzm0G.rst b/Misc/NEWS.d/next/Security/2026-04-10-16-28-21.gh-issue-148395.kfzm0G.rst
-new file mode 100644
-index 0000000..9502189
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2026-04-10-16-28-21.gh-issue-148395.kfzm0G.rst
-@@ -0,0 +1,5 @@
-+Fix a dangling input pointer in :class:`lzma.LZMADecompressor`,
-+:class:`bz2.BZ2Decompressor`, and internal :class:`!zlib._ZlibDecompressor`
-+when memory allocation fails with :exc:`MemoryError`, which could let a
-+subsequent :meth:`!decompress` call read or write through a stale pointer to
-+the already-released caller buffer.
-diff --git a/Modules/_bz2module.c b/Modules/_bz2module.c
-index 97bd44b..a732e89 100644
---- a/Modules/_bz2module.c
-+++ b/Modules/_bz2module.c
-@@ -587,6 +587,7 @@ decompress(BZ2Decompressor *d, char *data, size_t len, Py_ssize_t max_length)
-     return result;
- 
- error:
-+    bzs->next_in = NULL;
-     Py_XDECREF(result);
-     return NULL;
- }
-diff --git a/Modules/_lzmamodule.c b/Modules/_lzmamodule.c
-index 7bbd656..103a6ef 100644
---- a/Modules/_lzmamodule.c
-+++ b/Modules/_lzmamodule.c
-@@ -1114,6 +1114,7 @@ decompress(Decompressor *d, uint8_t *data, size_t len, Py_ssize_t max_length)
-     return result;
- 
- error:
-+    lzs->next_in = NULL;
-     Py_XDECREF(result);
-     return NULL;
- }
-diff --git a/Modules/zlibmodule.c b/Modules/zlibmodule.c
-index f94c57e..9759593 100644
---- a/Modules/zlibmodule.c
-+++ b/Modules/zlibmodule.c
-@@ -1645,6 +1645,7 @@ decompress(ZlibDecompressor *self, uint8_t *data,
-     return result;
- 
- error:
-+    self->zst.next_in = NULL;
-     Py_XDECREF(result);
-     return NULL;
- }
--- 
-2.50.1
-
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210.patch b/meta/recipes-devtools/python/python3/CVE-2026-7210.patch
deleted file mode 100644
index 029eb713e42..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2026-7210.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From 2ed6138dea0bc94c726f879501e4525712e885d1 Mon Sep 17 00:00:00 2001
-From: Stan Ulbrych <stan@python.org>
-Date: Sun, 10 May 2026 18:36:26 +0100
-Subject: [PATCH] gh-149018: Use `XML_SetHashSalt16Bytes` in
- `pyexpat`/`_elementtree` when possible (#149023)
-
-
-CVE: CVE-2026-7210
-Upstream-Status: Backport [https://github.com/python/cpython/commit/24b8f12544468e4cedf5bfbe25442fcd495391e4]
-
-[yocto: Use weak symbol detection for XML_SetHashSalt16Bytes instead of
-XML_COMBINED_VERSION >= 20800, since our backported expat 2.6.4 provides
-the function but does not bump the version macros.]
-
-Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
----
- Include/pyexpat.h                             |  3 +++
- Include/pyhash.h                              |  8 +++++---
- .../2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst |  3 +++
- Modules/_elementtree.c                        |  8 ++++++--
- Modules/pyexpat.c                             | 22 ++++++++++++++++------
- 5 files changed, 33 insertions(+), 11 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst
-
-diff --git a/Include/pyexpat.h b/Include/pyexpat.h
-index 04548b7684a..d28d6828975 100644
---- a/Include/pyexpat.h
-+++ b/Include/pyexpat.h
-@@ -57,6 +57,9 @@ struct PyExpat_CAPI
-         XML_Parser parser, unsigned long long activationThresholdBytes);
-     XML_Bool (*SetAllocTrackerMaximumAmplification)(
-         XML_Parser parser, float maxAmplificationFactor);
-+    /* might be NULL for expat < 2.8.0 */
-+    XML_Bool (*SetHashSalt16Bytes)(
-+        XML_Parser parser, const uint8_t entropy[16]);
-     /* always add new stuff to the end! */
- };
- 
-diff --git a/Include/pyhash.h b/Include/pyhash.h
-index 182d223fab1..ec359bd2f35 100644
---- a/Include/pyhash.h
-+++ b/Include/pyhash.h
-@@ -39,14 +39,14 @@ PyAPI_FUNC(Py_hash_t) _Py_HashBytes(const void*, Py_ssize_t);
-  *   pppppppp ssssssss ........  fnv -- two Py_hash_t
-  *   k0k0k0k0 k1k1k1k1 ........  siphash -- two uint64_t
-  *   ........ ........ ssssssss  djbx33a -- 16 bytes padding + one Py_hash_t
-- *   ........ ........ eeeeeeee  pyexpat XML hash salt
-+ *   eeeeeeee eeeeeeee eeeeeeee  pyexpat XML hash salt
-  *
-  * memory layout on 32 bit systems
-  *   cccccccc cccccccc cccccccc  uc
-  *   ppppssss ........ ........  fnv -- two Py_hash_t
-  *   k0k0k0k0 k1k1k1k1 ........  siphash -- two uint64_t (*)
-  *   ........ ........ ssss....  djbx33a -- 16 bytes padding + one Py_hash_t
-- *   ........ ........ eeee....  pyexpat XML hash salt
-+ *   eeeeeeee eeeeeeee eeee....  pyexpat XML hash salt
-  *
-  * (*) The siphash member may not be available on 32 bit platforms without
-  *     an unsigned int64 data type.
-@@ -71,7 +71,9 @@ typedef union {
-         Py_hash_t suffix;
-     } djbx33a;
-     struct {
--        unsigned char padding[16];
-+        /* 16 bytes for XML_SetHashSalt16Bytes */
-+        uint8_t hashsalt16[16];
-+        /* 4/8 bytes for legacy XML_SetHashSalt */
-         Py_hash_t hashsalt;
-     } expat;
- } _Py_HashSecret_t;
-diff --git a/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst
-new file mode 100644
-index 00000000000..d1b5b368684
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst
-@@ -0,0 +1,3 @@
-+Improved protection against XML hash-flooding attacks in
-+:mod:`xml.parsers.expat` and :mod:`xml.etree.ElementTree` when Python is
-+compiled with libExpat 2.8.0 or later.
-diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
-index 56d1508af13..941376613b0 100644
---- a/Modules/_elementtree.c
-+++ b/Modules/_elementtree.c
-@@ -3657,8 +3657,12 @@ _elementtree_XMLParser___init___impl(XMLParserObject *self, PyObject *target,
-         PyErr_NoMemory();
-         return -1;
-     }
--    /* expat < 2.1.0 has no XML_SetHashSalt() */
--    if (EXPAT(st, SetHashSalt) != NULL) {
-+    // Prefer 16-byte entropy, only expat >= 2.8.0. See gh-149018
-+    if (EXPAT(st, SetHashSalt16Bytes) != NULL) {
-+        EXPAT(st, SetHashSalt16Bytes)(self->parser,
-+                                      _Py_HashSecret.expat.hashsalt16);
-+    }
-+    else if (EXPAT(st, SetHashSalt) != NULL) {
-         EXPAT(st, SetHashSalt)(self->parser,
-                            (unsigned long)_Py_HashSecret.expat.hashsalt);
-     }
-diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
-index 79492ca5c4f..47e3a1b2c00 100644
---- a/Modules/pyexpat.c
-+++ b/Modules/pyexpat.c
-@@ -14,6 +14,11 @@
- 
- #include "pyexpat.h"
- 
-+/* Use weak symbol to detect XML_SetHashSalt16Bytes at link time.
-+   This allows using the backported function from expat even when the
-+   version macros have not been bumped (e.g. expat 2.6.4 + CVE-2026-41080). */
-+#pragma weak XML_SetHashSalt16Bytes
-+
- /* Do not emit Clinic output to a file as that wreaks havoc with conditionally
-    included methods. */
- /*[clinic input]
-@@ -1388,10 +1393,16 @@ newxmlparseobject(pyexpat_state *state, const char *encoding,
-         Py_DECREF(self);
-         return NULL;
-     }
--#if XML_COMBINED_VERSION >= 20100
--    /* This feature was added upstream in libexpat 2.1.0. */
--    XML_SetHashSalt(self->itself,
--                    (unsigned long)_Py_HashSecret.expat.hashsalt);
-+    /* Prefer 16-byte entropy (expat >= 2.8.0 or backported). */
-+    if (XML_SetHashSalt16Bytes != NULL) {
-+        XML_SetHashSalt16Bytes(self->itself, _Py_HashSecret.expat.hashsalt16);
-+    }
-+#if XML_COMBINED_VERSION >= 20100
-+    else {
-+        /* This feature was added upstream in libexpat 2.1.0. */
-+        XML_SetHashSalt(self->itself,
-+                        (unsigned long)_Py_HashSecret.expat.hashsalt);
-+    }
- #endif
-     XML_SetUserData(self->itself, (void *)self);
-     XML_SetUnknownEncodingHandler(self->itself,
-@@ -2257,6 +2267,12 @@ pyexpat_exec(PyObject *mod)
- #else
-     capi->SetHashSalt = NULL;
- #endif
-+    /* Detect at runtime via weak symbol */
-+    if (XML_SetHashSalt16Bytes != NULL) {
-+        capi->SetHashSalt16Bytes = XML_SetHashSalt16Bytes;
-+    } else {
-+        capi->SetHashSalt16Bytes = NULL;
-+    }
- #if XML_COMBINED_VERSION >= 20600
-     capi->SetReparseDeferralEnabled = XML_SetReparseDeferralEnabled;
- #else
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-9669.patch b/meta/recipes-devtools/python/python3/CVE-2026-9669.patch
deleted file mode 100644
index 266c8beef05..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2026-9669.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 5b412e1f7bdb3e0667b2bc8b216ad216d59d8373 Mon Sep 17 00:00:00 2001
-From: Stan Ulbrych <stan@python.org>
-Date: Mon, 8 Jun 2026 11:55:32 +0200
-Subject: [PATCH] gh-150599: Prevent bz2 decompressor reuse after errors
- (GH-150600)
-
-CVE: CVE-2026-9669
-Upstream-Status: Backport [https://github.com/python/cpython/commit/5755d0f083949ff3c5bf3a37e673e24e306b036e]
-
-Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
----
- Lib/test/test_bz2.py | 15 +++++++++++++++
- Modules/_bz2module.c | 18 +++++++++++++++---
- 2 files changed, 30 insertions(+), 3 deletions(-)
-
-diff --git a/Lib/test/test_bz2.py b/Lib/test/test_bz2.py
-index cb730a1a46e2..dcbf6a298264 100644
---- a/Lib/test/test_bz2.py
-+++ b/Lib/test/test_bz2.py
-@@ -958,6 +958,21 @@ def test_failure(self):
-         # Previously, a second call could crash due to internal inconsistency
-         self.assertRaises(Exception, bzd.decompress, self.BAD_DATA * 30)
-
-+    def test_decompress_after_data_error(self):
-+        data = bytes.fromhex(
-+            "425a6839314159265359000000000000007fffff000000000000000000000000"
-+            "00000000000000000000000000000000000000e0370000000000000000000000"
-+            "000000000000000000000000000000000000000000000000000083f3"
-+        )
-+        bzd = BZ2Decompressor()
-+        with self.assertRaisesRegex(OSError, "Invalid data stream"):
-+            bzd.decompress(data)
-+        # Previously, a second call could crash due to internal inconsistency
-+        self.assertFalse(bzd.needs_input)
-+        self.assertFalse(bzd.eof)
-+        with self.assertRaisesRegex(ValueError, "previous error"):
-+            bzd.decompress(b'\x00' * 18)
-+
-     @support.refcount_test
-     def test_refleaks_in___init__(self):
-         gettotalrefcount = support.get_attribute(sys, 'gettotalrefcount')
-diff --git a/Modules/_bz2module.c b/Modules/_bz2module.c
-index 97bd44b4ac96..0b0916142f57 100644
---- a/Modules/_bz2module.c
-+++ b/Modules/_bz2module.c
-@@ -114,6 +114,7 @@ typedef struct {
- typedef struct {
-     PyObject_HEAD
-     bz_stream bzs;
-+    int bzerror;
-     char eof;           /* T_BOOL expects a char */
-     PyObject *unused_data;
-     char needs_input;
-@@ -453,8 +454,11 @@ decompress_buf(BZ2Decompressor *d, Py_ssize_t max_length)
-
-         d->bzs_avail_in_real += bzs->avail_in;
-
--        if (catch_bz2_error(bzret))
-+        if (catch_bz2_error(bzret)) {
-+            d->bzerror = bzret;
-+            d->needs_input = 0;
-             goto error;
-+        }
-         if (bzret == BZ_STREAM_END) {
-             d->eof = 1;
-             break;
-@@ -621,10 +625,17 @@ _bz2_BZ2Decompressor_decompress_impl(BZ2Decompressor *self, Py_buffer *data,
-     PyObject *result = NULL;
-
-     ACQUIRE_LOCK(self);
--    if (self->eof)
-+    if (self->eof) {
-         PyErr_SetString(PyExc_EOFError, "End of stream already reached");
--    else
-+    }
-+    else if (self->bzerror) {
-+        // Re-entering BZ2_bzDecompress() after an error can write out of bounds.
-+        PyErr_SetString(PyExc_ValueError,
-+                        "Decompressor is unusable after a previous error");
-+    }
-+    else {
-         result = decompress(self, data->buf, data->len, max_length);
-+    }
-     RELEASE_LOCK(self);
-     return result;
- }
-@@ -658,6 +669,7 @@ _bz2_BZ2Decompressor_impl(PyTypeObject *type)
-         return NULL;
-     }
-
-+    self->bzerror = 0;
-     self->needs_input = 1;
-     self->bzs_avail_in_real = 0;
-     self->input_buffer = NULL;
---
-2.54.0
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index fbe12a5fca2..4575a30bfcf 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index dce36a5..2d235d2 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2267,7 +2267,7 @@ COMPILEALL_OPTS=-j0
+@@ -2272,7 +2272,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.14.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3_3.12.13.bb
rename to meta/recipes-devtools/python/python3_3.12.14.bb
index b6ceb0c6343..7ee32601cd3 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.14.bb
@@ -31,30 +31,18 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-test_shutdown-skip-problematic-test.patch \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
-	   file://0001-test_deadlock-skip-problematic-test.patch \
-	   file://0001-test_active_children-skip-problematic-test.patch \
+           file://0001-test_deadlock-skip-problematic-test.patch \
+           file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
-           file://CVE-2026-1502.patch \
-           file://CVE-2026-6100.patch \
-           file://CVE-2026-3644_CVE-2026-0672.patch \
-           file://CVE-2026-4519_p1.patch \
-           file://CVE-2026-4519_p2.patch \
-           file://CVE-2026-4519_CVE-2026-4786.patch \
            file://CVE-2026-6019_p1.patch \
            file://CVE-2026-6019_p2.patch \
-           file://CVE-2025-13462.patch \
-           file://CVE-2026-4224.patch \
-           file://CVE-2026-11940.patch \
-           file://CVE-2026-11972.patch \
-           file://CVE-2026-9669.patch \
-           file://CVE-2026-7210.patch \
            "
 
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "c08bc65a81971c1dd5783182826503369466c7e67374d1646519adf05207b684"
+SRC_URI[sha256sum] = "5c8462af5790baf43a321a1559dbe0db06d1be4300fb85fb53c40060668e548a"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -69,6 +57,12 @@ CVE_STATUS[CVE-2022-26488] = "not-applicable-platform: Issue only applies on Win
 CVE_STATUS[CVE-2015-20107] = "upstream-wontfix: The mailcap module is insecure by design, so this can't be fixed in a meaningful way"
 CVE_STATUS[CVE-2023-36632] = "disputed: Not an issue, in fact expected behaviour"
 CVE_STATUS[CVE-2026-3087] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2025-12084] = "cpe-stable-backport: Fixed in v3.12.13"
+CVE_STATUS[CVE-2025-13462] = "cpe-stable-backport: Fixed in v3.12.14"
+CVE_STATUS[CVE-2025-13837] = "cpe-stable-backport: Fixed in v3.12.13"
+CVE_STATUS[CVE-2026-3644] = "cpe-stable-backport: Fixed in v3.12.14"
+CVE_STATUS[CVE-2026-4519] = "cpe-stable-backport: Fixed in v3.12.14"
+CVE_STATUS[CVE-2026-7210] = "cpe-stable-backport: Fixed in v3.12.14"
 
 PYTHON_MAJMIN = "3.12"
 

