Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.6403.1623744770063166637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=avjsAeOQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id ce15so21022539ejb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZRXsxMwfbsyZNz3zogKCry2FNBtCp+w9gRw1ZpqwtTk=;
        b=avjsAeOQb+NfjinxFtOZ28ogoWedXTLJii7FGPpgvhWEYW0BeqRC4TMup5UpZfSCYf
         rfXMsj3T2GMjFUXefxOHdTn2Ki17nDxEOjBtyk1TS3vLEaANVcFmKMFocL7mfaO0N4rD
         LVeMZb91Tslea2nzZnRPZW1lMxAACsf6QagN6ulScmNBU/4Zk2oO8zYY0llyR96HfN4r
         ZUN/NRXKfgdgRzcdrMky6WX4g1iuUPPyQhvq1M/WSgePAAU5vo7+N4E008FLYgiVbcMJ
         BB/Jnxqz96ksGWW+PD+Shgk1NU1Z0FXzDTOri6KnzyfYRLlDnbtW7QwRsuBOYAtp9l6o
         HagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZRXsxMwfbsyZNz3zogKCry2FNBtCp+w9gRw1ZpqwtTk=;
        b=SwrKQn1I2jgyjotlqmPuZzSwfSegGjMC2aajV7y9Jh0JvnCKoxuLttZsae/TKKudgl
         Gx9wH8MAWKHSWQiRHp0BeKamHVB0pQZa4Ji0d5OkR6H8NhiSggB8NWQxS3hDtdPqfUzv
         eMI8bYo9wBL29yWyTL6iISH1t9+TMAU1fIxvhOm3s6xl27SPN9SqFn1mOrZcnfK1QpSu
         eVOiOzMj+rMk4V1gsVCti4B9jrlwErD+/MIS9oRU6jQfs3B03rj7OutBx8a4xk0xNQs+
         M8bEVXB5clJpxlsq3Tui3SNSoN3rZWyYfM8fOQizrzXEV2DprZaVS6Qt1MGBo77loFy8
         H6FQ==
X-Gm-Message-State: AOAM531KoI6Ao4R1UxZZMY7ajAuOi9NV5R5iUexE1gh2fwK27myTvKcm
	SsSn1TFdmVsqMZqt80UZmvqIBfk329k37Q==
X-Google-Smtp-Source: ABdhPJyS7sqa7CC9wJPd6Q2rttc97/Pvx7uvVJXU28mAsC5Oe3J1mm+/3yNS0MxmkoHmdmZ9ZmDCng==
X-Received: by 2002:a17:907:2b26:: with SMTP id gc38mr19564364ejc.31.1623744768494;
        Tue, 15 Jun 2021 01:12:48 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:48 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: wangmy <wangmy@fujitsu.com>
Subject: [PATCH 05/31] m4: upgrade 1.4.18 -> 1.4.19
Date: Tue, 15 Jun 2021 10:12:14 +0200
Message-Id: <20210615081240.1734087-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: wangmy <wangmy@fujitsu.com>

0001-Unset-need_charset_alias-when-building-for-musl.patch
0001-c-stack-stop-using-SIGSTKSZ.patch
0001-test-getopt-posix-fix.patch
m4-1.4.18-glibc-change-work-around.patch
deleted since they are included in 1.4.19

refresh ac_config_links.patch

License-update: URL of license changed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../m4/{m4-1.4.18.inc => m4-1.4.19.inc}       |  14 +-
 ...4-native_1.4.18.bb => m4-native_1.4.19.bb} |   0
 ...charset_alias-when-building-for-musl.patch |  33 -----
 .../m4/0001-c-stack-stop-using-SIGSTKSZ.patch |  84 -----------
 .../m4/m4/0001-test-getopt-posix-fix.patch    |  41 ------
 .../m4/m4/ac_config_links.patch               |  24 ++--
 .../m4-1.4.18-glibc-change-work-around.patch  | 130 ------------------
 .../m4/{m4_1.4.18.bb => m4_1.4.19.bb}         |   0
 8 files changed, 20 insertions(+), 306 deletions(-)
 rename meta/recipes-devtools/m4/{m4-1.4.18.inc => m4-1.4.19.inc} (79%)
 rename meta/recipes-devtools/m4/{m4-native_1.4.18.bb => m4-native_1.4.19.bb} (100%)
 delete mode 100644 meta/recipes-devtools/m4/m4/0001-Unset-need_charset_alias-when-building-for-musl.patch
 delete mode 100644 meta/recipes-devtools/m4/m4/0001-c-stack-stop-using-SIGSTKSZ.patch
 delete mode 100644 meta/recipes-devtools/m4/m4/0001-test-getopt-posix-fix.patch
 delete mode 100644 meta/recipes-devtools/m4/m4/m4-1.4.18-glibc-change-work-around.patch
 rename meta/recipes-devtools/m4/{m4_1.4.18.bb => m4_1.4.19.bb} (100%)

