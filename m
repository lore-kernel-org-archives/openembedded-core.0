Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D0EC3ABD5
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:01 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.45971.1747040639732804618
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IcvwrUWA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040640; x=1778576640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UVLQlHx5b8jEoeJorTzNRKETDDhGuST80kCS8a+BKEg=;
  b=IcvwrUWALYcljYkdCV7Cl9VXwn80KdYC6/Qw72MM5oKF9BKvmTdUXFZD
   L7AK5EuL+nyyIAp6Xx4UK2Whv/aBPlNOvNi4Szv4qCiRmUHQH/gur7cQc
   rsfpOtJ5KjAdQP0x75W9FYVrcgKlHKEV35OOL/ZpkkGDnmPNIq2S5kaVp
   oyas2yyhxej4HdBr+rTzZKq22hMkvh0Me7zUnkYDiKnCzHgA1WWWU6eWR
   QLotaU7gG2SuPOKEE6i2OFKh8Q9GXoVwjWM9tq1+DNjiys2psPt9PZLQw
   Xkand/fkM2xmgwY/4/Er3xKCaD4pJJu7+K54SPMyavlw3ur+siigM6FfH
   Q==;
X-CSE-ConnectionGUID: l0Jwgbf6QZGpBP0nceqsCQ==
X-CSE-MsgGUID: nPKh6yT3T9qc7R3a6hBX9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="178629706"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="178629706"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:03:57 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 52973D6EFC
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 14B6CD5045
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:55 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C7F901A009A;
	Mon, 12 May 2025 17:03:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/56] enchant2: upgrade 2.8.2 -> 2.8.4
Date: Mon, 12 May 2025 17:02:55 +0800
Message-Id: <1747040619-7566-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216312

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../enchant/{enchant2_2.8.2.bb => enchant2_2.8.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.2.bb => enchant2_2.8.4.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.2.bb b/meta/recipes-support/enchant/enchant2_2.8.4.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.2.bb
rename to meta/recipes-support/enchant/enchant2_2.8.4.bb
index e26fb640f4..a5479a0e7d 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.2.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.4.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "8f19535adb5577b83b00e02f330fe9b9eb40dd21f19e2899636fc4d3a7696375"
+SRC_URI[sha256sum] = "e28f98208df5f99320d6a05cd49f83420bf71e69052debe3b343c9bb15c833ed"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
-- 
2.43.0


