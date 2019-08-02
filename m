Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4D5887F394
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 20:37:32 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p13so3877797wru.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 13:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ts0tfaVME95+oggQgUhhoIV/4j+MqRNnnvtbgwvdlTE=;
	b=c3lWqG8MF38qBIDJ+uKk9DyyEsEC2O89qaLrMJwRuAU4oZE6RJGNddk0SsRQr/JorO
	5iMDgHlN/eSGXygvKqHKgoVmWL8KJJL7PaWZ19JWGNi9Gc9RNJUDvXnCNr+4KoA9UZjh
	IIo3IuwcBJO2KG+dzBZB2vpGI6ofQ/MAjr3NnAtJQeqUwmWlW6H3kpZKLkcmk877o312
	qZnd3+w9vA367Gq0f31EeTxvkdq3GRyp9iqJWV22Lv6na4dku9+jdjibO0+xm1wEvBZl
	toidcAFAtjZt6vjEGZXhp2YQhRVv1nz8fnLgphu1b7IeQ4rnWD35IIvHCiDx5yYYvasu
	uVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ts0tfaVME95+oggQgUhhoIV/4j+MqRNnnvtbgwvdlTE=;
	b=PuBWH4i5ZCKgYnq1mHVyCkL6sdTQBqmnisvuExvpJHp0TQZaXrnK+abkeJ6u4WLzJJ
	2J5kBN9esCZiRJ9BQQuJHXZwgf+NUeq/JAS/3bEXSHTluWeDTMvrkS+8X/TQ8HcguXAC
	0ihQbXroYe1ZhRHswxLfzFZvUVilOgX5FlMB9Dnf65R8FQzH7DCLOFKlVrxGGyPOiCP7
	uVDHhltgnTOfKL2Y67cc3wHiAdzpTy4FMN199zgYcg2xIhH/880P4l/OFFY3cA5Pr/qs
	ZKoq8ipgomWlYl4w4hJlN1hMSryFX6NDjhVckyotBMDSpn3M4SYDFVoW74oCEZ9YmRfA
	LZYw==
X-Gm-Message-State: APjAAAUPv0dtTrszMfpOEcGQ3aDtZSzni+4yQgxcMTIy15Awd7x23lYA
	F3jTlMzGi257YQSTe9+hbMJAmM0idNo=
X-Google-Smtp-Source: APXvYqzu75ofyCIvGdFvFs//SVfnFbATC95E8BX+MttdLWz1p5gFlEGC9zOY8K3daFKEOkjmKuZYJA==
X-Received: by 2002:adf:c508:: with SMTP id q8mr15791975wrf.148.1564778252786; 
	Fri, 02 Aug 2019 13:37:32 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n1sm59083910wrx.39.2019.08.02.13.37.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 13:37:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 21:37:19 +0100
Message-Id: <20190802203719.20437-9-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802203719.20437-1-ross.burton@intel.com>
References: <20190802203719.20437-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] libx11: update to 1.6.8
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
X-List-Received-Date: Fri, 02 Aug 2019 20:37:32 -0000
Content-Transfer-Encoding: 8bit

Fix the build when the host doesn't have libc.a installed by reverting an
upstream commit, and cherry-pick a build fix from master.

Drop a redundant sed, the expression it removes doesn't exist anymore.

