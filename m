Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6D1507F324
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 21:21:48 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k3so4685325pgb.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 14:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=QG+YZmIlI3qiTcyXkxR+4Wt2SkGNI31OLFmKzkzzR3E=;
	b=N59s2WvXw/x6UWU/SETO7k8j2KFEcuSCk6C3f2jeXnhyMu8MOrc8+fDibY6J9JKwbc
	8D+CTJlBMnHavyIBuw2l+rSqmlFUDGa2zgac7jk0b/rcYAE+Zdrq+DthHQX4SQfOZ5MK
	R31HeeXSklOwli3SmqKQng7dhXmsXlS5H4ChNotUjYdmlTN7jPKlQ23byQ3AndQwdyoU
	ZkAI/B1GW4+SMVO1qbKM3a5/D12ZSh5sLfZa1mPm77xmcsell/VMR/skdX1zlVixG78Z
	YhIZRGqihYVTKAv0fva66TwUvMbrCGQCRS75so0tHsybMh+x6q66nY/C9x+zUaUiAI0x
	0EBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=QG+YZmIlI3qiTcyXkxR+4Wt2SkGNI31OLFmKzkzzR3E=;
	b=syBnxXL1TEE9l8TXfLiPDFauPt2PyIJaaQy/cStoav1NfHwdnV0s7Ynwo9Nfa76PQ+
	Lm38uuDH+bTg4L1LGNRilmtg4X42oVxd8z6XawLuo8adrHjQLpGYZ72aKg10JxVeoCur
	EM7Hut1lgJ5jGMjlZs7DfrLQHbLeamLuBXKybiCWQt0xEXSDK7XPZmY1qgd7sJOeOYZz
	s6ixPgF78k7hqnEF+HM6kA8IcVGKa3veMelYHH6l2p8OO2EZ9AZDXAgK1AU/GaCuCERU
	wdjxemF1CeCUNRK6zdaF0M4rXTBa9pC/mKplTPm8fAWhHPSXXMvQ3HIo8G0Ofdg3Tyzq
	c5ow==
X-Gm-Message-State: APjAAAWKu0zbkZ9GFa0iORYyP3NvZJbsKBfQgJViZkqKenokxoFZ9Kv+
	1obzKKRRWawyVTFq7uqcyipsF2b0
X-Google-Smtp-Source: APXvYqwK1wy+XgLcYkmVdgw537dcF1d0AlYd9tEnz3q/6zB2M0Dg8vtvbSsBHCIUH0XBzs5h09Qh4Q==
X-Received: by 2002:a65:57ca:: with SMTP id q10mr13761580pgr.52.1566076909276; 
	Sat, 17 Aug 2019 14:21:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:29d8:851b:cd27:3ce0])
	by smtp.gmail.com with ESMTPSA id a20sm7261804pjo.0.2019.08.17.14.21.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Aug 2019 14:21:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Aug 2019 14:21:36 -0700
Message-Id: <ad90312adabbad951f62e3bd4ad95fcc763ad0c4.1566076780.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1566076780.git.akuster808@gmail.com>
References: <cover.1566076780.git.akuster808@gmail.com>
Subject: [thud-next][ 3/8] python3: fix CVE-2019-9740
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
X-List-Received-Date: Sat, 17 Aug 2019 21:21:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Anuj Mittal <anuj.mittal@intel.com>

CVE-2019-9947 is same as CVE-2019-9740 and mark it as such. See:

