Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DD2E77188
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:45 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.77566.1734425915301350714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C126IGgg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425916; x=1765961916;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aeK/HNHsI94ZHfttypyzpOuZFdyEwrnysLI2QtbjV2w=;
  b=C126IGggbc4G/+9SBiHaNbVqtjWvh8RoxW4JGG7g30r9PgpBv9q0Fr01
   ZMKqJDgD34kYPjsuvdZHJxh/ZyD2J2yL1aJiyfbx9Save7dygKL8p8Ug8
   wwMiI2Br/C4luGULri8bc7A9+hDsFspBXc9x2qLZtveeyax+a8IotN93t
   OAoaXkUyHI28F9aepJnjC8l1X6k4okZVMbFDpvkrzXELYDgfAfdh8me7t
   CEEQrcUA4hHxl6YFmS4xaO0Hc9tGzFAik4xFdoAhmwA9nl5Av6nJl2H3t
   RKi+qtcU34COxQtwo3F+ygQ9ZByN4Fxy8MoCMBsbu+mv7/PH7YIkGSpdw
   g==;
X-CSE-ConnectionGUID: OfzJoFMHS8qP8KvIlElgYA==
X-CSE-MsgGUID: xczIsWtsQnWImTl7SPy0ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="183989546"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="183989546"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:34 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 45002D4808
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 097ECD5B46
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 91AAE3479C
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:30 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2FA621A000B;
	Tue, 17 Dec 2024 16:58:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 11/21] libxcvt: upgrade 0.1.2 -> 0.1.3
Date: Tue, 17 Dec 2024 16:57:57 +0800
Message-Id: <1734425887-18069-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--1.276100-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNQH8UzOewTxw4Q1
	qIJNxPDHzI7gGjzaXBKAhzP06K1HaYnZvvuYKntxDDzmS9l9fYpMkOX0UoduubKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLeBzEkCCpnRncgUVP3Cp+vcBDOqHwPghjmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZKKFE4DppqvuCw58sT0Zdvyy03MN1GBcVQVa0AIiztUruVoD
	VvitmNj8ULxRoM06sGdUufswglAZV5fSqU9lQIFZziNlqxvYmlLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208816

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix hsync_start computation
- Fix too-small back porch at very low resolutions
- Rename constant to CVT_MIN_V_PORCH_RND
- README: remove double dollar sign
- ci: Update CI and enable static analysis
- cvt: fix -Wmissing-prototypes warning for cvt_is_standard

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../xorg-lib/{libxcvt_0.1.2.bb => libxcvt_0.1.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxcvt_0.1.2.bb => libxcvt_0.1.3.bb} (91%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb
similarity index 91%
rename from meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb
rename to meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb
index e62fabdf58..91537b0f4b 100644
--- a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=129947a06984d6faa6f9a9788fa2a03f"
 SECTION = "x11/libs"
 
 SRC_URI = "git://gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=https;branch=master"
-SRCREV = "d9ca87eea9eecddaccc3a77227bcb3acf84e89df"
+SRCREV = "dd8631c61465cc0de5e476c7a98e56528d62b163"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


