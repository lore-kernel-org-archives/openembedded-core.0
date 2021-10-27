Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D046C4332F
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:53 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9248.1635325672238107453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TOYukfvG;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id g7so1804556wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aeTAdUBa+psBRnCl2plcTizttaBdm6+zru1CiATiB+I=;
        b=TOYukfvGXvRTZ40LPXHf0yKVCet/FL52iWcCK+A08FrzHjpY6/WWiVZ2vTS6FjjbHW
         nOGj2YpiFvG5kH40B64oo6PaRPeIYyuQnbCw9w8JZe5Nq4UsVE5i4BAockspUblH4gO6
         i/pzcDJWQdj4vOjgJL+4ktyShgqA5w99rwrhFuNOc2sTwAw7QGghWJi6/Q/jeCRNwPnZ
         9wqcHAxKqOaJi6H5KPYpCMbSPu/ed1TDbBrkZ2gOwTutU6UAga4ufgXE1sBMtpeKANSZ
         jUcC/v3IxltXpi6UQ1wOb0JmKNu7xHTZIgc95Lnu7PFD949LiOJCnpKAUY7sxp8eMRRy
         /cpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aeTAdUBa+psBRnCl2plcTizttaBdm6+zru1CiATiB+I=;
        b=FqmBRYRmSAJjadkULEF5YYgVDCph3y0/174frH2IUsYd5rdGaSJPZQ0SoGyeSQKhzR
         SBd4YGG183XWsSeiUI0yP82VT6v3i7ig4J81HubJtUdyHWBh7TACy7VHZECR++hoFzuk
         exKdZRc8DCYkVn/YYUp1tSFf4cR3SDWhqwkpyhyn6/YAuwbiolX9db2e30FwDll2ZCyk
         p7Jt7kwUVpSqNQ8eSmrcuDTG40jWA7saGhx8E8xAUR7Vr61y9nArs8lNbpefjFkxhDXc
         wohMg4qsqsTobkJY6YpZf586Q8XxhB8rsNDXrr5kDw3dYaQpMGUVTYcsMg10C3puaz8y
         0jKw==
X-Gm-Message-State: AOAM530rh81F69XtmdCoFp3AaCG9sUyC3L37xDPVr82GRMnJdJZjD6I0
	yewDbSNgarcXZu8EqZpB3vtWNwUJqaw=
X-Google-Smtp-Source: 
 ABdhPJzYDdzlUsgbWHMhE6o/sFCJLi0Z94NT5G68pIETDeF113VeKUBOoyWrUHSw6YvjHktcqDs55g==
X-Received: by 2002:a5d:5274:: with SMTP id
 l20mr11995584wrc.328.1635325670855;
        Wed, 27 Oct 2021 02:07:50 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/30] ncurses: update 6.2 -> 6.3
Date: Wed, 27 Oct 2021 11:07:25 +0200
Message-Id: <20211027090736.2546759-19-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157495

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../files/0002-configure-reproducible.patch   | 26 +++++++++----------
 ...-Do-not-include-LDFLAGS-in-generated.patch |  9 ++++---
 .../{ncurses_6.2.bb => ncurses_6.3.bb}        |  2 +-
 3 files changed, 18 insertions(+), 19 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses_6.2.bb => ncurses_6.3.bb} (91%)

diff --git a/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch b/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
index 572195611e..66f26c06ab 100644
--- a/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
+++ b/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
@@ -1,7 +1,7 @@
-From 2a53c03ffa90f0050a949fc5920f0df3e668ff42 Mon Sep 17 00:00:00 2001
+From ec87e53066a9942e9aaba817d71268342f5e83b9 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 16 Aug 2017 14:45:27 +0800
-Subject: [PATCH 2/2] configure: reproducible
+Subject: [PATCH] configure: reproducible
 
 "configure" enforces -U for ar flags, breaking deterministic builds.
 The flag was added to fix some vaguely specified "recent POSIX binutil
@@ -13,23 +13,21 @@ Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
 Rebase to 6.1
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  configure | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index adead92..fa4fdb7 100755
+index 421cf859..a1b7840d 100755
 --- a/configure
 +++ b/configure
-@@ -4503,7 +4503,7 @@ if test "${cf_cv_ar_flags+set}" = set; then
- else
- 
- 	cf_cv_ar_flags=unknown
--	for cf_ar_flags in -curvU -curv curv -crv crv -cqv cqv -rv rv
-+	for cf_ar_flags in -curv curv -crv crv -cqv cqv -rv rv
- 	do
+@@ -5072,7 +5072,7 @@ else
+ 		;;
+ 	(*)
+ 		cf_cv_ar_flags=unknown
+-		for cf_ar_flags in -curvU -curv curv -crv crv -cqv cqv -rv rv
++		for cf_ar_flags in -curv curv -crv crv -cqv cqv -rv rv
+ 		do
  
- 		# check if $ARFLAGS already contains this choice
--- 
-1.8.3.1
-
+ 			# check if $ARFLAGS already contains this choice
diff --git a/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch b/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
index 1eb17767a0..a15694d4d4 100644
--- a/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
+++ b/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
@@ -1,4 +1,4 @@
-From 3b3e87934bb6d8511261d7c3d6e39b4f71849272 Mon Sep 17 00:00:00 2001
+From 10cd0c12a6e14fb4f0498c299c1dd32720b710da Mon Sep 17 00:00:00 2001
 From: Nathan Rossi <nathan@nathanrossi.com>
 Date: Mon, 14 Dec 2020 13:39:02 +1000
 Subject: [PATCH] gen-pkgconfig.in: Do not include LDFLAGS in generated pc
@@ -10,19 +10,20 @@ includes build host specific paths and options (e.g. uninative and
 
 Upstream-Status: Inappropriate [OE Specific]
 Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
+
 ---
  misc/gen-pkgconfig.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/misc/gen-pkgconfig.in b/misc/gen-pkgconfig.in
-index 8f00b824b9..009d215663 100644
+index a45dd54f..85273054 100644
 --- a/misc/gen-pkgconfig.in
 +++ b/misc/gen-pkgconfig.in
-@@ -80,7 +80,7 @@ if [ "$includedir" != "/usr/include" ]; then
+@@ -83,7 +83,7 @@ if [ "$includedir" != "/usr/include" ]; then
  fi
  
  lib_flags=
--for opt in -L$libdir @LDFLAGS@ @EXTRA_LDFLAGS@ @LIBS@
+-for opt in -L$libdir @EXTRA_PKG_LDFLAGS@ @LIBS@
 +for opt in -L$libdir @LIBS@
  do
  	case $opt in
diff --git a/meta/recipes-core/ncurses/ncurses_6.2.bb b/meta/recipes-core/ncurses/ncurses_6.3.bb
similarity index 91%
rename from meta/recipes-core/ncurses/ncurses_6.2.bb
rename to meta/recipes-core/ncurses/ncurses_6.3.bb
index e7d7396a20..f0256dad22 100644
--- a/meta/recipes-core/ncurses/ncurses_6.2.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.3.bb
@@ -5,7 +5,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            "
 # commit id corresponds to the revision in package version
-SRCREV = "a669013cd5e9d6434e5301348ea51baf306c93c4"
+SRCREV = "51d0fd9cc3edb975f04224f29f777f8f448e8ced"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)$"
-- 
2.20.1


