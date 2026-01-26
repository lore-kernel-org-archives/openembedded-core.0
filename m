Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B905ECF65F8
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:35:46 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19056.1769430934248089145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:35:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XeXDU1vm;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769430939; x=1800966939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HjpVFGDzXOrzSE9VSgSJI7L5HhP3nfRH0Vy8n5VO1tU=;
  b=XeXDU1vmdeNw4wWW6Va5xepibpPGX5rNZ83pyLC+rhgr0yu7kyW9Z8vU
   BA5cRZKGA3Uhc3A0g5BCk8o94DG8dhX+Lwz9NIuw+5Sfna2Rp6NzAJkii
   QOGp4W7ZKna8fwzknaM5HMwtvNaHXnQiRWRjuDzo4GbyaPD28lSJaOrh3
   RwK1ee8Q1sVs+TrHFA/GLhKhwVhtSPatx+aRNBVlc+gkSouRBpuWG/UBG
   YooHfheF0omz1UQ4ZSEjiDqjC4hlqpI4BfAxt85Glz2rs5vxD0E/ImOSd
   8Gx2BX3tTXg4Fzgh5LkXXAnd5svY9DGCoorGeMec2I4lUa83ImBkwzjE4
   Q==;
X-CSE-ConnectionGUID: HdcQFEbrQIi4Cw19Cv1YOg==
X-CSE-MsgGUID: C4k2SAN+RvG0hnyKZfGjBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="227138720"
X-IronPort-AV: E=Sophos;i="6.21,255,1763391600"; 
   d="scan'208";a="227138720"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:35:39 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 084F51C00092
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:39 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A812AC02080
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 100584059A9;
	Mon, 26 Jan 2026 12:35:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/17] python3-hypothesis: upgrade 6.149.0 -> 6.150.3
Date: Mon, 26 Jan 2026 20:35:04 +0800
Message-ID: <20260126123517.1020-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260126123517.1020-1-wangmy@fujitsu.com>
References: <20260126123517.1020-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229988

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-hypothesis_6.149.0.bb => python3-hypothesis_6.150.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.149.0.bb => python3-hypothesis_6.150.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb
index 7f72029d23..889f86de81 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "27afa07824fbb7785369dfae8e2574ec2ae0b1bdce50f3a327dfc069b79b0a44"
+SRC_URI[sha256sum] = "32c88d4b7df3a8483e69877561b520320bf7779b0709c11869e392025e9279d4"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.43.0


