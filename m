Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A081CC74A5B
	for <webhook@archiver.kernel.org>; Sat, 18 Mar 2023 11:59:14 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.4889.1679140750075052873
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Mar 2023 04:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=it7C+vbE;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679140750; x=1710676750;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LWV9jRyd6pcmPxfWNtyYuIlZLQjvkG8hvCIxzgr6GHo=;
  b=it7C+vbE6AqkEtssUbrGR2/qtS7/jUng+xHyYnoD6GqH/EDQdWwNDf3q
   skwRge2UesGtohqI+USb9CRGGBAYQzhdZy+KWgXeNWuE7dYcZ5ymU7nR1
   Gt2TbDyfP9OowmCNSRBqsFEcdb/hYDSOIxRRWO10jS+FOqc2ITi3lbhqY
   aIW9u0QJHirLGXyQQug1Ra1OX38VJBfHKVMduorhjoOfOAo2X8ThXW1dj
   Bn4Fi2z+fVrycSUFELJucqTmOZj9/6GycGSfywTUfqOxc1RpHCmpCKBL3
   RwUjyuZIMOzjcVPYG6KtbNOvyczEnQAe1rWyBYbmuWiNonRXIKOy4TQ/M
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="339964105"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="339964105"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 04:59:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="1009965053"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="1009965053"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga005.fm.intel.com with ESMTP; 18 Mar 2023 04:59:08 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [langdale][patch 1/3] git: ignore CVE-2023-22743
Date: Sat, 18 Mar 2023 19:58:57 +0800
Message-Id: <20230318115859.3071237-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Mar 2023 11:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178785

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/git/git_2.37.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/git/git_2.37.6.bb b/meta/recipes-devtools/git/git_2.37.6.bb
index e6165ca37b..302db215e2 100644
--- a/meta/recipes-devtools/git/git_2.37.6.bb
+++ b/meta/recipes-devtools/git/git_2.37.6.bb
@@ -33,6 +33,8 @@ CVE_PRODUCT = "git-scm:git"
 CVE_CHECK_IGNORE += "CVE-2022-24975"
 # This is specific to Git-for-Windows
 CVE_CHECK_IGNORE += "CVE-2022-41953"
+# specific to Git for Windows
+CVE_CHECK_IGNORE += "CVE-2023-22743"
 
 PACKAGECONFIG ??= "expat curl"
 PACKAGECONFIG[cvsserver] = ""
-- 
2.37.3


