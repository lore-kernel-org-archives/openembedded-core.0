Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3492BC4828E
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 04:19:49 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8320.1706761179796257534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 20:19:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YcNpfUHI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706761180; x=1738297180;
  h=from:to:cc:subject:date:message-id;
  bh=9lRbziYwgru6WkL85TbaK+UEHseTZb00FlpP8b7wSQ0=;
  b=YcNpfUHI96M3aHq7PPAwcZih4MQkL2854ZqnTMt6zrO5TeT1C9KMINQy
   oUG4R9DUmDT4vrQgLHhMZwguR54hyYX/X3I7u4d/KX4FtoKWANKhR4MbX
   dCarYWr6a6DDRbpOuQppZo0DDwzV4uX237yAg+dYKYBVSRxRwservNs5i
   jPucsrwpwK+nRdcQT1zO7RwKWKwmelZ2JQaKNuqfsLOsrrO8oRSSL9O6W
   jaarq1tJ4SX1lm+Ovq8hmwEBoTkCIcWV15sWAALD7Xg+0VffHVu6xhmeo
   vkoe5sCTMw0t8z37RMSSyve4DdaM4XL/mlXsZvDJh3CtDuPKxAUaSyfZm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="147471157"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="147471157"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 13:19:37 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 27E6C39592
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 13:19:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 57762CFA5E
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 13:19:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DCFB420088E9B
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 13:19:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6E1061A006A;
	Thu,  1 Feb 2024 12:19:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libinput: upgrade 1.24.0 -> 1.25.0
Date: Thu,  1 Feb 2024 11:29:03 +0800
Message-Id: <1706758143-11568-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10-1.169100-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLHBvqhRdA8sja7IBuOPthEEzEoOqAAVLPhKQh1LCmGBlCx3a/pWcPanpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlbdTuPa9VRGvEQdG7H66TyHEqm8QYBtMO6fuL38kw4ooAhR
	hhMZNhaKOQsi8ebS90cuqNNPybcpP1mOovrsc45jqAoLaPByYxDcFwolyWRyk4v3ah/VpxNWtEi
	8tLINxTgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 04:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194556

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wayland/{libinput_1.24.0.bb => libinput_1.25.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.24.0.bb => libinput_1.25.0.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.24.0.bb b/meta/recipes-graphics/wayland/libinput_1.25.0.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.24.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.25.0.bb
index 26ab1adaea..517b247fed 100644
--- a/meta/recipes-graphics/wayland/libinput_1.24.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.25.0.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main \
            file://run-ptest \
            "
-SRCREV = "1680f2fbaa63a91739012c6b57988ab1918ea0b7"
+SRCREV = "3fd38d89276b679ac3565efd7c2150fd047902cb"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.34.1


