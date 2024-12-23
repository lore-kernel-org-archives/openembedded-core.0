Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B27E7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:32 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.10583.1734945087184491944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FFkRJhPO;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945087; x=1766481087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=A19+PpSbxBvm6uLFBejWPDV7P28s3th8aJNZtncomQ4=;
  b=FFkRJhPO2+yzG4WPJoRyo0impFzvE/qzbxTh17Bfovq5HYOC/brcE0rv
   RjNYIUbsgqCwhPockOrmRelmK43fy7Bm0KZLcjpdHOnJplLJSA86McXOe
   pJn/Ug+csY8a/SJFX/iLbl2FN7LmA+sAYOS3Rfgxt9KHjzCPm6beC7OSL
   tm4y6mZGR4K2+XKfxdyH6nYIG36lyaVDkXILkqsuhMUUamyY544XX43Sf
   sHh5CXadCS8ziGXFOEviZHpM7RAKZunbdbY+xhVbfi9i9P9ZX8B/Ydppy
   1ueMLepV9MJavJ5FueEYE+wYxUdtbbtbf75PEDX1lmlBkHPKYOmczsl4q
   Q==;
X-CSE-ConnectionGUID: oMzUq705QjS4Fh2+QDmHiw==
X-CSE-MsgGUID: lYk9d98dQ1KR/2JpBfPVww==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="173031644"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="173031644"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:25 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D7A26D4F55
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:22 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AF524D3F08
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 193A720076D2C
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:22 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B63711A0073;
	Mon, 23 Dec 2024 17:11:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/22] webkitgtk: upgrade 2.46.4 -> 2.46.5
Date: Mon, 23 Dec 2024 17:11:04 +0800
Message-Id: <1734945065-4373-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10--2.294600-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysJeMOJX8c9nLMI
	TuvBC7PaURHZXpMPIvkNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7hEz
	I3+mkzicitzPER+KKsBq7Y6OZUGLxMd4NQY217MjQ0D4MTphfBARryDXHx6oXxhd4pAveWGyjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcu57CEC6sJrFhO6EJZlPbVRLzcba6FodC7qst
	HdrWHoHIrrTpd7Fujjpxqb7l7nK6wLKaYvq7PS1AD5LNKS+oNK1WCEOcdRdbP6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209036

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix the build with GBM and release logs disabled.
- Fix several crashes and rendering issues.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webkit/{webkitgtk_2.46.4.bb => webkitgtk_2.46.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.46.4.bb => webkitgtk_2.46.5.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.46.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.46.4.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
index 6e1b793924..abbf84ccbe 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.46.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
@@ -19,7 +19,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://bmalloc-fix.patch \
            file://sys_futex.patch \
            "
-SRC_URI[sha256sum] = "0eff5f0ab0a2872ec87df62bc32e3289c8af625716ac71e94b298d74e0374176"
+SRC_URI[sha256sum] = "bad4020bb0cfb3e740df3082c2d9cbf67cf4095596588a56aecdde6702137805"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.43.0


