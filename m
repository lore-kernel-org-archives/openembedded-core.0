Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEADC531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 08:40:59 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19067.1784796057358094076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 01:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=k76XZaye;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9417; q=dns/txt;
  s=iport01; t=1784796057; x=1786005657;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=C7RkNjhLNAceRqYzAFpwUcdoL4gypnpBRepXNOnr2NI=;
  b=k76XZayeEX3dgX1ALcIjp9Zecr+tWYmuL50QhJfsjVQrOt2g+JIhTQwY
   Qzeae+KFFKasR3mRFZN4PVuL08lPjdBSBRxIKMFrYkPfDp8HM4n6aKgIF
   cKnCNT98EQZu7m9BciLEKwz48zrLHRI6pQytVaU7KYNz/nmHVcD+JRz5L
   L4EAcL0jln2AiuDDP8+pbcjjIZ4esgpmTX1zm4VYc55kvoK/Uujt1N2PF
   I/l9aMo7R6BDxEFWL17tmNbtRMT29a+mQ1lW4uT5btxbqLpYtRij2Uh4X
   jPldNpFk2ZC3jUuMiGArreYtnjGfSocviU0epTrj4E6JieejTzRB/VcX7
   w==;
X-CSE-ConnectionGUID: AzcXi8MYQN2UGRUZ2qAz1Q==
X-CSE-MsgGUID: fSn+jdBMSDyAMEM21BLPOA==
X-IPAS-Result: =?us-ascii?q?A0BIAgAV02Fq/5P/Ja1aHgEBCxIMggULgld0XkNJhFeRc?=
 =?us-ascii?q?4EWnQiBfg8BAQEPRA0EAQGEP0aNXAImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaAQIBJgQLARgBLSwDAQIDAiYCLSMhgwIBgnQDE?=
 =?us-ascii?q?cE9en8zgQGDKAE/AkNQ2y4BCxQBBYEFLoU/gx0BhQJcGAGEfCcbG4FygRWCc?=
 =?us-ascii?q?3aBBYFcAQGBJ4QUgmoEgiKBDIFakFRIgQIcA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+FzRYGwcFgR2BLoEChFwjHwM5f4EwdUp3LWkBEheBJoIUgToCgR0DC?=
 =?us-ascii?q?xgNSBEsNxQZBD0BbgeNcCOCNAdgFBoBCiFWKYEgW6MHgiGhDwoog3WMIY9Ch?=
 =?us-ascii?q?XgaM4VbpRELmH2OCpZQhGmBaDyBRwsHcBWDIglKGQ+OOINrgX9Xy0InMgIJM?=
 =?us-ascii?q?gEBBwIHAQwBAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:xvzz/K+NWMqQILFciPjODrUD0H+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GYZX2uHPareMGD2c9B3Pdm380pSu5DXn9UwGgRl/CFEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbThPs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kfL4Yo+7ZSMFhor
 8E3Eg0/NAmqlbuPlefTpulE3qzPLeHxN48Z/3UlxjbDALN/GdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0In1lQ/UPrSmM+khXT7ejxJoXqepLE85C7YywkZPL3FbYOOIYXSHp0L9qqej
 mz9+Sf7Djs/D/CO4B+o1yj1rMv3ugquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzBCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r+z8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:HEFeQq7AH4WYFWaZaAPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 STdZUgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8gTFh4lgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3A3BIyhmuE5GtJ83Fspf2RwpL26IsMYHbtzSf1Ena?=
 =?us-ascii?q?eU1tGcoCnE0a56vpdxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AvC3WTg60M69bq/ebNSHik5Bmxoxm2KLtCkwntK4?=
 =?us-ascii?q?qquChGAkqYh25tBOeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208";a="513310306"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 08:40:56 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 28A3418000243;
	Thu, 23 Jul 2026 08:40:56 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id C1967CAB20D; Thu, 23 Jul 2026 01:40:55 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH] python3-setuptools: Fix CVE-2026-59890
Date: Thu, 23 Jul 2026 01:40:51 -0700
Message-Id: <20260723084051.1717306-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241793

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/pypa/setuptools/commit/dd9f436a36486b4cb8a4c70a2321548b0be09b8f
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59890

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-setuptools/CVE-2026-59890.patch   | 194 ++++++++++++++++++
 .../python/python3-setuptools_69.1.1.bb       |   1 +
 2 files changed, 195 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch b/meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch
