Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6E7487CFEE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2019 18:40:56 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 6so5004133pgk.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Dec 2019 10:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v+lBAwESPiMQ1p/6VB41sFpZReNe5pM6yylW2J/0oFA=;
	b=npRE7HkcXwhH6wdBI0lkFiYCQThGq2XLhZoz9ZACk5Qw+FvLMs+/GipZ2X3VouGRwJ
	skz8dJ9AfQro3hNka6c9ckg2C0FtqlTG6Uej3L3Cy/91WCbUKYumHtXFNulKSZzAm/Bi
	jBkQPSSddq0s6BTJdYG18hoiq0HDHXFAPnk3Ax6an8vebyr3rM0mLeleyoFQClSjCGvB
	84X5EPqBtWCQgnx+qZcrAV7RwJ0aormjTFQvekZhPank3LWUtu90LPgKgYggtFB0w8kF
	CmSlgkXKlRT8ZQ3x/NsDEmkzZclAsu/avv8bQVwljgXUSSJ9xvDVJQYTAT3pL77djew0
	BcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v+lBAwESPiMQ1p/6VB41sFpZReNe5pM6yylW2J/0oFA=;
	b=V6rQbP0JT1Oxa0XCM3BcQs2AnIih+rdJFJfAvCgyQGjGRnHw4fmqy+YKglfL/gA/lw
	3UWZW5mArHUVEYaq58frMsx6HQbLZO6wjZJtCPGex6cAuRrWlxJzpUN0MwDvT9CW/4xl
	zVxTMHNsyAK4N2nGNz9LMN05yUNSZ8DBRndN7KyVKBsd3QL+xLBM/DJkBWP0Vx/HvLQE
	HKOI3fhTna4YKRvEWpoghMYpy3wUeEqIL90D7Xyn81uWFv8bDeuj1F+7b+R2F4Z5nJ9n
	RwMN2xGDtQF9dLtJdZ2Y+C0UKum8vHr5vVbGsPIH6SVXkcHdWnNLrHJEZrJZMe7LHm1z
	Voeg==
X-Gm-Message-State: APjAAAVJ9j8j37zL1GnD+N0ebm2lHw2iVndtwhuFmBFHq8w1R1ZssoIT
	Oibzrl70b5FshELRNH9llJhk71/u4ZY=
X-Google-Smtp-Source: APXvYqzZ5xXk8ryFTFu5K+N40BhMTHMHBKZyoahs/960VH5YCIb9yWGYVtJGJ+fMukJuMoynYLLofw==
X-Received: by 2002:a63:4641:: with SMTP id v1mr10145609pgk.389.1575744055519; 
	Sat, 07 Dec 2019 10:40:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id
	b73sm22129519pfb.72.2019.12.07.10.40.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Dec 2019 10:40:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Dec 2019 10:40:41 -0800
Message-Id: <20191207184042.3826637-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH 1/2] cross-localedef: Re-arrange patches
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
X-List-Received-Date: Sat, 07 Dec 2019 18:40:56 -0000
Content-Transfer-Encoding: 8bit

Patches are currently, crossing across repo boundaries, between glibc
and localedef, therefore it is better to divide the patches
accordiningly, with this patchset makery patch is spun out since that
applies to localedef alone.

There are no other code changes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jason Wessel <jason.wessel@windriver.com>
---
 .../glibc/cross-localedef-native_2.30.bb      |    5 +-
 ...d-hardlink-resolver-from-util-linux.patch} | 1697 +++++++++--------
 ...hardlink-fix-ups-to-make-it-compile.patch} |   50 +-
 .../0031-Add-hardlink-resolver-to-build.patch |   55 +
 4 files changed, 945 insertions(+), 862 deletions(-)
 rename meta/recipes-core/glibc/glibc/{add-cross-localedef-hardlink.patch => 0029-Add-hardlink-resolver-from-util-linux.patch} (92%)
 rename meta/recipes-core/glibc/glibc/{allow-compile-separate-from-util-linux-hardlink.patch => 0030-hardlink-fix-ups-to-make-it-compile.patch} (85%)
 create mode 100644 meta/recipes-core/glibc/glibc/0031-Add-hardlink-resolver-to-build.patch

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.30.bb b/meta/recipes-core/glibc/cross-localedef-native_2.30.bb
index 29cd43e89a..99c3d30397 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.30.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.30.bb
@@ -30,8 +30,9 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
-           file://add-cross-localedef-hardlink.patch \
-           file://allow-compile-separate-from-util-linux-hardlink.patch \
+           file://0029-Add-hardlink-resolver-from-util-linux.patch \
+           file://0030-hardlink-fix-ups-to-make-it-compile.patch \
+           file://0031-Add-hardlink-resolver-to-build.patch \
 "
 # Makes for a rather long rev (22 characters), but...
 #
