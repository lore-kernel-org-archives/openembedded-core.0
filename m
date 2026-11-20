Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5460.1795179858007862216
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:04:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DRgxJJIB;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11581; q=dns/txt;
  s=iport01; t=1795179859; x=1796389459;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=QJsIMAz9N2LPqmSnFXjeXUuBiDcUywgVdEhUSZBUiBs=;
  b=DRgxJJIBUvFIHPPdb3hFTq4cZ8BBAjPLh4xmv2EGBFcFluOoFu+9Dfrq
   ODn6om68hM83BKtkX/efNS6Hc8/dj1dTtZn6+HuzRViim8uRzAoC9FGpG
   V+99i+MEU5VRn0MMFjJSf7iTFXpVRkE9fMsKP9Zbteat/YV2o5uD77k1j
   l+iEXzSy/+xx+J8zIoAniiC7emMbBkisRd6/7h5tP+LqCAT3GVGZeA4Vz
   gDvjQb+O9XEugwOoxePa/CFkWmNOFVLiiiF3UuUOBHZXS/CbXNt3Hk3sY
   HbNkTo3nRzsYIC7pGKx3YjW6/nFlwGTP4MnxzxYmRc06nrg5hbrHUiLZq
   Q==;
X-CSE-ConnectionGUID: aT231uUIR8KMPHRH05FEbQ==
X-CSE-MsgGUID: FRyymU4tQOWe9QTAo4DXZw==
X-IPAS-Result: =?us-ascii?q?A0BJAgAxRABr/9NK/pBaglmCV3VhQkmUKoIhA4ETnRaBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKOIQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBAJgwIBgnQCAREGuEobN?=
 =?us-ascii?q?4F5M4EBgykBMQUJAgJAAVDbMwELFAGBOIVCiCRdGAGEfScbG4FygRWCdHaBB?=
 =?us-ascii?q?YFcAgEBGIgMBIIigQyBVB6MeQKBT4gmSIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBD?=
 =?us-ascii?q?CcfHhsOAh8QBg0YDUgRLDcVGQQ+bgeTbIJ5IB9CLQETFQEBAX8GeAc5CwIck?=
 =?us-ascii?q?n0BB5I2oREKKIN5jCSVOhozhVulF5kIjgqWUYRqgWg8gVlwFYMiCRY0GQ+OO?=
 =?us-ascii?q?YIDgWiFE4EtyBsjNQIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:kiiDMajyota3Z01lnPk/0Z3tX161NBEKZh0ujC45NGQN5FlHY01je
 htvUGHTOfmNamakLYgibo/g9EJS7ZbTxtM1HgQ++CBnE3ljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvjb8UkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqURxrwsWHxz1
 MZICxU1Tiqj37+Y7biCH7wEasQLdKEHPasWt2slyXTSCuwrBMmbBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcWYz/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKLIIbTFJgPzy50o
 EroxXXoByxGKOW49jfUy06FgbPjrRHkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXzBCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:EZlAgagYkyTO+KGW/pFKcoc823BQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:0shCkWO8RIXBrO5DURU9rxcJJ+EfIl749FfqAxflJ0tjcejA
X-Talos-MUID: =?us-ascii?q?9a23=3AeUwCnA1luCPkj2DGr3rD9Ev/4DUjzZ6/GUUwzYk?=
 =?us-ascii?q?/nPaJZBVMEjDBoASFXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,223,1787011200"; 
   d="scan'208";a="62219529"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 13:04:15 +0000
