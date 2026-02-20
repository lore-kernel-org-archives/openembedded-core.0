Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4839FC55164
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32608.1771565686056322342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eOyvzEL9;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2924; q=dns/txt;
  s=iport01; t=1771565687; x=1772775287;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RZVea6YMe0lNyezlexxvqPekQvvoCWKe+fwMO3w994I=;
  b=eOyvzEL9ScDBg66FtIDkaCNg/zSxuTQ/gTRMomeO7wL6hdxhasPqtbPQ
   MJKYlxCjjq5OPJW7GzgEdrHY4M5GT0RXYgTgGbIePynfFs/d3bJ6E+h7S
   NrgS7J13GhdV5rQj1HfqNalPU/PaNqvuGN2cAuWhGW0sK3P+KIpMXSYpR
   It1dL5AdYYiYP/en5+Cw/RcGQ6Kl3oRL98GbFzP8uxqWdHvdhnE4NiWvF
   nl6Mt+HiFtmobO+Z2S/6XV9/ii/hNc9OHsUdHG5HN2B82xAn9IK7mUnA0
   lWBcRZ6rAov2Z/KZfYuSYSENzvP1z7eWZkfz1v0W7G4AolAK5uVAMLR5i
   g==;
X-CSE-ConnectionGUID: Dacm3X1cQz65alm/YdIeRw==
X-CSE-MsgGUID: 7+SRkP7BS2m/ORhbJFwzpQ==
X-IPAS-Result: =?us-ascii?q?A0BBBADP8Jdp/5D/Ja1aglmCSA9xX0JJA5ZLnhqBfw8BA?=
 =?us-ascii?q?QEPNxoEAQGFBwKNHwImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWwIBAzIBRhAgMSsrGYMCAYJzAgGnVIIsgQGEfNsmAQsUA?=
 =?us-ascii?q?YE4hTyIGWsJhHonGxuBcoR9hRCFdwSCIoEOk09IgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQsbBwWCQoURD4kFeG6BIIEbAwsYDUgRLDcUGwQ+bgeOL?=
 =?us-ascii?q?z+CNC1hAYEmlSGPY4IhgTWfWQoog3SMHpU6GjOEBJQVklKZBoJYoSRdhGiBa?=
 =?us-ascii?q?DxGgRNwFYMiCUkZD45fgh27fSI1EykCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:dSDEhK96zVYIXYVTUf2nDrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 zFKWTiHPanbM2H8c9F3aIzgo04Pv8Ldn9A3HQJu+ShEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mryyHjEAX9gWAsaDhMs/nrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kaNIYdodYuClhcq
 6ERLDVKXxyiitiplefTpulE3qzPLeHxN48Z/3UlxjbDALN+HtbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0En1lQ/UPrSmM+oi2XneiFwo1OOrq1x6G/WpOB0+OayaYKJJIfXH625mG7H5
 Vn8/FymKCpAMZu48zqP0FyzlPf2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYS71Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:55exS62qzwMX+9FVRK6AIAqjBLUkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7N5ZwQt7eC3OF+eOxQpuW6zA==
X-Talos-CUID: 9a23:Davurm52w6xQZ5Jomdss2EcfH5sVK3bk3imNKku9TldlabCvVgrF
X-Talos-MUID: 9a23:n45xbAkxWmsRAfgbOeC4dno9d/xS4JzxIntXlNIhgcmOFwJvKS+k2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="671046352"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 9D6C018000203;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id 02FB5CC8D0C; Thu, 19 Feb 2026 21:34:45 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 32/34] cve-update-db-native: pycodestyle fixes
Date: Thu, 19 Feb 2026 21:34:41 -0800
Message-Id: <20260220053443.3006180-32-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231481

From: Niko Mauno <niko.mauno@vaisala.com>

Fixes following pycodestyle complaints:

  cve-update-db-native.bb:80:39: E712 comparison to True should be 'if cond is True:' or 'if cond:'
  cve-update-db-native.bb:128:20: E401 multiple imports on one line
  cve-update-db-native.bb:130:18: E401 multiple imports on one line
  cve-update-db-native.bb:171:21: E741 ambiguous variable name 'l'
  cve-update-db-native.bb:335:26: E225 missing whitespace around operator
  cve-update-db-native.bb:344:12: E713 test for membership should be 'not in'
  cve-update-db-native.bb:347:12: E713 test for membership should be 'not in'

Also leaves out a redundant 'gzip' import in update_db_file().

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit c3b0d276992f234b09a7f0fd652dc26e20d00616)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 962b600e3b..6edf705704 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -77,7 +77,7 @@ python do_fetch() {
     if os.path.exists(db_file):
         shutil.copy2(db_file, db_tmp_file)
 
-    if update_db_file(db_tmp_file, d) == True:
+    if update_db_file(db_tmp_file, d):
         # Update downloaded correctly, can swap files
         shutil.move(db_tmp_file, db_file)
     else:
@@ -136,9 +136,11 @@ def update_db_file(db_tmp_file, d):
     """
     Update the given database file
     """
-    import bb.utils, bb.progress
+    import bb.progress
+    import bb.utils
     from datetime import date
-    import urllib, gzip, sqlite3
+    import sqlite3
+    import urllib
 
     YEAR_START = 2002
     cve_socket_timeout = int(d.getVar("CVE_SOCKET_TIMEOUT"))
@@ -167,8 +169,8 @@ def update_db_file(db_tmp_file, d):
                 return False
 
             if response:
-                for l in response.read().decode("utf-8").splitlines():
-                    key, value = l.split(":", 1)
+                for line in response.read().decode("utf-8").splitlines():
+                    key, value = line.split(":", 1)
                     if key == "lastModifiedDate":
                         last_modified = value
                         break
@@ -332,7 +334,7 @@ def get_metric_entry(metric):
     secondaries = [c for c in metric if c['type'] == "Secondary"]
     if len(primaries) > 0:
         return primaries[0]
-    elif len(secondaries)>0:
+    elif len(secondaries) > 0:
         return secondaries[0]
     return None
 
@@ -341,10 +343,10 @@ def update_db_fkie(conn, jsondata):
     root = json.loads(jsondata)
 
     for elt in root['cve_items']:
-        if not 'vulnStatus' in elt or elt['vulnStatus'] == 'Rejected':
+        if 'vulnStatus' not in elt or elt['vulnStatus'] == 'Rejected':
             continue
 
-        if not 'configurations' in elt:
+        if 'configurations' not in elt:
             continue
 
         accessVector = None

