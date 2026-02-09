Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC0AE78D40
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:03:35 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43584.1770627806559410829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:03:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GeXg+NQL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627806; x=1802163806;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XN26IEQwzZ31u3grP/3zX+IAZIsDKIPvTYu/LnDT80M=;
  b=GeXg+NQLYwjlWVZWoiFElchM2j4eN4lJu7HHga4DDdWF5g9ymheXmGXL
   viQh5nDfdNT4vvqbnH3oo8//KVgHM1zKWhd8vOVL0641gh8q6xPHaSB0X
   zUtEtIEuM04ioQEq4GxgQhrKiW0EXo9FXcq91UFrUeqSxjE+UAow/FKzB
   JB9pY3vnQp3Le8Pm91MN+CvqsYWisFae/kOsKeV/2MK3Qq4KsayaFPnIm
   zrws2p5pp4vv3NAMU2mOn57cOlevzkpLUsadII5DXML4bj6meNBrZeeCR
   wJgBA3aubo0U4qUPUOlw2A/hHXAoD5bgfjty2k1Pk+ztKJQggryUCNJUl
   w==;
X-CSE-ConnectionGUID: DORV6MvFTl2FJ+OqaImqYw==
X-CSE-MsgGUID: xHHwhrblSVatUTBC0UBSVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="229032424"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="229032424"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:03:25 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id C376E1000346
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:24 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 6525B8D72C0
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id B82E9101BB75;
	Mon,  9 Feb 2026 09:03:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/39] aspell: upgrade 0.60.8.1 -> 0.60.8.2
Date: Mon,  9 Feb 2026 17:02:39 +0800
Message-ID: <20260209090317.1468-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230712

From: Wang Mingyu <wangmy@fujitsu.com>

0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
removed since it's included in 0.60.8.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...default-vector_hash-t.hpp-fix-gcc-15.patch | 42 -------------------
 ...{aspell_0.60.8.1.bb => aspell_0.60.8.2.bb} |  5 +--
 2 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
 rename meta/recipes-support/aspell/{aspell_0.60.8.1.bb => aspell_0.60.8.2.bb} (84%)

diff --git a/meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch b/meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
deleted file mode 100644
index 4045e8e412..0000000000
--- a/meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From d45bf96b0a3556acb2c83069a78eaaac973d31b4 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Sun, 21 Jul 2024 22:01:50 +0100
-Subject: [PATCH] modules/speller/default/vector_hash-t.hpp: fix gcc-15 build
-
-Uncoming `gcc-15` added extra checks for template instantiation that is
-guaranteed to fail in
-  https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=313afcfdabeab3e6705ac0bd1273627075be0023
-
-As a result `aspell` build now fails as:
-
-    In file included from modules/speller/default/readonly_ws.cpp:51:
-    modules/speller/default/vector_hash-t.hpp: In member function 'void aspeller::VectorHashTable<Parms>::recalc_size()':
-    modules/speller/default/vector_hash-t.hpp:186:43: error: 'class aspeller::VectorHashTable<Parms>' has no member named 'e'
-      186 |     for (iterator i = begin(); i != this->e; ++i, ++this->_size);
-          |                                           ^
-    modules/speller/default/vector_hash-t.hpp:186:59: error: 'class aspeller::VectorHashTable<Parms>' has no member named '_size'; did you mean 'size'?
-      186 |     for (iterator i = begin(); i != this->e; ++i, ++this->_size);
-          |                                                           ^~~~~
-          |                                                           size
-
-It looks like `_size` is `size_` mis-spelling and `e` was not introduced
-here.
-Upstream-Status: Backport [https://github.com/GNUAspell/aspell/commit/ee6cbb12ff36a1e6618d7388a78dd4e0a2b44041]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- modules/speller/default/vector_hash-t.hpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules/speller/default/vector_hash-t.hpp b/modules/speller/default/vector_hash-t.hpp
-index 969a80c..e4420b4 100644
---- a/modules/speller/default/vector_hash-t.hpp
-+++ b/modules/speller/default/vector_hash-t.hpp
-@@ -183,7 +183,7 @@ namespace aspeller {
-   template<class Parms>
-   void VectorHashTable<Parms>::recalc_size() {
-     size_ = 0;
--    for (iterator i = begin(); i != this->e; ++i, ++this->_size);
-+    for (iterator i = begin(), e = end(); i != e; ++i, ++size_);
-   }
- 
- }
diff --git a/meta/recipes-support/aspell/aspell_0.60.8.1.bb b/meta/recipes-support/aspell/aspell_0.60.8.2.bb
similarity index 84%
rename from meta/recipes-support/aspell/aspell_0.60.8.1.bb
rename to meta/recipes-support/aspell/aspell_0.60.8.2.bb
index 43940b1e1b..5b4fab7c35 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.2.bb
@@ -13,9 +13,8 @@ HOMEPAGE = "http://aspell.net/"
 LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
-           file://0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch"
-SRC_URI[sha256sum] = "d6da12b34d42d457fa604e435ad484a74b2effcd120ff40acd6bb3fb2887d21b"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
+SRC_URI[sha256sum] = "57fe4863eae6048f72245a8575b44b718fb85ca14b9f8c0afc41b254dfd76919"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
-- 
2.43.0


