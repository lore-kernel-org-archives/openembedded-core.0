Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97999C3DA55
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:29 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.10234.1720604659026825604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MYmtMwlF;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604663; x=1752140663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ydrWczFhdJzKK1LU56G6KKFU2TqwHIv0HqMnmSwVONI=;
  b=MYmtMwlFOSV7Ie8M6JQ/m67fLWP6W/xqSZDbql4WN2Gqcsb9AZPBdRBT
   AmvMIbaTwcyc7ivjWWKjRPZdxPIW6ZOqZb2YZd9jFUNFB045fSHWbgOzP
   IhQGtfIG4HlQUzyzNip33SSCPeR1FmeRBUhRmLZGUPbwNyXgX5+r6g0wz
   yuxdvxiLxB30lFJriPEDahQ+gPYcJ5dDZnILmu0d3NcNBnUfzATWbEEec
   mBpEzs82nJe1gDjG+xIVobmjRLxS1XV4T9DnFOWq0WDK5bLuW0zjCc36m
   cv+UfZuK45Z+GzSFfuSUjNBcGjyeK4mGxwpUxzbnU0KF7+A9kr+dx01lH
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="153920557"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="153920557"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:21 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A8999D29F1
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 051F2BF4BA
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D42C2005018E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4ECE61A0002;
	Wed, 10 Jul 2024 17:44:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/30] python3-pycairo: upgrade 1.26.0 -> 1.26.1
Date: Wed, 10 Jul 2024 17:43:50 +0800
Message-Id: <1720604634-23406-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--4.226500-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysBpn1EQkoCQZ9M
	m+epcXwrP1qx+Cdv9iUNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2NBd
	ORIzcI4bIA9+0jajqknST2s0VE1NFSSOWVJeuO1AURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0X9r
	pBZuBDbUFZGXPZDUMkSvdRXti6x/ad9s2WY+ZGNtqD0hUfqEFuNj9EAvSzQjRLTKzKPp7y6dJ4e
	FmUxXYxIQJJr6m35QlhlI+SOe/kSfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201719

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix Surface.set_mime_data() with Python 3.13
- Fix the test suite with Python 3.13b2.
- Update vendored Windows wheel dependencies

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycairo_1.26.0.bb => python3-pycairo_1.26.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.26.0.bb => python3-pycairo_1.26.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.26.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pycairo_1.26.0.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.26.1.bb
index ea8b81be76..93f181bf5f 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.26.1.bb
@@ -13,7 +13,7 @@ DEPENDS = "cairo python3"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/pycairo-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[sha256sum] = "2dddd0a874fbddb21e14acd9b955881ee1dc6e63b9c549a192d613a907f9cbeb"
+SRC_URI[sha256sum] = "a11b999ce55b798dbf13516ab038e0ce8b6ec299b208d7c4e767a6f7e68e8430"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.34.1


