Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8952FC61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 08:57:06 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.15203.1700643424599395844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 00:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="119945951"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="119945951"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 17:57:02 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 206C0D63C5
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 17:57:00 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 58F7BE6478
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 17:56:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 63A2E88489;
	Wed, 22 Nov 2023 17:56:58 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] git: upgrade 2.42.1 -> 2.43.0
Date: Wed, 22 Nov 2023 16:56:22 +0800
Message-Id: <1700643382-9323-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.006
X-TMASE-Result: 11-32.897600-10.000000
X-TMASE-MatchedRID: WSKmDJcl90j7QMAOnss9k7RPCimzH75g717yJ8IcCtv8dMpK2wMYwnIa
	+KQSxiLwB/FMznsE8cO/BR68O365bn9eOltIlLtrmUlWTz/nShobYYPkmeC7QN0KiTeJteVBfS0
	Ip2eEHnwj/1Rbkzl1Ez7wUk0Z3FirjoczmuoPCq2UTGVAhB5EbQ==
X-TMASE-SNAP-Result: Not scanned
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 08:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191025

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
https://raw.githubusercontent.com/git/git/master/Documentation/RelNotes/2.43.0.txt

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/git/{git_2.42.1.bb => git_2.43.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.42.1.bb => git_2.43.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.42.1.bb b/meta/recipes-devtools/git/git_2.43.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.42.1.bb
rename to meta/recipes-devtools/git/git_2.43.0.bb
index 33269d39a9..f913290081 100644
--- a/meta/recipes-devtools/git/git_2.42.1.bb
+++ b/meta/recipes-devtools/git/git_2.43.0.bb
@@ -160,4 +160,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "839d75c91ddfa9f7534f7b0888e462e3ad1422bb8ef12ec35f6261cea18efe33"
+SRC_URI[tarball.sha256sum] = "ed238f5c72a014f238cc49fe7df4c6883732a3881111b381c105e2c5be77302f"
-- 
2.34.1


