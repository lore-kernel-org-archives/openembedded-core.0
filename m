Return-Path: <msft.dantran@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id ABDAD731B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 18:24:09 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id q203so14069055qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 11:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BJmBaNj+cOWg73XiWB5mI7vqucmQiS7ROWRu3ko9+Co=;
	b=qcb7m+1ROO7tO7fxPjib0VY1E1KQaSlxi3Zh5+yEco2lulRqX2c285KE7tmV8mapob
	Sid//TbDTlrFDw/SHkWFSvWOvMMVjHty9WqndpAtYH5ebQ2zw+YiiWyCKH1ZpIEV02Eh
	oH4kGj+16UraW9C/XjkJ63X6yJIJjJt/fFpP4lmysMpGEkZqWaD0NdqaANUmgQUl+KVN
	v46Znto7GoBhMC4sl8kqWi6JglKrW7iGm/xWNRoqYXZ095nbqPJlsTZ49rqR5VT+NKgf
	z1NvDNZxcv2Fg9CMcTW7/2Q6HoU8MKWn1YM4hI92GqX1c/l+PZkih7tY7YOvcKAFwOys
	VX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BJmBaNj+cOWg73XiWB5mI7vqucmQiS7ROWRu3ko9+Co=;
	b=uNV5IrGMgSlii817vneMr6iTOeGsVzpVAZ24E5/aCet8DiaNUfQuuQBi8YG+A3Qp//
	Y7crJhELJWyTJxQh2aUxm5KF/sCOB36VO7iuiJ+98k7t/4CK6/VQnGoUpyUiu6s4ii1k
	zeuOhgMk45h16JlsF431kKWmf48zpLOJzH7u7uy7xkI5UPrUOTytHZDCyq3BjekTPBjC
	D+NFB9SpapzeUxV6ATbJnThDoiOlemUbky7QbtBborCzY9pH4AZq5O54m+V+OZ0IbWQ9
	0yXYMUwwxWMVfvmYXtt8WFmA7EWcWlh/AupdQc8ipHJEvxYq3GyG8iHOuM2QEuVDzJ6N
	PylA==
X-Gm-Message-State: APjAAAV0l9S37mzUru1nwMARQYjE7YQVorpjUqJrLOmukRvW73vakHrF
	GNEk1EpZDuKNyI2GPdA5GNOOr3fmEd8=
X-Google-Smtp-Source: APXvYqwesmnNtQ7+PpkBD+aH0GYhJNUa7NdCzkWJ4S6wHtNGCUKIPdweadcWWPe0wLou2dF7dqD9Rg==
X-Received: by 2002:a05:620a:1510:: with SMTP id
	i16mr24459876qkk.318.1568053450177; 
	Mon, 09 Sep 2019 11:24:10 -0700 (PDT)
Received: from
	dantran-yocto.nbqgwzabenwu5ordtxtxpzrzah.cx.internal.cloudapp.net
	([52.184.230.242])
	by smtp.gmail.com with ESMTPSA id 20sm7718950qkn.4.2019.09.09.11.24.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Sep 2019 11:24:09 -0700 (PDT)
From: msft.dantran@gmail.com
X-Google-Original-From: dantran@microsoft.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Sep 2019 18:24:01 +0000
Message-Id: <1568053441-82475-1-git-send-email-dantran@microsoft.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [thud] python: Fix 3 CVEs
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
X-List-Received-Date: Mon, 09 Sep 2019 18:24:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Dan Tran <dantran@microsoft.com>

Fixes CVE-2018-20852, CVE-2019-9740, and CVE-2019-9747

Signed-off-by: Dan Tran <dantran@microsoft.com>
---
 .../python/python/bpo-30458-cve-2019-9740.patch    | 219 +++++++++++++++++++++
 .../python/python/bpo-35121-cve-2018-20852.patch   | 127 ++++++++++++
 meta/recipes-devtools/python/python_2.7.16.bb      |   2 +
 3 files changed, 348 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/bpo-30458-cve-2019-9740.patch
 create mode 100644 meta/recipes-devtools/python/python/bpo-35121-cve-2018-20852.patch

