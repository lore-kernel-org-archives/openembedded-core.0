Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id D6F0571AC8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 10:06:33 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id b75so6721779lfg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 03:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/ZokGY0E8dZQ/9IhszGlOe+pKEflxhn7wVS7lubUd38=;
	b=Jv1YzcdsLBhRSQricE+hHziKHQCo4MmEMpHnZaPGj1zbBLcxGFNR75WVvM4Z/tsiOD
	uJGhcvmAJ19xz0dWlGMm+nZqveG4BblSrntuJwi9+42y/FKAInzJeYf6vf+jrg7FKNYs
	kkLl/RX1qSoGTTRbXVRHpFi1tkutvqEhDEoFqHY63reOfXLF1NBLR7RAnnvlWlJ6N0y7
	27Nvocx6HC5+0/45Z8qsPvsfTn2kZMyvqCeC+tldmxWKYjNAI9AtYCki5j62aXbNloju
	xRm+nDuurJcsPzUTXH1vvMib84opEC9XT0TgmWVhZ8ysROhMahJsKiG3ZrTLK7WnYXso
	GSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/ZokGY0E8dZQ/9IhszGlOe+pKEflxhn7wVS7lubUd38=;
	b=maVqeItZlpmGqNqe3r/pKs2Yv//esRhogAXEuCh5ZKSJTFkWifSIGb+GXAj0qqbqyh
	KTOLfuBEBH1OSR0FhVYKbMkqafZczfH03QpxaVsk0h4u3vGEoM+XeicQjcb5Rm5gki5G
	iYMGxpsuLLUThxnTbp2+UFgWZDW09GBkx7AcvhtODIfykot5PfrCBqfKCloiIKrJdpK4
	22V5Y0TXtqjOVk2oWKy4yUm/3+11c/5IMYo6K1CLbefLfJi5jSVT/ab1phl/7EJvW/ud
	qqD9sVletpSxe24Z60CMhDqNkJrtdZ4cIrnz+9MROj43siMKBwQWroobwbkrt7hStRey
	3hEQ==
X-Gm-Message-State: AA6/9Rm1ZSyLUlekWoBq9PNVMFKzH7DMz78mdlXQPLM9URXjDlIZl1RjkKsqOSupXEFu+w==
X-Received: by 10.28.207.3 with SMTP id f3mr5758885wmg.15.1476957993336;
	Thu, 20 Oct 2016 03:06:33 -0700 (PDT)
Received: from localhost.localdomain (p5B0A083D.dip0.t-ipconnect.de.
	[91.10.8.61]) by smtp.googlemail.com with ESMTPSA id
	hb5sm77264696wjc.5.2016.10.20.03.06.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Oct 2016 03:06:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2016 12:06:15 +0200
Message-Id: <1476957975-17357-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] mesa: update to 12.0.3
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
X-List-Received-Date: Thu, 20 Oct 2016 10:06:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* removed patch was applied mainline
* tested on RaspberryPi2 weston / lxqt / kde

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../mesa/files/clang-compile-PR89599.patch         | 116 ---------------------
 .../mesa/{mesa-gl_12.0.1.bb => mesa-gl_12.0.3.bb}  |   0
 .../mesa/{mesa_12.0.1.bb => mesa_12.0.3.bb}        |   5 +-
 3 files changed, 2 insertions(+), 119 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/clang-compile-PR89599.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_12.0.1.bb => mesa-gl_12.0.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_12.0.1.bb => mesa_12.0.3.bb} (77%)

