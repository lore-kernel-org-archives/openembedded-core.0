Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EEFC47080
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7190.1649169707422558639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=PKxo9kLl;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649169710; x=1680705710;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=CuKWOOb1GWeKlctPHAdYlFzHjnA8d7NgWLtA3pQ6vFg=;
  b=PKxo9kLliyUS0Qza49ONX/Qvy7o6gghNajS2T041K0L/N7vI77iCC0xv
   PyfB8MyN2s6rre8N162imo+yA1DWGuicnBUiGH/9lEux4Q/8sB5+rWHfP
   c/S0Uml706hyRYHnOXc8hz8qvwGDlletdx/PYKNs+METtwtMg2ZdwvUdV
   iGd4o5Y9Ekq1l49Qrlwq+Z+Q9wEi4Eg8x9sjWSnaDBDiT4NRc02yDqpBB
   sLo8g9MG+xAGlmcimi2TKTD6pvTlJ3Yu7sY1/6XY7DqEHSjOpaMTyOSDg
   nJ7g4DQN2ODJ4ctbIqsLSbvkl9Q+13cmXJbodI0wQhUL95dgjnvetgfUX
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258348663"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="258348663"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:41:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="696953512"
Received: from ntabdull-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.226.238])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:41:48 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 02/22] oe-pkgdata-util: Adapt to the new variable
 override syntax
Date: Tue,  5 Apr 2022 22:41:21 +0800
Message-Id: 
 <a1a4092e5e18a1afdb774dc327cc493c32ccd670.1649169646.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649169646.git.anuj.mittal@intel.com>
References: <cover.1649169646.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164020

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2bf6a0ca9fdf639418646700b20b65c9960efdbe)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/oe-pkgdata-util | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 71656dadce..7412cc1f47 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -296,7 +296,7 @@ def package_info(args):
             extra = ''
             for line in f:
                 for var in vars:
-                    m = re.match(var + '(?:_\S+)?:\s*(.+?)\s*$', line)
+                    m = re.match(var + '(?::\S+)?:\s*(.+?)\s*$', line)
                     if m:
                         vals[var] = m.group(1)
             pkg_version = vals['PKGV'] or ''
-- 
2.35.1


