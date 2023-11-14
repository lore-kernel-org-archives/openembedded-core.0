Return-Path: <pooadire@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410A4C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 06:35:19 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.web11.7662.1699943710619340484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 22:35:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=FS9jZ39y;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: pooadire@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=867; q=dns/txt; s=iport;
  t=1699943710; x=1701153310;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=u1Y1QXBXAzK76+1NEMBFJjMPHU4znUJUlH8+kgUpXGs=;
  b=FS9jZ39ygr1L8e+Hgi+zHjXQkUc/pqu+VCygebbC2VhmBudaoaIHGydh
   jhjRNb+aSFIqGYqEuXNjbm5UxQtDbHRMLQlgg7O0smwtsYVN9FOignDTL
   vc0nDoLT+toKoqK4vXfvuql6qcWjcJ7euq05PhpSdOxTAvEthYXveuP8O
   E=;
X-CSE-ConnectionGUID: cGQHJhu5SKuf8o0ih/q2ig==
X-CSE-MsgGUID: vigyTNjWQQ6L7GHkGqp+5w==
X-IronPort-AV: E=Sophos;i="6.03,301,1694736000"; 
   d="scan'208";a="138279036"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 06:35:10 +0000
Received: from sjc-ads-2359.cisco.com (sjc-ads-2359.cisco.com [171.70.63.47])
	by rcdn-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id 3AE6Z4Q2013690
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 14 Nov 2023 06:35:09 GMT
Received: by sjc-ads-2359.cisco.com (Postfix, from userid 1807045)
	id 6CACFCC129C; Mon, 13 Nov 2023 22:35:04 -0800 (PST)
From: poojitha adireddy <pooadire@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, pooadire@cisco.com
Subject: [OE-core] [dunfell] [PATCH] qemu: Whitelist CVE
Date: Tue, 14 Nov 2023 06:35:01 +0000
Message-Id: <20231114063501.195289-1-pooadire@cisco.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.70.63.47, sjc-ads-2359.cisco.com
X-Outbound-Node: rcdn-core-3.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 06:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190487

Reason:
CVE-2021-3947, issue introduced in v6.0.0-rc0
Reference:
https://security-tracker.debian.org/tracker/CVE-2021-3947

Dunfell utilizes qemu v4.2.0, Hence whitelisting the CVE.

Signed-off-by: poojitha adireddy <pooadire@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e6b26aba88..9734a9719f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -167,6 +167,9 @@ CVE_CHECK_WHITELIST += "CVE-2020-27661"
 # this bug related to windows specific.
 CVE_CHECK_WHITELIST += "CVE-2023-0664"
 
+# the issue introduced in v6.0.0-rc0
+CVE_CHECK_WHITELIST += "CVE-2021-3947"
+
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 
-- 
2.33.0


