Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69BDC25B75
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 02:23:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web11.2336.1715048594666835286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 19:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Yb8s/uQS;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715048600; x=1746584600;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=b/nNBIbnDZTYTbEqocQeBISsBHZZA3hj3LuFBQIcSI8=;
  b=Yb8s/uQS44nBKYxKAilWxU1f51yry6woMVANUPATmWxBPFlRiKDWCuwe
   o88KRCa7/xtht0eCZXM2Jq0ravbg8mwA6saucdQGFO1wHJOsquwrWYh+0
   pSM6zzAAdRWQMhee5B50tCBixC6nZEBKF8J7mSvqtIsh9732FSw3mFh15
   6pXGzUXgTSWFn9MrUA/JioQaWOXEZEDSvOOrVxIqUTPWr5bSrPbInjlaI
   RKJ/ZcwOaePphnDGmjyAi4vQiPHzRPGym1hL2rn+p4Ryd9NaCmgKFAsMh
   ElQAIPkOIhgtBEz00wslPvm2092J76a/G77sPdxQQE0IkcFzEsJM/96ZB
   w==;
X-CSE-ConnectionGUID: PgTStnU+QF+5VTH0iUM49Q==
X-CSE-MsgGUID: Loa4QKQsSTC1zHaB8UWzug==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21432119"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; 
   d="scan'208";a="21432119"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 19:23:20 -0700
X-CSE-ConnectionGUID: MCBLkvPJTAasv4xXtVI1iQ==
X-CSE-MsgGUID: CFQ6m9CaSWivqCtDSGMtTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; 
   d="scan'208";a="28445785"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.119.181])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 19:23:19 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] mmc-utils: upgrade to latest revision
Date: Tue,  7 May 2024 10:23:07 +0800
Message-ID: <20240507022308.13637-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507022308.13637-1-anuj.mittal@intel.com>
References: <20240507022308.13637-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 02:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199062

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index a7e4d369ffc..7c6be93a9ce 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "b5ca140312d279ad2f22068fd72a6230eea13436"
+SRCREV = "f757f413dea4a143ad7c3b48b8264176f0499a82"
 
 PV = "0.1+git"
 
-- 
2.45.0


