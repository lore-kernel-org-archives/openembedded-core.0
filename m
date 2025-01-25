Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD43C0218C
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 15:42:46 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.12348.1737819764181010323
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jan 2025 07:42:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VO81MKBV;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso19542185e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 07:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737819762; x=1738424562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiIpqxlSw1zOH7dyq+CmVKsHqh4SHEGBX4OaX88YP4U=;
        b=VO81MKBVOlfYtKMW8RGNKJ16ppb/ZwrLuGJIW74dSCBnmhEL3q5o5jx1ATv5tOxm6P
         oqBQFheBzzY4xs1A7PABU12NjnIS+FQeFVZ1tOCb+euRbnAzD+Er1wBOxdn8PxciXgsL
         KgGbrhHrskAPEVUBOp9oIAtNHISG1MaWrme7d6EpbOm9QuWFhhbWvIh86jmzK5xoZT9k
         FsBWnd2emQA3o58R1M0OZc36xZts3WLPJq1+oYxav9i54UQ1cSdSTmXWh3cFQclltVbk
         t3h/uV4e5ePjJb0kuz2D/aDVK1EsnLQLUJPm0/SZjzQhSX3e6op4hRhTUXUKr0LSWsn5
         8Rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737819762; x=1738424562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tiIpqxlSw1zOH7dyq+CmVKsHqh4SHEGBX4OaX88YP4U=;
        b=JrxeDVMHZZaXO6Ybjp77PH551inAa1ZMVf667zr+OiNC+4GS5fI8V1abHQqH6zPDpW
         hA/8PQTcTkANHZ5qxfBMuwG5foOw/vB8ytKvGGIeVVgF9aDibixSYLLb+t+f6H0UycN4
         2zClgHvtpEbX/lo8n1yn6IcanVAUyF4HhJUUph99+LHfXltC6PWvtO69Lb7CJrvOHC4U
         cVc62FxRff/F2Tdv352nLWef4UxfDhNj32GR7QlQXMB1y08cXuYzLbtnmMt9UDYW3g+G
         VM60dShDBm5/de8+9kCB6gzMSLq7FN3ORtlemE3KZw71QR+n60/MYpn9rFfWz/jpx5lX
         cgtQ==
X-Gm-Message-State: AOJu0Ywdj1uDzEFLTuG19u/OEXIsA8kcrilKx6uaetoymm9RqLLhYAjf
	i6dn/o4M/IYRFm41mBE6Mml6yaleh3sF5KaBXPOEPkukLolOTi8fp0acKmW0
X-Gm-Gg: ASbGnctw2JbsyXzWB87vfHyRV/jjU7Y9O1r4QbK+hFI6SGE5rQzeYkZJ/ZN4hFgrUAM
	64DgYWyX7thDI2i2YJlEHSrjHLQ2x8ZOgXnk58Rtqqo13ncxNDnA+Vhr77IafR/bBCYnYWEDBsk
	1kYt2AD5+4GqdA9lqvDSIAVCp1QJ+TfKFi2DJQOqAEPi+zLZEJ86M6AdUoigj54AM7DFsQvoCOZ
	9WudRO1cAr+JkqHJRnEkGcbLqbpByeSQlPQZb+N9tNoqDugrErjQsRoQNHQE5zawBtGk3fjyq5y
	nWPsLZbNaebuxHeGSwZroU/w+wEQlA==
X-Google-Smtp-Source: AGHT+IFhpX7U9UKM8vAWaIJEaHjqUTDYlRpQJsXwChXNpuX7JfcL4MEVUYVPK+WUJ34rHzHxhLx4bQ==
X-Received: by 2002:a05:600c:138a:b0:434:9d62:aa23 with SMTP id 5b1f17b1804b1-4389142e88dmr284880575e9.20.1737819761580;
        Sat, 25 Jan 2025 07:42:41 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4c6fadsm64063345e9.32.2025.01.25.07.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 07:42:40 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: hongxu <hongxu.jia@eng.windriver.com>,
	Hongxu Jia <hongxu.jia@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [styhead][PATCH 1/3] gnupg: upgrade 2.5.0 -> 2.5.1
Date: Sat, 25 Jan 2025 15:42:13 +0000
Message-ID: <20250125154215.3316474-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250125154215.3316474-1-gudni.m.g@gmail.com>
References: <20250125154215.3316474-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 15:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210266

From: hongxu <hongxu.jia@eng.windriver.com>

Due to upstream [build: Remove configure option --enable-gpg-is-gpg2][1],
drop option --enable-gpg-is-gpg2 and remove gpg2/gpgv2 installation

Due to upsream [doc: Remove included yat2m and build HTML versions of
the man pages.][2], it used standard detection on yat2m other than build
it from source. Because no native recipe provide yat2m in Yocto,
explicitly disable doc via option --disable-doc

