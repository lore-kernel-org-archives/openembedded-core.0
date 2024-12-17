Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC64BE7718B
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:45 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.77565.1734425913959706819
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FAO7ioLR;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425917; x=1765961917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bRYBPnykupPGpXrU0g65kabt4puTyRnlEux+fwlmXB0=;
  b=FAO7ioLRHJ2neR1DlwFETizLUJ3xrnI1/8Ze2pVjrO+GdFwrLMB1x6JY
   wVnS7pmFgizo9CJ0YBXm5ign0HuTiLESUFQF0vA9j4pwu5qKjI58hmNoJ
   ccgZ2YKVJm4fbi1CFGzFd2gISnXn9FLwRL77yagME8vISZM3/Zp4RXWik
   7e4KzSZ4Puds03aaevo+A28H2MjDub59nFw+IjyQ1OzSId5wykouuC8n4
   NJiUduodlbjWw6DZnRkIj6uhYXksWnblInxdkBgj4zr9mDs3qoQYxWVCH
   zmEleRv+MPVLQE4DufivQgQH6fF811K1IyHHzZ+W01V1C4iyJe8/gRqhV
   w==;
X-CSE-ConnectionGUID: xww4oOJLQ1ybZdazMRNkSg==
X-CSE-MsgGUID: dgJ3OuokTAG5+RwpSfJGPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="172377079"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="172377079"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:36 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FECAD6EA1
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 168D5D9730
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E8E83479C
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:33 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3C8151A000B;
	Tue, 17 Dec 2024 16:58:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 15/21] mpg123: upgrade 1.32.9 -> 1.32.10
Date: Tue, 17 Dec 2024 16:58:01 +0800
Message-Id: <1734425887-18069-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--0.391400-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvpklbZ73CAbT/4
	0Ae7LpB/4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0543ZonBD1OvODhEz
	I3+mkzic2AjvSSs99nczBM4lhzuoGpljg/F9ExYR1e7Xbb6Im2n0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqt1/xWCa4HOOrb2mT0OAw1NFRypxD5MiMaQaRWWpQQD2WOINXIkkzQ1toWR
	ipRhO4Cyv+E1451gTjveW0mbpgSzbHShowr5NNQHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208819

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- scripts/tag_lyrics.py: fix for python3
- libout123: Use strtok_r() to avoid conflicts multithreaded contexts
- libmpg123: Un-break DLL builds that need I/O functions defined in libmpg123.c
- ports/cmake: More fixup to also produce .pc files with Libs.private.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../mpg123/{mpg123_1.32.9.bb => mpg123_1.32.10.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.32.9.bb => mpg123_1.32.10.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.32.9.bb b/meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.32.9.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb
index 54006e8c22..82f7b7d332 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.32.9.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "03b61e4004e960bacf2acdada03ed94d376e6aab27a601447bd4908d8407b291"
+SRC_URI[sha256sum] = "87b2c17fe0c979d3ef38eeceff6362b35b28ac8589fbf1854b5be75c9ab6557c"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.43.0


