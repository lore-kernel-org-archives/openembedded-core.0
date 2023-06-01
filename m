Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45F3C7EE2A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:18 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.26254.1685610252682208315
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="119096907"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="119096907"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:10 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BBC85E428B
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:07 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F096ED67B7
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:06 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 355BD88857;
	Thu,  1 Jun 2023 18:04:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools-rust: upgrade 1.5.2 -> 1.6.0
Date: Thu,  1 Jun 2023 17:03:35 +0800
Message-Id: <1685610221-29015-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10--0.727000-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrWfgivgcUPZMXY+gNTubOQFYM
	JR3dIrh250tmMeN6Ndf4IS0j/HVkZu1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4rhX/lUQGcewW2EXohiB6drdCok3ibXlQX0tCKdnhB589yM15V5aWpj6C0
	ePs7A07Yjdp2MG2wysXozBYJYErZB1GebfUrPYhcC/tLOf8u2VdMzXGFHdl318gAp2usHY49YcY
	NP5VOEEfv7rLnYQTm3rCShqseDMv2pg9qb9lTrP8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182086

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Prefer passing --crate-type option to cargo if "toolchain >= 1.64". #322
 Fix a bug where rebuilding the library would cause any running processes using it to segfault. #295
 Fix setup.cfg format for compatibility with "poetry==1.4.0". #319

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...etuptools-rust_1.5.2.bb => python3-setuptools-rust_1.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.5.2.bb => python3-setuptools-rust_1.6.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb
index 01e29cc6d8..f1da4b50e7 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 SRC_URI = "${PYPI_SRC_URI} \
            https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "d8daccb14dc0eae1b6b6eb3ecef79675bd37b4065369f79c35393dd5c55652c7"
+SRC_URI[sha256sum] = "c86e734deac330597998bfbc08da45187e6b27837e23bd91eadb320732392262"
 
 inherit cargo pypi python_setuptools_build_meta
 
-- 
2.34.1


