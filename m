Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89388C28B26
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.18101.1741079370267708213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iYxo1T1f;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079371; x=1772615371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bNqcUhtY2c4TM7xWyZ7xChiJnDjEfJIYNozjTLo4HtY=;
  b=iYxo1T1fZMLhET+mj36mp/owTdfdiPndHBqjeHeTEqmK/0y6ZNUQZC/T
   z0KKCRcMdsyA0rAuFkIWbrQ7H1kk+UzReKh702uZFrYMNxUKxSO1OL1aj
   IZ0g62RkXxXxElY51BkGaNt3y7VFFp3RoO7jrtFk8fstN8QyJk3CcQorr
   FIckCjhmPwI4JrbX9LdyH9I6/lyh28L0FYFDQVdr1IqSF3rq8v3cgn9ex
   lUcYNkZCuagDpX8l9vb7fsfmtp52017VvqEiAuOUHtttWz1i9JZEEdeAK
   1LZhqQBQDKK0JGN7Wz5PUzl0NqsgNJTXBFoAmJO9xNu5paPCjeWmiTz1C
   w==;
X-CSE-ConnectionGUID: Eh0NJVg/Rj2FPNGqqrkc0g==
X-CSE-MsgGUID: vzyIglbdRGKkpTkJ+WCDnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="171349538"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="171349538"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:28 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 564C7E9E7F
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1955BD8B84
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:26 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CC71B1A0071;
	Tue,  4 Mar 2025 17:09:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/31] libsdl2: upgrade 2.30.12 -> 2.32.2
Date: Tue,  4 Mar 2025 17:08:55 +0800
Message-Id: <1741079356-13445-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212234

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl2/{libsdl2_2.30.12.bb => libsdl2_2.32.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.12.bb => libsdl2_2.32.2.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
index 8f4d41ad84..dbe8e0c812 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "ac356ea55e8b9dd0b2d1fa27da40ef7e238267ccf9324704850d5d47375b48ea"
+SRC_URI[sha256sum] = "c5f30c427fd8107ee4a400c84d4447dd211352512eaf0b6e89cc6a50a2821922"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.43.0


