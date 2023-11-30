Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BE9C10DC1
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 09:42:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.68883.1701337314862152094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 01:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Fz71WJ+a;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701337316; x=1732873316;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zSRpm9vkus/npU/q99mvNIPokqsYZub9lzwYfGcb68M=;
  b=Fz71WJ+apWoe/mm5oHZJXd5GyMeMr1jqOZ2uQ0865+JVkOf2O/vbtQuG
   Ba5fj3vwRRP2ESauGtOqzXIusFgiuC997P5Canv77pjgkHJy9ifaHFL6N
   08Pb5WBiOK0qFS4bc/6mViG1kD9Ns42mTKOHo87CTp9uxfzIPwF0U7+BM
   EIkC6hk0RQ8KwWqTsDw/rwHoSVecCPoFv58QEku6LY3LXF00j07j77MID
   NbfKLcBiRphYWsnH5DrkHoj/5RnAQkOoRySVH0KmjYT6DVi+MCMVSQxD0
   BJrijQBIIaoIYe2nII2eveFjE43OKILDWioaigs8n3MiVnAJd7aLYn8WY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="378327540"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="378327540"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 01:41:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="887184627"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="887184627"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga002.fm.intel.com with ESMTP; 30 Nov 2023 01:41:55 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][PATCH 3/3] xwayland: upgrade to 23.2.2
Date: Thu, 30 Nov 2023 17:22:15 +0800
Message-Id: <20231130092215.2435495-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231130092215.2435495-1-chee.yang.lee@intel.com>
References: <20231130092215.2435495-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 09:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191488

From: Ross Burton <ross.burton@arm.com>

e4487cae1 Bump version to 23.2.2
1e8478455 Xi/randr: fix handling of PropModeAppend/Prepend (CVE-2023-5367)
829a99117 Switch to libbsd-overlay
4f8a851b6 xwayland: Cancel the EI disconnect timer when freed
cc79b2a83 glamor: xv: Fix invalid accessing of plane attributes for NV12
07c18c90e xwayland: Give up on EI on setup failure
10353a01a xwayland: Add an option to enable EI portal support
4f8e209d2 xwayland/glamor/gbm: Set GBM_BO_USE_LINEAR if only LINEAR modifier is supported
c9a842e60 xwayland/present: Handle NULL window_priv in xwl_present_cleanup
2bd43be92 glamor: fixes GL_INVALID_ENUM errors on ES if there is no quads

( cherry-pick from commit 7d0fc94d09db76d4c4d6ca9d2da1b30768f68c9e )

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../xwayland/{xwayland_23.2.1.bb => xwayland_23.2.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.1.bb => xwayland_23.2.2.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.1.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.2.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_23.2.1.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.2.2.bb
index e97a921a96..9feac147db 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.1.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.2.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "eebc2692c3aa80617d78428bc6ec7b91b254a98214d2a70e997098503cd6ef90"
+SRC_URI[sha256sum] = "9f7c0938d2a41e941ffa04f99c35e5db2bcd3eec034afe8d35d5c810a22eb0a8"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.37.3


