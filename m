Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29281.1793863899138250911
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:31:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Yg40uOTU;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7421; q=dns/txt;
  s=iport01; t=1793863899; x=1795073499;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=RVpoJPeaIzIOUz6ctzbrma22Fc+BU8j9pnSR2UCAmi0=;
  b=Yg40uOTUarfw/Y4x1fliZn5i/OEUgx3t9dWB+vbk0vnysw2WfsBNZR2a
   fiXRxCfgy0cPP1BWlH/R9jodQDLkbPUWQgzANomPdJUQYyl75/7JKNij8
   UW9BBzQIelinFdB3pwUMN1Ws6pjMBkCjjcpzIOMUD+5R9rNt5Y3An0o0k
   i/YelI6nh3SJfQfxgIoE75thQ6/cWvqKoh3bArEBip4menJV0Uy+QWjhs
   fDnqks+PBIWOArHjzb2edAQkghhgK4wEtm2dX0ywt3fuhVLoOeO9epd6E
   h3JEkwgn6vGRhwawJtpxOMD+IDUB0NdPsXQmnBi2qJLZ6tMCDxz/P0p+Q
   Q==;
X-CSE-ConnectionGUID: CLrac4DtTz2k8W/dqBa79w==
X-CSE-MsgGUID: yTNFlKRPReS5rywd8LKNNw==
X-IPAS-Result: =?us-ascii?q?A0AaAADiL+xq/5D/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJA4xvhziCIQOLZZI8gXsDDwEBAQ9EDQQBAYQ/RgKOHQImN?=
 =?us-ascii?q?AkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnC?=
 =?us-ascii?q?wEYAT0cAwECLyALIwgQCYMCAYI6AzcDEbwWQ4F5M4EBgykBPwJDUNhMDXKBa?=
 =?us-ascii?q?AELFAGBOAGFP4J/hSRdGAFEhDknG4FJRIEVg2mBBYEaQgKBN4ZvBIMcEoFag?=
 =?us-ascii?q?QOFPYZYAoFShnFIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBH?=
 =?us-ascii?q?YEegRKBB12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKg?=
 =?us-ascii?q?Ro1PAkmPxUMZAsaBWEIAg0McjkQMB4kLwUcJkAbChgYDUgRLDcVGQQ+bgeSL?=
 =?us-ascii?q?4JkJgeBDgEHIwEESywgKGmTN5I/oCBxhCqMJI8+hXwaM4VbpRYLmH2OCoQKk?=
 =?us-ascii?q?XdQhGmBaDyBWTMaCBsVO4JnCUoZD44rDguDYIJKgklRyHEmMgIJAy8BAQcCB?=
 =?us-ascii?q?w4DC4FokACBfgEB?=
IronPort-Data: A9a23:csy5UqtsSAKjfK7lOVd3YZcrVOfnVAFfMUV32f8akzHdYApBsoF/q
 tZmKW6POq6ONjajctEkPYSx8UNSscDczNRnSAZqpHtmFnwRgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb9Es11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw0cJtCGoS2
 eAkOmoOPi/Ei/ucye3qVbw57igjBJGD0II3oHpsy3TdSP0hW52GG/qM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtLYH49tL/Aan3XYiBCoV6YjaE2+GPUigd21dABNfKIJofbH5wPxBfwS
 mTu7ljfLBU5DuSlxAHY6GOzir/rvgXdR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:h3fT5qDtv3vxrgzlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:mDEB/G5Y4Wb+PufY6tss32oOE8t5XmHh3i3Tc3D/BX9DQeLEVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AfhtGvw9JYUmpd/oeg8ZtB3eQf9ZUxYqqK3o1q5g?=
 =?us-ascii?q?95tOVKiAgHxS7qiviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="543921229"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 07:31:38 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 2709A1800048B
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 07:31:38 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id C3908CBF202; Wed,  4 Nov 2026 23:31:37 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 3/3] python3-urllib3: Fix CVE-2026-97688
Date: Wed,  4 Nov 2026 23:31:37 -0800
Message-Id: <20261105073137.381446-3-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105073137.381446-1-yurade@cisco.com>
References: <20261105073137.381446-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 07:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249450
Content-Type: text/plain; charset="utf-8"

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
---
 .../CVE-2026-97688-regression.patch           |  29 +++++
 .../python3-urllib3/CVE-2026-97688.patch      | 107 ++++++++++++++++++
 .../python/python3-urllib3_2.6.3.bb           |   2 +
 3 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-97688-regression.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-97688.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97688-regression.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97688-regression.patch
new file mode 100644
index 0000000000..220b024e1e
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
index 0000000000..4fcdce68fc
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
index ad5dd190d8..73bfd36974 100644
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
 
-- 
2.44.4

