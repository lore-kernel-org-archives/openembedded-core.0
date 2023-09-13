Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA983CA5525
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:34:23 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.7656.1694597657838841683
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="110819601"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="110819601"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:34:15 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 07ECDD500B
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:34:13 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F153D3F27
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:34:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 047622FC71E7;
	Wed, 13 Sep 2023 18:34:10 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core][PATCH] libinput: upgrade 1.23.0 -> 1.24.0
Date: Wed, 13 Sep 2023 17:33:20 +0800
Message-Id: <1694597600-21505-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27872.006
X-TMASE-Result: 10-1.169100-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLHBvqhRdA8sja7IBuOPthEEzEoOqAAVLPhKQh1LCmGBlCx3a/pWcPalIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62To3UJuRLIoStIWznhjjBtfoLR4+zsDTtDbLQl5n/Oxyyy8
	bs/oRbGBrdRUiVrMPF/K61f1iaglL7fBXdU6+Cw/2Qc7+B2C55io+fftDgpawQjiHIl/sUjcu76
	UCDGAzm7mJLHoL/JV3yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187566

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wayland/{libinput_1.23.0.bb => libinput_1.24.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.23.0.bb => libinput_1.24.0.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.23.0.bb b/meta/recipes-graphics/wayland/libinput_1.24.0.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.23.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.24.0.bb
index b83d5fdb43..49a1da2b22 100644
--- a/meta/recipes-graphics/wayland/libinput_1.23.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.24.0.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev libcheck"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main \
            file://run-ptest \
            "
-SRCREV = "0b005eb64b12603e65a620a77c67ec62fd03f413"
+SRCREV = "1680f2fbaa63a91739012c6b57988ab1918ea0b7"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.34.1