diff --git a/meta/recipes-graphics/mesa/files/clang-compile-PR89599.patch b/meta/recipes-graphics/mesa/files/clang-compile-PR89599.patch
deleted file mode 100644
index 48bd325..0000000
--- a/meta/recipes-graphics/mesa/files/clang-compile-PR89599.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From 5ec140c17b54c25920091501b665b9aa809cc5e8 Mon Sep 17 00:00:00 2001
-From: Matt Turner <mattst88@gmail.com>
-Date: Mon, 11 Jul 2016 10:44:25 -0700
-Subject: mapi: Massage code to allow clang to compile.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-According to https://llvm.org/bugs/show_bug.cgi?id=19778#c3 this code
-was violating the spec, resulting in it failing to compile.
-
-Cc: mesa-stable@lists.freedesktop.org
-Co-authored-by: Tomasz Paweł Gajc <tpgxyz@gmail.com>
-Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=89599
-Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
-
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-diff --git a/configure.ac b/configure.ac
-index 3799d8d..1ca8359 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -226,6 +226,7 @@ AX_GCC_FUNC_ATTRIBUTE([packed])
- AX_GCC_FUNC_ATTRIBUTE([pure])
- AX_GCC_FUNC_ATTRIBUTE([returns_nonnull])
- AX_GCC_FUNC_ATTRIBUTE([unused])
-+AX_GCC_FUNC_ATTRIBUTE([visibility])
- AX_GCC_FUNC_ATTRIBUTE([warn_unused_result])
- AX_GCC_FUNC_ATTRIBUTE([weak])
- 
-diff --git a/src/mapi/entry_x86-64_tls.h b/src/mapi/entry_x86-64_tls.h
-index 38faccc..c5262a1 100644
---- a/src/mapi/entry_x86-64_tls.h
-+++ b/src/mapi/entry_x86-64_tls.h
-@@ -25,6 +25,11 @@
-  *    Chia-I Wu <olv@lunarg.com>
-  */
- 
-+#ifdef HAVE_FUNC_ATTRIBUTE_VISIBIITY
-+#define HIDDEN __attribute__((visibility("hidden")))
-+#else
-+#define HIDDEN
-+#endif
- 
- __asm__(".text\n"
-         ".balign 32\n"
-@@ -54,8 +59,8 @@ entry_patch_public(void)
- {
- }
- 
--static char
--x86_64_entry_start[];
-+extern char
-+x86_64_entry_start[] HIDDEN;
- 
- mapi_func
- entry_get_public(int slot)
-diff --git a/src/mapi/entry_x86_tls.h b/src/mapi/entry_x86_tls.h
-index 46d2ece..231b409 100644
---- a/src/mapi/entry_x86_tls.h
-+++ b/src/mapi/entry_x86_tls.h
-@@ -27,6 +27,12 @@
- 
- #include <string.h>
- 
-+#ifdef HAVE_FUNC_ATTRIBUTE_VISIBIITY
-+#define HIDDEN __attribute__((visibility("hidden")))
-+#else
-+#define HIDDEN
-+#endif
-+
- __asm__(".text");
- 
- __asm__("x86_current_tls:\n\t"
-@@ -71,8 +77,8 @@ __asm__(".text");
- extern unsigned long
- x86_current_tls();
- 
--static char x86_entry_start[];
--static char x86_entry_end[];
-+extern char x86_entry_start[] HIDDEN;
-+extern char x86_entry_end[] HIDDEN;
- 
- void
- entry_patch_public(void)
-diff --git a/src/mapi/entry_x86_tsd.h b/src/mapi/entry_x86_tsd.h
-index ea7bacb..03d9735 100644
---- a/src/mapi/entry_x86_tsd.h
-+++ b/src/mapi/entry_x86_tsd.h
-@@ -25,6 +25,11 @@
-  *    Chia-I Wu <olv@lunarg.com>
-  */
- 
-+#ifdef HAVE_FUNC_ATTRIBUTE_VISIBIITY
-+#define HIDDEN __attribute__((visibility("hidden")))
-+#else
-+#define HIDDEN
-+#endif
- 
- #define X86_ENTRY_SIZE 32
- 
-@@ -58,8 +63,8 @@ __asm__(".balign 32\n"
- #include <string.h>
- #include "u_execmem.h"
- 
--static const char x86_entry_start[];
--static const char x86_entry_end[];
-+extern const char x86_entry_start[] HIDDEN;
-+extern const char x86_entry_end[] HIDDEN;
- 
- void
- entry_patch_public(void)
--- 
-cgit v0.10.2
-
diff --git a/meta/recipes-graphics/mesa/mesa-gl_12.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_12.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_12.0.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_12.0.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa_12.0.1.bb b/meta/recipes-graphics/mesa/mesa_12.0.3.bb
similarity index 77%
rename from meta/recipes-graphics/mesa/mesa_12.0.1.bb
rename to meta/recipes-graphics/mesa/mesa_12.0.3.bb
index 80189e3..acc8353 100644
--- a/meta/recipes-graphics/mesa/mesa_12.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_12.0.3.bb
@@ -2,12 +2,11 @@ require ${BPN}.inc
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz \
            file://replace_glibc_check_with_linux.patch \
-           file://clang-compile-PR89599.patch \
            file://disable-asm-on-non-gcc.patch \
 "
 
-SRC_URI[md5sum] = "972fd5ad5a63aeabf173fb9adefc6522"
-SRC_URI[sha256sum] = "bab24fb79f78c876073527f515ed871fc9c81d816f66c8a0b051d8d653896389"
+SRC_URI[md5sum] = "1113699c714042d8c4df4766be8c57d8"
+SRC_URI[sha256sum] = "1dc86dd9b51272eee1fad3df65e18cda2e556ef1bc0b6e07cd750b9757f493b1"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.5.5


