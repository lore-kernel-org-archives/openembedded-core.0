Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14436D29DE4
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 07:08:50 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53722.1768288123718473636
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 23:08:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MeEavi4x;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3942; q=dns/txt;
  s=iport01; t=1768288123; x=1769497723;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=C1rlC1t7a/F4dKXu4YIgVC5RU2zW5MVsQmj2K1Ho/iw=;
  b=MeEavi4xFaxhx3aQW3a+R4YvBqzD7QDYEOUySma8e9lpThFOzFD8w/mv
   wlcQagdL+d5GSmE5Z1hSLdcucJEut5G+M79A/VPQZFjJNkO/Vl9kDtjE3
   3xF6OzGXgdMFwOsi5ui9yMKEW5OfjnzzSsimbmNs4rBhUjR7k2xz9WA95
   src6sDXM7TdejDeeRjILPQzsn+dbs2yS4AaVCbDKpMqwIdJH1Ws9dc6/V
   kGlwQdM9mYc/bYsukW5jbCGviIwFHZzVofWXlmL1y+j+iWxRyd/uKfNun
   01ZO7fNnUB0Mf0CgzeC3M/5lZO7N7FinW/40iqNgvjXG2/rJuThwWq4e5
   A==;
X-CSE-ConnectionGUID: WRENTnCTTkOCRPpc6r9/vA==
X-CSE-MsgGUID: VcCu/7zFRTKnUZBZdDLcEw==
X-IPAS-Result: =?us-ascii?q?A0DLBQB77mVp/4r/Ja1aHgE8DAILgWWCSA9xX0JJA5NXA?=
 =?us-ascii?q?aENgX8PAQEBDzcaBAEBhQeMbgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGFQgyDYZdNgFGMFxEgwIBgnMCAathgiyBAYR82yQBC?=
 =?us-ascii?q?xQBgTiFO4gXhWknGxuBcoQOi3YEgiKBDpQeSIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVMjwyHYEjPheBChsHBYF4Boh9D4lFejoDCxgNSBEsNxQbBD5uB480gnIBg?=
 =?us-ascii?q?Q2BJyWnAKEOCiiDdIwelToaM4QEpmeZBoJYogGEaIFoPEaBE3AVgyIJSRkPh?=
 =?us-ascii?q?36GYYIdwFsiNRMpAgcLAQEDCZNnAQE?=
IronPort-Data: A9a23:+UgX36CR3Lj0WBVW/37iw5YqxClBgxIJ4kV8jS/XYbTApGslgTQPn
 GoWWT+CP/yJMWv9L9siOouxpEpUvJTdxtA3OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWmthh
 fuo+5eBYAb8gGYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE/M9DKn0wFrEk+cFcO1lW/
 qICeXcTR0XW7w626OrTpuhEnM8vKozveYgYoHwllWifBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGE/BPjDS0Un1lM/CJ8ihO60rnL+aDZf7lmSoMLb5kCPl1QtieG9boe9ltqie85+gwHHt
 Ez8w0f/PyMwBtCz7TGo7Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aetRIaHt4VGOog5UTVk+zf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:b7tSY6x8p6Fai4v9ACknKrPwJ71zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcKuweQeBEXMoVmpM
 Bdm28UMqyVMWRH
X-Talos-CUID: 9a23:rWOxLmPZoSTCau5DZxNK0nISMfwZcVr29k/IKBGiWCF3YejA
X-Talos-MUID: =?us-ascii?q?9a23=3ATOM56A374TLgRsfuQCA7g2MCODUj3a+FFQdSg7s?=
 =?us-ascii?q?8h+qCCB5aCTuxqD+aXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,222,1763424000"; 
   d="scan'208";a="430411865"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Jan 2026 07:08:42 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id B938918000281;
	Tue, 13 Jan 2026 07:08:42 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id 6588ACC8CB9; Mon, 12 Jan 2026 23:08:41 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core] [scarthgap] [PATCH] Fix CVE CVSS scoring to use maximum score from all sources
Date: Mon, 12 Jan 2026 23:08:40 -0800
Message-Id: <20260113070840.115911-1-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 07:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229229

From: Het Patel <hetpat@cisco.com>

The CVE check system was incorrectly reporting lower CVSS scores when
multiple scoring sources were available in the NVD database. This
occurred because the code only extracted the first element from the
CVSSv2, CVSSv3, and CVSSv4 metrics arrays, which could be a Secondary
source with a lower score instead of the Primary source with the
actual severity score.

This fix takes maximum CVSS score.

Signed-off-by: Het Patel <hetpat@cisco.com>
---
 .../meta/cve-update-nvd2-native.bb            | 55 +++++++++++++------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 945bd1d927..28d5810d5d 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -352,32 +352,55 @@ def update_db(conn, elt):
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
 

