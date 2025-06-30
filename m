Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF60AC83F0B
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.35179.1751274812522132575
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BEdfZwgO;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274812; x=1782810812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bwBxyY+X4WwDd+4rmTrWWKwUz2GPrmEr+yCy0xvi/cA=;
  b=BEdfZwgO3NN9muTXkl0xzmiqNdLBhy6xvuOE5H44Kg5GXp46SdR1pHyb
   qTJMdF2LhRzQcLlURDKRGrMMna6zeLLupuniHdLXfjf7IMdLHAcrYmXlc
   JfAeUWVwK0fpFkaxekpYJHApGjWhBE4XuyjLeT7Es7ibvDbI9H0c3f6kD
   4nUdJ7lLmao29cpESkcnh+55E5DnqtkdU9K5yqLG22obpZ76vUG9EtPWV
   Z4icImbD4b1yMGc6769pDEnMO/d5xgZjUeznI3hP5dy4WaXgC8oIt6M4h
   2Zc9jkpnYv1rJ75pjaMlyyLMnkAsEuSq9XlocJgUwDUFs83RrwXesdC36
   w==;
X-CSE-ConnectionGUID: wCPsUvtBSwCiPRUSObmv6Q==
X-CSE-MsgGUID: uRTRBW+nTIuO71ozs5KcUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="183439934"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="183439934"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:31 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id D57C51C0213F
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:30 +0000 (UTC)
Received: from yto-m1.gw.nic.fujitsu.com (yto-m1.gw.nic.fujitsu.com [10.128.47.162])
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTP id 5D6951800234
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:30 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C999ECFA20
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:28 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5885D1A000B;
	Mon, 30 Jun 2025 17:13:28 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/37] mobile-broadband-provider-info: upgrade 20240407 -> 20250613
Date: Mon, 30 Jun 2025 17:13:01 +0800
Message-ID: <20250630091315.1897-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219484

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...o_20240407.bb => mobile-broadband-provider-info_20250613.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/mobile-broadband-provider-info/{mobile-broadband-provider-info_20240407.bb => mobile-broadband-provider-info_20250613.bb} (91%)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20240407.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb
similarity index 91%
rename from meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20240407.bb
rename to meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb
index 2e8702a045..ecc9464e2c 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20240407.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
-SRCREV = "55ba955d53305df96123534488fd160ea882b4dd"
+SRCREV = "2a1b409491a531aedcf3eb3ba907929d96bd181a"
 
 inherit meson
 
-- 
2.43.0


