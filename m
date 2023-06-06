Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10437C7EE2E
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 05:17:09 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.2122.1686028620587863173
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 22:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=Yabplx9w;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686028621; x=1717564621;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Gb3J3+rvIqBYAVOBhAJZaz/4bwV2yqo5ccyBehTSyxc=;
  b=Yabplx9wwnRHc29RdwSdF0rjalzJE28BeyoCMYnDvR07HU3xGRCwwJU7
   oROxCy6NinbqAXThbD0rVzcuWtiT18EDidRXxibh3x+hJ9qTVvUuS8f/g
   ovjajHVYz/cB/jHBIOZMAd6FJYRHjSr03FStZhcAsV+XUdAZcDGDdBMnv
   HKW3I/s2w516L1a6b5K4goIj1wz5MaDEr4UPdVyB5WhjjXaY63uo1N/kA
   XRk8Biz/OEL5TUna3wOLFcyY1QYfkJYgySlsb5Q1PPjB3Uc9GHuO74Ny1
   8XQgw1A8H7GTaRki6RdUrLwnjt3XXc740Ai9yziJWUbyl5iv685p33lr/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="420113018"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="420113018"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 22:17:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="798683769"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="798683769"
Received: from anmitta2-mobl3.png.intel.com ([10.107.4.247])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 22:16:59 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] stress-ng: upgrade 0.15.07 -> 0.15.08
Date: Tue,  6 Jun 2023 13:16:47 +0800
Message-Id: <20230606051648.29103-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606051648.29103-1-anuj.mittal@intel.com>
References: <20230606051648.29103-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 05:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182408

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../stress-ng/{stress-ng_0.15.07.bb => stress-ng_0.15.08.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.15.07.bb => stress-ng_0.15.08.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.15.07.bb b/meta/recipes-extended/stress-ng/stress-ng_0.15.08.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.15.07.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.15.08.bb
index 674c58a6a2..9952c4ef8a 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.15.07.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.15.08.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "83ab1d2d7e39d9accba9d6dd0cc567645bb21d92"
+SRCREV = "4fc205238518cdaf80cf18e8bd411708f7ba3856"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.40.1


