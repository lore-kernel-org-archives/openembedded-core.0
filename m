Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CF7CD584D
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:31:34 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3117.1767781883971775432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:31:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mfffZras;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781884; x=1799317884;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kbSc4nW1E0N7Cy+6X49dh2roPbS85RAxv0fNArcGzL0=;
  b=mfffZrasvfQjSJlOZQBD8DA42IMv9zrRD/F5oO9iTPgMIuCNTzUCKYOb
   OQlfwi2B9pMrhC28vzOxSuIvAXDY4bdq1TR+Lk5HvFfA73NaZQmw46pgP
   7LNO7/XctQGhjPZY30fkgZQV0TjvW5fDY7Jr6Q7JfVDAhC1RW8xx3el07
   YXELvT9Fy3hmw6/PPTiKkQhANKA9m0aZYlfnqfQ/6BCRLpeep46G+Y+Ye
   i9Sq8qv1kL0NqBozGxsF/hpkgQa3LUgCz9uZJoio+sSHm67WpL8qNTIMZ
   E0c78ZyTnJUMagnYQjFGmvia1siKSokaqYC2Y9OYZAHP2uwjkC+Zv+T1B
   A==;
X-CSE-ConnectionGUID: r8kFVFn3RoiKxNBJmbE7Kg==
X-CSE-MsgGUID: DY/iq+KNRKiecTX4RfwC4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="212496254"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="212496254"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:31:23 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 93E971C00081
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:24 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 48DF818041B0
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 8357D101BB5E;
	Wed,  7 Jan 2026 10:31:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/15] fastfloat: upgrade 8.1.0 -> 8.2.2
Date: Wed,  7 Jan 2026 18:30:52 +0800
Message-ID: <20260107103102.458-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107103102.458-1-wangmy@fujitsu.com>
References: <20260107103102.458-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228975

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fastfloat/{fastfloat_8.1.0.bb => fastfloat_8.2.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.1.0.bb => fastfloat_8.2.2.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.1.0.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.2.2.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.1.0.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.2.2.bb
index 84bf90dac9..28d59ca09b 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.1.0.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.2.2.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "88b1e5321c6918cbe091afd76728296290668403"
+SRCREV = "97b54ca9e75f5303507699d27c6b4f4efe4641a1"
 
 inherit cmake
-- 
2.43.0


