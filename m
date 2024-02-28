Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4174C54E56
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:52 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8397.1709105616748395131
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kwQaWFTA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105625; x=1740641625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vqpgZ4g6rTTOTzh+LNJqwTYFAMCRQ2sctkZZPDguXRQ=;
  b=kwQaWFTA595uhXvBSAExRhX5TpCbcPfUTMm2jcxyc+NlVvFbsKD+qI5f
   /0j6GkYFgOHAH1Uw+mNDiIS56XYIFGKVQU7MecCzcxBNfLF0IRjRyM05S
   VuohsVzG6llGALNdv7m9IOf/mFmCNpHaxTsCAMIKy3aAb8C45wJAg/NU8
   eEJGpYeFrnjxSgHK+PmhXAKt+JFIi2C3E+FqxyYFcveMaUvdQ99dZa4wc
   lY52idrHwoidgDH52/ZpwokzStYgXPk0XocENRpJeV3luZrzeiEChwchH
   mR8I9213c9zyKsdiGIpgdPoo9K5z4PNu7PVJWwRSXLTq3v5Wimd98TEGs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150649139"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150649139"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:44 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 43177A0293
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7561DDAE8B
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 079152008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AA91E1A006A;
	Wed, 28 Feb 2024 15:33:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 47/48] xkeyboard-config: upgrade 2.40 -> 2.41
Date: Wed, 28 Feb 2024 15:32:54 +0800
Message-Id: <1709105575-24259-47-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-2.409400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr10ABBoeqUrvFXntfxA7JmL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3FCedixYXzOrTjh
	zb/nJ12+xfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzesxwtbaufHwwU5
	U85gI6qd/dyt8dJpL0JfAMc3hblzNQc/E9o8f6NMxfJmIo8CNh/fohgxUFhgNgEYQdaJl6qeSQh
	tMiEGERiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196372

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Translations updated

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{xkeyboard-config_2.40.bb => xkeyboard-config_2.41.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.40.bb => xkeyboard-config_2.41.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb
index 5c1f475739..79ce7dea35 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8fc8ae699974c360e2e2e883a63ce264"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7a3dba1bec7dc7191432da021242d17c9cf6c89690e6c57b0de048ff8c9d2ae3"
+SRC_URI[sha256sum] = "f02cd6b957295e0d50236a3db15825256c92f67ef1f73bf1c77a4b179edf728f"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.34.1


