Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBFCCD98D1
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:50:13 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16355.1781085012068892741
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 02:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T4+NH93H;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781085012; x=1812621012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qpG/MIpNAILFwDFJ7w4VmrsyKXKfPEmVdgQ3lwc28SY=;
  b=T4+NH93HnSY78cVuqA7M2Pk7BRtNvL6w5UvR2CRmONs/uyyBBaZW/2Ii
   5Hgp7EekmMTOFI8qO3PbUZZlro8oELjrqp4rGlT9KsKORBcH0eSY2EkZ+
   h+7fpaPKdwvnV0UDOS7H9grR6U6r1tiv0ZD8Iu8/U0zUi6jX9bQaLePhK
   5kghGhxOF7dhTBurCp+DzSorfIGbEu+V61swLQB4Xwew/m5SOg0Ym1rr9
   Ca26783Xpp6TuGtBf9bYs0FcYBgSRYkbvY6O92toP82pTM7TZxwZVvitp
   c2q0i1yDF6Kv/OfZVgeKSsEtNbrn+Z/4jptaobSgsXYaGAxjc5hReSAnJ
   w==;
X-CSE-ConnectionGUID: k9d08WT+R5yyIYPbxcCx0w==
X-CSE-MsgGUID: l1YeInT5QFiNSQ6Qq8DtUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="241790671"
X-IronPort-AV: E=Sophos;i="6.24,197,1774278000"; 
   d="scan'208";a="241790671"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:50:10 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 98CE78203C3
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:10 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 513B8829CCE
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7ABFC14000A3;
	Wed, 10 Jun 2026 09:50:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/16] kbd: upgrade 2.9.0 -> 2.10.0
Date: Wed, 10 Jun 2026 17:49:29 +0800
Message-ID: <20260610094932.2264-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260610094932.2264-1-wangmy@fujitsu.com>
References: <20260610094932.2264-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238339

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Preserve-only-necessary-metadata-during-install.patch
0001-libkbdfile-Fix-problem-with-undeclared-sym_gzopen.patch
removed since they're included in 2.10.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ly-necessary-metadata-during-install.patch | 54 ------------------
 ...x-problem-with-undeclared-sym_gzopen.patch | 57 -------------------
 .../kbd/{kbd_2.9.0.bb => kbd_2.10.0.bb}       |  7 +--
 3 files changed, 2 insertions(+), 116 deletions(-)
 delete mode 100644 meta/recipes-core/kbd/kbd/0001-Preserve-only-necessary-metadata-during-install.patch
 delete mode 100644 meta/recipes-core/kbd/kbd/0001-libkbdfile-Fix-problem-with-undeclared-sym_gzopen.patch
 rename meta/recipes-core/kbd/{kbd_2.9.0.bb => kbd_2.10.0.bb} (87%)

