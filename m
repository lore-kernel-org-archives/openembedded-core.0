Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF72E78D65
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:26 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43857.1770627854435022946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V6pVZRCo;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627857; x=1802163857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rb8gskji0uVm/xCVI4lpRq/cqY9X0NKqBZvr0SUFIvs=;
  b=V6pVZRCo0dU/G+fYT1n7a5tfl5Rol9q6gcPzff7vrUlHkGOls9F8auF2
   hpyvyrdAPfQkTIUGI9rSq4skoL4qcpD69JTvJV8tSNCm7BZMx5/JUZG9X
   PHQexv3Z+6ryFtkguRKkT6ZWG2zZpz/6E9LPc+QQrbvmAvjbC42eMyK4t
   L/ZAGfBgZsBaDgx17TNNjC9ubs6qEoucfaVkKLKLzcqIHZDfOvEPdeeRu
   jChIgI2B7zcGGJFE23goOSLwXkGmmA9L2VmODmk+ceBgtoZUkRXeO4reG
   nB4iSnDQnTveqi5F2vXx5A4VxbCLvyg1SnvdDqoKTJSHBvzhu85D9R/mT
   Q==;
X-CSE-ConnectionGUID: lNWpU+uGTMiRog4TXj+GVQ==
X-CSE-MsgGUID: Vv93/WYGSC2i+JJKfg5OXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="233142036"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="233142036"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:17 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id A2D23407546
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:18 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3EE6A18000DD
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 94274101A415;
	Mon,  9 Feb 2026 09:04:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 30/39] repo: upgrade 2.61 -> 2.61.1
Date: Mon,  9 Feb 2026 17:03:08 +0800
Message-ID: <20260209090317.1468-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230739

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.61.bb => repo_2.61.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.61.bb => repo_2.61.1.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.61.bb b/meta/recipes-devtools/repo/repo_2.61.1.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.61.bb
rename to meta/recipes-devtools/repo/repo_2.61.1.bb
index 2abe84f612..456f3ad556 100644
--- a/meta/recipes-devtools/repo/repo_2.61.bb
+++ b/meta/recipes-devtools/repo/repo_2.61.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "e71a8c6dd85026c8861e675ed7ff468fc611df44"
+SRCREV = "5d88972390295e229ee940992cb33ce8cfd39cd5"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.43.0


