Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C8ACC46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 13:05:51 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.100654.1703682349132037958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 05:05:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="132408164"
X-IronPort-AV: E=Sophos;i="6.04,309,1695654000"; 
   d="scan'208";a="132408164"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 22:05:46 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CBDECD4F5A
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:05:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 06FA1D9681
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:05:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C5D72646C5
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:05:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0288E1A006F;
	Wed, 27 Dec 2023 21:05:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] aspell: upgrade 0.60.8 -> 0.60.8.1
Date: Wed, 27 Dec 2023 21:05:37 +0800
Message-Id: <1703682337-23924-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28082.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28082.007
X-TMASE-Result: 10--1.437400-10.000000
X-TMASE-MatchedRID: FBE0XpCroJijz0nOeth/yTo39wOA02LhQRlUSJjs8Z/9wRnyxuPjhCia
	SqRpkfBt7C3dRFvMHr08SPjziYPdThs7n0Ur0F2YyCvBIqsqjUeYasbATu5ay5a5+gecZQ1+cZI
	xCqXtN9EF1yMn490T+UqEFQnLGOEGiCsqewnUZGA/QdUh6LEl0DeXamXCCu1YmuWdE9A1QOyVIb
	fpsq9FzFIeZmiiCQMf5p98cjyQCaK8UKz3qVg+rzsKXyzHgcEb8boZEVitthi4GyTmeN+AbNWrF
	FAqqfvH6zBPuCbw++kB7AIVirH9aHpsxhuKgz2pxi///JpaHQMqDDODO93JJ7SAmG8slgF0riuZ
	AgOgHpJjY9b2Brbz3L0N2ZmzFri8u4AM1i3aFvaB381iZ59HqPKOxpc5EV4NAhn751acftuem2v
	w+cenKeLzNWBegCW2wgn7iDBesS0nRE+fI6etkr8wHsTAzKRgTE3Po5fV6s+5asKnRlaof21sQd
	nhlbwQhe+xFlCU/aA75oJv6mdNJ6Ia6NHpAxbIa0L8NBvJ2MQ5D/J9YntJfEu/kTKv9giuqwOHO
	1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 13:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192943

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2019-25051.patch
removed since it's included in 0.60.8.1

Changelog:
============
-Fix memory leak in suggestion code introduced in 0.60.8.
-Various documentation fixes.
-Fix various warnings when compiling with -Wall.
-Fix two buffer overflows found by Google's OSS-Fuzz.
-Other minor updates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{aspell_0.60.8.bb => aspell_0.60.8.1.bb}  |   7 +-
 .../aspell/files/CVE-2019-25051.patch         | 101 ------------------
 2 files changed, 2 insertions(+), 106 deletions(-)
 rename meta/recipes-support/aspell/{aspell_0.60.8.bb => aspell_0.60.8.1.bb} (83%)
 delete mode 100644 meta/recipes-support/aspell/files/CVE-2019-25051.patch

diff --git a/meta/recipes-support/aspell/aspell_0.60.8.bb b/meta/recipes-support/aspell/aspell_0.60.8.1.bb
similarity index 83%
rename from meta/recipes-support/aspell/aspell_0.60.8.bb
rename to meta/recipes-support/aspell/aspell_0.60.8.1.bb
index 39b55f4ff2..0ea9b063e0 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.1.bb
@@ -13,11 +13,8 @@ HOMEPAGE = "http://aspell.net/"
 LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
