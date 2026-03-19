Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56644108E1C5
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:15:25 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7871.1773915320116014892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=f/EbzJuA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915319; x=1805451319;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l7NVjZjxfPGmmf98s96x0961CMydSi+fKXL7xDNUi9A=;
  b=f/EbzJuAKoNwWi51E72hivNM/PDtGFfOweJBaZnqF+dEJ+Ab4JLWOPmw
   QEdzFRnWryPu14hjEQ3FvPSPPhKd14CDvGRVjv46ORLGYjJhPucWZoSAP
   QWgjw4DiPDKqVgwHKNmPpiYseTdD+vsBZ/ZbcnUJu4VVNUQQlxcufIM0Y
   4288KLi1p96O7VnHLf9iI/zOZfauXP2PKMQJrB3hoSzBqjzcjF/K1w0ee
   G9elyT8pOqEwt9uTq+Vx6kV22DFSfc3MjD5xGl2ks3QQ/QxxvE//mElL3
   bq/KqV33CsdYcpBhDQybYiciKXAX5+GFzNYm9rUB+tdQ6aN+BjF6QyGEF
   A==;
X-CSE-ConnectionGUID: B0uV1r3KQe2ZR/QluI7psw==
X-CSE-MsgGUID: 0RZsDRb1S8WZV+/4/RPkhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="233848467"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="233848467"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:13:52 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id EEB5D1C166C5
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:13:52 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A4B5B8D29D1
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:13:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id B7B1E101E523;
	Thu, 19 Mar 2026 10:13:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/40] barebox-tools: upgrade 2026.01.0 -> 2026.03.0
Date: Thu, 19 Mar 2026 18:12:54 +0800
Message-ID: <20260319101332.2067-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233491

From: Wang Mingyu <wangmy@fujitsu.com>

0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
removed since it's included in 2026.03.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/barebox/barebox-common.inc   |  4 +-
 meta/recipes-bsp/barebox/barebox-tools.bb     |  2 -
 ...x-tools-fix-glibc-2.43-openat2-build.patch | 43 -------------------
 3 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 14a5ca9709..17cfc25692 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2026.01.0"
+PV = "2026.03.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "219283d67c5d2f79bd22915b8a71906531223cb01e6e5b8d1658f299441e4169"
+SRC_URI[sha256sum] = "760f22ff34ca00539d29826cce07d83210e41ebb51266616c6969b855c099bc2"
diff --git a/meta/recipes-bsp/barebox/barebox-tools.bb b/meta/recipes-bsp/barebox/barebox-tools.bb
index 1459f48db2..eb327306d9 100644
--- a/meta/recipes-bsp/barebox/barebox-tools.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools.bb
@@ -2,8 +2,6 @@ SUMMARY = "barebox bootloader tools"
 
 require barebox-common.inc
 
-SRC_URI += "file://0001-barebox-tools-fix-glibc-2.43-openat2-build.patch"
-
 LICENSE = "GPL-2.0-only"
 
 DEPENDS = "bison-native flex-native libusb1"
diff --git a/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch b/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
deleted file mode 100644
index 2ff7cb82a6..0000000000
--- a/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-barebox-tools: fix build failure with glibc 2.43
-
-glibc 2.43 introduces linux/openat2.h through the fcntl include chain
-(bits/fcntl-linux.h -> linux/openat2.h). This header expects the
-__u64 type to be defined before inclusion.
-
-In barebox scripts/include/linux/types.h the header <fcntl.h> was
-included before the __u64 typedef, causing build failures such as:
-
-  linux/openat2.h:20:9: error: unknown type name '__u64'
-
-Move the inclusion of <fcntl.h> after the typedef definitions so that
-__u64 and related types are defined before linux/openat2.h is parsed.
-
-Upstream-Status: Pending
-
-Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
----
-
- scripts/include/linux/types.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/scripts/include/linux/types.h b/scripts/include/linux/types.h
-index 5b01333..33cea19 100644
---- a/scripts/include/linux/types.h
-+++ b/scripts/include/linux/types.h
-@@ -4,7 +4,6 @@
- #include <stdbool.h>
- #include <stddef.h>
- #include <stdint.h>
--#include <fcntl.h>
-
- typedef uint64_t __u64;
- typedef int64_t __s64;
-@@ -15,6 +14,8 @@ typedef int16_t __s16;
- typedef uint8_t __u8;
- typedef int8_t __s8;
-
-+#include <fcntl.h>
-+
- #ifndef __linux__
- typedef long long loff_t;
- #endif
-- 
2.43.0