diff --git a/meta/recipes-core/glibc/glibc/add-cross-localedef-hardlink.patch b/meta/recipes-core/glibc/glibc/0029-Add-hardlink-resolver-from-util-linux.patch
similarity index 92%
rename from meta/recipes-core/glibc/glibc/add-cross-localedef-hardlink.patch
rename to meta/recipes-core/glibc/glibc/0029-Add-hardlink-resolver-from-util-linux.patch
index 8471121949..b7fb0321c4 100644
--- a/meta/recipes-core/glibc/glibc/add-cross-localedef-hardlink.patch
+++ b/meta/recipes-core/glibc/glibc/0029-Add-hardlink-resolver-from-util-linux.patch
@@ -1,986 +1,1001 @@
+From 9e5e5297d9a5ef66b3920313356bf7f25955dff3 Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Sat, 7 Dec 2019 09:59:22 -0800
+Subject: [PATCH] Add hardlink resolver from util-linux
+
+The hard link resolver that is built into localedef cannot be run in
+parallel.  It will search sibling directories (which are be processed
+in parallel) and perform a creation of a .tmp file and remove the
+original and move the .tmp file in.  The problem is that if a probe
+occurs a hard link can be requested to the file that is being removed.
+This will lead to a stray copy or potentially, on a loaded system
+cause race condition which pseudo cannot deal with, where it is left
+with a hard link request to a file that no longer exists.  In this
+situation psuedo will inherit the permissions of what ever the target
+inode had to offer.
+
+In short, there are two problems:
+
+1) You will be left with stray copies when using the hard link
+resolution that is built in while running in parallel with
+localedef.
+
+2) When running under pseudo the possibility exists for uid/gid
+leakage when the source file is removed before the hard link can
+be completed.
+
+The solution is to call localedef with --no-hard-links and separately
+process the hardlinks at a later point.  To do this requires the
+inclusion of the hardlink utility found in modern versions of
+util-linux.  Most host systems do not have this, so it will be
+included with the cross-localedef binary.
+
+[YOCTO #11299]
+[YOCTO #12434]
+
+Upstream-Status: Pending
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- locale/programs/c.h                        |  407 ++++++++++++++++++++++
- locale/programs/cross-localedef-hardlink.c |  528 +++++++++++++++++++++++++++++
- locale/programs/xalloc.h                   |  129 +++++++
- localedef/Makefile.in                      |    8 
- 4 files changed, 1071 insertions(+), 1 deletion(-)
+ locale/programs/c.h                        | 407 ++++++++++++++++
+ locale/programs/cross-localedef-hardlink.c | 528 +++++++++++++++++++++
+ locale/programs/xalloc.h                   | 129 +++++
+ 3 files changed, 1064 insertions(+)
+ create mode 100644 locale/programs/c.h
+ create mode 100644 locale/programs/cross-localedef-hardlink.c
+ create mode 100644 locale/programs/xalloc.h
 
+diff --git a/locale/programs/c.h b/locale/programs/c.h
+new file mode 100644
+index 0000000000..d0a402e90e
 --- /dev/null
-+++ b/locale/programs/cross-localedef-hardlink.c
-@@ -0,0 +1,528 @@
++++ b/locale/programs/c.h
+@@ -0,0 +1,407 @@
 +/*
-+ * hardlink - consolidate duplicate files via hardlinks
-+ *
-+ * Copyright (C) 2018 Red Hat, Inc. All rights reserved.
-+ * Written by Jakub Jelinek <jakub@redhat.com>
-+ *
-+ * Copyright (C) 2019 Karel Zak <kzak@redhat.com>
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 2 of the License, or
-+ * (at your option) any later version.
-+ *
-+ * This program is distributed in the hope that it would be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License along
-+ * with this program; if not, write to the Free Software Foundation, Inc.,
-+ * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
++ * Fundamental C definitions.
 + */
-+#include <sys/types.h>
-+#include <stdlib.h>
-+#include <getopt.h>
++
++#ifndef UTIL_LINUX_C_H
++#define UTIL_LINUX_C_H
++
++#include <limits.h>
++#include <stddef.h>
++#include <stdint.h>
 +#include <stdio.h>
 +#include <unistd.h>
-+#include <sys/stat.h>
-+#include <sys/mman.h>
++#include <stdarg.h>
++#include <stdlib.h>
 +#include <string.h>
-+#include <dirent.h>
-+#include <fcntl.h>
 +#include <errno.h>
-+#ifdef HAVE_PCRE
-+# define PCRE2_CODE_UNIT_WIDTH 8
-+# include <pcre2.h>
-+#endif
-+
-+#include "c.h"
-+#include "xalloc.h"
-+#include "nls.h"
-+#include "closestream.h"
 +
-+#define NHASH   (1<<17)  /* Must be a power of 2! */
-+#define NBUF    64
++#include <assert.h>
 +
-+struct hardlink_file;
++#ifdef HAVE_ERR_H
++# include <err.h>
++#endif
 +
-+struct hardlink_hash {
-+	struct hardlink_hash *next;
-+	struct hardlink_file *chain;
-+	off_t size;
-+	time_t mtime;
-+};
++#ifdef HAVE_SYS_SYSMACROS_H
++# include <sys/sysmacros.h>     /* for major, minor */
++#endif
 +
-+struct hardlink_dir {
-+	struct hardlink_dir *next;
-+	char name[];
-+};
++#ifndef LOGIN_NAME_MAX
++# define LOGIN_NAME_MAX 256
++#endif
 +
-+struct hardlink_file {
-+	struct hardlink_file *next;
-+	ino_t ino;
-+	dev_t dev;
-+	unsigned int cksum;
-+	char name[];
-+};
++#ifndef NAME_MAX
++# define NAME_MAX PATH_MAX
++#endif
 +
-+struct hardlink_dynstr {
-+	char *buf;
-+	size_t alloc;
-+};
++/*
++ * __GNUC_PREREQ is deprecated in favour of __has_attribute() and
++ * __has_feature(). The __has macros are supported by clang and gcc>=5.
++ */
++#ifndef __GNUC_PREREQ
++# if defined __GNUC__ && defined __GNUC_MINOR__
++#  define __GNUC_PREREQ(maj, min) \
++	((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
++# else
++#  define __GNUC_PREREQ(maj, min) 0
++# endif
++#endif
 +
-+struct hardlink_ctl {
-+	struct hardlink_dir *dirs;
-+	struct hardlink_hash *hps[NHASH];
-+	char iobuf1[BUFSIZ];
-+	char iobuf2[BUFSIZ];
-+	/* summary counters */
-+	unsigned long long ndirs;
-+	unsigned long long nobjects;
-+	unsigned long long nregfiles;
-+	unsigned long long ncomp;
-+	unsigned long long nlinks;
-+	unsigned long long nsaved;
-+	/* current device */
-+	dev_t dev;
-+	/* flags */
-+	unsigned int verbose;
-+	unsigned int
-+		no_link:1,
-+		content_only:1,
-+		force:1;
-+};
-+/* ctl is in global scope due use in atexit() */
-+struct hardlink_ctl global_ctl;
++#ifdef __GNUC__
 +
-+__attribute__ ((always_inline))
-+static inline unsigned int hash(off_t size, time_t mtime)
-+{
-+	return (size ^ mtime) & (NHASH - 1);
-+}
++/* &a[0] degrades to a pointer: a different type from an array */
++# define __must_be_array(a) \
++	UL_BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(__typeof__(a), __typeof__(&a[0])))
 +
-+__attribute__ ((always_inline))
-+static inline int stcmp(struct stat *st1, struct stat *st2, int content_scope)
-+{
-+	if (content_scope)
-+		return st1->st_size != st2->st_size;
++# define ignore_result(x) __extension__ ({ \
++	__typeof__(x) __dummy __attribute__((__unused__)) = (x); (void) __dummy; \
++})
 +
-+	return st1->st_mode != st2->st_mode
-+		|| st1->st_uid != st2->st_uid
-+		|| st1->st_gid != st2->st_gid
-+		|| st1->st_size != st2->st_size
-+		|| st1->st_mtime != st2->st_mtime;
-+}
++#else /* !__GNUC__ */
++# define __must_be_array(a)	0
++# define __attribute__(_arg_)
++# define ignore_result(x) ((void) (x))
++#endif /* !__GNUC__ */
 +
-+static void print_summary(void)
-+{
-+	struct hardlink_ctl const *const ctl = &global_ctl;
++/*
++ * It evaluates to 1 if the attribute/feature is supported by the current
++ * compilation targed. Fallback for old compilers.
++ */
++#ifndef __has_attribute
++  #define __has_attribute(x) 0
++#endif
 +
-+	if (!ctl->verbose)
-+		return;
++#ifndef __has_feature
++  #define __has_feature(x) 0
++#endif
 +
-+	if (ctl->verbose > 1 && ctl->nlinks)
-+		fputc('\n', stdout);
++/*
++ * Function attributes
++ */
++#ifndef __ul_alloc_size
++# if (__has_attribute(alloc_size) && __has_attribute(warn_unused_result)) || __GNUC_PREREQ (4, 3)
++#  define __ul_alloc_size(s) __attribute__((alloc_size(s), warn_unused_result))
++# else
++#  define __ul_alloc_size(s)
++# endif
++#endif
 +
-+	printf(_("Directories:   %9lld\n"), ctl->ndirs);
-+	printf(_("Objects:       %9lld\n"), ctl->nobjects);
-+	printf(_("Regular files: %9lld\n"), ctl->nregfiles);
-+	printf(_("Comparisons:   %9lld\n"), ctl->ncomp);
-+	printf(  "%s%9lld\n", (ctl->no_link ?
-+	       _("Would link:    ") :
-+	       _("Linked:        ")), ctl->nlinks);
-+	printf(  "%s %9lld\n", (ctl->no_link ?
-+	       _("Would save:   ") :
-+	       _("Saved:        ")), ctl->nsaved);
-+}
++#ifndef __ul_calloc_size
++# if (__has_attribute(alloc_size) && __has_attribute(warn_unused_result)) || __GNUC_PREREQ (4, 3)
++#  define __ul_calloc_size(n, s) __attribute__((alloc_size(n, s), warn_unused_result))
++# else
++#  define __ul_calloc_size(n, s)
++# endif
++#endif
 +
-+static void __attribute__((__noreturn__)) usage(void)
-+{
-+	fputs(USAGE_HEADER, stdout);
-+	printf(_(" %s [options] directory...\n"), program_invocation_short_name);
++#if __has_attribute(returns_nonnull) || __GNUC_PREREQ (4, 9)
++# define __ul_returns_nonnull __attribute__((returns_nonnull))
++#else
++# define __ul_returns_nonnull
++#endif
 +
-+	fputs(USAGE_SEPARATOR, stdout);
-+	puts(_("Consolidate duplicate files using hardlinks."));
++/*
++ * Force a compilation error if condition is true, but also produce a
++ * result (of value 0 and type size_t), so the expression can be used
++ * e.g. in a structure initializer (or wherever else comma expressions
++ * aren't permitted).
++ */
++#define UL_BUILD_BUG_ON_ZERO(e) __extension__ (sizeof(struct { int:-!!(e); }))
++#define BUILD_BUG_ON_NULL(e) ((void *)sizeof(struct { int:-!!(e); }))
 +
-+	fputs(USAGE_OPTIONS, stdout);
-+	puts(_(" -c, --content          compare only contents, ignore permission, etc."));
-+	puts(_(" -n, --dry-run          don't actually link anything"));
-+	puts(_(" -v, --verbose          print summary after hardlinking"));
-+	puts(_(" -vv                    print every hardlinked file and summary"));
-+	puts(_(" -f, --force            force hardlinking across filesystems"));
-+	puts(_(" -x, --exclude <regex>  exclude files matching pattern"));
++#ifndef ARRAY_SIZE
++# define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
++#endif
 +
-+	fputs(USAGE_SEPARATOR, stdout);
-+	printf(USAGE_HELP_OPTIONS(16)); /* char offset to align option descriptions */
-+	printf(USAGE_MAN_TAIL("hardlink(1)"));
-+	exit(EXIT_SUCCESS);
-+}
++#ifndef PATH_MAX
++# define PATH_MAX 4096
++#endif
 +
-+__attribute__ ((always_inline))
-+static inline size_t add2(size_t a, size_t b)
-+{
-+	size_t sum = a + b;
++#ifndef TRUE
++# define TRUE 1
++#endif
 +
-+	if (sum < a)
-+		errx(EXIT_FAILURE, _("integer overflow"));
-+	return sum;
-+}
++#ifndef FALSE
++# define FALSE 0
++#endif
 +
-+__attribute__ ((always_inline))
-+static inline size_t add3(size_t a, size_t b, size_t c)
++#ifndef min
++# define min(x, y) __extension__ ({		\
++	__typeof__(x) _min1 = (x);		\
++	__typeof__(y) _min2 = (y);		\
++	(void) (&_min1 == &_min2);		\
++	_min1 < _min2 ? _min1 : _min2; })
++#endif
++
++#ifndef max
++# define max(x, y) __extension__ ({		\
++	__typeof__(x) _max1 = (x);		\
++	__typeof__(y) _max2 = (y);		\
++	(void) (&_max1 == &_max2);		\
++	_max1 > _max2 ? _max1 : _max2; })
++#endif
++
++#ifndef cmp_numbers
++# define cmp_numbers(x, y) __extension__ ({	\
++	__typeof__(x) _a = (x);			\
++	__typeof__(y) _b = (y);			\
++	(void) (&_a == &_b);			\
++	_a == _b ? 0 : _a > _b ? 1 : -1; })
++#endif
++
++#ifndef offsetof
++#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
++#endif
++
++/*
++ * container_of - cast a member of a structure out to the containing structure
++ * @ptr:	the pointer to the member.
++ * @type:	the type of the container struct this is embedded in.
++ * @member:	the name of the member within the struct.
++ */
++#ifndef container_of
++#define container_of(ptr, type, member) __extension__ ({	\
++	const __typeof__( ((type *)0)->member ) *__mptr = (ptr); \
++	(type *)( (char *)__mptr - offsetof(type,member) );})
++#endif
++
++#ifndef HAVE_PROGRAM_INVOCATION_SHORT_NAME
++# ifdef HAVE___PROGNAME
++extern char *__progname;
++#  define program_invocation_short_name __progname
++# else
++#  ifdef HAVE_GETEXECNAME
++#   define program_invocation_short_name \
++		prog_inv_sh_nm_from_file(getexecname(), 0)
++#  else
++#   define program_invocation_short_name \
++		prog_inv_sh_nm_from_file(__FILE__, 1)
++#  endif
++static char prog_inv_sh_nm_buf[256];
++static inline char *
++prog_inv_sh_nm_from_file(char *f, char stripext)
 +{
-+	return add2(add2(a, b), c);
++	char *t;
++
++	if ((t = strrchr(f, '/')) != NULL)
++		t++;
++	else
++		t = f;
++
++	strncpy(prog_inv_sh_nm_buf, t, sizeof(prog_inv_sh_nm_buf) - 1);
++	prog_inv_sh_nm_buf[sizeof(prog_inv_sh_nm_buf) - 1] = '\0';
++
++	if (stripext && (t = strrchr(prog_inv_sh_nm_buf, '.')) != NULL)
++		*t = '\0';
++
++	return prog_inv_sh_nm_buf;
 +}
++# endif
++#endif
 +
-+static void growstr(struct hardlink_dynstr *str, size_t newlen)
++
++#ifndef HAVE_ERR_H
++static inline void
++errmsg(char doexit, int excode, char adderr, const char *fmt, ...)
 +{
-+	if (newlen < str->alloc)
-+		return;
-+	str->buf = xrealloc(str->buf, str->alloc = add2(newlen, 1));
++	fprintf(stderr, "%s: ", program_invocation_short_name);
++	if (fmt != NULL) {
++		va_list argp;
++		va_start(argp, fmt);
++		vfprintf(stderr, fmt, argp);
++		va_end(argp);
++		if (adderr)
++			fprintf(stderr, ": ");
++	}
++	if (adderr)
++		fprintf(stderr, "%m");
++	fprintf(stderr, "\n");
++	if (doexit)
++		exit(excode);
 +}
 +
