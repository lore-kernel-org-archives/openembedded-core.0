Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5F7C54F5B
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:49 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32610.1771565686797469924
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=O+QfC3ZF;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1778; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0ONI+jmWZSeQTpNw23S3FhRfSDI//ORfiDr5hsJ6lSo=;
  b=O+QfC3ZFnwoyw5MrTKWLFdspMZgfjS4fLVpJAHKB2k+ShucUc0hmX97d
   AhC85o/OSXtff3XHk2ZsieMrrkEvGNZtbpq0p80suql/RBRCtCsULu5At
   LegnHrRiiPOAvtcIhGoNXyrMqhmxr33YQteiyVpYQpZgXfeHlduWairhb
   o8bfd5bgdEYq8/MD1wqizo2lDCHFj+yShhNCPyl4HMN048YAwr20IrYK/
   KCD4ZbMfK/duxYTSRFJnZdchTXgNDz+ikH8Ho0OnwTxFm5GI4J2XHhlcF
   W1sp8IsUerK7pliApjxUCO4cl+XLHvslMUdNQhtQu/0U3+XMWMNVKYLQP
   w==;
X-CSE-ConnectionGUID: Cp1xi8iLRAWk4KesuzgXSA==
X-CSE-MsgGUID: j4uVcOeiTMiINihAJOYr4Q==
X-IPAS-Result: =?us-ascii?q?A0BDBABB8Zdp/4r/Ja1aglmCSA9xX0JJA5ZIA54agX8PA?=
 =?us-ascii?q?QEBDzcaBAEBhQcCjR8CJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NhlsCAQMyAUYQICYLKysZgwIBgnMCAadWgiyBAeAiAQsUA?=
 =?us-ascii?q?YE4hTyIGWsJhHonGxuBcoQOb4UQhXcEgiKBDoIAkU9IgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQsbBwWCQoURD4kFeG6BIIEbAwsYDUgRLDcUGwQ+b?=
 =?us-ascii?q?geOLz+CNAEwXYEATC2mU6EOCiiDdIwelToaM4QEpmeZBoJYogGEaIFoPEaBE?=
 =?us-ascii?q?3AVgyIJSRkPjl+CHbt9IjUTKQIHCwEBAwmRaiyBUQEB?=
IronPort-Data: A9a23:Sc1lwq1+c0o2OBD0bvbD5YRwkn2cJEfYwER7XKvMYLTBsI5bpzUBn
 GYeWWmCP/nfYzP8ftt2OYTkpxgB78fQx4BkHARr3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX4
 Lsen+WFYAX7g2QuajpPg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGJ1lvLYxI+8JNKF5Nq
 d8VMy0fYSC4rrfjqF67YrEEasULNsLnOsYb/3pn1zycVa9gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNU+QC/FMEg9/5JYWnOq0nnDjWzZZs1mS46Ew5gA/ySQvj+C3bIqOJY3iqcN9nBqFm
 Gnh8mXFJxA7Et2f4Biiw2jwv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXIIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:uvvZ/aG3hFFKSYlZpLqE78eALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1rZ
 0QEJSXzLbLfCFHZQGQ2njfL+od
X-Talos-CUID: =?us-ascii?q?9a23=3AZZowL2n8T1gEqMOb0qfISGoH+W3XOVbFlWfRc06?=
 =?us-ascii?q?cM09WS+G2RESN6qxUqOM7zg=3D=3D?=
X-Talos-MUID: 9a23:W6i+jgn1Yn1WGzHppy5HdnpgaNpW6IOjCXwokLQgusmtFwtBIWuk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="670248379"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 8DAE8180001C1;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id C7807CC8CF2; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 24/34] cve-update-db-native: Use a local copy of the database during builds
Date: Thu, 19 Feb 2026 21:34:33 -0800
Message-Id: <20260220053443.3006180-24-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231478

From: Peter Marko <peter.marko@siemens.com>

OE-Core rev: 03596904392d257572a905a182b92c780d636744

This seems to be misimplemented when re-adding update from nvd1 feed.
Use file in temporary directory instead of downloads directory for
update process.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e5b0a74810fdd3f72fe61e0ae1f859a444dc1fa5)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 320bd452f1..1a38d6be3f 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -24,8 +24,7 @@ CVE_SOCKET_TIMEOUT ?= "60"
 
 CVE_CHECK_DB_DLDIR_FILE ?= "${DL_DIR}/CVE_CHECK2/${CVE_CHECK_DB_FILENAME}"
 CVE_CHECK_DB_DLDIR_LOCK ?= "${CVE_CHECK_DB_DLDIR_FILE}.lock"
-
-CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DLDIR_FILE}.tmp"
+CVE_CHECK_DB_TEMP_FILE ?= "${CVE_CHECK_DB_FILE}.tmp"
 
 python () {
     if not bb.data.inherits_class("cve-check", d):
@@ -44,7 +43,7 @@ python do_fetch() {
 
     db_file = d.getVar("CVE_CHECK_DB_DLDIR_FILE")
     db_dir = os.path.dirname(db_file)
-    db_tmp_file = d.getVar("CVE_DB_TEMP_FILE")
+    db_tmp_file = d.getVar("CVE_CHECK_DB_TEMP_FILE")
 
     cleanup_db_download(db_file, db_tmp_file)
 
@@ -64,6 +63,7 @@ python do_fetch() {
         pass
 
     bb.utils.mkdirhier(db_dir)
+    bb.utils.mkdirhier(os.path.dirname(db_tmp_file))
     if os.path.exists(db_file):
         shutil.copy2(db_file, db_tmp_file)
 

