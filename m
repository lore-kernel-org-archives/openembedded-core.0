Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BCCC05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 05:36:03 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.7583.1676007354085404993
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 21:35:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=RxSWZRdU;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676007354; x=1707543354;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ap7VjCp5ilr6wUNL2YY7e0l+PHlKeuM0lkQc7DdyKmE=;
  b=RxSWZRdUZzVHmZyCmq4g+6oRwMzk9KO2MyfMtz/uV1jboJMpA08VTLI7
   WO2gcaD4xk4gf9INISoL+YtmKs28I/j3QNKgsMzHOQ/G6ijFVsx7z+cH0
   BebqAs+WMe4Wah31aiHaMTGMrQh9BMFQUEzqTZvvWCuf+PI2Q7Lt6WdU8
   9DU2qXDpZY5wH72S2X7SYuwoBxY0T8BFNgvAZoW1MhVlZU48J1uJh9FkZ
   tH2aF5GLOEeOaTuLfSOp59txLKz44g3VHrTLHYYkJtPNMjKCe8VRhdYiR
   wl5XncP4xbWXAn2zePjxFukNjp2f+E0VXcKyHDtQWfJ5ntHhXuZkps201
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="328972001"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="328972001"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 21:35:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="645518621"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="645518621"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga006.jf.intel.com with ESMTP; 09 Feb 2023 21:35:51 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [patch][kirkstone] git: upgrade to 2.35.6
Date: Fri, 10 Feb 2023 13:35:43 +0800
Message-Id: <20230210053543.1915366-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 05:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176974

From: Chee Yang Lee <chee.yang.lee@intel.com>

upgrade include fix for CVE-2022-23521 and CVE-2022-41903

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/git/{git_2.35.5.bb => git_2.35.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.35.5.bb => git_2.35.6.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.35.5.bb b/meta/recipes-devtools/git/git_2.35.6.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.35.5.bb
rename to meta/recipes-devtools/git/git_2.35.6.bb
index be4e3ca1d3..016b743ece 100644
--- a/meta/recipes-devtools/git/git_2.35.5.bb
+++ b/meta/recipes-devtools/git/git_2.35.6.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "2cca63fe7bebb5b4bf8efea7b46b12bb89c16ff9711b6b6d845928501d00d0a3"
+SRC_URI[tarball.sha256sum] = "6bd51e0487028543ba40fe3d5b33bd124526a7f7109824aa7f022e79edf93bd1"
-- 
2.37.3


