Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6577.1793789809405318893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 02:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TwMr79FE;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4149; q=dns/txt;
  s=iport01; t=1793789809; x=1794999409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LyDb+WjXtLXpiOOuXE5F8hpv82+G+Yz0GU/O9IUNnRg=;
  b=TwMr79FEZwo4G+fl5lCYZ2sHHIl4tpF4zT2xjMZVsHNO8KcwGf0h1pDX
   ho9kvOvt+aZVPci/uNfv4nM7ri7zh9hA5nsPt1Uk+2qwyV0u1Nve4YcSn
   rePKJUzQs5k7k582eYUzlplTJPzDuF9iiAU5+4pAAgVC1/07jo8CZPscM
   65zjiEhLFAl+sDksCh+cxQ3RM4tgzri8hpto16Hh322Gab8LRvxq7obge
   /IakDH1fjUmVh7VkMcA2raZqbDffjkzMIXvvTg9/2i98yfcuhX3I3e/wO
   SkVgFCJZaY3BWHp6KlEA6x/BXwfZSalheXKhd/LAgjcMfbUNFegce6LER
   w==;
X-CSE-ConnectionGUID: Ys/e6Ef9RqSAFUBtG/wKYQ==
X-CSE-MsgGUID: 8/RIvoBaTzOruAP5q2Jyuw==
X-IPAS-Result: =?us-ascii?q?A0BIAgA+Dutq/5T/Ja1aglmCV3VgQ0mWSwOeIYF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4cAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBAJgwIBgnQDEQa6Lxs3gXkzg?=
 =?us-ascii?q?QGDKQE/AgJAAVDbMwELFAGBOIVAiCNdGAGEfScbG4FygRWDaYEFgVwCAYFHh?=
 =?us-ascii?q?l4Egg0VgQyBWh6DB4l2AohCSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F?=
 =?us-ascii?q?4EHGwYFgR2BHoESgQddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiC?=
 =?us-ascii?q?BIJARMaLAqBGjU8CSY/FQxmCxoFYQgCDQx0ORAwHiQvBRwmQBsKFBgNSBEsN?=
 =?us-ascii?q?xUZBD5uB5ItgxABYS0BExYBAYIDOAKTJJJBoREKKIN4jCSDXZFdGjOqcQuYf?=
 =?us-ascii?q?Y4KlTwtG02EaYFoPIFZcBWDIgkWNBkPji4LC4NghkDIGyYyAgkyAQEHAgcOA?=
 =?us-ascii?q?wuBaJF+AQE?=
IronPort-Data: A9a23:+wb00KvtHp4Tr4HV1oOE8O656ufnVAdfMUV32f8akzHdYApBsoF/q
 tZmKTqEP/yNMzT1c9wkbojkoEsBvcWDmtdgHlZq+HgwF38VgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb9Es21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwy/0wDD9j+
 60iMQskQC2pm83x35GKc7w57igjBJGD0II3oHpsy3TdSP0hW52GGvyM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtHYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoHWHpUMxBbI9
 woq+UypRSs7Ktu1wAaX1Wixr9eShHnZSZ8NQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cYLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:sXxRWqvl7Au48QRwxE+MUMpC7skDVNV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3A/qgarGgAEV7j7M1t4c2riDM9/jJuQ2aawSn9LR6?=
 =?us-ascii?q?CEF1AZoC/VXDX54BVqp87?=
X-Talos-MUID: 9a23:vXC26QZmjnvDLuBT53jWpS9lHs5U8YO0FWk1zIxcmdiZKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,195,1787011200"; 
   d="scan'208";a="543812889"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 10:56:48 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 6613E18000172;
	Wed,  4 Nov 2026 10:56:48 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 118AFCBF202; Wed,  4 Nov 2026 02:56:48 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH 2/3] curl: fix CVE-2026-18924
Date: Wed,  4 Nov 2026 02:56:44 -0800
Message-Id: <20261104105645.2523473-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261104105645.2523473-1-dkelaiya@cisco.com>
References: <20261104105645.2523473-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 10:56:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249361
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Make accepted HTTP/2 push handles inherit their parent's share object.
Use the curl 8.7.1 share setter to retain its locking, reference
counting and shared-cache handling during cleanup.

Retain curl_easy_duphandle() instead of the later creation change in
[3]. In 8.7.1, duplication leaves the share and connection-cache
pointers NULL. The share setter increments its use count before the
push callback and multi addition; cleanup releases it. Share cleanup
is blocked while this reference remains. Keep the documented
inheritance of parent options.

[1] https://github.com/curl/curl/commit/90325ff0444cbdff368bda5d26d6405a0bb6ee43
[2] https://curl.se/docs/CVE-2026-18924.html
[3] https://github.com/curl/curl/commit/fad90b666df98c93ee165341b0c8101c7b10ad7b

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-18924.patch            | 56 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-18924.patch b/meta/recipes-support/curl/curl/CVE-2026-18924.patch
new file mode 100644
index 0000000000..cf8a3a6290
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-18924.patch
@@ -0,0 +1,56 @@
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
+- Use share.h because curl 8.7.1 does not have curl_share.h.
+- Use curl_easy_setopt(second, CURLOPT_SHARE, data->share)
+  instead of Curl_share_easy_link(), which is absent from curl 8.7.1.
+  The setter locks the share, updates its dirty counter and links
+  shared caches.
+- Retain curl_easy_duphandle() instead of the later curl_easy_init()
+  change in [1], preserving curl 8.7.1's documented push-option
+  inheritance. In 8.7.1, duplication leaves share and state.conn_cache
+  NULL. The share setter increments share->dirty before the push
+  callback and Curl_multi_add_perform(). Curl_close() drops the use
+  count on rejection or cleanup; curl_share_cleanup() refuses to free
+  a share still in use. The share lifetime fix therefore does not
+  require the later handle-creation change.
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
+index 99d7f3b0e2..694900fd8c 100644
+--- a/lib/http2.c
++++ b/lib/http2.c
+@@ -47,6 +47,7 @@
+ #include "transfer.h"
+ #include "dynbuf.h"
+ #include "headers.h"
++#include "share.h"
+ /* The last 3 #include files should be in this order */
+ #include "curl_printf.h"
+ #include "curl_memory.h"
+@@ -776,6 +777,8 @@ static struct Curl_easy *h2_duphandle(struct Curl_cfilter *cf,
+       second->req.p.http = http;
+       http2_data_setup(cf, second, &second_stream);
+       second->state.priority.weight = data->state.priority.weight;
++      if(data->share)
++        (void)curl_easy_setopt(second, CURLOPT_SHARE, data->share);
+     }
+   }
+   return second;
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index b308aa1e3f..33265f0f25 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -43,6 +43,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-13608.patch \
            file://CVE-2026-8286.patch \
            file://CVE-2026-80230.patch \
+           file://CVE-2026-18924.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
