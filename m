Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4378.1793777792173650437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 23:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=D3ZFzJPM;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2768; q=dns/txt;
  s=iport01; t=1793777792; x=1794987392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dUTw7FyjsVjQJoBryVdem7RZOSM3KvNSpXSvWMlSasg=;
  b=D3ZFzJPMzuts+TPIPOIdRstIbIBi5qHlg4ro3deJ4gf1nMOphYV9UINM
   oT5+P52sXl9F0JyvdTBSEnSaKjYeCBAACN9Ox6P2fcT/VcVlOjT2j35hG
   eu0Yn6i3I8zs9bb445QZSdzxNpdIkBJjYGdXO6ADQYtPHHDPXmVbNJLuf
   HnohwVNOMv4ofpa4uWIEZ5wJi7uil7e2EXHRjb9pwW0eqm4MpGWznIsCL
   q5g6Ubto7xH8BUTh7BIrKQ5WQVVabQt1P6HAB5FRCdaFaCSW/7DmNS5Do
   5OARXLh8ocSxOYRT2326OATT9vIf03Vch4QwXuo1pAW+uwwkmkWjboKME
   g==;
X-CSE-ConnectionGUID: yktsZ9nnS4ygJSHwKeOp+w==
X-CSE-MsgGUID: sPMvuwuhSTWfqtqBVdo9AA==
X-IPAS-Result: =?us-ascii?q?A0BIAgDZ3+pq/5X/Ja1aglmCV3VgQ0mWSwOeIIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4cAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAMRBrl6GzeBeTOBA?=
 =?us-ascii?q?YMpAT8CAkABUNszAQsUAYE4hUCII10YAYR9JxsbgXKEfoEFgVwCAYE3dYV5B?=
 =?us-ascii?q?IIigQyBWh6MfQKIQkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGB?=
 =?us-ascii?q?YEdgR6BEoEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETG?=
 =?us-ascii?q?iwKgRo1PAkmPxUMZgsaBWEIAg0MdDkQMB4kLwUcJkAbChQYDUgRLDcVGQQ+b?=
 =?us-ascii?q?geSLYMRYS0BKQKCPZMnkj6hEQoog3iMJJU6GjOqcQuYfY4KllGEaYFoPIFZc?=
 =?us-ascii?q?BWDIgkWNBkPjjmDa4ZAyBsmMgIJMgEBBwIHDgMLgWiQAYF9AQE?=
IronPort-Data: A9a23:wOe6sajpTkWdiYd34tSnY6qAX161MREKZh0ujC45NGQN5FlHY01je
 htvWm/Va6zZMDP0edh+Pou080oG7MODy9QySQE/+yBmRSJjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvrY8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUJ+fpsMzBI8
 8dEOT8vVTCcpO+R2PGkH7wEasQLdKEHPasFsX1miDWcBvE8TNWaGePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgZ/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9J4DRHp4JzxfIz
 o7A13/BJw8HK8Gf8ga6/Guwn8XxkSSqcatHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2QHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:OScUaKNLFaV3u8BcTuOjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IHjJ7MHd3ATV0mmhD0JczqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3AZ/uM2GrRQUxniiaiVhDQAtvmUdEmbmbvnXHWGBO?=
 =?us-ascii?q?pBkRSaKK2RHiIu7wxxg=3D=3D?=
X-Talos-MUID: 9a23:VabOPgQyi+7Jxvo7RXT3vBR8Kdh145+SN04UjYwshcWDZAVZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,194,1787011200"; 
   d="scan'208";a="543334998"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 07:36:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 261FB180001C1;
	Wed,  4 Nov 2026 07:36:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id C6D48CBF204; Tue,  3 Nov 2026 23:36:30 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 04/12] curl: fix CVE-2026-92387
Date: Tue,  3 Nov 2026 23:36:19 -0800
Message-Id: <20261104073627.302002-5-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261104073627.302002-1-dkelaiya@cisco.com>
References: <20261104073627.302002-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249331
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Limit each Curl_pp_readresp() call to ten new socket reads so an
unfinished response cannot monopolize the multi interface.

[1] https://github.com/curl/curl/commit/753735af87f5c30cb6f60a70342f8bc4bc5fd5db
[2] https://curl.se/docs/CVE-2026-92387.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-92387.patch            | 43 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92387.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92387.patch b/meta/recipes-support/curl/curl/CVE-2026-92387.patch
new file mode 100644
index 00000000000..d997aa478a3
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92387.patch
@@ -0,0 +1,43 @@
+From 753735af87f5c30cb6f60a70342f8bc4bc5fd5db Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 13 Sep 2026 16:12:01 +0200
+Subject: [PATCH] pingpong: add a max loop counter for Curl_pp_readresp
+
+To make sure it cannot get stuck in this function.
+
+Reported-by: Joshua Rogers
+Closes #22932
+
+CVE: CVE-2026-92387
+Upstream-Status: Backport [https://github.com/curl/curl/commit/753735af87f5c30cb6f60a70342f8bc4bc5fd5db]
+
+(cherry picked from commit 753735af87f5c30cb6f60a70342f8bc4bc5fd5db)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/pingpong.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/pingpong.c b/lib/pingpong.c
+index 4ede0a5..b32651a 100644
+--- a/lib/pingpong.c
++++ b/lib/pingpong.c
+@@ -253,6 +253,7 @@ CURLcode Curl_pp_readresp(struct Curl_easy *data,
+   CURLcode result = CURLE_OK;
+   size_t gotbytes;
+   char buffer[900];
++  int maxloops = 10;
+ 
+   *code = 0; /* 0 for errors or not done */
+   *size = 0;
+@@ -270,6 +271,9 @@ CURLcode Curl_pp_readresp(struct Curl_easy *data,
+       pp->nfinal = 0; /* now gone */
+     }
+     if(!pp->overflow) {
++      if(!maxloops--) /* don't get stuck */
++        return CURLE_OK;
++
+       result = pingpong_read(data, sockindex, buffer, sizeof(buffer),
+                              &gotbytes);
+       if(result == CURLE_AGAIN)
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 3828c26f507..c4a1167d1ba 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -51,6 +51,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-86414.patch \
            file://CVE-2026-86409.patch \
            file://CVE-2026-87862.patch \
+           file://CVE-2026-92387.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
