Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC11DC54F56
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:49 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32604.1771565685718979248
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jdC5pler;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3697; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uu63rp130Co2U8bM5TBz5yzMBIwtq+1c9+6UplpKaY4=;
  b=jdC5plergb+oxH3pBut+tY2FiyKPXCsFc7ZCK92YVNf8876dwJCzEIOo
   FQAE8uQu9MuDijphkQVNBN7awa5vqztxRSt6F8INcZ0kfhIlI/uSZcGdS
   08w6r9jTeihuTKflfD/tRI5cCJXctaXQ/oHDPAayjq3N6NNXEkxc2d6K0
   1g51WIpe9fxGCTd9XPGRDrdeXthOTREwO1LEnOlKPF+DxNIrta+zPMSjD
   M97hLJGFGwhPkVzE53TaviYcawdubCYtcPT8kMSy5Dud+iYJS4/5+gcrD
   jfvd8KjTBUY/EPs7CGVyByvkm2dH97rTEBgK2v6XZDjZfom0/wjY+q7ul
   Q==;
X-CSE-ConnectionGUID: ovWd0XnORKK+APEV4x0dEg==
X-CSE-MsgGUID: 5p0Gnid+Ro60F/wMauXs9Q==
X-IPAS-Result: =?us-ascii?q?A0BFBACY8Jdp/5L/Ja1agjQQGoJED3FfQkkDlkueGoF/D?=
 =?us-ascii?q?wEBAQ83GgQBAYUHAo0fAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWwIBAzIBRhAgJgsrKxmDAgGCcwIBqgaCLIEBugQBC?=
 =?us-ascii?q?xQBgTiFPIgZawmEeicbG4FyhH2LBwSDMJNPSIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4ELGwcFgkKFEQ+JBXhugSCBGwMLGA1IESw3FBsEPm4Hji8/g?=
 =?us-ascii?q?jSBDlWnd6EOCiiDdIwelToaM4QEpmeZBoJYogGEaIFoPIFZcBWDIglJGQ+OX?=
 =?us-ascii?q?4Idx2YiNRMpAgcLAQEDCZNnAQE?=
IronPort-Data: A9a23:HfFj0awXomm/pT4Y+k16t+eNxCrEfRIJ4+MujC+fZmUNrF6WrkUEm
 DYXXGqCbKqDN2Sgc9kjad619k4D7ZDVzIBhQANt/lhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH2b+mJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4qaT/H3Ygf/hWYuaDpMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE88jmSH
 rurIBmRpws1zj91Yj+Xuu+Tnn4iHtY+CTOzZk9+AMBOtPTtShsaic7XPNJEAateZq7gc9pZk
 L2hvrToIesl0zGldOk1C3Fl/y9C0aJu/6H4LSCPt+up7G6FWkPB/al+VE0bMthNkgp3KTkmG
 f0wMjsBaFWHwumx2r/+ErgqjcU4J86tN4Qa0p1i5WiGVrB9HtaZHviMvIMGtNszrpgm8fL2Z
 8cFcTNzRB/BeBZIfFwQDfrSmc/21immKmcF8wv9SawfvnCL4wpw3PvXN4SNVJuVYMxIrl3Jn
 zeTl4j+KlRAXDCF8hKC6n+qi+rFkC/3VY5XH7qi+9ZugUaP3SoUEBAQWF6xrPW1h0L4XMhQQ
 3H44QI0pqQ0sUjuRd7nUljg8TiPvwUXXJxbFOhSBByx95c4Kj2xXgAsJgOtovR/3CPqbVTGD
 mO0ou4=
IronPort-HdrOrdr: A9a23:Dmy92aDvWqoolGflHemr55DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygck79
 YCT0C7Y+eAdGSTSq3BkW+FL+o=
X-Talos-CUID: 9a23:sw3CgmNiOKYWRe5DXzdY+BYkHOcfUV6e5U/9HROoUWpER+jA
X-Talos-MUID: 9a23:LSWn/ghWcztR8Nvs2AJsHcMpad8wzKKvBAM3lstelY6bECVtCyzMtWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="688112531"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 98674180005A3;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id E9400CC8D0A; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 30/34] cve-update-db-native: FKIE CVE parsing: Use Secondary metric
Date: Thu, 19 Feb 2026 21:34:39 -0800
Message-Id: <20260220053443.3006180-30-hetpat@cisco.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231473

