Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3709.1795172267676421292
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:57:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=B8P2httm;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5254; q=dns/txt;
  s=iport01; t=1795172269; x=1796381869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gg+eYYM9j9WGt17QUdTqCc6UntklE3ZS0FjOpq9E2zc=;
  b=B8P2httmnyLB2EXsusvUMx0Rm6tUFCXEbwc92wvK1dB7U6Psm+gw16m+
   /ZETgjUoqsR0IxTV4nnAnjuvGgzedavt6SxgQWlKmpemSd4nrhV9rfsqD
   0ULFZCzwduuTwlOMN96vYGJJeX4NjEQoMSYipt+/ZYImRRUbvE9NhwG9f
   R+1X9P0VX86Yt/lT8BkmP8NMgbQjZGPJyZOtxPIH0vH1fWgwXuK9tdFm6
   dvXPI1rRzHAtk4l0nc4DF5tg3slS7Z5cHstV8xXZgWHrUGtAUc+1wJzcN
   TM4Tk10poQrE2f5rGzs9AU199pmj8nP3xAwsTwKjoqjgyS2Hexm0C7VHI
   Q==;
X-CSE-ConnectionGUID: tqDL/hQGTwSkOMkg86r54A==
X-CSE-MsgGUID: rDiGBzaaSqmcXenwCOKHqA==
X-IPAS-Result: =?us-ascii?q?A0BHAgDlJgBr/8xK/pBaglmCV3VhQkkDlkgDnimBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOIQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwFGEBwDAQIvKyMIGYMCAYJ0AgERuCwbN4F5M4EBh?=
 =?us-ascii?q?H7bMwEFBhQBBYEzhUKIJF0YAYR9JxsbgXKBFYNqgQWBXAKIJgSCIoEMgVQYB?=
 =?us-ascii?q?ox5AoFPiCZIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBHIEeg?=
 =?us-ascii?q?RKBA12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaN?=
 =?us-ascii?q?TwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBg0YDUgRL?=
 =?us-ascii?q?DcVGQQ+bgeTbIMZgQ4IIwFWgVaTP5AVgiGhEQoog3mMJJU6GjOqcguYfY4Kl?=
 =?us-ascii?q?XQNUIRqgWg8gVlwFYMiUxkPjjmDa85bIzULAy8BAQcCBw4DC4FokAItgU8BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:1E1/uarGBqMWFNej9LDWoNLyoYleBmJMZBIvgKrLsJaIsI4StFCzt
 garIBnXbK2INGf3f9l1YNuw804D7Zbdx9ViHgtuqX08Rn9H9uPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8sj/zgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8ks25ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0vpuLUUJ9
 cU3FC82bTemhO3mnqjmFsA506zPLOGzVG8eknht13TdSP0hW52GG/6M7t5D1zB2jcdLdRrcT
 5NFNXw1MUiGPEEJYA9LYH49tL/Aan3XeiZAoUiQrLAf6GnIxws327/oWDbQUoHbFZkNwRjAz
 o7A137VAz4wJtWW8iOA+UKhgPDkugDbQatHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QyXj66R6AGDCy1cFXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Pxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:iCvk/qE7pO9acN1CpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:DwEg6WFY4UVp8TJVqmJ77WIwXcAcXUHC93T3Bky3WThzFeG8HAo=
X-Talos-MUID: 9a23:oofBOAQX9SbhIRxPRXT2qDBNHtVh6p+3DUs9nJMZkO6nFTVZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="59840760"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 10:57:45 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 25637180006F7;
	Fri, 20 Nov 2026 10:57:45 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id CC913CBF223; Fri, 20 Nov 2026 02:57:43 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-Core][wrynose][PATCH 4/8] cups: Fix CVE-2026-61702
Date: Fri, 20 Nov 2026 02:57:16 -0800
Message-Id: <20261120105720.2197092-5-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261120105720.2197092-1-asparmar@cisco.com>
References: <20261120105720.2197092-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 10:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250770
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream fix referenced in [2], using the commit
shown in [1].

[1] https://github.com/OpenPrinting/cups/commit/08a8a277ce2a8948a1af33552247a1ac53b72df3
[2] https://github.com/OpenPrinting/cups/security/advisories/GHSA-gq9p-4w7m-2f5g

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 482eb9c85d..dad2ce88ba 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -28,6 +28,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-55453.patch \
            file://CVE-2026-55467.patch \
            file://CVE-2026-55480.patch \
