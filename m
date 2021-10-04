Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC4AC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 18:25:53 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.13949.1633371952123966842
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 11:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="311744806"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="311744806"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:07 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="483208844"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.213.128.172])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:05 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/11] Update mailing list address
Date: Tue,  5 Oct 2021 00:50:48 +0800
Message-Id: 
 <c2531bf2503e8dd736bba0acde9e329a439f3fda.1633366030.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633366030.git.anuj.mittal@intel.com>
References: <cover.1633366030.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 18:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156625

From: Jon Mason <jdmason@kudzu.us>

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 83169c33f7585da25560784f79eaad2c6f029f3c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/maintainers.inc                      | 2 +-
 meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6276331857..5d453a6fcd 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -4,7 +4,7 @@
 #
 # Please submit any patches against recipes in meta to the
 # OE-Core mail list (openembedded-core@lists.openembedded.org)
-# For recipes in meta-yocto please use the Poky list (poky@yoctoproject.org)
+# For recipes in meta-yocto please use the Poky list (poky@lists.yoctoproject.org)
 #
 # If you have problems with or questions about a particular recipe, feel
 # free to contact the maintainer directly (cc:ing the appropriate mailing list
diff --git a/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig.patch b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig.patch
index 52986e61c7..d1835c7a10 100644
--- a/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig.patch
+++ b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig.patch
@@ -400,7 +400,7 @@ Index: ldconfig-native-2.12.1/ldconfig.c
    return 0;
  }
  
-+#define REPORT_BUGS_TO "mailing list : poky@yoctoproject.org"
++#define REPORT_BUGS_TO "mailing list : poky@lists.yoctoproject.org"
  /* Print bug-reporting information in the help message.  */
  static char *
  more_help (int key, const char *text, void *input)
-- 
2.31.1


