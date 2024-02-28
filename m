Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDE8C54E41
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:41 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8420.1709105611380585283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MCumsZpu;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105611; x=1740641611;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tTgxajfsbieh+GJL482PnjQUjp09juECQ4SQTUGgpx4=;
  b=MCumsZpu/q8AcmCVUibnEl1RS1WtypJ91uLNTcFP9/zTyzbhkxf8beLz
   6PbLE7Bi0rUoYUDMKQh2VraZTYqrvFNT5DZujJZGLRi/fGp0d+//f+RKf
   hk/zjOkT1HGyRpFPrAospb8B6DwgpzuRZ5bI/K3QQmkx93SImVJr14P50
   cc2a9kM2ma1H55MrPpCC1vT48QXkOu5xwZ3VJuo2ZX06S0yO2z3iH75g/
   oiufq6wLGPjZvddiLGDICtDbxhh9f2yIDnwAL8ILJKIHs5K/6b4Wdp1+n
   pHKWDkLn6JuFwtFAglUsZgzmjIcawRY3eGyAb9o+34m/71vqmp5/DOHWH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150945748"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150945748"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:29 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E8994E8CC2
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 224DCD7B7A
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B024D2008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5D51A1A006A;
	Wed, 28 Feb 2024 15:33:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/48] libxext: upgrade 1.3.5 -> 1.3.6
Date: Wed, 28 Feb 2024 15:32:26 +0800
Message-Id: <1709105575-24259-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--1.427700-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr45oDENe4eevfUZT83lbkEGKF
	UnCI/02ZIfufXEGEgRZEesSwxd/CQ4adzrWEfJJM30kDaWZBE1TVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYragH2fa4K/a5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO28bR
	Ued1HGAgejtITm3dC1Y2FKh9SADHrDBUalb/ouIGX58x7NOPzcG/lQBB+wXiHqi5XpRzqO5oOXe
	0eJpMMysU9TPm0LQLam9KgIX84qe/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196344

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Wrap Xext*CheckExtension() in do { ... } while(0)
-configure: raise minimum autoconf requirement to 2.70
-configure: Use LT_INIT from libtool 2 instead of deprecated AC_PROG_LIBTOOL
-_xgeGetExtensionVersion should not free info on failure
-Check for malloc failure in _xgeGetExtensionVersion
-_xgeDpyClose: handle NULL return from _xgeFindDisplay
-XEVI: fix -Walloc-size

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxext_1.3.5.bb => libxext_1.3.6.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxext_1.3.5.bb => libxext_1.3.6.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb b/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb
rename to meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb
index 7d0597ef1d..275926a885 100644
--- a/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb
@@ -21,4 +21,4 @@ PE = "1"
 XORG_PN = "libXext"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "db14c0c895c57ea33a8559de8cb2b93dc76c42ea4a39e294d175938a133d7bca"
+SRC_URI[sha256sum] = "edb59fa23994e405fdc5b400afdf5820ae6160b94f35e3dc3da4457a16e89753"
-- 
2.34.1


