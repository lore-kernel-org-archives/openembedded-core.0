Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D18D3C4828D
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 00:17:24 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.11724.1706833041351858358
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 16:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PcJBjCjY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706833040; x=1738369040;
  h=from:to:cc:subject:date:message-id;
  bh=JZMAcWRo+cLP5izjhsIeIkvSeWSizBo1DWmdU9mZ3jg=;
  b=PcJBjCjYYJoVwrszZ5MzRUm/WorVKCDlrW8PLAbyTTVL8DDadyMsnOhj
   R6HCUwX6KEy1aFZDNX4SiX7T6aT1Ki3k6zggNT0wocARxgizzrOT9GWXD
   Rwv8MrU2pEHDV4BHyPYh/lsr1S41qCHwb48Un5vdPB9ZfP45oc1ponK8O
   Wks0q27Gi+EQyoosh7sr2VhX5cnSM86ejBJXvh6/3yeAkjuisrVbzPtuH
   EWJuOUjVIlOSytNqXmDiq4oemhP99+OYz+KGTS5rlnS9ZRjLemaVgONDl
   68jJTU0EM6cyp57wZNnbS16vZZc4lHy67ilp18IyTdjxyxuRlkOBhtujg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="148362540"
X-IronPort-AV: E=Sophos;i="6.05,236,1701097200"; 
   d="scan'208";a="148362540"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 09:17:18 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id AE740D4808
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:17:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id ADFF4D6210
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:17:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 26E3A2009040A
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:17:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 95CE81A009A;
	Fri,  2 Feb 2024 08:17:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-markupsafe: upgrade 2.1.3 -> 2.1.4
Date: Fri,  2 Feb 2024 08:17:08 +0800
Message-Id: <1706833028-19944-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28158.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28158.003
X-TMASE-Result: 10-0.490900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrNNNNLDf7bemU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN71Wx2uUbPLcQhNjZQYyI3Cl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMOxSUCMgYtfz+7NU
	RtGBl19pnI4ZlQkQifoeeZP+oS38sNd540ukw5hTRE5r70soUzuJ/MDOX36wai7zvq/tBSPB7Fa
	Te02JMwgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 00:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194769

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Don't use regular expressions for striptags, avoiding a performance issue.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-markupsafe_2.1.3.bb => python3-markupsafe_2.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_2.1.3.bb => python3-markupsafe_2.1.4.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb b/meta/recipes-devtools/python/python3-markupsafe_2.1.4.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb
rename to meta/recipes-devtools/python/python3-markupsafe_2.1.4.bb
index b346cc85d9..b245ce6fe9 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_2.1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "af598ed32d6ae86f1b747b82783958b1a4ab8f617b06fe68795c7f026abbdcad"
+SRC_URI[sha256sum] = "3aae9af4cac263007fd6309c64c6ab4506dd2b79382d9d19a1994f9240b8db4f"
 
 PYPI_PACKAGE = "MarkupSafe"
 inherit pypi setuptools3 ptest
-- 
2.34.1


