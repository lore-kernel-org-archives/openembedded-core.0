Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FCAC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 10:57:08 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6348.1784545020773216981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 03:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=N1wUrI2n;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1572; q=dns/txt;
  s=iport01; t=1784545020; x=1785754620;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SY7uaM7wPD9Zh+RlrTS76qEMUtjmglaAvBwtiHOOj3s=;
  b=N1wUrI2nBx5c5B4+R68ZzPcxf7B72UYXV/q8VhjK31/4vpdVZa1Hpx+n
   1Ivzydc4uceqRht+XqLPKqshy1tMdM/yZjzycruIpnDRe0NXiFnIvIotN
   bJ3tdY4U1CZ6LgTPCsvBYjmf0nTevRehca1sTSZuKbfn5vv+f0CJYxF31
   j1DOISdBv2xnmOb2/qgvTcsrdS0GuXXieOY0lt2PQ9LV/y9fey+0djyqG
   h6Vv6ejqGphMjPZPgAXGwTupz07UxwAJz5qK7Ny9cpMuk5fdFdM41G9+l
   XyBWldFvZpFQN1JC05rof9SvI90gvq4N7XTqsxTYBURg7SEV53EplWTRA
   Q==;
X-CSE-ConnectionGUID: V3iUYnXRT7ugOHA+dUNk7g==
X-CSE-MsgGUID: ju5msm+pT9yEkU7CYGaiQg==
X-IPAS-Result: =?us-ascii?q?A0BAAgCp/V1q/5X/Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?Z4egX4PAQEBDz0UBAEBkloCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2HEwEYAV1cOwEIgwIBgnQDEQa8PoIsgQGDKAExBQkCAkABU?=
 =?us-ascii?q?NsuAQsUAYE4hT+IIHQBgkmCMycbG4FygRWDaYEFgVwBAoIshXgEgiJ6EoF4U?=
 =?us-ascii?q?IEIjhxIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYE6gQKEd?=
 =?us-ascii?q?yMfAzl/gTB1SnctahIXgSaDSwIHAwsYDUgRLDcUGQQ+bgeNPCOCPxBKBy0qA?=
 =?us-ascii?q?gSBaBgzBqVioRIKKIN1jCGVOhozqmyZCI4KllCEaYFoPDmBDgsHcBWDIgkWN?=
 =?us-ascii?q?BkPjjiFaoRBxVY8NQI7AQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:eGMIpKrp048iJTQehWt9ZY+dDW5eBmJJZBIvgKrLsJaIsI4StFCzt
 garIBnVMqmMMTCnL9h/Oo20o0IBv8ODn9IxSlNp/H0zRitHouPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8ks355wehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0tgsAFx/8
 8wiFG8QYTejrqG6/ZS4FeY506zPLOGzVG8ekmtrwTecCbMtRorOBvyQo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWfrSn8/w7pX7WzFVpUicuaowy2PS1wd2lrPqNbI5f/TWFJUJwRnD+
 zOuE2LRAAxHMceaiiK5o2OBhdKQthLUUYMrG+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMpottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvoUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:BnzAIK4TdO3F1uri+APXwPjXdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I5+rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfxLqn5SH8ECvj8eMY/6
 Jhf69iTODUNzFB/KPHCM3SKadG/DFBm5rY4dvj8w==
X-Talos-CUID: =?us-ascii?q?9a23=3AAWxxyGru3Du/DqEI1DzwmaDmUf5+c0DsykfqHxC?=
 =?us-ascii?q?lBkFJYf6ZdHmTp6wxxg=3D=3D?=
X-Talos-MUID: 9a23:OdSVNgTzMnxCwzYWRXTumWxnL8Ir+5j/GW0OrMotiuaNNBV/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="498477359"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 10:56:59 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 91A9F180001C1
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:56:59 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id AD496CC037D; Mon, 20 Jul 2026 16:26:57 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 1/5] curl: ignore CVE-2026-4873
Date: Mon, 20 Jul 2026 16:26:43 +0530
Message-Id: <20260720105647.2451180-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:57:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241353

From: Deepak Rathore <deeratho@cisco.com>

- CVE-2026-4873 affects curl before 8.20.0 when a connection negotiated with
  clear-text IMAP, POP3, or SMTP can later be reused for a TLS-required
  transfer.
- In wrynose, these protocols are optional PACKAGECONFIG entries and are not
  enabled by default in curl_8.19.0.bb, so record this CVE as configuration-not-applicable
  for the default recipe configuration.

Reference:
- https://curl.se/docs/CVE-2026-4873.html
- https://nvd.nist.gov/vuln/detail/CVE-2026-4873

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 3326f478b5..1cda69401b 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -28,6 +28,7 @@ SRC_URI[sha256sum] = "4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d33
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
 CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
+CVE_STATUS[CVE-2026-4873] = "${@bb.utils.contains_any('PACKAGECONFIG', 'imap pop3 smtp', 'unpatched', 'not-applicable-config: clear-text imap/pop3/smtp support is not enabled in PACKAGECONFIG', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.35.6


