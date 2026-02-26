Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F45FCE072
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:54:20 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69121.1772110457805972695
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BKQxtmpy;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=812; q=dns/txt;
  s=iport01; t=1772110457; x=1773320057;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8td9pcBT9tK1k6KXH21pwNKx4i+WtEb8Kl0sJaqY9YY=;
  b=BKQxtmpyvsKDIUdi7P0hzh0j04A7ImeSggYcYxaqHjK21FF91MFtjkec
   jpEoNUcYVeIcxG+IYkknTD/G40WJfG/uS4Crk+BVJyGhROcO2Hx6lJkoK
   4djAmeM3q4lLYXHbgCgFZN57Oj06lqIsYHOxhC0M/UwuBR2RHM1UEeo/4
   TM0dzQYuw9Bhr8BEsnnFfCOIDWYAt+NC4MDcOR0zKvcLLyU4WjOKilt2S
   f1+jFK4mCgkHliIiPLWIVzQ0Cr3+TaFsK31p5SrZBDBzeMBXCXemqM5f7
   COxktWoKdqEgqu54PFxZVlf/Z6CWZFj1oItscAltIen35Dw0skdTyRRSa
   Q==;
X-CSE-ConnectionGUID: VyV3w6THSJi2xQv3HgmS0A==
X-CSE-MsgGUID: 7BPkFrn2T52lmw7hXAPpeA==
X-IPAS-Result: =?us-ascii?q?A0A0BwA0QaBp/47/Ja1aglmCSA9xX0JJlk6eGoF/DwEBA?=
 =?us-ascii?q?Q83GgQBAYUHAo0fAiY2Bw4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZchlsCAQMyARgBLRAgMSsrGYMCAYJzAgGmb4IsgQGDKAGBU9smA?=
 =?us-ascii?q?QsUAYE4hTyIGXSEeicbG4FyhH2FEIV3BIIigQ6Bf4V9BosMSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4EKGwcFhggPiHR4boEaggQDCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB41pP4I0dBoBgQGBZ6NCgiGhDgoog3SMHpU6GjOqay6YWKRZhGiBbworg?=
 =?us-ascii?q?VlwFYMiCUkZD9klIjUCOgIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:Qwl0e6ujT4nwl9DcR2fLIrpZ9OfnVAFfMUV32f8akzHdYApBsoF/q
 tZmKW2OPffeYzGjKoh0b4+0p0IA7ZHRzoBhGgo5q3o3RSsUgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYTdJ5xYuajhKs/jZ9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwxPdJWn4Qy
 dwjCjFXfimd3MK5xYnjY7w57igjBJGD0II3oHpsy3TdSP0hW52GG/iM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtNYH49tL/Aan3XczBEsFuJjaE2+GPUigd21dABNfKLJYPRG58EwxvwS
 mTuoE7BAT8AMoajlGCB923zht/mpTv2cddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cE3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:IhUGWKnDC4JmNKY4GohOQDPHWp3pDfIr3DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDSJNykYsS4/izPIaurJB7K8gcaVuds=
X-Talos-CUID: 9a23:zygNZG0xTpl8GRZCN2PyobxfJNEbKWKD8FfrAU7iGV93E52aTGTI0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3A4TkDeA+uQ6j9SxCIJd9Fz5mQf5hC26eAEkZXrch?=
 =?us-ascii?q?cv8ybaixAEg+FgR3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,312,1763424000"; 
   d="scan'208";a="677362955"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Feb 2026 12:54:17 +0000
Received: from sjc-ads-4197.cisco.com (sjc-ads-4197.cisco.com [171.70.54.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id DA0141800021A;
	Thu, 26 Feb 2026 12:54:16 +0000 (GMT)
Received: by sjc-ads-4197.cisco.com (Postfix, from userid 1847788)
	id 81395CC1284; Thu, 26 Feb 2026 04:54:16 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [OE-core] [PATCH v1] python3-dbus: Add CVE_PRODUCT to support product name
Date: Thu, 26 Feb 2026 04:54:15 -0800
Message-Id: <20260226125415.53196-3-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260226125415.53196-1-hetpat@cisco.com>
References: <20260226125415.53196-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.54.218, sjc-ads-4197.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 12:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232018

From: Het Patel <hetpat@cisco.com>

- Set CVE_PRODUCT to align with the NVD CPE and ensure correct CVE
reporting.

Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/recipes-devtools/python/python3-dbus_1.4.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-dbus_1.4.0.bb b/meta/recipes-devtools/python/python3-dbus_1.4.0.bb
index 2854eda30a..00b75653fe 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.4.0.bb
@@ -21,3 +21,6 @@ RDEPENDS:${PN} = "python3-io python3-logging python3-stringold python3-threading
 FILES:${PN}-dev += "${libdir}/pkgconfig"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "freedesktop:dbus"

