Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BE2EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:10:27 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.4848.1688699426182848979
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="123141248"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="123141248"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:10:24 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 55E34E8523
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jul 2023 12:10:21 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D7ECD5E88
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jul 2023 12:10:20 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id CB2C02FC76DA;
	Fri,  7 Jul 2023 12:10:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libuv: upgrade 1.45.0 -> 1.46.0
Date: Fri,  7 Jul 2023 11:10:05 +0800
Message-Id: <1688699410-2397-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699410-2397-1-git-send-email-wangmy@fujitsu.com>
References: <1688699410-2397-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10--6.041900-10.000000
X-TMASE-MatchedRID: EGTy8EHGssijz0nOeth/yXzmmMD/HXF+Vr5aZRoV9oQH4DTIEE89jLFt
	FCd5U3JHhOIGHg5ypmGZCOmu6sbULsFBoCgEV4LyGqSG/c50XgPTopklGADJWTABh2rVVNej379
	NeYZeZ8hXo3L6Jmv2F8Ym2R0KueQ8yCpY4WHVjuYwYApm54/SZqFiPo/lDWJLzjYVDGSWpB8Scs
	OQyaI1DfmbQP7p5LIQl1rHp0PtyOae+nvRjqX0ClVeGWZmxN2MBGvINcfHqhfn3ZLCt3rRSZVdq
	r50slHkETYbDfwP6O4NKu6sdFLYue1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg6
	1kSK4DiBkESMI05d4lRG6MKX8SztcMgJs8W+2dN1e7Xbb6Im2k50qcJ5WOMhmyiLZetSf8mfop0
	ytGwvXiq2rl3dzGQ1RDUynKnCTmr73eE2lrn+2qDmAd+m0tQh8Pp8exxniv14xqcxkT8pFQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 03:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183989

From: Wang Mingyu <wangmy@fujitsu.com>

Changes since version 1.45.0:

* Add SHA to ChangeLog
* misc: update readthedocs config 
* test: remove erroneous RETURN_SKIP 
* android: disable io_uring support 
* linux: add some more iouring backed fs ops
* build: add autoconf option for disable-maintainer-mode 
* fs: use WTF-8 on Windows (Stefan Karpinski)
* unix,win: replace QUEUE with struct uv__queue 
* linux: fs_read to use io_uring if iovcnt > IOV_MAX
* ios: fix uv_getrusage() ru_maxrss calculation 
* include: update outdated code comment 
* linux: support abstract unix sockets 
* unix,win: add UV_PIPE_NO_TRUNCATE flag 
* unix: add loongarch support
* doc: add DPS8M to LINKS.md
* include: add EUNATCH errno mapping
* src: don't run timers if loop is stopped/unref'd 
* win: fix -Wpointer-to-int-cast warning 
* test,win: fix -Wunused-variable warning 
* test,win: fix -Wformat warning 
* linux: work around io_uring IORING_OP_CLOSE bug 
* win: remove unused functions 
* bench: add bench to check uv_loop_alive 
* test: add uv_cancel test for threadpool 
* unix: skip prohibited syscalls on tvOS and watchOS
* unix,fs: make no_pwritev access thread-safe
* unix: fix build for lower versions of Android

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libuv/{libuv_1.45.0.bb => libuv_1.46.0.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.45.0.bb => libuv_1.46.0.bb} (85%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.45.0.bb b/meta/recipes-connectivity/libuv/libuv_1.46.0.bb
similarity index 85%
rename from meta/recipes-connectivity/libuv/libuv_1.45.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.46.0.bb
index 456cb2f962..c9aa25c518 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.45.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.46.0.bb
@@ -6,8 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
                     file://LICENSE-extra;md5=f9307417749e19bd1d6d68a394b49324"
 
-SRCREV = "96e05543f53b19d9642b4b0dd73b86ad3cea313e"
-SRC_URI = "git://github.com/libuv/libuv.git;branch=master;protocol=https"
+SRCREV = "f0bb7e40f0508bedf6fad33769b3f87bb8aedfa6"
+SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


