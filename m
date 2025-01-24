Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CEAC02182
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 00:00:58 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.225.1737676852940972196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 16:00:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I73Xk15Q;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737676853; x=1769212853;
  h=from:to:cc:subject:date:message-id;
  bh=QsbMqDuutWCYR19Iq+GTeYQzsZa5eHgOWS0fBEtXgwE=;
  b=I73Xk15Q7guQyEMR7Ioa1sPEJp7wq9ig8uL2Wdw9ogYlFYppJh2AejYs
   P9BXhLT5s07w33StQyIU0rEDHHIXLFNEJHMX/HZEw0AHA0+yq9iV3nltt
   EF1uF8HnJInshZsf6lqsQ3fIASDZZBvX76zIn/9QxaSz0TqmwJgZW96mG
   o83JJZ63E5o+6usmE3117a2b5Zah4yN6fMg1nPMXsdLQ+UUKVWCCv1mbK
   dP+hSXCopJvdQfPz0mO7PmJxN3YOY3oJscZya5kD2pL/xgSbiz8+6S0as
   vNkQsy0AGqvSs/ta8RPC3TE+fE3nOcDBy/iy9hsiRN5vk0v4sP3xkqWWU
   Q==;
X-CSE-ConnectionGUID: pVeUpdRAQoCcxWyVDCRoJQ==
X-CSE-MsgGUID: g1lC58N8SbC43YvXOQ2GVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="175948602"
X-IronPort-AV: E=Sophos;i="6.13,229,1732546800"; 
   d="scan'208";a="175948602"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 09:00:50 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 26736B406C
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 09:00:48 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E670AD0AD7
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 09:00:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BFF5E4AB4
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 09:00:47 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EE4131A0074;
	Fri, 24 Jan 2025 08:00:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [OE-core] [PATCH] ncurses: update to latest version
Date: Fri, 24 Jan 2025 08:00:43 +0800
Message-Id: <1737676843-10340-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28942.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28942.003
X-TMASE-Result: 10--6.847800-10.000000
X-TMASE-MatchedRID: 9YmJ+rCjjhG/zwxKdmuyBzo39wOA02LhMVx/3ZYby7+AI7Mvq/sL5+n7
	ya/+V5vjmrS/IzG3CN2D0fiPNa0yFuRZDz3acVPM/sUSFaCjTLxxXefgn/TNQ1yBP7yEykbVwlH
	EoNRkLSitsvFtd2QDjJiZJN9vH+EeiCsqewnUZGD8dMpK2wMYwkc1DwKoQo7YpKG9GN+fhxSN3H
	kV2EiaAyL637QCIVpiytuC65NNIO5MGF0Ua9spp5VRzPxemJL0F4r8H5YrEqywxkbalTMB84yxF
	TrxUwZkQA5yz5TdUE2UG1C0RdcjvHYMpxnz5ObKYrc32n84WHrh8DHCE/SigYaYRB/7FzEQssbE
	kSX6c0larX/OF3EJAvD/aJAhh3s4qqg2TSZUFr2zRPQ8T4oe5RjxUZ5vLZHp5lhx0mBJyPFEDiH
	NtFOhEj0NjcxBITAitz9kIuTkBq6vvxILmKK/HBRFJJyf5BJeAaUQk5EZOUn6C0ePs7A07Xi4XE
	oPXecxUVeE72Mv3dTLgQz8u7mHpdQ9FHTkFdVI0DlhEBcNZLk=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 00:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210214

From: Wang Mingyu <wangmy@fujitsu.com>

exit_prototype.patch
removed since it's included in latest version.

License-Update: Copyright year updated to 2025

Changelog:
==========
- improve pattern used for configure --with-xterm-kbs option
- update configure macros, from work on cdk and dialog.
- change a parameter name in curs_sp_funcs.3x, for consistency
- improve formatting/style of manpages
- change winwstr() to a generated function, using the macro definition,
- moving its handling of negative length parameter into winnwstr().
- correct actual-function name in a few trace calls.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ncurses/files/exit_prototype.patch        | 31 -------------------
 meta/recipes-core/ncurses/ncurses.inc         |  2 +-
 meta/recipes-core/ncurses/ncurses_6.5.bb      |  3 +-
 3 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-core/ncurses/files/exit_prototype.patch

diff --git a/meta/recipes-core/ncurses/files/exit_prototype.patch b/meta/recipes-core/ncurses/files/exit_prototype.patch
deleted file mode 100644
index 299852d2c0..0000000000
--- a/meta/recipes-core/ncurses/files/exit_prototype.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From af798dceafec8a9ea3f83fc250d784511ca0a29c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 30 Aug 2022 15:58:32 -0700
-Subject: [PATCH] Add needed headers for including mbstate_t and exit()
-
-Upstream-Status: Inappropriate [Reconfigure will solve it]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure b/configure
-index 005d44e2..72fa6c23 100755
---- a/configure
-+++ b/configure
-@@ -3462,6 +3462,7 @@ rm -f "conftest.$ac_objext" "conftest.$ac_ext"
-   cat >"conftest.$ac_ext" <<_ACEOF
- #line 3463 "configure"
- #include "confdefs.h"
-+#include <stdlib.h>
- $ac_declaration
- int
- main (void)
-@@ -13533,6 +13534,7 @@ cat >"conftest.$ac_ext" <<_ACEOF
- #include <stdlib.h>
- #include <stdarg.h>
- #include <stdio.h>
-+#include <wchar.h>
- #ifdef HAVE_LIBUTF8_H
- #include <libutf8.h>
- #endif
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index e96ee075bd..d5d53359f3 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -2,7 +2,7 @@ SUMMARY = "The New Curses library"
 DESCRIPTION = "SVr4 and XSI-Curses compatible curses library and terminfo tools including tic, infocmp, captoinfo. Supports color, multiple highlights, forms-drawing characters, and automatic recognition of keypad and function-key sequences. Extensions include resizable windows and mouse support on both xterm and Linux console using the gpm library."
 HOMEPAGE = "http://www.gnu.org/software/ncurses/ncurses.html"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6f291ee54551d9d8d992ecd623fe4bc7;endline=27"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c534844fa5a74d14ae8fa3d9b3b42138;endline=27"
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS:class-native = ""
diff --git a/meta/recipes-core/ncurses/ncurses_6.5.bb b/meta/recipes-core/ncurses/ncurses_6.5.bb
index 2e3ee337ea..708aeeb446 100644
--- a/meta/recipes-core/ncurses/ncurses_6.5.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.5.bb
@@ -3,10 +3,9 @@ require ncurses.inc
 SRC_URI += "file://0001-tic-hang.patch \
            file://0002-configure-reproducible.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
-           file://exit_prototype.patch \
            "
 # commit id corresponds to the revision in package version
-SRCREV = "1c55d64d9d3e00399a21f04e9cac1e472ab5f70a"
+SRCREV = "752b540280a58c0ba0cc048e88518667409c1429"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+_\d+)$"
-- 
2.43.0


