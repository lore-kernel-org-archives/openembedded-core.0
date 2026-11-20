Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5427.1795179859308749116
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:04:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=De3rqEZE;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4523; q=dns/txt;
  s=iport01; t=1795179859; x=1796389459;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=QD1D2tJvy5dSZCcvnG44frkDu+/NA12O/aE6TG6nHBo=;
  b=De3rqEZEctxSnOQO1zrPEHfxSOesivwYfu8Q4//axYtEk9qoojZ6IJ8E
   pMejc4YIs1HSPjuIb0+cfMZoEINR65xMqRG2jSpqmLv+/51YuOQUa8Ehc
   Pm8Wld1h74zxFi45+K5nVJM74sYevfEAYdZvy9o7eqvrvKKSI2tzn6zn7
   5Qyqxr+Vfi7P3JFMIF1iLeoJJV+0ikp2J61n4/gxZiJmzyYE+kIkQZFue
   0kpZXqiPXpF1T4XEN0JcRmL7ZekG3jfMGQryNegMpqFWS6c3NYgFZ3MB1
   mHdnWS5z61f8npLWtnWrndeLkGKqLg/Zp2ivVsZlCWeLRM0Z05NoQD/2V
   g==;
X-CSE-ConnectionGUID: LaNl/mwLSzSTG2gSAIj1ug==
X-CSE-MsgGUID: jjVoiAHISd+Cih/GtQNvsg==
X-IPAS-Result: =?us-ascii?q?A0BIAgAgRQBr/9RK/pBaglmCV3VhQkmUKoIhA54pgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjiECJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgnQCAREGuEwbN4F5M?=
 =?us-ascii?q?4EBgykBMQUJAgJAAVDbMwELFAGBOIVCiCRdGAGEfScbG4FyhH+BBYFcAgEBG?=
 =?us-ascii?q?IENhn8EgiKBDIFUHox5AoFPiCZIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?zsXgQcbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckI?=
 =?us-ascii?q?ggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eG?=
 =?us-ascii?q?w4CHxAGDRgNSBEsNxUZBD5uB5NsgxlhLQETFgEBgj0hCKU7oREKKIN5jCSVO?=
 =?us-ascii?q?hozhASUGpJUmQiOCpVpaIRqgWg8gVlwFYMiCRY0GQ+OLgsLg2CFE4EtyBsjN?=
 =?us-ascii?q?QIJMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:WUwzjq2Gx8sH/lPCHfbD5Ydwkn2cJEfYwER7XKvMYLTBsI5bpzRWy
 DBKDTqEO/+DZDf8e992Oom1pxwGuZKBz4RmQFFv3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ef3b9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcuajtOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGKEgQOcod5cJME1py2
 qYXExksbEmeiLfjqF67YrEEasULJcTxeYdasXZ6wHSAVLAtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NU6ojx5nYj/7DLoykfmhgGL/axVTqUmeouw85G27IAlZjemzaoeNI4XiqcN9nESmo
 WPv30XCDlIxNdzY5ia81Gy3ibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVVsAVF6gx7xuAj/ONpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:1FrGUqDcgsEMdEvlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: =?us-ascii?q?9a23=3A0CWb/mtIAus/V7sFWtog/xXo6IsBe1vZi3LPB3S?=
 =?us-ascii?q?qMlpGErKuYH6Sob5rxp8=3D?=
X-Talos-MUID: 9a23:lEw/9QXzXKVz7vDq/D3uujZjHedJ2KjtI0EN1roagu+aLiMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,223,1787011200"; 
   d="scan'208";a="59625011"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 13:04:15 +0000
