Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1359.1792433930718809914
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tMJBOtGl;
 spf=pass (domain: est.tech, ip: 40.107.162.31, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXV842Ede3qGtpx+zI6NeHUOlH2OERiQtW5bA9xv/P4yfxPjOVf5ctzSZxhw9Q99JRsEJRp3E78/yY8HWkET/kcQg+qNERkvwbQ8a2io4OxyWODYD0oqF+Myup9MFyx2D1tjRoNqh5i/t5cwMGz6DB+3DLz6h+dLuMvZPczusRTM+f3GQ9S5dOt8xV2uuHsfSbvSa2PrB+quiu/YopOvESVEzGI/nJrrua1vYmbOv8JeCmFJJfLiO7TaKJmIOXrVm3ajmC4AWhE0bahXvBYff7+/baV7Fz5TbJOc3dNuJJeLwI1Uhh5oxdmwu3M1Bot1Ixl6YCz4iiaajnTV2dL5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEK/HeXX7HHLNxdcB1dqmyf6ziAHQsYBFtAf+ITx0OE=;
 b=cVgcA4IHfNY2FjipB7ypZaS7rZSjfgw8KQD1ZyHGrZuz5UL5dtPN4Ld4XUfLDxjQdW8+FXk0jqPKoWKw9N3k4ptRXlrtKTMPVui+WcdejRT/TB6Ac1UzNji9eVeh1f7yR5SubIDAN1KT+PmCdXGB29QL8VVu26T+sL2qPEfv2yt9ZecSvhoXATGSrkjJW0T3dpvcztj4QbAvydWOPjI3uTKRR8SsqWwo03dXkwmJgBT3jIqqvmJOoeu48HxDyQjP07nImS/51YIP7XCzR/xP0+kOcJrimITWIL7gXDQQeuJTfqjrwNTRz9KyFdAxCf4r8H5rS/d2rbo7awY2vPZ3Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEK/HeXX7HHLNxdcB1dqmyf6ziAHQsYBFtAf+ITx0OE=;
 b=tMJBOtGlUjRqKmf6YmPcPKRmLdUSWq7O4lfHAAdBmcoWZi21EQc8jz5+V5cbqIPGdOp1sBSaKjd3XHu7ikFSxXNdi0b99rQFSfldapluLjlrlfiz6u2K3u/Qhxk/WI3Fns9eE2mK+hI3Sk9msXHWym+1LzXlFx9R0qaXLoKLGYQSOx/d9T5uM9pIptUyFHWV5vhJnz+CX3fd+HeLmEWTlL+NcVcp4xdR9d3Tc1jr4XoEtqiYwLG1+ZI/xTQHRxgIacpiAN0NOLobqJDiUOvCVjIqVTe4bBWGKSTUGM0DDLNPmj3A1sJXzIphMq63WHqIGjCgU5d8uGGz727iY5zpyw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2449.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:41c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 18:18:45 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:18:45 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] python3-urllib3: Fix CVE-2026-97689
