Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id CC8B46FFD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:35:58 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id g132so4243169pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:in-reply-to:references:content-transfer-encoding;
	bh=coUEF7Gccs6GeN3dIimWQ45GxTL2IBDnnX+nMTIFKyQ=;
	b=S3/Du15oiF6a/CpG7Lm0AzcgFfgK9PukNYUEc4vADUxAb1kWBJ4OzJ7mVgin0DnVqR
	Ff/xNy3goqc/lmIq2iYyeh+iwDo6DJV3kzFC64O/6oeuN6PVqIxy/Z6sQUhrnTPx4+9H
	TtgH2J/RYkGVIB9mP8yFK5StuxvSTUsTDvDEJqpim2kqkIc+iryjnIYHpikFNzfaQLnY
	bwp1xHSXElRv8B0sC1fWevRvxJUFuXn3m1wLkXnLCmuCAawq04Irj9ZQs8fhxEcisH8W
	ufGVevT8lA3zE+TNDtwnQAReZfvRkrcDHcF9ijEbhxjBrpDzAZ9pBhDv6mgOAsMv2jSX
	hVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=coUEF7Gccs6GeN3dIimWQ45GxTL2IBDnnX+nMTIFKyQ=;
	b=D/39hAHxQ4luthHlhiS8bXJUwT1+469gqsn4i0J4YwZCwacSd4ZI0/JjfzDuT959oq
	bcr9wRZNJXJk3oDQl/LwMUyIQISd8xpmdy5wabSMZL7BGabMtZD8wc1CjP6GeN/vFdmg
	5UmLbOIN8PeWjlGR70tvaewHYAoiwgVcNcGvgzKz7dZH62cbMVm0Z7hbJmNBcre/vYye
	9hNGNYsKhr/IlG1eDa8C/L+hpRL6QBv60+7jZMZ6F8bFo6Nl7Qxmc6dOCS0mtmo/esb/
	GqBzZoViiGR+RAKIK+nn+K+zJDh08F8Abiz1ApExjZUSRdjB2QF5jQ/M6xbCqCHX/Y0Z
	kXCg==
X-Gm-Message-State: AOPr4FWz1vkpaVMMHUBfe9agDwvP2+UFH7vmfC1ENko8NuTwExcQ16dAqS3mFuUfhG6trQ==
X-Received: by 10.98.103.28 with SMTP id b28mr6839215pfc.155.1462988159665;
	Wed, 11 May 2016 10:35:59 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.35.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:35:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:07 -0700
