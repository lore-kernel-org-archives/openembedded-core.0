Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE67CF0447
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:36 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.9170.1728452975624109127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=d65Ez2O4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452975; x=1759988975;
  h=from:to:cc:subject:date:message-id;
  bh=6BAqD7K9WZPZF295M7O2rqiodhKTza1wGSlJj2QwL70=;
  b=d65Ez2O4WOLbjpYAGxdWPyXHfRGtZsJ0aPFqww8xzUMwgJNHulrV9gEd
   j+H0Ms+hB2KhAG7aRQY469TWofs/vzbOaHjQ15VPEt5eoY2b42GDopvG6
   LV7Rf5uxH4a8yW8dELz95THu/oehmu9QLXFPiNuZ9cmOlieb8+D8+lnT/
   DSTValxgVnuUcGXOTU/6aA6ipZIulhnbRJKvu0lvNlJ93kYriArxpoDzh
   abuMlarB7N0JJV4UYZ6jINi9TKS6BBi5uDXg1ZZY1VxifEixBQHdtfzul
   Z3SudU7bXZfP9ep6SMWgcfjOpWr5xFJm9ygxYj3whmbEdYZmCsA4szo4E
   g==;
X-CSE-ConnectionGUID: 75ZCcrrHSR20mv98hTNf7Q==
X-CSE-MsgGUID: lEo0VAPvSO6lllc9g7+Cog==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="176428849"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="176428849"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:32 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AE7F7C3F84
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id F026ACF7F8
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 88FA340B62
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3597D1A000A;
	Wed,  9 Oct 2024 13:49:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/26] bash: upgrade 5.2.32 -> 5.2.37
Date: Wed,  9 Oct 2024 13:48:50 +0800
Message-Id: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10--5.877700-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/ySrLqyE6Ur/jnJdsOLB4zv79wRnyxuPjhA6k
	gsLh6ViTZPpiTKHn6DBs77CpkuQXQjC6T50wFlh41l+BjLM8lsqb+3jd3k4Rfi2TFpRWWjcxZa3
	gqUxPtqqICVBnYSVLBTtuVglUWXzviCsqewnUZGA/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bvheRyvm5CI7dLqp8xipSs70a+dotjUlLIL5ja7E+OhygoxTlWqmGpXCd78zM7qHeKlwB
	bEvrazy4vM1YF6AJbbCCfuIMF6xLSAHAopEd76vtbig/ooSKfwhRc2QJ9rAhgEuY/IjAnWV+36d
	U2wWNJ3zySe11AGRnw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205312

From: Wang Mingyu <wangmy@fujitsu.com>

0001-fix-c99.patch
refreshed for 5.2.37

Changelog:
===========
- fix issue where comparing quoted and unquoted words to be completed results
  in readline not displaying possible matches
- fix for reading partial invalid multibyte characters
- fix compilation on systems that provide select or pselect but not both
- fix for parsing compound assignment while expanding alias
- fix autoconf test for broken strtold

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bash/bash/0001-fix-c99.patch              | 20 +++----------------
 .../bash/{bash_5.2.32.bb => bash_5.2.37.bb}   |  2 +-
 2 files changed, 4 insertions(+), 18 deletions(-)
 rename meta/recipes-extended/bash/{bash_5.2.32.bb => bash_5.2.37.bb} (90%)

diff --git a/meta/recipes-extended/bash/bash/0001-fix-c99.patch b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
index abd83d09af..e0f1a51433 100644
--- a/meta/recipes-extended/bash/bash/0001-fix-c99.patch
+++ b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
@@ -1,4 +1,4 @@
-From e8ec2d75a52bdc93c83a679a71a68f4033033b8b Mon Sep 17 00:00:00 2001
+From 60a075c6e3258df9799d067e360e4c63e24e229b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 19 Jun 2024 12:57:39 +0000
 Subject: [PATCH] Fix C99 problems
@@ -8,9 +8,8 @@ Backport some fixes from upstream to fix configure checks that fail with GCC 14.
 Upstream-Status: Backport [devel branch]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
- aclocal.m4   | 3 +++
- configure.ac | 2 +-
- 2 files changed, 4 insertions(+), 1 deletion(-)
+ aclocal.m4 | 3 +++
+ 1 file changed, 3 insertions(+)
 
 diff --git a/aclocal.m4 b/aclocal.m4
 index cc97bd4..7423b99 100644
@@ -26,16 +25,3 @@ index cc97bd4..7423b99 100644
  int
  main()
  {
-diff --git a/configure.ac b/configure.ac
-index a3b5bd7..2a38c6b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -842,7 +842,7 @@ AC_CHECK_DECLS([strtold], [
- 	[AC_COMPILE_IFELSE(
- 		[AC_LANG_PROGRAM(
- 		[[#include <stdlib.h>]],
--		[[long double r; char *foo, bar; r = strtold(foo, &bar);]]
-+		[[long double r; char *foo, *bar; r = strtold(foo, &bar);]]
- 	)],
- 	[bash_cv_strtold_broken=no],[bash_cv_strtold_broken=yes])
-         ]
diff --git a/meta/recipes-extended/bash/bash_5.2.32.bb b/meta/recipes-extended/bash/bash_5.2.37.bb
similarity index 90%
rename from meta/recipes-extended/bash/bash_5.2.32.bb
rename to meta/recipes-extended/bash/bash_5.2.37.bb
index b159c0232f..87e0aa24ec 100644
--- a/meta/recipes-extended/bash/bash_5.2.32.bb
+++ b/meta/recipes-extended/bash/bash_5.2.37.bb
@@ -17,7 +17,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://0001-fix-c99.patch \
            "
 
-SRC_URI[tarball.sha256sum] = "d3ef80d2b67d8cbbe4d3265c63a72c46f9b278ead6e0e06d61801b58f23f50b5"
+SRC_URI[tarball.sha256sum] = "9599b22ecd1d5787ad7d3b7bf0c59f312b3396d1e281175dd1f8a4014da621ff"
 
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-- 
2.34.1


