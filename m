Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4698EC27C51
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.5653.1716369347957863313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mIsW6tPp;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369347; x=1747905347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=nRssPqzN3/iCMR33ycTBkd+eRX6e65jJeDmaiiL1Gkc=;
  b=mIsW6tPpNOecC0S00JLJ5FKf82B2Jo3jRBd/dZzHAAgwAfWp/NncWqmD
   k1cc1shRRJamqmmM8X+oTvSyMz+rHKBO0wbI304fBiKGvCS2QThhRQW39
   jc1XkD9dVPRsBWdVjfm/t5e70fGmDzpYd+gXD5SRAcHcKGfqsVebGoTHG
   qCqCA6ZCRzSaAHN3GM5mqEqXO5/FSqXtjt8qgZfD9dBy1pzYlQt2u8Q9T
   5HmieLN6xcC8BtqIoG/DdwhnEH7V5OB2VUBbWsX4O05Oi8OalD4zTQOIL
   QaQMDj6e346tENXUilzn8ZhBIdJOYHyqiHKKIvRgBODQzfIMWKfxsRitt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="147548999"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="147548999"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:45 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D2804CA1E1
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EF15C30D9D
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E08121CB3A
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3AB0A1A000B;
	Wed, 22 May 2024 17:15:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 31/42] python3-hatchling: upgrade 1.24.1 -> 1.24.2
Date: Wed, 22 May 2024 17:14:38 +0800
Message-Id: <1716369289-22526-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--5.088800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mregIHHX2L4YzJyYU2J054PRmJ
	iwOyNlJd4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0546EuH17uq9IiDXk
	WtYCR28+xfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu25FeHtsUoHuNLiHB1iFLuvJUn
	ys+clrZVjQeH53vQ3wHxw68ixxXYRoBmTSwRxjXg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199731

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add .venv to the list of directories that cannot be traversed
- Output from the core Application utility now writes to stderr

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-hatchling_1.24.1.bb => python3-hatchling_1.24.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.24.1.bb => python3-hatchling_1.24.2.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.24.1.bb b/meta/recipes-devtools/python/python3-hatchling_1.24.2.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.24.1.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.24.2.bb
index fc8d953281..0ad545f448 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.24.1.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.24.2.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "51f861891e98c4044eb455163a737e5d2328d7aa74890b182db2d80fee22a497"
+SRC_URI[sha256sum] = "41ddc27cdb25db9ef7b68bef075f829c84cb349aa1bff8240797d012510547b0"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.34.1


