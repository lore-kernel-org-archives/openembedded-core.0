Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4450.1793777792374864041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 23:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KzGf0+Hv;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2724; q=dns/txt;
  s=iport01; t=1793777792; x=1794987392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ubPshhCaiUWFfZrM3yscc8lZVYh4TAJ9cgCl4gfuMFs=;
  b=KzGf0+HvBPkIJiSNX8wDQ8UFOP7F88c6JpOH5tHTZ/9sl/kyC5zjGX66
   ENbDrCd1dXpF5dVBeFQjmbCjPyvEdt4Wnb9TNeoUSXnB8M0U/GWptrUv8
   lGTH3GUnNi8YcTR0+yYwCBWnTutcGxXS7VYRyfPmX+0N4P/mwL+GRCnaF
   9XWRIwOBl+zYbc6AsCMSNUqoMEaNYBm5XuhBkJ289GJoTWqxV595yrixy
   JvAffKMyomQleBdVPXxHMIw4dtMjnPmWuy8ijIi7FG4h1cW7lRay+OTL2
   eo4DaVqsKCxNklesOtq2xWGCrPaSBAs02duHaq5my6AYXUO4H6bGE9MAA
   g==;
X-CSE-ConnectionGUID: siJYRzyDQp+1MBEGhW2RDg==
X-CSE-MsgGUID: rGrQLJ0sTD+zot5r7mlnTg==
X-IPAS-Result: =?us-ascii?q?A0BHAgDD3upq/5T/Ja1aglmCV3VgQ0mWSwOeIIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4cAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAzIBGAEtEBwDAQIvKyMIGYMCAYJ0AxEGuXcbN4IsgQGDK?=
 =?us-ascii?q?QE/AgJAAVDbMwELFAGBOIVAiCNdGAGEfScbG4FygRWDaYEFgVwCAYIshXkEg?=
 =?us-ascii?q?iKBDIFaHox9AohCSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFg?=
 =?us-ascii?q?R2BHoESgQddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaL?=
 =?us-ascii?q?AqBGjU8CSY/FQxmCxoFYQgCDQx0ORAwHiQvBRwmQBsKFBgNSBEsNxUZBD5uB?=
 =?us-ascii?q?5Itgn8SYS0BExYCBII5pWWhEQoog3iMJJU6GjOqcQuYfY4KllGEaYFoPIFZc?=
 =?us-ascii?q?BWDIgkWNBkPjjmDa4ZAyBsmMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:11Ru06NbDn1upUHvrR30lsFynXyQoLVcMsEvi/4bfWQNrUoggzQGm
 mdNUT+CafaOY2v0KdBzb4S/pksAv5fTmoNrT3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8g2UsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+5vLnAML5w0w/40WERk2
 NMYF2o3Qh/W0opawJrjIgVtrt4oIM+uOMYUvWttiGiAS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzPHwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQsjOSxb4uEJoTiqcN9hGmCn
 0bkp3/FLlIIM8DC02WA9nSQibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++NukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:dPIgbau0OrnPDUb8g0O8KEAH7skDVNV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: 9a23:qQlkRGFOMo67fG2wqmJ89WwlINI0XkTFjy71CWKXCVkzcpGaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A8YZV+wwLSDV/GVdAl0tmfT9ufGiaqL6BEnkps80?=
 =?us-ascii?q?dh+XHJytsZi3CiTCxfoByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,194,1787011200"; 
   d="scan'208";a="544479940"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 07:36:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 7EE7318000274;
	Wed,  4 Nov 2026 07:36:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id CA9E5CBF21E; Tue,  3 Nov 2026 23:36:30 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 05/12] curl: fix CVE-2026-86412
Date: Tue,  3 Nov 2026 23:36:20 -0800
Message-Id: <20261104073627.302002-6-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261104073627.302002-1-dkelaiya@cisco.com>
References: <20261104073627.302002-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249334
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Ignore individual cookie parsing failures while loading a cookie
file, except for out-of-memory errors. Preserve line-reading errors
and the older Curl_cookie_add() call interface.

[1] https://github.com/curl/curl/commit/6ded3e594455d6f018fab5f2f5d916eb9bc4ef94
[2] https://curl.se/docs/CVE-2026-86412.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-86412.patch            | 34 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86412.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-86412.patch b/meta/recipes-support/curl/curl/CVE-2026-86412.patch
new file mode 100644
index 00000000000..2a846fdbed5
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-86412.patch
@@ -0,0 +1,34 @@
+From 6ded3e594455d6f018fab5f2f5d916eb9bc4ef94 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sat, 5 Sep 2026 16:08:55 +0200
+Subject: [PATCH] cookie: ignore individual cookie errors when loading
+
+Closes #22840
+
+CVE: CVE-2026-86412
+Upstream-Status: Backport [https://github.com/curl/curl/commit/6ded3e594455d6f018fab5f2f5d916eb9bc4ef94]
+
+(cherry picked from commit 6ded3e594455d6f018fab5f2f5d916eb9bc4ef94)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/cookie.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index a8959a6..8d9acf1 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -1130,8 +1130,9 @@ static CURLcode cookie_load(struct Curl_easy *data, const char *file,
+ 
+         result = Curl_cookie_add(data, ci, headerline, TRUE, lineptr, NULL,
+                                  NULL, TRUE);
+-        /* File reading cookie failures are not propagated back to the
+-           caller because there is no way to do that */
++        /* Ignore individual cookie problems unless we ran out of memory */
++        if(result != CURLE_OUT_OF_MEMORY)
++          result = CURLE_OK;
+       }
+     } while(!result && !eof);
+     curlx_dyn_free(&buf); /* free the line buffer */
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index c4a1167d1ba..7749c1907f9 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -52,6 +52,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-86409.patch \
            file://CVE-2026-87862.patch \
            file://CVE-2026-92387.patch \
+           file://CVE-2026-86412.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