diff --git a/meta/recipes-devtools/m4/m4-1.4.18.inc b/meta/recipes-devtools/m4/m4-1.4.19.inc
similarity index 79%
rename from meta/recipes-devtools/m4/m4-1.4.18.inc
rename to meta/recipes-devtools/m4/m4-1.4.19.inc
index 6475b02f8b..c28e301d50 100644
--- a/meta/recipes-devtools/m4/m4-1.4.18.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
@@ -4,25 +4,21 @@ DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro process
 compatible although it has some extensions (for example, handling more than 9 positional parameters to macros). \
 GNU M4 also has built-in functions for including files, running shell commands, doing arithmetic, etc."
 
-inherit autotools texinfo ptest
+inherit autotools texinfo ptest gettext
 
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
            file://ac_config_links.patch \
-           file://m4-1.4.18-glibc-change-work-around.patch \
-           file://0001-c-stack-stop-using-SIGSTKSZ.patch \
            "
-SRC_URI_append_class-target = " file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
-                                file://run-ptest \
+SRC_URI_append_class-target = " file://run-ptest \
                                 file://serial-tests-config.patch \
-                                file://0001-test-getopt-posix-fix.patch \
                               "
 
-SRC_URI[md5sum] = "a077779db287adf4e12a035029002d28"
-SRC_URI[sha256sum] = "ab2633921a5cd38e48797bf5521ad259bdc4b979078034a3b790d7fec5493fab"
+SRC_URI[md5sum] = "f4a2b0284d80353b995f8ef2385ed73c"
+SRC_URI[sha256sum] = "3be4a26d825ffdfda52a56fc43246456989a3630093cced3fbddf4771ee58a70"
 
 LICENSE = "GPLv3"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464\
 	            file://examples/COPYING;md5=4031593b2166d6c47cae282d944a7ede"
 
 # Fix "Argument list too long" error when len(TMPDIR) = 410
