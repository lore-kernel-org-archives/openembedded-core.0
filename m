Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F97C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 13:44:01 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.19619.1739886223243822990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 05:43:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wm2PDTzo;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: festevam@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso7848881a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 05:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739886222; x=1740491022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2QA90zJjYQWQIOm6X6qA8YoBxHZupCd2rfd+s2jZPhE=;
        b=Wm2PDTzoqKNUM90b3IeSW2sd33MI3R8B/GCSPpPCSy1zdEaY7nD3qavAcar/CmWuy4
         n14MXjSkn+JL8x5cLl74/qPqOpdFgItquGZnDmpS3GnsWvMC7SNraAgNqvaPE4gnOpLV
         sjfXN3F7LiiO87tW/lpNPO0hQNrncAnRmfGSWM2ddz1BNeaeIHc7hhcK3GW/HNkhj6p+
         VRkwCUFBbsQLUaQOdyriwzuUDSfa3dN4Yzr5xQG8jF7MaNiEJimzFD6YcNKqaeBZCOL/
         RUwYxBh9NupwcCNwuVe6+mKxmNuvu+GZJhwvOXBsxhNiZbViPnoSaOpsxA3kqNNhjg4e
         0AuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739886222; x=1740491022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QA90zJjYQWQIOm6X6qA8YoBxHZupCd2rfd+s2jZPhE=;
        b=f0sFinnLSZAXA9KiVUCXbSOTrG7/4cyqTgfdNvLYz4ELcqvYIc0IiQ7Xi2G3Rn+GEF
         7wyXTwhGViP8sgj6lo26EL8m8EACHDRmJkW4YnOzvPM6SPhcbavMQsGS/+COWLxSWsZH
         HqSjXjEukzmFAH3btzodF2JQDE5DKUb06/Q3L4rT9pwcd3ls/1zKytKwu7oWkuH9v3y2
         n3TQC8GlTTFX5aryeqy2lEYTxzCU/6Ag2FP33znovhMps52Mbkg6WIKEv4rxT3VVOxZ1
         r/Snal1MQnCXKW4OGMNWH6TMLiUcDsZiGipWPIkFCwB1sPZRxFi84Mt70Kc8eKx4OlX4
         EA5w==
X-Gm-Message-State: AOJu0YwLZlrhA4hKhV28JPt7t8vMrjzZMroLt4oICqK+6i/ptB/3t0Tu
	kvmDV/xJW1aLa1tdj4GH7BWbc0osddVLsyIrEP6eaKyl9rZL/pt5eIYYpw==
X-Gm-Gg: ASbGnctvHxW7LuPXtX272bo8ljRlVo4AvyoUR/exPJtUk3uwD3rLBdIcFdYN454Wx6V
	YbHFuDSrd4+eTCm4xMMBccoJM33CpZhn7nox/OKktBBJJPHd6IWvVIjZw5x8hx9tU8Pya4FB87T
	SFVWwBi670Tz4pQ7FrZJ44t5sBTaG4+ePtDvP6ir5Pgj4jqW/VH5qZw9Or2rIGYYrotj9VmbUMY
	OyXFPmo7ELa1U5q0CZh7zS/cBvHyyue5X13I3c+XhZdctO4JgKfzLVN1JaAxVBIXVHErztUnNPp
	My6a4xsYkvoKN3bBomWS9Rc8lNPzaQ==
X-Google-Smtp-Source: AGHT+IGwL8izICj1NXpCgb30+KLtNpIhUUFSuTiw5fJml7QVgbu6YWyWSN57veU9SRs8x9kT3tjZjg==
X-Received: by 2002:a17:90a:ec8d:b0:2ee:3cc1:793a with SMTP id 98e67ed59e1d1-2fc41154d23mr21878407a91.29.1739886222004;
        Tue, 18 Feb 2025 05:43:42 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1519:b6c5:dd34:4b22])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc13ba564bsm10120018a91.40.2025.02.18.05.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 05:43:41 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	raj.khem@gmail.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/2] libexecinfo: Move it to the core
Date: Tue, 18 Feb 2025 10:43:35 -0300
Message-Id: <20250218134336.1976728-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211617

Move the libexecinfo recipe from meta-openembedded to meta-oe.

The motivation for doing this is building mtd-utils 2.3.0 with musl.

