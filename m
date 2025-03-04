Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E75AC28B20
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.18103.1741079371187619553
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SNaoXgzE;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079371; x=1772615371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=lUNr/ISqPNXIhm2HdcVlUDqp297SBvXVzKb4VMjGPyY=;
  b=SNaoXgzEMGXLg/yz1Veun9AtvCBjli1QkcNYngb/X7+X8mVnqGR8lDi7
   Jvf1CpA6nUpNtxAxTEtoIv8GtkiyQSO40/71rpwV9bbO1c9vFkXjDDLz2
   Rhm8OcLN9jdpUN58tEMP50hD1QyeMij9yIm8wRhE412cqH0WLASaKEkTI
   ibTmKyXO/V0W46VCuDrk2LyY4yxi03GcGfHm1+aGth3okyrskeM95/Czt
   TbvqqR5h9iWcvb8qT65q+PDhBzPC7VPo0wlzKOA8WkI9j+u6+UUfWQYBI
   54PjfIRVhKVLMKMpnrRURqDnNPqQY3BPwXCUPU55LBxa57VGdr6T2Nseo
   g==;
X-CSE-ConnectionGUID: dyYiC6lLTMmY7JM+3fZK7g==
X-CSE-MsgGUID: OCt9RFBfSjKwn+L71IAnpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="179242836"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="179242836"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:28 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8AEA3DBB87
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 50B39D729D
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:26 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 11B971A009A;
	Tue,  4 Mar 2025 17:09:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/31] liburcu: update 0.15.0 -> 0.15.1
Date: Tue,  4 Mar 2025 17:08:56 +0800
Message-Id: <1741079356-13445-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212242

From: Wang Mingyu <wangmy@fujitsu.com>

0001-uatomic-generic.h-add-missing-stdlib.h-header-file-f.patch
removed since it's included in 0.15.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...h-add-missing-stdlib.h-header-file-f.patch | 45 -------------------
 .../{liburcu_0.15.0.bb => liburcu_0.15.1.bb}  |  6 +--
 2 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-support/liburcu/liburcu/0001-uatomic-generic.h-add-missing-stdlib.h-header-file-f.patch
 rename meta/recipes-support/liburcu/{liburcu_0.15.0.bb => liburcu_0.15.1.bb} (82%)

diff --git a/meta/recipes-support/liburcu/liburcu/0001-uatomic-generic.h-add-missing-stdlib.h-header-file-f.patch b/meta/recipes-support/liburcu/liburcu/0001-uatomic-generic.h-add-missing-stdlib.h-header-file-f.patch
deleted file mode 100644
index 5872f45f43..0000000000
--- a/meta/recipes-support/liburcu/liburcu/0001-uatomic-generic.h-add-missing-stdlib.h-header-file-f.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From c534091fc6924e76e6d24e861da9cf7272714231 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Tue, 21 Jan 2025 11:02:05 +0800
-Subject: [PATCH] uatomic/generic.h: add missing stdlib.h header file for
- abort()
-
-We encountered the following error when building multipath-tools on
-qemuppc64 platform:
-
-| In file included from /build/tmp/work/ppc64p9le-wrs-linux/multipath-tools/0.10.0/recipe-sysroot/usr/include/urcu/uatomic/ppc.h:228,
-|                  from /build/tmp/work/ppc64p9le-wrs-linux/multipath-tools/0.10.0/recipe-sysroot/usr/include/urcu/uatomic.h:73,
-|                  from lock.h:5,
-|                  from lock.c:1:
-| /build/tmp/work/ppc64p9le-wrs-linux/multipath-tools/0.10.0/recipe-sysroot/usr/include/urcu/uatomic/generic.h: In function '_uatomic_and':
-| /build/tmp/work/ppc64p9le-wrs-linux/multipath-tools/0.10.0/recipe-sysroot/usr/include/urcu/uatomic/generic.h:422:24: error: implicit declaration of function 'abort' [-Wimplicit-function-declaration]
-|   422 |                 oldt = uatomic_read((uint32_t *) addr);
-|       |                        ^~~~~~~~~~~~
-| /build/tmp/work/ppc64p9le-wrs-linux/multipath-tools/0.10.0/recipe-sysroot/usr/include/urcu/uatomic/generic.h:1:1: note: include '<stdlib.h>' or provide a declaration of 'abort'
-|   +++ |+#include <stdlib.h>
-|     1 | // SPDX-FileCopyrightText: 1991-1994 by Xerox Corporation.  All rights reserved.
-| make[1]: *** [../Makefile.inc:155: lock.o] Error 1
-| make[1]: Leaving directory '/build/tmp/work/ppc64p9le-wrs-linux/multipath-tools/0.10.0/git/libmultipath'
-
-Upstream-Status: Submitted [https://github.com/urcu/userspace-rcu/pull/28]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- include/urcu/uatomic/generic.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/urcu/uatomic/generic.h b/include/urcu/uatomic/generic.h
-index 5a81e00..5c8cb6c 100644
---- a/include/urcu/uatomic/generic.h
-+++ b/include/urcu/uatomic/generic.h
-@@ -15,6 +15,7 @@
-  */
- 
- #include <stdint.h>
-+#include <stdlib.h>
- #include <urcu/compiler.h>
- #include <urcu/system.h>
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-support/liburcu/liburcu_0.15.0.bb b/meta/recipes-support/liburcu/liburcu_0.15.1.bb
similarity index 82%
rename from meta/recipes-support/liburcu/liburcu_0.15.0.bb
rename to meta/recipes-support/liburcu/liburcu_0.15.1.bb
index a029b88111..811e59f853 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.0.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.1.bb
@@ -12,11 +12,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c2a92498b6e88e276f986877995425b8 \
                     "
 
 
-SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
-           file://0001-uatomic-generic.h-add-missing-stdlib.h-header-file-f.patch \
-          "
+SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "4f2d839af67905ad396d6d53ba5649b66113d90840dcbc89941e0da64bccd38c"
+SRC_URI[sha256sum] = "98d66cc12f2c5881879b976f0c55d10d311401513be254e3bd28cf3811fb50c8"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.43.0


