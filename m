Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CA1C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 07:49:20 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.4615.1655884156869983086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 00:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Tp92LbdV;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655884154; i=@fujitsu.com;
	bh=x4xklb2G67gPK0ckIZTvKZD77JJj0FKRngHMvtup3Pw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Tp92LbdV9eV8OFQw1v+iUMg3b554dLT9snOWPhwIu2fFwO9D1owPuJowgpA+s5AzL
	 V5Ot8cvCTDMFkFkchMGtDPtN1+G3CEDRKfS8MJhbQnhhYivQ8psomzNOWeq+BqCEY1
	 pORjYRlM1TKPQbDqrSM+7BcnbUXsgZmoDrw3LuCWqZ4IMwjHRCz+G54igLm53IFGcR
	 cXRMMqtzx5H6sKLk2EzI+wdllXo4X1Mg04A/HF/CV6u17A34Tat05EALVsaQnoxQBI
	 qhqLRrRZ8Z3kre12CwhnlITJJq/DTTpKUtTcmwF/jCYvWu5DOBFaFw4guMSoeeMSgO
	 rQUQpSX9f6WfQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpFt1clO
  SwardUhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aXll0sBR8lK36tOcfUwNgv3sXIxSEk8IBR
  YteFBlYI5yaTxK7Ff1kgnD2MEpOn7GDuYuTkYBNQk5h+6wZQFQeHiICexNV/oiBhZgEViRe/e
  9hBbGEBW4mJhyYwgdgsAqoSt+efYwGxeQWcJGatvcQKYksIKEhMefieGSIuKHFy5hMWiDkSEg
  dfvGCGqFGUmH25mQXCrpCYMWMbG4StJnH13CbmCYz8s5C0z0LSvoCRaRWjTVJRZnpGSW5iZo6
  uoYGBrqGhqa6lma6hiYVeYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFecWVuck6KXl5qySZGYGCm
  FCdM2cF4eN8vvUOMkhxMSqK8kgc2JQnxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4I07DpQTLEpNT
  61Iy8wBRglMWoKDR0mE1/YEUJq3uCAxtzgzHSJ1itGeY+rsf/uZOZaDyZlf2w4wc2za13WAWY
  glLz8vVUqc9+tBoDYBkLaM0jy4obCovsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmLcYZDl
  PZl4J3O5XQGcxAZ31ZPkGkLNKEhFSUg1MDk1cf5Zbx56SSTpX+SHjp9K61BMnU/90n5A4HC0n
  +UNcjSeZuXF+4Kz95RtZpvE4NCx+xm8ma9Bd+jvCca+bWEu6upTOcQO1L9s2td5keLe8uVV8z
  d/ydXOOXZujHO59aXWYQtGcu2+/vlx/WD/bTn627k6+nq1PlyS2+96Q2PvRcKb5RYW/ZzZlyD
  qtvbT69sEJ4ZmO3jv52HrvnJjIvyfk762Kyc1F3xeZX8r9VSensprT7ojILXOeCVtSPRzzN6R
  PLfuQlsL7cFmD9Irb9lrTy95nu759zTL5/6pFdi5vXu55I3H9sMumRWxZy1Nv1GxaedB4Vc6u
  r7m7LhuJH8qfzlVddt73S/ux2AuR3UosxRmJhlrMRcWJAO6vbKVlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-728.messagelabs.com!1655884154!426431!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15226 invoked from network); 22 Jun 2022 07:49:14 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jun 2022 07:49:14 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id CF0761AE
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:49:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C39D91AD
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:49:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 22 Jun 2022 08:49:06 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libproxy: upgrade 0.4.17 -> 0.4.18
Date: Wed, 22 Jun 2022 15:48:46 +0800
Message-ID: <1655884130-22843-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 07:49:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167217

determinism.patch
removed since it's included in 0.4.18.

Changelog:
=========
    build: Allow configuration of sysconfig module
    config_envvar: Add environment variable for pacrunner debugging
    build: disable mozjs by default
    python: Support Python 3.10 and above
    Add Duktape pacrunner module
    config_kde: Compute list of config file locations ourselves
    cpmfog_gnome3: Add gnome-wayland to permitted DESKTOP_SESSION

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libproxy/libproxy/determinism.patch       | 26 -------------------
 ...{libproxy_0.4.17.bb => libproxy_0.4.18.bb} |  5 ++--
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-support/libproxy/libproxy/determinism.patch
 rename meta/recipes-support/libproxy/{libproxy_0.4.17.bb => libproxy_0.4.18.bb} (91%)

diff --git a/meta/recipes-support/libproxy/libproxy/determinism.patch b/meta/recipes-support/libproxy/libproxy/determinism.patch
deleted file mode 100644
index 09770f68f0..0000000000
--- a/meta/recipes-support/libproxy/libproxy/determinism.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-[PATCH] cmake/modules/config_sysconfig: Allow configuration of sysconfig module
-
-Checking whether the host system has /etc/sysconfig is not deterministic
-when cross compiling. Allow this to be disabled by adding a configure
-option for it. OpenEmbedded can set this and have deterministic build
-output independent of the host OS.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Submitted [https://github.com/libproxy/libproxy/pull/160]
-
-Index: libproxy-0.4.17/libproxy/cmake/modules/config_sysconfig.cmk
-===================================================================
---- libproxy-0.4.17.orig/libproxy/cmake/modules/config_sysconfig.cmk
-+++ libproxy-0.4.17/libproxy/cmake/modules/config_sysconfig.cmk
-@@ -1,5 +1,8 @@
- if (NOT WIN32 AND NOT APPLE)
--  if (EXISTS "/etc/sysconfig" AND IS_DIRECTORY "/etc/sysconfig")
--    set(SYSCONFIG_FOUND 1)
-+  option(WITH_SYSCONFIG "Build sysconfig module for /etc/sysconfig" ON)
-+  if(WITH_SYSCONFIG)
-+    if (EXISTS "/etc/sysconfig" AND IS_DIRECTORY "/etc/sysconfig")
-+      set(SYSCONFIG_FOUND 1)
-+    endif()
-   endif()
- endif()
-\ No newline at end of file
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.17.bb b/meta/recipes-support/libproxy/libproxy_0.4.18.bb
similarity index 91%
rename from meta/recipes-support/libproxy/libproxy_0.4.17.bb
rename to meta/recipes-support/libproxy/libproxy_0.4.18.bb
index e121681ae8..a9f2bf6cae 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.17.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.18.bb
@@ -12,9 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
-           file://determinism.patch"
-SRC_URI[sha256sum] = "bc89f842f654ee1985a31c0ba56dc7e2ce8044a0264ddca84e650f46cd7f8b05"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
+SRC_URI[sha256sum] = "69b5856e9ea42c38ac77e6b8c92ffc86a71d341fef74e77bef85f9cc6c47a4b1"
 
 UPSTREAM_CHECK_URI = "https://github.com/libproxy/libproxy/releases"
 UPSTREAM_CHECK_REGEX = "libproxy-(?P<pver>.*)\.tar"
-- 
2.25.1