Message-Id: <21f82d187da399c095757a354456658fc8d530a8.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 04/42] elfutils: Upgrade to 0.166
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
X-List-Received-Date: Wed, 11 May 2016 17:35:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Has many fixes for compiling it with gcc-6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ferences-between-mips-machine-identifiers.patch |   0
 ...de-alternatives-for-glibc-assumptions-hel.patch | 488 ++++++++++-----------
 ...m-Silence-Werror-maybe-uninitialized-fals.patch |   0
 .../0001-fix-a-stack-usage-warning.patch           |   0
 .../0001-remove-the-unneed-checking.patch          |   0
 ...-support-for-mips64-abis-in-mips_retval.c.patch |   0
 .../0003-Add-mips-n64-relocation-format-hack.patch |   0
 .../aarch64_uio.patch                              |   0
 .../arm_backend.diff                               |   0
 .../elfcmp-fix-self-comparision.patch              |  41 ++
 .../fixheadercheck.patch                           |   0
 .../hppa_backend.diff                              |   0
 .../kfreebsd_path.patch                            |   0
 .../m68k_backend.diff                              |   0
 .../mips_backend.diff                              |   0
 .../mips_readelf_w.patch                           |   0
 .../shadow.patch                                   |   0
 .../testsuite-ignore-elflint.diff                  |   0
 .../uclibc-support.patch                           |  37 +-
 .../{elfutils_0.164.bb => elfutils_0.166.bb}       |   6 +-
 20 files changed, 306 insertions(+), 266 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/0001-Ignore-differences-between-mips-machine-identifiers.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch (71%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/0001-fix-a-stack-usage-warning.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/0001-remove-the-unneed-checking.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/0003-Add-mips-n64-relocation-format-hack.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/aarch64_uio.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/arm_backend.diff (100%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/elfcmp-fix-self-comparision.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/fixheadercheck.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/hppa_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/kfreebsd_path.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/m68k_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/mips_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/mips_readelf_w.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/shadow.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/testsuite-ignore-elflint.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/uclibc-support.patch (82%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.164.bb => elfutils_0.166.bb} (94%)

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/0001-Ignore-differences-between-mips-machine-identifiers.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/0001-Ignore-differences-between-mips-machine-identifiers.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.164/0001-Ignore-differences-between-mips-machine-identifiers.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.166/0001-Ignore-differences-between-mips-machine-identifiers.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
similarity index 71%
rename from meta/recipes-devtools/elfutils/elfutils-0.164/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.166/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
index c8d1c89..38b31f6 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.164/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
+++ b/meta/recipes-devtools/elfutils/elfutils-0.166/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
@@ -87,11 +87,11 @@ Upstream-Status: Pending
  tests/vdsosyms.c                 |  2 +-
  77 files changed, 109 insertions(+), 73 deletions(-)
 
-Index: elfutils-0.164/Makefile.am
+Index: elfutils-0.166/Makefile.am
 ===================================================================
---- elfutils-0.164.orig/Makefile.am
-+++ elfutils-0.164/Makefile.am
-@@ -24,7 +24,7 @@ pkginclude_HEADERS = version.h
+--- elfutils-0.166.orig/Makefile.am
++++ elfutils-0.166/Makefile.am
+@@ -28,7 +28,7 @@ pkginclude_HEADERS = version.h
  
  # Add doc back when we have some real content.
  SUBDIRS = config m4 lib libelf libebl libdwelf libdwfl libdw libcpu libasm \
@@ -100,10 +100,10 @@ Index: elfutils-0.164/Makefile.am
  
  EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
  	     COPYING COPYING-GPLV2 COPYING-LGPLV3
-Index: elfutils-0.164/lib/color.c
+Index: elfutils-0.166/lib/color.c
 ===================================================================
---- elfutils-0.164.orig/lib/color.c
-+++ elfutils-0.164/lib/color.c
+--- elfutils-0.166.orig/lib/color.c
++++ elfutils-0.166/lib/color.c
 @@ -32,7 +32,7 @@
  #endif
  
@@ -113,10 +113,10 @@ Index: elfutils-0.164/lib/color.c
  #include <libintl.h>
  #include <stdlib.h>
  #include <string.h>
-Index: elfutils-0.164/lib/crc32_file.c
+Index: elfutils-0.166/lib/crc32_file.c
 ===================================================================
---- elfutils-0.164.orig/lib/crc32_file.c
-+++ elfutils-0.164/lib/crc32_file.c
+--- elfutils-0.166.orig/lib/crc32_file.c
++++ elfutils-0.166/lib/crc32_file.c
 @@ -30,12 +30,14 @@
  # include <config.h>
  #endif
@@ -133,10 +133,10 @@ Index: elfutils-0.164/lib/crc32_file.c
  int
  crc32_file (int fd, uint32_t *resp)
  {
-Index: elfutils-0.164/lib/fixedsizehash.h
+Index: elfutils-0.166/lib/fixedsizehash.h
 ===================================================================
---- elfutils-0.164.orig/lib/fixedsizehash.h
-+++ elfutils-0.164/lib/fixedsizehash.h
+--- elfutils-0.166.orig/lib/fixedsizehash.h
++++ elfutils-0.166/lib/fixedsizehash.h
 @@ -30,12 +30,12 @@
  #include <errno.h>
  #include <stdlib.h>
@@ -152,10 +152,10 @@ Index: elfutils-0.164/lib/fixedsizehash.h
  
  /* Before including this file the following macros must be defined:
  
-Index: elfutils-0.164/lib/system.h
+Index: elfutils-0.166/lib/system.h
 ===================================================================
---- elfutils-0.164.orig/lib/system.h
-+++ elfutils-0.164/lib/system.h
+--- elfutils-0.166.orig/lib/system.h
++++ elfutils-0.166/lib/system.h
 @@ -49,6 +49,16 @@
  #else
  # error "Unknown byte order"
@@ -173,10 +173,10 @@ Index: elfutils-0.164/lib/system.h
  
  extern void *xmalloc (size_t) __attribute__ ((__malloc__));
  extern void *xcalloc (size_t, size_t) __attribute__ ((__malloc__));
-Index: elfutils-0.164/lib/xmalloc.c
+Index: elfutils-0.166/lib/xmalloc.c
 ===================================================================
---- elfutils-0.164.orig/lib/xmalloc.c
-+++ elfutils-0.164/lib/xmalloc.c
+--- elfutils-0.166.orig/lib/xmalloc.c
++++ elfutils-0.166/lib/xmalloc.c
 @@ -30,7 +30,7 @@
  # include <config.h>
  #endif
@@ -186,10 +186,10 @@ Index: elfutils-0.164/lib/xmalloc.c
  #include <libintl.h>
  #include <stddef.h>
  #include <stdlib.h>
-Index: elfutils-0.164/libasm/asm_end.c
+Index: elfutils-0.166/libasm/asm_end.c
 ===================================================================
---- elfutils-0.164.orig/libasm/asm_end.c
-+++ elfutils-0.164/libasm/asm_end.c
+--- elfutils-0.166.orig/libasm/asm_end.c
++++ elfutils-0.166/libasm/asm_end.c
 @@ -32,7 +32,7 @@
  #endif
  
@@ -199,10 +199,10 @@ Index: elfutils-0.164/libasm/asm_end.c
  #include <libintl.h>
  #include <stdio.h>
  #include <stdlib.h>
-Index: elfutils-0.164/libasm/asm_newscn.c
+Index: elfutils-0.166/libasm/asm_newscn.c
 ===================================================================
---- elfutils-0.164.orig/libasm/asm_newscn.c
-+++ elfutils-0.164/libasm/asm_newscn.c
+--- elfutils-0.166.orig/libasm/asm_newscn.c
++++ elfutils-0.166/libasm/asm_newscn.c
 @@ -32,7 +32,7 @@
  #endif
  
@@ -212,10 +212,10 @@ Index: elfutils-0.164/libasm/asm_newscn.c
  #include <libintl.h>
  #include <stdlib.h>
  #include <string.h>
-Index: elfutils-0.164/libcpu/i386_gendis.c
+Index: elfutils-0.166/libcpu/i386_gendis.c
 ===================================================================
---- elfutils-0.164.orig/libcpu/i386_gendis.c
-+++ elfutils-0.164/libcpu/i386_gendis.c
+--- elfutils-0.166.orig/libcpu/i386_gendis.c
++++ elfutils-0.166/libcpu/i386_gendis.c
 @@ -31,7 +31,7 @@
  # include <config.h>
  #endif
@@ -225,11 +225,11 @@ Index: elfutils-0.164/libcpu/i386_gendis.c
  #include <errno.h>
  #include <stdio.h>
  #include <stdlib.h>
-Index: elfutils-0.164/libcpu/i386_lex.c
+Index: elfutils-0.166/libcpu/i386_lex.c
 ===================================================================
---- elfutils-0.164.orig/libcpu/i386_lex.c
-+++ elfutils-0.164/libcpu/i386_lex.c
-@@ -571,7 +571,7 @@ char *i386_text;
+--- elfutils-0.166.orig/libcpu/i386_lex.c
++++ elfutils-0.166/libcpu/i386_lex.c
+@@ -578,7 +578,7 @@ char *i386_text;
  #endif
  
  #include <ctype.h>
@@ -238,10 +238,10 @@ Index: elfutils-0.164/libcpu/i386_lex.c
  #include <libintl.h>
  
  #include <system.h>
-Index: elfutils-0.164/libcpu/i386_parse.c
+Index: elfutils-0.166/libcpu/i386_parse.c
 ===================================================================
---- elfutils-0.164.orig/libcpu/i386_parse.c
-+++ elfutils-0.164/libcpu/i386_parse.c
+--- elfutils-0.166.orig/libcpu/i386_parse.c
++++ elfutils-0.166/libcpu/i386_parse.c
 @@ -107,7 +107,7 @@
  #include <assert.h>
  #include <ctype.h>
@@ -251,23 +251,23 @@ Index: elfutils-0.164/libcpu/i386_parse.c
  #include <inttypes.h>
  #include <libintl.h>
  #include <math.h>
-Index: elfutils-0.164/libdw/Makefile.am
+Index: elfutils-0.166/libdw/Makefile.am
 ===================================================================
---- elfutils-0.164.orig/libdw/Makefile.am
-+++ elfutils-0.164/libdw/Makefile.am
+--- elfutils-0.166.orig/libdw/Makefile.am
++++ elfutils-0.166/libdw/Makefile.am
 @@ -117,7 +117,7 @@ libdw.so$(EXEEXT): $(srcdir)/libdw.map l
  		-Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
  		-Wl,--version-script,$<,--no-undefined \
  		-Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
--		-ldl $(argp_LDADD) $(zip_LIBS) $(libdw_so_LDLIBS)
-+		-ldl $(argp_LDADD) $(zip_LIBS) $(libdw_so_LDLIBS) -lfts -largp
+-		-ldl -lz $(argp_LDADD) $(zip_LIBS) $(libdw_so_LDLIBS)
++		-ldl -lz $(argp_LDADD) $(zip_LIBS) $(libdw_so_LDLIBS) -lfts -largp
  	@$(textrel_check)
  	$(AM_V_at)ln -fs $@ $@.$(VERSION)
  
-Index: elfutils-0.164/libdw/libdw_alloc.c
+Index: elfutils-0.166/libdw/libdw_alloc.c
 ===================================================================
---- elfutils-0.164.orig/libdw/libdw_alloc.c
-+++ elfutils-0.164/libdw/libdw_alloc.c
+--- elfutils-0.166.orig/libdw/libdw_alloc.c
++++ elfutils-0.166/libdw/libdw_alloc.c
 @@ -31,11 +31,12 @@
  # include <config.h>
  #endif
@@ -282,11 +282,11 @@ Index: elfutils-0.164/libdw/libdw_alloc.c
  
  
  void *
-Index: elfutils-0.164/libdwfl/Makefile.am
+Index: elfutils-0.166/libdwfl/Makefile.am
 ===================================================================
---- elfutils-0.164.orig/libdwfl/Makefile.am
-+++ elfutils-0.164/libdwfl/Makefile.am
-@@ -86,6 +86,8 @@ libelf = ../libelf/libelf.so
+--- elfutils-0.166.orig/libdwfl/Makefile.am
++++ elfutils-0.166/libdwfl/Makefile.am
+@@ -84,6 +84,8 @@ libelf = ../libelf/libelf.so
  libebl = ../libebl/libebl.a
  libeu = ../lib/libeu.a
  
@@ -295,10 +295,10 @@ Index: elfutils-0.164/libdwfl/Makefile.am
  libdwfl_pic_a_SOURCES =
  am_libdwfl_pic_a_OBJECTS = $(libdwfl_a_SOURCES:.c=.os)
  
-Index: elfutils-0.164/libdwfl/dwfl_build_id_find_elf.c
+Index: elfutils-0.166/libdwfl/dwfl_build_id_find_elf.c
 ===================================================================
---- elfutils-0.164.orig/libdwfl/dwfl_build_id_find_elf.c
-+++ elfutils-0.164/libdwfl/dwfl_build_id_find_elf.c
+--- elfutils-0.166.orig/libdwfl/dwfl_build_id_find_elf.c
++++ elfutils-0.166/libdwfl/dwfl_build_id_find_elf.c
 @@ -27,6 +27,7 @@
     not, see <http://www.gnu.org/licenses/>.  */
  
@@ -316,10 +316,10 @@ Index: elfutils-0.164/libdwfl/dwfl_build_id_find_elf.c
  	  if (*file_name == NULL)
  	    {
  	      *file_name = name;
-Index: elfutils-0.164/libdwfl/dwfl_error.c
+Index: elfutils-0.166/libdwfl/dwfl_error.c
 ===================================================================
---- elfutils-0.164.orig/libdwfl/dwfl_error.c
-+++ elfutils-0.164/libdwfl/dwfl_error.c
+--- elfutils-0.166.orig/libdwfl/dwfl_error.c
++++ elfutils-0.166/libdwfl/dwfl_error.c
 @@ -140,6 +140,7 @@ __libdwfl_seterrno (Dwfl_Error error)
  const char *
  dwfl_errmsg (int error)
@@ -338,10 +338,10 @@ Index: elfutils-0.164/libdwfl/dwfl_error.c
      case OTHER_ERROR (LIBELF):
        return elf_errmsg (error & 0xffff);
      case OTHER_ERROR (LIBDW):
-Index: elfutils-0.164/libdwfl/dwfl_module_getdwarf.c
+Index: elfutils-0.166/libdwfl/dwfl_module_getdwarf.c
 ===================================================================
---- elfutils-0.164.orig/libdwfl/dwfl_module_getdwarf.c
-+++ elfutils-0.164/libdwfl/dwfl_module_getdwarf.c
+--- elfutils-0.166.orig/libdwfl/dwfl_module_getdwarf.c
++++ elfutils-0.166/libdwfl/dwfl_module_getdwarf.c
 @@ -31,6 +31,7 @@
  #include <fcntl.h>
  #include <string.h>
@@ -350,11 +350,11 @@ Index: elfutils-0.164/libdwfl/dwfl_module_getdwarf.c
  #include "../libdw/libdwP.h"	/* DWARF_E_* values are here.  */
  #include "../libelf/libelfP.h"
  
-Index: elfutils-0.164/libdwfl/find-debuginfo.c
+Index: elfutils-0.166/libdwfl/find-debuginfo.c
 ===================================================================
---- elfutils-0.164.orig/libdwfl/find-debuginfo.c
-+++ elfutils-0.164/libdwfl/find-debuginfo.c
-@@ -372,7 +372,7 @@ dwfl_standard_find_debuginfo (Dwfl_Modul
+--- elfutils-0.166.orig/libdwfl/find-debuginfo.c
++++ elfutils-0.166/libdwfl/find-debuginfo.c
+@@ -385,7 +385,7 @@ dwfl_standard_find_debuginfo (Dwfl_Modul
        /* If FILE_NAME is a symlink, the debug file might be associated
  	 with the symlink target name instead.  */
  
@@ -363,10 +363,10 @@ Index: elfutils-0.164/libdwfl/find-debuginfo.c
        if (canon != NULL && strcmp (file_name, canon))
  	fd = find_debuginfo_in_path (mod, canon,
  				     debuglink_file, debuglink_crc,
-Index: elfutils-0.164/libdwfl/libdwfl_crc32_file.c
+Index: elfutils-0.166/libdwfl/libdwfl_crc32_file.c
 ===================================================================
---- elfutils-0.164.orig/libdwfl/libdwfl_crc32_file.c
-+++ elfutils-0.164/libdwfl/libdwfl_crc32_file.c
+--- elfutils-0.166.orig/libdwfl/libdwfl_crc32_file.c
++++ elfutils-0.166/libdwfl/libdwfl_crc32_file.c
 @@ -31,6 +31,16 @@
  
  #define crc32_file attribute_hidden __libdwfl_crc32_file
@@ -384,10 +384,10 @@ Index: elfutils-0.164/libdwfl/libdwfl_crc32_file.c
  #define LIB_SYSTEM_H	1
  #include <libdwflP.h>
  #include "../lib/crc32_file.c"
-Index: elfutils-0.164/libdwfl/linux-kernel-modules.c
+Index: elfutils-0.166/libdwfl/linux-kernel-modules.c
 ===================================================================
---- elfutils-0.164.orig/libdwfl/linux-kernel-modules.c
-+++ elfutils-0.164/libdwfl/linux-kernel-modules.c
+--- elfutils-0.166.orig/libdwfl/linux-kernel-modules.c
++++ elfutils-0.166/libdwfl/linux-kernel-modules.c
 @@ -34,6 +34,7 @@
  #include <config.h>
  
@@ -396,10 +396,10 @@ Index: elfutils-0.164/libdwfl/linux-kernel-modules.c
  #include <inttypes.h>
  #include <errno.h>
  #include <stdio.h>
-Index: elfutils-0.164/libebl/eblopenbackend.c
+Index: elfutils-0.166/libebl/eblopenbackend.c
 ===================================================================
---- elfutils-0.164.orig/libebl/eblopenbackend.c
-+++ elfutils-0.164/libebl/eblopenbackend.c
+--- elfutils-0.166.orig/libebl/eblopenbackend.c
++++ elfutils-0.166/libebl/eblopenbackend.c
 @@ -32,7 +32,7 @@
  
  #include <assert.h>
@@ -409,10 +409,10 @@ Index: elfutils-0.164/libebl/eblopenbackend.c
  #include <libelfP.h>
  #include <dwarf.h>
  #include <stdlib.h>
-Index: elfutils-0.164/libebl/eblwstrtab.c
+Index: elfutils-0.166/libebl/eblwstrtab.c
 ===================================================================
---- elfutils-0.164.orig/libebl/eblwstrtab.c
-+++ elfutils-0.164/libebl/eblwstrtab.c
+--- elfutils-0.166.orig/libebl/eblwstrtab.c
++++ elfutils-0.166/libebl/eblwstrtab.c
 @@ -305,7 +305,7 @@ copystrings (struct Ebl_WStrent *nodep,
  
    /* Process the current node.  */
@@ -422,10 +422,10 @@ Index: elfutils-0.164/libebl/eblwstrtab.c
    *offsetp += nodep->len * sizeof (wchar_t);
  
    for (subs = nodep->next; subs != NULL; subs = subs->next)
-Index: elfutils-0.164/libelf/elf.h
+Index: elfutils-0.166/libelf/elf.h
 ===================================================================
---- elfutils-0.164.orig/libelf/elf.h
-+++ elfutils-0.164/libelf/elf.h
+--- elfutils-0.166.orig/libelf/elf.h
++++ elfutils-0.166/libelf/elf.h
 @@ -21,7 +21,9 @@
  
  #include <features.h>
@@ -437,7 +437,7 @@ Index: elfutils-0.164/libelf/elf.h
  
  /* Standard ELF types.  */
  
-@@ -3552,7 +3554,8 @@ enum
+@@ -3591,7 +3593,8 @@ enum
  
  #define R_TILEGX_NUM		130
  
@@ -448,10 +448,10 @@ Index: elfutils-0.164/libelf/elf.h
 +#endif
  
  #endif	/* elf.h */
-Index: elfutils-0.164/libelf/libelf.h
+Index: elfutils-0.166/libelf/libelf.h
 ===================================================================
---- elfutils-0.164.orig/libelf/libelf.h
-+++ elfutils-0.164/libelf/libelf.h
+--- elfutils-0.166.orig/libelf/libelf.h
++++ elfutils-0.166/libelf/libelf.h
 @@ -29,6 +29,7 @@
  #ifndef _LIBELF_H
  #define _LIBELF_H 1
@@ -460,10 +460,10 @@ Index: elfutils-0.164/libelf/libelf.h
  #include <stdint.h>
  #include <sys/types.h>
  
-Index: elfutils-0.164/libelf/libelfP.h
+Index: elfutils-0.166/libelf/libelfP.h
 ===================================================================
---- elfutils-0.164.orig/libelf/libelfP.h
-+++ elfutils-0.164/libelf/libelfP.h
+--- elfutils-0.166.orig/libelf/libelfP.h
++++ elfutils-0.166/libelf/libelfP.h
 @@ -36,6 +36,7 @@
  
  #include <ar.h>
@@ -471,11 +471,11 @@ Index: elfutils-0.164/libelf/libelfP.h
 +#include <libelf.h>
  
  #include <errno.h>
- #include <stdint.h>
-Index: elfutils-0.164/src/addr2line.c
+ #include <stdbool.h>
+Index: elfutils-0.166/src/addr2line.c
 ===================================================================
---- elfutils-0.164.orig/src/addr2line.c
-+++ elfutils-0.164/src/addr2line.c
+--- elfutils-0.166.orig/src/addr2line.c
++++ elfutils-0.166/src/addr2line.c
 @@ -23,7 +23,7 @@
  #include <argp.h>
  #include <assert.h>
@@ -485,10 +485,10 @@ Index: elfutils-0.164/src/addr2line.c
  #include <fcntl.h>
  #include <inttypes.h>
  #include <libdwfl.h>
-Index: elfutils-0.164/src/ar.c
+Index: elfutils-0.166/src/ar.c
 ===================================================================
---- elfutils-0.164.orig/src/ar.c
-+++ elfutils-0.164/src/ar.c
+--- elfutils-0.166.orig/src/ar.c
++++ elfutils-0.166/src/ar.c
 @@ -22,7 +22,7 @@
  
  #include <argp.h>
@@ -498,10 +498,10 @@ Index: elfutils-0.164/src/ar.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <libintl.h>
-Index: elfutils-0.164/src/arlib.c
+Index: elfutils-0.166/src/arlib.c
 ===================================================================
---- elfutils-0.164.orig/src/arlib.c
-+++ elfutils-0.164/src/arlib.c
+--- elfutils-0.166.orig/src/arlib.c
++++ elfutils-0.166/src/arlib.c
 @@ -21,7 +21,7 @@
  #endif
  
@@ -511,10 +511,10 @@ Index: elfutils-0.164/src/arlib.c
  #include <gelf.h>
  #include <libintl.h>
  #include <stdio.h>
-Index: elfutils-0.164/src/arlib2.c
+Index: elfutils-0.166/src/arlib2.c
 ===================================================================
---- elfutils-0.164.orig/src/arlib2.c
-+++ elfutils-0.164/src/arlib2.c
+--- elfutils-0.166.orig/src/arlib2.c
++++ elfutils-0.166/src/arlib2.c
 @@ -20,7 +20,7 @@
  # include <config.h>
  #endif
@@ -524,10 +524,10 @@ Index: elfutils-0.164/src/arlib2.c
  #include <libintl.h>
  #include <limits.h>
  #include <string.h>
-Index: elfutils-0.164/src/elfcmp.c
+Index: elfutils-0.166/src/elfcmp.c
 ===================================================================
---- elfutils-0.164.orig/src/elfcmp.c
-+++ elfutils-0.164/src/elfcmp.c
+--- elfutils-0.166.orig/src/elfcmp.c
++++ elfutils-0.166/src/elfcmp.c
 @@ -23,7 +23,7 @@
  #include <argp.h>
  #include <assert.h>
@@ -537,10 +537,10 @@ Index: elfutils-0.164/src/elfcmp.c
  #include <fcntl.h>
  #include <locale.h>
  #include <libintl.h>
-Index: elfutils-0.164/src/elflint.c
+Index: elfutils-0.166/src/elflint.c
 ===================================================================
---- elfutils-0.164.orig/src/elflint.c
-+++ elfutils-0.164/src/elflint.c
+--- elfutils-0.166.orig/src/elflint.c
++++ elfutils-0.166/src/elflint.c
 @@ -24,7 +24,7 @@
  #include <assert.h>
  #include <byteswap.h>
@@ -550,10 +550,10 @@ Index: elfutils-0.164/src/elflint.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <inttypes.h>
-Index: elfutils-0.164/src/findtextrel.c
+Index: elfutils-0.166/src/findtextrel.c
 ===================================================================
---- elfutils-0.164.orig/src/findtextrel.c
-+++ elfutils-0.164/src/findtextrel.c
+--- elfutils-0.166.orig/src/findtextrel.c
++++ elfutils-0.166/src/findtextrel.c
 @@ -23,7 +23,7 @@
  #include <argp.h>
  #include <assert.h>
@@ -563,10 +563,10 @@ Index: elfutils-0.164/src/findtextrel.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <libdw.h>
-Index: elfutils-0.164/src/i386_ld.c
+Index: elfutils-0.166/src/i386_ld.c
 ===================================================================
---- elfutils-0.164.orig/src/i386_ld.c
-+++ elfutils-0.164/src/i386_ld.c
+--- elfutils-0.166.orig/src/i386_ld.c
++++ elfutils-0.166/src/i386_ld.c
 @@ -20,7 +20,7 @@
  #endif
  
@@ -576,10 +576,10 @@ Index: elfutils-0.164/src/i386_ld.c
  #include <libintl.h>
  #include <stdlib.h>
  #include <string.h>
-Index: elfutils-0.164/src/ld.c
+Index: elfutils-0.166/src/ld.c
 ===================================================================
---- elfutils-0.164.orig/src/ld.c
-+++ elfutils-0.164/src/ld.c
+--- elfutils-0.166.orig/src/ld.c
++++ elfutils-0.166/src/ld.c
 @@ -21,7 +21,7 @@
  
  #include <argp.h>
@@ -589,10 +589,10 @@ Index: elfutils-0.164/src/ld.c
  #include <fcntl.h>
  #include <libelf.h>
  #include <libintl.h>
-Index: elfutils-0.164/src/ldgeneric.c
+Index: elfutils-0.166/src/ldgeneric.c
 ===================================================================
---- elfutils-0.164.orig/src/ldgeneric.c
-+++ elfutils-0.164/src/ldgeneric.c
+--- elfutils-0.166.orig/src/ldgeneric.c
++++ elfutils-0.166/src/ldgeneric.c
 @@ -23,7 +23,7 @@
  #include <ctype.h>
  #include <dlfcn.h>
@@ -602,11 +602,11 @@ Index: elfutils-0.164/src/ldgeneric.c
  #include <fcntl.h>
  #include <fnmatch.h>
  #include <gelf.h>
-Index: elfutils-0.164/src/ldlex.c
+Index: elfutils-0.166/src/ldlex.c
 ===================================================================
---- elfutils-0.164.orig/src/ldlex.c
-+++ elfutils-0.164/src/ldlex.c
-@@ -1099,7 +1099,7 @@ char *ldtext;
+--- elfutils-0.166.orig/src/ldlex.c
++++ elfutils-0.166/src/ldlex.c
+@@ -1106,7 +1106,7 @@ char *ldtext;
  #include <assert.h>
  #include <ctype.h>
  #include <elf.h>
@@ -615,10 +615,10 @@ Index: elfutils-0.164/src/ldlex.c
  #include <inttypes.h>
  #include <libintl.h>
  #include <stdbool.h>
-Index: elfutils-0.164/src/ldscript.c
+Index: elfutils-0.166/src/ldscript.c
 ===================================================================
---- elfutils-0.164.orig/src/ldscript.c
-+++ elfutils-0.164/src/ldscript.c
+--- elfutils-0.166.orig/src/ldscript.c
++++ elfutils-0.166/src/ldscript.c
 @@ -95,7 +95,7 @@
  #endif
  
@@ -628,10 +628,10 @@ Index: elfutils-0.164/src/ldscript.c
  #include <libintl.h>
  #include <stdbool.h>
  #include <stdint.h>
-Index: elfutils-0.164/src/nm.c
+Index: elfutils-0.166/src/nm.c
 ===================================================================
---- elfutils-0.164.orig/src/nm.c
-+++ elfutils-0.164/src/nm.c
+--- elfutils-0.166.orig/src/nm.c
++++ elfutils-0.166/src/nm.c
 @@ -26,7 +26,7 @@
  #include <ctype.h>
  #include <dwarf.h>
@@ -641,10 +641,10 @@ Index: elfutils-0.164/src/nm.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <inttypes.h>
-Index: elfutils-0.164/src/objdump.c
+Index: elfutils-0.166/src/objdump.c
 ===================================================================
---- elfutils-0.164.orig/src/objdump.c
-+++ elfutils-0.164/src/objdump.c
+--- elfutils-0.166.orig/src/objdump.c
++++ elfutils-0.166/src/objdump.c
 @@ -21,7 +21,7 @@
  #endif
  
@@ -654,10 +654,10 @@ Index: elfutils-0.164/src/objdump.c
  #include <fcntl.h>
  #include <inttypes.h>
  #include <libintl.h>
-Index: elfutils-0.164/src/ranlib.c
+Index: elfutils-0.166/src/ranlib.c
 ===================================================================
---- elfutils-0.164.orig/src/ranlib.c
-+++ elfutils-0.164/src/ranlib.c
+--- elfutils-0.166.orig/src/ranlib.c
++++ elfutils-0.166/src/ranlib.c
 @@ -24,7 +24,7 @@
  #include <argp.h>
  #include <assert.h>
@@ -667,10 +667,10 @@ Index: elfutils-0.164/src/ranlib.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <libintl.h>
-Index: elfutils-0.164/src/readelf.c
+Index: elfutils-0.166/src/readelf.c
 ===================================================================
---- elfutils-0.164.orig/src/readelf.c
-+++ elfutils-0.164/src/readelf.c
+--- elfutils-0.166.orig/src/readelf.c
++++ elfutils-0.166/src/readelf.c
 @@ -25,7 +25,7 @@
  #include <ctype.h>
  #include <dwarf.h>
@@ -680,10 +680,10 @@ Index: elfutils-0.164/src/readelf.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <inttypes.h>
-Index: elfutils-0.164/src/size.c
+Index: elfutils-0.166/src/size.c
 ===================================================================
---- elfutils-0.164.orig/src/size.c
-+++ elfutils-0.164/src/size.c
+--- elfutils-0.166.orig/src/size.c
++++ elfutils-0.166/src/size.c
 @@ -21,7 +21,7 @@
  #endif
  
@@ -693,10 +693,10 @@ Index: elfutils-0.164/src/size.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <inttypes.h>
-Index: elfutils-0.164/src/stack.c
+Index: elfutils-0.166/src/stack.c
 ===================================================================
---- elfutils-0.164.orig/src/stack.c
-+++ elfutils-0.164/src/stack.c
+--- elfutils-0.166.orig/src/stack.c
++++ elfutils-0.166/src/stack.c
 @@ -18,7 +18,7 @@
  #include <config.h>
  #include <assert.h>
@@ -706,10 +706,10 @@ Index: elfutils-0.164/src/stack.c
  #include <stdlib.h>
  #include <inttypes.h>
  #include <stdio.h>
-Index: elfutils-0.164/src/strings.c
+Index: elfutils-0.166/src/strings.c
 ===================================================================
---- elfutils-0.164.orig/src/strings.c
-+++ elfutils-0.164/src/strings.c
+--- elfutils-0.166.orig/src/strings.c
++++ elfutils-0.166/src/strings.c
 @@ -25,7 +25,7 @@
  #include <ctype.h>
  #include <endian.h>
@@ -719,10 +719,10 @@ Index: elfutils-0.164/src/strings.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <inttypes.h>
-Index: elfutils-0.164/src/strip.c
+Index: elfutils-0.166/src/strip.c
 ===================================================================
---- elfutils-0.164.orig/src/strip.c
-+++ elfutils-0.164/src/strip.c
+--- elfutils-0.166.orig/src/strip.c
++++ elfutils-0.166/src/strip.c
 @@ -24,7 +24,7 @@
  #include <assert.h>
  #include <byteswap.h>
@@ -732,10 +732,10 @@ Index: elfutils-0.164/src/strip.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <libelf.h>
-Index: elfutils-0.164/src/unstrip.c
+Index: elfutils-0.166/src/unstrip.c
 ===================================================================
---- elfutils-0.164.orig/src/unstrip.c
-+++ elfutils-0.164/src/unstrip.c
+--- elfutils-0.166.orig/src/unstrip.c
++++ elfutils-0.166/src/unstrip.c
 @@ -31,7 +31,7 @@
  #include <argp.h>
  #include <assert.h>
@@ -745,10 +745,10 @@ Index: elfutils-0.164/src/unstrip.c
  #include <fcntl.h>
  #include <fnmatch.h>
  #include <libintl.h>
-Index: elfutils-0.164/tests/addrscopes.c
+Index: elfutils-0.166/tests/addrscopes.c
 ===================================================================
---- elfutils-0.164.orig/tests/addrscopes.c
-+++ elfutils-0.164/tests/addrscopes.c
+--- elfutils-0.166.orig/tests/addrscopes.c
++++ elfutils-0.166/tests/addrscopes.c
 @@ -25,7 +25,7 @@
  #include <stdio_ext.h>
  #include <locale.h>
@@ -758,10 +758,10 @@ Index: elfutils-0.164/tests/addrscopes.c
  #include <string.h>
  
  
-Index: elfutils-0.164/tests/allregs.c
+Index: elfutils-0.166/tests/allregs.c
 ===================================================================
---- elfutils-0.164.orig/tests/allregs.c
-+++ elfutils-0.164/tests/allregs.c
+--- elfutils-0.166.orig/tests/allregs.c
++++ elfutils-0.166/tests/allregs.c
 @@ -21,7 +21,7 @@
  #include <stdio.h>
  #include <stdlib.h>
@@ -771,10 +771,10 @@ Index: elfutils-0.164/tests/allregs.c
  #include <locale.h>
  #include <argp.h>
  #include <assert.h>
-Index: elfutils-0.164/tests/backtrace-data.c
+Index: elfutils-0.166/tests/backtrace-data.c
 ===================================================================
---- elfutils-0.164.orig/tests/backtrace-data.c
-+++ elfutils-0.164/tests/backtrace-data.c
+--- elfutils-0.166.orig/tests/backtrace-data.c
++++ elfutils-0.166/tests/backtrace-data.c
 @@ -27,7 +27,7 @@
  #include <dirent.h>
  #include <stdlib.h>
@@ -784,10 +784,10 @@ Index: elfutils-0.164/tests/backtrace-data.c
  #include <unistd.h>
  #include <dwarf.h>
  #if defined(__x86_64__) && defined(__linux__)
-Index: elfutils-0.164/tests/backtrace-dwarf.c
+Index: elfutils-0.166/tests/backtrace-dwarf.c
 ===================================================================
---- elfutils-0.164.orig/tests/backtrace-dwarf.c
-+++ elfutils-0.164/tests/backtrace-dwarf.c
+--- elfutils-0.166.orig/tests/backtrace-dwarf.c
++++ elfutils-0.166/tests/backtrace-dwarf.c
 @@ -22,7 +22,7 @@
  #include <stdio_ext.h>
  #include <locale.h>
@@ -797,10 +797,10 @@ Index: elfutils-0.164/tests/backtrace-dwarf.c
  #include <unistd.h>
  #include <sys/ptrace.h>
  #include <sys/types.h>
-Index: elfutils-0.164/tests/backtrace.c
+Index: elfutils-0.166/tests/backtrace.c
 ===================================================================
---- elfutils-0.164.orig/tests/backtrace.c
-+++ elfutils-0.164/tests/backtrace.c
+--- elfutils-0.166.orig/tests/backtrace.c
++++ elfutils-0.166/tests/backtrace.c
 @@ -24,7 +24,7 @@
  #include <dirent.h>
  #include <stdlib.h>
@@ -810,10 +810,10 @@ Index: elfutils-0.164/tests/backtrace.c
  #include <unistd.h>
  #include <dwarf.h>
  #ifdef __linux__
-Index: elfutils-0.164/tests/buildid.c
+Index: elfutils-0.166/tests/buildid.c
 ===================================================================
---- elfutils-0.164.orig/tests/buildid.c
-+++ elfutils-0.164/tests/buildid.c
+--- elfutils-0.166.orig/tests/buildid.c
++++ elfutils-0.166/tests/buildid.c
 @@ -23,7 +23,7 @@
  #include ELFUTILS_HEADER(elf)
  #include ELFUTILS_HEADER(dwelf)
@@ -823,10 +823,10 @@ Index: elfutils-0.164/tests/buildid.c
  #include <string.h>
  #include <stdlib.h>
  #include <sys/types.h>
-Index: elfutils-0.164/tests/debugaltlink.c
+Index: elfutils-0.166/tests/debugaltlink.c
 ===================================================================
---- elfutils-0.164.orig/tests/debugaltlink.c
-+++ elfutils-0.164/tests/debugaltlink.c
+--- elfutils-0.166.orig/tests/debugaltlink.c
++++ elfutils-0.166/tests/debugaltlink.c
 @@ -23,7 +23,7 @@
  #include ELFUTILS_HEADER(dw)
  #include ELFUTILS_HEADER(dwelf)
@@ -836,10 +836,10 @@ Index: elfutils-0.164/tests/debugaltlink.c
  #include <string.h>
  #include <stdlib.h>
  #include <sys/types.h>
-Index: elfutils-0.164/tests/debuglink.c
+Index: elfutils-0.166/tests/debuglink.c
 ===================================================================
---- elfutils-0.164.orig/tests/debuglink.c
-+++ elfutils-0.164/tests/debuglink.c
+--- elfutils-0.166.orig/tests/debuglink.c
++++ elfutils-0.166/tests/debuglink.c
 @@ -21,7 +21,7 @@
  #include <errno.h>
  #include ELFUTILS_HEADER(dwelf)
@@ -849,10 +849,10 @@ Index: elfutils-0.164/tests/debuglink.c
  #include <string.h>
  #include <stdlib.h>
  #include <sys/types.h>
-Index: elfutils-0.164/tests/deleted.c
+Index: elfutils-0.166/tests/deleted.c
 ===================================================================
---- elfutils-0.164.orig/tests/deleted.c
-+++ elfutils-0.164/tests/deleted.c
+--- elfutils-0.166.orig/tests/deleted.c
++++ elfutils-0.166/tests/deleted.c
 @@ -21,7 +21,7 @@
  #include <unistd.h>
  #include <assert.h>
@@ -862,10 +862,10 @@ Index: elfutils-0.164/tests/deleted.c
  #include <errno.h>
  #ifdef __linux__
  #include <sys/prctl.h>
-Index: elfutils-0.164/tests/dwfl-addr-sect.c
+Index: elfutils-0.166/tests/dwfl-addr-sect.c
 ===================================================================
---- elfutils-0.164.orig/tests/dwfl-addr-sect.c
-+++ elfutils-0.164/tests/dwfl-addr-sect.c
+--- elfutils-0.166.orig/tests/dwfl-addr-sect.c
++++ elfutils-0.166/tests/dwfl-addr-sect.c
 @@ -23,7 +23,7 @@
  #include <stdio_ext.h>
  #include <stdlib.h>
@@ -875,10 +875,10 @@ Index: elfutils-0.164/tests/dwfl-addr-sect.c
  #include <locale.h>
  #include <argp.h>
  #include ELFUTILS_HEADER(dwfl)
-Index: elfutils-0.164/tests/dwfl-bug-addr-overflow.c
+Index: elfutils-0.166/tests/dwfl-bug-addr-overflow.c
 ===================================================================
---- elfutils-0.164.orig/tests/dwfl-bug-addr-overflow.c
-+++ elfutils-0.164/tests/dwfl-bug-addr-overflow.c
+--- elfutils-0.166.orig/tests/dwfl-bug-addr-overflow.c
++++ elfutils-0.166/tests/dwfl-bug-addr-overflow.c
 @@ -20,7 +20,7 @@
  #include <inttypes.h>
  #include <stdio.h>
@@ -888,10 +888,10 @@ Index: elfutils-0.164/tests/dwfl-bug-addr-overflow.c
  #include <locale.h>
  #include ELFUTILS_HEADER(dwfl)
  
-Index: elfutils-0.164/tests/dwfl-bug-fd-leak.c
+Index: elfutils-0.166/tests/dwfl-bug-fd-leak.c
 ===================================================================
---- elfutils-0.164.orig/tests/dwfl-bug-fd-leak.c
-+++ elfutils-0.164/tests/dwfl-bug-fd-leak.c
+--- elfutils-0.166.orig/tests/dwfl-bug-fd-leak.c
++++ elfutils-0.166/tests/dwfl-bug-fd-leak.c
 @@ -24,7 +24,7 @@
  #include <dirent.h>
  #include <stdlib.h>
@@ -900,11 +900,11 @@ Index: elfutils-0.164/tests/dwfl-bug-fd-leak.c
 +#include <err.h>
  #include <unistd.h>
  #include <dwarf.h>
- #include <sys/resource.h>
-Index: elfutils-0.164/tests/dwfl-bug-getmodules.c
+ 
+Index: elfutils-0.166/tests/dwfl-bug-getmodules.c
 ===================================================================
---- elfutils-0.164.orig/tests/dwfl-bug-getmodules.c
-+++ elfutils-0.164/tests/dwfl-bug-getmodules.c
+--- elfutils-0.166.orig/tests/dwfl-bug-getmodules.c
++++ elfutils-0.166/tests/dwfl-bug-getmodules.c
 @@ -18,7 +18,7 @@
  #include <config.h>
  #include ELFUTILS_HEADER(dwfl)
@@ -914,10 +914,10 @@ Index: elfutils-0.164/tests/dwfl-bug-getmodules.c
  
  static const Dwfl_Callbacks callbacks =
    {
-Index: elfutils-0.164/tests/dwfl-report-elf-align.c
+Index: elfutils-0.166/tests/dwfl-report-elf-align.c
 ===================================================================
---- elfutils-0.164.orig/tests/dwfl-report-elf-align.c
-+++ elfutils-0.164/tests/dwfl-report-elf-align.c
+--- elfutils-0.166.orig/tests/dwfl-report-elf-align.c
++++ elfutils-0.166/tests/dwfl-report-elf-align.c
 @@ -20,7 +20,7 @@
  #include <inttypes.h>
  #include <stdio.h>
@@ -927,10 +927,10 @@ Index: elfutils-0.164/tests/dwfl-report-elf-align.c
  #include <locale.h>
  #include <string.h>
  #include <stdlib.h>
-Index: elfutils-0.164/tests/dwfllines.c
+Index: elfutils-0.166/tests/dwfllines.c
 ===================================================================
---- elfutils-0.164.orig/tests/dwfllines.c
-+++ elfutils-0.164/tests/dwfllines.c
+--- elfutils-0.166.orig/tests/dwfllines.c
++++ elfutils-0.166/tests/dwfllines.c
 @@ -27,7 +27,7 @@
  #include <stdio.h>
  #include <stdlib.h>
@@ -940,10 +940,10 @@ Index: elfutils-0.164/tests/dwfllines.c
  
  int
  main (int argc, char *argv[])
-Index: elfutils-0.164/tests/dwflmodtest.c
+Index: elfutils-0.166/tests/dwflmodtest.c
 ===================================================================
---- elfutils-0.164.orig/tests/dwflmodtest.c
-+++ elfutils-0.164/tests/dwflmodtest.c
+--- elfutils-0.166.orig/tests/dwflmodtest.c
++++ elfutils-0.166/tests/dwflmodtest.c
 @@ -23,7 +23,7 @@
  #include <stdio_ext.h>
  #include <stdlib.h>
@@ -953,10 +953,10 @@ Index: elfutils-0.164/tests/dwflmodtest.c
  #include <locale.h>
  #include <argp.h>
  #include ELFUTILS_HEADER(dwfl)
-Index: elfutils-0.164/tests/dwflsyms.c
+Index: elfutils-0.166/tests/dwflsyms.c
 ===================================================================
---- elfutils-0.164.orig/tests/dwflsyms.c
-+++ elfutils-0.164/tests/dwflsyms.c
+--- elfutils-0.166.orig/tests/dwflsyms.c
++++ elfutils-0.166/tests/dwflsyms.c
 @@ -25,7 +25,7 @@
  #include <stdio.h>
  #include <stdio_ext.h>
@@ -966,10 +966,10 @@ Index: elfutils-0.164/tests/dwflsyms.c
  #include <string.h>
  
  static const char *
-Index: elfutils-0.164/tests/early-offscn.c
+Index: elfutils-0.166/tests/early-offscn.c
 ===================================================================
---- elfutils-0.164.orig/tests/early-offscn.c
-+++ elfutils-0.164/tests/early-offscn.c
+--- elfutils-0.166.orig/tests/early-offscn.c
++++ elfutils-0.166/tests/early-offscn.c
 @@ -19,7 +19,7 @@
  #endif
  
@@ -979,10 +979,10 @@ Index: elfutils-0.164/tests/early-offscn.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <stdio.h>
-Index: elfutils-0.164/tests/ecp.c
+Index: elfutils-0.166/tests/ecp.c
 ===================================================================
---- elfutils-0.164.orig/tests/ecp.c
-+++ elfutils-0.164/tests/ecp.c
+--- elfutils-0.166.orig/tests/ecp.c
++++ elfutils-0.166/tests/ecp.c
 @@ -20,7 +20,7 @@
  #endif
  
@@ -992,10 +992,10 @@ Index: elfutils-0.164/tests/ecp.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <stdlib.h>
-Index: elfutils-0.164/tests/find-prologues.c
+Index: elfutils-0.166/tests/find-prologues.c
 ===================================================================
---- elfutils-0.164.orig/tests/find-prologues.c
-+++ elfutils-0.164/tests/find-prologues.c
+--- elfutils-0.166.orig/tests/find-prologues.c
++++ elfutils-0.166/tests/find-prologues.c
 @@ -25,7 +25,7 @@
  #include <stdio_ext.h>
  #include <locale.h>
@@ -1005,10 +1005,10 @@ Index: elfutils-0.164/tests/find-prologues.c
  #include <string.h>
  #include <fnmatch.h>
  
-Index: elfutils-0.164/tests/funcretval.c
+Index: elfutils-0.166/tests/funcretval.c
 ===================================================================
---- elfutils-0.164.orig/tests/funcretval.c
-+++ elfutils-0.164/tests/funcretval.c
+--- elfutils-0.166.orig/tests/funcretval.c
++++ elfutils-0.166/tests/funcretval.c
 @@ -25,7 +25,7 @@
  #include <stdio_ext.h>
  #include <locale.h>
@@ -1018,10 +1018,10 @@ Index: elfutils-0.164/tests/funcretval.c
  #include <string.h>
  #include <fnmatch.h>
  
-Index: elfutils-0.164/tests/funcscopes.c
+Index: elfutils-0.166/tests/funcscopes.c
 ===================================================================
---- elfutils-0.164.orig/tests/funcscopes.c
-+++ elfutils-0.164/tests/funcscopes.c
+--- elfutils-0.166.orig/tests/funcscopes.c
++++ elfutils-0.166/tests/funcscopes.c
 @@ -25,7 +25,7 @@
  #include <stdio_ext.h>
  #include <locale.h>
@@ -1031,10 +1031,10 @@ Index: elfutils-0.164/tests/funcscopes.c
  #include <string.h>
  #include <fnmatch.h>
  
-Index: elfutils-0.164/tests/getsrc_die.c
+Index: elfutils-0.166/tests/getsrc_die.c
 ===================================================================
---- elfutils-0.164.orig/tests/getsrc_die.c
-+++ elfutils-0.164/tests/getsrc_die.c
+--- elfutils-0.166.orig/tests/getsrc_die.c
++++ elfutils-0.166/tests/getsrc_die.c
 @@ -19,7 +19,7 @@
  #endif
  
@@ -1044,10 +1044,10 @@ Index: elfutils-0.164/tests/getsrc_die.c
  #include <fcntl.h>
  #include <inttypes.h>
  #include <libelf.h>
-Index: elfutils-0.164/tests/line2addr.c
+Index: elfutils-0.166/tests/line2addr.c
 ===================================================================
---- elfutils-0.164.orig/tests/line2addr.c
-+++ elfutils-0.164/tests/line2addr.c
+--- elfutils-0.166.orig/tests/line2addr.c
++++ elfutils-0.166/tests/line2addr.c
 @@ -26,7 +26,7 @@
  #include <locale.h>
  #include <stdlib.h>
@@ -1057,10 +1057,10 @@ Index: elfutils-0.164/tests/line2addr.c
  
  
  static void
-Index: elfutils-0.164/tests/low_high_pc.c
+Index: elfutils-0.166/tests/low_high_pc.c
 ===================================================================
---- elfutils-0.164.orig/tests/low_high_pc.c
-+++ elfutils-0.164/tests/low_high_pc.c
+--- elfutils-0.166.orig/tests/low_high_pc.c
++++ elfutils-0.166/tests/low_high_pc.c
 @@ -25,7 +25,7 @@
  #include <stdio_ext.h>
  #include <locale.h>
@@ -1070,10 +1070,10 @@ Index: elfutils-0.164/tests/low_high_pc.c
  #include <string.h>
  #include <fnmatch.h>
  
-Index: elfutils-0.164/tests/md5-sha1-test.c
+Index: elfutils-0.166/tests/md5-sha1-test.c
 ===================================================================
---- elfutils-0.164.orig/tests/md5-sha1-test.c
-+++ elfutils-0.164/tests/md5-sha1-test.c
+--- elfutils-0.166.orig/tests/md5-sha1-test.c
++++ elfutils-0.166/tests/md5-sha1-test.c
 @@ -19,7 +19,7 @@
  #endif
  
@@ -1083,10 +1083,10 @@ Index: elfutils-0.164/tests/md5-sha1-test.c
  
  #include "md5.h"
  #include "sha1.h"
-Index: elfutils-0.164/tests/rdwrmmap.c
+Index: elfutils-0.166/tests/rdwrmmap.c
 ===================================================================
---- elfutils-0.164.orig/tests/rdwrmmap.c
-+++ elfutils-0.164/tests/rdwrmmap.c
+--- elfutils-0.166.orig/tests/rdwrmmap.c
++++ elfutils-0.166/tests/rdwrmmap.c
 @@ -19,7 +19,7 @@
  #endif
  
@@ -1096,10 +1096,10 @@ Index: elfutils-0.164/tests/rdwrmmap.c
  #include <stdio.h>
  #include <fcntl.h>
  #include <unistd.h>
-Index: elfutils-0.164/tests/saridx.c
+Index: elfutils-0.166/tests/saridx.c
 ===================================================================
---- elfutils-0.164.orig/tests/saridx.c
-+++ elfutils-0.164/tests/saridx.c
+--- elfutils-0.166.orig/tests/saridx.c
++++ elfutils-0.166/tests/saridx.c
 @@ -17,7 +17,7 @@
  
  #include <config.h>
@@ -1109,10 +1109,10 @@ Index: elfutils-0.164/tests/saridx.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <stdio.h>
-Index: elfutils-0.164/tests/sectiondump.c
+Index: elfutils-0.166/tests/sectiondump.c
 ===================================================================
---- elfutils-0.164.orig/tests/sectiondump.c
-+++ elfutils-0.164/tests/sectiondump.c
+--- elfutils-0.166.orig/tests/sectiondump.c
++++ elfutils-0.166/tests/sectiondump.c
 @@ -18,7 +18,7 @@
  #include <config.h>
  
@@ -1122,10 +1122,10 @@ Index: elfutils-0.164/tests/sectiondump.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <inttypes.h>
-Index: elfutils-0.164/tests/varlocs.c
+Index: elfutils-0.166/tests/varlocs.c
 ===================================================================
---- elfutils-0.164.orig/tests/varlocs.c
-+++ elfutils-0.164/tests/varlocs.c
+--- elfutils-0.166.orig/tests/varlocs.c
++++ elfutils-0.166/tests/varlocs.c
 @@ -25,7 +25,7 @@
  #include <dwarf.h>
  #include <stdio.h>
@@ -1135,10 +1135,10 @@ Index: elfutils-0.164/tests/varlocs.c
  #include <string.h>
  #include <sys/types.h>
  #include <sys/stat.h>
-Index: elfutils-0.164/tests/vdsosyms.c
+Index: elfutils-0.166/tests/vdsosyms.c
 ===================================================================
---- elfutils-0.164.orig/tests/vdsosyms.c
-+++ elfutils-0.164/tests/vdsosyms.c
+--- elfutils-0.166.orig/tests/vdsosyms.c
++++ elfutils-0.166/tests/vdsosyms.c
 @@ -18,7 +18,7 @@
  #include <config.h>
  #include <assert.h>
@@ -1148,10 +1148,10 @@ Index: elfutils-0.164/tests/vdsosyms.c
  #include <inttypes.h>
  #include <stdio.h>
  #include <string.h>
-Index: elfutils-0.164/libelf/elf_getarsym.c
+Index: elfutils-0.166/libelf/elf_getarsym.c
 ===================================================================
---- elfutils-0.164.orig/libelf/elf_getarsym.c
-+++ elfutils-0.164/libelf/elf_getarsym.c
+--- elfutils-0.166.orig/libelf/elf_getarsym.c
++++ elfutils-0.166/libelf/elf_getarsym.c
 @@ -302,7 +302,7 @@ elf_getarsym (Elf *elf, size_t *ptr)
  		arsym[cnt].as_off = (*u32)[cnt];
  
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.164/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.166/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/0001-fix-a-stack-usage-warning.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/0001-fix-a-stack-usage-warning.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.164/0001-fix-a-stack-usage-warning.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.166/0001-fix-a-stack-usage-warning.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/0001-remove-the-unneed-checking.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/0001-remove-the-unneed-checking.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.164/0001-remove-the-unneed-checking.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.166/0001-remove-the-unneed-checking.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.164/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.166/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/0003-Add-mips-n64-relocation-format-hack.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/0003-Add-mips-n64-relocation-format-hack.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.164/0003-Add-mips-n64-relocation-format-hack.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.166/0003-Add-mips-n64-relocation-format-hack.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/aarch64_uio.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/aarch64_uio.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.164/aarch64_uio.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.166/aarch64_uio.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/arm_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.166/arm_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.164/arm_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.166/arm_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/elfcmp-fix-self-comparision.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/elfcmp-fix-self-comparision.patch
new file mode 100644
index 0000000..6c150bb
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.166/elfcmp-fix-self-comparision.patch
@@ -0,0 +1,41 @@
+From 836a16fe5b5bab4a3afe2c991c104652775ce3a3 Mon Sep 17 00:00:00 2001
+From: David Abdurachmanov <davidlt@cern.ch>
+Date: Mon, 11 Apr 2016 16:00:57 +0200
+Subject: elfcmp: fix self-comparison error with GCC 6
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Noticed with Fedora 24 Alpha, gcc (GCC) 6.0.0 20160406
+(Red Hat 6.0.0-0.20).
+
+elfcmp.c: In function ‘main’:
+elfcmp.c:364:199: error: self-comparison always evaluates
+to false [-Werror=tautological-compare]
+        if (unlikely (name1 == NULL || name2 == NULL
+
+Signed-off-by: David Abdurachmanov <davidlt@cern.ch>
+---
+
+Upstream-Status: Backport
+
+ src/ChangeLog | 4 ++++
+ src/elfcmp.c  | 2 +-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/elfcmp.c b/src/elfcmp.c
+index 852b92f..7b5d39c 100644
+--- a/src/elfcmp.c
++++ b/src/elfcmp.c
+@@ -368,7 +368,7 @@ main (int argc, char *argv[])
+ 				&& sym1->st_shndx != SHN_UNDEF)
+ 			    || sym1->st_info != sym2->st_info
+ 			    || sym1->st_other != sym2->st_other
+-			    || sym1->st_shndx != sym1->st_shndx))
++			    || sym1->st_shndx != sym2->st_shndx))
+ 		{
+ 		  // XXX Do we want to allow reordered symbol tables?
+ 		symtab_mismatch:
+-- 
+cgit v0.12
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/fixheadercheck.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/fixheadercheck.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.164/fixheadercheck.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.166/fixheadercheck.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/hppa_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.166/hppa_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.164/hppa_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.166/hppa_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/kfreebsd_path.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/kfreebsd_path.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.164/kfreebsd_path.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.166/kfreebsd_path.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/m68k_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.166/m68k_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.164/m68k_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.166/m68k_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/mips_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.166/mips_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.164/mips_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.166/mips_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/mips_readelf_w.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/mips_readelf_w.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.164/mips_readelf_w.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.166/mips_readelf_w.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/shadow.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/shadow.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.164/shadow.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.166/shadow.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/testsuite-ignore-elflint.diff b/meta/recipes-devtools/elfutils/elfutils-0.166/testsuite-ignore-elflint.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.164/testsuite-ignore-elflint.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.166/testsuite-ignore-elflint.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.164/uclibc-support.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/uclibc-support.patch
similarity index 82%
rename from meta/recipes-devtools/elfutils/elfutils-0.164/uclibc-support.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.166/uclibc-support.patch
index 966b70f..6299998 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.164/uclibc-support.patch
+++ b/meta/recipes-devtools/elfutils/elfutils-0.166/uclibc-support.patch
@@ -25,11 +25,11 @@ Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
  libelf/Makefile.am | 5 +++++
  4 files changed, 23 insertions(+), 1 deletion(-)
 
-Index: elfutils-0.164/configure.ac
+Index: elfutils-0.166/configure.ac
 ===================================================================
---- elfutils-0.164.orig/configure.ac
-+++ elfutils-0.164/configure.ac
-@@ -66,6 +66,14 @@ AS_IF([test "$use_locks" = yes],
+--- elfutils-0.166.orig/configure.ac
++++ elfutils-0.166/configure.ac
+@@ -79,6 +79,14 @@ AS_IF([test "$use_locks" = yes],
  
  AH_TEMPLATE([USE_LOCKS], [Defined if libraries should be thread-safe.])
  
@@ -44,7 +44,7 @@ Index: elfutils-0.164/configure.ac
  AC_PROG_CC
  AC_PROG_RANLIB
  AC_PROG_YACC
-@@ -291,18 +299,13 @@ AC_LINK_IFELSE(
+@@ -347,18 +355,13 @@ AC_LINK_IFELSE(
  )
  
  dnl If our libc doesn't provide argp, then test for libargp
@@ -70,10 +70,10 @@ Index: elfutils-0.164/configure.ac
  AC_SUBST([argp_LDADD])
  
  dnl The directories with content.
-Index: elfutils-0.164/libcpu/Makefile.am
+Index: elfutils-0.166/libcpu/Makefile.am
 ===================================================================
---- elfutils-0.164.orig/libcpu/Makefile.am
-+++ elfutils-0.164/libcpu/Makefile.am
+--- elfutils-0.166.orig/libcpu/Makefile.am
++++ elfutils-0.166/libcpu/Makefile.am
 @@ -80,6 +80,10 @@ i386_parse_CFLAGS = -DNMNES="`wc -l < i3
  i386_lex.o: i386_parse.h
  i386_gendis_LDADD = $(libeu) -lm
@@ -85,10 +85,10 @@ Index: elfutils-0.164/libcpu/Makefile.am
  i386_parse.h: i386_parse.c ;
  
  EXTRA_DIST = defs/i386
-Index: elfutils-0.164/libdw/Makefile.am
+Index: elfutils-0.166/libdw/Makefile.am
 ===================================================================
---- elfutils-0.164.orig/libdw/Makefile.am
-+++ elfutils-0.164/libdw/Makefile.am
+--- elfutils-0.166.orig/libdw/Makefile.am
++++ elfutils-0.166/libdw/Makefile.am
 @@ -102,6 +102,11 @@ endif
  libdw_pic_a_SOURCES =
  am_libdw_pic_a_OBJECTS = $(libdw_a_SOURCES:.c=.os)
@@ -105,21 +105,20 @@ Index: elfutils-0.164/libdw/Makefile.am
  		-Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
  		-Wl,--version-script,$<,--no-undefined \
  		-Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
--		-ldl $(argp_LDADD) $(zip_LIBS)
-+		-ldl $(argp_LDADD) $(zip_LIBS) $(libdw_so_LDLIBS)
+-		-ldl -lz $(argp_LDADD) $(zip_LIBS)
++		-ldl -lz $(argp_LDADD) $(zip_LIBS) $(libdw_so_LDLIBS)
  	@$(textrel_check)
  	$(AM_V_at)ln -fs $@ $@.$(VERSION)
  
-Index: elfutils-0.164/libelf/Makefile.am
+Index: elfutils-0.166/libelf/Makefile.am
 ===================================================================
---- elfutils-0.164.orig/libelf/Makefile.am
-+++ elfutils-0.164/libelf/Makefile.am
-@@ -93,7 +93,12 @@ libelf_a_SOURCES = elf_version.c elf_has
- libelf_pic_a_SOURCES =
+--- elfutils-0.166.orig/libelf/Makefile.am
++++ elfutils-0.166/libelf/Makefile.am
+@@ -96,6 +96,11 @@ libelf_pic_a_SOURCES =
  am_libelf_pic_a_OBJECTS = $(libelf_a_SOURCES:.c=.os)
  
+ libelf_so_LDLIBS = -lz
 +
- libelf_so_LDLIBS =
 +if USE_UCLIBC
 +libelf_so_LDLIBS += -lintl
 +endif
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.164.bb b/meta/recipes-devtools/elfutils/elfutils_0.166.bb
similarity index 94%
rename from meta/recipes-devtools/elfutils/elfutils_0.164.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.166.bb
index 4964c05..5c436d3 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.164.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.166.bb
@@ -7,9 +7,8 @@ DEPENDS = "libtool bzip2 zlib virtual/libintl"
 DEPENDS_append_libc-musl = " argp-standalone fts "
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/${PV}/${BP}.tar.bz2"
-
-SRC_URI[md5sum] = "2e4536c1c48034f188a80789a59114d8"
-SRC_URI[sha256sum] = "9683c025928a12d06b7fe812928aa6235249e22d197d086f7084606a48165900"
+SRC_URI[md5sum] = "d4e462b7891915dc5326bccefa2024ff"
+SRC_URI[sha256sum] = "3c056914c8a438b210be0d790463b960fc79d234c3f05ce707cbff80e94cba30"
 
 SRC_URI += "\
         file://dso-link-change.patch \
@@ -36,6 +35,7 @@ SRC_URI += "\
         file://0002-Add-support-for-mips64-abis-in-mips_retval.c.patch \
         file://0003-Add-mips-n64-relocation-format-hack.patch \
         file://uclibc-support.patch \
+        file://elfcmp-fix-self-comparision.patch \
 "
 SRC_URI_append_libc-musl = " file://0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch "
 
-- 
2.8.2