+           file://CVE-2026-61702.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-61702.patch b/meta/recipes-extended/cups/cups/CVE-2026-61702.patch
new file mode 100644
index 0000000000..d2f892f406
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-61702.patch
@@ -0,0 +1,76 @@
+From 2438c50c72f77c953702f0755f373d8654006f28 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 23 Jun 2026 11:00:50 -0400
+Subject: [PATCH] Validate attributes-natural-language, and normalize the
+ logging punctuation.
+
+CVE: CVE-2026-61702
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/08a8a277ce2a8948a1af33552247a1ac53b72df3]
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ scheduler/ipp.c | 30 +++++++++++++++++++-----------
+ 1 file changed, 19 insertions(+), 11 deletions(-)
+
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index 1c9798cb..0e44ec46 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -295,10 +295,19 @@ cupsdProcessIPPRequest(
+         * Bad character set...
+ 	*/
+ 
+-        cupsdLogMessage(CUPSD_LOG_ERROR, "Unsupported character set \"%s\"",
+-	                charset->values[0].string.text);
+-	cupsdAddEvent(CUPSD_EVENT_SERVER_AUDIT, NULL, NULL, "%04X %s Unsupported attributes-charset value \"%s\".", IPP_STATUS_ERROR_CHARSET, con->http->hostname, charset->values[0].string.text);
+-	send_ipp_status(con, IPP_STATUS_ERROR_CHARSET, _("Unsupported character set \"%s\"."), charset->values[0].string.text);
++        cupsdLogClient(con, CUPSD_LOG_ERROR, "Unsupported \"attributes-charset\" value '%s'.", charset->values[0].string.text);
++	cupsdAddEvent(CUPSD_EVENT_SERVER_AUDIT, NULL, NULL, "%04X %s Unsupported \"attributes-charset\" value '%s'.", IPP_STATUS_ERROR_CHARSET, con->http->hostname, charset->values[0].string.text);
++	send_ipp_status(con, IPP_STATUS_ERROR_CHARSET, _("Unsupported \"attributes-charset\" value '%s'."), charset->values[0].string.text);
++      }
++      else if (language && !ippValidateAttribute(language))
++      {
++       /*
++        * Bad natural language...
++        */
++
++        cupsdLogClient(con, CUPSD_LOG_ERROR, "Bad \"attributes-natural-language\" value '%s'.", language->values[0].string.text);
++	cupsdAddEvent(CUPSD_EVENT_SERVER_AUDIT, NULL, NULL, "%04X %s Bad \"attributes-natural-language\" value '%s'.", IPP_STATUS_ERROR_BAD_REQUEST, con->http->hostname, language->values[0].string.text);
++	send_ipp_status(con, IPP_STATUS_ERROR_BAD_REQUEST, _("Bad \"attributes-natural-language\" value '%s'."), language->values[0].string.text);
+       }
+       else if (!charset || !language ||
+ 	       (!uri &&
+@@ -316,24 +325,23 @@ cupsdProcessIPPRequest(
+ 
+         if (!charset)
+ 	{
+-	  cupsdLogMessage(CUPSD_LOG_ERROR, "Missing attributes-charset attribute.");
++	  cupsdLogMessage(CUPSD_LOG_ERROR, "Missing \"attributes-charset\" attribute.");
+ 
+-	  cupsdAddEvent(CUPSD_EVENT_SERVER_AUDIT, NULL, NULL, "%04X %s Missing attributes-charset attribute.", IPP_STATUS_ERROR_BAD_REQUEST, con->http->hostname);
++	  cupsdAddEvent(CUPSD_EVENT_SERVER_AUDIT, NULL, NULL, "%04X %s Missing \"attributes-charset\" attribute.", IPP_STATUS_ERROR_BAD_REQUEST, con->http->hostname);
+         }
+ 
+         if (!language)
+ 	{
+-	  cupsdLogMessage(CUPSD_LOG_ERROR,
+-	                  "Missing attributes-natural-language attribute.");
++	  cupsdLogMessage(CUPSD_LOG_ERROR, "Missing \"attributes-natural-language\" attribute.");
+ 
+-	  cupsdAddEvent(CUPSD_EVENT_SERVER_AUDIT, NULL, NULL, "%04X %s Missing attributes-natural-language attribute.", IPP_STATUS_ERROR_BAD_REQUEST, con->http->hostname);
++	  cupsdAddEvent(CUPSD_EVENT_SERVER_AUDIT, NULL, NULL, "%04X %s Missing \"attributes-natural-language\" attribute.", IPP_STATUS_ERROR_BAD_REQUEST, con->http->hostname);
+         }
+ 
+         if (!uri)
+ 	{
+-	  cupsdLogMessage(CUPSD_LOG_ERROR, "Missing printer-uri, job-uri, or ppd-name attribute.");
++	  cupsdLogMessage(CUPSD_LOG_ERROR, "Missing \"printer-uri\", \"job-uri\", or \"ppd-name\" attribute.");
+ 
+-	  cupsdAddEvent(CUPSD_EVENT_SERVER_AUDIT, NULL, NULL, "%04X %s Missing printer-uri, job-uri, or ppd-name attribute.", IPP_STATUS_ERROR_BAD_REQUEST, con->http->hostname);
++	  cupsdAddEvent(CUPSD_EVENT_SERVER_AUDIT, NULL, NULL, "%04X %s Missing \"printer-uri\", \"job-uri\", or \"ppd-name\" attribute.", IPP_STATUS_ERROR_BAD_REQUEST, con->http->hostname);
+         }
+ 
+ 	cupsdLogMessage(CUPSD_LOG_DEBUG, "Request attributes follow...");
+-- 
+2.35.6
+
-- 
2.35.6

