Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.17635.1590940465564859676
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TcRpWGHw;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id x1so6857910ejd.8
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NWCfw/+0RSHhn9QUyyDOPZ57MXpf5ABTYC+UGRyvifM=;
        b=TcRpWGHw9zhviWymPHTa5Q3Kd82V1taEDyBJ0yj45zJjgg/SOogqOq7rRK1D20TlC/
         SGHt2zN71xUsAflD9xNlqNvZzBxwCDpCFl7Gqh4KukJoN/LgUES96UiSVzHMJqmW00UE
         kX8KvV44svX0NFRb9l6aVo+LlllUQ3GtEbVbuBO2MMRq+3YNkBw2/gJ9NceldL6RlV6R
         Ahn613G95e/r+uKue3UcxIV5FlCD+rjAthmLmMqHwC6aIXBrXetBb9CzlAKYzNnSLjU6
         raGM/nlGbZIJ3HMReQ+G9N5+anNWnG7mS03wQXLaK/KHwgZj8EZcckMAXdWJ3GiD8L2u
         uvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NWCfw/+0RSHhn9QUyyDOPZ57MXpf5ABTYC+UGRyvifM=;
        b=n7eCgE1/eb45slSKiAXNLLjGh0nAGAzD4nDqv15jnqHhdMRVQ+Vex26O4Q4+pJPpTi
         3fWVdPYz+wx1ttUbjuEffNoiDxF+IaVCiwI9Ka9WnB2tWR5Ztbf9eKP2l9foB51TJ4T1
         P9RD9LADNEQ0LWBeFl4raf98dXowK4ktfY28hvmQ3+67NV3B3uwt7KFpSR8qrl06mSlf
         TV76YxwjlkrVX13ARDL/Q9jrGwgjn6Xs689eECqUhNWMIGFVb7TP3yPme5nqOyU9/v2j
         KB+giNARoB6shaQn9inLEWVTY5ACcw8qRmyZ/7BaUfBOzGk+VztzHyiVf89bxh4XrJXR
         9Jrw==
X-Gm-Message-State: AOAM532e4xgjYHg/6YzhEOjv1topKOgGPmewBVbTzI3ntVSbFY+N5Wv2
	efEsSJgcFaWexxxFpJa+BCvEVhBl
X-Google-Smtp-Source: ABdhPJwhXR6ZWUy5hwdmjSel7sK4n9PvLxsvM8L8T+Q6yvgxYI8Eozmi2b/Ff6BqLyFjvh4Oa1juzw==
X-Received: by 2002:a17:906:da1e:: with SMTP id fi30mr16482078ejb.80.1590940463703;
        Sun, 31 May 2020 08:54:23 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:23 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 64/70] libcpre2: update 10.34 -> 10.35
Date: Sun, 31 May 2020 17:52:48 +0200
Message-Id: <20200531155254.10283-64-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace pcre-cross.patch with the (default) option
to use pre-built tables; the README says it's ok, and
recommended in cross-compile situations. The option
was in the recipe from the start and neither the commit
that adds the recipe, nor the patch to make it work explain
why.

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libpcre/libpcre2/pcre-cross.patch         | 65 -------------------
 .../{libpcre2_10.34.bb => libpcre2_10.35.bb}  | 15 +----
 2 files changed, 3 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-support/libpcre/libpcre2/pcre-cross.patch
 rename meta/recipes-support/libpcre/{libpcre2_10.34.bb => libpcre2_10.35.bb} (74%)

