Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA1AC7EE33
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:08 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.26241.1685610238393525359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="119084619"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="119084619"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:02 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D9F9DCA1E6
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:59 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D95E9D95F3
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B99B887D8;
	Thu,  1 Jun 2023 18:03:57 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libuv: upgrade 1.44.2 -> 1.45.0
Date: Thu,  1 Jun 2023 17:03:21 +0800
Message-Id: <1685610221-29015-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10-2.347200-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yZAk4Vz6rKorRpgtqnD1BD6H4I6QZJ07ka+G
	dsnegAa6+BtDYmoqPpZKtne3LfonHbSt2Tg2e/jrr7+qhZS/khnsbTWwP5iBzJTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/xeN9Hd3TB5G4+xf2pXdquRG1z
	aoYFqfLoGQRIwjTl3ioe/KDVmzFN+XC3sMAGu+n3V7tdtvoibarixttRG+E/OBbptjxI6rdaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8Krd9oxEtwNpeES6uDnlL3Fp1vGH7+t2AqIGhGFvH7hXJfbiDl
	sYuM2isrQVyVngFWLg4pOB1i8DrZcHcso3MqGMmuJMirQge6yR0m4Rm5hspVxSSu8i52URmXTt0
	OuyJi/IIuEVM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182070

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:  doc: clean up license file (#3876)
 GitHub gets confused by the non-standard format of the LICENSE file.
 Move the extra bits into the creatively named LICENSE-extra file.

Changelog:
==========
 linux: introduce io_uring support #3952
 src: add new metrics APIs #3749
 unix,win: give thread pool threads an 8 MB stack #3787
 win,unix: change execution order of timers #3927

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libuv/{libuv_1.44.2.bb => libuv_1.45.0.bb}              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.44.2.bb => libuv_1.45.0.bb} (75%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.44.2.bb b/meta/recipes-connectivity/libuv/libuv_1.45.0.bb
similarity index 75%
rename from meta/recipes-connectivity/libuv/libuv_1.44.2.bb
rename to meta/recipes-connectivity/libuv/libuv_1.45.0.bb
index 27e79276b5..45b3a96f12 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.45.0.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "https://github.com/libuv/libuv"
 DESCRIPTION = "libuv is a multi-platform support library with a focus on asynchronous I/O. It was primarily developed for use by Node.js, but it's also used by Luvit, Julia, pyuv, and others."
 BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b"
 
-SRCREV = "0c1fa696aa502eb749c2c4735005f41ba00a27b8"
-SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https"
+SRCREV = "96e05543f53b19d9642b4b0dd73b86ad3cea313e"
+SRC_URI = "git://github.com/libuv/libuv.git;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