-+static void process_path(struct hardlink_ctl *ctl, const char *name)
-+{
-+	struct stat st, st2, st3;
-+	const size_t namelen = strlen(name);
++#ifndef HAVE_ERR
++# define err(E, FMT...) errmsg(1, E, 1, FMT)
++#endif
 +
-+	ctl->nobjects++;
-+	if (lstat(name, &st))
-+		return;
++#ifndef HAVE_ERRX
++# define errx(E, FMT...) errmsg(1, E, 0, FMT)
++#endif
 +
-+	if (st.st_dev != ctl->dev && !ctl->force) {
-+		if (ctl->dev)
-+			errx(EXIT_FAILURE,
-+			     _("%s is on different filesystem than the rest "
-+			       "(use -f option to override)."), name);
-+		ctl->dev = st.st_dev;
-+	}
-+	if (S_ISDIR(st.st_mode)) {
-+		struct hardlink_dir *dp = xmalloc(add3(sizeof(*dp), namelen, 1));
-+		memcpy(dp->name, name, namelen + 1);
-+		dp->next = ctl->dirs;
-+		ctl->dirs = dp;
++#ifndef HAVE_WARN
++# define warn(FMT...) errmsg(0, 0, 1, FMT)
++#endif
 +
-+	} else if (S_ISREG(st.st_mode)) {
-+		int fd, i;
-+		struct hardlink_file *fp, *fp2;
-+		struct hardlink_hash *hp;
-+		const char *n1, *n2;
-+		unsigned int buf[NBUF];
-+		int cksumsize = sizeof(buf);
-+		unsigned int cksum;
-+		time_t mtime = ctl->content_only ? 0 : st.st_mtime;
-+		unsigned int hsh = hash(st.st_size, mtime);
-+		off_t fsize;
++#ifndef HAVE_WARNX
++# define warnx(FMT...) errmsg(0, 0, 0, FMT)
++#endif
++#endif /* !HAVE_ERR_H */
 +
-+		ctl->nregfiles++;
-+		if (ctl->verbose > 1)
-+			printf("%s\n", name);
 +
-+		fd = open(name, O_RDONLY);
-+		if (fd < 0)
-+			return;
++/* Don't use inline function to avoid '#include "nls.h"' in c.h
++ */
++#define errtryhelp(eval) __extension__ ({ \
++	fprintf(stderr, _("Try '%s --help' for more information.\n"), \
++			program_invocation_short_name); \
++	exit(eval); \
++})
 +
-+		if ((size_t)st.st_size < sizeof(buf)) {
-+			cksumsize = st.st_size;
-+			memset(((char *)buf) + cksumsize, 0,
-+			       (sizeof(buf) - cksumsize) % sizeof(buf[0]));
-+		}
-+		if (read(fd, buf, cksumsize) != cksumsize) {
-+			close(fd);
-+			return;
-+		}
-+		cksumsize = (cksumsize + sizeof(buf[0]) - 1) / sizeof(buf[0]);
-+		for (i = 0, cksum = 0; i < cksumsize; i++) {
-+			if (cksum + buf[i] < cksum)
-+				cksum += buf[i] + 1;
-+			else
-+				cksum += buf[i];
-+		}
-+		for (hp = ctl->hps[hsh]; hp; hp = hp->next) {
-+			if (hp->size == st.st_size && hp->mtime == mtime)
-+				break;
-+		}
-+		if (!hp) {
-+			hp = xmalloc(sizeof(*hp));
-+			hp->size = st.st_size;
-+			hp->mtime = mtime;
-+			hp->chain = NULL;
-+			hp->next = ctl->hps[hsh];
-+			ctl->hps[hsh] = hp;
-+		}
-+		for (fp = hp->chain; fp; fp = fp->next) {
-+			if (fp->cksum == cksum)
-+				break;
-+		}
-+		for (fp2 = fp; fp2 && fp2->cksum == cksum; fp2 = fp2->next) {
-+			if (fp2->ino == st.st_ino && fp2->dev == st.st_dev) {
-+				close(fd);
-+				return;
-+			}
-+		}
-+		for (fp2 = fp; fp2 && fp2->cksum == cksum; fp2 = fp2->next) {
++/* After failed execvp() */
++#define EX_EXEC_FAILED		126	/* Program located, but not usable. */
++#define EX_EXEC_ENOENT		127	/* Could not find program to exec.  */
++#define errexec(name)	err(errno == ENOENT ? EX_EXEC_ENOENT : EX_EXEC_FAILED, \
++			_("failed to execute %s"), name)
 +
