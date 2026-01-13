Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B233D0C83B
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:26:01 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56094.1768299951871872675
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J1nQHxH9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299951; x=1799835951;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+AnfSHE5cyiO+ktyt6KZkTMdbITKdrRg/3+7V5qJ+Ig=;
  b=J1nQHxH9f4IfNyeq7mtkxcC8SqIPBoISM3DI7nvmhoqsJi/uFhGDgFu+
   d+5v7igqihzihsGIl8Wh+tP7VBga5BuOFVAkhllJ17t6LshAKYe7cg0rS
   eEI8lKPOOr+tVPEArXrrasgu4hgh676rtU6YIGVc2xMJwPE0L2H51O5Md
   pLXQc5CJR2naj8JJBSqgRi7+aaJDUTe4WOsDgt3x5VZrO50BVLDHvbZHC
   NAcI/2L34hJTNtEn8jhHKp8GG8Lz8cqP7NzfNTDrJaN9FmetLx8ytGJiT
   Oorjg0zoXzyXxSJ7Mbed1dG+pm6nGmv75vGRAn0zuJKIyRPMB1KT0luhv
   g==;
X-CSE-ConnectionGUID: lHpGChVdRdO0k3Pe0/zgTQ==
X-CSE-MsgGUID: rCDwnF5kSrWxwN79mIWdaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="226265861"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="226265861"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:25:50 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 628E782073B
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:50 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 1C0FDC0246D
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3BA94826FFF;
	Tue, 13 Jan 2026 10:25:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/18] repo: upgrade 2.60.1 -> 2.61
Date: Tue, 13 Jan 2026 18:25:06 +0800
Message-ID: <20260113102509.728-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102509.728-1-wangmy@fujitsu.com>
References: <20260113102509.728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229255

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.60.1.bb => repo_2.61.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.60.1.bb => repo_2.61.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.60.1.bb b/meta/recipes-devtools/repo/repo_2.61.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.60.1.bb
rename to meta/recipes-devtools/repo/repo_2.61.bb
index 4a981e5270..2abe84f612 100644
--- a/meta/recipes-devtools/repo/repo_2.60.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.61.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "871e4c7ed153682a77de44e300b5f5461eb08538"
+SRCREV = "e71a8c6dd85026c8861e675ed7ff468fc611df44"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.43.0


