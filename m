Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5426.1795179857994325358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Id1CiHE2;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4327; q=dns/txt;
  s=iport01; t=1795179858; x=1796389458;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=JJTLWx/+tk7t46msOZADD59d5dlP0ktEutQVwZhj0lk=;
  b=Id1CiHE2xoYWX8hoboR4F+VbEoSjnmcvrIp1qghIFb6A1uyKq2zcRKk8
   JpFDp82xBOBPoUl/ipl/oC/Hi9CCWTMMVpj6ZCT8VQt+AKEUuF2LQVTNl
   gm81XlsUUMnc2ei63WWnxYjsVEH+f7VtRnsI/T5SOa9UyVI0ljiFfBqvs
   ogqtXf9YVWgCCItx9RtRLxVGltllAxQ6yfymQqrpTQPeL+25BVtZ45sCy
   Q15qza9BZ8oPbOvbtULZpCIK1k9ue7Pdpmm2wDbty6oiE+I+8DTsHvUwF
   94IazQJUy3d34LWZEeuTUnyLWhCgda00ykex33rE3AqITB+1lgT71CmAX
   w==;
X-CSE-ConnectionGUID: gKN8uzC4TSS03fqAlVJ2UQ==
X-CSE-MsgGUID: +rmTOW60SeSiOcRx04cQFA==
X-IPAS-Result: =?us-ascii?q?A0BIAgAxRABr/9FK/pBaglmCV3VhQkmUKoIhA54pgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjiECJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgnQCAREGuEobN4F5M?=
 =?us-ascii?q?4EBgykBMQUJAgJAAVDbMwELFAGBOIVCiCRdGAGEfScbG4FygRWDaoEFgVwCA?=
 =?us-ascii?q?QEYiAwEgiKBDIFUHox5AoFPiCZIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?zsXgQcbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckI?=
 =?us-ascii?q?ggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eG?=
 =?us-ascii?q?w4CHxAGDRgNSBEsNxUZBD5uB5NsgxIHWgctASkCgVdmKaU7oREKKIN5jCSVO?=
 =?us-ascii?q?hozqnKZCI4KlWlohGqBaDyBWXAVgyIJFjQZD44uCwuDYIUTgS3IGyM1AgkyA?=
 =?us-ascii?q?QEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:25U68K+mc6qBBwbVpwz8DrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 jFKWTiFbP3eNDGke9p2PIXj9k4FsJGBm4Q1HVE6rCtEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhMsvjrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k5HqtI5/RcXV11z
 qRDJikkai6h3d+PlefTpulE3qzPLeHiMZlavjRryivUSK52B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6YMnWjOX9PYH46tOulmHD5aD1AgFmUvqEwpWPUyWSd1ZCzaoOFI4LaGq25mG7bv
 Gf62FunWioXD924wgCVqi6nv8HmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRu1bfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:y3ksYaxZrDCJlW5IU3hWKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:x6xDzWGId/6BE/+JqmJo12hEB9IOLkHm9y+LLVaRDVhLEoCsHAo=
X-Talos-MUID: 9a23:UoOnTwX00vk6ZqTq/Hz2gQ1FC5kw2KmVCWcGq4Ve58K9GwUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,223,1787011200"; 
   d="scan'208";a="62181687"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 13:04:15 +0000
