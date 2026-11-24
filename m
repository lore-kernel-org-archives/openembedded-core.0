Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14020.1795509646694556519
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 00:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hgTqLcEx;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5319; q=dns/txt;
  s=iport01; t=1795509646; x=1796719246;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zWf9JtW/6heZXjowMHW2KZIeDN60TbBs8e/zrJ4bsJQ=;
  b=hgTqLcExSAXxKWJ+fmUteWSdUQd2LqcwwGGeRnjCEXqpasDeiopyrVnE
   Fbm9VohnTns+cNZ7FTFH3721Vq9w4BmtjroHbGOIevU6HDVcWd0YjVVt3
   Bgx3tDlg40McdW/gGdN4ahr7CvD2Gf255qK27qjKz6TY2WtRY34cUWN/G
   AvbPB6WiFLnVofYElBXC0rdq+XC7gTydFeQ7ej2q5Wm3mAvLjFEgCEnE4
   f/lsdrzliZbJOauJWwgdvFAL1k+p7/U/V4IJz4d9hYo3Jmx0oqb5e9gPN
   22LlRnrM7CFDye8bOauxHayPgJxzFWrxPxLZQF7vjj80JE76A58S9F0Hj
   w==;
X-CSE-ConnectionGUID: 3sJFrZQoRiGbd4h62e9Ogw==
X-CSE-MsgGUID: F22nBOLoTE+BbrpDzjDciA==
X-IPAS-Result: =?us-ascii?q?A0BHAgABTQVr/8tK/pBaglmCV3VhQkkDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLAVYcAwECLysjCBmDAgGCdAIBEbocGzeBeTOBA?=
 =?us-ascii?q?YR+2zMBBQYUAYE4hUKIJF0YAYR9JxsbgXKBFYNqgQWBXAKIJgSCIoEMgVQYB?=
 =?us-ascii?q?ox5AoFPiElIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBHIEeg?=
 =?us-ascii?q?RKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1P?=
 =?us-ascii?q?AkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGFiELGxgNS?=
 =?us-ascii?q?BEsNxUZBD5uB5QUgxqBDggjAVaBVpM/kBWCIaERCiiDeYwklToaM6pyC5h9j?=
 =?us-ascii?q?gqVdA1QhGqBaDyBWXAVgyJTGQ+OOYNrzlsjNQsDLwEBBwIHDgMLgWiQAi2BT?=
 =?us-ascii?q?wEB?=
IronPort-Data: A9a23:b7jYHahPYRQuchVfYh2G/xSgX161NBEKZh0ujC45NGQN5FlHY01je
 htvWzuAO/3ZZDDwLo1yaoW0/E5V6J6AmtY3TFBtpH9hQyhjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvjf8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVD4cRZG1N38
 sYZBzoBMhDd3e/n572kH7wEasQLdKEHPasWt2slyXTSCuwrBMiZBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcXYT/7C7pm9AusrnDkazRCrVuPjaE2+GPUigd21dABNfKLIIPTFJoFwS50o
 EropT7/KDY+M+CyihCP6GqAlO3jliLSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXjJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:wI2WOqnYjZjaWfPTbUdoP6uCsa/pDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:ptw8XGyQGsZTyPY4d8+QBgVPAeILaE/ky03RDEW0VWY3ErDEblCPrfY=
X-Talos-MUID: 9a23:GHpRjAokioX9ZXfXp7Mezx84bsFCxICpNG1Ou58co+WWNwB7Oh7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62719787"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 08:40:43 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id BDBE51800015B
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:40:42 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 7295CCBF223; Tue, 24 Nov 2026 00:40:41 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 4/8] cups: Fix CVE-2026-61702
Date: Tue, 24 Nov 2026 00:40:29 -0800
Message-Id: <20261124084033.72286-5-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124084033.72286-1-asparmar@cisco.com>
References: <20261124084033.72286-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250971
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream 2.4.x fix for CVE-2026-61702 to
CUPS 2.4.11. The fixing commit is referenced in [1], and the public
advisory is referenced in [2].

[1] https://github.com/OpenPrinting/cups/commit/08a8a277ce2a8948a1af33552247a1ac53b72df3
[2] https://github.com/OpenPrinting/cups/security/advisories/GHSA-gq9p-4w7m-2f5g

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index b6d047dc98..abc6e98df9 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -35,6 +35,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-55453.patch \
            file://CVE-2026-55467.patch \
            file://CVE-2026-55480.patch \
+           file://CVE-2026-61702.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-61702.patch b/meta/recipes-extended/cups/cups/CVE-2026-61702.patch
new file mode 100644
index 0000000000..761e36caf5
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-61702.patch
@@ -0,0 +1,73 @@
+From 16ff31880ce331bac3758a0435430b18a81d77e0 Mon Sep 17 00:00:00 2001
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
+index 1721845974..6a62382cd5 100644
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
-- 
2.35.6

