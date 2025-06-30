Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE370C83032
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.35288.1751274805183499294
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t8BifW9Q;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274805; x=1782810805;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A15ZRof3dibCPhG1ev/deEmJWtkgKqWSb0hC1g0dCrE=;
  b=t8BifW9QITwWhWF7EEDDvLllfsj3KR9TAaIZDSM+b/rCogyMYmrrUN57
   ou5DR23C6vdgOxXXmcGpMDO9UEpWVSR/LMyQ6bTAGjfNxFP5o3fIRG1w0
   8uVPQ1pWBxUQWFt7TXLwDZqt5oVGBEfxkAnIS3UEU3sAxnWUqsr00qjVC
   LladPxURxHrX75R8Jg7s0QdculNpYzPbsSwfqqell7gfeWdIOP/7Osddn
   xc+GIdJ3Ooquv6rcArb6aNh9lpKQhZDMJnHMPWRJctL3M1fmlSJJySwfn
   rUrQ/cTxPGDSD8AADuVAqb1M/Kk+ap8Xw2oO+BbspnbC1CKEHTBVQATkl
   w==;
X-CSE-ConnectionGUID: xNmyDVGUS2iPSoag1wRauA==
X-CSE-MsgGUID: dRSVNuijSFy7Daw5a/Dr+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="207712135"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="207712135"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:23 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 924591000350
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:23 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTP id 115911800337
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:23 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 72685F8402
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:22 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EC0FA1A0073;
	Mon, 30 Jun 2025 17:13:21 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/37] enchant2: upgrade 2.8.6 -> 2.8.10
Date: Mon, 30 Jun 2025 17:12:41 +0800
Message-ID: <20250630091315.1897-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219462

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../enchant/{enchant2_2.8.6.bb => enchant2_2.8.10.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.6.bb => enchant2_2.8.10.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.6.bb b/meta/recipes-support/enchant/enchant2_2.8.10.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.6.bb
rename to meta/recipes-support/enchant/enchant2_2.8.10.bb
index 2696fc0f81..e2965e9e10 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.6.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.10.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "c4cd0889d8aff8248fc3913de5a83907013962f0e1895030a3836468cd40af5b"
+SRC_URI[sha256sum] = "6db791265ace652c63a6d24f376f4c562b742284d70d3ccb9e1ce8be45b288c9"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
-- 
2.43.0


