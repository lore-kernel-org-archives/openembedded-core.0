Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFC8F4181E
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:07:17 +0000 (UTC)
Received: from sonic306-2.consmr.mail.bf2.yahoo.com (sonic306-2.consmr.mail.bf2.yahoo.com [74.6.132.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19751.1773075852668464620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=bkZUp0hD;
 spf=neutral (domain: yahoo.com, ip: 74.6.132.41, mailfrom: eduardo.f120@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773075851; bh=uwaaXyIufDUeq5YYSkpIDrQksZNchG253uQUBfSIx4Q=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=bkZUp0hDqiFwXNvYhHR/pxV/m2lwKkCHl2gZiLBETRMoRS9ZprXFFKoMPCmnzTc9trCYAcGqr/v2vpgnRel6RXeVa4oQ+yHKY5q8ZIoQIbX6bKu898H74E3//pgZqCaIX9vPXyCRXbz+ycWFO9LHd3iM71pvj4SO8n7ruajt+I8H1Ks2tf5bh/WYd/uCv2nk8s3segpK9MQRwYwWvbr4mMVc0S+bbxrlYws4HI0pvR9F8YBMonOZuEEgTgT9QqdbzxG16PtdlQi9gn/UwCQzXkmqDjgAYlqmuTiL2nz/1OabXF6OQVjsYM1O8EyIpGb67Ti4yfFcEC87z1dA+1o/xw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773075851; bh=7fXoYJj0edbBj3AhlllL9rFlTADDZgZgVFV7lCa+jDA=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=pW2bJF5x3whatzrUEYSxDjeU73mK/rYdrd4EZF2+MxMz8cLdyGLnGWM/McbJ7+t60Vtcc/vMFVzqkZ5Uv56CWO5pPDfG8P7gODOBK17FPZNLrNqs+EVD1HhZJf4ANY0Me62su+tTRtrbd/66LcyKxZ/vSIBtoETLeLYMqji0jeTmo774UnK9e8fyzS+oTvSV9Z38S23Bb8VOzDEjmjIjwJtieiEmKiYQkmuv10kiA5iL1Gbl8dYqsDmZHwLgGtbtAm8UGBG8BrMRB8MZGpyEwSQAKodeAAcTmGDzlRoZolJ6S1NGexIrtUDCwPaW/6+7Qd0XE8uc0xuDEoPvU4FJfw==
X-YMail-OSG: xk.ZWFUVM1mHz4hXe0LOdp49GmraSSAQYFP7jB401H8VGg5hZGnqxeOyRbdllfK
 3ZQ.hzmZiHtP.w44ZCdNEQV.8Mcr4GcHQThKaP8_pUG7UqYdJWkHNB4uVfupA8wIvxMKlhdurV4X
 kgEFuXF4TPKBv3EcVIdaWaOgUtDhrLB7R_p.KarupI_1Dyn8qi57pNPiFAU0MZ5GxIkNeUcsAMj7
 uPYZcyh8fqXE1k6QdAUMWWWJde4UKtlPSsTKOyLRmpbVg1dggC5yMh33qCW5K0ozJB40Elzny8UV
 7Je8huioo_oua82xP6wf99mMgvXXLkmMq2pNRHjf5hKrpmva_HvF66ng.q94ygVEWthnFsKeoLfo
 LqN96Vv3gae7bNw4ns1GU4nYWpC2dSK4PG3Dl4Ko0Ng295gddTdjaxM4ddF3ORFYqGvgvnGpgkOQ
 QijrUfoKenfe4UCjfnXi5oSArgM1qqvDE2FpHXtfjmOwV4e9jVK8r.vcNrM65CQIB529ERRBZJ5Y
 1XIMBqRChryEjNCJyfWwOmoTkpdf123fDQIe3aIhgXgt4ppKGqZMUimQnG7gGz8.jM10gaqO1IMx
 4SkfWKUk.xB8vSdj.tizKKnj1MPQHsh12QzAvZF9h9sxhq2nTmst8RUkz.JTmMGJCxDugv4eW4zK
 4eu2DzKbtvJjwMgznlVAQ7O763UEDR8FGnX5W.T.ypsLheDEHj3duv2dWa1NUo451VYfSX8WnJvv
 2_IuDpdK.BYqRbw_NrLvZh_faDfjXitgV5El.jZdLk6Ye3x.kZ2MU4.QXTgfcq0.ph4gvhIQyp3z
 8xv7FFHFXCjywhpFRWJeXc5YmUkyfHSxZK9wJ3S7E7DVAeRbdNLiH8cky.X4vEUhK1cosu597uM1
 2P9Pxd3Sp8T3nM4dU3v9OvrErOq0gbDFFMq6UCOJr88rxelgFafhiIbKoynJYC1qXl3QPbHmg7IK
 r2Y1RfpiUe7bKh6YMyvtcRv2k0oQ0BQeuYmpS8RJ7AfojDeTrlSdpRycgnlxnm9GkYoG_v9rzJJ_
 uCnRhzt9O0v6o5icwo7sbZmkSt5k1Dbf8J7P486ea79IKUdf8JPe2hdgCZBRzH6i42AF_6RAAuR4
 FbZtLLBwzYHLG1dUblzkSc5pENDTyAgsOcsHSj9Xijah60PpOXw7nqC0XuZUNd8846zArjIWZHlm
 jbj1U_ZY.sm.YwAHcPDx_X7oyvWmVazTGrvL_Dfjd5pSP3ExnxXn1GMdccyiJNA9Byvt7NJ5dBW.
 zf3mu4mjhz4bb8hKchfG7.zdS.QsKsJYm5hxH0_qpBg3at2lr2qLGSqE10qmtMfE2c.t4E7Pqcb5
 fIBUEA27S3LtPifFAWjkRYWl56Sp3RudEs8p8YoZ5LPKZh4tV0_fwv0FQBQpFeKuZyKkxbdpqhqd
 kbVN3uFbr7drBjRxBWnpM8FoCmt2Af9eITdk69agkJhyAEdBoEv6SwFdD3VcERCzijsa_qcjRgWK
 cfkeiVp4pG7TYt2yQs6.yYMeDP4tIaoxn8olysIZsu8Aae1U7sgB4Agysl6NuL12kPsMm_FHSJaG
 rJMzoi65JpdDKgyz2wH4c9HMzBigYZDBG2g99pur2WQN65dimi6Jx9UFFBzzxejaJ8PZG6GxNKyA
 tlJFPwzuiF.GLZ_5znN5EB73nId_5Ju2VY17FH8Z66NCoh13XhrMXRXQhuJJjRTyrd7CZEo8LPQd
 eUNmzHOE6CZ1f6BEpHBcddRrrN3yf0nG7MJdiJpuaO1w8cZv_t9UKfsvVmaQVoRuSwWCKSu02OS5
 jCo2HwczV1dKGfJ3d3fw5eiFbuhxBi9BdxZqMfs0eXUxjCnC4GK05PO_4XFQr6BxvCFeevr3ZK7F
 oEx9bVT6uHZ8iyZUN9BDhfByv6zwb8AQYLQLVCnNquvCXx2D5Vtx_3ujOLUPIEAU6ZRODb8smwSD
 O2idTLPGJygQq_biXuQ_5EFNmo7Yr_MYrEr7eEyrq95IBwFhoTj2ka8UNGxKLLBntsSflbBg.h3e
 VfZlj_pnp7bqVnsV1xgVQpzra_V7iHE3hMzN_Jjp6DI6RSgf8FOWnXVS90GV1QlwNJj.nm90BYzJ
 cqNy.vLy48_cg7owFaIOq00PhqBu6HJwLg7Sjygnju_pJoXSMdsa1ixXRQOz50xsMJ6ZkXTzBNYr
 MvaaUbVMlIQTBMan5SoJ.sWqc3tjOzTNbO7yo_IkPPVsihC0QBzbOWG4H0Yx.fG1f7gujvSh_jhq
 OV1662YDz1uKgQ5NFz6xmbbYK0NUiv0Y_yB8iGcH4rmDU7E2OoBUYgt.pqoWc_kfEp7OOFAEw1t1
 Rh5nUS7BwDppXI3w-
X-Sonic-MF: <eduardo.f120@yahoo.com>
X-Sonic-ID: e092667f-b551-46d6-b6f2-5e2114380581
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.bf2.yahoo.com with HTTP; Mon, 9 Mar 2026 17:04:11 +0000
Received: by hermes--production-bf1-697f88457-j2qvt (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 044e4c41307db729c31fc9dd57381a8a;
          Mon, 09 Mar 2026 16:54:09 +0000 (UTC)
From: Eduardo Ferreira <eduardo.f120@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Eduardo Ferreira <eduardo.barbosa@toradex.com>
Subject: [PATCH] go: Fix CVE-2025-61726.patch variable ordering
Date: Mon,  9 Mar 2026 13:53:51 -0300
Message-Id: <20260309165351.311700-2-eduardo.f120@yahoo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309165351.311700-1-eduardo.f120@yahoo.com>
References: <20260309165351.311700-1-eduardo.f120@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232733

From: Eduardo Ferreira <eduardo.barbosa@toradex.com>

Commit 6a1ae4e792 (go 1.22.12: Fix CVE-2025-61726, 2026-02-11)
introduced a patch backporting a fix for CVE-2025-61726, but
this patch also introduced a bug.

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

[1] https://github.com/golang/go/blob/master/src/internal/godebugs/table.go#L20
[2] https://github.com/golang/go/blob/master/src/internal/godebugs/table.go#L100

Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
---
 .../go/go/CVE-2025-61726.patch                | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/go/go/CVE-2025-61726.patch b/meta/recipes-devtools/go/go/CVE-2025-61726.patch
index ab053ff55c..bdd10bc933 100644
--- a/meta/recipes-devtools/go/go/CVE-2025-61726.patch
+++ b/meta/recipes-devtools/go/go/CVE-2025-61726.patch
@@ -1,4 +1,4 @@
-From 85050ca6146f3edb50ded0a352ab9edbd635effc Mon Sep 17 00:00:00 2001
+From bf06767a9ac737387eee77c7eedd67c65e853ac2 Mon Sep 17 00:00:00 2001
 From: Damien Neil <dneil@google.com>
 Date: Mon, 3 Nov 2025 14:28:47 -0800
 Subject: [PATCH] [release-branch.go1.24] net/url: add urlmaxqueryparams
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
+index d2ae032..cdca468 100644
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
+index 517ec0e..88d6d8c 100644
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


