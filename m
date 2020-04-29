Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.4526.1588176709509068473
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 09:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=B7gkq89p;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.65, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f65.google.com with SMTP id a7so939253pju.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 09:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/rELiuR2ywv7m67eV0laA/gkQMI/FjDkn4OVx2vwHxc=;
        b=B7gkq89ptzP+GPUhfZ+aod1U72GMuQLDYV7xnHd0qcfLIqIw2JwM42TyL8zDZlg53u
         3MdWSmH9sCsvexVITa0cvdlxzbRiQN0pP4hXt9GQmnEdFHDwKCMONq8EYuBGvKut7F/V
         4PIXi1zr5K4dFwgjJIb0GWPeTGJ8GHb60pHEiZpbGuxbKjyILqtUlJp89gPjt7CrPHYb
         gqvzrJUMjx9AocF4zYL2e0SOmNdIn+3t+1JnQjpRrnTBxpTFm2nWxJTlmU9tfMweZg0P
         hAU5obv82XNw6647hHLZe0habrFCUMWroxL0j+Xfbqt+WdchIu5OR25gd1vssrn7mGid
         Asbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/rELiuR2ywv7m67eV0laA/gkQMI/FjDkn4OVx2vwHxc=;
        b=GqY6VqFquSEEyefj1QnPjc2HdH5DdWnV68/P7Fu/kQe5caZW5nXrEtMJ8DDFn7dfX1
         qGAkdWSbDTyZj7HBk72I8DG3ek1Lau+doCEauyFr8wzej6+5aP5k0cLNbPkWOM87QLnf
         TIFg248iJLOD+jbKHOV0nxYiHRvjTZTW18vk6fhaFcfz29JJkjPnw+PvYmLLZ/I9Ocyr
         7d+yGQKBGcAvw08WSK+LTgWt8mTxeXHJqWDHBQsuxNoSnt8Elb+uYhac8PYhfRdAWBEP
         4wcuAI0u/pXtTHSKmVbGDV/pdzxkqcRUd4nK6lq0cuiM7EW5GMpahXzZQ2UBjwECuz1U
         TfHQ==
X-Gm-Message-State: AGi0PuZX29BTfa0Q9jMMIlr4f6WoJ8ifUs1BQajNzS84MbG/CQTOqYS7
	misIzTfg2HoaIg2d1C0awDiuVdbKn405Gw==
X-Google-Smtp-Source: APiQypJwp6dlUvGYTVcCUv7JkmDXCvWMZufXbjZ8At3ZvQOXBz+gXZUataZbY7CcLj1Ba1A8H4EVxw==
X-Received: by 2002:a17:90a:6c96:: with SMTP id y22mr2837297pjj.74.1588176708342;
        Wed, 29 Apr 2020 09:11:48 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o1sm4833062pjs.39.2020.04.29.09.11.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:11:47 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/16] libucontext: Bring in mips/mips64 support
Date: Wed, 29 Apr 2020 06:10:52 -1000
Message-Id: <0dcfcde3f638b7f2309f4574eb21cdf524b182ce.1588175775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588175775.git.steve@sakoman.com>
References: <cover.1588175775.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

License-Update: Updated copyright years [1]

Latest master 0.10.x+ has added support for mips/mips64, which should
help compile ruby on musl for these architectures

Switch SRC_URI to github upstream URI

Check for common arches before checking others in map_kernel_arch

Drop already upstreamed patches

[1] https://github.com/kaniini/libucontext/commit/d31eaabbaf5f45656c10e4bccd3fe6653a7d3ec1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...move-using-.end-directive-with-clang.patch | 36 ++++++++++++++
 .../0001-Makefile-Add-LIBDIR-variable.patch   | 46 ------------------
 .../0001-pass-LDFLAGS-to-link-step.patch      | 31 ------------
 meta/recipes-core/musl/libucontext_git.bb     | 48 +++++++++----------
 4 files changed, 60 insertions(+), 101 deletions(-)
 create mode 100644 meta/recipes-core/musl/0001-Remove-using-.end-directive-with-clang.patch
 delete mode 100644 meta/recipes-core/musl/libucontext/0001-Makefile-Add-LIBDIR-variable.patch
 delete mode 100644 meta/recipes-core/musl/libucontext/0001-pass-LDFLAGS-to-link-step.patch