-+			if (!lstat(fp2->name, &st2) && S_ISREG(st2.st_mode) &&
-+			    !stcmp(&st, &st2, ctl->content_only) &&
-+			    st2.st_ino != st.st_ino &&
-+			    st2.st_dev == st.st_dev) {
 +
-+				int fd2 = open(fp2->name, O_RDONLY);
-+				if (fd2 < 0)
-+					continue;
++static inline __attribute__((const)) int is_power_of_2(unsigned long num)
++{
++	return (num != 0 && ((num & (num - 1)) == 0));
++}
 +
-+				if (fstat(fd2, &st2) || !S_ISREG(st2.st_mode)
-+				    || st2.st_size == 0) {
-+					close(fd2);
-+					continue;
-+				}
-+				ctl->ncomp++;
-+				lseek(fd, 0, SEEK_SET);
++#ifndef HAVE_LOFF_T
++typedef int64_t loff_t;
++#endif
 +
-+				for (fsize = st.st_size; fsize > 0;
-+				     fsize -= (off_t)sizeof(ctl->iobuf1)) {
-+					ssize_t xsz;
-+					ssize_t rsize = fsize > (ssize_t) sizeof(ctl->iobuf1) ?
-+							(ssize_t) sizeof(ctl->iobuf1) : fsize;
++#if !defined(HAVE_DIRFD) && (!defined(HAVE_DECL_DIRFD) || HAVE_DECL_DIRFD == 0) && defined(HAVE_DIR_DD_FD)
++#include <sys/types.h>
++#include <dirent.h>
++static inline int dirfd(DIR *d)
++{
++	return d->dd_fd;
++}
++#endif
 +
-+					if ((xsz = read(fd, ctl->iobuf1, rsize)) != rsize)
-+						warn(_("cannot read %s"), name);
-+					else if ((xsz = read(fd2, ctl->iobuf2, rsize)) != rsize)
-+						warn(_("cannot read %s"), fp2->name);
++/*
++ * Fallback defines for old versions of glibc
++ */
++#include <fcntl.h>
 +
-+					if (xsz != rsize) {
-+						close(fd);
-+						close(fd2);
-+						return;
-+					}
-+					if (memcmp(ctl->iobuf1, ctl->iobuf2, rsize))
-+						break;
-+				}
-+				close(fd2);
-+				if (fsize > 0)
-+					continue;
-+				if (lstat(name, &st3)) {
-+					warn(_("cannot stat %s"), name);
-+					close(fd);
-+					return;
-+				}
-+				st3.st_atime = st.st_atime;
-+				if (stcmp(&st, &st3, 0)) {
-+					warnx(_("file %s changed underneath us"), name);
-+					close(fd);
-+					return;
-+				}
-+				n1 = fp2->name;
-+				n2 = name;
-+
-+				if (!ctl->no_link) {
-+					const char *suffix =
-+					    ".$$$___cleanit___$$$";
-+					const size_t suffixlen = strlen(suffix);
-+					size_t n2len = strlen(n2);
-+					struct hardlink_dynstr nam2 = { NULL, 0 };
-+
-+					growstr(&nam2, add2(n2len, suffixlen));
-+					memcpy(nam2.buf, n2, n2len);
-+					memcpy(&nam2.buf[n2len], suffix,
-+					       suffixlen + 1);
-+					/* First create a temporary link to n1 under a new name */
-+					if (link(n1, nam2.buf)) {
-+						warn(_("failed to hardlink %s to %s (create temporary link as %s failed)"),
-+							n1, n2, nam2.buf);
-+						free(nam2.buf);
-+						continue;
-+					}
-+					/* Then rename into place over the existing n2 */
-+					if (rename(nam2.buf, n2)) {
-+						warn(_("failed to hardlink %s to %s (rename temporary link to %s failed)"),
-+							n1, n2, n2);
-+						/* Something went wrong, try to remove the now redundant temporary link */
-+						if (unlink(nam2.buf))
-+							warn(_("failed to remove temporary link %s"), nam2.buf);
-+						free(nam2.buf);
-+						continue;
-+					}
-+					free(nam2.buf);
-+				}
-+				ctl->nlinks++;
-+				if (st3.st_nlink > 1) {
-+					/* We actually did not save anything this time, since the link second argument
-+					   had some other links as well.  */
-+					if (ctl->verbose > 1)
-+						printf(_(" %s %s to %s\n"),
-+							(ctl->no_link ? _("Would link") : _("Linked")),
-+							n1, n2);
-+				} else {
-+					ctl->nsaved += ((st.st_size + 4095) / 4096) * 4096;
-+					if (ctl->verbose > 1)
-+						printf(_(" %s %s to %s, %s %jd\n"),
-+							(ctl->no_link ? _("Would link") : _("Linked")),
-+							n1, n2,
-+							(ctl->no_link ? _("would save") : _("saved")),
-+							(intmax_t)st.st_size);
-+				}
-+				close(fd);
-+				return;
-+			}
-+		}
-+		fp2 = xmalloc(add3(sizeof(*fp2), namelen, 1));
-+		close(fd);
-+		fp2->ino = st.st_ino;
-+		fp2->dev = st.st_dev;
-+		fp2->cksum = cksum;
-+		memcpy(fp2->name, name, namelen + 1);
-+
-+		if (fp) {
-+			fp2->next = fp->next;
-+			fp->next = fp2;
-+		} else {
-+			fp2->next = hp->chain;
-+			hp->chain = fp2;
-+		}
-+		return;
-+	}
-+}
-+
-+int main(int argc, char **argv)
-+{
-+	int ch;
-+	int i;
-+#ifdef HAVE_PCRE
-+	int errornumber;
-+	PCRE2_SIZE erroroffset;
-+	pcre2_code *re = NULL;
-+	PCRE2_SPTR exclude_pattern = NULL;
-+	pcre2_match_data *match_data = NULL;
++#ifdef O_CLOEXEC
++#define UL_CLOEXECSTR	"e"
++#else
++#define UL_CLOEXECSTR	""
 +#endif
-+	struct hardlink_dynstr nam1 = { NULL, 0 };
-+	struct hardlink_ctl *ctl = &global_ctl;
 +
-+	static const struct option longopts[] = {
-+		{ "content",    no_argument, NULL, 'c' },
-+		{ "dry-run",    no_argument, NULL, 'n' },
-+		{ "exclude",    required_argument, NULL, 'x' },
-+		{ "force",      no_argument, NULL, 'f' },
-+		{ "help",       no_argument, NULL, 'h' },
-+		{ "verbose",    no_argument, NULL, 'v' },
-+		{ "version",    no_argument, NULL, 'V' },
-+		{ NULL, 0, NULL, 0 },
-+	};
-+
-+	setlocale(LC_ALL, "");
-+	bindtextdomain(PACKAGE, LOCALEDIR);
-+	textdomain(PACKAGE);
-+	close_stdout_atexit();
++#ifndef O_CLOEXEC
++#define O_CLOEXEC 0
++#endif
 +
-+	while ((ch = getopt_long(argc, argv, "cnvfx:Vh", longopts, NULL)) != -1) {
-+		switch (ch) {
-+		case 'n':
-+			ctl->no_link = 1;
-+			break;
-+		case 'v':
-+			ctl->verbose++;
-+			break;
-+		case 'c':
-+			ctl->content_only = 1;
-+			break;
-+		case 'f':
-+			ctl->force = 1;
-+			break;
-+		case 'x':
-+#ifdef HAVE_PCRE
-+			exclude_pattern = (PCRE2_SPTR) optarg;
-+#else
-+			errx(EXIT_FAILURE,
-+			     _("option --exclude not supported (built without pcre2)"));
++#ifdef __FreeBSD_kernel__
++#ifndef F_DUPFD_CLOEXEC
++#define F_DUPFD_CLOEXEC	17	/* Like F_DUPFD, but FD_CLOEXEC is set */
++#endif
 +#endif
-+			break;
-+		case 'V':
-+			print_version(EXIT_SUCCESS);
-+		case 'h':
-+			usage();
-+		default:
-+			errtryhelp(EXIT_FAILURE);
-+		}
-+	}
 +
-+	if (optind == argc) {
-+		warnx(_("no directory specified"));
-+		errtryhelp(EXIT_FAILURE);
-+	}
 +
-+#ifdef HAVE_PCRE
-+	if (exclude_pattern) {
-+		re = pcre2_compile(exclude_pattern, /* the pattern */
-+				   PCRE2_ZERO_TERMINATED, /* indicates pattern is zero-terminate */
-+				   0, /* default options */
-+				   &errornumber, &erroroffset, NULL); /* use default compile context */
-+		if (!re) {
-+			PCRE2_UCHAR buffer[256];
-+			pcre2_get_error_message(errornumber, buffer,
-+						sizeof(buffer));
-+			errx(EXIT_FAILURE, _("pattern error at offset %d: %s"),
-+				(int)erroroffset, buffer);
-+		}
-+		match_data = pcre2_match_data_create_from_pattern(re, NULL);
-+	}
++#ifndef AI_ADDRCONFIG
++#define AI_ADDRCONFIG 0x0020
 +#endif
-+	atexit(print_summary);
-+
-+	for (i = optind; i < argc; i++)
-+		process_path(ctl, argv[i]);
 +
-+	while (ctl->dirs) {
-+		DIR *dh;
-+		struct dirent *di;
-+		struct hardlink_dir *dp = ctl->dirs;
-+		size_t nam1baselen = strlen(dp->name);
++#ifndef IUTF8
++#define IUTF8 0040000
++#endif
 +
-+		ctl->dirs = dp->next;
-+		growstr(&nam1, add2(nam1baselen, 1));
-+		memcpy(nam1.buf, dp->name, nam1baselen);
-+		free(dp);
-+		nam1.buf[nam1baselen++] = '/';
-+		nam1.buf[nam1baselen] = 0;
-+		dh = opendir(nam1.buf);
++/*
++ * MAXHOSTNAMELEN replacement
++ */
++static inline size_t get_hostname_max(void)
++{
++	long len = sysconf(_SC_HOST_NAME_MAX);
 +
-+		if (dh == NULL)
-+			continue;
-+		ctl->ndirs++;
++	if (0 < len)
++		return len;
 +
-+		while ((di = readdir(dh)) != NULL) {
-+			if (!di->d_name[0])
-+				continue;
-+			if (di->d_name[0] == '.') {
-+				if (!di->d_name[1] || !strcmp(di->d_name, ".."))
-+					continue;
-+			}
-+#ifdef HAVE_PCRE
-+			if (re && pcre2_match(re, /* compiled regex */
-+					      (PCRE2_SPTR) di->d_name, strlen(di->d_name), 0, /* start at offset 0 */
-+					      0, /* default options */
-+					      match_data, /* block for storing the result */
-+					      NULL) /* use default match context */
-+			    >=0) {
-+				if (ctl->verbose) {
-+					nam1.buf[nam1baselen] = 0;
-+					printf(_("Skipping %s%s\n"), nam1.buf, di->d_name);
-+				}
-+				continue;
-+			}
++#ifdef MAXHOSTNAMELEN
++	return MAXHOSTNAMELEN;
++#elif HOST_NAME_MAX
++	return HOST_NAME_MAX;
 +#endif
-+			{
-+				size_t subdirlen;
-+				growstr(&nam1,
-+					add2(nam1baselen, subdirlen =
-+					     strlen(di->d_name)));
-+				memcpy(&nam1.buf[nam1baselen], di->d_name,
-+				       add2(subdirlen, 1));
-+			}
-+			process_path(ctl, nam1.buf);
-+		}
-+		closedir(dh);
-+	}
-+
-+	return 0;
++	return 64;
 +}
---- a/localedef/Makefile.in
-+++ b/localedef/Makefile.in
-@@ -40,6 +40,8 @@ WARNFLAGS	= -Wall -Wno-format
- FULLCC		= $(CC) $(CPPFLAGS) $(CFLAGS) \
- 		  $(DEFINES) $(INCLUDES) $(WARNFLAGS)
- 
-+CROSS_LOCALEDEF_HARDLINK_OBJS = cross-localedef-hardlink.o
-+
- LOCALEDEF_OBJS	= charmap.o charmap-dir.o ld-address.o ld-collate.o \
- 		  ld-ctype.o ld-identification.o ld-measurement.o \
- 		  ld-messages.o ld-monetary.o ld-name.o ld-numeric.o \
-@@ -54,11 +56,14 @@ LOCALEDEF_OBJS	= charmap.o charmap-dir.o
- 		  asprintf.o getdelim.o localedef_extra.o \
- 		  obstack_printf.o vasprintf.o
- 
--all:		localedef$(EXEEXT)
-+all:		localedef$(EXEEXT) cross-localedef-hardlink$(EXEEXT)
- 
- localedef$(EXEEXT): $(LOCALEDEF_OBJS)
- 		$(CC) -o $@ $(LOCALEDEF_OBJS) $(LIBS)
- 
-+cross-localedef-hardlink$(EXEEXT): $(CROSS_LOCALEDEF_HARDLINK_OBJS)
-+		$(CC) -o $@ $(CROSS_LOCALEDEF_HARDLINK_OBJS) $(LIBS)
-+
- clean:
- 		rm -f locale$(EXEEXT) $(LOCALEDEF_OBJS)
- 
-@@ -77,6 +82,7 @@ clean:
- %.o: $(srcdir)/%.c
- 		$(FULLCC) -c -o $@ $<
- 
-+cross-localedef-hardlink.o: glibc/locale/programs/cross-localedef-hardlink.c
- charmap.o: glibc/locale/programs/charmap.c
- charmap-dir.o: glibc/locale/programs/charmap-dir.c
- ld-address.o: glibc/locale/programs/ld-address.c
---- /dev/null
-+++ b/locale/programs/c.h
-@@ -0,0 +1,407 @@
++
++
 +/*
-+ * Fundamental C definitions.
++ * Constant strings for usage() functions. For more info see
++ * Documentation/{howto-usage-function.txt,boilerplate.c}
 + */
++#define USAGE_HEADER     ("\nUsage:\n")
++#define USAGE_OPTIONS    ("\nOptions:\n")
++#define USAGE_FUNCTIONS  ("\nFunctions:\n")
++#define USAGE_COMMANDS   ("\nCommands:\n")
++#define USAGE_COLUMNS    ("\nAvailable output columns:\n")
++#define USAGE_SEPARATOR    "\n"
 +
-+#ifndef UTIL_LINUX_C_H
-+#define UTIL_LINUX_C_H
-+
-+#include <limits.h>
-+#include <stddef.h>
-+#include <stdint.h>
-+#include <stdio.h>
-+#include <unistd.h>
-+#include <stdarg.h>
-+#include <stdlib.h>
-+#include <string.h>
-+#include <errno.h>
++#define USAGE_OPTSTR_HELP     ("display this help")
++#define USAGE_OPTSTR_VERSION  ("display version")
 +
-+#include <assert.h>
++#define USAGE_HELP_OPTIONS(marg_dsc) \
++		"%-" #marg_dsc "s%s\n" \
++		"%-" #marg_dsc "s%s\n" \
++		, " -h, --help",    USAGE_OPTSTR_HELP \
++		, " -V, --version", USAGE_OPTSTR_VERSION
 +
-+#ifdef HAVE_ERR_H
-+# include <err.h>
-+#endif
++#define USAGE_MAN_TAIL(_man)   ("\nFor more details see %s.\n"), _man
 +
-+#ifdef HAVE_SYS_SYSMACROS_H
-+# include <sys/sysmacros.h>     /* for major, minor */
-+#endif
++#define UTIL_LINUX_VERSION ("%s from %s\n"), program_invocation_short_name, PACKAGE_STRING
 +
-+#ifndef LOGIN_NAME_MAX
-+# define LOGIN_NAME_MAX 256
-+#endif
++#define print_version(eval) __extension__ ({ \
++		printf(UTIL_LINUX_VERSION); \
++		exit(eval); \
++})
 +
-+#ifndef NAME_MAX
-+# define NAME_MAX PATH_MAX
++/*
++ * scanf modifiers for "strings allocation"
++ */
++#ifdef HAVE_SCANF_MS_MODIFIER
++#define UL_SCNsA	"%ms"
++#elif defined(HAVE_SCANF_AS_MODIFIER)
++#define UL_SCNsA	"%as"
 +#endif
 +
 +/*
-+ * __GNUC_PREREQ is deprecated in favour of __has_attribute() and
-+ * __has_feature(). The __has macros are supported by clang and gcc>=5.
++ * seek stuff
 + */
