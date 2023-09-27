Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87C8E810DB
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 12:06:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.15780.1695816400126947556
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 05:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=QhF1xak/;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695816400; x=1727352400;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EgkXqVpKjkuGMfGN6/CidIkyMCh7Wk+mbO0lpon6UIA=;
  b=QhF1xak/p5swYv8+9JdNDmWyF13awnTppGpqEAfy51RgRonrD23DHz51
   BBh6JNdhsBxeyO5nVEbov25N8IqR3JDyrXdnAJmfB/BKqYo01aSk37Gwf
   2RbQH5QJq7JwPyILiRyeBh0IlQfoUsVE2Vb/I4ZCWx7LZJNU/OpGsdthG
   3G1DaSMfMEqvCh2g0mZqvunc6Bp8uAbR973BeLVLq0vASX4p+7jTAtBtR
   UynxJYV2uIy+WWwjL4nqNIQ2vVz6RthQuuc1fyo39/mQgY4e7FS0wzHfH
   1oZJvjvuMaGkxpDgLIpIlxwmHhFKU1wh+O3O2U+bsme67oh5wmRpAcHrJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="384595472"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="384595472"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 05:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892579510"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="892579510"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga001.fm.intel.com with ESMTP; 27 Sep 2023 05:05:31 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 1/3] xserver-xorg: ignore CVE-2022-3553 as it is XQuartz-specific
Date: Wed, 27 Sep 2023 19:46:59 +0800
Message-Id: <20230927114701.131513-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 12:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188310

From: Ross Burton <ross.burton@arm.com>

(cherry-pick from commit 769576f36aac9652525beec5c7e8a4d26632b844 )

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 6b11c79be6e..ecb164ddf76 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -28,6 +28,8 @@ CVE_CHECK_IGNORE += "CVE-2011-4613"
 # impossible or difficult to exploit. There is currently no upstream patch
 # available for this flaw.
 CVE_CHECK_IGNORE += "CVE-2020-25697"
+# This is specific to XQuartz, which is the macOS X server port
+CVE_CHECK_IGNORE += "CVE-2022-3553"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-- 
2.37.3


