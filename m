Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F0AC433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 14:08:47 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web08.30874.1655734123907119982
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 07:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=GotjzxUX;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655734124; x=1687270124;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=q5TycnIwXhfmxHqob2mOBYHgrB4S3ICUXsik8GGSITs=;
  b=GotjzxUXw1rCKJ1VcD5PiW0C+/tMBti51GFoxJjhd/3Z+hTDebXS522q
   UoMmtIEjcDW0Nj9XNU7RDiwlWdPpKj/6F3Tra8s/XUYEFJCSOXNxZ5Huf
   h6IfBu2ncGDNxS7A/kKFCvue8Z0DBMkdg3peTVQREA7Qt+15vWqmqEdab
   CQLgNN/upC0KJgWx0OPAROtf9HUGJeqevemb7kvSqAI+zaR7UoQdriuU0
   SM/s823dxohXMmNFUwUTnaLH4NOaGEUnBkcQcPL8X8EeZYwFtFWvQBscl
   xzA6uUIDZQQ+1EkJM9cFIEitT9reZdP/zxvzZ3A2VN9namrYHkYpU81xR
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="279954253"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400";
   d="scan'208";a="279954253"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 07:08:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400";
   d="scan'208";a="620124807"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 20 Jun 2022 07:08:32 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] dpkg: update to 1.19.8
Date: Mon, 20 Jun 2022 22:08:31 +0800
Message-Id: <20220620140831.73701-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 14:08:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167112

From: Chee Yang Lee <chee.yang.lee@intel.com>

update include fixes for CVE-2022-1664.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/dpkg/{dpkg_1.19.7.bb => dpkg_1.19.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.19.7.bb => dpkg_1.19.8.bb} (86%)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.19.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.19.8.bb
similarity index 86%
rename from meta/recipes-devtools/dpkg/dpkg_1.19.7.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.19.8.bb
index e9dec337b3..9e6e9f2464 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.19.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.19.8.bb
@@ -18,5 +18,5 @@ SRC_URI_append_class-native = " \
                                 file://tweak-options-require-tar-1.27.patch \
 "
 
-SRC_URI[md5sum] = "60f57c5494e6dfa177504d47bfa0e383"
-SRC_URI[sha256sum] = "4c27fededf620c0aa522fff1a48577ba08144445341257502e7730f2b1a296e8"
+SRC_URI[md5sum] = "9d170c8baa1aa36b09698c909f304508"
+SRC_URI[sha256sum] = "2632c00b0cf0ea19ed7bd6700e6ec5faca93f0045af629d356dc03ad74ae6f10"
-- 
2.36.1


