Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29099.1793863899057720525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:31:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Av/h9ZQj;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7053; q=dns/txt;
  s=iport01; t=1793863899; x=1795073499;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4nXGAt6UEGE3x3wRmA8I8lAZNRFMGnnpWB0YWVCvBno=;
  b=Av/h9ZQj6Wfxe3DVcn+2Sr/ctaaBM00t1uqXyyC0YSGkeVykw87yulkw
   ZDJz5OkEnetqdrp8DObuyyGGjqzKjGXMBULaalGuf4zYFIJRR50IKMEjt
   0XAguiL4zMABK07bn7/VZJnZKzB8kIOSDkTm5euRuKRlPbanV7N3WOQx4
   5zUTe86D+yAu9vUbeeePNn40HkKv9wc5XzyDoJnj6JhA06r1avjaM05xk
   RZKDkFhauQqonwTkcDuUlmcwOEtXLc71ytjGzDnbUuE6h8xXAgb9QTgiO
   Oh3kC2/MQbNebbPGEB0gZjvNYcFZxyATXOjALiVsDX3YY3fKaJPIAai7G
   A==;
X-CSE-ConnectionGUID: 02p8OUdYTFq70Or5aQ3LiA==
X-CSE-MsgGUID: LEW0kZLWSxSevamxF8eMhQ==
X-IPAS-Result: =?us-ascii?q?A0ADAABUL+xq/5L/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgXwFAQEBAQsBglZ1YENJA4xvhziBNWyLaJI8gXsDDwEBAQ9ED?=
 =?us-ascii?q?QQBAYQ/jmUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Th?=
 =?us-ascii?q?k8NkBIBLQsBGAFZAwECTwsjGAmDAgGCOgM3AxG8IkOBeTOBAYMpAT8CQ1DYT?=
 =?us-ascii?q?A1ygWgBCxQBgTgBhT+Cf4UkXRgBRIQ5JxuBSUSBFYNpgQWBGkICgTiGbgSDH?=
 =?us-ascii?q?BKBWoZAhlgCgVKGcUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGB?=
 =?us-ascii?q?YEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaL?=
 =?us-ascii?q?AqBGjU8CSY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKGBgNSBEsNxUZBD5uB?=
 =?us-ascii?q?5Ivgh5sBwFzGgEqAQQTC3kFgQyTESaQHoIhoCBxhCqMJI8+hXwaM4QEgVeSQ?=
 =?us-ascii?q?pJUC5h9jgqECpF3UIRpgWg8OYEgMxoIGxWDIglKGQ+OKwQKC4NggkqCSVHIc?=
 =?us-ascii?q?SYyAgkDLwEBBwIHDgMLgWiQAYF9AQE?=
IronPort-Data: A9a23:Q+n96K4hl9GBll/EfjoxKAxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 jQbXDiDbq7fYTTyc9BzO43lp0pXv5fTn9Q2TVZsqXw2Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztMt/rZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eZdcAqsFKDVBy2
 +VHcBcXMxm63Ma36efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcGFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkERUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZCwa4KPKoHUGpo9ckCwg
 k/5p2fLJi4hJOeS1zOA4lz8i8rPpHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:zPQvKaH6UVL57rhopLqE2MeALOsnbusQ8zAXPidKOH5om6Oj+f
 xG8M536faWskdzZJhfo7G90cC7KBu2n6KdirN/AV7NZmXbUROTTL1K3M/F3yDqHTH4+6p20K
 dtdLU7NfjLZGIK6PoTJGKDYrEdKB7tytHNudvj
X-Talos-CUID: 9a23:hjxVKWD4BMPWnVH6E3E97B4zJ8wUTlPEky/3ORKxMD1NSZTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AVm9rOQ4Frb1qCoWaU7TNxjLVxoxMzpv2C3Iprq4?=
 =?us-ascii?q?WgMSaPClgFWeQqTSOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="530285677"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 07:31:38 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 1F0361800023E
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 07:31:38 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id B9B4CCC1611; Wed,  4 Nov 2026 23:31:37 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 1/3] python3-urllib3: Fix CVE-2026-44432
Date: Wed,  4 Nov 2026 23:31:35 -0800
Message-Id: <20261105073137.381446-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 07:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249449
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/urllib3/urllib3/commit/2bdcc44d1e163fb5cc48a8662425e35e15adfe6a
[2] https://security-tracker.debian.org/tracker/CVE-2026-44432

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-urllib3/CVE-2026-44432.patch      | 157 ++++++++++++++++++
 .../python/python3-urllib3_2.6.3.bb           |   1 +
 2 files changed, 158 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-44432.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-44432.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-44432.patch
new file mode 100644
index 0000000000..1f036ae205
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
index 537a68cdab..b9d9b5671e 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
 SRC_URI += "file://CVE-2026-44431.patch \
             file://CVE-2026-97689.patch \
+            file://CVE-2026-44432.patch \
            "
 SRC_URI[sha256sum] = "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
 
-- 
2.44.4

