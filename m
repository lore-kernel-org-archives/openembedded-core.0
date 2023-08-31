Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFD3C83F14
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:33:22 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8423.1693449199598134465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="129921113"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="129921113"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:33:17 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3887DC53DD
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:33:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 62035D9497
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:33:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E317020077BBE;
	Thu, 31 Aug 2023 11:33:11 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libedit: upgrade 20221030-3.1 -> 20230828-3.1
Date: Thu, 31 Aug 2023 10:33:02 +0800
Message-Id: <1693449182-27766-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27846.004
X-TMASE-Result: 10--2.050100-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mregIHHX2L4YzcxffnPcZGm6l8
	Bh3+/TeG4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054/67wpKrIJNBcLj
	iKdfvhjcmLVgwNmWWqwGN2ThlUwL/5UcZtwNsCroURSScn+QSXt8dWDYdvqmp9zw4lzv7RUmOhz
	Oa6g8KrSo2V4ycDwAq79IdLOcuAo22vBUf5vA0QaOmWpOsLUBzYwH7QrVl41ehlsgHnK866SIlQ
	3cYaTaAUtujqsyjS8iTHowiqRZSKh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186937

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
   * src/chartype.c: Add missing stdint.h
   * all: sync with upstream source

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libedit_20221030-3.1.bb => libedit_20230828-3.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libedit/{libedit_20221030-3.1.bb => libedit_20230828-3.1.bb} (88%)

diff --git a/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb b/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb
similarity index 88%
rename from meta/recipes-devtools/libedit/libedit_20221030-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20230828-3.1.bb
index 9195258c10..1684b57d31 100644
--- a/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb
@@ -13,7 +13,7 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[sha256sum] = "f0925a5adf4b1bf116ee19766b7daa766917aec198747943b1c4edf67a4be2bb"
+SRC_URI[sha256sum] = "4ee8182b6e569290e7d1f44f0f78dac8716b35f656b76528f699c69c98814dad"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


