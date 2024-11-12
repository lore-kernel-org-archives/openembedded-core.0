Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70771D32D73
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:26:06 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.82745.1731403556170454521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bKiNr4n0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403559; x=1762939559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=clJzIxnFGwe6UVzUXjrFvh2dTnE+TvGhyDZDAj0NrJM=;
  b=bKiNr4n04OTuq9628MgIysoDOU892iN5bS9n5AufpUganqDzjW76wlrf
   UFmCv7Kpore1XPwcX1VpmWgwZRBfcDWb+iBzN5xSaQ/tU1OHF8w+SonCJ
   WC2Idg0zKCVFYrXJv34QdyK2ceFOKQAMu8zxQ3/qbqm1ig/QtYI5OAoJh
   tODfIQ6feozCMT0hIh/g8PEq6RcqW1QEckFxLqCWuIUANgpbmgR5Df521
   LuBTs9t0CJ4cZpqBYUgXa6/OT6dYCcg2CNCdWjKQ5bLkmBilHx9mqxsHa
   YbgcAob38nvDJlvZqBb9WJ6Y9qgq0EQPPr+nrP+sC/2Qlvxqf+BkmMKDd
   g==;
X-CSE-ConnectionGUID: nr52W8JHSJSzelX7GlKlkg==
X-CSE-MsgGUID: zE5gJvh4TMOmtQJKmm1pwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="180063563"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="180063563"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:57 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C7520D2AB6
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 55322BCB82
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E47D820079545
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 93B481A000A;
	Tue, 12 Nov 2024 17:25:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 45/47] vte: upgrade 0.78.0 -> 0.78.1
Date: Tue, 12 Nov 2024 17:24:41 +0800
Message-Id: <1731403483-21399-45-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--16.407500-10.000000
X-TMASE-MatchedRID: h8nmbN2t+rqjz0nOeth/yTyjd/AizytBMVx/3ZYby78PdZmyx8xAa3MW
	fmr8UEU8RPj3uQknVVESuJRtSU84o+CnSW1s2x7bzYK5U+QI3O43l2plwgrtWDBwx50fHFECIUt
	KH5AJM9ki+t+0AiFaYsrbguuTTSDuTBhdFGvbKaeVUcz8XpiS9Fqv7J128aQgEd+K6O5Nt51HSe
	kfNMkhVK2qG99PLRc3hVaMx/vKxVRH6+lhuE4fWjzHAJTgtKqwJ4cwIYL6Kuckt9BigJAcVtnrB
	TZCw4nq5ZV+p1mxM5CiXT3nBus7Gii/jer8TCiTPkILbTHNp5sCtGYG0znilPQJJFxg7p4qGyQB
	1oR95AqryzKorzz46OqSEdJSIYdGokNg5m43nfgqy6shOlK/41gv+2jH1dCRAolyO2xxVAUd1x0
	M3D7isuLzNWBegCW22NoXMyWzBEILbigRnpKlKSPzRlrdFGDwdhXRL5Vf2nZQ7LefUHQK3U9UQi
	MmegeIv2BoeR8YhmL1oCdtaxbMdw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207030

From: Wang Mingyu <wangmy@fujitsu.com>

0001-tests-Remove-excessive-constrexpr.patch
0003-Add-missing-system-headers.patch
removed since they're included in 0.78.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...01-tests-Remove-excessive-constrexpr.patch | 26 ------------
 .../vte/0003-Add-missing-system-headers.patch | 42 -------------------
 .../vte/{vte_0.78.0.bb => vte_0.78.1.bb}      | 12 +++---
 3 files changed, 5 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-support/vte/vte/0001-tests-Remove-excessive-constrexpr.patch
 delete mode 100644 meta/recipes-support/vte/vte/0003-Add-missing-system-headers.patch
 rename meta/recipes-support/vte/{vte_0.78.0.bb => vte_0.78.1.bb} (84%)

