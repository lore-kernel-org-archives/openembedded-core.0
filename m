Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QcCLH-0001cY-UU
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 10:11:21 +0200
Received: by iym10 with SMTP id 10so1896735iym.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 01:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=9OeRJKiplPv3ZU0++Ai0HzzpC5kOuSO2Bj1SIiG2je0=;
	b=OTIwq/GUREmnoH7rGCFSOxqwYzStdFEUt5jhdLO4vuTncZ6r+XoflOi9SS46mmXYUK
	iq02+nNH+Cuc0jnCTo9R0F1VjfpbRCoUAkdYVimVim8cjCz7SPUWGcZwQoxiU/6MuZ+z
	VOr7Wsnv1QJS8y4OW+ZWkwcbSg1W3oEL1zn5M=
Received: by 10.42.161.130 with SMTP id t2mr1832028icx.5.1309421253331;
	Thu, 30 Jun 2011 01:07:33 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id s2sm1093925ibe.1.2011.06.30.01.07.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 01:07:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 01:07:14 -0700
Message-Id: <a8f79491c6ba25ab2e402410606839c62187a9ba.1309420894.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <681f30f772cb90b5ee4544f907013b7848e9e3fb.1309420894.git.raj.khem@gmail.com>
References: <681f30f772cb90b5ee4544f907013b7848e9e3fb.1309420894.git.raj.khem@gmail.com>
In-Reply-To: <cover.1309420894.git.raj.khem@gmail.com>
References: <cover.1309420894.git.raj.khem@gmail.com>
Subject: [PATCH 5/6] uclibc: Add UCLIBC_HAS_FLOATS=y to uClibc.distro
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2011 08:11:23 -0000

Remove unused uClibc.distro from topdir. It just creates
confusion

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uClibc.distro            |  157 ---------------------
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro |    1 +
 2 files changed, 1 insertions(+), 157 deletions(-)
 delete mode 100644 meta/recipes-core/uclibc/uClibc.distro