https://bugs.python.org/issue30458

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3/CVE-2019-9740.patch             | 155 +++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.6.bb      |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9740.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2019-9740.patch b/meta/recipes-devtools/python/python3/CVE-2019-9740.patch
new file mode 100644
index 0000000..8370901
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2019-9740.patch
@@ -0,0 +1,155 @@
+From afe3a4975cf93c97e5d6eb8800e48f368011d37a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
+Date: Sun, 14 Jul 2019 11:07:11 +0200
+Subject: [PATCH] bpo-30458: Disallow control chars in http URLs. (GH-12755)
+ (#13207)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Disallow control chars in http URLs in urllib.urlopen.  This addresses a potential security problem for applications that do not sanity check their URLs where http request headers could be injected.
+
+Disable https related urllib tests on a build without ssl (GH-13032)
+These tests require an SSL enabled build. Skip these tests when python is built without SSL to fix test failures.
+
+Use http.client.InvalidURL instead of ValueError as the new error case's exception. (GH-13044)
+
+Co-Authored-By: Miro Hrončok <miro@hroncok.cz>
+Upstream-Status: Backport[https://github.com/python/cpython/commit/afe3a4975cf93c97e5d6eb8800e48f368011d37a]
+CVE: CVE-2019-9740
+CVE: CVE-2019-9947
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ Lib/http/client.py                            | 16 ++++++
+ Lib/test/test_urllib.py                       | 55 +++++++++++++++++++
+ Lib/test/test_xmlrpc.py                       |  8 ++-
+ .../2019-04-10-08-53-30.bpo-30458.51E-DA.rst  |  1 +
+ 4 files changed, 79 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
+
+diff --git a/Lib/http/client.py b/Lib/http/client.py
+index 352c1017adce..76b9be69a374 100644
+--- a/Lib/http/client.py
++++ b/Lib/http/client.py
+@@ -141,6 +141,16 @@
+ _is_legal_header_name = re.compile(rb'[^:\s][^:\r\n]*').fullmatch
+ _is_illegal_header_value = re.compile(rb'\n(?![ \t])|\r(?![ \t\n])').search
+ 
++# These characters are not allowed within HTTP URL paths.
++#  See https://tools.ietf.org/html/rfc3986#section-3.3 and the
++#  https://tools.ietf.org/html/rfc3986#appendix-A pchar definition.
++# Prevents CVE-2019-9740.  Includes control characters such as \r\n.
++# We don't restrict chars above \x7f as putrequest() limits us to ASCII.
++_contains_disallowed_url_pchar_re = re.compile('[\x00-\x20\x7f]')
++# Arguably only these _should_ allowed:
++#  _is_allowed_url_pchars_re = re.compile(r"^[/!$&'()*+,;=:@%a-zA-Z0-9._~-]+$")
++# We are more lenient for assumed real world compatibility purposes.
++
+ # We always set the Content-Length header for these methods because some
+ # servers will otherwise respond with a 411
+ _METHODS_EXPECTING_BODY = {'PATCH', 'POST', 'PUT'}
+@@ -978,6 +988,12 @@ def putrequest(self, method, url, skip_host=False,
+         self._method = method
+         if not url:
+             url = '/'
++        # Prevent CVE-2019-9740.
++        match = _contains_disallowed_url_pchar_re.search(url)
++        if match:
++            raise InvalidURL("URL can't contain control characters. {!r} "
++                             "(found at least {!r})".format(url,
++                                                            match.group()))
+         request = '%s %s %s' % (method, url, self._http_vsn_str)
+ 
+         # Non-ASCII characters should have been eliminated earlier
+diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
+index 3afb1312de32..1e2c622e29fd 100644
+--- a/Lib/test/test_urllib.py
++++ b/Lib/test/test_urllib.py
+@@ -330,6 +330,61 @@ def test_willclose(self):
+         finally:
+             self.unfakehttp()
+ 
++    @unittest.skipUnless(ssl, "ssl module required")
++    def test_url_with_control_char_rejected(self):
++        for char_no in list(range(0, 0x21)) + [0x7f]:
++            char = chr(char_no)
++            schemeless_url = "//localhost:7777/test{}/".format(char)
++            self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
++            try:
++                # We explicitly test urllib.request.urlopen() instead of the top
++                # level 'def urlopen()' function defined in this... (quite ugly)
++                # test suite.  They use different url opening codepaths.  Plain
++                # urlopen uses FancyURLOpener which goes via a codepath that
++                # calls urllib.parse.quote() on the URL which makes all of the
++                # above attempts at injection within the url _path_ safe.
++                escaped_char_repr = repr(char).replace('\\', r'\\')
++                InvalidURL = http.client.InvalidURL
++                with self.assertRaisesRegex(
++                    InvalidURL,
++                    "contain control.*{}".format(escaped_char_repr)):
++                    urllib.request.urlopen("http:{}".format(schemeless_url))
++                with self.assertRaisesRegex(
++                    InvalidURL,
++                    "contain control.*{}".format(escaped_char_repr)):
++                    urllib.request.urlopen("https:{}".format(schemeless_url))
++                # This code path quotes the URL so there is no injection.
++                resp = urlopen("http:{}".format(schemeless_url))
++                self.assertNotIn(char, resp.geturl())
++            finally:
++                self.unfakehttp()
++
++    @unittest.skipUnless(ssl, "ssl module required")
++    def test_url_with_newline_header_injection_rejected(self):
++        self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
++        host = "localhost:7777?a=1 HTTP/1.1\r\nX-injected: header\r\nTEST: 123"
++        schemeless_url = "//" + host + ":8080/test/?test=a"
++        try:
++            # We explicitly test urllib.request.urlopen() instead of the top
++            # level 'def urlopen()' function defined in this... (quite ugly)
++            # test suite.  They use different url opening codepaths.  Plain
++            # urlopen uses FancyURLOpener which goes via a codepath that
++            # calls urllib.parse.quote() on the URL which makes all of the
++            # above attempts at injection within the url _path_ safe.
++            InvalidURL = http.client.InvalidURL
++            with self.assertRaisesRegex(
++                InvalidURL, r"contain control.*\\r.*(found at least . .)"):
++                urllib.request.urlopen("http:{}".format(schemeless_url))
++            with self.assertRaisesRegex(InvalidURL, r"contain control.*\\n"):
++                urllib.request.urlopen("https:{}".format(schemeless_url))
++            # This code path quotes the URL so there is no injection.
++            resp = urlopen("http:{}".format(schemeless_url))
++            self.assertNotIn(' ', resp.geturl())
++            self.assertNotIn('\r', resp.geturl())
++            self.assertNotIn('\n', resp.geturl())
++        finally:
++            self.unfakehttp()
++
+     def test_read_0_9(self):
+         # "0.9" response accepted (but not "simple responses" without
+         # a status line)
+diff --git a/Lib/test/test_xmlrpc.py b/Lib/test/test_xmlrpc.py
+index c2de057ecbfa..99e510fcee86 100644
+--- a/Lib/test/test_xmlrpc.py
++++ b/Lib/test/test_xmlrpc.py
+@@ -896,7 +896,13 @@ def test_unicode_host(self):
+     def test_partial_post(self):
+         # Check that a partial POST doesn't make the server loop: issue #14001.
+         conn = http.client.HTTPConnection(ADDR, PORT)
+-        conn.request('POST', '/RPC2 HTTP/1.0\r\nContent-Length: 100\r\n\r\nbye')
++        conn.send('POST /RPC2 HTTP/1.0\r\n'
++                  'Content-Length: 100\r\n\r\n'
++                  'bye HTTP/1.1\r\n'
++                  'Host: {}:{}\r\n'
++                  'Accept-Encoding: identity\r\n'
++                  'Content-Length: 0\r\n\r\n'
++                  .format(ADDR, PORT).encode('ascii'))
+         conn.close()
+ 
+     def test_context_manager(self):
+diff --git a/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst b/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
+new file mode 100644
+index 000000000000..ed8027fb4d64
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
+@@ -0,0 +1 @@
++Address CVE-2019-9740 by disallowing URL paths with embedded whitespace or control characters through into the underlying http client request.  Such potentially malicious header injection URLs now cause an http.client.InvalidURL exception to be raised.
diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index 6aa6df6..7e74c55 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -43,6 +43,7 @@ SRC_URI += "\
             file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch \
             file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
             file://run-ptest \
+            file://CVE-2019-9740.patch \
            "
 
 inherit multilib_header python3native update-alternatives qemu ptest
-- 
2.7.4