diff --git a/meta/recipes-core/kbd/kbd/0001-Preserve-only-necessary-metadata-during-install.patch b/meta/recipes-core/kbd/kbd/0001-Preserve-only-necessary-metadata-during-install.patch
deleted file mode 100644
index 87275040c1..0000000000
--- a/meta/recipes-core/kbd/kbd/0001-Preserve-only-necessary-metadata-during-install.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From d9d1c22592b6ce21bf455a22bca9000bf9b3fe61 Mon Sep 17 00:00:00 2001
-From: Alexey Gladkov <legion@kernel.org>
-Date: Wed, 10 Sep 2025 10:45:25 +0200
-Subject: [PATCH] Preserve only necessary metadata during install
-
-"cp -a" tries to preserve all attributes if possible. This implies
-preserving mode, any ACL, xattr permissions, and security context.
-
-In some cases (such as fakeroot), it is not possible to preserve that
-all attributes are preserved.
-
-  cp: failed to preserve ownership for /tmp/.pkgmk/pkg/usr/share/kbd/keymaps/i386/qwertz/sr-latin.map.gz: Operation not supported
-
-To avoid this, we will require that only the necessary attributes be
-preserved. It is important for us to preserve the simlinks.
-
-Signed-off-by: Alexey Gladkov <legion@kernel.org>
-Upstream-Status: Backport [https://github.com/legionus/kbd/commit/db82eb6f86e6c0b8ac4260e88b88d66e1cd7c077]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- data/Makefile.am | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/data/Makefile.am b/data/Makefile.am
-index a730062..4d2ae3d 100644
---- a/data/Makefile.am
-+++ b/data/Makefile.am
-@@ -44,21 +44,21 @@ endif
- 
- install-consolefonts: $(SRC_FONTDIR) $(SRC_PARTIALDIR)
- 	mkdir -p -m 755 -- $(DESTDIR)$(datadir)/$(FONTDIR)
--	cp -a -- $(SRC_FONTDIR)/* $(DESTDIR)$(datadir)/$(FONTDIR)/
-+	cp -dPR -- $(SRC_FONTDIR)/* $(DESTDIR)$(datadir)/$(FONTDIR)/
- 	mkdir -p -m 755 -- $(DESTDIR)$(datadir)/$(FONTDIR)/$(PARTIALDIR)
--	cp -a -- $(SRC_PARTIALDIR)/* $(DESTDIR)$(datadir)/$(FONTDIR)/$(PARTIALDIR)/
-+	cp -dPR -- $(SRC_PARTIALDIR)/* $(DESTDIR)$(datadir)/$(FONTDIR)/$(PARTIALDIR)/
- 
- install-consoletrans:
- 	mkdir -p -m 755 -- $(DESTDIR)$(datadir)/$(TRANSDIR)
--	cp -a -- $(srcdir)/$(TRANSDIR)/* $(DESTDIR)$(datadir)/$(TRANSDIR)/
-+	cp -dPR -- $(srcdir)/$(TRANSDIR)/* $(DESTDIR)$(datadir)/$(TRANSDIR)/
- 
- install-unimaps:
- 	mkdir -p -m 755 -- $(DESTDIR)$(datadir)/$(UNIMAPDIR)
--	cp -a -- $(srcdir)/$(UNIMAPDIR)/* $(DESTDIR)$(datadir)/$(UNIMAPDIR)/
-+	cp -dPR -- $(srcdir)/$(UNIMAPDIR)/* $(DESTDIR)$(datadir)/$(UNIMAPDIR)/
- 
- install-keymaps: $(SRC_KEYMAPDIR)
- 	mkdir -p -m 755 -- $(DESTDIR)$(datadir)/$(KEYMAPDIR)
--	cp -ar -- $(SRC_KEYMAPDIR)/* $(DESTDIR)$(datadir)/$(KEYMAPDIR)/
-+	cp -dPR -- $(SRC_KEYMAPDIR)/* $(DESTDIR)$(datadir)/$(KEYMAPDIR)/
- 	cd "$(DESTDIR)$(datadir)/$(KEYMAPDIR)"; \
- 	  for f in $(IGNORE_KEYMAPS); do ! test -e "$$f" || rm -f -- "$$f"; done
- 	rm -f $(DESTDIR)$(datadir)/$(KEYMAPDIR)/ppc
diff --git a/meta/recipes-core/kbd/kbd/0001-libkbdfile-Fix-problem-with-undeclared-sym_gzopen.patch b/meta/recipes-core/kbd/kbd/0001-libkbdfile-Fix-problem-with-undeclared-sym_gzopen.patch
deleted file mode 100644
index 84d273c19a..0000000000
--- a/meta/recipes-core/kbd/kbd/0001-libkbdfile-Fix-problem-with-undeclared-sym_gzopen.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 2f9a4e56c2ef245fbe840677aad9d5932e17f50d Mon Sep 17 00:00:00 2001
-From: Alexey Gladkov <legion@kernel.org>
-Date: Mon, 8 Dec 2025 11:28:24 +0100
-Subject: [PATCH] libkbdfile: Fix problem with undeclared sym_gzopen
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-A compile error occurs on certain systems:
-
-kbdfile-zlib.c: In function 'dlopen_note':
-elf-note.h:27:30: error: 'sym_gzopen' undeclared (first use in this function); did you mean 'sym_gzopen64'?
-   27 | #define DLSYM_ARG(symbol__) &sym_##symbol__, STRINGIFY(symbol__),
-
-kbdfile-zlib.c: In function 'kbdfile_decompressor_zlib': kbdfile-zlib.c:61:15: error: implicit declaration of function 'sym_gzopen'; did you mean 'sym_gzopen64'?
- [-Wimplicit-function-declaration]
-   61 |         gzf = sym_gzopen(file->pathname, "rb");
-
-The problem arises because if -D_FILE_OFFSET_BITS=64 is specified, which
-in zlib ultimately makes gzopen a macro that expands to gzopen64.
-DECLARE_SYM(gzopen) from elf-note.h then expands gzopen to gzopen64,
-resulting in sym_gzopen64 declared. That's why no sym_gzopen exists.
-
-Link: https://github.com/legionus/kbd/pull/150
-Suggested-by: Jan Čermák <sairon@sairon.cz>
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-Signed-off-by: Alexey Gladkov <legion@kernel.org>
-
-Upstream-Status: Backport [https://github.com/legionus/kbd/commit/2f9a4e56c2ef245fbe840677aad9d5932e17f50d]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- src/libkbdfile/elf-note.h | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/src/libkbdfile/elf-note.h b/src/libkbdfile/elf-note.h
-index a0fd9e2..d3b8d5c 100644
---- a/src/libkbdfile/elf-note.h
-+++ b/src/libkbdfile/elf-note.h
-@@ -26,14 +26,11 @@ int dlsym_many(void **dlp, const char *filename, ...);
-  */
- #define DLSYM_ARG(symbol__) &sym_##symbol__, STRINGIFY(symbol__),
- 
--/* For symbols being dynamically loaded */
--#define DECLARE_DLSYM(symbol) static typeof(symbol) *sym_##symbol
--
- /*
-  * Helper defines, to be done locally before including this header to switch between
-  * implementations
-  */
--#define DECLARE_SYM(sym__) DECLARE_DLSYM(sym__);
-+#define DECLARE_SYM(sym__) static typeof(sym__) *sym_##sym__;
- 
- /*
-  * Originally from systemd codebase.
--- 
-2.49.0
-
diff --git a/meta/recipes-core/kbd/kbd_2.9.0.bb b/meta/recipes-core/kbd/kbd_2.10.0.bb
similarity index 87%
rename from meta/recipes-core/kbd/kbd_2.9.0.bb
rename to meta/recipes-core/kbd/kbd_2.10.0.bb
index 79b011e529..5a877b9c04 100644
--- a/meta/recipes-core/kbd/kbd_2.9.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.10.0.bb
@@ -23,12 +23,9 @@ RREPLACES:${PN} = "console-tools"
 RPROVIDES:${PN} = "console-tools"
 RCONFLICTS:${PN} = "console-tools"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
-           file://0001-Preserve-only-necessary-metadata-during-install.patch \
-           file://0001-libkbdfile-Fix-problem-with-undeclared-sym_gzopen.patch \
-           "
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "fb3197f17a99eb44d22a3a1a71f755f9622dd963e66acfdea1a45120951b02ed"
+SRC_URI[sha256sum] = "6e5ca4f8d76ee9e3a8db700b667f13e12aac9933828a64e1aaad93d26be9b479"
 
 # 'gzip -n' is set due to https://github.com/legionus/kbd/issues/124
 EXTRA_OECONF = "--disable-tests --enable-compress='gzip -n'"
-- 
2.43.0


