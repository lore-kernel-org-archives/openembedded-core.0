Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0CAD59D8A
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 01:30:28 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.35696.1732584626935041366
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 17:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JGOynHNi;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732584627; x=1764120627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UjD3eT84LA1r7kxB9CujEFA1LaWoUSORrDOhotUQfsc=;
  b=JGOynHNiHNEM8T+uW5zqulS9Xb2Xbm33+9UvRiC/KT7/fy6ynhuFMgcA
   /6XgxeBXzudPhV48H/imp5PB0H1OkXNudT1/XtU2EOODp+/cfBQOiALx1
   6oMMTL8Z9/IWi+UYaj8eFeorQHfhqzOlPBVMJLeZCrkGqGh75SvPD6AVw
   rMwSFBkVbOREFiTtrt650xgbgIWT3DHR5CXyP0sCd2KoikeTF9zVwGElh
   6C3gIdCZ7tmYmnWSEz11guw1eC+ROA8lW8LVwJxQxv62cHksc2QMmMk0P
   w+n7Cxbxxt/wfqmN2PO0NqNSZag1aEYKVUgR7wnIAMqcF6OBpYTrJKk8x
   w==;
X-CSE-ConnectionGUID: lydXF9uFRuadJlDRa4pDDw==
X-CSE-MsgGUID: k1PhZr92TBCi8t1AgkyHjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="168976160"
X-IronPort-AV: E=Sophos;i="6.12,184,1728918000"; 
   d="scan'208";a="168976160"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:30:24 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8326BE428A
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BEF4D19CC
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9754370BF6
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:21 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 453F61A006C;
	Tue, 26 Nov 2024 09:30:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/16] xprop: upgrade 1.2.7 -> 1.2.8
Date: Tue, 26 Nov 2024 09:30:02 +0800
Message-Id: <1732584602-4785-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28820.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28820.004
X-TMASE-Result: 10--2.314700-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrA3QlQeE0l8Cwkrs/m+KUOYPc
	XuILVCbaA8yb9zTkGEYF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0545soi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SFfcZ4lyDbeMNouZ9Ga9jkFVbMW4nMrCJ1bBX6CNgRqId4O
	hr/NlEoUmoN/Y3X03QgwXYKYW6rRiEVSTlHmhtkQ7vYJ6zOpA1S7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 01:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207823

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Draw truecolor icons using dual-color half blocks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xprop_1.2.7.bb => xprop_1.2.8.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xprop_1.2.7.bb => xprop_1.2.8.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-app/xprop_1.2.7.bb b/meta/recipes-graphics/xorg-app/xprop_1.2.8.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-app/xprop_1.2.7.bb
rename to meta/recipes-graphics/xorg-app/xprop_1.2.8.bb
index 96e364b2b3..b9bc3b2892 100644
--- a/meta/recipes-graphics/xorg-app/xprop_1.2.7.bb
+++ b/meta/recipes-graphics/xorg-app/xprop_1.2.8.bb
@@ -15,4 +15,4 @@ DEPENDS += "libxmu"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "4436e3148bb91a162406230d9f736a49ca8b50b74790015dc15d78d6ce8e825f"
+SRC_URI[sha256sum] = "d689e2adb7ef7b439f6469b51cda8a7daefc83243854c2a3b8f84d0f029d67ee"
-- 
2.34.1


