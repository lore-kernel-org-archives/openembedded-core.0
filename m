Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460AEC44502
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 09:23:00 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8061.1768987373873913917
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 01:22:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=U2PbwlLt;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4008; q=dns/txt;
  s=iport01; t=1768987373; x=1770196973;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DmWinzJJuWhaaB9UK0ITMWfjSdTah0iusSSM9NNzDVI=;
  b=U2PbwlLt6bIi1b7Mvkw/YFWhbxkllVwi3OvSUgkSTB6hQ2ndZoFABLpm
   uEGepnp4ljfJWJt23cMFcrWpCgDRDpZvhfgOMnW5RRW3evA8Zo6r/TOTs
   Ic77S/tAEzg5HR+uSx/HgtCwPxfikJgdiNAsoqeIufwQ9q3YvGdHplGjX
   SDEoUj9sBSIKlFCeFyA1osy2yjM70Y3LXRg3TK8nh0Qt8YzgCFx5oDeOM
   ifZ22bLJqpvPr7DXv5IUi1CBoZ7TIqh7Eq11zTR27SQrWODJ+1YZsUmuW
   fIII84MAOfZEqoLmREqHtWMufr44CRy2PkB17rj7hxnhblJ1tntRR239O
   Q==;
X-CSE-ConnectionGUID: KaGmZd/bSIaEqTw5SNhvGA==
X-CSE-MsgGUID: R47lqCxLQLCsy6TQ6YEeGg==
X-IPAS-Result: =?us-ascii?q?A0AmAwB4mXBp/4r/Ja1aHgE8DAILgWWCSA9xX0JJA5NXA?=
 =?us-ascii?q?YJwnh2Bfw8BAQEPPRQEAQGFB40DAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4YVCDINhl02AUYwXESDAgGCcwIBEa8bgiyBAYR82?=
 =?us-ascii?q?yYBCxQBgTiFO4gXaAmEeCcbG4FyhA5vgmEEGIgKBIIigQ6UB0iBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWYDNRIqFW4yHYEjPheBChsHBYEJBoNthQ4PiSd4gQADCxgNSBEsN?=
 =?us-ascii?q?xQbBD5uB48ARYIuAYENLHslpwChDgoog3SMHpU6GjOEBKZnmQaCWIsxllCEa?=
 =?us-ascii?q?IFoPEaBE3AVgyIJSRkPh36GYYIdhjjCQCI1AhEpAgcLAQEDCZNnAQE?=
IronPort-Data: A9a23:gwD116NjkWnBXTvvrR3ylsFynXyQoLVcMsEvi/4bfWQNrUp2gzIFz
 TZNUT2GOP6OYGv1f99+aY7j8h9Q78fUyNYwGnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVrlV
 e/a+ZWFZgf8gWYsaQr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69ZnI0QEMcoSwcd+LHhy6
 qEjDjATQTnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmAS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2M0PHwsYDUXUrsTIJIzgP+hmlH0ciZTrxSeoq9fD237kFEpi+m8bIKKEjCMbf8JwUKBj
 XLixkDSGQBECOXB+BeI3X3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvOS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6tV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:CV3EiK9C7zGNx7y1P8luk+DTI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJ8U7ndQtsp
 uJtMNFebnNMWQ=
X-Talos-CUID: =?us-ascii?q?9a23=3A55Gkq2ph+JehRa2SkJUesyHmUeMsXXjvwDDaGG6?=
 =?us-ascii?q?xJH9VV+Cub1+O14oxxg=3D=3D?=
X-Talos-MUID: 9a23:OhEW9QZ1Ny8S1eBTjWOzgChJJONRx4+1GR4xqMs3lsSrOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,242,1763424000"; 
   d="scan'208";a="450399407"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jan 2026 09:22:53 +0000
