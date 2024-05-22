Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00623C25B7F
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:00 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.5683.1716369353552321694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JdPG1UiH;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369354; x=1747905354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NHxAZh9G65vlxboE/Vt10bGmVUPgX24AMCn1CbkGl84=;
  b=JdPG1UiHfzlmof5bq/yQEpZljncMP7vQgWS4pWihzcYGlLZLOyFRovak
   tVKsjaah3ItYzjM5WhwL5yc6c1+xwLyjxw3sbuB3uD5IKNbM+/4Vj3+Y2
   hJ6Laz3ESzu1qvp9lnZD4PZVJJKb0of3ipTjdEiARNYE90A0yMjNBHsXd
   CJcJwqSYft4jfqCD2JwZoZornB/GD+iRlGw1o32dStUtfJ08jvIKqSzIG
   yM6u7GehEoGGDkuyHP7RzwhUY1VA0iguy3atFxnJPgUnW05JJ/WGD8weI
   raoPU7WqhtCtlvlfiEA8mhG5n5stcfB8zZlRbT46f7+NTQPCjkRq9/FFx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="158511152"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="158511152"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:51 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A3F65D8011
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:48 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DACA8D7006
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C49021D01D
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 190081A000B;
	Wed, 22 May 2024 17:15:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 42/42] xwayland: upgrade 23.2.6 -> 24.1.0
Date: Wed, 22 May 2024 17:14:49 +0800
Message-Id: <1716369289-22526-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--0.342000-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZnVTWWiNp+v/Exmr5hqNL1nN03BZlA7M8A6J
	UWkXudIl/AGK4wInBMnk48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w5t0u
	0HYPnX0OQFXzPb++VLd/Xg0hP+ISAUuSskZ6P/9dX2YDz4ORwvAWU/9NPj6OU1nGVnCwlvOFk1L
	ihBzEvvifHhqNyesIiCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199737

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xwayland/{xwayland_23.2.6.bb => xwayland_24.1.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.6.bb => xwayland_24.1.0.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.6.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_23.2.6.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.0.bb
index f51429bc8c..251b3af857 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.6.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "1c9a366b4e7ccadba0f9bd313c59eae12d23bd72543b22a26eaf8b20835cfc6d"
+SRC_URI[sha256sum] = "bef21c4f18807a4ed571c4e2df60ab63b5466bbd502ecceb2485b892ab76dcc2"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1


