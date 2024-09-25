Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F45CF9C6C
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.9315.1727246984271008845
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KW1lT6eu;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246985; x=1758782985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Z7NwQTrXKJwu82Uq9Jb8WHed2bBM/XwNLvH6jLC2xzM=;
  b=KW1lT6eu7QwJZRXwyOwFJ7quEyqKLu+vTgKA4TC3o5FdJ7cCNzkQpQrE
   oKaa0GiQmOcWqzuVShhMVbX2kUtOYlyDzmtHeZdmeefCWxo+NliExrqrm
   3G/feCinBiP42Yv1pnntx35bq9Uno9MzCfSuOLBxPWPPxeZSi03F2Jp2s
   LEVFdMvI5caFq1QkxLjqssszoXTXGN1n8ga6qKSGdA+q5uBc6muPvNI5A
   /GHXqsObSNuZOXvDMcAL5KpMs9rgu1k6a+OqTCV9boAfTWVNU/+PwQqNr
   VtCecdQ9q9/3N/1w1xUjGaKEnNetmWV+Zehyi6iaAcZpTB+gSm0uQiyaS
   w==;
X-CSE-ConnectionGUID: WIgbB0onSZ62b4D9JZnElQ==
X-CSE-MsgGUID: bcHYbNWqTtmrLPLlj9ILHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="173949705"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="173949705"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:42 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E2569DB3C7
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F7ABD5BB1
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B1A42401E0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 60A221A000A;
	Wed, 25 Sep 2024 14:49:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/47] libevdev: upgrade 1.13.2 -> 1.13.3
Date: Wed, 25 Sep 2024 14:48:48 +0800
Message-Id: <1727246960-20665-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--5.597500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mriK5qg1cmsr+nw6VQ+/MY/fbX
	anodkpcU4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16u0p9
	DaZRzoN3/KVtfZiSDpjWDT4eBJ3QCkfRhdidsajMURSScn+QSXjk3o/SlA4+V9zw4lzv7RUmOhz
	Oa6g8KrdyT5jgj7vpnEpQ38zN5b0X0TTSiuoGqycJ2h4myN/q8u9XhMwPVFsM=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204904

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 include: sync event codes with kernel 6.10

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libevdev/{libevdev_1.13.2.bb => libevdev_1.13.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.13.2.bb => libevdev_1.13.3.bb} (87%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.13.2.bb b/meta/recipes-support/libevdev/libevdev_1.13.3.bb
similarity index 87%
rename from meta/recipes-support/libevdev/libevdev_1.13.2.bb
rename to meta/recipes-support/libevdev/libevdev_1.13.3.bb
index fd2bfdad9b..b920b349cf 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.2.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.13.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46 \
                     "
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[sha256sum] = "3eca86a6ce55b81d5bce910637fc451c8bbe373b1f9698f375c7f1ad0de3ac48"
+SRC_URI[sha256sum] = "abf1aace86208eebdd5d3550ffded4c8d73bb405b796d51c389c9d0604cbcfbf"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