diff --git a/meta/recipes-devtools/m4/m4-native_1.4.18.bb b/meta/recipes-devtools/m4/m4-native_1.4.19.bb
similarity index 100%
rename from meta/recipes-devtools/m4/m4-native_1.4.18.bb
rename to meta/recipes-devtools/m4/m4-native_1.4.19.bb
diff --git a/meta/recipes-devtools/m4/m4/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-devtools/m4/m4/0001-Unset-need_charset_alias-when-building-for-musl.patch
deleted file mode 100644
index ba1a4bab4c..0000000000
--- a/meta/recipes-devtools/m4/m4/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 17:02:13 -0700
-Subject: [PATCH] Unset need_charset_alias when building for musl
-
-localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
-which actually shoudl be fixed in gnulib and then all downstream
-projects will get it eventually. For now we apply the fix to
-coreutils
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/gnulib.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/gnulib.mk b/lib/gnulib.mk
-index e1d74db..c0e92dd 100644
---- a/lib/gnulib.mk
-+++ b/lib/gnulib.mk
-@@ -1882,7 +1882,7 @@ install-exec-localcharset: all-local
- 	  case '$(host_os)' in \
- 	    darwin[56]*) \
- 	      need_charset_alias=true ;; \
--	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
-+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
- 	      need_charset_alias=false ;; \
- 	    *) \
- 	      need_charset_alias=true ;; \
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/m4/m4/0001-c-stack-stop-using-SIGSTKSZ.patch b/meta/recipes-devtools/m4/m4/0001-c-stack-stop-using-SIGSTKSZ.patch
deleted file mode 100644
index 883b8a2075..0000000000
--- a/meta/recipes-devtools/m4/m4/0001-c-stack-stop-using-SIGSTKSZ.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 69238f15129f35eb4756ad8e2004e0d7907cb175 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 30 Apr 2021 17:40:36 -0700
-Subject: [PATCH] c-stack: stop using SIGSTKSZ
-
-This patch is required with glibc 2.34+
-based on gnulib [1]
-
-[1] https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=f9e2b20a12a230efa30f1d479563ae07d276a94b
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/c-stack.c | 22 +++++++++++++---------
- 1 file changed, 13 insertions(+), 9 deletions(-)
-
-diff --git a/lib/c-stack.c b/lib/c-stack.c
-index 5353c08..863f764 100644
---- a/lib/c-stack.c
-+++ b/lib/c-stack.c
-@@ -51,13 +51,14 @@
- typedef struct sigaltstack stack_t;
- #endif
- #ifndef SIGSTKSZ
--# define SIGSTKSZ 16384
--#elif HAVE_LIBSIGSEGV && SIGSTKSZ < 16384
-+#define get_sigstksz()  (16384)
-+#elif HAVE_LIBSIGSEGV
- /* libsigsegv 2.6 through 2.8 have a bug where some architectures use
-    more than the Linux default of an 8k alternate stack when deciding
-    if a fault was caused by stack overflow.  */
--# undef SIGSTKSZ
--# define SIGSTKSZ 16384
-+#define get_sigstksz() ((SIGSTKSZ) < 16384 ? 16384 : (SIGSTKSZ))
-+#else
-+#define get_sigstksz() ((SIGSTKSZ))
- #endif
- 
- #include <stdlib.h>
-@@ -131,7 +132,8 @@ die (int signo)
- /* Storage for the alternate signal stack.  */
- static union
- {
--  char buffer[SIGSTKSZ];
-+  /* allocate buffer with size from get_sigstksz() */
-+  char *buffer;
- 
-   /* These other members are for proper alignment.  There's no
-      standard way to guarantee stack alignment, but this seems enough
-@@ -203,10 +205,11 @@ c_stack_action (void (*action) (int))
-   program_error_message = _("program error");
-   stack_overflow_message = _("stack overflow");
- 
-+  alternate_signal_stack.buffer = malloc(get_sigstksz());
-   /* Always install the overflow handler.  */
-   if (stackoverflow_install_handler (overflow_handler,
-                                      alternate_signal_stack.buffer,
--                                     sizeof alternate_signal_stack.buffer))
-+                                     get_sigstksz()))
-     {
-       errno = ENOTSUP;
-       return -1;
-@@ -279,14 +282,15 @@ c_stack_action (void (*action) (int))
-   stack_t st;
-   struct sigaction act;
-   st.ss_flags = 0;
-+  alternate_signal_stack.buffer = malloc(get_sigstksz());
- # if SIGALTSTACK_SS_REVERSED
-   /* Irix mistakenly treats ss_sp as the upper bound, rather than
-      lower bound, of the alternate stack.  */
--  st.ss_sp = alternate_signal_stack.buffer + SIGSTKSZ - sizeof (void *);
--  st.ss_size = sizeof alternate_signal_stack.buffer - sizeof (void *);
-+  st.ss_sp = alternate_signal_stack.buffer + get_sigstksz() - sizeof (void *);
-+  st.ss_size = get_sigstksz() - sizeof (void *);
- # else
-   st.ss_sp = alternate_signal_stack.buffer;
--  st.ss_size = sizeof alternate_signal_stack.buffer;
-+  st.ss_size = get_sigstksz();
- # endif
-   r = sigaltstack (&st, NULL);
-   if (r != 0)
--- 
-2.31.1
-
diff --git a/meta/recipes-devtools/m4/m4/0001-test-getopt-posix-fix.patch b/meta/recipes-devtools/m4/m4/0001-test-getopt-posix-fix.patch
deleted file mode 100644
index 11508ee0e2..0000000000
--- a/meta/recipes-devtools/m4/m4/0001-test-getopt-posix-fix.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 75bea7c72a919859674f493548653de88f96c798 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 22 Apr 2019 10:36:13 +0800
-Subject: [PATCH] test-getopt-posix fix
-
-fix below problem:
-test-getopt.h:754: assertion 'strcmp (argv[1], "donald") == 0' failed
-
-get this patch from  
-https://github.com/habitat-sh/core-plans/blob/master/m4/fix-test-getopt-posix-with-glibc-2.26.patch
-
-Upstream-Status: Pending
-
-have report this bug to m4-discuss@gnu.org
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- tests/test-getopt-posix.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/tests/test-getopt-posix.c b/tests/test-getopt-posix.c
-index 5532271..2a3d511 100644
---- a/tests/test-getopt-posix.c
-+++ b/tests/test-getopt-posix.c
-@@ -22,6 +22,13 @@
-    ftell link warning if we are not using the gnulib ftell module.  */
- #define _GL_NO_LARGE_FILES
- 
-+/*
-+ * Glibc 2.26 does hard include bits/getopt_posix.h which causes the system
-+ * to use glibc's getopt but the tests expect gnulib behavior. Until a better
-+ * fix is available this avoids that mis-resolution.
-+ */
-+#include <getopt.h>
-+
- /* POSIX and glibc provide the getopt() function in <unistd.h>, see
-    http://pubs.opengroup.org/onlinepubs/9699919799/functions/getopt.html
-    https://www.gnu.org/software/libc/manual/html_node/Using-Getopt.html
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/m4/m4/ac_config_links.patch b/meta/recipes-devtools/m4/m4/ac_config_links.patch
index 71edf59512..39fcd91896 100644
--- a/meta/recipes-devtools/m4/m4/ac_config_links.patch
+++ b/meta/recipes-devtools/m4/m4/ac_config_links.patch
@@ -12,20 +12,26 @@ source, and what we want is to is to not touch it.
 
 Tested on x86_64_linux (Ubuntu 8.04 and 9.10).
 
-2009-11-10	Esben Haabendal	    <eha@doredevelopment.dk>
+2009-11-10      Esben Haabendal     <eha@doredevelopment.dk>
+---
+ configure | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: m4-1.4.18/configure
-===================================================================
---- m4-1.4.18.orig/configure
-+++ m4-1.4.18/configure
-@@ -24415,8 +24415,8 @@ $as_echo "#define GNULIB_TEST_GETTIMEOFD
+diff --git a/configure b/configure
+index 883336a..6343a34 100755
+--- a/configure
++++ b/configure
+@@ -37061,8 +37061,8 @@ printf "%s\n" "#define GNULIB_TEST_GETRANDOM 1" >>confdefs.h
    # only, it does not matter if we skip the link with older autoconf.
    # Automake 1.10.1 and earlier try to remove GNUmakefile in non-VPATH
    # builds, so use a shell variable to bypass this.
 -  GNUmakefile=GNUmakefile
 -  ac_config_links="$ac_config_links $GNUmakefile:$GNUmakefile"
-+ # GNUmakefile=GNUmakefile
-+ # ac_config_links="$ac_config_links $GNUmakefile:$GNUmakefile"
++#  GNUmakefile=GNUmakefile
++#  ac_config_links="$ac_config_links $GNUmakefile:$GNUmakefile"
  
  
-   :
+   LIB_HARD_LOCALE="$LIB_SETLOCALE_NULL"
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/m4/m4/m4-1.4.18-glibc-change-work-around.patch b/meta/recipes-devtools/m4/m4/m4-1.4.18-glibc-change-work-around.patch
deleted file mode 100644
index c10bcbf693..0000000000
--- a/meta/recipes-devtools/m4/m4/m4-1.4.18-glibc-change-work-around.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-update for glibc libio.h removal in 2.28+
-
-see
-https://src.fedoraproject.org/rpms/m4/c/814d592134fad36df757f9a61422d164ea2c6c9b?branch=master
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=4af4a4a718]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: m4-1.4.18/lib/fflush.c
-===================================================================
---- m4-1.4.18.orig/lib/fflush.c
-+++ m4-1.4.18/lib/fflush.c
-@@ -33,7 +33,7 @@
- #undef fflush
- 
- 
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
- 
- /* Clear the stream's ungetc buffer, preserving the value of ftello (fp).  */
- static void
-@@ -72,7 +72,7 @@ clear_ungetc_buffer (FILE *fp)
- 
- #endif
- 
--#if ! (defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
-+#if ! (defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
- 
- # if (defined __sferror || defined __DragonFly__ || defined __ANDROID__) && defined __SNPT
- /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Android */
-@@ -148,7 +148,7 @@ rpl_fflush (FILE *stream)
-   if (stream == NULL || ! freading (stream))
-     return fflush (stream);
- 
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
- 
-   clear_ungetc_buffer_preserving_position (stream);
- 
-Index: m4-1.4.18/lib/fpending.c
-===================================================================
---- m4-1.4.18.orig/lib/fpending.c
-+++ m4-1.4.18/lib/fpending.c
-@@ -32,7 +32,7 @@ __fpending (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   return fp->_IO_write_ptr - fp->_IO_write_base;
- #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
-   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Android */
-Index: m4-1.4.18/lib/fpurge.c
-===================================================================
---- m4-1.4.18.orig/lib/fpurge.c
-+++ m4-1.4.18/lib/fpurge.c
-@@ -62,7 +62,7 @@ fpurge (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   fp->_IO_read_end = fp->_IO_read_ptr;
-   fp->_IO_write_ptr = fp->_IO_write_base;
-   /* Avoid memory leak when there is an active ungetc buffer.  */
-Index: m4-1.4.18/lib/freadahead.c
-===================================================================
---- m4-1.4.18.orig/lib/freadahead.c
-+++ m4-1.4.18/lib/freadahead.c
-@@ -25,7 +25,7 @@
- size_t
- freadahead (FILE *fp)
- {
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   if (fp->_IO_write_ptr > fp->_IO_write_base)
-     return 0;
-   return (fp->_IO_read_end - fp->_IO_read_ptr)
-Index: m4-1.4.18/lib/freading.c
-===================================================================
---- m4-1.4.18.orig/lib/freading.c
-+++ m4-1.4.18/lib/freading.c
-@@ -31,7 +31,7 @@ freading (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   return ((fp->_flags & _IO_NO_WRITES) != 0
-           || ((fp->_flags & (_IO_NO_READS | _IO_CURRENTLY_PUTTING)) == 0
-               && fp->_IO_read_base != NULL));
-Index: m4-1.4.18/lib/fseeko.c
-===================================================================
---- m4-1.4.18.orig/lib/fseeko.c
-+++ m4-1.4.18/lib/fseeko.c
-@@ -47,7 +47,7 @@ fseeko (FILE *fp, off_t offset, int when
- #endif
- 
-   /* These tests are based on fpurge.c.  */
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   if (fp->_IO_read_end == fp->_IO_read_ptr
-       && fp->_IO_write_ptr == fp->_IO_write_base
-       && fp->_IO_save_base == NULL)
-@@ -123,7 +123,7 @@ fseeko (FILE *fp, off_t offset, int when
-           return -1;
-         }
- 
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-       fp->_flags &= ~_IO_EOF_SEEN;
-       fp->_offset = pos;
- #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
-Index: m4-1.4.18/lib/stdio-impl.h
-===================================================================
---- m4-1.4.18.orig/lib/stdio-impl.h
-+++ m4-1.4.18/lib/stdio-impl.h
-@@ -18,6 +18,12 @@
-    the same implementation of stdio extension API, except that some fields
-    have different naming conventions, or their access requires some casts.  */
- 
-+/* Glibc 2.28 made _IO_IN_BACKUP private.  For now, work around this
-+   problem by defining it ourselves.  FIXME: Do not rely on glibc
-+   internals.  */
-+#if !defined _IO_IN_BACKUP && defined _IO_EOF_SEEN
-+# define _IO_IN_BACKUP 0x100
-+#endif
- 
- /* BSD stdio derived implementations.  */
- 
diff --git a/meta/recipes-devtools/m4/m4_1.4.18.bb b/meta/recipes-devtools/m4/m4_1.4.19.bb
similarity index 100%
rename from meta/recipes-devtools/m4/m4_1.4.18.bb
rename to meta/recipes-devtools/m4/m4_1.4.19.bb
-- 
2.31.1

