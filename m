Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651C5C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 05:19:07 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.4051.1646371145551400454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 21:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VdBRRBwh;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646371143; i=@fujitsu.com;
	bh=4uBQj01MsgT8N9cuOW74J7kUDM3+x1ewZ79qNa6fD6o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VdBRRBwh2eIDDkMGG5/6cSz9VE/SAA7ODXFqXIBDVL98ohOvGJtFmjJrVgRD4t3FL
	 XUxDpiU2jCeqHk38twBQ53Qf7D/cUPVQnXceKQo29hI6R7EqnWSWWwlvJ7I1Xk49Dy
	 psMgomhPgQLkosOFTSOT4mfFUeMQc1mMHrn0IuzOwBrT8VHfiuvcG89FfSpKWqNgR8
	 CrDsZki8TSxwHKrv4j7uyEMq1mxoWTY9ufw/a+VFO4/EgktjkVZ/F8g0Gk7JEMqR+R
	 xtZZS0PVewX3CxQtd/gPS7KGhXax0SlwlvpxQslmMp+3DKJobIQsf4jTz1vvOJOi5x
	 gK/PVVVdXBm3Q==
Received: from [100.115.68.192] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 BB/EE-13301-741A1226; Fri, 04 Mar 2022 05:19:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqOu+UDH
  J4HUfq8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnFs823mgqPyFcu3NDE1ML6R7mLk4hASeMwo
  seP0HhYI5zyTRPONK0AOJ5BznFHixXcfEJtNQE1i+q0brF2MHBwiAnoSV/+JgoSZBVQkXvzuY
  QexhQXsJFpbf7KC2CxA8Z0fT4LZvAJOEtM3fQWzJQQUJKY8fM8MEReUODnzCQvEHAmJgy9eME
  PUKErMvtzMAmFXSMya1cYEYatJXD23iXkCI/8sJO2zkLQvYGRaxWibVJSZnlGSm5iZo2toYKB
  raGiqa2YBpPQSq3QT9VJLdZNT80qKEoGyeonlxXqpxcV6xZW5yTkpenmpJZsYgYGZUuzCvYPx
  Tt9PvUOMkhxMSqK8XByKSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeDMXAOUEi1LTUyvSMnOAU
  QKTluDgURLhvT8dKM1bXJCYW5yZDpE6xWjMsXPL5b3MHFevXNnLLMSSl5+XKiXOqwAySQCkNK
  M0D24QLHovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmfTAfaApPZl4J3L5XQKcwAZ2y1UM
  O5JSSRISUVAOTZUFxUrb7d6EvctvkZjKvWR+75FhaS5L2DOsLYavkt6/+l3n/TF75vz+xCZG7
  FndmXd276vhbp+JLb285hoVdXVX96sMphuDQU46vFqyr2bnj3qu8mTLzjRkquz0XPN11T6wwO
  Pmw1vT+qZ2pi5p7JpbJXzZPvPsh0PVGkGu9Z+LKI4n73jhV8P+WvhjiGBTzrjHsIjv/hTevir
  x27SlV2nnE+9Hjk2rHrpsGzfOav1v5z/tetS0XJr185CG5PG9GezB3kYNt8SORfMVdO1bnZNa
  FfZh3NOaTAdPMTxmTbP8Wr7ncnX9v06GG39FZt1zq02Rio95t7hPzr6l74RXwUMHDJMnc+PoT
  04ymSVznlViKMxINtZiLihMB6XB7t1kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-528.messagelabs.com!1646371142!33412!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23438 invoked from network); 4 Mar 2022 05:19:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Mar 2022 05:19:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 289B11001A2
	for <openembedded-core@lists.openembedded.org>;
 Fri,  4 Mar 2022 05:19:02 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D705C1001A4
	for <openembedded-core@lists.openembedded.org>;
 Fri,  4 Mar 2022 05:19:01 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Fri, 4 Mar 2022 05:18:52 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 5.16 -> 5.16.2
Date: Fri, 4 Mar 2022 13:18:43 +0800
Message-ID: <1646371123-46782-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 05:19:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162708

0001-btrfs-progs-kerncompat-add-local-definition-for-alig.patch
removed since it's included in 5.16.2

Changelog:
=========
mkfs: fix detection of profile type for zoned mode when creating DUP
build:
 - add missing stub for zoned mode helper when zoned mode not enabled
 - fix 64bit types on MIPS and PowerPC
 - improved zoned mode support autodetection, for systems with existing blkzone.h
   header but missing support for zone capacity
other: doc updates, test updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...compat-add-local-definition-for-alig.patch | 46 -------------------
 ...fs-tools_5.16.bb => btrfs-tools_5.16.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kerncompat-add-local-definition-for-alig.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.16.bb => btrfs-tools_5.16.2.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kerncompat-add-local-definition-for-alig.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kerncompat-add-local-definition-for-alig.patch
deleted file mode 100644
index b0fe67922d..0000000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kerncompat-add-local-definition-for-alig.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58 Mon Sep 17 00:00:00 2001
-From: David Sterba <dsterba@suse.com>
-Date: Thu, 13 Jan 2022 14:47:08 +0100
-Subject: [PATCH] btrfs-progs: kerncompat: add local definition for alignment
- macros
-
-There's still problem left with compilation on musl and kernel < 5.11,
-because __ALIGN_KERNEL is not defined anymore:
-
-../bin/ld: kernel-shared/volumes.o: in function `create_chunk':
-volumes.c:(.text+0x17f8): undefined reference to `__ALIGN_KERNEL'
-
-Due to the entangled includes and unconditional definition of
-__ALIGN_KERNEL, we can't use #ifdef in kerncompat.h to define it
-eventually (as kerncompat.h is the first include). Instead add local
-definitions of the macros and rename them to avoid name clashes.
-
-Pull-request: #433
-
-Upstream-Status: Backport [https://github.com/kdave/btrfs-progs/commit/b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- kerncompat.h | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/kerncompat.h b/kerncompat.h
-index 6ca1526e2..f0a6e196e 100644
---- a/kerncompat.h
-+++ b/kerncompat.h
-@@ -359,7 +359,14 @@ do {					\
- 
- /* Alignment check */
- #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
--#define ALIGN(x, a)		__ALIGN_KERNEL((x), (a))
-+
-+/*
-+ * Alignment, copied and renamed from /usr/include/linux/const.h to work around
-+ * issues caused by moving the definition in 5.12
-+ */
-+#define __ALIGN_KERNEL__(x, a)		__ALIGN_KERNEL_MASK__(x, (typeof(x))(a) - 1)
-+#define __ALIGN_KERNEL_MASK__(x, mask)	(((x) + (mask)) & ~(mask))
-+#define ALIGN(x, a)		__ALIGN_KERNEL__((x), (a))
- 
- static inline int is_power_of_2(unsigned long n)
- {
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb
index e5b2057f26..4ab486c465 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb
@@ -17,9 +17,8 @@ DEPENDS = "lzo util-linux zlib"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
-           file://0001-btrfs-progs-kerncompat-add-local-definition-for-alig.patch \
            "
-SRCREV = "8ad326b2f28c044cb6ed9016d7c3285e23b673c8"
+SRCREV = "31458c9c81935abbed010221261897273a98d2c1"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.25.1


