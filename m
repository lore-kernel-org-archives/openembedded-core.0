Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4451.1793777792423509325
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 23:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Gg6+6I/a;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3198; q=dns/txt;
  s=iport01; t=1793777792; x=1794987392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V8Ws33bq4BowSHvb7sQltZUGGDBvUgiRSR80Sy9Dk7w=;
  b=Gg6+6I/aGBbcvvi1U0YxfBE9vtnIcSMTh1d0FT1tTmvr3c94xQug0Wxf
   CJ0KryfnsiokygY7RFVP66hjp1/147j98cOWhNUMFgk1dPPvketOvkNpH
   D4OWZfdoTRLHkfQczBbXhKxb1gyIucvLPBT0FSLk4Ozm/lK/+W0Xw03e1
   8nP4ZbkryYt85Oqnvs8Sps9UFpshhNt4sRVygZXzjQTtUiaC65MLKp6+V
   YlPHUYnCXsu1a/4t3MHOrzV3udk+3e7imbWldBuh4mvHPeIOzD0mOzjnG
   RHWsW0E+38uvUz4wHPiXdqTKdZ+VGBTiOfDMeF8yIvQePeCzRiy53+oqn
   A==;
X-CSE-ConnectionGUID: Lw1w9G+uTTuIW4vASjdjCw==
X-CSE-MsgGUID: 1K+1s45/QUaaibjj3kqTcw==
X-IPAS-Result: =?us-ascii?q?A0BJAgBW3+pq/4z/Ja1aglmCGD91YENJlksDniCBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOHAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgQCYIqWAGCdAMRBrl3GzeBe?=
 =?us-ascii?q?TOBAYMpAT8CAkABUNszAQsUAYE4hUCII10YAYR9JxsbgXKEfoEFgVwCAYglB?=
 =?us-ascii?q?IIigQyBWh6MfQKIQkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGB?=
 =?us-ascii?q?YEdgR6BEoEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETG?=
 =?us-ascii?q?iwKgRo1PAkmPxUMZgsaBWEIAg0MdDkQMB4kLwUcJkAbChQYDUgRLDcVGQQ+b?=
 =?us-ascii?q?geSLYJxGQdhLQEpAoEgSFUpknuSQaERCiiDeIwklToaM6lLgSYLmH2OCpYCT?=
 =?us-ascii?q?4RpgWg8gVlwFYMiCRY0GQ+OOYNrhkDIGyYyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:H7Gu66hzelAnlOExsHJKDmHHX161MREKZh0ujC45NGQN5FlHY01je
 htvXWiEO6qDNGLzKdx2YInj8U0GvsOGz4QxSlM9qy9nQShjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvrY8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU85b9oUE4N6
 MAkNREyMg6qvOC6wpmkH7wEasQLdKEHPasFsX1miDWcBvE8TNWbGOPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg9/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9J4DRGpkIxBbCz
 o7A1z3aQUgBaIHY8AeM+3OmhO2UnjrHU51HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmUHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:MkwzE6sLsLQiOX7vxztC/dJ27skDVNV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3AkFcfOGly1zhbmS/W+NgMejCdYPHXOVnClWiBDAy?=
 =?us-ascii?q?lNVp0aYLJV3ar+q9muNU7zg=3D=3D?=
X-Talos-MUID: 9a23:iTZHiAQTqq3A6wd7RXS1p3I7L5s1pJ2TAUkMm5cE4MqdCSdvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,194,1787011200"; 
   d="scan'208";a="543745282"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 07:36:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 85994180005A7;
	Wed,  4 Nov 2026 07:36:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id DA408CBEFAB; Tue,  3 Nov 2026 23:36:30 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 09/12] curl: fix CVE-2026-92389
Date: Tue,  3 Nov 2026 23:36:24 -0800
Message-Id: <20261104073627.302002-10-dkelaiya@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249337
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Reject TFTP packets and state transitions that conflict with the
requested transfer direction. This prevents a download from using
a reused handle's upload callback or data.

[1] https://github.com/curl/curl/commit/63dd390fab905a239a97e2700532929343ebc4e9
[2] https://curl.se/docs/CVE-2026-92389.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-92389.patch            | 56 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92389.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92389.patch b/meta/recipes-support/curl/curl/CVE-2026-92389.patch
new file mode 100644
index 00000000000..adbf62e94ab
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92389.patch
@@ -0,0 +1,56 @@
+From 44d91a58fabd1de3555e669e12d88040844be716 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 16 Sep 2026 23:46:44 +0200
+Subject: [PATCH] tftp: verify direction in a few places
+
+Closes #22974
+
+CVE: CVE-2026-92389
+Upstream-Status: Backport [https://github.com/curl/curl/commit/63dd390fab905a239a97e2700532929343ebc4e9]
+
+(cherry picked from commit 63dd390fab905a239a97e2700532929343ebc4e9)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/tftp.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/lib/tftp.c b/lib/tftp.c
+index cc0769b..fca77b7 100644
+--- a/lib/tftp.c
++++ b/lib/tftp.c
+@@ -361,6 +361,9 @@ static CURLcode tftp_tx(struct tftp_conn *state, tftp_event_t event)
+   char *bufptr;
+   bool eos;
+ 
++  if(!data->state.upload)
++    return CURLE_TFTP_ILLEGAL;
++
+   switch(event) {
+ 
+   case TFTP_EVENT_ACK:
+@@ -768,10 +771,14 @@ static CURLcode tftp_send_first(struct tftp_conn *state,
+     break;
+ 
+   case TFTP_EVENT_ACK: /* Connected for transmit */
++    if(!data->state.upload)
++      return CURLE_TFTP_ILLEGAL;
+     result = tftp_connect_for_tx(state, event);
+     break;
+ 
+   case TFTP_EVENT_DATA: /* Connected for receive */
++    if(data->state.upload)
++      return CURLE_TFTP_ILLEGAL;
+     result = tftp_connect_for_rx(state, event);
+     break;
+ 
+@@ -1074,6 +1081,8 @@ static CURLcode tftp_receive_packet(struct Curl_easy *data,
+ 
+     switch(state->event) {
+     case TFTP_EVENT_DATA:
++      if(data->state.upload)
++        return CURLE_TFTP_ILLEGAL;
+       /* Do not pass to the client empty or retransmitted packets */
+       if(state->rbytes > 4 &&
+          (NEXT_BLOCKNUM(state->block) == getrpacketblock(&state->rpacket))) {
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index e039207a0e4..6cf6e328272 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -57,6 +57,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-92386_p2.patch \
            file://CVE-2026-107928.patch \
            file://CVE-2026-87864.patch \
+           file://CVE-2026-92389.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
