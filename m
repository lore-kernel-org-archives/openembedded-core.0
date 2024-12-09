Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB36BE7718B
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:15 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.116738.1733788627421061498
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X7AUkjL0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788630; x=1765324630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CAOqqfar9oOGFkuNH2ICDWh+LOUN9Q/Ian7p417QrhA=;
  b=X7AUkjL0/X99kds9I8DFjU5tXm/Pn2iD3cIkBT+1KqZi8YqHUEW4JcLr
   l3Zw0HxDprFHQnAXpwtDRBKdSO0FVon7HgDrOCnxOYHKhQDto96SQAznk
   bDmZcCVtTmATOOF/IGRqLVBvgDVfGfbMETmlj1jzhNGsG5GZCmAcpfYvw
   yxeDI9UMtuR+8f5rCzs+wLUtAHH4WOsQDZWAqyswnWCD11DmmVvnCbG5P
   r6an/m81Ku03ObIVvCamboPghguWaQRnMWjjRgCGlgUzrr4Qc+GCkhayk
   OfEPH7pFlfIXuIooau0hw/uIjFdt3oflIBQJSgm0O+TDzIROMTpMU6Hv8
   g==;
X-CSE-ConnectionGUID: uUZ0G6GRSC6Xh7jNy5VmbQ==
X-CSE-MsgGUID: RbXuCPZKQpWw0UThjDqn4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="162594288"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="162594288"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:08 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id ABA8AD6EA1
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:05 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8124FCFBC0
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1382420076D0F
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:05 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A54F81A006C;
	Tue, 10 Dec 2024 07:57:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 11/20] libsdl2: upgrade 2.30.9 -> 2.30.10
Date: Tue, 10 Dec 2024 07:56:43 +0800
Message-Id: <1733788612-20933-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10--0.621900-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOeKNmNNd29XZj7E6vHnuNZcsgu/IQFPzpsoi2XrUn/J8m+
	hzBStant0zt8ihye3BAtuKBGekqUpnH7sbImOEBRvQPZapU98vUCkMhblA4lWEvMfr/aGWrfpUG
	wtFLmNMHr5rG+qRMYWmNpsow4ZW6COPlp7uAYNOWGjy5YehrvntefpxAwLb8rsfZ9V6Q6rCZgvU
	oiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208506

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libsdl2/{libsdl2_2.30.9.bb => libsdl2_2.30.10.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.9.bb => libsdl2_2.30.10.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.9.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.10.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.9.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.30.10.bb
index 0371b2e745..4ee8b6790d 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.9.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.10.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "24b574f71c87a763f50704bbb630cbe38298d544a1f890f099a4696b1d6beba4"
+SRC_URI[sha256sum] = "f59adf36a0fcf4c94198e7d3d776c1b3824211ab7aeebeb31fe19836661196aa"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.34.1


