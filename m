Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30854C54FD4
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32607.1771565685880906200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ujhl+gfM;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1897; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ROHVtplBOLmYHK66CK7hXBwnyzAi48+GF5LKcUuvrtY=;
  b=Ujhl+gfMUeFowhF87MI+xE55kkWxW/tZFlxxIt0s2yVtSBLsAJva9JUd
   KaL5tSBnIZz57uX5l+GDRKQMrfLoJbi2Ntuvv10b+eLFoqFkJz6qpBTOg
   d6/0T5POoNJ0HgK1XcPHL7/Af5CInZQqzTWs5Onkux8BPNFJ9xigCddOK
   HrbOHzQfp2O46aLnt7KkFgfEy1vUwwv8FAHzj5cUpt6uK7nX12qz22OFv
   O399txP9+BbCPNPUq1a1IuTqdB33lk5iBMVUXyregusy0SbPlSacpD791
   PXZZXB2hjHT+Bi4OCx5+JhOcHJF+Qa0y4uPY0ONMpB/zHbeBUiLnz+8gU
   Q==;
X-CSE-ConnectionGUID: kNeFVB10TvKN0dve6zQpfQ==
X-CSE-MsgGUID: r5aDJLo/RgesuV92LII66g==
X-IPAS-Result: =?us-ascii?q?A0BCBABB8Zdp/5L/Ja1aglmCSA9xX0JJA5ZLnhqBfw8BA?=
 =?us-ascii?q?QEPNxoEAQGFBwKNHwImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWwIBAzIBRhAgJgsrKxmDAgGCcwIBp1aCLIEB4CIBCxQBg?=
 =?us-ascii?q?TiFPIgZawmEeicbG4FyhH2FEIV3BIMwk09IgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQsbBwWCQoURD4kFeG6BIIEbAwsYDUgRLDcUGwQ+bgeOLz+CN?=
 =?us-ascii?q?IEOVad3oQ4KKIN0jB6VOhozhASmZ5kGgliiAYRogWg8gVlwFYMiCUkZD45fg?=
 =?us-ascii?q?h27fSI1EykCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:VTOBkqD+s/VycxVW/37iw5YqxClBgxIJ4kV8jS/XYbTApDoj1DwDy
 zFJCmjTbviKMTH0Koh1O97iphtX7JXRzINiOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWmthh
 fuo+5eBYAX/g2YvWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEwNNjIn8cZNUk5MVRWW1Q+
 KIKESgDV0XW7w626OrTpuhEnM8vKozveYgYoHwllWCfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYxBPjDS0Un1lM/CJ8ihO60rnL+aDZf7lmSoMLb5kCNk1ItiemxYYe9ltqiX5hcsmS8o
 SX88GniHy9Lbvi+6GTb/Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aetRIaHt4VGOog5UTVm+zf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ02FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:cLxJfKyMd20xMtSmSZydKrPwK71zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIC5IOa+EZyTNB/L/HCM7SKadH/OW6
X-Talos-CUID: 9a23:kTV4HGAR3hibNcr6EypB+WAqMJl9TmP+6i/cPULmG19xRoTAHA==
X-Talos-MUID: 9a23:r6xhIQhQp+EpUTzdWPEbK8MpLpphz4aKDwc3npgdpvfVbwhRGmnDg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="676419495"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 979A4180005A2;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id E25E4CC8D09; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 29/34] cve-update-db-native: Fix FKIE CVE accessVector parsing
Date: Thu, 19 Feb 2026 21:34:38 -0800
Message-Id: <20260220053443.3006180-29-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231479

From: Jonathan Schnitzler <jonathan.schnitzler@faro.com>

Use "attackVector" for CVSS >= 3 as it only CVSS v2 uses "accessVector".

Signed-off-by: Jonathan Schnitzler <jonathan.schnitzler@faro.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7e4d566445a8cbe1e540e20837d45692d81af77f)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index a0494aa329..39a26a2481 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -352,7 +352,7 @@ def update_db_fkie(conn, jsondata):
         try:
             for m in elt['metrics']['cvssMetricV30']:
                 if m['type'] == 'Primary':
-                    accessVector = m['cvssData']['accessVector']
+                    accessVector = m['cvssData']['attackVector']
                     vectorString = m['cvssData']['vectorString']
                     cvssv3 = m['cvssData']['baseScore']
         except KeyError:
@@ -361,7 +361,7 @@ def update_db_fkie(conn, jsondata):
         try:
             for m in elt['metrics']['cvssMetricV31']:
                 if m['type'] == 'Primary':
-                    accessVector = m['cvssData']['accessVector']
+                    accessVector = m['cvssData']['attackVector']
                     vectorString = m['cvssData']['vectorString']
                     cvssv3 = m['cvssData']['baseScore']
         except KeyError:
@@ -370,7 +370,7 @@ def update_db_fkie(conn, jsondata):
         try:
             for m in elt['metrics']['cvssMetricV40']:
                 if m['type'] == 'Primary':
-                    accessVector = m['cvssData']['accessVector']
+                    accessVector = m['cvssData']['attackVector']
                     vectorString = m['cvssData']['vectorString']
                     cvssv4 = m['cvssData']['baseScore']
         except KeyError:

