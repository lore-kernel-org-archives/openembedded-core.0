Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9662CC83F02
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.35291.1751274809501348016
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X64xYjZ4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274809; x=1782810809;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8EdJ0kuK1Yy4mGVGMooueHvM/CIyzWzXs/q+nmhveGg=;
  b=X64xYjZ4vvxhmnR56eV0ns90UCCy8dXRB7yqgf65344rmjgKv5L7elU/
   ckKHE6dMPfOSXgrTtesQgutQnteC73gBWJ12X2LcDBzZ2PILmsIxd9lE/
   CutSZ70rWsfi4bVlE6oDh22W7EvbAVXEZprOYD4TbV50joYi+5MF8zcBB
   gnYvjecnJNrCmEC2CBi6Hg+2m6cnaxt5JYrMBBsO5k2eaq7JN9CGeeBZ5
   uQdsHHfAgYjiRCEL/FwqPDYAdOkqk0ehVpoYD+E8Euv5dRrEKSCQbJNeh
   hINWXUYJqU26a2Pv50iMatuldZJ2l0MNpQPkm5hwDd8meGt9QkH5JYplX
   A==;
X-CSE-ConnectionGUID: MznXAg8ORYSqnD0Vxxa9jA==
X-CSE-MsgGUID: 2Km8JSGeQg+AlBLyOYbLmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="207712154"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="207712154"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:28 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 75EAA42A316
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:28 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTP id AEFB2C00D50
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 19E43F8111
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:27 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C2F311A000B;
	Mon, 30 Jun 2025 17:13:26 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/37] libpam: upgrade 1.7.0 -> 1.7.1
Date: Mon, 30 Jun 2025 17:12:56 +0800
Message-ID: <20250630091315.1897-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219477

From: Wang Mingyu <wangmy@fujitsu.com>

0001-meson.build-correct-check-for-existence-of-two-prepr.patch
removed since it's included in 1.7.1

Changelog:
===============
* pam_access: do not resolve ttys or display variables as hostnames.
* pam_access: added "nodns" option to disallow resolving of tokens as hostnames
  (CVE-2024-10963).
* pam_limits: added support for rttime (RLIMIT_RTTIME).
* pam_namespace: fixed potential privilege escalation (CVE-2025-6020).
* meson: added support of elogind as a logind provider.
* Multiple minor bug fixes, build fixes, portability fixes,
  documentation improvements, and translation updates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ect-check-for-existence-of-two-prepr.patch | 40 -------------------
 .../pam/{libpam_1.7.0.bb => libpam_1.7.1.bb}  |  3 +-
 2 files changed, 1 insertion(+), 42 deletions(-)
 delete mode 100644 meta/recipes-extended/pam/libpam/0001-meson.build-correct-check-for-existence-of-two-prepr.patch
 rename meta/recipes-extended/pam/{libpam_1.7.0.bb => libpam_1.7.1.bb} (97%)

diff --git a/meta/recipes-extended/pam/libpam/0001-meson.build-correct-check-for-existence-of-two-prepr.patch b/meta/recipes-extended/pam/libpam/0001-meson.build-correct-check-for-existence-of-two-prepr.patch
deleted file mode 100644
index ef087ffc06..0000000000
--- a/meta/recipes-extended/pam/libpam/0001-meson.build-correct-check-for-existence-of-two-prepr.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 9b5182d4781bcd6fb37a4030faf325965fde3e93 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 28 Nov 2024 20:32:17 +0100
-Subject: [PATCH] meson: correct check for existence of two preprocessor
- defines
-
-sizeof is meant for *types*, and in case of cross compiling
-the test program produced by it has incorrect syntax
-  __NR_keyctl something;
-and will always fail to compile.
-
-* meson.build: Use cc.get_define() instead of cc.sizeof() to check for
-preprocessor symbols.
-
-Co-authored-by: Dmitry V. Levin <ldv@strace.io>
-Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/pull/861]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index f6a7dafe9..307fed0aa 100644
---- a/meson.build
-+++ b/meson.build
-@@ -198,12 +198,12 @@ foreach ident: check_functions
-   endif
- endforeach
- 
--enable_pam_keyinit = cc.sizeof('__NR_keyctl', prefix: '#include <sys/syscall.h>') > 0
-+enable_pam_keyinit = cc.get_define('__NR_keyctl', prefix: '#include <sys/syscall.h>') != ''
- 
- if get_option('mailspool') != ''
-   cdata.set_quoted('PAM_PATH_MAILDIR', get_option('mailspool'))
- else
--  have = cc.sizeof('_PATH_MAILDIR', prefix: '#include <paths.h>') > 0
-+  have = cc.get_define('_PATH_MAILDIR', prefix: '#include <paths.h>') != ''
-   cdata.set('PAM_PATH_MAILDIR', have ? '_PATH_MAILDIR' : '"/var/spool/mail"')
- endif
- 
diff --git a/meta/recipes-extended/pam/libpam_1.7.0.bb b/meta/recipes-extended/pam/libpam_1.7.1.bb
similarity index 97%
rename from meta/recipes-extended/pam/libpam_1.7.0.bb
rename to meta/recipes-extended/pam/libpam_1.7.1.bb
index dea9ff592b..565b00c264 100644
--- a/meta/recipes-extended/pam/libpam_1.7.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.1.bb
@@ -22,10 +22,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://pam.d/other \
            file://run-ptest \
            file://pam-volatiles.conf \
-           file://0001-meson.build-correct-check-for-existence-of-two-prepr.patch \
            "
 
-SRC_URI[sha256sum] = "57dcd7a6b966ecd5bbd95e1d11173734691e16b68692fa59661cdae9b13b1697"
+SRC_URI[sha256sum] = "21dbcec6e01dd578f14789eac9024a18941e6f2702a05cf91b28c232eeb26ab0"
 
 DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 
-- 
2.43.0