Received: from sjc-ads-8099.cisco.com (sjc-ads-8099.cisco.com [171.68.208.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 74837180001E9
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:04:15 +0000 (GMT)
Received: by sjc-ads-8099.cisco.com (Postfix, from userid 1887503)
	id 27727CBF203; Fri, 20 Nov 2026 05:04:14 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][scarthgap][PATCH 3/4] curl: Fix CVE-2026-6429
Date: Fri, 20 Nov 2026 05:04:13 -0800
Message-Id: <20261120130414.822854-4-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261120130414.822854-1-devanshp@cisco.com>
References: <20261120130414.822854-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-8099.cisco.com [171.68.208.137];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.68.208.137, sjc-ads-8099.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250782
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix commit as referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f199ace306
[2] https://curl.se/docs/CVE-2026-6429.html
[3] https://www.cve.org/CVERecord?id=CVE-2026-6429

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../curl/curl/CVE-2026-6429_p1.patch          | 205 ++++++++++++++++++
 .../curl/curl/CVE-2026-6429_p2.patch          |  52 +++++
 .../curl/curl/CVE-2026-6429_p3.patch          |  29 +++
 meta/recipes-support/curl/curl_8.7.1.bb       |   3 +
 4 files changed, 289 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429_p2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429_p3.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-6429_p1.patch b/meta/recipes-support/curl/curl/CVE-2026-6429_p1.patch
new file mode 100644
index 0000000..6b195dc
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6429_p1.patch
@@ -0,0 +1,205 @@
+From ad29c80f3afaffd4ee3c902e30e331eb3667b809 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 16 Apr 2026 14:26:20 +0200
+Subject: [PATCH] http: clear credentials better on redirect
+
+Verify with test 2506: netrc with redirect using proxy
+
+Updated test 998 which was wrong.
+
+Reported-by: Muhamad Arga Reksapati
+
+Closes #21345
+
+CVE: CVE-2026-6429
+Upstream-Status: Backport [https://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f199ace306]
+
+Backport Changes:
+- Apply Curl_http_follow changes to Curl_follow in lib/transfer.c,
+  where 8.7.1 implements redirects. Use its newurl/state.url strings
+  and free/Curl_safefree names instead of the newer buffer API.
+- Fold in only the required Curl_url_same_origin helper and declaration
+  from upstream prerequisite 32a513e180ce83d5e9b708211306045407074134:
+  https://github.com/curl/curl/commit/32a513e180ce83d5e9b708211306045407074134
+  The target lacks this helper, so the redirect fix cannot compile.
+  Use Curl_handler/Curl_get_scheme_handler because the unchanged
+  upstream Curl_scheme/Curl_get_scheme API fails to compile on 8.7.1.
+  Omit the prerequisite's independent lib/http2.c consumer changes;
+  they are not needed for the redirect fix.
+- Remove the obsolete outer result declaration: the upstream block
+  declares its own result, leaving 8.7.1's outer variable unused
+  (confirmed with -Wall).
+- Omit tests/data/{Makefile.am,test998,test2506},
+  tests/libtest/{Makefile.inc,lib2506.c} and the prerequisite's
+  tests/unit/unit1675.c under the submitted series' code-only policy.
+
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ lib/transfer.c   | 87 ++++++++++++++++--------------------------------
+ lib/urlapi-int.h |  2 ++
+ lib/urlapi.c     | 33 ++++++++++++++++++
+ 3 files changed, 64 insertions(+), 58 deletions(-)
+
+diff --git a/lib/transfer.c b/lib/transfer.c
+index a734629..082b0ae 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -777,7 +777,6 @@ CURLcode Curl_follow(struct Curl_easy *data,
+   bool disallowport = FALSE;
+   bool reachedmax = FALSE;
+   CURLUcode uc;
+-  CURLcode result;
+ 
+   DEBUGASSERT(type != FOLLOW_NONE);
+ 
+@@ -861,69 +860,41 @@ CURLcode Curl_follow(struct Curl_easy *data,
+       return CURLE_OUT_OF_MEMORY;
+   }
+   else {
+-    uc = curl_url_get(data->state.uh, CURLUPART_URL, &newurl, 0);
+-    if(uc)
++    bool same_origin;
++    CURLcode result;
++    CURLU *u = curl_url();
++    if(!u)
++      return CURLE_OUT_OF_MEMORY;
++    uc = curl_url_set(u, CURLUPART_URL,
++                      data->state.url,
++                      CURLU_URLENCODE | CURLU_ALLOW_SPACE);
++    if(!uc)
++      uc = curl_url_get(data->state.uh, CURLUPART_URL, &newurl, 0);
++    if(uc) {
++      curl_url_cleanup(u);
+       return Curl_uc_to_curlcode(uc);
++    }
+ 
+-    /* Clear auth if this redirects to a different port number or protocol,
+-       unless permitted */
+-    if(!data->set.allow_auth_to_other_hosts && (type != FOLLOW_FAKE)) {
+-      char *portnum;
+-      int port;
+-      bool clear = FALSE;
+-
+-      if(data->set.use_port && data->state.allow_port)
+-        /* a custom port is used */
+-        port = (int)data->set.use_port;
+-      else {
+-        uc = curl_url_get(data->state.uh, CURLUPART_PORT, &portnum,
+-                          CURLU_DEFAULT_PORT);
+-        if(uc) {
+-          free(newurl);
+-          return Curl_uc_to_curlcode(uc);
+-        }
+-        port = atoi(portnum);
+-        free(portnum);
+-      }
+-      if(port != data->info.conn_remote_port) {
+-        infof(data, "Clear auth, redirects to port from %u to %u",
+-              data->info.conn_remote_port, port);
+-        clear = TRUE;
+-      }
+-      else {
+-        char *scheme;
+-        const struct Curl_handler *p;
+-        uc = curl_url_get(data->state.uh, CURLUPART_SCHEME, &scheme, 0);
+-        if(uc) {
+-          free(newurl);
+-          return Curl_uc_to_curlcode(uc);
+-        }
++    same_origin = Curl_url_same_origin(u, data->state.uh);
++    curl_url_cleanup(u);
+ 
+-        p = Curl_get_scheme_handler(scheme);
+-        if(p && (p->protocol != data->info.conn_protocol)) {
+-          infof(data, "Clear auth, redirects scheme from %s to %s",
+-                data->info.conn_scheme, scheme);
+-          clear = TRUE;
+-        }
+-        free(scheme);
+-      }
+-      if(clear) {
+-        result = Curl_reset_userpwd(data);
+-        if(result) {
+-          free(newurl);
+-          return result;
+-        }
+-        Curl_safefree(data->state.aptr.user);
+-        Curl_safefree(data->state.aptr.passwd);
++    if((!same_origin && !data->set.allow_auth_to_other_hosts) ||
++       !data->set.str[STRING_USERNAME]) {
++      result = Curl_reset_userpwd(data);
++      if(result) {
++        free(newurl);
++        return result;
+       }
++      Curl_safefree(data->state.aptr.user);
++      Curl_safefree(data->state.aptr.passwd);
++    }
++    result = Curl_reset_proxypwd(data);
++    if(result) {
++      free(newurl);
++      return result;
+     }
+   }
+-
+-  result = Curl_reset_proxypwd(data);
+-  if(result) {
+-    free(newurl);
+-    return result;
+-  }
++  DEBUGASSERT(newurl);
+ 
+   if(type == FOLLOW_FAKE) {
+     /* we're only figuring out the new url if we would've followed locations
+diff --git a/lib/urlapi-int.h b/lib/urlapi-int.h
+index d6e240a..8176ff7 100644
+--- a/lib/urlapi-int.h
++++ b/lib/urlapi-int.h
+@@ -36,4 +36,6 @@ CURLUcode Curl_parse_port(struct Curl_URL *u, struct dynbuf *host,
+                           bool has_scheme);
+ #endif
+ 
++bool Curl_url_same_origin(CURLU *base, CURLU *href);
++
+ #endif /* HEADER_CURL_URLAPI_INT_H */
+diff --git a/lib/urlapi.c b/lib/urlapi.c
+index dc42489..7b02c86 100644
+--- a/lib/urlapi.c
++++ b/lib/urlapi.c
+@@ -1972,3 +1972,36 @@ nomem:
+     u->portnum = port;
+   return CURLUE_OK;
+ }
++
++bool Curl_url_same_origin(CURLU *base, CURLU *href)
++{
++  const struct Curl_handler *s = NULL;
++
++  /* base must be an absolute URL */
++  if(!base->scheme || !base->host)
++    return FALSE;
++  if(href->scheme && !curl_strequal(base->scheme, href->scheme))
++    return FALSE;
++  if(href->host) {
++    if(!curl_strequal(base->host, href->host))
++      return FALSE;
++    if(!curl_strequal(base->port, href->port)) {
++      /* This may still match if only one has an explicit port
++       * and it is the default for the scheme. */
++      if(base->port && href->port)
++        return FALSE;
++
++      s = Curl_get_scheme_handler(base->scheme);
++      if(!s) /* Cannot match default port for unknown scheme */
++        return FALSE;
++
++      /* The port which is set must be the default one */
++      if((base->port && (base->portnum != s->defport)) ||
++         (href->port && (href->portnum != s->defport)))
++        return FALSE;
++    }
++  }
++  else if(href->port) /* no host in href, then there must be no port */
++    return FALSE;
++  return TRUE;
++}
diff --git a/meta/recipes-support/curl/curl/CVE-2026-6429_p2.patch b/meta/recipes-support/curl/curl/CVE-2026-6429_p2.patch
new file mode 100644
index 0000000..a8c097c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6429_p2.patch
@@ -0,0 +1,52 @@
+From 818ef36518b76ca02ce9e88f6790188df954afa0 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 17 Apr 2026 16:25:26 +0200
+Subject: [PATCH] http: clear digest nonce on cross-orgin redirect
+
+Verify in test 1966
+
+Reported-by: Yalguun Tumenkhuu
+Closes #21359
+
+CVE: CVE-2026-6429
+Upstream-Status: Backport [https://github.com/curl/curl/commit/6daf4bc7e276b764a96cf450d4dab34327cd8d53]
+
+Backport Changes:
+- Apply the Digest cleanup to Curl_follow in lib/transfer.c, where
+  8.7.1 implements the redirect path changed in upstream lib/http.c.
+  Preserve the upstream cleanup and CURL_DISABLE_DIGEST_AUTH guard.
+- Include vauth/vauth.h for Curl_auth_digest_cleanup: transfer.c lacks
+  upstream http.c's declaration include. The unchanged cleanup block
+  fails -Werror=implicit-function-declaration without this header.
+- Omit tests/data/Makefile.am and tests/data/test1966 under the
+  submitted series' code-only policy.
+
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ lib/transfer.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/lib/transfer.c b/lib/transfer.c
+index 082b0ae..1ad182f 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -69,6 +69,7 @@
+ #include "speedcheck.h"
+ #include "progress.h"
+ #include "http.h"
++#include "vauth/vauth.h"
+ #include "url.h"
+ #include "getinfo.h"
+ #include "vtls/vtls.h"
+@@ -878,6 +879,11 @@ CURLcode Curl_follow(struct Curl_easy *data,
+     same_origin = Curl_url_same_origin(u, data->state.uh);
+     curl_url_cleanup(u);
+ 
++#ifndef CURL_DISABLE_DIGEST_AUTH
++    if(!same_origin)
++      Curl_auth_digest_cleanup(&data->state.digest);
++#endif
++
+     if((!same_origin && !data->set.allow_auth_to_other_hosts) ||
+        !data->set.str[STRING_USERNAME]) {
+       result = Curl_reset_userpwd(data);
diff --git a/meta/recipes-support/curl/curl/CVE-2026-6429_p3.patch b/meta/recipes-support/curl/curl/CVE-2026-6429_p3.patch
new file mode 100644
index 0000000..4512bae
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6429_p3.patch
@@ -0,0 +1,29 @@
+From 15bbabb568d8516845223e088177588fa5d30fc4 Mon Sep 17 00:00:00 2001
+From: Joshua Rogers <MegaManSec@users.noreply.github.com>
+Date: Wed, 20 May 2026 01:03:31 +0200
+Subject: [PATCH] urlapi: compare zone-id in Curl_url_same_origin()
+
+Closes #21686
+
+CVE: CVE-2026-6429
+Upstream-Status: Backport [https://github.com/curl/curl/commit/edfc80c7c473b9a09eba9e98e59c4d7d167bbb9e]
+
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ lib/urlapi.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/urlapi.c b/lib/urlapi.c
+index 7b02c86..f96ff42 100644
+--- a/lib/urlapi.c
++++ b/lib/urlapi.c
+@@ -1985,6 +1985,9 @@ bool Curl_url_same_origin(CURLU *base, CURLU *href)
+   if(href->host) {
+     if(!curl_strequal(base->host, href->host))
+       return FALSE;
++    if(!curl_strequal(base->zoneid ? base->zoneid : "",
++                      href->zoneid ? href->zoneid : ""))
++      return FALSE;
+     if(!curl_strequal(base->port, href->port)) {
+       /* This may still match if only one has an explicit port
+        * and it is the default for the scheme. */
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 144a5c2..e365c68 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -51,6 +51,9 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-87864.patch \
            file://CVE-2026-8927.patch \
            file://CVE-2026-8932.patch \
+           file://CVE-2026-6429_p1.patch \
+           file://CVE-2026-6429_p2.patch \
+           file://CVE-2026-6429_p3.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
