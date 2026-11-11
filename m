Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5612.1794387834993499933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=W+V+wxm/;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so26477145e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387833; x=1794992633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oldsg4wJ3MLKNiIBmoRYkvoKdbS7zCdJh3VKTcaXVLk=;
        b=W+V+wxm/+kA5knRSuYkTuqrDaJ8xkTVi4bOUNsOOKTVaXhw7hHqBkVtOgwC5SMPci8
         zCMfE1jgM7gC7WYMnSjF2BETh+r0faXM00BY82EE38UHb2w91NDBjFAZNfr4Tea6t+yX
         Nt1AH/YnHyPjwo3BGkj+7+xredgPW8NZKa2kycIp86TR+S7zTzs5H5i953HMBVO4BGVK
         /OIjhZMccEFd7nVLQFCqZve5sUOlJM6ZpfLVew6RI2mgKlDYLd+POvmgKHoVWv88JWuh
         FXE30njdbrhigoZ6Rh6uuO+vCFFS4K2++Iu1+xszvV2964JJwHAl/sDKh1NPelG1LT9b
         PGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387833; x=1794992633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oldsg4wJ3MLKNiIBmoRYkvoKdbS7zCdJh3VKTcaXVLk=;
        b=aNnt+fzCQHsYTkhTNY6zpSVWhuLw5mw7a5L65RK9sWnATGUiN36jhC2je+rbJBfeWG
         23bsOeSlfkmjqXh1fjzLrPq3sQ3GUshgCHdt+WqAnwIbbc1OA2ZF5JGbdRCvW9kT8ldG
         ZCmgGkFKUf5znXgw33VaVUA+DVwOYQkaRMxP5GVgeYGsEHJyzda2PVX//yddZYh/Z/xb
         nZebpCbAf3mPUMeIE4zpaCmJugREWt3Z9vFSIMZCnb0GanHEiR9w2cn0sIo7KVO6R+Sj
         anxt7/XFVu79nTS9441vmyTNcSQeASHFEl6NhX8n1LIw0/mwoG985Oc2qmOU2O19KR3a
         0/WQ==
X-Gm-Message-State: APuU4Z+oqEXv4wWFDpJ4dRji/+fPf1m736xy+LvtJSDISW4KE56/kAf1
	fzLN06GfTUwaOGWfCOinyCZ6ojQGRF14SqSNq5gR/P6OlKdqsZLnq3dOmbpUQYoWbbcPdb2nFHc
	bLhAjngc=
X-Gm-Gg: AYBFou1gTIz5XB4p8WGV05PHPPwKCmfB1pMGmCh5l21djoLGo/jJi+PkVC4Lagfamrw
	e9G3T5l6u98mYzaJW2/9Y8RyxuuLepPUyZD79dP7YxvVgTdA92H3ASs8ik3GJ7CMjU7JnqYbS67
	tiCNngeeUxgYpmyG4RpTP6foR34roCgjMEqog8c4+8Fq+q9Os8gsTwEWejUa/RIHBRYODcS+vQe
	1ofY+xtYPzul5rPd2YybPl3vLEe5HuTw40DNhOi5ifbSz4MaNesR6srm1F4skhYEHqi14CNxnaD
	EhLvWJVRKBGrZOKLWxniQX9tvJBhEsb+3jFb9uIct+bwB359ubrofUGVKjreULIrfovi237aAcU
	U6q2nB7m+hhojB6NMvfrdrIqc1+cpqmYaEn5bisoy/1t+tMb1RhCLWvWxcEn/I0EqAmpVQ7CFLQ
	7MbZzeddeY2xevE1jOkhTnzkUC/LBcczxLlFBQ/9CMp8N4YKiMOixWz3i3w8gfw/BNEI/XAzEny
	KldKvwvKb93ibYvzHLib/x0gjauRb62g2HnNDueAUPxMEDYLts66HqnHZ1kCBvh23TnPdm/HZam
	n1oWgx10ryD8OPMCjFJfCfaouWYmfLG1Y7OK9mqfu0GusNqeWdKiLhEOuA+DZIbvkYxfJOXS+bn
	QpgPBUDvCyS8b+2f5TrDJ4pRd83PXcCPd3vnsqyy/3GxDx1fGhg==
