Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web12.12599.1624892790913642775
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 08:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=X5JkwVTD;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.49, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f49.google.com with SMTP id v3-20020a4ac9030000b029024c9d0bff49so910842ooq.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 08:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=o/Y4KumMsHxZN0nd3FTKu7nkqAPbsFj7Gi3hNto48+Y=;
        b=X5JkwVTDdsE2ay90CBf0h7gbkXFw3I5wp5D6SdABXXF0AUgl4S2lX44CQ+/1vhWaoX
         YE1W4LlZJCyfEDKHtzeg9FDJ/UseV9gvbN8KGDPKRBMrDVDn5RnKbOazDfY5ru1gyj+5
         L6wz2+2oUMdpEoUcWYyL5jkyuMEI5KlenLJl46ZJVPdSD97ro65NTdS0h8KriYM8egIj
         Ki4Q02RNRb1OFxjZMo1ZOq637+iYLkjx8yASLLxBjcwE5lc8+tJ7zY2BGqt1pb7hJaCa
         qEJPjf42a3BclLsSWuwFfvYd/UiXWNcDtsJ1+eBFQbKgFpvVu2hyQJCuocfrdMwpWiff
         2efQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o/Y4KumMsHxZN0nd3FTKu7nkqAPbsFj7Gi3hNto48+Y=;
        b=l9QQzxB3KEQQdUO9+enTTKZTxZGENZ7IK6lfZ/dZ+Fx5V9vAFTjLJQLbf0SLQ46M71
         dFjBLFLmGTk0q9WFvV+NQH0IFg+k7ZRSPxw/Txy4426I7rq7BCrQuwyPj0iMdQb7WEYx
         2/n3BB49rPiA+Ghss7vMSQp09XEmrXF42zhyuRk/mLBbjrwpCwRapzqu01uUVdzaM1Hx
         Jtq7a9qcIyc9HioPTTzQUXSEdDMClV+9+PmuA6L1tbpkKN6I3TpsOULrZkgaq+GJ6GKR
         AbCMMe3niqK+IKWnUVhOzOqfvBiWeLAL3pHdJQ29ZHHCWPbVGV5BXFERZyv3wn8zme2g
         ljlg==
X-Gm-Message-State: AOAM530xgK6V6ZzdoSSamb1R7jggglCm1ldBEKs37Bo7+xM+RhmQ7JUi
	nszW9glcIRFgZx2CeQvXTOH0c8SNDGD60jkV7wQ=
X-Google-Smtp-Source: ABdhPJxCXXPna2h0OK6a0l0ze9ryPCaVBQ/iurwqR1PP9OPfHvuUPIlBcSnI6jW7ZND8RJJIMZLe6g==
X-Received: by 2002:a4a:2242:: with SMTP id z2mr19517211ooe.90.1624892789691;
        Mon, 28 Jun 2021 08:06:29 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id c21sm2095892otp.8.2021.06.28.08.06.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 08:06:29 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/14] python3: upgrade 3.8.4 -> 3.8.5
Date: Mon, 28 Jun 2021 05:05:24 -1000
Message-Id: <c68cc11071cfa49d9d986bf7a9e6e1dfff514a39.1624892565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1624892565.git.steve@sakoman.com>
References: <cover.1624892565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@intel.com>

Release Date: July 20, 2020

Note: The release you're looking at is Python 3.8.5, a bugfix release for the
legacy 3.8 series. Python 3.9 is now the latest feature release series of
Python 3.

Drop patches fixed in 3.8.5:
- CVE-2019-20907
- CVE-2019-26116

