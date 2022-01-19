Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5728C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 01:07:45 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.453.1642554464676308712
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 17:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YEDlFN+9;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642554462; i=@fujitsu.com;
	bh=xSDgkqPTJXm3yozSlhFNlC1SV5bbfbUZ5/s1Rk+5ny0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YEDlFN+9T9JHEzq8ab9uX/iOQOgmtOrZaDsfCt0cT+wDg0+rVCu4JIam/HJdMdgHJ
	 lAXKJwNPifr/za5dYwN5P3K/959AhZcYRFLsaVd9tPHc2VVV2c+oFB4mWrWSZG0IBA
	 FolLFibPP2AyLxX9Z9Mu6EAlet/hC/C5UqnCP+zCjcH5VppNFc9E1erMGN4GLpGzSJ
	 t0APIUCa856gMHMeVVowp9qGlBbUXmf8CF+jJveotmftZuXpNj8Phh32d57uw9JvhH
	 CkpxTfESteHdPAedG3qwRIgNUR8YB9rm1FkTWJhv361O8ZIfzJwCZvG4luPnm4P8gL
	 TbpjYWFjuYSeQ==
Received: from [100.115.37.147] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 19/90-09428-E5467E16;
 Wed, 19 Jan 2022 01:07:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRWlGSWpSXmKPExsViZ8MxSTc25Xm
  iwYZ5BhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bKtc8YC9YYVbxdNIOxgXGLThcjF4eQwGNG
  ic6565ghnPNMEt/vH4RyTjBKLLo4Gcjh5GATUJOYfusGaxcjB4eIgJ7E1X+iIGFmARWJF7972
  EFsYQFHifuXm1hAbBYBVYnHx36ygdi8Ak4SJx/cBquREFCQmPLwPTNEXFDi5MwnLBBzJCQOvn
  jBDFGjKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmM/LOQtM9C0r6AkWkVo3VSUWZ6RkluYmaOrqG
  Bga6hoamusQWQMtRLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMy5Ritfwd
  jH9X/tQ7xCjJwaQkyisa/zxRiC8pP6UyI7E4I76oNCe1+BCjDAeHkgSvTzJQTrAoNT21Ii0zB
  xgjMGkJDh4lEd5tSUBp3uKCxNzizHSI1CnGWI43a5csYuZ4Cybb7t0Fku1gcuaCg6uZOWaByf
  vth4DkAzD5uuXnDmYhlrz8vFQpcd5UkJ0CIEMzSvPgVsLSwSVGWSlhXkYGBgYhnoLUotzMElT
  5V4ziHIxKwrz7QU7jycwrgbvsFdDRTEBH9z97BnJ0SSJCSqqBKeVftYd+y3/fQxI+nCdu23z5
  e8jy0LTjgroi+qkW29ykN/e2dnsf1ZizlWGPgZJxz4yonHvWx/hNJTY8l4002pq86GTzJQNjy
  RN3Xrx6X35pU3n23UXbPwsXeJ0XNbiScOve58w03Q75Ih0/7+uzbl0+yGsQcf6IwvqU1VE9k4
  /alyz69W83/4Ep5RZrb6WHPql/tzM37Ybb6UnHChd8EWC4oWb6MXCF1sVDB3pv8j+/3S8k1DT
  Rz7nMIvTUovf//ZgtdV03eJyovfHx9xdzHq1pNzPXeIvszV7fnb5PzfjBaxMhHtNos1XvNZ2S
  bFd73Nj47YC9xwTFgzYLH1hoJx7255jw5h3z3imS34r2qCixFGckGmoxFxUnAgCctmHyggMAA
  A==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-571.messagelabs.com!1642554461!37502!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15676 invoked from network); 19 Jan 2022 01:07:41 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jan 2022 01:07:41 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 72F5B100352
	for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 01:07:41 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6527010032A
	for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 01:07:41 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 19 Jan 2022 01:07:19 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] btrfs-tools: upgrade 5.15.1 -> 5.16
Date: Wed, 19 Jan 2022 09:07:09 +0800
Message-ID: <1642554429-18119-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 01:07:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160685

0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
removed since it is included in 5.16

Add 0001-btrfs-progs-kerncompat-add-local-definition-for-alig.patch
to fix "undefined reference to `__ALIGN_KERNEL'".

