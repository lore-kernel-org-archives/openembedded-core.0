Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EF9CF65F3
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:35:36 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19055.1769430931185911637
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:35:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WtwgoVMX;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769430929; x=1800966929;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lFcUWNBK86UmyicTyoe/HI/yB7aYOjl1aHPF/hqGDCM=;
  b=WtwgoVMXQa3SftIi0/M+Tnio405q1gy7LOS2Ys+dDJ4/HsXhFpOuBuDm
   9ma5HsaWsfo7+WA3jbiQ/o6QMGO+dTF+AWBOJTYz4Jc03h2v6DJTimKU/
   zMZTLhQOIq4aHoLPU/xctRWiQpk4VzrZyD8Bo+CeGUeP2WiiQhjdBQVvo
   UHhYvnbFAsft/6D9PRdIXwXnO8ut4giXgywJ2rpgX7cOGO0MreZoe06JD
   0WDlihTXJag0mkPo2nxsxWB7WF3G50wEIDYFccgNmgxpJST87X+haIxSK
   AYZperjffENvT9GNJE/p9NqGJbVSCYIk5DsKe3ddeoWlvpGc3qOVJdV/9
   w==;
X-CSE-ConnectionGUID: 47iZ2k/1Q6ePjgxfiay81A==
X-CSE-MsgGUID: /F3axLBOSiqFSn84uL9WsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="206099530"
X-IronPort-AV: E=Sophos;i="6.21,255,1763391600"; 
   d="scan'208";a="206099530"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:35:28 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 91572100034C
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:29 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 45A6F18026F3
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id A347940599A;
	Mon, 26 Jan 2026 12:35:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/17] meson: upgrade 1.10.0 -> 1.10.1
Date: Mon, 26 Jan 2026 20:35:02 +0800
Message-ID: <20260126123517.1020-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260126123517.1020-1-wangmy@fujitsu.com>
References: <20260126123517.1020-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229986

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/meson/{meson_1.10.0.bb => meson_1.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_1.10.0.bb => meson_1.10.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_1.10.0.bb b/meta/recipes-devtools/meson/meson_1.10.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.10.0.bb
rename to meta/recipes-devtools/meson/meson_1.10.1.bb
index 6f629b7ec3..2e94e55749 100644
--- a/meta/recipes-devtools/meson/meson_1.10.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.10.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "8071860c1f46a75ea34801490fd1c445c9d75147a65508cd3a10366a7006cc1c"
+SRC_URI[sha256sum] = "c42296f12db316a4515b9375a5df330f2e751ccdd4f608430d41d7d6210e4317"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.43.0


