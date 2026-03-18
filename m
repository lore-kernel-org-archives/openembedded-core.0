Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A8DFCD0B8
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 05:39:17 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7590.1773812349295877277
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 22:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Iv3onUam;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5947; q=dns/txt;
  s=iport01; t=1773812349; x=1775021949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RPz35DxSaIaZcoE9qJ2U275qxVI3j6VH5ytLgamlQ6U=;
  b=Iv3onUamD39M7P7m5iLWi2PCvuh/Q2BBnsa900wUn0JnFr0fnrgcEGtq
   Uok6ZYwkt1EIKG3CHToZIy8VQAzm4Bjd/JKl0M3PaOlRuS5Au0NhkzGcF
   u4ppd8xs9ywiatbaZVFCJkAt79ikVM3gpuz/CsKbGKX8PCOJ0hd+4MfmG
   z4hyWBYWv7GZ2WHL5wDE/kaMuYIpcrNAG3lt2v+ZbC0iohlAuXp9E4Qpm
   kkk+ClEgwLkXtJCDg6+vQ/lVsD57Qdt6wRJdNVqGIs8134lUFelszIVBS
   NEGn6+hHTds2fHn4G4OaVYsorZV9hPFxbVTyvsOrNQVocnfJEsUvi4enb
   g==;
X-CSE-ConnectionGUID: 9oy/KgwoRJyCp/u2vJq7bQ==
X-CSE-MsgGUID: JN+5zb2BSg+0Y5MLs4dNKg==
X-IPAS-Result: =?us-ascii?q?A0D0BQA1Obpp/5IQJK1aglmCSA+BUEJJlksDi2SSNoF/D?=
 =?us-ascii?q?wEBAQ9RBAEBhQcCjSICJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4ThlyGWwIBAzIBRhAgMSALKxmDAoI7AzYCAbMOgiyBAd1DDYJSA?=
 =?us-ascii?q?QsUAYE4hTyCeYUgWhqEeicbG4FyhH2CH4hoBIIigQ6Ef4ZHhzZIgR4DWSwBV?=
 =?us-ascii?q?RMNCgsHBYFmAzUSKhVuMh2BIz4XgQsbBwWEAA+IbXRtgROEDAMLGA1IESw3F?=
 =?us-ascii?q?BsEPm4HjU87gUFsBwGBDQFCCTArIJRQPZF4oB1xCiiDdJtchXwaM6prLphYk?=
 =?us-ascii?q?hKSR4RogWg8gVlwFYMiUhkPiACGX8lDIzU9AgcCBw0DC5NlAQE?=
IronPort-Data: A9a23:mlJecaOlzWegzeHvrR3xlsFynXyQoLVcMsEvi/4bfWQNrUog3jZVy
 2AbCjiOOPqNZmL1f4glbNywoB5V7JWHx9dqTnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVjlV
 e/a+ZWFZgf+gmEsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj66RpHQYVMpIfwMRmKnkJ6
 KYGCilSZCnW0opawJrjIgVtrs0nKM+uOMYUvWttiGmIS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGYxBPjDS0Un1lM/CJ8ihO60rnL+aDZf7lmSoMLb5kCPklcojeKxbIK9ltqiZ+MWw1SS/
 Ej98CehM0w/EMfDxRym/Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNuhoaHt4VGOog5UTVm+zf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ12FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:K6w3DKzqgpZilDla7eSzKrPwK71zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIC5IOa+EZyTNB/L/HCM7SKadH/OW6
X-Talos-CUID: =?us-ascii?q?9a23=3AAaZkYWjuab6zMvquwsoMuutevDJuI3rMi1TfPEi?=
 =?us-ascii?q?CK3dCUPqIE0Gy4fxuqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AXG8JCQ3FrXtHfRhEt3hGHB0ErzUjwYLtVVIHy78?=
 =?us-ascii?q?9tIrcBHFVHyzBgBKUTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,126,1770595200"; 
   d="scan'208";a="463152440"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Mar 2026 05:39:08 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 44E9C18000146;
	Wed, 18 Mar 2026 05:39:08 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id E20A3CE2A78; Tue, 17 Mar 2026 22:39:07 -0700 (PDT)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [OE-core] [scarthgap] [PATCH v1 1/4] cve-check: encode affected product/vendor in CVE_STATUS
Date: Tue, 17 Mar 2026 22:39:03 -0700
Message-Id: <20260318053906.26606-2-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260318053906.26606-1-hetpat@cisco.com>
References: <20260318053906.26606-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 05:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233359

From: Marta Rybczynska <rybczynska@gmail.com>

CVE_STATUS contains assesment of a given CVE, but until now it didn't have
include the affected vendor/product. In the case of a global system include,
that CVE_STATUS was visible in all recipes.

This patch allows encoding of affected product/vendor to each CVE_STATUS
assessment, also for groups. We can then filter them later and use only
CVEs that correspond to the recipe.

This is going to be used in meta/conf/distro/include/cve-extra-exclusions.inc
and similar places.