X-Received: by 2002:a05:600c:e556:10b0:4ba:4395:560f with SMTP id 5b1f17b1804b1-4ba43955a50mr13547995e9.8.1794387833016;
        Wed, 11 Nov 2026 01:03:53 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:52 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 26/35] python3-urllib3: Fix CVE-2026-44432
Date: Wed, 11 Nov 2026 10:02:52 +0100
Message-ID: <4b369eaaee6e7ffefac0af3258087b6941f6471f.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249998
Content-Type: text/plain; charset="utf-8"

From: Yogita Urade <yurade@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/urllib3/urllib3/commit/2bdcc44d1e163fb5cc48a8662425e35e15adfe6a
[2] https://security-tracker.debian.org/tracker/CVE-2026-44432

Signed-off-by: Yogita Urade <yurade@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-urllib3/CVE-2026-44432.patch      | 157 ++++++++++++++++++
 .../python/python3-urllib3_2.6.3.bb           |   1 +
 2 files changed, 158 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-44432.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-44432.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-44432.patch
new file mode 100644
index 00000000000..2cccc0a9a10
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-44432.patch
@@ -0,0 +1,157 @@
+From 2bdcc44d1e163fb5cc48a8662425e35e15adfe6a Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Thu, 7 May 2026 18:39:03 +0300
+Subject: [PATCH] Merge commit from fork
+
+* Avoid any decoding in `HTTPResponse.drain_conn`
+
+* Add a comment
+
+* Simplify `drain_conn`
+
+* Add tests
+
+* Add additional checks to the test
+
+* Fix full decompression on the 2nd small read from response using Brotli
+
+* Add a changelog entry
+
+* Inverse the order in the changelog entry
+
+* Mention `stream` call
+
+CVE: CVE-2026-44432
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/2bdcc44d1e163fb5cc48a8662425e35e15adfe6a]
+
+Backport Changes:
+- Omitted changelog/GHSA-mf9v-mfxr-j63j.bugfix.rst because the OE recipe
+  backport applies the runtime fix and tests; the package does not ship it.
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/urllib3/response.py                  | 17 +++++++++++------
+ test/test_response.py                    | 24 +++++++++++++++++++++---
+ test/with_dummyserver/test_connection.py | 19 +++++++++++++++++++
+ 3 files changed, 51 insertions(+), 9 deletions(-)
+
+diff --git a/src/urllib3/response.py b/src/urllib3/response.py
+index 521c31b282..e9246b75e3 100644
+--- a/src/urllib3/response.py
++++ b/src/urllib3/response.py
+@@ -798,13 +798,14 @@ def drain_conn(self) -> None:
+         Unread data in the HTTPResponse connection blocks the connection from being released back to the pool.
+         """
+         try:
+-            self.read(
+-                # Do not spend resources decoding the content unless
+-                # decoding has already been initiated.
+-                decode_content=self._has_decoded_content,
+-            )
++            self._raw_read()
+         except (HTTPError, OSError, BaseSSLError, HTTPException):
+             pass
++        if self._has_decoded_content:
++            # `_raw_read` skips decompression, so we should clean up the
++            # decoder to avoid keeping unnecessary data in memory.
++            self._decoded_buffer = BytesQueueBuffer()
++            self._decoder = None
+ 
+     @property
+     def data(self) -> bytes:
+@@ -1091,7 +1092,11 @@ def read(
+         elif amt is not None:
+             cache_content = False
+ 
+-            if self._decoder and self._decoder.has_unconsumed_tail:
++            if (
++                self._decoder
++                and self._decoder.has_unconsumed_tail
++                and len(self._decoded_buffer) < amt
++            ):
+                 decoded_data = self._decode(
+                     b"",
+                     decode_content,
+
+diff --git a/test/test_response.py b/test/test_response.py
+index c70262c04e..da521137bf 100644
+--- a/test/test_response.py
++++ b/test/test_response.py
+@@ -858,22 +858,33 @@ def test_memory_usage_decode_with_max_length(
+             pytest.skip(f"Proper {request.node.callspec.id} decoder is not available")
+ 
+         name, compressed_data = data
+-        limit = 1024 * 1024  # 1 MiB
++        limit1 = 1024 * 1024  # 1 MiB
++        # We test with two read calls because the second call may be
++        # able to use the internal buffer filled by the first call, and
++        # we want to ensure that full decompression is never triggered
++        # by the second call. The limit for the second call is lowered
++        # to make sure that the internal buffer is used for the Brotli
++        # case specifically https://github.com/google/brotli/issues/1396
++        limit2 = 1024  # 1 KiB
+         if read_method in ("read_chunked", "stream"):
+             httplib_r = httplib.HTTPResponse(MockSock)  # type: ignore[arg-type]
++            httplib_r.chunked = True
++            httplib_r.chunk_left = 1
+             httplib_r.fp = MockChunkedEncodingResponse([compressed_data])  # type: ignore[assignment]
+             r = HTTPResponse(
+                 httplib_r,
+                 preload_content=False,
+                 headers={"transfer-encoding": "chunked", "content-encoding": name},
+             )
+-            next(getattr(r, read_method)(amt=limit, decode_content=True))
++            for limit in (limit1, limit2):
++                next(getattr(r, read_method)(amt=limit, decode_content=True))
+         else:
+             fp = BytesIO(compressed_data)
+             r = HTTPResponse(
+                 fp, headers={"content-encoding": name}, preload_content=False
+             )
+-            getattr(r, read_method)(amt=limit, decode_content=True)
++            for limit in (limit1, limit2):
++                getattr(r, read_method)(amt=limit, decode_content=True)
+ 
+         # Check that the internal decoded buffer is empty unless brotli
+         # is used.
+@@ -883,6 +894,13 @@ def test_memory_usage_decode_with_max_length(
+         if name != "br" or brotli.__name__ == "brotlicffi":
+             assert len(r._decoded_buffer) == 0
+ 
++        # Check that memory usage is still within the limit while the
++        # connection is being drained, meaning that the call does not
++        # decompress the whole content.
++        r.drain_conn()
++        assert r._decoder is None
++        assert len(r._decoded_buffer) == 0
++
+     def test_multi_decoding_deflate_deflate(self) -> None:
+         data = zlib.compress(zlib.compress(b"foo"))
+ 
+diff --git a/test/with_dummyserver/test_connection.py b/test/with_dummyserver/test_connection.py
+index b9c547c00f..940815dac2 100644
+--- a/test/with_dummyserver/test_connection.py
++++ b/test/with_dummyserver/test_connection.py
+@@ -138,3 +138,22 @@ def test_invalid_tunnel_scheme(pool: HTTPConnectionPool) -> None:
+         str(e.value)
+         == "Invalid proxy scheme for tunneling: 'socks', must be either 'http' or 'https'"
+     )
++
++
++def test_response_after_drain_conn(pool: HTTPConnectionPool) -> None:
++    """
++    Test that a connection can be reused after calling `drain_conn` on
++    an unread response.
++    """
++    conn = pool._get_conn()
++
++    conn.request("GET", "/", preload_content=False)
++    response = conn.getresponse()
++    assert response.status == 200
++    response.drain_conn()
++
++    conn.request("GET", "/", preload_content=False)
++    response = conn.getresponse()
++    assert response.status == 200
++
++    conn.close()
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
index 537a68cdabf..b9d9b5671e4 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
 SRC_URI += "file://CVE-2026-44431.patch \
             file://CVE-2026-97689.patch \
+            file://CVE-2026-44432.patch \
            "
 SRC_URI[sha256sum] = "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
 
