Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4741.1792538583693293874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=Y94NNFtB;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a01933b584so814105e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538582; x=1793143382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l/hySl3fvaUytXaqSCBboVIhGY75Qk3MvHdCXorukjk=;
        b=Y94NNFtBZD1t+wPSjEu+UO9OeZHBl2yJx6twFkdUIyuhTN5PvEWgDNmSgCIYFwNlrJ
         tk6X9Ph3gUfpE8g6O6rSy3lDET6/Ee/FRoUf3J/qwreHilYQT7Pj36r/fjuXZua5oqgT
         pmPEyzo4NDWuCON+8QGUu7U+gSrgLui1PCTyn7YoWTyNHOjvuyIwXtk67EYPTUZQh1CW
         lovNHb13yEE4RUDi7/MSomNp299++lkzPjuNqaAoMwF2W5ygjHdpts5zrKZmMxQfCLou
         UCLS8OT/Ug9BtN1DiAv0ZsXX6JTMI3pQ9GY0nAwE5eDjH4pZ15VeJvrK6pMswUxoUXwu
         Fcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538582; x=1793143382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l/hySl3fvaUytXaqSCBboVIhGY75Qk3MvHdCXorukjk=;
        b=VxUoMPqY6BwFry0bbwGmTRzgNR7rv222OKb4izMU96/YzTpIiBdL/oO06e7ptQwKFc
         ErKGuxWO47r6uX43fedYfHqGC74oe/KSdt4JJspQ86kwnDN8L4e6//Se3wUcCd6qVIVf
         oydL8FlQ+WVuWT+u2gHdFVuYDpdmwIw+ezTh5k3UnD4ZuGjetQHC0lu+Tn+vfCiH3feE
         0NbF8VvPivQQiV3j8pB21iwm2Gi6P8hWvZ+RwSucIfbTHe1Tep/HkLj7Nz0wqj0Tbyfy
         43FOCqAyANPUtkynFrM3CkOG0fqlPpHT+AA0vXyWnozDz1NP8stlXO1LmuK23HYL33mh
         8xdQ==
X-Gm-Message-State: AFq9FYLNzdeVy0DAvZLplJcxrLaaLU2aP1ok76sB5pHVh8w/uNUmssg7
	WPpb4g9kYlT64lkf+wJsW8N/zDGT+3JerZzNDhxKBkrttnyLSsQUA3HELAUUJb6zjgmGjtroqPs
	KKk8xzPY=
X-Gm-Gg: AYBFou1leMfigDgeJtmjX9zPWIFH0aFsQC5mNDUvfoq9eOLXNRTuoYg9VpnUkZbQtIr
	JJiyiZBMiw6XTZxr/sIW6TeTco9XqJYLU+4nlzLgCeT9gjLlH1AFF94SZb5V3NE1EEgX3gp9yCz
	b6SGq1AbVNXcRxdojZHAGbg3LCQaquEhrA43Ahm3UQx1Wpim1LlvCNSEkm3njMUoIpZsq8Vsom7
	eshaqFlBFjZsie/WRt69xG7sdZAJWQ4gHnSh1q2UYilE8qfOzk9sWBVWPXdA5XkgJd4aqCnp8YM
	ZA4p+bht08+2UA8tQHoKMXBdtil25rZPVmULmp/Tpgwlm0vOe9wR+IxGDDNTrBVHMnbBdBIdrdS
	bJNx0rr7MBfsUzeEYUeHuAD+qr1dgDogUh5YlRJ4h9RzgloO/U8KaJT4BW2Fk+XNkG3Bb7PUwV6
	jGHqtLobNyz2/z0Jjaqz4MbNs6MN89W1mPUvvcX4hWIVAEfYBi8Bya96sJflNI5qxb37Esjomzy
	Rn4vzS72KoStI/mpaaDneI1FCfTaZOSMd9/13FWVYqG10AWFHBdDm5+EtMVEsd0OqN050dDCQ==
X-Received: by 2002:a05:600c:8b6c:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a1fd8a7de3mr5391905e9.1.1792538581686;
        Tue, 20 Oct 2026 16:23:01 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.23.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:23:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 18/25] python3-urllib3: Fix CVE-2026-97689
Date: Wed, 21 Oct 2026 01:22:28 +0200
Message-ID: <b7186849363370e8e3ac107049772de2cae8b719.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248337
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
 .../python/python3-urllib3_2.6.3.bb           |   6 +-
 2 files changed, 254 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.patch
new file mode 100644
index 00000000000..6e5e870c362
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.patch
@@ -0,0 +1,251 @@
+From e62cca8f9e4211fa005b238237509a1c669550ba Mon Sep 17 00:00:00 2001
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
+ - Adjusted commit change as per 2.6.3 version
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/urllib3/response.py                   | 20 +++++-
+ test/test_response.py                     | 82 ++++++++++++++++++++++-
+ test/with_dummyserver/test_socketlevel.py | 34 ++++++++++
+ 3 files changed, 132 insertions(+), 4 deletions(-)
+
+diff --git a/src/urllib3/response.py b/src/urllib3/response.py
+index ff6d1f4..58f4587 100644
+--- a/src/urllib3/response.py
++++ b/src/urllib3/response.py
+@@ -50,6 +50,13 @@ if typing.TYPE_CHECKING:
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
+@@ -1330,7 +1337,12 @@ class HTTPResponse(BaseHTTPResponse):
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
+@@ -1438,7 +1450,11 @@ class HTTPResponse(BaseHTTPResponse):
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
+index f55809f..b54a006 100644
+--- a/test/test_response.py
++++ b/test/test_response.py
+@@ -27,6 +27,7 @@ from urllib3.exceptions import (
+     SSLError,
+ )
+ from urllib3.response import (  # type: ignore[attr-defined]
++    _MAX_CHUNK_LINE_LENGTH,
+     BaseHTTPResponse,
+     BytesQueueBuffer,
+     HTTPResponse,
+@@ -1682,6 +1683,63 @@ class TestResponse:
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
+@@ -1941,8 +1999,20 @@ class MockChunkedEncodingResponse:
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
+@@ -1970,6 +2040,14 @@ class MockChunkedInvalidChunkLength(MockChunkedEncodingResponse):
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
+index 016484d..d603b8a 100644
+--- a/test/with_dummyserver/test_socketlevel.py
++++ b/test/with_dummyserver/test_socketlevel.py
+@@ -2289,6 +2289,40 @@ class TestStream(SocketDummyServerTestCase):
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
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
index 5976c5c3b44..537a68cdabf 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/urllib3/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI += " \
-    file://CVE-2026-44431.patch \
-"
+SRC_URI += "file://CVE-2026-44431.patch \
+            file://CVE-2026-97689.patch \
+           "
 SRC_URI[sha256sum] = "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
 
 inherit pypi python_hatchling