Changelog:
=========
 - rescue: new subcommand clear-uuid-tree to fix failed mount due to bad uuid
   subvolume keys, caught by tree-checker
 - fi du: skip inaccessible files
 - prop: properly resolve to symlink targets
 - send, receive: fix crash after parent subvolume lookup errors
 - build:
   fix build on 5.12+ kernels due to changes in linux/kernel.h
   fix build on musl with old kernel headers
 - other:
   error handling fixes, cleanups, refactoring
   extent tree v2 preparatory work
   lots of RST documentation updates (last release with asciidoc sources),
   https://btrfs.readthedocs.io

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...compat-add-local-definition-for-alig.patch | 46 +++++++++++++++++++
 ...ude-linux-const.h-to-fix-build-with-.patch | 42 -----------------
 ...fs-tools_5.15.1.bb => btrfs-tools_5.16.bb} |  4 +-
 3 files changed, 48 insertions(+), 44 deletions(-)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kerncompat-add-local-definition-for-alig.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.15.1.bb => btrfs-tools_5.16.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kerncompat-add-local-definition-for-alig.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kerncompat-add-local-definition-for-alig.patch
new file mode 100644
index 0000000000..b0fe67922d
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kerncompat-add-local-definition-for-alig.patch
@@ -0,0 +1,46 @@
+From b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58 Mon Sep 17 00:00:00 2001
+From: David Sterba <dsterba@suse.com>
+Date: Thu, 13 Jan 2022 14:47:08 +0100
+Subject: [PATCH] btrfs-progs: kerncompat: add local definition for alignment
+ macros
+
+There's still problem left with compilation on musl and kernel < 5.11,
+because __ALIGN_KERNEL is not defined anymore:
+
+../bin/ld: kernel-shared/volumes.o: in function `create_chunk':
+volumes.c:(.text+0x17f8): undefined reference to `__ALIGN_KERNEL'
+
+Due to the entangled includes and unconditional definition of
+__ALIGN_KERNEL, we can't use #ifdef in kerncompat.h to define it
+eventually (as kerncompat.h is the first include). Instead add local
+definitions of the macros and rename them to avoid name clashes.
+
+Pull-request: #433
+
+Upstream-Status: Backport [https://github.com/kdave/btrfs-progs/commit/b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ kerncompat.h | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/kerncompat.h b/kerncompat.h
+index 6ca1526e2..f0a6e196e 100644
+--- a/kerncompat.h
++++ b/kerncompat.h
+@@ -359,7 +359,14 @@ do {					\
+ 
+ /* Alignment check */
+ #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
+-#define ALIGN(x, a)		__ALIGN_KERNEL((x), (a))
++
++/*
++ * Alignment, copied and renamed from /usr/include/linux/const.h to work around
++ * issues caused by moving the definition in 5.12
++ */
++#define __ALIGN_KERNEL__(x, a)		__ALIGN_KERNEL_MASK__(x, (typeof(x))(a) - 1)
++#define __ALIGN_KERNEL_MASK__(x, mask)	(((x) + (mask)) & ~(mask))
++#define ALIGN(x, a)		__ALIGN_KERNEL__((x), (a))
+ 
+ static inline int is_power_of_2(unsigned long n)
+ {
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
deleted file mode 100644
index be942388a5..0000000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 3d19b0fb882c5e195362a9f0909c474e60070ca0 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Fri, 18 Jun 2021 11:10:36 -0400
-Subject: [PATCH] btrfs-progs: include linux/const.h to fix build with 5.12+
- headers
-
-btrfs-tools compile fails with mips, musl and 5.12+ headers.
-
-The definition of __ALIGN_KERNEL has moved in 5.12+ kernels, so we
-add an explicit include of const.h to pickup the macro:
-
-  | make: *** [Makefile:595: mkfs.btrfs] Error 1
-  | make: *** Waiting for unfinished jobs....
-  | libbtrfs.a(volumes.o): in function `dev_extent_search_start':
-  | /usr/src/debug/btrfs-tools/5.12.1-r0/git/kernel-shared/volumes.c:464: undefined reference to `__ALIGN_KERNEL'
-  | collect2: error: ld returned 1 exit status
-
-This is safe for older kernel's as well, since the header still
-exists, and is valid to include.
-
-Upstream-Status: Inappropriate [mips64 + musl + libc-headers]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- kerncompat.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/kerncompat.h b/kerncompat.h
-index df167fe6..254235bd 100644
---- a/kerncompat.h
-+++ b/kerncompat.h
-@@ -30,6 +30,7 @@
- #include <linux/types.h>
- #include <linux/kernel.h>
- #include <stdint.h>
-+#include <linux/const.h>
- 
- #include <features.h>
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
index 3cf216724e..fa7abcf2ba 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
@@ -17,9 +17,9 @@ DEPENDS = "lzo util-linux zlib"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
-           file://0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch \
+           file://0001-btrfs-progs-kerncompat-add-local-definition-for-alig.patch \
            "
-SRCREV = "c0ad9bde429196db7e8710ea1abfab7a2bca2e43"
+SRCREV = "8ad326b2f28c044cb6ed9016d7c3285e23b673c8"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.25.1


