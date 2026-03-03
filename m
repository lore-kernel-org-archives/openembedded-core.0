Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B33BFEC049D
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:10:37 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14962.1772532627365571561
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:10:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TGI1ocL9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532627; x=1804068627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9UEpoBrespSioP5CLd2djVWnvBK8Y52Fjw0nTPNESGE=;
  b=TGI1ocL9z1abJQGRKVxehB9IJoxqNCBALiqw2CHUjQg9G9LoPV3QYUpi
   28Fjibb6JUcx0Zh8yS6U8UyJeOjAtQyrs+J2tlfAitrQnM+lbgE/mJuKe
   zupqf/mZE18O8fvUTywQBaGG3F5zefxkWkf4P7R4JFgBcH2swIO7miOSB
   MBNGcuw9JE8Ng+8VvI4WV9pkxHh1nCTw45pFB88pn+2uJVu8gsNJL1XbD
   +z7k53oWuuSsz0zk2n+fKK/SfSxUfvW/5DWPUtPwwbis/0vmui8aytSKG
   CG1HPSMcaqYutmBrbxNQUHCTbyU/LRSjSAEPPxPeIrK4EeXwHsAK63l4Z
   Q==;
X-CSE-ConnectionGUID: Lu3n6kQmTlugEyMTpJMCGA==
X-CSE-MsgGUID: snCfabVyTGuJzINAAEApbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="231747712"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="231747712"
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.fujitsu.com (Postfix) with ESMTPS id A5B501002B81
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:25 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 5E97D1401241
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id B6B281001CE4;
	Tue,  3 Mar 2026 10:10:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/23] xorgproto: upgrade 2024.1 -> 2025.1
Date: Tue,  3 Mar 2026 18:09:28 +0800
Message-ID: <20260303100929.1624-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232299

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-proto/{xorgproto_2024.1.bb => xorgproto_2025.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-proto/{xorgproto_2024.1.bb => xorgproto_2025.1.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb
rename to meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
index d79dc23f1b..e187c56fbc 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=0b9fe3db4015bcbe920e7c67a39ee3f1"
 
 SRC_URI = "${XORG_MIRROR}/individual/proto/${BP}.tar.xz"
-SRC_URI[sha256sum] = "372225fd40815b8423547f5d890c5debc72e88b91088fbfb13158c20495ccb59"
+SRC_URI[sha256sum] = "56898c716c0578df8a2d828c9c3e5c528277705c0484381a81960fe1a67668e8"
 
 inherit meson
 
-- 
2.43.0


