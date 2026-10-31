Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3732.1793405756100085927
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=YFj+lZKC;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b060ec084so712804f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405754; x=1794010554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uRLq2lVBQ748efm/Bk73jg9Gh7f4yso5SjuptXvBXFs=;
        b=YFj+lZKCRp6yJfP7SA2uTi1YDQvMSZT62eeRKB+fx9z+UfS5wykP3AQch8paHKPzz6
         3yLIMjhdwewBjL0hfisdF/r/bABqPSMRW0M2RHXdgW2V9rChm0+6X5EiTcfPtZM48Upq
         mHQCqdKMYEkQyp7pgnZB6kkavXMScOA2IrxXyBOnz7xbrp3CJmHlZjmQEvYphQjynv00
         csyqfW+wTHyLxb4n1DqwlqWDSe2sRPEtLhkAlFtuzjgXsvhVwv0r/Hu6Kn0C4WiV0W6f
         GLB7QH0H97+xqA6av8inDpWcy+b2OiDwM/eupxE+4LMltZmqPiL28pcnOFTDUvo5bIYa
         UmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405754; x=1794010554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uRLq2lVBQ748efm/Bk73jg9Gh7f4yso5SjuptXvBXFs=;
        b=kgaAiMcaqmbBqxDz/PFI3zMZdIlRkpdzThbHvUVZXBxT8x8wNYXCKqYKj83+vGcFDk
         BdT3Ybs1mhlb12FRrLa+5bBQ417Ou/N5A6R7NtB9E1OCHj47/nvytld4ePnEd7uzRNjX
         kVfBZnrjdFd8x8PniwwXTcYTqjqEo9YeYOFPYfevtBznjyZ6KXyWi0V3sjQO4ve84Xfe
         up52haMIqRx6Rs+Fuk0vh5Lgr+6rXneIOsub8L3gBvFuRyf7BGiKcEaNRWeioBndBJk7
         EMdgMqjQeyU9I/51k7FJiyszl5oecvVU9gGcNMQnxFkBG27APlFA16wTARYRJlbERZIt
         Zx+w==
X-Gm-Message-State: AFq9FYJaBZo7aOGkJDsXtqzUWejgVvums/ffo9ccZ/IM/fTt07HNIA5j
	RVEGSh2zmvPvLhKUdIM0lubwZ64MpC1gPcLIQmGy9iDvXPWYpZEYzxzJGWXlvbQEdTX/kJXSoLL
	AjC1fvOs=
X-Gm-Gg: AYBFou3IsrhS3KLEw9bSJQH8qLH9pKYoACdA6aKtkntRy9u+vNuz9AQkZkNrjb/e/Ps
	9QC0kbubUmh0ex2pvop3d7wUF46d2feudCTgFCCNIcCkC4R8kG0iKfrwa7Oxcp7Y78MwYLb9VK2
	FWbFFLRyGn8YpqutrZR0V0ce1aI1CVdQKhYSvQDy1wOUEiGgsjqpYWOvVfR9qEfKz9l7vdHHodI
	3c4o5TnsOdc5BThc5uXQgvNL61ufwTMeh90iVc2EeOhaH7OVStA/eA1KWAeiDBKmFZvd/M8ADiE
	4TpkA0KQv2fp/vJrHgmmI6jUFIek0xRNNO7eI1RsSWus+5TfZM3v4gQyjN6nFEfFZpnl+fNCam+
	7yVX5x/t/l70PCtBq1VOeA8AY20jpBUTSo8TtJi3oG6Umdl2OiDWdK2d5AZsu4/79QhtlJAnY63
	M+kbyME6roOcJo/kf0ZEPwi/556uckoZ/aEntKZ7doXn/0B2ghJea1RyHf+IciIfcmer2Ahotya
	2GBTmjyNQjy0DJOkFE3C5xHvcqYxXyPYy+P5dGW5mszZfAzaR0dvgWnjOLwTomvuPlAo7/1Du37
	L8nZ34e0TmMgBpvgSHoRtrXR5j0DFwKREgSZAXLbwuG4n6/9Ie8ojPFLuXgIHVMywGG5ciePfSd
	6w9Mm4cASlRlafIPRPchUOT4GD5fY
X-Received: by 2002:a05:600c:83c5:b0:4a2:148b:c88c with SMTP id 5b1f17b1804b1-4ac17191017mr85482245e9.8.1793405754084;
        Fri, 30 Oct 2026 17:15:54 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/55] python3-urllib3: Fix CVE-2026-97689