-+#ifndef __GNUC_PREREQ
-+# if defined __GNUC__ && defined __GNUC_MINOR__
-+#  define __GNUC_PREREQ(maj, min) \
-+	((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
-+# else
-+#  define __GNUC_PREREQ(maj, min) 0
-+# endif
++#ifndef SEEK_DATA
++# define SEEK_DATA	3
++#endif
++#ifndef SEEK_HOLE
++# define SEEK_HOLE	4
 +#endif
 +
-+#ifdef __GNUC__
-+
-+/* &a[0] degrades to a pointer: a different type from an array */
-+# define __must_be_array(a) \
-+	UL_BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(__typeof__(a), __typeof__(&a[0])))
 +
-+# define ignore_result(x) __extension__ ({ \
-+	__typeof__(x) __dummy __attribute__((__unused__)) = (x); (void) __dummy; \
-+})
-+
-+#else /* !__GNUC__ */
-+# define __must_be_array(a)	0
-+# define __attribute__(_arg_)
-+# define ignore_result(x) ((void) (x))
-+#endif /* !__GNUC__ */
++/*
++ * Macros to convert #define'itions to strings, for example
++ * #define XYXXY 42
++ * printf ("%s=%s\n", stringify(XYXXY), stringify_value(XYXXY));
++ */
++#define stringify_value(s) stringify(s)
++#define stringify(s) #s
 +
 +/*
-+ * It evaluates to 1 if the attribute/feature is supported by the current
-+ * compilation targed. Fallback for old compilers.
++ * UL_ASAN_BLACKLIST is a macro to tell AddressSanitizer (a compile-time
++ * instrumentation shipped with Clang and GCC) to not instrument the
++ * annotated function.  Furthermore, it will prevent the compiler from
++ * inlining the function because inlining currently breaks the blacklisting
++ * mechanism of AddressSanitizer.
 + */
-+#ifndef __has_attribute
-+  #define __has_attribute(x) 0
++#if __has_feature(address_sanitizer) && __has_attribute(no_sanitize_memory) && __has_attribute(no_sanitize_address)
++# define UL_ASAN_BLACKLIST __attribute__((noinline)) __attribute__((no_sanitize_memory)) __attribute__((no_sanitize_address))
++#else
++# define UL_ASAN_BLACKLIST	/* nothing */
 +#endif
 +
-+#ifndef __has_feature
-+  #define __has_feature(x) 0
-+#endif
++/*
++ * Note that sysconf(_SC_GETPW_R_SIZE_MAX) returns *initial* suggested size for
++ * pwd buffer and in some cases it is not large enough. See POSIX and
++ * getpwnam_r man page for more details.
++ */
++#define UL_GETPW_BUFSIZ	(16 * 1024)
 +
 +/*
-+ * Function attributes
++ * Darwin or other BSDs may only have MAP_ANON. To get it on Darwin we must
++ * define _DARWIN_C_SOURCE before including sys/mman.h. We do this in config.h.
 + */
-+#ifndef __ul_alloc_size
-+# if (__has_attribute(alloc_size) && __has_attribute(warn_unused_result)) || __GNUC_PREREQ (4, 3)
-+#  define __ul_alloc_size(s) __attribute__((alloc_size(s), warn_unused_result))
-+# else
-+#  define __ul_alloc_size(s)
-+# endif
++#if !defined MAP_ANONYMOUS && defined MAP_ANON
++# define MAP_ANONYMOUS  (MAP_ANON)
 +#endif
 +
-+#ifndef __ul_calloc_size
-+# if (__has_attribute(alloc_size) && __has_attribute(warn_unused_result)) || __GNUC_PREREQ (4, 3)
-+#  define __ul_calloc_size(n, s) __attribute__((alloc_size(n, s), warn_unused_result))
-+# else
-+#  define __ul_calloc_size(n, s)
-+# endif
++#endif /* UTIL_LINUX_C_H */
+diff --git a/locale/programs/cross-localedef-hardlink.c b/locale/programs/cross-localedef-hardlink.c
+new file mode 100644
+index 0000000000..63615896b0
+--- /dev/null
++++ b/locale/programs/cross-localedef-hardlink.c
+@@ -0,0 +1,528 @@
++/*
++ * hardlink - consolidate duplicate files via hardlinks
++ *
++ * Copyright (C) 2018 Red Hat, Inc. All rights reserved.
++ * Written by Jakub Jelinek <jakub@redhat.com>
++ *
++ * Copyright (C) 2019 Karel Zak <kzak@redhat.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it would be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License along
++ * with this program; if not, write to the Free Software Foundation, Inc.,
++ * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
++ */
++#include <sys/types.h>
++#include <stdlib.h>
++#include <getopt.h>
++#include <stdio.h>
++#include <unistd.h>
++#include <sys/stat.h>
++#include <sys/mman.h>
++#include <string.h>
++#include <dirent.h>
++#include <fcntl.h>
++#include <errno.h>
++#ifdef HAVE_PCRE
++# define PCRE2_CODE_UNIT_WIDTH 8
++# include <pcre2.h>
 +#endif
 +
-+#if __has_attribute(returns_nonnull) || __GNUC_PREREQ (4, 9)
-+# define __ul_returns_nonnull __attribute__((returns_nonnull))
-+#else
-+# define __ul_returns_nonnull
-+#endif
++#include "c.h"
++#include "xalloc.h"
++#include "nls.h"
++#include "closestream.h"
 +
-+/*
-+ * Force a compilation error if condition is true, but also produce a
-+ * result (of value 0 and type size_t), so the expression can be used
-+ * e.g. in a structure initializer (or wherever else comma expressions
-+ * aren't permitted).
-+ */
-+#define UL_BUILD_BUG_ON_ZERO(e) __extension__ (sizeof(struct { int:-!!(e); }))
-+#define BUILD_BUG_ON_NULL(e) ((void *)sizeof(struct { int:-!!(e); }))
++#define NHASH   (1<<17)  /* Must be a power of 2! */
++#define NBUF    64
 +
-+#ifndef ARRAY_SIZE
-+# define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
-+#endif
++struct hardlink_file;
 +
-+#ifndef PATH_MAX
-+# define PATH_MAX 4096
-+#endif
++struct hardlink_hash {
++	struct hardlink_hash *next;
++	struct hardlink_file *chain;
++	off_t size;
++	time_t mtime;
++};
 +
-+#ifndef TRUE
-+# define TRUE 1
-+#endif
++struct hardlink_dir {
++	struct hardlink_dir *next;
++	char name[];
++};
 +
-+#ifndef FALSE
-+# define FALSE 0
-+#endif
++struct hardlink_file {
++	struct hardlink_file *next;
++	ino_t ino;
++	dev_t dev;
++	unsigned int cksum;
++	char name[];
++};
 +
-+#ifndef min
-+# define min(x, y) __extension__ ({		\
-+	__typeof__(x) _min1 = (x);		\
-+	__typeof__(y) _min2 = (y);		\
-+	(void) (&_min1 == &_min2);		\
-+	_min1 < _min2 ? _min1 : _min2; })
-+#endif
++struct hardlink_dynstr {
++	char *buf;
++	size_t alloc;
++};
 +
-+#ifndef max
-+# define max(x, y) __extension__ ({		\
-+	__typeof__(x) _max1 = (x);		\
-+	__typeof__(y) _max2 = (y);		\
-+	(void) (&_max1 == &_max2);		\
-+	_max1 > _max2 ? _max1 : _max2; })
-+#endif
++struct hardlink_ctl {
++	struct hardlink_dir *dirs;
++	struct hardlink_hash *hps[NHASH];
++	char iobuf1[BUFSIZ];
++	char iobuf2[BUFSIZ];
++	/* summary counters */
++	unsigned long long ndirs;
++	unsigned long long nobjects;
++	unsigned long long nregfiles;
++	unsigned long long ncomp;
++	unsigned long long nlinks;
++	unsigned long long nsaved;
++	/* current device */
++	dev_t dev;
++	/* flags */
++	unsigned int verbose;
++	unsigned int
++		no_link:1,
++		content_only:1,
++		force:1;
++};
++/* ctl is in global scope due use in atexit() */
++struct hardlink_ctl global_ctl;
 +
-+#ifndef cmp_numbers
-+# define cmp_numbers(x, y) __extension__ ({	\
-+	__typeof__(x) _a = (x);			\
-+	__typeof__(y) _b = (y);			\
-+	(void) (&_a == &_b);			\
-+	_a == _b ? 0 : _a > _b ? 1 : -1; })
-+#endif
++__attribute__ ((always_inline))
++static inline unsigned int hash(off_t size, time_t mtime)
++{
++	return (size ^ mtime) & (NHASH - 1);
++}
 +
-+#ifndef offsetof
-+#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
-+#endif
++__attribute__ ((always_inline))
++static inline int stcmp(struct stat *st1, struct stat *st2, int content_scope)
++{
++	if (content_scope)
++		return st1->st_size != st2->st_size;
 +
-+/*
-+ * container_of - cast a member of a structure out to the containing structure
-+ * @ptr:	the pointer to the member.
-+ * @type:	the type of the container struct this is embedded in.
-+ * @member:	the name of the member within the struct.
-+ */
-+#ifndef container_of
-+#define container_of(ptr, type, member) __extension__ ({	\
-+	const __typeof__( ((type *)0)->member ) *__mptr = (ptr); \
-+	(type *)( (char *)__mptr - offsetof(type,member) );})
-+#endif
++	return st1->st_mode != st2->st_mode
++		|| st1->st_uid != st2->st_uid
++		|| st1->st_gid != st2->st_gid
++		|| st1->st_size != st2->st_size
++		|| st1->st_mtime != st2->st_mtime;
++}
 +
