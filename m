Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92506E77183
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:15 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.116741.1733788630880754443
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sgxo9qiN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788632; x=1765324632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qRI+fYilJN4vZ8RJQuL/yuRKYBvON/NRcuHKI5IZw0I=;
  b=sgxo9qiNACSYlJimO8O4j9Wo/0LCtay1RIk1tq0Hqblay3Ac0oH3gwx1
   ZsiSpRoh0ftkLD+n2uIkWDjFnu2amjcc1ZbrhxQ0I+rW9ysW0G0aGUuFn
   RkDyqJEytoTRaHM9YkC/VjtBitwZiM9oSC2NtQ0fcT/jyxxrfihPRNDkS
   da+qjDgdPlM5Otyo9a1XBtl++sRWZ4CdQg1hn8z17i9hRpz8xOcplJvDB
   mw7DBwEYd528Eo5BYvxRNQGExsmFKbsH0x5cyzT9SwAePIdsmPsN5yn2V
   X5H62Rmpbo08i8lBZuz7Il5AKkhDXxSJ8EnozL1WrzLVl3v8/hHLXlaiJ
   w==;
X-CSE-ConnectionGUID: YuSlDzECRrmHvE6Z6JGy1g==
X-CSE-MsgGUID: cZHH70MuTSyhwoctF+/e0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="183357531"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="183357531"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:09 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9419496742
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A070D5064
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 01A9D22883C
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:07 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 930561A000B;
	Tue, 10 Dec 2024 07:57:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 16/20] stress-ng: upgrade 0.18.06 -> 0.18.07
Date: Tue, 10 Dec 2024 07:56:48 +0800
Message-Id: <1733788612-20933-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10-1.138400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4BqkHTV8zp2nwH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRvAQzqh8D4IY5soi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SC0h1uigl+x7hkHVeRmzdOPzX8hSFrAZ+i2n0xm6voF7G7x
	Bt5aPxGANCcU+P/nglO1Egrad9aNNyIYDtpCyQBT7HT5HLdeP3S7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208512

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../stress-ng/{stress-ng_0.18.06.bb => stress-ng_0.18.07.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.18.06.bb => stress-ng_0.18.07.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.18.06.bb b/meta/recipes-extended/stress-ng/stress-ng_0.18.07.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.18.06.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.18.07.bb
index 137b41cdda..cc12edbbf4 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.18.06.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.18.07.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "8357df5586a8f8f435ef532c53b770d9c2802c3d"
+SRCREV = "27f1171ff0718e67eac0730df34cbfd97aca587b"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.34.1