diff --git a/meta/recipes-core/uclibc/uClibc.distro b/meta/recipes-core/uclibc/uClibc.distro
deleted file mode 100644
index e25324d..0000000
--- a/meta/recipes-core/uclibc/uClibc.distro
+++ /dev/null
@@ -1,157 +0,0 @@
-#
-# General Library Settings
-#
-# HAVE_NO_PIC is not set
-# DOPIC is not set
-# HAVE_NO_SHARED is not set
-# ARCH_HAS_NO_LDSO is not set
-HAVE_SHARED=y
-# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
-LDSO_LDD_SUPPORT=y
-LDSO_CACHE_SUPPORT=y
-# LDSO_PRELOAD_FILE_SUPPORT is not set
-LDSO_BASE_FILENAME="ld.so"
-# UCLIBC_STATIC_LDCONFIG is not set
-LDSO_RUNPATH=y
-UCLIBC_CTOR_DTOR=y
-LDSO_GNU_HASH_SUPPORT=y
-# HAS_NO_THREADS is not set
-UCLIBC_HAS_THREADS=y
-UCLIBC_HAS_THREADS_NATIVE=y
-PTHREADS_DEBUG_SUPPORT=y
-# LINUXTHREADS_OLD is not set
-UCLIBC_HAS_LFS=y
-# MALLOC is not set
-# MALLOC_SIMPLE is not set
-MALLOC_STANDARD=y
-MALLOC_GLIBC_COMPAT=y
-UCLIBC_DYNAMIC_ATEXIT=y
-COMPAT_ATEXIT=y
-UCLIBC_SUSV3_LEGACY=y
-UCLIBC_SUSV3_LEGACY_MACROS=y
-UCLIBC_SUSV4_LEGACY=y
-UCLIBC_HAS_SHADOW=y
-UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
-UCLIBC_HAS___PROGNAME=y
-UNIX98PTY_ONLY=y
-ASSUME_DEVPTS=y
-UCLIBC_HAS_LIBUTIL=y
-UCLIBC_HAS_TM_EXTENSIONS=y
-UCLIBC_HAS_TZ_CACHING=y
-UCLIBC_HAS_TZ_FILE=y
-UCLIBC_HAS_TZ_FILE_READ_MANY=y
-UCLIBC_TZ_FILE_PATH="/etc/TZ"
-
-#
-# Advanced Library Settings
-#
-UCLIBC_PWD_BUFFER_SIZE=256
-UCLIBC_GRP_BUFFER_SIZE=256
-
-#
-# Networking Support
-#
-UCLIBC_HAS_IPV6=y
-UCLIBC_HAS_RPC=y
-UCLIBC_HAS_FULL_RPC=y
-# UCLIBC_HAS_REENTRANT_RPC is not set
-UCLIBC_USE_NETLINK=y
-UCLIBC_SUPPORT_AI_ADDRCONFIG=y
-
-UCLIBC_HAS_BSD_RES_CLOSE=y
-UCLIBC_HAS_LIBRESOLV_STUB=y
-UCLIBC_HAS_LIBNSL_STUB=y
-
-#
-# String and Stdio Support
-#
-UCLIBC_HAS_STRING_GENERIC_OPT=y
-UCLIBC_HAS_STRING_ARCH_OPT=y
-UCLIBC_HAS_CTYPE_TABLES=y
-UCLIBC_HAS_CTYPE_SIGNED=y
-# UCLIBC_HAS_CTYPE_UNSAFE is not set
-UCLIBC_HAS_CTYPE_CHECKED=y
-# UCLIBC_HAS_CTYPE_ENFORCED is not set
-UCLIBC_HAS_WCHAR=y
-# UCLIBC_HAS_LOCALE is not set
-UCLIBC_HAS_HEXADECIMAL_FLOATS=y
-UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
-UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
-UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
-# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
-UCLIBC_HAS_STDIO_BUFSIZ_256=y
-# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_4096 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
-UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
-# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
-# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
-# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
-UCLIBC_HAS_STDIO_GETC_MACRO=y
-UCLIBC_HAS_STDIO_PUTC_MACRO=y
-UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
-# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
-UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
-UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
-UCLIBC_HAS_PRINTF_M_SPEC=y
-UCLIBC_HAS_ERRNO_MESSAGES=y
-# UCLIBC_HAS_SYS_ERRLIST is not set
-UCLIBC_HAS_SIGNUM_MESSAGES=y
-# UCLIBC_HAS_SYS_SIGLIST is not set
-UCLIBC_HAS_GNU_GETOPT=y
-UCLIBC_HAS_GNU_GETSUBOPT=y
-
-#
-# Big and Tall
-#
-UCLIBC_HAS_REGEX=y
-# UCLIBC_HAS_REGEX_OLD is not set
-UCLIBC_HAS_FNMATCH=y
-# UCLIBC_HAS_FNMATCH_OLD is not set
-UCLIBC_HAS_WORDEXP=y
-UCLIBC_HAS_NFTW=y
-UCLIBC_HAS_FTW=y
-UCLIBC_HAS_FTS=y
-UCLIBC_HAS_GLOB=y
-UCLIBC_HAS_GNU_GLOB=y
-
-#
-# Library Installation Options
-#
-SHARED_LIB_LOADER_PREFIX="/lib"
-RUNTIME_PREFIX="/"
-DEVEL_PREFIX="//usr"
-
-#
-# Security options
-#
-# UCLIBC_BUILD_PIE is not set
-# UCLIBC_HAS_ARC4RANDOM is not set
-# HAVE_NO_SSP is not set
-# UCLIBC_HAS_SSP is not set
-UCLIBC_BUILD_RELRO=y
-UCLIBC_BUILD_NOW=y
-UCLIBC_BUILD_NOEXECSTACK=y
-
-#
-# uClibc development/debugging options
-#
-CROSS_COMPILER_PREFIX=""
-UCLIBC_EXTRA_CFLAGS=""
-# DODEBUG is not set
-# DODEBUG_PT is not set
-# DOSTRIP is not set
-# DOASSERTS is not set
-# SUPPORT_LD_DEBUG is not set
-# SUPPORT_LD_DEBUG_EARLY is not set
-# UCLIBC_MALLOC_DEBUGGING is not set
-WARNINGS="-Wall"
-# EXTRA_WARNINGS is not set
-# DOMULTI is not set
-# UCLIBC_MJN3_ONLY is not set
-
-# math stuff for perl
-DO_C99_MATH=y
-UCLIBC_HAS_LONG_DOUBLE_MATH=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
index 45b131d..3136e54 100644
--- a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
+++ b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
@@ -170,3 +170,4 @@ UCLIBC_HAS_GNU_ERROR=y
 UCLIBC_HAS_PTY=y
 UCLIBC_BSD_SPECIFIC=y
 UCLIBC_HAS_EPOLL=y
+UCLIBC_HAS_FLOATS=y
-- 
1.7.4.1



