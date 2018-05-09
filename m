Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 32A9274F96
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 20:24:31 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id a39-v6so4963737pla.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 13:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kvV7HAdWnh5XHPWxERdEY+zqGCaUUh3iN+rwCeNXbc0=;
	b=oIyWwE5WqkVR4VdRvKtpKiyAF4UBhrvw8+Ek0aQQIBeyLKGvhzvO7p7eghJOgMKpHO
	O93Rrh1+fcFdJI7usMEhZ9wrNnkW6YEfoflAOiqo+Lqaj5iMw8JIiMQLiH7ADu6b+FLa
	s5RtU8PpiB684HmxCZ5g01JddwnZx3tqGDXeFXd2cso9v/RTwv5jouranJNEUFhZiLGh
	50P2m/LYCxDASsW4uzvoZeHbqrZdIGfJMxEbtUJxbtHB1ddH8wwvhIleDfd1ssp3BA1e
	+edmhuH6LRaJgYyKfiOktq8sIQkA5M2rTz47M3fzgsLfLfs0mDhLUkdmB6JbKSYCrUrH
	QHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kvV7HAdWnh5XHPWxERdEY+zqGCaUUh3iN+rwCeNXbc0=;
	b=tZlMMigP+5JMSAdW1iTtiUgh52lO+sIupRETwpa5s7JooWQkaA6uQYKJavX6sXChLW
	uJ8YrTNhl7TxsASnF5D7hiA6Ye+OiN9q1E+BEleAd2yDhU7YNhEjTYj8dK8WGLb70q/l
	Dc6ZA/NyxBW6Z4v0l/QjUWHIfbJ6POS7HqKmZPd1zwtxIxJb+TUcwWdWYtMiREtUl7nj
	f+jxb0jMOY+CpyebkZ8C1+OsJMw0jw9JhrG4jwA3TCA8GjSCwSaSEEwB/ejNcy7ik1pi
	xGwWDuwoZJbTGhwO2qYSdWPaP6IdIySNdEbWeA6Ti9xe/LHal2OIR9XCjudqSCbkQqZc
	lDHA==
X-Gm-Message-State: ALQs6tC2yjdHkl7uwTh2AaDfVwa8sj8oL8GbWtfEaqUVjCZ46nm0ew/T
	eJ1qFdchptIHCrMMLdsdQ5ca0Q==
X-Google-Smtp-Source: AB8JxZosk3b1ctCqMSJmTv8pPDHqe7lnPnPRTkVURvG+x0j+0MfJBgBHpLypXrs4AEmowsEk277kqg==
X-Received: by 2002:a17:902:700a:: with SMTP id
	y10-v6mr47127149plk.265.1525897472860; 
	Wed, 09 May 2018 13:24:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	x124sm2142222pfx.72.2018.05.09.13.24.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 13:24:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 13:24:21 -0700
Message-Id: <20180509202422.22501-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509202422.22501-1-raj.khem@gmail.com>
References: <20180509202422.22501-1-raj.khem@gmail.com>
Subject: [PATCH 8/9] libgpg-error: Upgrade 1.28 -> 1.31
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
X-List-Received-Date: Wed, 09 May 2018 20:24:32 -0000

