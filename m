Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4378.1793777792173650437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 23:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WfcO5z6B;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2820; q=dns/txt;
  s=iport01; t=1793777792; x=1794987392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G0QuiXYK6zGn6Uq72mYYVRdt7Ey5/MSbHoM0oY55xeA=;
  b=WfcO5z6Bp2/FuSPwxWG0MTXDvslgQwuLdXsxp65v7Caee/1TAPCfTeIe
   KOx90/bevlIfpWnhoBOa1Ff4+dXS5zvwxE2TkSLk87G3eeg0VhJzeRu0e
   2+AGeTXeTxzSs+/pCwm2htjwN77GJg7QKpCd3iSig0PoNqn3+J61GxTGM
   wtpmu8QLXCzeXRzUckpfWcXFUkpuVsKM4PK4NaLWUzWzZPEMxFjIRYrvv
   5xLtuRiVVR8RCXYgjtmntFAYaK7aKLIusdBKkqKhd+/hVPD4doUt27B6G
   WyMK1d3OqvT8vvnC5SIa0mGBstFzNaXx5LmHEJ8Q9HLYyhhi0ysw1GLrh
   w==;
X-CSE-ConnectionGUID: fei6qAxQQPC+TyBC8inO+A==
X-CSE-MsgGUID: /AInLt+PScKaAzEvWqVudA==
X-IPAS-Result: =?us-ascii?q?A0BIAgDZ3+pq/5P/Ja1aglmCV3VgQ0mWSwOeIIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4cAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAMRBrl6GzeBeTOBA?=
 =?us-ascii?q?YMpAT8CAkABUNszAQsUAYE4hUCII10YAYR9JxsbgXKEfoEFgVwCAYEmgQaFe?=
 =?us-ascii?q?QSCIoEMgVoejH0CiEJIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbB?=
 =?us-ascii?q?gWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBE?=
 =?us-ascii?q?xosCoEaNTwJJj8VDGYLGgVhCAINDHQ5EDAeJC8FHCZAGwoUGA1IESw3FRkEP?=
 =?us-ascii?q?m4Hki2DEQFgLQEpAoIFLQgDpWWhEQoog3iMJJU6GjOqcQuYfY4KllGEaYFoP?=
 =?us-ascii?q?IFZcBWDIgkWNBkPjjmDa4ZAyBsmMgIJMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:6Af0P64wgNXyzCvTzqdvlgxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mNNWD+PPfvYazenKd8jYInno0IE7ZfVnIdiSgE9rSAxZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztMsPrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eM4AZpP9eEVh3z
 ddbFCEnRUCCgcX16efuIgVsrpxLwMjDJogTvDRkiDreF/tjGMiFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEQUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGIeJIYfRGJ0NxC50o
 EqB1kX/Jg1ZDOeU6jOs4F+yufbxgC/SDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFcCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3uz8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:A3KP86G2AIb+gOw3pLqEyseALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: 9a23:o12I4m3K8N3tK/reLAMr+rxfFM0kLGT03E7pG2T7NXdDY+2UT3jT0fYx
X-Talos-MUID: 9a23:Fkbe+gWnRGWX2dPq/HjFpTdGKIRQ2K+NAWkfvIs5oveZOQUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,194,1787011200"; 
   d="scan'208";a="543335002"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 07:36:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 801EA18000241;
	Wed,  4 Nov 2026 07:36:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id D2683CBEF8A; Tue,  3 Nov 2026 23:36:30 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 07/12] curl: fix CVE-2026-107928
Date: Tue,  3 Nov 2026 23:36:22 -0800
Message-Id: <20261104073627.302002-8-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261104073627.302002-1-dkelaiya@cisco.com>
References: <20261104073627.302002-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249339
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Reject a GnuTLS send result larger than the supplied buffer before
advancing the buffer pointer or subtracting the remaining length.
The advisory's trigger requires GnuTLS and WebSockets.

[1] https://github.com/curl/curl/commit/64fb3e7a7b116f690966054f281624152d4a7651
[2] https://curl.se/docs/CVE-2026-107928.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-107928.patch           | 40 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-107928.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-107928.patch b/meta/recipes-support/curl/curl/CVE-2026-107928.patch
new file mode 100644
index 00000000000..67f66f097ca
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-107928.patch
@@ -0,0 +1,40 @@
+From 64fb3e7a7b116f690966054f281624152d4a7651 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Wed, 7 Oct 2026 11:22:39 +0200
+Subject: [PATCH] gnutls: hardening
+
+Check the result code of `gnutls_record_send()` for sanity also in
+production builds.
+
+Closes #23297
+
+CVE: CVE-2026-107928
+Upstream-Status: Backport [https://github.com/curl/curl/commit/64fb3e7a7b116f690966054f281624152d4a7651]
+
+(cherry picked from commit 64fb3e7a7b116f690966054f281624152d4a7651)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/vtls/gtls.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
+index f19940a..b87b27d 100644
+--- a/lib/vtls/gtls.c
++++ b/lib/vtls/gtls.c
+@@ -2064,8 +2064,13 @@ static CURLcode gtls_send(struct Curl_cfilter *cf,
+     nwritten = gnutls_record_send(backend->gtls.session, buf, remain);
+ 
+     if(nwritten >= 0) {
++      if((size_t)nwritten > remain) {
++        DEBUGASSERT(0);
++        failf(data, "gnutls_record_send(len=%zu) returned %zd",
++              remain, nwritten);
++        return CURLE_SEND_ERROR;
++      }
+       *pnwritten += (size_t)nwritten;
+-      DEBUGASSERT((size_t)nwritten <= remain);
+       buf = (char *)CURL_UNCONST(buf) + (size_t)nwritten;
+       remain -= (size_t)nwritten;
+     }
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 3e804a26f3a..9a85d470dc5 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -55,6 +55,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-86412.patch \
            file://CVE-2026-92386_p1.patch \
            file://CVE-2026-92386_p2.patch \
+           file://CVE-2026-107928.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