Move most patches to libx11.inc so that they're applied to both libx11 and libx11-diet.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...x11-diet_1.6.7.bb => libx11-diet_1.6.8.bb} |  0
 meta/recipes-graphics/xorg-lib/libx11.inc     |  8 +++-
 .../xorg-lib/libx11/fix-libtool.patch         | 35 ++++++++++++++++
 .../xorg-lib/libx11/no-host-x.patch           | 40 +++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.6.7.bb | 13 ------
 .../recipes-graphics/xorg-lib/libx11_1.6.8.bb |  7 ++++
 6 files changed, 88 insertions(+), 15 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.6.7.bb => libx11-diet_1.6.8.bb} (100%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/fix-libtool.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/no-host-x.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.8.bb

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.8.bb
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb
rename to meta/recipes-graphics/xorg-lib/libx11-diet_1.6.8.bb
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index ea2ebfb8b95..994c33a8efc 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -10,8 +10,12 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/libx11:"
 
 PE = "1"
 
-SRC_URI[md5sum] = "034fdd6cc5393974d88aec6f5bc96162"
-SRC_URI[sha256sum] = "910e9e30efba4ad3672ca277741c2728aebffa7bc526f04dcfa74df2e52a1348"
+SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
+            file://fix-libtool.patch \
+            file://no-host-x.patch"
+
+SRC_URI[md5sum] = "c5fa5a86a20e3591bed6c046498d4b8f"
+SRC_URI[sha256sum] = "b289a845c189e251e0e884cc0f9269bbe97c238df3741e854ec4c17c21e473d5"
 
 PROVIDES = "virtual/libx11"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-libtool.patch b/meta/recipes-graphics/xorg-lib/libx11/fix-libtool.patch
new file mode 100644
index 00000000000..678b7aff445
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/fix-libtool.patch
@@ -0,0 +1,35 @@
+Passing -all-static to libtool is done to avoid libtool wrappers on Windows, but
+it means that the build host needs to have libc.a installed.  This isn't the
+case for a lot of distributions out of the box, so revert this commit.
+
+Filed a bug upstream to get a proper fix: https://gitlab.freedesktop.org/xorg/lib/libx11/issues/100
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From b9f74dc5e714115057a5a1789b4de202d6f58547 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Fri, 2 Aug 2019 00:39:39 +0100
+Subject: [PATCH 2/2] Revert "Avoid using libtool wrapper for makekeys"
+
+This reverts commit 4645e219133458781e3fb48eaea6a74cccb1b9aa.
+---
+ src/util/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/util/Makefile.am b/src/util/Makefile.am
+index 37314370..a051567a 100644
+--- a/src/util/Makefile.am
++++ b/src/util/Makefile.am
+@@ -10,7 +10,7 @@ AM_CPPFLAGS = \
+ CC = @CC_FOR_BUILD@
+ CPPFLAGS = @CPPFLAGS_FOR_BUILD@
+ CFLAGS = @CFLAGS_FOR_BUILD@
+-LDFLAGS = @LDFLAGS_FOR_BUILD@ -all-static
++LDFLAGS = @LDFLAGS_FOR_BUILD@
+ LIBS =
+ EXEEXT = @EXEEXT_FOR_BUILD@
+ 
+-- 
+2.20.1
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11/no-host-x.patch b/meta/recipes-graphics/xorg-lib/libx11/no-host-x.patch
new file mode 100644
index 00000000000..803f8b408cb
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/no-host-x.patch
@@ -0,0 +1,40 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From cf2ef27831173c5ed6f98be3c39caff18fd4e7f1 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Mon, 17 Jun 2019 13:36:08 -0400
+Subject: [PATCH 1/2] makekeys: Detach ourselves from X headers entirely
+
+Subsequent to a121b7b0c210efe10bf93453b29050282324c906 we are no longer
+building makekeys with enough -I/foo/bar to find the X11 headers, so if
+they're not in a system include path, things fail. Since this utility is
+only needed at build time, there's no real reason to demand the X
+headers be installed for both the build and target machines if cross-
+compiling, we can just assume a vaguely ANSI environment instead.
+
+Tested-by: Niclas Zeising <zeising@daemonic.se>
+Reviewed-by: Keith Packard <keithp@keithp.com>
+Reviewed-by: Matt Turner <mattst88@gmail.com>
+---
+ src/util/makekeys.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/util/makekeys.c b/src/util/makekeys.c
+index bcb5b7d5..07563315 100644
+--- a/src/util/makekeys.c
++++ b/src/util/makekeys.c
+@@ -35,8 +35,10 @@ from The Open Group.
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <stdint.h>
++#include <inttypes.h>
+ 
+-#include "../Xresinternal.h"
++typedef uint32_t Signature;
+ 
+ #define KTNUM 4000
+ 
+-- 
+2.20.1
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb
deleted file mode 100644
index 6141f571c5a..00000000000
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require libx11.inc
-
-SRC_URI += "file://disable_tests.patch \
-            file://Fix-hanging-issue-in-_XReply.patch \
-           "
-
-inherit gettext
-
-do_configure_append () {
-    sed -i -e "/X11_CFLAGS/d" ${B}/src/util/Makefile
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.8.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.8.bb
new file mode 100644
index 00000000000..0d27bc2bce9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.8.bb
@@ -0,0 +1,7 @@
+require libx11.inc
+
+SRC_URI += "file://disable_tests.patch"
+
+inherit gettext
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


