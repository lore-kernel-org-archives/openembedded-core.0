Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F99C5472D
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:29 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.12777.1724136742439977577
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gm9kPqJM;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136743; x=1755672743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eOsUS3aNJmg6fbke0hHZ0U4YGRc8qZXWU4nQaiDf0Z8=;
  b=gm9kPqJMaXclObLhjsMzKV+jHZhluymBxcWZf0KTPVlM6fBgwb+h5sv6
   +mMTD9ExJ+SLKpW1jdxmWNMd2KAwn14rAOIlDWuB+IitiEnnfWgHagxZs
   tvbasFayidAcHZ4AiTkGXe0FdR3k377fqAfokfiE9v5+dFSadqLASYE9m
   5Wss/LKaSgDFKaouHTXKmQJ9qbswQwIRXOl9Prggw29YhPzaBaWkPRPuj
   QgFL9I1KAjl86NZT6yb0MjAGBqQbEDkC3ZEQIDjJLumKo5Whqk5QZBwxA
   9mNzWQ08dR3zb1w8m6k7fmJdStto9HBz9D9ARoL3kWC11gImA7SBUOGHu
   g==;
X-CSE-ConnectionGUID: P6CuJ4sFTy2nfqppD4mKeA==
X-CSE-MsgGUID: szVtvf6vSLSTvIBGVa2l6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="170301750"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="170301750"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:21 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 24E5DD800A
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 626D9D7530
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E2442E206E
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8D0371A0002;
	Tue, 20 Aug 2024 14:52:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/24] xwayland: upgrade 24.1.1 -> 24.1.2
Date: Tue, 20 Aug 2024 14:51:43 +0800
Message-Id: <1724136703-20023-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.005
X-TMASE-Result: 10--0.342000-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZnVTWWiNp+v/Exmr5hqNL1nN03BZlA7M8A6J
	UWkXudIk6hUOcTonr9IAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSz1nfVgd5HV+gzht
	jfSLktHKlmOTrnwL4xWREmapZpAXwClMYpNr3cwJg03DK+cVVyjGGga6RkZvr8JCcpnZp84gsgK
	V5BScl3iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203544

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xwayland/{xwayland_24.1.1.bb => xwayland_24.1.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.1.bb => xwayland_24.1.2.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.1.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.2.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.1.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.2.bb
index 7302b53f61..a3ece64348 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.1.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.2.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7125bee0b10335805d7f5ba57dfaa359a7850af1a68524f1d97b362741a51832"
+SRC_URI[sha256sum] = "141eb76e7e422a3661c08782c70be40931084755042c04506e0d97dd463ef7d2"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1


