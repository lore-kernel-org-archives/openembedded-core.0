Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606F1C55169
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32612.1771565687382722979
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=S0Z3Qlcr;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4284; q=dns/txt;
  s=iport01; t=1771565687; x=1772775287;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HidCLpJqW6XD9JCYzIxmpnF6Uq9YDPWr28u/t+6X8bI=;
  b=S0Z3QlcrhesYKNz8tmG1aa8FEbhiMsmnIEAqVVnOORKvPAta5alcDg3F
   uaKQjM2kMWJ4qvodSAdRcMwpoTZ/VgONavrVADzS+gzcTadFeJyLmyCip
   TLFkHi8HjiPlVCugCWHzaUchR2Leh6/HeUGy1R8hauEHZ5dHREVuzXGWO
   staWt/p7yhpMeHQitYbJ4ixMfyQtaI02SacJCCfg23LGWc6uFoafSV3Uu
   Io2/AuxD0JKlY1BxXuSBFLnISJgJmSpAMNq27Gb9nNowY49307us45w9C
   Uok4T4ym1ONrmCTBAm8zLp9AveK2i5hsltU6EKH10E8HYPg+92dc3ll2T
   A==;
X-CSE-ConnectionGUID: 83fkLGqXQC2XXJI+ZdqOtQ==
X-CSE-MsgGUID: ZTBC4uLVRn+GEdmi6VPI5w==
X-IPAS-Result: =?us-ascii?q?A0CWBQC68Zdp/5H/Ja1aglmCSA9xX0JJA5ZIA54aFIFrD?=
 =?us-ascii?q?wEBAQ83GgQBAYUHAo0fAiY2Bw4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZbAgEDMgFGECAxKysZgwIBgnMCAaZ+GjeCLIEB4CIBC?=
 =?us-ascii?q?xQBgTiFPIgZawmEeicbG4FyhH2EKYY8IgSCIoEOggCRT0iBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBCxsHBYJChREPiQV4boEggRsDCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB44vP4ItBxZ4AUCBaEuTEhGSNYE1n1kKKIN0jB6VOhozhASmZy6YWIJYo?=
 =?us-ascii?q?gGEaIFvCC1GgRNwFYMiCUkZD45fgh28HSI1EykCBwsBAQMJkWosgVEBAQ?=
IronPort-Data: A9a23:BaVkjK0uiNwyfHE8XvbD5YRwkn2cJEfYwER7XKvMYLTBsI5bp2MPn
 GVKXTqGaauMMzTyLdh0aI3j9EMGusCAy9NmTQtq3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX4
 Lsen+WFYAX7g2QuajpPg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGXBo4Pqk349ZOKjt+x
 d45awIBdzefvrfjqF67YrEEasULNsLnOsYb/3pn1zycVaZgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUidC/FMEg9/5JYWnOq0nnDjWzZZs1mS46Ew5gA/ySQvjui3a4eFJ4ziqcN9rHqyj
 T7b21rDBFI1GdCayGS7ylPxmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Ms0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXIIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:VFP946H2cIEio55kpLqE78eALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1rZ
 0QEJSXzLbLfCFHZQGQ2njfL+od
X-Talos-CUID: 9a23:/3vB1m4AzYJiG8q0ntsspBUaGeQKa03k5y3gE22ZSlRlUZqJcArF
X-Talos-MUID: =?us-ascii?q?9a23=3ArGdqNA1pLlsVlXXUzfdVGDVqKzUj0ZiEIxwQtas?=
 =?us-ascii?q?8vYqrGCB1OmmjtBXqXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="668235858"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 986931800047D;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id DD77DCC8D08; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 28/34] cve-update: remove cleanup of db_file in downloads
Date: Thu, 19 Feb 2026 21:34:37 -0800
Message-Id: <20260220053443.3006180-28-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231484

From: Peter Marko <peter.marko@siemens.com>

Since the code was changed to update the DB in temporary file, code
cleaning the final file in downloads is never executed.
Remove it.

Since the code always removes both files in temporary directory, remove
also comment which is trying to differentiate this code from code just
removed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bece6dbf5d0e89b2e846587e1b89766e16dd9253)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb  | 17 ++---------------
 .../recipes-core/meta/cve-update-nvd2-native.bb | 17 ++---------------
 2 files changed, 4 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 5a5eb20e41..a0494aa329 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -45,7 +45,7 @@ python do_fetch() {
     db_dir = os.path.dirname(db_file)
     db_tmp_file = d.getVar("CVE_CHECK_DB_TEMP_FILE")
 
-    cleanup_db_download(db_file, db_tmp_file)
+    cleanup_db_download(db_tmp_file)
 
     # The NVD database changes once a day, so no need to update more frequently
     # Allow the user to force-update
@@ -91,28 +91,15 @@ python do_unpack() {
 }
 do_unpack[lockfiles] += "${CVE_CHECK_DB_DLDIR_LOCK} ${CVE_CHECK_DB_FILE_LOCK}"
 
-def cleanup_db_download(db_file, db_tmp_file):
+def cleanup_db_download(db_tmp_file):
     """
     Cleanup the download space from possible failed downloads
     """
 
-    # Clean up the updates done on the main file
-    # Remove it only if a journal file exists - it means a complete re-download
-    if os.path.exists("{0}-journal".format(db_file)):
-        # If a journal is present the last update might have been interrupted. In that case,
-        # just wipe any leftovers and force the DB to be recreated.
-        os.remove("{0}-journal".format(db_file))
-
-        if os.path.exists(db_file):
-            os.remove(db_file)
-
     # Clean-up the temporary file downloads, we can remove both journal
     # and the temporary database
     if os.path.exists("{0}-journal".format(db_tmp_file)):
-        # If a journal is present the last update might have been interrupted. In that case,
-        # just wipe any leftovers and force the DB to be recreated.
         os.remove("{0}-journal".format(db_tmp_file))
-
     if os.path.exists(db_tmp_file):
         os.remove(db_tmp_file)
 
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 83876c7467..f7a306c995 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -57,7 +57,7 @@ python do_fetch() {
     db_dir = os.path.dirname(db_file)
     db_tmp_file = d.getVar("CVE_CHECK_DB_TEMP_FILE")
 
-    cleanup_db_download(db_file, db_tmp_file)
+    cleanup_db_download(db_tmp_file)
     # By default let's update the whole database (since time 0)
     database_time = 0
 
@@ -106,28 +106,15 @@ python do_unpack() {
 }
 do_unpack[lockfiles] += "${CVE_CHECK_DB_DLDIR_LOCK} ${CVE_CHECK_DB_FILE_LOCK}"
 
-def cleanup_db_download(db_file, db_tmp_file):
+def cleanup_db_download(db_tmp_file):
     """
     Cleanup the download space from possible failed downloads
     """
 
-    # Clean up the updates done on the main file
-    # Remove it only if a journal file exists - it means a complete re-download
-    if os.path.exists("{0}-journal".format(db_file)):
-        # If a journal is present the last update might have been interrupted. In that case,
-        # just wipe any leftovers and force the DB to be recreated.
-        os.remove("{0}-journal".format(db_file))
-
-        if os.path.exists(db_file):
-            os.remove(db_file)
-
     # Clean-up the temporary file downloads, we can remove both journal
     # and the temporary database
     if os.path.exists("{0}-journal".format(db_tmp_file)):
-        # If a journal is present the last update might have been interrupted. In that case,
-        # just wipe any leftovers and force the DB to be recreated.
         os.remove("{0}-journal".format(db_tmp_file))
-
     if os.path.exists(db_tmp_file):
         os.remove(db_tmp_file)
 

