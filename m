Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1355FC4828D
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 00:52:55 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.12444.1706835170828166003
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 16:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fVPs9pXm;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706835171; x=1738371171;
  h=from:to:cc:subject:date:message-id;
  bh=vDvu8yZsBuKavW/Ta0DDK0Bs2PKw1qVY2X97CYQgbq4=;
  b=fVPs9pXm5FTjwLtn9A5N1t4Rzh0YT4SlQfxHIsWTa4Nm+HVJ6N3oXIOw
   +axYOr6rGJvDdNvyFcVXF0XijnBTtmOngaf6aXN/nsy9arIAWwSclCcWA
   9r8/asN0C4KolcQU84UVhKqW29i/tpNdm98fRzR0cRCcSKy0D1+9jGf5n
   huTUEhtkWlu4CiY71yExxunZlXDYzrQj2u79y+OgD+HXyy1PjMVxtU9sD
   JxBBJIoNM6n3MqM5DncUGDnYbKUHt7NnWhOLZ9lwJgCHnzWtAvrQL9jnq
   Pf2z769mfhDCLYSelRxQUFDNFwjCjEMYWhkAdOVEirHtCNhUylzp7rCMT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="148084999"
X-IronPort-AV: E=Sophos;i="6.05,236,1701097200"; 
   d="scan'208";a="148084999"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 09:52:48 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 402BED4804
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:52:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2CCA5D53E3
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:52:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8A56C20059322
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:52:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 32C2E1A009A;
	Fri,  2 Feb 2024 08:52:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-sphinxcontrib-applehelp: upgrade 1.0.7 -> 1.0.8
Date: Fri,  2 Feb 2024 08:46:04 +0800
Message-Id: <1706834764-20312-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28158.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28158.003
X-TMASE-Result: 10--1.375100-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrMVx/3ZYby78XR19nmRX2X6Sr
	9vLA6F20wrrb9L9zcK/x1S0rgG1nwO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKJlFSORUVE4XoNFhuChNKBZeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZKbaJJSdiTjK2O9cXJtsFBMppa3MYmqjbl5lZqoPeBPq0bqL
	j1a/DB+HsqXSqpLhikqPiXXHJLRBoXOFpuEwM66zvDSWMHiAidLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 00:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194775

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-  Remove Sphinx as a required dependency, as circular dependencies may cause
  failure with package managers that expect a directed acyclic graph (DAG)
  of dependencies.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...lehelp_1.0.7.bb => python3-sphinxcontrib-applehelp_1.0.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-applehelp_1.0.7.bb => python3-sphinxcontrib-applehelp_1.0.8.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.7.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.7.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb
index ec3670641d..6ea7c516d5 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.7.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7715857042d4c8c0105999ca0c072c5"
 
-SRC_URI[sha256sum] = "39fdc8d762d33b01a7d8f026a3b7d71563ea3b72787d5f00ad8465bd9d6dfbfa"
+SRC_URI[sha256sum] = "c40a4f96f3776c4393d933412053962fac2b84f4c99a7982ba42e09576a70619"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