new file mode 100644
index 0000000000..69f9bcf0d6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch
@@ -0,0 +1,194 @@
+From d54dff79a9568c25551092711c7ebc28422006a4 Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Sat, 27 Jun 2026 10:46:34 -0400
+Subject: [PATCH] Normalize Unicode form when matching MANIFEST.in patterns
+
+FileList matched MANIFEST.in patterns against on-disk names byte-for-byte
+with no Unicode normalization. On macOS APFS/HFS+, a file stored NFD and a
+pattern authored NFC denote the same file but differ byte-for-byte, so an
+exclude/global-exclude/recursive-exclude/prune rule could silently fail to
+drop a non-ASCII-named file, publishing it in the sdist despite the rule.
+
+Normalize both the pattern and the candidate path to NFC before matching,
+via a new unicode_utils.normalize() helper and a _NormalizedMatcher wrapper
+around the compiled pattern in translate_pattern.
+
+Fixes GHSA-h35f-9h28-mq5c.
+
+CVE: CVE-2026-59890
+Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/dd9f436a36486b4cb8a4c70a2321548b0be09b8f]
+
+Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>
+(cherry picked from commit dd9f436a36486b4cb8a4c70a2321548b0be09b8f)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ newsfragments/+ghsa-h35f-9h28-mq5c.bugfix.rst |  7 +++
+ setuptools/command/egg_info.py                | 28 +++++++++++-
+ setuptools/tests/test_manifest.py             | 45 +++++++++++++++++++
+ setuptools/unicode_utils.py                   | 14 ++++++
+ 4 files changed, 93 insertions(+), 1 deletion(-)
+ create mode 100644 newsfragments/+ghsa-h35f-9h28-mq5c.bugfix.rst
+
+diff --git a/newsfragments/+ghsa-h35f-9h28-mq5c.bugfix.rst b/newsfragments/+ghsa-h35f-9h28-mq5c.bugfix.rst
+new file mode 100644
+index 000000000..42d6c4cfe
+--- /dev/null
++++ b/newsfragments/+ghsa-h35f-9h28-mq5c.bugfix.rst
+@@ -0,0 +1,7 @@
++``MANIFEST.in`` matching (via ``FileList``) is now insensitive to Unicode
++normalization form. A pattern authored in one form (e.g. NFC, as typically
++saved by editors) now matches a file whose name is stored on disk in another
++(e.g. NFD, as produced by macOS APFS/HFS+). Previously an ``exclude``,
++``global-exclude``, ``recursive-exclude``, or ``prune`` rule could silently
++fail to drop a non-ASCII-named file from the source distribution, publishing
++it despite the exclusion -- see GHSA-h35f-9h28-mq5c.
+diff --git a/setuptools/command/egg_info.py b/setuptools/command/egg_info.py
+index 62d2feea9..e858708ee 100644
+--- a/setuptools/command/egg_info.py
++++ b/setuptools/command/egg_info.py
+@@ -34,6 +34,27 @@ from ..warnings import SetuptoolsDeprecationWarning
+ PY_MAJOR = '{}.{}'.format(*sys.version_info)
+ 
+ 
++class _NormalizedMatcher:
++    """
++    Wrap a compiled pattern so that matching is insensitive to Unicode
++    normalization form.
++
++    File names walked from disk (NFD on macOS APFS/HFS+) and patterns from
++    ``MANIFEST.in`` (typically NFC) can denote the same file while differing
++    byte-for-byte. Normalizing both sides before matching keeps an exclusion
++    (or inclusion) from silently failing. See GHSA-h35f-9h28-mq5c.
++    """
++
++    def __init__(self, pattern: re.Pattern) -> None:
++        self._pattern = pattern
++
++    def match(self, path):
++        return self._pattern.match(unicode_utils.normalize(path))
++
++    def search(self, path):
++        return self._pattern.search(unicode_utils.normalize(path))
++
++
+ def translate_pattern(glob):  # noqa: C901  # is too complex (14)  # FIXME
+     """
+     Translate a file path glob like '*.txt' in to a regular expression.
+@@ -43,6 +64,11 @@ def translate_pattern(glob):  # noqa: C901  # is too complex (14)  # FIXME
+     """
+     pat = ''
+ 
++    # Normalize the pattern so it matches paths regardless of the Unicode
++    # normalization form used on disk (GHSA-h35f-9h28-mq5c). Candidate paths
++    # are normalized to the same form by ``_NormalizedMatcher``.
++    glob = unicode_utils.normalize(glob)
++
+     # This will split on '/' within [character classes]. This is deliberate.
+     chunks = glob.split(os.path.sep)
+ 
+@@ -114,7 +140,7 @@ def translate_pattern(glob):  # noqa: C901  # is too complex (14)  # FIXME
+             pat += sep
+ 
+     pat += r'\Z'
+-    return re.compile(pat, flags=re.MULTILINE | re.DOTALL)
++    return _NormalizedMatcher(re.compile(pat, flags=re.MULTILINE | re.DOTALL))
+ 
+ 
+ class InfoCommon:
+diff --git a/setuptools/tests/test_manifest.py b/setuptools/tests/test_manifest.py
+index fbd21b197..1a7441fc3 100644
+--- a/setuptools/tests/test_manifest.py
++++ b/setuptools/tests/test_manifest.py
+@@ -10,6 +10,7 @@ import io
+ import logging
+ from distutils import log
+ from distutils.errors import DistutilsTemplateError
++import unicodedata
+ 
+ from setuptools.command.egg_info import FileList, egg_info, translate_pattern
+ from setuptools.dist import Distribution
+@@ -158,6 +159,21 @@ def test_translated_pattern_mismatch(pattern_mismatch):
+     assert not translate_pattern(pattern).match(target)
+ 
+ 
++def test_translate_pattern_unicode_normalization():
++    """
++    Matching is insensitive to Unicode normalization form: a pattern authored
++    in one form matches a path stored on disk in another (and vice versa), so
++    that an exclusion cannot be bypassed by an NFC/NFD mismatch.
++
++    Regression test for GHSA-h35f-9h28-mq5c.
++    """
++    nfc = unicodedata.normalize('NFC', 'café.txt')  # 'café.txt' composed
++    nfd = unicodedata.normalize('NFD', 'café.txt')  # 'café.txt' decomposed
++    assert nfc != nfd  # the two byte forms genuinely differ
++    assert translate_pattern(nfc).match(nfd)
++    assert translate_pattern(nfd).match(nfc)
++
++
+ class TempDirTestCase:
+     def setup_method(self, method):
+         self.temp_dir = tempfile.mkdtemp()
+@@ -331,6 +347,35 @@ class TestManifestTest(TempDirTestCase):
+         files = default_files | set([ml('app/a.txt'), ml('app/b.txt'), ml('app/c.rst')])
+         assert files == self.get_files()
+ 
++    def test_global_exclude_unicode_normalization(self):
++        """
++        A ``global-exclude`` authored NFC must drop a file whose on-disk name
++        is NFD: on macOS APFS/HFS+ the two are the same file, and even on
++        case/normalization-exact filesystems the decomposed name can be
++        committed and reach the build. Otherwise the file is published in the
++        sdist despite the exclusion.
++
++        Regression test for GHSA-h35f-9h28-mq5c.
++        """
++        nfc_name = unicodedata.normalize('NFC', 'café.txt')
++        nfd_name = unicodedata.normalize('NFD', 'café.txt')
++        assert nfc_name != nfd_name
++        # write the file under its decomposed (NFD) name ...
++        touch(os.path.join(self.temp_dir, 'app', nfd_name))
++        # ... and exclude it with the composed (NFC) form.
++        self.make_manifest(
++            f"""
++            global-include *.txt
++            global-exclude {nfc_name}
++            """
++        )
++        leaked = {
++            f
++            for f in self.get_files()
++            if unicodedata.normalize('NFC', os.path.basename(f)) == nfc_name
++        }
++        assert not leaked, f"excluded file leaked into manifest: {leaked}"
++
+ 
+ class TestFileListTest(TempDirTestCase):
+     """
+diff --git a/setuptools/unicode_utils.py b/setuptools/unicode_utils.py
+index d43dcc11f..311d4075a 100644
+--- a/setuptools/unicode_utils.py
++++ b/setuptools/unicode_utils.py
+@@ -15,6 +15,20 @@ def decompose(path):
+     return path
+ 
+ 
++def normalize(text):
++    """
++    Return *text* in a canonical Unicode form (NFC) so that names which are
++    visually identical but encoded differently compare equal.
++
++    macOS APFS/HFS+ store file names in decomposed form (NFD), while patterns
++    in ``MANIFEST.in`` are typically authored composed (NFC). The two denote
++    the same file but differ byte-for-byte, so matching them directly lets an
++    exclusion silently fail. Normalizing both the walked path and the pattern
++    to a single form before matching avoids that (GHSA-h35f-9h28-mq5c).
++    """
++    return unicodedata.normalize('NFC', text) if isinstance(text, str) else text
++
++
+ def filesys_decode(path):
+     """
+     Ensure that the given path is decoded,
+-- 
+2.44.4
diff --git a/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
index 00f83056db..9e7893f225 100644
--- a/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
@@ -15,6 +15,7 @@ SRC_URI += " \
             file://CVE-2024-6345.patch \
             file://CVE-2025-47273-pre1.patch \
             file://CVE-2025-47273.patch \
+            file://CVE-2026-59890.patch \
 "
 
 SRC_URI[sha256sum] = "5c0806c7d9af348e6dd3777b4f4dbb42c7ad85b190104837488eab9a7c945cf8"
-- 
2.35.6