Musl requires an external libexecinfo to provide backtrace support.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Newly introduced.

 meta/conf/distro/include/maintainers.inc      |  1 +
 .../0001-makefile-Fix-build-on-linux.patch    | 61 ++++++++++++++
 ...piler-errors-found-with-newer-gcc-cl.patch | 81 +++++++++++++++++++
 meta/recipes-core/musl/libexecinfo_1.1.bb     | 31 +++++++
 4 files changed, 174 insertions(+)
 create mode 100644 meta/recipes-core/musl/libexecinfo/0001-makefile-Fix-build-on-linux.patch
 create mode 100644 meta/recipes-core/musl/libexecinfo/0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch
 create mode 100644 meta/recipes-core/musl/libexecinfo_1.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 24c8a850ec98..afb79846608c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -333,6 +333,7 @@ RECIPE_MAINTAINER:pn-libepoxy = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-liberation-fonts = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libevdev = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libevent = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-libexecinfo = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libexif = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libfakekey = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libffi = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-core/musl/libexecinfo/0001-makefile-Fix-build-on-linux.patch b/meta/recipes-core/musl/libexecinfo/0001-makefile-Fix-build-on-linux.patch
new file mode 100644
index 000000000000..b37b1aa2a689
--- /dev/null
+++ b/meta/recipes-core/musl/libexecinfo/0001-makefile-Fix-build-on-linux.patch
@@ -0,0 +1,61 @@
+From 910bbc2cb6cc1cfa6deed9d170da02a639902c7c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 19 Mar 2017 16:14:54 -0700
+Subject: [PATCH 1/2] makefile: Fix build on linux
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ Makefile | 33 +++++++++++++++++----------------
+ 1 file changed, 17 insertions(+), 16 deletions(-)
+
+Index: libexecinfo-1.1/Makefile
+===================================================================
+--- libexecinfo-1.1.orig/Makefile
++++ libexecinfo-1.1/Makefile
+@@ -23,24 +23,25 @@
+ # SUCH DAMAGE.
+ #
+ # $Id: Makefile,v 1.3 2004/07/19 05:19:55 sobomax Exp $
++#
++# Linux Makefile by Matt Smith <mcs@darkregion.net>, 2011/01/04
+
+-LIB=	execinfo
+-
+-SRCS=	stacktraverse.c stacktraverse.h execinfo.c execinfo.h
+-
+-INCS=	execinfo.h
+-
+-SHLIB_MAJOR=	1
+-SHLIB_MINOR=	0
+-
+-NOPROFILE=	yes
+-
+-DPADD=		${LIBM}
+-LDADD=		-lm
+-
+-#WARNS?=	4
+-
+-#stacktraverse.c: gen.py
+-#	./gen.py > stacktraverse.c
++CC?=cc
++AR?=ar
++EXECINFO_CFLAGS=$(CFLAGS) -O2 -pipe -fno-strict-aliasing -std=gnu99 -fstack-protector -c
++EXECINFO_LDFLAGS=$(LDFLAGS)
++
++all: static dynamic
++
++static:
++	$(CC) $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) stacktraverse.c
++	$(CC) $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) execinfo.c
++	$(AR) rcs libexecinfo.a stacktraverse.o execinfo.o
++
++dynamic:
++	$(CC) -fpic -DPIC $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) stacktraverse.c -o stacktraverse.So
++	$(CC) -fpic -DPIC $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) execinfo.c -o execinfo.So
++	$(CC) -shared -Wl,-soname,libexecinfo.so.1 -o libexecinfo.so.1 $(EXECINFO_LDFLAGS) stacktraverse.So execinfo.So
+
+-.include <bsd.lib.mk>
++clean:
++	rm -rf *.o *.So *.a *.so
diff --git a/meta/recipes-core/musl/libexecinfo/0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch b/meta/recipes-core/musl/libexecinfo/0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch
new file mode 100644
index 000000000000..34fd98aabaf7
--- /dev/null
+++ b/meta/recipes-core/musl/libexecinfo/0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch
@@ -0,0 +1,80 @@
+From 0810817773fb81d7383d2fa8464244c8f79845fb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 19 Mar 2017 16:16:18 -0700
+Subject: [PATCH 2/2] execinfo: Fix compiler errors found with newer gcc/clang
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ execinfo.c | 19 +++++++++++--------
+ 1 file changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/execinfo.c b/execinfo.c
+index 906fb14..9448b60 100644
+--- a/execinfo.c
++++ b/execinfo.c
+@@ -69,7 +69,8 @@ backtrace(void **buffer, int size)
+ char **
+ backtrace_symbols(void *const *buffer, int size)
+ {
+-    int i, clen, alen, offset;
++    size_t clen, alen;
++    int i, offset;
+     char **rval;
+     char *cp;
+     Dl_info info;
+@@ -78,7 +79,6 @@ backtrace_symbols(void *const *buffer, int size)
+     rval = malloc(clen);
+     if (rval == NULL)
+         return NULL;
+-    (char **)cp = &(rval[size]);
+     for (i = 0; i < size; i++) {
+         if (dladdr(buffer[i], &info) != 0) {
+             if (info.dli_sname == NULL)
+@@ -92,14 +92,14 @@ backtrace_symbols(void *const *buffer, int size)
+                    2 +                      /* " <" */
+                    strlen(info.dli_sname) + /* "function" */
+                    1 +                      /* "+" */
+-                   D10(offset) +            /* "offset */
++                   10 +                     /* "offset */
+                    5 +                      /* "> at " */
+                    strlen(info.dli_fname) + /* "filename" */
+                    1;                       /* "\0" */
+             rval = realloc_safe(rval, clen + alen);
+             if (rval == NULL)
+                 return NULL;
+-            snprintf(cp, alen, "%p <%s+%d> at %s",
++            snprintf((char *) rval + clen, alen, "%p <%s+%d> at %s",
+               buffer[i], info.dli_sname, offset, info.dli_fname);
+         } else {
+             alen = 2 +                      /* "0x" */
+@@ -108,12 +108,15 @@ backtrace_symbols(void *const *buffer, int size)
+             rval = realloc_safe(rval, clen + alen);
+             if (rval == NULL)
+                 return NULL;
+-            snprintf(cp, alen, "%p", buffer[i]);
++            snprintf((char *) rval + clen, alen, "%p", buffer[i]);
+         }
+-        rval[i] = cp;
+-        cp += alen;
++        rval[i] = (char *) clen;
++        clen += alen;
+     }
+
++    for (i = 0; i < size; i++)
++        rval[i] += (long) rval;
++
+     return rval;
+ }
+
+@@ -155,6 +158,6 @@ backtrace_symbols_fd(void *const *buffer, int size, int fd)
+                 return;
+             snprintf(buf, len, "%p\n", buffer[i]);
+         }
+-        write(fd, buf, len - 1);
++        write(fd, buf, strlen(buf));
+     }
+ }
+--
+2.12.0
diff --git a/meta/recipes-core/musl/libexecinfo_1.1.bb b/meta/recipes-core/musl/libexecinfo_1.1.bb
new file mode 100644
index 000000000000..27640b12a74d
--- /dev/null
+++ b/meta/recipes-core/musl/libexecinfo_1.1.bb
@@ -0,0 +1,30 @@
+# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Library for inspecting program's backtrace"
+DESCRIPTION = "A quick-n-dirty BSD licensed clone of the GNU libc backtrace facility."
+HOMEPAGE = "http://www.freshports.org/devel/libexecinfo"
+LIC_FILES_CHKSUM = "file://execinfo.c;endline=25;md5=85bd3fa4ea9acae5182e29db063fe2e5"
+LICENSE = "BSD-2-Clause"
+SECTION = "libs"
+DEPENDS = ""
+
+SRC_URI = "http://distcache.freebsd.org/local-distfiles/itetcu/${BP}.tar.bz2 \
+           file://0001-makefile-Fix-build-on-linux.patch \
+           file://0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch \
+           "
+SRC_URI[sha256sum] = "c9a21913e7fdac8ef6b33250b167aa1fc0a7b8a175145e26913a4c19d8a59b1f"
+
+CFLAGS += "-fno-omit-frame-pointer  -D_GNU_SOURCE"
+
+do_install() {
+    install -D -m 0744 ${S}/execinfo.h ${D}${includedir}/execinfo.h
+    install -D -m 0744 ${S}/stacktraverse.h ${D}${includedir}/stacktraverse.h
+    install -D -m 0744 ${B}/libexecinfo.a ${D}${libdir}/libexecinfo.a
+    install -D -m 0755 ${B}/libexecinfo.so.1 ${D}${libdir}/libexecinfo.so.1
+    ln -s libexecinfo.so.1 ${D}${libdir}/libexecinfo.so
+}
+#
+# We will skip parsing for non-musl systems
+#
+COMPATIBLE_HOST = ".*-musl.*"
-- 
2.34.1


