Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22D7CA0FE6
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 13:01:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.5659.1693573285195678325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 06:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=NwxN39m/;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693573285; x=1725109285;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=NmkNmtysOJcQTPWzwp4AoL6UHNjhRqIUXa+SuidHqgo=;
  b=NwxN39m/oYC4T7Gwl39X6upNLT1Tilv05xar6Czs8a00ExGaPK1zyD6g
   k6NNJ9BYjfoWF5ZomDKl/SHdqmtk+PT1y8qhnt0s/b38AoqEJRheo9Y+o
   6c7/061AIwMyPfALEK2wJnnF0uf3eiNn3yBZ7E7OeKYoRL8HKeEdcm4XY
   JiejbHY2bVMkYgCievN/c2dqTveaoDRbMU4dC/tk01wU4m0AwOcI5733h
   1Qa6JgyjIma0lS+oQMCxXMlmNwfwyAaYZCBUhcvOt/qRZgPZ+9Zq2X6ud
   +6rmlf6VgeltaFd3dGYcIRWZNaGZpMf3AHMLRTfqXjSKz+dNKEcYZem1r
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361239745"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="361239745"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 06:01:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="739924088"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="739924088"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga002.jf.intel.com with ESMTP; 01 Sep 2023 06:01:22 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][patch 3/4] python3: update to 3.11.5
Date: Fri,  1 Sep 2023 20:41:42 +0800
Message-Id: <20230901124143.1639925-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230901124143.1639925-1-chee.yang.lee@intel.com>
References: <20230901124143.1639925-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 13:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187008

From: Chee Yang Lee <chee.yang.lee@intel.com>

upgrade include fix for CVE-2023-40217

Release notes:
https://docs.python.org/3/whatsnew/changelog.html#python-3-11-5-final

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../python/{python3_3.11.4.bb => python3_3.11.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.11.4.bb => python3_3.11.5.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipes-devtools/python/python3_3.11.5.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.11.4.bb
rename to meta/recipes-devtools/python/python3_3.11.5.bb
index 41b27094c7..b1ab307804 100644
--- a/meta/recipes-devtools/python/python3_3.11.4.bb
+++ b/meta/recipes-devtools/python/python3_3.11.5.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "2f0e409df2ab57aa9fc4cbddfb976af44e4e55bf6f619eee6bc5c2297264a7f6"
+SRC_URI[sha256sum] = "85cd12e9cf1d6d5a45f17f7afe1cebe7ee628d3282281c492e86adf636defa3f"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.37.3


