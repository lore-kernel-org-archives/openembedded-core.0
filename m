Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 509EE7CF88
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 08:46:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4765xK6GZgz7X
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 09:46:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572857174;
	bh=tV3q1Ic7opJswlkhwYiBb2sBK6bWPB5rkHX4WLLbFQs=;
	h=From:To:Subject:Date:From;
	b=F1t+P43ZMpHo6hgK1QdLxD0beWyji05R/tEsHS9quRkZTzgtUgzDbOd15OG6DqPCh
	kz+fy9yUVrPwYMpse2T93djBG7OubLtF/gZlNrDGFOqBQdourMtDThQ8rGM/Qsfg1/
	ZG+n8swbud/vaqePGTl8EL7I+LQd2TP8lWlV/CWWmqIwJSZRgq6Du1YXNF/R/mzkEm
	RmluNaFhzB9Nji7Gjux+OYC6x+rIbYQWWRUzCfHoYgtFw6owRVUwCQTzVychajrJse
	1DjLlGF0AzeEIMgynuJjFooGzk2opNX070oqg6GINDM4CIkjUyBXvPl17i0l+ZfTav
	e391IK1xLk74mPp/J3xySdlVOoKa7wp3PX0DzdYk9J2FfLW4VjZnHZ9qJTrqFUyHUN
	gWUyWMzbcc34PitrD0zq6mmHIWlcDb+xBF3xPqKqpseJXu5ocmnzEj1rKqE2g4C36U
	1SeZ1xVqPMZ+Sk4bux1tUHFQ+9dm0TpleipKF95aFfE1H7ClgHEHOdHs5wAqFbPusw
	hA99HJSirUmDRRmnXxWYRXzxTpNhaiLSfj5yW3NVrkoKvkARUe4PjVXkgtkE+nRkOZ
	AwtxHx2eEdaKOYkuvL0KzJhRBJOuZj9D81mcnvAJpYQeCbdTwR9SzyYal+E2pnFTgG
	qt6rCd5G79HthY22oMTpo+EA=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 10:46:12 +0200
Message-Id: <20191104084612.27966-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] python: Upgrade 2.7.16 -> 2.7.17
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
X-List-Received-Date: Mon, 04 Nov 2019 08:46:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patches applied upstream removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...-fix-one-do_populate_sysroot-warning.patch |  15 +-
 ...tive_2.7.16.bb => python-native_2.7.17.bb} |   0
 meta/recipes-devtools/python/python.inc       |  10 +-
 ...nt-parse-domains-containing-GH-13079.patch |  90 --------
 ...cape-the-server-title-of-DocXMLRPCSe.patch | 101 --------
 .../python/python/CVE-2018-20852.patch        | 123 ----------
 .../python/python/CVE-2019-9740.patch         | 216 ------------------
 .../python/bpo-35907-cve-2019-9948-fix.patch  |  55 -----
 .../python/bpo-35907-cve-2019-9948.patch      |  55 -----
 .../python/bpo-36216-cve-2019-9636-fix.patch  |  28 ---
 .../python/bpo-36216-cve-2019-9636.patch      | 111 ---------
 .../python/bpo-36742-cve-2019-10160.patch     |  81 -------
 .../python/python/builddir.patch              |   6 +-
 .../{python_2.7.16.bb => python_2.7.17.bb}    |   3 -
 14 files changed, 12 insertions(+), 882 deletions(-)
 rename meta/recipes-devtools/python/{python-native_2.7.16.bb => python-native_2.7.17.bb} (100%)
 delete mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
 delete mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch
 delete mode 100644 meta/recipes-devtools/python/python/CVE-2018-20852.patch
 delete mode 100644 meta/recipes-devtools/python/python/CVE-2019-9740.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948-fix.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636-fix.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636.patch
 delete mode 100644 meta/recipes-devtools/python/python/bpo-36742-cve-2019-10160.patch
 rename meta/recipes-devtools/python/{python_2.7.16.bb => python_2.7.17.bb} (97%)

diff --git a/meta/recipes-devtools/python/python-native/0001-python-native-fix-one-do_populate_sysroot-warning.patch b/meta/recipes-devtools/python/python-native/0001-python-native-fix-one-do_populate_sysroot-warning.patch
index 989818927d..1277eab4c0 100644
--- a/meta/recipes-devtools/python/python-native/0001-python-native-fix-one-do_populate_sysroot-warning.patch
+++ b/meta/recipes-devtools/python/python-native/0001-python-native-fix-one-do_populate_sysroot-warning.patch
@@ -25,15 +25,14 @@ diff --git a/setup.py b/setup.py
 index 7bf13ed..6c0f29b 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -40,7 +40,7 @@ def add_dir_to_list(dirlist, dir):
-     1) 'dir' is not already in 'dirlist'
-     2) 'dir' actually exists, and is a directory."""
-     if dir is not None and os.path.isdir(dir) and dir not in dirlist:
--        dirlist.insert(0, dir)
-+        dirlist.append(dir)
+@@ -40,5 +40,5 @@ def add_dir_to_list(dirlist, dir):
+             dir_exists = os.path.isdir(dir)
+         if dir_exists:
+-            dirlist.insert(0, dir)
++            dirlist.append(dir)
+ 
+ MACOS_SDK_ROOT = None
 
- def macosx_sdk_root():
-     """
 -- 
 2.18.0
 
diff --git a/meta/recipes-devtools/python/python-native_2.7.16.bb b/meta/recipes-devtools/python/python-native_2.7.17.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-native_2.7.16.bb
rename to meta/recipes-devtools/python/python-native_2.7.17.bb
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 1462b779e9..a630c26e89 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -8,16 +8,10 @@ INC_PR = "r1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e466242989bd33c1bd2b6a526a742498"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
-           file://bpo-35907-cve-2019-9948.patch \
-           file://bpo-35907-cve-2019-9948-fix.patch \
-           file://bpo-36216-cve-2019-9636.patch \
-           file://bpo-36216-cve-2019-9636-fix.patch \
-           file://CVE-2019-9740.patch \
-           file://CVE-2018-20852.patch \
            "
 
