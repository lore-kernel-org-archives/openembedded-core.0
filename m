Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DEFCA551C
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:27:43 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.7583.1694597260986033009
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="131963686"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="131963686"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:27:38 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0636DD3EA9
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:27:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 499ADD5049
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:27:35 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BDEA0200501AE;
	Wed, 13 Sep 2023 18:27:34 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] alsa-ucm-conf: upgrade 1.2.9 -> 1.2.10
Date: Wed, 13 Sep 2023 17:27:30 +0800
Message-Id: <1694597250-21120-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27872.006
X-TMASE-Result: 10--1.687700-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuBAXl9LkPp6atY
	dhxi8BtwvO1JeTfAZ/2zlegGut8zU8/ApvhSFXKjaU7ee17qjHMXivwflisSrJyka59saICoT6N
	vHSASoamhxWAM2J2vYEm2yRLiv9110YRMm/X9bI4/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bm0xeKYZaxlkBhQWw3lZ+IVx9EmrVy1N/CsIuzCLc2mN5MBc083IM4QpAuVs05shpUsuQ
	6eM1wAKsX24ahsS5PuAMuqetGVethtouMvD9sV53QfwsVk0UbvqwGfCk7KUs/+U78GCIn+0xwfS
	cwxnVoRjpVnwVtB/920qCu9N3pP6/EFKIUAv3wTsVjuipzAQcDnmCS9tk0OyKS1AIp2hG9oYcfa
	a3czEm4geppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187556

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
    Fix symver build error on non-ELF platforms
    doxygen: include docs for shmarea functions
    doxygen: silence warning from asoundlib.h
    doxygen: global: silence 'not documented' warnings
    doxygen: Fix missing group end markers
    configure: add AC_SYS_LARGEFILE
    seq: Add UMP 1.1 features
    seq: Add UMP support
    ump: Add helpers to parse / set UMP packet data
    control: Add UMP Endpoint and Block info query support
    control: Add UMP device query support
    ump: Add initial support
    include: fix SND_DLSYM_BUILD_VERSION() for static build

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../alsa/{alsa-ucm-conf_1.2.9.bb => alsa-ucm-conf_1.2.10.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.9.bb => alsa-ucm-conf_1.2.10.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.9.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.9.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb
index 073e3b0900..f4fd284db8 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.9.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "374f6833bfd77d0a4675e4aa2bfb79defe850e5a46a5d4542a45962f4b9e272a"
+SRC_URI[sha256sum] = "9c21e3f01ff00baa758df17e867cd36e24ebb41a6bec49737e99105e16f2ae97"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.34.1