-+#ifndef HAVE_PROGRAM_INVOCATION_SHORT_NAME
-+# ifdef HAVE___PROGNAME
-+extern char *__progname;
-+#  define program_invocation_short_name __progname
-+# else
-+#  ifdef HAVE_GETEXECNAME
-+#   define program_invocation_short_name \
-+		prog_inv_sh_nm_from_file(getexecname(), 0)
-+#  else
-+#   define program_invocation_short_name \
-+		prog_inv_sh_nm_from_file(__FILE__, 1)
-+#  endif
-+static char prog_inv_sh_nm_buf[256];
-+static inline char *
-+prog_inv_sh_nm_from_file(char *f, char stripext)
++static void print_summary(void)
 +{
-+	char *t;
++	struct hardlink_ctl const *const ctl = &global_ctl;
 +
-+	if ((t = strrchr(f, '/')) != NULL)
-+		t++;
-+	else
-+		t = f;
++	if (!ctl->verbose)
++		return;
 +
-+	strncpy(prog_inv_sh_nm_buf, t, sizeof(prog_inv_sh_nm_buf) - 1);
-+	prog_inv_sh_nm_buf[sizeof(prog_inv_sh_nm_buf) - 1] = '\0';
++	if (ctl->verbose > 1 && ctl->nlinks)
++		fputc('\n', stdout);
 +
-+	if (stripext && (t = strrchr(prog_inv_sh_nm_buf, '.')) != NULL)
-+		*t = '\0';
++	printf(_("Directories:   %9lld\n"), ctl->ndirs);
++	printf(_("Objects:       %9lld\n"), ctl->nobjects);
++	printf(_("Regular files: %9lld\n"), ctl->nregfiles);
++	printf(_("Comparisons:   %9lld\n"), ctl->ncomp);
++	printf(  "%s%9lld\n", (ctl->no_link ?
++	       _("Would link:    ") :
++	       _("Linked:        ")), ctl->nlinks);
++	printf(  "%s %9lld\n", (ctl->no_link ?
++	       _("Would save:   ") :
++	       _("Saved:        ")), ctl->nsaved);
++}
++
++static void __attribute__((__noreturn__)) usage(void)
++{
++	fputs(USAGE_HEADER, stdout);
++	printf(_(" %s [options] directory...\n"), program_invocation_short_name);
++
++	fputs(USAGE_SEPARATOR, stdout);
++	puts(_("Consolidate duplicate files using hardlinks."));
++
++	fputs(USAGE_OPTIONS, stdout);
++	puts(_(" -c, --content          compare only contents, ignore permission, etc."));
++	puts(_(" -n, --dry-run          don't actually link anything"));
++	puts(_(" -v, --verbose          print summary after hardlinking"));
++	puts(_(" -vv                    print every hardlinked file and summary"));
++	puts(_(" -f, --force            force hardlinking across filesystems"));
++	puts(_(" -x, --exclude <regex>  exclude files matching pattern"));
 +
-+	return prog_inv_sh_nm_buf;
++	fputs(USAGE_SEPARATOR, stdout);
++	printf(USAGE_HELP_OPTIONS(16)); /* char offset to align option descriptions */
++	printf(USAGE_MAN_TAIL("hardlink(1)"));
++	exit(EXIT_SUCCESS);
 +}
-+# endif
-+#endif
-+
 +
-+#ifndef HAVE_ERR_H
-+static inline void
-+errmsg(char doexit, int excode, char adderr, const char *fmt, ...)
++__attribute__ ((always_inline))
++static inline size_t add2(size_t a, size_t b)
 +{
-+	fprintf(stderr, "%s: ", program_invocation_short_name);
-+	if (fmt != NULL) {
-+		va_list argp;
-+		va_start(argp, fmt);
-+		vfprintf(stderr, fmt, argp);
-+		va_end(argp);
-+		if (adderr)
-+			fprintf(stderr, ": ");
-+	}
-+	if (adderr)
-+		fprintf(stderr, "%m");
-+	fprintf(stderr, "\n");
-+	if (doexit)
-+		exit(excode);
++	size_t sum = a + b;
++
++	if (sum < a)
++		errx(EXIT_FAILURE, _("integer overflow"));
++	return sum;
 +}
 +
-+#ifndef HAVE_ERR
-+# define err(E, FMT...) errmsg(1, E, 1, FMT)
-+#endif
++__attribute__ ((always_inline))
++static inline size_t add3(size_t a, size_t b, size_t c)
++{
++	return add2(add2(a, b), c);
++}
 +
-+#ifndef HAVE_ERRX
-+# define errx(E, FMT...) errmsg(1, E, 0, FMT)
-+#endif
++static void growstr(struct hardlink_dynstr *str, size_t newlen)
++{
++	if (newlen < str->alloc)
++		return;
++	str->buf = xrealloc(str->buf, str->alloc = add2(newlen, 1));
++}
 +
-+#ifndef HAVE_WARN
-+# define warn(FMT...) errmsg(0, 0, 1, FMT)
-+#endif
++static void process_path(struct hardlink_ctl *ctl, const char *name)
++{
++	struct stat st, st2, st3;
++	const size_t namelen = strlen(name);
 +
-+#ifndef HAVE_WARNX
-+# define warnx(FMT...) errmsg(0, 0, 0, FMT)
-+#endif
-+#endif /* !HAVE_ERR_H */
++	ctl->nobjects++;
++	if (lstat(name, &st))
++		return;
 +
++	if (st.st_dev != ctl->dev && !ctl->force) {
++		if (ctl->dev)
++			errx(EXIT_FAILURE,
++			     _("%s is on different filesystem than the rest "
++			       "(use -f option to override)."), name);
++		ctl->dev = st.st_dev;
++	}
++	if (S_ISDIR(st.st_mode)) {
++		struct hardlink_dir *dp = xmalloc(add3(sizeof(*dp), namelen, 1));
++		memcpy(dp->name, name, namelen + 1);
++		dp->next = ctl->dirs;
++		ctl->dirs = dp;
 +
-+/* Don't use inline function to avoid '#include "nls.h"' in c.h
-+ */
-+#define errtryhelp(eval) __extension__ ({ \
-+	fprintf(stderr, _("Try '%s --help' for more information.\n"), \
-+			program_invocation_short_name); \
-+	exit(eval); \
-+})
++	} else if (S_ISREG(st.st_mode)) {
++		int fd, i;
++		struct hardlink_file *fp, *fp2;
++		struct hardlink_hash *hp;
++		const char *n1, *n2;
++		unsigned int buf[NBUF];
++		int cksumsize = sizeof(buf);
++		unsigned int cksum;
++		time_t mtime = ctl->content_only ? 0 : st.st_mtime;
++		unsigned int hsh = hash(st.st_size, mtime);
++		off_t fsize;
 +
-+/* After failed execvp() */
-+#define EX_EXEC_FAILED		126	/* Program located, but not usable. */
-+#define EX_EXEC_ENOENT		127	/* Could not find program to exec.  */
-+#define errexec(name)	err(errno == ENOENT ? EX_EXEC_ENOENT : EX_EXEC_FAILED, \
-+			_("failed to execute %s"), name)
++		ctl->nregfiles++;
++		if (ctl->verbose > 1)
++			printf("%s\n", name);
 +
++		fd = open(name, O_RDONLY);
++		if (fd < 0)
++			return;
 +
-+static inline __attribute__((const)) int is_power_of_2(unsigned long num)
-+{
-+	return (num != 0 && ((num & (num - 1)) == 0));
-+}
++		if ((size_t)st.st_size < sizeof(buf)) {
++			cksumsize = st.st_size;
++			memset(((char *)buf) + cksumsize, 0,
++			       (sizeof(buf) - cksumsize) % sizeof(buf[0]));
++		}
++		if (read(fd, buf, cksumsize) != cksumsize) {
++			close(fd);
++			return;
++		}
++		cksumsize = (cksumsize + sizeof(buf[0]) - 1) / sizeof(buf[0]);
++		for (i = 0, cksum = 0; i < cksumsize; i++) {
++			if (cksum + buf[i] < cksum)
++				cksum += buf[i] + 1;
++			else
++				cksum += buf[i];
++		}
++		for (hp = ctl->hps[hsh]; hp; hp = hp->next) {
++			if (hp->size == st.st_size && hp->mtime == mtime)
++				break;
++		}
++		if (!hp) {
++			hp = xmalloc(sizeof(*hp));
++			hp->size = st.st_size;
++			hp->mtime = mtime;
++			hp->chain = NULL;
++			hp->next = ctl->hps[hsh];
++			ctl->hps[hsh] = hp;
++		}
++		for (fp = hp->chain; fp; fp = fp->next) {
++			if (fp->cksum == cksum)
++				break;
++		}
++		for (fp2 = fp; fp2 && fp2->cksum == cksum; fp2 = fp2->next) {
++			if (fp2->ino == st.st_ino && fp2->dev == st.st_dev) {
++				close(fd);
++				return;
++			}
++		}
++		for (fp2 = fp; fp2 && fp2->cksum == cksum; fp2 = fp2->next) {
 +
-+#ifndef HAVE_LOFF_T
-+typedef int64_t loff_t;
-+#endif
++			if (!lstat(fp2->name, &st2) && S_ISREG(st2.st_mode) &&
++			    !stcmp(&st, &st2, ctl->content_only) &&
++			    st2.st_ino != st.st_ino &&
++			    st2.st_dev == st.st_dev) {
 +
-+#if !defined(HAVE_DIRFD) && (!defined(HAVE_DECL_DIRFD) || HAVE_DECL_DIRFD == 0) && defined(HAVE_DIR_DD_FD)
-+#include <sys/types.h>
-+#include <dirent.h>
-+static inline int dirfd(DIR *d)
-+{
-+	return d->dd_fd;
-+}
-+#endif
++				int fd2 = open(fp2->name, O_RDONLY);
++				if (fd2 < 0)
++					continue;
 +
-+/*
-+ * Fallback defines for old versions of glibc
-+ */
-+#include <fcntl.h>
++				if (fstat(fd2, &st2) || !S_ISREG(st2.st_mode)
++				    || st2.st_size == 0) {
++					close(fd2);
++					continue;
++				}
++				ctl->ncomp++;
++				lseek(fd, 0, SEEK_SET);
 +
-+#ifdef O_CLOEXEC
-+#define UL_CLOEXECSTR	"e"
-+#else
-+#define UL_CLOEXECSTR	""
-+#endif
++				for (fsize = st.st_size; fsize > 0;
++				     fsize -= (off_t)sizeof(ctl->iobuf1)) {
++					ssize_t xsz;
++					ssize_t rsize = fsize > (ssize_t) sizeof(ctl->iobuf1) ?
++							(ssize_t) sizeof(ctl->iobuf1) : fsize;
 +
-+#ifndef O_CLOEXEC
-+#define O_CLOEXEC 0
-+#endif
++					if ((xsz = read(fd, ctl->iobuf1, rsize)) != rsize)
++						warn(_("cannot read %s"), name);
++					else if ((xsz = read(fd2, ctl->iobuf2, rsize)) != rsize)
++						warn(_("cannot read %s"), fp2->name);
 +
-+#ifdef __FreeBSD_kernel__
-+#ifndef F_DUPFD_CLOEXEC
-+#define F_DUPFD_CLOEXEC	17	/* Like F_DUPFD, but FD_CLOEXEC is set */
-+#endif
-+#endif
++					if (xsz != rsize) {
++						close(fd);
++						close(fd2);
++						return;
++					}
++					if (memcmp(ctl->iobuf1, ctl->iobuf2, rsize))
++						break;
++				}
++				close(fd2);
++				if (fsize > 0)
++					continue;
++				if (lstat(name, &st3)) {
++					warn(_("cannot stat %s"), name);
++					close(fd);
++					return;
++				}
++				st3.st_atime = st.st_atime;
++				if (stcmp(&st, &st3, 0)) {
++					warnx(_("file %s changed underneath us"), name);
++					close(fd);
++					return;
++				}
++				n1 = fp2->name;
++				n2 = name;
 +
++				if (!ctl->no_link) {
++					const char *suffix =
++					    ".$$$___cleanit___$$$";
++					const size_t suffixlen = strlen(suffix);
++					size_t n2len = strlen(n2);
++					struct hardlink_dynstr nam2 = { NULL, 0 };
 +
-+#ifndef AI_ADDRCONFIG
-+#define AI_ADDRCONFIG 0x0020
-+#endif
++					growstr(&nam2, add2(n2len, suffixlen));
++					memcpy(nam2.buf, n2, n2len);
++					memcpy(&nam2.buf[n2len], suffix,
++					       suffixlen + 1);
++					/* First create a temporary link to n1 under a new name */
++					if (link(n1, nam2.buf)) {
++						warn(_("failed to hardlink %s to %s (create temporary link as %s failed)"),
++							n1, n2, nam2.buf);
++						free(nam2.buf);
++						continue;
++					}
++					/* Then rename into place over the existing n2 */
++					if (rename(nam2.buf, n2)) {
++						warn(_("failed to hardlink %s to %s (rename temporary link to %s failed)"),
++							n1, n2, n2);
++						/* Something went wrong, try to remove the now redundant temporary link */
++						if (unlink(nam2.buf))
++							warn(_("failed to remove temporary link %s"), nam2.buf);
++						free(nam2.buf);
++						continue;
++					}
++					free(nam2.buf);
++				}
++				ctl->nlinks++;
++				if (st3.st_nlink > 1) {
++					/* We actually did not save anything this time, since the link second argument
++					   had some other links as well.  */
++					if (ctl->verbose > 1)
++						printf(_(" %s %s to %s\n"),
++							(ctl->no_link ? _("Would link") : _("Linked")),
++							n1, n2);
++				} else {
++					ctl->nsaved += ((st.st_size + 4095) / 4096) * 4096;
++					if (ctl->verbose > 1)
++						printf(_(" %s %s to %s, %s %jd\n"),
++							(ctl->no_link ? _("Would link") : _("Linked")),
++							n1, n2,
++							(ctl->no_link ? _("would save") : _("saved")),
++							(intmax_t)st.st_size);
++				}
++				close(fd);
++				return;
++			}
++		}
++		fp2 = xmalloc(add3(sizeof(*fp2), namelen, 1));
++		close(fd);
++		fp2->ino = st.st_ino;
++		fp2->dev = st.st_dev;
++		fp2->cksum = cksum;
++		memcpy(fp2->name, name, namelen + 1);
 +
