Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1218.1793949576373352610
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 23:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TFphk3AF;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5544; q=dns/txt;
  s=iport01; t=1793949576; x=1795159176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oYK51aEoqVivrGSVe96twsA3mkOrXyOfAMm2GxWTMFI=;
  b=TFphk3AFnhY1Gje3xHSU2TKC6vrmM5cXFwK+3/dCsIz+b7X19BaCiCQd
   MMoChFWYWs6pYIpV24lYIKjoSlhrEuY66mNZKtaW3t4QfRe8sAdHvQSWV
   EnyVqtPndsRHZ1SQE1ocak8Y5J11NfZvxYXwKDVPzKjLTkMY1Qo6n4gxK
   s5ZOu7KZZXgk2OjP1ewE/7oDQHGxQflzzeEkixksaQpGuN5453pvwINr/
   Idch4Dy/wVwPM1F+5h1LDwuVWHUlq1vinZ12fGSD4FbxliJhMEr3T0Xfd
   f6JeQ8khnsNN4+hHVGwLNFZlcgnmdXPAQW5V1QuhYXbBzKoKObsedPjdq
   Q==;
X-CSE-ConnectionGUID: XfKW1LUCRd6eSgaMFKykrA==
X-CSE-MsgGUID: DirHQHC+QTe8oe83INOSNQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgBrfu1q/5H/Ja1aglmCV3VgQ0mWSwOeIRSBag8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQDEQa7Oxs3gXkzg?=
 =?us-ascii?q?QGDKQE/AgJAAVDbMwELFAGBOIVAiCNdGAGEfScbG4FygRWDaYEFgVwCAYFGh?=
 =?us-ascii?q?l8EgiKBDIFaHm6FNIZYAoFRhnlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?CIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+GwovGA1IE?=
 =?us-ascii?q?Sw3FRkEPm4Hkj2DEgEwMC0BKQEBBIEWgRIRKRGSRicHkjehEQoog3iMJJU6G?=
 =?us-ascii?q?jOEBKZtC5h9glmLMZV0XYRpgWg8gVlwFYMiCRY0GQ+OLgsLg2CGQMYFJjICC?=
 =?us-ascii?q?TIBAQcCBw4DC4FokAAsgVIBAQ?=
IronPort-Data: A9a23:bg2sVKoh2/m7Wg/YjnZOsImJXEleBmJJZBIvgKrLsJaIsI4StFCzt
 garIBnSbKyCYjD3KIojPN7n8hsA6pLXmtFqHQZlr303Eiwb9ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8E435ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0tZ5Il4X0
 cEzEjxTYyuMjseY46O4UMA506zPLOGzVG8ekmtrwTecCbMtRorOBv2ao9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVfrSn8/w7pX7WzFbpVacpLs+y2PS1wd2lrPqNbI5f/TXHpsFxxrI+
 TKuE2LRLhAAFOW/4nm8zn/8geKfxgLdf7k0LejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZOJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:qBBY16P6N2mEzMBcTuOjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IHjJ7MHd3ATV0mmhD0JczqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3AdZloPWr14h1sZZzbHUcOgX7mUfArUUKE6Er7GUP?=
 =?us-ascii?q?mBF1mQZi7ak6T4ooxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A1oUJXg6e/2KGtWz/v4FRkugaxoxE4r6OMWAm0qw?=
 =?us-ascii?q?6tpmDOHwrGhG6txKOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="536814878"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 07:19:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 4B77A180001DB;
	Fri,  6 Nov 2026 07:19:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id E94D0CBF203; Thu,  5 Nov 2026 23:19:34 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 3/9] curl: fix CVE-2026-86410
Date: Thu,  5 Nov 2026 23:19:26 -0800
Message-Id: <20261106071932.490299-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106071932.490299-1-dkelaiya@cisco.com>
References: <20261106071932.490299-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 07:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249599
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Install SSH host verification options before following redirects from
other protocols. The missing-file fallback keeps ordinary HTTP usable
when no known_hosts file exists. Adapt the older findfile() ownership
path.

The omitted test1679 hunk only filters a generated
CURLOPT_SSH_KNOWNHOSTS line. The SSL reset test and its data1679.c
fixture were introduced after curl 8.19.0 by [3]; they do not exercise
SSH redirects. The older --libcurl comparisons already filter this
option.

