Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86950D3B7C1
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 01:30:28 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.36000.1732584617971786418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 17:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AC1+/1rD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732584621; x=1764120621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=19pECTLFgUFKilbOn6aJ7ZCFlZ85j4byjbhU8EgKKgM=;
  b=AC1+/1rD8aZaoiKbVgIYetH1VngRk5cZhO3rrmubWF03mEThOhG3wwWS
   zWdN+9Xgg2mmqOWcrjP3Ny3o8IhsNBrfkwIcU5FJom/4JanoAml+CmGcA
   xatu3eix/yzZZflAYwPGPfg69LYHeZEFOUTv/b4GkdkoWhXLsyIP2oMZc
   d/0mc1K75E9vZHvF9qr4nHfWfZKMspQCe9pg9fHWJIHCbJXTKZssRn+vl
   +/3STotKccnZFlGoj/BJgjIi566RoXIhrDNciVV/pGUgWUfaY9PCsxbUB
   rfQ0kBQ+bARdtvQ/vld+8WJvqTxqUgklf3Bu0xNlcBUXvbktcMTpKAXBb
   Q==;
X-CSE-ConnectionGUID: fcPl2JsiSYKn+uWcHuL2gw==
X-CSE-MsgGUID: 9K8bUuV9RfWFdVIX5crpKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="180811762"
X-IronPort-AV: E=Sophos;i="6.12,184,1728918000"; 
   d="scan'208";a="180811762"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:30:20 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A2E0BDBB80
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3312EBF3CD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BE4A221D17F
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6B3921A006C;
	Tue, 26 Nov 2024 09:30:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/16] mtools: upgrade 4.0.45 -> 4.0.46
Date: Tue, 26 Nov 2024 09:29:54 +0800
Message-Id: <1732584602-4785-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28820.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28820.004
X-TMASE-Result: 10--1.912000-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yTo39wOA02LhpxAd6mi1Ga2mQTCqZT6QS4Uw
	AEo+4rVFhAZlpYV48PIMyw6hMrtYUIgrKnsJ1GRgP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW7rCDPw9MoAWGpE0b5fZ6WWdsQ5n2hjtHXThGbP9qB93ESuz0x2weESmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1DBbGvtcMofwk+Njhp5TmIgC9FjxyJv4GrzKAvTtwop+sFN4Do6S9Oy0pe
	mO6x1ZkroaOrfTAcvXN/WdXBdyu1j6lbU7+ccSTpk1AhyrDwQsdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 01:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207814

From: Wang Mingyu <wangmy@fujitsu.com>

clang_UNUSED.patch
mtools-makeinfo.patch
refreshed for 4.0.46

Changelog:
=============
- iconv buffer overflow fixes
- removed references to mread and mwrite (obsolete subcommands
from mcopy)
- documented mdoctorfat, and addressed 2 bugs/oversights
- removed references to obsolete mread and mwrite
- portability fixes (dietlibc and MacOS X) & simplification

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mtools/mtools/clang_UNUSED.patch             |  6 +++---
 .../mtools/mtools/mtools-makeinfo.patch          | 16 ++++++++--------
 .../{mtools_4.0.45.bb => mtools_4.0.46.bb}       |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.45.bb => mtools_4.0.46.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
index 20a6d1b8b3..1420d84b86 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,4 +1,4 @@
-From c72d075cb0c3a65ef17621c7ed1ffac35ca3b68e Mon Sep 17 00:00:00 2001
+From 6654edfb1eee416b58bcb6490658f80071a353c2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 Sep 2018 11:55:41 -0700
 Subject: [PATCH] Undefine UNUSED macros with clang
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sysincludes.h b/sysincludes.h
-index e16ab45..8d285d4 100644
+index 6b322ff..48daecd 100644
 --- a/sysincludes.h
 +++ b/sysincludes.h
-@@ -98,7 +98,7 @@ typedef void *caddr_t;
+@@ -85,7 +85,7 @@ ac_cv_func_setpgrp_void=yes ../mtools/configure --build=i386-linux-gnu --host=i3
  #if defined __GNUC__ && defined __STDC__
  /* gcc -traditional doesn't have PACKED, UNUSED and NORETURN */
  # define PACKED __attribute__ ((packed))
diff --git a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
index 3771f94c59..8c80040f91 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,4 +1,4 @@
-From 184b76e9742ff89f90a066edb0f46b4a150351cf Mon Sep 17 00:00:00 2001
+From fd1e84c66852c2c906ee292aad942b4bfbd9e306 Mon Sep 17 00:00:00 2001
 From: Marcin Juszkiewicz <hrw@openedhand.com>
 Date: Fri, 8 Jun 2007 08:35:12 +0000
 Subject: [PATCH] mtools: imported from OE
@@ -6,11 +6,11 @@ Subject: [PATCH] mtools: imported from OE
 Upstream-Status: Inappropriate [licensing]
 ---
  Makefile.in  | 11 ++++++-----
- configure.in | 27 +++++++++++++++++++++++++++
+ configure.ac | 27 +++++++++++++++++++++++++++
  2 files changed, 33 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 5db50d7..92ad461 100644
+index 7b305b0..70c8c74 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -26,10 +26,11 @@ USERCFLAGS =
@@ -38,11 +38,11 @@ index 5db50d7..92ad461 100644
  
  pdf: mtools.pdf
  %.pdf: %.texi sysconfdir.texi
-diff --git a/configure.in b/configure.in
-index 1de916e..fd6cb08 100644
---- a/configure.in
-+++ b/configure.in
-@@ -32,6 +32,33 @@ AC_CANONICAL_TARGET
+diff --git a/configure.ac b/configure.ac
+index de108a8..0fd9ef0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -33,6 +33,33 @@ AC_CANONICAL_TARGET
  AC_C_CONST
  AC_C_INLINE
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.45.bb b/meta/recipes-devtools/mtools/mtools_4.0.46.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.45.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.46.bb
index 34040d7a0d..1173718662 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.45.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.46.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "0b008a96bd0efe0e542fa4383d469af66bc4a93394990b103730a8160a67d618"
+SRC_URI[sha256sum] = "9aad8dd859f88fb7787924ec47590192d3abf7bad6c840509c854290d6bc16c0"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.34.1