[1] https://github.com/gpg/gnupg/commit/2125f228d36c0882a87bce433a18253154653d50
[2] https://github.com/gpg/gnupg/commit/60c541f5880e8c603ca9372d3ca8b7ad68b97018

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1-Woverride-init-is-not-needed-with-gcc-9.patch |  2 +-
 ...c-use-a-custom-value-for-the-location-of-.patch |  6 +++---
 .../gnupg/0001-fix-compile-failure-with-musl.patch | 11 ++++-------
 ...0002-use-pkgconfig-instead-of-npth-config.patch |  2 +-
 ...gen.sh-fix-find-version-for-beta-checking.patch |  2 +-
 meta/recipes-support/gnupg/gnupg/relocate.patch    |  4 ++--
 .../gnupg/{gnupg_2.5.0.bb => gnupg_2.5.1.bb}       | 14 +++-----------
 7 files changed, 15 insertions(+), 26 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.0.bb => gnupg_2.5.1.bb} (87%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 77d7507edc..024f4a9f10 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From 6392cb71a23adfd601537049da4e5e06e51d2e50 Mon Sep 17 00:00:00 2001
+From 69d132c4cca738f148551af24932010fb1029ea1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 12b1447138..702cba4b71 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From a0e986b487891ef8e3bb41b95f969e00edd4923f Mon Sep 17 00:00:00 2001
+From d9ef954b602c17839c52a1d7dc73e2354e5fbbbb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index e4f8c0e..fa75ec8 100644
+index 29592fd..7286862 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1925,7 +1925,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1911,7 +1911,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch b/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
index fef05cf3c8..13c1a36366 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
@@ -1,4 +1,4 @@
-From 4a7d4d6e45c68708ec95335b0f11d6596b23095a Mon Sep 17 00:00:00 2001
+From 2e7534f3f7694ba426615b2061c235908097bb9b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 22 Aug 2024 15:31:16 +0800
 Subject: [PATCH] fix compile failure with musl
@@ -20,17 +20,14 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/scd/app.c b/scd/app.c
-index 926ab79..7bf58a2 100644
+index 525950e..7180178 100644
 --- a/scd/app.c
 +++ b/scd/app.c
-@@ -23,6 +23,7 @@
- #include <stdlib.h>
+@@ -24,6 +24,7 @@
  #include <string.h>
+ #include <unistd.h>
  #include <npth.h>
 +#include <unistd.h>
  
  #include "scdaemon.h"
  #include "../common/exechelp.h"
--- 
-2.27.0
-
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index 945abb55ff..a7a6f03c7d 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From fa93b5f7c2da0e5846b80de9c6296966ca2a3d83 Mon Sep 17 00:00:00 2001
+From d5fc05998d7260fd94a558c53f6e6c35a384d163 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
index 761fd6c608..8aeb87dfd4 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,4 +1,4 @@
-From e8f67e3bbbdbaa17cfe88c1f7a8f488eb4936281 Mon Sep 17 00:00:00 2001
+From 21396a6e74d188a2198439aa27403c29c1dbcea8 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 16 Aug 2017 11:23:22 +0800
 Subject: [PATCH] autogen.sh: fix find-version for beta checking
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 5c4d81f87a..6fcbc2d18f 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 4e556a5edde8a97312abae63f8e9b5f989ca5c91 Mon Sep 17 00:00:00 2001
+From 3c761174b0ec6f49f184f16a0b0eaade44264edc Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 3929108..d3a7b8f 100644
+index a73182e..9994a9a 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
 @@ -1439,7 +1439,7 @@ gnupg_socketdir (void)
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.0.bb b/meta/recipes-support/gnupg/gnupg_2.5.1.bb
similarity index 87%
rename from meta/recipes-support/gnupg/gnupg_2.5.0.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.1.bb
index 9cfdbdf0a4..080056f74c 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.0.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.1.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "2222c827d4e7087f15e7f72739d004abc1d05c6c5f0a5a12b24c6a6cc5d173fb"
+SRC_URI[sha256sum] = "8a34bb318499867962c939e156666ada93ed81f01926590ac68f3ff79178375e"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
@@ -32,17 +32,14 @@ EXTRA_OECONF = "--disable-ldap \
 		--with-bzip2=${STAGING_LIBDIR}/.. \
 		--with-readline=${STAGING_LIBDIR}/.. \
 		--with-mailprog=${sbindir}/sendmail \
-		--enable-gpg-is-gpg2 \
 		--disable-tests \
+		--disable-doc \
                "
-# yat2m can be found from recipe-sysroot-native non-deterministically with different versioning otherwise
-CACHED_CONFIGUREVARS += "ac_cv_path_YAT2M=./yat2m"
 
 # A minimal package containing just enough to run gpg+gpgagent (E.g. use gpgme in opkg)
 PACKAGES =+ "${PN}-gpg"
 FILES:${PN}-gpg = " \
 	${bindir}/gpg \
-	${bindir}/gpg2 \
 	${bindir}/gpg-agent \
 "
 
@@ -62,11 +59,6 @@ do_configure:prepend () {
 	rm -f ${S}/m4/libgcrypt.m4
 }
 
-do_install:append() {
-	ln -sf gpg2 ${D}${bindir}/gpg
-	ln -sf gpgv2 ${D}${bindir}/gpgv
-}
-
 do_install:append:class-native() {
 	create_wrappers ${STAGING_BINDIR_NATIVE}
 }
@@ -76,7 +68,7 @@ do_install:append:class-nativesdk() {
 }
 
 create_wrappers() {
-	for i in gpg2 gpgconf gpg-agent gpg-connect-agent; do
+	for i in gpg gpgconf gpg-agent gpg-connect-agent; do
 		create_wrapper ${D}${bindir}/$i GNUPG_BINDIR=$1
 	done
 }
-- 
2.43.0