diff --git a/meta/recipes-core/musl/0001-Remove-using-.end-directive-with-clang.patch b/meta/recipes-core/musl/0001-Remove-using-.end-directive-with-clang.patch
new file mode 100644
index 0000000000..be79cb53f1
--- /dev/null
+++ b/meta/recipes-core/musl/0001-Remove-using-.end-directive-with-clang.patch
@@ -0,0 +1,36 @@
+From b6732f68848ecc8ff01054bf7aea70a241c37116 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 10 Apr 2020 11:23:39 -0700
+Subject: [PATCH] Remove using .end directive with clang
+
+Clang does not support this asm directive
+Fixes Issue #19
+
+Upstream-Status: Submitted [https://github.com/kaniini/libucontext/pull/20]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ arch/common/common-defs.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/arch/common/common-defs.h b/arch/common/common-defs.h
+index bf2fb8c..618116b 100644
+--- a/arch/common/common-defs.h
++++ b/arch/common/common-defs.h
+@@ -28,10 +28,13 @@
+ 	ENT(__proc)					\
+ __proc:							\
+ 	SETUP_FRAME(__proc)
+-
++#ifdef __clang__
++#define END(__proc)
++#else
+ #define END(__proc)					\
+ 	.end	__proc;					\
+ 	.size	__proc,.-__proc;
++#endif
+ 
+ #define ALIAS(__alias, __real)				\
+ 	.weak	__alias;				\
+-- 
+2.26.0
+
diff --git a/meta/recipes-core/musl/libucontext/0001-Makefile-Add-LIBDIR-variable.patch b/meta/recipes-core/musl/libucontext/0001-Makefile-Add-LIBDIR-variable.patch
deleted file mode 100644
index 4f91c8f189..0000000000
--- a/meta/recipes-core/musl/libucontext/0001-Makefile-Add-LIBDIR-variable.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 9bc3cedba54708c40c4a853b240c46e69f87de3c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 17 Mar 2020 10:04:40 -0700
-Subject: [PATCH] Makefile: Add LIBDIR variable
-
-This ensures that it can be installed into custom location and also
-
-Upstream-Status: Submitted
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
---- a/Makefile
-+++ b/Makefile
-@@ -1,5 +1,5 @@
- ARCH := $(shell uname -m)
--
-+LIBDIR := /lib
- CFLAGS = -ggdb3 -O2 -Wall -Iarch/${ARCH}
- 
- LIBUCONTEXT_C_SRC = $(wildcard arch/${ARCH}/*.c)
-@@ -10,8 +10,8 @@ LIBUCONTEXT_SOVERSION = 0
- LIBUCONTEXT_NAME = libucontext.so
- LIBUCONTEXT_STATIC_NAME = libucontext.a
- LIBUCONTEXT_SONAME = libucontext.so.${LIBUCONTEXT_SOVERSION}
--LIBUCONTEXT_PATH = /lib/${LIBUCONTEXT_SONAME}
--LIBUCONTEXT_STATIC_PATH = /lib/${LIBUCONTEXT_STATIC_NAME}
-+LIBUCONTEXT_PATH = ${LIBDIR}/${LIBUCONTEXT_SONAME}
-+LIBUCONTEXT_STATIC_PATH = ${LIBDIR}/${LIBUCONTEXT_STATIC_NAME}
- 
- all: ${LIBUCONTEXT_SONAME} ${LIBUCONTEXT_STATIC_NAME}
- 
-@@ -36,9 +36,9 @@ clean:
- 		${LIBUCONTEXT_OBJ} test_libucontext
- 
- install: all
--	install -D -m755 ${LIBUCONTEXT_NAME} ${DESTDIR}/${LIBUCONTEXT_PATH}
--	install -D -m664 ${LIBUCONTEXT_STATIC_NAME} ${DESTDIR}/${LIBUCONTEXT_STATIC_PATH}
--	ln -sf ${LIBUCONTEXT_SONAME} ${DESTDIR}/lib/${LIBUCONTEXT_NAME}
-+	install -D -m755 ${LIBUCONTEXT_NAME} ${DESTDIR}${LIBUCONTEXT_PATH}
-+	install -D -m664 ${LIBUCONTEXT_STATIC_NAME} ${DESTDIR}${LIBUCONTEXT_STATIC_PATH}
-+	ln -sf ${LIBUCONTEXT_SONAME} ${DESTDIR}${LIBDIR}/${LIBUCONTEXT_NAME}
- 
- check: test_libucontext ${LIBUCONTEXT_SONAME}
- 	env LD_LIBRARY_PATH=$(shell pwd) ./test_libucontext
diff --git a/meta/recipes-core/musl/libucontext/0001-pass-LDFLAGS-to-link-step.patch b/meta/recipes-core/musl/libucontext/0001-pass-LDFLAGS-to-link-step.patch
deleted file mode 100644
index 0ab8caf3e6..0000000000
--- a/meta/recipes-core/musl/libucontext/0001-pass-LDFLAGS-to-link-step.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 12d45d250d08e96e889e38e77273c3ef73e6fc97 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 25 Nov 2019 15:07:35 -0800
-Subject: [PATCH] pass LDFLAGS to link step
-
-This helps to use OE specific linker flags and fixes
-
-do_package_qa: QA Issue: No GNU_HASH in the ELF binary
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 8a605fd..d1c9637 100644
---- a/Makefile
-+++ b/Makefile
-@@ -20,7 +20,7 @@ ${LIBUCONTEXT_STATIC_NAME}: ${LIBUCONTEXT_OBJ}
- 
- ${LIBUCONTEXT_NAME}: ${LIBUCONTEXT_OBJ}
- 	$(CC) -o ${LIBUCONTEXT_NAME} -Wl,-soname,${LIBUCONTEXT_SONAME} \
--		-shared ${LIBUCONTEXT_OBJ}
-+		-shared ${LIBUCONTEXT_OBJ} ${LDFLAGS}
- 
- ${LIBUCONTEXT_SONAME}: ${LIBUCONTEXT_NAME}
- 	ln -sf ${LIBUCONTEXT_NAME} ${LIBUCONTEXT_SONAME}
--- 
-2.24.0
-
diff --git a/meta/recipes-core/musl/libucontext_git.bb b/meta/recipes-core/musl/libucontext_git.bb
index 92cb703b0b..ec988f1920 100644
--- a/meta/recipes-core/musl/libucontext_git.bb
+++ b/meta/recipes-core/musl/libucontext_git.bb
@@ -4,26 +4,25 @@
 SUMMARY = "ucontext implementation featuring glibc-compatible ABI"
 HOMEPAGE = "https://github.com/kaniini/libucontext"
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=864cc1445419406b7093e8e531c9515e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6eed01fa0e673c76f5a5715438f65b1d"
 SECTION = "libs"
 DEPENDS = ""
 
-PV = "0.1.3+${SRCPV}"
-SRCREV = "e6b4d7516dae9b200e94fcfcb9ebc9331389655f"
-SRC_URI = "git://code.foxkit.us/adelie/libucontext.git;protocol=https \
-           file://0001-pass-LDFLAGS-to-link-step.patch \
-           file://0001-Makefile-Add-LIBDIR-variable.patch \
+PV = "0.10+${SRCPV}"
+SRCREV = "19fa1bbfc26efb92147b5e85cc0ca02a0e837561"
+SRC_URI = "git://github.com/kaniini/libucontext \
 "
 
 S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST = ".*-musl.*"
 
-valid_archs = "\
-i386 x86 \
-ppc powerpc powerpc64 ppc64  \
-arm aarch64 \
-s390 \
+valid_archs = " \
+    x86 x86_64  \
+    ppc ppc64   \
+    mips mips64 \
+    arm aarch64 \
+    s390x       \
 "
 
 def map_kernel_arch(a, d):
@@ -31,18 +30,19 @@ def map_kernel_arch(a, d):
 
     valid_archs = d.getVar('valid_archs').split()
 
-    if   re.match('(i.86|athlon)$', a):         return 'x86'
-    elif re.match('x86.64$', a):                return 'x86_64'
-    elif re.match('armeb$', a):                 return 'arm'
-    elif re.match('aarch64$', a):               return 'aarch64'
-    elif re.match('aarch64_be$', a):            return 'aarch64'
-    elif re.match('aarch64_ilp32$', a):         return 'aarch64'
-    elif re.match('aarch64_be_ilp32$', a):      return 'aarch64'
-    elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a):      return 'mips'
-    elif re.match('p(pc|owerpc)', a):           return 'ppc'
-    elif re.match('p(pc64|owerpc64)', a):       return 'ppc64'
-    elif re.match('riscv64$', a):               return 'riscv64'
-    elif a in valid_archs:                      return a
+    if a in valid_archs:                            return a
+    elif re.match('(i.86|athlon)$', a):             return 'x86'
+    elif re.match('x86.64$', a):                    return 'x86_64'
+    elif re.match('armeb$', a):                     return 'arm'
+    elif re.match('aarch64$', a):                   return 'aarch64'
+    elif re.match('aarch64_be$', a):                return 'aarch64'
+    elif re.match('aarch64_ilp32$', a):             return 'aarch64'
+    elif re.match('aarch64_be_ilp32$', a):          return 'aarch64'
+    elif re.match('mips(isa|)(32|)(r6|)(el|)$', a): return 'mips'
+    elif re.match('mips(isa|)64(r6|)(el|)$', a):    return 'mips64'
+    elif re.match('p(pc|owerpc)', a):               return 'ppc'
+    elif re.match('p(pc64|owerpc64)', a):           return 'ppc64'
+    elif re.match('riscv64$', a):                   return 'riscv64'
     else:
         if not d.getVar("TARGET_OS").startswith("linux"):
             return a
@@ -50,7 +50,7 @@ def map_kernel_arch(a, d):
 
 export ARCH = "${@map_kernel_arch(d.getVar('TARGET_ARCH'), d)}"
 
-CFLAGS += "-Iarch/${ARCH}"
+CFLAGS += "-Iarch/${ARCH} -Iarch/common"
 
 EXTRA_OEMAKE = "CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}' LIBDIR='${base_libdir}'"
 
-- 
2.17.1

