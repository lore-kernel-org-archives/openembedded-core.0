Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B59D29DE3
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 07:03:29 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53672.1768287802967081724
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 23:03:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Fl9GnU5t;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768287801; x=1799823801;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6p9ZV7TZ7IPEr1IvrdExH/3xa6SpY4ykFXiUBbqqjoI=;
  b=Fl9GnU5tXU5DZvi0FaHfbfsb8gknpC8xPIKA1Xm7iuZDZC+SiUMafK90
   9pTueF7U+sbByN6fvygJgD9NdxHRYqRXY6lTlLNpexLDB+hw8ar1oag+e
   9lNDoDCXHL+1IrfONVDvCg51BDDHUfIPJOcN7V6jGbPu4Tt9+XdrYxMaq
   w5DTJvhGjyhZmLvv+I6SMRQGrTKRv+LTJDaz4KY1wpvNL8vv72qtfSNRv
   h4hUEgvFpJDs09DKGvx/laCRVzYPX0sQFer9D9dG7P+EKQ9o1dRIW60dp
   N+GsKDU/ZbZF6rcrgz8Px2j23wiSMXxpbR1aD9LrVsZcGAh+bHybFgBpJ
   A==;
X-CSE-ConnectionGUID: J24M9q2ySdG0CG4XET22tg==
X-CSE-MsgGUID: thgSq7zOTJ+k9WGHx/G0QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="214200807"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="214200807"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 16:03:19 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 3AAFC1C0018F
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 07:03:21 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B47C0C0182A
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 07:03:20 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 79FFD826FF1
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 07:03:18 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] sqlite3: upgrade 3.51.1 -> 3.51.2 
Date: Tue, 13 Jan 2026 15:03:14 +0800
Message-ID: <20260113070314.8054-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Changelog: https://www.sqlite.org/releaselog/3_51_2.html
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 07:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229228

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../sqlite/{sqlite3_3.51.1.bb => sqlite3_3.51.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.51.1.bb => sqlite3_3.51.2.bb} (55%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.1.bb b/meta/recipes-support/sqlite/sqlite3_3.51.2.bb
similarity index 55%
rename from meta/recipes-support/sqlite/sqlite3_3.51.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.51.2.bb
index 1a9f3128c3..6837293f6a 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.2.bb
@@ -3,7 +3,7 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
-SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "4f2445cd70479724d32ad015ec7fd37fbb6f6130013bd4bfbc80c32beb42b7e0"
+SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI[sha256sum] = "fbd89f866b1403bb66a143065440089dd76100f2238314d92274a082d4f2b7bb"
 
 SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"
-- 
2.43.0


