Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BB8C54E5B
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:41 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8418.1709105610013304442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=loDguiG/;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105613; x=1740641613;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LppPaSj89vPCDkgoqQxUw393gqwHhB8L89KM4pUjKlk=;
  b=loDguiG/8h0tXpfV8ZfFqP9rY7pk1jkXw50QPqrwHbrEDlntW1gwwqMa
   ASyk1wttMpu2Tu+e79II1fKPK2n25lOQUoQ9b/iQGC8rF9p3dO0aI6prh
   lZpGIrXWNrDKzBkxfG0kIDukr0YUHVsCNYMVcUkoB/WsyysokluPItOOX
   P4eHPqAlB0HAnUp6Hx1fqqCO+TPNBdcAW+ZEOL3v3gG+p7+mpZKcPPG3r
   dJ4JqJkUsJv4LIEWGbcyv3HDl56Yufomot4pMwdRN7NsflIA+214DBExw
   OQIPQozV+lqqkwEaME2ok4zEH+ldY58a1udASwf/7/MMvvu3bqvthG9y0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="152444751"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="152444751"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:32 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FD561590E8
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 84B01D52AF
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 20B3F2008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C3C321A006A;
	Wed, 28 Feb 2024 15:33:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/48] mpg123: upgrade 1.32.4 -> 1.32.5
Date: Wed, 28 Feb 2024 15:32:32 +0800
Message-Id: <1709105575-24259-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-0.621600-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuJYii+Cj3Y3EIj
	Ip4EpSqCH8/5AELJHbgNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDIcfwGQIbwrkHdNoXv6UJm+FS1+qCxplosDfgpjSDkFN+EpCHUsKYYGULHdr+lZw9qUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLOzcpngF9qnGOeW0
	XgWQSEmBRZjJJqNsO0rMOvzhAoGVfbYZ8pcASitHJzgf4Vbzq8DDLH+b4CcGeRbPs4g/+Trwkh8
	oehFsKaIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196349

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- build:
-- CMake port uses CFLAGS for pulse/jack/tinyalsa properly now (bug 366).
-- CMake port links libsyn123 with libm now (bug 370).
- libmpg123:
-- Fix --enable-portable (no usage of LFS_WRAP_NONE, bug 368).
-- Fix dct36 wrapper usage for x86-64 and NEON. Stupid (bug 367) and
   also avoid returning void.
-- Make ARM builds work with nagging (missing feature macros for std=c99)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mpg123/{mpg123_1.32.4.bb => mpg123_1.32.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.32.4.bb => mpg123_1.32.5.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.32.4.bb b/meta/recipes-multimedia/mpg123/mpg123_1.32.5.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.32.4.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.32.5.bb
index 8c6101fee8..52526471ef 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.32.4.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.32.5.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "5a99664338fb2f751b662f40ee25804d0c9db6b575dcb5ce741c6dc64224a08a"
+SRC_URI[sha256sum] = "af908cdf6cdb6544b97bc706a799f79894e69468af5881bf454a0ebb9171ed63"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