-+#ifndef IUTF8
-+#define IUTF8 0040000
-+#endif
++		if (fp) {
++			fp2->next = fp->next;
++			fp->next = fp2;
++		} else {
++			fp2->next = hp->chain;
++			hp->chain = fp2;
++		}
++		return;
++	}
++}
 +
-+/*
-+ * MAXHOSTNAMELEN replacement
-+ */
-+static inline size_t get_hostname_max(void)
++int main(int argc, char **argv)
 +{
-+	long len = sysconf(_SC_HOST_NAME_MAX);
-+
-+	if (0 < len)
-+		return len;
-+
-+#ifdef MAXHOSTNAMELEN
-+	return MAXHOSTNAMELEN;
-+#elif HOST_NAME_MAX
-+	return HOST_NAME_MAX;
++	int ch;
++	int i;
++#ifdef HAVE_PCRE
++	int errornumber;
++	PCRE2_SIZE erroroffset;
++	pcre2_code *re = NULL;
++	PCRE2_SPTR exclude_pattern = NULL;
++	pcre2_match_data *match_data = NULL;
 +#endif
-+	return 64;
-+}
-+
-+
-+/*
-+ * Constant strings for usage() functions. For more info see
-+ * Documentation/{howto-usage-function.txt,boilerplate.c}
-+ */
-+#define USAGE_HEADER     ("\nUsage:\n")
-+#define USAGE_OPTIONS    ("\nOptions:\n")
-+#define USAGE_FUNCTIONS  ("\nFunctions:\n")
-+#define USAGE_COMMANDS   ("\nCommands:\n")
-+#define USAGE_COLUMNS    ("\nAvailable output columns:\n")
-+#define USAGE_SEPARATOR    "\n"
-+
-+#define USAGE_OPTSTR_HELP     ("display this help")
-+#define USAGE_OPTSTR_VERSION  ("display version")
-+
-+#define USAGE_HELP_OPTIONS(marg_dsc) \
-+		"%-" #marg_dsc "s%s\n" \
-+		"%-" #marg_dsc "s%s\n" \
-+		, " -h, --help",    USAGE_OPTSTR_HELP \
-+		, " -V, --version", USAGE_OPTSTR_VERSION
-+
-+#define USAGE_MAN_TAIL(_man)   ("\nFor more details see %s.\n"), _man
++	struct hardlink_dynstr nam1 = { NULL, 0 };
++	struct hardlink_ctl *ctl = &global_ctl;
 +
-+#define UTIL_LINUX_VERSION ("%s from %s\n"), program_invocation_short_name, PACKAGE_STRING
++	static const struct option longopts[] = {
++		{ "content",    no_argument, NULL, 'c' },
++		{ "dry-run",    no_argument, NULL, 'n' },
++		{ "exclude",    required_argument, NULL, 'x' },
++		{ "force",      no_argument, NULL, 'f' },
++		{ "help",       no_argument, NULL, 'h' },
++		{ "verbose",    no_argument, NULL, 'v' },
++		{ "version",    no_argument, NULL, 'V' },
++		{ NULL, 0, NULL, 0 },
++	};
 +
-+#define print_version(eval) __extension__ ({ \
-+		printf(UTIL_LINUX_VERSION); \
-+		exit(eval); \
-+})
++	setlocale(LC_ALL, "");
++	bindtextdomain(PACKAGE, LOCALEDIR);
++	textdomain(PACKAGE);
++	close_stdout_atexit();
 +
-+/*
-+ * scanf modifiers for "strings allocation"
-+ */
-+#ifdef HAVE_SCANF_MS_MODIFIER
-+#define UL_SCNsA	"%ms"
-+#elif defined(HAVE_SCANF_AS_MODIFIER)
-+#define UL_SCNsA	"%as"
++	while ((ch = getopt_long(argc, argv, "cnvfx:Vh", longopts, NULL)) != -1) {
++		switch (ch) {
++		case 'n':
++			ctl->no_link = 1;
++			break;
++		case 'v':
++			ctl->verbose++;
++			break;
++		case 'c':
++			ctl->content_only = 1;
++			break;
++		case 'f':
++			ctl->force = 1;
++			break;
++		case 'x':
++#ifdef HAVE_PCRE
++			exclude_pattern = (PCRE2_SPTR) optarg;
++#else
++			errx(EXIT_FAILURE,
++			     _("option --exclude not supported (built without pcre2)"));
 +#endif
++			break;
++		case 'V':
++			print_version(EXIT_SUCCESS);
++		case 'h':
++			usage();
++		default:
++			errtryhelp(EXIT_FAILURE);
++		}
++	}
 +
-+/*
-+ * seek stuff
-+ */
-+#ifndef SEEK_DATA
-+# define SEEK_DATA	3
-+#endif
-+#ifndef SEEK_HOLE
-+# define SEEK_HOLE	4
++	if (optind == argc) {
++		warnx(_("no directory specified"));
++		errtryhelp(EXIT_FAILURE);
++	}
++
++#ifdef HAVE_PCRE
++	if (exclude_pattern) {
++		re = pcre2_compile(exclude_pattern, /* the pattern */
++				   PCRE2_ZERO_TERMINATED, /* indicates pattern is zero-terminate */
++				   0, /* default options */
++				   &errornumber, &erroroffset, NULL); /* use default compile context */
++		if (!re) {
++			PCRE2_UCHAR buffer[256];
++			pcre2_get_error_message(errornumber, buffer,
++						sizeof(buffer));
++			errx(EXIT_FAILURE, _("pattern error at offset %d: %s"),
++				(int)erroroffset, buffer);
++		}
++		match_data = pcre2_match_data_create_from_pattern(re, NULL);
++	}
 +#endif
++	atexit(print_summary);
 +
++	for (i = optind; i < argc; i++)
++		process_path(ctl, argv[i]);
 +
