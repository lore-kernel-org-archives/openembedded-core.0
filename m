Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746DFC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 07:59:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.72636.1705305579383474380
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jan 2024 23:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=e3sTcgO2;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705305579; x=1736841579;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VmaBwRqV7rE67sj7drD1iLBtvkQ2PWFMMjbQwRaFKSE=;
  b=e3sTcgO2w70bs45o2Wn7KWw/zrtIChoilcfVI6U5YuGAENyBeDq48OWO
   Dj60X9w3od7ooJusUkKZRJqVqd1TTUlSaanBMfhmLrgKaJZM4G5wNWtNr
   JhaPJlRlk4n9R4W+vW+pnvnk0SVqfeExuhPLSHdlEHdoZKOsJFPDqrMnj
   TSlXciBvsl0ctjewyc4HSB44gK3+E7A6bKu2Eaz1pG6/6zwipMzC2ZhbB
   ti5q+uRmjyP+NgCT219VFdxgNr5G5HUQ24mO4ik9FeHAJ1xrTGiqo4IId
   MHVBc/QDQXZ+s7EfK+7kNTuDvQFJ5z5536jtgccuKEz13AjBW2sfJFshN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="403316088"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="403316088"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 23:59:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="787007043"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="787007043"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga007.fm.intel.com with ESMTP; 14 Jan 2024 23:59:37 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [master][nanbield][patch] qemu: 8.1.2 -> 8.1.4
Date: Mon, 15 Jan 2024 15:30:57 +0800
Message-Id: <20240115073057.2143308-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 07:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193637

From: Lee Chee Yang <chee.yang.lee@intel.com>

update include fix for CVE-2023-3019.
CVE-2023-3019 : https://github.com/qemu/qemu/commit/88e79a2dfda319f9ebec2cc8a5c3c9733716d13f

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../qemu/{qemu-native_8.1.2.bb => qemu-native_8.1.4.bb}         | 0
 ...{qemu-system-native_8.1.2.bb => qemu-system-native_8.1.4.bb} | 0
 meta/recipes-devtools/qemu/qemu.inc                             | 2 +-
 meta/recipes-devtools/qemu/{qemu_8.1.2.bb => qemu_8.1.4.bb}     | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/qemu/{qemu-native_8.1.2.bb => qemu-native_8.1.4.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.1.2.bb => qemu-system-native_8.1.4.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu_8.1.2.bb => qemu_8.1.4.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb b/meta/recipes-devtools/qemu/qemu-native_8.1.4.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_8.1.2.bb
rename to meta/recipes-devtools/qemu/qemu-native_8.1.4.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_8.1.2.bb b/meta/recipes-devtools/qemu/qemu-system-native_8.1.4.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_8.1.2.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_8.1.4.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 70515d980e..afa2915b1d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -41,7 +41,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
 
-SRC_URI[sha256sum] = "541526a764576eb494d2ff5ec46aeb253e62ea29035d1c23c0a8af4e6cd4f087"
+SRC_URI[sha256sum] = "176dd6d0bdcc4c71a94172d12ddb7a3b2e8e20d638e5db26138165a382be2dbd"
 
 SRC_URI:append:class-target = " file://cross.patch"
 SRC_URI:append:class-nativesdk = " file://cross.patch"
diff --git a/meta/recipes-devtools/qemu/qemu_8.1.2.bb b/meta/recipes-devtools/qemu/qemu_8.1.4.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_8.1.2.bb
rename to meta/recipes-devtools/qemu/qemu_8.1.4.bb
-- 
2.37.3


