Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4449.1793777792288252086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 23:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KdPN9mtw;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4075; q=dns/txt;
  s=iport01; t=1793777792; x=1794987392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yw+weWoz43mjezmGSJXO2/jK5SrsfGkuNxHW2U11OXk=;
  b=KdPN9mtww7Gln3q6rPqtPAJLz8hQWOOGvxPSo0FM8CV2M2PuHRANMF+S
   kz/UcRgo8XVORzQvZoQQJPc+0rkAZ5l2b0MRQtTzaCX8OyYD+4xfMPyxf
   iAekWZzS3JUSKmNpp+h4nWUl3y/Fn/0ErebpAg+bzZVTmmQ99CZmazJLz
   6Z972rsX5W+OAAeqjTL1H2FyIsYLtWDrLicdY0xeOGHHB8T40bZE4cUp6
   ZvR56XhtLO7jRa2ePmY636Py+KPrApsRCeFagRNdT/ML3uJH5io3TyM4n
   iR7X6brl5Cq2mIw5TCUdTmueuByjRQGeDFl4e2bC+1ZHMpqcQzfJW7T17
   w==;
X-CSE-ConnectionGUID: +KkSoW2DQ7+ACcm/zm0zRg==
X-CSE-MsgGUID: fxD0WNZITE+dbgRQGOrZlQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgDZ3+pq/4//Ja1aHgEBCxIMggULgld1YENJlksDn?=
 =?us-ascii?q?iAUgWoPAQEBD0QNBAEBhQUCjhwCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AxEGu?=
 =?us-ascii?q?XobN4F5M4EBgykBPwICQAFQ2zMBCxQBgTiFQIgjXRgBhH0nGxuBcoEVg2mBB?=
 =?us-ascii?q?YFcAgGBRoZfBIIigQyBWh6MfQKIQkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBBxsGBYEdgR6BEoEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDE?=
 =?us-ascii?q?kckIggSCQETGiwKgRo1PAkmPxUMZgsaBWEIAg0MdDkQMB4kLwUcJkAbChQYD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeSLYMKB1kILQEpAQGCPSmSe5JBoREKKIN4jCSVOhozqnELm?=
 =?us-ascii?q?H2OCpYETYRpgWg8gVlwFYMiCRY0GQ+OOYNrhkDIGyYyAgkyAQEHAgcOAwuBa?=
 =?us-ascii?q?JF+AQE?=
IronPort-Data: A9a23:WRHdn6AFwTtiUhVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDgjg2YFy
 GJMXTyFbvaNZjOmf4x3bomyp0MEsMLWz4RiOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb9gGYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEgNZtN0YJZ6EhpaVeKmpLs
 u4dcCI3YUXW7w626OrTpuhEnM8vKozveYgYoHwllW+fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY0BPjDS0Un1lM/BJEzmO6pl3DXeDxDo1XTrq0yi4TW5FEti+Cya4aLJrRmQ+1bjmrAm
 UT03ljUQR0QO+am5h2fwHaV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KKpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:SPoyD63xcoaAg6hfFcc5jwqjBJAkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: 9a23:t5Msc2Cyq682gbv6E2pE93UTJZoJSyKe5VzbJgiqDD57crLAHA==
X-Talos-MUID: 9a23:el513Qvafc5Ob4hhDc2niiFObPhO0YWSJQMBm5o8guajLx50AmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,194,1787011200"; 
   d="scan'208";a="543073464"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 07:36:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 21683180003AC;
	Wed,  4 Nov 2026 07:36:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id BCB0DCBF202; Tue,  3 Nov 2026 23:36:30 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 02/12] curl: fix CVE-2026-86409
Date: Tue,  3 Nov 2026 23:36:17 -0800
Message-Id: <20261104073627.302002-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261104073627.302002-1-dkelaiya@cisco.com>
References: <20261104073627.302002-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249336
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Clear CURLAUTH_AWS_SIGV4 when CURLOPT_AWS_SIGV4 is reset to NULL.
Retain the upstream handle-reuse regression in test1978, using the
existing test_setopt() helper.

