Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014B6C83F36
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:36 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.2949.1752566907680646826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gw0usyIi;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566908; x=1784102908;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OPaBZi5u2Sf9fNZQfz3oXli8WcwQVwx/mE7/IFSFA/Y=;
  b=Gw0usyIiNrON/opuLNRChTp8ZiIMAh79DfX3Z/gTbNAC1GPpigdpk3Uh
   XiKE2Jh/l67IHmuTBuk53OhweuKfYlpYT/LZfHdu+/78zqqg3FQuPQqme
   qOOyPOCO3BacGJZIbXiG4KwlyTp50Fb3SusYIXjHmwSRjdjFiQej+4Hs1
   61UqUaT8m9TNVEOYF8+gpUDs/CgdUQMwApLBAJGGiKVo1YyuBf9OY+lep
   eCQHB1RIk4OtuYKfseWQsG+WN1gJEK/HHSVj3RTW1iHIGWpORSOVvwRpQ
   JLNLrocCu0il6FeCr1Lio0uRTkyzonba79AA/E4CyBKV2U3zHUXtdO5b3
   Q==;
X-CSE-ConnectionGUID: Lc/Wm3bfTLqQIGijRVRzsg==
X-CSE-MsgGUID: a2Fu7wQwR9qOPgSUWhrEpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="185309320"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="185309320"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:26 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id E90471000345
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:25 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 40596C01825
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BB0EA1A0071;
	Tue, 15 Jul 2025 16:08:21 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/19] debugedit: upgrade 5.1 -> 5.2
Date: Tue, 15 Jul 2025 16:08:01 +0800
Message-ID: <20250715080819.622-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220270

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Add-option-to-allow-disabling-inlined-xxhash.patch
removed since it's included in 5.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{debugedit_5.1.bb => debugedit_5.2.bb}    |  3 +-
 ...on-to-allow-disabling-inlined-xxhash.patch | 81 -------------------
 2 files changed, 1 insertion(+), 83 deletions(-)
 rename meta/recipes-devtools/debugedit/{debugedit_5.1.bb => debugedit_5.2.bb} (87%)
 delete mode 100644 meta/recipes-devtools/debugedit/files/0001-Add-option-to-allow-disabling-inlined-xxhash.patch

diff --git a/meta/recipes-devtools/debugedit/debugedit_5.1.bb b/meta/recipes-devtools/debugedit/debugedit_5.2.bb
similarity index 87%
rename from meta/recipes-devtools/debugedit/debugedit_5.1.bb
rename to meta/recipes-devtools/debugedit/debugedit_5.2.bb
index 384909a36f..76c54ba63d 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.1.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.2.bb
@@ -10,11 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz \
-           file://0001-Add-option-to-allow-disabling-inlined-xxhash.patch \
            file://0003-Makefile.am-do-not-update-manual.patch \
            "
 
-SRC_URI[sha256sum] = "ee9b688b2ed8fa62551c54cb5dc31aaa05853e7dedbd9e1237c77894ea5e3626"
+SRC_URI[sha256sum] = "705296803cc4403f38764e891b4ed38f8d8d4f8a9164bd4f86c9d4bedcac68dd"
 
 DEPENDS = "elfutils xxhash"
 DEPENDS:append:libc-musl = " musl-legacy-error"
diff --git a/meta/recipes-devtools/debugedit/files/0001-Add-option-to-allow-disabling-inlined-xxhash.patch b/meta/recipes-devtools/debugedit/files/0001-Add-option-to-allow-disabling-inlined-xxhash.patch
deleted file mode 100644
index 3aac43628b..0000000000
--- a/meta/recipes-devtools/debugedit/files/0001-Add-option-to-allow-disabling-inlined-xxhash.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 820498e881401a6f4b1715dc6831da965f6e1d69 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 18 Feb 2025 18:50:46 -0800
-Subject: [PATCH] Add option to allow disabling inlined xxhash
-
-xxhash cannot always inline. For example, when using gcc14 and
-'-Og' option, xxhash cannot inline. See links below:
-https://github.com/Cyan4973/xxHash/commit/574aabad87b2ab9440403e92e1075ef48554eb87
-https://github.com/Cyan4973/xxHash/issues/943#issuecomment-2563205130
-
-To allow users successfully build debugedit with gcc14 and "-Og" option,
-add an option to allow disabling inlined xxhash.
-
-This patch refers to a similar patch for libabigail:
-https://sourceware.org/cgit/libabigail/commit/?id=50497911e2590c21270e0763d277457cf7752c3f
-
-Note that the default remains using inlined xxhash.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
-Upstream-Status: Backport [https://sourceware.org/cgit/debugedit/commit/?id=820498e881401a6f4b1715dc6831da965f6e1d69]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- Makefile.am       |  4 ++--
- configure.ac      | 11 +++++++++++
- tools/debugedit.c |  1 -
- 3 files changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index c590edf..35fd947 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -42,8 +42,8 @@ find-debuginfo: $(top_srcdir)/scripts/find-debuginfo.in Makefile
- 
- debugedit_SOURCES = tools/debugedit.c \
- 		    tools/hashtab.c 
--debugedit_CFLAGS = @LIBELF_CFLAGS@ @LIBDW_CFLAGS@ $(AM_CFLAGS)
--debugedit_LDADD = @LIBELF_LIBS@ @LIBDW_LIBS@
-+debugedit_CFLAGS = @LIBELF_CFLAGS@ @LIBDW_CFLAGS@ @XXHASH_CFLAGS@ $(AM_CFLAGS)
-+debugedit_LDADD = @LIBELF_LIBS@ @LIBDW_LIBS@ @XXHASH_LIBS@
- 
- sepdebugcrcfix_SOURCES = tools/sepdebugcrcfix.c
- sepdebugcrcfix_CFLAGS = @LIBELF_CFLAGS@ $(AM_CFLAGS)
-diff --git a/configure.ac b/configure.ac
-index a5a6e28..32dd27d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -181,6 +181,17 @@ else
- fi
- AC_SUBST([READELF_VERSION_OK])
- 
-+ENABLE_INLINED_XXHASH=yes
-+AC_ARG_ENABLE(inlined-xxhash,
-+	AS_HELP_STRING([--disable-inlined-xxhash], [disable the inlined-only version of xxhash library]),
-+	ENABLE_INLINED_XXHASH=$enableval,
-+	ENABLE_INLINED_XXHASH=yes)
-+
-+if test x$ENABLE_INLINED_XXHASH = xyes; then
-+	XXHASH_CFLAGS="$XXHASH_CFLAGS -DXXH_INLINE_ALL"
-+	XXHASH_LIBS=""
-+fi
-+
- # And generate the output files.
- AC_CONFIG_FILES([Makefile])
- AC_OUTPUT
-diff --git a/tools/debugedit.c b/tools/debugedit.c
-index beefd65..43f9cee 100644
---- a/tools/debugedit.c
-+++ b/tools/debugedit.c
-@@ -82,7 +82,6 @@ typedef struct Ebl_Strtab	Strtab;
- 
- #include "tools/hashtab.h"
- 
--#define XXH_INLINE_ALL
- #include "xxhash.h"
- 
- #define DW_TAG_partial_unit 0x3c
--- 
-2.25.1
-
-- 
2.43.0


