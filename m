Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610F5C282E5
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.18200.1741079369828752806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LqU4DFzr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079370; x=1772615370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=68IgDsiEZX4f6S3wrwYfxzd7AUsZciZ20KYlUI7/m1o=;
  b=LqU4DFzrvTU/loIZDxtFmWwuG/1TyPXmQG7jUdez4gvf2Dc+gjrimDZX
   3QnN3xyRUqlaf2aiGUfOh/ITlsGIC+ulv8hCtQ7xMKOetx9F0/L6GfDQ8
   M+RvM+WTCqKjP/UJbuKivdjLTrmYBPq9SxTh0h8AMMTeNUeX3yK5KQ3Wt
   X3AooYUc44hw3/KOplWNcqUv/WgLtTKthzTaVQ7ut2Xxl/XZmyei/JxgH
   WY4zxTsJbEHKIqsuuI9cyCI+ue+UQf65z8S/7Kpx/xt24IDib+SQYN3N+
   I1CyDoyD1miLjCnB67kIzoh4DCMzzjx8Y+3bTnTK5Ls5lQa6GeE0zQ0tx
   g==;
X-CSE-ConnectionGUID: 3lTmBd3OS6Wypr0WH5MByg==
X-CSE-MsgGUID: /0pRRC91T2OSb75/5i2DgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="194539721"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="194539721"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:28 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A6A9D6EAF
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D473AD50A6
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:24 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 65EC31A0071;
	Tue,  4 Mar 2025 17:09:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/31] harfbuzz: upgrade 10.2.0 -> 10.4.0
Date: Tue,  4 Mar 2025 17:08:50 +0800
Message-Id: <1741079356-13445-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212232

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_10.2.0.bb => harfbuzz_10.4.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_10.2.0.bb => harfbuzz_10.4.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb
index 879cad36dc..b41e55d706 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "620e3468faec2ea8685d32c46a58469b850ef63040b3565cde05959825b48227"
+SRC_URI[sha256sum] = "480b6d25014169300669aa1fc39fb356c142d5028324ea52b3a27648b9beaad8"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.43.0


