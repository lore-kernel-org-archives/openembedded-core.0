Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F6E7C54752
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:02 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.45971.1747040639732804618
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K5P2doij;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040641; x=1778576641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hIJRxG3QOizb73z1g+gkDjor6POKiMEeIlAF2b6Kj28=;
  b=K5P2doij8vcORSAcs0jCr+kMJkyy50jAs5aIM5molLBG6EX7Lqet1ZbR
   KSBxp2Bgy+RjrwRenPD7IICkRjuWYHJywKhMXiwPtdQuLSNckYKKdJiQi
   Wyaa0EGtpOvfyGciZgi/+EZ8tDBwKIfBPT6g6PVT6/XWcaH7I8Qj4p6PY
   onJbaIhTDx/ox3yneC313C6OXer0+LoDgU2MVz5AF3JJ27HY7JT7Q1Xp6
   7gejQlN+wHANoOHMtnsZv1BXAqRpgjUxVAH5b56IJBXIyQUJBoWxC7AhZ
   w3BbfJSrPUe+8ybnE9XZzLU/SZrXtJgpuCV28uZa3Il/UyRtJ8qsBUGgC
   g==;
X-CSE-ConnectionGUID: HXAOAMLmQ46q7eXyOCfb8w==
X-CSE-MsgGUID: QVbAh7i1SXaSIOMyL+trvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="178629711"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="178629711"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:00 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C69CC2260
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C2026BF3D3
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:57 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5A86E1A009B;
	Mon, 12 May 2025 17:03:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/56] libgpg-error: upgrade 1.51 -> 1.55
Date: Mon, 12 May 2025 17:03:06 +0800
Message-Id: <1747040619-7566-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216317

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Do-not-fail-when-testing-config-scripts.patch
refreshed for 1.55

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Do-not-fail-when-testing-config-scripts.patch      | 6 +++---
 .../{libgpg-error_1.51.bb => libgpg-error_1.55.bb}          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.51.bb => libgpg-error_1.55.bb} (95%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
index 0910d6cc63..39798c009f 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
@@ -1,4 +1,4 @@
-From 581919f3af914c6b62e51b345d5d15e709f20e77 Mon Sep 17 00:00:00 2001
+From b1b6c28b4753c027052aeb6275a73eed06f0bf49 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 28 Feb 2020 09:19:56 +0000
 Subject: [PATCH] Do not fail when testing config scripts
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 9389e99..6ded263 100644
+index e56bb23..8c3ba7b 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -324,6 +324,5 @@ gpg-error-config: gpgrt-config gpg-error-config-old gpg-error-config-test.sh
+@@ -326,6 +326,5 @@ gpg-error-config: gpgrt-config gpg-error-config-old gpg-error-config-test.sh
  	else                                                   \
  	  echo "no";                                           \
  	  echo "***  Please report to <https://bugs.gnupg.org> with gpg-error-config-test.log"; \
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb
similarity index 95%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.51.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.55.bb
index 741969beb0..96dac49aae 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "be0f1b2db6b93eed55369cdf79f19f72750c8c7c39fc20b577e724545427e6b2"
+SRC_URI[sha256sum] = "95b178148863f07d45df0cea67e880a79b9ef71f5d230baddc0071128516ef78"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.43.0


