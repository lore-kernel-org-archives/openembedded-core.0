Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4726C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 10:48:12 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89494.1782730089934826780
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 03:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=b0l3kFEO;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1805; q=dns/txt;
  s=iport01; t=1782730089; x=1783939689;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=al4hpehvxuX9JjpZa9LuWD7KDDH+QeBXFsCIoz54DRk=;
  b=b0l3kFEOiGpHeD/8KrZ/ZhKMKSFgELD84HsBW/zE1oIaTonch+Jfntwk
   gmaU7+V2zANPPTu8iq8rhSpZL2po+a+REiR7lF1KCrdnDWtQ15p7xBeLG
   2TC1PMpy4TMxV70Kw6W9HnZL9DzdlgvmZIrEip/rAXYJ/mdA43Umho5XA
   0N/Fts89Cil9YJSDhiFqd/Y9UdEdGdJ1r/n7grafk1yV7t9ojqSRfqaey
   f1p65I7YLF/uH4SdaCfoF1U93A5mnc4auMfsAo/j92AZc+mMYqj9z1JcI
   hksrYLUTtgmU1pLjZDb4OOQOIu8ScAZ4P+fKmpMAciVqwDmGHzBWxXEWe
   w==;
X-CSE-ConnectionGUID: ffxLD4wRRoqU2u2OmHKViw==
X-CSE-MsgGUID: ZjrklcSrQtWiOXj3BPa0LQ==
X-IPAS-Result: =?us-ascii?q?A0BBAgC7TEJq/47/Ja1aHgEBCxIMggULgld0X0JJlkueH?=
 =?us-ascii?q?oF+DwEBAQ89FAQBAYUGjU0CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GXTYBGAEtMFw7CYMCAYJzAgERBrYYgiyBAYMoATEFCQICQ?=
 =?us-ascii?q?AFQ2ywBCxQBBYEzhT+IH3MBhHwnGxuBcoEVg2mBBYFcAQKCLIV4BIIigQyBe?=
 =?us-ascii?q?I8RSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BaYEEhH0jH?=
 =?us-ascii?q?wM5f4EwdVhmFTA1gQIBER4KgVInAwsYDUgRLDcUGwQ+bgeMXhcPgj1aBy0qA?=
 =?us-ascii?q?QEEgWgYOaVloQ8KKIN1jCGVOhozqmyZCI4KllCEaIFoPIFHCwdwFYMiCRY0G?=
 =?us-ascii?q?Q+OOIVqhEHCECQ1AjsBAQcCBw4DC4FokX0BAQ?=
IronPort-Data: A9a23:aleieK2cwkbjnY9r4fbD5YJwkn2cJEfYwER7XKvMYLTBsI5bp2MFy
 TQZDGyBb/rYYjf1LdogO4S3oEsPvcCHztBrGws/3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 bsen+WFYAX7g2AuYjpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGAk8mGaFE5dxNBnhzr
 +FCDzUtTS6CmLfjqF67YrEEasULNsLnOsYb/3pn1zycVatgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiaC/FMEg9/5JYWleuvgHb2aTBwo1OOrq1x6G/WpOB0+OS8a4SPK4TRFa25mG6qp
 HjF+2/CGCgGC924+Tje2Eql3sv2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7EQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:TOJ0mKl8g+jFKtUBoe5UIWWorNLpDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdg7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:xRcquGGzz3HsgNPBqmJp+l4wNpw6SEfa1UqKPhWfDEZKdryKHAo=
X-Talos-MUID: 9a23:BKIpagSO1b1NicEURXTehithMMxT+Z2yN0EqoZddkfGNbQhJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,231,1774310400"; 
   d="scan'208";a="493629038"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 10:48:09 +0000
Received: from sjc-ads-3691.cisco.com (sjc-ads-3691.cisco.com [171.68.250.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id D96CA18000344;
	Mon, 29 Jun 2026 10:48:08 +0000 (GMT)
Received: by sjc-ads-3691.cisco.com (Postfix, from userid 1870532)
	id 81811CC12A6; Mon, 29 Jun 2026 03:48:08 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 1/7] curl: ignore CVE-2026-4873
Date: Mon, 29 Jun 2026 03:47:51 -0700
Message-ID: <20260629104801.972184-1-adongare@cisco.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3691.cisco.com [171.68.250.138];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.250.138, sjc-ads-3691.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 10:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239746

From: Anil Dongare <adongare@cisco.com>

- CVE-2026-4873 affects curl before 8.20.0 when a connection negotiated with
  clear-text IMAP, POP3, or SMTP can later be reused for a TLS-required
  transfer.
- In scarthgap, these protocols are optional PACKAGECONFIG entries and are not
  enabled by default in `curl_8.7.1.bb`.
- Record this CVE as configuration-not-applicable for the default recipe
  configuration instead of carrying the upstream fix unconditionally.

Reference:
- https://curl.se/docs/CVE-2026-4873.html
- https://nvd.nist.gov/vuln/detail/CVE-2026-4873

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 14d63d6373..ad7ceceb69 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -51,6 +51,7 @@ CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on go
 CVE_STATUS[CVE-2025-0725] = "not-applicable-config: gzip decompression of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older"
 CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 CVE_STATUS[CVE-2025-10966] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
+CVE_STATUS[CVE-2026-4873] = "${@bb.utils.contains_any('PACKAGECONFIG', 'imap pop3 smtp', 'unpatched', 'not-applicable-config: clear-text imap/pop3/smtp support is not enabled in PACKAGECONFIG', d)}"
 
 
 inherit autotools pkgconfig binconfig multilib_header ptest
-- 
2.51.0


