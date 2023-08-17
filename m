Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD37C2FC0E
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 09:23:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.183049.1692264186032606238
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 02:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=QLUYnkWR;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692264185; x=1723800185;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nhLUwPQVa8TklLksH+4s9mOh6Inll+Cmvlc+3zu/SyU=;
  b=QLUYnkWRlVQqu0xdnuQqDkZiuSQKQK1lX19uQHfesfjfyNpBBK1E8B/q
   V9JL2rNLUA0/k/i7JksJTiNcpFNWVOXnZVqQSGjXPRKQlfH4HqsTtnKx4
   ckx7xznShKxzo3Humy7sDQsQSbK23SvCNuRGCChFeyN+p7SadNjErb2CC
   RCrxHo7gudKWsvJ0CAklNndMnkAYFiviUjb81QdmXB4orsXEQ5xM1c7Cz
   zgGsbnMc0r2W7dg/3yykn/9BxeosPvaKGvGv1DR3UICQd7eAUFkPBB7jK
   +lFn4gAkkDiYFojTtThByD4eU9z64rE88Uur5TpX6klA7sNNRgUs6p2Wp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="370227398"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="370227398"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 02:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="737633763"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="737633763"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga007.fm.intel.com with ESMTP; 17 Aug 2023 02:23:02 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][patch] librsvg: 2.52.7 -> 2.52.10
Date: Thu, 17 Aug 2023 17:03:26 +0800
Message-Id: <20230817090326.1957267-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 09:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186300

From: Chee Yang Lee <chee.yang.lee@intel.com>

upgrade include fix for CVE-2023-38633

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../librsvg/{librsvg_2.52.7.bb => librsvg_2.52.10.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.52.7.bb => librsvg_2.52.10.bb} (96%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.7.bb b/meta/recipes-gnome/librsvg/librsvg_2.52.10.bb
similarity index 96%
rename from meta/recipes-gnome/librsvg/librsvg_2.52.7.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.52.10.bb
index 78eb93c635..b79e95a04f 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.7.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.10.bb
@@ -20,7 +20,7 @@ SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.pat
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \
            "
 
-SRC_URI[archive.sha256sum] = "057c1eeeaf85c84e254bdb707459207f5840da5b4d52b4711c03140ed09e6887"
+SRC_URI[archive.sha256sum] = "6292dfcd6a8e1ce1784e0188914546af1633081d1fae9e22f7cb017e7e84ba8f"
 
 # librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces from it 
-- 
2.37.3


