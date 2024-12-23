Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABAEDE7718E
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:32 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.10453.1734945087136686102
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QglyYKdm;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945087; x=1766481087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tixgLsY5PDYV1c2huU+HuRZxVl926U0GigBi66HOhn8=;
  b=QglyYKdmFIZNcD+ldTqqsQw/6rgBQEHs5KHRtb7HF0lDYuRpTX03EVdA
   dH2DfxMSmE1pzkBpsElPKWZbQ80DEMs0gZW9IsoF3PLdMqIdBVkAj2hhG
   f4Qyrc4xWVVW1VMLDt02EEOdmSFx5JY1V6Kzb3mmBveF0vfC0ZfBKFqQO
   9Q6lwmak0uv8ksLj8E0vBiW3KEMArU+BGo18oeL1J5XhukEAPm/Q3Wdbk
   5MHlq8L+dc7S11QzzRyETpm468Hih6EUkr+PV6mzYpNcAWDi2QXG45z46
   1zYA4MuL+geR40xKPTN8euIZmkCeRzSk90nH6X8Ks86d1IfIOTDZsXpf0
   Q==;
X-CSE-ConnectionGUID: iYnKFh3FRZa21rXGJEuSEw==
X-CSE-MsgGUID: GLfemmwcSm6OHCj0hwF6ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="187085596"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="187085596"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:25 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E8E8BD500F
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BE785CF7C4
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 58ED46B4DF
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:22 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F0B411A006C;
	Mon, 23 Dec 2024 17:11:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/22] xserver-xorg: upgrade 21.1.14 -> 21.1.15
Date: Mon, 23 Dec 2024 17:11:05 +0800
Message-Id: <1734945065-4373-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10-0.218600-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmKN5v0jh1hv25cFdomgH0lnFEUknJ/kEl5lVdRvgpNpe/oLR4+zsDTtRcD
	SKgj6IG05mKddqkd88osJns9Xagnmh+1mLJTV3+zXNG1HdXvUWiHergNLjBOYw8Em6Eqd22GCiU
	DFrquYsvVfZDJrGNdJrKj1BBUPOMPyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209035

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{xserver-xorg_21.1.14.bb => xserver-xorg_21.1.15.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.14.bb => xserver-xorg_21.1.15.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.14.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.14.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
index 28c98eb527..080e6d220e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.14.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "8f2102cebdc4747d1656c1099ef610f5063c7422c24a177e300de569b354ee35"
+SRC_URI[sha256sum] = "841c82901282902725762df03adbbcd68153d4cdfb0d61df0cfd73ad677ae089"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.43.0


