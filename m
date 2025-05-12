Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815FFC3ABCC
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:12 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.45918.1747040642037410105
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FQK8Xi00;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040642; x=1778576642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LG1EZThFn1Jd6L7PQiE54HKIDp59/p5KPloJfqKmEQI=;
  b=FQK8Xi00X0/78oEh0YYY6Agly+plv1yjNieaxNbqE/D6xPvDFjYxYb0H
   uCg5bF/wU4YqkM8ln82FUcxJIZuJKgivHHClV0Mgl+G5XAIuk/FCBqMLU
   pE5plDN63WMwHMl+46aJ8jbP/KiG/KI9HhMEsxDVvJdoajtJuVuo9MHpJ
   VHHpnH4hanBtjtdAqeK+3HpX8/FFGHPrnFPuL7bt8cMsO53xSSsnLc6rM
   H6XaltXBikIYMt0ZLrplWgfsJiQmyvsiX8ef9GANOHbXT8JJ27Lh7rITu
   sXiDmNlnhpmjJAJPDaqgPihN9GQZaFp+5KEPT9qd3g8qnqmZecA7hAtzN
   g==;
X-CSE-ConnectionGUID: FA+CatpbSPizSSUOE4Tzjw==
X-CSE-MsgGUID: CXT7qXWuSW6vy2BG/Db8Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="198343071"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="198343071"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:00 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A891D5004
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 25731CFB76
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:57 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D7D9D1A009B;
	Mon, 12 May 2025 17:03:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/56] libcgroup: upgrade 3.1.0 -> 3.2.0
Date: Mon, 12 May 2025 17:03:04 +0800
Message-Id: <1747040619-7566-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216320

From: Wang Mingyu <wangmy@fujitsu.com>

0001-include-Makefile-install-systemd.h-by-default.patch
removed since it's included in 3.2.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...akefile-install-systemd.h-by-default.patch | 37 -------------------
 ...{libcgroup_3.1.0.bb => libcgroup_3.2.0.bb} |  6 +--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-core/libcgroup/libcgroup/0001-include-Makefile-install-systemd.h-by-default.patch
 rename meta/recipes-core/libcgroup/{libcgroup_3.1.0.bb => libcgroup_3.2.0.bb} (84%)

diff --git a/meta/recipes-core/libcgroup/libcgroup/0001-include-Makefile-install-systemd.h-by-default.patch b/meta/recipes-core/libcgroup/libcgroup/0001-include-Makefile-install-systemd.h-by-default.patch
deleted file mode 100644
index 4b743f9b33..0000000000
--- a/meta/recipes-core/libcgroup/libcgroup/0001-include-Makefile-install-systemd.h-by-default.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 592dcdcf243576bd2517d3da9bc18990de08e37e Mon Sep 17 00:00:00 2001
-From: Kamalesh Babulal <kamalesh.babulal@oracle.com>
-Date: Mon, 27 Nov 2023 20:07:33 +0530
-Subject: [PATCH 1/1] include/Makefile: install systemd.h by default
-
-Install systemd.h header file by default, as we have stub and defined
-versions of the systemd functions for both non-systemd and systemd
-enabled configurations.  This will help packagers to ship package
-without systemd support (--enable-systemd=no).
-
-Signed-off-by: Kamalesh Babulal <kamalesh.babulal@oracle.com>
-Signed-off-by: Tom Hromatka <tom.hromatka@oracle.com>
-
-Upstream-Status: Backport [https://github.com/libcgroup/libcgroup/commit/592dcdcf243576bd2517d3da9bc18990de08e37e]
-
-Signed-off-by: Adriaan Schmidt <adriaan.schmidt@siemens.com>
----
- include/Makefile.am | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/include/Makefile.am b/include/Makefile.am
-index 23cebaac..4cb05529 100644
---- a/include/Makefile.am
-+++ b/include/Makefile.am
-@@ -2,8 +2,4 @@
- nobase_include_HEADERS = libcgroup.h libcgroup/error.h libcgroup/init.h \
- 			 libcgroup/groups.h libcgroup/tasks.h \
- 			 libcgroup/iterators.h libcgroup/config.h \
--			 libcgroup/log.h libcgroup/tools.h
--
--if WITH_SYSTEMD
--nobase_include_HEADERS += libcgroup/systemd.h
--endif
-+			 libcgroup/log.h libcgroup/tools.h libcgroup/systemd.h
--- 
-2.39.2
-
diff --git a/meta/recipes-core/libcgroup/libcgroup_3.1.0.bb b/meta/recipes-core/libcgroup/libcgroup_3.2.0.bb
similarity index 84%
rename from meta/recipes-core/libcgroup/libcgroup_3.1.0.bb
rename to meta/recipes-core/libcgroup/libcgroup_3.2.0.bb
index a1d27c7e7f..28562a5b37 100644
--- a/meta/recipes-core/libcgroup/libcgroup_3.1.0.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_3.2.0.bb
@@ -12,12 +12,10 @@ inherit autotools pkgconfig github-releases
 DEPENDS = "bison-native flex-native"
 DEPENDS:append:libc-musl = " fts"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
-           file://0001-include-Makefile-install-systemd.h-by-default.patch \
-"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/libcgroup/libcgroup/tags"
 
-SRC_URI[sha256sum] = "976ec4b1e03c0498308cfd28f1b256b40858f636abc8d1f9db24f0a7ea9e1258"
+SRC_URI[sha256sum] = "9a0fc2d6c377215c3e0d849f9189ecd91fd075f1da0a24b73f56c8892e86bdfe"
 
 PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)}"
 PACKAGECONFIG[pam] = "--enable-pam-module-dir=${base_libdir}/security --enable-pam=yes,--enable-pam=no,libpam"
-- 
2.43.0


