Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4376.1793777792133403964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 23:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=i66/pNjx;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3448; q=dns/txt;
  s=iport01; t=1793777792; x=1794987392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w286nHn+9z5T97dX/D4zr9DN3M8ZPsnacoq9hdSjeAg=;
  b=i66/pNjxusx5Y/COc/Jozft/o5nkntzneCuOSgZqc/mG/mVJ5wbDaFMa
   1pzXNFLcSPdBxpWxTtCL4RVD0eRUulpDt6Lg20X/c17CGADXtj9/JDGKg
   WXH3LrMl0tOQe9YebHUy0bIti2tgBoI5sn64tkj7WDLTir+A2m4vtlIg6
   tGlvI+NNi1pGTy4amoepF7fBverWNiI0hzmi+z5jLPHUjs8+M5xgatTVS
   daj0yk2LdfXFy+nYZJ6UIrE9a+HKVxY95aTaRL2vSMGTkWofN1eVEIfxf
   IEQ4Y2tjFJOTmkO1lWtSDpurfDm998l0YRouqFRvkXK2fredZUbuqySS2
   g==;
X-CSE-ConnectionGUID: ubCcraziS5eKv+pr39i1eQ==
X-CSE-MsgGUID: 7BxWUecYQPGjgss0yCjXmg==
X-IPAS-Result: =?us-ascii?q?A0BJAgDZ3+pq/4v/Ja1aglmCV3VgQ0mWSwOeIBSBag8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOHAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAhYZKyMIGYMCAYJ0AxEGuXobN4F5M?=
 =?us-ascii?q?4EBgykBPwICQAFQ2zMBCxQBgTiFQIgjXRgBhH0nGxuBcoEVg2mBBYFcAgGBG?=
 =?us-ascii?q?IEGhgcEgiKBDIFaHox9AohCSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F?=
 =?us-ascii?q?4EHGwYFgR2BHoESgQddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiC?=
 =?us-ascii?q?BIJARMaLAqBGjU8CSY/FQxmCxoFYQgCDQx0ORAwHiQvBRwmQBsKFBgNSBEsN?=
 =?us-ascii?q?xUZBD5uB5ItgxEBYC0BKQKCBS4KkyaSP6ERCiiDeIwklToaM6pxC5h9jgqWA?=
 =?us-ascii?q?k+EaYFoPIFZcBWDIgkWNBkPjjmDa4ZAyBsmMgIJMgEBBwIHDgMLgWiRHmABA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:Sl5IbKmVInPHFSinsoCe29To5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcDWjUPf2OamWgeN8iOt+08UwB6pTQyoc1QQBkqygwQVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs/nb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZAS0e1tCHNPz
 qEVCy5OdgrY1uPvzYvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaz/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKIJofbGZoLxRzwS
 mTuoE7pPSwXP+2m8RWH/Wm33v7knxP+V9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:Hs52taAhySsVCujlHemO55DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: 9a23:u7xkumFvoT2e70FNqmJ6/mUfAMk3c0aAwVTOYFeiUjdoEbCsHAo=
X-Talos-MUID: 9a23:eP+itghaI3trBMTeR6upbcMpa+143JmjA3E0qboEtNKfbT1bOQeYg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,194,1787011200"; 
   d="scan'208";a="543947632"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 07:36:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 821F018000211;
	Wed,  4 Nov 2026 07:36:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id D61D9CBEF98; Tue,  3 Nov 2026 23:36:30 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 08/12] curl: fix CVE-2026-87864
Date: Tue,  3 Nov 2026 23:36:23 -0800
Message-Id: <20261104073627.302002-9-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261104073627.302002-1-dkelaiya@cisco.com>
References: <20261104073627.302002-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249340
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Determine the IMAP APPEND length after configuring all upload
readers. Reject uploads whose final length becomes unknown because
of CRLF conversion before sending the APPEND command.

[1] https://github.com/curl/curl/commit/3b547de301342b347fb3c6ea6ae7979070793a66
[2] https://curl.se/docs/CVE-2026-87864.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-87864.patch            | 55 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87864.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-87864.patch b/meta/recipes-support/curl/curl/CVE-2026-87864.patch
new file mode 100644
index 00000000000..0effc5ac8ac
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-87864.patch
@@ -0,0 +1,55 @@
+From 3b547de301342b347fb3c6ea6ae7979070793a66 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Thu, 27 Aug 2026 09:47:53 +0200
+Subject: [PATCH] imap: APPEND CRLF fix
+
+Deny an APPEND operation with CRLF conversion requested as we are unable
+to predict the final upload size and APPEND requires us to announce it
+before starting the upload.
+
+The check for unknown sizes had already been there, but the crlf
+conversion that renders a known size unknown was not accounted for.
+
+Closes #22702
+
+CVE: CVE-2026-87864
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3b547de301342b347fb3c6ea6ae7979070793a66]
+
+(cherry picked from commit 3b547de301342b347fb3c6ea6ae7979070793a66)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/imap.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/lib/imap.c b/lib/imap.c
+index 0546595..f37568f 100644
+--- a/lib/imap.c
++++ b/lib/imap.c
+@@ -884,7 +884,6 @@ static CURLcode imap_perform_append(struct Curl_easy *data,
+       result = Curl_creader_set_mime(data, postp);
+     if(result)
+       return result;
+-    data->state.infilesize = Curl_creader_client_length(data);
+   }
+   else
+ #endif
+@@ -894,9 +893,15 @@ static CURLcode imap_perform_append(struct Curl_easy *data,
+       return result;
+   }
+ 
+-  /* Check we know the size of the upload */
++  /* Check we know the size of the upload. This takes all readers
++   * into account. Especially crlf conversions which make the size
++   * unpredictable, e.g. -1. */
++  data->state.infilesize = Curl_creader_total_length(data);
+   if(data->state.infilesize < 0) {
+-    failf(data, "Cannot APPEND with unknown input file size");
++    if(data->set.crlf)
++      failf(data, "Cannot APPEND with CRLF conversion making size unknown");
++    else
++      failf(data, "Cannot APPEND with unknown input file size");
+     return CURLE_UPLOAD_FAILED;
+   }
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 9a85d470dc5..e039207a0e4 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -56,6 +56,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-92386_p1.patch \
            file://CVE-2026-92386_p2.patch \
            file://CVE-2026-107928.patch \
+           file://CVE-2026-87864.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