-SRC_URI[md5sum] = "30157d85a2c0479c09ea2cbe61f2aaf5"
-SRC_URI[sha256sum] = "f222ef602647eecb6853681156d32de4450a2c39f4de93bd5b20235f2e660ed7"
+SRC_URI[md5sum] = "b3b6d2c92f42a60667814358ab9f0cfd"
+SRC_URI[sha256sum] = "4d43f033cdbd0aa7b7023c81b0e986fd11e653b5248dac9144d508f11812ba41"
 
 # python recipe is actually python 2.x
 # also, exclude pre-releases for both python 2.x and 3.x
diff --git a/meta/recipes-devtools/python/python/0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch b/meta/recipes-devtools/python/python/0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
deleted file mode 100644
index 5415472a35..0000000000
--- a/meta/recipes-devtools/python/python/0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 532ed09c5454bb789a301bb6f1339a0818255610 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Roberto=20C=2E=20S=C3=A1nchez?= <roberto@connexer.com>
-Date: Sat, 14 Sep 2019 13:26:38 -0400
-Subject: [PATCH] [2.7] bpo-34155: Dont parse domains containing @ (GH-13079)
- (GH-16006)
-
-This change skips parsing of email addresses where domains include a "@" character, which can be maliciously used since the local part is returned as a complete address.
-
-(cherry picked from commit 8cb65d1381b027f0b09ee36bfed7f35bb4dec9a9)
-
-Excludes changes to Lib/email/_header_value_parser.py, which did not
-exist in 2.7.
-
-Co-authored-by: jpic <jpic@users.noreply.github.com>
-
-https://bugs.python.org/issue34155
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/8cb65d1381b027f0b09ee36bfed7f35bb4dec9a9]
-
-CVE: CVE-2019-16056
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- Lib/email/_parseaddr.py                            | 11 ++++++++++-
- Lib/email/test/test_email.py                       | 14 ++++++++++++++
- .../2019-05-04-13-33-37.bpo-34155.MJll68.rst       |  1 +
- 3 files changed, 25 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
-
-diff --git a/Lib/email/_parseaddr.py b/Lib/email/_parseaddr.py
-index 690db2c22d..dc49d2e45a 100644
---- a/Lib/email/_parseaddr.py
-+++ b/Lib/email/_parseaddr.py
-@@ -336,7 +336,12 @@ class AddrlistClass:
-         aslist.append('@')
-         self.pos += 1
-         self.gotonext()
--        return EMPTYSTRING.join(aslist) + self.getdomain()
-+        domain = self.getdomain()
-+        if not domain:
-+            # Invalid domain, return an empty address instead of returning a
-+            # local part to denote failed parsing.
-+            return EMPTYSTRING
-+        return EMPTYSTRING.join(aslist) + domain
- 
-     def getdomain(self):
-         """Get the complete domain name from an address."""
-@@ -351,6 +356,10 @@ class AddrlistClass:
-             elif self.field[self.pos] == '.':
-                 self.pos += 1
-                 sdlist.append('.')
-+            elif self.field[self.pos] == '@':
-+                # bpo-34155: Don't parse domains with two `@` like
-+                # `a@malicious.org@important.com`.
-+                return EMPTYSTRING
-             elif self.field[self.pos] in self.atomends:
-                 break
-             else:
-diff --git a/Lib/email/test/test_email.py b/Lib/email/test/test_email.py
-index 4b4dee3d34..2efe44ac5a 100644
---- a/Lib/email/test/test_email.py
-+++ b/Lib/email/test/test_email.py
-@@ -2306,6 +2306,20 @@ class TestMiscellaneous(TestEmailBase):
-         self.assertEqual(Utils.parseaddr('<>'), ('', ''))
-         self.assertEqual(Utils.formataddr(Utils.parseaddr('<>')), '')
- 
-+    def test_parseaddr_multiple_domains(self):
-+        self.assertEqual(
-+            Utils.parseaddr('a@b@c'),
-+            ('', '')
-+        )
-+        self.assertEqual(
-+            Utils.parseaddr('a@b.c@c'),
-+            ('', '')
-+        )
-+        self.assertEqual(
-+            Utils.parseaddr('a@172.17.0.1@c'),
-+            ('', '')
-+        )
-+
-     def test_noquote_dump(self):
-         self.assertEqual(
-             Utils.formataddr(('A Silly Person', 'person@dom.ain')),
-diff --git a/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst b/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
-new file mode 100644
-index 0000000000..50292e29ed
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
-@@ -0,0 +1 @@
-+Fix parsing of invalid email addresses with more than one ``@`` (e.g. a@b@c.com.) to not return the part before 2nd ``@`` as valid email address. Patch by maxking & jpic.
diff --git a/meta/recipes-devtools/python/python/0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch b/meta/recipes-devtools/python/python/0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch
deleted file mode 100644
index 3025cf7bc8..0000000000
--- a/meta/recipes-devtools/python/python/0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From b161c89c8bd66fe928192e21364678c8e9b8fcc0 Mon Sep 17 00:00:00 2001
-From: Dong-hee Na <donghee.na92@gmail.com>
-Date: Tue, 1 Oct 2019 19:58:01 +0900
-Subject: [PATCH] [2.7] bpo-38243: Escape the server title of DocXMLRPCServer
- (GH-16447)
-
-Escape the server title of DocXMLRPCServer.DocXMLRPCServer
-when rendering the document page as HTML.
-
-CVE: CVE-2019-16935
-
-Upstream-Status: Backport [https://github.com/python/cpython/pull/16447/commits/b41cde823d026f2adc21ef14b1c2e92b1006de06]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- Lib/DocXMLRPCServer.py                        | 13 +++++++++++-
- Lib/test/test_docxmlrpc.py                    | 20 +++++++++++++++++++
- .../2019-09-25-13-21-09.bpo-38243.1pfz24.rst  |  3 +++
- 3 files changed, 35 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst
-
-diff --git a/Lib/DocXMLRPCServer.py b/Lib/DocXMLRPCServer.py
-index 4064ec2e48..90b037dd35 100644
---- a/Lib/DocXMLRPCServer.py
-+++ b/Lib/DocXMLRPCServer.py
-@@ -20,6 +20,16 @@ from SimpleXMLRPCServer import (SimpleXMLRPCServer,
-             CGIXMLRPCRequestHandler,
-             resolve_dotted_attribute)
- 
-+
-+def _html_escape_quote(s):
-+    s = s.replace("&", "&amp;") # Must be done first!
-+    s = s.replace("<", "&lt;")
-+    s = s.replace(">", "&gt;")
-+    s = s.replace('"', "&quot;")
-+    s = s.replace('\'', "&#x27;")
-+    return s
-+
-+
- class ServerHTMLDoc(pydoc.HTMLDoc):
-     """Class used to generate pydoc HTML document for a server"""
- 
-@@ -210,7 +220,8 @@ class XMLRPCDocGenerator:
-                                 methods
-                             )
- 
--        return documenter.page(self.server_title, documentation)
-+        title = _html_escape_quote(self.server_title)
-+        return documenter.page(title, documentation)
- 
- class DocXMLRPCRequestHandler(SimpleXMLRPCRequestHandler):
-     """XML-RPC and documentation request handler class.
-diff --git a/Lib/test/test_docxmlrpc.py b/Lib/test/test_docxmlrpc.py
-index 4dff4159e2..c45b892b8b 100644
---- a/Lib/test/test_docxmlrpc.py
-+++ b/Lib/test/test_docxmlrpc.py
-@@ -1,5 +1,6 @@
- from DocXMLRPCServer import DocXMLRPCServer
- import httplib
-+import re
- import sys
- from test import test_support
- threading = test_support.import_module('threading')
-@@ -176,6 +177,25 @@ class DocXMLRPCHTTPGETServer(unittest.TestCase):
-         self.assertIn("""Try&nbsp;self.<strong>add</strong>,&nbsp;too.""",
-                       response.read())
- 
-+    def test_server_title_escape(self):
-+        """Test that the server title and documentation
-+        are escaped for HTML.
-+        """
-+        self.serv.set_server_title('test_title<script>')
-+        self.serv.set_server_documentation('test_documentation<script>')
-+        self.assertEqual('test_title<script>', self.serv.server_title)
-+        self.assertEqual('test_documentation<script>',
-+                self.serv.server_documentation)
-+
-+        generated = self.serv.generate_html_documentation()
-+        title = re.search(r'<title>(.+?)</title>', generated).group()
-+        documentation = re.search(r'<p><tt>(.+?)</tt></p>', generated).group()
-+        self.assertEqual('<title>Python: test_title&lt;script&gt;</title>',
-+                title)
-+        self.assertEqual('<p><tt>test_documentation&lt;script&gt;</tt></p>',
-+                documentation)
-+
-+
- def test_main():
-     test_support.run_unittest(DocXMLRPCHTTPGETServer)
- 
-diff --git a/Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst b/Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst
-new file mode 100644
-index 0000000000..8f02baed9e
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst
-@@ -0,0 +1,3 @@
-+Escape the server title of :class:`DocXMLRPCServer.DocXMLRPCServer`
-+when rendering the document page as HTML.
-+(Contributed by Dong-hee Na in :issue:`38243`.)
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/python/python/CVE-2018-20852.patch b/meta/recipes-devtools/python/python/CVE-2018-20852.patch
deleted file mode 100644
index 23c784a210..0000000000
--- a/meta/recipes-devtools/python/python/CVE-2018-20852.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From 979daae300916adb399ab5b51410b6ebd0888f13 Mon Sep 17 00:00:00 2001
-From: Xtreak <tir.karthi@gmail.com>
-Date: Sat, 15 Jun 2019 20:59:43 +0530
-Subject: [PATCH] [2.7] bpo-35121: prefix dot in domain for proper subdomain
- validation (GH-10258) (GH-13426)
-
-This is a manual backport of ca7fe5063593958e5efdf90f068582837f07bd14 since 2.7 has `http.cookiejar` in `cookielib`
-
-
-https://bugs.python.org/issue35121
-CVE: CVE-2018-20852
-Upstream-Status: Backport [https://github.com/python/cpython/pull/13426]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- Lib/cookielib.py                              | 13 ++++++--
- Lib/test/test_cookielib.py                    | 30 +++++++++++++++++++
- .../2019-05-20-00-35-12.bpo-35121.RRi-HU.rst  |  4 +++
- 3 files changed, 45 insertions(+), 2 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2019-05-20-00-35-12.bpo-35121.RRi-HU.rst
-
-diff --git a/Lib/cookielib.py b/Lib/cookielib.py
-index 2dd7c48728e0..0b471a42f296 100644
---- a/Lib/cookielib.py
-+++ b/Lib/cookielib.py
-@@ -1139,6 +1139,11 @@ def return_ok_domain(self, cookie, request):
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
-@@ -1151,7 +1156,7 @@ def return_ok_domain(self, cookie, request):
-             _debug("   effective request-host name %s does not domain-match "
-                    "RFC 2965 cookie domain %s", erhn, domain)
-             return False
--        if cookie.version == 0 and not ("."+erhn).endswith(domain):
-+        if cookie.version == 0 and not ("."+erhn).endswith(dotdomain):
-             _debug("   request-host %s does not match Netscape cookie domain "
-                    "%s", req_host, domain)
-             return False
-@@ -1165,7 +1170,11 @@ def domain_return_ok(self, domain, request):
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
-diff --git a/Lib/test/test_cookielib.py b/Lib/test/test_cookielib.py
-index f2dd9727d137..7f7ff614d61d 100644
---- a/Lib/test/test_cookielib.py
-+++ b/Lib/test/test_cookielib.py
-@@ -368,6 +368,7 @@ def test_domain_return_ok(self):
-             ("http://foo.bar.com/", ".foo.bar.com", True),
-             ("http://foo.bar.com/", "foo.bar.com", True),
-             ("http://foo.bar.com/", ".bar.com", True),
-+            ("http://foo.bar.com/", "bar.com", True),
-             ("http://foo.bar.com/", "com", True),
-             ("http://foo.com/", "rhubarb.foo.com", False),
-             ("http://foo.com/", ".foo.com", True),
-@@ -378,6 +379,8 @@ def test_domain_return_ok(self):
-             ("http://foo/", "foo", True),
-             ("http://foo/", "foo.local", True),
-             ("http://foo/", ".local", True),
-+            ("http://barfoo.com", ".foo.com", False),
-+            ("http://barfoo.com", "foo.com", False),
-             ]:
-             request = urllib2.Request(url)
-             r = pol.domain_return_ok(domain, request)
-@@ -938,6 +941,33 @@ def test_domain_block(self):
-         c.add_cookie_header(req)
-         self.assertFalse(req.has_header("Cookie"))
- 
-+        c.clear()
-+
-+        pol.set_blocked_domains([])
-+        req = Request("http://acme.com/")
-+        res = FakeResponse(headers, "http://acme.com/")
-+        cookies = c.make_cookies(res, req)
-+        c.extract_cookies(res, req)
-+        self.assertEqual(len(c), 1)
-+
-+        req = Request("http://acme.com/")
-+        c.add_cookie_header(req)
-+        self.assertTrue(req.has_header("Cookie"))
-+
-+        req = Request("http://badacme.com/")
-+        c.add_cookie_header(req)
-+        self.assertFalse(pol.return_ok(cookies[0], req))
-+        self.assertFalse(req.has_header("Cookie"))
-+
-+        p = pol.set_blocked_domains(["acme.com"])
-+        req = Request("http://acme.com/")
-+        c.add_cookie_header(req)
-+        self.assertFalse(req.has_header("Cookie"))
-+
-+        req = Request("http://badacme.com/")
-+        c.add_cookie_header(req)
-+        self.assertFalse(req.has_header("Cookie"))
-+
-     def test_secure(self):
-         from cookielib import CookieJar, DefaultCookiePolicy
- 
-diff --git a/Misc/NEWS.d/next/Security/2019-05-20-00-35-12.bpo-35121.RRi-HU.rst b/Misc/NEWS.d/next/Security/2019-05-20-00-35-12.bpo-35121.RRi-HU.rst
-new file mode 100644
-index 000000000000..77251806163b
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2019-05-20-00-35-12.bpo-35121.RRi-HU.rst
-@@ -0,0 +1,4 @@
-+Don't send cookies of domain A without Domain attribute to domain B when
-+domain A is a suffix match of domain B while using a cookiejar with
-+:class:`cookielib.DefaultCookiePolicy` policy. Patch by Karthikeyan
-+Singaravelan.
diff --git a/meta/recipes-devtools/python/python/CVE-2019-9740.patch b/meta/recipes-devtools/python/python/CVE-2019-9740.patch
deleted file mode 100644
index 95f43e0387..0000000000
--- a/meta/recipes-devtools/python/python/CVE-2019-9740.patch
+++ /dev/null
@@ -1,216 +0,0 @@
-From bb8071a4cae5ab3fe321481dd3d73662ffb26052 Mon Sep 17 00:00:00 2001
-From: Victor Stinner <victor.stinner@gmail.com>
-Date: Tue, 21 May 2019 15:12:33 +0200
-Subject: [PATCH] bpo-30458: Disallow control chars in http URLs (GH-12755)
- (GH-13154) (GH-13315)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Disallow control chars in http URLs in urllib2.urlopen.  This
-addresses a potential security problem for applications that do not
-sanity check their URLs where http request headers could be injected.
-
-Disable https related urllib tests on a build without ssl (GH-13032)
-These tests require an SSL enabled build. Skip these tests when
-python is built without SSL to fix test failures.
-
-Use httplib.InvalidURL instead of ValueError as the new error case's
-exception. (GH-13044)
-
-Backport Co-Authored-By: Miro Hrončok <miro@hroncok.cz>
-
-(cherry picked from commit 7e200e0763f5b71c199aaf98bd5588f291585619)
-
-Notes on backport to Python 2.7:
-
-* test_urllib tests urllib.urlopen() which quotes the URL and so is
-  not vulerable to HTTP Header Injection.
-* Add tests to test_urllib2 on urllib2.urlopen().
-* Reject non-ASCII characters: range 0x80-0xff.
-
-Upstream-Status: Backport
-CVE: CVE-2019-9740
-CVE: CVE-2019-9947
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- Lib/httplib.py                                | 16 ++++++
- Lib/test/test_urllib.py                       | 25 +++++++++
- Lib/test/test_urllib2.py                      | 51 ++++++++++++++++++-
- Lib/test/test_xmlrpc.py                       |  8 ++-
- .../2019-04-10-08-53-30.bpo-30458.51E-DA.rst  |  1 +
- 5 files changed, 99 insertions(+), 2 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
-
-diff --git a/Lib/httplib.py b/Lib/httplib.py
-index 60a8fb4e355f..1b41c346e090 100644
---- a/Lib/httplib.py
-+++ b/Lib/httplib.py
-@@ -247,6 +247,16 @@
- _is_legal_header_name = re.compile(r'\A[^:\s][^:\r\n]*\Z').match
- _is_illegal_header_value = re.compile(r'\n(?![ \t])|\r(?![ \t\n])').search
- 
-+# These characters are not allowed within HTTP URL paths.
-+#  See https://tools.ietf.org/html/rfc3986#section-3.3 and the
-+#  https://tools.ietf.org/html/rfc3986#appendix-A pchar definition.
-+# Prevents CVE-2019-9740.  Includes control characters such as \r\n.
-+# Restrict non-ASCII characters above \x7f (0x80-0xff).
-+_contains_disallowed_url_pchar_re = re.compile('[\x00-\x20\x7f-\xff]')
-+# Arguably only these _should_ allowed:
-+#  _is_allowed_url_pchars_re = re.compile(r"^[/!$&'()*+,;=:@%a-zA-Z0-9._~-]+$")
-+# We are more lenient for assumed real world compatibility purposes.
-+
- # We always set the Content-Length header for these methods because some
- # servers will otherwise respond with a 411
- _METHODS_EXPECTING_BODY = {'PATCH', 'POST', 'PUT'}
-@@ -927,6 +937,12 @@ def putrequest(self, method, url, skip_host=0, skip_accept_encoding=0):
-         self._method = method
-         if not url:
-             url = '/'
-+        # Prevent CVE-2019-9740.
-+        match = _contains_disallowed_url_pchar_re.search(url)
-+        if match:
-+            raise InvalidURL("URL can't contain control characters. %r "
-+                             "(found at least %r)"
-+                             % (url, match.group()))
-         hdr = '%s %s %s' % (method, url, self._http_vsn_str)
- 
-         self._output(hdr)
-diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
-index 1ce9201c0693..d7778d4194f3 100644
---- a/Lib/test/test_urllib.py
-+++ b/Lib/test/test_urllib.py
-@@ -257,6 +257,31 @@ def test_url_fragment(self):
-         finally:
-             self.unfakehttp()
- 
-+    def test_url_with_control_char_rejected(self):
-+        for char_no in range(0, 0x21) + range(0x7f, 0x100):
-+            char = chr(char_no)
-+            schemeless_url = "//localhost:7777/test%s/" % char
-+            self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
-+            try:
-+                # urllib quotes the URL so there is no injection.
-+                resp = urllib.urlopen("http:" + schemeless_url)
-+                self.assertNotIn(char, resp.geturl())
-+            finally:
-+                self.unfakehttp()
-+
-+    def test_url_with_newline_header_injection_rejected(self):
-+        self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
-+        host = "localhost:7777?a=1 HTTP/1.1\r\nX-injected: header\r\nTEST: 123"
-+        schemeless_url = "//" + host + ":8080/test/?test=a"
-+        try:
-+            # urllib quotes the URL so there is no injection.
-+            resp = urllib.urlopen("http:" + schemeless_url)
-+            self.assertNotIn(' ', resp.geturl())
-+            self.assertNotIn('\r', resp.geturl())
-+            self.assertNotIn('\n', resp.geturl())
-+        finally:
-+            self.unfakehttp()
-+
-     def test_read_bogus(self):
-         # urlopen() should raise IOError for many error codes.
-         self.fakehttp('''HTTP/1.1 401 Authentication Required
-diff --git a/Lib/test/test_urllib2.py b/Lib/test/test_urllib2.py
-index 6d24d5ddf83c..9531818e16b2 100644
---- a/Lib/test/test_urllib2.py
-+++ b/Lib/test/test_urllib2.py
-@@ -15,6 +15,9 @@
- except ImportError:
-     ssl = None
- 
-+from test.test_urllib import FakeHTTPMixin
-+
-+
- # XXX
- # Request
- # CacheFTPHandler (hard to write)
-@@ -1262,7 +1265,7 @@ def _test_basic_auth(self, opener, auth_handler, auth_header,
-         self.assertEqual(len(http_handler.requests), 1)
-         self.assertFalse(http_handler.requests[0].has_header(auth_header))
- 
--class MiscTests(unittest.TestCase):
-+class MiscTests(unittest.TestCase, FakeHTTPMixin):
- 
-     def test_build_opener(self):
-         class MyHTTPHandler(urllib2.HTTPHandler): pass
-@@ -1317,6 +1320,52 @@ def test_unsupported_algorithm(self):
-             "Unsupported digest authentication algorithm 'invalid'"
-         )
- 
-+    @unittest.skipUnless(ssl, "ssl module required")
-+    def test_url_with_control_char_rejected(self):
-+        for char_no in range(0, 0x21) + range(0x7f, 0x100):
-+            char = chr(char_no)
-+            schemeless_url = "//localhost:7777/test%s/" % char
-+            self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
-+            try:
-+                # We explicitly test urllib.request.urlopen() instead of the top
-+                # level 'def urlopen()' function defined in this... (quite ugly)
-+                # test suite.  They use different url opening codepaths.  Plain
-+                # urlopen uses FancyURLOpener which goes via a codepath that
-+                # calls urllib.parse.quote() on the URL which makes all of the
-+                # above attempts at injection within the url _path_ safe.
-+                escaped_char_repr = repr(char).replace('\\', r'\\')
-+                InvalidURL = httplib.InvalidURL
-+                with self.assertRaisesRegexp(
-+                    InvalidURL, "contain control.*" + escaped_char_repr):
-+                    urllib2.urlopen("http:" + schemeless_url)
-+                with self.assertRaisesRegexp(
-+                    InvalidURL, "contain control.*" + escaped_char_repr):
-+                    urllib2.urlopen("https:" + schemeless_url)
-+            finally:
-+                self.unfakehttp()
-+
-+    @unittest.skipUnless(ssl, "ssl module required")
-+    def test_url_with_newline_header_injection_rejected(self):
-+        self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
-+        host = "localhost:7777?a=1 HTTP/1.1\r\nX-injected: header\r\nTEST: 123"
-+        schemeless_url = "//" + host + ":8080/test/?test=a"
-+        try:
-+            # We explicitly test urllib2.urlopen() instead of the top
-+            # level 'def urlopen()' function defined in this... (quite ugly)
-+            # test suite.  They use different url opening codepaths.  Plain
-+            # urlopen uses FancyURLOpener which goes via a codepath that
-+            # calls urllib.parse.quote() on the URL which makes all of the
-+            # above attempts at injection within the url _path_ safe.
-+            InvalidURL = httplib.InvalidURL
-+            with self.assertRaisesRegexp(
-+                InvalidURL, r"contain control.*\\r.*(found at least . .)"):
-+                urllib2.urlopen("http:" + schemeless_url)
-+            with self.assertRaisesRegexp(InvalidURL, r"contain control.*\\n"):
-+                urllib2.urlopen("https:" + schemeless_url)
-+        finally:
-+            self.unfakehttp()
-+
-+
- 
- class RequestTests(unittest.TestCase):
- 
-diff --git a/Lib/test/test_xmlrpc.py b/Lib/test/test_xmlrpc.py
-index 36b3be67fd6b..90ccb30716ff 100644
---- a/Lib/test/test_xmlrpc.py
-+++ b/Lib/test/test_xmlrpc.py
-@@ -659,7 +659,13 @@ def test_dotted_attribute(self):
-     def test_partial_post(self):
-         # Check that a partial POST doesn't make the server loop: issue #14001.
-         conn = httplib.HTTPConnection(ADDR, PORT)
--        conn.request('POST', '/RPC2 HTTP/1.0\r\nContent-Length: 100\r\n\r\nbye')
-+        conn.send('POST /RPC2 HTTP/1.0\r\n'
-+                  'Content-Length: 100\r\n\r\n'
-+                  'bye HTTP/1.1\r\n'
-+                  'Host: %s:%s\r\n'
-+                  'Accept-Encoding: identity\r\n'
-+                  'Content-Length: 0\r\n\r\n'
-+                  % (ADDR, PORT))
-         conn.close()
- 
- class SimpleServerEncodingTestCase(BaseServerTestCase):
-diff --git a/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst b/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
-new file mode 100644
-index 000000000000..47cb899df1af
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
-@@ -0,0 +1 @@
-+Address CVE-2019-9740 by disallowing URL paths with embedded whitespace or control characters through into the underlying http client request.  Such potentially malicious header injection URLs now cause an httplib.InvalidURL exception to be raised.
diff --git a/meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948-fix.patch b/meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948-fix.patch
deleted file mode 100644
index b267237018..0000000000
--- a/meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948-fix.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 179a5f75f1121dab271fe8f90eb35145f9dcbbda Mon Sep 17 00:00:00 2001
-From: Sihoon Lee <push0ebp@gmail.com>
-Date: Fri, 17 May 2019 02:41:06 +0900
-Subject: [PATCH] Update test_urllib.py and urllib.py\nchange assertEqual into
- assertRasies in DummyURLopener test, and simplify mitigation
-
-Upstream-Status: Submitted https://github.com/python/cpython/pull/11842
-
-CVE: CVE-2019-9948
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Lib/test/test_urllib.py | 11 +++--------
- Lib/urllib.py           |  4 ++--
- 2 files changed, 5 insertions(+), 10 deletions(-)
-
-diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
-index e5f210e62a18..1e23dfb0bb16 100644
---- a/Lib/test/test_urllib.py
-+++ b/Lib/test/test_urllib.py
-@@ -1027,14 +1027,9 @@ def test_local_file_open(self):
-         class DummyURLopener(urllib.URLopener):
-             def open_local_file(self, url):
-                 return url
--        self.assertEqual(DummyURLopener().open(
--            'local-file://example'), '//example')
--        self.assertEqual(DummyURLopener().open(
--            'local_file://example'), '//example')
--        self.assertRaises(IOError, urllib.urlopen,
--            'local-file://example')
--        self.assertRaises(IOError, urllib.urlopen,
--            'local_file://example')
-+        for url in ('local_file://example', 'local-file://example'):
-+            self.assertRaises(IOError, DummyURLopener().open, url)
-+            self.assertRaises(IOError, urllib.urlopen, url)
- 
- # Just commented them out.
- # Can't really tell why keep failing in windows and sparc.
-diff --git a/Lib/urllib.py b/Lib/urllib.py
-index a24e9a5c68fb..39b834054e9e 100644
---- a/Lib/urllib.py
-+++ b/Lib/urllib.py
-@@ -203,10 +203,10 @@ def open(self, fullurl, data=None):
-         name = 'open_' + urltype
-         self.type = urltype
-         name = name.replace('-', '_')
--        
-+
-         # bpo-35907: # disallow the file reading with the type not allowed
-         if not hasattr(self, name) or \
--            (self == _urlopener and name == 'open_local_file'):
-+            getattr(self, name) == self.open_local_file:
-             if proxy:
-                 return self.open_unknown_proxy(proxy, fullurl, data)
-             else:
diff --git a/meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948.patch b/meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948.patch
deleted file mode 100644
index f4c225d2fc..0000000000
--- a/meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 8f99cc799e4393bf1112b9395b2342f81b3f45ef Mon Sep 17 00:00:00 2001
-From: push0ebp <push0ebp@shl-MacBook-Pro.local>
-Date: Thu, 14 Feb 2019 02:05:46 +0900
-Subject: [PATCH] bpo-35907: Avoid file reading as disallowing the unnecessary
- URL scheme in urllib
-
-Upstream-Status: Submitted https://github.com/python/cpython/pull/11842
-
-CVE: CVE-2019-9948
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Lib/test/test_urllib.py | 12 ++++++++++++
- Lib/urllib.py           |  5 ++++-
- 2 files changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
-index 1ce9201c0693..e5f210e62a18 100644
---- a/Lib/test/test_urllib.py
-+++ b/Lib/test/test_urllib.py
-@@ -1023,6 +1023,18 @@ def open_spam(self, url):
-             "spam://c:|windows%/:=&?~#+!$,;'@()*[]|/path/"),
-             "//c:|windows%/:=&?~#+!$,;'@()*[]|/path/")
- 
-+    def test_local_file_open(self):
-+        class DummyURLopener(urllib.URLopener):
-+            def open_local_file(self, url):
-+                return url
-+        self.assertEqual(DummyURLopener().open(
-+            'local-file://example'), '//example')
-+        self.assertEqual(DummyURLopener().open(
-+            'local_file://example'), '//example')
-+        self.assertRaises(IOError, urllib.urlopen,
-+            'local-file://example')
-+        self.assertRaises(IOError, urllib.urlopen,
-+            'local_file://example')
- 
- # Just commented them out.
- # Can't really tell why keep failing in windows and sparc.
-diff --git a/Lib/urllib.py b/Lib/urllib.py
-index d85504a5cb7e..a24e9a5c68fb 100644
---- a/Lib/urllib.py
-+++ b/Lib/urllib.py
-@@ -203,7 +203,10 @@ def open(self, fullurl, data=None):
-         name = 'open_' + urltype
-         self.type = urltype
-         name = name.replace('-', '_')
--        if not hasattr(self, name):
-+        
-+        # bpo-35907: # disallow the file reading with the type not allowed
-+        if not hasattr(self, name) or \
-+            (self == _urlopener and name == 'open_local_file'):
-             if proxy:
-                 return self.open_unknown_proxy(proxy, fullurl, data)
-             else:
diff --git a/meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636-fix.patch b/meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636-fix.patch
deleted file mode 100644
index 2ce4d2cde7..0000000000
--- a/meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636-fix.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 06b5ee585d6e76bdbb4002f642d864d860cbbd2b Mon Sep 17 00:00:00 2001
-From: Steve Dower <steve.dower@python.org>
-Date: Tue, 12 Mar 2019 08:23:33 -0700
-Subject: [PATCH] bpo-36216: Only print test messages when verbose
-
-CVE: CVE-2019-9636
- 
-Upstream-Status: Backport https://github.com/python/cpython/pull/12291/commits/06b5ee585d6e76bdbb4002f642d864d860cbbd2b
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Lib/test/test_urlparse.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
-index 73b0228ea8e3..1830d0b28688 100644
---- a/Lib/test/test_urlparse.py
-+++ b/Lib/test/test_urlparse.py
-@@ -644,7 +644,8 @@ def test_urlsplit_normalization(self):
-         for scheme in [u"http", u"https", u"ftp"]:
-             for c in denorm_chars:
-                 url = u"{}://netloc{}false.netloc/path".format(scheme, c)
--                print "Checking %r" % url
-+                if test_support.verbose:
-+                    print "Checking %r" % url
-                 with self.assertRaises(ValueError):
-                     urlparse.urlsplit(url)
- 
diff --git a/meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636.patch b/meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636.patch
deleted file mode 100644
index 352b13ba9b..0000000000
--- a/meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-From 3e3669c9c41a27e1466e2c28b3906e3dd0ce3e7e Mon Sep 17 00:00:00 2001
-From: Steve Dower <steve.dower@python.org>
-Date: Thu, 7 Mar 2019 08:25:22 -0800
-Subject: [PATCH] bpo-36216: Add check for characters in netloc that normalize
- to separators (GH-12201)
-
-CVE: CVE-2019-9636
-
-Upstream-Status: Backport https://github.com/python/cpython/pull/12216/commits/3e3669c9c41a27e1466e2c28b3906e3dd0ce3e7e
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Doc/library/urlparse.rst                      | 20 ++++++++++++++++
- Lib/test/test_urlparse.py                     | 24 +++++++++++++++++++
- Lib/urlparse.py                               | 17 +++++++++++++
- .../2019-03-06-09-38-40.bpo-36216.6q1m4a.rst  |  3 +++
- 4 files changed, 64 insertions(+)
- create mode 100644 Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
-
-diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
-index 4e1ded73c266..73b0228ea8e3 100644
---- a/Lib/test/test_urlparse.py
-+++ b/Lib/test/test_urlparse.py
-@@ -1,4 +1,6 @@
- from test import test_support
-+import sys
-+import unicodedata
- import unittest
- import urlparse
- 
-@@ -624,6 +626,28 @@ def test_portseparator(self):
-         self.assertEqual(urlparse.urlparse("http://www.python.org:80"),
-                 ('http','www.python.org:80','','','',''))
- 
-+    def test_urlsplit_normalization(self):
-+        # Certain characters should never occur in the netloc,
-+        # including under normalization.
-+        # Ensure that ALL of them are detected and cause an error
-+        illegal_chars = u'/:#?@'
-+        hex_chars = {'{:04X}'.format(ord(c)) for c in illegal_chars}
-+        denorm_chars = [
-+            c for c in map(unichr, range(128, sys.maxunicode))
-+            if (hex_chars & set(unicodedata.decomposition(c).split()))
-+            and c not in illegal_chars
-+        ]
-+        # Sanity check that we found at least one such character
-+        self.assertIn(u'\u2100', denorm_chars)
-+        self.assertIn(u'\uFF03', denorm_chars)
-+
-+        for scheme in [u"http", u"https", u"ftp"]:
-+            for c in denorm_chars:
-+                url = u"{}://netloc{}false.netloc/path".format(scheme, c)
-+                print "Checking %r" % url
-+                with self.assertRaises(ValueError):
-+                    urlparse.urlsplit(url)
-+
- def test_main():
-     test_support.run_unittest(UrlParseTestCase)
- 
-diff --git a/Lib/urlparse.py b/Lib/urlparse.py
-index f7c2b032b097..54eda08651ab 100644
---- a/Lib/urlparse.py
-+++ b/Lib/urlparse.py
-@@ -165,6 +165,21 @@ def _splitnetloc(url, start=0):
-             delim = min(delim, wdelim)     # use earliest delim position
-     return url[start:delim], url[delim:]   # return (domain, rest)
- 
-+def _checknetloc(netloc):
-+    if not netloc or not isinstance(netloc, unicode):
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
-@@ -193,6 +208,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
-                 url, fragment = url.split('#', 1)
-             if '?' in url:
-                 url, query = url.split('?', 1)
-+            _checknetloc(netloc)
-             v = SplitResult(scheme, netloc, url, query, fragment)
-             _parse_cache[key] = v
-             return v
-@@ -216,6 +232,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
-         url, fragment = url.split('#', 1)
-     if '?' in url:
-         url, query = url.split('?', 1)
-+    _checknetloc(netloc)
-     v = SplitResult(scheme, netloc, url, query, fragment)
-     _parse_cache[key] = v
-     return v
-diff --git a/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
-new file mode 100644
-index 000000000000..1e1ad92c6feb
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
-@@ -0,0 +1,3 @@
-+Changes urlsplit() to raise ValueError when the URL contains characters that
-+decompose under IDNA encoding (NFKC-normalization) into characters that
-+affect how the URL is parsed.
-\ No newline at end of file
diff --git a/meta/recipes-devtools/python/python/bpo-36742-cve-2019-10160.patch b/meta/recipes-devtools/python/python/bpo-36742-cve-2019-10160.patch
deleted file mode 100644
index 1b6cb8cf3e..0000000000
--- a/meta/recipes-devtools/python/python/bpo-36742-cve-2019-10160.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 5a1033fe5be764a135adcfff2fdc14edc3e5f327 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 10 Oct 2019 16:32:19 +0800
-Subject: [PATCH] bpo-36742: Fixes handling of pre-normalization characters in
- urlsplit() bpo-36742: Corrects fix to handle decomposition in usernames
-
-Upstream-Status: Backport
-
-https://github.com/python/cpython/commit/98a4dcefbbc3bce5ab07e7c0830a183157250259
-https://github.com/python/cpython/commit/f61599b050c621386a3fc6bc480359e2d3bb93de#diff-b577545d73dd0cdb2c337a4c5f89e1d7
-
-CVE: CVE-2019-10160
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- Lib/test/test_urlparse.py | 19 +++++++++++++------
- Lib/urlparse.py           | 14 +++++++++-----
- 2 files changed, 22 insertions(+), 11 deletions(-)
-
-diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
-index 1830d0b..857ed96 100644
---- a/Lib/test/test_urlparse.py
-+++ b/Lib/test/test_urlparse.py
-@@ -641,13 +641,20 @@ class UrlParseTestCase(unittest.TestCase):
-         self.assertIn(u'\u2100', denorm_chars)
-         self.assertIn(u'\uFF03', denorm_chars)
- 
-+        # bpo-36742: Verify port separators are ignored when they
-+        # existed prior to decomposition
-+        urlparse.urlsplit(u'http://\u30d5\u309a:80')
-+        with self.assertRaises(ValueError):
-+            urlparse.urlsplit(u'http://\u30d5\u309a\ufe1380')
-+
-         for scheme in [u"http", u"https", u"ftp"]:
--            for c in denorm_chars:
--                url = u"{}://netloc{}false.netloc/path".format(scheme, c)
--                if test_support.verbose:
--                    print "Checking %r" % url
--                with self.assertRaises(ValueError):
--                    urlparse.urlsplit(url)
-+            for netloc in [u"netloc{}false.netloc", u"n{}user@netloc"]:
-+                for c in denorm_chars:
-+                    url = u"{}://{}/path".format(scheme, netloc.format(c))
-+                    if test_support.verbose:
-+                        print "Checking %r" % url
-+                    with self.assertRaises(ValueError):
-+                        urlparse.urlsplit(url)
- 
- def test_main():
-     test_support.run_unittest(UrlParseTestCase)
-diff --git a/Lib/urlparse.py b/Lib/urlparse.py
-index 54eda08..e34b368 100644
---- a/Lib/urlparse.py
-+++ b/Lib/urlparse.py
-@@ -171,14 +171,18 @@ def _checknetloc(netloc):
-     # looking for characters like \u2100 that expand to 'a/c'
-     # IDNA uses NFKC equivalence, so normalize for this check
-     import unicodedata
--    netloc2 = unicodedata.normalize('NFKC', netloc)
--    if netloc == netloc2:
-+    n = netloc.replace(u'@', u'') # ignore characters already included
-+    n = n.replace(u':', u'')      # but not the surrounding text
-+    n = n.replace(u'#', u'')
-+    n = n.replace(u'?', u'')
-+
-+    netloc2 = unicodedata.normalize('NFKC', n)
-+    if n == netloc2:
-         return
--    _, _, netloc = netloc.rpartition('@') # anything to the left of '@' is okay
-     for c in '/?#@:':
-         if c in netloc2:
--            raise ValueError("netloc '" + netloc2 + "' contains invalid " +
--                             "characters under NFKC normalization")
-+            raise ValueError(u"netloc '" + netloc + u"' contains invalid " +
-+                             u"characters under NFKC normalization")
- 
- def urlsplit(url, scheme='', allow_fragments=True):
-     """Parse a URL into 5 components:
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/python/python/builddir.patch b/meta/recipes-devtools/python/python/builddir.patch
index ad629a022e..950a634064 100644
--- a/meta/recipes-devtools/python/python/builddir.patch
+++ b/meta/recipes-devtools/python/python/builddir.patch
@@ -35,9 +35,9 @@ Index: Python-2.7.9/Lib/distutils/sysconfig.py
 --- Python-2.7.9.orig/Lib/distutils/sysconfig.py
 +++ Python-2.7.9/Lib/distutils/sysconfig.py
 @@ -26,6 +26,9 @@ EXEC_PREFIX = os.path.normpath(sys.exec_
- # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
- # it'll live in project/PCbuild/amd64.
- project_base = os.path.dirname(os.path.abspath(sys.executable))
+     # sys.executable can be empty if argv[0] has been changed and Python is
+     # unable to retrieve the real program name
+     project_base = os.getcwd()
 +_PYTHONBUILDDIR = os.environ.get("PYTHONBUILDDIR", None)
 +if _PYTHONBUILDDIR:
 +    project_base = _PYTHONBUILDDIR
diff --git a/meta/recipes-devtools/python/python_2.7.16.bb b/meta/recipes-devtools/python/python_2.7.17.bb
similarity index 97%
rename from meta/recipes-devtools/python/python_2.7.16.bb
rename to meta/recipes-devtools/python/python_2.7.17.bb
index 625c5312a6..5b856a5097 100644
--- a/meta/recipes-devtools/python/python_2.7.16.bb
+++ b/meta/recipes-devtools/python/python_2.7.17.bb
@@ -30,9 +30,6 @@ SRC_URI += " \
            file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
            file://float-endian.patch \
            file://0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch \
-           file://0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch \
-           file://bpo-36742-cve-2019-10160.patch \
-           file://0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.17.1


