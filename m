Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54662FCC073
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 20:14:29 +0000 (UTC)
Received: from sonic309-43.consmr.mail.bf2.yahoo.com (sonic309-43.consmr.mail.bf2.yahoo.com [74.6.129.217])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73551.1772815726036891873
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 08:48:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=UOnQl6yl;
 spf=neutral (domain: yahoo.com, ip: 74.6.129.217, mailfrom: eduardo.f120@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772815725; bh=e3ZS6kYp2RP2faHt2aNHiBdBDScGHSUWaYb1lVzWM/0=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=UOnQl6yl28LwQTNAGz2wI2OIHD/ocWZS0bC0a2IFxy5jtw6roWfbs9eV19GgNR64wLajXh5oPe52nEiCNXoU4ytMCpa7Sp/6MpsGNwlrXvMrdo5fk2TDXek64c0v8yZY8/PlewAVFG+oo4wKrBhv4bxJoQXtTfs/CdthsdhPerEuOrbVe61JQm2QYzdrhLfkO1dj/V/WYzogheoIpQVdt8E9V2kq3yVEvciD7w9LV76lF3lGaKXad/lAOml9v4s3Dzwee3ebrF+wPIb98/aAioTh18H/0XRgLsssEal1xz6gMRiBk064HuZmLbuO7gMvf3fPu00yjiFHXV+97AtgNw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772815725; bh=Ntx+1xUjGHma46CKyprAwiTm6jOp75YEsVsm52dgm4t=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=WVOxB2u82rjESiOfw9lm4msRstROjp18SWoV3BUCPPoCYFvlXVXKudn9S2l8nDQE/gr9GcKdLjVvMpm80isrJL+9MHDr+lip/IF6uVJ5J5tTq0hUNh0qS8nTvmpROYwky0Pnw0mo6lTeTFvv9khc1Rb77IrietuYRXcKXcyX+cnaWPObd8Dfh5PC4HEnV2N3DpE1yIe578UWFrOKMV18Fw1N4JjyCRv629oA0+b4MltwbXJNYN8u7ev2rTGp2uSSgtcKNhBoAt4miEVH/kiVrYEpOIxmEdxHvtwp6pMUH9g44laM2eA3Wv6E33EXiOWEimnmB7swQqHpSHdS0EMC3A==
X-YMail-OSG: o9gZAGoVM1k3mv1uPSaHRE3W2CEw2PnvSc4wCLOFCpVXPun_UopR5NPdP0IkhiF
 2DBBeOgM8E_1DyPa47PZS3Gie5N0aeks15i.zoyaDvANc_Spf_4hzCpjVTSbmeCdNKf462tXn6UA
 ccJLpcQI3SrkA.MQX7frihPfxF8rJ7Uilam2a4wm9TvEVGz0S1C_yXElWGk6mO0Cf6YC4_chBrLK
 RykYaXUtHBhZyDGmsi7TXx2zNZ9cMo.x2YgtrRRSYF.bsmkA6xfZRY1g.HsGHKrKC2lkseh_jGoh
 HrJj5fBaWV3jdBwlNj7U9Eh2CydLgxsJ9uwgPZRb2m3Dc37r2iXMq2wHILHi03..1gndzGIz2udU
 i6wbWMozZ9D6aiHZ_su2OyjmbTigw69vw2DrT.cF2jtwCrB2hIrcq3OTZSa8gl.Hvi71dvC4uMrE
 DAPDgE0lZMWxT.eojG6XVGWQC5AgYnOJAISpvE8STaSTOK_EBDmjp9VMDPqXXUfu_VUgi9rkVsbt
 Nk4Os7S6S.xpc8LHmAXZc0pKM5UtvrJYmzlK_ttlBJf07blgIGW3LkXcgE2_QRqlOEzG2OXZeD_h
 APF1mMVycAUptZb56PVU8vK9qlnSwqSP502knwRxNSuwvMu7GORozQ8G240iAToB31e4DwcWSqlD
 F_Rguv9E5DOuH7qx8IVU6x3vPK0mL.DHvD97CJgF_EFUZeXU6p0R9Re0tVXVWWe.m2LGlP8P2Ip_
 9aYgHBGi9QNNmmSQcQXK7OKONJWaZjZgrd8OsbFTMlcggmN.aNRm0.Dapew8s8xA_pLdMIYoeNeP
 jvA4m5HWB3aXHcoL3_GWayGUUWqTDE2UalIWg35sYtTMSYvk.LXZx0npQnBpQYohZ9QWA2z9RJpy
 k3nKkpujHJ7ty0uzo20PRXfEBmf4B7ZmCN3ZEDeqLuK0Wt51JrVh03worCUzwrw_tRQRRDwNMfvD
 H.UM5mdZD6ENK8iW78ZwhdES6ig.l6am3qzu9SZ62tvSz.Uow1cRwyEsmirPoy3ZKMZK7TepHe8O
 IzQU72KxReQjwKir2TrYomg5sxsacfzrBizyZPf9nNatx0bv2FMflI_t3tH5E9MDPU_w8MKrvpBh
 I3CsTjdbAjGn1SRd86y_zSBRthrHUuoR8hNN7rhjHFuqSUiVw0ADJ2JBPXHt_1uQ9Ch6PzWh3Vrn
 uJ2WJZIJU.JEkfINlNfz0xluExe_FPDxcAvHc5OSjfHmld2MM9vZ2MQrI__ga.ioCaIjOCHLgina
 W0PSeJT32iJxSbqxnQdJSUtBQgXBwWSObb1.Wsb12tPkZArxk8wwkiJE2T0rhwpOdEJWrXB67kMQ
 9XOxgevdijyKmEsoHXHu8S_hHM7uZXRQf6zit_FxNjjs.8S98QRXV68gwBkU01jK05g6YTVcpGOn
 NUcC2DuICSRkA5fKjwfx8Gn2Re2duAKrJdCvzKS566Q21who0pxI8Jn.L19.2Fd_iYlqvBfIKQh4
 wiW9ai62wm7w8YM242wrEbY3KmqConA_Ak9EsJUGgcBrQ9Fm90OZuDyzcOS7CojjojX.dWLIlxtG
 qSxbyaXy4cz5X.1Kn6Th8lLDp.48iB.PPsW3E7g43BuwmNqJFiCN4JwKISJ1tnj4RWwr6jTJb5Ak
 6plh6y5aDDrXsYXgb61yFABcnbJ_hP7EV018EoIIfn3vXiKbyB12y5hEqqWRlaPjym36c9wzMZMt
 aLTBSUv2dVup8ljJ2Pyk6_bpfBM5wPNnLBo2KK_lS.16SwbUl29WHUiaLAjiNDu9pJPtGuvuMDgL
 QzB3lpIt7XJo1NlSMiHchW.5o6_D.eRgQzJogsnpHwcfHcVDs.t5gJmTwDbF4xS7o6NECZmBzFiP
 A43kAggvyIGNHeZbyN1EZ0ClWzfqTDBe_sHM_v_lffcHPDA_3.H8FTx4_v2Gr4bpgAXchbv7baKQ
 VSo5TInh6G1DAFJG12g1nIdRDyaDHhErtQTPP3i2P33433iIe3smMu4tK_CpsSoStF35PQYTbBWA
 hpPHAy3U9vdbio1CWt6vATSZqXSaOcgTn6Un5hrTJ4jh4I53j.vpSV6gtDGhxSWCDS50WRYU1E_X
 YSoT5fJRYCmAX42oa3tvhFaipguDaa41usoC9ddhmjH9WdvgDckmdcHXHOdsxezHBQL9dLeCblhy
 WAUAL_PNJUMk2f_bk.zx7PKmUwGDvn2Z.bdMsRdhXY1CxDp08dhefmaQPYmHLi4B1tNb5u..nH9E
 q7RyAyXsJ.5OpoIv7C3v9gM2QTADxAz7Cw.wehzxy4qZ31nRGLYbHdH0CE2ymbJB4dqWMaq86nJG
 xLDDf6xIH0rBaI6aWnXAE_.Vc1tH.GJsA8WkizZfCNckI4AW5sP0pMb8KJcUXG.X3.3DuLQ--
X-Sonic-MF: <eduardo.f120@yahoo.com>
X-Sonic-ID: 3d6829bb-9f13-43f6-9d07-6fd2d05ce4fe
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.bf2.yahoo.com with HTTP; Fri, 6 Mar 2026 16:48:45 +0000
Received: by hermes--production-bf1-697f88457-629ff (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 5f3d391e62a5cb2278e1d07e9f03f0b1;
          Fri, 06 Mar 2026 16:36:42 +0000 (UTC)
From: eduardo.f120@yahoo.com
To: openembedded-core@lists.openembedded.org
Cc: Eduardo Ferreira <eduardo.barbosa@toradex.com>
Subject: [PATCH] go 1.22.12: Fix CVE-2025-61726.patch variable ordering
Date: Fri,  6 Mar 2026 13:36:20 -0300
Message-Id: <20260306163620.952359-2-eduardo.f120@yahoo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306163620.952359-1-eduardo.f120@yahoo.com>
References: <20260306163620.952359-1-eduardo.f120@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 20:14:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232597

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