From: Jonathan Schnitzler <jonathan.schnitzler@faro.com>

If there is no primary metric use the Secondary one.

Signed-off-by: Jonathan Schnitzler <jonathan.schnitzler@faro.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5ad0516aba120d9eba5f10afa3a4de3d25fd31fc)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 .../recipes-core/meta/cve-update-db-native.bb | 53 ++++++++++++-------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 39a26a2481..9d21d10157 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -322,6 +322,15 @@ def update_db_nvdjson(conn, jsondata):
         for config in configurations:
             parse_node_and_insert(conn, config, cveId, True)
 
+def get_metric_entry(metric):
+    primaries = [c for c in metric if c['type'] == "Primary"]
+    secondaries = [c for c in metric if c['type'] == "Secondary"]
+    if len(primaries) > 0:
+        return primaries[0]
+    elif len(secondaries)>0:
+        return secondaries[0]
+    return None
+
 def update_db_fkie(conn, jsondata):
     import json
     root = json.loads(jsondata)
@@ -342,37 +351,41 @@ def update_db_fkie(conn, jsondata):
         cveDesc = elt['descriptions'][0]['value']
         date = elt['lastModified']
         try:
-            for m in elt['metrics']['cvssMetricV2']:
-                if m['type'] == 'Primary':
-                    accessVector = m['cvssData']['accessVector']
-                    vectorString = m['cvssData']['vectorString']
-                    cvssv2 = m['cvssData']['baseScore']
+            if 'cvssMetricV2' in elt['metrics']:
+                entry = get_metric_entry(elt['metrics']['cvssMetricV2'])
+                if entry:
+                    accessVector = entry['cvssData']['accessVector']
+                    vectorString = entry['cvssData']['vectorString']
+                    cvssv2 = entry['cvssData']['baseScore']
         except KeyError:
             cvssv2 = 0.0
         try:
-            for m in elt['metrics']['cvssMetricV30']:
-                if m['type'] == 'Primary':
-                    accessVector = m['cvssData']['attackVector']
-                    vectorString = m['cvssData']['vectorString']
-                    cvssv3 = m['cvssData']['baseScore']
+            if 'cvssMetricV30' in elt['metrics']:
+                entry = get_metric_entry(elt['metrics']['cvssMetricV30'])
+                if entry:
+                    accessVector = entry['cvssData']['attackVector']
+                    vectorString = entry['cvssData']['vectorString']
+                    cvssv3 = entry['cvssData']['baseScore']
         except KeyError:
             accessVector = accessVector or "UNKNOWN"
             cvssv3 = 0.0
         try:
-            for m in elt['metrics']['cvssMetricV31']:
-                if m['type'] == 'Primary':
-                    accessVector = m['cvssData']['attackVector']
-                    vectorString = m['cvssData']['vectorString']
-                    cvssv3 = m['cvssData']['baseScore']
+            if 'cvssMetricV31' in elt['metrics']:
+                entry = get_metric_entry(elt['metrics']['cvssMetricV31'])
+                if entry:
+                    accessVector = entry['cvssData']['attackVector']
+                    vectorString = entry['cvssData']['vectorString']
+                    cvssv3 = entry['cvssData']['baseScore']
         except KeyError:
             accessVector = accessVector or "UNKNOWN"
             cvssv3 = 0.0
         try:
-            for m in elt['metrics']['cvssMetricV40']:
-                if m['type'] == 'Primary':
-                    accessVector = m['cvssData']['attackVector']
-                    vectorString = m['cvssData']['vectorString']
-                    cvssv4 = m['cvssData']['baseScore']
+            if 'cvssMetricV40' in elt['metrics']:
+                entry = get_metric_entry(elt['metrics']['cvssMetricV40'])
+                if entry:
+                    accessVector = entry['cvssData']['attackVector']
+                    vectorString = entry['cvssData']['vectorString']
+                    cvssv4 = entry['cvssData']['baseScore']
         except KeyError:
             accessVector = accessVector or "UNKNOWN"
             cvssv4 = 0.0

