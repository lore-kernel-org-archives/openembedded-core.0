Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A073D58CBE
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 01:37:50 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8318.1774229862484675377
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 18:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kySyVXBy;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774229862; x=1805765862;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M27UMDRvrXqP0xNS930JpxTISm7f2PDnSNyVt9x5NbI=;
  b=kySyVXByquI0lt3HSCXJDZ6NyGR9GykSDf1r7JugT+T8ESDrUi0myc/E
   +mwihdence2Xce204+iHQpeQxh5GG8gICgRTTArKfvsWReST0ec2hDeC6
   k9xD4ICbl68zgXONtd+9tkzDfuw2tEEWNl1bdoMMFUe2IZhUR5PXhjWy6
   TyiCV4VsJopw3dYnIgy8Z57wm3mqHDFoVuMPjUOUoNDLE3nloDPcRVl3/
   b07SfqxVkm3Jtg/2/cgOU/TFkh6XQhNzyAZP4D+1RIClI2Wec60PsGIRI
   kHgyCAYWN2nWE1JWO6CtAjPqI3lc8ngAeY4MIO638Ljm2hi+RMWGvcP/n
   g==;
X-CSE-ConnectionGUID: ymb8qnVETxGouGOD7aCUOw==
X-CSE-MsgGUID: 0OkjLHjYRUekfPIzTWsUfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="212992339"
X-IronPort-AV: E=Sophos;i="6.23,136,1770562800"; 
   d="scan'208";a="212992339"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 10:37:40 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B33C842A316
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 01:37:40 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 650E41C002E0
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 01:37:40 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.24])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 23EAE1800104
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 01:37:37 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] libsolv: upgrade 0.7.35-> 0.7.36
Date: Mon, 23 Mar 2026 09:37:34 +0800
Message-ID: <20260323013735.725-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 01:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233688

1.Changelog
  Version 0.7.36
  - selected bug fixes:
    * respect the "default" attribute in environment optionlist in
      the comps parser
    * support suse namespace deps in boolean dependencies
  - new features:
    * support for the Elbrus2000 (e2k) architecture
    * support language() suse namespace rewriting

2.Remove 0001-utils-Conside-musl-when-wrapping-qsort_r.patch
  as the issue was fixed upstream with this commit:
  https://github.com/openSUSE/libsolv/commit/2d0718a4f2001c857d9af24398c68d676a98a3ca

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...s-Conside-musl-when-wrapping-qsort_r.patch | 31 -------------------
 .../{libsolv_0.7.35.bb => libsolv_0.7.36.bb}  |  3 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
 rename meta/recipes-extended/libsolv/{libsolv_0.7.35.bb => libsolv_0.7.36.bb} (92%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
deleted file mode 100644
index d6e983dec8..0000000000
--- a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From da99bf09e83469612e2c821696025a4e591bb95c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 28 Oct 2021 22:28:45 -0700
-Subject: [PATCH] utils: Conside musl when wrapping qsort_r
-
-musl now has implemented qsort_r, the signature however matches glibc
-and not BSD, current check makes it such that it falls into BSD case
-when building for musl, which clearly is wrong, therefore instead of
-just checking for glibc check for linux to decide which qsort_r
-signature to use. This covers both glibc and musl
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/util.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/util.c b/src/util.c
-index 72426e09..8f29bc5a 100644
---- a/src/util.c
-+++ b/src/util.c
-@@ -159,7 +159,7 @@ solv_setcloexec(int fd, int state)
- 
-    see also: http://sources.redhat.com/ml/libc-alpha/2008-12/msg00003.html
-  */
--#if (defined(__GLIBC__) || defined(__NEWLIB__)) && (defined(HAVE_QSORT_R) || defined(HAVE___QSORT_R))
-+#if (defined(__linux__) || defined(__NEWLIB__)) && (defined(HAVE_QSORT_R) || defined(HAVE___QSORT_R))
- 
- void
- solv_sort(void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *, void *), void *compard)
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
similarity index 92%
rename from meta/recipes-extended/libsolv/libsolv_0.7.35.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.36.bb
index ef348de904..f22230599b 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
@@ -9,11 +9,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "expat zlib zstd"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;tag=${PV} \
-           file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
            file://run-ptest \
 "
 
-SRCREV = "fb4b4340d46108cb365113e432642d6024886c7a"
+SRCREV = "1e377699be108ec82bb798ec9c223d45d84a733c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