Date: Mon, 19 Oct 2026 20:18:42 +0200
Message-ID: <20261019181843.1876-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0147.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2449:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f56a9d2-4a86-4cb2-4d34-08df2e0d6998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|18002099003|10067099003|13003099007|3023799007|260925022911599003|260925021311599003|260925021911599003|261009223027099003|11063799006|261009221227099003|56012099006;
X-Microsoft-Antispam-Message-Info: sjPBsTfFeXrNlgNhHkf08vQ51TAKmF2nZabbEXwFMGkBNIxRjyYcvJ9i8SMHnbcTpe6wh3kMy9EzLSavfp/Vy5ZJllmELOjZfY9hbaG0q5fgU5ZxqVv2ENcHz3JrvbEwQZ/aHfQxof3CIMNshgfS0eR/eQFKdAhlF6TuQIMpRhgk6lXPn0Hlz+BMGzsgl8Q9tFne4QgnOW8Es52r+MsCIt85O0zV3rx5zBsipTzsDRYUrGJivT+zcUvv43JDRx06njvuyF9JTMno5Hjg6UuXEuepf947Wcga2smZyqAttCuSbFRKgF0ZyNFjNevKTE9G25KTxtfJhBYikT4bxxcbx8wAnONgLmDRt7Kq2OMwK1MMRpWQ2ElMR3OTpL7zkjfMYkdVUpvRV24hmBuHG0HPEtHGFPVPGM83KwYbSjtHHCK68aXXLsKD1UP9rOhfYOD+oNvpYMMbIwBTFWddAqTso0uSwYhnq/cB7iKI+T1N4/garLZXqGRGNwyHbdurSl5VVzn8BqCyG42gBq9UbsO2RkY+w46heUNjBiMxEscQHt+HlJlt/py38ejsH2CC676jDUwtL7VTTBGhCTfEujfWHGLJ5Rq2Vk3UIna7/CDEJkfEmU5TYjQIHWrZulY756Vc4cYUN2i89kJ20/azj3qQcZHtZYQ/La762G2JYxmHDcA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(18002099003)(10067099003)(13003099007)(3023799007)(260925022911599003)(260925021311599003)(260925021911599003)(261009223027099003)(11063799006)(261009221227099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EU1tH8IXS/nm1zjtyky9xVs3aw9MwpPRyceGTAQgEw5pxgwWlGVdlt4lZvoI?=
 =?us-ascii?Q?wLaM7d2hLMMHweCpnMpw4mYrMiaKYLhWSd4BxTIura97QZj0s1C7r6ZZOTfg?=
 =?us-ascii?Q?VE3ki6qNlapvgTmZXPCfCTWmTpm+VZqN1O517a4E0BQJHV/yXbRERRODbnzV?=
 =?us-ascii?Q?bxnP2m8RHufOFVoq9odqgYigl8q4xBFAB9GOcP5N8jA0SQ02hgwgBVhB+PrK?=
 =?us-ascii?Q?S2/82u+eJBMp4iB47DWosTaBw6s6Dl37H+Sdl9Uz96PcMTu2hSeQ1pzKDGGs?=
 =?us-ascii?Q?HN+RoNFbHEE91+slZ3X6ETW6mKsVnlKjEYMpaQkmqbYy36YRukARJWWBzRT2?=
 =?us-ascii?Q?sX7tZjM+19wPUNpifvmkyDyD+wIUVc/d9fomF0gVCwJQ2Xi+Pd8WY6Deq/k2?=
 =?us-ascii?Q?vEh7rpUtGKwrUxsoneBxEX0DF5jj/j8SPP5YJoOO3qQlt9ebsIZdveR/U+vZ?=
 =?us-ascii?Q?lqUoOhJ3Zk4jySJJhAKuK2ivgSv4LTFC4Jr7pevRHbD6qblcUU1oSBIvLXdK?=
 =?us-ascii?Q?bYLF5xBLU04EQyOtUDdXlvwIlnwH8eQkAk1SAcCRU3QZfBv0SDSOb3jBKe78?=
 =?us-ascii?Q?r1nxuwaNiCPJMYIr8ARH9DHBsTl3LPFkVytaj7T9/QB+BTDGnt8lU/E87gGd?=
 =?us-ascii?Q?xw8mAILIcasOXYE/VGFmaHNXErbL2/4/xfsx/Fz/noBqpAMg3n7UoQzBk7uE?=
 =?us-ascii?Q?y09VcPJiyzwYU8nboaSmbvKBgAp4r16kd3PNZ3+zktXLBVByPENGoLsNMM3o?=
 =?us-ascii?Q?O28OwAWvvbfo0D5qugHQWiU3s0zHqRW1HRQAEDWNTXYWSLbZSE29qP24QEwa?=
 =?us-ascii?Q?+Mihipindv26kkiAf54Yq+y9Pb/DdEknQG5H4MNbar7ZXtJIb/yPax8M0Ya0?=
 =?us-ascii?Q?WL2QP24OuionIHeolspq4Cd2H2o6mcx8Zy6UiOLOSUbR2FlGbPowZduNTNTY?=
 =?us-ascii?Q?SLgra3rQvBG5THI5Qp/v75YrvuaNBZZgHgBW2Dwt32765BVSDyrjl4l4K8cS?=
 =?us-ascii?Q?Rty20jcWdVL33WfyPcJq1Ywd5ynI+34/IiyZ5Stdsoq73EWf4W5KWXEiILRJ?=
 =?us-ascii?Q?0/sG5nagDmTxBOVOgsi4LQ/CaEQmDDeIVDPX5IbLeoFvNknW6OoqZo/EXXbv?=
 =?us-ascii?Q?rCWktAcSqBhE2gAP8vUdieMaSn5/hgmtMQQd9fA18Cl0rukVDe6Ld7983wI+?=
 =?us-ascii?Q?Q80R/DXNCcX4Lel9aAMuPjbDhzhH7yCCgKPvMrKvj4MerfQ3NVZJE6dPzYMZ?=
 =?us-ascii?Q?wAEwxvlZUpn7BCyRRb/rdPiHN5Jl+bzti/8/iyw4E29XWB4kQ0itnNRAP0Xe?=
 =?us-ascii?Q?mkxnLflPPiexd5bcHdu5wsEKd48hAkzaRFkjnr+QIHd+MPdGK8EmwwmOJGWr?=
 =?us-ascii?Q?l56Lqq9cKZUOlpDJLkMiCzzW+rraChR9SfSUdsQqhl0aEcgrolgvR0aZM/Ec?=
 =?us-ascii?Q?gzFH3K0CNGOEsi0I7Pd7YxTKk4hzcnnXSHqCDQVSHTvCxdQWwoa4oxlDwGWi?=
 =?us-ascii?Q?FcwuiKUa2bzGGNGTdw+T/rJ8W4BGJ7izRPBzVpmhD4kTw7895mXiekgBuknw?=
 =?us-ascii?Q?4snX0643BsCNWaOdzW77KlInB73xsBjwOwPJgWU2K5VFwBLyiuV6qr/jHrZk?=
 =?us-ascii?Q?ycmAMlwPLJnlq0I9d8VeIHhnDycDacTsaXPmOo/FNlBLfAPg/CJrl0L3GSOA?=
 =?us-ascii?Q?Q8vUk62WcUIEwUcHAYDUh2UQsRgDcIo2RWPvpc3ZlUlWvUX20ExKFL171PJn?=
 =?us-ascii?Q?U2yMB+xPgw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f56a9d2-4a86-4cb2-4d34-08df2e0d6998
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:18:45.2468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82BrImh+3g7R/d0pFBp+j4eUZxDDEc+F6VISSotng1dBd28ev1i+cFCtPU7/oz4R4U4zfo/ud/R/ksXn1GIjqorpnIYyyMhXmYcm+1KhWCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2449
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 18:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248202
Content-Type: text/plain; charset="utf-8"

Backport the upstream fix [1] as mentioned in [2]

[1] https://github.com/urllib3/urllib3/commit/cd770b059b543be29298ea5c52afb=
0b1b090f5ed
[2] https://nvd.nist.gov/vuln/detail/cve-2026-97689

Testing:
  - test_response.py::test_chunk_size_line_too_long - passed
  - test_response.py::test_chunk_trailer_line_length (6 cases) - passed
  - test_socketlevel.py::test_chunked_size_line_too_long_does_not_buffer - =
passed
  - Full test_response.py: 161 passed, 45 skipped (no regressions)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python3-urllib3/CVE-2026-97689.patch      | 251 ++++++++++++++++++
 .../python/python3-urllib3_2.2.2.bb           |  14 +-
 2 files changed, 258 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-9=
7689.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.pa=
tch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.patch
new file mode 100644
index 0000000000..98b007324c
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
+server could advertise Transfer-Encoding: chunked and then send a very lon=
g
+run of bytes with no newline, forcing the client to buffer the entire run
+before the chunk size could be rejected.
+
+This caps the chunk-size line (and the trailing CRLF line) at _MAXLINE,
+raising ProtocolError when exceeded, matching the behaviour read() already
+had. Only the size line is bounded; chunk bodies still go through the size=
d
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
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/cd770=
b059b543be29298ea5c52afb0b1b090f5ed]
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
+=20
+ log =3D logging.getLogger(__name__)
+=20
++# Maximum length of a chunk-size line (and the trailing CRLF line) when r=
eading a
++# chunked-transfer-encoded response. Matches ``http.client._MAXLINE`` so =
urllib3's
++# streaming path bounds these reads exactly like the stdlib ``.read()`` p=
ath does,
++# preventing a malicious server from forcing unbounded buffering (memory =
exhaustion)
++# via an unterminated chunk-size line.
++_MAX_CHUNK_LINE_LENGTH =3D 2**16
++
+=20
+ class ContentDecoder:
+     def decompress(self, data: bytes, max_length: int =3D -1) -> bytes:
+@@ -1333,7 +1340,12 @@ class HTTPResponse(BaseHTTPResponse):
+         # we'll try to read it from socket.
+         if self.chunk_left is not None:
+             return None
+-        line =3D self._fp.fp.readline()  # type: ignore[union-attr]
++        line =3D self._fp.fp.readline(_MAX_CHUNK_LINE_LENGTH + 1)  # type=
: ignore[union-attr]
++        if len(line) > _MAX_CHUNK_LINE_LENGTH:
++            self.close()
++            raise ProtocolError(
++                "Response chunk size line exceeded maximum allowed length=
"
++            ) from None
+         line =3D line.split(b";", 1)[0]
+         try:
+             self.chunk_left =3D int(line, 16)
+@@ -1437,7 +1449,11 @@ class HTTPResponse(BaseHTTPResponse):
+=20
+             # Chunk content ends with \r\n: discard it.
+             while self._fp is not None:
+-                line =3D self._fp.fp.readline()
++                line =3D self._fp.fp.readline(_MAX_CHUNK_LINE_LENGTH + 1)
++                if len(line) > _MAX_CHUNK_LINE_LENGTH:
++                    raise ProtocolError(
++                        "Response chunk trailer line exceeded maximum all=
owed length"
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
+         assert orig_ex.length =3D=3D fp.BAD_LENGTH_LINE.encode()
+=20
++    def test_chunk_size_line_too_long(self) -> None:
++        # A malicious server can send a chunk-size line with no newline. =
urllib3's
++        # streaming path must reject it with a bounded read rather than b=
uffering
++        # the whole line (memory exhaustion). See GHSA / CVE for chunked =
DoS.
++        stream =3D [b"foooo"]
++        fp =3D MockChunkedEncodingLongChunkSizeLine(stream)
++        r =3D httplib.HTTPResponse(MockSock)  # type: ignore[arg-type]
++        r.fp =3D fp  # type: ignore[assignment]
++        r.chunked =3D True
++        r.chunk_left =3D None
++        resp =3D HTTPResponse(
++            r, preload_content=3DFalse, headers=3D{"transfer-encoding": "=
chunked"}
++        )
++        with pytest.raises(ProtocolError) as ctx:
++            next(resp.read_chunked())
++
++        assert "chunk size line exceeded maximum allowed length" in str(c=
tx.value)
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
++        trailer =3D b"X:" + b"x" * (trailer_length - 2 - len(line_ending)=
) + line_ending
++        fp =3D BytesIO(b"3\r\nfoo\r\n0\r\n" + trailer + (b"\r\n" if line_=
ending else b""))
++        r =3D httplib.HTTPResponse(MockSock, method=3D"GET")  # type: ign=
ore[arg-type]
++        r.fp =3D fp  # type: ignore[assignment]
++        resp =3D HTTPResponse(
++            r,
++            preload_content=3DFalse,
++            headers=3D{"transfer-encoding": "chunked"},
++            original_response=3Dr,
++        )
++        chunks =3D resp.read_chunked()
++        assert next(chunks) =3D=3D b"foo"
++
++        if trailer_length > _MAX_CHUNK_LINE_LENGTH:
++            with pytest.raises(
++                ProtocolError,
++                match=3D"Response chunk trailer line exceeded maximum all=
owed length",
++            ):
++                next(chunks)
++        else:
++            assert list(chunks) =3D=3D []
++
++        assert fp.closed
++        assert r.isclosed()
++        assert resp.closed
++
+     def test_truncated_before_chunk(self) -> None:
+         stream =3D [b"foooo", b"bbbbaaaaar"]
+         fp =3D MockChunkedNoChunks(stream)
+@@ -1629,8 +1687,20 @@ class MockChunkedEncodingResponse:
+                 self.cur_chunk =3D self.cur_chunk[amt:]
+             return chunk_part
+=20
+-    def readline(self) -> bytes:
+-        return self.pop_current_chunk(till_crlf=3DTrue)
++    def readline(self, amt: int =3D -1) -> bytes:
++        # Emulate a real file object's readline(size): return bytes up to=
 and
++        # including the first newline, or at most ``amt`` bytes when ``am=
t >=3D 0``,
++        # whichever comes first.
++        if len(self.cur_chunk) <=3D 0:
++            self.cur_chunk =3D self._pop_new_chunk()
++        line =3D self.cur_chunk
++        newline_index =3D line.find(b"\n")
++        if newline_index !=3D -1:
++            line =3D line[: newline_index + 1]
++        if 0 <=3D amt < len(line):
++            line =3D line[:amt]
++        self.cur_chunk =3D self.cur_chunk[len(line) :]
++        return line
+=20
+     def read(self, amt: int =3D -1) -> bytes:
+         return self.pop_current_chunk(amt)
+@@ -1658,6 +1728,14 @@ class MockChunkedInvalidChunkLength(MockChunkedEnco=
dingResponse):
+         return f"{self.BAD_LENGTH_LINE}{chunk.decode()}\r\n".encode()
+=20
+=20
++class MockChunkedEncodingLongChunkSizeLine(MockChunkedEncodingResponse):
++    def _encode_chunk(self, chunk: bytes) -> bytes:
++        # A chunk-size line far longer than _MAX_CHUNK_LINE_LENGTH with n=
o
++        # newline, simulating a malicious server that never terminates th=
e
++        # size line (memory-exhaustion attack).
++        return b"f" * (2**16 + 1024)
++
++
+ class MockChunkedEncodingWithoutCRLFOnEnd(MockChunkedEncodingResponse):
+     def _encode_chunk(self, chunk: bytes) -> bytes:
+         return "{:X}\r\n{}{}".format(
+diff --git a/test/with_dummyserver/test_socketlevel.py b/test/with_dummyse=
rver/test_socketlevel.py
+index dceb5ee..2b258ae 100644
+--- a/test/with_dummyserver/test_socketlevel.py
++++ b/test/with_dummyserver/test_socketlevel.py
+@@ -2055,6 +2055,40 @@ class TestStream(SocketDummyServerTestCase):
+=20
+             done_event.set()
+=20
++    def test_chunked_size_line_too_long_does_not_buffer(self) -> None:
++        # A malicious server can advertise chunked encoding and then send=
 an
++        # unterminated chunk-size line (no newline). The streaming path m=
ust
++        # reject it with a bounded read instead of buffering the whole ru=
n,
++        # which would exhaust memory.
++        done_event =3D Event()
++        # Well above the 65536-byte cap, but small enough for a fast test=
.
++        run_length =3D 512 * 1024
++
++        def socket_handler(listener: socket.socket) -> None:
++            sock =3D listener.accept()[0]
++
++            buf =3D b""
++            while not buf.endswith(b"\r\n\r\n"):
++                buf +=3D sock.recv(65536)
++
++            sock.sendall(b"HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\=
r\n\r\n")
++            # A chunk-size line that never terminates with a newline.
++            with contextlib.suppress(OSError):
++                sock.sendall(b"f" * run_length)
++
++            done_event.wait(5)
++            sock.close()
++
++        self._start_server(socket_handler)
++
++        with HTTPConnectionPool(self.host, self.port, retries=3DFalse) as=
 pool:
++            r =3D pool.request("GET", "/", timeout=3DLONG_TIMEOUT, preloa=
d_content=3DFalse)
++            with pytest.raises(ProtocolError) as ctx:
++                next(r.stream(65536))
++            assert "chunk size line exceeded maximum allowed length" in s=
tr(ctx.value)
++
++            done_event.set()
++
+     def test_large_compressed_stream(self) -> None:
+         done_event =3D Event()
+         expected_total_length =3D 296085
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta/r=
ecipes-devtools/python/python3-urllib3_2.2.2.bb
index b77dd5297d..7ca210429b 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
@@ -7,13 +7,13 @@ SRC_URI[sha256sum] =3D "dd505485549a7a552833da5e6063639d0=
d177c04f23bc3864e41e5dc5f
=20
 inherit pypi python_hatchling
=20
-SRC_URI +=3D " \
-    file://CVE-2025-50181.patch \
-    file://CVE-2025-66418.patch \
-    file://CVE-2025-66471.patch \
-    file://CVE-2026-21441.patch \
-    file://CVE-2026-44431.patch \
-"
+SRC_URI +=3D "file://CVE-2025-50181.patch \
+           file://CVE-2025-66418.patch \
+           file://CVE-2025-66471.patch \
+           file://CVE-2026-21441.patch \
+           file://CVE-2026-44431.patch \
+           file://CVE-2026-97689.patch \
+           "
=20
 RDEPENDS:${PN} +=3D "\
     python3-certifi \