Received: from sjc-ads-1153.cisco.com (sjc-ads-1153.cisco.com [171.70.58.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id ED276180001C7;
	Wed, 21 Jan 2026 09:22:52 +0000 (GMT)
Received: by sjc-ads-1153.cisco.com (Postfix, from userid 1847788)
	id 955BFC667C3; Wed, 21 Jan 2026 01:22:51 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core] [master] [PATCH] cve-update-nvd2-native: Use maximum CVSS score from all sources
Date: Wed, 21 Jan 2026 01:22:50 -0800
Message-Id: <20260121092250.3847197-1-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.58.95, sjc-ads-1153.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 09:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229800

From: Het Patel <hetpat@cisco.com>

The CVE check system was incorrectly reporting lower CVSS scores when
multiple scoring sources were available in the NVD database. This
occurred because the code only extracted the first element from the
CVSSv2, CVSSv3, and CVSSv4 metrics arrays, which could be a Secondary
source with a lower score instead of the Primary source with the
actual severity score.

This fix takes maximum CVSS score.

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15931

Signed-off-by: Het Patel <hetpat@cisco.com>
---
 .../meta/cve-update-nvd2-native.bb            | 55 +++++++++++++------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 8c8148dd92..41c34ba0d0 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -350,32 +350,55 @@ def update_db(conn, elt):
         if desc['lang'] == 'en':
             cveDesc = desc['value']
     date = elt['cve']['lastModified']
+
+    # Extract maximum CVSS scores from all sources (Primary and Secondary)
+    cvssv2 = 0.0
     try:
-        accessVector = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['accessVector']
-        vectorString = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['vectorString']
-        cvssv2 = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['baseScore']
+        # Iterate through all cvssMetricV2 entries and find the maximum score
+        for metric in elt['cve']['metrics']['cvssMetricV2']:
+            score = metric['cvssData']['baseScore']
+            if score > cvssv2:
+                cvssv2 = score
+                accessVector = metric['cvssData']['accessVector']
+                vectorString = metric['cvssData']['vectorString']
     except KeyError:
-        cvssv2 = 0.0
-    cvssv3 = None
+        pass
+
+    cvssv3 = 0.0
     try:
-        accessVector = accessVector or elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['attackVector']
-        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['vectorString']
-        cvssv3 = elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['baseScore']
+        # Iterate through all cvssMetricV30 entries and find the maximum score
+        for metric in elt['cve']['metrics']['cvssMetricV30']:
+            score = metric['cvssData']['baseScore']
+            if score > cvssv3:
+                cvssv3 = score
+                accessVector = accessVector or metric['cvssData']['attackVector']
+                vectorString = vectorString or metric['cvssData']['vectorString']
     except KeyError:
         pass
+
     try:
-        accessVector = accessVector or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['attackVector']
-        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['vectorString']
-        cvssv3 = cvssv3 or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['baseScore']
+        # Iterate through all cvssMetricV31 entries and find the maximum score
+        for metric in elt['cve']['metrics']['cvssMetricV31']:
+            score = metric['cvssData']['baseScore']
+            if score > cvssv3:
+                cvssv3 = score
+                accessVector = accessVector or metric['cvssData']['attackVector']
+                vectorString = vectorString or metric['cvssData']['vectorString']
     except KeyError:
         pass
-    cvssv3 = cvssv3 or 0.0
+
+    cvssv4 = 0.0
     try:
-        accessVector = accessVector or elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['attackVector']
-        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['vectorString']
-        cvssv4 = elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['baseScore']
+        # Iterate through all cvssMetricV40 entries and find the maximum score
+        for metric in elt['cve']['metrics']['cvssMetricV40']:
+            score = metric['cvssData']['baseScore']
+            if score > cvssv4:
+                cvssv4 = score
+                accessVector = accessVector or metric['cvssData']['attackVector']
+                vectorString = vectorString or metric['cvssData']['vectorString']
     except KeyError:
-        cvssv4 = 0.0
+        pass
+
     accessVector = accessVector or "UNKNOWN"
     vectorString = vectorString or "UNKNOWN"
 

