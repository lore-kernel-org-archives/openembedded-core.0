Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A647C77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 05:53:35 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.web10.24121.1685253209392603414
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 May 2023 22:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=QchT4Cmj;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=933; q=dns/txt; s=iport;
  t=1685253209; x=1686462809;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=te/PL33H7yQGvAUtwLidm6I2varZHnHxLfP5SOWfqeA=;
  b=QchT4CmjdlsA2hteGBAqOG+KhrqXbFj0crWL97m4T2QO+1DFSvVE/IDR
   uTsVv6c9ttNQkkh88hkKKA+OmTxWMBsfrbn1eDIVMfLHkaHPiCGbLSOuI
   AkbegEjiodUH87U/KZF60hqJ0N6BK0tg+v/HgiTiL/u6zsIpfUqXf6oFL
   I=;
X-IronPort-AV: E=Sophos;i="6.00,198,1681171200"; 
   d="scan'208";a="63846568"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 28 May 2023 05:53:28 +0000
Received: from sjc-ads-7441.cisco.com (sjc-ads-7441.cisco.com [10.30.220.226])
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 34S5rRjm010104
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 28 May 2023 05:53:28 GMT
Received: by sjc-ads-7441.cisco.com (Postfix, from userid 1812315)
	id 741BFCC1293; Sat, 27 May 2023 22:53:27 -0700 (PDT)
From: Sanjay Chitroda <schitrod@cisco.com>
To: openembedded-core@lists.openembedded.org, schitrod@cisco.com
Subject: [OE-core][PATCH] sqlite3: Whitelist CVE-2022-21227
Date: Sat, 27 May 2023 22:52:52 -0700
Message-Id: <20230528055252.3869703-1-schitrod@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.226, sjc-ads-7441.cisco.com
X-Outbound-Node: rcdn-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 05:53:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181812

This CVE is applicable to "SQLite3 bindings for Node.js" only.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-21227

Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
---
 meta/recipes-support/sqlite/sqlite3_3.41.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.41.2.bb b/meta/recipes-support/sqlite/sqlite3_3.41.2.bb
index b09e8e7f55..11bc8bb4c0 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.41.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.41.2.bb
@@ -12,3 +12,6 @@ CVE_CHECK_IGNORE += "CVE-2019-19242"
 CVE_CHECK_IGNORE += "CVE-2015-3717"
 # Issue in an experimental extension we don't have/use. Fixed by https://sqlite.org/src/info/b1e0c22ec981cf5f
 CVE_CHECK_IGNORE += "CVE-2021-36690"
+# As per https://nvd.nist.gov/vuln/detail/CVE-2022-21227
+# this bug is applicable to SQLite3 Node.js
+CVE_CHECK_IGNORE += "CVE-2022-21227"
-- 
2.35.6