Backport Changes:
- Discarded the changes to meta/lib/oe/spdx30_tasks.py, as the
commit history for this file diverges from the base commit
itself (9c9b9545049a in the scarthgap branch).
- Additionally, the changes do not introduce any major features
and are primarily focused on code restructuring.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit abca80a716e92fc18d3085aba1a15f4bac72379c)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/classes/cve-check.bbclass | 24 ++++++++++-----------
 meta/lib/oe/cve_check.py       | 39 ++++++++++++++++++++++++++--------
 2 files changed, 42 insertions(+), 21 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 3f4704fb4e..de5ddf6f04 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -316,8 +316,8 @@ def check_cves(d, patched_cves):
     # Convert CVE_STATUS into ignored CVEs and check validity
     cve_ignore = []
     for cve in (d.getVarFlags("CVE_STATUS") or {}):
-        decoded_status, _, _ = decode_cve_status(d, cve)
-        if decoded_status == "Ignored":
+        decoded_status = decode_cve_status(d, cve)
+        if 'mapping' in decoded_status and decoded_status['mapping'] == "Ignored":
             cve_ignore.append(cve)
 
     import sqlite3
@@ -500,11 +500,11 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
         write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
         write_string += "CVE: %s\n" % cve
         write_string += "CVE STATUS: %s\n" % status
-        _, detail, description = decode_cve_status(d, cve)
-        if detail:
-            write_string += "CVE DETAIL: %s\n" % detail
-        if description:
-            write_string += "CVE DESCRIPTION: %s\n" % description
+        status_details = decode_cve_status(d, cve)
+        if 'detail' in status_details:
+            write_string += "CVE DETAIL: %s\n" % status_details['detail']
+        if 'description' in status_details:
+            write_string += "CVE DESCRIPTION: %s\n" % status_details['description']
         write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
         write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scorev2"]
         write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scorev3"]
@@ -632,11 +632,11 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
             "status" : status,
             "link": issue_link
         }
-        _, detail, description = decode_cve_status(d, cve)
-        if detail:
-            cve_item["detail"] = detail
-        if description:
-            cve_item["description"] = description
+        status_details = decode_cve_status(d, cve)
+        if 'detail' in status_details:
+            cve_item["detail"] = status_details['detail']
+        if 'description' in status_details:
+            cve_item["description"] = status_details['description']
         cve_list.append(cve_item)
 
     package_data["issue"] = cve_list
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 7c09b78242..767d1a6750 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -132,8 +132,8 @@ def get_patched_cves(d):
 
     # Search for additional patched CVEs
     for cve in (d.getVarFlags("CVE_STATUS") or {}):
-        decoded_status, _, _ = decode_cve_status(d, cve)
-        if decoded_status == "Patched":
+        decoded_status = decode_cve_status(d, cve)
+        if 'mapping' in decoded_status and decoded_status['mapping'] == "Patched":
             bb.debug(2, "CVE %s is additionally patched" % cve)
             patched_cves.add(cve)
 
@@ -227,22 +227,43 @@ def convert_cve_version(version):
 
 def decode_cve_status(d, cve):
     """
-    Convert CVE_STATUS into status, detail and description.
+    Convert CVE_STATUS into status, vendor, product, detail and description.
     """
     status = d.getVarFlag("CVE_STATUS", cve)
     if not status:
-        return ("", "", "")
+        return {}
+
+    status_split = status.split(':', 5)
+    status_out = {}
+    status_out["detail"] = status_split[0]
+    product = "*"
+    vendor = "*"
+    description = ""
+    if len(status_split) >= 4 and status_split[1].strip() == "cpe":
+        # Both vendor and product are mandatory if cpe: present, the syntax is then:
+        # detail: cpe:vendor:product:description
+        vendor = status_split[2].strip()
+        product = status_split[3].strip()
+        description = status_split[4].strip()
+    elif len(status_split) >= 2 and status_split[1].strip() == "cpe":
+        # Malformed CPE
+        bb.warn('Invalid CPE information for CVE_STATUS[%s] = "%s", not setting CPE' % (detail, cve, status))
+    else:
+        # Other case: no CPE, the syntax is then:
+        # detail: description
+        description = status_split[len(status_split)-1].strip() if (len(status_split) > 1) else ""
 
-    status_split = status.split(':', 1)
-    detail = status_split[0]
-    description = status_split[1].strip() if (len(status_split) > 1) else ""
+    status_out["vendor"] = vendor
+    status_out["product"] = product
+    status_out["description"] = description
 
-    status_mapping = d.getVarFlag("CVE_CHECK_STATUSMAP", detail)
+    status_mapping = d.getVarFlag("CVE_CHECK_STATUSMAP", status_out['detail'])
     if status_mapping is None:
         bb.warn('Invalid detail "%s" for CVE_STATUS[%s] = "%s", fallback to Unpatched' % (detail, cve, status))
         status_mapping = "Unpatched"
+    status_out["mapping"] = status_mapping
 
-    return (status_mapping, detail, description)
+    return status_out
 
 def extend_cve_status(d):
     # do this only once in case multiple classes use this

