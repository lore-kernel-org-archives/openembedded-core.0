Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862EFC7EE31
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:08 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.26239.1685610236204720410
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="106808157"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="106808157"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:00 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0CF0DDDC62
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:59 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 196EAD5B20
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 538A288864;
	Thu,  1 Jun 2023 18:03:57 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libcap: upgrade 2.68 -> 2.69
Date: Thu,  1 Jun 2023 17:03:20 +0800
Message-Id: <1685610221-29015-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10--4.035200-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2tvedD3CYSjHX19XH94Jsw630kDaWZBE1R4mYJHAxGkc3+JnVo2xgbule1
	bnmZtjuxlFSORUVE4XmEtMujR9T//oc50oBUFVx+eAiCmPx4NwGmRqNBHmBveafSbrzwSjfwqtq
	5d3cxkNRwHPzrPx3/LOY1g04XoqAHY/88JBHRqXmNgoZf3oju8yc1P/EgqWUm3Ot3LaaxtkLY7q
	pAuFqX7JGIA6zkTH2ZohLLfTS6Gq5ltc/b1pfHmU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182069

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/libcap/{libcap_2.68.bb => libcap_2.69.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap/{libcap_2.68.bb => libcap_2.69.bb} (96%)

diff --git a/meta/recipes-support/libcap/libcap_2.68.bb b/meta/recipes-support/libcap/libcap_2.69.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.68.bb
rename to meta/recipes-support/libcap/libcap_2.69.bb
index a302c5a367..92fa766d37 100644
--- a/meta/recipes-support/libcap/libcap_2.68.bb
+++ b/meta/recipes-support/libcap/libcap_2.69.bb
@@ -19,7 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "90be3b6d41be5f81ae4b03ec76012b0d27c829293684f6c05b65d5f9cce724b2"
+SRC_URI[sha256sum] = "f311f8f3dad84699d0566d1d6f7ec943a9298b28f714cae3c931dfd57492d7eb"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.34.1


