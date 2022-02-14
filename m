Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D96C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 23:55:18 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.3293.1644882917626722649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 15:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=h/CWAiAQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644882915; i=@fujitsu.com;
	bh=ROJlV8RhaC2saGpl6x1ASBFfAvoOe3QT2xzdDonugI4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=h/CWAiAQSGglnKgsxR4h65ac3AbSGPYFcTm8SZPGKKLk6aIKLKvDNEJSZvQRUxf1w
	 +DDz2iNGV41evV8XpgVKx0xVwwEEel4NlY/sZC4K6KcQNpNOebmnloOzqZA8aQE+Nz
	 YvbvFD1rfY+Q0+Ca//5kwiWlflgWlBay0X4JPQTFytg1TvUvr2Dl9CHBUwkE370RVR
	 qtdRv0QqRc694h1mJ5NGxECUckMuA0rOjatipwiMYrvUUGgE13LOAaKhFmF6KRAyLe
	 MhGtBDsFgQLfhsJae+OjS3n8YKkp5szKgm4Q/PAIFxPAufXpxVwtdAfLY2/uskhkdt
	 jbN1+FqHig+EQ==
Received: from [100.115.7.136] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 3D/9A-00700-3EBEA026;
 Mon, 14 Feb 2022 23:55:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8ORqPv4NVe
  SwdaLrBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a0Vy+YCubrV5xp387YwPhXs4uRi0NI4DGj
  xLuJT9ghnPNMEi82/WWBcE4wSpzbeZG5i5GTg01ATWL6rRusXYwcHCICehJX/4mChJkFVCRe/
  O5hB7GFBawkpjavYgSxWQRUJVb+nM0GYvMKOEocPTkHLC4hoCAx5eF7sJGcAk4SbybMAosLAd
  X8utQFVS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukJg1q40JwlaTuHpuE/MERsFZSNpnIWl
  fwMi0itEqqSgzPaMkNzEzR9fQwEDX0NBU1wTIMtRLrNJN1Est1S1PLS7RBXLLi/VSi4v1iitz
  k3NS9PJSSzYxAoM4pZgldQdjX99PvUOMkhxMSqK8MXu4koT4kvJTKjMSizPii0pzUosPMcpwc
  ChJ8Eo9AsoJFqWmp1akZeYAIwomLcHBoyTCe+MBUJq3uCAxtzgzHSJ1itGS4+qVK3uZOW6AyU
  1rbuxlFmLJy89LlRLn9b8N1CAA0pBRmgc3Dhb1lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCo
  J85q9AprCk5lXArf1FdBBTEAHKTaCHVSSiJCSamBac/0Or8AOy+AIvm3PWL5VBzD4tf10/8YR
  sMJxaX/Yg/wt1q9eCu/d2ll7YE6UdOoOyVkckcItN97me0kX3bm5Zr6/b7xGjN4xc+b1e9lLH
  jxlXcG5Llo77dv3G1e4zi9cbNXOkNT21fwllzubtYCTwWrWNU7f903qtxe3nzn7bOF/nfmPC4
  5JvFjIpjepimWb3Lob3/c2Rbh+fXLi6g0TRov3CVnWrFvrwvw2nP50XuaE6p678eaTM81t2PZ
  N/ySbuOHr3Ycr4+9tenGQiYu9udEjoML2+6J6rlmPTd9cfvogIDDj/t0Kk/d/5/B9ND2p01Fq
  zGH68sXZ5kO8d84Urjj+xryWS8knPMh08pQYJZbijERDLeai4kQAX6kWeXUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-591.messagelabs.com!1644882914!46046!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5068 invoked from network); 14 Feb 2022 23:55:15 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Feb 2022 23:55:15 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 994C1100197
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 23:55:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 88BA2100190
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 23:55:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 14 Feb 2022 23:54:55 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] rng-tools: upgrade 6.14 -> 6.15
Date: Tue, 15 Feb 2022 07:54:36 +0800
Message-ID: <1644882876-4535-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644882876-4535-1-git-send-email-wangmy@fujitsu.com>
References: <1644882876-4535-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 23:55:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161738

0001-Adding-ability-to-detect-non-posix-extensions-for-pt.patch
0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch
removed since they're included in 6.15.

Changelog:
=========
Adjust rngtests for better behavior in travis
fix use of non-posix setaffinity call to allow building on strict posix (musl) systems
Add armv6l to list of detected arches for pkcs11
misc fixes to allow building on libc-musl
fix a deadlock in jitter shutdown sequence
minor warning fixups (unused variables)
improve cpu detection code
improve jitter cpu monopolization on small/single cpu systems

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...o-detect-non-posix-extensions-for-pt.patch | 41 ----------------
 ...-either-pthread-affinity-set-methods.patch | 47 -------------------
 .../{rng-tools_6.14.bb => rng-tools_6.15.bb}  |  4 +-
 3 files changed, 1 insertion(+), 91 deletions(-)
 delete mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pt.patch
 delete mode 100644 meta/recipes-support/rng-tools/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch
 rename meta/recipes-support/rng-tools/{rng-tools_6.14.bb => rng-tools_6.15.bb} (90%)

diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pt.patch b/meta/recipes-support/rng-tools/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pt.patch
deleted file mode 100644
index 89edc4c403..0000000000
--- a/meta/recipes-support/rng-tools/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pt.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 66e6adc138eef1367d7492fb79ae4da84ed62934 Mon Sep 17 00:00:00 2001
-From: Neil Horman <nhorman@gmail.com>
-Date: Thu, 15 Jul 2021 08:43:01 -0400
-Subject: [PATCH] Adding ability to detect non-posix extensions for pthreads
-
-Theres a desire to build rngd with musl, which doesn't have all the gnu
-extensions (but it has some).  So test for those.  Note, this requires
-the addition of the USE_EXTENSIONS macro to enable -d_GNU_SOURCE
-
-Upstream-Status: Backport
-Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- configure.ac | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 9df633d..d0c2179 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -25,6 +25,7 @@ AC_CANONICAL_TARGET dnl required for broken AX_PTHREAD
- AM_INIT_AUTOMAKE([foreign])
- AC_CONFIG_HEADERS([rng-tools-config.h])
- AC_CONFIG_MACRO_DIRS([m4])
-+AC_USE_SYSTEM_EXTENSIONS
- 
- dnl Parse options
- 
-@@ -100,6 +101,12 @@ AS_IF(
- 	], [AC_MSG_NOTICE([Disabling JITTER entropy source])]
- )
- 
-+AC_CHECK_DECL(pthread_attr_setaffinity_np,
-+		[AC_DEFINE([HAVE_PTHREAD_ATTR_SETAFFINITY], 1,[Set ATTR_SETAFFINITY])],
-+		[ AC_CHECK_DECL(pthread_setaffinity_np,
-+		   [AC_DEFINE([HAVE_PTHREAD_SETAFFINITY],1, [Set PTHREAD_SETAFFINITY])], [ AC_MSG_ERROR([Neither pthread_setaffinity_np nor pthread_attr_setaffinity_np found])],[[#include <pthread.h>]])
-+		], [[#include <pthread.h>]])
-+
- AS_IF(
- 	[ test "x$with_nistbeacon" != "xno"],
- 	[
diff --git a/meta/recipes-support/rng-tools/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch b/meta/recipes-support/rng-tools/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch
deleted file mode 100644
index f7470d04bf..0000000000
--- a/meta/recipes-support/rng-tools/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From e4909f329245db52415102e96fc7c99ca1445d05 Mon Sep 17 00:00:00 2001
-From: Neil Horman <nhorman@gmail.com>
-Date: Thu, 15 Jul 2021 08:48:10 -0400
-Subject: [PATCH] Allow for use of either pthread affinity set methods
-
-musl has support for pthread_setaffinity_np, but not
-pthread_attr_setaffinity_np.  so check for hte existence of either
-function in configure, and use the appropriate one.
-
-Upstream-Status: Backport
-Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- rngd_jitter.c | 15 ++++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/rngd_jitter.c b/rngd_jitter.c
-index ea29436..5c7e09e 100644
---- a/rngd_jitter.c
-+++ b/rngd_jitter.c
-@@ -67,12 +67,25 @@ static int rngd_notime_start(void *ctx,
- 	for(i=i-1;i>=0;i--) {
- 		CPU_SET(i,cpus);
- 	}
--	pthread_attr_setaffinity_np(&thread_ctx->notime_pthread_attr, cpusize, cpus);
- 
-+        /*
-+	 * Note that only one of:
-+	 * HAVE_PTHREAD_ATTR_SETAFFINITY
-+	 * and
-+	 * HAVE_PTHREAD_SETAFFINITY
-+	 * Will ever be set, as per the configure.ac logic
-+	 */
-+#ifdef HAVE_PTHREAD_ATTR_SETAFFINITY
-+	pthread_attr_setaffinity_np(&thread_ctx->notime_pthread_attr, cpusize, cpus);
-+#endif
- 	ret = -pthread_create(&thread_ctx->notime_thread_id,
- 				&thread_ctx->notime_pthread_attr,
- 				start_routine, arg);
- 
-+#ifdef HAVE_PTHREAD_SETAFFINITY
-+	pthread_setaffinity_np(&thread_ctx->notime_thread_id, cpusize, cpus);
-+#endif
-+
- 	CPU_FREE(cpus);
- 	return ret;
- }
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.14.bb b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
similarity index 90%
rename from meta/recipes-support/rng-tools/rng-tools_6.14.bb
rename to meta/recipes-support/rng-tools/rng-tools_6.15.bb
index 222d7cc630..c4d616e29b 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.14.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
@@ -12,10 +12,8 @@ SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
            file://init \
            file://default \
            file://rngd.service \
-           file://0001-Adding-ability-to-detect-non-posix-extensions-for-pt.patch \
-           file://0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch \
            "
-SRCREV = "c16176d3800b91f4d016b66733b384493b06f294"
+SRCREV = "381f69828b782afda574f259c1b7549f48f9bb77"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


