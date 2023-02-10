Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A83C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 05:22:13 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.7359.1676006524013422592
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 21:22:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=WdvQdII6;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676006523; x=1707542523;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qBVr7QDbuQYAlVHE1cpu0PEwhqfyUbDbBYe8mh8G7+c=;
  b=WdvQdII6pOyVz1Tj0naog4ns//Hl5siF880DWnbr/8EAl4OTnkO6GO5D
   3zkBw8XunCPMgTFX0VkKVcrbMQV5lzWi5MIJXTcm4OsodXZA8b49HC6nN
   YRWodlw9WburIvlx178aUlCsfj6P1P7/K9Y1xVfkCzbDp32OcVBWzYo8d
   ywbODBYtPSHCJ3MwhxWJtBeXj34tVSY5AJby3gT4TWVq8mrfBCYLDmw0v
   /pbAkzoTeGPGylSYoKH0Ey6TkVusC3VDQ8o3dLnZKFqrBeQ6qxdpJ0HoD
   oulACAbsGOewSGHHj0Zj0b68YI7kanqYt+bnH/ZiUAsx5lQ35x6DMEOaI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="330347938"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="330347938"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 21:22:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="645516835"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="645516835"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga006.jf.intel.com with ESMTP; 09 Feb 2023 21:22:02 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [patch][langdale] git: upgrade to 2.37.5
Date: Fri, 10 Feb 2023 13:21:54 +0800
Message-Id: <20230210052154.1907253-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 05:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176973

From: Chee Yang Lee <chee.yang.lee@intel.com>

upgrade include fix for CVE-2022-23521 and CVE-2022-41903

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/git/{git_2.37.4.bb => git_2.37.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.37.4.bb => git_2.37.5.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.37.4.bb b/meta/recipes-devtools/git/git_2.37.5.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.37.4.bb
rename to meta/recipes-devtools/git/git_2.37.5.bb
index 2205a50d16..387845b69d 100644
--- a/meta/recipes-devtools/git/git_2.37.4.bb
+++ b/meta/recipes-devtools/git/git_2.37.5.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "a638c9bf9e45e8d48592076266adaa9b7aa272a99ee2aee2e166a649a9ba8a03"
+SRC_URI[tarball.sha256sum] = "5c11f90652afee6c77ef7ddfc672facd4bc6f2596d9627df2f1780664b058b9a"
-- 
2.37.3


