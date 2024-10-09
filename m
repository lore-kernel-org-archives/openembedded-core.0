Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D42CF0449
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:46 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.9178.1728452985227459551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hkukUGk4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452986; x=1759988986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iShjHh+Ve/eHY/1DLo4M9x3lxC9lx+S6IsPRnPNC3Ao=;
  b=hkukUGk4EPPTC0j/oTmx+sVRoncY/17ekSv5jBKFrReAVxdJy99bUyIL
   /5B2dXifclTQI9l56FteNUKPiQlwHB2t1I9bKUAaT3e1o2/Irs3LexDhy
   jK2o7i1WYFfYuvqYFO23SOeEZXNt7+Rm0XLdB3ehUNd/3nUkj7HI2r9uI
   s1ZfhQ3avQsTOrqyRGsHRxum9e7qxcylp5lSpD5zyGdP6vsucU1ayvgTe
   FLXC2OrGb3WxjDMuFxU43BY+GssF76rzENsBflz6kHygqE+N4W7i2RxHo
   70ZaKJNJrmikI6E/kgZKyGCytzllh8l+JIyfkGUj6fKvnZ2SLq4QBXJa8
   A==;
X-CSE-ConnectionGUID: +csPhca+SDy3lON7reCqTQ==
X-CSE-MsgGUID: xyDnGYRCSbK0jRGEnWv5XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="176230145"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="176230145"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:44 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D86CAD7AD2
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3130AD73B6
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C455F40B62
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 73A1D1A01E9;
	Wed,  9 Oct 2024 13:49:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/26] xkeyboard-config: upgrade 2.42 -> 2.43
Date: Wed,  9 Oct 2024 13:49:13 +0800
Message-Id: <1728452955-25051-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z3IFFT9wqfr19LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrUI7nOt2IPWEChl0SumJ22jgDbrFhprQ8rj5g1BHy9sp/bSVvA7UsTUIjA
	Ad43bu23MsPHymYXS/68Xt3mUFoneVogAhyvGjCh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205334

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{xkeyboard-config_2.42.bb => xkeyboard-config_2.43.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.42.bb => xkeyboard-config_2.43.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb
index cdc6422d46..7378cf475e 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8fc8ae699974c360e2e2e883a63ce264"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a6b06ebfc1f01fc505f2f05f265f95f67cc8873a54dd247e3c2d754b8f7e0807"
+SRC_URI[sha256sum] = "c810f362c82a834ee89da81e34cd1452c99789339f46f6037f4b9e227dd06c01"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.34.1


