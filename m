Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA47C7EE39
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:03 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.26247.1750065413231284673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UK9EKLFg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065416; x=1781601416;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FLsI1/ysFe9OWyRrXVyKSMeVLUPF41SfrfJDh8yTZfs=;
  b=UK9EKLFgD7GLJ1Vx1Rs9xFzUbhL1ip3i/T3Mk4A/7mlqgY8Bmd6Fev5j
   DszJGBHgXsCFSoWsvHWczJtxbNt1F10KIUAKbOvxCtJ3aaobHrtNGL5FU
   yLl+o1QIZ9iAq564J4ataaa5SUOwFhQkCxHdqjv1SoKJ90A3pjeQhLosj
   eCpUlxFtZxzFzP5Q0XB8QMdM3ab+9K6KQl4MYOP7mCLqk6A+WWTnCXmZb
   58EXBTmMLqojmGZJT4ldvIgKiP/70UcZUCwIEY5I0koAd2t2KmeV3Mxtm
   RiHmnvMG0OcOc9fJPaFUNcOKfNWCvWatLoigHo+kPV7XFKDQRlNH7pbhc
   g==;
X-CSE-ConnectionGUID: ZDlO2nUjTQKuvQSCPFsOgg==
X-CSE-MsgGUID: 4Aynd/ypTSO4E7pXQamYBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="202821352"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="202821352"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:54 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 94B09D5004
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B6D9CFB67
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:51 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7579E1A000B;
	Mon, 16 Jun 2025 17:16:50 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/24] libsdl2: upgrade 2.32.6 -> 2.32.8
Date: Mon, 16 Jun 2025 17:16:26 +0800
Message-ID: <20250616091643.918-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218779

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl2/{libsdl2_2.32.6.bb => libsdl2_2.32.8.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.32.6.bb => libsdl2_2.32.8.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.6.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.32.6.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
index 75710b962a..57758de8b3 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.6.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "6a7a40d6c2e00016791815e1a9f4042809210bdf10cc78d2c75b45c4f52f93ad"
+SRC_URI[sha256sum] = "0ca83e9c9b31e18288c7ec811108e58bac1f1bb5ec6577ad386830eac51c787e"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 UPSTREAM_CHECK_REGEX = "SDL2-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar"
-- 
2.43.0


