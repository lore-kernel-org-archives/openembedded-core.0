Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF70CA0FE1
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 04:08:34 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.web11.13287.1693541311683011870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 21:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=Y7l23/NJ;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=824; q=dns/txt; s=iport;
  t=1693541311; x=1694750911;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pDo7y+h6x+6diI7YOBCjsCFYYa+trzCgow84vfSkUbQ=;
  b=Y7l23/NJCZIiB7Z186pLBsrzHOfBWox2B9aCrxajXVFy/C3xnVhczMcF
   e1EuWndnXhc0QEzxNv8eDM6fTLmRcsLnLTE0WC7tOMtDjWIRbs7zwzBDR
   FDzLO/+0japrewYP2w9nLFeqfFPTFZucuz47qWTr8ZkEtmokwWIJBej7y
   g=;
X-IronPort-AV: E=Sophos;i="6.02,218,1688428800"; 
   d="scan'208";a="110102449"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 04:08:31 +0000
Received: from sjc-ads-3781.cisco.com (sjc-ads-3781.cisco.com [171.68.250.228])
	by rcdn-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 38148UKi002606
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 1 Sep 2023 04:08:30 GMT
Received: by sjc-ads-3781.cisco.com (Postfix, from userid 1820939)
	id B49BECC1293; Thu, 31 Aug 2023 21:08:29 -0700 (PDT)
From: Dhairya Nagodra <dnagodra@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Qi.Chen@windriver.com, xe-linux-external@cisco.com,
        Dhairya Nagodra <dnagodra@cisco.com>
Subject: [dunfell] [PATCH] flex: Exclude CVE-2015-1773 from cve-check.
Date: Thu, 31 Aug 2023 21:08:19 -0700
Message-Id: <20230901040819.725503-1-dnagodra@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.250.228, sjc-ads-3781.cisco.com
X-Outbound-Node: rcdn-core-7.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 04:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186989

Issue only affects Apache.

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
---
 meta/recipes-devtools/flex/flex_2.6.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 1ac88d65ef..5be7351f4c 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -31,6 +31,8 @@ CVE_STATUS[CVE-2019-6293] = "upstream-wontfix: \
 there is stack exhaustion but no bug and it is building the \
 parser, not running it, effectively similar to a compiler ICE. Upstream no plans to address this."
 
+CVE_STATUS[CVE-2015-1773] = "not-applicable-platform: Issue only affects Apache."
+
 inherit autotools gettext texinfo ptest github-releases
 
 M4 = "${bindir}/m4"
-- 
2.35.6