Received: from sjc-ads-8099.cisco.com (sjc-ads-8099.cisco.com [171.68.208.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id 760A718000199
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:04:15 +0000 (GMT)
Received: by sjc-ads-8099.cisco.com (Postfix, from userid 1887503)
	id 2AF1ECBF204; Fri, 20 Nov 2026 05:04:14 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][scarthgap][PATCH 4/4] curl: Fix CVE-2026-7168
Date: Fri, 20 Nov 2026 05:04:14 -0800
Message-Id: <20261120130414.822854-5-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261120130414.822854-1-devanshp@cisco.com>
References: <20261120130414.822854-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-8099.cisco.com [171.68.208.137];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.68.208.137, sjc-ads-8099.cisco.com
X-Outbound-Node: aer-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250779
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix commit as referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c8594507
[2] https://curl.se/docs/CVE-2026-7168.html
[3] https://www.cve.org/CVERecord?id=CVE-2026-7168

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../curl/curl/CVE-2026-7168.patch             | 83 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7168.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-7168.patch b/meta/recipes-support/curl/curl/CVE-2026-7168.patch
new file mode 100644
index 0000000..cc12db0
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-7168.patch
@@ -0,0 +1,83 @@
+From 2b1d18e42252aa09236666f0469b48a0e1f95080 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 27 Apr 2026 09:14:51 +0200
+Subject: [PATCH] setopt: clear proxy auth properties when switching
+
+Verify with test 1588
+
+Closes #21453
+
+CVE: CVE-2026-7168
+Upstream-Status: Backport [https://github.com/curl/curl/commit/c1cfdf59acbaf9504c4578d4cf56cdd7c8594507]
+
+Backport Changes:
+- Place setproxy() beside Curl_setstropt() and call it from the old
+  Curl_vsetopt CURLOPT_PROXY case; 8.7.1 has no setopt_cptr_proxy().
+  Add CURL_DISABLE_PROXY protection because this helper is outside
+  the upstream proxy-only section in the older monolithic file.
+  Keep the upstream Digest-disabled cleanup macro in vauth/vauth.h.
+- Omit tests/data/{Makefile.am,test1588} and
+  tests/libtest/{Makefile.inc,lib1588.c}.
+
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ lib/setopt.c      | 18 ++++++++++++++++--
+ lib/vauth/vauth.h |  2 ++
+ 2 files changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index 8a5a5d7..7eaf309 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -51,6 +51,7 @@
+ #include "altsvc.h"
+ #include "hsts.h"
+ #include "tftp.h"
++#include "vauth/vauth.h"
+ #include "strdup.h"
+ /* The last 3 #include files should be in this order */
+ #include "curl_printf.h"
+@@ -76,6 +77,20 @@ CURLcode Curl_setstropt(char **charp, const char *s)
+   return CURLE_OK;
+ }
+ 
++#ifndef CURL_DISABLE_PROXY
++static CURLcode setproxy(struct Curl_easy *data, const char *proxy)
++{
++  if((data->set.str[STRING_PROXY] && proxy) &&
++     /* there was one set, is this a new one? */
++     !strcmp(data->set.str[STRING_PROXY], proxy))
++    return CURLE_OK; /* same one as before */
++
++  Curl_auth_digest_cleanup(&data->state.proxydigest);
++  memset(&data->state.authproxy, 0, sizeof(data->state.authproxy));
++  return Curl_setstropt(&data->set.str[STRING_PROXY], proxy);
++}
++#endif
++
+ CURLcode Curl_setblobopt(struct curl_blob **blobp,
+                          const struct curl_blob *blob)
+ {
+@@ -1139,8 +1154,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+      * Setting it to NULL, means no proxy but allows the environment variables
+      * to decide for us (if CURLOPT_SOCKS_PROXY setting it to NULL).
+      */
+-    result = Curl_setstropt(&data->set.str[STRING_PROXY],
+-                            va_arg(param, char *));
++    result = setproxy(data, va_arg(param, char *));
+     break;
+ 
+   case CURLOPT_PRE_PROXY:
+diff --git a/lib/vauth/vauth.h b/lib/vauth/vauth.h
+index 9da0540..bf5c7a3 100644
+--- a/lib/vauth/vauth.h
++++ b/lib/vauth/vauth.h
+@@ -119,6 +119,8 @@ CURLcode Curl_auth_create_digest_http_message(struct Curl_easy *data,
+ 
+ /* This is used to clean up the digest specific data */
+ void Curl_auth_digest_cleanup(struct digestdata *digest);
++#else
++#define Curl_auth_digest_cleanup(x)
+ #endif /* !CURL_DISABLE_DIGEST_AUTH */
+ 
+ #ifdef USE_GSASL
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index e365c68..0149a6f 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -54,6 +54,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-6429_p1.patch \
            file://CVE-2026-6429_p2.patch \
            file://CVE-2026-6429_p3.patch \
+           file://CVE-2026-7168.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
