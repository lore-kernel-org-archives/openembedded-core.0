Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DEBC48BF6
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 17:45:23 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web11.78148.1709487915836006404
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 09:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=HVGvjl4a;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1076; q=dns/txt; s=iport;
  t=1709487915; x=1710697515;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7YWhRAnFE8+UgAfmrZXnrG+CR1wzb9Oj63Jv0cCrln0=;
  b=HVGvjl4akhuk+NXJin97B3T5aaUq1CKCZrT/6qUZN5FuJO3mY3Ogmgwj
   boXD2C8q4FL5wKgI0ibCNMCixsC3FEKOAAU96lqba4ZKNg0PVr/pfS+C2
   d8DfoNmOxSJNbC6BYUY1z4BeLE/tW+nx4g8yKEl4/ixOAa9PoA4vBeIrO
   w=;
X-CSE-ConnectionGUID: w45thCYCSFyVr/cL5MekYg==
X-CSE-MsgGUID: qWKLbsxMRwesFFb9+wILtg==
X-IronPort-AV: E=Sophos;i="6.06,201,1705363200"; 
   d="scan'208";a="221780539"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
  by alln-iport-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 17:45:15 +0000
Received: from sjc-ads-6228.cisco.com (sjc-ads-6228.cisco.com [10.28.89.212])
	by rcdn-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id 423HjELv014794
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 17:45:14 GMT
Received: by sjc-ads-6228.cisco.com (Postfix, from userid 1820939)
	id 6090ECC1251; Sun,  3 Mar 2024 09:45:14 -0800 (PST)
From: dnagodra@cisco.com
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, Dhairya Nagodra <dnagodra@cisco.com>
Subject: [nanbield] [PATCH] glibc: Remove duplicate entry for CVE-2023-4527
Date: Sun,  3 Mar 2024 09:44:46 -0800
Message-Id: <20240303174445.2523906-1-dnagodra@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.28.89.212, sjc-ads-6228.cisco.com
X-Outbound-Node: rcdn-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 17:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196572

From: Dhairya Nagodra <dnagodra@cisco.com>

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 212f960cb5..ee89762ae6 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -11,7 +11,6 @@ CVE_STATUS[CVE-2023-4527] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-4911] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-4806] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-5156] = "fixed-version: Fixed in stable branch updates"
-CVE_STATUS[CVE-2023-4527] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-0687] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-6246] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-6779] = "fixed-version: Fixed in stable branch updates"
-- 
2.35.6


