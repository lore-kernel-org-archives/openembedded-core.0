Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A626C61D9C
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:05:56 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.15248.1700643952288979867
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:05:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="128219841"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="128219841"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 18:05:49 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 58FB4DCFC2
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:05:47 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 873A3BF4DE
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:05:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5CF542FC8519;
	Wed, 22 Nov 2023 18:05:45 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-wcwidth: upgrade 0.2.9 -> 0.2.11
Date: Wed, 22 Nov 2023 17:05:08 +0800
Message-Id: <1700643908-9744-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.006
X-TMASE-Result: 10-1.194700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrMVVFhl7NwvOY5nVpihxiw6l8
	Bh3+/TeG4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0540yMkq5fGHu2Bqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7pie
	mFlhFrqYEDy9FVAFcvjFQUBR8TpKvBQhVt1s5joZu8TWUR4TYeDlgiX7uIFa7yf2AZghK+I81ab
	72wCMocy/4B0qDz09uCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 09:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191037

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Include tests files in the source distribution
-bugfix Emojis made wide by Variation Selector-16

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-wcwidth_0.2.9.bb => python3-wcwidth_0.2.11.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.2.9.bb => python3-wcwidth_0.2.11.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.9.bb b/meta/recipes-devtools/python/python3-wcwidth_0.2.11.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-wcwidth_0.2.9.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.2.11.bb
index 983852d07d..c4db61e062 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.2.9.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.11.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "a675d1a4a2d24ef67096a04b85b02deeecd8e226f57b5e3a72dbb9ed99d27da8"
+SRC_URI[sha256sum] = "25eb3ecbec328cdb945f56f2a7cfe784bdf7a73a8197398c7a7c65e7fe93e9ae"
 
 inherit pypi setuptools3 ptest
 
-- 
2.34.1


