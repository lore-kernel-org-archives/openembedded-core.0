Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.22278.1586476334743366912
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 16:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pDhgSqsu;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id k15so290765pfh.6
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 16:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YMvj7mVHq5krjycL7/iFWmmqhy4zNKivvRlxSvoW7yQ=;
        b=pDhgSqsuefgttlAKJWZ9cJPeAPzPa/nmRrgY5vXNOQ7oGvuwi1QT8TMyOIHNBGf65f
         qqK/wHjQ5UANFevMwMkldnqspT9HiS0MlzKCX7NieNv5zVjoOzCgU4ZtxJyMDfvT9xJ+
         a/vOnj4j6rsGjDgEzv0YRSKdWlistBvv5gxowy65GgHHfIT73J7yeMdsLqeGiGQiLK2N
         IM5XpMXa5l8DxBSYIMMvPvv/mycY7EFsK5K/LNk7ADt52G8P3cnwGer6qPlGAABlBmeR
         +oi4g4ZpuvIZZN8SNYW7PKkX66qx3ud/s6MQSJjgoPspCP0wS6RM0v2go+5UHYuPdXLP
         GXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YMvj7mVHq5krjycL7/iFWmmqhy4zNKivvRlxSvoW7yQ=;
        b=FOKdFh2As7nldVn/DcBUsemcM/P3BIlkYZHT+39T+bR2F3flesz/HdaIEa5SgMbOQi
         t0yqRTt03SsKXQtbww2/iFdgpBFEST79DNP2emvV/mQjb3yM6ktlu7OXjZRvOaDyEU1l
         9VSFyZHmAkul4zwo9AQATZw17I8/xP0tjO9Xr2A/3Ch2Rl7Ftn9zHhaOVpAR9co1N4fi
         isuDS3wZl801bJbA1//Brw39ckKzvtTBQUOGaysF8PceRRcz5F6k4a+BY8K0REfEJiQ4
         i/l6RVnmvhxGZCF4OiG4iu31ToVpbZydmojs3ggQ2i1K1IIX5HnjVLpGB39lQEhY9NfL
         Q20A==
X-Gm-Message-State: AGi0PuaT8+ckYlXdCeK9yNfX2XCIkPmbbGzJI7SXEdco4IDRvg2I2MdL
	jG8aEpikT2eGIA/u6CG81GyRdTpX3g0=
X-Google-Smtp-Source: APiQypLIpPA7Ve3zp2YZ9D/lbqhP24RlYYKhiSQsj1hOHY3dVdi0AGArk00V+/MoUo7+1m4kbuq09Q==
X-Received: by 2002:aa7:9e82:: with SMTP id p2mr2293170pfq.46.1586476333609;
        Thu, 09 Apr 2020 16:52:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id 36sm200091pgs.70.2020.04.09.16.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 16:52:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] libucontext: Bring in mips/mips64 support
Date: Thu,  9 Apr 2020 16:52:08 -0700
Message-Id: <20200409235209.985108-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: Updated copyright years [1]

Latest master 0.10.x+ has added support for mips/mips64, which should
help compile ruby on musl for these architectures

Switch SRC_URI to github upstream URI

Check for common arches before checking others in map_kernel_arch

Drop already upstreamed patches

[1] https://github.com/kaniini/libucontext/commit/d31eaabbaf5f45656c10e4bccd3fe6653a7d3ec1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Delete removed patches, update license checksum

 .../0001-Makefile-Add-LIBDIR-variable.patch   | 46 ------------------
 .../0001-pass-LDFLAGS-to-link-step.patch      | 31 ------------
 meta/recipes-core/musl/libucontext_git.bb     | 48 +++++++++----------
 3 files changed, 24 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-core/musl/libucontext/0001-Makefile-Add-LIBDIR-variable.patch
 delete mode 100644 meta/recipes-core/musl/libucontext/0001-pass-LDFLAGS-to-link-step.patch

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
index 92cb703b0b..97daa5b1ba 100644
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
+SRCREV = "272d6821039813818595e9a3b909ce18f33a89ab"
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
2.26.0

