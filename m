Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5263BFCC071
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 20:13:29 +0000 (UTC)
Received: from sonic317-53.consmr.mail.bf2.yahoo.com (sonic317-53.consmr.mail.bf2.yahoo.com [74.6.129.108])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1116.1772820493388218601
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 10:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=bqN9R5M5;
 spf=neutral (domain: yahoo.com, ip: 74.6.129.108, mailfrom: eduardo.f120@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772820492; bh=e3ZS6kYp2RP2faHt2aNHiBdBDScGHSUWaYb1lVzWM/0=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=bqN9R5M5ju0CgXIzeuWoSjYxGdkFs4qIAv53f/+8hCdUd4/HK8aPX5k9aEyDXmogIWNL03FtIV2U6/j74DIsUgCvFTAO5ob+pjoLBRMEzbITACIdst2aPShMKES1KcoUfufAvRqCFCtkKw5bJhB4uXnXBOK3FUViSt4yOejK1TPN+i/BY9MbRv3i6L//DYx7HJKs6iScTL5Or3iAm7Aopep3GROLVbJDduP/gBl0R6P7U0oKcBDiJiq8ZAP5f88XWk84Iczz1TXukQIVaxgwJKZU/ziRIwJIUeswoKVemjuDU8bfpBTgMuJGjIEqt+23lbkW/85QdqGdLjNClqPFiA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772820492; bh=xvDY66pGtFsSBgG1nLwnrgNzEGdS/SHVD1P7sbQTwoi=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=URMA1b+PM2EOBjSLQf3lcHVGG91NoUKDQBtmjQpGZlLOqnq40ETZ8M7S0PX9MW+YG6lSqgwJWpC1m1rVD93x6zRPTOY2HylsmKBRp6tpVFXkBkJQcMIxVeYM+KMFaCrYkW1sluktaZY1G9E0/VhxYSAvW1UFpX1EvKDAiQBoX4urBDBwF14ThxQwlrgnTXqXEU2gBnsO0FaH6tf5sMQUunW8B/q7yxTkWEED0/rQgJAb59pOw041Tc0GeIsAbTnOiOxicE+q+jY+lHgDKDei4GeVsjYeaK74v2cfld0KpjHjzNXSGex7+uNriookp6O+i5WXxOvAOVlzccYaSiedrQ==
X-YMail-OSG: 73Hct8sVM1lE3uhPtLCGW4VME4dzDjgwaKFs8aujCF2RFWPdenijiIbc5MTz311
 1p8gN9o0Qs3G26THJZWEQvpeEq21TfHtk338.N2iTeUl1xIBLYmo_6MZliXL4RJ9ZN.DhVUq3Z8K
 9_uvtqigci0eRV5HXBbcRypbHRYw1cLdPzOD7SuOz33iVHQvhMUQYEpqnXd5PbWoTraeeBE_KeCS
 7OSR3Mvqvlzem87ekCUYw0tiY7yxg5d6PvP0NWNo5sMvgVA5FNELtkIb79YHOyJ6Qg5JSqhwRU9G
 4dJeiBaIvQCPsAmPJfWr1fsKDmfv44hW2fvcGJRoUa3FEz2TNkBWaxkwa8UVwVAIi5VcpIXR7aOA
 XiO_6xJIhOvbX0dKbmrrISiLF2h8wsTqsWZ_zsKO1LvWbUwWLASqZ7iIuM5ShLqbPD11d2rAPNK4
 KpCfmEKylW9Xll.xtUTuIA2r8wAlHBm3J6CMZoUx2_XZ3B3coAtQwia_khtA8XGOOQsJIhD0W7cd
 aRi_Jxm_HxlV_jK9X.73icArEFkDjNswmbyW0yAXXlKD.YxuijmMTRcgxFZ06.g3WZG9GNXWsY0J
 7BdgQMUT9bbT6SxjjqdtW7QnRZCK0IwFmoRwjum0Nz3DSMSoEUS55r8P6vIODQ7fbLiroOydA9hN
 VkKFnN_pezPDlAGKDTTev_p4HNacnkgErLbo0f9vZbWzFxyrmVUaO.LLvKouCcHfRAfCgbGhcAg1
 z.DlfwzG7wvTGimv5UfoCXgvEATdadPXQQQFVqMiIcJjgrqqdLFUyetbOcIryKLr4.sY8nncEglv
 185NlW43Ud2fiaGrwA5u3ohmC3arrl79bbxsTGKataMdmRSyWJ64IrrnXSJvPXHA6UZW3ZjTqBtW
 AC.BPo08fAf5cbXb4pUvNGer6HdPN.i9ltD9PQX6nIMz_mYN8MD3IiqIekmkK8TVMvYtPW.76VrG
 FWhQMRHPpZoqwhShRn_HuB9qkL6ZUbLts_nVCFDQ5PZxRVylEgZA0bJAJvd8jhIvUO5x52QnaDdh
 cI7vBTmWCzfMWTFZP5K4l5vjCRlBRHwdw.jBRLofJ1MhOBr5ZYQIdoGOza6ZD8a7dlpKBX0xbOfK
 B__hM1x6HRflFnEFohCsiKKziPgorFpGq9KGqt0AsCqeGB3lczQ02QzVqFg_NrSb.Y8_2RkHkXsr
 kZ6HZPAMr_jqd86cY7ex0DSCikfFV.v6asQeGeV9cy_5Ri.EHUpa0JJqIA0InBe9gXF0HrDtGkh4
 5NDvfcqrLfP3TCNmlahQSpoMxiYtxOURoLhkivRIIqIETrf9fLUP9vrNJaFfw2dq2f3EAco5qucS
 6Pf59xLV6tItACI_lVHX.Souznn4WfpA0yyA34rNjv6NH5xPic1CSPyIY7KETgzm7qHfRXU8ssn3
 XjZOrzWROvIQ32U1trrmyacr_HhSIaQJS__VKnDSz694FckAwbjmnsOfwBNKbegecMcti8oPDm4H
 lWYpgUyHkz6mYgPmJWH_f9UygYBfYtIEQehJOcQj3xIxHV4EUuvXNYA6baR4DD5P03xMuRXUynWe
 0.YrLgpL7kswwIJV4CzaaXKnLz_9Jj8_wKTNhl3W_4IgPybsbHO6Zyu7.q7rYBJ2403rw09FxZzh
 2_DNpNzQZSc_M4TkGTDNQVpOCebKWbTL1VCHSPtgo_Aybpddlh_eYRvMIqJW.hs3us5JkkllOT7X
 8fu9_3lzYGPkpA3ss5Duq7c.PkSW3GWgiPqFV8qIV_1iLjQDocezQWuUcbl1eNz0JuCBeAzM4UfP
 d1tpnGvthmnqM469QLjEddPIiJYdNZkGk.SFeImha22zQzWId_sPwt.sFuQDI4QP5L.wQ1tXlDyz
 ix0_IXlDtt0avuLR3I6sav39gsh520docTaAxHv2sanKA5v5xf0OgctY7TCPeCUgDsX1mVyVAC1O
 sPM9dZpLCY0FV4e9.GOTs7WISau6XdErILkS7ZCmQtyUBHKwxDwwmthfCE3WFIczlIIbysgwyoID
 m_LhATOCCjQHN4h7gIvWOrX_7g9QWc95.Igg1vLmFOHY3vlk5Grsbqqbxks2OS1axfY5SQOmQ6UI
 0irTWYvobpRgzAa7fuTSC_BslLyMfTaeZUMDxMExbz3Rp6rXabuGe12kyD5NIOn4vA_jFnqqtdf8
 mjvbwKhQx1mbKH6dA2pgUtuOmrY630Sbo3.nXSypYIkL6gvRIhzUbNekzLMXziCdADe8o.KI7Bez
 p7ZwPb3THn5vBByLtS959UoS0MPIVMdCw7Y_uncIiIyukzJqE2Wo5_rqG1uhhbt29ySTDR8LDWoh
 ExtrGsPLSu78XzXnCqIiPZLu51xWF5KWiFtGXTwsPs9bd0g3TschzN9R.uULs4mTRZJcK9XUojBx
 aDICBSu_dXBBBA022wkpT
X-Sonic-MF: <eduardo.f120@yahoo.com>
X-Sonic-ID: 6d68d15c-679a-4830-9432-b26682b1bb48
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.bf2.yahoo.com with HTTP; Fri, 6 Mar 2026 18:08:12 +0000
Received: by hermes--production-bf1-697f88457-75c9h (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 7a7301eb53a3a3fd449217282b97619a;
          Fri, 06 Mar 2026 18:06:11 +0000 (UTC)
From: eduardo.f120@yahoo.com
To: openembedded-core@lists.openembedded.org
Cc: Eduardo Ferreira <eduardo.barbosa@toradex.com>
Subject: [OE-core][PATCH] go 1.22.12: Fix CVE-2025-61726.patch variable ordering
Date: Fri,  6 Mar 2026 15:06:04 -0300
Message-Id: <20260306180605.1047779-1-eduardo.f120@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
References: <20260306180605.1047779-1-eduardo.f120.ref@yahoo.com>
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 20:13:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232594

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


