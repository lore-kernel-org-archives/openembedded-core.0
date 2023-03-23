Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 521B7C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 02:00:27 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.62908.1679536816823060135
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 19:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=O5cClex+;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679536815; i=@fujitsu.com;
	bh=uMAzZRN1Zw9JYlxrvaDnU3+F2Ev+3BV59YuM9cTCqlY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=O5cClex+C6QP1EM1SY9MbyNI60icwfqGO07N+Bq2M/fYgjHly9xrydQokIVqwIql3
	 ZLZIGO+GBSLz/DDZDkCfBuKeE6D8M2PVJ1TaFMeLKhujWhjBgp6fRTQl9yotSgsq7M
	 9dTzeCbcuAG5Yw8urLcBgZQtyB/Qv496aa4u6DlU6ZQ/qrtB28Vos/DsQ5vjSo6weG
	 yRsUTpwO/pkuTMEoTyfuSRZqVSmvriNneQWUUt/j1Kiy9g8GizXUNxbvYG0DY9VTSl
	 Tk33dc89FYww8gkgeVBmVZ0wsfTdk2y+GpcmA0arb6s8viinJc1/NfL4T0AK6DmlhN
	 /pueWLo6Ic32g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSXfdJuk
  Ugz+bxCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oyuLR9YC3aLV2z5+I2xgbFdtIuRk0NI4DGj
  xIIVwV2MXED2NSaJN//PsEI4exglWncuZAOpYhOQkrhx/z+QzcEhIqAncfUfWDOzgIrEi9897
  CC2sECwxLTzU1hBbBYBVYn1H76ygNi8Ak4SnbePM4LYEgIKElMevmeGiAtKnJz5hAVijoTEwR
  cvmCFqFCVmX25mgbArJBqnH2KCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYjQrTi0qSy3SNTTQSyr
  KTM8oyU3MzNFLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMxZRixuQdjFf7
  /uodYpTkYFIS5ZUIlU4R4kvKT6nMSCzOiC8qzUktPsQow8GhJMHbuA4oJ1iUmp5akZaZA4wLm
  LQEB4+SCC/XHKA0b3FBYm5xZjpE6hSjJcfahgN7mTk27es6wMzRuR9ICrHk5eelSonzpm4Eah
  AAacgozYMbB4vdS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeY1XAU3hycwrgdv6CuggJqC
  D4mZIgBxUkoiQkmpgWqN3i7VQ318jO9Cd/VCM/mLbZxumPNc/pp//aXvbyfvqZcEaohvjj6oE
  aNpYce6J22q3fO9u0dp3r6JOvOGdZmYeYpbEIRGfmeT5ec8jkQPu7w4/zODnnyR3XEVrns80p
  cTlx2LE58RMvWS0WLOm+m7i/vwpD+s87iyb1T89Kmv+dYHaedIXet4+/HVk8R/JSyuKHyzZFD
  LzyzoRHnbnyz+8epVuCZr+qFk6KfjN2qlVd/c++bdpSea80xPS0i8LFYi/ORameeFBwsXvJg0
  RuwweqFwxXr7W5sU72T2iTMYLdtSHu9fzdtapfNiWm743odUuaFdToGPLBJ2wCBv7JQ2J7/Qy
  I81jdXe8jdfiVGIpzkg01GIuKk4EAA6Ma8hYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-587.messagelabs.com!1679536814!133591!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16222 invoked from network); 23 Mar 2023 02:00:14 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 02:00:14 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id F3ABF1000E7
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 02:00:13 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E77BF1000D2
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 02:00:13 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 02:00:11 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH V4] xcb-proto: Fix install conflict when enable multilib.
Date: Thu, 23 Mar 2023 09:59:56 +0800
Message-ID: <1679536796-19107-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 02:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178964

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/share/pkgconfig/xcb-proto.pc conflicts between attempted installs of lib32-xcb-proto-dev-1.15.2-r0.armv7ahf_neon and xcb-proto-dev-1.15.2-r0.cortexa57

The differences between the two files are as follows:
@@ -2,7 +2,7 @@
 exec_prefix=/usr
 datarootdir=${prefix}/share
 datadir=/usr/share
-libdir=/usr/lib64
+libdir=/usr/lib
 xcbincludedir=${pc_sysrootdir}${datadir}/xcb
 PYTHON_PREFIX=${prefix}
 pythondir=${pc_sysrootdir}${libdir}/python3.11/site-packages

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nstall-conflict-when-enable-multilib.patch | 32 +++++++++++++++++++
 .../xorg-proto/xcb-proto_1.15.2.bb            |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0001-Fix-install-conflict-when-enable-multilib.patch

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto/0001-Fix-install-conflict-when-enable-multilib.patch b/meta/recipes-graphics/xorg-proto/xcb-proto/0001-Fix-install-conflict-when-enable-multilib.patch
new file mode 100644
index 0000000000..4209139da8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto/0001-Fix-install-conflict-when-enable-multilib.patch
@@ -0,0 +1,32 @@
+From fc28149b6b198042c8d29e0931415adad7ed3231 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Thu, 16 Mar 2023 08:03:47 +0000
+Subject: [PATCH] Fix install conflict when enable multilib.
+
+Automake defines pythondir in terms of libdir (rather than hardcode 'lib' or query it from python as automake upstream does)
+https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/automake/automake/0001-automake-Update-for-python.m4-to-respect-libdir.patch
+
+So libdir needs to be defined when pythondir is defined.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 8b57a83..580f5bc 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,6 +1,6 @@
+ SUBDIRS = src xcbgen
+ 
+-pkgconfigdir = $(datarootdir)/pkgconfig
++pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = xcb-proto.pc
+ 
+ EXTRA_DIST=doc xcb-proto.pc.in autogen.sh README.md
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
index 4e4472a9c1..e60e7958a7 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
 
 SRC_URI = "https://xorg.freedesktop.org/archive/individual/proto/${BP}.tar.xz \
            file://0001-xcb-proto.pc.in-reinstate-libdir.patch \
+           file://0001-Fix-install-conflict-when-enable-multilib.patch \
            "
 SRC_URI[sha256sum] = "7072beb1f680a2fe3f9e535b797c146d22528990c72f63ddb49d2f350a3653ed"
 
-- 
2.34.1


