Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD7E6E77192
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:32 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.10580.1734945085934770816
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nqsIV7Kd;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945086; x=1766481086;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gaQyWiw/6Ab8OgQSp/M94QE3macwC+xdb4oUI4nAkZ4=;
  b=nqsIV7Kdrv1hNHcacK+QaT+z+cC9g916i9mx8m4R9dsPx2ykqMJBkQ8c
   ihI1CB7t3s4YEX2kK93bNIGk40gYmW5h8ooN+My2b31ryWt1iXphGBrM6
   xGAr9bZBjqhw2O8YkOVxOd3hDQS33StbJixV2bjsimVuatxMsDGk4PpaE
   ausrs0389e3xjMnJFouxPQx34Phy9g2631oCOHI+aq0d8xF4KWiaoz3iN
   IBG3repRCY+zmvDjB/c1A4u+ecdHgYNDAysLeTInAQzJao3lFrJSanUfN
   QClDekrBBX8NTyuPP1BEiPwpb9NcA2wSRnQBbajXI5UAhqoyGur/YAsmu
   w==;
X-CSE-ConnectionGUID: 3GKKwS/XSdaXVUviUqP/AA==
X-CSE-MsgGUID: 8MD6kI2sSXGt6lwS/OdSKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="183848752"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="183848752"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:23 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 80A83D4C3F
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5222AD4BD4
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DE9796B4DF
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 876FC1A006C;
	Mon, 23 Dec 2024 17:11:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/22] python3-pytest: upgrade 8.3.3 -> 8.3.4
Date: Mon, 23 Dec 2024 17:10:59 +0800
Message-Id: <1734945065-4373-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10--0.404300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSC4GyTmeN+AbE89
	3SeL1XuD4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2aY5ZGw7wyeHfSa
	aVTZG9SuXE+xHCJjkvAYUFsN5WfiFlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO25V9
	z3vqk3KmEa1hkXejNqbH97xtc8YvPs4/kKfg1U9U0sndlrXPH6aqOFhLiYF/o9eOQ1d75X5ekpA
	TjLykKOv0gi3I0PVbRxpTjdDL1zwfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209031

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/pytest-dev/pytest/releases/tag/8.3.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytest_8.3.3.bb => python3-pytest_8.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.3.3.bb => python3-pytest_8.3.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.3.3.bb b/meta/recipes-devtools/python/python3-pytest_8.3.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_8.3.3.bb
rename to meta/recipes-devtools/python/python3-pytest_8.3.4.bb
index dbd984208d..3b1770e14b 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.3.3.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.3.4.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "70b98107bd648308a7952b06e6ca9a50bc660be218d53c257cc1fc94fda10181"
+SRC_URI[sha256sum] = "965370d062bce11e73868e0335abac31b4d3de0e82f4007408d242b4f8610761"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


