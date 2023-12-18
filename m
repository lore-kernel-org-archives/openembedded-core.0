Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA1EC46CD4
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 14:47:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.web11.45511.1702910852353229137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 06:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=a7oKKNKN;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702910860; x=1734446860;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Iig70MMd0fwxhLDdTuFigLCODQIYcP40VUk+izLdMEI=;
  b=a7oKKNKNY46POhZOeKe89thvHUBr4mF/sf937V7aICVB2Q9dMgEGa0kM
   uxpAkCxs9Gqty8bm21GE7AwgUpBn1+K3U2+gbkVtlRSVnnAMABdiiQ7CF
   9R7WtR1RwM5WGb4bDEXcPNIoKYhpCJb7b3jzvkGDK9rrRJm0VfzhitorR
   Q/a4Lo8p0avYZFSJqLvIfhYN5n6exa0E6y2r+r2qODxRqC9X9SaDBnAuV
   /b008rzO7fr+1qnAjPOApkeK/jUUAyu76k9mIQBC9LKULxbtSt1XdD1cH
   r7QUdGQhM9Sqb7eXL02B4CC1b2GXm0oI/Kqf6l/fyi/lOoIXAv3Er7pxv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2350884"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="2350884"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 06:47:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="23802910"
Received: from jsuah-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.240.31])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 06:47:39 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] puzzles: upgrade to latest revision
Date: Mon, 18 Dec 2023 22:47:21 +0800
Message-ID: <20231218144724.7794-6-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218144724.7794-1-anuj.mittal@intel.com>
References: <20231218144724.7794-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 14:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192651

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index d0a9af7cb67..ab4b2394b8b 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "96d65e852cea8a95001fa70e3ec2996d4ea5e2b4"
+SRCREV = "08365fb260ae6e32442dd9f196e65d13facb4b33"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.43.0


