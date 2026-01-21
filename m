Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D5D5C44502
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 10:08:40 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8491.1768990115485094673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 02:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VmKj0XMk;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4057; q=dns/txt;
  s=iport01; t=1768990115; x=1770199715;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mdYIwnXPMdC2MlSEYLWZ4jYgl0d/advlDEOipfD4iDI=;
  b=VmKj0XMkMgg1+xdpScynKOuEMevFhatoPn87CUDUkgok3DCG6VlsKabh
   W74s1XNaOlSXd/E7buOWX78ccaJwJR2lBwgCEYgu+8XrR3BweningPbXc
   PSFcQiPKbL+oWw2ineTkocvzDJw3mYyoOpV5FgkthwrdVZxwsKlnfo0SJ
   Ge1a8eW3wjOfpW2hIGJntqGt0BIfW5On/vmAKrALcfUbcUYI4xF+OAE8n
   Km2NKhOrqiVupuoPAWrSEqVbld7N43TI0NugQwwG3LfhOHmgYA+Qqo7Qt
   seI6bIen0wuQMT+ugSdIdQGAugMlO81ajGYA8Rwyg3M9Kyws9MljFWgRu
   A==;
X-CSE-ConnectionGUID: hwfaZ5oiSJyIELT0h9+GMw==
X-CSE-MsgGUID: vs8eyTElSKOfkkLYrT1m0g==
X-IPAS-Result: =?us-ascii?q?A0AmAwBtpHBp/47/Ja1aHgE8DAILgWWCSA9xX0JJA5NXA?=
 =?us-ascii?q?YJwnh2Bfw8BAQEPNxoEAQGFB40DAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4YVCDINhl02AUYwXESDAgGCcwIBry+CLIEBhHzbJ?=
 =?us-ascii?q?gELFAGBOIU7iBdoCYR4JxsbgXKEDm+LBwSCIoEOlAdIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQobBwWBCQaDbYUOD4kneIEAAwsYDUgRLDcUGwQ+b?=
 =?us-ascii?q?gePAEWCLgFzGoEnJacAoQ4KKIN0jB6VOhozhASmZ5kGgliiAYRogWg8RoETc?=
 =?us-ascii?q?BWDIglJGQ+HfoZhgh3JJyI1EykCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:bPVQqKBkSxloVRVW/37iw5YqxClBgxIJ4kV8jS/XYbTApDlw0jwBz
 zRJX26HOv+LM2TyKdslYY7kpklXvJbQnYdmOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWmthh
 fuo+5eBYAb/g2YvWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEw+pgBXNrOowj2PdWLEVyr
 fxJax8ocUXW7w626OrTpuhEnM8vKozveYgYoHwllWyfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY1BPjDS0Un1lM/CJ8ihO60rnL+aDZf7lmSoMLb5kCPkVQviua2aoe9ltqiW94Fk1eki
 2b93EP3ARI+BcajkD/d/Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aetRIaHt4VGOog5UTVl+zf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ12FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:IuNRI6ztXEc96HbeWlMfKrPwJ71zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcKuweQeBEXMoVmpM
 Bdm28UMqyVMWRH
X-Talos-CUID: =?us-ascii?q?9a23=3AolRWhWujwvk2555MYvgwtjxh6IslbXPU/irXInS?=
 =?us-ascii?q?aGEdEbIHNSQ7T14Z7xp8=3D?=
X-Talos-MUID: 9a23:iE7dEwjstKl3uERNm0MQlsMpKtw47rWSJUQ2srIIuMqgBDZMYjLFg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,242,1763424000"; 
   d="scan'208";a="450626325"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jan 2026 10:08:34 +0000
Received: from sjc-ads-1153.cisco.com (sjc-ads-1153.cisco.com [171.70.58.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 7B9E518000370;
	Wed, 21 Jan 2026 10:08:34 +0000 (GMT)
Received: by sjc-ads-1153.cisco.com (Postfix, from userid 1847788)
	id 24446C64E40; Wed, 21 Jan 2026 02:08:34 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core] [PATCH v2] cve-update-nvd2-native: Use maximum CVSS score from all sources
Date: Wed, 21 Jan 2026 02:08:32 -0800
Message-Id: <20260121100832.448281-1-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.58.95, sjc-ads-1153.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 10:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229803

From: Het Patel <hetpat@cisco.com>

The CVE check system was incorrectly reporting lower CVSS scores when
multiple scoring sources were available in the NVD database. This
occurred because the code only extracted the first element from the
CVSSv2, CVSSv3, and CVSSv4 metrics arrays, which could be a Secondary
source with a lower score instead of the Primary source with the
actual severity score.

This fix iterates through all available sources and takes the maximum
CVSS score to ensure the highest severity is reported.

Fixes [YOCTO #15931]

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
 