License-Update: Check 19 lines of gpg-error.h.in only, more lines are not representing license text

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ion-on-arm64-due-to-invalid-use-of-v.patch | 61 -------------------
 ...gpg-error_1.28.bb => libgpg-error_1.31.bb} | 10 ++-
 2 files changed, 4 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-core-Fix-regression-on-arm64-due-to-invalid-use-of-v.patch
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.28.bb => libgpg-error_1.31.bb} (82%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-core-Fix-regression-on-arm64-due-to-invalid-use-of-v.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-core-Fix-regression-on-arm64-due-to-invalid-use-of-v.patch
deleted file mode 100644
index c35e7240b4..0000000000
--- a/meta/recipes-support/libgpg-error/libgpg-error/0001-core-Fix-regression-on-arm64-due-to-invalid-use-of-v.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 791177de023574223eddf7288eb7c5a0721ac623 Mon Sep 17 00:00:00 2001
-From: Werner Koch <wk@gnupg.org>
-Date: Sun, 18 Mar 2018 17:39:43 +0100
-Subject: [PATCH] core: Fix regression on arm64 due to invalid use of va_list.
-
-* src/logging.c (_gpgrt_log_printhex): Provide a dummy arg instead of
-NULL.
---
-
-Fix
-Suggested-by: Jakub Wilk <jwilk@jwilk.net>
-
-Signed-off-by: Werner Koch <wk@gnupg.org>
-
-Upstream-Status: Backport
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- src/logging.c | 18 ++++++++++++++----
- 1 file changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/src/logging.c b/src/logging.c
-index 1a4f620..d01f974 100644
---- a/src/logging.c
-+++ b/src/logging.c
-@@ -1090,9 +1090,10 @@ _gpgrt_log_flush (void)
- 
- 
- /* Print a hexdump of (BUFFER,LENGTH).  With FMT passed as NULL print
-- * just the raw dump, with FMT being an empty string, print a trailing
-- * linefeed, otherwise print an entire debug line with the expanded
-- * FMT followed by a possible wrapped hexdump and a final LF.  */
-+ * just the raw dump (in this case ARG_PTR is not used), with FMT
-+ * being an empty string, print a trailing linefeed, otherwise print
-+ * an entire debug line with the expanded FMT followed by a possible
-+ * wrapped hexdump and a final LF.  */
- void
- _gpgrt_logv_printhex (const void *buffer, size_t length,
-                       const char *fmt, va_list arg_ptr)
-@@ -1150,7 +1151,16 @@ _gpgrt_log_printhex (const void *buffer, size_t length,
-       va_end (arg_ptr);
-     }
-   else
--    _gpgrt_logv_printhex (buffer, length, NULL, NULL);
-+    {
-+      /* va_list is not necessary a pointer and thus we can't use NULL
-+       * because that would conflict with platforms using a straight
-+       * struct for it (e.g. arm64).  We use a dummy variable instead;
-+       * the static is a simple way zero it out so to not get
-+       * complains about uninitialized use.  */
-+      static va_list dummy_argptr;
-+
-+      _gpgrt_logv_printhex (buffer, length, NULL, dummy_argptr);
-+    }
- }
- 
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.28.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.31.bb
similarity index 82%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.28.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.31.bb
index 71f4c3a388..5dd861501e 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.28.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.31.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/gpg-error.h.in;endline=23;md5=fc7423b56d5f7163a9a2acf9fe2f8d6b \
+                    file://src/gpg-error.h.in;endline=19;md5=e9be7dd9dc7686d91b5421a091c212cc \
                     file://src/init.c;endline=20;md5=872b2389fe9bae7ffb80d2b91225afbc"
 
 
@@ -14,11 +14,9 @@ SECTION = "libs"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
-           file://0001-core-Fix-regression-on-arm64-due-to-invalid-use-of-v.patch \
 	  "
-
-SRC_URI[md5sum] = "2b072f6194eb22d48cd4c7c77e59b5af"
-SRC_URI[sha256sum] = "3edb957744905412f30de3e25da18682cbe509541e18cd3b8f9df695a075da49"
+SRC_URI[md5sum] = "5cc6df0fea27832e9cdbafc60f51561b"
+SRC_URI[sha256sum] = "40d0a823c9329478063903192a1f82496083b277265904878f4bc09e0db7a4ef"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
@@ -42,7 +40,7 @@ do_compile_prepend() {
 	  mips*el)    TUPLE=mipsel-unknown-linux-gnu ;;
 	  mips*)      TUPLE=mips-unknown-linux-gnu ;;
 	  x86_64)     TUPLE=x86_64-pc-linux-gnu ;;
-	  *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;; 
+	  *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;;
 	esac
 
 	if [ -n "$TARGET_FILE" ]; then
-- 
2.17.0


