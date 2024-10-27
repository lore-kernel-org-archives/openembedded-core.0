Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3413CD10C0B
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 03:09:20 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.23692.1729998553870534859
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Oct 2024 20:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kuVkUlTp;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729998554; x=1761534554;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eM5Dp2FclLdwulZUQbqvicNXQMFhsxuIYhF115sfHqs=;
  b=kuVkUlTpr+DLsWm+P1vat2HlN6CLQDOQY8jwC4wd92nIjqZe4cQ1vcCE
   bOF6EoUbzogRg2It41TxDcUuUA3S/ReTDZxxZjZvfD2Wko8VK26PtrxxW
   u5HVytt5b7OvcRBU1mW+etOVrg6d1XUZJ8Rp2LgUm96tHlXpfJU64kUkg
   fvq6xE6fp1ccd40MVLoV6OoW72C39MgrowOKMDy+zb5rTuEhFeQFnmtnJ
   dYuHM8kCfm982hyO5y+QD3LJV/gZCuKmNRKzLQ27IETEuwnHSwmTk5th3
   6arbycwYxFMTkvJRWo/QXTXQ5ygw+aizQ392q/o97l4CNgzR85IF9wOlW
   g==;
X-CSE-ConnectionGUID: pdoHXaVARs+3c9k+bORV4w==
X-CSE-MsgGUID: Mm7ldePRSFuUYDSSN3ghiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="166465068"
X-IronPort-AV: E=Sophos;i="6.11,236,1725289200"; 
   d="scan'208";a="166465068"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 12:09:11 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 27779CD6DC
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 12:09:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 63B92D50BE
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 12:09:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EFF6820071A0D
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 12:09:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A03311A000B;
	Sun, 27 Oct 2024 11:09:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] bash: upgrade 5.2.32 -> 5.2.37
Date: Sun, 27 Oct 2024 11:09:02 +0800
Message-Id: <1729998542-2255-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729998542-2255-1-git-send-email-wangmy@fujitsu.com>
References: <1729998542-2255-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28756.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28756.004
X-TMASE-Result: 10-1.450300-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/ySrLqyE6Ur/jkdS3kPlaZyVkDFfw8NSG/Nnf
	JrUSEbFD/9FzCWH6Yv2mKaU7uZLa5se3wV6A2hch8t4fUUGeErTVy4hHC3/gyMC5DTEMxpeQB1e
	gkZdCJXdsXqCizdUSQ3UXZQnjQe7mbBfEWzUJPFcapIb9znReAxtuGFXrmRpjj2iyfwmt0k82rz
	KWrdiykit8mZ6URHtcB+TUsqM1471YIe4vpumUqJ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMOQbFBpqxm0bppNbuo59SfW3L7/L4ktzA6bvF+h68tUh9BoF3P6cSZasJosMOv8GSOGki2
	VqT6VbkopeqYTen9gW9fxIDGuk/dgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 03:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206389

From: Wang Mingyu <wangmy@fujitsu.com>

0001-fix-c99.patch
removed since it's included in 5.2.37

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bash/bash/0001-fix-c99.patch              | 41 -------------------
 .../bash/{bash_5.2.32.bb => bash_5.2.37.bb}   |  3 +-
 2 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 meta/recipes-extended/bash/bash/0001-fix-c99.patch
 rename meta/recipes-extended/bash/{bash_5.2.32.bb => bash_5.2.37.bb} (87%)

diff --git a/meta/recipes-extended/bash/bash/0001-fix-c99.patch b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
deleted file mode 100644
index abd83d09af..0000000000
--- a/meta/recipes-extended/bash/bash/0001-fix-c99.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From e8ec2d75a52bdc93c83a679a71a68f4033033b8b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 19 Jun 2024 12:57:39 +0000
-Subject: [PATCH] Fix C99 problems
-
-Backport some fixes from upstream to fix configure checks that fail with GCC 14.1.
-
-Upstream-Status: Backport [devel branch]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- aclocal.m4   | 3 +++
- configure.ac | 2 +-
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/aclocal.m4 b/aclocal.m4
-index cc97bd4..7423b99 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -238,6 +238,9 @@ AC_CACHE_VAL(bash_cv_dup2_broken,
- #include <sys/types.h>
- #include <fcntl.h>
- #include <stdlib.h>
-+#ifdef HAVE_UNISTD_H
-+# include <unistd.h>
-+#endif /* HAVE_UNISTD_H */
- int
- main()
- {
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
similarity index 87%
rename from meta/recipes-extended/bash/bash_5.2.32.bb
rename to meta/recipes-extended/bash/bash_5.2.37.bb
index b159c0232f..3dcaefa374 100644
--- a/meta/recipes-extended/bash/bash_5.2.32.bb
+++ b/meta/recipes-extended/bash/bash_5.2.37.bb
@@ -14,10 +14,9 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://use_aclocal.patch \
            file://0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch \
            file://fix-filesubst-errexit.patch \
-           file://0001-fix-c99.patch \
            "
 
-SRC_URI[tarball.sha256sum] = "d3ef80d2b67d8cbbe4d3265c63a72c46f9b278ead6e0e06d61801b58f23f50b5"
+SRC_URI[tarball.sha256sum] = "9599b22ecd1d5787ad7d3b7bf0c59f312b3396d1e281175dd1f8a4014da621ff"
 
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-- 
2.34.1


