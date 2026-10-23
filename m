Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3157.1792748016125528739
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 02:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BgNZXkk/;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3598; q=dns/txt;
  s=iport01; t=1792748016; x=1793957616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S+AbpjFlnweKAkImhqGh9pZIpCqar8+gd86utumaLxI=;
  b=BgNZXkk/ToJrplAEM3mUnb197JHIiNvQgYMEIuNJLVOpXJs8ibgqwIx6
   kvsOHhhbgKpFtkXxo8MffnPhXFC69qZd7aVLazM2E8aVw0b1uI/T3bSIa
   ERz0JBnMgQC2v4n/sYVxfdqTdmEzMKKl7JBQvpltAqewg5B/qy3UKm+XY
   52zbuWFZEYQLc0Vu0kUDiPZKooyDaDYsWVhrt/pVpDqq7Rm4d0aMaIRJc
   nkLWNLyluJWSoUV2DVuCIddGTQ1ocWII2TTjfVw2w8Z1eUeci6VZ6YNsP
   CuY/l4RLibV92ozwsorWRUTxyYLu6QJPPsoMWIFqHjgxhjMzm5iFAdQXi
   w==;
X-CSE-ConnectionGUID: nhHahPTsR8Sk0L0YDebXmg==
X-CSE-MsgGUID: qIbm68MTTK6BTW4+90CTCg==
X-IPAS-Result: =?us-ascii?q?A0BIAgBDKdtq/4r/Ja1aglmCV3VgQ0mWSwOeHIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAMRBrV5GzeBeTOBA?=
 =?us-ascii?q?YMpAT8CAkABUNsyAQsUAYE4hUCII10YAYR8JxsbgXKEfoEFgVwCAYgkBIIie?=
 =?us-ascii?q?hKBWh6NbgKGc0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdg?=
 =?us-ascii?q?R6BFiMZNmuBCV2BKylgASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBE?=
 =?us-ascii?q?xouC4EaODwJJkEVDGYLGgViCAINDH85EB8YDUgRLDcVGQQ+bgeRb4MKAWEaE?=
 =?us-ascii?q?wEpAoIsEZMmkj+hDwoog3aMIpU6GjOqbwuYfY4KllCEaYFoPIFZcBWDIgkWN?=
 =?us-ascii?q?BkPjjmDa4ZAyBonMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:W7xuYaAiAgycPhVW/0fiw5YqxClBgxIJ4kV8jS/XYbTApGtxhWEAy
 WcYCmnUOKnfZWHxc9knOdy19U4CvMDcnYVqOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQf/gGYoWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TExfVOBUEOAZYiqt10WUUWx
 NAVIgAIYUXW7w626OrTpuhEnM8vKozveYgYoHwllWifBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGE/BPjDS0Un1lM/BJEzmO6pl3DXeDxDo1XTrq0yi4TW5FEqgeO9aoGNKrRmQ+1Mv0yd+
 DLjw1jaXDsmC4DcmGKuzlmj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQiG+DtxgaHdFXFeIz7CmWz6vQ7kCXHAA5oiVpctcqsooyADctz
 FLMx4qvDj10u7rTQnWYnluJkQ6P1eEuBTdqTUc5ocEturEPfKlbYsrzc+te
IronPort-HdrOrdr: A9a23:y0jPWq0trVHCA1nTHo1/2QqjBJAkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3A6kzLM2i96BODefarCjWSjeuGsTJudH39xXfoH1S?=
 =?us-ascii?q?CWV1qEJnNeHOd8pNhnJ87?=
X-Talos-MUID: 9a23:CRrHKAk/GvZbr8izEpZidnp7Fc1tvfSLNHwuz786hJXHZHRbBxyS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,174,1787011200"; 
   d="scan'208";a="539382308"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Oct 2026 09:33:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 13CCC1800032A;
	Fri, 23 Oct 2026 09:33:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id AD9E4CBF204; Fri, 23 Oct 2026 02:33:34 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH v2 4/5] curl: fix CVE-2026-82208
Date: Fri, 23 Oct 2026 02:33:30 -0700
Message-Id: <20261023093331.1886272-5-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261023093331.1886272-1-dkelaiya@cisco.com>
References: <20261023093331.1886272-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 09:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248492
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/curl/curl/commit/ed0338befd1d865a8ea1fbaa90013a096dedd07a
[2] https://curl.se/docs/CVE-2026-82208.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
Changes in v2:
- Explain that curl 8.19.0 already supplies char * from data->set.str;
  upstream supplies const char * from CURL_EASY_STR.
- Clarify that the ECH call and error handling are unchanged and
  both store-setup security hunks are retained.
---
 .../curl/curl/CVE-2026-82208.patch            | 54 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-82208.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-82208.patch b/meta/recipes-support/curl/curl/CVE-2026-82208.patch
new file mode 100644
index 0000000000..1ff3794c17
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-82208.patch
@@ -0,0 +1,54 @@
+From ed0338befd1d865a8ea1fbaa90013a096dedd07a Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Wed, 26 Aug 2026 13:46:13 +0200
+Subject: [PATCH] wolfssl: do not run Curl_wssl_setup_x509_store() twice
+
+The flag preventing a rerun was not set when a cached_store
+was used.
+
+CURL_UNCONST an ech string for my old wolfssl version
+
+Closes #22689
+
+CVE: CVE-2026-82208
+Upstream-Status: Backport [https://github.com/curl/curl/commit/ed0338befd1d865a8ea1fbaa90013a096dedd07a]
+
+Backport Changes:
+- Omitted CURL_UNCONST(b64val) in wolfSSL_SetEchConfigsBase64(). In
+  curl 8.19.0, b64val is already char * from
+  data->set.str[STRING_ECH_CONFIG]; upstream uses const char * from
+  CURL_EASY_STR. The old pointer already matches the wolfSSL argument
+  type, so the ECH call and error handling need no change.
+
+(cherry picked from commit ed0338befd1d865a8ea1fbaa90013a096dedd07a)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/vtls/wolfssl.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/lib/vtls/wolfssl.c b/lib/vtls/wolfssl.c
+index 74bd247..fdf33a8 100644
+--- a/lib/vtls/wolfssl.c
++++ b/lib/vtls/wolfssl.c
+@@ -597,9 +597,6 @@ static CURLcode wssl_populate_x509_store(struct Curl_cfilter *cf,
+   bool imported_native_ca = FALSE;
+   bool imported_ca_info_blob = FALSE;
+ 
+-  /* We do not want to do this again, no matter the outcome */
+-  wssl->x509_store_setup = TRUE;
+-
+ #ifndef NO_FILESYSTEM
+   /* load native CA certificates */
+   if(ssl_config->native_ca_store) {
+@@ -802,6 +799,9 @@ CURLcode Curl_wssl_setup_x509_store(struct Curl_cfilter *cf,
+   WOLFSSL_X509_STORE *cached_store;
+   bool cache_criteria_met;
+ 
++  /* We do not want to do this again, no matter the outcome */
++  wssl->x509_store_setup = TRUE;
++
+   /* Consider the X509 store cacheable if it comes exclusively from a CAfile,
+      or no source is provided and we are falling back to wolfSSL's built-in
+      default. */
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 096e27570c..e8e4a7e998 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -45,6 +45,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-80255-dependent_p1.patch \
            file://CVE-2026-80255-dependent_p2.patch \
            file://CVE-2026-80255.patch \
+           file://CVE-2026-82208.patch \
            file://CVE-2026-80230.patch \
            "
 
-- 
2.35.6

