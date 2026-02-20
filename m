Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9753DC55175
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32604.1771565685718979248
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dHcCEsjB;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1911; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4tYobBB9+tnMnKe1rbOLGJ6ch7T5XBBkpY5oerevvxU=;
  b=dHcCEsjBrLF0gilukfAoptPli1gg92HMFZN9xfVZ5LI0G34Jb8X7Bvhs
   ZLvi+AG4FwOBFBUgDasg/vu2jtDYpfFVzQcj4DGypA3aD9ZxxcA2q0E5x
   p3eBysB5I4gLJrLDbarGXnDSBY9U7RwnSM92vMJ89r03L8GVPHwuaqwKs
   83KW4U2kA0v3r8K+Gt74KlRZ56ssK7PtX+JyRZNAlN4oikcWQJjaqa4XC
   A6d3sm2fb4dT6FdxkIGm0beYI0ZB26gt8e5Os4aKQQaRsQImmwvZGFIsX
   +9MLdTw7gw/TSdtW5gqc//Tz+y3U5Q8snqT5fh1dmkjjU89N/MM+2AMU3
   Q==;
X-CSE-ConnectionGUID: WultXbJPT1ix14G508qr2A==
X-CSE-MsgGUID: lLoa3GLhQcuu7mVVIJDzHg==
X-IPAS-Result: =?us-ascii?q?A0BCBACY8Jdp/43/Ja1agjQQGoJED4FQQkmWTotkkjaBf?=
 =?us-ascii?q?w8BAQEPUQQBAYUHAo0fAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGXIZbAgEDMgFGECAxIAsrGYMCgjsDNgIBqgaCLIEBhHyyK?=
 =?us-ascii?q?Q2CUgELFAGBOIU8gnmFIFoahHonGxuBcoR9gQUBgRmCcYV3BIMwk09IgR4DW?=
 =?us-ascii?q?SwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQsbBwWHUw+JBXhugSCBGwMLGA1IE?=
 =?us-ascii?q?Sw3FBsEPm4Hji8/gi0HAXoTQ6gJoB1xCiiDdJtchXwaM6prmQaSEpIQN4Rog?=
 =?us-ascii?q?Wg8gVlwFYMiUhkPjjgnygMiNTwCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:qOHb7q00Fgc02q0dGPbD5Wlzkn2cJEfYwER7XKvMYLTBsI5bpzQOy
 zYcC2iPaa6MYjTwLop1Odm2oEpVuZTWm4A1QVNp3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4EzwY9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX4
 Lsen+WFYAX7g2QuajpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauG4ycbjG
 o4vZJnglo/o109F5uGNy94XQWVWKlLmBjViv1INM0SUbreukQRpukozHKJ0hU66EFxllfgpo
 DlGncTYpQvEosQglcxFOyS0HR2SMoV55bvbEXKdifDKzl2fL1Sxm6V3FhsfaNhwFuZfWQmi9
 NQCIzwLKxTGjOWszffjFq9nh98oK4/gO4Z3VnNIlG6CS615B8qeHuOTuYYwMDQY3qiiGd7ea
 tYBYCZHZxXbaBoJMVASYH47tLn41iCmKWAC8Dp5o4Izx2/alyNV0IHmLceKf+K0ZOd5jGaX8
 zeuE2PRR0ty2Mak4T2d/3Shg+XCkS/2VMcZE6e13vprm0GIgGsLBRsbUFG2rfW0hgi5Qd03F
 qAP0jAloa538AmgScPwGkXk5nWFpRUbHdFXFoXW9T2w90Yd2C7BbkBsc9KLQIZOWBMeLdDy6
 mK0og==
IronPort-HdrOrdr: A9a23:8AdmgKhG6+bZjL4duIl8O3r5dnBQXt0ji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4aXLfDtHZQKQ2njALz7mq+P3lpyVuQ==
X-Talos-CUID: 9a23:9cnGRm17LVjllPQs7lePEbxfJd0hbk3X7k/sek6oUDpGFeXFUEXK0fYx
X-Talos-MUID: 9a23:Hm69qAYJBOW1V+BTsxvrjWpNEMdR6LmzV0Uzr7Qkl9ukOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="688112520"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 2EBD718000189;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id 93240CC8CFD; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 13/34] cve-check: Fix errors in log lines
Date: Thu, 19 Feb 2026 21:34:22 -0800
Message-Id: <20260220053443.3006180-13-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231466

From: Colin McAllister <colinmca242@gmail.com>

Two warning lines in cve_check.py reference a variable that doesn't
exist. These would cause a runtime error if the conditions they are
hidden in were to be entered. The log lines have been updated to no
longer reference an undefined variable.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c9d059e8a362b3c9d604f7ebe8fd1dd994f0af6b)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/lib/oe/cve_check.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index cd152df69a..8e676bcc74 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -253,7 +253,10 @@ def decode_cve_status(d, cve):
         description = status_split[4].strip()
     elif len(status_split) >= 2 and status_split[1].strip() == "cpe":
         # Malformed CPE
-        bb.warn('Invalid CPE information for CVE_STATUS[%s] = "%s", not setting CPE' % (detail, cve, status))
+        bb.warn(
+            'Invalid CPE information for CVE_STATUS[%s] = "%s", not setting CPE'
+            % (cve, status)
+        )
     else:
         # Other case: no CPE, the syntax is then:
         # detail: description
@@ -263,9 +266,13 @@ def decode_cve_status(d, cve):
     status_out["product"] = product
     status_out["description"] = description
 
-    status_mapping = d.getVarFlag("CVE_CHECK_STATUSMAP", status_out['detail'])
+    detail = status_out["detail"]
+    status_mapping = d.getVarFlag("CVE_CHECK_STATUSMAP", detail)
     if status_mapping is None:
-        bb.warn('Invalid detail "%s" for CVE_STATUS[%s] = "%s", fallback to Unpatched' % (detail, cve, status))
+        bb.warn(
+            'Invalid detail "%s" for CVE_STATUS[%s] = "%s", fallback to Unpatched'
+            % (detail, cve, status)
+        )
         status_mapping = "Unpatched"
     status_out["mapping"] = status_mapping
 

