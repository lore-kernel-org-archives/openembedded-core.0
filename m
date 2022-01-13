Return-Path: <khairul.rohaizzat.jamaluddin@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C17AC433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 01:45:07 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.3051.1642038305687530658
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 17:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=YUv5jh4h;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642038305; x=1673574305;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r9REpIqulaWfZqglixdi+ae4HL7mgCEeqRX7g7B+xEM=;
  b=YUv5jh4hEnR5V5SYbe0/RdYjeFmJ4gTDA3AXXu6qvyHGVYZHPsLAdW6G
   E6VjrB4D4lj64D3hevyCTU6uy/mgvuNbT2UcnUBdOx0sdq1aiHXWud9Iu
   krrIaKWZ0p1AdfIJofYodLG4fTaGEoma70F0no2//CMx9GVCOrr8H4Fwq
   ymrcXOdtojxNLCL49kKOwkupXOS0wAttOYQ/WCTOo91gIQiHm7GHm/U7X
   kV75ar1+rv8G02SNaFBZHo1XVSe5D42aOM45v8ORbVQqgs0xvOHSvK45m
   4p9yen99Yj13k93qw68numc5DdAxfXvbQgHeBWRkotHeZo1BdkMQBod6o
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="330253067"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600";
   d="scan'208";a="330253067"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 17:45:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600";
   d="scan'208";a="576776709"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga008.fm.intel.com with ESMTP; 12 Jan 2022 17:45:03 -0800
From: khairul.rohaizzat.jamaluddin@intel.com
To: openembedded-core@lists.openembedded.org
Cc: khairul.rohaizzat.jamaluddin@intel.com
Subject: [PATCH][master] epiphany: update 41.0 -> 41.3
Date: Thu, 13 Jan 2022 09:45:03 +0800
Message-Id: <20220113014503.49989-1-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 01:45:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160503

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

Includes fix patches for epiphany CVE.

CVE: CVE-2021-45085 CVE-2021-45086 CVE-2021-45087 CVE-2021-45088

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 .../epiphany/{epiphany_41.0.bb => epiphany_41.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_41.0.bb => epiphany_41.3.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_41.0.bb b/meta/recipes-gnome/epiphany/epiphany_41.3.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_41.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_41.3.bb
index 8f3bd87340..c5bc3f446d 100644
--- a/meta/recipes-gnome/epiphany/epiphany_41.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_41.3.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "b39d1825492595b0b74c5d6a6686a857f9419dfa4c02f8013c297bc870e26dd0"
+SRC_URI[archive.sha256sum] = "ba01268ee54f318dfdac2e01eba38a3fc96940c1cbf640ed2613ae29f8bcb9ad"
 
 PACKAGECONFIG_SOUP ?= "soup2"
 PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
-- 
2.33.1


