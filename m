Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F408C3DA41
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:12:47 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.4878.1688699562824823844
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="103044359"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="103044359"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:12:41 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 776B5C53C0
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jul 2023 12:12:38 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A276E6A3CB1
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jul 2023 12:12:37 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2CB8C41050;
	Fri,  7 Jul 2023 12:12:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxcrypt: upgrade 4.4.35 -> 4.4.36
Date: Fri,  7 Jul 2023 11:12:30 +0800
Message-Id: <1688699552-2480-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699552-2480-1-git-send-email-wangmy@fujitsu.com>
References: <1688699552-2480-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27736.002
X-TMASE-Result: 10--2.900900-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv5q5JB+ib2QdN3
	A9FjogGZ7wJL2+8U4LHGKIf6hBf7VVromRa6X9R8P0HVIeixJdBv8DQO96Tvf8C5DTEMxpeQ32S
	61JcPB8c3lq3YEgY6JjiMwfFTaQrQOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRMLky
	6aORxHNY6HM5rqDwqtwyVEmzQd5+umr1SCsDMpjUV/R8pRvQ+iQMEqPm+ZBPL8r9ageJd73xpyz
	of6bG7csyAniTb4PB4Nzrc6Rl0oKB+Y617nK6AkHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 03:12:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183992

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
* Fix left over bits failing with Perl v5.38.0 (issue #173).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libxcrypt-compat_4.4.35.bb => libxcrypt-compat_4.4.36.bb}  | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 .../libxcrypt/{libxcrypt_4.4.35.bb => libxcrypt_4.4.36.bb}      | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.35.bb => libxcrypt-compat_4.4.36.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.35.bb => libxcrypt_4.4.36.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.35.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.35.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index e70e8859b1..ba93d91aef 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
-SRCREV = "321222c91c4060362b1085b3ca7c29867812ac0a"
+SRCREV = "f531a36aa916a22ef2ce7d270ba381e264250cbf"
 SRCBRANCH ?= "master"
 
 SRC_URI += "file://fix_cflags_handling.patch"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.35.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.35.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb
-- 
2.34.1


