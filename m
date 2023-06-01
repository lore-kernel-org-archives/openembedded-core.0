Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E7C8C7EE2F
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:03:58 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.26613.1685610237353998873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="107313687"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="107313687"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:03:54 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1519CD29E9
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:53 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 46527D88B8
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 79B5288857;
	Thu,  1 Jun 2023 18:03:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] fribidi: upgrade 1.0.12 -> 1.0.13
Date: Thu,  1 Jun 2023 17:03:11 +0800
Message-Id: <1685610221-29015-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10--3.730600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRsCtGYG0znilLxrAG2Om7p2EXo
	uQwO8rUlbJcQH3furV3k48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w6F8u
	gOtKOyKiB937oXoC0wzS0/kso7qrYiuH9+sfNJTjrTqTns5l8gt3dbzR6hsX3ouqff5AVytZoZ/
	EcHMRtBLy/9VtVL0k+CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182061

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
* Adding missing man pages to the tar release file.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fribidi/{fribidi_1.0.12.bb => fribidi_1.0.13.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.12.bb => fribidi_1.0.13.bb} (89%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.12.bb b/meta/recipes-support/fribidi/fribidi_1.0.13.bb
similarity index 89%
rename from meta/recipes-support/fribidi/fribidi_1.0.12.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.13.bb
index 9e46d958e9..5d0476a375 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.12.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.13.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.xz \
            "
-SRC_URI[sha256sum] = "0cd233f97fc8c67bb3ac27ce8440def5d3ffacf516765b91c2cc654498293495"
+SRC_URI[sha256sum] = "7fa16c80c81bd622f7b198d31356da139cc318a63fc7761217af4130903f54a2"
 
 inherit meson lib_package pkgconfig github-releases
 
-- 
2.34.1


