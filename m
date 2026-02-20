Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADD1C55173
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32340.1771565688258024399
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FbP4hfON;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2204; q=dns/txt;
  s=iport01; t=1771565688; x=1772775288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=djFJvtmYdcZfPVEeUlH4cXvctlFR3vWwiptXt6VTjXY=;
  b=FbP4hfONZVEZLiVJOKz2PR1aqZopLQJhhYYL657bKv9HixuBq5b8kUfV
   S5pKsBuUpBiHRT7A7+NVxz8l1pFqb1ACjAuuVyCEvWE8NY4nSNYRbxnPV
   +0oFS8dRhl0Anl+TkQVe4ClRXYxIbueTnq5AI508qy7G60gtfbgO5vj4y
   jwOd/euL5Q8OynAJzQTKmab2i9j6jX0p8Ilm1aaBnJjEc35a0JqIf/u2j
   tejm7Qgu+hQV77PW9YFeNxhbb/By3Vj4+c6QhIlsA6khdREIT2jdg14mP
   0cPjqpu5T6qHPvUORsspjJuhgwmtfCpaJ3QudTgKMZ1Lqf8YAWhn0Ut/c
   A==;
X-CSE-ConnectionGUID: VYU8mKzfRfqB8B+772Ajiw==
X-CSE-MsgGUID: 6DHLRal2QAK/Wq1Et8RuMQ==
X-IPAS-Result: =?us-ascii?q?A0A0BQBB8Zdp/5L/Ja1aglmCSA9xX0JJA5ZIA54agX8PA?=
 =?us-ascii?q?QEBDzcaBAEBhQcCjR8CJjUIDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NhlsCAQMyAUYQIDErKxmDAgGCcwIBp1aCLIEBhHzbJgELF?=
 =?us-ascii?q?AGBOIU8iBlrCYR6JxsbgXKEfYUQhXcEgiKBDoMLhxCJNEiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBCxsHBYJChREPiQV4boEggRsDCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB44vP4I0PT4TgT1sQpMbOxCRaRKBNZ9ZCiiDdIwelToaM4QEpmeZBoJYo?=
 =?us-ascii?q?gGEaIFpATpGgRNwFYMiCUkZD45fgh27fSI1EykCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:NuD7TaOeRjkKMCbvrR3ylsFynXyQoLVcMsEvi/4bfWQNrUoi1TEEm
 2cWWTuOb/uIMzD2KYgkOYzn808H6sfUm9A3SHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVrlV
 e/a+ZWFZgf/gWYsaQr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj68tfMREzHp8WwOhuKzFkt
 qNHchkPbw/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmIS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMnwsYDUXUrsTIJIzgP+hmlH0ciZTrxSeoq9fD237klMogOmyb4aOEjCMbZt5vmKir
 2acxk3aRS4DbfGDmQCY10v504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvuS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH7dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:Xdd3JqFnEilPKcenpLqE78eALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1rZ
 0QEJSXzLbLfCFHZQGQ2njfL+od
X-Talos-CUID: 9a23:ZZahe2EThOQpsAFJqmJZxXNEH+M3fEfT1V2ACQznVjxASryKHAo=
X-Talos-MUID: 9a23:M5ujoQTNB0HlV/7KRXSyqBFGDs5suZ2HKwcyiMwrp5m+KAlJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="671897743"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 8EC1C180004A7;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id D0D7BCC8CF3; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 26/34] cve-update-db-native: log a little more
Date: Thu, 19 Feb 2026 21:34:35 -0800
Message-Id: <20260220053443.3006180-26-hetpat@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231487

From: Peter Marko <peter.marko@siemens.com>

OE-Core rev: b64a869b9c5e1d504f1011da16b5c5ff721afbf0

This commit was not applied on nvd1/fkie fetcher.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd5efc4a242ec918dd276d10da8c68f606ba8809)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 2677f71792..d9fc331f1b 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -58,7 +58,7 @@ python do_fetch() {
                 bb.error("CVE database %s not present, database fetch/update skipped" % db_file)
             return
         if time.time() - os.path.getmtime(db_file) < update_interval:
-            bb.debug(2, "Recently updated, skipping")
+            bb.note("CVE database recently updated, skipping")
             return
 
     except OSError:
@@ -77,7 +77,7 @@ python do_fetch() {
         shutil.move(db_tmp_file, db_file)
     else:
         # Update failed, do not modify the database
-        bb.note("CVE database update failed")
+        bb.warn("CVE database update failed")
         os.remove(db_tmp_file)
 }
 
@@ -159,7 +159,7 @@ def update_db_file(db_tmp_file, d):
     with bb.progress.ProgressHandler(d) as ph, open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a') as cve_f:
         total_years = date.today().year + 1 - YEAR_START
         for i, year in enumerate(range(YEAR_START, date.today().year + 1)):
-            bb.debug(2, "Updating %d" % year)
+            bb.note("Updating %d" % year)
             ph.update((float(i + 1) / total_years) * 100)
             json_url, meta_url = db_file_names(d, year, is_nvd)
 
@@ -190,7 +190,7 @@ def update_db_file(db_tmp_file, d):
             cursor.close()
 
             if not meta or meta[0] != last_modified:
-                bb.debug(2, "Updating entries")
+                bb.note("Updating entries")
                 # Clear products table entries corresponding to current year
                 conn.execute("delete from PRODUCTS where ID like ?", ('CVE-%d%%' % year,)).close()
 

