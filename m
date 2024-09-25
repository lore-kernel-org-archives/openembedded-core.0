Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310D3C369A5
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:55 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.9323.1727246989761149089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qs+bnp36;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246989; x=1758782989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=mMkuCErPOywm5yLGRhTeuyzg51B5YVuGO0iuLn/p4IM=;
  b=qs+bnp36yzdOESoi2rKJu2I/wl6GfQJBk6eCibYHErt+jam8BIh8CvE/
   loqdW49YPyFDYeeWNwvFw+H2y1y6b+cvH+ieLvfyYfEIbP7PaHyy929JV
   VZ5WTEUHXJBeHxG5bWHKwnH1aHYPf9eh1+DKB9OfZtpySZW72KMsXG20L
   VjmGZsUPzEO+agqvSlGzpxfwWpvAcP4PR6FZlZDNLXBO0RR1nOwfuUM+Y
   vb/TbUXDRzIHQwTXmYbaN2gB2c0tywK+PGhU/B8Cs3wf8QFy/QXyRFLa/
   PA4ed9cnYBQEr1BPgNwraRf3LvpCJE1xl1NhWdpQebXgnTBQNFL2SDUni
   Q==;
X-CSE-ConnectionGUID: AJ22oTs0SYiQ603kNNKE2w==
X-CSE-MsgGUID: iyaAgLeLTh68AetinX8/9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="163052402"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="163052402"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:47 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F0A5C68E6
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A3CA8CFB9D
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B88B401E0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DE6D01A01E9;
	Wed, 25 Sep 2024 14:49:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/47] python3-more-itertools: upgrade 10.4.0 -> 10.5.0
Date: Wed, 25 Sep 2024 14:49:02 +0800
Message-Id: <1727246960-20665-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10-1.473700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXI+HaAs3RBRkHgaUZpxZw3jM9MxTXyHMWtbj4
	eU+4n9uKtRpNN8SDMTb1L0b1mHxTHLNKoVpLthxL1EBFEqARUjV9lge5ORIS3+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204919

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Optimize all_equal recipe
- Reduce groupby.next calls in all_equal
- Fix types.UnionType

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ore-itertools_10.4.0.bb => python3-more-itertools_10.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_10.4.0.bb => python3-more-itertools_10.5.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.4.0.bb b/meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-more-itertools_10.4.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb
index 6451e3e23c..a98b412b5d 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.4.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "fe0e63c4ab068eac62410ab05cccca2dc71ec44ba8ef29916a0090df061cf923"
+SRC_URI[sha256sum] = "5482bfef7849c25dc3c6dd53a6173ae4795da2a41a80faea6700d9f5846c5da6"
 
 inherit pypi python_flit_core ptest
 
-- 
2.34.1


