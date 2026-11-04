Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4451.1793777792423509325
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 23:36:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ZxDIQc4J;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3850; q=dns/txt;
  s=iport01; t=1793777793; x=1794987393;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uQeVDVrd3qPC4IpnQoxT0LBsYT0FYs9ZP7XMcYG/gsU=;
  b=ZxDIQc4JzlzTL8gUB28vWFGwzp7UUg0q6hK2x0sftcbV/mJjvkFw82Jw
   F+LE/dODqeLYUu5IrFvJP6JH7KpTqKw6hn+fD+WwRFA511BKjRRt/kGI/
   ohKGn1KHS33VBdGoUgabgkwqbbu7gaYRRqhVak3V8b1zGk36FyEKYGab5
   +vN0nGM9i/Gej88va14a0zMS2g2FWxWFQxoIlOmG9hrNntSoDqZTp1XTC
   FF0sLtCE1E1vVWx6wEgINLQwntg6dfiacbjyyIsxC+8HYidHrCdN5FZ7U
   a4Qor56a/Q7P+1i4HQFV1rmc3sKqugljO4lG/My5tUGt+BUM7k7rlMbEp
   w==;
X-CSE-ConnectionGUID: peB2Y1BfTOiO1KRVnGo+lw==
X-CSE-MsgGUID: fUAt49MdTZK3Ni3C4n8PRw==
X-IPAS-Result: =?us-ascii?q?A0BIAgBW3+pq/4z/Ja1aglmCV3VgQ0mWSwOeIIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4cAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBAJgwIBgnQDEQa5dxs3gXkzg?=
 =?us-ascii?q?QGDKQE/AgJAAVDbMwELFAGBOIVAiCNdGAGEfScbG4FygRWDaYEFgVwCAYFHh?=
 =?us-ascii?q?l4Egg0VgQyBWh6DB4l2AohCSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F?=
 =?us-ascii?q?4EHGwYFgR2BHoESgQddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiC?=
 =?us-ascii?q?BIJARMaLAqBGjU8CSY/FQxmCxoFYQgCDQx0ORAwHiQvBRwmQBsKFBgNSBEsN?=
 =?us-ascii?q?xUZBD5uB5ItgxABAWAaEwETFgEBggM4ApMkHSmRe6ERCiiDeIwkg12RXRozq?=
 =?us-ascii?q?nELmH2OCpYETYRpgWg8gVlwFYMiCRY0GQ+OLgsLg2CGQMgbJjICCTIBAQcCB?=
 =?us-ascii?q?w4DC4FokX4BAQ?=
IronPort-Data: A9a23:Q3/yuaMrCIzvLjjvrR30lsFynXyQoLVcMsEvi/4bfWQNrUok0WZUm
 GZKDTrSPqvZZGP8L9EkPozk/RlS6pGAz9ZmTXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8g2UsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+1jJhsHZKcWxsF2Jjhtz
 8IeBzdOag/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmCS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzNHwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQsjOOybIePKofiqcN9kHuxu
 j6X2mjFMDJBEt3E4maDokqWmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MuECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:r+dw4a5vXZhKqilaMwPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: 9a23:hKVUOG4kLP2OZjLKAdss7EM+QPF8WHPh63b3emyCN2BGT/6RVgrF
X-Talos-MUID: 9a23:divpKQvgxjdG4qeppc2nigxLKJs5xqiSOmNWt5RdkJWCZRRKJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,194,1787011200"; 
   d="scan'208";a="543745283"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 07:36:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 8B50A18000631;
	Wed,  4 Nov 2026 07:36:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id E8290CBEF6C; Tue,  3 Nov 2026 23:36:30 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 12/12] curl: fix CVE-2026-18924
Date: Tue,  3 Nov 2026 23:36:27 -0800
Message-Id: <20261104073627.302002-13-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261104073627.302002-1-dkelaiya@cisco.com>
References: <20261104073627.302002-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249342
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Make accepted HTTP/2 push handles inherit their parent's share object.
Use the curl 8.19.0 share setter to retain its locking, reference
counting and shared-cache handling during cleanup.

[1] https://github.com/curl/curl/commit/90325ff0444cbdff368bda5d26d6405a0bb6ee43
[2] https://curl.se/docs/CVE-2026-18924.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-18924.patch            | 57 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-18924.patch b/meta/recipes-support/curl/curl/CVE-2026-18924.patch
new file mode 100644
index 00000000000..5d744138fa6
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-18924.patch
@@ -0,0 +1,57 @@
+From 90325ff0444cbdff368bda5d26d6405a0bb6ee43 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 5 Aug 2026 10:02:53 +0200
+Subject: [PATCH] http2: make server push transfers inherit share from
+ parent
+
+Reported-by: Stephan Zeisberg
+Closes #22488
+
+CVE: CVE-2026-18924
+Upstream-Status: Backport [https://github.com/curl/curl/commit/90325ff0444cbdff368bda5d26d6405a0bb6ee43]
+
+Backport Changes:
+- Use curl_easy_setopt(second, CURLOPT_SHARE, (CURLSH *)data->share)
+  instead of Curl_share_easy_link(), which is absent from curl 8.19.0.
+  The cast satisfies curl's CURLOPT_SHARE type check. The setter
+  locks the share, updates its dirty counter and links shared caches.
+- Retain curl_easy_duphandle() instead of the later curl_easy_init()
+  change in [1], preserving curl 8.19.0's documented push-option
+  inheritance. In 8.19.0, duplication leaves second->share NULL.
+  The share setter increments share->dirty before the push callback.
+  When the pushed transfer joins the multi handle, conncache.c
+  selects data->share->cpool when connection sharing is enabled.
+  Curl_close() drops the use count on rejection or cleanup;
+  curl_share_cleanup() refuses to free a share still in use. The
+  share lifetime fix does not require the later handle-creation
+  change.
+
+[1] https://github.com/curl/curl/commit/fad90b666df98c93ee165341b0c8101c7b10ad7b
+
+(cherry picked from commit 90325ff0444cbdff368bda5d26d6405a0bb6ee43)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/http2.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/http2.c b/lib/http2.c
+index e1c5798..ffeb0f4 100644
+--- a/lib/http2.c
++++ b/lib/http2.c
+@@ -46,6 +46,7 @@
+ #include "bufref.h"
+ #include "curlx/dynbuf.h"
+ #include "headers.h"
++#include "curl_share.h"
+ 
+ #if (NGHTTP2_VERSION_NUM < 0x010c00)
+ #error too old nghttp2 version, upgrade!
+@@ -709,6 +710,8 @@ static struct Curl_easy *h2_duphandle(struct Curl_cfilter *cf,
+     struct h2_stream_ctx *second_stream;
+     http2_data_setup(cf, second, &second_stream);
+     second->state.priority.weight = data->state.priority.weight;
++    if(data->share)
++      (void)curl_easy_setopt(second, CURLOPT_SHARE, (CURLSH *)data->share);
+   }
+   return second;
+ }
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index f30750a6061..f9cc46fdc32 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -38,6 +38,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-80229.patch \
            file://CVE-2026-9546-01.patch \
            file://CVE-2026-9546-02.patch \
+           file://CVE-2026-18924.patch \
            file://CVE-2026-8926-dependent.patch \
            file://CVE-2026-8926_p1.patch \
            file://CVE-2026-8926_p2.patch \
-- 
2.35.6