[1] https://github.com/curl/curl/commit/6ae9befb2fb6bdfdb5fc11fdf76bbe519fe1f52c
[2] https://curl.se/docs/CVE-2026-86410.html
[3] https://github.com/curl/curl/commit/19d0f4acfa9df373e8e1f987c11b7165e1edac34

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-86410.patch            | 102 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86410.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-86410.patch b/meta/recipes-support/curl/curl/CVE-2026-86410.patch
new file mode 100644
index 0000000000..1f15da547b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-86410.patch
@@ -0,0 +1,102 @@
+From 6ae9befb2fb6bdfdb5fc11fdf76bbe519fe1f52c Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sat, 5 Sep 2026 15:55:58 +0200
+Subject: [PATCH] config2setopts: always set the security options for SCP/SFTP
+
+If the protocols are built-in
+
+Closes #22839
+
+CVE: CVE-2026-86410
+Upstream-Status: Backport [https://github.com/curl/curl/commit/6ae9befb2fb6bdfdb5fc11fdf76bbe519fe1f52c]
+
+Backport Changes:
+- Use curl 8.19.0's directly owned findfile() result. Add the
+  missing-file fallback when that result is NULL; upstream places
+  it after a newer temporary-path copy branch.
+- Omit test1679's stripfile update. Test1679 and data1679.c were
+  introduced by [1] after curl 8.19.0 and are absent here. They check
+  SSL option resets across --next in generated --libcurl output.
+  The omitted line only strips CURLOPT_SSH_KNOWNHOSTS from that
+  comparison; it does not exercise SSH redirects.
+  Existing --libcurl tests already filter that option.
+
+[1] https://github.com/curl/curl/commit/19d0f4acfa9df373e8e1f987c11b7165e1edac34
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/config2setopts.c | 34 +++++++++++++++++++++++-----------
+ 1 file changed, 23 insertions(+), 11 deletions(-)
+
+diff --git a/src/config2setopts.c b/src/config2setopts.c
+index 20d87a0..27ca721 100644
+--- a/src/config2setopts.c
++++ b/src/config2setopts.c
+@@ -178,12 +178,11 @@ static CURLcode url_proto_and_rewrite(char **url,
+   return result;
+ }
+ 
+-static CURLcode ssh_setopts(struct OperationConfig *config, CURL *curl,
+-                            const char *use_proto)
++static CURLcode ssh_setopts(struct OperationConfig *config, CURL *curl)
+ {
+   CURLcode result;
+ 
+-  if(use_proto != proto_scp && use_proto != proto_sftp)
++  if(!proto_scp && !proto_sftp)
+     return CURLE_OK;
+ 
+   /* SSH and SSL private key uses same command-line option */
+@@ -204,8 +203,27 @@ static CURLcode ssh_setopts(struct OperationConfig *config, CURL *curl,
+ 
+   if(!config->insecure_ok) {
+     char *known = config->knownhosts;
+-    if(!known)
++    if(!known) {
+       known = findfile(".ssh/known_hosts", FALSE);
++      if(!known && !config->hostpubmd5 && !config->hostpubsha256) {
++        /* couldn't find an existing one, instead set one that MIGHT work as
++           we don't verify the host using other means */
++        struct dynbuf k;
++        char *home = getenv("HOME");
++        curlx_dyn_init(&k, 256);
++
++        /* If the HOME environment variable is missing this renders a path
++           that is likely to not work but the HOME one also does not exist!
++        */
++        result = curlx_dyn_addf(&k,
++                                "%s" DIR_CHAR ".ssh" DIR_CHAR "known_hosts",
++                                home ? home : "");
++        if(result)
++          return result;
++        known = curlx_dyn_ptr(&k);
++      }
++    }
++
+     if(known) {
+       result = my_setopt_str(curl, CURLOPT_SSH_KNOWNHOSTS, known);
+       if(result) {
+@@ -216,12 +234,6 @@ static CURLcode ssh_setopts(struct OperationConfig *config, CURL *curl,
+       /* store it in global to avoid repeated checks */
+       config->knownhosts = known;
+     }
+-    else if(!config->hostpubmd5 && !config->hostpubsha256) {
+-      errorf("Could not find a known_hosts file");
+-      return CURLE_FAILED_INIT;
+-    }
+-    else
+-      warnf("Could not find a known_hosts file");
+   }
+   return CURLE_OK; /* ignore if SHA256 did not work */
+ }
+@@ -928,7 +940,7 @@ CURLcode config2setopts(struct OperationConfig *config,
+   MY_SETOPT_STR(curl, CURLOPT_KEYPASSWD, config->key_passwd);
+   MY_SETOPT_STR(curl, CURLOPT_PROXY_KEYPASSWD, config->proxy_key_passwd);
+ 
+-  result = ssh_setopts(config, curl, use_proto);
++  result = ssh_setopts(config, curl);
+   if(setopt_bad(result))
+     return result;
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 9fd78a0fd8..e5b9203678 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -62,6 +62,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-87865_p2.patch \
            file://CVE-2026-92391.patch \
            file://CVE-2026-87863.patch \
+           file://CVE-2026-86410.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
