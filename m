Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id CB9147F386
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:04:43 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q21so10900627pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 08:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=q+1ksJiwnq3gv4Gb1giLmvDnxMwPIi+wsywwUtP8TBM=;
	b=JcczBOdUXAG4tS5uukvCGC4qHkDrB9vx7gkPXDGusq6x/KT8+AdONlrvrp3U4wHfse
	VRht6uonb4qikFCLRdbnUYuj/i2SoFuTdKvHQVYv5O6HiVvQ3MdrX6xszJgHyY1eU8Wi
	hE/BAQICEK4XnCXfOfV+Pusl4JCJE9BlQOpNYR7SoptpQyPYIPGC15i35AifUUfuiiqs
	r3NI7vmho8KTnnoQOJYCiTsOoEvY0MOrpaL+ljyNZJG1PV4C2y8HneKNfDBQSudWB3fz
	ElbxAOGL5R9o7ttX5ZAt54L/F0587TNbmhnKBWIl58LjBTaqlA1Ge3KJPsS8shJ3Ex+X
	/SUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=q+1ksJiwnq3gv4Gb1giLmvDnxMwPIi+wsywwUtP8TBM=;
	b=gXdGdu/BRRT+pNoC/44mQxZKal2dRtLTURpiF2nzxXa8CpCJov7HIAIhaAKWDDXI88
	CY1cUKRAKNTpt3E2S/LkUDJLE2vD10Z53EI+MuDjCc44hMZie52VOXm/RdL1Xzec91SL
	WfSSH3qYy7yJuDXVeEBiiyCgpALozOG1PkHDUJMPgLoBU3UjkAERz1tI56S4REzNyCln
	zElswkAyEiFEfUbw8oJc3Empqa+W+ZW4JfhQMnTl4xstXmxR3Wb/WDPdWJj+OTq9IKQb
	Mg0kteEUkYJqsxAwTbOXDyPMO3IlSKAB6vR8uaWPkOknwFj8DkvBFE9dYq8bScXOTyAC
	ziew==
X-Gm-Message-State: APjAAAV913wFeQnt2TWcRt8wcQ9Mx/ubc3mpLx8tuSG6bEh5V8E2xma7
	Zc+aIeaeZS23ewysqEeSgs+CkcFeqFc=
X-Google-Smtp-Source: APXvYqxPrO5gkR6BoNhGlaFwPbGPmva+2Ey2G0enD03f6gSbvdu1b0RDhARoQRZpw9A6syG/hr1bng==
X-Received: by 2002:a62:8683:: with SMTP id
	x125mr38511389pfd.108.1570547084351; 
	Tue, 08 Oct 2019 08:04:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	a8sm17675579pfo.118.2019.10.08.08.04.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Oct 2019 08:04:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 08:04:29 -0700
Message-Id: <6b7604c536a7a2da99490a7550f997a8e35ca043.1570546808.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1570546808.git.akuster808@gmail.com>
References: <cover.1570546808.git.akuster808@gmail.com>
Subject: [warrior 02/10] python3: upgrade 3.7.3 -> 3.7.4
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
X-List-Received-Date: Tue, 08 Oct 2019 15:04:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Anuj Mittal <anuj.mittal@intel.com>

Also fixes CVE-2019-9740, CVE-2019-9948. For details, see:

