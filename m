Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA36E78D51
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:03:55 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43616.1770627834807596304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G8/M0Bws;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627833; x=1802163833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hpirLXMB7uZblXxtBuleTcuEPVy5xCAy9/wdM/rSQTM=;
  b=G8/M0BwsOW+Vni/BAltKHtQUpC69RHwWGUcudXifFBuN/eCjOriZ1334
   tZHLt/M5hifAGArk8jXTNs6CGHhDkPmOAqNHOR01GwzgsCkkXP02xSneh
   h7JfK5W2jpHAUe4OrCk3jHUl55NyRFwL/WvU6+086SZ7aBZxdpvHhKJ2O
   NEXlsxovMpCvUjglrIBNgbUXUDLEsXnBSIDiWr9lsQa95Hb+NlmMiw5/b
   7f9RCyeKrhBBETxKI1hnegRuwe2v7hcfDFLTjnGx3yRBulKRvI++TNj0v
   9K+j6FldpEfF16I5CcJGT9QIu9ESJ2kIsYLzCSMniSSMG1tHn1s5KYU/d
   A==;
X-CSE-ConnectionGUID: QbWM/lLzR0WDg7YRro42dA==
X-CSE-MsgGUID: 2cp+Tyk1SN+dzaayZylddQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="228980426"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="228980426"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:03:52 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 42E621C000F7
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:53 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id EA3681802AE8
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 4DEC1101A410;
	Mon,  9 Feb 2026 09:03:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/39] libxvmc: upgrade 1.0.14 -> 1.0.15
Date: Mon,  9 Feb 2026 17:02:54 +0800
Message-ID: <20260209090317.1468-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230727

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxvmc_1.0.14.bb => libxvmc_1.0.15.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxvmc_1.0.14.bb => libxvmc_1.0.15.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.15.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb
rename to meta/recipes-graphics/xorg-lib/libxvmc_1.0.15.bb
index af18afc62d..8fe205b387 100644
--- a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb
+++ b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.15.bb
@@ -16,4 +16,4 @@ PE = "1"
 
 XORG_PN = "libXvMC"
 
-SRC_URI[sha256sum] = "e4be9eb6b6bafdbbf81f47f7163047215376e45e2dc786d0ea6181c930725ed9"
+SRC_URI[sha256sum] = "4f518afde3d7fd435346af7b368d2f73517f3d5f82647c962caf3f7bb8ff7078"
-- 
2.43.0