[1] https://github.com/curl/curl/commit/c3c70440e8d9938c0bb732595751e8aebc614f24
[2] https://curl.se/docs/CVE-2026-86409.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-86409.patch            | 88 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86409.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-86409.patch b/meta/recipes-support/curl/curl/CVE-2026-86409.patch
new file mode 100644
index 00000000000..bdfee79dc6a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-86409.patch
@@ -0,0 +1,88 @@
+From 534252a345be58d6d1a79eee697244f27524b7d2 Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Wed, 26 Aug 2026 09:41:03 +0200
+Subject: [PATCH] setopt: make NULL `CURLOPT_AWS_SIGV4` disable aws-sigv4 auth
+
+Disable `CURLAUTH_AWS_SIGV4` when `CURLOPT_AWS_SIGV4` is set to NULL.
+Syncing behavior with `CURLAUTH_HTTPSIG`.
+
+Reported-by: Stanislav Fort
+
+Closes #22681
+
+CVE: CVE-2026-86409
+Upstream-Status: Backport [https://github.com/curl/curl/commit/c3c70440e8d9938c0bb732595751e8aebc614f24]
+
+Backport Changes:
+- Use test_setopt() in lib1978.c instead of easy_setopt(), matching
+  the curl 8.19.0 test harness.
+
+(cherry picked from commit c3c70440e8d9938c0bb732595751e8aebc614f24)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/setopt.c            |  2 ++
+ tests/data/test1978     | 19 +++++++++++++++++++
+ tests/libtest/lib1978.c |  5 +++++
+ 3 files changed, 26 insertions(+)
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index 3603912..ae77ae8 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -1992,6 +1992,8 @@ static CURLcode setopt_cptr(struct Curl_easy *data, CURLoption option,
+      */
+     if(s->str[STRING_AWS_SIGV4])
+       s->httpauth = CURLAUTH_AWS_SIGV4;
++    else
++      s->httpauth &= ~(uint32_t)CURLAUTH_AWS_SIGV4;
+     break;
+ #endif
+   case CURLOPT_REFERER:
+diff --git a/tests/data/test1978 b/tests/data/test1978
+index 3ad4c67..8b6e6af 100644
+--- a/tests/data/test1978
++++ b/tests/data/test1978
+@@ -69,6 +69,25 @@ header-no-value:
+ header-some-no-value:
+ header-some-no-value: value
+ 
++PUT /%TESTNUMBER/testapi/test HTTP/1.1
++Host: 127.0.0.1:9000
++x-amz-meta-test: test2
++some-other-header: value
++x-amz-meta-test: test1
++duplicate-header: duplicate
++x-amz-meta-test: test3
++X-amz-meta-test2: test2
++x-amz-meta-blah: blah
++x-Amz-meta-test2: test1
++x-amz-Meta-test2: test3
++curr-header-no-colon: value
++next-header-no-colon: value
++duplicate-header: duplicate
++header-no-value:
++header-no-value:
++header-some-no-value:
++header-some-no-value: value
++
+ </protocol>
+ </verify>
+ </testcase>
+diff --git a/tests/libtest/lib1978.c b/tests/libtest/lib1978.c
+index 4f3ef11..d3f5c7d 100644
+--- a/tests/libtest/lib1978.c
++++ b/tests/libtest/lib1978.c
+@@ -91,6 +91,11 @@ static CURLcode test_lib1978(const char *URL)
+   test_setopt(curl, CURLOPT_CONNECT_TO, connect_to);
+ 
+   result = curl_easy_perform(curl);
++  if(result)
++    goto test_cleanup;
++
++  test_setopt(curl, CURLOPT_AWS_SIGV4, NULL);
++  result = curl_easy_perform(curl);
+ 
+ test_cleanup:
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 9b28b9d7c98..be140ccc485 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -49,6 +49,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-80230.patch \
            file://CVE-2026-80231.patch \
            file://CVE-2026-86414.patch \
+           file://CVE-2026-86409.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
