Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758AFFCC06E
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 20:12:49 +0000 (UTC)
Received: from sonic310-14.consmr.mail.bf2.yahoo.com (sonic310-14.consmr.mail.bf2.yahoo.com [74.6.135.124])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3418.1772826924921138599
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 11:55:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=QpHHHL9e;
 spf=neutral (domain: yahoo.com, ip: 74.6.135.124, mailfrom: eduardo.f120@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772826924; bh=jKvp8arzRl1njGIVT5bSyIR1OSGfsThVeUg9T4RbypY=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=QpHHHL9eqhb4/1NMZYBdint+GUVbPQG98tusUN6XTdKNLOeYL78poeMdiX2eEmyHyLnbFuu6CHecuubsvOZDjWw7slS8uyzLbEAii4kR+PraHrri+u+k5vY4kQYNkATmml6EM66okwXfxwnAx58I6VMmB/rtCwA5NVM+A7MGgEiDh0UELj4QgBr1LDay9Z2R2WcwuWwOm2R8JPcGsMk7Oj0v7+kmYe+L+C2Yj6V7XLWtjp8yGdtXzLPwpUUs3bt3Ou1yzVnJkehZQB5vnR6+6EgDTM1fvTmNn7GJ9XMRAraDFfOHGlShrUWWC4JwoT/0XxQAlsOTtxABt4d58PIesA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772826924; bh=ejg+JXIFCg0wvumkU5ftIY+PeP0hM9Giz1S5yxLHGwi=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=hmlPv409taD+Ao6CIkf+8X/Fme9dML65NT0tc33/NbYGbWosNhbiBnynD6C3HDhnVOf2qBQsij2K1QuhAoK3jNPvxliyOm09qy9iltPpznfyMzBwTDAJbpuW+sRXWmxRzOM8/9Of7A7ggYfioU2YpqQO9CN59E7Wdz7375isBvq0fKm9O0ElHoiuws7zbVAAXoQ+6CE2yfGuqDwE4e2pP4ev7fvOefn38GEaepSfqX+QhAbQATAxykHlbuvtahn8FlFVCWuuTfWZnHDoXfTahWpLz1Lcu/8L2rPHuxqvSsqGCQM4eOSyfSClzxJeM8iqXmmEtZpvfX29axjnWI7i8w==
X-YMail-OSG: vI05K9kVM1k.kjoiCnNOFtLPNFCDN0rm4T7mt5R0vG5UvPS4RopExrPl1f4fHze
 eYnV.S8x.g6ZNB6mylDdrgoiw77ihCILuk1go3_D099IC.QMx7N8LOLVYocYTTlWwA9s_BJTzyzC
 HD7xySLXiZ4PI.zDJdrln_wTUR_H5CQhuC6rVsZhDW3Lv0gkc3H_xoJfh7qFNJKVO4AW5z3b7EnW
 jLExzgQVbcAsACbsv3DEVKL4zWP3S.hCw2nS0PqSiZBJcXxf0PD6qqwuPlvK2mGW87ZaTroALaQy
 Krik139dtdnvOnxdAQrsQGZQdzuM9_eCYSjjPBcE06Woei_1DfeS5Pmobxj__OlKHLkc_3uhpHva
 3D_Z.1sbLZoDsc.QOpVnkPvJ3lcb5hnI94Gd3uH66nG5.fsCArZSFQW4bi29c_W8MJMiRrBJ9IGv
 y7IY4qocGNQn45zIL154uy41bNx9ELKhMgbujO9_af42y0s15fH2qE88t28ftQzFMHsa62i_7QwR
 PHz4tdHmRJpd32QL5bo35NCtkes08hArbk.d.bQ3eFdJnQZCRgZwLr.McB9bjdIE.w3ZcLxqNzvB
 mEPAF5Ahels.R3tWfgeXOEG8OjInIXc.3kmORgNdZH5ghGoSlfQTp_x5JQQZLtZQYMTwPA7zFesh
 z22uBl9_JqEDAYJuD96kduG.7v6XF3uPlKyGfGIy2lS0DT8eP__GkEnvJsbd9bZ5b06AW6q.6vcI
 39rqRnm4A1rbwrKNf9nZlrA7VKGInVpDDkkC4.inbxFYRmLEqMX.Qq5zE6w6jaQqsFle.GmoHiZm
 zNsyaykKbAQeJLS7jxWdIDrL.KIoMONkppacCPidEl_B8pPXVHIo7lCOwSok__CWGF3ojljHO7.2
 P9akvY3.ORb6gfUdKOtfLAe.GI4_B5NFysa9Rb6kX_mFCc3eYH0oxtE0QDvNWffiL_RGBTdSOtjR
 LnSBmg_6GpE.PEbniBt.l_LP36HxSslRUJPjlqsccryoYPv5FS8FnvnWWQo30OriJ1dPoVoL97hS
 W4_K6KzaZhAxErVMcxqdraxeQKaYU9CxWdkCoRFNgAZD1aepcRHuX_ZZc6QqszDYs_K_0u_mXYEo
 dbSI7_B8eh2jA3AyXD.gIGLYruDZI8LE.35RKUGJ3a0ZKdT8vZTNZ3C1csnYe1Jf444Fj1O2ycbe
 vZKfb9zdX.q6nuSqPb7BXaDTpNXy0VuV65dwzUpwF2AG2n2wxZT5Hst18uQk9_RTG4wyBCzCeYsD
 YQ.q2GgOnkM4CUSQddWCs3mIESanMk6ku2hTB6ESSGF70eX.sazMS416EombfcPntB89rR0ll3HH
 0U28wdDRtyhg9LdL3yxpbTqx3gdHHu8aZ9ywCKN47IDFgPxTjpTT_QoCC3JqRnHGvKyKuEtRl3rL
 KAmZajxo0mRNLzd6GV8xDfZOsMWm651FWHgzyWQZNQ.vv9UdvXmuxz0_7mUf73E6lT.AzvAxt7Xs
 uSf3L5XNiu1o74F2IeibTM.R.Bn2bNrQ9rmkzZDzuUJ7cBq2urcSLIv0BbTv_j7Io52wgewe63w3
 43uU3E928jYb1suf13mfhRRGZ1QFpQsZbtQpANrZHy2ntyTZTGI.a.g5OS2sQ7FzNYHiSSoLVnEb
 tYfYUAYp.AlhJr7HRKRhk0c.FlUgWjvBJxlrfpms_dqzqzLYK9mrX1G_KNLoggSSVucXuzfLBFEp
 Jcf4aDhOGXBunxqSIlZV.9qZekemJ_UQcYhA8R6AjwMxBvJeaN98BQQQi634lMqh48BzpP0MCgwD
 LgmNlS.miO.DITJnkg7OPsCq4VUVblszhWczey3jd0ycOK3BXKjoL3Te3qaiHj_dUpj_DRzo4w0x
 uSlVlZfxXzOs6e1JhfY1wT_hP6Kq4oOT9ouxFC7HT7lKHx5xrvtxG.D2pFhcP4y2GOhBEpfOQGGU
 oQVPW11tptItyC8CRZpCHGryFkbDGRa5gFutUNjzAXzTCfqHDR_cS_Hx.rCjaCe6DVwFL1oQxbgQ
 RAFiIGPGboxXRf5pfHN3iwjALqm4Eoc7p1ikHadRswAby
X-Sonic-MF: <eduardo.f120@yahoo.com>
X-Sonic-ID: e851b2d2-7e49-432f-91e5-251fd22a85b1
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Fri, 6 Mar 2026 19:55:24 +0000
Received: by hermes--production-bf1-697f88457-zqdkn (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d858b2a1bf6ed57d77ca42b0bedaf3d4;
          Fri, 06 Mar 2026 19:55:19 +0000 (UTC)
From: Eduardo Ferreira <eduardo.f120@yahoo.com>
Date: Fri, 06 Mar 2026 16:55:05 -0300
Subject: [PATCH v2] go 1.22.12: Fix CVE-2025-61726.patch variable ordering
MIME-Version: 1.0
Message-Id: <20260306-fix-cve-61726-patch-ordering-v2-1-410fea740c2a@toradex.com>
X-B4-Tracking: v=1; b=H4sIABgxq2kC/43NQQ6CMBCF4auYWTumrVjAlfcwLOp0gC6kpCUNh
 nB3R07g8n+ZfLNB5hQ4w/20QeIScoiThDmfgEY3DYzBS4NRxqqrstiHFakwWl0bi7NbaMSYvCj
 TgC9yptEV+b5yIMScWO4P/tlJjyEvMX2Ob0X/1j/holFjZevWqJasb24PcZzn9ULxDd2+71+VT
 TsSygAAAA==
X-Change-ID: 20260306-fix-cve-61726-patch-ordering-bca2814cdf4a
To: openembedded-core@lists.openembedded.org
Cc: Eduardo Ferreira <eduardo.barbosa@toradex.com>, 
 Michael Pratt <mpratt@google.com>, Deepak Rathore <deeratho@cisco.com>
X-Mailer: b4 0.14.3
References: <20260306-fix-cve-61726-patch-ordering-v2-1-410fea740c2a.ref@toradex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 20:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232591

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
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20260306-fix-cve-61726-patch-ordering-v1-1-4679209c6d85@toradex.com
---
 meta/recipes-devtools/go/go/CVE-2025-61726.patch | 25 ++++++++++++------------
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

---
base-commit: a9a785d7fa0cfe2a9087dbcde0ef9f0d2a441375
change-id: 20260306-fix-cve-61726-patch-ordering-bca2814cdf4a

Best regards,
-- 
Eduardo Ferreira <eduardo.barbosa@toradex.com>


