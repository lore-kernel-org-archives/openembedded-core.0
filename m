Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A3F227F0DD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 19:58:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46jVSV6mfRz2J
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 21:58:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1569959899;
	bh=hXoBi5CWV1pElUkpyp51iE4d9YfXiIJA6IG59tAERlk=;
	h=From:To:Subject:Date:From;
	b=PWSc9PyX/MSWTUvmLfZ/PwdL7k2JYy+nJFAkWn+5zRmq9WxuhHddzDVweuUgv2c4H
	YRUT8H7C/aFjZPCcovB8Mouzkz+fCSVQxvVArCs/SrmLEvm7Xx1LKYMVHRpGCSDZOz
	Y9bEyhlSNNigFLa2cDAhhNKSo3S3dOiwERAOaFDBg+ZlZ/u9JBegN+iF+SL4GN1p8S
	kybHMCjcjtMWqgQcRzWBB3Kz0+/K6z4nt3+ifaXDKtzW36iVcQ7YE7GqUp/Bj3BFl7
	lpMuGS/aOGmBO7y1rr0VBnun76MV8ZjsHyt5RXLedG9jHfPpbBdPSw6/5cjpAKfWCW
	XZtYZOtPqqBAGuAVzkZv6bhgfXu9ltVpkYYJpji8G8ZCuoHhaznk/PmE9rlPxDHihg
	7F7lD2po3pB3IE6g/s0ADrJyQMCee5kRARCoOK6Ukeqq60IJpwANXn8tJIsqOCMCnt
	04ucW5omBcDBknsm1uvG2NSedzvdaWOzA9d6dyLTfXuZtUrqtttxr1noKZvgWiNAkj
	9Zpye4Kpoyv1glZ8AGk2ES173PqWv8iDTngX6PZYxJRz07dAiV9eppKoUfIayix5C2
	mKZkp78neqtAM7o90tuJ0Eff9hwXLJ0h/vjMeo/3japCl9E6KC4gmRn3S3WHJ9EyuH
	s2M88lYuLr5qS/o29J1pXmAc=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Oct 2019 22:58:16 +0300
