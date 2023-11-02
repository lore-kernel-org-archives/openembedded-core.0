Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE46C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 08:21:06 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.26000.1698913257979131827
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 01:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="137878326"
X-IronPort-AV: E=Sophos;i="6.03,270,1694703600"; 
   d="scan'208";a="137878326"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 17:20:55 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3874BD5027
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Nov 2023 17:20:53 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 734CF280B7
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Nov 2023 17:20:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 67245886FC;
	Thu,  2 Nov 2023 17:20:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] enchant2: upgrade 2.6.1 -> 2.6.2
Date: Thu,  2 Nov 2023 16:17:54 +0800
Message-Id: <1698913076-22037-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1698913076-22037-1-git-send-email-wangmy@fujitsu.com>
References: <1698913076-22037-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27972.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27972.006
X-TMASE-Result: 10--5.683500-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrCZa9cSpBObkkPUaVCjGoGugU
	rKBxousFsl4hr8DFPbANyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2f8F
	SbzLvvf4/jpOn/YFJRcr5AVdin4a1cu2IYLQNwP9vTnqYKYXTRn0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtSuJ4aTzrCM++kCjNN8UH/W2Aj3oMidSG9bZb+k9LRYct1VwSnJEZtw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 08:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190064

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Documents exclude files: each personal word list is paired with
an exclude file that contains words the user considers invalid.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../enchant/{enchant2_2.6.1.bb => enchant2_2.6.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.6.1.bb => enchant2_2.6.2.bb} (92%)

diff --git a/meta/recipes-support/enchant/enchant2_2.6.1.bb b/meta/recipes-support/enchant/enchant2_2.6.2.bb
similarity index 92%
rename from meta/recipes-support/enchant/enchant2_2.6.1.bb
rename to meta/recipes-support/enchant/enchant2_2.6.2.bb
index a3510a8705..38d3245d20 100644
--- a/meta/recipes-support/enchant/enchant2_2.6.1.bb
+++ b/meta/recipes-support/enchant/enchant2_2.6.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "f24e12469137ae1d03140bb9032a47a5947c36f4d1e2f12b929061005eb15279"
+SRC_URI[sha256sum] = "6686a728e56e760f8dee09a22f0fb53b46ee9dbe7d64cf9e5bb35a658bff7e1d"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.34.1