-           file://CVE-2019-25051.patch \
-"
-SRC_URI[md5sum] = "012fa9209203ae4e5a61c2a668fd10e3"
-SRC_URI[sha256sum] = "f9b77e515334a751b2e60daab5db23499e26c9209f5e7b7443b05235ad0226f2"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
+SRC_URI[sha256sum] = "d6da12b34d42d457fa604e435ad484a74b2effcd120ff40acd6bb3fb2887d21b"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
diff --git a/meta/recipes-support/aspell/files/CVE-2019-25051.patch b/meta/recipes-support/aspell/files/CVE-2019-25051.patch
deleted file mode 100644
index 8513f6de79..0000000000
--- a/meta/recipes-support/aspell/files/CVE-2019-25051.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 0718b375425aad8e54e1150313b862e4c6fd324a Mon Sep 17 00:00:00 2001
-From: Kevin Atkinson <kevina@gnu.org>
-Date: Sat, 21 Dec 2019 20:32:47 +0000
-Subject: [PATCH] objstack: assert that the alloc size will fit within a chunk
- to prevent a buffer overflow
-
-Bug found using OSS-Fuze.
-
-Upstream-Status: Backport
-[https://github.com/gnuaspell/aspell/commit/0718b375425aad8e54e1150313b862e4c6fd324a]
-CVE: CVE-2019-25051
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
----
- common/objstack.hpp | 18 ++++++++++++++----
- 1 file changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/common/objstack.hpp b/common/objstack.hpp
-index 3997bf7..bd97ccd 100644
---- a/common/objstack.hpp
-+++ b/common/objstack.hpp
-@@ -5,6 +5,7 @@
- #include "parm_string.hpp"
- #include <stdlib.h>
- #include <assert.h>
-+#include <stddef.h>
- 
- namespace acommon {
- 
-@@ -26,6 +27,12 @@ class ObjStack
-   byte * temp_end;
-   void setup_chunk();
-   void new_chunk();
-+  bool will_overflow(size_t sz) const {
-+    return offsetof(Node,data) + sz > chunk_size;
-+  }
-+  void check_size(size_t sz) {
-+    assert(!will_overflow(sz));
-+  }
- 
-   ObjStack(const ObjStack &);
-   void operator=(const ObjStack &);
-@@ -56,7 +63,7 @@ class ObjStack
-   void * alloc_bottom(size_t size)  {
-     byte * tmp = bottom;
-     bottom += size;
--    if (bottom > top) {new_chunk(); tmp = bottom; bottom += size;}
-+    if (bottom > top) {check_size(size); new_chunk(); tmp = bottom; bottom += size;}
-     return tmp;
-   }
-   // This alloc_bottom will insure that the object is aligned based on the
-@@ -66,7 +73,7 @@ class ObjStack
-     align_bottom(align);
-     byte * tmp = bottom;
-     bottom += size;
--    if (bottom > top) {new_chunk(); goto loop;}
-+    if (bottom > top) {check_size(size); new_chunk(); goto loop;}
-     return tmp;
-   }
-   char * dup_bottom(ParmString str) {
-@@ -79,7 +86,7 @@ class ObjStack
-   // always be aligned as such.
-   void * alloc_top(size_t size) {
-     top -= size;
--    if (top < bottom) {new_chunk(); top -= size;}
-+    if (top < bottom) {check_size(size); new_chunk(); top -= size;}
-     return top;
-   }
-   // This alloc_top will insure that the object is aligned based on
-@@ -88,7 +95,7 @@ class ObjStack
-   {loop:
-     top -= size;
-     align_top(align);
--    if (top < bottom) {new_chunk(); goto loop;}
-+    if (top < bottom) {check_size(size); new_chunk(); goto loop;}
-     return top;
-   }
-   char * dup_top(ParmString str) {
-@@ -117,6 +124,7 @@ class ObjStack
-   void * alloc_temp(size_t size) {
-     temp_end = bottom + size;
-     if (temp_end > top) {
-+      check_size(size);
-       new_chunk();
-       temp_end = bottom + size;
-     }
-@@ -131,6 +139,7 @@ class ObjStack
-     } else {
-       size_t s = temp_end - bottom;
-       byte * p = bottom;
-+      check_size(size);
-       new_chunk();
-       memcpy(bottom, p, s);
-       temp_end = bottom + size;
-@@ -150,6 +159,7 @@ class ObjStack
-     } else {
-       size_t s = temp_end - bottom;
-       byte * p = bottom;
-+      check_size(size);
-       new_chunk();
-       memcpy(bottom, p, s);
-       temp_end = bottom + size;
-- 
2.34.1


