Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56ADBFCC072
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 20:13:49 +0000 (UTC)
Received: from sonic303-30.consmr.mail.bf2.yahoo.com (sonic303-30.consmr.mail.bf2.yahoo.com [74.6.131.229])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.871.1772819865515648863
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 09:57:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=mvjafmTw;
 spf=neutral (domain: yahoo.com, ip: 74.6.131.229, mailfrom: eduardo.f120@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772819864; bh=e3ZS6kYp2RP2faHt2aNHiBdBDScGHSUWaYb1lVzWM/0=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=mvjafmTwE3JnISguB2WwhL9QVGUiC6SDcPohidwNKum9amMHQWIb7fcfRb+lYwWUTpFoSH/xD0Nm5HWD2qI3jXCAo4aig5jsABa46gBarG3bR48Pa/twLmjhoawLbmhoHK1vMkMPZh9K5sooyla8X7KM1RxNVCYXB0uSenSm6wy14DYvWFirfIzOQ+kQ9FG9ZmE9FXTRHu2n9zAT+bFgXnyMcQ5qREu5SFnILiMda4ZLI4sfgA7hZOR1FpbjNfATj+nfDGQCosPh6LHB8JNV6l67NkXqTaw6UCRxyJuwWTqOCd/gncfm6tkVdGnRFdYgGgD0mbxElyGl0KOExwJX6w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772819864; bh=IfqNJ1znKmLTg6dVN+kfDD1h6XYJB8oZdCLrD4ki1Ft=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=VuGN9PfhgJOudk3udwhmGL6ldr67nCUq9/DdxcLB5fG9DNhK2CM1zhQ1uQdKRgwZDQtqhGZA5NBCyh/FY9+RxgoZaiihrzaVwBIBogxClULKu/Ozl7d778CFpxWEaaG9a7i6RqhxZ2uE/9l5rgf6R+xTWJqF3LUZ10WXnrbFJ0z9qRARHzVK2eC7idYdTklASkLuiyawvzx1NuqWAoZnfM/JnJSch1bar0F9lE0sPIE8qlgKeurpwWk/CW9mx65noj120+4r7tGMyr6VfUOBVEuwHNKIeDVEYCiRtNUDg+dCYEGkS11BnptZgB0O3W1Mc41L0scMct9fY0eNdUz/dQ==
X-YMail-OSG: bHpMbHgVM1nRLTgElVIWIjG4FiuqPCIwK2tBOJ7_CShKPxCAWvHmSTgzB_oeTvD
 TnY8rRPjjUd2eJ0_mnvCigTPQ4X6TfbmjJCADvy_HE9XsNjH68nrwJ_YkFTmtvZgJmMS_7sprk9e
 D5klDC7zZ4lhwwhGmDpY3HxqnvnYq_I7iYuGV6c7Q9LD_nQvFQNISZG2V3sfd5PZzCPMyEteoKQh
 37iMHyIniyYaN_WNbz2fErU_5zTT5aEfuyVmJwVZNeSRpaxtqgTYSt7PvfXQZRR8p8VJy26jJY3F
 vtOY8FepmDZsqicCIyH5iwO1TtZXtPZiAjhvcrz4YwSZn0hEn12ieay9UTr9BuFFbGN_qgZfo7Jz
 hf8Wgx9AfWRNhnv_EApdIhmgdiHC8oKKCRrwLNpB4LVc85T3BGV5WnCN0AwFOh7F72lmVYm369c.
 WT0CwaavMhl1uxsWppe7AfT51oxNXLk3NUms3hcvk5zwL0nw6kpCxBZc3g6i73jGWNq0bHjLh.EB
 KqtE0_Mv7ZFlE1ZP0UE4BqX1j9YRwo7xVf0qOdpgrXAWD_9wD90NiRxpz3uMv8_wDT7cKAvMr4ZZ
 3WYehTtfogfcOxHzYqZcTeWhOSnrs4DWbe_JnPgW0ScbAUZdNAl9hqXouLXEmNKmAcWnWk7zLftb
 JthzTrpN48D8n6GsEXniDSDfkXe0q7_Ffwn.3i5fCmWG9cp_D8fDXVDaZKbwYfUgBxe9Qgr6klkY
 vmkkhnBJ04mOCiQWBTMhRecddkb9PRDTUNNtS3_2vsKTWQaj4mpVHQ5bglPdYVhCLefg8.nuIady
 Zu3TG1aH8YEbVjLKLwNKd9Q6SJQKUVL9OHihG2AxsPUnrb9o7GGnXRjagDQR2CgTs2zNbkr7lyog
 OoiiqUwjKNb1BRtXXghPMZHaiUoySdnDiEK.f2kxei7zG_plLHVMLIXKMwJBwF5HOELjBH9y3waa
 IUSV3gBYATV7nmBFWiXcYirN_b8BkP7E9VR.GqXcjdHQO5Ews9cGQDK.NNRf67TxzvZ5mKvsZCe.
 gR59PCrlEOtihcuQmaEljj2S1mO8fEUjhn3BB2SGgkhfHJp_FdeY2AQFL42sl6owPEkz6Qot_DAQ
 csNMx1hrHW2WxwwtBhN8FtUQdvM.9aXx8wzRNQe99WtUpOkI7cg_MT515FLEMFUOLtKTJ.ue8xgL
 8bE8CMCOhwbntPQNJdOsWLhE7xuyATNCVEDm8DAhnn_ap7NcKdjbLIusGK5WM4EQAKkXieHRIeLS
 7gWM_QqyQnLiKihR_D_1LPwC4m9ALm23utZKwzDJ4QrK9jL1swKr6eUYVOG0iQLGvklO56pXFUWm
 qX2Njev_DB1AT2MIeZAMtnu0A2Thq20EipgOBeCUSybLNyh4gf3LBf.FvhPab7qjXajP.azrCYZ5
 nt1wZ27nIeFD9_jhpZEn6Pn22CgXu6wdBG7nIhFp_VGnTF2VZ5CDcZv5JhSnvwC55gV72P2iH_6g
 _ktIiGpPE1H5X25UURDVssMf2IjFzgNqJyrMwyHsl5ogrxCH61AgJY90ILD.YQjIzkweXWsKuNhQ
 r.iUrktmDDLaszssRWmdbuHmDRw.ewHtLT8cusjsOBnlFACCJ.OOtfBjTPFLnOdxaYZ_e684yTip
 NvOPyh4boavhEsU0Gz8Kd0KaOP8itD10xuvuVvcDHqM9loXWVQ1gmm_EoPQYE36AQAN.bf.9uXIW
 gfIJsnVREypkqzMQmyFhTP0ugbAAMS_Vqw8q2tliO0AnpJQrsUdS8KkasCYRTkOWtV9tfV55Rg3U
 kS9De3OQbBP_II9Ex2v62MWIpQAAwLmYgiVUoRkNlD_yfA128hSlZd2BEHtFkReDP.510JtxC31z
 LIdhNnykNDiWrAKtM9CYMdJk6pOusR866jSYtfX8ND2aLcaOvwkIER4W3hW2R4_MG2LBXeakRPLy
 LZ.3VSVOQtP0aU50hDZWkIYT_Xf7OOjcKy1lNvGJAlrVYtmUXV7va9LdCUE3WVmKbOqK63z2Nq37
 g.3H2rYPu4df.uvt_MtaVkiemwPh7SnBH7cntkoT9jreKPNz74sNfMfuqB_XUqRuzL.rlWhFvCnR
 s4lEZYDNuJdTz2MfsIEzmwEy4T7REqPcqjx7skLbUuj4Sxu_VhnBNiAVJQi76NQuDgY5xQb.Jwm6
 hMHjHUxRc3BRCryCHq83vyZF53K0gtivTmYve_S35tzT45KTA_xsjsejzyWrf1PIBMVNpMDYVGOF
 pexebwRsYMj0lWDGrgbtQRg9hj0aOdlGQ6535H85u5L1VxeY.hJ2VpRa.LC6FeZ14xfAYcEt7mkD
 He..gMJ5afIqhA.NNghGTKzuus6c4n06PjU1MefEicxvLqse47T4LzYY_w3q7q5VJUmbf8tqy0MM
 3gDSAp9rBWhcBXmDf.Q--
X-Sonic-MF: <eduardo.f120@yahoo.com>
X-Sonic-ID: f7f50729-3dcf-44d4-9188-ca8c9bc3d0eb
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.bf2.yahoo.com with HTTP; Fri, 6 Mar 2026 17:57:44 +0000
Received: by hermes--production-bf1-697f88457-q5phm (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 23b6a076abf2b51c75fa3f19ad7ec4a3;
          Fri, 06 Mar 2026 17:55:44 +0000 (UTC)
From: eduardo.f120@yahoo.com
To: openembedded-core@lists.openembedded.org
Cc: Eduardo Ferreira <eduardo.barbosa@toradex.com>
Subject: [oe-core][PATCH] go 1.22.12: Fix CVE-2025-61726.patch variable ordering
Date: Fri,  6 Mar 2026 14:55:34 -0300
Message-Id: <20260306175535.1036437-1-eduardo.f120@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
References: <20260306175535.1036437-1-eduardo.f120.ref@yahoo.com>
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 20:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232595

From: Eduardo Ferreira <eduardo.barbosa@toradex.com>

Commit 6a1ae4e79252f9a896faa702e4a8b3e27529a474 introduced a patch
backporting a fix for CVE-2025-61726, but this patch also introduced
a bug.

From Go's source code[1], they say that the 'All' table from 'godebugs'
should be populated alphabetically by Name. And 'Lookup'[2] function uses
binary search to try and find the variable.

Here's the trace:
Mar 06 11:33:33 toradex-smarc-imx95-12594035 systemd[1]: Started Docker Application Container Engine.
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: 2026/03/06 11:34:53 http: panic serving @: godebug: Value of name not listed in godeb
ugs.All: urlmaxqueryparams
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: goroutine 78 [running]:
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http.(*conn).serve.func1()
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/http/server.go:1903 +0xb0
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: panic({0x55743e8740?, 0x4000b526c0?})
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         runtime/panic.go:770 +0x124
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemetry.io/otel/sdk/trace.(*recordingSpan).End.deferwrap1()
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         go.opentelemetry.io/otel/sdk@v1.19.0/trace/span.go:383 +0x2c
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemetry.io/otel/sdk/trace.(*recordingSpan).End(0x40011b4a80, {0x0, 0x0, 0x40
006441c0?})
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         go.opentelemetry.io/otel/sdk@v1.19.0/trace/span.go:421 +0x898
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: panic({0x55743e8740?, 0x4000b526c0?})
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         runtime/panic.go:770 +0x124
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godebug.(*Setting).Value.func1()
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         internal/godebug/godebug.go:141 +0xd8
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync.(*Once).doSlow(0x22?, 0x55748a9b60?)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         sync/once.go:74 +0x100
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync.(*Once).Do(...)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         sync/once.go:65
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godebug.(*Setting).Value(0x5575b21be0)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         internal/godebug/godebug.go:138 +0x50
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.urlParamsWithinMax(0x1)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/url/url.go:968 +0x3c
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.parseQuery(0x400069a630, {0x0, 0x0})
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/url/url.go:985 +0xdc
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.ParseQuery(...)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/url/url.go:958
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http.(*Request).ParseForm(0x4000bdab40)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/http/request.go:1317 +0x33c
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: github.com/docker/docker/api/server/httputils.ParseForm(0x0?)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         github.com/docker/docker/api/server/httputils/httputils.go:104 +0x20

The 'Lookup' function was failing due to the wrong ordering and returning 'nil',
which was not being checked properly and caused this issue.

The fix was to just reorder the line where 'urlmaxqueryparams' is being
added to respect the alphabetical ordering. And for that the whole CVE
patch was generated again.

This change was validated with docker-moby (original issue), where a container
run successfully and no traces in the logs.

Fixes: 6a1ae4e792 ("go 1.22.12: Fix CVE-2025-61726.patch variable ordering")

[1] https://github.com/golang/go/blob/master/src/internal/godebugs/table.go#L20
[2] https://github.com/golang/go/blob/master/src/internal/godebugs/table.go#L100

Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
---
 .../go/go/CVE-2025-61726.patch                | 25 ++++++++++---------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/go/go/CVE-2025-61726.patch b/meta/recipes-devtools/go/go/CVE-2025-61726.patch
index ab053ff55c..65fe62a4da 100644
--- a/meta/recipes-devtools/go/go/CVE-2025-61726.patch
+++ b/meta/recipes-devtools/go/go/CVE-2025-61726.patch
@@ -1,6 +1,6 @@
-From 85050ca6146f3edb50ded0a352ab9edbd635effc Mon Sep 17 00:00:00 2001
-From: Damien Neil <dneil@google.com>
-Date: Mon, 3 Nov 2025 14:28:47 -0800
+From a41ff6cac6acdb8a55708d9f1e40efd8c4f87421 Mon Sep 17 00:00:00 2001
+From: Eduardo Ferreira <eduardo.barbosa@toradex.com>
+Date: Fri, 6 Mar 2026 13:38:46 +0000
 Subject: [PATCH] [release-branch.go1.24] net/url: add urlmaxqueryparams
  GODEBUG to limit the number of query parameters
 
@@ -36,6 +36,7 @@ Reviewed-by: Junyang Shao <shaojunyang@google.com>
 TryBot-Bypass: Michael Pratt <mpratt@google.com>
 (cherry picked from commit 85c794ddce26a092b0ea68d0fca79028b5069d5a)
 Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
 ---
  doc/godebug.md                 |  7 +++++
  src/internal/godebugs/table.go |  1 +
@@ -45,7 +46,7 @@ Signed-off-by: Deepak Rathore <deeratho@cisco.com>
  5 files changed, 85 insertions(+)
 
 diff --git a/doc/godebug.md b/doc/godebug.md
-index ae4f0576b4..635597ea42 100644
+index ae4f057..635597e 100644
 --- a/doc/godebug.md
 +++ b/doc/godebug.md
 @@ -126,6 +126,13 @@ for example,
@@ -63,19 +64,19 @@ index ae4f0576b4..635597ea42 100644
  to concerns around VCS injection attacks. This behavior can be renabled with the
  setting `allowmultiplevcs=1`.
 diff --git a/src/internal/godebugs/table.go b/src/internal/godebugs/table.go
-index 33dcd81fc3..4ae043053c 100644
+index 33dcd81..7178df6 100644
 --- a/src/internal/godebugs/table.go
 +++ b/src/internal/godebugs/table.go
-@@ -52,6 +52,7 @@ var All = []Info{
+@@ -51,6 +51,7 @@ var All = []Info{
+	{Name: "tlsmaxrsasize", Package: "crypto/tls"},
 	{Name: "tlsrsakex", Package: "crypto/tls", Changed: 22, Old: "1"},
 	{Name: "tlsunsafeekm", Package: "crypto/tls", Changed: 22, Old: "1"},
-	{Name: "x509sha1", Package: "crypto/x509"},
 +	{Name: "urlmaxqueryparams", Package: "net/url", Changed: 24, Old: "0"},
+	{Name: "x509sha1", Package: "crypto/x509"},
 	{Name: "x509usefallbackroots", Package: "crypto/x509"},
 	{Name: "x509usepolicies", Package: "crypto/x509"},
-	{Name: "zipinsecurepath", Package: "archive/zip"},
 diff --git a/src/net/url/url.go b/src/net/url/url.go
-index d2ae03232f..5219e3c130 100644
+index d2ae032..f796077 100644
 --- a/src/net/url/url.go
 +++ b/src/net/url/url.go
 @@ -13,6 +13,7 @@ package url
@@ -118,7 +119,7 @@ index d2ae03232f..5219e3c130 100644
 		var key string
 		key, query, _ = strings.Cut(query, "&")
 diff --git a/src/net/url/url_test.go b/src/net/url/url_test.go
-index fef236e40a..b2f8bd95fc 100644
+index fef236e..b2f8bd9 100644
 --- a/src/net/url/url_test.go
 +++ b/src/net/url/url_test.go
 @@ -1488,6 +1488,54 @@ func TestParseQuery(t *testing.T) {
@@ -177,7 +178,7 @@ index fef236e40a..b2f8bd95fc 100644
 	url *URL
 	out string
 diff --git a/src/runtime/metrics/doc.go b/src/runtime/metrics/doc.go
-index 517ec0e0a4..335f7873b3 100644
+index 517ec0e..2efb13a 100644
 --- a/src/runtime/metrics/doc.go
 +++ b/src/runtime/metrics/doc.go
 @@ -328,6 +328,11 @@ Below is the full list of supported metrics, ordered lexicographically.
@@ -193,4 +194,4 @@ index 517ec0e0a4..335f7873b3 100644
 		The number of non-default behaviors executed by the crypto/x509
 		package due to a non-default GODEBUG=x509sha1=... setting.
 --
-2.35.6
+2.34.1
-- 
2.34.1