Message-Id: <20191001195817.22650-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] python: update to 3.7.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Oct 2019 19:58:22 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-update: copyright years

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[ Backported patches removed. ]
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...fig-append-STAGING_LIBDIR-python-sys.patch |   2 +-
 ...tutils-prefix-is-inside-staging-area.patch |   2 +-
 .../python/python3/CVE-2018-20852.patch       | 124 --------------
 .../python/python3/CVE-2019-9636.patch        | 154 ------------------
 .../{python3_3.7.2.bb => python3_3.7.3.bb}    |   8 +-
 5 files changed, 5 insertions(+), 285 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2018-20852.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9636.patch
 rename meta/recipes-devtools/python/{python3_3.7.2.bb => python3_3.7.3.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
index 8083345a4e..1741f5753b 100644
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
@@ -1,4 +1,4 @@
-From 4865615a2bc2b78c739e4c33f536712c7f9af061 Mon Sep 17 00:00:00 2001
+From 17796e353acf08acd604610f34840a4a9d2f4b54 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 31 Jan 2019 16:46:30 +0100
 Subject: [PATCH] distutils/sysconfig: append
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index dcc0932c7f..35213171bd 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 1397979ee445ff6826aa5469511e003539f77bb2 Mon Sep 17 00:00:00 2001
+From 12900d498bb77bcc990868a80eaf0ab257b88fff Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3/CVE-2018-20852.patch b/meta/recipes-devtools/python/python3/CVE-2018-20852.patch
deleted file mode 100644
index ff671d3fab..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2018-20852.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From e5123d81ffb3be35a1b2767d6ced1a097aaf77be Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Sat, 9 Mar 2019 18:58:25 -0800
-Subject: [PATCH] bpo-35121: prefix dot in domain for proper subdomain
- validation (GH-10258) (GH-12261)
-
-Don't send cookies of domain A without Domain attribute to domain B when domain A is a suffix match of domain B while using a cookiejar with `http.cookiejar.DefaultCookiePolicy` policy.  Patch by Karthikeyan Singaravelan.
-(cherry picked from commit ca7fe5063593958e5efdf90f068582837f07bd14)
-
-Co-authored-by: Xtreak <tir.karthi@gmail.com>
-Upstream-Status: Backport
-CVE: CVE-2018-20852
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com> 
----
- Lib/http/cookiejar.py                         | 13 ++++++--
- Lib/test/test_http_cookiejar.py               | 30 +++++++++++++++++++
- .../2018-10-31-15-39-17.bpo-35121.EgHv9k.rst  |  4 +++
- 3 files changed, 45 insertions(+), 2 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst
-
-diff --git a/Lib/http/cookiejar.py b/Lib/http/cookiejar.py
-index e0f1032b2816..00cb1250a07e 100644
---- a/Lib/http/cookiejar.py
-+++ b/Lib/http/cookiejar.py
-@@ -1145,6 +1145,11 @@ def return_ok_domain(self, cookie, request):
-         req_host, erhn = eff_request_host(request)
-         domain = cookie.domain
- 
-+        if domain and not domain.startswith("."):
-+            dotdomain = "." + domain
-+        else:
-+            dotdomain = domain
-+
-         # strict check of non-domain cookies: Mozilla does this, MSIE5 doesn't
-         if (cookie.version == 0 and
-             (self.strict_ns_domain & self.DomainStrictNonDomain) and
-@@ -1157,7 +1162,7 @@ def return_ok_domain(self, cookie, request):
-             _debug("   effective request-host name %s does not domain-match "
-                    "RFC 2965 cookie domain %s", erhn, domain)
-             return False
--        if cookie.version == 0 and not ("."+erhn).endswith(domain):
-+        if cookie.version == 0 and not ("."+erhn).endswith(dotdomain):
-             _debug("   request-host %s does not match Netscape cookie domain "
-                    "%s", req_host, domain)
-             return False
-@@ -1171,7 +1176,11 @@ def domain_return_ok(self, domain, request):
-             req_host = "."+req_host
-         if not erhn.startswith("."):
-             erhn = "."+erhn
--        if not (req_host.endswith(domain) or erhn.endswith(domain)):
-+        if domain and not domain.startswith("."):
-+            dotdomain = "." + domain
-+        else:
-+            dotdomain = domain
-+        if not (req_host.endswith(dotdomain) or erhn.endswith(dotdomain)):
-             #_debug("   request domain %s does not match cookie domain %s",
-             #       req_host, domain)
-             return False
-diff --git a/Lib/test/test_http_cookiejar.py b/Lib/test/test_http_cookiejar.py
-index abc625d672a7..6e1b30881310 100644
---- a/Lib/test/test_http_cookiejar.py
-+++ b/Lib/test/test_http_cookiejar.py
-@@ -415,6 +415,7 @@ def test_domain_return_ok(self):
-             ("http://foo.bar.com/", ".foo.bar.com", True),
-             ("http://foo.bar.com/", "foo.bar.com", True),
-             ("http://foo.bar.com/", ".bar.com", True),
-+            ("http://foo.bar.com/", "bar.com", True),
-             ("http://foo.bar.com/", "com", True),
-             ("http://foo.com/", "rhubarb.foo.com", False),
-             ("http://foo.com/", ".foo.com", True),
-@@ -425,6 +426,8 @@ def test_domain_return_ok(self):
-             ("http://foo/", "foo", True),
-             ("http://foo/", "foo.local", True),
-             ("http://foo/", ".local", True),
-+            ("http://barfoo.com", ".foo.com", False),
-+            ("http://barfoo.com", "foo.com", False),
-             ]:
-             request = urllib.request.Request(url)
-             r = pol.domain_return_ok(domain, request)
-@@ -959,6 +962,33 @@ def test_domain_block(self):
-         c.add_cookie_header(req)
-         self.assertFalse(req.has_header("Cookie"))
- 
-+        c.clear()
-+
-+        pol.set_blocked_domains([])
-+        req = urllib.request.Request("http://acme.com/")
-+        res = FakeResponse(headers, "http://acme.com/")
-+        cookies = c.make_cookies(res, req)
-+        c.extract_cookies(res, req)
-+        self.assertEqual(len(c), 1)
-+
-+        req = urllib.request.Request("http://acme.com/")
-+        c.add_cookie_header(req)
-+        self.assertTrue(req.has_header("Cookie"))
-+
-+        req = urllib.request.Request("http://badacme.com/")
-+        c.add_cookie_header(req)
-+        self.assertFalse(pol.return_ok(cookies[0], req))
-+        self.assertFalse(req.has_header("Cookie"))
-+
-+        p = pol.set_blocked_domains(["acme.com"])
-+        req = urllib.request.Request("http://acme.com/")
-+        c.add_cookie_header(req)
-+        self.assertFalse(req.has_header("Cookie"))
-+
-+        req = urllib.request.Request("http://badacme.com/")
-+        c.add_cookie_header(req)
-+        self.assertFalse(req.has_header("Cookie"))
-+
-     def test_secure(self):
-         for ns in True, False:
-             for whitespace in " ", "":
-diff --git a/Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst b/Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst
-new file mode 100644
-index 000000000000..d2eb8f1f352c
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst
-@@ -0,0 +1,4 @@
-+Don't send cookies of domain A without Domain attribute to domain B
-+when domain A is a suffix match of domain B while using a cookiejar
-+with :class:`http.cookiejar.DefaultCookiePolicy` policy. Patch by
-+Karthikeyan Singaravelan.
diff --git a/meta/recipes-devtools/python/python3/CVE-2019-9636.patch b/meta/recipes-devtools/python/python3/CVE-2019-9636.patch
deleted file mode 100644
index 72128f0b0d..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2019-9636.patch
+++ /dev/null
@@ -1,154 +0,0 @@
-From daad2c482c91de32d8305abbccc76a5de8b3a8be Mon Sep 17 00:00:00 2001
-From: Steve Dower <steve.dower@microsoft.com>
-Date: Thu, 7 Mar 2019 09:08:18 -0800
-Subject: [PATCH] bpo-36216: Add check for characters in netloc that normalize
- to separators (GH-12201)
-
-Upstream-Status: Backport
-CVE: CVE-2019-9636
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-
----
- Doc/library/urllib.parse.rst                  | 18 +++++++++++++++
- Lib/test/test_urlparse.py                     | 23 +++++++++++++++++++
- Lib/urllib/parse.py                           | 17 ++++++++++++++
- .../2019-03-06-09-38-40.bpo-36216.6q1m4a.rst  |  3 +++
- 4 files changed, 61 insertions(+)
- create mode 100644 Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
-
-diff --git a/Doc/library/urllib.parse.rst b/Doc/library/urllib.parse.rst
-index 0c8f0f607314..b565e1edd321 100644
---- a/Doc/library/urllib.parse.rst
-+++ b/Doc/library/urllib.parse.rst
-@@ -124,6 +124,11 @@ or on combining URL components into a URL string.
-    Unmatched square brackets in the :attr:`netloc` attribute will raise a
-    :exc:`ValueError`.
- 
-+   Characters in the :attr:`netloc` attribute that decompose under NFKC
-+   normalization (as used by the IDNA encoding) into any of ``/``, ``?``,
-+   ``#``, ``@``, or ``:`` will raise a :exc:`ValueError`. If the URL is
-+   decomposed before parsing, no error will be raised.
-+
-    .. versionchanged:: 3.2
-       Added IPv6 URL parsing capabilities.
- 
-@@ -136,6 +141,10 @@ or on combining URL components into a URL string.
-       Out-of-range port numbers now raise :exc:`ValueError`, instead of
-       returning :const:`None`.
- 
-+   .. versionchanged:: 3.7.3
-+      Characters that affect netloc parsing under NFKC normalization will
-+      now raise :exc:`ValueError`.
-+
- 
- .. function:: parse_qs(qs, keep_blank_values=False, strict_parsing=False, encoding='utf-8', errors='replace', max_num_fields=None)
- 
-@@ -257,10 +266,19 @@ or on combining URL components into a URL string.
-    Unmatched square brackets in the :attr:`netloc` attribute will raise a
-    :exc:`ValueError`.
- 
-+   Characters in the :attr:`netloc` attribute that decompose under NFKC
-+   normalization (as used by the IDNA encoding) into any of ``/``, ``?``,
-+   ``#``, ``@``, or ``:`` will raise a :exc:`ValueError`. If the URL is
-+   decomposed before parsing, no error will be raised.
-+
-    .. versionchanged:: 3.6
-       Out-of-range port numbers now raise :exc:`ValueError`, instead of
-       returning :const:`None`.
- 
-+   .. versionchanged:: 3.7.3
-+      Characters that affect netloc parsing under NFKC normalization will
-+      now raise :exc:`ValueError`.
-+
- 
- .. function:: urlunsplit(parts)
- 
-diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
-index be50b47603aa..e6638aee2244 100644
---- a/Lib/test/test_urlparse.py
-+++ b/Lib/test/test_urlparse.py
-@@ -1,3 +1,5 @@
-+import sys
-+import unicodedata
- import unittest
- import urllib.parse
- 
-@@ -984,6 +986,27 @@ def test_all(self):
-                 expected.append(name)
-         self.assertCountEqual(urllib.parse.__all__, expected)
- 
-+    def test_urlsplit_normalization(self):
-+        # Certain characters should never occur in the netloc,
-+        # including under normalization.
-+        # Ensure that ALL of them are detected and cause an error
-+        illegal_chars = '/:#?@'
-+        hex_chars = {'{:04X}'.format(ord(c)) for c in illegal_chars}
-+        denorm_chars = [
-+            c for c in map(chr, range(128, sys.maxunicode))
-+            if (hex_chars & set(unicodedata.decomposition(c).split()))
-+            and c not in illegal_chars
-+        ]
-+        # Sanity check that we found at least one such character
-+        self.assertIn('\u2100', denorm_chars)
-+        self.assertIn('\uFF03', denorm_chars)
-+
-+        for scheme in ["http", "https", "ftp"]:
-+            for c in denorm_chars:
-+                url = "{}://netloc{}false.netloc/path".format(scheme, c)
-+                with self.subTest(url=url, char='{:04X}'.format(ord(c))):
-+                    with self.assertRaises(ValueError):
-+                        urllib.parse.urlsplit(url)
- 
- class Utility_Tests(unittest.TestCase):
-     """Testcase to test the various utility functions in the urllib."""
-diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
-index f691ab74f87f..39c5d6a80824 100644
---- a/Lib/urllib/parse.py
-+++ b/Lib/urllib/parse.py
-@@ -391,6 +391,21 @@ def _splitnetloc(url, start=0):
-             delim = min(delim, wdelim)     # use earliest delim position
-     return url[start:delim], url[delim:]   # return (domain, rest)
- 
-+def _checknetloc(netloc):
-+    if not netloc or netloc.isascii():
-+        return
-+    # looking for characters like \u2100 that expand to 'a/c'
-+    # IDNA uses NFKC equivalence, so normalize for this check
-+    import unicodedata
-+    netloc2 = unicodedata.normalize('NFKC', netloc)
-+    if netloc == netloc2:
-+        return
-+    _, _, netloc = netloc.rpartition('@') # anything to the left of '@' is okay
-+    for c in '/?#@:':
-+        if c in netloc2:
-+            raise ValueError("netloc '" + netloc2 + "' contains invalid " +
-+                             "characters under NFKC normalization")
-+
- def urlsplit(url, scheme='', allow_fragments=True):
-     """Parse a URL into 5 components:
-     <scheme>://<netloc>/<path>?<query>#<fragment>
-@@ -419,6 +434,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
-                 url, fragment = url.split('#', 1)
-             if '?' in url:
-                 url, query = url.split('?', 1)
-+            _checknetloc(netloc)
-             v = SplitResult('http', netloc, url, query, fragment)
-             _parse_cache[key] = v
-             return _coerce_result(v)
-@@ -442,6 +458,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
-         url, fragment = url.split('#', 1)
-     if '?' in url:
-         url, query = url.split('?', 1)
-+    _checknetloc(netloc)
-     v = SplitResult(scheme, netloc, url, query, fragment)
-     _parse_cache[key] = v
-     return _coerce_result(v)
-diff --git a/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
-new file mode 100644
-index 000000000000..5546394157f9
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
-@@ -0,0 +1,3 @@
-+Changes urlsplit() to raise ValueError when the URL contains characters that
-+decompose under IDNA encoding (NFKC-normalization) into characters that
-+affect how the URL is parsed.
diff --git a/meta/recipes-devtools/python/python3_3.7.2.bb b/meta/recipes-devtools/python/python3_3.7.3.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3_3.7.2.bb
rename to meta/recipes-devtools/python/python3_3.7.3.bb
index 6da806bb93..1f1441f4ac 100644
--- a/meta/recipes-devtools/python/python3_3.7.2.bb
+++ b/meta/recipes-devtools/python/python3_3.7.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.python.org"
 LICENSE = "PSFv2"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f257cc14f81685691652a3d3e1b5d754"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e466242989bd33c1bd2b6a526a742498"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -22,8 +22,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0002-Don-t-do-runtime-test-to-get-float-byte-order.patch \
            file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
-           file://CVE-2018-20852.patch \
-           file://CVE-2019-9636.patch \
            file://CVE-2019-9740.patch \
            "
 
@@ -35,8 +33,8 @@ SRC_URI_append_class-nativesdk = " \
            file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
            "
 
-SRC_URI[md5sum] = "df6ec36011808205beda239c72f947cb"
-SRC_URI[sha256sum] = "d83fe8ce51b1bb48bbcf0550fd265b9a75cdfdfa93f916f9e700aef8444bf1bb"
+SRC_URI[md5sum] = "93df27aec0cd18d6d42173e601ffbbfd"
+SRC_URI[sha256sum] = "da60b54064d4cfcd9c26576f6df2690e62085123826cff2e667e72a91952d318"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.17.1


