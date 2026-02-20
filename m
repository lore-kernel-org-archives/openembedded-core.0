Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC8EC54F5F
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32609.1771565686307896284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NQUY2tEi;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1689; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dnLui5VxMHB3tI9xn7ldnubgvUeeB3edEqlZY3PxlMI=;
  b=NQUY2tEiV7iiSX4mTCOf0r/Yo5biNX5Pj8VPI25iOL0ZIcSpE75oj4jP
   DsJDWUM4riR7RKoAiRiErYnVyLekRAsu+PJdZ5AF7t9+yZu6zOwWoJEyJ
   MZ2QghIHUewIjTp67VsRVCAoLoUj9U+zqKWq2N31MN4lYGNpwOFbd2A/+
   RjdUA3/yIRTm4iyC441AOldbR6VRGVXGADpgCau4SXKkWb77a8KOjY1Ub
   fNdEDHtkrX/BlDNpGV+4brh6Yyah9Q2uMcqXDqaAjFNbzFARlDU5UINPr
   ERfZ0uLwdx6Lx42m56f/yvnPJhX7J0R1iuRqa5fgWbeBOC3zzbflaVrDe
   w==;
X-CSE-ConnectionGUID: P93MDucrThiUiJkTRFTJQw==
X-CSE-MsgGUID: VcIed4+WQzKFd5zBv/Ff0A==
X-IPAS-Result: =?us-ascii?q?A0BCBAC68Zdp/4z/Ja1aglmCSA9xX0JJA5ZLnhqBfw8BA?=
 =?us-ascii?q?QEPNxoEAQGFBwKNHwImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWwIBAzIBRhAgJgsrKxmDAgGCcwIBp0+CLIEB4CIBCxQBg?=
 =?us-ascii?q?TiFPIgZawmEeicbG4FygRWDaIQKgQaFdwSCIoEOk09IgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQsbBwWCQoURD4kFeG6BIIEbAwsYDUgRLDcUGwQ+b?=
 =?us-ascii?q?geOLz+CNHsTlg2SP6EOCiiDdIwelToaM4QEpmeZBoJYoSRdhGiBaDyBWXAVg?=
 =?us-ascii?q?yIJSRkPjl+CHbwdIjUTKQIHCwEBAwmRaoF9AQE?=
IronPort-Data: A9a23:b5/rQKtvPP035jjl/oJWqcZkPefnVAFfMUV32f8akzHdYApBsoF/q
 tZmKWrTOq7fajekL9AgPI+39k5VvsCAn9JiHAZv+Xs1QywagMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYTdJ5xYuajhKs/jZ8Es01BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwwrcsJE1T/
 uYkKDEwbzKAu9iY/JCCVbw57igjBJGD0II3oHpsy3TdSP0hW52GG/6M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtPYH49tL/Aan3XczBEsFuJjaE2+GPUigd21dABNfKLJIzQHpgFwxvwS
 mTuwW/YDx1Gd+Om2xmr/i++rPGIsy2jcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cFXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Pxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:63AmaaDOAKP8B23lHemr55DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygck79
 YCT0C7Y+eAdGSTSq3BkW+FL+o=
X-Talos-CUID: 9a23:Mio63mCJ+xGLsjr6ExE2r2s4B8s/Tn3c8XbyIHOCJ1pLcaLAHA==
X-Talos-MUID: 9a23:lVk4tQWZJOobkVnq/AHnpTxuaIRX2raNJkxQg78Y/OeKbQUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="668235855"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 8DF32180005A9;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id C2675CC8CB9; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 23/34] cve-update-db-native: fix fetcher for CVEs missing nodes
Date: Thu, 19 Feb 2026 21:34:32 -0800
Message-Id: <20260220053443.3006180-23-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231476

From: Peter Marko <peter.marko@siemens.com>

As of now, update of CVE DB from FKIE source (which is the defailt)
fails with following error:

File: '<build>/poky/meta/recipes-core/meta/cve-update-db-native.bb', lineno: 393, function: update_db_fkie
     0389:                [cveId, cveDesc, cvssv2, cvssv3, cvssv4, date, accessVector, vectorString]).close()
     0390:
     0391:        for config in elt['configurations']:
     0392:            # This is suboptimal as it doesn't handle AND/OR and negate, but is better than nothing
 *** 0393:            for node in config["nodes"]:
     0394:                parse_node_and_insert(conn, node, cveId, False)
     0395:
     0396:def update_db(d, conn, jsondata):
     0397:    if (d.getVar("NVD_DB_VERSION") == "FKIE"):
Exception: KeyError: 'nodes'

Entry for new CVE-2025-32915 is broken.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 152be29f6a732b2ba1c95bcf465455d2a5a3f33a)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 792252f510..320bd452f1 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -390,7 +390,7 @@ def update_db_fkie(conn, jsondata):
 
         for config in elt['configurations']:
             # This is suboptimal as it doesn't handle AND/OR and negate, but is better than nothing
-            for node in config["nodes"]:
+            for node in config.get("nodes") or []:
                 parse_node_and_insert(conn, node, cveId, False)
 
 