diff --git a/meta/recipes-devtools/python/python/bpo-30458-cve-2019-9740.patch b/meta/recipes-devtools/python/python/bpo-30458-cve-2019-9740.patch
new file mode 100644
index 0000000..f4c56bb
--- /dev/null
+++ b/meta/recipes-devtools/python/python/bpo-30458-cve-2019-9740.patch
@@ -0,0 +1,219 @@
+From 39815ee5bb7f2f9ca1f0d5e9f51e27a2877ec35b Mon Sep 17 00:00:00 2001
+From: Victor Stinner <victor.stinner@gmail.com>
+Date: Tue, 21 May 2019 15:12:33 +0200
+Subject: [PATCH] bpo-30458: Disallow control chars in http URLs (GH-12755)
+ (GH-13154) (GH-13315)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Disallow control chars in http URLs in urllib2.urlopen.  This
+addresses a potential security problem for applications that do not
+sanity check their URLs where http request headers could be injected.
+
+Disable https related urllib tests on a build without ssl (GH-13032)
+These tests require an SSL enabled build. Skip these tests when
+python is built without SSL to fix test failures.
+
+Use httplib.InvalidURL instead of ValueError as the new error case's
+exception. (GH-13044)
+
+Backport Co-Authored-By: Miro Hrončok <miro@hroncok.cz>
+
+(cherry picked from commit 7e200e0763f5b71c199aaf98bd5588f291585619)
+
+Notes on backport to Python 2.7:
+
+* test_urllib tests urllib.urlopen() which quotes the URL and so is
+  not vulerable to HTTP Header Injection.
+* Add tests to test_urllib2 on urllib2.urlopen().
+* Reject non-ASCII characters: range 0x80-0xff.
+
+CVE: CVE-2019-9740 CVE-2019-9747
+Upstream-Status: Accepted
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ Lib/httplib.py                                | 16 ++++++
+ Lib/test/test_urllib.py                       | 25 +++++++++
+ Lib/test/test_urllib2.py                      | 51 ++++++++++++++++++-
+ Lib/test/test_xmlrpc.py                       |  8 ++-
+ .../2019-04-10-08-53-30.bpo-30458.51E-DA.rst  |  1 +
+ 5 files changed, 99 insertions(+), 2 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
+
+diff --git a/Lib/httplib.py b/Lib/httplib.py
+index 60a8fb4e35..1b41c346e0 100644
+--- a/Lib/httplib.py
++++ b/Lib/httplib.py
+@@ -247,6 +247,16 @@ _MAXHEADERS = 100
+ _is_legal_header_name = re.compile(r'\A[^:\s][^:\r\n]*\Z').match
+ _is_illegal_header_value = re.compile(r'\n(?![ \t])|\r(?![ \t\n])').search
+ 
++# These characters are not allowed within HTTP URL paths.
++#  See https://tools.ietf.org/html/rfc3986#section-3.3 and the
++#  https://tools.ietf.org/html/rfc3986#appendix-A pchar definition.
++# Prevents CVE-2019-9740.  Includes control characters such as \r\n.
++# Restrict non-ASCII characters above \x7f (0x80-0xff).
++_contains_disallowed_url_pchar_re = re.compile('[\x00-\x20\x7f-\xff]')
++# Arguably only these _should_ allowed:
++#  _is_allowed_url_pchars_re = re.compile(r"^[/!$&'()*+,;=:@%a-zA-Z0-9._~-]+$")
++# We are more lenient for assumed real world compatibility purposes.
++
+ # We always set the Content-Length header for these methods because some
+ # servers will otherwise respond with a 411
+ _METHODS_EXPECTING_BODY = {'PATCH', 'POST', 'PUT'}
+@@ -927,6 +937,12 @@ class HTTPConnection:
+         self._method = method
+         if not url:
+             url = '/'
++        # Prevent CVE-2019-9740.
++        match = _contains_disallowed_url_pchar_re.search(url)
++        if match:
++            raise InvalidURL("URL can't contain control characters. %r "
++                             "(found at least %r)"
++                             % (url, match.group()))
+         hdr = '%s %s %s' % (method, url, self._http_vsn_str)
+ 
+         self._output(hdr)
+diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
+index 1ce9201c06..d7778d4194 100644
+--- a/Lib/test/test_urllib.py
++++ b/Lib/test/test_urllib.py
+@@ -257,6 +257,31 @@ class urlopen_HttpTests(unittest.TestCase, FakeHTTPMixin):
+         finally:
+             self.unfakehttp()
+ 
++    def test_url_with_control_char_rejected(self):
++        for char_no in range(0, 0x21) + range(0x7f, 0x100):
++            char = chr(char_no)
++            schemeless_url = "//localhost:7777/test%s/" % char
++            self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
++            try:
++                # urllib quotes the URL so there is no injection.
++                resp = urllib.urlopen("http:" + schemeless_url)
++                self.assertNotIn(char, resp.geturl())
++            finally:
++                self.unfakehttp()
++
++    def test_url_with_newline_header_injection_rejected(self):
++        self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
++        host = "localhost:7777?a=1 HTTP/1.1\r\nX-injected: header\r\nTEST: 123"
++        schemeless_url = "//" + host + ":8080/test/?test=a"
++        try:
++            # urllib quotes the URL so there is no injection.
++            resp = urllib.urlopen("http:" + schemeless_url)
++            self.assertNotIn(' ', resp.geturl())
++            self.assertNotIn('\r', resp.geturl())
++            self.assertNotIn('\n', resp.geturl())
++        finally:
++            self.unfakehttp()
++
+     def test_read_bogus(self):
+         # urlopen() should raise IOError for many error codes.
+         self.fakehttp('''HTTP/1.1 401 Authentication Required
+diff --git a/Lib/test/test_urllib2.py b/Lib/test/test_urllib2.py
+index 6d24d5ddf8..9531818e16 100644
+--- a/Lib/test/test_urllib2.py
++++ b/Lib/test/test_urllib2.py
+@@ -15,6 +15,9 @@ try:
+ except ImportError:
+     ssl = None
+ 
++from test.test_urllib import FakeHTTPMixin
++
++
+ # XXX
+ # Request
+ # CacheFTPHandler (hard to write)
+@@ -1262,7 +1265,7 @@ class HandlerTests(unittest.TestCase):
+         self.assertEqual(len(http_handler.requests), 1)
+         self.assertFalse(http_handler.requests[0].has_header(auth_header))
+ 
+-class MiscTests(unittest.TestCase):
++class MiscTests(unittest.TestCase, FakeHTTPMixin):
+ 
+     def test_build_opener(self):
+         class MyHTTPHandler(urllib2.HTTPHandler): pass
+@@ -1317,6 +1320,52 @@ class MiscTests(unittest.TestCase):
+             "Unsupported digest authentication algorithm 'invalid'"
+         )
+ 
++    @unittest.skipUnless(ssl, "ssl module required")
++    def test_url_with_control_char_rejected(self):
++        for char_no in range(0, 0x21) + range(0x7f, 0x100):
++            char = chr(char_no)
++            schemeless_url = "//localhost:7777/test%s/" % char
++            self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
++            try:
++                # We explicitly test urllib.request.urlopen() instead of the top
++                # level 'def urlopen()' function defined in this... (quite ugly)
++                # test suite.  They use different url opening codepaths.  Plain
++                # urlopen uses FancyURLOpener which goes via a codepath that
++                # calls urllib.parse.quote() on the URL which makes all of the
++                # above attempts at injection within the url _path_ safe.
++                escaped_char_repr = repr(char).replace('\\', r'\\')
++                InvalidURL = httplib.InvalidURL
++                with self.assertRaisesRegexp(
++                    InvalidURL, "contain control.*" + escaped_char_repr):
++                    urllib2.urlopen("http:" + schemeless_url)
++                with self.assertRaisesRegexp(
++                    InvalidURL, "contain control.*" + escaped_char_repr):
++                    urllib2.urlopen("https:" + schemeless_url)
++            finally:
++                self.unfakehttp()
++
++    @unittest.skipUnless(ssl, "ssl module required")
++    def test_url_with_newline_header_injection_rejected(self):
++        self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
++        host = "localhost:7777?a=1 HTTP/1.1\r\nX-injected: header\r\nTEST: 123"
++        schemeless_url = "//" + host + ":8080/test/?test=a"
++        try:
++            # We explicitly test urllib2.urlopen() instead of the top
++            # level 'def urlopen()' function defined in this... (quite ugly)
++            # test suite.  They use different url opening codepaths.  Plain
++            # urlopen uses FancyURLOpener which goes via a codepath that
++            # calls urllib.parse.quote() on the URL which makes all of the
++            # above attempts at injection within the url _path_ safe.
++            InvalidURL = httplib.InvalidURL
++            with self.assertRaisesRegexp(
++                InvalidURL, r"contain control.*\\r.*(found at least . .)"):
++                urllib2.urlopen("http:" + schemeless_url)
++            with self.assertRaisesRegexp(InvalidURL, r"contain control.*\\n"):
++                urllib2.urlopen("https:" + schemeless_url)
++        finally:
++            self.unfakehttp()
++
++
+ 
+ class RequestTests(unittest.TestCase):
+ 
+diff --git a/Lib/test/test_xmlrpc.py b/Lib/test/test_xmlrpc.py
+index 36b3be67fd..90ccb30716 100644
+--- a/Lib/test/test_xmlrpc.py
++++ b/Lib/test/test_xmlrpc.py
+@@ -659,7 +659,13 @@ class SimpleServerTestCase(BaseServerTestCase):
+     def test_partial_post(self):
+         # Check that a partial POST doesn't make the server loop: issue #14001.
+         conn = httplib.HTTPConnection(ADDR, PORT)
+-        conn.request('POST', '/RPC2 HTTP/1.0\r\nContent-Length: 100\r\n\r\nbye')
++        conn.send('POST /RPC2 HTTP/1.0\r\n'
++                  'Content-Length: 100\r\n\r\n'
++                  'bye HTTP/1.1\r\n'
++                  'Host: %s:%s\r\n'
++                  'Accept-Encoding: identity\r\n'
++                  'Content-Length: 0\r\n\r\n'
++                  % (ADDR, PORT))
+         conn.close()
+ 
+ class SimpleServerEncodingTestCase(BaseServerTestCase):
+diff --git a/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst b/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
+new file mode 100644
+index 0000000000..47cb899df1
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
+@@ -0,0 +1 @@
++Address CVE-2019-9740 by disallowing URL paths with embedded whitespace or control characters through into the underlying http client request.  Such potentially malicious header injection URLs now cause an httplib.InvalidURL exception to be raised.
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/python/python/bpo-35121-cve-2018-20852.patch b/meta/recipes-devtools/python/python/bpo-35121-cve-2018-20852.patch
new file mode 100644
index 0000000..7ce7b1f
--- /dev/null
+++ b/meta/recipes-devtools/python/python/bpo-35121-cve-2018-20852.patch
@@ -0,0 +1,127 @@
+From 1bd50d351e508b8947e5813c5f925eb4b61c8d76 Mon Sep 17 00:00:00 2001
+From: Xtreak <tir.karthi@gmail.com>
+Date: Sat, 15 Jun 2019 20:59:43 +0530
+Subject: [PATCH] [2.7] bpo-35121: prefix dot in domain for proper subdomain
+ validation (GH-10258) (GH-13426)
+
+This is a manual backport of ca7fe5063593958e5efdf90f068582837f07bd14 since 2.7 has `http.cookiejar` in `cookielib`
+
+https://bugs.python.org/issue35121
+
+CVE: CVE-2018-20852
+Upstream-Status: Accepted
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ Lib/cookielib.py                              | 13 ++++++--
+ Lib/test/test_cookielib.py                    | 30 +++++++++++++++++++
+ .../2019-05-20-00-35-12.bpo-35121.RRi-HU.rst  |  4 +++
+ 3 files changed, 45 insertions(+), 2 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-05-20-00-35-12.bpo-35121.RRi-HU.rst
+
+diff --git a/Lib/cookielib.py b/Lib/cookielib.py
+index 2dd7c48728..0b471a42f2 100644
+--- a/Lib/cookielib.py
++++ b/Lib/cookielib.py
+@@ -1139,6 +1139,11 @@ class DefaultCookiePolicy(CookiePolicy):
+         req_host, erhn = eff_request_host(request)
+         domain = cookie.domain
+ 
++        if domain and not domain.startswith("."):
++            dotdomain = "." + domain
++        else:
++            dotdomain = domain
++
+         # strict check of non-domain cookies: Mozilla does this, MSIE5 doesn't
+         if (cookie.version == 0 and
+             (self.strict_ns_domain & self.DomainStrictNonDomain) and
+@@ -1151,7 +1156,7 @@ class DefaultCookiePolicy(CookiePolicy):
+             _debug("   effective request-host name %s does not domain-match "
+                    "RFC 2965 cookie domain %s", erhn, domain)
+             return False
+-        if cookie.version == 0 and not ("."+erhn).endswith(domain):
++        if cookie.version == 0 and not ("."+erhn).endswith(dotdomain):
+             _debug("   request-host %s does not match Netscape cookie domain "
+                    "%s", req_host, domain)
+             return False
+@@ -1165,7 +1170,11 @@ class DefaultCookiePolicy(CookiePolicy):
+             req_host = "."+req_host
+         if not erhn.startswith("."):
+             erhn = "."+erhn
+-        if not (req_host.endswith(domain) or erhn.endswith(domain)):
++        if domain and not domain.startswith("."):
++            dotdomain = "." + domain
++        else:
++            dotdomain = domain
++        if not (req_host.endswith(dotdomain) or erhn.endswith(dotdomain)):
+             #_debug("   request domain %s does not match cookie domain %s",
+             #       req_host, domain)
+             return False
+diff --git a/Lib/test/test_cookielib.py b/Lib/test/test_cookielib.py
+index f2dd9727d1..7f7ff614d6 100644
+--- a/Lib/test/test_cookielib.py
++++ b/Lib/test/test_cookielib.py
+@@ -368,6 +368,7 @@ class CookieTests(TestCase):
+             ("http://foo.bar.com/", ".foo.bar.com", True),
+             ("http://foo.bar.com/", "foo.bar.com", True),
+             ("http://foo.bar.com/", ".bar.com", True),
++            ("http://foo.bar.com/", "bar.com", True),
+             ("http://foo.bar.com/", "com", True),
+             ("http://foo.com/", "rhubarb.foo.com", False),
+             ("http://foo.com/", ".foo.com", True),
+@@ -378,6 +379,8 @@ class CookieTests(TestCase):
+             ("http://foo/", "foo", True),
+             ("http://foo/", "foo.local", True),
+             ("http://foo/", ".local", True),
++            ("http://barfoo.com", ".foo.com", False),
++            ("http://barfoo.com", "foo.com", False),
+             ]:
+             request = urllib2.Request(url)
+             r = pol.domain_return_ok(domain, request)
+@@ -938,6 +941,33 @@ class CookieTests(TestCase):
+         c.add_cookie_header(req)
+         self.assertFalse(req.has_header("Cookie"))
+ 
++        c.clear()
++
++        pol.set_blocked_domains([])
++        req = Request("http://acme.com/")
++        res = FakeResponse(headers, "http://acme.com/")
++        cookies = c.make_cookies(res, req)
++        c.extract_cookies(res, req)
++        self.assertEqual(len(c), 1)
++
++        req = Request("http://acme.com/")
++        c.add_cookie_header(req)
++        self.assertTrue(req.has_header("Cookie"))
++
++        req = Request("http://badacme.com/")
++        c.add_cookie_header(req)
++        self.assertFalse(pol.return_ok(cookies[0], req))
++        self.assertFalse(req.has_header("Cookie"))
++
++        p = pol.set_blocked_domains(["acme.com"])
++        req = Request("http://acme.com/")
++        c.add_cookie_header(req)
++        self.assertFalse(req.has_header("Cookie"))
++
++        req = Request("http://badacme.com/")
++        c.add_cookie_header(req)
++        self.assertFalse(req.has_header("Cookie"))
++
+     def test_secure(self):
+         from cookielib import CookieJar, DefaultCookiePolicy
+ 
+diff --git a/Misc/NEWS.d/next/Security/2019-05-20-00-35-12.bpo-35121.RRi-HU.rst b/Misc/NEWS.d/next/Security/2019-05-20-00-35-12.bpo-35121.RRi-HU.rst
+new file mode 100644
+index 0000000000..7725180616
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-05-20-00-35-12.bpo-35121.RRi-HU.rst
+@@ -0,0 +1,4 @@
++Don't send cookies of domain A without Domain attribute to domain B when
++domain A is a suffix match of domain B while using a cookiejar with
++:class:`cookielib.DefaultCookiePolicy` policy. Patch by Karthikeyan
++Singaravelan.
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/python/python_2.7.16.bb b/meta/recipes-devtools/python/python_2.7.16.bb
index 9c79faf..16b1744 100644
--- a/meta/recipes-devtools/python/python_2.7.16.bb
+++ b/meta/recipes-devtools/python/python_2.7.16.bb
@@ -35,6 +35,8 @@ SRC_URI += "\
   file://bpo-35907-cve-2019-9948-fix.patch \
   file://bpo-36216-cve-2019-9636.patch \
   file://bpo-36216-cve-2019-9636-fix.patch \
+  file://bpo-35121-cve-2018-20852.patch \
+  file://bpo-30458-cve-2019-9740.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.7.4


