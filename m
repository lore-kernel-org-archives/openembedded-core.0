Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5595.1794387836916666781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ZnHjtHVS;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so30333615e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387835; x=1794992635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=//Il0aBYrqZTwAPsZ43l1dxFDZpl3w9TfDoaZGzf8U0=;
        b=ZnHjtHVScTeCw4Zk5dUowLi0OyCis0XpPLHybVdjEkHFZGnezouLhabyHMm3EWPLlv
         nBwvf2/1dHwGgEEv8Ynik3+kIjdOuOJ9CCmiDhn2/aixPsvmfb6iQBQ2Sh2AmdCXrif3
         gJsN8ZT6R26EaH6waiaE6fC4pSJiJPRevBOCkaWVVNG1ZXkwmC2znRbbHjAQjRWi91qY
         aPi8qsEGNHqkQzt3kNpAW7lT3wyFooX8cfA8PQN2DBK5NYwJOrKF99EbHLtxaQEEs4fJ
         LcUytmyfCyU3dT2ekMlEgkctNGJi3xqu+/MFmEhyWF9IQ9X9uxcudCG84BESVxS9BTeD
         zX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387835; x=1794992635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=//Il0aBYrqZTwAPsZ43l1dxFDZpl3w9TfDoaZGzf8U0=;
        b=th4paJo7bwI1R8fCx1mVDB/CMXG8RLY19il9M3z9Wa1xoExTOK1+el3c++LBN4Gvkc
         N/JU7H4JIStCxBE9vHCsk1GXcJmCp8B1kcoHzgbjgfFjrA2WEvaHOGIroaxFSfQ3KRG3
         weTxkVN2Xn/z35FtmyYG2K/X4veCkKcILaI2iPTfb93mBUQ/O+A1TwM6OpliXEPii+Cc
         Qjg+xXAQ0utRcUOukSAqTr/LfDfQ5IGDauV1a7jd/1GAqNafqKwcBDqPDZ18plXKWOyM
         KzDm9NYETEZzcX8brIuX1tYQEymRElwK1+FrXW+JSxbaq87mTdHmHNnFs5JzvvdBlJou
         XWrQ==
X-Gm-Message-State: APuU4Z/ihg1TBSS/XGXRHH5C3aQ7R45qw1LCh1FYUDCnoppgRxo2Vwm7
	HfQ6tjlkuB0SylExP5lZlcUxU8hpLLP/U5BefihjjtGU7QBhiKdwNLJ5Zk35pnFBkodYjB3SjQK
	laZwwjNg=
X-Gm-Gg: AYBFou0UXlqZ3w288V6ruolXxchje9snDm64LHkins/4LxbhgG5EICvCha2INvYautp
	EvM99cW/5Qkiwut3T8Ph+495zZAT7I0o5cfQ9m2Hwj8Rf/aBqtnNZy+6x9+ZRBNhQ4R/BGJ42Yj
	T/Fp+dWSsjM09Au6aty1PnuXUFXmNqbbTWGIC7rt0U2ek2wITgrrPcbk/D5kA97d6OC7+s5oeqj
	O0b4C6g2+rlqq3l1XsKAoZK3QCr7ILEI+AA207j7/3Qj1SjT++m4A9HmIwYNjpRseiIyy0aOJ9/
	j0oKLGHlYXyGb25P+MMJbXzkGNcJ9v7/v7Z0nMhY4kOicz2c9LCOuSkrCQuipznCjlvhmZxNgdr
	H8LL0d7bfkzFZbZHXLWfLiIBXq4DjqW/3H5s6rWLtkOpk1HDk6fTXsuvNrsBQ5Wp79vKZWyYgM+
	HOmW+5ysWxE4QXqURm2Ee9glewUzfgIWFExDP3uxW/t5P8cmsRoby8YWhM6jvS7GB1GQNsOXejf
	oMkPHeR5VLvUH9levHssofrhv5q3QdGGqLrJ0vcrzONQXJkZKRCzDcAgyaNNN5vT1rGoqE8Man5
	OAHRknUx4/TDaJRi6It8Qr+Ka33RlObop2qzRvWepqJz8M2K/kKlQUUXFeQm2Yqqx3iptwJayKE
	fEQdazVTD9CTTXy75SvDf9Vsi/Q83TQ==