diff --git a/meta/recipes-support/vte/vte/0001-tests-Remove-excessive-constrexpr.patch b/meta/recipes-support/vte/vte/0001-tests-Remove-excessive-constrexpr.patch
deleted file mode 100644
index 779814f257..0000000000
--- a/meta/recipes-support/vte/vte/0001-tests-Remove-excessive-constrexpr.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 01a5c8235f8b3f7c691921169ad125a395186b3f Mon Sep 17 00:00:00 2001
-From: Christian Persch <chpe@src.gnome.org>
-Date: Tue, 17 Sep 2024 18:21:32 +0200
-Subject: [PATCH 1/3] tests: Remove excessive constrexpr
-
-Fixes: https://gitlab.gnome.org/GNOME/vte/-/issues/2819
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/vte/-/commit/c8838779d5f8c0e03411cef9775cd8f5a10a6204]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/color-test.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/color-test.cc b/src/color-test.cc
-index 0ed9089..1bfad31 100644
---- a/src/color-test.cc
-+++ b/src/color-test.cc
-@@ -165,7 +165,7 @@ static void
- test_color_to_string (void)
- {
-         auto test = [](std::string str,
--                       bool alpha = false) constexpr noexcept -> void
-+                       bool alpha = false) noexcept -> void
-         {
-                 auto const value = parse<rgba>(str);
-                 assert(value);
diff --git a/meta/recipes-support/vte/vte/0003-Add-missing-system-headers.patch b/meta/recipes-support/vte/vte/0003-Add-missing-system-headers.patch
deleted file mode 100644
index 66d2beb15a..0000000000
--- a/meta/recipes-support/vte/vte/0003-Add-missing-system-headers.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From add3dd52d2e2c19dfa9319de8d8335dca802ba5a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 30 Sep 2024 22:36:09 -0700
-Subject: [PATCH 3/3] Add missing system headers
-
-These are found out when using clang libc++
-
-algorithm is needed for std::max and std::min
-string_view for string_view
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/vte/-/issues/2824]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/icu-glue.hh | 1 +
- src/minifont.cc | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/icu-glue.hh b/src/icu-glue.hh
-index f2c3331..f72999b 100644
---- a/src/icu-glue.hh
-+++ b/src/icu-glue.hh
-@@ -20,6 +20,7 @@
- #include <glib.h>
- #include <memory>
- #include <optional>
-+#include <string_view>
- 
- namespace vte::base {
- 
-diff --git a/src/minifont.cc b/src/minifont.cc
-index 9be96d6..f4fe0bf 100644
---- a/src/minifont.cc
-+++ b/src/minifont.cc
-@@ -18,6 +18,7 @@
- 
- #include "config.h"
- 
-+#include <algorithm>
- #include <cmath>
- 
- #include "cairo-glue.hh"
diff --git a/meta/recipes-support/vte/vte_0.78.0.bb b/meta/recipes-support/vte/vte_0.78.1.bb
similarity index 84%
rename from meta/recipes-support/vte/vte_0.78.0.bb
rename to meta/recipes-support/vte/vte_0.78.1.bb
index 9ada53a634..5723f35b83 100644
--- a/meta/recipes-support/vte/vte_0.78.0.bb
+++ b/meta/recipes-support/vte/vte_0.78.1.bb
@@ -18,13 +18,11 @@ GIDOCGEN_MESON_OPTION = "docs"
 inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
-            file://0001-tests-Remove-excessive-constrexpr.patch \
-            file://0002-lib-Typo-fix.patch \
-            file://0003-Add-missing-system-headers.patch \
-            file://0004-fast_float-Add-single-header-library-for-from_char-i.patch \
-			file://0005-color-parser-Use-fast_float-implementation-for-from_.patch \
-"
-SRC_URI[archive.sha256sum] = "07f09c6228a8bb3c1599dd0f5a6ec797b30d3010c3ac91cf21b69d9635dfaf7c"
+           file://0002-lib-Typo-fix.patch \
+           file://0004-fast_float-Add-single-header-library-for-from_char-i.patch \
+           file://0005-color-parser-Use-fast_float-implementation-for-from_.patch \
+           "
+SRC_URI[archive.sha256sum] = "6499d25179315255f9bcfce03c66fb84c03ad325dea23d0e372178521eca42b5"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.34.1


