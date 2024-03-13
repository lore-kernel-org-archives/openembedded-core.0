Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9705CC54E72
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:29 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.10641.1710313764854466666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Mo7jWb/Y;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313766; x=1741849766;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8Ej0ge59XUtthGDtuH+2gELSkI1NIF8A0gmi0Teuf9U=;
  b=Mo7jWb/YWeBTcbQNRQ2CQUImBuNObD7QuR5ydfaPXalPYuc9js72zsS1
   dlWKoXVo61FKUUOcrM4HflP0Loshqrr35RZe/idUzn5qb8ivuVKjFBOEA
   BhWsbl9dLWwRuMi8Ij377KnQdA7icyMXh5hEo4NhJA+4nmTof1IgxD4UR
   WGaVNM7CktenxWToGaKKLmZgGi1pjk7YpCJ+CEGesXPEfxR0MANO6ZKaz
   SR8e4QBArxtJr7SpFqtpHOZahUciKVhs+CwUQ9VWhz7IAnSlfv0GUn5wS
   74aagYnQQNwEcKnZoFIJjrNZ7IraUVCSe5sqX3J3GHE0Mo9cHh2L2cRzu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="131486870"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="131486870"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:23 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3BDE0DD93F
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C460D501C
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0EF3021BD41
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B05711A006B;
	Wed, 13 Mar 2024 15:09:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/36] python3-hypothesis: upgrade 6.98.15 -> 6.99.4
Date: Wed, 13 Mar 2024 15:08:18 +0800
Message-Id: <1710313714-12541-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--3.224700-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvHwEnu5JwrbZmW
	X1o6D9LLe5dPLphI42BdKPihnf99FSVqGFW47VyNPPov5T+l6PF4mYJHAxGkc6vWBS71/UX/K2g
	uGsQ9MyFTeKr01gQwdC8gJXl1HMzcay2H+VAa8iU4hD0Y/Y/a71QQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaKoXGwWsKbNNN0KiTeJteVBfS0Ip2eEHnwj/1Rbkzl1EwuTL
	po5HEc1joczmuoPCq2xd3I/juod+u0gGn4OPdiKAxxEly66ik7byDU6/2OgUFXj40y2YkH1UnUy
	qkn27B9tXLnUtGMfg2y0J7I9K4aQA3tPoRS3uxcdJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhF
	TP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197022

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix regression caused by using PEP 696 default in TypeVar with Python 3.13.0a3.
-improves the type annotations in hypothesis.extra.numpy.
-Simplify the type annotation of column() and columns() by using PEP 696 to
 avoid overloading.
-implement type annotations for column().
-add the experimental and unstable backend setting.
-fixe issue #3900, a performance regression for arrays() due to the interaction
 of 6.98.12
-improve the type annotations in hypothesis.extra.numpy, which makes inferred
 types more precise for both mypy and pyright, and fixes some strict-mode errors
 on the latter.
-pave the way for future shrinker improvements. There is no user-visible change.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...thon3-hypothesis_6.98.15.bb => python3-hypothesis_6.99.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.98.15.bb => python3-hypothesis_6.99.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.98.15.bb b/meta/recipes-devtools/python/python3-hypothesis_6.99.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.98.15.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.99.4.bb
index a17abe58c0..64b8cf2c31 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.98.15.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.99.4.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "1e31210951511b24ce8b3b6e04d791c466385a30ac3af571bf2223954b025d77"
+SRC_URI[sha256sum] = "edc8f984dba5d1b69a6a4564246b7850fa7ec351d2b27c9e7a43c91deab8d45c"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