Date: Sat, 31 Oct 2026 01:14:40 +0100
Message-ID: <a24491466f8796015bd1146d874f4be52f10ad42.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249094
Content-Type: text/plain; charset="utf-8"

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Backport the upstream fix [1] as mentioned in [2]

[1] https://github.com/urllib3/urllib3/commit/cd770b059b543be29298ea5c52afb0b1b090f5ed
[2] https://nvd.nist.gov/vuln/detail/cve-2026-97689

Testing:
  - test_response.py::test_chunk_size_line_too_long - passed
  - test_response.py::test_chunk_trailer_line_length (6 cases) - passed
  - test_socketlevel.py::test_chunked_size_line_too_long_does_not_buffer - passed
  - Full test_response.py: 161 passed, 45 skipped (no regressions)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-urllib3/CVE-2026-97689.patch      | 251 ++++++++++++++++++
 .../python/python3-urllib3_2.2.2.bb           |  14 +-
 2 files changed, 258 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.patch
new file mode 100644
index 00000000000..98b007324cf
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.patch
@@ -0,0 +1,251 @@
+From 5d5fac45ff18a8159c5a4aa973ed9fc2f5dd35ad Mon Sep 17 00:00:00 2001
+From: Quentin Pradet <quentin.pradet@gmail.com>
+Date: Tue, 15 Sep 2026 22:33:41 +0400
+Subject: [PATCH] Merge commit from fork
+
+* Bound chunk-size line reads to prevent memory exhaustion DoS
+
+The streaming chunked path (HTTPResponse.stream() / read_chunked()) read
+each chunk-size line with an unbounded readline(), unlike the plain read()
+path which delegates to http.client's _MAXLINE-capped reader. A malicious
+server could advertise Transfer-Encoding: chunked and then send a very long
+run of bytes with no newline, forcing the client to buffer the entire run
+before the chunk size could be rejected.
+
+This caps the chunk-size line (and the trailing CRLF line) at _MAXLINE,
+raising ProtocolError when exceeded, matching the behaviour read() already
+had. Only the size line is bounded; chunk bodies still go through the sized
+_safe_read(), so legitimate large chunks are unaffected.
+
+Verified with a local malicious server streaming a 200 MiB unterminated
+size line: stream() previously grew RSS by ~530 MB, now stays at ~1 MB and
+fails fast, matching read(). A 5 MiB chunk body still streams correctly.
+
+* Fix a black formatting issue
+
+* Test chunked response trailer length limits
+
+* Fix number in the changelog entry
+
+---------
+
+Co-authored-by: Illia Volochii <illia.volochii@gmail.com>
+
+CVE: CVE-2026-97689
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/cd770b059b543be29298ea5c52afb0b1b090f5ed]
+
+Note:
+ - changeLog change is not backported
+ - Adjusted commit change as per current version
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/urllib3/response.py                   | 20 +++++-
+ test/test_response.py                     | 82 ++++++++++++++++++++++-
+ test/with_dummyserver/test_socketlevel.py | 34 ++++++++++
+ 3 files changed, 132 insertions(+), 4 deletions(-)
+
+diff --git a/src/urllib3/response.py b/src/urllib3/response.py
+index d52e37a..caeec0a 100644
+--- a/src/urllib3/response.py
++++ b/src/urllib3/response.py
+@@ -67,6 +67,13 @@ if typing.TYPE_CHECKING:
+ 
+ log = logging.getLogger(__name__)
+ 
++# Maximum length of a chunk-size line (and the trailing CRLF line) when reading a
++# chunked-transfer-encoded response. Matches ``http.client._MAXLINE`` so urllib3's
++# streaming path bounds these reads exactly like the stdlib ``.read()`` path does,
++# preventing a malicious server from forcing unbounded buffering (memory exhaustion)
++# via an unterminated chunk-size line.
++_MAX_CHUNK_LINE_LENGTH = 2**16
++
+ 
+ class ContentDecoder:
+     def decompress(self, data: bytes, max_length: int = -1) -> bytes:
+@@ -1333,7 +1340,12 @@ class HTTPResponse(BaseHTTPResponse):
+         # we'll try to read it from socket.
+         if self.chunk_left is not None:
+             return None
+-        line = self._fp.fp.readline()  # type: ignore[union-attr]
++        line = self._fp.fp.readline(_MAX_CHUNK_LINE_LENGTH + 1)  # type: ignore[union-attr]
++        if len(line) > _MAX_CHUNK_LINE_LENGTH:
++            self.close()
++            raise ProtocolError(
++                "Response chunk size line exceeded maximum allowed length"
++            ) from None
+         line = line.split(b";", 1)[0]
+         try:
+             self.chunk_left = int(line, 16)
+@@ -1437,7 +1449,11 @@ class HTTPResponse(BaseHTTPResponse):
+ 
+             # Chunk content ends with \r\n: discard it.
+             while self._fp is not None:
+-                line = self._fp.fp.readline()
++                line = self._fp.fp.readline(_MAX_CHUNK_LINE_LENGTH + 1)
++                if len(line) > _MAX_CHUNK_LINE_LENGTH:
++                    raise ProtocolError(
++                        "Response chunk trailer line exceeded maximum allowed length"
++                    )
+                 if not line:
+                     # Some sites may not end with '\r\n'.
+                     break
+diff --git a/test/test_response.py b/test/test_response.py
+index 0e8abd9..2871ac2 100644
+--- a/test/test_response.py
++++ b/test/test_response.py
+@@ -26,6 +26,7 @@ from urllib3.exceptions import (
+     SSLError,
+ )
+ from urllib3.response import (  # type: ignore[attr-defined]
++    _MAX_CHUNK_LINE_LENGTH,
+     BaseHTTPResponse,
+     BytesQueueBuffer,
+     HTTPResponse,
+@@ -1375,6 +1376,63 @@ class TestResponse:
+         assert isinstance(orig_ex, InvalidChunkLength)
+         assert orig_ex.length == fp.BAD_LENGTH_LINE.encode()
+ 
++    def test_chunk_size_line_too_long(self) -> None:
++        # A malicious server can send a chunk-size line with no newline. urllib3's
++        # streaming path must reject it with a bounded read rather than buffering
++        # the whole line (memory exhaustion). See GHSA / CVE for chunked DoS.
++        stream = [b"foooo"]
++        fp = MockChunkedEncodingLongChunkSizeLine(stream)
++        r = httplib.HTTPResponse(MockSock)  # type: ignore[arg-type]
++        r.fp = fp  # type: ignore[assignment]
++        r.chunked = True
++        r.chunk_left = None
++        resp = HTTPResponse(
++            r, preload_content=False, headers={"transfer-encoding": "chunked"}
++        )
++        with pytest.raises(ProtocolError) as ctx:
++            next(resp.read_chunked())
++
++        assert "chunk size line exceeded maximum allowed length" in str(ctx.value)
++
++    @pytest.mark.parametrize(
++        "trailer_length",
++        [
++            _MAX_CHUNK_LINE_LENGTH - 1,
++            _MAX_CHUNK_LINE_LENGTH,
++            _MAX_CHUNK_LINE_LENGTH + 1,
++        ],
++    )
++    @pytest.mark.parametrize("line_ending", [b"\r\n", b""])
++    def test_chunk_trailer_line_length(
++        self, trailer_length: int, line_ending: bytes
++    ) -> None:
++        # The line limit includes its CRLF, but not the final blank line.
++        trailer = b"X:" + b"x" * (trailer_length - 2 - len(line_ending)) + line_ending
++        fp = BytesIO(b"3\r\nfoo\r\n0\r\n" + trailer + (b"\r\n" if line_ending else b""))
++        r = httplib.HTTPResponse(MockSock, method="GET")  # type: ignore[arg-type]
++        r.fp = fp  # type: ignore[assignment]
++        resp = HTTPResponse(
++            r,
++            preload_content=False,
++            headers={"transfer-encoding": "chunked"},
++            original_response=r,
++        )
++        chunks = resp.read_chunked()
++        assert next(chunks) == b"foo"
++
++        if trailer_length > _MAX_CHUNK_LINE_LENGTH:
++            with pytest.raises(
++                ProtocolError,
++                match="Response chunk trailer line exceeded maximum allowed length",
++            ):
++                next(chunks)
++        else:
++            assert list(chunks) == []
++
++        assert fp.closed
++        assert r.isclosed()
++        assert resp.closed
++
+     def test_truncated_before_chunk(self) -> None:
+         stream = [b"foooo", b"bbbbaaaaar"]
+         fp = MockChunkedNoChunks(stream)
+@@ -1629,8 +1687,20 @@ class MockChunkedEncodingResponse:
+                 self.cur_chunk = self.cur_chunk[amt:]
+             return chunk_part
+ 
+-    def readline(self) -> bytes:
+-        return self.pop_current_chunk(till_crlf=True)
++    def readline(self, amt: int = -1) -> bytes:
++        # Emulate a real file object's readline(size): return bytes up to and
++        # including the first newline, or at most ``amt`` bytes when ``amt >= 0``,
++        # whichever comes first.
++        if len(self.cur_chunk) <= 0:
++            self.cur_chunk = self._pop_new_chunk()
++        line = self.cur_chunk
++        newline_index = line.find(b"\n")
++        if newline_index != -1:
++            line = line[: newline_index + 1]
++        if 0 <= amt < len(line):
++            line = line[:amt]
++        self.cur_chunk = self.cur_chunk[len(line) :]
++        return line
+ 
+     def read(self, amt: int = -1) -> bytes:
+         return self.pop_current_chunk(amt)
+@@ -1658,6 +1728,14 @@ class MockChunkedInvalidChunkLength(MockChunkedEncodingResponse):
+         return f"{self.BAD_LENGTH_LINE}{chunk.decode()}\r\n".encode()
+ 
+ 
++class MockChunkedEncodingLongChunkSizeLine(MockChunkedEncodingResponse):
++    def _encode_chunk(self, chunk: bytes) -> bytes:
++        # A chunk-size line far longer than _MAX_CHUNK_LINE_LENGTH with no
++        # newline, simulating a malicious server that never terminates the
++        # size line (memory-exhaustion attack).
++        return b"f" * (2**16 + 1024)
++
++
+ class MockChunkedEncodingWithoutCRLFOnEnd(MockChunkedEncodingResponse):
+     def _encode_chunk(self, chunk: bytes) -> bytes:
+         return "{:X}\r\n{}{}".format(
+diff --git a/test/with_dummyserver/test_socketlevel.py b/test/with_dummyserver/test_socketlevel.py
+index dceb5ee..2b258ae 100644
+--- a/test/with_dummyserver/test_socketlevel.py
++++ b/test/with_dummyserver/test_socketlevel.py
+@@ -2055,6 +2055,40 @@ class TestStream(SocketDummyServerTestCase):
+ 
+             done_event.set()
+ 
++    def test_chunked_size_line_too_long_does_not_buffer(self) -> None:
++        # A malicious server can advertise chunked encoding and then send an
++        # unterminated chunk-size line (no newline). The streaming path must
++        # reject it with a bounded read instead of buffering the whole run,
++        # which would exhaust memory.
++        done_event = Event()
++        # Well above the 65536-byte cap, but small enough for a fast test.
++        run_length = 512 * 1024
++
++        def socket_handler(listener: socket.socket) -> None:
++            sock = listener.accept()[0]
++
++            buf = b""
++            while not buf.endswith(b"\r\n\r\n"):
++                buf += sock.recv(65536)
++
++            sock.sendall(b"HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\n\r\n")
++            # A chunk-size line that never terminates with a newline.
++            with contextlib.suppress(OSError):
++                sock.sendall(b"f" * run_length)
++
++            done_event.wait(5)
++            sock.close()
++
++        self._start_server(socket_handler)
++
++        with HTTPConnectionPool(self.host, self.port, retries=False) as pool:
++            r = pool.request("GET", "/", timeout=LONG_TIMEOUT, preload_content=False)
++            with pytest.raises(ProtocolError) as ctx:
++                next(r.stream(65536))
++            assert "chunk size line exceeded maximum allowed length" in str(ctx.value)
++
++            done_event.set()
++
+     def test_large_compressed_stream(self) -> None:
+         done_event = Event()
+         expected_total_length = 296085
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
index b77dd5297d3..7ca210429b7 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
@@ -7,13 +7,13 @@ SRC_URI[sha256sum] = "dd505485549a7a552833da5e6063639d0d177c04f23bc3864e41e5dc5f
 
 inherit pypi python_hatchling
 
-SRC_URI += " \
-    file://CVE-2025-50181.patch \
-    file://CVE-2025-66418.patch \
-    file://CVE-2025-66471.patch \
-    file://CVE-2026-21441.patch \
-    file://CVE-2026-44431.patch \
-"
+SRC_URI += "file://CVE-2025-50181.patch \
+           file://CVE-2025-66418.patch \
+           file://CVE-2025-66471.patch \
+           file://CVE-2026-21441.patch \
+           file://CVE-2026-44431.patch \
+           file://CVE-2026-97689.patch \
+           "
 
 RDEPENDS:${PN} += "\
     python3-certifi \