diff --git a/meta/recipes-support/libpcre/libpcre2/pcre-cross.patch b/meta/recipes-support/libpcre/libpcre2/pcre-cross.patch
deleted file mode 100644
index 871cdfcb7d..0000000000
--- a/meta/recipes-support/libpcre/libpcre2/pcre-cross.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Fix for cross compiling
-
-Fixed:
-| ./dftables src/pcre2_chartables.c
-| make: ./dftables: Command not found
-| make: *** [src/pcre2_chartables.c] Error 127
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
-Index: pcre2-10.30/Makefile.am
-===================================================================
---- pcre2-10.30.orig/Makefile.am
-+++ pcre2-10.30/Makefile.am
-@@ -325,9 +325,21 @@ bin_SCRIPTS = pcre2-config
- ## to copy a distributed set of tables that are defined for ASCII code. In this
- ## case, dftables is not needed.
- 
-+CC_FOR_BUILD = @CC_FOR_BUILD@
-+CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
-+CCLD_FOR_BUILD = @CCLD_FOR_BUILD@
-+LDFLAGS_FOR_BUILD = @LDFLAGS_FOR_BUILD@
-+
- if WITH_REBUILD_CHARTABLES
- noinst_PROGRAMS += dftables
- dftables_SOURCES = src/dftables.c
-+
-+dftables_LINK = $(CCLD_FOR_BUILD) -o $@
-+dftables_LDFLAGS = $(LDFLAGS_FOR_BUILD)
-+
-+src/dftables.o: $(srcdir)/src/dftables.c
-+	$(CC_FOR_BUILD) -c $(CFLAGS_FOR_BUILD) -o $@ $(srcdir)/src/dftables.c
-+
- src/pcre2_chartables.c: dftables$(EXEEXT)
- 	rm -f $@
- 	./dftables$(EXEEXT) $@
-Index: pcre2-10.30/configure.ac
-===================================================================
---- pcre2-10.30.orig/configure.ac
-+++ pcre2-10.30/configure.ac
-@@ -60,6 +60,23 @@ fi
- # This is a new thing required to stop a warning from automake 1.12
- m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
- 
-+if test x"$cross_compiling" = xyes; then
-+    CC_FOR_BUILD="${CC_FOR_BUILD-gcc}"
-+    CCLD_FOR_BUILD="${CCLD_FOR_BUILD-gcc}"
-+    CFLAGS_FOR_BUILD="${CFLAGS_FOR_BUILD}"
-+    LDFLAGS_FOR_BUILD="${LDFLAGS_FOR_BUILD}"
-+else
-+    CC_FOR_BUILD="${CC_FOR_BUILD-\$(CC)}"
-+    CCLD_FOR_BUILD="${CCLD_FOR_BUILD-\$(CCLD)}"
-+    CFLAGS_FOR_BUILD="${CFLAGS_FOR_BUILD-\$(CFLAGS)}"
-+    LDFLAGS_FOR_BUILD="${LDFLAGS_FOR_BUILD-\$(LDFLAGS)}"
-+fi
-+AC_ARG_VAR(CC_FOR_BUILD, [build system C compiler])
-+AC_ARG_VAR(CCLD_FOR_BUILD, [build system C linker frontend])
-+AC_ARG_VAR(CFLAGS_FOR_BUILD, [build system C compiler arguments])
-+AC_ARG_VAR(LDFLAGS_FOR_BUILD, [build system C linker frontend arguments])
-+
-+
- # Check for a 64-bit integer type
- AC_TYPE_INT64_T
- 
diff --git a/meta/recipes-support/libpcre/libpcre2_10.34.bb b/meta/recipes-support/libpcre/libpcre2_10.35.bb
similarity index 74%
rename from meta/recipes-support/libpcre/libpcre2_10.34.bb
rename to meta/recipes-support/libpcre/libpcre2_10.35.bb
index fa8655e027..35c019c100 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.34.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.35.bb
@@ -8,14 +8,11 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=b1588d3bb4cb0e1f5a597d908f8c5b37"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=a06590e9bd4c229532364727aaeaf084"
 
-SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
-           file://pcre-cross.patch \
-"
+SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "d280b62ded13f9ccf2fac16ee5286366"
-SRC_URI[sha256sum] = "74c473ffaba9e13db6951fd146e0143fe9887852ce73406a03277af1d9b798ca"
+SRC_URI[sha256sum] = "9ccba8e02b0ce78046cdfb52e5c177f0f445e421059e43becca4359c669d4613"
 
 CVE_PRODUCT = "pcre2"
 
@@ -30,20 +27,14 @@ inherit autotools binconfig-disabled
 
 EXTRA_OECONF = "\
     --enable-newline-is-lf \
-    --enable-rebuild-chartables \
     --with-link-size=2 \
     --with-match-limit=10000000 \
     --enable-pcre2-16 \
     --enable-pcre2-32 \
 "
-# Set LINK_SIZE in BUILD_CFLAGS given that the autotools bbclass use it to
-# set CFLAGS_FOR_BUILD, required for the libpcre build.
-BUILD_CFLAGS =+ "-DLINK_SIZE=2 -I${B}/src"
 CFLAGS += "-D_REENTRANT"
 CXXFLAGS_append_powerpc = " -lstdc++"
 
-export CCLD_FOR_BUILD ="${BUILD_CCLD}"
-
 PACKAGES =+ "libpcre2-16 libpcre2-32 pcre2grep pcre2grep-doc pcre2test pcre2test-doc"
 
 SUMMARY_pcre2grep = "grep utility that uses perl 5 compatible regexes"
-- 
2.26.2