X-Received: by 2002:a05:600c:840c:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4ba09377dbfmr29487705e9.24.1794387835056;
        Wed, 11 Nov 2026 01:03:55 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:54 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 28/35] python3-urllib3: Fix CVE-2026-97688
Date: Wed, 11 Nov 2026 10:02:54 +0100
Message-ID: <e70a2ace47f3dbb263c609b562d1cbc545c698a6.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250000
Content-Type: text/plain; charset="utf-8"

From: Yogita Urade <yurade@cisco.com>

This patch applies the upstream fix as referenced in [3],
using the commit shown in [1] and regression commit from [2].

Regression test-only follow-up skips the Brotli case when urllib3 uses
brotlicffi, because that trailing-data case is unsupported by that
backend. The skip is limited to Brotli; the Deflate regression case
remains covered.

[1] https://github.com/urllib3/urllib3/commit/ea2ad7b21a80da3632f80016526a18864586077f
[2] https://github.com/urllib3/urllib3/commit/9016d7e8afc68185496ef07f3c3a4a743d04922e
[3] https://security-tracker.debian.org/tracker/CVE-2026-97688
[4] https://github.com/urllib3/urllib3/pull/5258

Signed-off-by: Yogita Urade <yurade@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../CVE-2026-97688-regression.patch           |  29 +++++
 .../python3-urllib3/CVE-2026-97688.patch      | 107 ++++++++++++++++++
 .../python/python3-urllib3_2.6.3.bb           |   2 +
 3 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-97688-regression.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-97688.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97688-regression.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97688-regression.patch
