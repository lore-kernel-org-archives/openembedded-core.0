Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16055CA0FE6
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 04:19:14 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web11.13376.1693541951511638760
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 21:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=R563B0ri;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=755; q=dns/txt; s=iport;
  t=1693541951; x=1694751551;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qhVs/wnQPyIaZoTwXh/n9NuGXH3LN258fSapfLrzciA=;
  b=R563B0ribbEr1cbaC+JTrg4ybp+TIBLhJLuvGWoddJ8GP7qZZJ1E5Dg5
   QMsnUTOfQcugmcRVJkcjiUixIXfqqyG1Q8TG21FyNGGEOnmtRsV8va+qH
   eeX3rwTQmDcEqpB2Nvqk6alpBgPyadcDHjaptpb1SP+n8cu8Nrd5AdBoh
   w=;
X-IronPort-AV: E=Sophos;i="6.02,218,1688428800"; 
   d="scan'208";a="148401522"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
  by alln-iport-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 04:19:10 +0000
Received: from sjc-ads-3781.cisco.com (sjc-ads-3781.cisco.com [171.68.250.228])
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 3814JAOG004652
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 1 Sep 2023 04:19:10 GMT
Received: by sjc-ads-3781.cisco.com (Postfix, from userid 1820939)
	id 0309ECC1293; Thu, 31 Aug 2023 21:19:09 -0700 (PDT)
From: Dhairya Nagodra <dnagodra@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Qi.Chen@windriver.com, xe-linux-external@cisco.com,
        Dhairya Nagodra <dnagodra@cisco.com>
Subject: [mickledore] [PATCH] flex: Exclude CVE-2015-1773 from cve-check.
Date: Thu, 31 Aug 2023 21:18:33 -0700
Message-Id: <20230901041833.730139-1-dnagodra@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.250.228, sjc-ads-3781.cisco.com
X-Outbound-Node: rcdn-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 04:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186992

Issue only affects Apache.

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
---
 meta/recipes-devtools/flex/flex_2.6.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 15cf6f5cca..7201977857 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -31,6 +31,9 @@ GITHUB_BASE_URI = "https://github.com/westes/flex/releases"
 # https://github.com/westes/flex/issues/414
 CVE_CHECK_IGNORE += "CVE-2019-6293"
 
+# Issue only affects Apache vendor, not us.
+CVE_CHECK_IGNORE += "CVE-2015-1773"
+
 inherit autotools gettext texinfo ptest github-releases
 
 M4 = "${bindir}/m4"
-- 
2.35.6


