Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607A1C5516A
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32610.1771565686797469924
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dOZhz/ql;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3140; q=dns/txt;
  s=iport01; t=1771565687; x=1772775287;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ktQnFTFyEve/PMXoWN8ISWhBxFFALaw7GtVpHdTY6BQ=;
  b=dOZhz/qlBmFs0NW5uIH4O9z4Zqn1thjxJBRQvfLMtm0o0NoJOiPMzi2l
   ATLb9NJJAHK4GMUI+qHtwdojCXBG4+uo2e59xkhbabhlsSMidfHwTLQFM
   0f6ezWUYVIf30Qh4I4likUsBfyzKJ/uEJ8tEXjb8NBE/kBVus3sOYOJ2C
   MciVKuqn9gtSYrVD1SPIu5ruPI3J2S8I1f8rbM6OpwDomWMnyrjMs9cOh
   Js4L/hKY+rcM5VO2K+RX7+jNUlPoUttO2s1djsXADcWnvlKWnM8BfT136
   +6RRpXq8MWxntCUujUL7H/mNvGzEbj4fqGCiOu4yCfFS5ewB8rpgp78XI
   g==;
X-CSE-ConnectionGUID: geeCAMptRT+4UxPed/fJKQ==
X-CSE-MsgGUID: ViDhSTgpRXWVESd0Z5qi3w==
X-IPAS-Result: =?us-ascii?q?A0CVBQBB8Zdp/5D/Ja1aglmCSA9xX0JJA5ZIA54agX8PA?=
 =?us-ascii?q?QEBDzcaBAEBhQcCjR8CJjYHDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NhlsCAQMyAUYQIDErKxmDAgGCcwIBp1aCLIEBhHzbJgELF?=
 =?us-ascii?q?AGBOIU8iBlrCYR6JxsbgXKEfYsHBIINFYEOihuBGYgbSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4ELGwcFgkKFEQ+JBXhugSCBGwMLGA1IESw3FBsEP?=
 =?us-ascii?q?m4Hji8/gjR0GgEwHWM+eJMCHZI0EoE1n1kKKIN0jB6VOhozhASUFZJSmQaCW?=
 =?us-ascii?q?JQqjVeEaIFvATRGgRNwFYMiCUkZD45fgh2GArV7IjUTKQIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:nvSTnaC6QEpJYRVW/37iw5YqxClBgxIJ4kV8jS/XYbTApGwnhjcBx
 jMdDz3QO/2INDShe9h1YNng80oHv5/Ry4NhOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWmthh
 fuo+5eBYAX/g2YvWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEzPhjJ2gTJZEixqUrPHF2+
 PBfJhIuV0XW7w626OrTpuhEnM8vKozveYgYoHwllW6fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYzBPjDS0Un1lM/CJ8ihO60rnL+aDZf7lmSoMLb5kCNk1QrjOi2YIO9ltqie8R5nn2kq
 Xr8z1vHLyoWbO7C0Dve7Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aetRIaHt4VGOog5UTVlezf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ02FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:tttHLqi1k+6Pb1RGtdtK3z3C+XBQXt0ji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4aXLfDtHZQKQ2njALz7mq+P3lpyVuQ==
X-Talos-CUID: =?us-ascii?q?9a23=3A9HCLlWllEh82zQkr83HQLm0IauzXOXLQwVz5Ble?=
 =?us-ascii?q?kM1oqFICFcVKcv61GsPM7zg=3D=3D?=
X-Talos-MUID: 9a23:7MvMewUYnzdu0zHq/AHtqDFZCMhw2ZSRNm02nc005tCFbjMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="670248381"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id A45B418000210;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id 0BCAACC8D0E; Thu, 19 Feb 2026 21:34:45 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 34/34] cve-update: Avoid NFS caching issues
Date: Thu, 19 Feb 2026 21:34:43 -0800
Message-Id: <20260220053443.3006180-34-hetpat@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231483

From: Paul Barker <paul@pbarker.dev>

When moving the updated CVE database file to the downloads directory,
ensure that it has a different inode number to the previous version of
this file.

We have seen "sqlite3.DatabaseError: database disk image is malformed"
exceptions on our autobuilder when trying to read the CVE database in
do_cve_check tasks. The context here is that the downloads directory
(where the updated database file is copied to) is shared between workers
as an NFS mount. Different autobuilder workers were seeing different
checksums for the database file, which indicates that a mix of both new
and stale data was being read. Forcing each new version of the database
file to have a different inode number will prevent stale data from being
read from local caches.

This should fix [YOCTO #16086].

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f63622bbec1cfaca6d0b3e05e11466e4c10fa86e)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb   | 9 +++++++--
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 6edf705704..b0272cdddd 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -78,8 +78,13 @@ python do_fetch() {
         shutil.copy2(db_file, db_tmp_file)
 
     if update_db_file(db_tmp_file, d):
-        # Update downloaded correctly, can swap files
-        shutil.move(db_tmp_file, db_file)
+        # Update downloaded correctly, we can swap files. To avoid potential
+        # NFS caching issues, ensure that the destination file has a new inode
+        # number. We do this in two steps as the downloads directory may be on
+        # a different filesystem to tmpdir we're working in.
+        new_file = "%s.new" % (db_file)
+        shutil.move(db_tmp_file, new_file)
+        os.rename(new_file, db_file)
     else:
         # Update failed, do not modify the database
         bb.warn("CVE database update failed")
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index abcbcffcc6..8c8148dd92 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -93,8 +93,13 @@ python do_fetch() {
         shutil.copy2(db_file, db_tmp_file)
 
     if update_db_file(db_tmp_file, d, database_time):
-        # Update downloaded correctly, can swap files
-        shutil.move(db_tmp_file, db_file)
+        # Update downloaded correctly, we can swap files. To avoid potential
+        # NFS caching issues, ensure that the destination file has a new inode
+        # number. We do this in two steps as the downloads directory may be on
+        # a different filesystem to tmpdir we're working in.
+        new_file = "%s.new" % (db_file)
+        shutil.move(db_tmp_file, new_file)
+        os.rename(new_file, db_file)
     else:
         # Update failed, do not modify the database
         bb.warn("CVE database update failed")