new file mode 100644
index 00000000000..220b024e1e8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97688-regression.patch
@@ -0,0 +1,29 @@
+From 9016d7e8afc68185496ef07f3c3a4a743d04922e Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Tue, 15 Sep 2026 22:04:41 +0300
+Subject: [PATCH] Skip `test_read_chunked_with_trailing_data_does_not_hang` for
+ brotlicffi (#5258)
+
+CVE: CVE-2026-97688
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/9016d7e8afc68185496ef07f3c3a4a743d04922e]
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ test/test_response.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/test/test_response.py b/test/test_response.py
+index 5ecdbd9..24118f6 100644
+--- a/test/test_response.py
++++ b/test/test_response.py
+@@ -831,6 +831,8 @@ class TestResponse:
+         # while trailing data remains in the decoder's input buffer.
+         original_data = b"A" * 100
+         content_encoding, compress_func = data
++        if content_encoding == "br" and brotli.__name__ == "brotlicffi":
++            pytest.skip("This case is not supported by brotlicffi")
+         compressed_data = compress_func(original_data) + b"tail"
+         httplib_r = httplib.HTTPResponse(MockSock)  # type: ignore[arg-type]
+         httplib_r.fp = MockChunkedEncodingResponse([compressed_data])  # type: ignore[assignment]
+--
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97688.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97688.patch
new file mode 100644
index 00000000000..4fcdce68fc2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97688.patch
@@ -0,0 +1,107 @@
+From ea2ad7b21a80da3632f80016526a18864586077f Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Tue, 15 Sep 2026 21:32:04 +0300
+Subject: [PATCH] Merge commit from fork
+
+* Prevent an infinite loop when decoding Deflate responses
+
+* Move the new test to a better place
+
+* Add a changelog entry
+
+CVE: CVE-2026-97688
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/ea2ad7b21a80da3632f80016526a18864586077f]
+
+Backport Changes:
+- Omitted changelog/GHSA-gh4c-6fx4-qh6g.bugfix.rst because the OE recipe
+  backport applies the runtime fix and tests; the package does not ship it.
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/urllib3/response.py |  8 +++++++-
+ test/test_response.py   | 38 +++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 44 insertions(+), 2 deletions(-)
+
+diff --git a/src/urllib3/response.py b/src/urllib3/response.py
+index e9e0cee75e..dccdb12936 100644
+--- a/src/urllib3/response.py
++++ b/src/urllib3/response.py
+@@ -76,6 +76,10 @@ def __init__(self) -> None:
+     def decompress(self, data: bytes, max_length: int = -1) -> bytes:
+         data = self._unfed_data + data
+         self._unfed_data = b""
++        # Data received after EOF cannot produce more output from this
++        # Deflate stream.
++        if self._obj.eof:
++            return b""
+         if not data and not self._obj.unconsumed_tail:
+             return data
+         original_max_length = max_length
+@@ -118,7 +122,9 @@ def decompress(self, data: bytes, max_length: int = -1) -> bytes:
+     @property
+     def has_unconsumed_tail(self) -> bool:
+         return bool(self._unfed_data) or (
+-            bool(self._obj.unconsumed_tail) and not self._first_try
++            bool(self._obj.unconsumed_tail)
++            and not self._first_try
++            and not self._obj.eof
+         )
+ 
+     def flush(self) -> bytes:
+
+diff --git a/test/test_response.py b/test/test_response.py
+index 799325b58c..4675646232 100644
+--- a/test/test_response.py
++++ b/test/test_response.py
+@@ -11,7 +11,7 @@
+ from base64 import b64decode
+ from http.client import IncompleteRead as httplib_IncompleteRead
+ from io import BufferedReader, BytesIO, TextIOWrapper
+-from test import onlyBrotli, onlyZstd
++from test import LONG_TIMEOUT, onlyBrotli, onlyZstd
+ from unittest import mock
+ 
+ import pytest
+@@ -813,6 +813,42 @@ def test_read_chunked_with_all_data_already_in_decompressor(
+             assert len(result[-1]) == len(original_data) % 10240
+         assert b"".join(result) == original_data
+ 
++    @pytest.mark.timeout(LONG_TIMEOUT)
++    @pytest.mark.parametrize(
++        "data",
++        [d[1] for d in _test_compressor_params],
++        ids=[d[0] for d in _test_compressor_params],
++    )
++    def test_read_chunked_with_trailing_data_does_not_hang(
++        self,
++        request: pytest.FixtureRequest,
++        data: tuple[str, typing.Callable[[bytes], bytes]] | None,
++    ) -> None:
++        if data is None:
++            pytest.skip(f"Proper {request.node.callspec.id} decoder is not available")
++        # The decoded body must fill multiple bounded reads so EOF is reached
++        # while trailing data remains in the decoder's input buffer.
++        original_data = b"A" * 100
++        content_encoding, compress_func = data
++        compressed_data = compress_func(original_data) + b"tail"
++        httplib_r = httplib.HTTPResponse(MockSock)  # type: ignore[arg-type]
++        httplib_r.fp = MockChunkedEncodingResponse([compressed_data])  # type: ignore[assignment]
++        r = HTTPResponse(
++            httplib_r,
++            preload_content=False,
++            headers={
++                "transfer-encoding": "chunked",
++                "content-encoding": content_encoding,
++            },
++        )
++
++        stream = r.stream(len(original_data) // 2, decode_content=True)
++        if content_encoding in ("br", "zstd"):
++            with pytest.raises(DecodeError):
++                list(stream)
++        else:
++            assert b"".join(stream) == original_data
++
+     @pytest.mark.parametrize(
+         "delta",
+         (
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
index ad5dd190d8d..73bfd369747 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
@@ -8,6 +8,8 @@ SRC_URI += "file://CVE-2026-44431.patch \
             file://CVE-2026-44432.patch \
             file://CVE-2026-97687_p1.patch \
             file://CVE-2026-97687_p2.patch \
+            file://CVE-2026-97688.patch \
+            file://CVE-2026-97688-regression.patch \
            "
 SRC_URI[sha256sum] = "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
 
