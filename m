Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A45C433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 14:30:41 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web08.11745.1642429840440960635
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 06:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=d4MFH1Z4;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642429838; i=@fujitsu.com;
	bh=O61sIqi4LkF2AZZzYBZhUyIyYBOFwEfrU8OQfr0YOEA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=d4MFH1Z4NkRLLit0djAhjdemFFIo4c4aosshwicAPuIereDLE3zeBewpI/qsOv+zp
	 KgyC9Ru8XGIKAvhZ21gSkOQEnD8s2XoGFsHgmNo1DFOCyR3C/+G0Y1fSSdRD44PZ07
	 0i4T/smOWzmx20qi7xMtpz+fM+V2OiqcV7nAhsBdj8x26ktQRUTu/dQSfMTjxPIef1
	 85hQNf3bZJ0ayhcNRjKy4kbtK3LxnTRZtV8u7youTZx5JlBKVi0iGtfLPG9Qix9/BI
	 c3upaCUx4+nRotaHkxbS+F5FcVLDaUXubEgO0ooStbL+gPjX3Sqvq8fZtXI4JSxMk9
	 ZbMHwaA+W6Ivw==
Received: from [100.115.32.207] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id E8/B7-28974-E8D75E16;
 Mon, 17 Jan 2022 14:30:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRWlGSWpSXmKPExsViZ8MxSbe39mm
  iwdK/VhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bj0aMsBfMlKybduMPWwDhLrIuRi0NI4DGj
  RMODv6wQznkmia2LpjJBOCcYJRYtW8zWxcjJwSagJjH91g2gKg4OEQE9iav/REHCzAIqEi9+9
  7CD2MICdhL7tu5gArFZBFQl2jetA2vlFXCSuPVoGiOILSGgIDHl4XtmiLigxMmZT1gg5khIHH
  zxghmiRlFi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGPlnIWmfhaR9ASPTKkbrpKLM9IyS3MTMHF1
  DAwNdQ0NTXWNjXUNzS73EKt1EvdRS3fLU4hJdI73E8mK91OJiveLK3OScFL281JJNjMCwTClW
  3LyDceLKn3qHGCU5mJREeTnDniYK8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuBVzwTKCRalpqdWp
  GXmAGMEJi3BwaMkwmtVA5TmLS5IzC3OTIdInWIM53izdskiZo63YLLt3l0g2Q4mZy44uJqZYx
  aYvN9+CEg+AJFCLHn5ealS4rxcIOMEQMZllObBLYOlgEuMslLCvIwMDAxCPAWpRbmZJajyrxj
  FORiVhHktQabwZOaVwN30CuhcJqBzV318BHJuSSJCSqqBKfarrnzDrfS1uZeFH8nd0DGbbZa2
  fJe0401Hjetreq32vndeZnbII/666A7NK83xnBwmEusqr58rZp5f9YnbyKd3pdSrK+cDc3xuf
  xVPPHN/xte0p7fKTzQvDcy6t32Ta0xcQNeKgpUbNfwXHFUSXHbr/+xaFWsvf49e1tndz6u0u2
  YfCFWZGWeV/8h1+fw+UY8/HnV3POtf3H4nu3PZzlrnN/t31/YcfLB4rrQiZ2pXwpGJplcOLBd
  sb5ssNaf0dvvtow+eLIsPO3fJrl625s6slXEz8ne4Kv3L3XG64MRz2fq18/UCfkadiLzdJbRC
  VneO8YGQz2bcMw0vpuadaWZ/Zdbq+U5yCbf2qq+b7yqxFGckGmoxFxUnAgDYSyygfAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-548.messagelabs.com!1642429837!1120!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18283 invoked from network); 17 Jan 2022 14:30:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jan 2022 14:30:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 83324100466
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 14:30:37 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 761C710044D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 14:30:37 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 14:30:15 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 5.15.1 -> 5.16
Date: Mon, 17 Jan 2022 22:30:03 +0800
Message-ID: <1642429806-13814-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 14:30:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160645

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
 ...ools-include-linux-const.h-to-fix-build-with-.patch | 10 ++++------
 .../{btrfs-tools_5.15.1.bb => btrfs-tools_5.16.bb}     |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.15.1.bb => btrfs-tools_5.16.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
index be942388a5..bd69bfc9cd 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
@@ -1,4 +1,4 @@
-From 3d19b0fb882c5e195362a9f0909c474e60070ca0 Mon Sep 17 00:00:00 2001
+From 1c9cc81ec72876a5351e3083552b9985eeb6c091 Mon Sep 17 00:00:00 2001
 From: Bruce Ashfield <bruce.ashfield@gmail.com>
 Date: Fri, 18 Jun 2021 11:10:36 -0400
 Subject: [PATCH] btrfs-progs: include linux/const.h to fix build with 5.12+
@@ -21,22 +21,20 @@ exists, and is valid to include.
 Upstream-Status: Inappropriate [mips64 + musl + libc-headers]
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+
 ---
  kerncompat.h | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/kerncompat.h b/kerncompat.h
-index df167fe6..254235bd 100644
+index 6ca1526e..15995bb4 100644
 --- a/kerncompat.h
 +++ b/kerncompat.h
 @@ -30,6 +30,7 @@
  #include <linux/types.h>
- #include <linux/kernel.h>
+ #include <linux/const.h>
  #include <stdint.h>
 +#include <linux/const.h>
  
  #include <features.h>
  
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
index 3cf216724e..4c358a248b 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;b
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            file://0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch \
            "
-SRCREV = "c0ad9bde429196db7e8710ea1abfab7a2bca2e43"
+SRCREV = "8ad326b2f28c044cb6ed9016d7c3285e23b673c8"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.25.1


