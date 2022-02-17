Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44E7C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 14:18:50 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.318.1645107508890252839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 06:18:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=GAk5WWG3;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645107529; x=1676643529;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=TMZDvavw1VdnWj85e3zIW78SBHXX7pwLuAKHku3nNDM=;
  b=GAk5WWG36XmkUMrGWjYq0PgwkleLHSfxId9wAeLyXb8wl+om35aQSk5H
   Z18xh+iHFyRhv+HDnBe+cbnvEjoOhlXO6oxQtd/UT9zQdJENH7wZ/3R6f
   TwhzrEVtam9IwK2+a8NIw++AgTObSzMVNvTmjeXv+om4OfyeZxOaasq1A
   ky6YwO43Eb4W7mCBhchK2ZElhDqYsngacpRM7lPUMpStvA2z5b0j0ZVKt
   jvenTeydR1mrRRakROmnNhPZQ3hrKrKfbCqY/xWHFNnA1OdgvF4RCFskM
   vtixfG6W9OrmsgljKbgzr/gPPyTq89TgOAoJgiGCLlibeCyX8tN55ZreC
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="250618056"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="250618056"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="530249395"
Received: from kkoay3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.130.102])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:47 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 13/14] vim: upgrade to patch 4269
Date: Thu, 17 Feb 2022 22:18:22 +0800
Message-Id: 
 <e6fe342dd578ca37beeb9dfc991b67dc72c60d06.1645106980.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645106980.git.anuj.mittal@intel.com>
References: <cover.1645106980.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 14:18:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161813

From: Ross Burton <ross@burtonini.com>

Upgrade to the latest patch release to fix the following CVEs:

- CVE-2022-0261
- CVE-2022-0318
- CVE-2022-0319

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 96442e681c3acd82b09e3becd78e902709945f1f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 0be75b6306..e2907c1f43 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
 "
 
-PV .= ".4118"
-SRCREV = "0023f82a76cf43a12b41e71f97a2e860d0444e1b"
+PV .= ".4269"
+SRCREV = "48a604845e33399893d6bf293e71bcd2a412800d"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.35.1


