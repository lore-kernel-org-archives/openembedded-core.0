Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F88C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 08:46:51 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.8715.1661330803061958480
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 01:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AZ0G0jWz;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661330801; i=@fujitsu.com;
	bh=dj0bTzuzkWCpdfACMibFKKvQxK1rVXAkQJUZPpu8eh4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=AZ0G0jWziO/sWresb9YZHgFsg6V41FiYqqca2gyL14etd+VGNRTVV/ntyzO8z4amW
	 u7tMtCEWEP3QqTg68Sk304nITEtxJMwXRFwf/Ngis/1fm9obSrqMzwJmpo/Xs59fYC
	 sE4uw2NzrmCXazMLOBGn1RrwPPaVLSyVxpy9kQUrZHVNPNyYvxo0YYP7iZ46rRCHLr
	 2NRBEUnhcAmXMUuZp/zNqMd/QJTLIoeWHK9MBknorRDPEktMPXl9yYy58qW5eYKrmX
	 QSsOaa41RCem0RZTgAMRk+b6+OoGxebIjvZoLBHsEBQT2GO3NsQo43NmTI2yns8S2U
	 +iqJ0ufN0P8jg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRWlGSWpSXmKPExsViZ8ORqFvwlDX
  ZoOOzqsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnG29ytLwVyZitPt11kbGO9KdDFycQgJPGaU
  OLJ9GVsXIyeQc51JoveZKERiL6PErz8f2UESbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHid
  w9YibCAncTl18vAbBYBVYmrz54ygti8Ak4Sixf/BpsvIaAgMeXhe2YQm1PAWWLboSPsEHudJD
  raelgg6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNiVEntm9TNB2GoSV89tYp7AKDgLSfssJO0
  LGJlWMdomFWWmZ5TkJmbm6BoaGOgaGppCaEtzvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK
  3OScFL281JJNjMBATilOObqD8di+X3qHGCU5mJREeW+eYU0W4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMEr8AQoJ1iUmp5akZaZA4wqmLQEB4+SCK8ESCtvcUFibnFmOkTqFKM9x9TZ//YzcywHkz
  O/th1g5ti0r+sAsxBLXn5eqpQ4b+ojoDYBkLaM0jy4obAkcIlRVkqYl5GBgUGIpyC1KDezBFX
  +FaM4B6OSMO+WB0BTeDLzSuB2vwI6iwnorKDdzCBnlSQipKQamLaeuhraF2qw7KGyy5a8bwdk
  ebrPvKsXmW1qdPtyQvLCvak93p+NVTr+1M+6sO6Ph2VSnYr3pZc/JM2ThR5b9kY6qfDUnc66f
  k1s3/WAG6JPVwc6sW5hc/xq5KC0++bll1N3hP9wXKWuz5GSf7OkXmSlF2+0Ze66dxtfeO5jLF
  te8GO+6IcKlcbsZ4/+pV1Zm7Z2cnqm8vn7x41fNp/dd9/iXuEjiTrTKT9fvhITLru6RyBo2uY
  FweUf3QMbb3OKCD0q31Nxm/+b6rw9iQIb1OffmxdVqp3/pdixMmH/wy96PiXWNTaJyy2/2s1Q
  Xb39c+++crXCiGpBs2tMausWC91h6bn82mKi9YnYszw3YpVYijMSDbWYi4oTAffGG+N9AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-732.messagelabs.com!1661330800!25710!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10394 invoked from network); 24 Aug 2022 08:46:40 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Aug 2022 08:46:40 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 05E4A100192
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:46:40 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id ED342100043
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:46:39 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 24 Aug 2022 09:46:38 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 5.18.1 -> 5.19
Date: Wed, 24 Aug 2022 16:46:14 +0800
Message-ID: <1661330777-13307-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661330777-13307-1-git-send-email-wangmy@fujitsu.com>
References: <1661330777-13307-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 08:46:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169790

0001-device-utils.c-Use-linux-mount.h-instead-of-sys-moun.patch
removed since it's included in 5.19

Changelog:
==========
  * send: support protocol version 2
  * fi show: print all missing devices
  * device stats: add tabular output
  * replace: add alias to device group (device replace)
  * check: validate free space tree items
  * fixes:
     * convert: support large filesystems (block count > 32bit)
     * recognize filesystems with verity enabled
     * mkfs and DUP could write out of order, fix it for zoned mode
  * build:
     * optional support for LZO and ZSTD in receive
     * compatibility with glibc 2.36 (mount.h)
     * add fallbacks for new GCC builtins
  * other:
     * corrupt-block: target specific items, offsets
     * documentation updates, new pages from wiki
     * new tests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...se-linux-mount.h-instead-of-sys-moun.patch | 32 -------------------
 ...fs-tools_5.18.1.bb => btrfs-tools_5.19.bb} |  3 +-
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-device-utils.c-Use-linux-mount.h-instead-of-sys-moun.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.18.1.bb => btrfs-tools_5.19.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-device-utils.c-Use-linux-mount.h-instead-of-sys-moun.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-device-utils.c-Use-linux-mount.h-instead-of-sys-moun.patch
deleted file mode 100644
index 1397e50b30..0000000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-device-utils.c-Use-linux-mount.h-instead-of-sys-moun.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d9f118a3408a8a2530f0f60e8072f4323911530f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 27 Jul 2022 01:08:20 +0000
-Subject: [PATCH] device-utils.c: Use linux mount.h instead of sys/mount.h
-
-This file includes linucx/fs.h which includes linux/mount.h and with
-glibc 2.36 linux/mount.h and glibc mount.h are not compatible [1]
-therefore try to avoid including both headers
-
-[1] https://sourceware.org/glibc/wiki/Release/2.36
-
-Upstream-Status: Submitted [https://www.spinics.net/lists/linux-btrfs/msg126918.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- common/device-utils.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/common/device-utils.c b/common/device-utils.c
-index 617b6746..25a4fb8c 100644
---- a/common/device-utils.c
-+++ b/common/device-utils.c
-@@ -15,7 +15,6 @@
-  */
- 
- #include <sys/ioctl.h>
--#include <sys/mount.h>
- #include <sys/statfs.h>
- #include <sys/types.h>
- #include <stdio.h>
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.19.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.19.bb
index 5b24bef5cd..4f116a85ac 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.19.bb
@@ -17,9 +17,8 @@ DEPENDS = "util-linux zlib"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
-           file://0001-device-utils.c-Use-linux-mount.h-instead-of-sys-moun.patch \
            "
-SRCREV = "47b5cf867fc37411ef51eb5c09893a95f7f6c3b7"
+SRCREV = "96b83b16158f3b87037085761bf212e958473767"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.25.1


