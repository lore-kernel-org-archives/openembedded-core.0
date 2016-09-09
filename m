Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 77623731D1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 16:20:12 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a6so3433024wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Sep 2016 09:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8SrdX4UgpgyKSu1y5V3POMnHOwweqI5JXt7O36AXEPA=;
	b=wejKkWEEwA7tNLLovTjlGMKt6e0j8J3ZteIZ+M66wSd3EanNXZk/ciN5AZLYyjJc8j
	Fe2i5sKsZPVIGv+Pu0mqMcnQIM0s85jwF5ry3IDkw0cy0xCfyRgGoH6qEudCQycCZygU
	buETybNfsmHFWeE3iW7V2MHzRg0cdfM8bn7YST3goHez55jE/bkrKoCnrjMRY6vDuT+f
	ewSOWldHlHV/rsTlupXHa5gSaQ0ev6FawIxTwTyyTal9d+3K8kLyyIxRF+PFFJN+3EVi
	FnSud03OFJQvlPZSXdWpXCULcGNQFJ9wyuBabMY/3pnpjt4QQTcsI6YrY2emOf/7PC+E
	UNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8SrdX4UgpgyKSu1y5V3POMnHOwweqI5JXt7O36AXEPA=;
	b=NYBmjRHIG7CBJTxwTe8Po15sAoAT6AqRrOywmB1+YX6SfSQed7nqMPxitmFtHI8ifo
	0v/CWTARR2+0v3OyGjKJbXxoCDXyFXGChTwe2s9f/jZ3Gf3UkZpS5EIQueOryjKqDFtm
	5u0pQ6pZNP/rRPn04lyiBxw0CiDHPHTxOvesAzk4YxZSfHOUjrPkRdRDHtDrMsfZsonE
	QJ90KKVZIduIqiYwNGtsJFNLuzvALMR44qVSOI0FEIZC9OXxFarB8HG1I4ZbCPDHtwcL
	z/TFUJ9gritvDf3Alwer/T3+mcitdLNaUWnGJTXabIoXXgcVLX3F70cMP2xfK9XMco/8
	jJig==
X-Gm-Message-State: AE9vXwPbSpNKVqTZZJTljp+pOVj/chFBTFH+PaeiThJnafRsBTsiRfWjbhTlEw2rzzaQaw==
X-Received: by 10.194.87.34 with SMTP id u2mr4554955wjz.118.1473438012159;
	Fri, 09 Sep 2016 09:20:12 -0700 (PDT)
Received: from localhost.localdomain (p5B0A1290.dip0.t-ipconnect.de.
	[91.10.18.144]) by smtp.googlemail.com with ESMTPSA id
	w203sm4081144wmw.7.2016.09.09.09.20.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Sep 2016 09:20:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Sep 2016 18:19:57 +0200
Message-Id: <1473437997-26515-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] mesa: update to 12.0.2
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
X-List-Received-Date: Fri, 09 Sep 2016 16:20:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* removed patch was applied mainline
* tested on RaspberryPi2 weston / lxqt / kde

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../mesa/files/clang-compile-PR89599.patch         | 116 ---------------------
 .../mesa/{mesa-gl_12.0.1.bb => mesa-gl_12.0.2.bb}  |   0
 .../mesa/{mesa_12.0.1.bb => mesa_12.0.2.bb}        |   5 +-
 3 files changed, 2 insertions(+), 119 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/clang-compile-PR89599.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_12.0.1.bb => mesa-gl_12.0.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_12.0.1.bb => mesa_12.0.2.bb} (77%)

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
diff --git a/meta/recipes-graphics/mesa/mesa-gl_12.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_12.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_12.0.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_12.0.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa_12.0.1.bb b/meta/recipes-graphics/mesa/mesa_12.0.2.bb
similarity index 77%
rename from meta/recipes-graphics/mesa/mesa_12.0.1.bb
rename to meta/recipes-graphics/mesa/mesa_12.0.2.bb
index 80189e3..12a5495 100644
--- a/meta/recipes-graphics/mesa/mesa_12.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_12.0.2.bb
@@ -2,12 +2,11 @@ require ${BPN}.inc
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz \
            file://replace_glibc_check_with_linux.patch \
-           file://clang-compile-PR89599.patch \
            file://disable-asm-on-non-gcc.patch \
 "
 
-SRC_URI[md5sum] = "972fd5ad5a63aeabf173fb9adefc6522"
-SRC_URI[sha256sum] = "bab24fb79f78c876073527f515ed871fc9c81d816f66c8a0b051d8d653896389"
+SRC_URI[md5sum] = "f19032b5cb5e362745f0c2accc28a641"
+SRC_URI[sha256sum] = "d957a5cc371dcd7ff2aa0d87492f263aece46f79352f4520039b58b1f32552cb"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.5.5


