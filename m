Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2FDC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:19:53 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.37710.1698995992392545764
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="126469985"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="126469985"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:19:49 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EE72DD7AD5
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:19:47 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 32591D94BF
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:19:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B781200501A9;
	Fri,  3 Nov 2023 16:19:46 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] msmtp: upgrade 1.8.24 -> 1.8.25
Date: Fri,  3 Nov 2023 15:17:55 +0800
Message-Id: <1698995875-30452-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27974.005
X-TMASE-Result: 10--1.680000-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZSHCU59h5KrEGAD6h6FZmEV42zm1Zi+MJzm+
	KJ8jfUt0KZgIdNrUtgC5rYfHE0OO95UcZtwNsCroURSScn+QSXpjDMT0TyDk5+gtHj7OwNO0X9r
	pBZuBDbaQfM4hzqFYJGjFKlPdD4Rj6Eev0zskCmBeoZ0XMFAZjQ8sv2oPkQ8AimIIsRRdu4hyRI
	usMGnrvTy8UkPNq6FddXJwndkD7xvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190118

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.24.bb => msmtp_1.8.25.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.24.bb => msmtp_1.8.25.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.24.bb b/meta/recipes-extended/msmtp/msmtp_1.8.25.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.24.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.25.bb
index b8c867161b..b575fad5e1 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.24.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.25.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "bd6644b1aaab17d61b86647993e3efad860b23c54283b00ddc579c1f5110aa59"
+SRC_URI[sha256sum] = "2dfe1dbbb397d26fe0b0b6b2e9cd2efdf9d72dd42d18e70d7f363ada2652d738"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.34.1


