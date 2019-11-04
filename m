Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A01677CBDF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 19:10:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 476Mp04GpPz72
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 20:10:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572894648;
	bh=P/jKD6B/q67JWkHLB7nPwzXVRawZyvDx3oA0VptNE3E=;
	h=From:To:Subject:Date:From;
	b=OXOPgNdzj+5ASrylfqdfYhNwkZ6YOn4iKZk4UDj7rfA+4Or5lIDoclMDAYmjqMBo2
	h3DOMM3PsE2DIRJdxYnmnhAcTdus779vRe92O+Spk2dkmZnLqUldNRsmCykS64o4Wl
	4dpkl9R9NDiJoCD/HPxrHS6oPV5wWi2hjjsU5khOx9FN4pzP7YHPgb3IEPbJeGtzQK
	tl6OhKpU5fV8xvJTEFlGWydoxdgs1+OPKlVQ/PqWp1JJQKtNTfPVf+5h6drn2ur8h6
	ElGbUx0WZkH8PbBqs5Y/leFKvIiMmHt/WqqdtODxrRJHoCMOO2dWGI9OOGCZTzDwOm
	HURA1TNkSFroQQDsfentI1xhG5s6JsMqEhRhBu40UTxqChOeRGk2FMtCaOfBrh19NF
	2ae5+f2FFdXWAoliLnbVzsDE9xA3PvzViayazPKxNmduwUQ7mNoh9RcOO1yhB1/NRf
	Q+eE+7jo4mIVdN0509xshPJtP1dg/CSzYeDGsrAJP5lKk7eA3o/zwTk7FD2f3HSrPw
	0FFOfUYvhtbE5yni+yWEY4mDKxgvzSNwNQWWI470FyQAVIiLQNPIqexND41XvefCGS
	MT6cQW0Uq0txo/FkdpIQWajwyurD6J0HTZAFoFKCF1h9GIgSW+Xu7DroYFUDk2iQ+P
	4JFNeWxuHnKmk6kLpuoAAmIY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 21:10:47 +0200
Message-Id: <20191104191047.12241-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] python3: Upgrade 3.7.4 -> 3.7.5
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
X-List-Received-Date: Mon, 04 Nov 2019 19:10:50 -0000