-+/*
-+ * Macros to convert #define'itions to strings, for example
-+ * #define XYXXY 42
-+ * printf ("%s=%s\n", stringify(XYXXY), stringify_value(XYXXY));
-+ */
-+#define stringify_value(s) stringify(s)
-+#define stringify(s) #s
++	while (ctl->dirs) {
++		DIR *dh;
++		struct dirent *di;
++		struct hardlink_dir *dp = ctl->dirs;
++		size_t nam1baselen = strlen(dp->name);
 +
-+/*
-+ * UL_ASAN_BLACKLIST is a macro to tell AddressSanitizer (a compile-time
-+ * instrumentation shipped with Clang and GCC) to not instrument the
-+ * annotated function.  Furthermore, it will prevent the compiler from
-+ * inlining the function because inlining currently breaks the blacklisting
-+ * mechanism of AddressSanitizer.
-+ */
-+#if __has_feature(address_sanitizer) && __has_attribute(no_sanitize_memory) && __has_attribute(no_sanitize_address)
-+# define UL_ASAN_BLACKLIST __attribute__((noinline)) __attribute__((no_sanitize_memory)) __attribute__((no_sanitize_address))
-+#else
-+# define UL_ASAN_BLACKLIST	/* nothing */
-+#endif
++		ctl->dirs = dp->next;
++		growstr(&nam1, add2(nam1baselen, 1));
++		memcpy(nam1.buf, dp->name, nam1baselen);
++		free(dp);
++		nam1.buf[nam1baselen++] = '/';
++		nam1.buf[nam1baselen] = 0;
++		dh = opendir(nam1.buf);
 +
-+/*
-+ * Note that sysconf(_SC_GETPW_R_SIZE_MAX) returns *initial* suggested size for
-+ * pwd buffer and in some cases it is not large enough. See POSIX and
-+ * getpwnam_r man page for more details.
-+ */
-+#define UL_GETPW_BUFSIZ	(16 * 1024)
++		if (dh == NULL)
++			continue;
++		ctl->ndirs++;
 +
-+/*
-+ * Darwin or other BSDs may only have MAP_ANON. To get it on Darwin we must
-+ * define _DARWIN_C_SOURCE before including sys/mman.h. We do this in config.h.
-+ */
-+#if !defined MAP_ANONYMOUS && defined MAP_ANON
-+# define MAP_ANONYMOUS  (MAP_ANON)
++		while ((di = readdir(dh)) != NULL) {
++			if (!di->d_name[0])
++				continue;
++			if (di->d_name[0] == '.') {
++				if (!di->d_name[1] || !strcmp(di->d_name, ".."))
++					continue;
++			}
++#ifdef HAVE_PCRE
++			if (re && pcre2_match(re, /* compiled regex */
++					      (PCRE2_SPTR) di->d_name, strlen(di->d_name), 0, /* start at offset 0 */
++					      0, /* default options */
++					      match_data, /* block for storing the result */
++					      NULL) /* use default match context */
++			    >=0) {
++				if (ctl->verbose) {
++					nam1.buf[nam1baselen] = 0;
++					printf(_("Skipping %s%s\n"), nam1.buf, di->d_name);
++				}
++				continue;
++			}
 +#endif
++			{
++				size_t subdirlen;
++				growstr(&nam1,
++					add2(nam1baselen, subdirlen =
++					     strlen(di->d_name)));
++				memcpy(&nam1.buf[nam1baselen], di->d_name,
++				       add2(subdirlen, 1));
++			}
++			process_path(ctl, nam1.buf);
++		}
++		closedir(dh);
++	}
 +
-+#endif /* UTIL_LINUX_C_H */
++	return 0;
++}
+diff --git a/locale/programs/xalloc.h b/locale/programs/xalloc.h
+new file mode 100644
+index 0000000000..0129a85e2e
 --- /dev/null
 +++ b/locale/programs/xalloc.h
 @@ -0,0 +1,129 @@
diff --git a/meta/recipes-core/glibc/glibc/allow-compile-separate-from-util-linux-hardlink.patch b/meta/recipes-core/glibc/glibc/0030-hardlink-fix-ups-to-make-it-compile.patch
similarity index 85%
rename from meta/recipes-core/glibc/glibc/allow-compile-separate-from-util-linux-hardlink.patch
rename to meta/recipes-core/glibc/glibc/0030-hardlink-fix-ups-to-make-it-compile.patch
index 1148ebfcc7..1a5f6b6825 100644
--- a/meta/recipes-core/glibc/glibc/allow-compile-separate-from-util-linux-hardlink.patch
+++ b/meta/recipes-core/glibc/glibc/0030-hardlink-fix-ups-to-make-it-compile.patch
@@ -1,8 +1,31 @@
+From d08f436635cb9d627ebae4512105708d28fc36fe Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Sat, 7 Dec 2019 10:01:37 -0800
+Subject: [PATCH] hardlink: fix-ups to make it compile
+
+Upstream-Status: Pending
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- locale/programs/c.h                        |    2 
- locale/programs/cross-localedef-hardlink.c |   79 +++++++++++++----------------
+ locale/programs/c.h                        |  2 +-
+ locale/programs/cross-localedef-hardlink.c | 79 +++++++++++-----------
  2 files changed, 39 insertions(+), 42 deletions(-)
 
+diff --git a/locale/programs/c.h b/locale/programs/c.h
+index d0a402e90e..1804d31c73 100644
+--- a/locale/programs/c.h
++++ b/locale/programs/c.h
+@@ -240,7 +240,7 @@ errmsg(char doexit, int excode, char adderr, const char *fmt, ...)
+ /* Don't use inline function to avoid '#include "nls.h"' in c.h
+  */
+ #define errtryhelp(eval) __extension__ ({ \
+-	fprintf(stderr, _("Try '%s --help' for more information.\n"), \
++	fprintf(stderr, ("Try '%s --help' for more information.\n"), \
+ 			program_invocation_short_name); \
+ 	exit(eval); \
+ })
+diff --git a/locale/programs/cross-localedef-hardlink.c b/locale/programs/cross-localedef-hardlink.c
+index 63615896b0..726e6dd948 100644
 --- a/locale/programs/cross-localedef-hardlink.c
 +++ b/locale/programs/cross-localedef-hardlink.c
 @@ -20,6 +20,8 @@
@@ -75,7 +98,7 @@
  
  	fputs(USAGE_SEPARATOR, stdout);
  	printf(USAGE_HELP_OPTIONS(16)); /* char offset to align option descriptions */
-@@ -164,7 +166,7 @@ static inline size_t add2(size_t a, size
+@@ -164,7 +166,7 @@ static inline size_t add2(size_t a, size_t b)
  	size_t sum = a + b;
  
  	if (sum < a)
@@ -84,7 +107,7 @@
  	return sum;
  }
  
-@@ -193,7 +195,7 @@ static void process_path(struct hardlink
+@@ -193,7 +195,7 @@ static void process_path(struct hardlink_ctl *ctl, const char *name)
  	if (st.st_dev != ctl->dev && !ctl->force) {
  		if (ctl->dev)
  			errx(EXIT_FAILURE,
@@ -93,7 +116,7 @@
  			       "(use -f option to override)."), name);
  		ctl->dev = st.st_dev;
  	}
-@@ -287,9 +289,9 @@ static void process_path(struct hardlink
+@@ -287,9 +289,9 @@ static void process_path(struct hardlink_ctl *ctl, const char *name)
  							(ssize_t) sizeof(ctl->iobuf1) : fsize;
  
  					if ((xsz = read(fd, ctl->iobuf1, rsize)) != rsize)
@@ -105,7 +128,7 @@
  
  					if (xsz != rsize) {
  						close(fd);
-@@ -303,13 +305,13 @@ static void process_path(struct hardlink
+@@ -303,13 +305,13 @@ static void process_path(struct hardlink_ctl *ctl, const char *name)
  				if (fsize > 0)
  					continue;
  				if (lstat(name, &st3)) {
@@ -121,7 +144,7 @@
  					close(fd);
  					return;
  				}
-@@ -329,18 +331,18 @@ static void process_path(struct hardlink
+@@ -329,18 +331,18 @@ static void process_path(struct hardlink_ctl *ctl, const char *name)
  					       suffixlen + 1);
  					/* First create a temporary link to n1 under a new name */
  					if (link(n1, nam2.buf)) {
@@ -143,7 +166,7 @@
  						free(nam2.buf);
  						continue;
  					}
-@@ -351,16 +353,16 @@ static void process_path(struct hardlink
+@@ -351,16 +353,16 @@ static void process_path(struct hardlink_ctl *ctl, const char *name)
  					/* We actually did not save anything this time, since the link second argument
  					   had some other links as well.  */
  					if (ctl->verbose > 1)
@@ -213,14 +236,3 @@
  				}
  				continue;
  			}
---- a/locale/programs/c.h
-+++ b/locale/programs/c.h
-@@ -240,7 +240,7 @@ errmsg(char doexit, int excode, char add
- /* Don't use inline function to avoid '#include "nls.h"' in c.h
-  */
- #define errtryhelp(eval) __extension__ ({ \
--	fprintf(stderr, _("Try '%s --help' for more information.\n"), \
-+	fprintf(stderr, ("Try '%s --help' for more information.\n"), \
- 			program_invocation_short_name); \
- 	exit(eval); \
- })
diff --git a/meta/recipes-core/glibc/glibc/0031-Add-hardlink-resolver-to-build.patch b/meta/recipes-core/glibc/glibc/0031-Add-hardlink-resolver-to-build.patch
new file mode 100644
index 0000000000..e87a3bfb6f
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0031-Add-hardlink-resolver-to-build.patch
@@ -0,0 +1,55 @@
+From 1ef58f566e6ed575f7caee35308025e2b0f4101c Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Sat, 7 Dec 2019 09:56:23 -0800
+Subject: [PATCH] Add hardlink resolver to build
+
+The sourcecode for this is imported from util-linux and is kept with
+glibc sources
+
+Upstream-Status: Pending
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.in | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/localedef/Makefile.in b/localedef/Makefile.in
+index 77fbded..a87e5b2 100644
+--- a/localedef/Makefile.in
++++ b/localedef/Makefile.in
+@@ -40,6 +40,8 @@ WARNFLAGS	= -Wall -Wno-format
+ FULLCC		= $(CC) $(CPPFLAGS) $(CFLAGS) \
+ 		  $(DEFINES) $(INCLUDES) $(WARNFLAGS)
+ 
++CROSS_LOCALEDEF_HARDLINK_OBJS = cross-localedef-hardlink.o
++
+ LOCALEDEF_OBJS	= charmap.o charmap-dir.o ld-address.o ld-collate.o \
+ 		  ld-ctype.o ld-identification.o ld-measurement.o \
+ 		  ld-messages.o ld-monetary.o ld-name.o ld-numeric.o \
+@@ -54,11 +56,14 @@ LOCALEDEF_OBJS	= charmap.o charmap-dir.o ld-address.o ld-collate.o \
+ 		  asprintf.o getdelim.o localedef_extra.o \
+ 		  obstack_printf.o vasprintf.o
+ 
+-all:		localedef$(EXEEXT)
++all:		localedef$(EXEEXT) cross-localedef-hardlink$(EXEEXT)
+ 
+ localedef$(EXEEXT): $(LOCALEDEF_OBJS)
+ 		$(CC) -o $@ $(LOCALEDEF_OBJS) $(LIBS)
+ 
++cross-localedef-hardlink$(EXEEXT): $(CROSS_LOCALEDEF_HARDLINK_OBJS)
++		$(CC) -o $@ $(CROSS_LOCALEDEF_HARDLINK_OBJS) $(LIBS)
++
+ clean:
+ 		rm -f locale$(EXEEXT) $(LOCALEDEF_OBJS)
+ 
+@@ -77,6 +82,7 @@ clean:
+ %.o: $(srcdir)/%.c
+ 		$(FULLCC) -c -o $@ $<
+ 
++cross-localedef-hardlink.o: glibc/locale/programs/cross-localedef-hardlink.c
+ charmap.o: glibc/locale/programs/charmap.c
+ charmap-dir.o: glibc/locale/programs/charmap-dir.c
+ ld-address.o: glibc/locale/programs/ld-address.c
+-- 
+2.24.0
+
-- 
2.24.0


