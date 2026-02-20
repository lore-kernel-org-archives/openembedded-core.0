Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1772C54F5C
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:49 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32338.1771565685765362574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ZXNWXOKr;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5947; q=dns/txt;
  s=iport01; t=1771565685; x=1772775285;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RPz35DxSaIaZcoE9qJ2U275qxVI3j6VH5ytLgamlQ6U=;
  b=ZXNWXOKrZqKqAZMjZ1vNiYrPp7JLN0PR46tim1be9kZ8bT07PnK8Av4X
   qfvhlv8h1bymajVqjPR5qjB7qdRWfycDxbgUtOSSPTgHhFHD0/Ak3376k
   eSWXnU74rV3+FYWvbMqo8qLvNBOi3Qpb1s5clg6htmo1AYU6z8zNONlAE
   c8HudyTrJiCSZU0R3BvJoOGkAH40V0oisLvYJXXhgyinJV3NV+fYNsQ4K
   6DmfYyTyvWp2zrug7hGgBElf8tB9DtxkDs0Z+zanriAzGfQycUNzAARFe
   WC/gYVlaTTmJF+FCRaZvrwh7mqPvKKyfBitXUsfBzqfEO7a6QCETLm6dp
   A==;
X-CSE-ConnectionGUID: ub8wsJ5SQ++b/X49va0CxQ==
X-CSE-MsgGUID: 8rWYCdNdTTi3nsMdZjE/FA==
X-IPAS-Result: =?us-ascii?q?A0BsBQC68Zdp/5H/Ja1aglmCSA+BUEJJk1oBgnCLZ5I2g?=
 =?us-ascii?q?X8PAQEBD1EEAQGFB40hAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4Zchl02AUYwJisLRIMCgjsDNgIBp0+CLIEB3UMNglIBCxQBg?=
 =?us-ascii?q?TiFPIJ5hSBaGoR6JxsbgXKEfYIfiGgEgiKBDoZshlaGDUiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBCxsHBYdTD4kFeG6BIIEbAwsYDUgRLDcUGwQ+b?=
 =?us-ascii?q?geOLz+BQWwHAYENAUIJMCsglFA9kXigHXEKKIN0m1yFfBozqmsumFiSEpJHh?=
 =?us-ascii?q?GiBaDyBWXAVgyJSGQ+IAIZfvjoiNTwCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:qKtUiKuAXFvUIgzlXTVoVgP+3efnVAFfMUV32f8akzHdYApBsoF/q
 tZmKWnQPfmPNDb8KNF2PYix9hwOvJGHyYUxGQBtpXxkRigSgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYTdJ5xYuajhKs/jZ8Es01BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw5+wnHnpsq
 Mcha3MHKSDf1vy/mJmrc7w57igjBJGD0II3oHpsy3TdSP0hW52GG/WM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtKYH49tL/Aan3XczBEsFuJjaE2+GPUigd21dABNfKLJYbRGpkIwhfwS
 mTur37GMzoWEtCj9Tve9GmJit3NsGTVcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cHnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:+Gd8O6CyVgJiM9zlHemn55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/9UlcBeOkdK0Es
 xbAsxDNOE=
X-Talos-CUID: =?us-ascii?q?9a23=3AP4Bc12r09IRx/ER5UtoTR/HmUd0vImLG7irrGgz?=
 =?us-ascii?q?7AyFZFOyLQAe76Joxxg=3D=3D?=
X-Talos-MUID: 9a23:GaoXCAa+rYFjIuBT5yXTtRpuEstU36X1DlsonacElo6qHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="672374549"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:44 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id B1141180001C1;
	Fri, 20 Feb 2026 05:34:44 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id 581B6CC8CB9; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 01/34] cve-check: encode affected product/vendor in CVE_STATUS
Date: Thu, 19 Feb 2026 21:34:10 -0800
Message-Id: <20260220053443.3006180-1-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231457

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