Received: from sjc-ads-8099.cisco.com (sjc-ads-8099.cisco.com [171.68.208.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id 6E9C3180001F7
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:04:15 +0000 (GMT)
Received: by sjc-ads-8099.cisco.com (Postfix, from userid 1887503)
	id 1FAA7CBF201; Fri, 20 Nov 2026 05:04:14 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][scarthgap][PATCH 1/4] curl: Fix CVE-2026-8927
Date: Fri, 20 Nov 2026 05:04:11 -0800
Message-Id: <20261120130414.822854-2-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261120130414.822854-1-devanshp@cisco.com>
References: <20261120130414.822854-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-8099.cisco.com [171.68.208.137];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.68.208.137, sjc-ads-8099.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250783
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix commit as referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc57aacb567
[2] https://curl.se/docs/CVE-2026-8927.html
[3] https://www.cve.org/CVERecord?id=CVE-2026-8927

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../curl/curl/CVE-2026-8927.patch             | 87 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8927.patch b/meta/recipes-support/curl/curl/CVE-2026-8927.patch
new file mode 100644
index 0000000..a8b07a5
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8927.patch
@@ -0,0 +1,87 @@
+From d4e71ad3aed07542606d9c4afdf6884eccdb3a26 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 18 May 2026 23:47:11 +0200
+Subject: [PATCH] url: detect proxy changes read from environment
+
+When a proxy is set from an environment variable, detect if that proxy
+is not the same as previously and flush state.
+
+Verified by test1647: verify changing proxy with env variables and make
+sure Digest state is flushed in the second use
+
+Closes #21666
+
+CVE: CVE-2026-8927
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc57aacb567]
+
+Backport Changes:
+- Use the 8.7.1 free()/strdup() names and include vauth/vauth.h.
+  Keep the parsed proxy string until the existing out cleanup so the
+  upstream Digest-state comparison can still read it.
+- Omit tests/data/Makefile.am, tests/data/test1647,
+  tests/libtest/Makefile.inc and tests/libtest/lib1647.c.
+  The test-only feature-detection dependency is therefore unnecessary.
+
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ lib/url.c     | 13 ++++++++++++-
+ lib/urldata.h |  1 +
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 9e1ca03..fe76397 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -79,6 +79,7 @@
+ #include "share.h"
+ #include "content_encoding.h"
+ #include "http_digest.h"
++#include "vauth/vauth.h"
+ #include "http_negotiate.h"
+ #include "select.h"
+ #include "multiif.h"
+@@ -331,6 +332,9 @@ CURLcode Curl_close(struct Curl_easy **datap)
+   Curl_wildcard_dtor(&data->wildcard);
+   Curl_freeset(data);
+   Curl_headers_cleanup(data);
++#ifndef CURL_DISABLE_DIGEST_AUTH
++  free(data->state.envproxy);
++#endif
+   free(data);
+   return CURLE_OK;
+ }
+@@ -2535,7 +2539,6 @@ static CURLcode create_conn_helper_init_proxy(struct Curl_easy *data,
+     curl_proxytype ptype = (curl_proxytype)conn->http_proxy.proxytype;
+     if(proxy) {
+       result = parse_proxy(data, conn, proxy, ptype);
+-      Curl_safefree(proxy); /* parse_proxy copies the proxy string */
+       if(result)
+         goto out;
+     }
+@@ -2554,6 +2557,14 @@ static CURLcode create_conn_helper_init_proxy(struct Curl_easy *data,
+       result = CURLE_UNSUPPORTED_PROTOCOL;
+       goto out;
+ #else
++#ifndef CURL_DISABLE_DIGEST_AUTH
++      if(!Curl_safecmp(data->state.envproxy, proxy)) {
++        /* proxy changed */
++        Curl_auth_digest_cleanup(&data->state.proxydigest);
++        free(data->state.envproxy);
++        data->state.envproxy = strdup(proxy);
++      }
++#endif
+       /* force this connection's protocol to become HTTP if compatible */
+       if(!(conn->handler->protocol & PROTO_FAMILY_HTTP)) {
+         if((conn->handler->flags & PROTOPT_PROXY_AS_HTTP) &&
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 4fc595a..d2d9424 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1247,6 +1247,7 @@ struct UrlState {
+   void (*prev_signal)(int sig);
+ #endif
+ #ifndef CURL_DISABLE_DIGEST_AUTH
++  char *envproxy; /* last proxy string used for proxy-related state */
+   struct digestdata digest;      /* state data for host Digest auth */
+   struct digestdata proxydigest; /* state data for proxy Digest auth */
+ #endif
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 076c875..6539f7f 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -49,6 +49,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-92388-1.patch \
            file://CVE-2026-92388-2.patch \
            file://CVE-2026-87864.patch \
+           file://CVE-2026-8927.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