https://docs.python.org/3.7/whatsnew/changelog.html#python-3-7-4-final

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[ Backported patch removed. ]
Signed-off-by: Adrian Bunk <bunk@stusta.de>
[Bug fix only update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3/CVE-2019-9740.patch             | 151 ---------------------
 .../python/{python3_3.7.3.bb => python3_3.7.4.bb}  |   5 +-
 2 files changed, 2 insertions(+), 154 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9740.patch
 rename meta/recipes-devtools/python/{python3_3.7.3.bb => python3_3.7.4.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/CVE-2019-9740.patch b/meta/recipes-devtools/python/python3/CVE-2019-9740.patch
deleted file mode 100644
index 9bb336d..0000000
--- a/meta/recipes-devtools/python/python3/CVE-2019-9740.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 7e200e0763f5b71c199aaf98bd5588f291585619 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
-Date: Tue, 7 May 2019 17:28:47 +0200
-Subject: [PATCH] bpo-30458: Disallow control chars in http URLs. (GH-12755)
- (GH-13154)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Disallow control chars in http URLs in urllib.urlopen.  This addresses a potential security problem for applications that do not sanity check their URLs where http request headers could be injected.
-
-Disable https related urllib tests on a build without ssl (GH-13032)
-These tests require an SSL enabled build. Skip these tests when python is built without SSL to fix test failures.
-
-Use http.client.InvalidURL instead of ValueError as the new error case's exception. (GH-13044)
-
-Backport Co-Authored-By: Miro Hrončok <miro@hroncok.cz>
-Upstream-Status: Backport[https://github.com/python/cpython/commit/7e200e0763f5b71c199aaf98bd5588f291585619]
-CVE: CVE-2019-9740
-CVE: CVE-2019-9947
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- Lib/http/client.py                            | 15 ++++++
- Lib/test/test_urllib.py                       | 53 +++++++++++++++++++
- Lib/test/test_xmlrpc.py                       |  7 ++-
- .../2019-04-10-08-53-30.bpo-30458.51E-DA.rst  |  1 +
- 4 files changed, 75 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
-
-diff --git a/Lib/http/client.py b/Lib/http/client.py
-index 1de151c38e92..2afd452fe30f 100644
---- a/Lib/http/client.py
-+++ b/Lib/http/client.py
-@@ -140,6 +140,16 @@
- _is_legal_header_name = re.compile(rb'[^:\s][^:\r\n]*').fullmatch
- _is_illegal_header_value = re.compile(rb'\n(?![ \t])|\r(?![ \t\n])').search
- 
-+# These characters are not allowed within HTTP URL paths.
-+#  See https://tools.ietf.org/html/rfc3986#section-3.3 and the
-+#  https://tools.ietf.org/html/rfc3986#appendix-A pchar definition.
-+# Prevents CVE-2019-9740.  Includes control characters such as \r\n.
-+# We don't restrict chars above \x7f as putrequest() limits us to ASCII.
-+_contains_disallowed_url_pchar_re = re.compile('[\x00-\x20\x7f]')
-+# Arguably only these _should_ allowed:
-+#  _is_allowed_url_pchars_re = re.compile(r"^[/!$&'()*+,;=:@%a-zA-Z0-9._~-]+$")
-+# We are more lenient for assumed real world compatibility purposes.
-+
- # We always set the Content-Length header for these methods because some
- # servers will otherwise respond with a 411
- _METHODS_EXPECTING_BODY = {'PATCH', 'POST', 'PUT'}
-@@ -1101,6 +1111,11 @@ def putrequest(self, method, url, skip_host=False,
-         self._method = method
-         if not url:
-             url = '/'
-+        # Prevent CVE-2019-9740.
-+        match = _contains_disallowed_url_pchar_re.search(url)
-+        if match:
-+            raise InvalidURL(f"URL can't contain control characters. {url!r} "
-+                             f"(found at least {match.group()!r})")
-         request = '%s %s %s' % (method, url, self._http_vsn_str)
- 
-         # Non-ASCII characters should have been eliminated earlier
-diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
-index 2ac73b58d832..7214492eca9d 100644
---- a/Lib/test/test_urllib.py
-+++ b/Lib/test/test_urllib.py
-@@ -329,6 +329,59 @@ def test_willclose(self):
-         finally:
-             self.unfakehttp()
- 
-+    @unittest.skipUnless(ssl, "ssl module required")
-+    def test_url_with_control_char_rejected(self):
-+        for char_no in list(range(0, 0x21)) + [0x7f]:
-+            char = chr(char_no)
-+            schemeless_url = f"//localhost:7777/test{char}/"
-+            self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
-+            try:
-+                # We explicitly test urllib.request.urlopen() instead of the top
-+                # level 'def urlopen()' function defined in this... (quite ugly)
-+                # test suite.  They use different url opening codepaths.  Plain
-+                # urlopen uses FancyURLOpener which goes via a codepath that
-+                # calls urllib.parse.quote() on the URL which makes all of the
-+                # above attempts at injection within the url _path_ safe.
-+                escaped_char_repr = repr(char).replace('\\', r'\\')
-+                InvalidURL = http.client.InvalidURL
-+                with self.assertRaisesRegex(
-+                    InvalidURL, f"contain control.*{escaped_char_repr}"):
-+                    urllib.request.urlopen(f"http:{schemeless_url}")
-+                with self.assertRaisesRegex(
-+                    InvalidURL, f"contain control.*{escaped_char_repr}"):
-+                    urllib.request.urlopen(f"https:{schemeless_url}")
-+                # This code path quotes the URL so there is no injection.
-+                resp = urlopen(f"http:{schemeless_url}")
-+                self.assertNotIn(char, resp.geturl())
-+            finally:
-+                self.unfakehttp()
-+
-+    @unittest.skipUnless(ssl, "ssl module required")
-+    def test_url_with_newline_header_injection_rejected(self):
-+        self.fakehttp(b"HTTP/1.1 200 OK\r\n\r\nHello.")
-+        host = "localhost:7777?a=1 HTTP/1.1\r\nX-injected: header\r\nTEST: 123"
-+        schemeless_url = "//" + host + ":8080/test/?test=a"
-+        try:
-+            # We explicitly test urllib.request.urlopen() instead of the top
-+            # level 'def urlopen()' function defined in this... (quite ugly)
-+            # test suite.  They use different url opening codepaths.  Plain
-+            # urlopen uses FancyURLOpener which goes via a codepath that
-+            # calls urllib.parse.quote() on the URL which makes all of the
-+            # above attempts at injection within the url _path_ safe.
-+            InvalidURL = http.client.InvalidURL
-+            with self.assertRaisesRegex(
-+                InvalidURL, r"contain control.*\\r.*(found at least . .)"):
-+                urllib.request.urlopen(f"http:{schemeless_url}")
-+            with self.assertRaisesRegex(InvalidURL, r"contain control.*\\n"):
-+                urllib.request.urlopen(f"https:{schemeless_url}")
-+            # This code path quotes the URL so there is no injection.
-+            resp = urlopen(f"http:{schemeless_url}")
-+            self.assertNotIn(' ', resp.geturl())
-+            self.assertNotIn('\r', resp.geturl())
-+            self.assertNotIn('\n', resp.geturl())
-+        finally:
-+            self.unfakehttp()
-+
-     def test_read_0_9(self):
-         # "0.9" response accepted (but not "simple responses" without
-         # a status line)
-diff --git a/Lib/test/test_xmlrpc.py b/Lib/test/test_xmlrpc.py
-index 32263f7f0b3b..0e002ec4ef9f 100644
---- a/Lib/test/test_xmlrpc.py
-+++ b/Lib/test/test_xmlrpc.py
-@@ -945,7 +945,12 @@ def test_unicode_host(self):
-     def test_partial_post(self):
-         # Check that a partial POST doesn't make the server loop: issue #14001.
-         conn = http.client.HTTPConnection(ADDR, PORT)
--        conn.request('POST', '/RPC2 HTTP/1.0\r\nContent-Length: 100\r\n\r\nbye')
-+        conn.send('POST /RPC2 HTTP/1.0\r\n'
-+                  'Content-Length: 100\r\n\r\n'
-+                  'bye HTTP/1.1\r\n'
-+                  f'Host: {ADDR}:{PORT}\r\n'
-+                  'Accept-Encoding: identity\r\n'
-+                  'Content-Length: 0\r\n\r\n'.encode('ascii'))
-         conn.close()
- 
-     def test_context_manager(self):
-diff --git a/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst b/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
-new file mode 100644
-index 000000000000..ed8027fb4d64
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2019-04-10-08-53-30.bpo-30458.51E-DA.rst
-@@ -0,0 +1 @@
-+Address CVE-2019-9740 by disallowing URL paths with embedded whitespace or control characters through into the underlying http client request.  Such potentially malicious header injection URLs now cause an http.client.InvalidURL exception to be raised.
diff --git a/meta/recipes-devtools/python/python3_3.7.3.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.7.3.bb
rename to meta/recipes-devtools/python/python3_3.7.4.bb
index 1f1441f..dd16351 100644
--- a/meta/recipes-devtools/python/python3_3.7.3.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -22,7 +22,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0002-Don-t-do-runtime-test-to-get-float-byte-order.patch \
            file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
-           file://CVE-2019-9740.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -33,8 +32,8 @@ SRC_URI_append_class-nativesdk = " \
            file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
            "
 
-SRC_URI[md5sum] = "93df27aec0cd18d6d42173e601ffbbfd"
-SRC_URI[sha256sum] = "da60b54064d4cfcd9c26576f6df2690e62085123826cff2e667e72a91952d318"
+SRC_URI[md5sum] = "d33e4aae66097051c2eca45ee3604803"
+SRC_URI[sha256sum] = "fb799134b868199930b75f26678f18932214042639cd52b16da7fd134cd9b13f"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.7.4


