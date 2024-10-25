Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559B5D11719
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:05 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.5571.1729834798026024063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c5VIenXh;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834798; x=1761370798;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IkxHM7y7dVmVSb1soyhDJLF34sth8/AgQdM16NbMVw0=;
  b=c5VIenXhQPJxvLuEz0io39k0QYWWqTZBI6EJP3UuFG0rpKGDwlnQ2P/Y
   mgSi1DIfLD7jVkIvfXyIEmCJnNwkiPU6Dz6G7fCJ1kMsKY9HJUIj4On63
   8U9gscGXXaJ9Y01jML2cltWJ/v5f+0Vy9kICEdyCLBFHt0813Cps3PnpH
   lmH6t2E64QXs6onKePVnjpCMWYHkGLNCYxD27Zv8uweItkodI+LYW889f
   0XNx1Ro8H0B4tb8UKBcU9riOsbn+8NKn1fLnw5k55kXIFZ5uEZSWTSbf7
   xhmgBHywvk4s6uTUu7JDeaJqAe9qzytJNLpxTaktmLpvgH/k/U5yyBxER
   A==;
X-CSE-ConnectionGUID: UTeDgbyPRNibrO49yNa+jQ==
X-CSE-MsgGUID: /OOEIlB3RQy6KBvsRQq5IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="177172246"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="177172246"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:55 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F34DC68E1
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9BF98D3F1A
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B15B20071A1D
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 19A6C1A000B;
	Fri, 25 Oct 2024 13:39:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/22] bash: upgrade 5.2.32 -> 5.2.37
Date: Fri, 25 Oct 2024 13:39:09 +0800
Message-Id: <1729834769-4717-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10-0.723100-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/ySrLqyE6Ur/jkdS3kPlaZyXfUZT83lbkEJYv
	gWqjMEzaNYCBzzxsUnvZ5eN1eJMdpVpCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl0fyM5VfgjG209D
	6Rw2zIrOoWUS15lEKWHS6qfMYqUrO9GvnaLY1JSyC+Y2uxPjocncF/0kiqyh4S7NxD4SLUR3Edj
	jlzrOuN31Af3KHvRNM9CYQMNqb0XqR9GF2J2xqMxRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs7aIj
	xV2RHnk7IoztsNNm7ScXQiY3tXA1OKPCqvhz30Xlg+peJiS0QYik4iNQ/47Qio1S+O9xTU5Su+4
	SPap1W/d4zBEKRP1qogeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206316

From: Wang Mingyu <wangmy@fujitsu.com>

0001-fix-c99.patch
refreshed for 5.2.37

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


