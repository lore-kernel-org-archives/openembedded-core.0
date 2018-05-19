Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8B507751FB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 02:14:00 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id p14-v6so4552590pfh.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 19:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S6ljoTvOlUGxzaokRUnv9UNBB9FTVEY8Szjs/wGwvuM=;
	b=OFh2IjH9PsXmSdTDUW5/IPSPuD0X5p6YpjOhpJ91Cbgn1yc4Fw2LpLLDwmNPmhNlbE
	p8NqZm8mJHP4ZWyNkJFDrVfV7oA5rLRyW0WahUalYnXhb/5U0YZTsjae/J50/8nUVaO3
	H7s3g1rjWUy0ZF2M3q/qPCZ+D2s5mM0NpFoHkvWnVwI1TT3xj4qrfNH7+VXck4WHrEb1
	fda+TtXF0l9RjfguUusB5d9N3XWdoFZTJEU2KRHKRPRXCnjUBfZD3+TnHvdLldwtk0z6
	LEJXxR+8rMuzLZuGo0n6lJyoVzuCylnGhWSEYf5hiKyHg34y2qusc8vBrIj5kCW3MwPq
	laWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S6ljoTvOlUGxzaokRUnv9UNBB9FTVEY8Szjs/wGwvuM=;
	b=DlVmBobSukVq3pPEbrNeiGK3n1TcX6InSe4HJbQDqGWnacZnr2Nrjru+tilmzR0Pl2
	tnZalDj49WAsCa+a3++ucxh73JarHIkNkstEYaO5hi6D0ojiOujGBG6xgwzBIGQyIl03
	/lB6zPOZNfJO8ioSz/lsUWGhQvZCL6vH+umcZVoWNTpMR67D6D5fTa3VZBDrxedD+NCm
	fYiCANIr+CzONyd84S+tTVIVuu/nBqxVAFSVzuqFsyf1/2RkGjgCwWyIoGWeJuznLuEn
	KoQaw0zuUIXkeD7R0LfKdvG5SrdF0sTV/LayxWzcnNIVKPAm6xGRx3vbwDJWzg2XKEyj
	pfaQ==
X-Gm-Message-State: ALKqPwerypIDrn/NRwz8QzVMXAjrumU3T7ZSvmADqF12klRUcK6jLado
	V52UZW4NIl/E41hUJLbZp6GB8g==
X-Google-Smtp-Source: AB8JxZo3OGZ4YlQOaBsPp7XBhZKpG2OjfluSVPY4uQc6k5bKSOHsK2UGIidfTyabTq9fWn2zBzUAaQ==
X-Received: by 2002:a62:8910:: with SMTP id
	v16-v6mr11520578pfd.13.1526696041240; 
	Fri, 18 May 2018 19:14:01 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:ed41:dd75:6b53:32ea])
	by smtp.gmail.com with ESMTPSA id
	n10-v6sm19307081pfj.68.2018.05.18.19.14.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 May 2018 19:14:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: Armin Kuster <akuster@mvista.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2018 19:13:52 -0700
Message-Id: <1526696034-3857-6-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526696034-3857-1-git-send-email-akuster@mvista.com>
References: <1526696034-3857-1-git-send-email-akuster@mvista.com>
Subject: [PATCH 6/8] xserver-xorg: upgrade 1.19.6 -> 1.20.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 May 2018 02:14:00 -0000

From: Armin Kuster <akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...1-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch | 19 +++++++++----------
 ...{xserver-xorg_1.19.6.bb => xserver-xorg_1.20.0.bb} |  4 ++--
 2 files changed, 11 insertions(+), 12 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.19.6.bb => xserver-xorg_1.20.0.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
index 16ec3ed..020a1cf 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
@@ -1,12 +1,13 @@
-Discover monotonic clock using compile-time check
+From 8a91316c4a38f20e7866289f3d779a037d27a129 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Mon, 12 Dec 2016 12:11:39 +0200
+Subject: [PATCH] Discover monotonic clock using compile-time check
 
 monotonic clock check does not work when cross-compiling.
 
 Upstream-Status: Denied [Does not work on OpenBSD]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 
-
-
 Original patch follows:
 
 When xorg-xserver is being cross-compiled, there is currently no way
@@ -21,15 +22,16 @@ monotonic clock is available. This check can run just fine when we are
 cross-compiling.
 
 Signed-off-by: David James <davidjames at google.com>
+
 ---
  configure.ac | 17 +++++++----------
  1 file changed, 7 insertions(+), 10 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index f7ab48c..26e85cd 100644
+index 2b21667..786e002 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1048,19 +1048,16 @@ if ! test "x$have_clock_gettime" = xno; then
+@@ -984,19 +984,16 @@ if ! test "x$have_clock_gettime" = xno; then
          CPPFLAGS="$CPPFLAGS -D_POSIX_C_SOURCE=200112L"
      fi
  
@@ -54,8 +56,5 @@ index f7ab48c..26e85cd 100644
 -       [MONOTONIC_CLOCK="cross compiling"])
 +]])],[MONOTONIC_CLOCK=yes], [MONOTONIC_CLOCK=no])
  
-     LIBS="$LIBS_SAVE"
-     CPPFLAGS="$CPPFLAGS_SAVE"
--- 
-2.1.4
-
+     if test "$MONOTONIC_CLOCK" = "cross compiling"; then
+         AC_CHECK_DECL([CLOCK_MONOTONIC],[MONOTONIC_CLOCK="guessing yes"],[MONOTONIC_CLOCK=no],[#include <time.h>])
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.0.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.0.bb
index c680cf9..620eb7b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.0.bb
@@ -6,8 +6,8 @@ SRC_URI += "file://musl-arm-inb-outb.patch \
             file://0003-Remove-check-for-useSIGIO-option.patch \
             file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
             "
-SRC_URI[md5sum] = "3e47777ff034a331aed2322b078694a8"
-SRC_URI[sha256sum] = "a732502f1db000cf36a376cd0c010ffdbf32ecdd7f1fa08ba7f5bdf9601cc197"
+SRC_URI[md5sum] = "c1ca1ea0a905ea788da03c77cc38b06e"
+SRC_URI[sha256sum] = "9d967d185f05709274ee0c4f861a4672463986e550ca05725ce27974f550d3e6"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.7.4