References:
https://nvd.nist.gov/vuln/detail/CVE-2019-20907
https://nvd.nist.gov/vuln/detail/CVE-2020-26116
https://www.python.org/downloads/release/python-385/
https://docs.python.org/release/3.8.5/whatsnew/changelog.html#changelog

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2019-20907.patch       |  44 --------
 .../python/python3/CVE-2020-26116.patch       | 104 ------------------
 .../{python3_3.8.4.bb => python3_3.8.5.bb}    |   6 +-
 3 files changed, 2 insertions(+), 152 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2019-20907.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2020-26116.patch
 rename meta/recipes-devtools/python/{python3_3.8.4.bb => python3_3.8.5.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/CVE-2019-20907.patch b/meta/recipes-devtools/python/python3/CVE-2019-20907.patch
deleted file mode 100644
index a2e72372dd..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2019-20907.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From a06a6bf4e67a50561f6d6fb33534df1d3035ea34 Mon Sep 17 00:00:00 2001
-From: Rishi <rishi_devan@mail.com>
-Date: Wed, 15 Jul 2020 13:51:00 +0200
-Subject: [PATCH] bpo-39017: Avoid infinite loop in the tarfile module
- (GH-21454)
-
-Avoid infinite loop when reading specially crafted TAR files using the tarfile module
-(CVE-2019-20907).
-(cherry picked from commit 5a8d121a1f3ef5ad7c105ee378cc79a3eac0c7d4)
-
-Co-authored-by: Rishi <rishi_devan@mail.com>
-
-Removed testing 'recursion.tar' tar file due to binary data
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/c55479556db015f48fc8bbca17f64d3e65598559]
-CVE: CVE-2019-20907
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
----
- Lib/tarfile.py                                    |   2 ++
- .../2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst      |   1 +
- 4 files changed, 10 insertions(+)
- create mode 100644 Lib/test/recursion.tar
- create mode 100644 Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index d31b9cbb51d65..7a69e1b1aa544 100755
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -1241,6 +1241,8 @@ def _proc_pax(self, tarfile):
- 
-             length, keyword = match.groups()
-             length = int(length)
-+            if length == 0:
-+                raise InvalidHeaderError("invalid header")
-             value = buf[match.end(2) + 1:match.start(1) + length - 1]
- 
-             # Normally, we could just use "utf-8" as the encoding and "strict"
-diff --git a/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst b/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst
-new file mode 100644
-index 0000000000000..ad26676f8b856
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2020-07-12-22-16-58.bpo-39017.x3Cg-9.rst
-@@ -0,0 +1 @@
-+Avoid infinite loop when reading specially crafted TAR files using the tarfile module (CVE-2019-20907).
diff --git a/meta/recipes-devtools/python/python3/CVE-2020-26116.patch b/meta/recipes-devtools/python/python3/CVE-2020-26116.patch
deleted file mode 100644
index c019db2a76..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2020-26116.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 668d321476d974c4f51476b33aaca870272523bf Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Sat, 18 Jul 2020 13:39:12 -0700
-Subject: [PATCH] bpo-39603: Prevent header injection in http methods
- (GH-18485)
-
-reject control chars in http method in http.client.putrequest to prevent http header injection
-(cherry picked from commit 8ca8a2e8fb068863c1138f07e3098478ef8be12e)
-
-Co-authored-by: AMIR <31338382+amiremohamadi@users.noreply.github.com>
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/668d321476d974c4f51476b33aaca870272523bf]
-CVE: CVE-2020-26116
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
-
----
- Lib/http/client.py                            | 15 +++++++++++++
- Lib/test/test_httplib.py                      | 22 +++++++++++++++++++
- .../2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst  |  2 ++
- 3 files changed, 39 insertions(+)
- create mode 100644 Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst
-
-diff --git a/Lib/http/client.py b/Lib/http/client.py
-index 019380a720318..c2ad0471bfee5 100644
---- a/Lib/http/client.py
-+++ b/Lib/http/client.py
-@@ -147,6 +147,10 @@
- #  _is_allowed_url_pchars_re = re.compile(r"^[/!$&'()*+,;=:@%a-zA-Z0-9._~-]+$")
- # We are more lenient for assumed real world compatibility purposes.
- 
-+# These characters are not allowed within HTTP method names
-+# to prevent http header injection.
-+_contains_disallowed_method_pchar_re = re.compile('[\x00-\x1f]')
-+
- # We always set the Content-Length header for these methods because some
- # servers will otherwise respond with a 411
- _METHODS_EXPECTING_BODY = {'PATCH', 'POST', 'PUT'}
-@@ -1087,6 +1091,8 @@ def putrequest(self, method, url, skip_host=False,
-         else:
-             raise CannotSendRequest(self.__state)
- 
-+        self._validate_method(method)
-+
-         # Save the method for use later in the response phase
-         self._method = method
- 
-@@ -1177,6 +1183,15 @@ def _encode_request(self, request):
-         # ASCII also helps prevent CVE-2019-9740.
-         return request.encode('ascii')
- 
-+    def _validate_method(self, method):
-+        """Validate a method name for putrequest."""
-+        # prevent http header injection
-+        match = _contains_disallowed_method_pchar_re.search(method)
-+        if match:
-+            raise ValueError(
-+                    f"method can't contain control characters. {method!r} "
-+                    f"(found at least {match.group()!r})")
-+
-     def _validate_path(self, url):
-         """Validate a url for putrequest."""
-         # Prevent CVE-2019-9740.
-diff --git a/Lib/test/test_httplib.py b/Lib/test/test_httplib.py
-index 8f0e27a1fb836..5a5fcecbc9c15 100644
---- a/Lib/test/test_httplib.py
-+++ b/Lib/test/test_httplib.py
-@@ -364,6 +364,28 @@ def test_headers_debuglevel(self):
-         self.assertEqual(lines[3], "header: Second: val2")
- 
- 
-+class HttpMethodTests(TestCase):
-+    def test_invalid_method_names(self):
-+        methods = (
-+            'GET\r',
-+            'POST\n',
-+            'PUT\n\r',
-+            'POST\nValue',
-+            'POST\nHOST:abc',
-+            'GET\nrHost:abc\n',
-+            'POST\rRemainder:\r',
-+            'GET\rHOST:\n',
-+            '\nPUT'
-+        )
-+
-+        for method in methods:
-+            with self.assertRaisesRegex(
-+                    ValueError, "method can't contain control characters"):
-+                conn = client.HTTPConnection('example.com')
-+                conn.sock = FakeSocket(None)
-+                conn.request(method=method, url="/")
-+
-+
- class TransferEncodingTest(TestCase):
-     expected_body = b"It's just a flesh wound"
- 
-diff --git a/Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst b/Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst
-new file mode 100644
-index 0000000000000..990affc3edd9d
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst
-@@ -0,0 +1,2 @@
-+Prevent http header injection by rejecting control characters in
-+http.client.putrequest(...).
diff --git a/meta/recipes-devtools/python/python3_3.8.4.bb b/meta/recipes-devtools/python/python3_3.8.5.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.8.4.bb
rename to meta/recipes-devtools/python/python3_3.8.5.bb
index 438b3e5504..21b6be58f7 100644
--- a/meta/recipes-devtools/python/python3_3.8.4.bb
+++ b/meta/recipes-devtools/python/python3_3.8.5.bb
@@ -33,8 +33,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-configure.ac-fix-LIBPL.patch \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
-           file://CVE-2019-20907.patch \
-           file://CVE-2020-26116.patch \
            file://CVE-2020-27619.patch \
            file://CVE-2021-3177.patch \
            "
@@ -45,8 +43,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "e16df33cd7b58702e57e137f8f5d13e7"
-SRC_URI[sha256sum] = "5f41968a95afe9bc12192d7e6861aab31e80a46c46fa59d3d837def6a4cd4d37"
+SRC_URI[md5sum] = "35b5a3d0254c1c59be9736373d429db7"
+SRC_URI[sha256sum] = "e3003ed57db17e617acb382b0cade29a248c6026b1bd8aad1f976e9af66a83b0"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.25.1