Backported patches removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
v2: Rebased to master.
---
 ...lib-as-location-for-site-packages-an.patch |   2 +-
 ...nt-parse-domains-containing-GH-13079.patch | 132 ------------------
 ....server-Escape-the-server_title-GH-1.patch |  86 ------------
 ...asename-to-replace-CC-for-checking-c.patch |   2 +-
 .../{python3_3.7.4.bb => python3_3.7.5.bb}    |   6 +-
 5 files changed, 4 insertions(+), 224 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-bpo-38243-xmlrpc.server-Escape-the-server_title-GH-1.patch
 rename meta/recipes-devtools/python/{python3_3.7.4.bb => python3_3.7.5.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
index 661f52d01f..ea75262c4f 100644
--- a/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch
@@ -70,7 +70,7 @@ index 6e81b2f..671a20e 100644
  
  Programs/python.o: $(srcdir)/Programs/python.c
 @@ -856,7 +857,7 @@ regen-opcode:
- Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o: $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
+ Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o Python/future.o Parser/parsetok.o: $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
 -		$(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@ $(srcdir)/Python/getplatform.c
diff --git a/meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch b/meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
deleted file mode 100644
index 319e7ed07e..0000000000
--- a/meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From 90d56127ae15b1e452755e62c77dc475dedf7161 Mon Sep 17 00:00:00 2001
-From: jpic <jpic@users.noreply.github.com>
-Date: Wed, 17 Jul 2019 23:54:25 +0200
-Subject: [PATCH] bpo-34155: Dont parse domains containing @ (GH-13079)
-
-Before:
-
-        >>> email.message_from_string('From: a@malicious.org@important.com', policy=email.policy.default)['from'].addresses
-        (Address(display_name='', username='a', domain='malicious.org'),)
-
-        >>> parseaddr('a@malicious.org@important.com')
-        ('', 'a@malicious.org')
-
-    After:
-
-        >>> email.message_from_string('From: a@malicious.org@important.com', policy=email.policy.default)['from'].addresses
-        (Address(display_name='', username='', domain=''),)
-
-        >>> parseaddr('a@malicious.org@important.com')
-        ('', 'a@')
-
-https://bugs.python.org/issue34155
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/8cb65d1381b027f0b09ee36bfed7f35bb4dec9a9]
-
-CVE: CVE-2019-16056
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- Lib/email/_header_value_parser.py                  |  2 ++
- Lib/email/_parseaddr.py                            | 11 ++++++++++-
- Lib/test/test_email/test__header_value_parser.py   | 10 ++++++++++
- Lib/test/test_email/test_email.py                  | 14 ++++++++++++++
- .../2019-05-04-13-33-37.bpo-34155.MJll68.rst       |  1 +
- 5 files changed, 37 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
-
-diff --git a/Lib/email/_header_value_parser.py b/Lib/email/_header_value_parser.py
-index fc00b4a098..bbc026ec71 100644
---- a/Lib/email/_header_value_parser.py
-+++ b/Lib/email/_header_value_parser.py
-@@ -1582,6 +1582,8 @@ def get_domain(value):
-         token, value = get_dot_atom(value)
-     except errors.HeaderParseError:
-         token, value = get_atom(value)
-+    if value and value[0] == '@':
-+        raise errors.HeaderParseError('Invalid Domain')
-     if leader is not None:
-         token[:0] = [leader]
-     domain.append(token)
-diff --git a/Lib/email/_parseaddr.py b/Lib/email/_parseaddr.py
-index cdfa3729ad..41ff6f8c00 100644
---- a/Lib/email/_parseaddr.py
-+++ b/Lib/email/_parseaddr.py
-@@ -379,7 +379,12 @@ class AddrlistClass:
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
-@@ -394,6 +399,10 @@ class AddrlistClass:
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
-diff --git a/Lib/test/test_email/test__header_value_parser.py b/Lib/test/test_email/test__header_value_parser.py
-index 693487bc96..7dc4de1b7b 100644
---- a/Lib/test/test_email/test__header_value_parser.py
-+++ b/Lib/test/test_email/test__header_value_parser.py
-@@ -1438,6 +1438,16 @@ class TestParser(TestParserMixin, TestEmailBase):
-         self.assertEqual(addr_spec.domain, 'example.com')
-         self.assertEqual(addr_spec.addr_spec, 'star.a.star@example.com')
- 
-+    def test_get_addr_spec_multiple_domains(self):
-+        with self.assertRaises(errors.HeaderParseError):
-+            parser.get_addr_spec('star@a.star@example.com')
-+
-+        with self.assertRaises(errors.HeaderParseError):
-+            parser.get_addr_spec('star@a@example.com')
-+
-+        with self.assertRaises(errors.HeaderParseError):
-+            parser.get_addr_spec('star@172.17.0.1@example.com')
-+
-     # get_obs_route
- 
-     def test_get_obs_route_simple(self):
-diff --git a/Lib/test/test_email/test_email.py b/Lib/test/test_email/test_email.py
-index c29cc56203..aa775881c5 100644
---- a/Lib/test/test_email/test_email.py
-+++ b/Lib/test/test_email/test_email.py
-@@ -3041,6 +3041,20 @@ class TestMiscellaneous(TestEmailBase):
-         self.assertEqual(utils.parseaddr('<>'), ('', ''))
-         self.assertEqual(utils.formataddr(utils.parseaddr('<>')), '')
- 
-+    def test_parseaddr_multiple_domains(self):
-+        self.assertEqual(
-+            utils.parseaddr('a@b@c'),
-+            ('', '')
-+        )
-+        self.assertEqual(
-+            utils.parseaddr('a@b.c@c'),
-+            ('', '')
-+        )
-+        self.assertEqual(
-+            utils.parseaddr('a@172.17.0.1@c'),
-+            ('', '')
-+        )
-+
-     def test_noquote_dump(self):
-         self.assertEqual(
-             utils.formataddr(('A Silly Person', 'person@dom.ain')),
-diff --git a/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst b/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
-new file mode 100644
-index 0000000000..50292e29ed
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2019-05-04-13-33-37.bpo-34155.MJll68.rst
-@@ -0,0 +1 @@
-+Fix parsing of invalid email addresses with more than one ``@`` (e.g. a@b@c.com.) to not return the part before 2nd ``@`` as valid email address. Patch by maxking & jpic.
diff --git a/meta/recipes-devtools/python/python3/0001-bpo-38243-xmlrpc.server-Escape-the-server_title-GH-1.patch b/meta/recipes-devtools/python/python3/0001-bpo-38243-xmlrpc.server-Escape-the-server_title-GH-1.patch
deleted file mode 100644
index 1a4c932070..0000000000
--- a/meta/recipes-devtools/python/python3/0001-bpo-38243-xmlrpc.server-Escape-the-server_title-GH-1.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From c25abd43e8877b4a7098f79eaacb248710731c2b Mon Sep 17 00:00:00 2001
-From: Dong-hee Na <donghee.na92@gmail.com>
-Date: Sat, 28 Sep 2019 04:59:37 +0900
-Subject: [PATCH] bpo-38243, xmlrpc.server: Escape the server_title (GH-16373)
-
-Escape the server title of xmlrpc.server.DocXMLRPCServer
-when rendering the document page as HTML.
-
-CVE: CVE-2019-16935
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/e8650a4f8c7fb76f570d4ca9c1fbe44e91c8dfaa]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- Lib/test/test_docxmlrpc.py                       | 16 ++++++++++++++++
- Lib/xmlrpc/server.py                             |  3 ++-
- .../2019-09-25-13-21-09.bpo-38243.1pfz24.rst     |  3 +++
- 3 files changed, 21 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst
-
-diff --git a/Lib/test/test_docxmlrpc.py b/Lib/test/test_docxmlrpc.py
-index f077f05f5b..38215659b6 100644
---- a/Lib/test/test_docxmlrpc.py
-+++ b/Lib/test/test_docxmlrpc.py
-@@ -1,5 +1,6 @@
- from xmlrpc.server import DocXMLRPCServer
- import http.client
-+import re
- import sys
- import threading
- from test import support
-@@ -193,6 +194,21 @@ class DocXMLRPCHTTPGETServer(unittest.TestCase):
-              b'method_annotation</strong></a>(x: bytes)</dt></dl>'),
-             response.read())
- 
-+    def test_server_title_escape(self):
-+        # bpo-38243: Ensure that the server title and documentation
-+        # are escaped for HTML.
-+        self.serv.set_server_title('test_title<script>')
-+        self.serv.set_server_documentation('test_documentation<script>')
-+        self.assertEqual('test_title<script>', self.serv.server_title)
-+        self.assertEqual('test_documentation<script>',
-+                self.serv.server_documentation)
-+
-+        generated = self.serv.generate_html_documentation()
-+        title = re.search(r'<title>(.+?)</title>', generated).group()
-+        documentation = re.search(r'<p><tt>(.+?)</tt></p>', generated).group()
-+        self.assertEqual('<title>Python: test_title&lt;script&gt;</title>', title)
-+        self.assertEqual('<p><tt>test_documentation&lt;script&gt;</tt></p>', documentation)
-+
- 
- if __name__ == '__main__':
-     unittest.main()
-diff --git a/Lib/xmlrpc/server.py b/Lib/xmlrpc/server.py
-index f1c467eb1b..32aba4df4c 100644
---- a/Lib/xmlrpc/server.py
-+++ b/Lib/xmlrpc/server.py
-@@ -108,6 +108,7 @@ from xmlrpc.client import Fault, dumps, loads, gzip_encode, gzip_decode
- from http.server import BaseHTTPRequestHandler
- from functools import partial
- from inspect import signature
-+import html
- import http.server
- import socketserver
- import sys
-@@ -894,7 +895,7 @@ class XMLRPCDocGenerator:
-                                 methods
-                             )
- 
--        return documenter.page(self.server_title, documentation)
-+        return documenter.page(html.escape(self.server_title), documentation)
- 
- class DocXMLRPCRequestHandler(SimpleXMLRPCRequestHandler):
-     """XML-RPC and documentation request handler class.
-diff --git a/Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst b/Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst
-new file mode 100644
-index 0000000000..98d7be1295
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst
-@@ -0,0 +1,3 @@
-+Escape the server title of :class:`xmlrpc.server.DocXMLRPCServer`
-+when rendering the document page as HTML.
-+(Contributed by Dong-hee Na in :issue:`38243`.)
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
index 5735954628..a0ea897f4e 100644
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -63,7 +63,7 @@ index a7de901..4a3681f 100644
 +  case $cc_basename in
      *clang*)
        AC_SUBST(LLVM_AR)
-       AC_PATH_TARGET_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
+       AC_PATH_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
 @@ -1426,7 +1427,7 @@ then
    fi
  fi
diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.5.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3_3.7.4.bb
rename to meta/recipes-devtools/python/python3_3.7.5.bb
index dd61c0aa45..0338fa4ba8 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.5.bb
@@ -29,8 +29,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
            file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
-           file://0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch \
-           file://0001-bpo-38243-xmlrpc.server-Escape-the-server_title-GH-1.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -41,8 +39,8 @@ SRC_URI_append_class-nativesdk = " \
            file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
            "
 
-SRC_URI[md5sum] = "d33e4aae66097051c2eca45ee3604803"
-SRC_URI[sha256sum] = "fb799134b868199930b75f26678f18932214042639cd52b16da7fd134cd9b13f"
+SRC_URI[md5sum] = "08ed8030b1183107c48f2092e79a87e2"
+SRC_URI[sha256sum] = "e85a76ea9f3d6c485ec1780fca4e500725a4a7bbc63c78ebc44170de9b619d94"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.17.1


