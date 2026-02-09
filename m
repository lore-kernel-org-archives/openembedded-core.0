Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE3AE78D56
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:15 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43622.1770627845654360901
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HpoiGV66;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627846; x=1802163846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uhki9EJ5TprjRK3/vjO0j7IK5qbaRicQanGTQtrlwTw=;
  b=HpoiGV665PfRZxOoq6/kZNDVi44ytVIA7gml+eSXohEB48TGzStEbf/a
   dzszrz1JZQ3PJ0tRvv8DZxFnSM0cd2XUB0K8A1qUTH+yM6JBk/jhYnGCm
   AGRYQN/l4tN4vPZP12h+vf3Nh+TZa1U7q4dxrPGW7wI8TenF+Kvj7F6HH
   Zo3pILYWr58TSGoBArZr7TvQhftZjrOvCAl4nvSiZH3TisRSCBR3hWe/3
   Dq0UCXab2Z3PWOt19pOn16D4LGMrCE4mh4vZ/NnRgi6Al30kdMUusiGar
   bhEyHMxsagfOayScMq0+V5lp7PiZ+A9ApQvWn44OspIP7+ffB9uzMokeQ
   Q==;
X-CSE-ConnectionGUID: 2FmzJr7oRzucR4fKXb81Rg==
X-CSE-MsgGUID: CyBvKtt9RO64IWuYZueyOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="217633840"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="217633840"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:04 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 03B4C4DF1
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:04 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id AB3431000469
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 1E1FF101A403;
	Mon,  9 Feb 2026 09:04:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/39] python3-hypothesis: upgrade 6.150.3 -> 6.151.4
Date: Mon,  9 Feb 2026 17:03:00 +0800
Message-ID: <20260209090317.1468-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230733

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-hypothesis_6.150.3.bb => python3-hypothesis_6.151.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.150.3.bb => python3-hypothesis_6.151.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb b/meta/recipes-devtools/python/python3-hypothesis_6.151.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.151.4.bb
index 889f86de81..425b2e6441 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.151.4.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "32c88d4b7df3a8483e69877561b520320bf7779b0709c11869e392025e9279d4"
+SRC_URI[sha256sum] = "658a62da1c3ccb36746ac2f7dc4bb1a6e76bd314e0dc54c4e1aaba2503d5545c"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.43.0


