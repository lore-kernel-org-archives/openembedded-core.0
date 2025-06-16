Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2FCC7115C
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:02 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.26271.1750065418417308291
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Hu0S1ufV;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065420; x=1781601420;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0YF8LXsuf/uab5xNtbVWm7R+blFIQ4CTSO3o4WevBFQ=;
  b=Hu0S1ufVzqaKcVBNTof1OQ0kKefqymu/Z2Td1HFGXLssWuYPaF0gJhHw
   kzm1Ru9W/VAq91XYvzZ306012HVrVHlVIV71SdV47XSoM1NVxkhLcBgGK
   02DPmDChG27FBy/bd1nTTYAsGXkq/QKITd6SziY/FYzVMwzwHDcPld/cy
   tvkTbNPgbmyjE0hNuo1DEuCM/RRpiFfzYabISyVGtX0B84PMv1o5Mb38j
   Qp68OkXRnJ28/wSJe1ba7w3z01P4jhxodhodPmIBPb7o/QOkPRaHnwOvT
   tyWUObvMXy0kDDI4ggAIw42KV1smDDrMb4FJYPeCg6rqg99k6eDEA9XPI
   A==;
X-CSE-ConnectionGUID: Iqai3h3YTvyGcEoaSvfMHw==
X-CSE-MsgGUID: 4r+AkHNfTd2Ws8U0PkZUbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="190253970"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="190253970"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:59 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DE3C7D4C24
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 87927D4C03
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:56 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 066301A000B;
	Mon, 16 Jun 2025 17:16:55 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/24] repo: upgrade 2.55 -> 2.55.2
Date: Mon, 16 Jun 2025 17:16:41 +0800
Message-ID: <20250616091643.918-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218794

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.55.bb => repo_2.55.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.55.bb => repo_2.55.2.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.55.bb b/meta/recipes-devtools/repo/repo_2.55.2.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.55.bb
rename to meta/recipes-devtools/repo/repo_2.55.2.bb
index 5fea49abb3..9cff3c0b7c 100644
--- a/meta/recipes-devtools/repo/repo_2.55.bb
+++ b/meta/recipes-devtools/repo/repo_2.55.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "08815ad3eb245872700201e03c47cb504d1dc3f9"
+SRCREV = "b262d0e4619c406a2708856ed312091d21c5bf39"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.43.0


