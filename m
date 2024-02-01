Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8489EC47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:53:29 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.9424.1706766803638955243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uFQsD0md;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706766803; x=1738302803;
  h=from:to:cc:subject:date:message-id;
  bh=fM9OCIgOkk4nxPjplrRgqiMB+FNmZRJ/kXyb+DWPhzA=;
  b=uFQsD0mdT05XHziER0SUQPlnJuwAn3WB3waHpAHdqWECbmVUejTzLZUE
   et+e7fIiPSElxV6h6ShZbMZzFceBCvwAVfnMnopV7UZU/VNeMaBMwLNcd
   ZSnGqEfI2uBloZM3Kc2IFj+Z9a1SuBsfRKJF3lwy9Q0zI3VPIRd1nbst1
   Fsvf9k6lv/nv6Vyz/DnNbf/ofswK1XRsIWKQSnCc2tetqLU117UhL1/j6
   4bPNcwF7BJjQhvW6nVFLwbndra95LmMGiwNf5SfkFb2aCZ+K8M3TNtTzv
   RgdzbAqs3gvFE6kFU2hlOmk84Yf8RqldT5lHNjS/l5UQwYHBXPaoPvRuI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="135644379"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="135644379"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 14:53:20 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B57B8D4800
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:53:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EC400D420C
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:53:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C9256C9D8
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:53:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1361C1A006A;
	Thu,  1 Feb 2024 13:53:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] orc: upgrade 0.4.34 -> 0.4.36
Date: Thu,  1 Feb 2024 13:50:53 +0800
Message-Id: <1706766653-13148-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10-2.115300-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2sSuJRtSU84o3gcxJAgqZ0Z71Wx2uUbPLeuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e5rSTaF7k3C43QfwsVk0UbvqwGfCk7KUsyGqCfrXuWIO5IdY1eQ5oo4ATa
	oE9ZOCZAVI6svrXsk+qBBtW06EJ2negPY893rOVkBF0Av7BLrK2Pl5H1S51ITsnQU+jKgo7ogep
	pQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194578

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/orc/{orc_0.4.34.bb => orc_0.4.36.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/orc/{orc_0.4.34.bb => orc_0.4.36.bb} (92%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.34.bb b/meta/recipes-devtools/orc/orc_0.4.36.bb
similarity index 92%
rename from meta/recipes-devtools/orc/orc_0.4.34.bb
rename to meta/recipes-devtools/orc/orc_0.4.36.bb
index 801d604bdc..b191367eaf 100644
--- a/meta/recipes-devtools/orc/orc_0.4.34.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.36.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "8f47abb3f097171e44eb807adcdabd860fba2effd37d8d3c4fbd5f341cadd41f"
+SRC_URI[sha256sum] = "83b074cb67317d58bef1e8d0cc862f7ae8a77a45bbff056a1f987c6488b2f5fd"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.34.1


