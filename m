Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A05C001B0
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:10:45 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.4233.1689585043434009125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="124869310"
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="124869310"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:10:41 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D8481D4240
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:38 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BB3ED9498
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:38 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F9012FC8579;
	Mon, 17 Jul 2023 18:10:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] nghttp2: upgrade 1.54.0 -> 1.55.1
Date: Mon, 17 Jul 2023 17:10:10 +0800
Message-Id: <1689585025-23731-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27756.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27756.006
X-TMASE-Result: 10--7.650200-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeV4YeSlHZYFopJh
	6YadkeztoaJ4nbyjXZ6yh1smVU5X5xL89w8Mw/DeAD5jSg1rFtBhTgzhQSF1ipTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3jpxdo/JwVm9OUg7tlBn3vNicYKk+uuBJFs3
	ldHXPCHApmAh02tS2ALmth8cTQ473lRxm3A2wKuhRFJJyf5BJeZVXUb4KTaXv6C0ePs7A07cjHc
	hynrO5bJCPxzipRZzLGUScTEpGkwHSCnsjstN9w3PhOBocpds8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184440

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
    doc: Bump boringssl
    Fix memory leak
    Fix build error without libev
    Bump go to 1.20
    Bump go package dependencies
    mruby: Support cross build for autotools
    h2load, nghttpx: Add UDP_GRO support
    Bump ngtcp2
    nghttpx: Randomize initial QUIC packet number
    Bump llhttp to a0e744f850d8101a51284868ffdf745bcfe4fbcc
    Bump macos to 12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nghttp2/{nghttp2_1.54.0.bb => nghttp2_1.55.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.54.0.bb => nghttp2_1.55.1.bb} (91%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.54.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb
similarity index 91%
rename from meta/recipes-support/nghttp2/nghttp2_1.54.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.55.1.bb
index 4e15f0839f..1be9a348ae 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.54.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb
@@ -8,7 +8,7 @@ SRC_URI = "\
     ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[sha256sum] = "20533c9354fbb6aa689b6aa0ddb77f91da1d242587444502832e1864308152df"
+SRC_URI[sha256sum] = "19490b7c8c2ded1cf7c3e3a54ef4304e3a7876ae2d950d60a81d0dc6053be419"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.34.1


