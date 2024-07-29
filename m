Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1301C49EA1
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:41 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.46596.1722215431402451463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=A+WasJBJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215434; x=1753751434;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ngWaGFi5tG0M8KDGcq0jdr3CS6lofYmDLVLMuL+PBIU=;
  b=A+WasJBJ029YOg+rANTmcPwvFJ/Ql/fLvcUUFpOs00v8Qa9ZgtiBUthD
   68OjOcWeQRPMr1guLhL8GKPHqeP4ge53ydC+XDbLt3Vjs03TSPciKtXfK
   FQj9yv19VwpbfGPbbfQ6q0zDIrytih1jg1hW9staLzwX1V+V32BW5RkHs
   npSqPpm8nz1+3djGe4F8oPwDvmIjOLsxQ9eUrjrgBrnm3yOugfddfxt03
   VeJy8d/HmfFeDIwNQewPjvs7sIxQjjDQb7r0WoP7InB1vwkeluKtdRfzQ
   UoH1EhYTUT2iVT4LpnqINwyLygkuDfc1SDe00iPR6z3j5h/bWarZ1vKl2
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="157163441"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="157163441"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:33 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8682AC68E1
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AF96FD5084
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 436E282D52
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B68501A000C;
	Mon, 29 Jul 2024 09:10:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 33/33] xwayland: upgrade 24.1.0 -> 24.1.1
Date: Mon, 29 Jul 2024 09:10:08 +0800
Message-Id: <1722215408-27541-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.003
X-TMASE-Result: 10--0.342000-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZnVTWWiNp+v/Exmr5hqNL1nN03BZlA7M8A6J
	UWkXudIk6hUOcTonr9IAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSztbvMOkHZGVmlVY
	sbjoOqehQjUN0+6eDv3d2jrbe9MGHsnDvU8TxVLOyGgX3nrDDiLoHxoS8ouN07Jmqb/J5/zlpFj
	Ql4sI09iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202606

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xwayland/{xwayland_24.1.0.bb => xwayland_24.1.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.0.bb => xwayland_24.1.1.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.1.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.0.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.1.bb
index 251b3af857..7302b53f61 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.1.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "bef21c4f18807a4ed571c4e2df60ab63b5466bbd502ecceb2485b892ab76dcc2"
+SRC_URI[sha256sum] = "7125bee0b10335805d7f5ba57dfaa359a7850af1a68524f1d97b362741a51832"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1


